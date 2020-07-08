Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web10.6595.1594198370700764791
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 01:52:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,327,1589212800"; 
   d="scan'208";a="95925566"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Jul 2020 16:52:46 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 72AE64CE4BD9
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jul 2020 16:52:42 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 8 Jul 2020 16:52:42 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] fribidi: upgrade 1.0.9 -> 1.0.10
Date: Wed, 8 Jul 2020 16:52:37 +0800
Message-ID: <1594198359-42354-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1594198359-42354-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1594198359-42354-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 72AE64CE4BD9.A4F4C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../fribidi/{fribidi_1.0.9.bb => fribidi_1.0.10.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/fribidi/{fribidi_1.0.9.bb => fribidi_1.0.10.bb} (76%)

diff --git a/meta/recipes-support/fribidi/fribidi_1.0.9.bb b/meta/recipes-support/fribidi/fribidi_1.0.10.bb
similarity index 76%
rename from meta/recipes-support/fribidi/fribidi_1.0.9.bb
rename to meta/recipes-support/fribidi/fribidi_1.0.10.bb
index 21217aba5e..ba9e6f06d6 100644
--- a/meta/recipes-support/fribidi/fribidi_1.0.9.bb
+++ b/meta/recipes-support/fribidi/fribidi_1.0.10.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.xz \
            "
-SRC_URI[md5sum] = "1b767c259c3cd8e0c8496970f63c22dc"
-SRC_URI[sha256sum] = "c5e47ea9026fb60da1944da9888b4e0a18854a0e2410bbfe7ad90a054d36e0c7"
+SRC_URI[md5sum] = "97c87da9930e8e70fbfc8e2bcd031554"
+SRC_URI[sha256sum] = "7f1c687c7831499bcacae5e8675945a39bacbad16ecaa945e9454a32df653c01"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 
-- 
2.17.1



