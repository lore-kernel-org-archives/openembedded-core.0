Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id A906275791
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 10:53:45 +0000 (UTC)
Received: by wibud3 with SMTP id ud3so60317075wib.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 03:53:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=gBuAjqtaH2IO+RLkwMo27TVxtiPphctTbz6dyA7EX4E=;
	b=dTqg7bct+X7ci93bBaXZ+s2fG1ES7IHxJD5AxQUd+tlyBt8pLJgSEG7lNaOt0HRgeY
	8BV1wzbv99letcvajqnTjSC1koF2ehhzeqMnsRsoGMQnUe/UzTXxR4PDPL8qSYp1QiSe
	rphjqpEeAkJzT4IpoiZtiG8HOrX2sxiYNtPDcCi19WQnN9WzrX8roKsrjh319VjYm5ju
	bu+RNzlV+dk7lwKVwrwYbb/TqWVXdDWVLqDcwwJDBd4/6HpEocUHWde32a0/XkoNrsnC
	YpxrjaBXyKFoPk/OIvmCHwNNSFk63kB3uCh1Iuwi6sjo2RHQ2YVlU7P9j3KTlsGdB8l7
	2YYA==
X-Gm-Message-State: ALoCoQlxKCSgql6PzGheGqFcOzF0g6CUDfWpSYJ2Z0JqoV2eclZaYFXUg3y2qSD4F53Yr3ahXgeG
X-Received: by 10.180.38.34 with SMTP id d2mr5765648wik.48.1437735224900;
	Fri, 24 Jul 2015 03:53:44 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	fb3sm2904540wib.21.2015.07.24.03.53.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Jul 2015 03:53:43 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jul 2015 11:47:51 +0100
Message-Id: <1437734871-27240-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH][V2] oeqa/runtime: remove dmesg test
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Jul 2015 10:53:49 -0000

This has been obsoleted by parselogs.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/testimage.bbclass |  4 ++--
 meta/lib/oeqa/runtime/dmesg.py | 12 ------------
 2 files changed, 2 insertions(+), 14 deletions(-)
 delete mode 100644 meta/lib/oeqa/runtime/dmesg.py

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 2b655b4..37acb0c 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -34,9 +34,9 @@ TEST_EXPORT_ONLY ?= "0"
 
 DEFAULT_TEST_SUITES = "ping auto"
 DEFAULT_TEST_SUITES_pn-core-image-minimal = "ping"
-DEFAULT_TEST_SUITES_pn-core-image-sato = "ping ssh df connman syslog xorg scp vnc date dmesg parselogs \
+DEFAULT_TEST_SUITES_pn-core-image-sato = "ping ssh df connman syslog xorg scp vnc date parselogs \
     ${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'python smart rpm', '', d)}"
-DEFAULT_TEST_SUITES_pn-core-image-sato-sdk = "ping ssh df connman syslog xorg scp vnc date perl ldd gcc kernelmodule dmesg python parselogs \
+DEFAULT_TEST_SUITES_pn-core-image-sato-sdk = "ping ssh df connman syslog xorg scp vnc date perl ldd gcc kernelmodule python parselogs \
     ${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'smart rpm', '', d)}"
 DEFAULT_TEST_SUITES_pn-meta-toolchain = "auto"
 
diff --git a/meta/lib/oeqa/runtime/dmesg.py b/meta/lib/oeqa/runtime/dmesg.py
deleted file mode 100644
index 5831471..0000000
--- a/meta/lib/oeqa/runtime/dmesg.py
+++ /dev/null
@@ -1,12 +0,0 @@
-import unittest
-from oeqa.oetest import oeRuntimeTest
-from oeqa.utils.decorators import *
-
-
-class DmesgTest(oeRuntimeTest):
-
-    @testcase(215)
-    @skipUnlessPassed('test_ssh')
-    def test_dmesg(self):
-        (status, output) = self.target.run('dmesg | grep -v mmci-pl18x | grep -v "error changing net interface name" | grep -iv "dma timeout" | grep -v usbhid | grep -i error')
-        self.assertEqual(status, 1, msg = "Error messages in dmesg log: %s" % output)
-- 
2.1.4


