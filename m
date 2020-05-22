Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.9797.1590139411561295689
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2020 02:23:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,421,1583164800"; 
   d="scan'208";a="92800464"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 22 May 2020 17:23:30 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id A42E846B5FAD
	for <openembedded-core@lists.openembedded.org>; Fri, 22 May 2020 17:23:24 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 22 May 2020 17:23:25 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] iproute2: upgrade 5.5.0 -> 5.6.0
Date: Sat, 23 May 2020 02:23:23 +0800
Message-ID: <1590171803-9457-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: A42E846B5FAD.A373C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../iproute2/{iproute2_5.5.0.bb => iproute2_5.6.0.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_5.5.0.bb => iproute2_5.6.0.bb} (65%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_5.5.0.bb b/meta/recipes-connectivity/iproute2/iproute2_5.6.0.bb
similarity index 65%
rename from meta/recipes-connectivity/iproute2/iproute2_5.5.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_5.6.0.bb
index 7ad4b8eee6..9ab9053739 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_5.5.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_5.6.0.bb
@@ -4,8 +4,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-libc-compat.h-add-musl-workaround.patch \
           "
 
-SRC_URI[md5sum] = "ee8e2cdb416d4a8ef39525d39ab7c2d0"
-SRC_URI[sha256sum] = "bac543435cac208a11db44c9cc8e35aa902befef8750594654ee71941c388f7b"
+SRC_URI[md5sum] = "9da0c352707c34b8b1fec3bf42fcfd09"
+SRC_URI[sha256sum] = "1b5b0e25ce6e23da7526ea1da044e814ad85ba761b10dd29c2b027c056b04692"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
2.17.1



