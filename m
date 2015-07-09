Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9EC4573B10
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 07:52:08 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 09 Jul 2015 00:52:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,438,1432623600"; d="scan'208";a="761101069"
Received: from theory.fi.intel.com ([10.237.72.51])
	by orsmga002.jf.intel.com with ESMTP; 09 Jul 2015 00:52:03 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jul 2015 10:52:46 +0300
Message-Id: <d8300642075820906b1b54f2b5609dac5db04157.1436427694.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <52cb25bbbd0e0fc90193b412850d018828aa33da.1436427694.git.jussi.kukkonen@intel.com>
References: <52cb25bbbd0e0fc90193b412850d018828aa33da.1436427694.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1436427694.git.jussi.kukkonen@intel.com>
References: <cover.1436427694.git.jussi.kukkonen@intel.com>
Subject: [PATCH 5/5] clutter-gtk-1.0: Upgrade 1.4.4 -> 1.6.2
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
X-List-Received-Date: Thu, 09 Jul 2015 07:52:08 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/clutter/clutter-gtk-1.0_1.4.4.bb | 6 ------
 meta/recipes-graphics/clutter/clutter-gtk-1.0_1.6.2.bb | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gtk-1.0_1.4.4.bb
 create mode 100644 meta/recipes-graphics/clutter/clutter-gtk-1.0_1.6.2.bb

diff --git a/meta/recipes-graphics/clutter/clutter-gtk-1.0_1.4.4.bb b/meta/recipes-graphics/clutter/clutter-gtk-1.0_1.4.4.bb
deleted file mode 100644
index 37a035c..0000000
--- a/meta/recipes-graphics/clutter/clutter-gtk-1.0_1.4.4.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require clutter-gtk-1.0.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
-
-SRC_URI[archive.md5sum] = "ef50b52ffc2a18704eb62f13dd8d6198"
-SRC_URI[archive.sha256sum] = "bc3108594a01a08bb6d9b538afe995e4fd78634a8356064ee8137d87aad51b2e"
diff --git a/meta/recipes-graphics/clutter/clutter-gtk-1.0_1.6.2.bb b/meta/recipes-graphics/clutter/clutter-gtk-1.0_1.6.2.bb
new file mode 100644
index 0000000..530ea18
--- /dev/null
+++ b/meta/recipes-graphics/clutter/clutter-gtk-1.0_1.6.2.bb
@@ -0,0 +1,6 @@
+require clutter-gtk-1.0.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
+
+SRC_URI[archive.md5sum] = "557d814c3e70cc3a2d1cf3816919b14f"
+SRC_URI[archive.sha256sum] = "bbd03dfa9a20102d5cdb440513b0a035933da557ad7e9da31546034de2daf069"
-- 
2.1.4


