Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QCJmA-0005hb-5m
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Apr 2011 00:52:06 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 19 Apr 2011 15:49:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,241,1301900400"; d="scan'208";a="681223435"
Received: from unknown (HELO localhost) ([10.255.13.54])
	by fmsmga002.fm.intel.com with ESMTP; 19 Apr 2011 15:49:44 -0700
Message-Id: <1b40fa30938ac031eb74d5ff708527ef772d0b59.1303253280.git.josh@linux.intel.com>
In-Reply-To: <cover.1303253280.git.josh@linux.intel.com>
References: <cover.1303253280.git.josh@linux.intel.com>
Old-Date: Tue, 19 Apr 2011 15:40:26 -0700
Date: Tue, 19 Apr 2011 15:49:43 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Joshua Lock <josh@linux.intel.com>
Subject: [PATCH v2 3/3] clutter-1.6: update to 1.6.14
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
X-List-Received-Date: Tue, 19 Apr 2011 22:52:06 -0000

From: Joshua Lock <josh@linux.intel.com>

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 ...{clutter-1.6_1.6.8.bb => clutter-1.6_1.6.14.bb} |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/clutter/{clutter-1.6_1.6.8.bb => clutter-1.6_1.6.14.bb} (75%)

diff --git a/meta/recipes-graphics/clutter/clutter-1.6_1.6.8.bb b/meta/recipes-graphics/clutter/clutter-1.6_1.6.14.bb
similarity index 75%
rename from meta/recipes-graphics/clutter/clutter-1.6_1.6.8.bb
rename to meta/recipes-graphics/clutter/clutter-1.6_1.6.14.bb
index f30398d..ab9e0e0 100644
--- a/meta/recipes-graphics/clutter/clutter-1.6_1.6.8.bb
+++ b/meta/recipes-graphics/clutter/clutter-1.6_1.6.14.bb
@@ -1,6 +1,6 @@
 require recipes-graphics/clutter/clutter.inc
 
-PR = "r1"
+PR = "r0"
 
 # Internal json-glib was removed in Clutter 1.5.2
 STDDEPENDS += "json-glib"
@@ -12,7 +12,7 @@ SRC_URI = "http://source.clutter-project.org/sources/clutter/1.6/clutter-${PV}.t
            file://enable_tests-1.4.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
-S = "${WORKDIR}/clutter-1.6.8"
+S = "${WORKDIR}/clutter-${PV}"
 
 BASE_CONF += "--disable-introspection"
 
@@ -21,5 +21,5 @@ do_configure_prepend () {
 	sed -i -e 's/^DOLT//' ${S}/configure.ac
 }
 
-SRC_URI[md5sum] = "9eedac4216f709a9f144940d24bfbb3e"
-SRC_URI[sha256sum] = "cc147b8e7e62ed4b9b8a83df3db9788cf37db0c83970ba876228433f32bda442"
+SRC_URI[md5sum] = "1da9f983115f9bd28b0be8176e53fe36"
+SRC_URI[sha256sum] = "0564e57ca8eb24e76014627c0bb28a80a6c01b620ba14bc4198365562549576d"
-- 
1.7.4.4



