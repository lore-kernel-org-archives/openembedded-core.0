Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RNZNB-0003Cy-Gn
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 01:17:05 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 07 Nov 2011 16:10:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="72146537"
Received: from unknown (HELO shamshir.jf.intel.com) ([10.7.199.75])
	by orsmga001.jf.intel.com with ESMTP; 07 Nov 2011 16:10:50 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Nov 2011 16:10:38 -0800
Message-Id: <96395166a538efede5ce4d8f46f4a89177642a46.1320709417.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1320709417.git.josh@linux.intel.com>
References: <cover.1320709417.git.josh@linux.intel.com>
In-Reply-To: <cover.1320709417.git.josh@linux.intel.com>
References: <cover.1320709417.git.josh@linux.intel.com>
Subject: [PATCH 01/12] cogl: add cogl 1.8.0 recipe
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
X-List-Received-Date: Tue, 08 Nov 2011 00:17:05 -0000

Cogl has been split into a separate recipe as of the clutter-1.8 series

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/recipes-graphics/clutter/cogl.inc             |    2 +-
 .../clutter/cogl/macro-versions.patch              |   26 ++++++++++++++++++++
 meta/recipes-graphics/clutter/cogl_1.8.0.bb        |    9 +++++++
 3 files changed, 36 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-graphics/clutter/cogl/macro-versions.patch
 create mode 100644 meta/recipes-graphics/clutter/cogl_1.8.0.bb

diff --git a/meta/recipes-graphics/clutter/cogl.inc b/meta/recipes-graphics/clutter/cogl.inc
index 387f6ec..f264151 100644
--- a/meta/recipes-graphics/clutter/cogl.inc
+++ b/meta/recipes-graphics/clutter/cogl.inc
@@ -8,7 +8,7 @@ BASE_CONF = "--disable-gtk-doc ${@get_clutter_fpu_setting(bb, d)}"
 DEPENDS = "${STDDEPENDS} virtual/libgl"
 EXTRA_OECONF = "${BASE_CONF} --with-flavour=glx"
 
-FILESPATH = "${FILE_DIRNAME}/clutter"
+FILESPATH = "${FILE_DIRNAME}/cogl"
 
 inherit autotools pkgconfig gtk-doc gettext
 
diff --git a/meta/recipes-graphics/clutter/cogl/macro-versions.patch b/meta/recipes-graphics/clutter/cogl/macro-versions.patch
new file mode 100644
index 0000000..87ea1f7
--- /dev/null
+++ b/meta/recipes-graphics/clutter/cogl/macro-versions.patch
@@ -0,0 +1,26 @@
+Index: cogl-1.8.0/configure.ac
+===================================================================
+--- cogl-1.8.0.orig/configure.ac
++++ cogl-1.8.0/configure.ac
+@@ -833,7 +833,7 @@ LT_INIT([disable-static])
+ dnl ================================================================
+ dnl I18n stuff.
+ dnl ================================================================
+-AM_GNU_GETTEXT_VERSION([0.17])
++AM_GNU_GETTEXT_VERSION([0.18])
+ AM_GNU_GETTEXT([external])
+ 
+ GETTEXT_PACKAGE="cogl"
+Index: cogl-1.8.0/po/Makefile.in.in
+===================================================================
+--- cogl-1.8.0.orig/po/Makefile.in.in
++++ cogl-1.8.0/po/Makefile.in.in
+@@ -9,7 +9,7 @@
+ # General Public License and is *not* in the public domain.
+ #
+ # Origin: gettext-0.17
+-GETTEXT_MACRO_VERSION = 0.17
++GETTEXT_MACRO_VERSION = 0.18
+ 
+ PACKAGE = @PACKAGE@
+ VERSION = @VERSION@
diff --git a/meta/recipes-graphics/clutter/cogl_1.8.0.bb b/meta/recipes-graphics/clutter/cogl_1.8.0.bb
new file mode 100644
index 0000000..02ed67c
--- /dev/null
+++ b/meta/recipes-graphics/clutter/cogl_1.8.0.bb
@@ -0,0 +1,9 @@
+require cogl.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+SRC_URI = "http://source.clutter-project.org/sources/cogl/1.8/${BPN}-${PV}.tar.bz2 \
+	   file://macro-versions.patch"
+
+SRC_URI[md5sum] = "cd18c28bf3dd0008b072cb9c5eed7821"
+SRC_URI[sha256sum] = "5ed9ee014367058a63d99a13e3fcc8cb8c6acb19ece00195c6df034fd8d8d8c7"
-- 
1.7.7



