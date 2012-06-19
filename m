Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sh11T-00027s-Ps
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 18:11:21 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Jun 2012 09:00:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="155520414"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.123])
	by orsmga001.jf.intel.com with ESMTP; 19 Jun 2012 09:00:09 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jun 2012 08:59:55 -0700
Message-Id: <baf1f751b34a123e0fc94b76c1e7af9e5c6a3a17.1340121099.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340121099.git.sgw@linux.intel.com>
References: <cover.1340121099.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340121099.git.sgw@linux.intel.com>
References: <cover.1340121099.git.sgw@linux.intel.com>
Subject: [PATCH 37/39] PR bumps for PACKAGES reorder
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
X-List-Received-Date: Tue, 19 Jun 2012 16:11:21 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../nfs-utils/libnfsidmap_0.24.bb                  |    2 +-
 meta/recipes-core/libxml/libxml2_2.7.8.bb          |    2 +-
 meta/recipes-extended/libuser/libuser_0.57.1.bb    |    2 +-
 .../recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb |    2 +-
 meta/recipes-gnome/gnome/metacity_2.30.3.bb        |    2 +-
 meta/recipes-support/libksba/libksba_1.2.0.bb      |    1 +
 6 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.24.bb b/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.24.bb
index eff75ec..3ae0dba 100644
--- a/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.24.bb
+++ b/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.24.bb
@@ -5,7 +5,7 @@ SECTION = "libs"
 
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d9c6a2a0ca6017fda7cd905ed2739b37"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://www.citi.umich.edu/projects/nfsv4/linux/libnfsidmap/${BPN}-${PV}.tar.gz \
            file://fix-ac-prereq.patch \
diff --git a/meta/recipes-core/libxml/libxml2_2.7.8.bb b/meta/recipes-core/libxml/libxml2_2.7.8.bb
index 9111120..1e233f0 100644
--- a/meta/recipes-core/libxml/libxml2_2.7.8.bb
+++ b/meta/recipes-core/libxml/libxml2_2.7.8.bb
@@ -1,6 +1,6 @@
 require libxml2.inc
 
-PR = "r8"
+PR = "r9"
 
 SRC_URI += "file://fix_version_info.patch \
             file://libxml2_fix_for_automake_1.12.patch"
diff --git a/meta/recipes-extended/libuser/libuser_0.57.1.bb b/meta/recipes-extended/libuser/libuser_0.57.1.bb
index 355427f..99b661b 100644
--- a/meta/recipes-extended/libuser/libuser_0.57.1.bb
+++ b/meta/recipes-extended/libuser/libuser_0.57.1.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://fedorahosted.org/releases/l/i/libuser/libuser-${PV}.tar.xz"
 
 SRC_URI[md5sum] = "be82c6941264d0b4bd04f95fb342ec7d"
 SRC_URI[sha256sum] = "a61289867581fa715354a3fafe09c3e481173ce0a2dcb33b04588b6ac13cead5"
-PR = "r1"
+PR = "r2"
 
 DEPENDS = "popt libpam glib-2.0 xz-native docbook-utils-native linuxdoc-tools-native"
 
diff --git a/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb b/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
index 00ba1d1..e4b61fd 100644
--- a/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
+++ b/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
@@ -9,7 +9,7 @@ SECTION = "x11/gnome"
 DEPENDS = "icon-naming-utils-native glib-2.0 intltool-native"
 RDEPENDS_${PN} = "hicolor-icon-theme"
 RRECOMMENDS_${PN} = "librsvg-gtk"
-PR = "r2"
+PR = "r3"
 
 FILES_${PN} += "${datadir}/*"
 
diff --git a/meta/recipes-gnome/gnome/metacity_2.30.3.bb b/meta/recipes-gnome/gnome/metacity_2.30.3.bb
index a464b72..6db19c4 100644
--- a/meta/recipes-gnome/gnome/metacity_2.30.3.bb
+++ b/meta/recipes-gnome/gnome/metacity_2.30.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://src/include/main.h;endline=24;md5=c2242df552c880280315989bab626b90"
 
 DEPENDS = "startup-notification gtk+ gconf gdk-pixbuf-native libcanberra gnome-doc-utils"
-PR = "r3"
+PR = "r4"
 
 inherit gnome update-alternatives
 
diff --git a/meta/recipes-support/libksba/libksba_1.2.0.bb b/meta/recipes-support/libksba/libksba_1.2.0.bb
index 1d8d287..dd8d88f 100644
--- a/meta/recipes-support/libksba/libksba_1.2.0.bb
+++ b/meta/recipes-support/libksba/libksba_1.2.0.bb
@@ -2,6 +2,7 @@ DESCRIPTION = "Libksba provides an easy API to create and parse X.509 and CMS re
 HOMEPAGE = "http://www.gnupg.org/related_software/libksba/"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
+PR = "r1"
 
 DEPENDS = "libgpg-error"
 
-- 
1.7.7.6



