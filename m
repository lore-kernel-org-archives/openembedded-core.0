Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.5604.1608859855690533082
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Dec 2020 17:30:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,446,1599494400"; 
   d="scan'208";a="102919480"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 25 Dec 2020 09:30:54 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 2FCD54CE5CCA
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Dec 2020 09:30:49 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 25 Dec 2020 09:30:49 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] msmtp: upgrade 1.8.13 -> 1.8.14
Date: Fri, 25 Dec 2020 09:30:47 +0800
Message-ID: <1608859847-70920-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 2FCD54CE5CCA.A773A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-extended/msmtp/{msmtp_1.8.13.bb => msmtp_1.8.14.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.8.13.bb => msmtp_1.8.14.bb} (91%)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.8.13.bb b/meta/recipes-extended/msmtp/msmtp_1.8.14.bb
similarity index 91%
rename from meta/recipes-extended/msmtp/msmtp_1.8.13.bb
rename to meta/recipes-extended/msmtp/msmtp_1.8.14.bb
index 994f1c5d90..3bd5f9edeb 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.8.13.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.8.14.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://marlam.de/msmtp/download/"
 
 SRC_URI = "https://marlam.de/${BPN}/releases/${BP}.tar.xz"
-SRC_URI[sha256sum] = "ada945ab8d519102bb632f197273b3326ded25b38c003b0cf3861d1d6d4a9bb9"
+SRC_URI[sha256sum] = "d56f065d711486e9c234618515a02a48a48dab4051b34f3e108fbecb6fb773b4"
 
 inherit gettext autotools update-alternatives pkgconfig
 
-- 
2.25.1



