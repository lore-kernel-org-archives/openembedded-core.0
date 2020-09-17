Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.5366.1600305689118189383
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2020 18:21:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.76,434,1592841600"; 
   d="scan'208";a="99331669"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 17 Sep 2020 09:21:28 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 9EDB948990C1
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2020 09:21:22 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 17 Sep 2020 09:21:22 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] less:upgrade 562 -> 563
Date: Thu, 17 Sep 2020 21:21:24 +0800
Message-ID: <1600348884-4468-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 9EDB948990C1.A04E5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/less/{less_562.bb => less_563.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/less/{less_562.bb => less_563.bb} (89%)

diff --git a/meta/recipes-extended/less/less_562.bb b/meta/recipes-extended/less/less_563.bb
similarity index 89%
rename from meta/recipes-extended/less/less_562.bb
rename to meta/recipes-extended/less/less_563.bb
index c900574674..4a1e951756 100644
--- a/meta/recipes-extended/less/less_562.bb
+++ b/meta/recipes-extended/less/less_563.bb
@@ -28,8 +28,8 @@ DEPENDS = "ncurses"
 SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
 	  "
 
-SRC_URI[md5sum] = "0371a9678cb42f37b9bf9b86e8aa7903"
-SRC_URI[sha256sum] = "eab470c7c928132441541aa49b1352c0fc699c30f762dfaeb3bf88e6f0fd701b"
+SRC_URI[md5sum] = "1ee44fa71447a845f6eef5b3f38d2781"
+SRC_URI[sha256sum] = "ce5b6d2b9fc4442d7a07c93ab128d2dff2ce09a1d4f2d055b95cf28dd0dc9a9a"
 
 UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
 
-- 
2.25.1



