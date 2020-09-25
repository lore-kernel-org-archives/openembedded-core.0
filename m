Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.1058.1601011791624514766
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Sep 2020 22:29:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,300,1596470400"; 
   d="scan'208";a="99602482"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 25 Sep 2020 13:29:50 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 286A148990E8
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2020 13:29:48 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 25 Sep 2020 13:29:48 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] pango:upgrade 1.46.1 -> 1.46.2
Date: Sat, 26 Sep 2020 01:29:53 +0800
Message-ID: <1601054993-37436-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 286A148990E8.AFB95
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-graphics/pango/{pango_1.46.1.bb => pango_1.46.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.46.1.bb => pango_1.46.2.bb} (94%)

diff --git a/meta/recipes-graphics/pango/pango_1.46.1.bb b/meta/recipes-graphics/pango/pango_1.46.2.bb
similarity index 94%
rename from meta/recipes-graphics/pango/pango_1.46.1.bb
rename to meta/recipes-graphics/pango/pango_1.46.2.bb
index cc6cc1e35c..c41d1e8a9b 100644
--- a/meta/recipes-graphics/pango/pango_1.46.1.bb
+++ b/meta/recipes-graphics/pango/pango_1.46.2.bb
@@ -16,7 +16,7 @@ GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gtk-doc ptest-gnome upstream-version-is-even gobject-introspection
 
 SRC_URI += " file://run-ptest"
-SRC_URI[archive.sha256sum] = "fe516b10711bbb6fd75011d66dd08fabfce18f7931aed7415136d53c4aadf1c5"
+SRC_URI[archive.sha256sum] = "d89fab5f26767261b493279b65cfb9eb0955cd44c07c5628d36094609fc51841"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 
-- 
2.25.1



