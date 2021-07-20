Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web09.1710.1626808155621449490
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jul 2021 12:09:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: sakib.sajal@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 16KJ9DqJ023708
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Jul 2021 12:09:14 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 20 Jul 2021 12:09:13 -0700
Received: from localhost.localdomain (128.224.73.108) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Tue, 20 Jul 2021 12:09:12 -0700
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] scripts/oe-time-dd-test.sh: run "uptime" on each iteration
Date: Tue, 20 Jul 2021 15:09:06 -0400
Message-ID: <20210720190906.15468-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 scripts/oe-time-dd-test.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/oe-time-dd-test.sh b/scripts/oe-time-dd-test.sh
index df36c0b297..386de83dce 100755
--- a/scripts/oe-time-dd-test.sh
+++ b/scripts/oe-time-dd-test.sh
@@ -25,7 +25,6 @@ usage() {
 }
 
 run_cmds() {
-    uptime
     echo "start: top output"
 	top -c -b -n1 -w 512
 	echo "end: top output"
@@ -85,6 +84,7 @@ done
 
 
 if [ "$LOG_ONLY" = "true" ] ; then
+    uptime
     run_cmds
     exit
 fi
@@ -94,6 +94,7 @@ if [ -z ${TIMEOUT+x} ] || [ -z ${COUNT+x} ] ; then
     exit 1
 fi
 
+uptime
 echo "Timeout used: ${TIMEOUT}"
 timeout ${TIMEOUT} dd if=/dev/zero of=oe-time-dd-test.dat bs=1024 count=${COUNT} conv=fsync
 if [ $? -ne 0 ]; then
-- 
2.25.1

