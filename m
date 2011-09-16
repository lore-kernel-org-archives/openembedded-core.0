Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1R4Tjh-0004NB-BW
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 10:25:25 +0200
Received: by wwf10 with SMTP id 10so265127wwf.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 01:20:13 -0700 (PDT)
Received: by 10.227.11.7 with SMTP id r7mr2282118wbr.53.1316161213001;
	Fri, 16 Sep 2011 01:20:13 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id en9sm4247151wbb.24.2011.09.16.01.20.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Sep 2011 01:20:12 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Sep 2011 10:20:01 +0200
Message-Id: <1316161201-769-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <1316161201-769-1-git-send-email-koen@dominion.thruhere.net>
References: <1316161201-769-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [RFC 2/2] gst-meta-base: adjust plugin names after gstreamer packaging changes
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
X-List-Received-Date: Fri, 16 Sep 2011 08:25:25 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../gstreamer/gst-meta-base_0.10.bb                |   50 ++++++++++----------
 1 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb b/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
index 1788104..ed80ac1 100644
--- a/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 
-PR = "r10"
+PR = "r11"
 
 PACKAGES = "\
     gst-meta-base \
@@ -17,43 +17,43 @@ ALLOW_EMPTY = "1"
 
 RDEPENDS_gst-meta-base = "\
     gstreamer \
-    gst-plugins-base-playbin \
-    gst-plugins-base-decodebin \
-    gst-plugins-base-decodebin2 \
-    gst-plugins-base-gio \
-    gst-plugins-base-alsa \
-    gst-plugins-base-volume \
-    gst-plugins-base-ximagesink \
-    gst-plugins-base-audioconvert \
-    gst-plugins-base-audioresample \
-    gst-plugins-base-typefindfunctions \
-    gst-plugins-base-videoscale \
-    gst-plugins-base-ffmpegcolorspace \
-    gst-plugins-good-autodetect \
-    gst-plugins-good-souphttpsrc"
+    gst-plugin-playbin \
+    gst-plugin-decodebin \
+    gst-plugin-decodebin2 \
+    gst-plugin-gio \
+    gst-plugin-alsa \
+    gst-plugin-volume \
+    gst-plugin-ximagesink \
+    gst-plugin-audioconvert \
+    gst-plugin-audioresample \
+    gst-plugin-typefindfunctions \
+    gst-plugin-videoscale \
+    gst-plugin-ffmpegcolorspace \
+    gst-plugin-autodetect \
+    gst-plugin-souphttpsrc"
 
 
 RDEPENDS_gst-meta-audio = "\
     gst-meta-base \
-    gst-plugins-base-vorbis \
-    gst-plugins-base-ogg \
-    gst-plugins-good-wavparse \
-    gst-plugins-good-flac \
+    gst-plugin-vorbis \
+    gst-plugin-ogg \
+    gst-plugin-wavparse \
+    gst-plugin-flac \
     ${COMMERCIAL_AUDIO_PLUGINS}"
 
 
 RDEPENDS_gst-meta-debug = "\
     gst-meta-base \
-    gst-plugins-good-debug \
-    gst-plugins-base-audiotestsrc \
-    gst-plugins-base-videotestsrc"
+    gst-plugin-debug \
+    gst-plugin-audiotestsrc \
+    gst-plugin-videotestsrc"
 
 
 RDEPENDS_gst-meta-video = "\
     gst-meta-base \
-    gst-plugins-good-avi \
-    gst-plugins-good-matroska \
-    gst-plugins-base-theora \
+    gst-plugin-avi \
+    gst-plugin-matroska \
+    gst-plugin-theora \
     ${COMMERCIAL_VIDEO_PLUGINS}"
 
 RRECOMMENDS_gst-meta-video = "\
-- 
1.6.6.1



