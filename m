Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.2060.1595969037593211641
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2020 13:43:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: mzeng@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 06SKhtlx009767
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2020 13:43:56 -0700 (PDT)
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Tue, 28 Jul 2020
 13:43:55 -0700
Received: by yow-lpggp3.wrs.com (Postfix, from userid 21151)	id 7B26C2000C;
 Tue, 28 Jul 2020 16:43:54 -0400 (EDT)
From: "Matthew" <matthew.zeng@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <randy.macleod@windriver.com>
Subject: [PATCH] ltp.py: remove mm from ltp_groups
Date: Tue, 28 Jul 2020 16:43:54 -0400
Message-ID: <20200728204354.10970-1-matthew.zeng@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Fixes [YOCTO #13802]

Temporary disable mm test for a while, since it calls the OOM tests.
See ltp-git/runtest/mm:
    oom01 oom01
    oom02 oom02
    oom03 oom03
    oom04 oom04
    oom05 oom05

Let's wait for a week or two to see if the error stops occuring.

Signed-off-by: Mingde (Matthew) Zeng <matthew.zeng@windriver.com>
---
 meta/lib/oeqa/runtime/cases/ltp.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/ltp.py b/meta/lib/oeqa/runtime/cases/ltp.py
index cfac29c153..9ac7bb15f6 100644
--- a/meta/lib/oeqa/runtime/cases/ltp.py
+++ b/meta/lib/oeqa/runtime/cases/ltp.py
@@ -57,7 +57,7 @@ class LtpTestBase(OERuntimeTestCase):
 
 class LtpTest(LtpTestBase):
 
-    ltp_groups = ["math", "syscalls", "dio", "io", "mm", "ipc", "sched", "nptl", "pty", "containers", "controllers", "filecaps", "cap_bounds", "fcntl-locktests", "connectors", "commands", "net.ipv6_lib", "input","fs_perms_simple"]
+    ltp_groups = ["math", "syscalls", "dio", "io", "ipc", "sched", "nptl", "pty", "containers", "controllers", "filecaps", "cap_bounds", "fcntl-locktests", "connectors", "commands", "net.ipv6_lib", "input","fs_perms_simple"]
 
     ltp_fs = ["fs", "fsx", "fs_bind"]
     # skip kernel cpuhotplug
-- 
2.27.0

