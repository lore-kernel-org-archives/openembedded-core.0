Return-Path: <valentin.popa@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B876F6CE77
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 08:50:52 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 29 Oct 2013 01:50:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,591,1378882800"; d="scan'208";a="424407701"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.58])
	by fmsmga002.fm.intel.com with ESMTP; 29 Oct 2013 01:50:51 -0700
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Oct 2013 10:52:10 +0200
Message-Id: <1383036730-25150-1-git-send-email-valentin.popa@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] libxv: upgrade to 1.0.10
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
X-List-Received-Date: Tue, 29 Oct 2013 08:50:53 -0000

Signed-off-by: Valentin Popa <valentin.popa@intel.com>
---
 meta/recipes-graphics/xorg-lib/{libxv_1.0.9.bb => libxv_1.0.10.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxv_1.0.9.bb => libxv_1.0.10.bb} (78%)

diff --git a/meta/recipes-graphics/xorg-lib/libxv_1.0.9.bb b/meta/recipes-graphics/xorg-lib/libxv_1.0.10.bb
similarity index 78%
rename from meta/recipes-graphics/xorg-lib/libxv_1.0.9.bb
rename to meta/recipes-graphics/xorg-lib/libxv_1.0.10.bb
index f46bc2d..cc6c638 100644
--- a/meta/recipes-graphics/xorg-lib/libxv_1.0.9.bb
+++ b/meta/recipes-graphics/xorg-lib/libxv_1.0.10.bb
@@ -14,5 +14,5 @@ DEPENDS += "libxext videoproto"
 
 XORG_PN = "libXv"
 
-SRC_URI[md5sum] = "3f642e1d868a2289769b983cf346e7bb"
-SRC_URI[sha256sum] = "a874dbf864d0271bbe795af67ef5b3f20096c92fc11eacbf0d2af00e32bc5b4b"
+SRC_URI[md5sum] = "e0af49d7d758b990e6fef629722d4aca"
+SRC_URI[sha256sum] = "55fe92f8686ce8612e2c1bfaf58c057715534419da700bda8d517b1d97914525"
\ No newline at end of file
-- 
1.8.3.2


