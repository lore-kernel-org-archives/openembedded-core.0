Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.1351.1623943731604955226
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jun 2021 08:28:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: sakib.sajal@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 15HFSogX015495
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jun 2021 08:28:50 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 17 Jun 2021 08:28:50 -0700
Received: from localhost.localdomain (128.224.73.134) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Thu, 17 Jun 2021 08:28:49 -0700
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] oe-time-dd-test.sh: add iostat command
Date: Thu, 17 Jun 2021 11:28:37 -0400
Message-ID: <20210617152837.56420-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 scripts/oe-time-dd-test.sh | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/oe-time-dd-test.sh b/scripts/oe-time-dd-test.sh
index 103eee5f65..ccdd55e66e 100755
--- a/scripts/oe-time-dd-test.sh
+++ b/scripts/oe-time-dd-test.sh
@@ -26,7 +26,11 @@ if [ $? -ne 0 ]; then
 	echo "Timeout used: ${TIMEOUT}"
 	echo "start: top output"
 	top -c -b -n1 -w 512
-	echo "end: top output\n\nstart: cooker log"
+	echo "end: top output"
+	echo "start: iostat"
+	iostat -y -z -x 5 1
+	echo "end: iostat"
+	echo "start: cooker log"
 	tail -30 tmp*/log/cooker/*/console-latest.log
 	echo "end: cooker log"
 fi
-- 
2.25.1

