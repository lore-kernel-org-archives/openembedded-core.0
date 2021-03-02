Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.4143.1614658415547933670
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Mar 2021 20:13:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.81,216,1610380800"; 
   d="scan'208";a="105008215"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 02 Mar 2021 12:13:21 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id A93E24CE7C1A
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Mar 2021 12:13:20 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 2 Mar 2021 12:13:09 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] log4cplus: upgrade 2.0.5 -> 2.0.6
Date: Tue, 2 Mar 2021 12:12:56 +0800
Message-ID: <1614658376-64761-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: A93E24CE7C1A.A80D4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../log4cplus/{log4cplus_2.0.5.bb => log4cplus_2.0.6.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/log4cplus/{log4cplus_2.0.5.bb => log4cplus_2.0.6.bb} (85%)

diff --git a/meta/recipes-devtools/log4cplus/log4cplus_2.0.5.bb b/meta/recipes-devtools/log4cplus/log4cplus_2.0.6.bb
similarity index 85%
rename from meta/recipes-devtools/log4cplus/log4cplus_2.0.5.bb
rename to meta/recipes-devtools/log4cplus/log4cplus_2.0.6.bb
index a4c202f076..4b7c76ab46 100644
--- a/meta/recipes-devtools/log4cplus/log4cplus_2.0.5.bb
+++ b/meta/recipes-devtools/log4cplus/log4cplus_2.0.6.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=41e8e060c26822886b592ab4765c756b"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}-stable/${PV}/${BP}.tar.gz \
           "
-SRC_URI[md5sum] = "71dd956bf686195127559671f1426cff"
-SRC_URI[sha256sum] = "c07115c23219390633798def30b7b51a0f79fdeb857e4b49632f17746d0ceb97"
+SRC_URI[md5sum] = "71051de4c2c3ef67f66ce3bbb083cf43"
+SRC_URI[sha256sum] = "5fb26433b0f200ebfc2e6effb7e2e5131185862a2ea9a621a8e7f3f725a72b08"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/log4cplus/files/log4cplus-stable/"
 UPSTREAM_CHECK_REGEX = "log4cplus-stable/(?P<pver>\d+(\.\d+)+)/"
-- 
2.25.1



