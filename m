Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1R8mRg-0001ns-8V
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 07:12:37 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 27 Sep 2011 22:07:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,453,1312182000"; d="scan'208";a="71468338"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by fmsmga002.fm.intel.com with ESMTP; 27 Sep 2011 22:07:07 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2011 13:02:45 +0800
Message-Id: <e2ce9b5e3b921c518c2bcae7a4db799f26451e50.1317185969.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1317185969.git.edwin.zhai@intel.com>
References: <cover.1317185969.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1317185969.git.edwin.zhai@intel.com>
References: <cover.1317185969.git.edwin.zhai@intel.com>
Subject: [PATCH 3/4] tables: remove it as obsolete recipe
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
X-List-Received-Date: Wed, 28 Sep 2011 05:12:37 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

tables depends on obsolete gnome-vfs, and is not maintained in clutter git repo

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 meta-demoapps/recipes-graphics/clutter/table.inc   |   13 -------------
 .../recipes-graphics/clutter/table/fixes.patch     |   16 ----------------
 .../recipes-graphics/clutter/table_git.bb          |   15 ---------------
 3 files changed, 0 insertions(+), 44 deletions(-)
 delete mode 100644 meta-demoapps/recipes-graphics/clutter/table.inc
 delete mode 100644 meta-demoapps/recipes-graphics/clutter/table/fixes.patch
 delete mode 100644 meta-demoapps/recipes-graphics/clutter/table_git.bb

diff --git a/meta-demoapps/recipes-graphics/clutter/table.inc b/meta-demoapps/recipes-graphics/clutter/table.inc
deleted file mode 100644
index 937ad56..0000000
--- a/meta-demoapps/recipes-graphics/clutter/table.inc
+++ /dev/null
@@ -1,13 +0,0 @@
-DESCRIPTION = "Table Clutter Demo"
-HOMEPAGE = "http://www.clutter-project.org/"
-LICENSE = "LGPLv2.1 & GPLv2"
-
-DEPENDS = "clutter-gst-1.4 gnome-vfs"
-
-inherit autotools pkgconfig
-
-do_install() {
-	install -d ${D}${bindir}
-	install -m 0755 ${S}/table ${D}${bindir}/table
-}
-
diff --git a/meta-demoapps/recipes-graphics/clutter/table/fixes.patch b/meta-demoapps/recipes-graphics/clutter/table/fixes.patch
deleted file mode 100644
index 323bf13..0000000
--- a/meta-demoapps/recipes-graphics/clutter/table/fixes.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Upstream-Status: Pending
-
-Index: table/Makefile
-===================================================================
---- table.orig/Makefile	2007-07-10 13:24:18.000000000 +0100
-+++ table/Makefile	2007-07-10 13:28:10.000000000 +0100
-@@ -8,7 +8,7 @@ all: table
- 
- 
- table: table.o clutter-dominatrix.o clutter-video-player.o
--	$(CC) -g -Wall $(CFLAGS) -o $@ table.o clutter-dominatrix.o clutter-video-player.o $(LIBS)
-+	$(CC) -g -Wall $(CFLAGS) $(LDFLAGS) -o $@ table.o clutter-dominatrix.o clutter-video-player.o $(LIBS)
- 
- clean:
- 	rm -fr *.o table
-\ No newline at end of file
diff --git a/meta-demoapps/recipes-graphics/clutter/table_git.bb b/meta-demoapps/recipes-graphics/clutter/table_git.bb
deleted file mode 100644
index d0ae184..0000000
--- a/meta-demoapps/recipes-graphics/clutter/table_git.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require table.inc
-
-LIC_FILES_CHKSUM = "file://fluttr/COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
-                    file://script-viewer/COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
-
-SRCREV = "4b267533ce16656cba4104fc39dc12709c1bdddf"
-PV = "0.3.0+git${SRCPV}"
-PR = "r1"
-
-SRC_URI = "git://git.clutter-project.org/toys.git;protocol=git \
-           file://fixes.patch;patch=1"
-
-S = "${WORKDIR}/git/table"
-
-
-- 
1.7.1



