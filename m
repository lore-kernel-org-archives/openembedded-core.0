Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id E72F16093E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Oct 2017 16:21:15 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id r64so4996618qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Oct 2017 09:21:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=lyeu3XcLh5jtLJwkqCMntZh5IbdRrSV73ocrvnTciU0=;
	b=rhYB3AiYXMxE5ccrMK5xDrieYyzz+ePxvOWNd5P8iYPdITS+OqTCC8Pxbe3IdidbeN
	yyRK1CJlIubaBKXw83BdglFIuUTmocSd1tmdlg9xOrYizIbr1hWps83iz88F6QoNkXfd
	kPImvqzLRIQK/+rx/XCRcIe39Hg+dnPv8xBhSrh2Rgk2wugHUvIeKO3gs93qfcNZ9Qgx
	nLOF7lKzYAeZMSJBl6nFwmeT5iLO7aydLaF7rYFbUhEpoF6iLqQPxxxR4OnXTMn9IUGI
	Lm7Ff9Oix68Y9T32ou42hN6UxB0nmQPQzlahorRNLAWhNpJjqeh2Ax7YTljtt/6cK2fe
	xtQA==
X-Gm-Message-State: AMCzsaVnDrKQd58ggjHyWPsetH93JEgnudusmJDRUlT7949VrJexwHqI
	fxcEdY2AglIUetUv43MX/T4GXg==
X-Google-Smtp-Source: ABhQp+S+uiN2IPLkEcricPQ1tx+GP+W+u0ZZEfXlWGKJL+Dc3wVrNeP4L0Ap2gLktLQeZ7BTS7+Srg==
X-Received: by 10.55.179.196 with SMTP id c187mr8990117qkf.249.1509034876262; 
	Thu, 26 Oct 2017 09:21:16 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id s9sm3940147qts.42.2017.10.26.09.21.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 26 Oct 2017 09:21:15 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Thu, 26 Oct 2017 14:21:07 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 26 Oct 2017 14:21:06 -0200
Message-Id: <20171026162106.21556-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.3
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] linux-firmware: Bump to bf04291 revision
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
X-List-Received-Date: Thu, 26 Oct 2017 16:21:16 -0000

This includes following changes:

bf04291 WHENCE: Add new qed firmware
d8fc990 WHENCE: Add new radeon firmware
7245319 WHENCE: Fix syntax error for iwlwifi-8265-31.ucode entry
18d71a8 Revert "ath10k: QCA988X hw2.0: update firmware to 10.2.4.70.63-2"
4ebfab3 ath10k: QCA6174 hw3.0: update board-2.bin
96a7402 ath10k: QCA6174 hw3.0: update firmware-6.bin to WLAN.RM.4.4.1-00051-QCARMSWP-1
59bf7e2 cxgb4: update firmware to revision 1.16.63.0

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 0338ba8ac2..3ea1d883b1 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -116,7 +116,7 @@ LIC_FILES_CHKSUM = "\
     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-    file://WHENCE;md5=08f6d4371353cac5f6fc271d5407c63e \
+    file://WHENCE;md5=038edbc9e744171d8b6235e0224028ba \
 "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -178,7 +178,7 @@ NO_GENERIC_LICENSE[Firmware-xc5000] = "LICENCE.xc5000"
 NO_GENERIC_LICENSE[Firmware-xc5000c] = "LICENCE.xc5000c"
 NO_GENERIC_LICENSE[WHENCE] = "WHENCE"
 
-SRCREV = "a61ac5cf8374edbfe692d12f805a1b194f7fead2"
+SRCREV = "bf04291309d3169c0ad3b8db52564235bbd08e30"
 PE = "1"
 PV = "0.0+git${SRCPV}"
 
-- 
2.14.3


