Return-Path: <tanu.kaskinen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 42E5B763E1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 04:52:44 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 30 Jul 2015 21:52:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,581,1432623600"; d="scan'208";a="739331890"
Received: from tkkaskin-mobl3.ger.corp.intel.com (HELO
	tkkaskin-mobl3.ger.corp.intel.com.ger.corp.intel.com)
	([10.252.9.176])
	by orsmga001.jf.intel.com with ESMTP; 30 Jul 2015 21:52:43 -0700
From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Jul 2015 07:52:41 +0300
Message-Id: <1438318361-18428-1-git-send-email-tanu.kaskinen@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH] libvorbis: 1.3.4 -> 1.3.5
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
X-List-Received-Date: Fri, 31 Jul 2015 04:52:45 -0000

The change in COPYING was just a year update in a copyright notice.

Signed-off-by: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
---
 .../libvorbis/libvorbis_1.3.4.bb                   | 25 ----------------------
 .../libvorbis/libvorbis_1.3.5.bb                   | 25 ++++++++++++++++++++++
 2 files changed, 25 insertions(+), 25 deletions(-)
 delete mode 100644 meta/recipes-multimedia/libvorbis/libvorbis_1.3.4.bb
 create mode 100644 meta/recipes-multimedia/libvorbis/libvorbis_1.3.5.bb

diff --git a/meta/recipes-multimedia/libvorbis/libvorbis_1.3.4.bb b/meta/recipes-multimedia/libvorbis/libvorbis_1.3.4.bb
deleted file mode 100644
index 0788c94..0000000
--- a/meta/recipes-multimedia/libvorbis/libvorbis_1.3.4.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY = "Ogg Vorbis Audio Codec"
-DESCRIPTION = "Ogg Vorbis is a high-quality lossy audio codec \
-that is free of intellectual property restrictions. libvorbis \
-is the main vorbis codec library."
-HOMEPAGE = "http://www.vorbis.com/"
-BUGTRACKER = "https://trac.xiph.org"
-SECTION = "libs"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ca77c6c3ea4d29cb68dce8ef5ab0d897 \
-                    file://include/vorbis/vorbisenc.h;beginline=1;endline=11;md5=d1c1d138863d6315131193d4046d81cb"
-DEPENDS = "libogg"
-
-SRC_URI = "http://downloads.xiph.org/releases/vorbis/${BP}.tar.xz"
-
-SRC_URI[md5sum] = "55f2288055e44754275a17c9a2497391"
-SRC_URI[sha256sum] = "2f05497d29195dc23ee952a24ee3973a74e6277569c4c2eca0ec5968e541f372"
-
-inherit autotools pkgconfig
-
-# vorbisfile.c reveals a problem in the gcc register spilling for the
-# thumb instruction set...
-FULL_OPTIMIZATION_thumb = "-O0"
-
-EXTRA_OECONF = "--with-ogg-libraries=${STAGING_LIBDIR} \
-                --with-ogg-includes=${STAGING_INCDIR}"
diff --git a/meta/recipes-multimedia/libvorbis/libvorbis_1.3.5.bb b/meta/recipes-multimedia/libvorbis/libvorbis_1.3.5.bb
new file mode 100644
index 0000000..c2765c3
--- /dev/null
+++ b/meta/recipes-multimedia/libvorbis/libvorbis_1.3.5.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Ogg Vorbis Audio Codec"
+DESCRIPTION = "Ogg Vorbis is a high-quality lossy audio codec \
+that is free of intellectual property restrictions. libvorbis \
+is the main vorbis codec library."
+HOMEPAGE = "http://www.vorbis.com/"
+BUGTRACKER = "https://trac.xiph.org"
+SECTION = "libs"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7d2c487d2fc7dd3e3c7c465a5b7f6217 \
+                    file://include/vorbis/vorbisenc.h;beginline=1;endline=11;md5=d1c1d138863d6315131193d4046d81cb"
+DEPENDS = "libogg"
+
+SRC_URI = "http://downloads.xiph.org/releases/vorbis/${BP}.tar.xz"
+
+SRC_URI[md5sum] = "28cb28097c07a735d6af56e598e1c90f"
+SRC_URI[sha256sum] = "54f94a9527ff0a88477be0a71c0bab09a4c3febe0ed878b24824906cd4b0e1d1"
+
+inherit autotools pkgconfig
+
+# vorbisfile.c reveals a problem in the gcc register spilling for the
+# thumb instruction set...
+FULL_OPTIMIZATION_thumb = "-O0"
+
+EXTRA_OECONF = "--with-ogg-libraries=${STAGING_LIBDIR} \
+                --with-ogg-includes=${STAGING_INCDIR}"
-- 
1.9.3


