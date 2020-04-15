Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.6762.1586915560727218271
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2020 18:52:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,385,1580745600"; 
   d="scan'208";a="89044104"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 15 Apr 2020 09:52:38 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id D32CB50A996E
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2020 09:42:05 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 15 Apr 2020 09:52:33 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 15 Apr 2020 09:52:40 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] bison: upgrade 3.5.3 -> 3.5.4
Date: Wed, 15 Apr 2020 01:33:37 -0700
Message-ID: <1586939618-29727-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: D32CB50A996E.A4216
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta/recipes-devtools/bison/{bison_3.5.3.bb => bison_3.5.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/bison/{bison_3.5.3.bb => bison_3.5.4.bb} (94%)

diff --git a/meta/recipes-devtools/bison/bison_3.5.3.bb b/meta/recipes-devtools/bison/bison_3.5.4.bb
similarity index 94%
rename from meta/recipes-devtools/bison/bison_3.5.3.bb
rename to meta/recipes-devtools/bison/bison_3.5.4.bb
index 27e09434f8..59c34f7297 100644
--- a/meta/recipes-devtools/bison/bison_3.5.3.bb
+++ b/meta/recipes-devtools/bison/bison_3.5.4.bb
@@ -13,7 +13,7 @@ SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
            file://dont-depend-on-help2man.patch.patch \
            file://add-with-bisonlocaledir.patch \
 "
-SRC_URI[sha256sum] = "2bf85b5f88a5f2fa8069aed2a2dfc3a9f8d15a97e59c713e3906e5fdd982a7c4"
+SRC_URI[sha256sum] = "4c17e99881978fa32c05933c5262457fa5b2b611668454f8dc2a695cd6b3720c"
 
 # No point in hardcoding path to m4, just use PATH
 EXTRA_OECONF += "M4=m4"
-- 
2.17.1



