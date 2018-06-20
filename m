Return-Path: <maxin.john@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id D8AAE7548B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2018 14:07:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jun 2018 07:07:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,247,1526367600"; d="scan'208";a="68556392"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 20 Jun 2018 07:07:23 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 0F0A8580142
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2018 07:07:22 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jun 2018 17:07:18 +0300
Message-Id: <1529503642-7158-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/5] ofono: upgrade 1.23 -> 1.24
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
X-List-Received-Date: Wed, 20 Jun 2018 14:07:23 -0000

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-connectivity/ofono/ofono_1.23.bb | 9 ---------
 meta/recipes-connectivity/ofono/ofono_1.24.bb | 9 +++++++++
 2 files changed, 9 insertions(+), 9 deletions(-)
 delete mode 100644 meta/recipes-connectivity/ofono/ofono_1.23.bb
 create mode 100644 meta/recipes-connectivity/ofono/ofono_1.24.bb

diff --git a/meta/recipes-connectivity/ofono/ofono_1.23.bb b/meta/recipes-connectivity/ofono/ofono_1.23.bb
deleted file mode 100644
index e04162c..0000000
--- a/meta/recipes-connectivity/ofono/ofono_1.23.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require ofono.inc
-
-SRC_URI  = "\
-  ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
-  file://ofono \
-  file://use-python3.patch \
-"
-SRC_URI[md5sum] = "27ea2f1a155231af49d520486b8ebc05"
-SRC_URI[sha256sum] = "4dacdc61571aad7ce8b4412ed51d03bec3d4060b93ee68f8c69b26b223bdc975"
diff --git a/meta/recipes-connectivity/ofono/ofono_1.24.bb b/meta/recipes-connectivity/ofono/ofono_1.24.bb
new file mode 100644
index 0000000..be7d9ea
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono_1.24.bb
@@ -0,0 +1,9 @@
+require ofono.inc
+
+SRC_URI  = "\
+  ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
+  file://ofono \
+  file://use-python3.patch \
+"
+SRC_URI[md5sum] = "be24e80f6551f46fea0c5b5879964d6c"
+SRC_URI[sha256sum] = "9c8e351b7658f4b43f9a4380b731c47d2d7544a89987c48c3f227e73636c87ae"
-- 
2.4.0


