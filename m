Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 18CD86D636
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2013 10:15:30 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 05 Nov 2013 02:11:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,638,1378882800"; d="scan'208";a="422445347"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.90])
	by fmsmga001.fm.intel.com with ESMTP; 05 Nov 2013 02:15:24 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Nov 2013 10:15:20 +0000
Message-Id: <08de82e76886a97ddcd7a638b697ef45f56566d8.1383646398.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1383646398.git.paul.eggleton@linux.intel.com>
References: <cover.1383646398.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1383646398.git.paul.eggleton@linux.intel.com>
References: <cover.1383646398.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] zisofs-tools-native: fix meta fields
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
X-List-Received-Date: Tue, 05 Nov 2013 10:15:30 -0000

* Drop redundant DESCRIPTION (same as SUMMARY)
* Set SUMMARY to slightly more descriptive value borrowed from Fedora
* Fix HOMEPAGE URL (repeated http://)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-devtools/zisofs-tools/zisofs-tools-native_1.0.8.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/zisofs-tools/zisofs-tools-native_1.0.8.bb b/meta/recipes-devtools/zisofs-tools/zisofs-tools-native_1.0.8.bb
index 02accf6..021c058 100644
--- a/meta/recipes-devtools/zisofs-tools/zisofs-tools-native_1.0.8.bb
+++ b/meta/recipes-devtools/zisofs-tools/zisofs-tools-native_1.0.8.bb
@@ -1,8 +1,7 @@
 # zisofs-tools-native OE build file
 # Copyright (C) 1989, 1991 Free Software Foundation, Inc.
-SUMMARY = "A set of tools for iso file compression"
-DESCRIPTION = "A set of tools for iso file compression"
-HOMEPAGE = "http://http://freecode.com/projects/zisofs-tools"
+SUMMARY = "Utilities for creating compressed CD-ROM filesystems"
+HOMEPAGE = "http://freecode.com/projects/zisofs-tools"
 SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-- 
1.8.1.2


