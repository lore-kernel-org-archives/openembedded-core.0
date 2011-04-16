Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QAzPr-00069I-JL
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Apr 2011 08:55:35 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 15 Apr 2011 23:53:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,223,1301900400"; d="scan'208";a="420319255"
Received: from unknown (HELO localhost) ([10.255.12.232])
	by azsmga001.ch.intel.com with ESMTP; 15 Apr 2011 23:53:14 -0700
Message-Id: <eda12ac0c29ab13b415ddefd6a4dbfac03617b48.1302936483.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302936483.git.sgw@linux.intel.com>
References: <cover.1302936483.git.sgw@linux.intel.com>
Old-Date: Tue, 12 Apr 2011 16:08:54 +0800
Date: Fri, 15 Apr 2011 23:53:12 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 16 Apr 2011 12:03:17 +0200
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Jingdong Lu <jingdong.lu@windriver.com>, Kang Kai <kai.kang@windriver.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>
Subject: [PATCH 01/58] gstreamer: upgrade to vesion 0.10.32
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 16 Apr 2011 06:55:35 -0000

From: Dongxiao Xu <dongxiao.xu@intel.com>

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../check_fix.patch                                |    2 ++
 .../gst-inspect-check-error.patch                  |    2 ++
 .../gstregistrybinary.c                            |    0
 .../gstregistrybinary.h                            |    0
 .../{gstreamer_0.10.31.bb => gstreamer_0.10.32.bb} |    4 ++--
 5 files changed, 6 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer-0.10.31 => gstreamer-0.10.32}/check_fix.patch (93%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer-0.10.31 => gstreamer-0.10.32}/gst-inspect-check-error.patch (96%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer-0.10.31 => gstreamer-0.10.32}/gstregistrybinary.c (100%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer-0.10.31 => gstreamer-0.10.32}/gstregistrybinary.h (100%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer_0.10.31.bb => gstreamer_0.10.32.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer-0.10.31/check_fix.patch b/meta/recipes-multimedia/gstreamer/gstreamer-0.10.32/check_fix.patch
similarity index 93%
rename from meta/recipes-multimedia/gstreamer/gstreamer-0.10.31/check_fix.patch
rename to meta/recipes-multimedia/gstreamer/gstreamer-0.10.32/check_fix.patch
index 72c3f64..5d8bb13 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer-0.10.31/check_fix.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer-0.10.32/check_fix.patch
@@ -1,6 +1,8 @@
 # gstreamer: Fix a problem with configure if check has already been built
 # Richard Purdie <rpurdie@linux.intel.com>
 
+Upstream-Status: Inappropriate [configuration]
+
 diff -urN gstreamer-0.10.29-orig/configure.ac gstreamer-0.10.29/configure.ac
 --- gstreamer-0.10.29-orig/configure.ac	2010-06-26 12:49:27.774930773 +0800
 +++ gstreamer-0.10.29/configure.ac	2010-06-26 12:51:12.899200233 +0800
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer-0.10.31/gst-inspect-check-error.patch b/meta/recipes-multimedia/gstreamer/gstreamer-0.10.32/gst-inspect-check-error.patch
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gstreamer-0.10.31/gst-inspect-check-error.patch
rename to meta/recipes-multimedia/gstreamer/gstreamer-0.10.32/gst-inspect-check-error.patch
index 4ca1dbe..30be85f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer-0.10.31/gst-inspect-check-error.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer-0.10.32/gst-inspect-check-error.patch
@@ -1,6 +1,8 @@
 # Fix crash with gst-inspect
 # Chris Lord <chris@openedhand.com>
 
+Upstream-Status: Pending
+
 --- gstreamer-0.10.9/tools/gst-inspect.c.old	2006-09-12 11:56:53.000000000 +0100
 +++ gstreamer-0.10.9/tools/gst-inspect.c	2006-09-12 11:57:27.000000000 +0100
 @@ -1123,7 +1123,7 @@
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer-0.10.31/gstregistrybinary.c b/meta/recipes-multimedia/gstreamer/gstreamer-0.10.32/gstregistrybinary.c
similarity index 100%
rename from meta/recipes-multimedia/gstreamer/gstreamer-0.10.31/gstregistrybinary.c
rename to meta/recipes-multimedia/gstreamer/gstreamer-0.10.32/gstregistrybinary.c
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer-0.10.31/gstregistrybinary.h b/meta/recipes-multimedia/gstreamer/gstreamer-0.10.32/gstregistrybinary.h
similarity index 100%
rename from meta/recipes-multimedia/gstreamer/gstreamer-0.10.31/gstregistrybinary.h
rename to meta/recipes-multimedia/gstreamer/gstreamer-0.10.32/gstregistrybinary.h
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer_0.10.31.bb b/meta/recipes-multimedia/gstreamer/gstreamer_0.10.32.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer_0.10.31.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer_0.10.32.bb
index dc1d07c..901ade5 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer_0.10.31.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer_0.10.32.bb
@@ -16,8 +16,8 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.bz
            file://check_fix.patch \
            file://gst-inspect-check-error.patch"
 
-SRC_URI[md5sum] = "a21fb08bdb578d972c7c14e77da8fbb6"
-SRC_URI[sha256sum] = "7f737e6d047c1ebeb4e1e0725fc377c5d9f12ee89186de7960be3cbba709ab84"
+SRC_URI[md5sum] = "442bc3d37b8511a73379143e7531d726"
+SRC_URI[sha256sum] = "3bf4e46a186ee9a1f5e212aaf651d67cffb4f5f05345a7c99ae71d5d992be133"
 
 inherit autotools pkgconfig gettext
 
-- 
1.7.1.1



