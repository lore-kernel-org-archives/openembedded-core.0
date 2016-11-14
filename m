Return-Path: <edwin.plauchu.camacho@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 7959B719BE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 16:30:04 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga105.jf.intel.com with ESMTP; 14 Nov 2016 08:30:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,491,1473145200"; d="scan'208";a="1068286245"
Received: from pianodaemon-contraption.zpn.intel.com ([10.219.128.75])
	by fmsmga001.fm.intel.com with ESMTP; 14 Nov 2016 08:30:05 -0800
From: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Nov 2016 10:31:25 -0600
Message-Id: <20161114163125.20090-1-edwin.plauchu.camacho@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Cc: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
Subject: [PATCH] python3-pygobject: upgrade to 3.22.0
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
X-List-Received-Date: Mon, 14 Nov 2016 16:30:07 -0000


Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>

---
 .../{python3-pygobject_3.20.1.bb => python3-pygobject_3.22.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pygobject_3.20.1.bb => python3-pygobject_3.22.0.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.20.1.bb b/meta/recipes-devtools/python/python3-pygobject_3.22.0.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-pygobject_3.20.1.bb
rename to meta/recipes-devtools/python/python3-pygobject_3.22.0.bb
index cda16f1..e052f11 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.20.1.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.22.0.bb
@@ -13,8 +13,8 @@ SRC_URI = " \
     file://0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch \
 "
 
-SRC_URI[md5sum] = "4354c6283b135f859563b72457f6a321"
-SRC_URI[sha256sum] = "3d261005d6fed6a92ac4c25f283792552f7dad865d1b7e0c03c2b84c04dbd745"
+SRC_URI[md5sum] = "ed4117ed5d554d25fd7718807fbf819f"
+SRC_URI[sha256sum] = "08b29cfb08efc80f7a8630a2734dec65a99c1b59f1e5771c671d2e4ed8a5cbe7"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


