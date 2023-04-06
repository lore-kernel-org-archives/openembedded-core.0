Return-Path: <qiutt@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EB02C7619A
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 02:24:02 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.149302.1680747839529761816
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Apr 2023 19:24:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=rHLaaZp8;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: qiutt@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1680747837; i=@fujitsu.com;
	bh=lZ+39QgP/nECXB6peqQiriL5fdJNaAXw4hOAsK+Us8Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=rHLaaZp87r9e7FAhf+Lvs07a0KJGrTXfMg2dWthShiImvPcOB/uWH1zmfSZcTf8DF
	 VEnrQk0QhCxbMQr7ksO7Zp9BmkdmJXFndjEsd1bSN6rPfHzEZ5R3+gx5yUK9z49m6P
	 dmgSAOBsIfUmlJ3AVohLabD+jlm2/CJrN0tsw7URd8mQREipQszWbGug0eI/kVmNtO
	 NOmUM+lrMDbM4zc652UnrBQtXyxDud7hsOzQf3v9QX70BGNxvGfWQTy/KoHqJIA3e0
	 WwMwvhhsW2CZHKtVNmoiV8MYB3VqIQez7ugkkemGcl8jbDT4GZaaTRQOJLpeShnyLW
	 CwA7Z8PwAnEjg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRWlGSWpSXmKPExsViZ8MxSddGVy/
  FYMIRbYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPGpKvMBbckK7aducHYwHhBtIuRi0NI4DGj
  xMSph1ggnGtMEh9a9rFBOLsZJe7Oe8HYxcjJwSYgKbG8eRVTFyMHh4iAnsTVf6IgYWYBV4ldD
  86BlQgLGEvsf3eKHcRmEVCR+Dh9NZjNK+AgsXDRdWYQW0JATmLH6idMEHFBiZMzn7BAzJGQOP
  jiBVSNosTUjqUsEHaFROP0Q0wQtprE1XObmCcw8s9C0j4LSfsCRqZVjKbFqUVlqUW6JnpJRZn
  pGSW5iZk5eolVuol6qaW65anFJbqGeonlxXqpxcV6xZW5yTkpenmpJZsYgaGYUsz6dgfj/96/
  eocYJTmYlER556ropAjxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4FVW1UsREixKTU+tSMvMAcYFT
  FqCg0dJhHenFFCat7ggMbc4Mx0idYpRl+Pjn4t7mYVY8vLzUqXEeVN1gIoEQIoySvPgRsBi9B
  KjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV5bbaApPJl5JXCbXgEdwQR0hK2/DsgRJYkIKak
  Gps2RAfHaKcGbF/j6munIOB045r2uovLrpd/ilU0/OnhPXP+osJF7SdhmiQJLF9+/Jn6hljGb
  rta58az12tin4/ng/F8G58uhV35w6/vJnU4PSMmZtv3wxxOmkwTmKPN+SX101nKVorrdTh4rk
  UfrdrW+mKP52fX5ZYYEp191SiKrjy1OaSktqJRftkN38saPM2wyGCNvnU8rf9m4rWqGb13LUp
  d/81N+8SbdenmieXVTSLzLMo6Dxl+OHry+906PxnHdk7dPWtycJpy0Nu3v/GUT9Dw9Fz7bvaf
  /x/m1XzQ2b1Tf/b3I+Wy5bkS1tH5J9F6mJO5roUabdzDWq/7c7cZnzGqa/LVPskZwulySrhJL
  cUaioRZzUXEiANSMsE5MAwAA
X-Env-Sender: qiutt@fujitsu.com
X-Msg-Ref: server-8.tower-591.messagelabs.com!1680747836!113111!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11241 invoked from network); 6 Apr 2023 02:23:56 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 6 Apr 2023 02:23:56 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 530AC10033F
	for <openembedded-core@lists.openembedded.org>; Thu,  6 Apr 2023 03:23:56 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 465201000FC
	for <openembedded-core@lists.openembedded.org>; Thu,  6 Apr 2023 03:23:56 +0100 (BST)
Received: from localhost.localdomain (10.167.219.96) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 6 Apr 2023 03:23:54 +0100
From: <qiutt@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: <fnstml-fujitsuten@fujitsu.com>, Qiu Tingting <qiutt@fujitsu.com>
Subject: [meta-oe][PATCH V2] lz4: Add ptest support
Date: Thu, 6 Apr 2023 10:23:30 +0800
Message-ID: <1680747810-2953-1-git-send-email-qiutt@fujitsu.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.219.96]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 02:24:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179755

