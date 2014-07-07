Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6A18570373
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jul 2014 15:36:50 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 07 Jul 2014 08:36:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,618,1400050800"; d="scan'208";a="558373868"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 07 Jul 2014 08:36:37 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jul 2014 18:36:27 +0300
Message-Id: <aeac3d6af3f0b6d4c68cc2cff46f1e51845e32b9.1404747336.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1404747336.git.cristian.iorga@intel.com>
References: <cover.1404747336.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1404747336.git.cristian.iorga@intel.com>
References: <cover.1404747336.git.cristian.iorga@intel.com>
Subject: [PATCH 1/2] bluez5: upgrade to 5.21
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
X-List-Received-Date: Mon, 07 Jul 2014 15:36:53 -0000

Bug fixes;
Features parity with Bluedroid and additional
support for Bluetooth 4.1 core technology and
upgraded profiles including HFP 1.6 + Wideband speech,
A2DP 1.3, AVRCP 1.5 and MPS;
It also provides full integration for aptX(R)
high-quality low-latency codec from CSR (codec license not included).

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-connectivity/bluez5/bluez5_5.20.bb | 3 ---
 meta/recipes-connectivity/bluez5/bluez5_5.21.bb | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.20.bb
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.21.bb

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.20.bb b/meta/recipes-connectivity/bluez5/bluez5_5.20.bb
deleted file mode 100644
index 1f4476a..0000000
--- a/meta/recipes-connectivity/bluez5/bluez5_5.20.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require bluez5.inc
-SRC_URI[md5sum] = "177d4551f76e5933cc467c3abc6d3796"
-SRC_URI[sha256sum] = "531fbaa0a9baf7b1f76fb8fd8975c20d3cc61cdc772a39d63df1d6abfc2a7481"
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.21.bb b/meta/recipes-connectivity/bluez5/bluez5_5.21.bb
new file mode 100644
index 0000000..5b0102e
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.21.bb
@@ -0,0 +1,3 @@
+require bluez5.inc
+SRC_URI[md5sum] = "d5a0d05520e013f2394bf1d0bac12889"
+SRC_URI[sha256sum] = "81eb073516f39ff1fa02fa40120e834f40fdb0b772f8f4153a9ab566cc0a1f4f"
-- 
1.9.1


