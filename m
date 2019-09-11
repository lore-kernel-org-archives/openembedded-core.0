Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
	[209.85.167.50])
	by mail.openembedded.org (Postfix) with ESMTP id 95EC87E684
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 09:30:03 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id t8so15843483lfc.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 02:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6iyIjeaweSQzEySWkcauJEutzruNxGWR4M6rT1OF4dM=;
	b=iayA/VeB6q8rI7oWMo3FGLsd+MniLCcDFC1A6gJjrheagHK5KfoFsbQAVX0CY6unfP
	/aRJnubU/yXJ69BpxWboMDKpSDTaV+G0qwD8cOGq/BJTt2kUdbnRn42NX1P2dGlu9jgg
	vNqwC6N95pAxPzntOE4XiOkKFgE7tni8zzk0+PPqafs+Xm/s+xpC3kDLqEf2TW5GqyQc
	k4O6qGGRJk+kWogYLUU5TfsPXSbpVMePmhHlUVPjMjEh4bxSUAuDxM2QGF20cCOTyXrp
	R+z2hBDVWUoqOf9CMQ4MHL+ERq2ZVsbmim7upsr1ViUr2hoKvOSr4DwjmsVHRMEQAbIR
	R0NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6iyIjeaweSQzEySWkcauJEutzruNxGWR4M6rT1OF4dM=;
	b=hbjzEZFjULi9CxHPtC0/TqLnLn/5XopYAePfquYn/CZehw2dvSU/dG+V1bCY4/Axf/
	v4t97iA4Q1b4RlVrNZp3Yt0TFkQw7Nx5vL3NSI0fK4PlFysd1VCF36BtzxH+mwDr0pSM
	SmVLPaP/lIQR7CgmAvmdd9LAWwraeafDqgDBWTo9xWGZkrkHCzabIwvB4tVBDDPiCnW2
	LYbcrzXz453pFAyjMPLvmS/ZrmT098MWSaXvyxbmivpe43nngo5UEwlPxaZzjUdAmDWm
	NxyFt55vQeBwVY1RZREoS1Ta6G+/ijljkbsY2rvKG6P+/qAUM5pFOOOf/MXP/vyyhZ2S
	dD3A==
X-Gm-Message-State: APjAAAWEv2MrsDc9SCQANG/8E3K3rKHQTeHKnDyjr1xf8KgJh+EZmrdj
	25d8mAsPOYu2IZ/bXLmsGIMnOmtA
X-Google-Smtp-Source: APXvYqysXeoL+J0COnqb7BeikYBMU5PM7y3nQXyrVZa/u7/Rv75VY6hDbFU7HrxgiDbjm1ZcQ9ZA+Q==
X-Received: by 2002:a19:e204:: with SMTP id z4mr23502557lfg.157.1568194203589; 
	Wed, 11 Sep 2019 02:30:03 -0700 (PDT)
Received: from localhost.localdomain ([94.25.229.24])
	by smtp.gmail.com with ESMTPSA id
	t1sm4509306lji.101.2019.09.11.02.30.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Sep 2019 02:30:02 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Sep 2019 12:29:53 +0300
Message-Id: <20190911093001.7849-1-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH 1/9] uefi.bbclass: add bbclass holding configuration for UEFI applications
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
X-List-Received-Date: Wed, 11 Sep 2019 09:30:04 -0000
Content-Transfer-Encoding: 8bit

From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>

Create new bbclass defining common variables for all UEFI-related
packages (bootloaders, test applications, etc).

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
---
 meta/classes/uefi.bbclass | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta/classes/uefi.bbclass

diff --git a/meta/classes/uefi.bbclass b/meta/classes/uefi.bbclass
new file mode 100644
index 000000000000..d3fc4b686676
--- /dev/null
+++ b/meta/classes/uefi.bbclass
@@ -0,0 +1,26 @@
+# Location of EFI files inside EFI System Partition
+EFIDIR ?= "/EFI/BOOT"
+
+# Prefix where ESP is mounted inside rootfs. Set to empty if package is going
+# to be installed to ESP directly
+EFI_PREFIX ?= "/boot"
+
+# Location inside rootfs.
+EFI_FILES_PATH = "${EFI_PREFIX}${EFIDIR}"
+
+# Determine name of bootloader image
+python __anonymous () {
+    import re
+    target = d.getVar('TARGET_ARCH')
+    if target == "x86_64":
+        image = "bootx64.efi"
+    elif re.match('i.86', target):
+        image = "bootia32.efi"
+    elif re.match('aarch64', target):
+        image = "bootaa64.efi"
+    elif re.match('arm', target):
+        image = "bootarm.efi"
+    else:
+        image = "bootUNKNOWN.efi"
+    d.setVar("EFI_BOOT_IMAGE", image)
+}
-- 
2.23.0


