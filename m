Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.5327.1610527228679380602
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jan 2021 00:40:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,343,1602518400"; 
   d="scan'208";a="103437746"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 13 Jan 2021 16:40:26 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 8FE4A4CE4B3E
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Jan 2021 16:40:19 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 13 Jan 2021 16:40:20 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] findutils: upgrade 4.7.0 -> 4.8.0
Date: Wed, 13 Jan 2021 16:40:15 +0800
Message-ID: <1610527215-21464-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 8FE4A4CE4B3E.A5CFE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../findutils/{findutils_4.7.0.bb => findutils_4.8.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/findutils/{findutils_4.7.0.bb => findutils_4.8.0.bb} (69%)

diff --git a/meta/recipes-extended/findutils/findutils_4.7.0.bb b/meta/recipes-extended/findutils/findutils_4.8.0.bb
similarity index 69%
rename from meta/recipes-extended/findutils/findutils_4.7.0.bb
rename to meta/recipes-extended/findutils/findutils_4.8.0.bb
index 59688e528a..568aaffe72 100644
--- a/meta/recipes-extended/findutils/findutils_4.7.0.bb
+++ b/meta/recipes-extended/findutils/findutils_4.8.0.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 DEPENDS = "bison-native"
 
-SRC_URI[md5sum] = "731356dec4b1109b812fecfddfead6b2"
-SRC_URI[sha256sum] = "c5fefbdf9858f7e4feb86f036e1247a54c79fc2d8e4b7064d5aaa1f47dfa789a"
+SRC_URI[md5sum] = "eeefe2e6380931a77dfa6d9350b43186"
+SRC_URI[sha256sum] = "57127b7e97d91282c6ace556378d5455a9509898297e46e10443016ea1387164"
 
 # http://savannah.gnu.org/bugs/?27299
 CACHED_CONFIGUREVARS += "gl_cv_func_wcwidth_works=yes"
-- 
2.25.1



