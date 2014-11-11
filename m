Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2705E65CC9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 08:46:35 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 11 Nov 2014 00:46:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,359,1413270000"; d="scan'208";a="630016409"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by fmsmga002.fm.intel.com with ESMTP; 11 Nov 2014 00:46:33 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Nov 2014 10:46:23 +0200
Message-Id: <ae3043779ce08cef095a7b57ccd55168c8f3697f.1415695544.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1415695544.git.cristian.iorga@intel.com>
References: <cover.1415695544.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1415695544.git.cristian.iorga@intel.com>
References: <cover.1415695544.git.cristian.iorga@intel.com>
Subject: [PATCH 2/4] sbc: upgrade to 1.3
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
X-List-Received-Date: Tue, 11 Nov 2014 08:46:45 -0000

- Frame length calculation for dual-channel mode operation bug fixed;
- Prevents overflow of an internal frame length variable.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-multimedia/sbc/{sbc_1.2.bb => sbc_1.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/sbc/{sbc_1.2.bb => sbc_1.3.bb} (76%)

diff --git a/meta/recipes-multimedia/sbc/sbc_1.2.bb b/meta/recipes-multimedia/sbc/sbc_1.3.bb
similarity index 76%
rename from meta/recipes-multimedia/sbc/sbc_1.2.bb
rename to meta/recipes-multimedia/sbc/sbc_1.3.bb
index 9cdf01b..2d7f31b 100644
--- a/meta/recipes-multimedia/sbc/sbc_1.2.bb
+++ b/meta/recipes-multimedia/sbc/sbc_1.3.bb
@@ -10,7 +10,7 @@ DEPENDS = "libsndfile1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/${BP}.tar.xz"
 
-SRC_URI[md5sum] = "ec65c444ad4c32aa85702641045b19e9"
-SRC_URI[sha256sum] = "c2f01ea54f7473704825113a9cdd46a23e67c650eff575f0670c3d9d66c4a5dc"
+SRC_URI[md5sum] = "2d8b7841f2c11ab287718d562f2b981c"
+SRC_URI[sha256sum] = "e61022cf576f14190241e7071753fdacdce5d1dea89ffd704110fc50be689309"
 
 inherit autotools pkgconfig
-- 
2.1.0


