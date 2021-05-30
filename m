Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.37687.1622417003379210892
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 May 2021 16:23:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: sakib.sajal@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 14UNNLm9001733
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Sun, 30 May 2021 16:23:22 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Sun, 30 May 2021 16:23:21 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Sun, 30 May 2021 16:23:21 -0700
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH] qemu: Exclude CVE-2020-3550[4/5/6] from cve-check
Date: Sun, 30 May 2021 19:23:19 -0400
Message-ID: <20210530232319.25707-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

CVE's affect ESP (NCR53C90) part of chip STP2000 (Master I/O).
On Sparc32 it is the NCR89C100 part of the chip.
On Macintosh Quadra it is NCR53C96.
Both are not supported by yocto.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index fbda0c9174..3921546df7 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -76,6 +76,15 @@ CVE_CHECK_WHITELIST += "CVE-2007-0998"
 # https://bugzilla.redhat.com/show_bug.cgi?id=1609015#c11
 CVE_CHECK_WHITELIST += "CVE-2018-18438"
 
+# Following CVE's affect ESP (NCR53C90) part of chip STP2000 (Master I/O).
+# On Sparc32 it is the NCR89C100 part of the chip.
+# On Macintosh Quadra it is NCR53C96.
+# Both are not supported by yocto.
+# Reference: https://www.openwall.com/lists/oss-security/2021/04/16/3
+CVE_CHECK_WHITELIST += "CVE-2020-35504"
+CVE_CHECK_WHITELIST += "CVE-2020-35505"
+CVE_CHECK_WHITELIST += "CVE-2020-35506"
+
 COMPATIBLE_HOST_mipsarchn32 = "null"
 COMPATIBLE_HOST_mipsarchn64 = "null"
 
-- 
2.29.2

