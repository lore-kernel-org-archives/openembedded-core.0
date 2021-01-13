Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.7916.1610545082222254138
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jan 2021 05:38:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,344,1602518400"; 
   d="scan'208";a="103445258"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 13 Jan 2021 21:37:46 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 1F69F4CE4B3E
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Jan 2021 21:37:43 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 13 Jan 2021 21:37:44 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] gnupg: upgrade 2.2.26 -> 2.2.27
Date: Wed, 13 Jan 2021 21:37:38 +0800
Message-ID: <1610545059-22137-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 1F69F4CE4B3E.A3DEA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta/recipes-support/gnupg/{gnupg_2.2.26.bb => gnupg_2.2.27.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gnupg/{gnupg_2.2.26.bb => gnupg_2.2.27.bb} (96%)

diff --git a/meta/recipes-support/gnupg/gnupg_2.2.26.bb b/meta/recipes-support/gnupg/gnupg_2.2.27.bb
similarity index 96%
rename from meta/recipes-support/gnupg/gnupg_2.2.26.bb
rename to meta/recipes-support/gnupg/gnupg_2.2.27.bb
index 1c6e68b4b1..8b5fc9983a 100644
--- a/meta/recipes-support/gnupg/gnupg_2.2.26.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.2.27.bb
@@ -20,7 +20,7 @@ SRC_URI_append_class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI_append_class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "517569e6c9fad22175df16be5900f94c991c41e53612db63c14493e814cfff6d"
+SRC_URI[sha256sum] = "34e60009014ea16402069136e0a5f63d9b65f90096244975db5cea74b3d02399"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.25.1



