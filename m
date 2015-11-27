Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8F3116ABFC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 12:07:12 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 27 Nov 2015 04:07:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,351,1444719600"; d="scan'208";a="860460903"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 27 Nov 2015 04:07:13 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Nov 2015 14:10:37 +0200
Message-Id: <ecbecfd0e88cbe19a8568ca66c7072cb79d2e6ab.1448625307.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <338e77cbca9b7de1c5638e59b440f0da85087835.1448625307.git.jussi.kukkonen@intel.com>
References: <338e77cbca9b7de1c5638e59b440f0da85087835.1448625307.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1448625307.git.jussi.kukkonen@intel.com>
References: <cover.1448625307.git.jussi.kukkonen@intel.com>
Subject: [PATCH 04/10] clutter-gtk-1.0: Upgrade 1.6.2 -> 1.6.6
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
X-List-Received-Date: Fri, 27 Nov 2015 12:07:12 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/clutter/clutter-gtk-1.0_1.6.2.bb | 6 ------
 meta/recipes-graphics/clutter/clutter-gtk-1.0_1.6.6.bb | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gtk-1.0_1.6.2.bb
 create mode 100644 meta/recipes-graphics/clutter/clutter-gtk-1.0_1.6.6.bb

diff --git a/meta/recipes-graphics/clutter/clutter-gtk-1.0_1.6.2.bb b/meta/recipes-graphics/clutter/clutter-gtk-1.0_1.6.2.bb
deleted file mode 100644
index 530ea18..0000000
--- a/meta/recipes-graphics/clutter/clutter-gtk-1.0_1.6.2.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require clutter-gtk-1.0.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
-
-SRC_URI[archive.md5sum] = "557d814c3e70cc3a2d1cf3816919b14f"
-SRC_URI[archive.sha256sum] = "bbd03dfa9a20102d5cdb440513b0a035933da557ad7e9da31546034de2daf069"
diff --git a/meta/recipes-graphics/clutter/clutter-gtk-1.0_1.6.6.bb b/meta/recipes-graphics/clutter/clutter-gtk-1.0_1.6.6.bb
new file mode 100644
index 0000000..23257bb
--- /dev/null
+++ b/meta/recipes-graphics/clutter/clutter-gtk-1.0_1.6.6.bb
@@ -0,0 +1,6 @@
+require clutter-gtk-1.0.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
+
+SRC_URI[archive.md5sum] = "79dc3d7a8645f87d83a9ccca8a08aa8e"
+SRC_URI[archive.sha256sum] = "9440a68600f58d00fe0af35383738943e8ead9907f4cf507a102d96822434a28"
-- 
2.1.4


