Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.1541.1590199557984621325
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2020 19:05:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,423,1583164800"; 
   d="scan'208";a="92848536"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 23 May 2020 10:05:53 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 526AC46B5FAD
	for <openembedded-core@lists.openembedded.org>; Sat, 23 May 2020 10:05:52 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Sat, 23 May 2020 10:05:53 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] strace: upgrade 5.5 -> 5.6
Date: Sat, 23 May 2020 19:05:36 +0800
Message-ID: <1590231936-22488-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 526AC46B5FAD.A9235
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta/recipes-devtools/strace/{strace_5.5.bb => strace_5.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/strace/{strace_5.5.bb => strace_5.6.bb} (92%)

diff --git a/meta/recipes-devtools/strace/strace_5.5.bb b/meta/recipes-devtools/strace/strace_5.6.bb
similarity index 92%
rename from meta/recipes-devtools/strace/strace_5.5.bb
rename to meta/recipes-devtools/strace/strace_5.6.bb
index ae552da028..5015e87b22 100644
--- a/meta/recipes-devtools/strace/strace_5.5.bb
+++ b/meta/recipes-devtools/strace/strace_5.6.bb
@@ -15,8 +15,8 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://uintptr_t.patch \
            file://0001-strace-fix-reproducibilty-issues.patch \
            "
-SRC_URI[md5sum] = "dbce2e84632b39a4ed86b9fc60447af9"
-SRC_URI[sha256sum] = "9f58958c8e59ea62293d907d10572e352b582bd7948ed21aa28ebb47e5bf30ff"
+SRC_URI[md5sum] = "f8e0394d4e537b3faadf0a72f5d1d17e"
+SRC_URI[sha256sum] = "189968eeae06ed9e20166ec55a830943c84374676a457c9fe010edc7541f1b01"
 
 inherit autotools ptest
 
-- 
2.17.1



