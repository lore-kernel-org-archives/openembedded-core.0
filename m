Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id B7A647EE6E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 02:21:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Jul 2019 19:21:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,276,1559545200"; d="scan'208";a="175884542"
Received: from anmitta2-mobl1.png.intel.com ([10.221.21.220])
	by FMSMGA003.fm.intel.com with ESMTP; 17 Jul 2019 19:21:07 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jul 2019 10:21:01 +0800
Message-Id: <20190718022101.4453-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190718021606.3560-1-anuj.mittal@intel.com>
References: <20190718021606.3560-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [PATCH v2] curl: upgrade 7.65.1 -> 7.65.2
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
X-List-Received-Date: Thu, 18 Jul 2019 02:21:06 -0000
Content-Transfer-Encoding: 8bit

Changelog:
https://curl.haxx.se/changes.html#7_65_2

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/curl/{curl_7.65.1.bb => curl_7.65.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.65.1.bb => curl_7.65.2.bb} (95%)

diff --git a/meta/recipes-support/curl/curl_7.65.1.bb b/meta/recipes-support/curl/curl_7.65.2.bb
similarity index 95%
rename from meta/recipes-support/curl/curl_7.65.1.bb
rename to meta/recipes-support/curl/curl_7.65.2.bb
index e7bfe6cc0b..2fff04434a 100644
--- a/meta/recipes-support/curl/curl_7.65.1.bb
+++ b/meta/recipes-support/curl/curl_7.65.2.bb
@@ -9,8 +9,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
 "
 
-SRC_URI[md5sum] = "03ca3fa53ac4d791be66e30ba75b56ea"
-SRC_URI[sha256sum] = "cbd36df60c49e461011b4f3064cff1184bdc9969a55e9608bf5cadec4686e3f7"
+SRC_URI[md5sum] = "88910bdda3752a98083b6dbe85bafcaa"
+SRC_URI[sha256sum] = "8093398b51e7d8337dac6f8fa6f1f77d562bdd9eca679dff9d9c3b8160ebfd28"
 
 CVE_PRODUCT = "curl libcurl"
 inherit autotools pkgconfig binconfig multilib_header
-- 
2.20.1


