Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 49F29773AA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 16:03:34 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 25 Feb 2016 08:02:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,498,1449561600"; d="scan'208";a="659220258"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Feb 2016 08:02:40 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Feb 2016 17:59:36 +0200
Message-Id: <4a59a38a38f5049c0f05d4e96f4430f2fb45cb59.1456415870.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
References: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
References: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 19/19] shared-mime-info: update to 1.6
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
X-List-Received-Date: Thu, 25 Feb 2016 16:03:34 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../{shared-mime-info_1.5.bb => shared-mime-info_1.6.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/shared-mime-info/{shared-mime-info_1.5.bb => shared-mime-info_1.6.bb} (43%)

diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_1.5.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_1.6.bb
similarity index 43%
rename from meta/recipes-support/shared-mime-info/shared-mime-info_1.5.bb
rename to meta/recipes-support/shared-mime-info/shared-mime-info_1.6.bb
index c659a3a..2cf5041 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_1.5.bb
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_1.6.bb
@@ -3,5 +3,5 @@ require shared-mime-info.inc
 SRC_URI += "file://parallelmake.patch \
 	    file://install-data-hook.patch"
 
-SRC_URI[md5sum] = "cc3e78d8bceaf2b361f62d67a8b4dda4"
-SRC_URI[sha256sum] = "d6412840eb265bf36e61fd7b6fc6bea21b0f58cb22bed16f2ccccdd54bea4180"
+SRC_URI[md5sum] = "10abc5c4e6b22223ff05c3bd70ff9e8f"
+SRC_URI[sha256sum] = "b2f8f85b6467933824180d0252bbcaee523f550a8fbc95cc4391bd43c03bc34c"
-- 
2.7.0


