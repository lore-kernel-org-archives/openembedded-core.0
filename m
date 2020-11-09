Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.7444.1604898821689558458
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2020 21:13:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,462,1596470400"; 
   d="scan'208";a="101078358"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 09 Nov 2020 13:13:21 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 333374CE3A63
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Nov 2020 13:13:18 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 9 Nov 2020 13:13:19 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] iproute2: upgrade 5.8.0 -> 5.9.0
Date: Mon, 9 Nov 2020 13:13:17 +0800
Message-ID: <1604898797-61898-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 333374CE3A63.A2100
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

0001-devlink.c-add-missing-include.patch
Removed since this is included in 5.9.0.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../iproute2/{iproute2_5.8.0.bb => iproute2_5.9.0.bb}          | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_5.8.0.bb => iproute2_5.9.0.bb} (64%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_5.8.0.bb b/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb
similarity index 64%
rename from meta/recipes-connectivity/iproute2/iproute2_5.8.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb
index 3a590f9122..0e6a53e6a4 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_5.8.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb
@@ -2,10 +2,9 @@ require iproute2.inc
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-libc-compat.h-add-musl-workaround.patch \
-           file://0001-devlink.c-add-missing-include.patch \
            "
 
-SRC_URI[sha256sum] = "cfcd1f890290f8c8afcc91d9444ad929b9252c16f9ab3f286c50dd3c59dc646e"
+SRC_URI[sha256sum] = "a25dac94bcdcf2f73316c7f812115ea7a5710580bad892b08a83d00c6b33dacf"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
2.25.1



