Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.2299.1591858964581601628
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2020 00:02:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 05B72B2U011158
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2020 00:02:33 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Thu, 11 Jun 2020 00:02:12 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] python3-dbusmock: add the missing rdepends
Date: Thu, 11 Jun 2020 15:00:43 +0800
Message-ID: <20200611070043.692611-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Add the missing rdepends to fix below error:
 # python3
 [snip]
 >>> import dbusmock
 [snip]
 ModuleNotFoundError: No module named 'unittest'

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-devtools/python/python3-dbusmock_0.19.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.19.bb b/meta/recipes-devtools/python/python3-dbusmock_0.19.bb
index 5389e48973..d297dbc1df 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.19.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.19.bb
@@ -12,5 +12,6 @@ inherit pypi setuptools3
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-dbus \
     ${PYTHON_PN}-pygobject \
+    ${PYTHON_PN}-unittest \
     ${PYTHON_PN}-xml \
     "
-- 
2.24.1

