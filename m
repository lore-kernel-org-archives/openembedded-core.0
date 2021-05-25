Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
 by mx.groups.io with SMTP id smtpd.web08.7780.1621937673466809410
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 May 2021 03:14:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: siemens.com, ip: 192.35.17.28, mailfrom: andrej.valek@siemens.com)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 14PAEVhp009265
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Tue, 25 May 2021 12:14:31 +0200
Received: from dev.vm6.ccp.siemens.com ([144.145.220.59])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id 14PAEUkt032563;
	Tue, 25 May 2021 12:14:31 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 9ECDC950A87;
	Tue, 25 May 2021 12:14:30 +0200 (CEST)
From: "Andrej Valek" <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrej Valek <andrej.valek@siemens.com>
Subject: [OE-core][PATCH v2] expat: upgrade 2.3.0 -> 2.4.1
Date: Tue, 25 May 2021 12:13:49 +0200
Message-Id: <20210525101349.15530-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210525090910.11581-1-andrej.valek@siemens.com>
References: <20210525090910.11581-1-andrej.valek@siemens.com>

Includes lot of security fixes, especially CVE-2013-0340/CWE-776.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta/recipes-core/expat/{expat_2.3.0.bb => expat_2.4.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/expat/{expat_2.3.0.bb => expat_2.4.1.bb} (89%)

diff --git a/meta/recipes-core/expat/expat_2.3.0.bb b/meta/recipes-core/expat/expat_2.4.1.bb
similarity index 89%
rename from meta/recipes-core/expat/expat_2.3.0.bb
rename to meta/recipes-core/expat/expat_2.4.1.bb
index 14d2855df3..a57fc1b23b 100644
--- a/meta/recipes-core/expat/expat_2.3.0.bb
+++ b/meta/recipes-core/expat/expat_2.4.1.bb
@@ -11,7 +11,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/expat/expat-${PV}.tar.bz2 \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "f122a20eada303f904d5e0513326c5b821248f2d4d2afbf5c6f1339e511c0586"
+SRC_URI[sha256sum] = "2f9b6a580b94577b150a7d5617ad4643a4301a6616ff459307df3e225bcfbf40"
 
 EXTRA_OECMAKE_class-native += "-DEXPAT_BUILD_DOCS=OFF"
 
-- 
2.11.0

