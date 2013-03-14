Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1UGCdl-0003Yc-6e
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Mar 2013 19:12:33 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 14 Mar 2013 10:55:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,845,1355126400"; d="scan'208";a="214773873"
Received: from unknown (HELO dell-desktop.rb.intel.com) ([10.237.105.59])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Mar 2013 10:55:39 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Mar 2013 19:55:08 +0200
Message-Id: <ebd11f2519a02442988a332de533cb526033e9bf.1363283478.git.radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1363283478.git.radu.moisan@intel.com>
References: <cover.1363283478.git.radu.moisan@intel.com>
In-Reply-To: <cover.1363283478.git.radu.moisan@intel.com>
References: <cover.1363283478.git.radu.moisan@intel.com>
Subject: [PATCH 09/17] atk: Upgrade to v 2.7.91
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Mar 2013 18:12:35 -0000

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 .../atk/{atk_2.6.0.bb => atk_2.7.91.bb}            |    8 +++++---
 .../atk/files/remove-gnome-comile-warnings.patch   |   17 +++++++++++++++++
 2 files changed, 22 insertions(+), 3 deletions(-)
 rename meta/recipes-support/atk/{atk_2.6.0.bb => atk_2.7.91.bb} (68%)
 create mode 100644 meta/recipes-support/atk/files/remove-gnome-comile-warnings.patch

diff --git a/meta/recipes-support/atk/atk_2.6.0.bb b/meta/recipes-support/atk/atk_2.7.91.bb
similarity index 68%
rename from meta/recipes-support/atk/atk_2.6.0.bb
rename to meta/recipes-support/atk/atk_2.7.91.bb
index be797c7..c1fc295 100644
--- a/meta/recipes-support/atk/atk_2.6.0.bb
+++ b/meta/recipes-support/atk/atk_2.7.91.bb
@@ -13,9 +13,11 @@ DEPENDS = "glib-2.0"
 
 inherit autotools gtk-doc pkgconfig
 
-SRC_URI = "http://download.gnome.org/sources/atk/2.6/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "6b34e2a63dda4429b5692be7ca3aa5bf"
-SRC_URI[sha256sum] = "eff663f90847620bb68c9c2cbaaf7f45e2ff44163b9ab3f10d15be763680491f"
+SRC_URI = "http://download.gnome.org/sources/atk/2.7/${BPN}-${PV}.tar.xz \
+           file://remove-gnome-comile-warnings.patch \ 
+          "
+SRC_URI[md5sum] = "52ee0f73d935b75997b5c1dd053df581"
+SRC_URI[sha256sum] = "c95adec9d3ba605c95fa0042b79d2cee2bff18be95dc36c1628ac8ff3481bfe9"
 
 BBCLASSEXTEND = "native"
 
diff --git a/meta/recipes-support/atk/files/remove-gnome-comile-warnings.patch b/meta/recipes-support/atk/files/remove-gnome-comile-warnings.patch
new file mode 100644
index 0000000..7f15c92
--- /dev/null
+++ b/meta/recipes-support/atk/files/remove-gnome-comile-warnings.patch
@@ -0,0 +1,17 @@
+Upstream-Status:Inappropriate
+
+Signed-off-by: Radu Moisan <radu.moisan@intel.com>
+
+Index: atk-2.7.91/configure.ac
+===================================================================
+--- atk-2.7.91.orig/configure.ac
++++ atk-2.7.91/configure.ac
+@@ -215,8 +215,6 @@ if test "x$enable_rebuilds" = "xyes" &&
+ fi
+ AC_SUBST(REBUILD)
+ 
+-GNOME_COMPILE_WARNINGS([maximum])
+-
+ AC_CONFIG_FILES([
+ Makefile
+ po/Makefile.in
-- 
1.7.9.5



