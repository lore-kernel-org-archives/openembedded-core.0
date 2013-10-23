Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 42C316D2C9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2013 16:57:33 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 Oct 2013 09:57:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="397432011"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga001.jf.intel.com with ESMTP; 23 Oct 2013 09:57:34 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Oct 2013 19:59:39 +0300
Message-Id: <c712326a5227bd3033e0a48365c8269bd9b6149c.1382547468.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1382547468.git.cristian.iorga@intel.com>
References: <cover.1382547468.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1382547468.git.cristian.iorga@intel.com>
References: <cover.1382547468.git.cristian.iorga@intel.com>
Subject: [PATCH 2/2] bluez5: upgrade to 5.10
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
X-List-Received-Date: Wed, 23 Oct 2013 16:57:33 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../bluez5/{bluez5-5.7 => bluez5-5.10}/bluetooth.conf                | 0
 meta/recipes-connectivity/bluez5/bluez5_5.10.bb                      | 5 +++++
 meta/recipes-connectivity/bluez5/bluez5_5.7.bb                       | 5 -----
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-connectivity/bluez5/{bluez5-5.7 => bluez5-5.10}/bluetooth.conf (100%)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.10.bb
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.7.bb

diff --git a/meta/recipes-connectivity/bluez5/bluez5-5.7/bluetooth.conf b/meta/recipes-connectivity/bluez5/bluez5-5.10/bluetooth.conf
similarity index 100%
rename from meta/recipes-connectivity/bluez5/bluez5-5.7/bluetooth.conf
rename to meta/recipes-connectivity/bluez5/bluez5-5.10/bluetooth.conf
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.10.bb b/meta/recipes-connectivity/bluez5/bluez5_5.10.bb
new file mode 100644
index 0000000..57dd4ff
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.10.bb
@@ -0,0 +1,5 @@
+require bluez5.inc
+
+SRC_URI[md5sum] = "9bcc1d81e392e5be27fb11b1aad71abe"
+SRC_URI[sha256sum] = "39360c4c58158cb1d5dcc56d34a0a676d8868ef8c82b3083fc7396be5e8c3963"
+
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.7.bb b/meta/recipes-connectivity/bluez5/bluez5_5.7.bb
deleted file mode 100644
index 6e2850d..0000000
--- a/meta/recipes-connectivity/bluez5/bluez5_5.7.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require bluez5.inc
-
-SRC_URI[md5sum] = "ce0ef43938e8bfc230f3f06d6ad02d7e"
-SRC_URI[sha256sum] = "902299204b7139c913765603c7054a604570aea9e9fddb30454bd1b5e5997860"
-
-- 
1.8.1.2


