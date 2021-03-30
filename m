Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.5005.1617113158033153453
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Mar 2021 07:05:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: randy.macleod@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 12UE5YXd022484
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Mar 2021 07:05:50 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 30 Mar 2021 07:05:38 -0700
Received: from vme.wrs.com (172.25.44.2) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2106.2 via Frontend
 Transport; Tue, 30 Mar 2021 07:05:38 -0700
From: "Randy MacLeod" <randy.macleod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] sqlite3: upgrade 3.35.0 -> 3.35.3
Date: Tue, 30 Mar 2021 10:05:37 -0400
Message-ID: <20210330140537.121107-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../sqlite/{sqlite3_3.35.0.bb => sqlite3_3.35.3.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.35.0.bb => sqlite3_3.35.3.bb} (83%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.35.0.bb b/meta/recipes-support/sqlite/sqlite3_3.35.3.bb
similarity index 83%
rename from meta/recipes-support/sqlite/sqlite3_3.35.0.bb
rename to meta/recipes-support/sqlite/sqlite3_3.35.3.bb
index 127065bbc1..459dcbd4c8 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.35.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.35.3.bb
@@ -4,7 +4,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2021/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "3dfb3f143c83695a555c7dd9e06ed924f9d273c287989874e102656724baf2d0"
+SRC_URI[sha256sum] = "ecbccdd440bdf32c0e1bb3611d635239e3b5af268248d130d0445a32daf0274b"
 
 # -19242 is only an issue in specific development branch commits
 CVE_CHECK_WHITELIST += "CVE-2019-19242"
-- 
2.27.0

