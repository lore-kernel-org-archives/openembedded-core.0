Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web09.4885.1608697644166598728
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Dec 2020 20:27:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: khairul.rohaizzat.jamaluddin@intel.com)
IronPort-SDR: 9QERGhbvKBFp+HJVdljpxmaCGJN7Z0gSSZuHf5MV95uecmBOnRMazIPVaj3gNp5Vam5/YSgVsc
 LlzA6LSymvqQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="175184843"
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="175184843"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2020 20:27:20 -0800
IronPort-SDR: UKcuzzBq0Azdu9O+Q1vAEVjZnZoIPR7r7e+NN4II+mRJypnd7k6N1M+tOlceKZPwC7yov3/ccg
 qJn6xD9JyMwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="338609398"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga007.fm.intel.com with ESMTP; 22 Dec 2020 20:27:20 -0800
From: "Jamaluddin, Khairul Rohaizzat" <khairul.rohaizzat.jamaluddin@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] curl: Update 7.73.0 -> 7.74.0
Date: Wed, 23 Dec 2020 12:27:19 +0800
Message-Id: <1608697639-17238-1-git-send-email-khairul.rohaizzat.jamaluddin@intel.com>
X-Mailer: git-send-email 2.7.4

From: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>

update to version 7.74.0

curl 7.74.0 hsts: add experimental support for Strict-Transport-Security with various bug fixes

Reference:
https://curl.se/changes.html#7_74_0

update includes fix for CVE:
CVE-2020-8284
CVE-2020-8285
CVE-2020-8286

Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
---
 meta/recipes-support/curl/{curl_7.73.0.bb => curl_7.74.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/curl/{curl_7.73.0.bb => curl_7.74.0.bb} (97%)

diff --git a/meta/recipes-support/curl/curl_7.73.0.bb b/meta/recipes-support/curl/curl_7.74.0.bb
similarity index 97%
rename from meta/recipes-support/curl/curl_7.73.0.bb
rename to meta/recipes-support/curl/curl_7.74.0.bb
index 0f26b0f..873bbe8 100644
--- a/meta/recipes-support/curl/curl_7.73.0.bb
+++ b/meta/recipes-support/curl/curl_7.74.0.bb
@@ -9,7 +9,7 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
 "
 
-SRC_URI[sha256sum] = "cf34fe0b07b800f1c01a499a6e8b2af548f6d0e044dca4a29d88a4bee146d131"
+SRC_URI[sha256sum] = "0f4d63e6681636539dc88fa8e929f934cd3a840c46e0bf28c73be11e521b77a5"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
-- 
2.7.4

