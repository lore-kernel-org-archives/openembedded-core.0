Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web08.5216.1611820668990359575
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jan 2021 23:57:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; 
   d="scan'208";a="103932311"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 Jan 2021 15:57:22 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id C0BC348990D2
	for <openembedded-core@lists.openembedded.org>; Thu, 28 Jan 2021 15:57:19 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 28 Jan 2021 15:57:19 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] gtk-doc: upgrade 1.33.1 -> 1.33.2
Date: Thu, 28 Jan 2021 15:57:15 +0800
Message-ID: <1611820635-11333-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: C0BC348990D2.A3D59
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../gtk-doc/{gtk-doc_1.33.1.bb => gtk-doc_1.33.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk-doc/{gtk-doc_1.33.1.bb => gtk-doc_1.33.2.bb} (96%)

diff --git a/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb b/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb
similarity index 96%
rename from meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb
rename to meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb
index 5f9fe0a91d..8c925633db 100644
--- a/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb
+++ b/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb
@@ -18,7 +18,7 @@ PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "api-documentation",
 PACKAGECONFIG[working-scripts] = ",,libxslt-native xmlto-native python3-six python3-pygments"
 PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,glib-2.0"
 
-SRC_URI[archive.sha256sum] = "a5cfed2a0b73a09b796fff80ad6d8f040ab2b2655bdc941ac207ffe6d9c10f10"
+SRC_URI[archive.sha256sum] = "cc1b709a20eb030a278a1f9842a362e00402b7f834ae1df4c1998a723152bf43"
 SRC_URI += "file://0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch \
            file://0001-Do-not-error-out-if-xsltproc-is-not-found.patch \
            file://conditionaltests.patch \
-- 
2.25.1



