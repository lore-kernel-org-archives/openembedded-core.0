Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web10.8050.1595553503077358917
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2020 18:18:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,388,1589212800"; 
   d="scan'208";a="96838966"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 24 Jul 2020 09:18:17 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 052344CE506F
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2020 09:18:16 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 24 Jul 2020 09:18:17 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] mpg123:upgrade 1.26.2 -> 1.26.3
Date: Fri, 24 Jul 2020 09:18:07 +0800
Message-ID: <1595553487-78480-2-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1595553487-78480-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1595553487-78480-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 052344CE506F.A0838
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../mpg123/{mpg123_1.26.2.bb => mpg123_1.26.3.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.26.2.bb => mpg123_1.26.3.bb} (96%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.26.2.bb b/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb
similarity index 96%
rename from meta/recipes-multimedia/mpg123/mpg123_1.26.2.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb
index aaa66e17a6..0746d8d47d 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.26.2.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1e86753638d3cf2512528b99079bc4f3"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "00f7bf7ea64fcec2c9d07751d6ad8849343ee09c282ea3b0d5dd486e886e2ff3"
+SRC_URI[sha256sum] = "30c998785a898f2846deefc4d17d6e4683a5a550b7eacf6ea506e30a7a736c6e"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.25.1



