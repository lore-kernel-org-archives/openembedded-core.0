Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.5894.1602814811033113614
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2020 19:20:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,381,1596470400"; 
   d="scan'208";a="100211450"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 16 Oct 2020 10:20:06 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 3D0CF4CE3119
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 10:20:05 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 16 Oct 2020 10:20:05 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] libuv: upgrade 1.39.0 -> 1.40.0
Date: Fri, 16 Oct 2020 10:19:57 +0800
Message-ID: <1602814797-29696-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 3D0CF4CE3119.A35C1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../libuv/{libuv_1.39.0.bb => libuv_1.40.0.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/libuv/{libuv_1.39.0.bb => libuv_1.40.0.bb} (90%)

diff --git a/meta/recipes-connectivity/libuv/libuv_1.39.0.bb b/meta/recipes-connectivity/libuv/libuv_1.40.0.bb
similarity index 90%
rename from meta/recipes-connectivity/libuv/libuv_1.39.0.bb
rename to meta/recipes-connectivity/libuv/libuv_1.40.0.bb
index b6ce4757fd..f793db09be 100644
--- a/meta/recipes-connectivity/libuv/libuv_1.39.0.bb
+++ b/meta/recipes-connectivity/libuv/libuv_1.40.0.bb
@@ -4,7 +4,7 @@ BUGTRACKER = "https://github.com/libuv/libuv/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a68902a430e32200263d182d44924d47"
 
-SRCREV = "25f4b8b8a3c0f934158cd37a37b0525d75ca488e"
+SRCREV = "4e69e333252693bd82d6338d6124f0416538dbfc"
 SRC_URI = "git://github.com/libuv/libuv;branch=v1.x"
 
 S = "${WORKDIR}/git"
-- 
2.25.1



