Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.6829.1590645692355267307
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 23:01:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,442,1583164800"; 
   d="scan'208";a="93260325"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 May 2020 14:01:31 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 9994D50A9981
	for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2020 14:01:27 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 28 May 2020 14:01:28 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] alsa-utils: upgrade 1.2.1 -> 1.2.2
Date: Thu, 28 May 2020 14:01:12 +0800
Message-ID: <1590645673-18173-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1590645673-18173-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1590645673-18173-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 9994D50A9981.A4694
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...lsa-utils-scripts_1.2.1.bb => alsa-utils-scripts_1.2.2.bb} | 0
 .../alsa/{alsa-utils_1.2.1.bb => alsa-utils_1.2.2.bb}         | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-utils-scripts_1.2.1.bb => alsa-utils-scripts_1.2.2.bb} (100%)
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.2.1.bb => alsa-utils_1.2.2.bb} (97%)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.1.bb b/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.2.bb
similarity index 100%
rename from meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.1.bb
rename to meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.2.bb
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.1.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.2.2.bb
similarity index 97%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.2.1.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.2.2.bb
index 9144af628a..8bbc5d3ef3 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.2.bb
@@ -21,8 +21,8 @@ PACKAGECONFIG[manpages] = "--enable-xmlto, --disable-xmlto, xmlto-native docbook
 
 # alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
 SRC_URI = "https://www.alsa-project.org/files/pub/utils/alsa-utils-${PV}.tar.bz2"
-SRC_URI[md5sum] = "c4628bae7632937eac2de4cf2a3de82e"
-SRC_URI[sha256sum] = "0b110ba71ef41d3009db1bc4dcae0cf79efb99cb5426fa19d0312470560a2c0d"
+SRC_URI[md5sum] = "00612234ff4722c8f7f8f7a83ff9bc63"
+SRC_URI[sha256sum] = "44807bd578c5f6df6e91a11b8d37e546424a5a1ea8d8e659ee359fe01730e4f3"
 
 # On build machines with python-docutils (not python3-docutils !!) installed
 # rst2man (not rst2man.py) is detected and compile fails with
-- 
2.17.1



