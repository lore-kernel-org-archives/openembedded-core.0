Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.5288.1614669695128011890
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Mar 2021 23:21:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.81,216,1610380800"; 
   d="scan'208";a="105015179"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 02 Mar 2021 15:21:29 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id BF86E4CE7C1F
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Mar 2021 15:21:25 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 2 Mar 2021 15:21:24 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] python3-magic: upgrade 0.4.20 -> 0.4.22
Date: Tue, 2 Mar 2021 15:20:50 +0800
Message-ID: <1614669650-67423-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: BF86E4CE7C1F.ABF2F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../{python3-magic_0.4.20.bb => python3-magic_0.4.22.bb}       | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-magic_0.4.20.bb => python3-magic_0.4.22.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-magic_0.4.20.bb b/meta/recipes-devtools/python/python3-magic_0.4.22.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-magic_0.4.20.bb
rename to meta/recipes-devtools/python/python3-magic_0.4.22.bb
index be3458a792..b828927599 100644
--- a/meta/recipes-devtools/python/python3-magic_0.4.20.bb
+++ b/meta/recipes-devtools/python/python3-magic_0.4.22.bb
@@ -11,11 +11,12 @@ PYPI_PACKAGE = "python-magic"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "0cc52ccad086c377b9194014e3dbf98d94b194344630172510a6a3e716b47801"
+SRC_URI[sha256sum] = "ca884349f2c92ce830e3f498c5b7c7051fe2942c3ee4332f65213b8ebff15a62"
 
 RDEPENDS_${PN} += "file \
                    ${PYTHON_PN}-ctypes \
                    ${PYTHON_PN}-io \
+                   ${PYTHON_PN}-logging \
                    ${PYTHON_PN}-shell"
 
 BBCLASSEXTEND = "native"
-- 
2.25.1



