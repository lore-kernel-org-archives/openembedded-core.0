Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.9782.1590139400957297327
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2020 02:23:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,421,1583164800"; 
   d="scan'208";a="92800456"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 22 May 2020 17:23:17 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 4EFE44BCC8A5
	for <openembedded-core@lists.openembedded.org>; Fri, 22 May 2020 17:23:17 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 22 May 2020 17:23:18 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] iso-codes: upgrade 4.4 -> 4.5.0
Date: Sat, 23 May 2020 02:23:15 +0800
Message-ID: <1590171795-9420-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 4EFE44BCC8A5.A4FC1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../iso-codes/{iso-codes_4.4.bb => iso-codes_4.5.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/iso-codes/{iso-codes_4.4.bb => iso-codes_4.5.0.bb} (92%)

diff --git a/meta/recipes-support/iso-codes/iso-codes_4.4.bb b/meta/recipes-support/iso-codes/iso-codes_4.5.0.bb
similarity index 92%
rename from meta/recipes-support/iso-codes/iso-codes_4.4.bb
rename to meta/recipes-support/iso-codes/iso-codes_4.5.0.bb
index 332af025dd..6f9868ffea 100644
--- a/meta/recipes-support/iso-codes/iso-codes_4.4.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_4.5.0.bb
@@ -6,7 +6,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=http"
-SRCREV = "38edb926592954b87eb527124da0ec68d2a748f3"
+SRCREV = "a36019e5014bff251f83d522ddcfebaecf52afd3"
 
 # inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
 # are inhibited by allarch
-- 
2.17.1



