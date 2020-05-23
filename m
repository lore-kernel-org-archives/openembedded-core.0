Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.3527.1590215625718178889
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2020 23:33:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,424,1583164800"; 
   d="scan'208";a="92862413"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 23 May 2020 14:33:40 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 0689F46B5FAD
	for <openembedded-core@lists.openembedded.org>; Sat, 23 May 2020 14:33:35 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Sat, 23 May 2020 14:33:36 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] sysstat: upgrade 12.2.1 -> 12.2.2
Date: Sat, 23 May 2020 23:33:28 +0800
Message-ID: <1590248008-26008-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 0689F46B5FAD.A6969
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../sysstat/{sysstat_12.2.1.bb => sysstat_12.2.2.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/sysstat/{sysstat_12.2.1.bb => sysstat_12.2.2.bb} (54%)

diff --git a/meta/recipes-extended/sysstat/sysstat_12.2.1.bb b/meta/recipes-extended/sysstat/sysstat_12.2.2.bb
similarity index 54%
rename from meta/recipes-extended/sysstat/sysstat_12.2.1.bb
rename to meta/recipes-extended/sysstat/sysstat_12.2.2.bb
index 2a90f89d25..333d10295a 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.2.1.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.2.2.bb
@@ -4,5 +4,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
 SRC_URI += "file://0001-configure.in-remove-check-for-chkconfig.patch"
 
-SRC_URI[md5sum] = "9dfff5fac24e35bd92fb7896debf2ffb"
-SRC_URI[sha256sum] = "8edb0e19b514ac560a098a02933a4735b881296d61014db89bf80f05dd7a4732"
+SRC_URI[md5sum] = "1073fdf7bba58483a467a8a0681beeda"
+SRC_URI[sha256sum] = "78388b64acec81378b962e66b40e57acd4b18ff17a849bc9308f95d290248c9c"
-- 
2.17.1



