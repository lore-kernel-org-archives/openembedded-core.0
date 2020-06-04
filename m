Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.9258.1591258530946601494
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2020 01:15:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 0548F9SX004658
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Jun 2020 01:15:20 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Thu, 4 Jun 2020 01:14:46 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] python3-magic: add the missing rdepends
Date: Thu, 4 Jun 2020 16:13:39 +0800
Message-ID: <20200604081339.275866-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Add the missing rdepends to fix below error:
 # python3
 [snip]
 >>> import magic
 [snip]
 ModuleNotFoundError: No module named 'ctypes'
 ModuleNotFoundError: No module named 'tempfile'

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-devtools/python/python3-magic_0.4.18.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-magic_0.4.18.bb b/meta/recipes-devtools/python/python3-magic_0.4.18.bb
index be423adacd..101b96d31c 100644
--- a/meta/recipes-devtools/python/python3-magic_0.4.18.bb
+++ b/meta/recipes-devtools/python/python3-magic_0.4.18.bb
@@ -14,6 +14,9 @@ inherit pypi setuptools3
 SRC_URI[md5sum] = "5edc6caa39cc62641850f6b1b6f284ba"
 SRC_URI[sha256sum] = "b757db2a5289ea3f1ced9e60f072965243ea43a2221430048fd8cacab17be0ce"
 
-RDEPENDS_${PN} += "file"
+RDEPENDS_${PN} += "file \
+                   ${PYTHON_PN}-ctypes \
+                   ${PYTHON_PN}-io \
+                   ${PYTHON_PN}-shell"
 
 BBCLASSEXTEND = "native"
-- 
2.24.1

