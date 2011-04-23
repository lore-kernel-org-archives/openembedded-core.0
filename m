Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QDWNH-00058d-Ap
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Apr 2011 08:31:23 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 22 Apr 2011 23:28:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,257,1301900400"; d="scan'208";a="682838219"
Received: from unknown (HELO localhost) ([10.255.12.237])
	by fmsmga002.fm.intel.com with ESMTP; 22 Apr 2011 23:28:57 -0700
Message-Id: <5f17c96c196db21e7590ef3ed530e1a6a22acb06.1303539961.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303539961.git.sgw@linux.intel.com>
References: <cover.1303539961.git.sgw@linux.intel.com>
Old-Date: Thu, 14 Apr 2011 14:10:31 +0800
Date: Fri, 22 Apr 2011 23:28:57 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 23 Apr 2011 08:41:36 +0200
Cc: Koen Kooi <koen@dominion.thruhere.net>, Kang Kai <kai.kang@windriver.com>
Subject: [PATCH 06/37] jpeg: Upgrade to 8c (from 8b)
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
X-List-Received-Date: Sat, 23 Apr 2011 06:31:23 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../{jpeg-8b => jpeg-8c}/debian-libjpeg7_7-1.diff  |    4 ++++
 meta/recipes-core/jpeg/{jpeg_8b.bb => jpeg_8c.bb}  |    8 ++++----
 2 files changed, 8 insertions(+), 4 deletions(-)
 rename meta/recipes-core/jpeg/{jpeg-8b => jpeg-8c}/debian-libjpeg7_7-1.diff (98%)
 rename meta/recipes-core/jpeg/{jpeg_8b.bb => jpeg_8c.bb} (85%)

diff --git a/meta/recipes-core/jpeg/jpeg-8b/debian-libjpeg7_7-1.diff b/meta/recipes-core/jpeg/jpeg-8c/debian-libjpeg7_7-1.diff
similarity index 98%
rename from meta/recipes-core/jpeg/jpeg-8b/debian-libjpeg7_7-1.diff
rename to meta/recipes-core/jpeg/jpeg-8c/debian-libjpeg7_7-1.diff
index 2e4867a..3b8fa69 100755
--- a/meta/recipes-core/jpeg/jpeg-8b/debian-libjpeg7_7-1.diff
+++ b/meta/recipes-core/jpeg/jpeg-8c/debian-libjpeg7_7-1.diff
@@ -1,3 +1,7 @@
+This is a well-known debian patch used by many Linux distribution, but not
+accepted by upstream yet.
+Upstream-Status: Pending
+
 --- libjpeg7-7.orig/config.sub
 +++ libjpeg7-7/config.sub
 @@ -1,4 +1,10 @@
diff --git a/meta/recipes-core/jpeg/jpeg_8b.bb b/meta/recipes-core/jpeg/jpeg_8c.bb
similarity index 85%
rename from meta/recipes-core/jpeg/jpeg_8b.bb
rename to meta/recipes-core/jpeg/jpeg_8c.bb
index 93aa7be..ac00275 100644
--- a/meta/recipes-core/jpeg/jpeg_8b.bb
+++ b/meta/recipes-core/jpeg/jpeg_8c.bb
@@ -5,7 +5,7 @@ BUGTRACKER = ""
 
 LICENSE ="jpeg"
 LIC_FILES_CHKSUM = "file://cdjpeg.h;endline=12;md5=78fa8dbac547bb5b2a0e6457a6cfe21d \
-                    file://jpeglib.h;endline=14;md5=dd06b5575519f735ec2565ed36ce62e7 \
+                    file://jpeglib.h;endline=14;md5=22f1e0f8fc71f6f7563146d3b210dbe5 \
                     file://djpeg.c;endline=13;md5=ca89254925da06fef47e4b6468233432"
 
 SECTION = "libs"
@@ -17,10 +17,10 @@ DEPENDS_virtclass-native = "libtool-native"
 PR = "r1"
 
 SRC_URI = "http://www.ijg.org/files/jpegsrc.v${PV}.tar.gz \
-	   file://debian-libjpeg7_7-1.diff;patch=1"
+	   file://debian-libjpeg7_7-1.diff;"
 
-SRC_URI[md5sum] = "e022acbc5b36cd2cb70785f5b575661e"
-SRC_URI[sha256sum] = "36e6208edec591bae8f2fc370ea4f991447badb6377a125c211ffa7b503174a7"
+SRC_URI[md5sum] = "a2c10c04f396a9ce72894beb18b4e1f9"
+SRC_URI[sha256sum] = "edfc0b3e004b2fe58ffeeec89f96e3a3c28972c46725ec127d01edf8a1cc7c9a"
 
 inherit autotools 
 
-- 
1.7.1.1



