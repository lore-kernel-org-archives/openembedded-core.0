Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web12.11019.1591181535454606619
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 03:52:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,467,1583164800"; 
   d="scan'208";a="93757502"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 03 Jun 2020 18:52:17 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id DE2614BCC8B2
	for <openembedded-core@lists.openembedded.org>; Wed,  3 Jun 2020 18:52:12 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 3 Jun 2020 18:52:12 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] libyaml: upgrade 0.2.4 -> 0.2.5
Date: Wed, 3 Jun 2020 18:51:59 +0800
Message-ID: <1591181521-15405-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1591181521-15405-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1591181521-15405-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: DE2614BCC8B2.A42BC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../libyaml/{libyaml_0.2.4.bb => libyaml_0.2.5.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libyaml/{libyaml_0.2.4.bb => libyaml_0.2.5.bb} (78%)

diff --git a/meta/recipes-support/libyaml/libyaml_0.2.4.bb b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
similarity index 78%
rename from meta/recipes-support/libyaml/libyaml_0.2.4.bb
rename to meta/recipes-support/libyaml/libyaml_0.2.5.bb
index e1817748bc..e39a7b9083 100644
--- a/meta/recipes-support/libyaml/libyaml_0.2.4.bb
+++ b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
@@ -8,8 +8,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://License;md5=7bbd28caa69f81f5cd5f48647236663d"
 
 SRC_URI = "https://pyyaml.org/download/libyaml/yaml-${PV}.tar.gz"
-SRC_URI[md5sum] = "0532bb32548ee92f1c0328aa8a87dec7"
-SRC_URI[sha256sum] = "d80aeda8747b7c26fbbfd87ab687786e58394a8435ae3970e79cb97882e30557"
+SRC_URI[md5sum] = "bb15429d8fb787e7d3f1c83ae129a999"
+SRC_URI[sha256sum] = "c642ae9b75fee120b2d96c712538bd2cf283228d2337df2cf2988e3c02678ef4"
 
 S = "${WORKDIR}/yaml-${PV}"
 
-- 
2.17.1



