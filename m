Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.3651.1603423886980937123
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2020 20:31:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,404,1596470400"; 
   d="scan'208";a="100431606"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 23 Oct 2020 11:31:22 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 715A4486A854
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2020 11:31:20 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 23 Oct 2020 11:31:20 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] freetype: upgrade 2.10.2 -> 2.10.4
Date: Fri, 23 Oct 2020 11:31:18 +0800
Message-ID: <1603423878-98060-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 715A4486A854.AEBCB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../freetype/{freetype_2.10.2.bb => freetype_2.10.4.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/freetype/{freetype_2.10.2.bb => freetype_2.10.4.bb} (92%)

diff --git a/meta/recipes-graphics/freetype/freetype_2.10.2.bb b/meta/recipes-graphics/freetype/freetype_2.10.4.bb
similarity index 92%
rename from meta/recipes-graphics/freetype/freetype_2.10.2.bb
rename to meta/recipes-graphics/freetype/freetype_2.10.4.bb
index 1034ddc0d7..f3562ec30f 100644
--- a/meta/recipes-graphics/freetype/freetype_2.10.2.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.10.4.bb
@@ -15,8 +15,8 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE.TXT;md5=4af6221506f202774ef74f64932878a1
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BP}.tar.xz \
            file://use-right-libtool.patch \
           "
-SRC_URI[md5sum] = "7c0d5a39f232d7eb9f9d7da76bf08074"
-SRC_URI[sha256sum] = "1543d61025d2e6312e0a1c563652555f17378a204a61e99928c9fcef030a2d8b"
+SRC_URI[md5sum] = "0e6c0e9b218be3ba3e26e1d23b1c80dd"
+SRC_URI[sha256sum] = "86a854d8905b19698bbc8f23b860bc104246ce4854dcea8e3b0fb21284f75784"
 
 UPSTREAM_CHECK_REGEX = "freetype-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.25.1



