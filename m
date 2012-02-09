Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RvJQZ-0001yc-D5
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Feb 2012 03:08:03 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 08 Feb 2012 17:59:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="104740498"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.14.207])
	by azsmga001.ch.intel.com with ESMTP; 08 Feb 2012 17:59:57 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Feb 2012 17:59:51 -0800
Message-Id: <6c2863bdf61add5007edfc1d961076e9de200e7b.1328752455.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1328750092.git.josh@linux.intel.com>
References: <cover.1328750092.git.josh@linux.intel.com>
In-Reply-To: <cover.1328752455.git.josh@linux.intel.com>
References: <cover.1328752455.git.josh@linux.intel.com>
Subject: [PATCH 1/5] clutter-1.8: update to clutter-1.8.4
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
X-List-Received-Date: Thu, 09 Feb 2012 02:08:03 -0000

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
1.7.7.6



