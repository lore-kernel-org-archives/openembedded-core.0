Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A4D846F7D3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Mar 2014 09:42:03 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 13 Mar 2014 02:42:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,646,1389772800"; d="scan'208";a="497621600"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga002.fm.intel.com with ESMTP; 13 Mar 2014 02:42:03 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Mar 2014 11:45:11 +0200
Message-Id: <fcd2f5c2d7d8063a6084de454c0847cba830480d.1394703743.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1394703743.git.cristian.iorga@intel.com>
References: <cover.1394703743.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1394703743.git.cristian.iorga@intel.com>
References: <cover.1394703743.git.cristian.iorga@intel.com>
Subject: [PATCH 1/2] packagegroup-core-tools-testapp: added 3G tools
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Mar 2014 09:42:05 -0000

Added ofono tests package.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../recipes-core/packagegroups/packagegroup-core-tools-testapps.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index 4b8f99b..5a55591 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -5,7 +5,7 @@
 SUMMARY = "Testing tools/applications"
 LICENSE = "MIT"
 
-PR = "r2"
+PR = "r3"
 
 inherit packagegroup
 
@@ -29,6 +29,10 @@ GLTOOLS = "\
     piglit \
     "
 
+3GTOOLS = "\
+    ofono-tests \
+    "
+
 X11TOOLS = "\
     fstests \
     owl-video \
@@ -53,4 +57,5 @@ RDEPENDS_${PN} = "\
     connman-client \
     ${@base_contains('DISTRO_FEATURES', 'x11', "${X11TOOLS}", "", d)} \
     ${@base_contains('DISTRO_FEATURES', 'opengl', "${GLTOOLS}", "", d)} \
+    ${@base_contains('DISTRO_FEATURES', '3g', "${3GTOOLS}", "", d)} \
     "
-- 
1.8.3.2


