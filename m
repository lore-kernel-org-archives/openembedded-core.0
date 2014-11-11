Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3ABF065DA3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 08:46:36 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 11 Nov 2014 00:46:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,359,1413270000"; d="scan'208";a="630016418"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by fmsmga002.fm.intel.com with ESMTP; 11 Nov 2014 00:46:35 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Nov 2014 10:46:24 +0200
Message-Id: <9ae28c5092b74d16383220de9e478b3b1322b0d0.1415695544.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1415695544.git.cristian.iorga@intel.com>
References: <cover.1415695544.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1415695544.git.cristian.iorga@intel.com>
References: <cover.1415695544.git.cristian.iorga@intel.com>
Subject: [PATCH 3/4] bluez5: upgrade to 5.25
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
X-List-Received-Date: Tue, 11 Nov 2014 08:46:43 -0000

- Cleanups and minor fixes;
- Phonebook Access Profile 1.2 and Message Access Profile 1.2 features and improvements;
- Various GATT related fixes;
- Fix for a race condition which could occasionally cause LE connection/pairing failures.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-connectivity/bluez5/bluez5_5.22.bb | 3 ---
 meta/recipes-connectivity/bluez5/bluez5_5.25.bb | 4 ++++
 2 files changed, 4 insertions(+), 3 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.22.bb
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.25.bb

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.22.bb b/meta/recipes-connectivity/bluez5/bluez5_5.22.bb
deleted file mode 100644
index 04116ed..0000000
--- a/meta/recipes-connectivity/bluez5/bluez5_5.22.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require bluez5.inc
-SRC_URI[md5sum] = "fd0783c8bc524bc9b26514aad1f85814"
-SRC_URI[sha256sum] = "e8b866515a18116c7048a55081be9238a51447c9448ed20997b0432b13ba0882"
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.25.bb b/meta/recipes-connectivity/bluez5/bluez5_5.25.bb
new file mode 100644
index 0000000..ec58857
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.25.bb
@@ -0,0 +1,4 @@
+require bluez5.inc
+SRC_URI[md5sum] = "41bd0c915abde255622150ce6dcae67b"
+SRC_URI[sha256sum] = "5ca62f3f45e2638a0f7a81658d6c8813ee01487436ae8e53e9fe395e23d1fd30"
+
-- 
2.1.0


