Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.7272.1589437720043615178
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2020 23:28:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,390,1583164800"; 
   d="scan'208";a="92042791"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 14 May 2020 14:28:34 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 564544BCC89B
	for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 14:28:29 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 14 May 2020 14:28:29 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] freetype: upgrade 2.10.1 -> 2.10.2
Date: Thu, 14 May 2020 23:28:51 +0800
Message-ID: <1589470131-4303-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 564544BCC89B.A4696
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../freetype/{freetype_2.10.1.bb => freetype_2.10.2.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/freetype/{freetype_2.10.1.bb => freetype_2.10.2.bb} (92%)

diff --git a/meta/recipes-graphics/freetype/freetype_2.10.1.bb b/meta/recipes-graphics/freetype/freetype_2.10.2.bb
similarity index 92%
rename from meta/recipes-graphics/freetype/freetype_2.10.1.bb
rename to meta/recipes-graphics/freetype/freetype_2.10.2.bb
index d1c093054b..1034ddc0d7 100644
--- a/meta/recipes-graphics/freetype/freetype_2.10.1.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.10.2.bb
@@ -15,8 +15,8 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE.TXT;md5=4af6221506f202774ef74f64932878a1
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BP}.tar.xz \
            file://use-right-libtool.patch \
           "
-SRC_URI[md5sum] = "bd42e75127f8431923679480efb5ba8f"
-SRC_URI[sha256sum] = "16dbfa488a21fe827dc27eaf708f42f7aa3bb997d745d31a19781628c36ba26f"
+SRC_URI[md5sum] = "7c0d5a39f232d7eb9f9d7da76bf08074"
+SRC_URI[sha256sum] = "1543d61025d2e6312e0a1c563652555f17378a204a61e99928c9fcef030a2d8b"
 
 UPSTREAM_CHECK_REGEX = "freetype-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.17.1



