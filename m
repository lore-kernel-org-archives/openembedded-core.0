Return-Path: <cristiana.voicu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id CD3CF6D34C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2013 07:57:08 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 24 Oct 2013 00:57:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,560,1378882800"; d="scan'208";a="421820222"
Received: from cvoicu-vostro-460.rb.intel.com ([10.237.105.65])
	by fmsmga002.fm.intel.com with ESMTP; 24 Oct 2013 00:57:10 -0700
From: Cristiana Voicu <cristiana.voicu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Oct 2013 11:01:49 +0300
Message-Id: <56b026904ddaba033ef6fd0291172941bce43fdb.1382601179.git.cristiana.voicu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1382601179.git.cristiana.voicu@intel.com>
References: <cover.1382601179.git.cristiana.voicu@intel.com>
In-Reply-To: <cover.1382601179.git.cristiana.voicu@intel.com>
References: <cover.1382601179.git.cristiana.voicu@intel.com>
Subject: [PATCH 3/4] curl: upgrade to 7.33.0
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
X-List-Received-Date: Thu, 24 Oct 2013 07:57:08 -0000

Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
---
 .../curl/{curl_7.32.0.bb => curl_7.33.0.bb}        |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.32.0.bb => curl_7.33.0.bb} (93%)

diff --git a/meta/recipes-support/curl/curl_7.32.0.bb b/meta/recipes-support/curl/curl_7.33.0.bb
similarity index 93%
rename from meta/recipes-support/curl/curl_7.32.0.bb
rename to meta/recipes-support/curl/curl_7.33.0.bb
index 3b6b23a..8539fec 100644
--- a/meta/recipes-support/curl/curl_7.32.0.bb
+++ b/meta/recipes-support/curl/curl_7.33.0.bb
@@ -18,8 +18,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
 #
 SRC_URI += " file://configure_ac.patch"
 
-SRC_URI[md5sum] = "30d04b0a8c43c6770039d1bf033dfe79"
-SRC_URI[sha256sum] = "8e3db42548e01407cb2f1407660c0f528b89ec7afda6264442fc2b229b95223b"
+SRC_URI[md5sum] = "57409d6bf0bd97053b8378dbe0cadcef"
+SRC_URI[sha256sum] = "0afde4cd949e2658eddc3cda675b19b165eea1af48ac5f3e1ec160792255d1b3"
 
 inherit autotools pkgconfig binconfig
 
-- 
1.7.9.5


