Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.22317.1611828356815510869
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jan 2021 02:05:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; 
   d="scan'208";a="103938199"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 Jan 2021 18:05:37 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id E9A444CE6019
	for <openembedded-core@lists.openembedded.org>; Thu, 28 Jan 2021 18:05:35 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 28 Jan 2021 18:05:35 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] bison: upgrade 3.7.4 -> 3.7.5
Date: Thu, 28 Jan 2021 18:05:34 +0800
Message-ID: <1611828334-7498-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: E9A444CE6019.A5E50
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta/recipes-devtools/bison/{bison_3.7.4.bb => bison_3.7.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/bison/{bison_3.7.4.bb => bison_3.7.5.bb} (93%)

diff --git a/meta/recipes-devtools/bison/bison_3.7.4.bb b/meta/recipes-devtools/bison/bison_3.7.5.bb
similarity index 93%
rename from meta/recipes-devtools/bison/bison_3.7.4.bb
rename to meta/recipes-devtools/bison/bison_3.7.5.bb
index abccaf9958..f8263f93a3 100644
--- a/meta/recipes-devtools/bison/bison_3.7.4.bb
+++ b/meta/recipes-devtools/bison/bison_3.7.5.bb
@@ -12,7 +12,7 @@ DEPENDS = "bison-native flex-native"
 SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
            file://add-with-bisonlocaledir.patch \
            "
-SRC_URI[sha256sum] = "a3b5813f48a11e540ef26f46e4d288c0c25c7907d9879ae50e430ec49f63c010"
+SRC_URI[sha256sum] = "e8c53bc5bc396d636622d0f25e31ca92fd53f00b09629f13ef540d564a6b31ab"
 
 # No point in hardcoding path to m4, just use PATH
 EXTRA_OECONF += "M4=m4"
-- 
2.25.1



