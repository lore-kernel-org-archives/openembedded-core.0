Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id C03C777145
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 15:50:27 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 11 Nov 2015 07:50:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,276,1444719600"; d="scan'208";a="598342187"
Received: from sentry.rb.intel.com ([10.237.105.108])
	by FMSMGA003.fm.intel.com with ESMTP; 11 Nov 2015 07:50:04 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Nov 2015 17:51:09 +0200
Message-Id: <00917aad2947602c12356694a6ca3a0c9b8d8756.1447256967.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1447256967.git.cristian.iorga@intel.com>
References: <cover.1447256967.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1447256967.git.cristian.iorga@intel.com>
References: <cover.1447256967.git.cristian.iorga@intel.com>
Subject: [PATCH 2/2] bluez5: upgrade to 5.36
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
X-List-Received-Date: Wed, 11 Nov 2015 15:50:28 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-connectivity/bluez5/{bluez5_5.33.bb => bluez5_5.36.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.33.bb => bluez5_5.36.bb} (88%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.33.bb b/meta/recipes-connectivity/bluez5/bluez5_5.36.bb
similarity index 88%
rename from meta/recipes-connectivity/bluez5/bluez5_5.33.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.36.bb
index 23c7397..b94ed31 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.33.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.36.bb
@@ -1,6 +1,6 @@
 require bluez5.inc
-SRC_URI[md5sum] = "78782dc33d9a8b6344c4cc1af70c8a98"
-SRC_URI[sha256sum] = "1801807a13506678cbfeb15c6a4b89ecb5739efe1067eb464da6641d731436d3"
+SRC_URI[md5sum] = "9a0ee479cacc44fac68f6a65b1cd3eba"
+SRC_URI[sha256sum] = "a343ea1aeb53d3bd139087f3b1c1e1fb70db452d9762cc7a3d23e75962e578f2"
 
 # noinst programs in Makefile.tools that are conditional on READLINE
 # support
-- 
2.5.0


