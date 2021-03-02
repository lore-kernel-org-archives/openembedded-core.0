Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web11.4143.1614658415547933670
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Mar 2021 20:13:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.81,216,1610380800"; 
   d="scan'208";a="105008233"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 02 Mar 2021 12:13:46 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 965D74CE7C1E
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Mar 2021 12:13:45 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 2 Mar 2021 12:13:44 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] python3-git: upgrade 3.1.13 -> 3.1.14
Date: Tue, 2 Mar 2021 12:13:42 +0800
Message-ID: <1614658422-64837-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 965D74CE7C1E.A9316
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/{python3-git_3.1.13.bb => python3-git_3.1.14.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-git_3.1.13.bb => python3-git_3.1.14.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.13.bb b/meta/recipes-devtools/python/python3-git_3.1.14.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-git_3.1.13.bb
rename to meta/recipes-devtools/python/python3-git_3.1.14.bb
index 807767e569..911c8f1487 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.13.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.14.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "GitPython"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "8621a7e777e276a5ec838b59280ba5272dd144a18169c36c903d8b38b99f750a"
+SRC_URI[sha256sum] = "be27633e7509e58391f10207cd32b2a6cf5b908f92d9cd30da2e514e1137af61"
 
 DEPENDS += " ${PYTHON_PN}-gitdb"
 
-- 
2.25.1



