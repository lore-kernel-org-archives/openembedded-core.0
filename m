Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A69136DCFF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2014 15:29:57 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 06 Feb 2014 07:29:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,793,1384329600"; d="scan'208";a="450785147"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga001.jf.intel.com with ESMTP; 06 Feb 2014 07:29:40 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Feb 2014 17:29:22 +0200
Message-Id: <720dd0e26e7940388d3f21160d6d5c8e61f703d0.1391699953.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1391699953.git.laurentiu.palcu@intel.com>
References: <cover.1391699953.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1391699953.git.laurentiu.palcu@intel.com>
References: <cover.1391699953.git.laurentiu.palcu@intel.com>
Subject: [PATCH 03/13] gdb: upgrade to 7.6.2
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
X-List-Received-Date: Thu, 06 Feb 2014 15:29:58 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../gdb/{gdb-7.6.1.inc => gdb-7.6.2.inc}           |    4 ++--
 ...nadian_7.6.1.bb => gdb-cross-canadian_7.6.2.bb} |    0
 .../gdb/{gdb-cross_7.6.1.bb => gdb-cross_7.6.2.bb} |    0
 .../gdb/{gdb_7.6.1.bb => gdb_7.6.2.bb}             |    0
 4 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-7.6.1.inc => gdb-7.6.2.inc} (74%)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_7.6.1.bb => gdb-cross-canadian_7.6.2.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_7.6.1.bb => gdb-cross_7.6.2.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb_7.6.1.bb => gdb_7.6.2.bb} (100%)

diff --git a/meta/recipes-devtools/gdb/gdb-7.6.1.inc b/meta/recipes-devtools/gdb/gdb-7.6.2.inc
similarity index 74%
rename from meta/recipes-devtools/gdb/gdb-7.6.1.inc
rename to meta/recipes-devtools/gdb/gdb-7.6.2.inc
index 6fd953a..ea69b39 100644
--- a/meta/recipes-devtools/gdb/gdb-7.6.1.inc
+++ b/meta/recipes-devtools/gdb/gdb-7.6.2.inc
@@ -8,5 +8,5 @@ SRC_URI += " file://gdb-fix-cygwin-check-in-configure-script.patch "
 
 S = "${WORKDIR}/${BPN}-${PV}"
 
-SRC_URI[md5sum] = "d42841167fd061d90fddf9a7212a1f9f"
-SRC_URI[sha256sum] = "3ccf7f618536f89648ba89e322fc3c0946bc15c03ca09c32fd9e71bbca68104b"
+SRC_URI[md5sum] = "9ebf09fa76e4ca6034157086e9b20348"
+SRC_URI[sha256sum] = "17f7bcda1b24336aadcb1c5e703c355551e59467e221c6f4353b720dffad73a7"
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.6.1.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.6.2.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_7.6.1.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_7.6.2.bb
diff --git a/meta/recipes-devtools/gdb/gdb-cross_7.6.1.bb b/meta/recipes-devtools/gdb/gdb-cross_7.6.2.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross_7.6.1.bb
rename to meta/recipes-devtools/gdb/gdb-cross_7.6.2.bb
diff --git a/meta/recipes-devtools/gdb/gdb_7.6.1.bb b/meta/recipes-devtools/gdb/gdb_7.6.2.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb_7.6.1.bb
rename to meta/recipes-devtools/gdb/gdb_7.6.2.bb
-- 
1.7.9.5


