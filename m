Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6BE8978936
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Jan 2018 18:49:08 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id y89so4427769pfk.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Jan 2018 10:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fuccEh1viy2ryRSYXyJ60t+Wj5oJmMwyyf5bSy+Rxkg=;
	b=YXlNdhjx6TCza36oxvY2zUd0PUhRoncMz+KrVua3hrJa6z0J1+SHyLM5Wd9xmC0VZc
	o16TxabTw2d2VgJ6PyrJiURBI1Ou9ReU75+xyg1Q7U8zjg+AXS2AIhGs385VMVaoCf4H
	OoWjxV6/ABZY9BvbV9XfkO56aMfDuUfEfr/hvOukNvdU2tHG7Ku4DCWP7f0oSTAp8x4M
	zcqHCT/WRoZRa2MD/zDxc01Yuprll0NpmgZwoHmD/S264y5uorerW80lpi+SqICHMYxB
	5z2qZ6ZbJoE0+G3W5LQY3JWSSSFr9FN4XKAdsaIhLl/WvjZO1PNL89Tv75BCdcslnLZg
	MUYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fuccEh1viy2ryRSYXyJ60t+Wj5oJmMwyyf5bSy+Rxkg=;
	b=pEo9i3bfiKRDGEZh5vKpPgMw38UPSre/ks4rHEEZP7EVJbrXSrrqxcEi9Kw+i36WhF
	iv/Tu7SjjyAqRWR7rNhRFOyKFuxYtwxFAaaTEnMUwPuOb02o+XA+h/eLQ00x9xnAuqkc
	1tYLKxd4t4mjgZXCoY3qSNFU+MCaoklvmShLMpa6PRA7hhRSGkKQpxbQ5uqE/rHBb4C0
	t6FumatmCxF4j2+bEEEjKF8itvBw+2pLJ0PhLiTQ1ZJDNdcpgAG0D39KTGRLgjvnkqo2
	c7/EYWJ5rv/WJH3X5ECGO05u8Ta/BR1MgxTri6KhFcUw3JqyY14p2e9AMItsezQUAb+5
	xfrg==
X-Gm-Message-State: AKGB3mI58ypDiteuiNFBfBlKsrvRzDCH4XcHGPkwIgeDXBrn2VeP2o8z
	pks+e5PKUdKMQVgTl37VU+A=
X-Google-Smtp-Source: ACJfBotW6dnqLU0qk75AzOXMfjXHisjQRxpLBuAtCgpemi/X7OWs0lFzIESnT/E5HbWrurqieFWp6w==
X-Received: by 10.98.14.154 with SMTP id 26mr8793587pfo.191.1515350950577;
	Sun, 07 Jan 2018 10:49:10 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:d3a:c846:b190:ee80])
	by smtp.gmail.com with ESMTPSA id
	r77sm23618823pfa.78.2018.01.07.10.49.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 07 Jan 2018 10:49:10 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sun,  7 Jan 2018 10:48:59 -0800
Message-Id: <1515350939-18246-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1515350939-18246-1-git-send-email-akuster808@gmail.com>
References: <1515350939-18246-1-git-send-email-akuster808@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [ROCKO][PATCH 2/2] linux-firmware: Bump to bf04291 revision
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
X-List-Received-Date: Sun, 07 Jan 2018 18:49:09 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

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

The following security fixes included too:

CVE-2017-13080 and CVE-2017-13081
- iwlwifi: update firmwares for 3160, 3168, 7265D, 8000C and 8265
- iwlwifi: update firmwares for 3160, 3168, 7260, 7265 and 7265D

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit aea6ce797cc1b1ecc199979eb12aa42de8ff73d4)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 4828b6e..9054b33 100644
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
2.7.4


