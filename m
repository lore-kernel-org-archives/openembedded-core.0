Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 486E16D156
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 15:22:42 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 30 Oct 2013 08:22:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="314791910"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by AZSMGA002.ch.intel.com with ESMTP; 30 Oct 2013 08:22:42 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Oct 2013 17:24:49 +0200
Message-Id: <1867df0b43955340ceecbccb5571ebec076fbed5.1383146648.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1383146648.git.cristian.iorga@intel.com>
References: <cover.1383146648.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1383146648.git.cristian.iorga@intel.com>
References: <cover.1383146648.git.cristian.iorga@intel.com>
Subject: [PATCH 1/4] libuser: upgrade to 0.60
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
X-List-Received-Date: Wed, 30 Oct 2013 15:22:42 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-extended/libuser/{libuser_0.59.bb => libuser_0.60.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/libuser/{libuser_0.59.bb => libuser_0.60.bb} (88%)

diff --git a/meta/recipes-extended/libuser/libuser_0.59.bb b/meta/recipes-extended/libuser/libuser_0.60.bb
similarity index 88%
rename from meta/recipes-extended/libuser/libuser_0.59.bb
rename to meta/recipes-extended/libuser/libuser_0.60.bb
index a39e9b3..ca608c7 100644
--- a/meta/recipes-extended/libuser/libuser_0.59.bb
+++ b/meta/recipes-extended/libuser/libuser_0.60.bb
@@ -14,8 +14,8 @@ SECTION = "base"
 SRC_URI = "https://fedorahosted.org/releases/l/i/libuser/libuser-${PV}.tar.xz \
            file://fixsepbuild.patch"
 
-SRC_URI[md5sum] = "22835cbfec894b1e9491845ed5023244"
-SRC_URI[sha256sum] = "27a93ed1f6424cfbf539c56cf0ca54d3b9b2c4daba6c408464e3c77ddf9c7a2f"
+SRC_URI[md5sum] = "5c549724999ccca65ceaaecc4eb8cb98"
+SRC_URI[sha256sum] = "b1f73408ebfee79eb01a47c5879a2cdef6a00b75ee24870de7df1b816ff483eb"
 
 DEPENDS = "popt libpam glib-2.0 xz-native docbook-utils-native linuxdoc-tools-native python"
 
-- 
1.8.1.2


