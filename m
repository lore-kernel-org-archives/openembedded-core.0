Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.22078.1605857978877786145
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2020 23:39:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,355,1599494400"; 
   d="scan'208";a="101580382"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Nov 2020 15:39:30 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 08A834CE3A6C
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2020 15:39:28 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 20 Nov 2020 15:39:28 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] msmtp: upgrade 1.8.12 -> 1.8.13
Date: Sat, 21 Nov 2020 01:20:31 +0800
Message-ID: <1605892831-39194-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 08A834CE3A6C.A4051
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-extended/msmtp/{msmtp_1.8.12.bb => msmtp_1.8.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.8.12.bb => msmtp_1.8.13.bb} (91%)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.8.12.bb b/meta/recipes-extended/msmtp/msmtp_1.8.13.bb
similarity index 91%
rename from meta/recipes-extended/msmtp/msmtp_1.8.12.bb
rename to meta/recipes-extended/msmtp/msmtp_1.8.13.bb
index 54798f9e6f..994f1c5d90 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.8.12.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.8.13.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://marlam.de/msmtp/download/"
 
 SRC_URI = "https://marlam.de/${BPN}/releases/${BP}.tar.xz"
-SRC_URI[sha256sum] = "a86fef9477339923afefe974988a38e32d0feb90dfeeb88f7f55aac356a96354"
+SRC_URI[sha256sum] = "ada945ab8d519102bb632f197273b3326ded25b38c003b0cf3861d1d6d4a9bb9"
 
 inherit gettext autotools update-alternatives pkgconfig
 
-- 
2.25.1



