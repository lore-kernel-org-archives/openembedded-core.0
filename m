Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web10.11574.1603164673164841260
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2020 20:31:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,395,1596470400"; 
   d="scan'208";a="100316627"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Oct 2020 11:31:10 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 0EBEF48990CC
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2020 11:31:09 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 20 Oct 2020 11:31:07 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] python3-pygobject: upgrade 3.36.1 -> 3.38.0
Date: Tue, 20 Oct 2020 11:31:07 +0800
Message-ID: <1603164667-38037-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 0EBEF48990CC.A58B6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...hon3-pygobject_3.36.1.bb => python3-pygobject_3.38.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-pygobject_3.36.1.bb => python3-pygobject_3.38.0.bb} (78%)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.36.1.bb b/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb
similarity index 78%
rename from meta/recipes-devtools/python/python3-pygobject_3.36.1.bb
rename to meta/recipes-devtools/python/python3-pygobject_3.38.0.bb
index 0a34d4373f..4f75b3b887 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.36.1.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb
@@ -14,8 +14,8 @@ SRC_URI = " \
     http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir("${PV}")}/${SRCNAME}-${PV}.tar.xz \
     file://0001-Do-not-build-tests.patch \
 "
-SRC_URI[md5sum] = "ebfebc4533856572281add29f08412bf"
-SRC_URI[sha256sum] = "d1bf42802d1cec113b5adaa0e7bf7f3745b44521dc2163588d276d5cd61d718f"
+SRC_URI[md5sum] = "2ad8d8f10d1f12a8c66d8179659d5eb9"
+SRC_URI[sha256sum] = "0372d1bb9122fc19f500a249b1f38c2bb67485000f5887497b4b205b3e7084d5"
 
 UNKNOWN_CONFIGURE_WHITELIST = "introspection"
 
@@ -27,7 +27,7 @@ RDEPENDS_${PN} += "python3-pkgutil"
 
 # python3-pycairo is checked on configuration -> DEPENDS
 # we don't link against python3-pycairo -> RDEPENDS
-PACKAGECONFIG[cairo] = "-Dpycairo=true,-Dpycairo=false, cairo python3-pycairo, python3-pycairo"
+PACKAGECONFIG[cairo] = "-Dpycairo=enabled,-Dpycairo=disabled, cairo python3-pycairo, python3-pycairo"
 
 BBCLASSEXTEND = "native"
 PACKAGECONFIG_class-native = ""
-- 
2.25.1



