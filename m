Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web08.17163.1627891762041249968
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 01:09:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: mingli.yu@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 17289Kc1031133
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Aug 2021 01:09:20 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 17289JbL027905
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Aug 2021 01:09:20 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 2 Aug 2021 01:09:19 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 2 Aug 2021 01:09:18 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] curl: Upgrade to 7.78.0
Date: Mon, 2 Aug 2021 16:06:56 +0800
Message-ID: <20210802080656.48809-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Remove libmetalink configure option as this rarely used option is
removed in the new version [1].

[1] https://github.com/curl/curl/commit/265b14d6b37c4298bd5556fabcbc37d36f911693

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-support/curl/{curl_7.77.0.bb => curl_7.78.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.77.0.bb => curl_7.78.0.bb} (97%)

diff --git a/meta/recipes-support/curl/curl_7.77.0.bb b/meta/recipes-support/curl/curl_7.78.0.bb
similarity index 97%
rename from meta/recipes-support/curl/curl_7.77.0.bb
rename to meta/recipes-support/curl/curl_7.78.0.bb
index 6b15a6a3e8..2e2be66102 100644
--- a/meta/recipes-support/curl/curl_7.77.0.bb
+++ b/meta/recipes-support/curl/curl_7.78.0.bb
@@ -13,7 +13,7 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
 "
 
-SRC_URI[sha256sum] = "6c0c28868cb82593859fc43b9c8fdb769314c855c05cf1b56b023acf855df8ea"
+SRC_URI[sha256sum] = "98530b317dc95ccb324bbe4f834f07bb642fbc393b794ddf3434f246a71ea44a"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
@@ -61,7 +61,6 @@ EXTRA_OECONF = " \
     --disable-ntlm-wb \
     --enable-crypto-auth \
     --with-ca-bundle=${sysconfdir}/ssl/certs/ca-certificates.crt \
-    --without-libmetalink \
     --without-libpsl \
     --enable-debug \
     --enable-optimize \
-- 
2.17.1

