Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RBwFA-0002Bv-LU
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 00:16:45 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 06 Oct 2011 15:11:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="60705840"
Received: from scimitar.jf.intel.com ([10.7.199.63])
	by orsmga002.jf.intel.com with ESMTP; 06 Oct 2011 15:11:07 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Oct 2011 15:11:07 -0700
Message-Id: <1317939067-16798-1-git-send-email-josh@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH] mutter: update to 2.29.1 and fix SRC_URI
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
X-List-Received-Date: Thu, 06 Oct 2011 22:16:45 -0000

mutter has been hosted by the gnome community for some time now, update the
recipe to use the new SRC_URI and a more recernt version - this is the last
version to support Gtk+ 2.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/recipes-graphics/mutter/mutter_2.28.1.bb |   14 --------------
 meta/recipes-graphics/mutter/mutter_2.29.1.bb |   13 +++++++++++++
 2 files changed, 13 insertions(+), 14 deletions(-)
 delete mode 100644 meta/recipes-graphics/mutter/mutter_2.28.1.bb
 create mode 100644 meta/recipes-graphics/mutter/mutter_2.29.1.bb

diff --git a/meta/recipes-graphics/mutter/mutter_2.28.1.bb b/meta/recipes-graphics/mutter/mutter_2.28.1.bb
deleted file mode 100644
index 50f2647..0000000
--- a/meta/recipes-graphics/mutter/mutter_2.28.1.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require mutter.inc
-
-PR = "r1"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-SRC_URI = "http://download.moblin.org/sources/mutter/2.28/mutter-2.28.1_0.0.tar.bz2 \
-           file://nodocs.patch \
-           file://nozenity.patch \
-           file://fix_pkgconfig.patch \
-           file://fix_CGL_TEXTURE_RECTANGLE_ARB.patch \
-           "
-
-S = "${WORKDIR}/mutter-2.28.1_0.0"
diff --git a/meta/recipes-graphics/mutter/mutter_2.29.1.bb b/meta/recipes-graphics/mutter/mutter_2.29.1.bb
new file mode 100644
index 0000000..5d031f6
--- /dev/null
+++ b/meta/recipes-graphics/mutter/mutter_2.29.1.bb
@@ -0,0 +1,13 @@
+require mutter.inc
+
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+SRC_URI += "file://nodocs.patch \
+            file://nozenity.patch \
+            file://fix_pkgconfig.patch \
+           "
+SRC_URI[archive.md5sum] = "ebe3c04751741fb2a028a3c6c4f1c2d7"
+SRC_URI[archive.sha256sum] = "175f3adcc5ad5c6f23772ca15c862f275fc3d9a9c3104e9146cf265847a4a10a"
+
-- 
1.7.6.4



