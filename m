Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id D2CCD6B067
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 18:20:30 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id q26so3291618wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 10:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=AI98P4EDw7WQhF29NQgvmHWrRyrqcjJlBFTkTXZ1eQI=;
	b=0xOyHPhc5DbbDA8z0Vds6DG3KvMp5kTdCmpUwuFwf75jXp1Tl49huA49IKm/fy+dq7
	BAD2NVGu1xc4+ZaQe2UVTSkUc6fjwBZ06XgxNeen6bI2uqDx37DFb0upUAIsSnqH1FBK
	jNqJzTGmncSDcSd7s39K98+JvQmG1hgSci8Rhb7TDOLP3ALQMFJMJAo9dxcQypZQr0RJ
	7RbuWbzvo7fIBcAcDL6x+c2kd21Mdwv4ZtA9B4mL2HB+L63pszWKc6cPUwjwDndoNq+T
	XP45j00FBTXzHjlNFkSmikFPCj4/hulO9pkWTE3v10doCGNEZclTa77HRG8IJq5Sk9k3
	VHRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=AI98P4EDw7WQhF29NQgvmHWrRyrqcjJlBFTkTXZ1eQI=;
	b=XatwT+B5zNvoPk/hyv3jUOLmV+1tgthyw+tJTFQ8a0PCjM9HvRHo39Tfw2LG4iR/Qi
	g0GNeWbaczWcKI5CPPsvI6UNjYk55+ybc98JOed1Q26At0CAPkKVDHf8v6sFy/n/14OZ
	TnsqTutBoqdPC+PkLnAKUd4MMgNw3WbY/7iDwNS9hG/w43bjm0jykw0tl4Qfj5g7KAYB
	zr3qqMlmuzgbean2hOfHdIsVJBEtgvg+yxdm+w+d1/xGuXpglHezEh2bXAKyIHMUdjIT
	+KtSe6UPuvELXZiQM14zZpSID8yFhu0dq1/Dtv6bYmHg2NJn8A8qpAEpXfuYvAt2k0jV
	3Qug==
X-Gm-Message-State: AA+aEWYaeRBDnInjCQHgj/M+FAmroIK+6j7l65PBtz9zpiBcCCNFwTED
	KBrMK0oo1qkeLXniyGockKxq8ujjstU=
X-Google-Smtp-Source: AFSGD/Vc6F1FUm/k3j2SRqzpNeAWm91bgapzgysHTISMykl5+cWcbbIWPC722gdHS9kXErHcnXqa+A==
X-Received: by 2002:a7b:c7c2:: with SMTP id z2mr3228558wmk.47.1544552431152;
	Tue, 11 Dec 2018 10:20:31 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	b18sm16253616wrw.83.2018.12.11.10.20.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Dec 2018 10:20:30 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Dec 2018 18:20:21 +0000
Message-Id: <20181211182025.20381-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/5] oeqa/sdk: clarify ELF assertion message
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
X-List-Received-Date: Tue, 11 Dec 2018 18:20:31 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/sdk/case.py | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/sdk/case.py b/meta/lib/oeqa/sdk/case.py
index ea15d6a107e..d8611c8b308 100644
--- a/meta/lib/oeqa/sdk/case.py
+++ b/meta/lib/oeqa/sdk/case.py
@@ -1,6 +1,7 @@
 # Copyright (C) 2016 Intel Corporation
 # Released under the MIT license (see COPYING.MIT)
 
+import os
 import subprocess
 
 from oeqa.core.case import OETestCase
@@ -26,11 +27,13 @@ class OESDKTestCase(OETestCase):
         return tarball
 
     def check_elf(self, path, target_os=None, target_arch=None):
+        """
+        Verify that the ELF binary $path matches the specified target
+        OS/architecture, or if not specified the currently configured MACHINE's
+        OS/architecture.
+        """
         import oe.qa, oe.elf
 
-        elf = oe.qa.ELFFile(path)
-        elf.open()
-
         if not target_os or not target_arch:
             output = self._run("echo $OECORE_TARGET_OS:$OECORE_TARGET_ARCH")
             target_os, target_arch = output.strip().split(":")
@@ -38,7 +41,11 @@ class OESDKTestCase(OETestCase):
         machine_data = oe.elf.machine_dict(None)[target_os][target_arch]
         (machine, osabi, abiversion, endian, bits) = machine_data
 
-        self.assertEqual(machine, elf.machine())
+        elf = oe.qa.ELFFile(path)
+        elf.open()
+
+        self.assertEqual(machine, elf.machine(),
+                         "Binary was %s but expected %s" %
+                         (oe.qa.elf_machine_to_string(elf.machine()), oe.qa.elf_machine_to_string(machine)))
         self.assertEqual(bits, elf.abiSize())
         self.assertEqual(endian, elf.isLittleEndian())
-
-- 
2.11.0


