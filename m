Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.8050.1595553503077358917
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2020 18:18:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,388,1589212800"; 
   d="scan'208";a="96838967"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 24 Jul 2020 09:18:17 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 5DDC94CE5070
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2020 09:18:15 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 24 Jul 2020 09:18:16 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] libevdev:upgrade 1.9.0 -> 1.9.1
Date: Fri, 24 Jul 2020 09:18:06 +0800
Message-ID: <1595553487-78480-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 5DDC94CE5070.A43B9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../libevdev/{libevdev_1.9.0.bb => libevdev_1.9.1.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libevdev/{libevdev_1.9.0.bb => libevdev_1.9.1.bb} (78%)

diff --git a/meta/recipes-support/libevdev/libevdev_1.9.0.bb b/meta/recipes-support/libevdev/libevdev_1.9.1.bb
similarity index 78%
rename from meta/recipes-support/libevdev/libevdev_1.9.0.bb
rename to meta/recipes-support/libevdev/libevdev_1.9.1.bb
index a2116a492f..633e0af995 100644
--- a/meta/recipes-support/libevdev/libevdev_1.9.0.bb
+++ b/meta/recipes-support/libevdev/libevdev_1.9.1.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=75aae0d38feea6fda97ca381cb9132eb \
 
 SRC_URI = "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz \
            file://determinism.patch"
-SRC_URI[md5sum] = "13c3f0911f9326d4b9fa103365f84421"
-SRC_URI[sha256sum] = "e7e18a64264f2dea19b6c50a481f8c062529d42919ccda0bc861495bce28eb9e"
+SRC_URI[md5sum] = "58286a834ae14536caf9cab8633419cf"
+SRC_URI[sha256sum] = "f5603c48c5afd76b14df7a5124e0a94a102f8da0d45826192325069d1bbc7acb"
 
 inherit autotools pkgconfig
 
-- 
2.25.1



