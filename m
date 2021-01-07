Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.5591.1610007733785233332
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 00:22:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,329,1602518400"; 
   d="scan'208";a="103270078"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 07 Jan 2021 16:21:59 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 286F14CE602F
	for <openembedded-core@lists.openembedded.org>; Thu,  7 Jan 2021 16:21:56 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 7 Jan 2021 16:21:55 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] man-pages: upgrade 5.09 ->5.10
Date: Thu, 7 Jan 2021 16:21:46 +0800
Message-ID: <1610007706-4495-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 286F14CE602F.A098A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../man-pages/{man-pages_5.09.bb => man-pages_5.10.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/man-pages/{man-pages_5.09.bb => man-pages_5.10.bb} (91%)

diff --git a/meta/recipes-extended/man-pages/man-pages_5.09.bb b/meta/recipes-extended/man-pages/man-pages_5.10.bb
similarity index 91%
rename from meta/recipes-extended/man-pages/man-pages_5.09.bb
rename to meta/recipes-extended/man-pages/man-pages_5.10.bb
index 00d6eb5c2e..8874516aa2 100644
--- a/meta/recipes-extended/man-pages/man-pages_5.09.bb
+++ b/meta/recipes-extended/man-pages/man-pages_5.10.bb
@@ -7,7 +7,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://README;md5=207f70f56526417514ac46b6680e314f"
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "3bd9029b94520c730fe1a1fb78ed7d8d878236da0f725ca86ee71c1969de6c4f"
+SRC_URI[sha256sum] = "f2ce94a7250c49910db91806996699e1deac656097d4d53bdf56bdab4b61f228"
 
 inherit manpages
 
-- 
2.25.1



