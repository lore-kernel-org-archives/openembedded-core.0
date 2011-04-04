Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Q6jue-0003G4-QT
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Apr 2011 15:33:50 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 04 Apr 2011 06:31:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,297,1299484800"; d="scan'208";a="728871691"
Received: from unknown (HELO localhost) ([10.255.13.9])
	by orsmga001.jf.intel.com with ESMTP; 04 Apr 2011 06:31:42 -0700
Message-Id: <2e4f37c9d2f3272fde3bce903f03ef0c2c275ce0.1301923706.git.josh@linux.intel.com>
In-Reply-To: <cover.1301923706.git.josh@linux.intel.com>
References: <cover.1301923706.git.josh@linux.intel.com>
Old-Date: Mon, 4 Apr 2011 14:26:40 +0100
Date: Mon, 04 Apr 2011 14:31:41 +0100
To: openembedded-core@lists.openembedded.org
CC: 
From: Joshua Lock <josh@linux.intel.com>
Subject: [PATCH 1/1] clutter-1.6: fix tarball md5sum and add json-glib to dependencies
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
X-List-Received-Date: Mon, 04 Apr 2011 13:33:50 -0000

From: Joshua Lock <josh@linux.intel.com>

* As of Clutter 1.5.2 the project no longer ships an internal version of
json-glib so we must explicitly add it to the DEPENDS.
* Fix the SRC_URI[md5sum]

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/recipes-graphics/clutter/clutter-1.6_1.6.8.bb |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/clutter/clutter-1.6_1.6.8.bb b/meta/recipes-graphics/clutter/clutter-1.6_1.6.8.bb
index 7ead5f9..ffcc42d 100644
--- a/meta/recipes-graphics/clutter/clutter-1.6_1.6.8.bb
+++ b/meta/recipes-graphics/clutter/clutter-1.6_1.6.8.bb
@@ -2,6 +2,9 @@ require recipes-graphics/clutter/clutter.inc
 
 PR = "r0"
 
+# Internal json-glib was removed in Clutter 1.5.2
+STDDEPENDS += "json-glib"
+
 PACKAGES =+ "${PN}-examples"
 FILES_${PN}-examples = "${bindir}/test-* ${pkgdatadir}/redhand.png"
 
@@ -14,12 +17,10 @@ S = "${WORKDIR}/clutter-1.6.8"
 
 BASE_CONF += "--disable-introspection"
 
-EXTRA_OECONF += "--with-json=check"
-
 do_configure_prepend () {
 	# Disable DOLT
 	sed -i -e 's/^DOLT//' ${S}/configure.ac
 }
 
-SRC_URI[md5sum] = "5a3c6d8414d4e286aba0a936f344c9b1""
+SRC_URI[md5sum] = "9eedac4216f709a9f144940d24bfbb3e"
 SRC_URI[sha256sum] = "cc147b8e7e62ed4b9b8a83df3db9788cf37db0c83970ba876228433f32bda442"
-- 
1.7.4.1



