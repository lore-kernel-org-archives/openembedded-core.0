Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.7682.1591163359351710748
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 22:49:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: qi.chen@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 0535nHgN029196
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 2 Jun 2020 22:49:18 -0700 (PDT)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Tue, 2 Jun 2020 22:48:59 -0700
From: "Chen Qi" <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] db: enable verify PACKAGECONFIG
Date: Wed, 3 Jun 2020 13:48:58 +0800
Message-ID: <20200603054858.6762-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

On target, when running `db_verify /var/lib/rpm/Packages', we get
the following error.

  db_verify: BDB0571 library build did not include support for database verification

Enable the 'verify' PACKAGECONFIG to avoid such issue.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-support/db/db_5.3.28.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db/db_5.3.28.bb
index 3a0923ae36..b64c4c089a 100644
--- a/meta/recipes-support/db/db_5.3.28.bb
+++ b/meta/recipes-support/db/db_5.3.28.bb
@@ -61,7 +61,7 @@ DB5_CONFIG ?= "--enable-o_direct --disable-cryptography --disable-queue --disabl
 
 EXTRA_OECONF = "${DB5_CONFIG} --enable-shared --enable-cxx --with-sysroot STRIP=true"
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "verify"
 PACKAGECONFIG[verify] = "--enable-verify, --disable-verify"
 PACKAGECONFIG[dbm] = "--enable-dbm,--disable-dbm,"
 
-- 
2.17.1

