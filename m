Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.46103.1606183694119230876
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2020 18:08:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,364,1599494400"; 
   d="scan'208";a="101678530"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 24 Nov 2020 10:08:04 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 8640B4CE5478
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2020 10:08:01 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 24 Nov 2020 10:07:59 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] [OE-core] [PATCHv2] systemtap: upgrade 4.3 -> 4.4
Date: Tue, 24 Nov 2020 19:49:06 +0800
Message-ID: <1606218546-115087-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 8640B4CE5478.A11C5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

The test log of oe-selftest is as follows:
2020-11-23 15:48:49,144 - oe-selftest - INFO - test_crosstap_helloworld (runtime_test.SystemTap)
2020-11-23 17:06:55,949 - oe-selftest - INFO -  ... ok
2020-11-23 17:06:55,951 - oe-selftest - INFO - test_crosstap_pstree (runtime_test.SystemTap)
2020-11-23 17:08:07,921 - oe-selftest - INFO -  ... ok
2020-11-23 17:08:07,922 - oe-selftest - INFO - test_crosstap_syscalls_by_pid (runtime_test.SystemTap)
2020-11-23 17:09:20,084 - oe-selftest - INFO -  ... ok
2020-11-23 17:09:20,085 - oe-selftest - INFO - test_crosstap_syscalls_by_proc (runtime_test.SystemTap)
2020-11-23 17:10:31,349 - oe-selftest - INFO -  ... ok
2020-11-23 17:12:58,052 - oe-selftest - INFO - ----------------------------------------------------------------------
2020-11-23 17:12:58,054 - oe-selftest - INFO - Ran 4 tests in 5051.537s
2020-11-23 17:12:58,054 - oe-selftest - INFO - OK
2020-11-23 17:13:08,416 - oe-selftest - INFO - RESULTS:
2020-11-23 17:13:08,417 - oe-selftest - INFO - RESULTS - runtime_test.SystemTap.test_crosstap_helloworld: PASSED (4686.81s)
2020-11-23 17:13:08,418 - oe-selftest - INFO - RESULTS - runtime_test.SystemTap.test_crosstap_pstree: PASSED (71.97s)
2020-11-23 17:13:08,418 - oe-selftest - INFO - RESULTS - runtime_test.SystemTap.test_crosstap_syscalls_by_pid: PASSED (72.16s)
2020-11-23 17:13:08,418 - oe-selftest - INFO - RESULTS - runtime_test.SystemTap.test_crosstap_syscalls_by_proc: PASSED (71.26s)
2020-11-23 17:13:08,432 - oe-selftest - INFO - SUMMARY:
2020-11-23 17:13:08,432 - oe-selftest - INFO - oe-selftest () - Ran 4 tests in 5051.540s
2020-11-23 17:13:08,432 - oe-selftest - INFO - oe-selftest - OK - All required tests passed (successes=4, skipped=0, failures=0, errors=0)

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta/recipes-kernel/systemtap/systemtap_git.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 56fa51d61e..ae735025b7 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -1,7 +1,7 @@
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-SRCREV = "82b8e1a07a31bf37ed05d6ebc5162b054c0be9fd"
-PV = "4.3"
+SRCREV = "988f439af39a359b4387963ca4633649866d8275"
+PV = "4.4"
 
 SRC_URI = "git://sourceware.org/git/systemtap.git \
            file://0001-Do-not-let-configure-write-a-python-location-into-th.patch \
-- 
2.25.1



