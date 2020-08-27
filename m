Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.9255.1598490994888552984
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2020 18:16:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.76,357,1592841600"; 
   d="scan'208";a="98596670"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 27 Aug 2020 09:16:30 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id D4DFB48990D9
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2020 09:16:24 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 27 Aug 2020 09:16:24 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] libcap:upgrade 2.42 -> 2.43
Date: Thu, 27 Aug 2020 21:16:22 +0800
Message-ID: <1598534184-115749-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: D4DFB48990D9.A5EE8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta/recipes-support/libcap/{libcap_2.42.bb => libcap_2.43.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libcap/{libcap_2.42.bb => libcap_2.43.bb} (96%)

diff --git a/meta/recipes-support/libcap/libcap_2.42.bb b/meta/recipes-support/libcap/libcap_2.43.bb
similarity index 96%
rename from meta/recipes-support/libcap/libcap_2.42.bb
rename to meta/recipes-support/libcap/libcap_2.43.bb
index 48f8f92628..c712c25947 100644
--- a/meta/recipes-support/libcap/libcap_2.42.bb
+++ b/meta/recipes-support/libcap/libcap_2.43.bb
@@ -12,7 +12,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
            file://0002-tests-do-not-run-target-executables.patch \
            file://0001-tests-do-not-statically-link-a-test.patch \
            "
-SRC_URI[sha256sum] = "3605a9cb60076547ea9f64989e0ba576da9508e4653e8dc40ae54c0d6f443dfd"
+SRC_URI[sha256sum] = "512a0e5fc4c1e06d472a20da26aa96a9b9bf2a26b23f094f77f1b8da56cc427f"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
-- 
2.25.1



