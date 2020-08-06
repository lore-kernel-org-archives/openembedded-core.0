Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web11.2765.1596705067753328801
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2020 02:11:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,441,1589212800"; 
   d="scan'208";a="97705578"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 06 Aug 2020 17:11:02 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 4A8664CE34EF
	for <openembedded-core@lists.openembedded.org>; Thu,  6 Aug 2020 17:11:00 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 6 Aug 2020 17:11:01 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] python3-setuptools:upgrade 49.2.0 -> 49.2.1
Date: Fri, 7 Aug 2020 05:10:53 +0800
Message-ID: <1596748253-123303-3-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1596748253-123303-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1596748253-123303-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 4A8664CE34EF.A2699
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...ython3-setuptools_49.2.0.bb => python3-setuptools_49.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools_49.2.0.bb => python3-setuptools_49.2.1.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-setuptools_49.2.0.bb b/meta/recipes-devtools/python/python3-setuptools_49.2.1.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-setuptools_49.2.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_49.2.1.bb
index 41ba6ea159..53a121db11 100644
--- a/meta/recipes-devtools/python/python3-setuptools_49.2.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_49.2.1.bb
@@ -12,7 +12,7 @@ SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 
 SRC_URI += "file://0001-change-shebang-to-python3.patch"
 
-SRC_URI[sha256sum] = "afe9e81fee0270d3f60d52608549cc8ec4c46dada8c95640c1a00160f577acf2"
+SRC_URI[sha256sum] = "88094d17c8d273390659a72e9d93374cd7bfd188c12bf2747b306e2bed48df18"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.25.1



