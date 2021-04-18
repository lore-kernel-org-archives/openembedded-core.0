Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.13758.1618765250614768285
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Apr 2021 10:00:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: randy.macleod@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 13IH0nfE015723
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Sun, 18 Apr 2021 10:00:49 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Sun, 18 Apr 2021 10:00:49 -0700
Received: from vme.wrs.com (172.25.44.2) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Sun, 18 Apr 2021 10:00:49 -0700
From: "Randy MacLeod" <randy.macleod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] oe-time-dd-test.sh: increase timeout to 15 sec
Date: Sun, 18 Apr 2021 13:00:48 -0400
Message-ID: <20210418170048.150940-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

With the previous timeout of 5 seconds, there would be
builds such as:
   https://autobuilder.yocto.io/pub/non-release/20210417-13/
which produced 17 files with top output with top running 454 times
and that's a bit too much data to analyze for each run. By
increasing the timeout, we'll find the worse problems
first, fix them and then we can decrease the timeout if needed.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 scripts/oe-time-dd-test.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-time-dd-test.sh b/scripts/oe-time-dd-test.sh
index 5b25e6bd97..459071e732 100755
--- a/scripts/oe-time-dd-test.sh
+++ b/scripts/oe-time-dd-test.sh
@@ -13,7 +13,7 @@ usage() {
         echo "Usage: $0 <count>"
 }
 
-TIMEOUT=5
+TIMEOUT=15
 
 if [ $# -ne 1 ]; then
         usage
-- 
2.27.0

