Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1RDoaf-0001nu-FO
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Oct 2011 04:30:41 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Oct 2011 19:24:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="62005501"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by orsmga001.jf.intel.com with ESMTP; 11 Oct 2011 19:24:56 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Oct 2011 10:20:11 +0800
Message-Id: <e403ce9972d7e9bdd7c59ad638ef291ecab6a888.1318385789.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1318385789.git.edwin.zhai@intel.com>
References: <cover.1318385789.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1318385789.git.edwin.zhai@intel.com>
References: <cover.1318385789.git.edwin.zhai@intel.com>
Subject: [PATCH 1/2] libfm: Upgrade to 0.1.16
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
X-List-Received-Date: Wed, 12 Oct 2011 02:30:41 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Remove obsolete use_deprecate_func.patch, and add configure_fix.patch to update
configure.ac

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../libfm/libfm-0.1.14/use_deprecate_func.patch    |   13 -------------
 .../libfm/libfm-0.1.16/configure_fix.patch         |   19 +++++++++++++++++++
 .../libfm/{libfm_0.1.14.bb => libfm_0.1.16.bb}     |    8 ++++----
 3 files changed, 23 insertions(+), 17 deletions(-)
 delete mode 100644 meta/recipes-support/libfm/libfm-0.1.14/use_deprecate_func.patch
 create mode 100644 meta/recipes-support/libfm/libfm-0.1.16/configure_fix.patch
 rename meta/recipes-support/libfm/{libfm_0.1.14.bb => libfm_0.1.16.bb} (73%)

diff --git a/meta/recipes-support/libfm/libfm-0.1.14/use_deprecate_func.patch b/meta/recipes-support/libfm/libfm-0.1.14/use_deprecate_func.patch
deleted file mode 100644
index 79fc9ce..0000000
--- a/meta/recipes-support/libfm/libfm-0.1.14/use_deprecate_func.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-diff -ruN libfm-0.1.14-orig//src/Makefile.am libfm-0.1.14/src/Makefile.am
---- libfm-0.1.14-orig//src/Makefile.am	2011-04-26 10:01:44.297664993 +0800
-+++ libfm-0.1.14/src/Makefile.am	2011-04-26 10:02:10.637665004 +0800
-@@ -285,7 +285,6 @@
- 	$(GIO_CFLAGS) \
- 	-DGIO_MODULE_DIR=\"$(giomodulesdir)\"	\
- 	-DGVFS_LOCALEDIR=\""$(localedir)"\"	\
--	-DG_DISABLE_DEPRECATED \
- 	$(NULL)
- 
- libgiofm_la_LDFLAGS = 	\
diff --git a/meta/recipes-support/libfm/libfm-0.1.16/configure_fix.patch b/meta/recipes-support/libfm/libfm-0.1.16/configure_fix.patch
new file mode 100644
index 0000000..351e6e7
--- /dev/null
+++ b/meta/recipes-support/libfm/libfm-0.1.16/configure_fix.patch
@@ -0,0 +1,19 @@
+Update configure.ac after docs removed in 0.1.16
+
+Upstream-Status: Pending
+
+Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
+Index: libfm-0.1.16/configure.ac
+===================================================================
+--- libfm-0.1.16.orig/configure.ac	2011-10-10 15:13:21.000000000 +0800
++++ libfm-0.1.16/configure.ac	2011-10-10 15:13:30.000000000 +0800
+@@ -153,9 +153,6 @@
+     data/Makefile
+     data/ui/Makefile
+     po/Makefile.in
+-    docs/Makefile
+-    docs/reference/Makefile
+-    docs/reference/libfm/Makefile
+     libfm.pc
+     libfm-gtk.pc
+ ])
diff --git a/meta/recipes-support/libfm/libfm_0.1.14.bb b/meta/recipes-support/libfm/libfm_0.1.16.bb
similarity index 73%
rename from meta/recipes-support/libfm/libfm_0.1.14.bb
rename to meta/recipes-support/libfm/libfm_0.1.16.bb
index 38f1d73..293937f 100644
--- a/meta/recipes-support/libfm/libfm_0.1.14.bb
+++ b/meta/recipes-support/libfm/libfm_0.1.16.bb
@@ -10,12 +10,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 SECTION = "x11/libs"
 DEPENDS = "gtk+ menu-cache intltool-native"
 
-PR = "r3"
+PR = "r0"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/libfm-${PV}.tar.gz \
-           file://use_deprecate_func.patch"
+           file://configure_fix.patch"
 
-SRC_URI[md5sum] = "d55e51dced6bb9ef46665243b079761f"
-SRC_URI[sha256sum] = "e97bf3f9ed4f33b9f0be73e67d360b89337cccf816361faacd8422722269806b"
+SRC_URI[md5sum] = "c09bce415ff6dc2dd835e28aeddeabe3"
+SRC_URI[sha256sum] = "ed49365319b941757c155b3790a2adf73f5072227c578d9bcba7329c6f9fcd3b"
 
 inherit autotools pkgconfig
-- 
1.7.1



