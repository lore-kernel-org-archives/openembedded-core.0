Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.66.1623688054622597507
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jun 2021 09:27:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: sakib.sajal@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 15EGRXiT004799
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Jun 2021 09:27:33 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 15EGRWLG000790
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Jun 2021 09:27:33 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 14 Jun 2021 09:27:32 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Mon, 14 Jun 2021 09:27:32 -0700
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] oe-time-dd-test.sh: improve output formatting
Date: Mon, 14 Jun 2021 12:27:27 -0400
Message-ID: <20210614162727.4239-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 scripts/oe-time-dd-test.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/oe-time-dd-test.sh b/scripts/oe-time-dd-test.sh
index 46b218b76a..103eee5f65 100755
--- a/scripts/oe-time-dd-test.sh
+++ b/scripts/oe-time-dd-test.sh
@@ -24,6 +24,9 @@ uptime
 timeout ${TIMEOUT} dd if=/dev/zero of=oe-time-dd-test.dat bs=1024 count=$1 conv=fsync
 if [ $? -ne 0 ]; then
 	echo "Timeout used: ${TIMEOUT}"
+	echo "start: top output"
 	top -c -b -n1 -w 512
+	echo "end: top output\n\nstart: cooker log"
 	tail -30 tmp*/log/cooker/*/console-latest.log
+	echo "end: cooker log"
 fi
-- 
2.29.2

