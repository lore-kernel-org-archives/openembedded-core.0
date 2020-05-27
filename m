Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.8713.1590593589188468854
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 08:33:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,441,1583164800"; 
   d="scan'208";a="93220310"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 27 May 2020 23:33:08 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 135E150A9974
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2020 23:33:08 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 27 May 2020 23:33:07 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] gdb: upgrade 9.1 -> 9.2
Date: Wed, 27 May 2020 23:33:06 +0800
Message-ID: <1590593586-63390-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 135E150A9974.A6E22
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta/recipes-devtools/gdb/{gdb-9.1.inc => gdb-9.2.inc}        | 4 ++--
 .../{gdb-cross-canadian_9.1.bb => gdb-cross-canadian_9.2.bb}  | 0
 .../gdb/{gdb-cross_9.1.bb => gdb-cross_9.2.bb}                | 0
 meta/recipes-devtools/gdb/{gdb_9.1.bb => gdb_9.2.bb}          | 0
 4 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-9.1.inc => gdb-9.2.inc} (88%)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_9.1.bb => gdb-cross-canadian_9.2.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_9.1.bb => gdb-cross_9.2.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb_9.1.bb => gdb_9.2.bb} (100%)

diff --git a/meta/recipes-devtools/gdb/gdb-9.1.inc b/meta/recipes-devtools/gdb/gdb-9.2.inc
similarity index 88%
rename from meta/recipes-devtools/gdb/gdb-9.1.inc
rename to meta/recipes-devtools/gdb/gdb-9.2.inc
index d019e6b384..017b61ef62 100644
--- a/meta/recipes-devtools/gdb/gdb-9.1.inc
+++ b/meta/recipes-devtools/gdb/gdb-9.2.inc
@@ -17,5 +17,5 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0010-Fix-invalid-sigprocmask-call.patch \
            file://0011-gdbserver-ctrl-c-handling.patch \
            "
-SRC_URI[md5sum] = "f7e9f6236c425097d9e5f18a6ac40655"
-SRC_URI[sha256sum] = "699e0ec832fdd2f21c8266171ea5bf44024bd05164fdf064e4d10cc4cf0d1737"
+SRC_URI[md5sum] = "db95524e554870209ab7d9f8fd8dc557"
+SRC_URI[sha256sum] = "360cd7ae79b776988e89d8f9a01c985d0b1fa21c767a4295e5f88cb49175c555"
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_9.1.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_9.2.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_9.1.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_9.2.bb
diff --git a/meta/recipes-devtools/gdb/gdb-cross_9.1.bb b/meta/recipes-devtools/gdb/gdb-cross_9.2.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross_9.1.bb
rename to meta/recipes-devtools/gdb/gdb-cross_9.2.bb
diff --git a/meta/recipes-devtools/gdb/gdb_9.1.bb b/meta/recipes-devtools/gdb/gdb_9.2.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb_9.1.bb
rename to meta/recipes-devtools/gdb/gdb_9.2.bb
-- 
2.17.1



