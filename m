Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.7483.1585298054099360260
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2020 01:34:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: ovidiu.panait@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 02R8XqtN031802
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2020 01:34:03 -0700
Received: from otp-linux01.wrs.com (128.224.126.17) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Fri, 27 Mar 2020
 01:33:24 -0700
From: "Ovidiu Panait" <ovidiu.panait@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] db: Add dbm packageconfig
Date: Fri, 27 Mar 2020 10:31:55 +0200
Message-ID: <20200327083156.20874-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Add "dbm" packageconfig to enable legacy dbm support in libdb. This support is
needed to build libpam pam_userdb.so plugin.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 meta/recipes-support/db/db_5.3.28.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db/db_5.3.28.bb
index badb79f9ea..3a0923ae36 100644
--- a/meta/recipes-support/db/db_5.3.28.bb
+++ b/meta/recipes-support/db/db_5.3.28.bb
@@ -61,7 +61,9 @@ DB5_CONFIG ?= "--enable-o_direct --disable-cryptography --disable-queue --disabl
 
 EXTRA_OECONF = "${DB5_CONFIG} --enable-shared --enable-cxx --with-sysroot STRIP=true"
 
+PACKAGECONFIG ??= ""
 PACKAGECONFIG[verify] = "--enable-verify, --disable-verify"
+PACKAGECONFIG[dbm] = "--enable-dbm,--disable-dbm,"
 
 EXTRA_OEMAKE += "LIBTOOL='./${HOST_SYS}-libtool'"
 
-- 
2.17.1

