Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web08.3274.1611208327081685419
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jan 2021 21:52:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,363,1602518400"; 
   d="scan'208";a="103687017"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 21 Jan 2021 13:51:51 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 303254CE6018
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Jan 2021 13:51:48 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 21 Jan 2021 13:51:47 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] iptables: upgrade 1.8.6 -> 1.8.7
Date: Thu, 21 Jan 2021 13:51:44 +0800
Message-ID: <1611208304-44729-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 303254CE6018.AF5BF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../iptables/{iptables_1.8.6.bb => iptables_1.8.7.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/iptables/{iptables_1.8.6.bb => iptables_1.8.7.bb} (97%)

diff --git a/meta/recipes-extended/iptables/iptables_1.8.6.bb b/meta/recipes-extended/iptables/iptables_1.8.7.bb
similarity index 97%
rename from meta/recipes-extended/iptables/iptables_1.8.6.bb
rename to meta/recipes-extended/iptables/iptables_1.8.7.bb
index 9c15b0bc9d..621f87ff87 100644
--- a/meta/recipes-extended/iptables/iptables_1.8.6.bb
+++ b/meta/recipes-extended/iptables/iptables_1.8.7.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
            file://ip6tables.service \
            file://ip6tables.rules \
            "
-SRC_URI[sha256sum] = "a0f4fe0c3eb8faa5bd9c8376d132f340b9558e750c91deb2d5028aa3d0047767"
+SRC_URI[sha256sum] = "c109c96bb04998cd44156622d36f8e04b140701ec60531a10668cfdff5e8d8f0"
 
 SYSTEMD_SERVICE_${PN} = "\
     iptables.service \
-- 
2.25.1



