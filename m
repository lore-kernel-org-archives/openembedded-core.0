Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QAIQ6-0000Dc-L0
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Apr 2011 11:00:58 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 14 Apr 2011 01:58:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,210,1301900400"; d="scan'208";a="909425340"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by fmsmga001.fm.intel.com with ESMTP; 14 Apr 2011 01:58:43 -0700
Message-Id: <bdc5c968b1b6e66f85bb7fec9ca9086d92f4d38a.1302770941.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1302770941.git.dexuan.cui@intel.com>
References: <cover.1302770941.git.dexuan.cui@intel.com>
Old-Date: Tue, 12 Apr 2011 01:05:52 +0800
Date: Thu, 14 Apr 2011 16:56:38 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Dexuan Cui <dexuan.cui@intel.com>
Subject: [v2 07/12] xextproto: upgrade from 7.1.2 to the latest version 7.2.0
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
X-List-Received-Date: Thu, 14 Apr 2011 09:00:59 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

Add  --enable-specs=no.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../{xextproto_7.1.2.bb => xextproto_7.2.0.bb}     |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{xextproto_7.1.2.bb => xextproto_7.2.0.bb} (76%)

diff --git a/meta/recipes-graphics/xorg-proto/xextproto_7.1.2.bb b/meta/recipes-graphics/xorg-proto/xextproto_7.2.0.bb
similarity index 76%
rename from meta/recipes-graphics/xorg-proto/xextproto_7.1.2.bb
rename to meta/recipes-graphics/xorg-proto/xextproto_7.2.0.bb
index b079736..09eb59a 100644
--- a/meta/recipes-graphics/xorg-proto/xextproto_7.1.2.bb
+++ b/meta/recipes-graphics/xorg-proto/xextproto_7.2.0.bb
@@ -17,7 +17,9 @@ PE = "1"
 
 inherit gettext
 
+EXTRA_OECONF_append = " --enable-specs=no"
+
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "263ae968b223c23b2986603d84e5c30e"
-SRC_URI[sha256sum] = "f6f829e112c8eca7c2f10b2193e8d927b9b7722283d647cfd2aea09758159199"
+SRC_URI[md5sum] = "220732210ceffb01bf1caf970e3b1bfb"
+SRC_URI[sha256sum] = "d2bc4208c6b1883ebe00bc5c0048e5d825038cda56775f74bb4aa89afdc576d5"
-- 
1.7.2



