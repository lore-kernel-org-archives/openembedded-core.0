Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.9226.1619600433001417528
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Apr 2021 02:00:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=neutral (domain: fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@fujitsu.com)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3A0E5AOa78bmAMkTIyPQPXwCjXdLJzesId70hD?=
 =?us-ascii?q?6mlaTxtJfsuE0/2/hfhz726RtB89elEF3eqBNq6JXG/G+fdOjLU5EL++UGDd1l?=
 =?us-ascii?q?eAA41v4IDryT+lOwCWzIRg/Ih6dawWMrzNJHxbqeq/3wWiCdYnx7C8gcWVrMPT?=
 =?us-ascii?q?1W1kQw0vS4wI1XYbNi+hHkd7RBZLCPMCffLy2uN8uzGidX4LB/7LZEUtYu6rnb?=
 =?us-ascii?q?32vaOjSRsHKjpi0wOWkA6vgYSQLzGomjsYTBNDqI1PzVT4?=
X-IronPort-AV: E=Sophos;i="5.82,257,1613404800"; 
   d="scan'208";a="107668891"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 Apr 2021 17:00:28 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 9576A4D0B8AA
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Apr 2021 17:00:22 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 28 Apr 2021 17:00:12 +0800
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] e2fsprogs: upgrade 1.46.1 -> 1.46.2
Date: Wed, 28 Apr 2021 16:59:28 +0800
Message-ID: <1619600372-22241-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 9576A4D0B8AA.A5660
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../e2fsprogs/{e2fsprogs_1.46.1.bb => e2fsprogs_1.46.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.46.1.bb => e2fsprogs_1.46.2.bb} (99%)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb
similarity index 99%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb
index be8b67c35d..d65cfbec66 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb
@@ -11,7 +11,7 @@ SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permissio
 "
 
 
-SRCREV = "3114c623f56b0d61f5f34b85f7b23d28f6c848c0"
+SRCREV = "1eea0e2bd9a6760ebad834d5d2cf700fffe5ebe2"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
 
 EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
-- 
2.25.1



