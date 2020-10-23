Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web10.3651.1603423886980937123
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2020 20:31:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,404,1596470400"; 
   d="scan'208";a="100431609"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 23 Oct 2020 11:31:28 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 09B7348990E0
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2020 11:31:28 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 23 Oct 2020 11:31:28 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] libinput: upgrade 1.16.1 -> 1.16.2
Date: Fri, 23 Oct 2020 11:31:26 +0800
Message-ID: <1603423886-98145-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 09B7348990E0.A0415
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../wayland/{libinput_1.16.1.bb => libinput_1.16.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{libinput_1.16.1.bb => libinput_1.16.2.bb} (95%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.16.1.bb b/meta/recipes-graphics/wayland/libinput_1.16.2.bb
similarity index 95%
rename from meta/recipes-graphics/wayland/libinput_1.16.1.bb
rename to meta/recipes-graphics/wayland/libinput_1.16.2.bb
index 1497609183..f4b1b4ddc2 100644
--- a/meta/recipes-graphics/wayland/libinput_1.16.1.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.16.2.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
            file://run-ptest \
            file://determinism.patch \
            "
-SRC_URI[sha256sum] = "7ba7d1aeedd15168bb21d17e9e628aa1c27957963a423a3fea3938a501758539"
+SRC_URI[sha256sum] = "fc3d8c50fe7abc4dc4406bc01262a3f8149864557f87279adcf300e523c160a9"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.25.1



