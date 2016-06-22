Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9D96D731BE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 11:52:36 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 Jun 2016 04:52:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,509,1459839600"; d="scan'208";a="1002968780"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 22 Jun 2016 04:52:37 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jun 2016 14:52:24 +0300
Message-Id: <763ed8dd8982d5ea1be2753c2f20e3d0d90cc0ff.1466595928.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <d54f69d5faec48cd7dda7efbbc1b7fdd0bb0bd65.1466595928.git.jussi.kukkonen@intel.com>
References: <d54f69d5faec48cd7dda7efbbc1b7fdd0bb0bd65.1466595928.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1466595928.git.jussi.kukkonen@intel.com>
References: <cover.1466595928.git.jussi.kukkonen@intel.com>
Subject: [PATCH 05/10] clutter-gtk-1.0: Upgrade 1.6.6 -> 1.8.0
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
X-List-Received-Date: Wed, 22 Jun 2016 11:52:36 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/clutter/clutter-gtk-1.0_1.6.6.bb | 6 ------
 meta/recipes-graphics/clutter/clutter-gtk-1.0_1.8.0.bb | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gtk-1.0_1.6.6.bb
 create mode 100644 meta/recipes-graphics/clutter/clutter-gtk-1.0_1.8.0.bb

diff --git a/meta/recipes-graphics/clutter/clutter-gtk-1.0_1.6.6.bb b/meta/recipes-graphics/clutter/clutter-gtk-1.0_1.6.6.bb
deleted file mode 100644
index 23257bb..0000000
--- a/meta/recipes-graphics/clutter/clutter-gtk-1.0_1.6.6.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require clutter-gtk-1.0.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
-
-SRC_URI[archive.md5sum] = "79dc3d7a8645f87d83a9ccca8a08aa8e"
-SRC_URI[archive.sha256sum] = "9440a68600f58d00fe0af35383738943e8ead9907f4cf507a102d96822434a28"
diff --git a/meta/recipes-graphics/clutter/clutter-gtk-1.0_1.8.0.bb b/meta/recipes-graphics/clutter/clutter-gtk-1.0_1.8.0.bb
new file mode 100644
index 0000000..675365c
--- /dev/null
+++ b/meta/recipes-graphics/clutter/clutter-gtk-1.0_1.8.0.bb
@@ -0,0 +1,6 @@
+require clutter-gtk-1.0.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
+
+SRC_URI[archive.md5sum] = "351cf9229cf941d36b441ede2236d742"
+SRC_URI[archive.sha256sum] = "742ef9d68ece36cbb1b2e1a4a6fbdad932f6645360be7e6de75abbb140dfbf1d"
-- 
2.1.4


