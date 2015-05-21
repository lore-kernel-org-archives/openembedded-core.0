Return-Path: <ismo.puustinen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8BE797378D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 08:22:15 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 21 May 2015 01:22:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,467,1427785200"; d="scan'208";a="729483778"
Received: from ipuustin-mobl.ger.corp.intel.com (HELO
	ipuustin-mobl.fi.intel.com) ([10.237.68.151])
	by fmsmga002.fm.intel.com with ESMTP; 21 May 2015 01:22:17 -0700
From: Ismo Puustinen <ismo.puustinen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 May 2015 11:21:37 +0300
Message-Id: <1432196500-13462-9-git-send-email-ismo.puustinen@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1432196500-13462-1-git-send-email-ismo.puustinen@intel.com>
References: <1432196500-13462-1-git-send-email-ismo.puustinen@intel.com>
Subject: [PATCH 08/11] packagegroup-core-tools-testapps: do not mix single and double quotes.
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
X-List-Received-Date: Thu, 21 May 2015 08:22:15 -0000

---
 meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index 95b3988..9081fde 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -50,7 +50,7 @@ RDEPENDS_${PN} = "\
     connman-tools \
     connman-tests \
     connman-client \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', "${X11TOOLS}", "", d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', "${X11GLTOOLS}", "", d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', '3g', "${3GTOOLS}", "", d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '${X11TOOLS}', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', '${X11GLTOOLS}', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', '3g', '${3GTOOLS}', '', d)} \
     "
-- 
2.1.0


