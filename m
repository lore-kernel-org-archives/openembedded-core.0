Received: from nat-lmt.mentorg.com ([139.181.28.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gilbert_coville@mentor.com>) id 1TawdK-0005OR-OB
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Nov 2012 23:49:36 +0100
Received: from ghc.alm.mentorg.com ([134.86.96.237])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id qAKMZTgE027238;
	Tue, 20 Nov 2012 16:35:29 -0600
From: Gilbert Coville <gilbert_coville@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Nov 2012 16:34:11 -0600
Message-Id: <1353450851-7252-1-git-send-email-gilbert_coville@mentor.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <CAJTo0LaB=Qhd5wmhhJCRHqL+Fb4=AxSCaPVDi7tqoV_Giwghqw@mail.gmail.com>
References: <CAJTo0LaB=Qhd5wmhhJCRHqL+Fb4=AxSCaPVDi7tqoV_Giwghqw@mail.gmail.com>
Subject: [PATCHv2] gst-plugins-base: add dep on libsm and libice
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
X-List-Received-Date: Tue, 20 Nov 2012 22:49:36 -0000

If libICE exists when this package configures, libICE and libSM are
added to the list of included libraries.  Adding libsm and libice to the
list of dependencies ensures they'll be present and makes the contents
of this package more deterministic.

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



