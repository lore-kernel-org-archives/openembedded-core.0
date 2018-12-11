Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id C52CA6BCF1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 23:26:39 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id m1so3324998wml.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 15:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=RaTQVvQubsX5LEiJ3SO6Rx6egUBHzVDtYBxtS8GfyOE=;
	b=qOTNeMRCW/TpipJVrt//jJNAedImXO5KBGkaZJZ7D7yBMVTltefN6jrmStVcDJV4P9
	Ucn9w9DTbzc5W9/FugGLb0JkIbs/UFcXH3/q6u5sWwSAwf4RZL440S+BeWDbVl/1FqVR
	IL9O/F16fUOL22T7CPP3dh6GsRbvXwxLGSjyO0IRypd3VB9To0IJv7N+EqarvWPGKRND
	wk0tHBTb8QQ5fW6TbPffSiljHC5v1rOQOh6W32aomNO8isyRYcgob1kFwwSErpvO42GG
	70s4447UxiOfbjX2xHKLI0WmVL6Z6jrTAlSiTjGccLCw48nVF8kLNqXrBi+qZ1Ua9Sj4
	YJuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=RaTQVvQubsX5LEiJ3SO6Rx6egUBHzVDtYBxtS8GfyOE=;
	b=jNh4sUaBwWYGj5gsAPkKVCXJ+OnQaCZEH+SssVozyhxu+ZNB8YxgyEeqSGmTuGH6SW
	gjN2V0CT+IUO+TJTh/T35V62t1IwVvcm5IXK2QobblPeGUafa+HQBnFC7w4RtV2aLYDH
	Up5x2KcmtpsjSardD3pdcUKQd/YohSKTP/KKS2b82T5h+Zc0Loq1UhcKnhFt8s347JKZ
	Se7/8fSB+nJgHPqPr0YJcyteWp3bFeSJW6yA5wUvb16RIv40SCa/+r+ttBcZkmnE5GRY
	pNBnwxG8tJxjrqMQ4GFvFNYFdoIvXCDP1/XGx9r6WDBaM67+2W6AdNSqsCSxuzzNDIgU
	f7IQ==
X-Gm-Message-State: AA+aEWbAnEQkeF1PUQKcT6K7r0EscUD6Vk7yiwG4z1S4G8g1WCBBBEXp
	fOHFB5zSbYHU/utMvMhQJDIupescXx0=
X-Google-Smtp-Source: AFSGD/Wjj6YKaq1Ionk6TXg/12tRgcB/ynLssuE8MXwuTmwXjO5rMBNpLcZ5e/9nfEOKODoao7ZmrA==
X-Received: by 2002:a1c:ab87:: with SMTP id u129mr4149340wme.104.1544570799780;
	Tue, 11 Dec 2018 15:26:39 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	v19sm30194595wrd.46.2018.12.11.15.26.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Dec 2018 15:26:38 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Dec 2018 23:26:32 +0000
Message-Id: <20181211232636.13113-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH V2 1/5] oeqa/sdk: clarify ELF assertion message
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
X-List-Received-Date: Tue, 11 Dec 2018 23:26:40 -0000

For example, instead of saying "3 != 62", say "Binary was x86-64 but expected
i586".

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


