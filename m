Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 053CD65DAD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 09:16:03 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 24 Apr 2014 02:16:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,917,1389772800"; d="scan'208";a="518695460"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 24 Apr 2014 02:15:46 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Apr 2014 12:19:04 +0300
Message-Id: <7c2ea9f468512653e94715af439d86d2addbdacb.1398331032.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1398331032.git.cristian.iorga@intel.com>
References: <cover.1398331032.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1398331032.git.cristian.iorga@intel.com>
References: <cover.1398331032.git.cristian.iorga@intel.com>
Subject: [PATCH 2/4] bluez5: upgrade to 5.18
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
X-List-Received-Date: Thu, 24 Apr 2014 09:16:03 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-connectivity/bluez5/bluez5_5.15.bb | 4 ----
 meta/recipes-connectivity/bluez5/bluez5_5.18.bb | 3 +++
 2 files changed, 3 insertions(+), 4 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.15.bb
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.18.bb

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.15.bb b/meta/recipes-connectivity/bluez5/bluez5_5.15.bb
deleted file mode 100644
index 85735f0..0000000
--- a/meta/recipes-connectivity/bluez5/bluez5_5.15.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require bluez5.inc
-SRC_URI[md5sum] = "92e29e51b361aab78cca30ef0cf8812e"
-SRC_URI[sha256sum] = "487bd75697e565793bf5bc4fbd5fa6a602788313b0c694f7542b81689fc0aa87"
-
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.18.bb b/meta/recipes-connectivity/bluez5/bluez5_5.18.bb
new file mode 100644
index 0000000..ed5b29a
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.18.bb
@@ -0,0 +1,3 @@
+require bluez5.inc
+SRC_URI[md5sum] = "9c71404f86287cd9441e86783be3aae1"
+SRC_URI[sha256sum] = "8c8bb13db83d0de6c85def2da8dfa0a758aff595405fb57a00719ed94d558340"
-- 
1.9.1


