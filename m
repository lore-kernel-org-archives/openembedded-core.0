Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rj4mi-0004Ld-5w
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 09:04:22 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Jan 2012 23:56:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="93004499"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.127])
	by azsmga001.ch.intel.com with ESMTP; 05 Jan 2012 23:56:46 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2012 23:56:36 -0800
Message-Id: <1c90f3e4162eb53a1d207c590eab11d817c69abc.1325836241.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325836241.git.sgw@linux.intel.com>
References: <cover.1325836241.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325836241.git.sgw@linux.intel.com>
References: <cover.1325836241.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 25/25] x11-common: remove extraneous BSP customizations
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
X-List-Received-Date: Fri, 06 Jan 2012 08:04:22 -0000

From: Andrea Adami <andrea.adami@gmail.com>

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
1.7.6.4



