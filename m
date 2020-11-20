Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.21633.1605853837890790564
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2020 22:30:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,355,1599494400"; 
   d="scan'208";a="101577495"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Nov 2020 14:30:34 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id EFA1C4CE5450
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2020 14:30:31 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 20 Nov 2020 14:30:32 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] gpgme: upgrade 1.14.0 -> 1.15.0
Date: Sat, 21 Nov 2020 00:11:29 +0800
Message-ID: <1605888689-37941-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: EFA1C4CE5450.A406D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta/recipes-support/gpgme/{gpgme_1.14.0.bb => gpgme_1.15.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gpgme/{gpgme_1.14.0.bb => gpgme_1.15.0.bb} (97%)

diff --git a/meta/recipes-support/gpgme/gpgme_1.14.0.bb b/meta/recipes-support/gpgme/gpgme_1.15.0.bb
similarity index 97%
rename from meta/recipes-support/gpgme/gpgme_1.14.0.bb
rename to meta/recipes-support/gpgme/gpgme_1.15.0.bb
index fb7215381c..9264af8c5d 100644
--- a/meta/recipes-support/gpgme/gpgme_1.14.0.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.15.0.bb
@@ -22,7 +22,7 @@ SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
            file://0008-do-not-auto-check-var-PYTHON.patch \
           "
 
-SRC_URI[sha256sum] = "cef1f710a6b0d28f5b44242713ad373702d1466dcbe512eb4e754d7f35cd4307"
+SRC_URI[sha256sum] = "0b472bc12c7d455906c8a539ec56da0a6480ef1c3a87aa5b74d7125df68d0e5b"
 
 DEPENDS = "libgpg-error libassuan"
 RDEPENDS_${PN}-cpp += "libstdc++"
-- 
2.25.1



