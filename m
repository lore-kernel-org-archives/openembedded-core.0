Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web10.12233.1596172966584800319
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2020 22:22:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,417,1589212800"; 
   d="scan'208";a="97199363"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 31 Jul 2020 13:22:45 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 545FE4CE5059
	for <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2020 13:22:41 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 31 Jul 2020 13:22:42 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] stress-ng:upgrade 0.11.15 -> 0.11.17
Date: Sat, 1 Aug 2020 01:22:39 +0800
Message-ID: <1596216160-3523-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 545FE4CE5059.A2387
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../stress-ng/{stress-ng_0.11.15.bb => stress-ng_0.11.17.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.11.15.bb => stress-ng_0.11.17.bb} (90%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.11.15.bb b/meta/recipes-extended/stress-ng/stress-ng_0.11.17.bb
similarity index 90%
rename from meta/recipes-extended/stress-ng/stress-ng_0.11.15.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.11.17.bb
index 28bf9884cf..a67df24dca 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.11.15.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.11.17.bb
@@ -9,7 +9,7 @@ SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
            file://no_daddr_t.patch \
            "
-SRC_URI[sha256sum] = "6a333650fb5c85c5221f10d2cf890e9fc56530696e118d975fbbe96126c06963"
+SRC_URI[sha256sum] = "860291dd3a18b985b3483190a627bbede2b5c52113766c1921001b3fb4b83af0"
 
 DEPENDS = "coreutils-native"
 
-- 
2.25.1



