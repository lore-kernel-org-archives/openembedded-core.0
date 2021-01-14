Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.2583.1610591586457204183
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jan 2021 18:33:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,345,1602518400"; 
   d="scan'208";a="103463389"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 14 Jan 2021 10:32:54 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 874CC4CE4B3E
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Jan 2021 10:32:52 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 14 Jan 2021 10:32:54 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] libpcap: upgrade 1.9.1 -> 1.10.0
Date: Thu, 14 Jan 2021 10:32:48 +0800
Message-ID: <1610591568-23760-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 874CC4CE4B3E.A4727
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../libpcap/{libpcap_1.9.1.bb => libpcap_1.10.0.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/libpcap/{libpcap_1.9.1.bb => libpcap_1.10.0.bb} (92%)

diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.9.1.bb b/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb
similarity index 92%
rename from meta/recipes-connectivity/libpcap/libpcap_1.9.1.bb
rename to meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb
index 35bb5650b3..967eabcc13 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.9.1.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb
@@ -12,8 +12,8 @@ DEPENDS = "flex-native bison-native"
 
 SRC_URI = "https://www.tcpdump.org/release/${BP}.tar.gz \
            "
-SRC_URI[md5sum] = "21af603d9a591c7d96a6457021d84e6c"
-SRC_URI[sha256sum] = "635237637c5b619bcceba91900666b64d56ecb7be63f298f601ec786ce087094"
+SRC_URI[md5sum] = "8c12dc19dd7e0d02d2bb6596eb5a71c7"
+SRC_URI[sha256sum] = "8d12b42623eeefee872f123bd0dc85d535b00df4d42e865f993c40f7bfc92b1e"
 
 inherit autotools binconfig-disabled pkgconfig
 
-- 
2.25.1



