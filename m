Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 0DA2177D7A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Apr 2017 14:28:33 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Apr 2017 07:28:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,384,1488873600"; d="scan'208";a="94884614"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 27 Apr 2017 07:28:34 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Apr 2017 17:28:09 +0300
Message-Id: <4b72481c10b50f33073cda1a46ca45c07d1bd477.1493302527.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1493302527.git.alexander.kanavin@linux.intel.com>
References: <cover.1493302527.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 10/13] opkg-utils: move to Python 3
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
X-List-Received-Date: Thu, 27 Apr 2017 14:28:33 -0000

The scripts were fixed to be compatible with py3 some time ago,
but the shebang continued to refer to python 2.x.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...0001-Switch-all-scripts-to-use-Python-3.x.patch | 112 +++++++++++++++++++++
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |   5 +-
 2 files changed, 115 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0001-Switch-all-scripts-to-use-Python-3.x.patch

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/0001-Switch-all-scripts-to-use-Python-3.x.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/0001-Switch-all-scripts-to-use-Python-3.x.patch
new file mode 100644
index 00000000000..c36ae2ffdac
--- /dev/null
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/0001-Switch-all-scripts-to-use-Python-3.x.patch
@@ -0,0 +1,112 @@
+From d42b23f4fb5d6bd58e92e995fe5befc76efbae0c Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 27 Apr 2017 15:47:58 +0300
+Subject: [PATCH] Switch all scripts to use Python 3.x
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ makePackage          | 2 +-
+ opkg-compare-indexes | 2 +-
+ opkg-graph-deps      | 2 +-
+ opkg-list-fields     | 2 +-
+ opkg-make-index      | 2 +-
+ opkg-show-deps       | 2 +-
+ opkg-unbuild         | 2 +-
+ opkg-update-index    | 2 +-
+ opkg.py              | 2 +-
+ 9 files changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/makePackage b/makePackage
+index 4bdfc56..02124dd 100755
+--- a/makePackage
++++ b/makePackage
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python
++#!/usr/bin/env python3
+ 
+ # The general algorithm this program follows goes like this:
+ #   Run tar to extract control from control.tar.gz from the package.
+diff --git a/opkg-compare-indexes b/opkg-compare-indexes
+index b60d20a..80c1263 100755
+--- a/opkg-compare-indexes
++++ b/opkg-compare-indexes
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ from __future__ import absolute_import
+ from __future__ import print_function
+ 
+diff --git a/opkg-graph-deps b/opkg-graph-deps
+index 6653fd5..f1e376a 100755
+--- a/opkg-graph-deps
++++ b/opkg-graph-deps
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ from __future__ import absolute_import
+ from __future__ import print_function
+ 
+diff --git a/opkg-list-fields b/opkg-list-fields
+index c14a90f..24f7955 100755
+--- a/opkg-list-fields
++++ b/opkg-list-fields
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ from __future__ import absolute_import
+ from __future__ import print_function
+ 
+diff --git a/opkg-make-index b/opkg-make-index
+index 3f757f6..2988f9f 100755
+--- a/opkg-make-index
++++ b/opkg-make-index
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ from __future__ import absolute_import
+ from __future__ import print_function
+ 
+diff --git a/opkg-show-deps b/opkg-show-deps
+index 153f21e..4e18b4f 100755
+--- a/opkg-show-deps
++++ b/opkg-show-deps
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ from __future__ import absolute_import
+ from __future__ import print_function
+ 
+diff --git a/opkg-unbuild b/opkg-unbuild
+index 4f36bec..57642c9 100755
+--- a/opkg-unbuild
++++ b/opkg-unbuild
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ from __future__ import absolute_import
+ from __future__ import print_function
+ 
+diff --git a/opkg-update-index b/opkg-update-index
+index 341c1c2..7bff8a1 100755
+--- a/opkg-update-index
++++ b/opkg-update-index
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ from __future__ import absolute_import
+ 
+ import sys, os
+diff --git a/opkg.py b/opkg.py
+index 2ecac8a..7e64de4 100644
+--- a/opkg.py
++++ b/opkg.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ #   Copyright (C) 2001 Alexander S. Guy <a7r@andern.org>
+ #                      Andern Research Labs
+ #
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
index 9deea0f5e57..2460a26324f 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
@@ -4,13 +4,14 @@ SECTION = "base"
 HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://opkg.py;beginline=1;endline=18;md5=15917491ad6bf7acc666ca5f7cc1e083"
+                    file://opkg.py;beginline=2;endline=18;md5=63ce9e6bcc445181cd9e4baf4b4ccc35"
 PROVIDES += "${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives', 'virtual/update-alternatives', '', d)}"
 
 SRCREV = "1a708fd73d10c2b7677dd4cc4e017746ebbb9166"
 PV = "0.3.4+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/opkg-utils \
+           file://0001-Switch-all-scripts-to-use-Python-3.x.patch \
 "
 SRC_URI_append_class-native = " file://tar_ignore_error.patch"
 
@@ -18,7 +19,7 @@ S = "${WORKDIR}/git"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-PYTHONRDEPS = "python python-shell python-io python-math python-crypt python-logging python-fcntl python-subprocess python-pickle python-compression python-textutils python-stringold"
+PYTHONRDEPS = "python3 python3-shell python3-io python3-math python3-crypt python3-logging python3-fcntl python3-subprocess python3-pickle python3-compression python3-textutils python3-stringold"
 PYTHONRDEPS_class-native = ""
 
 PACKAGECONFIG = "python update-alternatives"
-- 
2.11.0


