Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id B24606FF56
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jun 2016 19:24:28 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 08 Jun 2016 12:24:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,440,1459839600"; d="scan'208";a="716057584"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by FMSMGA003.fm.intel.com with ESMTP; 08 Jun 2016 12:24:24 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jun 2016 19:23:29 +0000
Message-Id: <1465413809-36283-1-git-send-email-alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH v2] python3-pygobject: Upgrade from 3.18.2 to 3.20.1
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
X-List-Received-Date: Wed, 08 Jun 2016 19:24:28 -0000

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 .../python/python3-pygobject_3.18.2.bb             | 25 ----------------------
 .../python/python3-pygobject_3.20.1.bb             | 25 ++++++++++++++++++++++
 2 files changed, 25 insertions(+), 25 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pygobject_3.18.2.bb
 create mode 100644 meta/recipes-devtools/python/python3-pygobject_3.20.1.bb

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.18.2.bb b/meta/recipes-devtools/python/python3-pygobject_3.18.2.bb
deleted file mode 100644
index 4ddae81..0000000
--- a/meta/recipes-devtools/python/python3-pygobject_3.18.2.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY = "Python GObject bindings"
-SECTION = "devel/python"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
-
-inherit autotools pkgconfig gnomebase distutils3-base gobject-introspection
-
-DEPENDS += "python3 glib-2.0"
-
-SRCNAME="pygobject"
-SRC_URI = " \
-    http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir("${PV}")}/${SRCNAME}-${PV}.tar.xz \
-    file://0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch \
-"
-
-SRC_URI[md5sum] = "0a956f3e785e23b0f136832f2e57a862"
-SRC_URI[sha256sum] = "2a3cad1517916b74e131e6002c3824361aee0671ffb0d55ded119477fc1c2c5f"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-BBCLASSEXTEND = "native"
-
-EXTRA_OECONF = "--disable-cairo"
-
-RDEPENDS_${PN} += "python3-setuptools python3-importlib"
diff --git a/meta/recipes-devtools/python/python3-pygobject_3.20.1.bb b/meta/recipes-devtools/python/python3-pygobject_3.20.1.bb
new file mode 100644
index 0000000..7925b98
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pygobject_3.20.1.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Python GObject bindings"
+SECTION = "devel/python"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
+
+inherit autotools pkgconfig gnomebase distutils3-base gobject-introspection
+
+DEPENDS += "python3 glib-2.0"
+
+SRCNAME="pygobject"
+SRC_URI = " \
+    http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir("${PV}")}/${SRCNAME}-${PV}.tar.xz \
+    file://0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch \
+"
+
+SRC_URI[md5sum] = "4354c6283b135f859563b72457f6a321"
+SRC_URI[sha256sum] = "3d261005d6fed6a92ac4c25f283792552f7dad865d1b7e0c03c2b84c04dbd745"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+BBCLASSEXTEND = "native"
+
+EXTRA_OECONF = "--disable-cairo"
+
+RDEPENDS_${PN} += "python3-setuptools python3-importlib"
-- 
2.6.6


