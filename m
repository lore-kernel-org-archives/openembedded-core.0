Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C231B71171
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 18:10:17 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 27 Aug 2014 11:10:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,412,1406617200"; d="scan'208";a="582500096"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by fmsmga001.fm.intel.com with ESMTP; 27 Aug 2014 11:10:13 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Aug 2014 21:10:03 +0300
Message-Id: <324b9e90f66c94546743ff35fb1866ad2298ef04.1409162830.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409162830.git.cristian.iorga@intel.com>
References: <cover.1409162830.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1409162830.git.cristian.iorga@intel.com>
References: <cover.1409162830.git.cristian.iorga@intel.com>
Subject: [PATCH 3/4] bluez5: upgrade to 5.22
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
X-List-Received-Date: Wed, 27 Aug 2014 18:10:18 -0000

Several fixes to HID over GATT (HoG) and for AVRCP.
Notable additions with the Linux kernel 3.17:
- BR/EDR whitelist support;
- Proper LE passive scanning support.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-connectivity/bluez5/bluez5_5.21.bb | 3 ---
 meta/recipes-connectivity/bluez5/bluez5_5.22.bb | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.21.bb
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.22.bb

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.21.bb b/meta/recipes-connectivity/bluez5/bluez5_5.21.bb
deleted file mode 100644
index 5b0102e..0000000
--- a/meta/recipes-connectivity/bluez5/bluez5_5.21.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require bluez5.inc
-SRC_URI[md5sum] = "d5a0d05520e013f2394bf1d0bac12889"
-SRC_URI[sha256sum] = "81eb073516f39ff1fa02fa40120e834f40fdb0b772f8f4153a9ab566cc0a1f4f"
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.22.bb b/meta/recipes-connectivity/bluez5/bluez5_5.22.bb
new file mode 100644
index 0000000..04116ed
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.22.bb
@@ -0,0 +1,3 @@
+require bluez5.inc
+SRC_URI[md5sum] = "fd0783c8bc524bc9b26514aad1f85814"
+SRC_URI[sha256sum] = "e8b866515a18116c7048a55081be9238a51447c9448ed20997b0432b13ba0882"
-- 
1.9.1


