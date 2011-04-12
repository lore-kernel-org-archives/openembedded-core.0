Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1Q9U9j-0003N4-El
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Apr 2011 05:20:43 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 Apr 2011 20:18:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,193,1301900400"; d="scan'208";a="417545591"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by azsmga001.ch.intel.com with ESMTP; 11 Apr 2011 20:18:28 -0700
Message-Id: <bb2fe2a34f08b5f23861711e3cac2109a907bd0c.1302576423.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1302576423.git.dexuan.cui@intel.com>
References: <cover.1302576423.git.dexuan.cui@intel.com>
Old-Date: Tue, 12 Apr 2011 01:05:52 +0800
Date: Tue, 12 Apr 2011 11:16:25 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Dexuan Cui <dexuan.cui@intel.com>
Subject: [PATCH 07/12] xextproto: upgrade from 7.1.2 to the latest version 7.2.0
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
X-List-Received-Date: Tue, 12 Apr 2011 03:20:43 -0000

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



