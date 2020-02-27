Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 593A061125
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 00:26:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 01R0QwDh003278
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 16:26:58 -0800 (PST)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 26 Feb 2020 16:26:45 -0800
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Feb 2020 16:26:45 -0800
Message-ID: <20200227002645.13733-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH 1/1] python3: change two shebangs to python3
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
X-List-Received-Date: Thu, 27 Feb 2020 00:26:57 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

cgi.py and rot_13.py have outdated shebangs.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../recipes-devtools/python/python3/shebang3.patch | 22 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.8.1.bb      |  2 ++
 2 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/shebang3.patch

diff --git a/meta/recipes-devtools/python/python3/shebang3.patch b/meta/recipes-devtools/python/python3/shebang3.patch
new file mode 100644
index 0000000..c4fde05
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/shebang3.patch
@@ -0,0 +1,22 @@
+python3: change two shebangs to python3
+
+Upstream-Status: Inappropriate [distribution]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+--- a/Lib/cgi.py
++++ b/Lib/cgi.py
+@@ -1,4 +1,4 @@
+-#! /usr/bin/env python
++#! /usr/bin/env python3
+ 
+ """Support module for CGI (Common Gateway Interface) scripts.
+ 
+--- a/Lib/encodings/rot_13.py
++++ b/Lib/encodings/rot_13.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ """ Python Character Mapping Codec for ROT13.
+ 
+ This codec de/encodes from str to str.
diff --git a/meta/recipes-devtools/python/python3_3.8.1.bb b/meta/recipes-devtools/python/python3_3.8.1.bb
index 7796852..c1983d8 100644
--- a/meta/recipes-devtools/python/python3_3.8.1.bb
+++ b/meta/recipes-devtools/python/python3_3.8.1.bb
@@ -32,7 +32,9 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-configure.ac-fix-LIBPL.patch \
            file://0001-python3-Do-not-hardcode-lib-for-distutils.patch \
            file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
+           file://shebang3.patch \
            "
+      
 
 SRC_URI_append_class-native = " \
            file://0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch \
-- 
2.7.4


