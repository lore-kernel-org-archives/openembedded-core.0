Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.7919.1610545093880391404
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jan 2021 05:38:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,344,1602518400"; 
   d="scan'208";a="103445273"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 13 Jan 2021 21:38:10 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 45E1D4CE1A08
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Jan 2021 21:38:05 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 13 Jan 2021 21:38:06 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] iproute2: upgrade 5.9.0 -> 5.10.0
Date: Wed, 13 Jan 2021 21:38:01 +0800
Message-ID: <1610545081-22211-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 45E1D4CE1A08.A12C7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../iproute2/{iproute2_5.9.0.bb => iproute2_5.10.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_5.9.0.bb => iproute2_5.10.0.bb} (75%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb b/meta/recipes-connectivity/iproute2/iproute2_5.10.0.bb
similarity index 75%
rename from meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_5.10.0.bb
index 0e6a53e6a4..4be9c82474 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_5.10.0.bb
@@ -4,7 +4,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-libc-compat.h-add-musl-workaround.patch \
            "
 
-SRC_URI[sha256sum] = "a25dac94bcdcf2f73316c7f812115ea7a5710580bad892b08a83d00c6b33dacf"
+SRC_URI[sha256sum] = "a54a34ae309c0406b2d1fb3a46158613ffb83d33fefd5d4a27f0010237ac53e9"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
2.25.1



