Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.3460.1585100617988134149
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2020 18:43:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,302,1580745600"; 
   d="scan'208";a="87206042"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 25 Mar 2020 09:43:37 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 8E7E349DF129
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2020 09:33:21 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 25 Mar 2020 09:43:31 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 25 Mar 2020 09:43:40 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] gnupg: upgrade 2.2.19 -> 2.2.20
Date: Tue, 24 Mar 2020 23:47:50 -0700
Message-ID: <1585118872-33976-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 8E7E349DF129.A06CC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../gnupg/{gnupg_2.2.19.bb => gnupg_2.2.20.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.2.19.bb => gnupg_2.2.20.bb} (95%)

diff --git a/meta/recipes-support/gnupg/gnupg_2.2.19.bb b/meta/recipes-support/gnupg/gnupg_2.2.20.bb
similarity index 95%
rename from meta/recipes-support/gnupg/gnupg_2.2.19.bb
rename to meta/recipes-support/gnupg/gnupg_2.2.20.bb
index c07bff13be..f754573c88 100644
--- a/meta/recipes-support/gnupg/gnupg_2.2.19.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.2.20.bb
@@ -20,8 +20,8 @@ SRC_URI_append_class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI_append_class-nativesdk = " file://relocate.patch"
 
-SRC_URI[md5sum] = "cb3b373d08ba078c325299945a7f2818"
-SRC_URI[sha256sum] = "242554c0e06f3a83c420b052f750b65ead711cc3fddddb5e7274fcdbb4e9dec0"
+SRC_URI[md5sum] = "4ff88920cf52b35db0dedaee87bdbbb1"
+SRC_URI[sha256sum] = "04a7c9d48b74c399168ee8270e548588ddbe52218c337703d7f06373d326ca30"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.17.1



