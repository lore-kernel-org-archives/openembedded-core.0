Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web08.9569.1607053129282686471
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 19:38:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,391,1599494400"; 
   d="scan'208";a="102049736"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Dec 2020 11:38:33 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 80D104CE5CF9
	for <openembedded-core@lists.openembedded.org>; Fri,  4 Dec 2020 11:38:27 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 4 Dec 2020 11:38:27 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] sysstat: upgrade 12.4.0 -> 12.4.1
Date: Fri, 4 Dec 2020 11:38:25 +0800
Message-ID: <1607053105-64310-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 80D104CE5CF9.A280F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../sysstat/{sysstat_12.4.0.bb => sysstat_12.4.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sysstat/{sysstat_12.4.0.bb => sysstat_12.4.1.bb} (65%)

diff --git a/meta/recipes-extended/sysstat/sysstat_12.4.0.bb b/meta/recipes-extended/sysstat/sysstat_12.4.1.bb
similarity index 65%
rename from meta/recipes-extended/sysstat/sysstat_12.4.0.bb
rename to meta/recipes-extended/sysstat/sysstat_12.4.1.bb
index 6773213a40..625d278ee6 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.4.0.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.4.1.bb
@@ -4,4 +4,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
 SRC_URI += "file://0001-configure.in-remove-check-for-chkconfig.patch"
 
-SRC_URI[sha256sum] = "78556c339795ecd07eb10ee09e3f5d52901d3a29f874ae92b45efd0de7b62d16"
+SRC_URI[sha256sum] = "24af8d4eff5118a18f67d5eadda843b9cb9fd29ae4922c0e8b8399621313ce0b"
-- 
2.25.1



