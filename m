Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.3579.1599787128489338510
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 18:18:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.76,413,1592841600"; 
   d="scan'208";a="99114258"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 11 Sep 2020 09:18:46 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 315DF48990EC
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2020 09:18:44 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 11 Sep 2020 09:18:43 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] bison:upgrade 3.7.1 -> 3.7.2
Date: Fri, 11 Sep 2020 21:18:44 +0800
Message-ID: <1599830324-14513-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 315DF48990EC.A3623
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta/recipes-devtools/bison/{bison_3.7.1.bb => bison_3.7.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/bison/{bison_3.7.1.bb => bison_3.7.2.bb} (94%)

diff --git a/meta/recipes-devtools/bison/bison_3.7.1.bb b/meta/recipes-devtools/bison/bison_3.7.2.bb
similarity index 94%
rename from meta/recipes-devtools/bison/bison_3.7.1.bb
rename to meta/recipes-devtools/bison/bison_3.7.2.bb
index a765a2380d..f7bf70fff3 100644
--- a/meta/recipes-devtools/bison/bison_3.7.1.bb
+++ b/meta/recipes-devtools/bison/bison_3.7.2.bb
@@ -13,7 +13,7 @@ SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
            file://add-with-bisonlocaledir.patch \
            file://0001-bison-fix-the-parallel-build.patch \
            "
-SRC_URI[sha256sum] = "55c215521a13982a9bee68cd42eed51a65713f96c530a739a57de4438ac1bb69"
+SRC_URI[sha256sum] = "7948d193104d979c0fb0294a1854c73c89d72ae41acfc081826142578a78a91b"
 
 # No point in hardcoding path to m4, just use PATH
 EXTRA_OECONF += "M4=m4"
-- 
2.25.1



