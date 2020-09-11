Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.3571.1599787096465073619
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 18:18:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.76,413,1592841600"; 
   d="scan'208";a="99114237"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 11 Sep 2020 09:18:10 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 6723948990D3
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2020 09:18:06 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 11 Sep 2020 09:18:06 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] at-spi2-core:upgrade 2.36.0 -> 2.36.1
Date: Fri, 11 Sep 2020 21:18:06 +0800
Message-ID: <1599830286-14443-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 6723948990D3.A12CB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../atk/{at-spi2-core_2.36.0.bb => at-spi2-core_2.36.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.36.0.bb => at-spi2-core_2.36.1.bb} (89%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.36.0.bb b/meta/recipes-support/atk/at-spi2-core_2.36.1.bb
similarity index 89%
rename from meta/recipes-support/atk/at-spi2-core_2.36.0.bb
rename to meta/recipes-support/atk/at-spi2-core_2.36.1.bb
index c5d01c9294..218af6afa7 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.36.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.36.1.bb
@@ -7,8 +7,8 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "f101d111b06293d15738afc904c1d931"
-SRC_URI[sha256sum] = "88da57de0a7e3c60bc341a974a80fdba091612db3547c410d6deab039ca5c05a"
+SRC_URI[md5sum] = "d01e5326b4eb15ac3c27eed73ecf26f1"
+SRC_URI[sha256sum] = "97417b909dbbf000e7b21062a13b2f1fd52a336f5a53925bb26d27b65ace6c54"
 
 X11DEPENDS = "virtual/libx11 libxi libxtst"
 
-- 
2.25.1



