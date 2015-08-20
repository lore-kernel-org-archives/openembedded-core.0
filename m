Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id DA42676A25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 11:37:42 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 20 Aug 2015 04:37:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,714,1432623600"; d="scan'208";a="752149079"
Received: from theory.fi.intel.com ([10.237.72.51])
	by orsmga001.jf.intel.com with ESMTP; 20 Aug 2015 04:37:42 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Aug 2015 14:39:20 +0300
Message-Id: <53a7964df547908768b1554486603bb4f0d9830e.1440070230.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <3e2150ea28539ba5780188819fd16172c9b2e7d3.1440070230.git.jussi.kukkonen@intel.com>
References: <3e2150ea28539ba5780188819fd16172c9b2e7d3.1440070230.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1440070230.git.jussi.kukkonen@intel.com>
References: <cover.1440070230.git.jussi.kukkonen@intel.com>
Subject: [PATCH 3/3] libical: Upgrade 1.0.0 -> 1.0.1
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
X-List-Received-Date: Thu, 20 Aug 2015 11:37:48 -0000

Build system changed to cmake.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../libical/{libical_1.0.0.bb => libical_1.0.1.bb}                | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libical/{libical_1.0.0.bb => libical_1.0.1.bb} (67%)

diff --git a/meta/recipes-support/libical/libical_1.0.0.bb b/meta/recipes-support/libical/libical_1.0.1.bb
similarity index 67%
rename from meta/recipes-support/libical/libical_1.0.0.bb
rename to meta/recipes-support/libical/libical_1.0.1.bb
index be6b635..6dee980 100644
--- a/meta/recipes-support/libical/libical_1.0.0.bb
+++ b/meta/recipes-support/libical/libical_1.0.1.bb
@@ -7,7 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d4fc58309d8ed46587ac63bb449d82f8 \
 SECTION = "libs"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/archive/v${PV}.tar.gz"
-SRC_URI[md5sum] = "f4b8e33ae5efb2f025eb43ce69682a36"
-SRC_URI[sha256sum] = "0072e83834092315772e6719b85fc8b11530b1ff53f4d108315fb38cddbce8c2"
+SRC_URI[md5sum] = "af91db06b22559f863869c5a382ad08a"
+SRC_URI[sha256sum] = "7d5f613454ec6c7d1bcfb441c919215be53292aa15cd1cb14249d1413d6c610c"
 
-inherit autotools
+inherit cmake perlnative
+
+FILES_${PN}-dev += "${libdir}/cmake/*"
-- 
2.1.4


