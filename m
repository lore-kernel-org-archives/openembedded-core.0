Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 107CB76FF2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Oct 2015 14:59:28 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so15880245wic.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Oct 2015 07:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=fqjrAUMxg0jq2l0WJpOHxDLfkAOlP6U+HIG72q5Q8MM=;
	b=iErQi7viuj3atH06ZQ4FuHa+n/x2IyOlKgCoPFAqy3qm5lZOnWU2kecKnGjpUv+I+Z
	7NtkBD3hpY8RF0/Qbt4n/PCU00Z8N73srpbfFoSLI8ujXLnYxYV6Hv6dLySU/UGxmrks
	8xBtAckxNNmJhAesndw/ADDeSOB3ttb2DdTGkD9WtBSX+Z83T/7DNgPHVWgWx31aFeJm
	6rrSpD8LzvNFNtEoUeJ+6R0EdjnBkv20sLoEYniWrcbD3Y01AjAw8MboeNljx3czKnBm
	hHx0dgem99rclHf66TXvg1pv/tMl2VfQG290nttj/mbIvElbc3qltzmHTs+xlIr4HVe5
	EYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=fqjrAUMxg0jq2l0WJpOHxDLfkAOlP6U+HIG72q5Q8MM=;
	b=cT44IPRYMAXwr5hcPoGwSvbAl6KTtnh6QBY+lJ4LE10jwpxCP3lgFleXtNzjuEK34j
	H5vbLzjkMdCJ0jNi98rf0bFikoTN9wp7BKCsA9W5Q6X/gzk3qow50KVNFvM/lQ+oeYOE
	Uo+5+Wo2vmUad20pyPLVKS2oQS+nn+7j2xAHSSGBUnB6sDK3sQjlXw3+oXvRQgPmMVQy
	bazUIMLTkLXu7lny0E3DcbtLIYKIcYZmt70HCY9O3TuYbQNHYTgNleUQVlNuxmP14tHn
	gcn2kGNXwPZoFBWx8USIJzyQMpWU6pQRAjyHEwdOD8IYJUuXU4RM2iIZVm4d9amRtgP/
	BTYg==
X-Gm-Message-State: ALoCoQm0+x4RyY4LISIJy6Je5rceroGhXVhossX543BBfB4GY7APS/vol3dzqZHk46Nn/sVJEZXa
X-Received: by 10.180.187.169 with SMTP id ft9mr3359259wic.23.1446044367776;
	Wed, 28 Oct 2015 07:59:27 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	s127sm4684639wmb.8.2015.10.28.07.59.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 28 Oct 2015 07:59:27 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Oct 2015 14:51:36 +0000
Message-Id: <1446043896-27225-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/runtime: remove dmesg test
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
X-List-Received-Date: Wed, 28 Oct 2015 14:59:30 -0000

This has been obsoleted by parselogs.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/testimage.bbclass                        |  4 ++--
 meta/lib/oeqa/runtime/dmesg.py                        | 12 ------------
 meta/recipes-extended/images/core-image-kernel-dev.bb |  2 +-
 3 files changed, 3 insertions(+), 15 deletions(-)
 delete mode 100644 meta/lib/oeqa/runtime/dmesg.py

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index b4d4a69..d571672 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -36,9 +36,9 @@ RPMTESTSUITE = "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'smart rpm', '', d)
 
 DEFAULT_TEST_SUITES = "ping auto"
 DEFAULT_TEST_SUITES_pn-core-image-minimal = "ping"
-DEFAULT_TEST_SUITES_pn-core-image-sato = "ping ssh df connman syslog xorg scp vnc date dmesg parselogs ${RPMTESTSUITE} \
+DEFAULT_TEST_SUITES_pn-core-image-sato = "ping ssh df connman syslog xorg scp vnc date parselogs ${RPMTESTSUITE} \
     ${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'python', '', d)}"
-DEFAULT_TEST_SUITES_pn-core-image-sato-sdk = "ping ssh df connman syslog xorg scp vnc date perl ldd gcc kernelmodule dmesg python parselogs ${RPMTESTSUITE}"
+DEFAULT_TEST_SUITES_pn-core-image-sato-sdk = "ping ssh df connman syslog xorg scp vnc date perl ldd gcc kernelmodule python parselogs ${RPMTESTSUITE}"
 DEFAULT_TEST_SUITES_pn-core-image-lsb-sdk = "ping buildcvs buildiptables buildsudoku connman date df gcc kernelmodule ldd pam parselogs perl python scp ${RPMTESTSUITE} ssh syslog logrotate"
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


