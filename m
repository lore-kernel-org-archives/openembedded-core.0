Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.31817.1612766194091085962
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Feb 2021 22:36:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.81,161,1610380800"; 
   d="scan'208";a="104318756"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Feb 2021 14:36:28 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 26EA14CE6033
	for <openembedded-core@lists.openembedded.org>; Mon,  8 Feb 2021 14:36:24 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 8 Feb 2021 14:36:24 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] python3-packaging: upgrade 20.8 -> 20.9
Date: Mon, 8 Feb 2021 14:36:26 +0800
Message-ID: <1612766186-76752-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 26EA14CE6033.A683B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

20.9 - 2021-01-29
~~~~~~~~~~~~~~~~~

* Run [isort](https://pypi.org/project/isort/) over the code base (:issue:`377`)
* Add support for the ``macosx_10_*_universal2`` platform tags (:issue:`379`)
* Introduce ``packaging.utils.parse_wheel_filename()`` and ``parse_sdist_filename()``
  (:issue:`387` and :issue:`389`)

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../{python3-packaging_20.8.bb => python3-packaging_20.9.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-packaging_20.8.bb => python3-packaging_20.9.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-packaging_20.8.bb b/meta/recipes-devtools/python/python3-packaging_20.9.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-packaging_20.8.bb
rename to meta/recipes-devtools/python/python3-packaging_20.9.bb
index 658c3d1f33..92cf6a25fe 100644
--- a/meta/recipes-devtools/python/python3-packaging_20.8.bb
+++ b/meta/recipes-devtools/python/python3-packaging_20.9.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/packaging"
 LICENSE = "Apache-2.0 & BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=faadaedca9251a90b205c9167578ce91"
 
-SRC_URI[sha256sum] = "78598185a7008a470d64526a8059de9aaa449238f280fc9eb6b13ba6c4109093"
+SRC_URI[sha256sum] = "5b327ac1320dc863dca72f4514ecc086f31186744b84a230374cc1fd776feae5"
 
 inherit pypi setuptools3
 
-- 
2.25.1



