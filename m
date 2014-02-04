Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E6C7A6E44F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2014 15:58:43 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 04 Feb 2014 07:54:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,780,1384329600"; d="scan'208";a="449602536"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga001.jf.intel.com with ESMTP; 04 Feb 2014 07:58:44 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Feb 2014 18:01:31 +0200
Message-Id: <8cee9cea2bec05d45035b574df1211426a4212af.1391529644.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1391529644.git.cristian.iorga@intel.com>
References: <cover.1391529644.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1391529644.git.cristian.iorga@intel.com>
References: <cover.1391529644.git.cristian.iorga@intel.com>
Subject: [PATCH 2/2] bluez5: upgrade to 5.14
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
X-List-Received-Date: Tue, 04 Feb 2014 15:58:44 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-connectivity/bluez5/bluez5_5.13.bb | 5 -----
 meta/recipes-connectivity/bluez5/bluez5_5.14.bb | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.13.bb
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.14.bb

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.13.bb b/meta/recipes-connectivity/bluez5/bluez5_5.13.bb
deleted file mode 100644
index b8e4f6a..0000000
--- a/meta/recipes-connectivity/bluez5/bluez5_5.13.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require bluez5.inc
-
-SRC_URI[md5sum] = "c68f8cb270110256a684403ee43b5f79"
-SRC_URI[sha256sum] = "4581beedde485246b16e2b4665d60f3fe041284b5d5afc3a0a818604ad525ad3"
-
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.14.bb b/meta/recipes-connectivity/bluez5/bluez5_5.14.bb
new file mode 100644
index 0000000..d0baaec
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.14.bb
@@ -0,0 +1,5 @@
+require bluez5.inc
+
+SRC_URI[md5sum] = "81f2ce3bc9a9ebe58ccfce6660031611"
+SRC_URI[sha256sum] = "5a485837c215f3093d3a98cb412dc99e1139f88a66c8809bdf183ad5e676395f"
+
-- 
1.8.3.2


