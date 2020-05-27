Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.8688.1590593544110992396
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 08:32:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,441,1583164800"; 
   d="scan'208";a="93220278"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 27 May 2020 23:32:19 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 11C1B50A9975
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2020 23:32:19 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 27 May 2020 23:32:19 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] liburcu: upgrade 0.12.0 -> 0.12.1
Date: Wed, 27 May 2020 23:32:10 +0800
Message-ID: <1590593530-63313-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 11C1B50A9975.A55EB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../liburcu/{liburcu_0.12.0.bb => liburcu_0.12.1.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/liburcu/{liburcu_0.12.0.bb => liburcu_0.12.1.bb} (83%)

diff --git a/meta/recipes-support/liburcu/liburcu_0.12.0.bb b/meta/recipes-support/liburcu/liburcu_0.12.1.bb
similarity index 83%
rename from meta/recipes-support/liburcu/liburcu_0.12.0.bb
rename to meta/recipes-support/liburcu/liburcu_0.12.1.bb
index 0c20abe6d5..3a5ecbcc2d 100644
--- a/meta/recipes-support/liburcu/liburcu_0.12.0.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.12.1.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e548d28737289d75a8f1e01ba2fd7825 \
 
 SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "d923a42ce38e33e883313003c8afd559"
-SRC_URI[sha256sum] = "409b1be506989e1d26543194df1a79212be990fe5d4fd84f34f019efed989f97"
+SRC_URI[md5sum] = "5e419d7b30d0d98bffe0014c704ae936"
+SRC_URI[sha256sum] = "bbfaead0345642b97e0de90f889dfbab4b2643a6a5e5c6bb59cd0d26fc0bcd0e"
 
 S = "${WORKDIR}/userspace-rcu-${PV}"
 inherit autotools multilib_header
-- 
2.17.1



