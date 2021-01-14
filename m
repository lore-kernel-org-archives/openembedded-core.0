Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.4658.1610607645659223288
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jan 2021 23:00:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,346,1602518400"; 
   d="scan'208";a="103471043"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 14 Jan 2021 15:00:36 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 118E84CE4B3E
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Jan 2021 15:00:36 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 14 Jan 2021 15:00:35 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] libevdev: upgrade 1.10.0 -> 1.10.1
Date: Thu, 14 Jan 2021 15:00:26 +0800
Message-ID: <1610607626-12697-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 118E84CE4B3E.A5D21
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../libevdev/{libevdev_1.10.0.bb => libevdev_1.10.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libevdev/{libevdev_1.10.0.bb => libevdev_1.10.1.bb} (85%)

diff --git a/meta/recipes-support/libevdev/libevdev_1.10.0.bb b/meta/recipes-support/libevdev/libevdev_1.10.1.bb
similarity index 85%
rename from meta/recipes-support/libevdev/libevdev_1.10.0.bb
rename to meta/recipes-support/libevdev/libevdev_1.10.1.bb
index 2620cbe9f7..353ded6f28 100644
--- a/meta/recipes-support/libevdev/libevdev_1.10.0.bb
+++ b/meta/recipes-support/libevdev/libevdev_1.10.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=75aae0d38feea6fda97ca381cb9132eb \
 
 SRC_URI = "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz \
            file://determinism.patch"
-SRC_URI[sha256sum] = "3522c26e2c148be0ad68ce26fbced408a4185dea90bfe8079dc82b8ace962d4a"
+SRC_URI[sha256sum] = "0330fe8357ece915db9366c1b9a6648941aea6f724b73ad6e71401127aa08932"
 
 inherit autotools pkgconfig
 
-- 
2.25.1



