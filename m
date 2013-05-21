Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2F7F561221
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 07:15:20 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 May 2013 00:15:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,712,1363158000"; d="scan'208";a="316998529"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga001.jf.intel.com with ESMTP; 21 May 2013 00:15:20 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2013 10:16:07 +0300
Message-Id: <650eb87a6ca9b65c38e294db17ade1948555d1bc.1369120479.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1369120479.git.cristian.iorga@intel.com>
References: <cover.1369120479.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1369120479.git.cristian.iorga@intel.com>
References: <cover.1369120479.git.cristian.iorga@intel.com>
Subject: [PATCH 1/1] connman: upgrade to 1.14
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
X-List-Received-Date: Tue, 21 May 2013 07:15:20 -0000

- switched to archive releases;

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../connman/{connman_1.13.bb => connman_1.14.bb}              |    9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta/recipes-connectivity/connman/{connman_1.13.bb => connman_1.14.bb} (59%)

diff --git a/meta/recipes-connectivity/connman/connman_1.13.bb b/meta/recipes-connectivity/connman/connman_1.14.bb
similarity index 59%
rename from meta/recipes-connectivity/connman/connman_1.13.bb
rename to meta/recipes-connectivity/connman/connman_1.14.bb
index 4f23538..f9a5ecc 100644
--- a/meta/recipes-connectivity/connman/connman_1.13.bb
+++ b/meta/recipes-connectivity/connman/connman_1.14.bb
@@ -1,14 +1,15 @@
 require connman.inc
 
-# 1.13 tag
-SRCREV = "96fcd8871531c9012135110769618d65a3523b4d"
-SRC_URI  = "git://git.kernel.org/pub/scm/network/connman/connman.git \
+SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
             file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
             file://add_xuser_dbus_permission.patch \
             file://connman \
             file://inet-fix-ip-cleanup-functions.patch \
             "
-S = "${WORKDIR}/git"
+
+SRC_URI[md5sum] = "6c9ecaf9c044f8c66a7b465f6716b569"
+SRC_URI[sha256sum] = "d0c37452a4e8eec27e433ff901a6c447963b9d8a8ceddd4a7311cc322e2dbf8c"
+
 PR = "${INC_PR}.0"
 
 RRECOMMENDS_${PN} = "connman-conf"
-- 
1.7.10.4


