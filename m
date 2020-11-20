Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.21551.1605852285933685146
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2020 22:04:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,355,1599494400"; 
   d="scan'208";a="101576522"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Nov 2020 14:04:40 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 5FF174CE3A6C
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2020 14:04:37 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 20 Nov 2020 14:04:37 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] gmp: upgrade 6.2.0 -> 6.2.1
Date: Fri, 20 Nov 2020 23:45:36 +0800
Message-ID: <1605887136-37452-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 5FF174CE3A6C.A48ED
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta/recipes-support/gmp/{gmp_6.2.0.bb => gmp_6.2.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gmp/{gmp_6.2.0.bb => gmp_6.2.1.bb} (89%)

diff --git a/meta/recipes-support/gmp/gmp_6.2.0.bb b/meta/recipes-support/gmp/gmp_6.2.1.bb
similarity index 89%
rename from meta/recipes-support/gmp/gmp_6.2.0.bb
rename to meta/recipes-support/gmp/gmp_6.2.1.bb
index a19c74fca8..3c50f928ab 100644
--- a/meta/recipes-support/gmp/gmp_6.2.0.bb
+++ b/meta/recipes-support/gmp/gmp_6.2.1.bb
@@ -13,8 +13,8 @@ SRC_URI = "https://gmplib.org/download/${BPN}/${BP}${REVISION}.tar.bz2 \
            file://0001-Append-the-user-provided-flags-to-the-auto-detected-.patch \
            file://0001-confiure.ac-Believe-the-cflags-from-environment.patch \
            "
-SRC_URI[md5sum] = "c24161e0dd44cae78cd5f67193492a21"
-SRC_URI[sha256sum] = "f51c99cb114deb21a60075ffb494c1a210eb9d7cb729ed042ddb7de9534451ea"
+SRC_URI[md5sum] = "28971fc21cf028042d4897f02fd355ea"
+SRC_URI[sha256sum] = "eae9326beb4158c386e39a356818031bd28f3124cf915f8c5b1dc4c7a36b4d7c"
 
 acpaths = ""
 
-- 
2.25.1



