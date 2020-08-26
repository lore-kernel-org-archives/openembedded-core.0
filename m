Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.2946.1598470681411749388
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2020 12:38:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: ssajal@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 07QJbdjM025357
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2020 12:37:50 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Wed, 26 Aug 2020
 12:37:29 -0700
Received: by yow-lpggp3.wrs.com (Postfix, from userid 20885)	id C16F8201B6;
 Wed, 26 Aug 2020 15:37:28 -0400 (EDT)
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [meta-webserver][PATCH] apache2: upgrade v2.4.43 -> v2.4.46
Date: Wed, 26 Aug 2020 15:37:22 -0400
Message-ID: <20200826193722.33720-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Minor upgrade inluding bug and CVE fixes, namely:
  - CVE-2020-9490
  - CVE-2020-11984
  - CVE-2020-11993

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 .../apache2/{apache2_2.4.43.bb => apache2_2.4.46.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.43.bb => apache2_2.4.46.bb} (98%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.43.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.46.bb
similarity index 98%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.43.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.46.bb
index a7083d80e..197cb83e6 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.43.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.46.bb
@@ -26,8 +26,8 @@ SRC_URI_append_class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[md5sum] = "791c986b1e70fe61eb44060aacc89a64"
-SRC_URI[sha256sum] = "a497652ab3fc81318cdc2a203090a999150d86461acff97c1065dc910fe10f43"
+SRC_URI[md5sum] = "7d661ea5e736dac5e2761d9f49fe8361"
+SRC_URI[sha256sum] = "740eddf6e1c641992b22359cabc66e6325868c3c5e2e3f98faf349b61ecf41ea"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.26.2

