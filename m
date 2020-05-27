Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.8436.1590593519191301978
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 08:32:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,441,1583164800"; 
   d="scan'208";a="93220259"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 27 May 2020 23:31:49 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 6A9C050A9975
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2020 23:31:46 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 27 May 2020 23:31:46 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] less: upgrade 551 -> 562
Date: Wed, 27 May 2020 23:31:42 +0800
Message-ID: <1590593502-63228-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 6A9C050A9975.A1458
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta/recipes-extended/less/{less_551.bb => less_562.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/less/{less_551.bb => less_562.bb} (89%)

diff --git a/meta/recipes-extended/less/less_551.bb b/meta/recipes-extended/less/less_562.bb
similarity index 89%
rename from meta/recipes-extended/less/less_551.bb
rename to meta/recipes-extended/less/less_562.bb
index a818c68fc7..c900574674 100644
--- a/meta/recipes-extended/less/less_551.bb
+++ b/meta/recipes-extended/less/less_562.bb
@@ -28,8 +28,8 @@ DEPENDS = "ncurses"
 SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
 	  "
 
-SRC_URI[md5sum] = "4ad4408b06d7a6626a055cb453f36819"
-SRC_URI[sha256sum] = "ff165275859381a63f19135a8f1f6c5a194d53ec3187f94121ecd8ef0795fe3d"
+SRC_URI[md5sum] = "0371a9678cb42f37b9bf9b86e8aa7903"
+SRC_URI[sha256sum] = "eab470c7c928132441541aa49b1352c0fc699c30f762dfaeb3bf88e6f0fd701b"
 
 UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
 
-- 
2.17.1



