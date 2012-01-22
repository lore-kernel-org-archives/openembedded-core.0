Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1Rp1fT-0001bN-EI
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Jan 2012 18:57:27 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 22 Jan 2012 09:49:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="99360261"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by orsmga001.jf.intel.com with ESMTP; 22 Jan 2012 09:49:42 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2012 02:06:08 +0800
Message-Id: <3ca4de430bc6a7d3409af065b29e86f734167c16.1327255445.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <a3776c81de568353900eec28bb7f10372875e727.1327255445.git.shane.wang@intel.com>
References: <a3776c81de568353900eec28bb7f10372875e727.1327255445.git.shane.wang@intel.com>
In-Reply-To: <cover.1327255445.git.shane.wang@intel.com>
References: <cover.1327255445.git.shane.wang@intel.com>
Subject: [PATCH 03/18] xcb-proto: upgrade to 1.7
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
X-List-Received-Date: Sun, 22 Jan 2012 17:57:27 -0000

Upgrade xcb-proto from 1.6 to 1.7
Since xcb-proto-libdir.patch is there, the file is removed.

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../xcb/xcb-proto-1.6/xcb-proto-libdir.patch       |   14 --------------
 meta/recipes-graphics/xcb/xcb-proto.inc            |    3 +--
 .../xcb/{xcb-proto_1.6.bb => xcb-proto_1.7.bb}     |    6 +++---
 3 files changed, 4 insertions(+), 19 deletions(-)
 delete mode 100644 meta/recipes-graphics/xcb/xcb-proto-1.6/xcb-proto-libdir.patch
 rename meta/recipes-graphics/xcb/{xcb-proto_1.6.bb => xcb-proto_1.7.bb} (58%)

diff --git a/meta/recipes-graphics/xcb/xcb-proto-1.6/xcb-proto-libdir.patch b/meta/recipes-graphics/xcb/xcb-proto-1.6/xcb-proto-libdir.patch
deleted file mode 100644
index 708f329..0000000
--- a/meta/recipes-graphics/xcb/xcb-proto-1.6/xcb-proto-libdir.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
-
-Index: xcb-proto-1.6/xcb-proto.pc.in
-===================================================================
---- xcb-proto-1.6.orig/xcb-proto.pc.in
-+++ xcb-proto-1.6/xcb-proto.pc.in
-@@ -1,4 +1,5 @@
- prefix=@prefix@
-+libdir=@libdir@
- datarootdir=@datarootdir@
- datadir=@datadir@
- xcbincludedir=@xcbincludedir@
diff --git a/meta/recipes-graphics/xcb/xcb-proto.inc b/meta/recipes-graphics/xcb/xcb-proto.inc
index bab5112..e93b1a2 100644
--- a/meta/recipes-graphics/xcb/xcb-proto.inc
+++ b/meta/recipes-graphics/xcb/xcb-proto.inc
@@ -9,8 +9,7 @@ BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=XCB"
 SECTION = "x11/libs"
 LICENSE = "MIT-X"
 
-SRC_URI = "http://xcb.freedesktop.org/dist/xcb-proto-${PV}.tar.bz2 \
-           file://xcb-proto-libdir.patch"
+SRC_URI = "http://xcb.freedesktop.org/dist/xcb-proto-${PV}.tar.bz2"
 
 inherit autotools pkgconfig
 
diff --git a/meta/recipes-graphics/xcb/xcb-proto_1.6.bb b/meta/recipes-graphics/xcb/xcb-proto_1.7.bb
similarity index 58%
rename from meta/recipes-graphics/xcb/xcb-proto_1.6.bb
rename to meta/recipes-graphics/xcb/xcb-proto_1.7.bb
index 7ac7ad5..fac24df 100644
--- a/meta/recipes-graphics/xcb/xcb-proto_1.6.bb
+++ b/meta/recipes-graphics/xcb/xcb-proto_1.7.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7 \
                     file://src/dri2.xml;beginline=2;endline=28;md5=f8763b13ff432e8597e0d610cf598e65"
 
-PR = "r4"
+PR = "r0"
 
-SRC_URI[md5sum] = "04313e1d914b44d0e457f6c494fc178b"
-SRC_URI[sha256sum] = "f52bc1159b12496f002404eb5793c01277b20c82cb72c5ff076d7b25da9b5ca2"
+SRC_URI[md5sum] = "f5d73ec841ed055f5e80535819f18400"
+SRC_URI[sha256sum] = "e67eb7263f222133fb9d1de70928724bea3a448cdcd99d0fa4c63c04fc124b38"
-- 
1.7.6



