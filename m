Return-Path: <cristiana.voicu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B6B3365DF2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Apr 2014 06:39:38 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 17 Apr 2014 23:39:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,883,1389772800"; d="scan'208";a="523099619"
Received: from cvoicu-vostro-460.rb.intel.com ([10.237.105.143])
	by orsmga002.jf.intel.com with ESMTP; 17 Apr 2014 23:39:39 -0700
From: Cristiana Voicu <cristiana.voicu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Apr 2014 09:40:31 +0300
Message-Id: <5518dfdfc81f53097f035f1655f1f167f57721ff.1397803089.git.cristiana.voicu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1397803089.git.cristiana.voicu@intel.com>
References: <cover.1397803089.git.cristiana.voicu@intel.com>
In-Reply-To: <cover.1397803089.git.cristiana.voicu@intel.com>
References: <cover.1397803089.git.cristiana.voicu@intel.com>
Subject: [PATCH 2/7] curl: upgrade to 7.36.0
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
X-List-Received-Date: Fri, 18 Apr 2014 06:39:38 -0000

Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
---
 .../curl/{curl_7.35.0.bb => curl_7.36.0.bb}        |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.35.0.bb => curl_7.36.0.bb} (93%)

diff --git a/meta/recipes-support/curl/curl_7.35.0.bb b/meta/recipes-support/curl/curl_7.36.0.bb
similarity index 93%
rename from meta/recipes-support/curl/curl_7.35.0.bb
rename to meta/recipes-support/curl/curl_7.36.0.bb
index 9cc60c8..6f55463 100644
--- a/meta/recipes-support/curl/curl_7.35.0.bb
+++ b/meta/recipes-support/curl/curl_7.36.0.bb
@@ -18,8 +18,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
 #
 SRC_URI += " file://configure_ac.patch"
 
-SRC_URI[md5sum] = "c18fbdd031adb0529ae09fce399f2d10"
-SRC_URI[sha256sum] = "d774d1701454f1b7d331c2075fc4f6dd972bddc2d171f43645ef3647c7fc0d83"
+SRC_URI[md5sum] = "e6d1f9d1b59da5062109ffe14e0569a4"
+SRC_URI[sha256sum] = "1fbe82b89bcd6b7ccda8cb0ff076edc60e911595030e27689f4abd5ef7f3cfcd"
 
 inherit autotools pkgconfig binconfig multilib_header
 
-- 
1.7.9.5


