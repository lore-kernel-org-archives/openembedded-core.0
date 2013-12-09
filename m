Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5088F6DF50
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2013 15:49:38 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 09 Dec 2013 07:49:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,858,1378882800"; d="scan'208";a="441060279"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 09 Dec 2013 07:49:37 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Dec 2013 17:51:58 +0200
Message-Id: <d059ba2d95aa5831a1830db512b79ad9215c1170.1386604276.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1386604276.git.cristian.iorga@intel.com>
References: <cover.1386604276.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1386604276.git.cristian.iorga@intel.com>
References: <cover.1386604276.git.cristian.iorga@intel.com>
Subject: [PATCH 1/2] harfbuzz: upgrade to 0.9.25
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
X-List-Received-Date: Mon, 09 Dec 2013 15:49:39 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../harfbuzz/{harfbuzz_0.9.22.bb => harfbuzz_0.9.25.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_0.9.22.bb => harfbuzz_0.9.25.bb} (88%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.22.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.25.bb
similarity index 88%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_0.9.22.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_0.9.25.bb
index 26f3f38..a18dafe 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.22.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.25.bb
@@ -13,8 +13,8 @@ SECTION = "libs"
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-${PV}.tar.bz2 \
 "
 
-SRC_URI[md5sum] = "d3c1bcd7073cbca29fea37fab50ded7d"
-SRC_URI[sha256sum] = "989680807e76197418338e44f226e02f155f33031efd9aff14dbc4dc14af71da"
+SRC_URI[md5sum] = "491b631239f51dcd4f7934775306c4e7"
+SRC_URI[sha256sum] = "dc6e5997a569526cd28147a80a0f65466e87ae617753b38704a60184bc6d6bee"
 
 inherit autotools pkgconfig
 
-- 
1.8.3.2


