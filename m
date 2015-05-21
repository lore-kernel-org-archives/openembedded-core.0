Return-Path: <ismo.puustinen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 74C2B607BB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 08:22:20 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 21 May 2015 01:22:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,467,1427785200"; d="scan'208";a="729483817"
Received: from ipuustin-mobl.ger.corp.intel.com (HELO
	ipuustin-mobl.fi.intel.com) ([10.237.68.151])
	by fmsmga002.fm.intel.com with ESMTP; 21 May 2015 01:22:22 -0700
From: Ismo Puustinen <ismo.puustinen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 May 2015 11:21:40 +0300
Message-Id: <1432196500-13462-12-git-send-email-ismo.puustinen@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1432196500-13462-1-git-send-email-ismo.puustinen@intel.com>
References: <1432196500-13462-1-git-send-email-ismo.puustinen@intel.com>
Subject: [PATCH 11/11] packagegroup-core-lsb: do not mix single and double quotes.
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
X-List-Received-Date: Thu, 21 May 2015 08:22:20 -0000

---
 meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
index 3d5075e..61e1aed 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
@@ -220,7 +220,7 @@ QT4PKGS = " \
     libqtxml4 \
     libqtnetwork4 \
     qt4-plugin-sqldriver-sqlite \
-    ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "libqtopengl4", "", d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'libqtopengl4', '', d)} \
     "
 QT4PKGS_mips64 = ""
 QT4PKGS_mips64n32 = ""
-- 
2.1.0


