Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.5164.1596027305364714935
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2020 05:55:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mzeng@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 06TCshcV028997
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2020 05:54:53 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Wed, 29 Jul 2020
 05:54:33 -0700
Received: by yow-lpggp3.wrs.com (Postfix, from userid 21151)	id 6584F1FF57;
 Wed, 29 Jul 2020 08:54:32 -0400 (EDT)
From: "Matthew" <matthew.zeng@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] ltp: remove OOM tests from runtest/mm
Date: Wed, 29 Jul 2020 08:54:32 -0400
Message-ID: <20200729125432.32435-1-matthew.zeng@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Fixes [YOCTO #13802]

Temporarily remove the OOM tests, since they might cause oeqa ssh
connection lost.

Let's wait for a week or two to see if the error stops occuring.

Signed-off-by: Mingde (Matthew) Zeng <matthew.zeng@windriver.com>
---
 ...001-Remove-OOM-tests-from-runtest-mm.patch | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
new file mode 100644
index 0000000000..3a58986288
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
@@ -0,0 +1,33 @@
+From e49c4bc6e8b5c1d6f3e9763751e1fb656788709b Mon Sep 17 00:00:00 2001
+From: "Mingde (Matthew) Zeng" <matthewzmd@gmail.com>
+Date: Wed, 29 Jul 2020 08:47:09 -0400
+Subject: [PATCH] Remove OOM tests from runtest/mm
+
+Disable OOM tests, as they might cause oeqa ssh connection lost
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Mingde (Matthew) Zeng <matthewzmd@gmail.com>
+---
+ runtest/mm | 6 ------
+ 1 file changed, 6 deletions(-)
+
+diff --git a/runtest/mm b/runtest/mm
+index 4701a14bd..2f9888ec6 100644
+--- a/runtest/mm
++++ b/runtest/mm
+@@ -75,12 +75,6 @@ ksm06_2 ksm06 -n 10000
+ 
+ cpuset01 cpuset01
+ 
+-oom01 oom01
+-oom02 oom02
+-oom03 oom03
+-oom04 oom04
+-oom05 oom05
+-
+ swapping01 swapping01 -i 5
+ 
+ thp01 thp01 -I 120
+-- 
+2.27.0
+
-- 
2.27.0

