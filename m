Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
	[209.85.222.170])
	by mail.openembedded.org (Postfix) with ESMTP id 70D777CB90
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Mar 2019 21:22:55 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id g1so2176154qki.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Mar 2019 14:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version:organization
	:content-transfer-encoding;
	bh=5QslCSxA0qNYN8k2Hl+1z0e40+pE8I4gRtPXiHDzYJY=;
	b=1CicyzcRBclOJg/Q6UckisPK5ue9wasVA6Mq+BrBGKY7yCCsezHkeEYcsdICUDmJxk
	nR4h+ho9B5boOz+wq1pRcTyookh84u/m6x29g93NKOqaJd3p4VcvojO1cVK9UxkNGUza
	sNUGnuqkt4zMS+dzP2tRPe/QN4Md3CsoBxP5IGmte5BaZXMiBNJcC93HZQoDo8DzxABJ
	XRRHHBh4CV4RcwxUfaZ5v0qJXtfkU7icDZ2dgjXYO/l+VSG0KeCNlVPMhDb4OAeLG5Nh
	jrTrTG0lMHiflAMG6gNlSIFG1PHOWtnQXWIoegV1mEKnSEiVZ60cfyKGEpCH3AWCXcvV
	DTCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=5QslCSxA0qNYN8k2Hl+1z0e40+pE8I4gRtPXiHDzYJY=;
	b=jnuB71YKYKzctAI9gUw/2RpbzI+LIS+XEFEa9xqTGbZGiVPh+H5jqWkzSHxCFoBBxc
	bX1fVDhFTeCDrMN0asGk6kQl+IOHoYpVyzNGdrV++CcbAP+RbDmSztYPQirgupvi7gnA
	ahvS79OACwr7IQ6TDxuqpmaDjHrqw5o14E4gTir22J3kZpvMolULriFEsn+uHjBcK1p3
	FvEkgisiJcJ5UUSMZ+h2wlpoOT0haBX9Ot5OCw70bQouAVdN4LMnRG5ZaqMpTmfAXt1c
	8tanHPFPSqh+F85+eiQggE9S7ROyORWo9cAzeJji9JqTqbmmACz+rCDMg9MfDUSGUJi+
	5Iyg==
X-Gm-Message-State: APjAAAXGNDOuhPcHu4AHGKb+1hGteaHEOu68WwSvaX7ZnAyJXSQOJP9k
	XiZLWMD8hLdB/kHbouQiai+pTXl5fSLkQw==
X-Google-Smtp-Source: APXvYqweyEfxdk1sB/DU1g9UzvGZSr9ahlJoVQ+WDh5tB7lFBNMdi7LYuD5birEvGHXXxMRr1K+QjQ==
X-Received: by 2002:a37:c6d0:: with SMTP id s77mr4613652qkl.116.1552684976243; 
	Fri, 15 Mar 2019 14:22:56 -0700 (PDT)
Received: from centrium.lab.ossystems ([177.194.204.148])
	by smtp.gmail.com with ESMTPSA id
	t184sm1776396qkh.35.2019.03.15.14.22.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Mar 2019 14:22:55 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Mar 2019 18:22:45 -0300
Message-Id: <20190315212245.28375-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [PATCH] linux-firmware: Bump revision to 7bc2464
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
X-List-Received-Date: Fri, 15 Mar 2019 21:22:55 -0000
Content-Transfer-Encoding: 8bit

License-Update:
      - WHENCE: New firmware files additions and version updates
                Add qca/nvm_00440302.bin and qca/rampatch_00440302.bin

This commit includes the following changes:

    - 7bc2464 Merge branch 'for-upstream' of git://git.chelsio.net/pub/git/linux-firmware
    - 283373f cxgb4: update firmware to revision 1.23.3.0
    - efd2c1c linux-firmware: Update firmware file for Intel Bluetooth 8265
    - 046d108 linux-firmware: Update firmware file for Intel Bluetooth 9260
    - 1f5641c linux-firmware: Update firmware file for Intel Bluetooth 9560
    - b0d9583 (tag: 20190312) drm/amdgpu: update picasso to latest from 18.50 branch
    - 4041a80 drm/amdgpu: update polaris12 to latest from 18.50 branch
    - 4b04ce5 drm/amdgpu: update vega20 to latest from 18.50 branch
    - f85841b rtw88: RTL8822C: update rtw8822c_fw.bin to v5.0
    - 3531f69 Merge https://github.com/bgodavar/qca6174_bt_fw
    - 9936d81 Merge git://git.marvell.com/mwifiex-firmware
    - 052a246 Merge commit '450632bb7822f0be09474066f4fee2147acbd055' of
      https://github.com/Netronome/linux-firmware
    - 04e7764 rtl_bt: Update firmware for BT part of RTL8822C
    - 78d2b16 linux-firmware: update Marvell 8787/8801/8887 firmware images
    - 1a5773c linux-firmware: update Marvell 8897/8997 firmware images
    - 450632b nfp: update Agilio SmartNIC firmware to rev 2.1.16.1
    - c99beda QCA: Add the fw files for BT Chip QCA6174.
    - 9ee52be linux-firmware: Add AMD SEV firmware
    - 54b0a74 WHENCE: Correct errant entries
    - fe0a7d4 Merge https://github.com/bgodavar/qca_bt_wcn3990_fw
    - 07cb4ff amdgpu: update raven2 rlc firmware
    - 64302ea amdgpu: drop raven2_sdma1.bin
    - 30b9314 linux-firmware: Update firmware file for Intel Bluetooth,9560
    - 55fa1fb linux-firmware: Update firmware file for Intel Bluetooth,9260
    - f859d9f qca: Add firmware files for BT chip wcn3990.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index fdf8f19490..ad7babf7aa 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -122,7 +122,7 @@ LIC_FILES_CHKSUM = "\
     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-    file://WHENCE;md5=66abf0fb69b09d6f3d2db6088594c808 \
+    file://WHENCE;md5=ef36d3383becd18f36ce32d84109386f \
 "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -188,7 +188,7 @@ NO_GENERIC_LICENSE[Firmware-xc5000] = "LICENCE.xc5000"
 NO_GENERIC_LICENSE[Firmware-xc5000c] = "LICENCE.xc5000c"
 NO_GENERIC_LICENSE[WHENCE] = "WHENCE"
 
-SRCREV = "710963fe53ee3f227556d36839df3858daf6e232"
+SRCREV = "7bc246451318b3536d9bfd3c4e46d541a9831b33"
 PE = "1"
 PV = "0.0+git${SRCPV}"
 
-- 
2.20.1


