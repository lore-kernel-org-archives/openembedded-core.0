Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 8363B761AB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 15:12:13 +0000 (UTC)
Received: by wicgb10 with SMTP id gb10so33153514wic.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 08:12:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=utWW6m0tdJ8Fe7rggrf/TqxyoPBdw4DwK9WbQqrXVQY=;
	b=aHXXx38Bn1ATKapfa7ZUiggdKFvT6fmIshNyC1rQRGkdlN0NIiDLFe1U5X3rVjAiim
	Ltvwswncz9dpJVJ3UsST4KMynmtKta7fBfv0uWL3tGih99V+Zb5Ta3mA8qplFO4lBn6Y
	4tsQu6G/E0mBnlx2gYlljRmZhlAwkSHFJ4P5k9I532SbaeXNePYp+vAY8g03RfGjjnMF
	7uL6dcvug3izAnLSMLziHB0m21gOvZt1Ye7zBAJg0o0kqpZRhvZBK11VSISVFFCC0/ho
	homVi7/XUSCcazVG3ujPc3kB+jWvQ1DT0mDuQiyrMnAsNqR45p9feyILtxNiXVoVWsHG
	lTpw==
X-Gm-Message-State: ALoCoQk+TbDy177E3jjPCkRH75sBPf1p1OR+zyQ6SJQNY7038xxuzOhEgAwWDjh6KJkOrcVpvSWh
X-Received: by 10.194.187.51 with SMTP id fp19mr26526784wjc.67.1437750733941; 
	Fri, 24 Jul 2015 08:12:13 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	di7sm3963980wib.23.2015.07.24.08.12.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Jul 2015 08:12:13 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jul 2015 16:06:20 +0100
Message-Id: <1437750380-30454-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH][V3] oeqa/runtime: remove dmesg test
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
X-List-Received-Date: Fri, 24 Jul 2015 15:12:15 -0000

This has been obsoleted by parselogs.

(From OE-Core rev: 9dd3c187b3fbf5b007f8c9ef36a5627bebfcb295)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/testimage.bbclass                        |  4 ++--
 meta/lib/oeqa/runtime/dmesg.py                        | 12 ------------
 meta/recipes-extended/images/core-image-kernel-dev.bb |  2 +-
 3 files changed, 3 insertions(+), 15 deletions(-)
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
diff --git a/meta/recipes-extended/images/core-image-kernel-dev.bb b/meta/recipes-extended/images/core-image-kernel-dev.bb
index 6b636ed..26b88c9 100644
--- a/meta/recipes-extended/images/core-image-kernel-dev.bb
+++ b/meta/recipes-extended/images/core-image-kernel-dev.bb
@@ -17,4 +17,4 @@ CORE_IMAGE_EXTRA_INSTALL += "${KERNEL_DEV_MODULE} \
 IMAGE_ROOTFS_EXTRA_SPACE_append += "+ 3000000"
 
 # Let's define our own subset to test, we can later add a on-target kernel build even!
-DEFAULT_TEST_SUITES = "ping ssh df connman syslog scp date dmesg parselogs"
+DEFAULT_TEST_SUITES = "ping ssh df connman syslog scp date parselogs"
-- 
2.1.4


