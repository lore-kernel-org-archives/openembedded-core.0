Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.28327.1605488809076723457
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2020 17:06:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,481,1596470400"; 
   d="scan'208";a="101396144"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 16 Nov 2020 09:06:30 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id E90CE4CE4B08
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2020 09:06:29 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 16 Nov 2020 09:06:30 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] libdnf: upgrade 0.54.2 -> 0.55.0
Date: Mon, 16 Nov 2020 21:05:55 +0800
Message-ID: <1605531955-84546-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: E90CE4CE4B08.A5F14
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../libdnf/{libdnf_0.54.2.bb => libdnf_0.55.0.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/libdnf/{libdnf_0.54.2.bb => libdnf_0.55.0.bb} (96%)

diff --git a/meta/recipes-devtools/libdnf/libdnf_0.54.2.bb b/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb
similarity index 96%
rename from meta/recipes-devtools/libdnf/libdnf_0.54.2.bb
rename to meta/recipes-devtools/libdnf/libdnf_0.55.0.bb
index 39d80a0821..07b3df40d3 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.54.2.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master \
            file://enable_test_data_dir_set.patch \
            "
 
-SRCREV = "c5f20d4f306f4d0f9d479be228bdc474968c8b60"
+SRCREV = "3f8981c9c5066e5243b695c904031b90f8d57d4a"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.25.1



