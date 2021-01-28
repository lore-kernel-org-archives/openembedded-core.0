Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.21038.1611817372234004784
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jan 2021 23:02:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; 
   d="scan'208";a="103929331"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 Jan 2021 15:02:36 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 7747D48990D2
	for <openembedded-core@lists.openembedded.org>; Thu, 28 Jan 2021 15:02:32 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 28 Jan 2021 15:02:32 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] util-macros: upgrade 1.19.2 -> 1.19.3
Date: Thu, 28 Jan 2021 15:02:29 +0800
Message-ID: <1611817349-11170-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 7747D48990D2.A0B56
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{util-macros_1.19.2.bb => util-macros_1.19.3.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-util/{util-macros_1.19.2.bb => util-macros_1.19.3.bb} (75%)

diff --git a/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb b/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb
similarity index 75%
rename from meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb
rename to meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb
index 268059935c..27898709fc 100644
--- a/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb
+++ b/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1970511fddd439b07a6ba789d28ff662"
 
 PE = "1"
 
-SRC_URI[md5sum] = "5059b328fac086b733ffac6607164c41"
-SRC_URI[sha256sum] = "9225c45c3de60faf971979a55a5536f3562baa4b6f02246c23e98ac0c09a75b7"
+SRC_URI[md5sum] = "66cb74d4a0120a06e32c3b01c29417d8"
+SRC_URI[sha256sum] = "624bb6c3a4613d18114a7e3849a3d70f2d7af9dc6eabeaba98060d87e3aef35b"
 
 # ${PN} is empty so we need to tweak -dev and -dbg package dependencies
 RDEPENDS_${PN}-dev = ""
-- 
2.25.1



