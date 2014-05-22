Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (unknown [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B59DE660F6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 09:30:50 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 May 2014 02:25:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,886,1392192000"; d="scan'208";a="544806883"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga002.jf.intel.com with ESMTP; 22 May 2014 02:30:19 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 May 2014 12:33:51 +0300
Message-Id: <89e5ab237849f6f2a6ef4173a1105aa995bb56fc.1400751188.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1400751188.git.cristian.iorga@intel.com>
References: <cover.1400751188.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1400751188.git.cristian.iorga@intel.com>
References: <cover.1400751188.git.cristian.iorga@intel.com>
Subject: [PATCH 1/1] bluez5: upgrade to 5.19
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
X-List-Received-Date: Thu, 22 May 2014 09:30:51 -0000

- Fixes to OBEX, AVRCP browsing, HID over GATT
and handling of device unpaired events for dual-mode devices.
- New features: user space based HID host implementation (for BR/EDR).

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-connectivity/bluez5/bluez5_5.18.bb | 3 ---
 meta/recipes-connectivity/bluez5/bluez5_5.19.bb | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.18.bb
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.19.bb

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.18.bb b/meta/recipes-connectivity/bluez5/bluez5_5.18.bb
deleted file mode 100644
index ed5b29a..0000000
--- a/meta/recipes-connectivity/bluez5/bluez5_5.18.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require bluez5.inc
-SRC_URI[md5sum] = "9c71404f86287cd9441e86783be3aae1"
-SRC_URI[sha256sum] = "8c8bb13db83d0de6c85def2da8dfa0a758aff595405fb57a00719ed94d558340"
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.19.bb b/meta/recipes-connectivity/bluez5/bluez5_5.19.bb
new file mode 100644
index 0000000..41d655d
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.19.bb
@@ -0,0 +1,3 @@
+require bluez5.inc
+SRC_URI[md5sum] = "2d839c0bc9f8daaa6ca32e65d7701812"
+SRC_URI[sha256sum] = "12778f3b66e71eec50eeb2e652de94a2578f33b8c8bd57c981fa00adab524c8a"
-- 
1.9.1


