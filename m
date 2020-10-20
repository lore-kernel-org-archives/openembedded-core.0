Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.11574.1603164673164841260
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2020 20:31:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,395,1596470400"; 
   d="scan'208";a="100316619"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Oct 2020 11:31:05 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 9CB4A48990D5
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2020 11:31:01 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 20 Oct 2020 11:30:59 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] python3-pycairo: upgrade 1.19.1 -> 1.20.0
Date: Tue, 20 Oct 2020 11:30:59 +0800
Message-ID: <1603164659-37975-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 9CB4A48990D5.A10B3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{python3-pycairo_1.19.1.bb => python3-pycairo_1.20.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pycairo_1.19.1.bb => python3-pycairo_1.20.0.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-pycairo_1.19.1.bb b/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-pycairo_1.19.1.bb
rename to meta/recipes-devtools/python/python3-pycairo_1.20.0.bb
index 34c8543bce..37faabcdfb 100644
--- a/meta/recipes-devtools/python/python3-pycairo_1.19.1.bb
+++ b/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb
@@ -13,8 +13,8 @@ DEPENDS = "cairo python3"
 SRC_URI = "https://github.com/pygobject/pycairo/releases/download/v${PV}/pycairo-${PV}.tar.gz"
 UPSTREAM_CHECK_URI = "https://github.com/pygobject/pycairo/releases/"
 
-SRC_URI[md5sum] = "59bc5c5d1debc3af0f6791af9d612551"
-SRC_URI[sha256sum] = "2c143183280feb67f5beb4e543fd49990c28e7df427301ede04fc550d3562e84"
+SRC_URI[md5sum] = "a1f9b661a0000c2f42281db933284451"
+SRC_URI[sha256sum] = "5695a10cb7f9ae0d01f665b56602a845b0a8cb17e2123bfece10c2e58552468c"
 
 S = "${WORKDIR}/pycairo-${PV}"
 
-- 
2.25.1



