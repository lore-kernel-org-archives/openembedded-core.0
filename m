Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 0B0C175F1B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 22:05:42 +0000 (UTC)
Received: by wibud3 with SMTP id ud3so42477131wib.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 15:05:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=SsgJ7pDlMXqqli3Q9LZfHf76IrazX2/7Y20Y2pcQqY8=;
	b=EAdGmTJqMcaTd+uwkrDmNB36CpMWWLwWCCJ8zuASeZxPn4q9WzV1s+Wyq/uD5z+z7a
	hBC+t3ElpSUj1zsS/wOPm2+i0APPliM0aP6QR+vBTBGnOS4wBzx6njjEeRr/llyDUCLj
	W+6AcT5jLxYbeWFKRCC34jBiLFkPuIN8ldoRgwvcOsjLcMHAdGinANrySBRTzebMnlhs
	DQ5MxHCj7zvFttJQZlMiSkbhYHtA6UrMULk39g5kTuEMpZtgp8oVShxnGqeyfxBRjo2y
	L8avr5jsiX69DJiyMaPXsXhWVXt4Tw0Fl3il4EHIi+OvFBn2+gpaICtYtpMms3vzci9i
	16mQ==
X-Gm-Message-State: ALoCoQkOAJ83ro7r5zH/Y14xFE1AGO1Hl8HwiVHlkTRcFKrx5Jx37HlIPZMMWaEQf9wjEyP88U0i
X-Received: by 10.194.60.226 with SMTP id k2mr19303330wjr.10.1437689142794;
	Thu, 23 Jul 2015 15:05:42 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id w8sm9479436wja.15.2015.07.23.15.05.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Jul 2015 15:05:42 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jul 2015 22:59:46 +0100
Message-Id: <1437688790-31620-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/5] oeqa/runtime: remove dmesg test
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
X-List-Received-Date: Thu, 23 Jul 2015 22:05:45 -0000

This has been obsoleted by parselogs.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/runtime/dmesg.py | 12 ------------
 1 file changed, 12 deletions(-)
 delete mode 100644 meta/lib/oeqa/runtime/dmesg.py

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


