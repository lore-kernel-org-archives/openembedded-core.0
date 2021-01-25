Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web11.31123.1611541250810563075
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jan 2021 18:20:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,372,1602518400"; 
   d="scan'208";a="103784304"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 25 Jan 2021 10:20:39 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 1E6EC4CE6785
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 10:20:36 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 25 Jan 2021 10:20:36 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH 1/2] python3-docutils: Fix bug of program rst2man cannot be found.
Date: Mon, 25 Jan 2021 10:20:31 +0800
Message-ID: <1611541232-1991-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 1E6EC4CE6785.A2299
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../python/python3-docutils_0.16.bb               | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-docutils_0.16.bb b/meta/recipes-devtools/python/python3-docutils_0.16.bb
index 50547a1b0c..3b2df223ed 100644
--- a/meta/recipes-devtools/python/python3-docutils_0.16.bb
+++ b/meta/recipes-devtools/python/python3-docutils_0.16.bb
@@ -14,4 +14,19 @@ S = "${WORKDIR}/docutils-${PV}"
 
 inherit distutils3
 
+do_install_append_class-native() {
+    mv ${D}${bindir}/rst2html.py ${D}${bindir}/rst2html
+    mv ${D}${bindir}/rst2html4.py ${D}${bindir}/rst2html4
+    mv ${D}${bindir}/rst2html5.py ${D}${bindir}/rst2html5
+    mv ${D}${bindir}/rst2latex.py ${D}${bindir}/rst2latex
+    mv ${D}${bindir}/rst2man.py ${D}${bindir}/rst2man
+    mv ${D}${bindir}/rst2odt.py ${D}${bindir}/rst2odt
+    mv ${D}${bindir}/rst2odt_prepstyles.py ${D}${bindir}/rst2odt_prepstyles
+    mv ${D}${bindir}/rst2pseudoxml.py ${D}${bindir}/rst2pseudoxml
+    mv ${D}${bindir}/rst2s5.py ${D}${bindir}/rst2s5
+    mv ${D}${bindir}/rst2xetex.py ${D}${bindir}/rst2xetex
+    mv ${D}${bindir}/rst2xml.py ${D}${bindir}/rst2xml
+    mv ${D}${bindir}/rstpep2html.py ${D}${bindir}/rstpep2html
+}
+
 BBCLASSEXTEND = "native"
-- 
2.25.1



