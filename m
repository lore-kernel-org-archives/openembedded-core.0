Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.16459.1606468947656069372
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2020 01:22:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,373,1599494400"; 
   d="scan'208";a="101818650"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 27 Nov 2020 17:22:26 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 82CE24CE5CE1
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2020 17:22:24 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 27 Nov 2020 17:22:25 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] wireless-regdb: upgrade 2020.04.29 -> 2020.11.20
Date: Fri, 27 Nov 2020 17:22:23 +0800
Message-ID: <1606468943-124399-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 82CE24CE5CE1.A49EC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...ireless-regdb_2020.04.29.bb => wireless-regdb_2020.11.20.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2020.04.29.bb => wireless-regdb_2020.11.20.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2020.04.29.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2020.11.20.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2020.04.29.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2020.11.20.bb
index 30d4cb523f..b3567bca95 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2020.04.29.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2020.11.20.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "89fd031aed5977c219a71501e144375a10e7c90d1005d5d086ea7972886a2c7a"
+SRC_URI[sha256sum] = "b4164490d82ff7b0086e812ac42ab27baf57be24324d4c0ee1c5dd6ba27f2a52"
 
 inherit bin_package allarch
 
-- 
2.25.1



