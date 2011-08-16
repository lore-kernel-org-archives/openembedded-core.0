Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QtKSq-0002el-Vq
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Aug 2011 16:17:57 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 16 Aug 2011 07:13:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,380,1309762800"; 
   d="scan'208";a="7747484"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.112])
	by AZSMGA002.ch.intel.com with ESMTP; 16 Aug 2011 07:13:20 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Aug 2011 22:13:17 +0800
Message-Id: <b22a8ff43a0da1c8d223157c604cd5e578985490.1313503778.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313503778.git.dexuan.cui@intel.com>
References: <cover.1313503778.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1313503778.git.dexuan.cui@intel.com>
References: <cover.1313503778.git.dexuan.cui@intel.com>
Subject: [PATCH 07/10] xproto: upgrade from 7.0.21 to 7.0.22
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
X-List-Received-Date: Tue, 16 Aug 2011 14:17:58 -0000

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../{xproto_7.0.21.bb => xproto_7.0.22.bb}         |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{xproto_7.0.21.bb => xproto_7.0.22.bb} (72%)

diff --git a/meta/recipes-graphics/xorg-proto/xproto_7.0.21.bb b/meta/recipes-graphics/xorg-proto/xproto_7.0.22.bb
similarity index 72%
rename from meta/recipes-graphics/xorg-proto/xproto_7.0.21.bb
rename to meta/recipes-graphics/xorg-proto/xproto_7.0.22.bb
index 17b3793..54f8482 100644
--- a/meta/recipes-graphics/xorg-proto/xproto_7.0.21.bb
+++ b/meta/recipes-graphics/xorg-proto/xproto_7.0.22.bb
@@ -14,6 +14,6 @@ PE = "1"
 EXTRA_OECONF_append = " --enable-specs=no"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "c5a93a69b701cf81925fab02b35b0d0e"
-SRC_URI[sha256sum] = "38ee2f032c3a9e30504593f8b5e6c1161a6629daba93748a71c6f70c16f65548"
+SRC_URI[md5sum] = "da0b0eb2f432b7cc1d665b05422a0457"
+SRC_URI[sha256sum] = "ad8397dd2a3de7249d2f3fb3a49444fef71483d43681285936c11911663817a8"
 
-- 
1.7.6



