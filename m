Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.15648.1606461053425866605
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2020 23:10:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,373,1599494400"; 
   d="scan'208";a="101811210"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 27 Nov 2020 15:10:52 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 7F3D94CE5CE6
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2020 15:10:48 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 27 Nov 2020 15:10:48 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] libjpeg-turbo: upgrade 2.0.5 -> 2.0.6
Date: Fri, 27 Nov 2020 15:10:47 +0800
Message-ID: <1606461047-122417-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 7F3D94CE5CE6.A32FB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

-License-Update: Copyright year updated to 2020.

Refresh the following patch:
0001-libjpeg-turbo-fix-package_qa-error.patch

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../files/0001-libjpeg-turbo-fix-package_qa-error.patch   | 8 ++++----
 .../{libjpeg-turbo_2.0.5.bb => libjpeg-turbo_2.0.6.bb}    | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-graphics/jpeg/{libjpeg-turbo_2.0.5.bb => libjpeg-turbo_2.0.6.bb} (89%)

diff --git a/meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-fix-package_qa-error.patch b/meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-fix-package_qa-error.patch
index 82fffe1e68..152db441bc 100644
--- a/meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-fix-package_qa-error.patch
+++ b/meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-fix-package_qa-error.patch
@@ -19,7 +19,7 @@ diff --git a/CMakeLists.txt b/CMakeLists.txt
 index 2bc3458..ea3041e 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -189,10 +189,6 @@ endif()
+@@ -191,10 +191,6 @@ endif()
  report_option(ENABLE_SHARED "Shared libraries")
  report_option(ENABLE_STATIC "Static libraries")
  
@@ -27,6 +27,6 @@ index 2bc3458..ea3041e 100644
 -  set(CMAKE_INSTALL_RPATH ${CMAKE_INSTALL_FULL_LIBDIR})
 -endif()
 -
- if(WITH_12BIT)
-   set(WITH_ARITH_DEC 0)
-   set(WITH_ARITH_ENC 0)
+ if(WITH_JPEG8 OR WITH_JPEG7)
+   set(WITH_ARITH_ENC 1)
+   set(WITH_ARITH_DEC 1)
diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb
similarity index 89%
rename from meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb
rename to meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb
index 9729fb5dd5..b6efc6bca0 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "http://libjpeg-turbo.org/"
 
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://cdjpeg.h;endline=13;md5=8184bcc7c4ac7b9edc6a7bc00f231d0b \
-                    file://jpeglib.h;endline=16;md5=7ea97dc83b0f59052ee837e61ef0e08f \
-                    file://djpeg.c;endline=11;md5=c59e19811c006cb38f82d6477134d314 \
+                    file://jpeglib.h;endline=16;md5=52b5eaade8d5b6a452a7693dfe52c084 \
+                    file://djpeg.c;endline=11;md5=302e980133b5c0c7f4dcb4ca0df41090 \
 "
 DEPENDS_append_x86-64_class-target = " nasm-native"
 DEPENDS_append_x86_class-target = " nasm-native"
@@ -14,8 +14,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://0001-libjpeg-turbo-fix-package_qa-error.patch \
            "
 
-SRC_URI[md5sum] = "3a7dc293918775fc933f81e2bce36464"
-SRC_URI[sha256sum] = "16f8f6f2715b3a38ab562a84357c793dd56ae9899ce130563c72cd93d8357b5d"
+SRC_URI[md5sum] = "4cada3f0bdc93d826fa31bf9e4469ef6"
+SRC_URI[sha256sum] = "d74b92ac33b0e3657123ddcf6728788c90dc84dcb6a52013d758af3c4af481bb"
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/libjpeg-turbo/files/"
 UPSTREAM_CHECK_REGEX = "/libjpeg-turbo/files/(?P<pver>(\d+[\.\-_]*)+)/"
 
-- 
2.25.1



