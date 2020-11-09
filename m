Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.6770.1604893157858090024
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2020 19:39:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,462,1596470400"; 
   d="scan'208";a="101074472"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 09 Nov 2020 11:38:59 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id E72D14CE3A4A
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Nov 2020 11:38:56 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 9 Nov 2020 11:38:58 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] icu: upgrade 67.1 -> 68.1
Date: Mon, 9 Nov 2020 11:38:51 +0800
Message-ID: <1604893131-60530-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: E72D14CE3A4A.A30D6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

-License-Update:The address changes are as follows:
  # Project: http://code.google.com/p/lao-dictionary/
  # Dictionary: http://lao-dictionary.googlecode.com/git/Lao-Dictionary.txt
  # License: http://lao-dictionary.googlecode.com/git/Lao-Dictionary-LICENSE.txt

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta/recipes-support/icu/{icu_67.1.bb => icu_68.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/icu/{icu_67.1.bb => icu_68.1.bb} (95%)

diff --git a/meta/recipes-support/icu/icu_67.1.bb b/meta/recipes-support/icu/icu_68.1.bb
similarity index 95%
rename from meta/recipes-support/icu/icu_67.1.bb
rename to meta/recipes-support/icu/icu_68.1.bb
index 9e8091ba01..98aa6b7be6 100644
--- a/meta/recipes-support/icu/icu_67.1.bb
+++ b/meta/recipes-support/icu/icu_68.1.bb
@@ -83,7 +83,7 @@ FILES_libicuio = "${libdir}/libicuio.so.*"
 
 BBCLASSEXTEND = "native nativesdk"
 
-LIC_FILES_CHKSUM = "file://../LICENSE;md5=a3808a5b70071b07f87ff2205e4d75a0"
+LIC_FILES_CHKSUM = "file://../LICENSE;md5=002d2fdc32d17f0ec06e9a47f2c0c8d0"
 
 def icu_download_version(d):
     pvsplit = d.getVar('PV').split('.')
@@ -112,8 +112,8 @@ SRC_URI = "${BASE_SRC_URI};name=code \
 SRC_URI_append_class-target = "\
            file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
           "
-SRC_URI[code.sha256sum] = "94a80cd6f251a53bd2a997f6f1b5ac6653fe791dfab66e1eb0227740fb86d5dc"
-SRC_URI[data.sha256sum] = "7c16a59cc8c06128b7ecc1dc4fc056b36b17349312829b17408b9e67b05c4a7e"
+SRC_URI[code.sha256sum] = "a9f2e3d8b4434b8e53878b4308bd1e6ee51c9c7042e2b1a376abefb6fbb29f2d"
+SRC_URI[data.sha256sum] = "03ea8b4694155620548c8c0ba20444f1e7db246cc79e3b9c4fc7a960b160d510"
 
 UPSTREAM_CHECK_REGEX = "icu4c-(?P<pver>\d+(_\d+)+)-src"
 UPSTREAM_CHECK_URI = "https://github.com/unicode-org/icu/releases"
-- 
2.25.1



