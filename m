Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.2765.1596705067753328801
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2020 02:11:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,441,1589212800"; 
   d="scan'208";a="97705577"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 06 Aug 2020 17:11:02 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 883814CE34DC
	for <openembedded-core@lists.openembedded.org>; Thu,  6 Aug 2020 17:10:59 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 6 Aug 2020 17:10:54 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] libcap:upgrade 2.41 -> 2.42
Date: Fri, 7 Aug 2020 05:10:51 +0800
Message-ID: <1596748253-123303-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 883814CE34DC.A209B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta/recipes-support/libcap/{libcap_2.41.bb => libcap_2.42.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libcap/{libcap_2.41.bb => libcap_2.42.bb} (96%)

diff --git a/meta/recipes-support/libcap/libcap_2.41.bb b/meta/recipes-support/libcap/libcap_2.42.bb
similarity index 96%
rename from meta/recipes-support/libcap/libcap_2.41.bb
rename to meta/recipes-support/libcap/libcap_2.42.bb
index 52d2f13e16..48f8f92628 100644
--- a/meta/recipes-support/libcap/libcap_2.41.bb
+++ b/meta/recipes-support/libcap/libcap_2.42.bb
@@ -12,7 +12,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
            file://0002-tests-do-not-run-target-executables.patch \
            file://0001-tests-do-not-statically-link-a-test.patch \
            "
-SRC_URI[sha256sum] = "880dac4f97795bf5bd0d77ae6476d8c6a854601eb0c461d5a5b91f07d8e60834"
+SRC_URI[sha256sum] = "3605a9cb60076547ea9f64989e0ba576da9508e4653e8dc40ae54c0d6f443dfd"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
-- 
2.25.1



