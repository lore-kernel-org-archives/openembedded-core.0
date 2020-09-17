Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.5311.1600305342254460285
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2020 18:15:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.76,434,1592841600"; 
   d="scan'208";a="99331411"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 17 Sep 2020 09:15:40 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 20D5F48990D9
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2020 09:15:36 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 17 Sep 2020 09:15:35 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] enchant2:upgrade 2.2.9 -> 2.2.11
Date: Thu, 17 Sep 2020 21:15:32 +0800
Message-ID: <1600348532-4282-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 20D5F48990D9.AF1FE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../enchant/{enchant2_2.2.9.bb => enchant2_2.2.11.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.2.9.bb => enchant2_2.2.11.bb} (90%)

diff --git a/meta/recipes-support/enchant/enchant2_2.2.9.bb b/meta/recipes-support/enchant/enchant2_2.2.11.bb
similarity index 90%
rename from meta/recipes-support/enchant/enchant2_2.2.9.bb
rename to meta/recipes-support/enchant/enchant2_2.2.11.bb
index 784fd14ee1..fac8bca0b1 100644
--- a/meta/recipes-support/enchant/enchant2_2.2.9.bb
+++ b/meta/recipes-support/enchant/enchant2_2.2.11.bb
@@ -9,7 +9,7 @@ DEPENDS = "glib-2.0"
 inherit autotools pkgconfig
 
 SRC_URI = "https://github.com/AbiWord/enchant/releases/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "b29a3d2273f5edcbdbbb565e94bfd8ea3f9526886fcb6327b4b0f72f0d722f3c"
+SRC_URI[sha256sum] = "a29c5777c4e45fcac2595c15c49d6d2aa434fa5e7c993dff3f9f367b65fe472a"
 
 UPSTREAM_CHECK_URI = "https://github.com/AbiWord/enchant/releases"
 
-- 
2.25.1



