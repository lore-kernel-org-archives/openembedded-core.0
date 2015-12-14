Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 556FA73175
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 15:08:18 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 14 Dec 2015 07:08:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,427,1444719600"; d="scan'208";a="707064248"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 14 Dec 2015 07:08:19 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Dec 2015 17:05:29 +0200
Message-Id: <13415d8fd6d3172b775bc903528c2e8a94b9f2b3.1450104283.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
References: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
References: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 17/20] powertop: update to 2.8
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
X-List-Received-Date: Mon, 14 Dec 2015 15:08:18 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-kernel/powertop/{powertop_2.7.bb => powertop_2.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/powertop/{powertop_2.7.bb => powertop_2.8.bb} (88%)

diff --git a/meta/recipes-kernel/powertop/powertop_2.7.bb b/meta/recipes-kernel/powertop/powertop_2.8.bb
similarity index 88%
rename from meta/recipes-kernel/powertop/powertop_2.7.bb
rename to meta/recipes-kernel/powertop/powertop_2.8.bb
index e2d0ae5..a466067 100644
--- a/meta/recipes-kernel/powertop/powertop_2.7.bb
+++ b/meta/recipes-kernel/powertop/powertop_2.8.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 
 SRC_URI = "http://01.org/sites/default/files/downloads/powertop/powertop-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "e0d686e47daaf7e9d89031f7763432ef"
-SRC_URI[sha256sum] = "8d4b1490e2baad4467c0ded3c423db4472dcbf7b2dd8f8f2a928f54047c678ca"
+SRC_URI[md5sum] = "c55fedb69203e480801b18bd7b886241"
+SRC_URI[sha256sum] = "a87b563f73106babfa3e74dcf92f252938c061e309ace20a361358bbfa579c5a"
 
 UPSTREAM_CHECK_URI = "https://01.org/powertop/downloads"
 
-- 
2.6.2


