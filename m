Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.141.1589922589255777078
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2020 14:09:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: joe.slater@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 04JL9lGl021999
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2020 14:09:47 -0700 (PDT)
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Tue, 19 May 2020
 14:09:29 -0700
From: "Joe Slater" <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [oe-core][PATCH 1/1] acpica: gcc-10
Date: Tue, 19 May 2020 14:09:26 -0700
Message-ID: <20200519210928.1995-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Advance to version 20200430 to avoid multiple definition errors for uninitialized variables.
In this case, it is not enough to add -fcommon to CFLAGS.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../acpica/{acpica_20200214.bb => acpica_20200430.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/acpica/{acpica_20200214.bb => acpica_20200430.bb} (91%)

diff --git a/meta/recipes-extended/acpica/acpica_20200214.bb b/meta/recipes-extended/acpica/acpica_20200430.bb
similarity index 91%
rename from meta/recipes-extended/acpica/acpica_20200214.bb
rename to meta/recipes-extended/acpica/acpica_20200430.bb
index cfa9fec..478be7f 100644
--- a/meta/recipes-extended/acpica/acpica_20200214.bb
+++ b/meta/recipes-extended/acpica/acpica_20200430.bb
@@ -17,8 +17,8 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 DEPENDS = "m4-native flex-native bison-native"
 
 SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz"
-SRC_URI[md5sum] = "3505ba6170b77db1399eae0e2a959113"
-SRC_URI[sha256sum] = "e77ab9f8557ca104f6e8f49efaa8eead29f78ca11cadfc8989012469ecc0738e"
+SRC_URI[sha256sum] = "fb807f1dec31664f972af37d213abf72987afe33abf68c83051e298da35d297c"
+
 UPSTREAM_CHECK_URI = "https://acpica.org/downloads"
 
 S = "${WORKDIR}/acpica-unix-${PV}"
-- 
2.7.4

