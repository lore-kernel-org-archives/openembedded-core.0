Return-Path: <cristiana.voicu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 078B46F098
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 11:34:57 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 Feb 2014 03:30:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,534,1389772800"; d="scan'208";a="488717443"
Received: from cvoicu-vostro-460.rb.intel.com ([10.237.105.62])
	by orsmga002.jf.intel.com with ESMTP; 24 Feb 2014 03:34:51 -0800
From: Cristiana Voicu <cristiana.voicu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Feb 2014 13:42:41 +0200
Message-Id: <dcae5d2bddf73f523394cfe9e7800fd50619c60a.1393228795.git.cristiana.voicu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1393228795.git.cristiana.voicu@intel.com>
References: <cover.1393228795.git.cristiana.voicu@intel.com>
In-Reply-To: <cover.1393228795.git.cristiana.voicu@intel.com>
References: <cover.1393228795.git.cristiana.voicu@intel.com>
Subject: [PATCH 1/2] curl: upgrade to 7.35.0
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
X-List-Received-Date: Mon, 24 Feb 2014 11:34:57 -0000

Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
---
 .../curl/{curl_7.34.0.bb => curl_7.35.0.bb}        |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.34.0.bb => curl_7.35.0.bb} (93%)

diff --git a/meta/recipes-support/curl/curl_7.34.0.bb b/meta/recipes-support/curl/curl_7.35.0.bb
similarity index 93%
rename from meta/recipes-support/curl/curl_7.34.0.bb
rename to meta/recipes-support/curl/curl_7.35.0.bb
index aba6649..9cc60c8 100644
--- a/meta/recipes-support/curl/curl_7.34.0.bb
+++ b/meta/recipes-support/curl/curl_7.35.0.bb
@@ -18,8 +18,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
 #
 SRC_URI += " file://configure_ac.patch"
 
-SRC_URI[md5sum] = "88491df2bb32e9146e776ae6ac2f8327"
-SRC_URI[sha256sum] = "10beade56b48311499e444783df3413405b22f20a147ed4a1d8a8125f1cc829b"
+SRC_URI[md5sum] = "c18fbdd031adb0529ae09fce399f2d10"
+SRC_URI[sha256sum] = "d774d1701454f1b7d331c2075fc4f6dd972bddc2d171f43645ef3647c7fc0d83"
 
 inherit autotools pkgconfig binconfig multilib_header
 
-- 
1.7.9.5


