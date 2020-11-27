Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web08.15233.1606458146359913934
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2020 22:22:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,373,1599494400"; 
   d="scan'208";a="101809630"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 27 Nov 2020 14:22:12 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id A217F4CE5CE3
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2020 14:22:10 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 27 Nov 2020 14:22:11 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] gtk-doc: upgrade 1.33.0 -> 1.33.1
Date: Fri, 27 Nov 2020 14:22:09 +0800
Message-ID: <1606458129-121515-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: A217F4CE5CE3.A3353
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../gtk-doc/{gtk-doc_1.33.0.bb => gtk-doc_1.33.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk-doc/{gtk-doc_1.33.0.bb => gtk-doc_1.33.1.bb} (96%)

diff --git a/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.0.bb b/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb
similarity index 96%
rename from meta/recipes-gnome/gtk-doc/gtk-doc_1.33.0.bb
rename to meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb
index 8d992272ee..5f9fe0a91d 100644
--- a/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.0.bb
+++ b/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb
@@ -18,7 +18,7 @@ PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "api-documentation",
 PACKAGECONFIG[working-scripts] = ",,libxslt-native xmlto-native python3-six python3-pygments"
 PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,glib-2.0"
 
-SRC_URI[archive.sha256sum] = "d5e3b3f837174d246fa8482455740627efec1e5210aa15d0c7989ca68f72bb51"
+SRC_URI[archive.sha256sum] = "a5cfed2a0b73a09b796fff80ad6d8f040ab2b2655bdc941ac207ffe6d9c10f10"
 SRC_URI += "file://0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch \
            file://0001-Do-not-error-out-if-xsltproc-is-not-found.patch \
            file://conditionaltests.patch \
-- 
2.25.1



