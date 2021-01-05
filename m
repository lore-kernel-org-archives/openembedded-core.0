Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.2389.1609832322277555216
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jan 2021 23:38:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,476,1599494400"; 
   d="scan'208";a="103193194"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 05 Jan 2021 15:38:30 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id A2C794CE1505
	for <openembedded-core@lists.openembedded.org>; Tue,  5 Jan 2021 15:38:25 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 5 Jan 2021 15:38:26 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] cantarell-fonts: upgrade 0.201 -> 0.301
Date: Tue, 5 Jan 2021 15:38:18 +0800
Message-ID: <1609832298-108151-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: A2C794CE1505.A6DBD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../{cantarell-fonts_0.201.bb => cantarell-fonts_0.301.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/cantarell-fonts/{cantarell-fonts_0.201.bb => cantarell-fonts_0.301.bb} (87%)

diff --git a/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.201.bb b/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.301.bb
similarity index 87%
rename from meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.201.bb
rename to meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.301.bb
index 29e839b6b2..890c08bf4a 100644
--- a/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.201.bb
+++ b/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.301.bb
@@ -11,7 +11,7 @@ LICENSE = "OFL-1.1 & Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fb1ef92b6909969a472a6ea3c4e99cb7"
 
 inherit gnomebase meson allarch fontcache pkgconfig
-SRC_URI[archive.sha256sum] = "b61f64e5f6a48aa0abc7a53cdcbce60de81908ca36048a64730978fcd9ac9863"
+SRC_URI[archive.sha256sum] = "3d35db0ac03f9e6b0d5a53577591b714238985f4cfc31a0aa17f26cd74675e83"
 
 EXTRA_OEMESON += "-Duseprebuilt=true -Dbuildappstream=false"
 
-- 
2.25.1



