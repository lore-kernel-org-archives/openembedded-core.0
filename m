Return-Path: <cristiana.voicu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 17A7B61223
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2013 08:25:34 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 05 Aug 2013 01:25:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,817,1367996400"; d="scan'208";a="376250889"
Received: from cvoicu-vostro-460.rb.intel.com ([10.237.105.72])
	by fmsmga001.fm.intel.com with ESMTP; 05 Aug 2013 01:25:33 -0700
From: Cristiana Voicu <cristiana.voicu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Aug 2013 11:28:12 +0300
Message-Id: <5f1da5555d9fde20116266cb54831afadeb2565a.1375441054.git.cristiana.voicu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <002befd249411cf19e27d77a58d7be18e2690807.1375441054.git.cristiana.voicu@intel.com>
References: <002befd249411cf19e27d77a58d7be18e2690807.1375441054.git.cristiana.voicu@intel.com>
In-Reply-To: <cover.1375441054.git.cristiana.voicu@intel.com>
References: <cover.1375441054.git.cristiana.voicu@intel.com>
Subject: [PATCH 3/3] curl: upgrade to 7.31.0
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
X-List-Received-Date: Mon, 05 Aug 2013 08:25:34 -0000

Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
---
 .../curl/{curl_7.30.0.bb => curl_7.31.0.bb}        |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-support/curl/{curl_7.30.0.bb => curl_7.31.0.bb} (92%)

diff --git a/meta/recipes-support/curl/curl_7.30.0.bb b/meta/recipes-support/curl/curl_7.31.0.bb
similarity index 92%
rename from meta/recipes-support/curl/curl_7.30.0.bb
rename to meta/recipes-support/curl/curl_7.31.0.bb
index fbfc211..6d78ff2 100644
--- a/meta/recipes-support/curl/curl_7.30.0.bb
+++ b/meta/recipes-support/curl/curl_7.31.0.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=7;md5=3a34942f4ae3fbf1a303160714e66
 DEPENDS = "zlib gnutls"
 DEPENDS_class-native = "zlib-native openssl-native"
 DEPENDS_class-nativesdk = "nativesdk-zlib"
-PR = "r0"
 
 SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://pkgconfig_fix.patch \
@@ -19,8 +18,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
 #
 SRC_URI += " file://configure_ac.patch"
 
-SRC_URI[md5sum] = "0db5ec03a5001b42a2edc03bf63b5ceb"
-SRC_URI[sha256sum] = "6b1c410387bea82601baec85d6aa61955794672e36766407e99ade8d55aaaf11"
+SRC_URI[md5sum] = "b7bea20579ac2f696338ae03f2c19ba5"
+SRC_URI[sha256sum] = "a73b118eececff5de25111f35d1d0aafe1e71afdbb83082a8e44d847267e3e08"
 
 inherit autotools pkgconfig binconfig
 
-- 
1.7.9.5


