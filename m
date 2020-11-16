Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web08.29279.1605494334531741163
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2020 18:38:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,481,1596470400"; 
   d="scan'208";a="101400909"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 16 Nov 2020 10:38:35 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id CAA514CE4B33
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2020 10:38:32 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 16 Nov 2020 10:38:34 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] libinput: upgrade 1.16.2 -> 1.16.3
Date: Mon, 16 Nov 2020 22:38:25 +0800
Message-ID: <1605537505-85815-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: CAA514CE4B33.A2A03
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../wayland/{libinput_1.16.2.bb => libinput_1.16.3.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{libinput_1.16.2.bb => libinput_1.16.3.bb} (95%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.16.2.bb b/meta/recipes-graphics/wayland/libinput_1.16.3.bb
similarity index 95%
rename from meta/recipes-graphics/wayland/libinput_1.16.2.bb
rename to meta/recipes-graphics/wayland/libinput_1.16.3.bb
index f4b1b4ddc2..8929de6ae0 100644
--- a/meta/recipes-graphics/wayland/libinput_1.16.2.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.16.3.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
            file://run-ptest \
            file://determinism.patch \
            "
-SRC_URI[sha256sum] = "fc3d8c50fe7abc4dc4406bc01262a3f8149864557f87279adcf300e523c160a9"
+SRC_URI[sha256sum] = "dc5e1ae51ec1cc635ca96f61118b0f07dfea783cab0747a60f3555068bb077e4"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.25.1



