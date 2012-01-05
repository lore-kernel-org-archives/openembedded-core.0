Received: from smtp209.alice.it ([82.57.200.105])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Rix9F-0007SD-HY
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 00:55:05 +0100
Received: from mizar.localdomain (79.16.253.172) by smtp209.alice.it
	(8.6.023.02) id 4EF08A630189DD5C; Fri, 6 Jan 2012 00:47:44 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri,  6 Jan 2012 00:42:08 +0100
Message-Id: <70e261fc83be99734830dd00f5b1f8022086c55f.1325806595.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1325806595.git.andrea.adami@gmail.com>
References: <cover.1325806595.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1325806595.git.andrea.adami@gmail.com>
References: <cover.1325806595.git.andrea.adami@gmail.com>
Subject: [PATCH 1/2] x11-common: remove extraneous BSP customizations
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
X-List-Received-Date: Thu, 05 Jan 2012 23:55:05 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../x11-common/x11-common/etc/X11/Xserver          |   24 --------------------
 1 files changed, 0 insertions(+), 24 deletions(-)

diff --git a/meta/recipes-graphics/x11-common/x11-common/etc/X11/Xserver b/meta/recipes-graphics/x11-common/x11-common/etc/X11/Xserver
index 57923e6..cea733e 100644
--- a/meta/recipes-graphics/x11-common/x11-common/etc/X11/Xserver
+++ b/meta/recipes-graphics/x11-common/x11-common/etc/X11/Xserver
@@ -18,14 +18,6 @@ fi
 
 . /etc/profile
 
-module_id() {
-    ## used to read from assets, but sometimes assets is corrupted
-    # grep "Module ID" /proc/hal/assets | sed "s/.*://"
-    ## used to read from /proc/hal/model, but that is removed in 2.6
-    # echo ' iPAQ' `cat /proc/hal/model`
-    awk 'BEGIN { FS=": " } /Hardware/ { print $2 } ' </proc/cpuinfo
-}
-
 ARGS=" -br -pn"
 
 if [ "$XSERVER" != "/usr/bin/Xorg" ]; then
@@ -44,22 +36,6 @@ if [ "$XSERVER" != "/usr/bin/Xorg" ]; then
           ARGS="$ARGS -mouse tslib"
         fi
 
-        # start off server in conventional location.
-        case `module_id` in
-                "Generic OMAP1510/1610/1710")
-                        ARGS="$ARGS -mouse /dev/input/event0" ;;
-                "Compulab CM-x270")
-                        #modprobe mbxfb
-                        #ARGS="$ARGS -fb /dev/fb1"
-                        ;;
-                "Nokia N800")
-                        ARGS="$ARGS -mouse tslib" ;;
-                "Nokia 770")
-                        ARGS="$ARGS -mouse tslib" ;;
-                *)
-                        ;;
-        esac
-
         ARGS="$ARGS -screen ${DISPLAY_WIDTH_PIXELS}x${DISPLAY_HEIGHT_PIXELS}@${DISPLAY_ORIENTATION}x${DISPLAY_BPP}"
 
         if [ ! -z "$DISPLAY_DPI" ]; then
-- 
1.7.3.4



