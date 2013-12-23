Return-Path: <cristiana.voicu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CBB68615C7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Dec 2013 10:10:16 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 Dec 2013 02:10:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,536,1384329600"; d="scan'208";a="456541016"
Received: from cvoicu-vostro-460.rb.intel.com (HELO google.com.com)
	([10.237.105.151])
	by orsmga002.jf.intel.com with ESMTP; 23 Dec 2013 02:10:16 -0800
From: Cristiana Voicu <cristiana.voicu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Dec 2013 12:16:48 +0200
Message-Id: <5909b901cce8a6a7351a86b67aa6696d0b3bbb9a.1387793682.git.cristiana.voicu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1387793682.git.cristiana.voicu@intel.com>
References: <cover.1387793682.git.cristiana.voicu@intel.com>
In-Reply-To: <cover.1387793682.git.cristiana.voicu@intel.com>
References: <cover.1387793682.git.cristiana.voicu@intel.com>
Subject: [PATCH 1/1] curl: upgrade to 7.34.0
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
X-List-Received-Date: Mon, 23 Dec 2013 10:10:16 -0000

Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
---
 .../curl/{curl_7.33.0.bb => curl_7.34.0.bb}        |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.33.0.bb => curl_7.34.0.bb} (93%)

diff --git a/meta/recipes-support/curl/curl_7.33.0.bb b/meta/recipes-support/curl/curl_7.34.0.bb
similarity index 93%
rename from meta/recipes-support/curl/curl_7.33.0.bb
rename to meta/recipes-support/curl/curl_7.34.0.bb
index 8539fec..2dfe390 100644
--- a/meta/recipes-support/curl/curl_7.33.0.bb
+++ b/meta/recipes-support/curl/curl_7.34.0.bb
@@ -18,8 +18,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
 #
 SRC_URI += " file://configure_ac.patch"
 
-SRC_URI[md5sum] = "57409d6bf0bd97053b8378dbe0cadcef"
-SRC_URI[sha256sum] = "0afde4cd949e2658eddc3cda675b19b165eea1af48ac5f3e1ec160792255d1b3"
+SRC_URI[md5sum] = "88491df2bb32e9146e776ae6ac2f8327"
+SRC_URI[sha256sum] = "10beade56b48311499e444783df3413405b22f20a147ed4a1d8a8125f1cc829b"
 
 inherit autotools pkgconfig binconfig
 
-- 
1.7.9.5


