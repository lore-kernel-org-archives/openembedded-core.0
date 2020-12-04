Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.8720.1607049146981540717
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 18:32:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,390,1599494400"; 
   d="scan'208";a="102047299"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Dec 2020 10:32:26 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 41F744CE546D
	for <openembedded-core@lists.openembedded.org>; Fri,  4 Dec 2020 10:32:21 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 4 Dec 2020 10:32:21 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] lighttpd: upgrade 1.4.55 -> 1.4.56
Date: Fri, 4 Dec 2020 10:32:19 +0800
Message-ID: <1607049139-63007-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 41F744CE546D.A10EF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../lighttpd/{lighttpd_1.4.55.bb => lighttpd_1.4.56.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.55.bb => lighttpd_1.4.56.bb} (96%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.55.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.56.bb
similarity index 96%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.55.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.56.bb
index 7a255ce2f2..97d3a2aabf 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.55.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.56.bb
@@ -19,8 +19,8 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
         file://0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch \
         "
 
-SRC_URI[md5sum] = "be4bda2c28bcbdac6eb941528f6edf03"
-SRC_URI[sha256sum] = "6a0b50e9c9d5cc3d9e48592315c25a2d645858f863e1ccd120507a30ce21e927"
+SRC_URI[md5sum] = "9d94f68c8106bfcdfe7aafa0a13f45a8"
+SRC_URI[sha256sum] = "e4ce84cd79e8ae8ba193c7a7cc79c4afba9a076b443ef9f8d4bcd13a3354df77"
 
 PACKAGECONFIG ??= "openssl pcre zlib \
     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
-- 
2.25.1



