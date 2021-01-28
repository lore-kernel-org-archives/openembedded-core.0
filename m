Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.20846.1611812019982760356
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jan 2021 21:33:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; 
   d="scan'208";a="103925377"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 Jan 2021 13:33:28 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id D79EF4CE6785
	for <openembedded-core@lists.openembedded.org>; Thu, 28 Jan 2021 13:33:27 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 28 Jan 2021 13:33:27 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] libcap: upgrade 2.46 -> 2.47
Date: Thu, 28 Jan 2021 13:33:24 +0800
Message-ID: <1611812004-10633-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: D79EF4CE6785.A2C59
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta/recipes-support/libcap/{libcap_2.46.bb => libcap_2.47.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libcap/{libcap_2.46.bb => libcap_2.47.bb} (96%)

diff --git a/meta/recipes-support/libcap/libcap_2.46.bb b/meta/recipes-support/libcap/libcap_2.47.bb
similarity index 96%
rename from meta/recipes-support/libcap/libcap_2.46.bb
rename to meta/recipes-support/libcap/libcap_2.47.bb
index 605a738127..bc4754eab8 100644
--- a/meta/recipes-support/libcap/libcap_2.46.bb
+++ b/meta/recipes-support/libcap/libcap_2.47.bb
@@ -12,7 +12,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
            file://0002-tests-do-not-run-target-executables.patch \
            file://0001-tests-do-not-statically-link-a-test.patch \
            "
-SRC_URI[sha256sum] = "4ed3d11413fa6c9667e49f819808fbb581cd8864b839f87d7c2a02c70f21d8b4"
+SRC_URI[sha256sum] = "af165df45f9fe8b315164ec7143740947489f36ccbe6999b6cdf86e7a8dca04b"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
-- 
2.25.1



