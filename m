Return-Path: <ionutx.radu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 53E3A6B254
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 14:48:48 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 25 Jul 2013 07:48:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,743,1367996400"; d="scan'208";a="375930850"
Received: from work.rb.intel.com ([10.237.105.51])
	by fmsmga002.fm.intel.com with ESMTP; 25 Jul 2013 07:48:48 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Jul 2013 17:51:06 +0300
Message-Id: <fb6bd664104858abe0dd802a8bf9fd5f4b4b1c5a.1374763279.git.ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <0e420cbfa5d9ab32d32657fbbbac8d3ce13e778f.1374763279.git.ionutx.radu@intel.com>
References: <0e420cbfa5d9ab32d32657fbbbac8d3ce13e778f.1374763279.git.ionutx.radu@intel.com>
In-Reply-To: <cover.1374763279.git.ionutx.radu@intel.com>
References: <cover.1374763279.git.ionutx.radu@intel.com>
Subject: [v2 5/6] libuser: Updated from 0.58 to 0.59
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
X-List-Received-Date: Thu, 25 Jul 2013 14:48:48 -0000

Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
---
 meta/recipes-extended/libuser/{libuser_0.58.bb => libuser_0.59.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/libuser/{libuser_0.58.bb => libuser_0.59.bb} (88%)

diff --git a/meta/recipes-extended/libuser/libuser_0.58.bb b/meta/recipes-extended/libuser/libuser_0.59.bb
similarity index 88%
rename from meta/recipes-extended/libuser/libuser_0.58.bb
rename to meta/recipes-extended/libuser/libuser_0.59.bb
index c1fe49d..f951156 100644
--- a/meta/recipes-extended/libuser/libuser_0.58.bb
+++ b/meta/recipes-extended/libuser/libuser_0.59.bb
@@ -14,8 +14,8 @@ SECTION = "base"
 SRC_URI = "https://fedorahosted.org/releases/l/i/libuser/libuser-${PV}.tar.xz \
            file://fixsepbuild.patch"
 
-SRC_URI[md5sum] = "1fc3ef3f3a3955b2d78562ff4daed793"
-SRC_URI[sha256sum] = "12a0c09d016d80687e04227a00a89e3c056d3b48bfa2444a9028e6474d8e1dbd"
+SRC_URI[md5sum] = "22835cbfec894b1e9491845ed5023244"
+SRC_URI[sha256sum] = "27a93ed1f6424cfbf539c56cf0ca54d3b9b2c4daba6c408464e3c77ddf9c7a2f"
 PR = "r0"
 
 DEPENDS = "popt libpam glib-2.0 xz-native docbook-utils-native linuxdoc-tools-native python"
-- 
1.7.10.4


