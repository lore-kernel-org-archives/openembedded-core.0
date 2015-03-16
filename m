Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id C500F73689
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 14:27:13 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 16 Mar 2015 07:21:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,409,1422950400"; d="scan'208";a="692802116"
Received: from sgconnee-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.8.217])
	by fmsmga002.fm.intel.com with ESMTP; 16 Mar 2015 07:27:14 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Mar 2015 14:27:08 +0000
Message-Id: <c2ed3db6d2d1bdbfbd20b2fcca2ac76ac6ddec00.1426515937.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1426515937.git.paul.eggleton@linux.intel.com>
References: <cover.1426515937.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1426515937.git.paul.eggleton@linux.intel.com>
References: <cover.1426515937.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] xf86-input-synaptics: drop already applied patch
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
X-List-Received-Date: Mon, 16 Mar 2015 14:27:13 -0000

This patch was part of the 1.8.1 release.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../always_include_xorg_server.h.patch             | 60 ----------------------
 .../xorg-driver/xf86-input-synaptics_1.8.1.bb      |  4 --
 2 files changed, 64 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-input-synaptics/always_include_xorg_server.h.patch

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics/always_include_xorg_server.h.patch b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics/always_include_xorg_server.h.patch
deleted file mode 100644
index f36bb75..0000000
--- a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics/always_include_xorg_server.h.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 96e60a4ea242d2decf109835981ae186cc36f642 Mon Sep 17 00:00:00 2001
-From: Peter Hutterer <peter.hutterer@who-t.net>
-Date: Fri, 29 Aug 2014 07:57:41 +1000
-Subject: Include xorg-server.h to fix build errors on newest glibc
-
-In file included from /usr/include/string.h:634:0,
-                 from /usr/include/xorg/os.h:53,
-                 from /usr/include/xorg/misc.h:115,
-                 from /usr/include/xorg/xf86str.h:37,
-                 from /usr/include/xorg/xf86Xinput.h:54,
-                 from synproto.h:36,
-                 from synproto.c:24:
-/usr/include/xorg/os.h:579:1: error: expected identifier or '(' before '__extension__'
- strndup(const char *str, size_t n);
-
-See http://lists.freedesktop.org/archives/xorg-devel/2014-July/043070.html
-
-Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
-
-Status: Backport
-
-Index: xf86-input-synaptics-1.8.0/src/eventcomm.h
-===================================================================
---- xf86-input-synaptics-1.8.0.orig/src/eventcomm.h	2014-08-28 18:40:28.628070587 -0700
-+++ xf86-input-synaptics-1.8.0/src/eventcomm.h	2014-08-28 18:40:28.620070587 -0700
-@@ -27,6 +27,8 @@
- #ifndef _EVENTCOMM_H_
- #define _EVENTCOMM_H_
- 
-+#include <xorg-server.h>
-+
- #include <linux/input.h>
- #include <linux/version.h>
- #include <xf86Xinput.h>
-Index: xf86-input-synaptics-1.8.0/src/ps2comm.h
-===================================================================
---- xf86-input-synaptics-1.8.0.orig/src/ps2comm.h	2014-08-28 18:40:28.628070587 -0700
-+++ xf86-input-synaptics-1.8.0/src/ps2comm.h	2014-08-28 18:40:28.620070587 -0700
-@@ -22,6 +22,8 @@
- #ifndef _PS2COMM_H_
- #define _PS2COMM_H_
- 
-+#include <xorg-server.h>
-+
- #include <unistd.h>
- #include <sys/ioctl.h>
- #include "xf86_OSproc.h"
-Index: xf86-input-synaptics-1.8.0/src/synproto.h
-===================================================================
---- xf86-input-synaptics-1.8.0.orig/src/synproto.h	2014-08-28 18:40:28.628070587 -0700
-+++ xf86-input-synaptics-1.8.0/src/synproto.h	2014-08-28 18:40:28.624070587 -0700
-@@ -31,6 +31,8 @@
- #include "config.h"
- #endif
- 
-+#include <xorg-server.h>
-+
- #include <unistd.h>
- #include <sys/ioctl.h>
- #include <xf86Xinput.h>
diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.8.1.bb b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.8.1.bb
index 435faa6..19be77a 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.8.1.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.8.1.bb
@@ -1,7 +1,5 @@
 require xorg-driver-input.inc
 
-#SRC_URI += "file://configurefix.patch"
-
 SUMMARY = "X.Org X server -- synaptics touchpad input driver"
 
 DESCRIPTION = "synaptics is an Xorg input driver for the touchpads from \
@@ -12,8 +10,6 @@ advanced features of the touchpad to become available."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=55aacd3535a741824955c5eb8f061398"
 
-SRC_URI += "file://always_include_xorg_server.h.patch"
-
 SRC_URI[md5sum] = "ed70d0cba94262a4008dcef654ab34a9"
 SRC_URI[sha256sum] = "d74fdaf29e9888a2cb494e16d0a9ddb24265c5c765b05392b69c50e84ffbf09a"
 
-- 
1.9.3


