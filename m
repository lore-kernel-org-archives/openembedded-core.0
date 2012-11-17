Received: from nat-lmt.mentorg.com ([139.181.28.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gilbert_coville@mentor.com>) id 1TZbWZ-0004Wp-LN
	for openembedded-core@lists.openembedded.org;
	Sat, 17 Nov 2012 07:05:03 +0100
Received: from ghc.alm.mentorg.com ([134.86.96.237])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id qAH5p2gE023036;
	Fri, 16 Nov 2012 23:51:02 -0600
From: Gilbert Coville <gilbert_coville@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Nov 2012 23:49:54 -0600
Message-Id: <1353131394-31310-1-git-send-email-gilbert_coville@mentor.com>
X-Mailer: git-send-email 1.8.0
Subject: [PATCH] gst-plugins-base: add dep on libsm and libice
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 17 Nov 2012 06:05:04 -0000

Signed-off-by: Gilbert Coville <gilbert_coville@mentor.com>
---
 meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
index 88fa74d..2648864 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605 \
                     file://gst/ffmpegcolorspace/utils.c;beginline=1;endline=20;md5=9c83a200b8e597b26ca29df20fc6ecd0"
 
-DEPENDS += "${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxv', '', d)}"
+DEPENDS += "${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxv libsm libice', '', d)}"
 DEPENDS += "alsa-lib freetype liboil libogg libvorbis libtheora util-linux tremor"
 
 SRC_URI += "file://gst-plugins-base-tremor.patch \
@@ -15,7 +15,7 @@ SRC_URI += "file://gst-plugins-base-tremor.patch \
 SRC_URI[md5sum] = "776c73883e567f67b9c4a2847d8d041a"
 SRC_URI[sha256sum] = "2cd3b0fa8e9b595db8f514ef7c2bdbcd639a0d63d154c00f8c9b609321f49976"
 
-PR = "r5"
+PR = "r6"
 
 inherit gettext
 
-- 
1.8.0



