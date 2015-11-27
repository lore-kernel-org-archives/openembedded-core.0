Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id F05AD6E64A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 12:07:20 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 27 Nov 2015 04:07:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,351,1444719600"; d="scan'208";a="860460974"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 27 Nov 2015 04:07:22 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Nov 2015 14:10:43 +0200
Message-Id: <da664b4c789caa9fa847568ed11f21539f2052fb.1448625307.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <338e77cbca9b7de1c5638e59b440f0da85087835.1448625307.git.jussi.kukkonen@intel.com>
References: <338e77cbca9b7de1c5638e59b440f0da85087835.1448625307.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1448625307.git.jussi.kukkonen@intel.com>
References: <cover.1448625307.git.jussi.kukkonen@intel.com>
Subject: [PATCH 10/10] dropbear: Upgrade 2015.68 -> 2015.70
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
X-List-Received-Date: Fri, 27 Nov 2015 12:07:21 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-core/dropbear/dropbear_2015.68.bb | 4 ----
 meta/recipes-core/dropbear/dropbear_2015.70.bb | 5 +++++
 2 files changed, 5 insertions(+), 4 deletions(-)
 delete mode 100644 meta/recipes-core/dropbear/dropbear_2015.68.bb
 create mode 100644 meta/recipes-core/dropbear/dropbear_2015.70.bb

diff --git a/meta/recipes-core/dropbear/dropbear_2015.68.bb b/meta/recipes-core/dropbear/dropbear_2015.68.bb
deleted file mode 100644
index 1b749d7..0000000
--- a/meta/recipes-core/dropbear/dropbear_2015.68.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require dropbear.inc
-
-SRC_URI[md5sum] = "7664ac10f7cc2301c530eb80c756fc5d"
-SRC_URI[sha256sum] = "55ea7c1e904ffe4b1cdbe1addca8291a2533d7d285fd22ac33608e9502a62446"
diff --git a/meta/recipes-core/dropbear/dropbear_2015.70.bb b/meta/recipes-core/dropbear/dropbear_2015.70.bb
new file mode 100644
index 0000000..3da8d5f
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear_2015.70.bb
@@ -0,0 +1,5 @@
+require dropbear.inc
+
+SRC_URI[md5sum] = "0b0a1d9be6a094710d884209562a626c"
+SRC_URI[sha256sum] = "62a8cc3df1d0f136d46f50d4f8d92f7ab7ce1addac76b25446b3f6aaf80bf257"
+
-- 
2.1.4


