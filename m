Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rvlyb-0001XB-Fj
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 09:37:05 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 10 Feb 2012 00:28:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="116213853"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.208])
	by fmsmga001.fm.intel.com with ESMTP; 10 Feb 2012 00:28:57 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2012 00:28:42 -0800
Message-Id: <93af76ad31ff0f9f1839cc18afaa11997060f92f.1328862318.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1328862318.git.sgw@linux.intel.com>
References: <cover.1328862318.git.sgw@linux.intel.com>
In-Reply-To: <cover.1328862318.git.sgw@linux.intel.com>
References: <cover.1328862318.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 07/20] clutter-1.8: update to clutter-1.8.4
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
X-List-Received-Date: Fri, 10 Feb 2012 08:37:05 -0000

From: Joshua Lock <josh@linux.intel.com>

Added a note about why we're setting S, so I don't have to figure it out again
next time I try and update clutter.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 .../{clutter-1.8_1.8.2.bb => clutter-1.8_1.8.4.bb} |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/clutter/{clutter-1.8_1.8.2.bb => clutter-1.8_1.8.4.bb} (79%)

diff --git a/meta/recipes-graphics/clutter/clutter-1.8_1.8.2.bb b/meta/recipes-graphics/clutter/clutter-1.8_1.8.4.bb
similarity index 79%
rename from meta/recipes-graphics/clutter/clutter-1.8_1.8.2.bb
rename to meta/recipes-graphics/clutter/clutter-1.8_1.8.4.bb
index f76201e..378b6fe 100644
--- a/meta/recipes-graphics/clutter/clutter-1.8_1.8.2.bb
+++ b/meta/recipes-graphics/clutter/clutter-1.8_1.8.4.bb
@@ -1,8 +1,6 @@
 require recipes-graphics/clutter/clutter.inc
 require recipes-graphics/clutter/clutter-package.inc
 
-PR = "r3"
-
 # We're API/ABI compatible and this may make things easier for layers
 PROVIDES += "clutter-1.6"
 
@@ -14,6 +12,7 @@ SRC_URI = "http://source.clutter-project.org/sources/clutter/1.8/clutter-${PV}.t
            file://update_gettext_macro_version.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+# because we've namespaced PN to clutter-1.8
 S = "${WORKDIR}/clutter-${PV}"
 
 BASE_CONF += "--disable-introspection"
@@ -23,5 +22,5 @@ do_configure_prepend () {
 	sed -i -e 's/^DOLT//' ${S}/configure.ac
 }
 
-SRC_URI[md5sum] = "29a238fa11da2f56c40de0eb04424aaf"
-SRC_URI[sha256sum] = "5e6abf6440e6be8130fd7a6b449e1789e4318f61b17f06323ba1b58dc143bc8b"
+SRC_URI[md5sum] = "487f70f9b59e1328b47f1db4094ab662"
+SRC_URI[sha256sum] = "0d567177facd6913ac9c894e230ae48933125f02354ef965bbbf0586f1f0df91"
-- 
1.7.6.5



