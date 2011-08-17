Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QtZf6-0004FD-K8
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 08:31:36 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 16 Aug 2011 23:26:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="39163450"
Received: from unknown (HELO swold-MOBL.local) ([10.255.15.2])
	by orsmga001.jf.intel.com with ESMTP; 16 Aug 2011 23:26:56 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Aug 2011 23:26:42 -0700
Message-Id: <8f80adf492226af775487e9224d4892a5f9c72a3.1313560883.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313560883.git.sgw@linux.intel.com>
References: <cover.1313560883.git.sgw@linux.intel.com>
In-Reply-To: <cover.1313560883.git.sgw@linux.intel.com>
References: <cover.1313560883.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 19/27] xproto: upgrade from 7.0.21 to 7.0.22
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
X-List-Received-Date: Wed, 17 Aug 2011 06:31:37 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

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



