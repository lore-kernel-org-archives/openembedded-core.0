Return-Path: <maxin.john@intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 34BCE7488E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 15:33:43 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2018 08:33:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,406,1517904000"; d="scan'208";a="30664343"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga007.jf.intel.com with ESMTP; 04 Apr 2018 08:33:43 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 278BB5801C0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 08:33:42 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Apr 2018 18:32:21 +0300
Message-Id: <1522855946-8702-5-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1522855946-8702-1-git-send-email-maxin.john@intel.com>
References: <1522855946-8702-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 05/10] ofono: upgrade to version 1.23
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
X-List-Received-Date: Wed, 04 Apr 2018 15:33:43 -0000

1.22 -> 1.23

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-connectivity/ofono/ofono_1.22.bb | 9 ---------
 meta/recipes-connectivity/ofono/ofono_1.23.bb | 9 +++++++++
 2 files changed, 9 insertions(+), 9 deletions(-)
 delete mode 100644 meta/recipes-connectivity/ofono/ofono_1.22.bb
 create mode 100644 meta/recipes-connectivity/ofono/ofono_1.23.bb

diff --git a/meta/recipes-connectivity/ofono/ofono_1.22.bb b/meta/recipes-connectivity/ofono/ofono_1.22.bb
deleted file mode 100644
index e57eaa7..0000000
--- a/meta/recipes-connectivity/ofono/ofono_1.22.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require ofono.inc
-
-SRC_URI  = "\
-  ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
-  file://ofono \
-  file://use-python3.patch \
-"
-SRC_URI[md5sum] = "2a683ab8e98448ad8bc5dc9868d2893e"
-SRC_URI[sha256sum] = "8e34a6696c300c9841b55e8dff640bd3096e49f5dbe55bbebaa69a71676f687e"
diff --git a/meta/recipes-connectivity/ofono/ofono_1.23.bb b/meta/recipes-connectivity/ofono/ofono_1.23.bb
new file mode 100644
index 0000000..e04162c
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono_1.23.bb
@@ -0,0 +1,9 @@
+require ofono.inc
+
+SRC_URI  = "\
+  ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
+  file://ofono \
+  file://use-python3.patch \
+"
+SRC_URI[md5sum] = "27ea2f1a155231af49d520486b8ebc05"
+SRC_URI[sha256sum] = "4dacdc61571aad7ce8b4412ed51d03bec3d4060b93ee68f8c69b26b223bdc975"
-- 
2.4.0


