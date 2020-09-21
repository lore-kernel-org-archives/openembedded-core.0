Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.48111.1600712673524204529
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2020 11:24:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: randy.macleod@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 08LIOQjR004023
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2020 11:24:32 -0700 (PDT)
Received: from vme.wrs.com (172.25.44.2) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Mon, 21 Sep 2020
 11:24:25 -0700
From: "Randy MacLeod" <randy.macleod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] curl: Change SRC_URI from http to https
Date: Mon, 21 Sep 2020 14:24:25 -0400
Message-ID: <20200921182425.282556-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The official links on:
   https://curl.haxx.se/download.html
use https now and we're seeing this warning:
   WARNING: curl-native-7.72.0-r0 do_fetch: Failed to fetch URL http://curl.haxx.se/download/curl-7.72.0.tar.bz2, attempting MIRRORS if available

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/recipes-support/curl/curl_7.72.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl_7.72.0.bb b/meta/recipes-support/curl/curl_7.72.0.bb
index a2ae0b6901..7d0268253d 100644
--- a/meta/recipes-support/curl/curl_7.72.0.bb
+++ b/meta/recipes-support/curl/curl_7.72.0.bb
@@ -5,7 +5,7 @@ SECTION = "console/network"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2e9fb35867314fe31c6a4977ef7dd531"
 
-SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
+SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
 "
 
-- 
2.25.1

