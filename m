Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.21080.1611814334169881348
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jan 2021 22:12:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; 
   d="scan'208";a="103927322"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 Jan 2021 14:12:04 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 246B04CE67A7
	for <openembedded-core@lists.openembedded.org>; Thu, 28 Jan 2021 14:12:04 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 28 Jan 2021 14:12:03 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] libsolv: upgrade 0.7.16 -> 0.7.17
Date: Thu, 28 Jan 2021 14:11:59 +0800
Message-ID: <1611814319-10841-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 246B04CE67A7.A15B7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../libsolv/{libsolv_0.7.16.bb => libsolv_0.7.17.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.7.16.bb => libsolv_0.7.17.bb} (94%)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.16.bb b/meta/recipes-extended/libsolv/libsolv_0.7.17.bb
similarity index 94%
rename from meta/recipes-extended/libsolv/libsolv_0.7.16.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.17.bb
index f7902727c4..8597ea3edb 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.16.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.17.bb
@@ -10,7 +10,7 @@ DEPENDS = "expat zlib"
 SRC_URI = "git://github.com/openSUSE/libsolv.git \
 "
 
-SRCREV = "7046fb004987c7f1b3722628d9a4ca1c67577188"
+SRCREV = "4bc791c0d235eb14bfe4c5da607206bfdfa6983d"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.25.1



