Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.31354.1605510992801624316
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2020 23:16:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,481,1596470400"; 
   d="scan'208";a="101410661"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 16 Nov 2020 15:16:10 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 9AD114CE4BCB
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2020 15:16:08 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 16 Nov 2020 15:16:10 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] enchant2: upgrade 2.2.12 -> 2.2.13
Date: Tue, 17 Nov 2020 03:16:07 +0800
Message-ID: <1605554167-89757-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 9AD114CE4BCB.A3BC5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../enchant/{enchant2_2.2.12.bb => enchant2_2.2.13.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.2.12.bb => enchant2_2.2.13.bb} (90%)

diff --git a/meta/recipes-support/enchant/enchant2_2.2.12.bb b/meta/recipes-support/enchant/enchant2_2.2.13.bb
similarity index 90%
rename from meta/recipes-support/enchant/enchant2_2.2.12.bb
rename to meta/recipes-support/enchant/enchant2_2.2.13.bb
index 1ce8245731..3b890e733a 100644
--- a/meta/recipes-support/enchant/enchant2_2.2.12.bb
+++ b/meta/recipes-support/enchant/enchant2_2.2.13.bb
@@ -9,7 +9,7 @@ DEPENDS = "glib-2.0"
 inherit autotools pkgconfig
 
 SRC_URI = "https://github.com/AbiWord/enchant/releases/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "6b9bc58ae714ee7f5335ade966f4ac5718d5339e280cc9e1cca9ab278c06227e"
+SRC_URI[sha256sum] = "eab9f90d79039133660029616e2a684644bd524be5dc43340d4cfc3fb3c68a20"
 
 UPSTREAM_CHECK_URI = "https://github.com/AbiWord/enchant/releases"
 
-- 
2.25.1



