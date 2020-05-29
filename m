Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.30571.1590739893203848257
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 May 2020 01:11:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,447,1583164800"; 
   d="scan'208";a="93343164"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 May 2020 16:11:32 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id C24A44BCC89F
	for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2020 16:11:28 +0800 (CST)
Received: from localhost.localdomain (10.167.225.227) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 29 May 2020 16:11:30 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Subject: [OE-core] [PATCH] python3-setuptools:upgrade 45.2.0 -> 47.1.1
Date: Sat, 30 May 2020 01:11:22 +0800
Message-ID: <1590772282-43066-2-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1590772282-43066-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1590772282-43066-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: C24A44BCC89F.AB893
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta/recipes-devtools/python/python-setuptools.inc  |  4 ++--
 .../0001-change-shebang-to-python3.patch            | 13 +------------
 ...tools_45.2.0.bb => python3-setuptools_47.1.1.bb} |  0
 3 files changed, 3 insertions(+), 14 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_45.2.0.bb => python3-setuptools_47.1.1.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index e9ad93dbee..c91cca9f06 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -12,8 +12,8 @@ SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 
 SRC_URI += "file://0001-change-shebang-to-python3.patch"
 
-SRC_URI[md5sum] = "0c956eea142af9c2b02d72e3c042af30"
-SRC_URI[sha256sum] = "89c6e6011ec2f6d57d43a3f9296c4ef022c2cbf49bab26b407fe67992ae3397f"
+SRC_URI[md5sum] = "6e9de90b242fdd60ef59f497424ce13a"
+SRC_URI[sha256sum] = "145fa62b9d7bb544fce16e9b5a9bf4ab2032d2f758b7cd674af09a92736aff74"
 
 DEPENDS += "${PYTHON_PN}"
 
diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-change-shebang-to-python3.patch b/meta/recipes-devtools/python/python3-setuptools/0001-change-shebang-to-python3.patch
index 33af8daed7..6dcf52771b 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-change-shebang-to-python3.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-change-shebang-to-python3.patch
@@ -8,8 +8,7 @@ Upstream-Status: Pending
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
  pkg_resources/_vendor/appdirs.py   | 2 +-
- setuptools/command/easy_install.py | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
+ 1 files changed, 1 insertions(+), 1 deletions(-)
 
 diff --git a/pkg_resources/_vendor/appdirs.py b/pkg_resources/_vendor/appdirs.py
 index ae67001..933e398 100644
@@ -21,16 +20,6 @@ index ae67001..933e398 100644
  # -*- coding: utf-8 -*-
  # Copyright (c) 2005-2010 ActiveState Software Inc.
  # Copyright (c) 2013 Eddy Petrișor
-diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_install.py
-index abca1ae..6bcdc98 100644
---- a/setuptools/command/easy_install.py
-+++ b/setuptools/command/easy_install.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- """
- Easy Install
- ------------
 -- 
 2.24.1
 
diff --git a/meta/recipes-devtools/python/python3-setuptools_45.2.0.bb b/meta/recipes-devtools/python/python3-setuptools_47.1.1.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-setuptools_45.2.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_47.1.1.bb
-- 
2.17.1



