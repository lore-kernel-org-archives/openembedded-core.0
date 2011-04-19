Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QCHum-0003ji-27
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Apr 2011 22:52:54 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 19 Apr 2011 13:50:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,241,1301900400"; d="scan'208";a="681183986"
Received: from unknown (HELO localhost) ([10.255.12.208])
	by fmsmga002.fm.intel.com with ESMTP; 19 Apr 2011 13:50:29 -0700
Message-Id: <44742f32e77375c4967e399246630631eb2768b2.1303246083.git.josh@linux.intel.com>
In-Reply-To: <cover.1303246083.git.josh@linux.intel.com>
References: <cover.1303246083.git.josh@linux.intel.com>
Old-Date: Tue, 19 Apr 2011 13:44:02 -0700
Date: Tue, 19 Apr 2011 13:50:29 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Joshua Lock <josh@linux.intel.com>
Subject: [PATCH 2/2] clutter-1.6: drop no longer required patch
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
X-List-Received-Date: Tue, 19 Apr 2011 20:52:54 -0000

From: Joshua Lock <josh@linux.intel.com>

The test-conformance-fix.patch is no longer required for clutter-1.6

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/recipes-graphics/clutter/clutter-1.6_1.6.8.bb |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/clutter/clutter-1.6_1.6.8.bb b/meta/recipes-graphics/clutter/clutter-1.6_1.6.8.bb
index ffcc42d..f30398d 100644
--- a/meta/recipes-graphics/clutter/clutter-1.6_1.6.8.bb
+++ b/meta/recipes-graphics/clutter/clutter-1.6_1.6.8.bb
@@ -1,6 +1,6 @@
 require recipes-graphics/clutter/clutter.inc
 
-PR = "r0"
+PR = "r1"
 
 # Internal json-glib was removed in Clutter 1.5.2
 STDDEPENDS += "json-glib"
@@ -9,8 +9,7 @@ PACKAGES =+ "${PN}-examples"
 FILES_${PN}-examples = "${bindir}/test-* ${pkgdatadir}/redhand.png"
 
 SRC_URI = "http://source.clutter-project.org/sources/clutter/1.6/clutter-${PV}.tar.bz2 \
-           file://enable_tests-1.4.patch \
-           file://test-conformance-fix.patch"
+           file://enable_tests-1.4.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 S = "${WORKDIR}/clutter-1.6.8"
-- 
1.7.4.4