From: Qiu Tingting <qiutt@fujitsu.com>

Add a ptest for lz4.
- It is taking around 9 min to execute with kvm, so added it to PTEST_SLOW.
- It contains one case: test_frame.
- Below is the run log:
  START: ptest-runner
  2023-04-06T00:36
  BEGIN: /usr/lib/lz4/ptest
  Starting lz4frame tester (64-bits, 1.9.4)
  Seed = 7314
  Basic tests completed
  All tests completed
  PASS: lz4/test_frame
  DURATION: 573
  END: /usr/lib/lz4/ptest
  2023-04-06T00:45
  STOP: ptest-runner
  TOTAL: 1 FAIL: 0

Signed-off-by: Qiu Tingting <qiutt@fujitsu.com>
---
 .../distro/include/ptest-packagelists.inc     |  3 +--
 meta/recipes-support/lz4/files/run-ptest      | 17 ++++++++++++++++
 meta/recipes-support/lz4/lz4_1.9.4.bb         | 20 ++++++++++++++++++-
 3 files changed, 37 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-support/lz4/files/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index d60ebb38fc..d6351466f2 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -105,6 +105,7 @@ PTESTS_SLOW = "\
     tcl \
     util-linux \
     valgrind \
+    lz4 \
 "
 
 PTESTS_SLOW:remove:riscv64 = "valgrind"
@@ -114,7 +115,6 @@ PTESTS_SLOW:remove:x86 = "valgrind"
 PTESTS_PROBLEMS:append:x86 = " valgrind"
 
 #    ruby \ # Timeout
-#    lz4 \ # Needs a rewrite
 #    rt-tests \ # Needs to be checked whether it runs at all
 #    bash \ # Test outcomes are non-deterministic by design
 #    ifupdown \ # Tested separately in lib/oeqa/selftest/cases/imagefeatures.py
@@ -127,7 +127,6 @@ PTESTS_PROBLEMS:append:x86 = " valgrind"
 
 PTESTS_PROBLEMS = "\
     ruby \
-    lz4 \
     rt-tests \
     bash \
     ifupdown \
diff --git a/meta/recipes-support/lz4/files/run-ptest b/meta/recipes-support/lz4/files/run-ptest
new file mode 100644
index 0000000000..f4a46a4f2c
--- /dev/null
+++ b/meta/recipes-support/lz4/files/run-ptest
@@ -0,0 +1,17 @@
+#!/bin/sh
+
+# Define test work dir
+WORKDIR=@PTEST_PATH@/tests/
+
+# Run test
+cd ${WORKDIR}
+
+case_name="test_frame"
+./frametest 
+ret=$?
+if [[ ${ret} == "0" ]]; then
+    echo "PASS: lz4/$case_name"
+else
+    echo "FAIL: lz4/$case_name"
+fi
+
diff --git a/meta/recipes-support/lz4/lz4_1.9.4.bb b/meta/recipes-support/lz4/lz4_1.9.4.bb
index a2a178bab5..d2a25fd5b0 100644
--- a/meta/recipes-support/lz4/lz4_1.9.4.bb
+++ b/meta/recipes-support/lz4/lz4_1.9.4.bb
@@ -12,11 +12,15 @@ PE = "1"
 
 SRCREV = "5ff839680134437dbf4678f3d0c7b371d84f4964"
 
-SRC_URI = "git://github.com/lz4/lz4.git;branch=release;protocol=https"
+SRC_URI = "git://github.com/lz4/lz4.git;branch=release;protocol=https \
+	   file://run-ptest \
+	   "
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
 
 S = "${WORKDIR}/git"
 
+inherit ptest
+
 # Fixed in r118, which is larger than the current version.
 CVE_CHECK_IGNORE += "CVE-2014-4715"
 
@@ -27,3 +31,17 @@ do_install() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+RDEPENDS:${PN}-ptest += "bash"
+
+do_compile_ptest() {
+        oe_runmake -C ${B}/tests/
+}
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests/
+	install --mode=755 ${B}/tests/frametest ${D}${PTEST_PATH}/tests/
+	sed -i "s#@PTEST_PATH@#${PTEST_PATH}#g" ${D}${PTEST_PATH}/run-ptest
+
+}
+
-- 
2.25.1


