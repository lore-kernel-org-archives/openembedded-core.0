Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QWOd8-0001K6-Nk
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 10:05:47 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Jun 2011 01:02:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,363,1304319600"; d="scan'208";a="14283975"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.216])
	by orsmga001.jf.intel.com with ESMTP; 14 Jun 2011 01:02:17 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jun 2011 01:01:40 -0700
Message-Id: <50b80a775d072230e6e528d12bba6f1691341e23.1308037753.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308037752.git.sgw@linux.intel.com>
References: <cover.1308037752.git.sgw@linux.intel.com>
In-Reply-To: <cover.1308037752.git.sgw@linux.intel.com>
References: <cover.1308037752.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 31/51] dri2proto: upgrade from 2.3 to the latest version 2.4
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
X-List-Received-Date: Tue, 14 Jun 2011 08:06:48 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../{dri2proto_2.3.bb => dri2proto_2.4.bb}         |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{dri2proto_2.3.bb => dri2proto_2.4.bb} (76%)

diff --git a/meta/recipes-graphics/xorg-proto/dri2proto_2.3.bb b/meta/recipes-graphics/xorg-proto/dri2proto_2.4.bb
similarity index 76%
rename from meta/recipes-graphics/xorg-proto/dri2proto_2.3.bb
rename to meta/recipes-graphics/xorg-proto/dri2proto_2.4.bb
index 79f7dbc..9d30e94 100644
--- a/meta/recipes-graphics/xorg-proto/dri2proto_2.3.bb
+++ b/meta/recipes-graphics/xorg-proto/dri2proto_2.4.bb
@@ -12,5 +12,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2e396fa91834f8786032cad2da5638f3 \
 
 PR = "r0"
 
-SRC_URI[md5sum] = "3407b494d5e90d584c9af52aa8f9f028"
-SRC_URI[sha256sum] = "b2141892a0db35feffa5e952ff5e1d2727c4436b07d7e2e9dd2ed89c8bb3e677"
+SRC_URI[md5sum] = "0cdeb1e95901813385dc9576be272bd3"
+SRC_URI[sha256sum] = "ff156f178d48ab31beeb4be5eb39d5df7540791ba489a8d94c443bb99a2376f1"
-- 
1.7.3.4



