Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1ReNQx-00049I-8Q
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Dec 2011 09:58:28 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 24 Dec 2011 00:51:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="105668329"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by fmsmga002.fm.intel.com with ESMTP; 24 Dec 2011 00:51:17 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 24 Dec 2011 17:06:22 +0800
Message-Id: <b24a112a399a16e8cde104f43faa567a0963bb30.1324717264.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1324717264.git.shane.wang@intel.com>
References: <cover.1324717264.git.shane.wang@intel.com>
Subject: [PATCH 01/13] polkit: upgrade to 0.103
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
X-List-Received-Date: Sat, 24 Dec 2011 08:58:28 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../introspection.patch                            |    0
 .../polkit-1_pam.patch                             |    0
 .../polkit/{polkit_0.102.bb => polkit_0.103.bb}    |    7 ++++---
 3 files changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/polkit/{polkit-0.102 => polkit-0.103}/introspection.patch (100%)
 rename meta/recipes-extended/polkit/{polkit-0.102 => polkit-0.103}/polkit-1_pam.patch (100%)
 rename meta/recipes-extended/polkit/{polkit_0.102.bb => polkit_0.103.bb} (84%)

diff --git a/meta/recipes-extended/polkit/polkit-0.102/introspection.patch b/meta/recipes-extended/polkit/polkit-0.103/introspection.patch
similarity index 100%
rename from meta/recipes-extended/polkit/polkit-0.102/introspection.patch
rename to meta/recipes-extended/polkit/polkit-0.103/introspection.patch
diff --git a/meta/recipes-extended/polkit/polkit-0.102/polkit-1_pam.patch b/meta/recipes-extended/polkit/polkit-0.103/polkit-1_pam.patch
similarity index 100%
rename from meta/recipes-extended/polkit/polkit-0.102/polkit-1_pam.patch
rename to meta/recipes-extended/polkit/polkit-0.103/polkit-1_pam.patch
diff --git a/meta/recipes-extended/polkit/polkit_0.102.bb b/meta/recipes-extended/polkit/polkit_0.103.bb
similarity index 84%
rename from meta/recipes-extended/polkit/polkit_0.102.bb
rename to meta/recipes-extended/polkit/polkit_0.103.bb
index 714aa8e..7f56242 100644
--- a/meta/recipes-extended/polkit/polkit_0.102.bb
+++ b/meta/recipes-extended/polkit/polkit_0.103.bb
@@ -4,12 +4,15 @@ HOMEPAGE = "http://code.google.com/p/polkit/"
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=155db86cdbafa7532b41f390409283eb \
                     file://src/polkit/polkit.h;beginline=1;endilne=20;md5=9f797b8912dac8a806be820c14e783f8 \
-                    file://docs/polkit/html/license.html;md5=570dd8c794dc8df913cb03b86e78d936"
+                    file://docs/polkit/html/license.html;md5=d85a36709a446c10f4ee123f9dda0e38"
 
 SRC_URI = "http://hal.freedesktop.org/releases/polkit-${PV}.tar.gz \
            file://introspection.patch \
            ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
 
+SRC_URI[md5sum] = "aaacf2ef18774ea8a825a426a7cfe763"
+SRC_URI[sha256sum] = "36607c8ce576980ee55bd12bab1944f13217eb8e9d04ab56022545861ece3bc5"
+
 PAM_SRC_URI = "file://polkit-1_pam.patch"
 PR = "r0"
 DEPENDS = "libpam expat dbus-glib eggdbus intltool-native"
@@ -28,5 +31,3 @@ do_install_append() {
 	rm -f ${D}${libdir}/${PN}-1/extensions/*.a
 }
 
-SRC_URI[md5sum] = "a3726bdb9728c103e58f62131e26693a"
-SRC_URI[sha256sum] = "0a6573da841c6f5c428218f1456aed45724a0127932af0de563d568bb9058641"
-- 
1.7.6



