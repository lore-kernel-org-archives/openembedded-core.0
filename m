Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 20DB26BE56
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2014 14:27:40 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 03 Jan 2014 06:27:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,598,1384329600"; d="scan'208";a="459627827"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jan 2014 06:27:40 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jan 2014 16:30:11 +0200
Message-Id: <0e3017f9a18104babac613e0343c8bd22e7b884f.1388759244.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1388759244.git.cristian.iorga@intel.com>
References: <cover.1388759244.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1388759244.git.cristian.iorga@intel.com>
References: <cover.1388759244.git.cristian.iorga@intel.com>
Subject: [PATCH 8/8] bluez5: upgrade to 5.13
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
X-List-Received-Date: Fri, 03 Jan 2014 14:27:40 -0000

Further features added to various
Android HALs (Core, Socket, PAN and HID).
Bug fixes.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-connectivity/bluez5/bluez5_5.12.bb | 5 -----
 meta/recipes-connectivity/bluez5/bluez5_5.13.bb | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.12.bb
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.13.bb

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.12.bb b/meta/recipes-connectivity/bluez5/bluez5_5.12.bb
deleted file mode 100644
index 126ab11..0000000
--- a/meta/recipes-connectivity/bluez5/bluez5_5.12.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require bluez5.inc
-
-SRC_URI[md5sum] = "5d37e581107b3d6f91b81194a5006407"
-SRC_URI[sha256sum] = "75ef574f15f356d03bd54f1a8ba26abe63bf3d1326a9fa12d63a762ddf40617e"
-
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.13.bb b/meta/recipes-connectivity/bluez5/bluez5_5.13.bb
new file mode 100644
index 0000000..b8e4f6a
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.13.bb
@@ -0,0 +1,5 @@
+require bluez5.inc
+
+SRC_URI[md5sum] = "c68f8cb270110256a684403ee43b5f79"
+SRC_URI[sha256sum] = "4581beedde485246b16e2b4665d60f3fe041284b5d5afc3a0a818604ad525ad3"
+
-- 
1.8.3.2


