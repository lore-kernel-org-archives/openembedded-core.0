Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.1150.1596006800774645047
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2020 00:13:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: yi.zhao@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 06T7CcWq016714
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2020 00:13:09 -0700
Received: from localhost (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 29 Jul
 2020 00:13:02 -0700
From: "Yi Zhao" <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] pbzip2: extend for nativesdk
Date: Wed, 29 Jul 2020 15:12:57 +0800
Message-ID: <20200729071257.2326-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [128.224.162.174]
Content-Type: text/plain

Make pzip2 available in nativesdk to speedup file compression.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb b/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
index e321cd2b27..d24035b677 100644
--- a/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
+++ b/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
@@ -28,4 +28,4 @@ do_install() {
     install -m 0755 pbzip2 ${D}${bindir}/
 }
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

