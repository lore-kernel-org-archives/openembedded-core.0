Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web11.6407.1588924840879923451
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2020 01:00:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 04880d7h020537
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 8 May 2020 01:00:39 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Fri, 8 May 2020 01:00:26 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] python3-setuptools: add the missing rdepends
Date: Fri, 8 May 2020 16:00:25 +0800
Message-ID: <1588924825-13974-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Add the missing rdepends to fix below error:
 # python3
 [snip]
 >>> import setuptools
 [snip]
 ModuleNotFoundError: No module named 'json'

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-devtools/python/python-setuptools.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index 07c2f8b..6726e06 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -24,6 +24,7 @@ RDEPENDS_${PN} = "\
   ${PYTHON_PN}-distutils \
   ${PYTHON_PN}-email \
   ${PYTHON_PN}-html \
+  ${PYTHON_PN}-json \
   ${PYTHON_PN}-netserver \
   ${PYTHON_PN}-numbers \
   ${PYTHON_PN}-pkgutil \
-- 
2.7.4

