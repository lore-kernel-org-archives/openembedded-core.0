Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 361306F1BA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 16:05:38 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 27 Feb 2014 08:05:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,555,1389772800"; d="scan'208";a="463509405"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga001.jf.intel.com with ESMTP; 27 Feb 2014 08:04:40 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Feb 2014 18:07:31 +0200
Message-Id: <7cbefd872c43bd5dccb70df626d1d8bf255c6a2a.1393517205.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1393517205.git.cristian.iorga@intel.com>
References: <cover.1393517205.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1393517205.git.cristian.iorga@intel.com>
References: <cover.1393517205.git.cristian.iorga@intel.com>
Subject: [PATCH 2/4] bluez5: upgrade to 5.15
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
X-List-Received-Date: Thu, 27 Feb 2014 16:05:38 -0000

- Bugfixes;
- BT LE bugfixes and improvements.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-connectivity/bluez5/bluez5_5.14.bb | 5 -----
 meta/recipes-connectivity/bluez5/bluez5_5.15.bb | 4 ++++
 2 files changed, 4 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.14.bb
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.15.bb

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.14.bb b/meta/recipes-connectivity/bluez5/bluez5_5.14.bb
deleted file mode 100644
index d0baaec..0000000
--- a/meta/recipes-connectivity/bluez5/bluez5_5.14.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require bluez5.inc
-
-SRC_URI[md5sum] = "81f2ce3bc9a9ebe58ccfce6660031611"
-SRC_URI[sha256sum] = "5a485837c215f3093d3a98cb412dc99e1139f88a66c8809bdf183ad5e676395f"
-
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.15.bb b/meta/recipes-connectivity/bluez5/bluez5_5.15.bb
new file mode 100644
index 0000000..85735f0
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.15.bb
@@ -0,0 +1,4 @@
+require bluez5.inc
+SRC_URI[md5sum] = "92e29e51b361aab78cca30ef0cf8812e"
+SRC_URI[sha256sum] = "487bd75697e565793bf5bc4fbd5fa6a602788313b0c694f7542b81689fc0aa87"
+
-- 
1.8.3.2


