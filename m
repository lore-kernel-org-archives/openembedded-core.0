Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3C5176F7D5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Mar 2014 09:42:05 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 13 Mar 2014 02:42:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,646,1389772800"; d="scan'208";a="497621609"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga002.fm.intel.com with ESMTP; 13 Mar 2014 02:42:04 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Mar 2014 11:45:12 +0200
Message-Id: <1165b2080580b27086ed8b77fa85ba41668ab199.1394703743.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1394703743.git.cristian.iorga@intel.com>
References: <cover.1394703743.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1394703743.git.cristian.iorga@intel.com>
References: <cover.1394703743.git.cristian.iorga@intel.com>
Subject: [PATCH 2/2] packagegroup-core-tools-testapps: added connman tools and tests
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

Added connman-tools and connman-tests packages.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index 5a55591..f2c02d2 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -5,7 +5,7 @@
 SUMMARY = "Testing tools/applications"
 LICENSE = "MIT"
 
-PR = "r3"
+PR = "r4"
 
 inherit packagegroup
 
@@ -54,6 +54,8 @@ RDEPENDS_${PN} = "\
     gst-meta-video \
     gst-meta-audio \
     ltp \
+    connman-tools \
+    connman-tests \
     connman-client \
     ${@base_contains('DISTRO_FEATURES', 'x11', "${X11TOOLS}", "", d)} \
     ${@base_contains('DISTRO_FEATURES', 'opengl', "${GLTOOLS}", "", d)} \
-- 
1.8.3.2


