Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.20907.1611816029564405340
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jan 2021 22:40:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; 
   d="scan'208";a="103928447"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 Jan 2021 14:40:10 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id EFDA74CE679B
	for <openembedded-core@lists.openembedded.org>; Thu, 28 Jan 2021 14:40:09 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 28 Jan 2021 14:40:09 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] stress-ng: upgrade 0.12.01 -> 0.12.02
Date: Thu, 28 Jan 2021 14:40:06 +0800
Message-ID: <1611816006-11055-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: EFDA74CE679B.A50B4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../stress-ng/{stress-ng_0.12.01.bb => stress-ng_0.12.02.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.12.01.bb => stress-ng_0.12.02.bb} (90%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.12.01.bb b/meta/recipes-extended/stress-ng/stress-ng_0.12.02.bb
similarity index 90%
rename from meta/recipes-extended/stress-ng/stress-ng_0.12.01.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.12.02.bb
index 79157c738b..a5851b43f2 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.12.01.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.12.02.bb
@@ -9,7 +9,7 @@ SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
            file://no_daddr_t.patch \
            "
-SRC_URI[sha256sum] = "d354bbbb1500cfe043c761014dc9c3f62779747fafea8a19af94402327f6d3fc"
+SRC_URI[sha256sum] = "f847be115f60d3ad7d37c806fd1bfb1412aa3c631fca581d6dc233322f50d6a5"
 
 DEPENDS = "coreutils-native"
 
-- 
2.25.1



