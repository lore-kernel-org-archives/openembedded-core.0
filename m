Return-Path: <ionutx.radu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 4CC9B6B01A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 07:08:16 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Jul 2013 00:08:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1000,1363158000"; d="scan'208";a="327059398"
Received: from work.rb.intel.com ([10.237.105.51])
	by azsmga001.ch.intel.com with ESMTP; 05 Jul 2013 00:08:16 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jul 2013 10:10:19 +0300
Message-Id: <96fc0fdb655ab0a3c09c11f4f6977448991570b2.1372952884.git.ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1372952884.git.ionutx.radu@intel.com>
References: <cover.1372952884.git.ionutx.radu@intel.com>
In-Reply-To: <cover.1372952884.git.ionutx.radu@intel.com>
References: <cover.1372952884.git.ionutx.radu@intel.com>
Subject: [PATCH 02/10] augeas: Update from 1.0.0 to 1.1.0
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
X-List-Received-Date: Fri, 05 Jul 2013 07:08:16 -0000

Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
---
 meta/recipes-extended/augeas/augeas_1.0.0.bb |    6 ------
 meta/recipes-extended/augeas/augeas_1.1.0.bb |    6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-extended/augeas/augeas_1.0.0.bb
 create mode 100644 meta/recipes-extended/augeas/augeas_1.1.0.bb

diff --git a/meta/recipes-extended/augeas/augeas_1.0.0.bb b/meta/recipes-extended/augeas/augeas_1.0.0.bb
deleted file mode 100644
index 82bda19..0000000
--- a/meta/recipes-extended/augeas/augeas_1.0.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require augeas.inc
-
-PR = "r1"
-
-SRC_URI[md5sum] = "82131019432ecf8102e1491610ad2dd1"
-SRC_URI[sha256sum] = "31bf757c5b8197765946b3805f3793c32b03cd92a7a77ec95d37e71a1f131912"
diff --git a/meta/recipes-extended/augeas/augeas_1.1.0.bb b/meta/recipes-extended/augeas/augeas_1.1.0.bb
new file mode 100644
index 0000000..5eebcc6
--- /dev/null
+++ b/meta/recipes-extended/augeas/augeas_1.1.0.bb
@@ -0,0 +1,6 @@
+require augeas.inc
+
+PR = "r1"
+
+SRC_URI[md5sum] = "520ce983457ff9ffa3816bc41a9f328b"
+SRC_URI[sha256sum] = "9d81e4228329e2d5cccb018ab06bc8b734fb2dede2c4d9b5c02303d4a690b76b"
-- 
1.7.10.4


