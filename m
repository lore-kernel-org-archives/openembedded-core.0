Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web08.9044.1619600443438115267
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Apr 2021 02:00:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=neutral (domain: fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@fujitsu.com)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3Az+ln+a8cu920RT0wDL9uk+A4I+orLtY04lQ7?=
 =?us-ascii?q?vn1ZYxpTb8CeioSSjO0WvCWE7Ao5dVMBvZS7OKeGSW7B7pId2+QsFJqrQQWOgg?=
 =?us-ascii?q?WVBa5v4YboyzfjXw3Sn9Q26Y5OaK57YeeQMXFfreLXpDa1CMwhxt7vytHMuc77?=
 =?us-ascii?q?w212RQ9nL4FMhj0JaTqzKUF9SAlYCZdRLvP1ifZvnSaqengcc62Adxs4dtXEzu?=
 =?us-ascii?q?eqqLvWJTYCBzMCrDKFlC6U7tfBeCSw71MzVCxuzN4ZnVT4rw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.82,257,1613404800"; 
   d="scan'208";a="107668909"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 Apr 2021 17:00:42 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 4C4674D0BA61
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Apr 2021 17:00:40 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 28 Apr 2021 17:00:29 +0800
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] gdb: upgrade 10.1 -> 10.2
Date: Wed, 28 Apr 2021 16:59:29 +0800
Message-ID: <1619600372-22241-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1619600372-22241-1-git-send-email-wangmy@fujitsu.com>
References: <1619600372-22241-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 4C4674D0BA61.A4F9C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/gdb/{gdb-10.1.inc => gdb-10.2.inc}        | 2 +-
 .../{gdb-cross-canadian_10.1.bb => gdb-cross-canadian_10.2.bb}  | 0
 .../gdb/{gdb-cross_10.1.bb => gdb-cross_10.2.bb}                | 0
 meta/recipes-devtools/gdb/{gdb_10.1.bb => gdb_10.2.bb}          | 0
 4 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/gdb/{gdb-10.1.inc => gdb-10.2.inc} (92%)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_10.1.bb => gdb-cross-canadian_10.2.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_10.1.bb => gdb-cross_10.2.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb_10.1.bb => gdb_10.2.bb} (100%)

diff --git a/meta/recipes-devtools/gdb/gdb-10.1.inc b/meta/recipes-devtools/gdb/gdb-10.2.inc
similarity index 92%
rename from meta/recipes-devtools/gdb/gdb-10.1.inc
rename to meta/recipes-devtools/gdb/gdb-10.2.inc
index 07de17f84f..0a7df54e9f 100644
--- a/meta/recipes-devtools/gdb/gdb-10.1.inc
+++ b/meta/recipes-devtools/gdb/gdb-10.2.inc
@@ -16,4 +16,4 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0010-Fix-invalid-sigprocmask-call.patch \
            file://0011-gdbserver-ctrl-c-handling.patch \
            "
-SRC_URI[sha256sum] = "f82f1eceeec14a3afa2de8d9b0d3c91d5a3820e23e0a01bbb70ef9f0276b62c0"
+SRC_URI[sha256sum] = "aaa1223d534c9b700a8bec952d9748ee1977513f178727e1bee520ee000b4f29"
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_10.1.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_10.2.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_10.1.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_10.2.bb
diff --git a/meta/recipes-devtools/gdb/gdb-cross_10.1.bb b/meta/recipes-devtools/gdb/gdb-cross_10.2.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross_10.1.bb
rename to meta/recipes-devtools/gdb/gdb-cross_10.2.bb
diff --git a/meta/recipes-devtools/gdb/gdb_10.1.bb b/meta/recipes-devtools/gdb/gdb_10.2.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb_10.1.bb
rename to meta/recipes-devtools/gdb/gdb_10.2.bb
-- 
2.25.1



