Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web08.1873.1610068178908393291
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 17:09:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,330,1602518400"; 
   d="scan'208";a="103291047"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Jan 2021 09:09:30 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 9DBA54CE6026
	for <openembedded-core@lists.openembedded.org>; Fri,  8 Jan 2021 09:09:26 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 8 Jan 2021 09:09:26 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] tiff: upgrade 4.1.0 -> 4.2.0
Date: Fri, 8 Jan 2021 09:09:23 +0800
Message-ID: <1610068163-6572-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 9DBA54CE6026.A179F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../libtiff/{tiff_4.1.0.bb => tiff_4.2.0.bb}                  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/libtiff/{tiff_4.1.0.bb => tiff_4.2.0.bb} (92%)

diff --git a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.2.0.bb
similarity index 92%
rename from meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
rename to meta/recipes-multimedia/libtiff/tiff_4.2.0.bb
index 9b907fbc24..40c59d62a6 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.2.0.bb
@@ -6,8 +6,8 @@ CVE_PRODUCT = "libtiff"
 
 SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
           "
-SRC_URI[md5sum] = "2165e7aba557463acc0664e71a3ed424"
-SRC_URI[sha256sum] = "5d29f32517dadb6dbcd1255ea5bbc93a2b54b94fbf83653b4d65c7d6775b8634"
+SRC_URI[md5sum] = "2bbf6db1ddc4a59c89d6986b368fc063"
+SRC_URI[sha256sum] = "eb0484e568ead8fa23b513e9b0041df7e327f4ee2d22db5a533929dfc19633cb"
 
 # exclude betas
 UPSTREAM_CHECK_REGEX = "tiff-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.25.1



