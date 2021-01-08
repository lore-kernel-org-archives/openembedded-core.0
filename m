Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web08.2250.1610070168790789168
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 17:42:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,330,1602518400"; 
   d="scan'208";a="103292194"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Jan 2021 09:42:47 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 1AB914CE6026
	for <openembedded-core@lists.openembedded.org>; Fri,  8 Jan 2021 09:42:45 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 8 Jan 2021 09:42:44 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] sysstat: upgrade 12.4.1 -> 12.4.2
Date: Fri, 8 Jan 2021 09:42:41 +0800
Message-ID: <1610070161-6759-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 1AB914CE6026.A14B4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../sysstat/{sysstat_12.4.1.bb => sysstat_12.4.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sysstat/{sysstat_12.4.1.bb => sysstat_12.4.2.bb} (65%)

diff --git a/meta/recipes-extended/sysstat/sysstat_12.4.1.bb b/meta/recipes-extended/sysstat/sysstat_12.4.2.bb
similarity index 65%
rename from meta/recipes-extended/sysstat/sysstat_12.4.1.bb
rename to meta/recipes-extended/sysstat/sysstat_12.4.2.bb
index 625d278ee6..e50bb0ff61 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.4.1.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.4.2.bb
@@ -4,4 +4,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
 SRC_URI += "file://0001-configure.in-remove-check-for-chkconfig.patch"
 
-SRC_URI[sha256sum] = "24af8d4eff5118a18f67d5eadda843b9cb9fd29ae4922c0e8b8399621313ce0b"
+SRC_URI[sha256sum] = "3701b2c1883d50eb384d7b95ce5b6df0a71fdcb3c23f96cb58098d1bcffa018f"
-- 
2.25.1



