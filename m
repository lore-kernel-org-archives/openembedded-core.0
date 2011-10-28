Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1RJd75-00066R-0G
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Oct 2011 05:28:11 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 27 Oct 2011 20:22:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,416,1315206000"; d="scan'208";a="30942457"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by AZSMGA002.ch.intel.com with ESMTP; 27 Oct 2011 20:22:08 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Oct 2011 11:35:40 +0800
Message-Id: <4223afab44df958ba4e7da075c3c1166f35b9f20.1319772853.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1319772853.git.dongxiao.xu@intel.com>
References: <cover.1319772853.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1319772853.git.dongxiao.xu@intel.com>
References: <cover.1319772853.git.dongxiao.xu@intel.com>
Subject: [PATCH 01/11] polkit: upgrade to latest 0.102
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
X-List-Received-Date: Fri, 28 Oct 2011 03:28:11 -0000

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../introspection.patch                            |    0
 .../polkit-1_pam.patch                             |    0
 .../polkit/{polkit_0.101.bb => polkit_0.102.bb}    |    8 ++++----
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/polkit/{polkit-0.101 => polkit-0.102}/introspection.patch (100%)
 rename meta/recipes-extended/polkit/{polkit-0.101 => polkit-0.102}/polkit-1_pam.patch (100%)
 rename meta/recipes-extended/polkit/{polkit_0.101.bb => polkit_0.102.bb} (83%)

diff --git a/meta/recipes-extended/polkit/polkit-0.101/introspection.patch b/meta/recipes-extended/polkit/polkit-0.102/introspection.patch
similarity index 100%
rename from meta/recipes-extended/polkit/polkit-0.101/introspection.patch
rename to meta/recipes-extended/polkit/polkit-0.102/introspection.patch
diff --git a/meta/recipes-extended/polkit/polkit-0.101/polkit-1_pam.patch b/meta/recipes-extended/polkit/polkit-0.102/polkit-1_pam.patch
similarity index 100%
rename from meta/recipes-extended/polkit/polkit-0.101/polkit-1_pam.patch
rename to meta/recipes-extended/polkit/polkit-0.102/polkit-1_pam.patch
diff --git a/meta/recipes-extended/polkit/polkit_0.101.bb b/meta/recipes-extended/polkit/polkit_0.102.bb
similarity index 83%
rename from meta/recipes-extended/polkit/polkit_0.101.bb
rename to meta/recipes-extended/polkit/polkit_0.102.bb
index b5f2e28..714aa8e 100644
--- a/meta/recipes-extended/polkit/polkit_0.101.bb
+++ b/meta/recipes-extended/polkit/polkit_0.102.bb
@@ -4,14 +4,14 @@ HOMEPAGE = "http://code.google.com/p/polkit/"
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=155db86cdbafa7532b41f390409283eb \
                     file://src/polkit/polkit.h;beginline=1;endilne=20;md5=9f797b8912dac8a806be820c14e783f8 \
-                    file://docs/polkit/html/license.html;md5=07ddbf5f29e44c80c99be19c1690ec1f"
+                    file://docs/polkit/html/license.html;md5=570dd8c794dc8df913cb03b86e78d936"
 
 SRC_URI = "http://hal.freedesktop.org/releases/polkit-${PV}.tar.gz \
            file://introspection.patch \
            ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
 
 PAM_SRC_URI = "file://polkit-1_pam.patch"
-PR = "r2"
+PR = "r0"
 DEPENDS = "libpam expat dbus-glib eggdbus intltool-native"
 RDEPENDS_${PN} = "libpam"
 EXTRA_OECONF = "--with-authfw=pam --with-os-type=moblin --disable-man-pages --disable-gtk-doc --disable-introspection"
@@ -28,5 +28,5 @@ do_install_append() {
 	rm -f ${D}${libdir}/${PN}-1/extensions/*.a
 }
 
-SRC_URI[md5sum] = "f925ac93aba3c072977370c1e27feb7f"
-SRC_URI[sha256sum] = "927f65760e4fce23d7cdeae90245c22986eb0a39335a344915302158f73f9f1b"
+SRC_URI[md5sum] = "a3726bdb9728c103e58f62131e26693a"
+SRC_URI[sha256sum] = "0a6573da841c6f5c428218f1456aed45724a0127932af0de563d568bb9058641"
-- 
1.7.1



