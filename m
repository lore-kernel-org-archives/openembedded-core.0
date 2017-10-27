Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1001660720
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Oct 2017 13:28:22 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id h4so8387469qtk.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Oct 2017 06:28:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=S0Qq9vg0lEdBMbOq410TUyl7if7opxqcwjTjkgSSbWU=;
	b=fyzrIPyI+JYUZ/lujfxAWlS+d79aEtPRCRCXUQjhqcGnsrkIKrnW+nG188g/aezUhB
	n8d4MGGTTOMYiF0E86yj6XEA+4iNgyMEAlONeU3uJWbKA8XmXZJUXSRp35+NNbqkKSPa
	ScnkD++4S1rXt/bWEdZ+6tnu+Kwkh4GDCnJd6Ok564E0XGARbem3VFz3+MT2puy6t2B6
	Ko7Pc3LXzcFDrpMuz1d58g8+TRgvMrsd251aA+sxso/ab8wCoCMeo4OHkeVhBiNnPOaG
	PtmSJrwnr964iMIzH5j2O+59EGstUOirrrgBJnfKQW4VHo0seRhZpzYoCNuozLq4etIj
	CPzQ==
X-Gm-Message-State: AMCzsaWtO8AvNPCc9cywx7N6l7D+J9HBNllDv0ciWgqVh7Qoj12dXaEG
	gNZtoYD8Xy5suoS9RKyokgep/A==
X-Google-Smtp-Source: ABhQp+TdtSCHmw4ySzXBFd4pGYYzPWKd0mamRRIFfF4Jp1ddqie6GFyknSjxb1UWt+A/ukIdLyHe5A==
X-Received: by 10.200.38.50 with SMTP id u47mr822905qtu.112.1509110903759;
	Fri, 27 Oct 2017 06:28:23 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id t5sm4997417qkl.10.2017.10.27.06.28.20
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 27 Oct 2017 06:28:22 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 27 Oct 2017 11:28:15 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Oct 2017 11:28:14 -0200
Message-Id: <20171027132814.27320-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.3
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2] linux-firmware: Bump to bf04291 revision
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
X-List-Received-Date: Fri, 27 Oct 2017 13:28:23 -0000

This includes following changes:

bf04291 WHENCE: Add new qed firmware
d8fc990 WHENCE: Add new radeon firmware
7245319 WHENCE: Fix syntax error for iwlwifi-8265-31.ucode entry
18d71a8 Revert "ath10k: QCA988X hw2.0: update firmware to 10.2.4.70.63-2"
4ebfab3 ath10k: QCA6174 hw3.0: update board-2.bin
96a7402 ath10k: QCA6174 hw3.0: update firmware-6.bin to WLAN.RM.4.4.1-00051-QCARMSWP-1
59bf7e2 cxgb4: update firmware to revision 1.16.63.0

The MD5 checksum of WHENCE license file was due the changes above as
the firmware versions are listed there. It had no license term
changes.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2:
- add a note about checksum change of WHENCE file.

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


