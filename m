Received: from smtp209.alice.it ([82.57.200.105])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Rix9H-0007SD-3c
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 00:55:07 +0100
Received: from mizar.localdomain (79.16.253.172) by smtp209.alice.it
	(8.6.023.02) id 4EF08A630189DD63; Fri, 6 Jan 2012 00:47:46 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri,  6 Jan 2012 00:42:09 +0100
Message-Id: <de6e7eb080c670b72c1e72a28f29bfd24dbf166e.1325806595.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1325806595.git.andrea.adami@gmail.com>
References: <cover.1325806595.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1325806595.git.andrea.adami@gmail.com>
References: <cover.1325806595.git.andrea.adami@gmail.com>
Subject: [PATCH 2/2] xorg-driver: add xf86-video-fbdev from meta-openembedded
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
X-List-Received-Date: Thu, 05 Jan 2012 23:55:07 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../xorg-driver/xf86-video-fbdev_0.4.2.bb          |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.2.bb

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.2.bb b/meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.2.bb
new file mode 100644
index 0000000..a3a4796
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.2.bb
@@ -0,0 +1,8 @@
+require xorg-driver-video.inc
+LIC_FILES_CHKSUM = "file://COPYING;md5=d8cbd99fff773f92e844948f74ef0df8"
+
+DESCRIPTION = "X.Org X server -- fbdev display driver"
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "53a533d9e0c2da50962282526bace074"
+SRC_URI[sha256sum] = "93b271b4b41d7e5ca108849a583b9523e96c51813d046282285355b7001f82d5"
-- 
1.7.3.4



