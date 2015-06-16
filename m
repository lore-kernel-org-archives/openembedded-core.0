Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id DEED87413A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 11:38:46 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 16 Jun 2015 04:38:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,626,1427785200"; d="scan'208";a="744346878"
Received: from theory.fi.intel.com ([10.237.72.51])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jun 2015 04:38:47 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Jun 2015 14:39:22 +0300
Message-Id: <0ae4e21c9217c8bb9e0cad43473317b0ab8335a3.1434454325.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1434454325.git.jussi.kukkonen@intel.com>
References: <cover.1434454325.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/2] dbus: Upgrade 1.8.16 -> 1.8.18
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
X-List-Received-Date: Tue, 16 Jun 2015 11:38:47 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-core/dbus/dbus_1.8.16.bb | 4 ----
 meta/recipes-core/dbus/dbus_1.8.18.bb | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)
 delete mode 100644 meta/recipes-core/dbus/dbus_1.8.16.bb
 create mode 100644 meta/recipes-core/dbus/dbus_1.8.18.bb

diff --git a/meta/recipes-core/dbus/dbus_1.8.16.bb b/meta/recipes-core/dbus/dbus_1.8.16.bb
deleted file mode 100644
index b549651..0000000
--- a/meta/recipes-core/dbus/dbus_1.8.16.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-include dbus.inc
-
-SRC_URI[md5sum] = "020824a38850501e7d6ba8307a7c5ac3"
-SRC_URI[sha256sum] = "7f795268efd343ff0498786acb35097564390d40b1b6158daf1b4f742b522b07"
diff --git a/meta/recipes-core/dbus/dbus_1.8.18.bb b/meta/recipes-core/dbus/dbus_1.8.18.bb
new file mode 100644
index 0000000..2932b7a
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus_1.8.18.bb
@@ -0,0 +1,4 @@
+include dbus.inc
+
+SRC_URI[md5sum] = "83e607e9ccb1c921d5b6bbea2376a36c"
+SRC_URI[sha256sum] = "36f2eb9c777a3c71562573da36a147e900a642afcd44d2b0470d992a4898c4f2"
-- 
2.1.4


