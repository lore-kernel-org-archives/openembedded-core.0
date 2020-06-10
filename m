Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.5650.1591774312645073602
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2020 00:31:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,495,1583164800"; 
   d="scan'208";a="94230665"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 10 Jun 2020 15:31:51 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id D7A034CE26DE
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2020 15:31:49 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 10 Jun 2020 15:31:49 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] [OE-core] [PATCH] strace:upgrade 5.6 -> 5.7
Date: Wed, 10 Jun 2020 15:31:47 +0800
Message-ID: <1591774307-3878-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: D7A034CE26DE.A3E5F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta/recipes-devtools/strace/{strace_5.6.bb => strace_5.7.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/strace/{strace_5.6.bb => strace_5.7.bb} (92%)

diff --git a/meta/recipes-devtools/strace/strace_5.6.bb b/meta/recipes-devtools/strace/strace_5.7.bb
similarity index 92%
rename from meta/recipes-devtools/strace/strace_5.6.bb
rename to meta/recipes-devtools/strace/strace_5.7.bb
index 53679cd0d2..ed422b10c3 100644
--- a/meta/recipes-devtools/strace/strace_5.6.bb
+++ b/meta/recipes-devtools/strace/strace_5.7.bb
@@ -15,8 +15,8 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://uintptr_t.patch \
            file://0001-strace-fix-reproducibilty-issues.patch \
            "
-SRC_URI[md5sum] = "f8e0394d4e537b3faadf0a72f5d1d17e"
-SRC_URI[sha256sum] = "189968eeae06ed9e20166ec55a830943c84374676a457c9fe010edc7541f1b01"
+SRC_URI[md5sum] = "8c35b8ebf187b2ec18209bd7bbd16e7a"
+SRC_URI[sha256sum] = "b284b59f9bcd95b9728cea5bd5c0edc5ebe360af73dc76fbf6334f11c777ccd8"
 
 inherit autotools ptest
 
-- 
2.17.1



