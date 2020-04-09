Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.3799.1586412335434597876
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2020 23:05:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,361,1580745600"; 
   d="scan'208";a="88733198"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 09 Apr 2020 14:05:34 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 051BC50A9971
	for <openembedded-core@lists.openembedded.org>; Thu,  9 Apr 2020 13:55:07 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 9 Apr 2020 14:05:30 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] man-db: upgrade 2.9.0 -> 2.9.1
Date: Thu, 9 Apr 2020 22:49:47 +0800
Message-ID: <1586443787-20822-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 051BC50A9971.A4C64
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../man-db/{man-db_2.9.0.bb => man-db_2.9.1.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/man-db/{man-db_2.9.0.bb => man-db_2.9.1.bb} (92%)

diff --git a/meta/recipes-extended/man-db/man-db_2.9.0.bb b/meta/recipes-extended/man-db/man-db_2.9.1.bb
similarity index 92%
rename from meta/recipes-extended/man-db/man-db_2.9.0.bb
rename to meta/recipes-extended/man-db/man-db_2.9.1.bb
index 5b017e8023..87149dcb2e 100644
--- a/meta/recipes-extended/man-db/man-db_2.9.0.bb
+++ b/meta/recipes-extended/man-db/man-db_2.9.1.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://docs/COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/man-db/man-db-${PV}.tar.xz \
            file://99_mandb \
            file://man_db.conf-avoid-multilib-install-file-conflict.patch"
-SRC_URI[md5sum] = "897576a19ecbef376a916485608cd790"
-SRC_URI[sha256sum] = "5d4aacd9e8876d6a3203a889860c3524c293c38f04111a3350deab8a6cd3e261"
+SRC_URI[md5sum] = "593f4f0a26ab4f66f5b81cf6c0c7364c"
+SRC_URI[sha256sum] = "ba3d8afc5c09a7265a8dabfa0e7c1f4b3ab97df9abf1f6810faa8f301056c74f"
 
 DEPENDS = "libpipeline gdbm groff-native base-passwd"
 RDEPENDS_${PN} += "base-passwd"
-- 
2.17.1



