Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RnoKa-0004Cz-Te
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 10:30:53 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 19 Jan 2012 01:23:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="97472108"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 19 Jan 2012 01:23:00 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2012 01:22:36 -0800
Message-Id: <8eca8b6e73bd9eaaf4ac762defddddf41cab118e.1326964778.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326964778.git.sgw@linux.intel.com>
References: <cover.1326964778.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326964778.git.sgw@linux.intel.com>
References: <cover.1326964778.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 15/33] attr/acl: refactor packages for staticdev
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
X-List-Received-Date: Thu, 19 Jan 2012 09:30:54 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/attr/acl_2.2.51.bb  |    2 +-
 meta/recipes-support/attr/attr_2.4.46.bb |    2 +-
 meta/recipes-support/attr/ea-acl.inc     |   12 ++++++------
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-support/attr/acl_2.2.51.bb b/meta/recipes-support/attr/acl_2.2.51.bb
index 40ba5f1..1c40b00 100644
--- a/meta/recipes-support/attr/acl_2.2.51.bb
+++ b/meta/recipes-support/attr/acl_2.2.51.bb
@@ -1,6 +1,6 @@
 require acl.inc
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI[md5sum] = "3fc0ce99dc5253bdcce4c9cd437bc267"
 SRC_URI[sha256sum] = "06854521cf5d396801af7e54b9636680edf8064355e51c07657ec7442a185225"
diff --git a/meta/recipes-support/attr/attr_2.4.46.bb b/meta/recipes-support/attr/attr_2.4.46.bb
index 85c35d0..0bc74cf 100644
--- a/meta/recipes-support/attr/attr_2.4.46.bb
+++ b/meta/recipes-support/attr/attr_2.4.46.bb
@@ -1,6 +1,6 @@
 require attr.inc
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI[md5sum] = "db557c17fdfa4f785333ecda08654010"
 SRC_URI[sha256sum] = "dcd69bdca7ff166bc45141eddbcf21967999a6b66b0544be12a1cc2fd6340e1f"
diff --git a/meta/recipes-support/attr/ea-acl.inc b/meta/recipes-support/attr/ea-acl.inc
index 1fda792..0f506bc 100644
--- a/meta/recipes-support/attr/ea-acl.inc
+++ b/meta/recipes-support/attr/ea-acl.inc
@@ -17,18 +17,18 @@ do_install () {
 	oe_runmake install install-lib install-dev DIST_ROOT="${D}"
 }
 
-PACKAGES =+ "lib${BPN} lib${BPN}-dev lib${BPN}-doc"
+PACKAGES =+ "lib${BPN} lib${BPN}-dev lib${BPN}-staticdev lib${BPN}-doc"
 
-FILES_lib${BPN} = "${base_libdir}/lib*.so.*"
+FILES_lib${BPN} = "${base_libdir}/lib*${SOLIBS}"
 
 FILES_lib${BPN}-dev = "${includedir} \
-                      ${libdir}/lib*.so \
-                      ${libdir}/lib*.a \
+                      ${libdir}/lib*${SOLIBSDEV} \
                       ${libdir}/lib*.la \
-                      ${base_libdir}/lib*.so \
-                      ${base_libdir}/lib*.a \
+                      ${base_libdir}/lib*${SOLIBSDEV} \
                       ${base_libdir}/lib*.la"
 
+FILES_lib${BPN}-staticdev = "${libdir}/*.a ${base_libdir}/*.a"
+
 FILES_lib${BPN}-doc = "${mandir}/man2 \
                       ${mandir}/man3"
 
-- 
1.7.6.5



