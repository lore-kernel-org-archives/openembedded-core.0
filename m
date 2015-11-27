Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4F718606A8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 12:07:18 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 27 Nov 2015 04:07:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,351,1444719600"; d="scan'208";a="860460945"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 27 Nov 2015 04:07:19 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Nov 2015 14:10:41 +0200
Message-Id: <82fef55b928ac8f6993e65d0c420bad8beede220.1448625307.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <338e77cbca9b7de1c5638e59b440f0da85087835.1448625307.git.jussi.kukkonen@intel.com>
References: <338e77cbca9b7de1c5638e59b440f0da85087835.1448625307.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1448625307.git.jussi.kukkonen@intel.com>
References: <cover.1448625307.git.jussi.kukkonen@intel.com>
Subject: [PATCH 08/10] shared-mime-info: Upgrade 1.4 -> 1.5
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
X-List-Received-Date: Fri, 27 Nov 2015 12:07:18 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../{shared-mime-info_1.4.bb => shared-mime-info_1.5.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/shared-mime-info/{shared-mime-info_1.4.bb => shared-mime-info_1.5.bb} (43%)

diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_1.4.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_1.5.bb
similarity index 43%
rename from meta/recipes-support/shared-mime-info/shared-mime-info_1.4.bb
rename to meta/recipes-support/shared-mime-info/shared-mime-info_1.5.bb
index 8c4fde8..c659a3a 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_1.4.bb
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_1.5.bb
@@ -3,5 +3,5 @@ require shared-mime-info.inc
 SRC_URI += "file://parallelmake.patch \
 	    file://install-data-hook.patch"
 
-SRC_URI[md5sum] = "16c02f7b658fff2a9c207406d388ea31"
-SRC_URI[sha256sum] = "bbc0bd023f497dfd75e1ca73441cbbb5a63617d9e14f2790b868361cc055b5b1"
+SRC_URI[md5sum] = "cc3e78d8bceaf2b361f62d67a8b4dda4"
+SRC_URI[sha256sum] = "d6412840eb265bf36e61fd7b6fc6bea21b0f58cb22bed16f2ccccdd54bea4180"
-- 
2.1.4


