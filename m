Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LEZ-0001C4-2f
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:41:31 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Mar 2012 17:32:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="139657392"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by fmsmga002.fm.intel.com with ESMTP; 15 Mar 2012 17:32:38 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:14 +0800
Message-Id: <1e4c789e41243be5c4ae545facdc70d1888d4d3e.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 17/60] gst-plugins-base: upgrade to 0.10.36
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
X-List-Received-Date: Fri, 16 Mar 2012 00:41:32 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../gst-plugins-base-tremor.patch                  |   13 +++++++------
 ...base_0.10.35.bb => gst-plugins-base_0.10.36.bb} |    6 +++---
 2 files changed, 10 insertions(+), 9 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-plugins-base-0.10.35 => gst-plugins-base-0.10.36}/gst-plugins-base-tremor.patch (53%)
 rename meta/recipes-multimedia/gstreamer/{gst-plugins-base_0.10.35.bb => gst-plugins-base_0.10.36.bb} (85%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-base-0.10.35/gst-plugins-base-tremor.patch b/meta/recipes-multimedia/gstreamer/gst-plugins-base-0.10.36/gst-plugins-base-tremor.patch
similarity index 53%
rename from meta/recipes-multimedia/gstreamer/gst-plugins-base-0.10.35/gst-plugins-base-tremor.patch
rename to meta/recipes-multimedia/gstreamer/gst-plugins-base-0.10.36/gst-plugins-base-tremor.patch
index 224bf1a..99dbc9d 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-base-0.10.35/gst-plugins-base-tremor.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-base-0.10.36/gst-plugins-base-tremor.patch
@@ -4,14 +4,15 @@ libogg2, and gst-plugins-base has dependency on that.
 Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
+Signed-off-by: Shane Wang <shane.wang@intel.com>
 
-diff -ruN gst-plugins-base-0.10.30-orig/ext/vorbis/Makefile.am gst-plugins-base-0.10.30/ext/vorbis/Makefile.am
---- gst-plugins-base-0.10.30-orig/ext/vorbis/Makefile.am	2010-11-17 16:11:03.000000000 +0800
-+++ gst-plugins-base-0.10.30/ext/vorbis/Makefile.am	2010-11-17 16:12:41.000000000 +0800
-@@ -28,7 +28,7 @@
- libgstivorbisdec_la_SOURCES = gstivorbisdec.c \
+diff -r 70065fb4e085 ext/vorbis/Makefile.am
+--- a/ext/vorbis/Makefile.am	Tue Mar 13 16:36:56 2012 +0800
++++ b/ext/vorbis/Makefile.am	Tue Mar 13 16:38:53 2012 +0800
+@@ -30,7 +30,7 @@
  	gstvorbisdec.c gstvorbisdeclib.c gstvorbiscommon.c
- libgstivorbisdec_la_CFLAGS = $(GST_PLUGINS_BASE_CFLAGS) $(GST_CFLAGS) \
+ libgstivorbisdec_la_CFLAGS = \
+ 	$(GST_PLUGINS_BASE_CFLAGS) $(GST_CFLAGS) \
 -	-DTREMOR $(IVORBIS_CFLAGS)
 +	$(IVORBIS_CFLAGS)
  libgstivorbisdec_la_LIBADD = \
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.35.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
similarity index 85%
rename from meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.35.bb
rename to meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
index 93f8eb3..0f2bbed 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.35.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
@@ -11,10 +11,10 @@ DEPENDS += "alsa-lib freetype liboil libogg libvorbis libtheora avahi util-linux
 
 SRC_URI += " file://gst-plugins-base-tremor.patch"
 
-SRC_URI[md5sum] = "1d300983525f4f09030eb3ba47cb04b0"
-SRC_URI[sha256sum] = "cd24f01bb5258a1f400bc4f2c212bb7cee9ee23c9ffb80d537a24ef366d17103"
+SRC_URI[md5sum] = "776c73883e567f67b9c4a2847d8d041a"
+SRC_URI[sha256sum] = "2cd3b0fa8e9b595db8f514ef7c2bdbcd639a0d63d154c00f8c9b609321f49976"
 
-PR = "r1"
+PR = "r0"
 
 inherit gettext
 
-- 
1.7.6



