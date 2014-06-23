Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 940AD65F12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jun 2014 13:15:07 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 Jun 2014 06:15:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,530,1400050800"; d="scan'208";a="532678494"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga001.jf.intel.com with ESMTP; 23 Jun 2014 06:15:06 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jun 2014 16:18:42 +0300
Message-Id: <3b443764de37f6301f099347ea3eb29892af4492.1403529482.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1403529482.git.cristian.iorga@intel.com>
References: <cover.1403529482.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1403529482.git.cristian.iorga@intel.com>
References: <cover.1403529482.git.cristian.iorga@intel.com>
Subject: [PATCH 1/3] bluez5: upgrade to 5.20
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
X-List-Received-Date: Mon, 23 Jun 2014 13:15:10 -0000

Mostly bugfix release;
Improved handling of PS3 controllers;
Support for the A2DP aptX codec.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-connectivity/bluez5/bluez5_5.19.bb | 3 ---
 meta/recipes-connectivity/bluez5/bluez5_5.20.bb | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.19.bb
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.20.bb

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.19.bb b/meta/recipes-connectivity/bluez5/bluez5_5.19.bb
deleted file mode 100644
index 41d655d..0000000
--- a/meta/recipes-connectivity/bluez5/bluez5_5.19.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require bluez5.inc
-SRC_URI[md5sum] = "2d839c0bc9f8daaa6ca32e65d7701812"
-SRC_URI[sha256sum] = "12778f3b66e71eec50eeb2e652de94a2578f33b8c8bd57c981fa00adab524c8a"
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.20.bb b/meta/recipes-connectivity/bluez5/bluez5_5.20.bb
new file mode 100644
index 0000000..1f4476a
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.20.bb
@@ -0,0 +1,3 @@
+require bluez5.inc
+SRC_URI[md5sum] = "177d4551f76e5933cc467c3abc6d3796"
+SRC_URI[sha256sum] = "531fbaa0a9baf7b1f76fb8fd8975c20d3cc61cdc772a39d63df1d6abfc2a7481"
-- 
1.9.1


