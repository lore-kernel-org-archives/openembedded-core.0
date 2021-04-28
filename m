Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.9240.1619600629347247547
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Apr 2021 02:03:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=neutral (domain: fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@fujitsu.com)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AB5rjbavYFb/RWMc/lD8ZDOGk7skCCIMji2hD?=
 =?us-ascii?q?6mlwRA09T+WzvamV88gz/xnylToXRTUcicmNUZPwJE/02JZp7eAqXIuKcxLhvA?=
 =?us-ascii?q?KTQb1KyavH73neFzbl9uhbvJ0QEZRWLNHrF1B1gYLbzWCDc+oI+9WM/KC2ieq2?=
 =?us-ascii?q?9R4EJmtXQpt95AR0ABvzKCNLbTRBbKBUKLOsouBDpzamZE0NaNW6CnQvT4H41r?=
 =?us-ascii?q?r2vaOjRRYHAhI9gTP+7g+A2frdCBiX3hAXTjNJz/MDyAH+4mjEz5Tmieiyzlvn?=
 =?us-ascii?q?ymfP844+oqqb9vJzQNyLltMOKijhziKhZIFaUbWEuzwvydvfkWoCoZ3dpQs6Jc?=
 =?us-ascii?q?Rv5zf0dmGxmxHk3A7ty3IA8HnnoGXo+UfLkIjoQi4gEcpdicZ8ehvd0UApu9Zx?=
 =?us-ascii?q?y+Zq8guixvxqMS8=3D?=
X-IronPort-AV: E=Sophos;i="5.82,257,1613404800"; 
   d="scan'208";a="107669069"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 Apr 2021 17:03:42 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 13F634D0BA61
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Apr 2021 17:03:38 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 28 Apr 2021 17:03:37 +0800
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libhandy: upgrade 1.2.1 -> 1.2.2
Date: Wed, 28 Apr 2021 17:02:47 +0800
Message-ID: <1619600568-22344-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 13F634D0BA61.A8A85
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libhandy/{libhandy_1.2.1.bb => libhandy_1.2.2.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libhandy/{libhandy_1.2.1.bb => libhandy_1.2.2.bb} (95%)

diff --git a/meta/recipes-gnome/libhandy/libhandy_1.2.1.bb b/meta/recipes-gnome/libhandy/libhandy_1.2.2.bb
similarity index 95%
rename from meta/recipes-gnome/libhandy/libhandy_1.2.1.bb
rename to meta/recipes-gnome/libhandy/libhandy_1.2.2.bb
index 68c8e01940..9652948a35 100644
--- a/meta/recipes-gnome/libhandy/libhandy_1.2.1.bb
+++ b/meta/recipes-gnome/libhandy/libhandy_1.2.2.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https"
-SRCREV = "e6e5b4f747d43f10ad2af18060bf1c1d034c9c1a"
+SRCREV = "09f36006b26f41a2bb383b0c853e954c5792cfe1"
 S = "${WORKDIR}/git"
 
 GIR_MESON_ENABLE_FLAG = 'enabled'
-- 
2.25.1



