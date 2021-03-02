Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web08.4087.1614658472125959617
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Mar 2021 20:14:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.81,216,1610380800"; 
   d="scan'208";a="105008264"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 02 Mar 2021 12:14:29 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 771434CE603A
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Mar 2021 12:14:23 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 2 Mar 2021 12:14:11 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] sysvinit: upgrade 2.98 -> 2.99
Date: Tue, 2 Mar 2021 12:13:49 +0800
Message-ID: <1614658429-64881-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 771434CE603A.A765A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../sysvinit/{sysvinit_2.98.bb => sysvinit_2.99.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/sysvinit/{sysvinit_2.98.bb => sysvinit_2.99.bb} (98%)

diff --git a/meta/recipes-core/sysvinit/sysvinit_2.98.bb b/meta/recipes-core/sysvinit/sysvinit_2.99.bb
similarity index 98%
rename from meta/recipes-core/sysvinit/sysvinit_2.98.bb
rename to meta/recipes-core/sysvinit/sysvinit_2.99.bb
index 41009bc180..e39f22a8bb 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.98.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.99.bb
@@ -21,7 +21,7 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/sysvinit/sysvinit-${PV}.tar.xz \
            file://bootlogd.init \
            file://01_bootlogd \
            "
-SRC_URI[sha256sum] = "7b2c3ffaf19eaf1ca80268762f85f9e4eb8e3c973213d49f9802605b72caa7dc"
+SRC_URI[sha256sum] = "b05c3677bb698afe64c997968b00c49b2a9bd320ce963523230ee7ea41197757"
 
 S = "${WORKDIR}/sysvinit-${PV}"
 
-- 
2.25.1



