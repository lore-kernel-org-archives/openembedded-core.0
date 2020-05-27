Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.1915.1590540867279883883
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2020 17:54:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,439,1583164800"; 
   d="scan'208";a="93163239"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 27 May 2020 08:54:24 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 3DC4E4BCC89D
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2020 08:54:18 +0800 (CST)
Received: from localhost.localdomain (10.167.225.227) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 27 May 2020 08:54:17 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Subject: [OE-core] [PATCH] python3-pycairo:upgrade 1.19.0 -> 1.19.1
Date: Wed, 27 May 2020 17:54:15 +0800
Message-ID: <1590573255-41414-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 3DC4E4BCC89D.A6075
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{python3-pycairo_1.19.0.bb => python3-pycairo_1.19.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pycairo_1.19.0.bb => python3-pycairo_1.19.1.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-pycairo_1.19.0.bb b/meta/recipes-devtools/python/python3-pycairo_1.19.1.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-pycairo_1.19.0.bb
rename to meta/recipes-devtools/python/python3-pycairo_1.19.1.bb
index 8f60834c17..34c8543bce 100644
--- a/meta/recipes-devtools/python/python3-pycairo_1.19.0.bb
+++ b/meta/recipes-devtools/python/python3-pycairo_1.19.1.bb
@@ -13,8 +13,8 @@ DEPENDS = "cairo python3"
 SRC_URI = "https://github.com/pygobject/pycairo/releases/download/v${PV}/pycairo-${PV}.tar.gz"
 UPSTREAM_CHECK_URI = "https://github.com/pygobject/pycairo/releases/"
 
-SRC_URI[md5sum] = "38b84416021640b01250c8f8ec4c52d4"
-SRC_URI[sha256sum] = "4f5ba9374a46c98729dd3727d993f5e17ed0286fd6738ed464fe4efa0612d19c"
+SRC_URI[md5sum] = "59bc5c5d1debc3af0f6791af9d612551"
+SRC_URI[sha256sum] = "2c143183280feb67f5beb4e543fd49990c28e7df427301ede04fc550d3562e84"
 
 S = "${WORKDIR}/pycairo-${PV}"
 
-- 
2.17.1



