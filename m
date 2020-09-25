Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.1019.1601011773510697465
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Sep 2020 22:29:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,300,1596470400"; 
   d="scan'208";a="99602474"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 25 Sep 2020 13:29:32 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 7025948990DF
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2020 13:29:32 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 25 Sep 2020 13:29:32 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] stress-ng:upgrade 0.11.19 -> 0.11.21
Date: Sat, 26 Sep 2020 01:29:31 +0800
Message-ID: <1601054971-37366-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 7025948990DF.AF6B2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../stress-ng/{stress-ng_0.11.19.bb => stress-ng_0.11.21.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.11.19.bb => stress-ng_0.11.21.bb} (90%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.11.19.bb b/meta/recipes-extended/stress-ng/stress-ng_0.11.21.bb
similarity index 90%
rename from meta/recipes-extended/stress-ng/stress-ng_0.11.19.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.11.21.bb
index f1af99e512..71671dd046 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.11.19.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.11.21.bb
@@ -9,7 +9,7 @@ SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
            file://no_daddr_t.patch \
            "
-SRC_URI[sha256sum] = "a50b753f00a9c880eda4f9d72bb82e37149ac24fab4265212e101926a1c20868"
+SRC_URI[sha256sum] = "ee44b71aba20e9c7d10ec4768efa2245d12579fa17e08b9314c17f06f785ae39"
 
 DEPENDS = "coreutils-native"
 
-- 
2.25.1



