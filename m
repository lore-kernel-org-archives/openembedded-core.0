Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.5946.1586252804908669006
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2020 02:46:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 0379ki3Z013323
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 7 Apr 2020 02:46:44 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Tue, 7 Apr 2020 02:46:37 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] parselogs.py: update network interface related messages
Date: Tue, 7 Apr 2020 17:46:36 +0800
Message-ID: <1586252796-52729-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

along with systemd upgrade, error message related change
network interface have changed, update it.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index cc4f5f8..f94387c 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -55,7 +55,8 @@ common_errors = [
     "Failed to read /var/lib/nfs/statd/state: Success",
     "error retry time-out =",
     "logind: cannot setup systemd-logind helper (-61), using legacy fallback",
-    "Error changing net interface name 'eth0' to ",
+    "Failed to rename network interface",
+    "Failed to process device, ignoring: Device or resource busy",
     "Cannot find a map file",
     "[rdrand]: Initialization Failed"
     ]
-- 
2.7.4

