Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B528FC5473E
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:18 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.1317.1721071148787787950
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=M6eKyxVq;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=TAMb2/DV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010190b7d59c32-8b231dee-fd63-4a20-902e-f257c5a66205-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071148;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aXlQEdG6VmUt/lRMcurzybFs8s8J4ZzZNo8PQZu0C8g=;
	b=M6eKyxVqU1yEr8yfQPis+LP0Skb8JVg5+4o/cYdUs+7u5sQaZ0RD97hVWzGjWJ8U
	Uvttq5UbVWUYGjzAF9RYz5FYfyojiDhiCW/hdFLgPjsnwxND9kmrK6huJe1Mv2Ddvo7
	Iw72Xd3Ygtekl+vNdTlVAio1tgaIIfTL7TkNcYJg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071148;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aXlQEdG6VmUt/lRMcurzybFs8s8J4ZzZNo8PQZu0C8g=;
	b=TAMb2/DVQxIHdtEhjDMCcWKGvon9If3u1ca25usdKNdGLE8pKyrtgxk0veUok4ld
	8i+xEPyksn5aYWirr9GtSlHt0Uv1LsVL/izZ4uq+zBQOp/sBBXzNVHR4zmHzYo6VSvG
	LTzBJ0pO6D/P/DFh1u5oxBLslc/z/pkCSkg4JtTc=
Content-Type: multipart/mixed; boundary="===============5724069972648811668=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] linux-firmware: upgrading to 20240709 SUCCEEDED
Message-ID: <01010190b7d59c32-8b231dee-fd63-4a20-902e-f257c5a66205-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202038

--===============5724069972648811668==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *linux-firmware* to *20240709* has Succeeded.

Next steps:
    - apply the patch: git am 0001-linux-firmware-upgrade-20240513-20240709.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 92378d289bece8f3edead2ea8ff5cbd94d80edad Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jul 2024 15:53:14 +0000
Subject: [PATCH] linux-firmware: upgrade 20240513 -> 20240709

---
 ...20240513.bb => linux-firmware_20240709.bb} | 355 +++++++++++++++++-
 1 file changed, 352 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20240513.bb => linux-firmware_20240709.bb} (86%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20240513.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20240709.bb
similarity index 86%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20240513.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20240709.bb
index 4a87105d98..5d3bc96034 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20240513.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20240709.bb
@@ -1,3 +1,352 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENCE.ti-connectivity
+# +++ LICENCE.ti-connectivity
+# @@ -1,4 +1,4 @@
+# -Copyright (c) 2016 Texas Instruments Incorporated
+# +Copyright (c) 2016-2024 Texas Instruments Incorporated
+#  
+#  All rights reserved not granted herein.
+#  
+# --- WHENCE
+# +++ WHENCE
+# @@ -1017,25 +1017,25 @@
+#  Version: 74.a5e9588b.0
+#  
+#  File: iwlwifi-cc-a0-77.ucode
+# -Version: 74.a20fb07d.0
+# +Version: 74.c360c4b1.0
+#  
+#  File: iwlwifi-Qu-b0-hr-b0-77.ucode
+# -Version: 74.a20fb07d.0
+# +Version: 74.c360c4b1.0
+#  
+#  File: iwlwifi-Qu-b0-jf-b0-77.ucode
+# -Version: 74.a20fb07d.0
+# +Version: 74.c360c4b1.0
+#  
+#  File: iwlwifi-Qu-c0-hr-b0-77.ucode
+# -Version: 74.a20fb07d.0
+# +Version: 74.c360c4b1.0
+#  
+#  File: iwlwifi-Qu-c0-jf-b0-77.ucode
+# -Version: 74.a20fb07d.0
+# +Version: 74.c360c4b1.0
+#  
+#  File: iwlwifi-QuZ-a0-hr-b0-77.ucode
+# -Version: 74.a20fb07d.0
+# +Version: 74.c360c4b1.0
+#  
+#  File: iwlwifi-QuZ-a0-jf-b0-77.ucode
+# -Version: 74.206b0184.0
+# +Version: 74.c360c4b1.0
+#  
+#  File: iwlwifi-ty-a0-gf-a0-77.ucode
+#  Version: 74.f92b5fed.0
+# @@ -1059,7 +1059,7 @@
+#  Version: 83.fb5c9aeb.0
+#  
+#  File: iwlwifi-ty-a0-gf-a0-89.ucode
+# -Version: 87.e9cec78e.0
+# +Version: 87.202a2f7b.0
+#  
+#  File: iwlwifi-so-a0-gf4-a0-77.ucode
+#  Version: 74.f92b5fed.0
+# @@ -1083,7 +1083,7 @@
+#  Version: 83.fb5c9aeb.0
+#  
+#  File: iwlwifi-so-a0-gf4-a0-89.ucode
+# -Version: 87.e9cec78e.0
+# +Version: 87.202a2f7b.0
+#  
+#  File: iwlwifi-so-a0-gf-a0-77.ucode
+#  Version: 74.f92b5fed.0
+# @@ -1107,7 +1107,7 @@
+#  Version: 83.fb5c9aeb.0
+#  
+#  File: iwlwifi-so-a0-gf-a0-89.ucode
+# -Version: 87.e9cec78e.0
+# +Version: 87.202a2f7b.0
+#  
+#  File: iwlwifi-so-a0-hr-b0-77.ucode
+#  Version: 74.f92b5fed.0
+# @@ -1128,7 +1128,7 @@
+#  Version: 83.fb5c9aeb.0
+#  
+#  File: iwlwifi-so-a0-hr-b0-89.ucode
+# -Version: 87.e9cec78e.0
+# +Version: 87.202a2f7b.0
+#  
+#  File: iwlwifi-so-a0-jf-b0-77.ucode
+#  Version: 74.f92b5fed.0
+# @@ -1153,7 +1153,7 @@
+#  Version: 83.fb5c9aeb.0
+#  
+#  File: iwlwifi-ma-b0-gf-a0-89.ucode
+# -Version: 87.e9cec78e.0
+# +Version: 87.202a2f7b.0
+#  
+#  File: iwlwifi-ma-b0-gf-a0.pnvm
+#  
+# @@ -1164,7 +1164,7 @@
+#  Version: 83.fb5c9aeb.0
+#  
+#  File: iwlwifi-ma-b0-gf4-a0-89.ucode
+# -Version: 87.e9cec78e.0
+# +Version: 87.202a2f7b.0
+#  
+#  File: iwlwifi-ma-b0-gf4-a0.pnvm
+#  
+# @@ -1173,6 +1173,9 @@
+#  
+#  File: iwlwifi-ma-b0-hr-b0-86.ucode
+#  Version: 83.fb5c9aeb.0
+# +
+# +File: iwlwifi-ma-b0-hr-b0-89.ucode
+# +Version: 83.202a2f7b.0
+#  
+#  Licence: Redistributable. See LICENCE.iwlwifi_firmware for details
+#  
+# @@ -2577,12 +2580,20 @@
+#  File: amdgpu/gc_11_5_0_mes_2.bin
+#  File: amdgpu/gc_11_5_0_pfp.bin
+#  File: amdgpu/gc_11_5_0_rlc.bin
+# +File: amdgpu/gc_11_5_1_imu.bin
+# +File: amdgpu/gc_11_5_1_me.bin
+# +File: amdgpu/gc_11_5_1_mec.bin
+# +File: amdgpu/gc_11_5_1_mes1.bin
+# +File: amdgpu/gc_11_5_1_mes_2.bin
+# +File: amdgpu/gc_11_5_1_pfp.bin
+# +File: amdgpu/gc_11_5_1_rlc.bin
+#  File: amdgpu/dcn_3_1_4_dmcub.bin
+#  File: amdgpu/dcn_3_1_5_dmcub.bin
+#  File: amdgpu/dcn_3_1_6_dmcub.bin
+#  File: amdgpu/dcn_3_2_0_dmcub.bin
+#  File: amdgpu/dcn_3_2_1_dmcub.bin
+#  File: amdgpu/dcn_3_5_dmcub.bin
+# +File: amdgpu/dcn_3_5_1_dmcub.bin
+#  File: amdgpu/psp_13_0_0_sos.bin
+#  File: amdgpu/psp_13_0_0_ta.bin
+#  File: amdgpu/psp_13_0_4_ta.bin
+# @@ -2603,6 +2614,8 @@
+#  File: amdgpu/psp_13_0_11_toc.bin
+#  File: amdgpu/psp_14_0_0_ta.bin
+#  File: amdgpu/psp_14_0_0_toc.bin
+# +File: amdgpu/psp_14_0_1_ta.bin
+# +File: amdgpu/psp_14_0_1_toc.bin
+#  File: amdgpu/sdma_4_4_2.bin
+#  File: amdgpu/sdma_5_2_6.bin
+#  File: amdgpu/sdma_5_2_7.bin
+# @@ -2611,6 +2624,7 @@
+#  File: amdgpu/sdma_6_0_2.bin
+#  File: amdgpu/sdma_6_0_3.bin
+#  File: amdgpu/sdma_6_1_0.bin
+# +File: amdgpu/sdma_6_1_1.bin
+#  File: amdgpu/smu_13_0_0.bin
+#  File: amdgpu/smu_13_0_6.bin
+#  File: amdgpu/smu_13_0_7.bin
+# @@ -2622,7 +2636,10 @@
+#  File: amdgpu/vcn_4_0_3.bin
+#  File: amdgpu/vcn_4_0_4.bin
+#  File: amdgpu/vcn_4_0_5.bin
+# +File: amdgpu/vcn_4_0_6.bin
+# +File: amdgpu/vcn_4_0_6_1.bin
+#  File: amdgpu/vpe_6_1_0.bin
+# +File: amdgpu/vpe_6_1_1.bin
+#  
+#  Licence: Redistributable. See LICENSE.amdgpu for details.
+#  
+# @@ -3064,6 +3081,30 @@
+#  
+#  --------------------------------------------------------------------------
+#  
+# +Driver: cc33xx - Texas Instruments 802.11 WLAN driver for CC33xx chips
+# +
+# +File: ti-connectivity/cc33xx_2nd_loader.bin
+# +Version: 1.0.0.23
+# +File: ti-connectivity/cc33xx_fw.bin
+# +Version: 1.7.0.120
+# +File: ti-connectivity/cc33xx-conf.bin
+# +Version: 1.7.0.120
+# +
+# +Licence: Redistributable. See LICENCE.ti-connectivity for details.
+# +
+# +The cc33xx-conf.bin is a binary containing two parts: radio calibration
+# +and hardware configuration. The binary can be modified using the tool
+# +cc33conf which can be found in the CC33XX Linux SDK here: 
+# +
+# +https://www.ti.com/tool/CC33XX-SOFTWARE 
+# +
+# +The driver expects to find the firmwares under a ti-connectivity
+# +subdirectory.  So if your system looks for firmwares in /lib/firmware,
+# +the firmwares for cc33xx chips must be located in
+# +/lib/firmware/ti-connectivity/.
+# +
+# +--------------------------------------------------------------------------
+# +
+#  Driver: TI_ST - Texas Instruments bluetooth driver
+#  
+#  File: ti-connectivity/TIInit_6.2.31.bts
+# @@ -3226,6 +3267,7 @@
+#  Driver: rtw88 - Realtek 802.11ac WLAN driver for RTL8822BE and RTL8822CE
+#  
+#  Info: Sent to Larry Finger by Realtek engineer Yan-Hsuan Chuang <yhchuang@realtek.com>
+# +File: rtw88/rtw8821a_fw.bin
+#  File: rtw88/rtw8822b_fw.bin
+#  File: rtw88/rtw8822c_fw.bin
+#  File: rtw88/rtw8822c_wow_fw.bin
+# @@ -3883,14 +3925,17 @@
+#  Version: BT_WindStormPeak_REL1299
+#  File: intel/ibt-12-16.sfi
+#  Version: BT_WindStormPeak_REL1299
+# +
+#  File: intel/ibt-17-16-1.sfi
+# -Version: BT_JeffersonPeak_B0_B0_REL20397
+#  File: intel/ibt-17-16-1.ddc
+# -Version: BT_JeffersonPeak_B0_B0_REL20397
+#  File: intel/ibt-17-2.sfi
+# -Version: BT_JeffersonPeak_B0_B0_REL20397
+#  File: intel/ibt-17-2.ddc
+# -Version: BT_JeffersonPeak_B0_B0_REL20397
+# +File: intel/ibt-18-16-1.sfi
+# +File: intel/ibt-18-16-1.ddc
+# +File: intel/ibt-18-2.sfi
+# +File: intel/ibt-18-2.ddc
+# +Version: BT_Pulsar_REL20425_22.20.2412.20425
+# +
+#  File: intel/ibt-17-0-1.sfi
+#  Version: BT_JeffersonPeak_A0_B0_REL0201
+#  File: intel/ibt-17-0-1.ddc
+# @@ -3899,14 +3944,7 @@
+#  Version: BT_JeffersonPeak_A0_B0_REL0201
+#  File: intel/ibt-17-1.ddc
+#  Version: BT_JeffersonPeak_A0_B0_REL0201
+# -File: intel/ibt-18-16-1.sfi
+# -Version: BT_ThunderPeak_B0_B0_REL20397
+# -File: intel/ibt-18-16-1.ddc
+# -Version: BT_ThunderPeak_B0_B0_REL20397
+# -File: intel/ibt-18-2.sfi
+# -Version: BT_ThunderPeak_B0_B0_REL20397
+# -File: intel/ibt-18-2.ddc
+# -Version: BT_ThunderPeak_B0_B0_REL20397
+# +
+#  File: intel/ibt-18-0-1.sfi
+#  Version: BT_ThunderPeak_A0_B0_REL0201
+#  File: intel/ibt-18-0-1.ddc
+# @@ -3982,7 +4020,7 @@
+#  File: intel/ibt-0040-1050.ddc
+#  File: intel/ibt-1040-1050.sfi
+#  File: intel/ibt-1040-1050.ddc
+# -Version: BT_Solar_REL81454_23.50.24144.81454
+# +Version: BT_Solar_REL81528_23.50.24183.81528
+#  
+#  File: intel/ibt-0040-1020.sfi
+#  File: intel/ibt-0040-1020.ddc
+# @@ -3996,7 +4034,7 @@
+#  
+#  File: intel/ibt-0291-0291.sfi
+#  File: intel/ibt-0291-0291.ddc
+# -Version: BT_BlazarU_S_REL56888_23.50.24144.56888
+# +Version: BT_BlazarU_S_REL58211_23.60.24183.58211
+#  
+#  File: intel/ibt-0180-0041.sfi
+#  File: intel/ibt-0180-0041.ddc
+# @@ -4004,7 +4042,7 @@
+#  File: intel/ibt-0180-4150.ddc
+#  File: intel/ibt-0180-1050.sfi
+#  File: intel/ibt-0180-1050.ddc
+# -Version: BT_Magnetar_REL103171_23.50.24144.103171
+# +Version: BT_Magnetar_REL103243_23.50.24183.103243
+#  
+#  Licence: Redistributable. See LICENCE.ibt_firmware for details
+#  
+# @@ -6948,6 +6986,22 @@
+#  File: cirrus/cs35l41-dsp1-spk-prot-17aa3865-r0.bin
+#  File: cirrus/cs35l41-dsp1-spk-prot-17aa3866-l0.bin
+#  File: cirrus/cs35l41-dsp1-spk-prot-17aa3866-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-17aa38c7.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-17aa38c8.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-17aa38f9.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-17aa38fa.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +File: cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-l1.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-r1.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-l1.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-r1.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-17aa38fa-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-17aa38fa-spkid0-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-17aa38f9-spkid1-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-17aa38f9-spkid1-r0.bin
+#  Link: cirrus/cs35l41-dsp1-spk-prot-103c8c26.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+#  Link: cirrus/cs35l41-dsp1-spk-prot-103c8b42.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+#  Link: cirrus/cs35l41-dsp1-spk-prot-103c8b43.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# @@ -7190,13 +7244,17 @@
+#  --------------------------------------------------------------------------
+#  
+#  Driver: amlogic - Amlogic SoC Firmware
+# -File: amlogic/bluetooth/w2_bt_fw_uart.bin
+# -Version: 38.01
+# -Info: 0xa914
+# -
+# -File: amlogic/bluetooth/w1u_bt_fw_uart.bin
+# -Version: 41.05
+# -Info: 0xb024
+# +File: amlogic/aml_w155s2_bt_uart.bin
+# +Version: 42.23
+# +Info: 0x2de8
+# +
+# +File: amlogic/aml_w265s1_bt_uart.bin
+# +Version: 43.13
+# +Info: 0xc1c2
+# +
+# +File: amlogic/aml_w265s2_bt_uart.bin
+# +Version: 42.28
+# +Info: 0xb2fd
+#  
+#  Licence: Redistributable. See LICENSE.amlogic for details
+#  
+# @@ -7324,3 +7382,29 @@
+#  Version: arch10.8
+#  
+#  License: Redistributable. See LICENCE.mali_csffw for details
+# +
+# +--------------------------------------------------------------------------
+# +Driver: isp - Image Signal Processor (ISP) device
+# +File: amdgpu/isp_4_1_1.bin
+# +
+# +License: Redistributable. See LICENSE.amdisp for details
+# +
+# +--------------------------------------------------------------------------
+# +
+# +Driver: qaic - Qualcomm Cloud AI accelerators
+# +File: qcom/aic100/fw1.bin
+# +File: qcom/aic100/fw10.bin
+# +File: qcom/aic100/fw2.bin
+# +File: qcom/aic100/fw5.bin
+# +File: qcom/aic100/fw9.bin
+# +File: qcom/aic100/sbl.bin
+# +
+# +License: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
+# +
+# +--------------------------------------------------------------------------
+# +
+# +Driver: ish - Intel Integrated Sensor Hub
+# +File: intel/ish/ish_lnlm.bin
+# +Version: 5.8.0.7716
+# +
+# +License: Redistributable. See LICENCE.ish for details
+# 
+#
+
 SUMMARY = "Firmware files for use with Linux kernel"
 HOMEPAGE = "https://www.kernel.org/"
 DESCRIPTION = "Linux firmware is a package distributed alongside the Linux kernel \
@@ -144,7 +493,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.rtlwifi_firmware.txt;md5=00d06cfd3eddd5a2698948ead2ad54a5 \
                     file://LICENSE.sdma_firmware;md5=51e8c19ecc2270f4b8ea30341ad63ce9 \
                     file://LICENCE.siano;md5=4556c1bf830067f12ca151ad953ec2a5 \
-                    file://LICENCE.ti-connectivity;md5=c5e02be633f1499c109d1652514d85ec \
+                    file://LICENCE.ti-connectivity;md5=3b1e9cf54aba8146dad4b735777d406f \
                     file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c \
                     file://LICENCE.ueagle-atm4-firmware;md5=4ed7ea6b507ccc583b9d594417714118 \
                     file://LICENCE.via_vt6656;md5=e4159694cba42d4377a912e78a6e850f \
@@ -152,7 +501,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=${WHENCE_CHKSUM} \
+                    file://WHENCE;md5=9ed57989a85c6def9fb7fa3fb5fb05f1 \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
@@ -244,7 +593,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "9f05edb99668135d37cedc4fdd18aac2802dc9e4566e086e6c6c2e321f3ecc4e"
+SRC_URI[sha256sum] = "719662d2e8644c097f9a0bfb6e4c97280f8b2943e7bd9b47f77cf039412f5b14"
 
 inherit allarch
 
-- 
2.44.0


--===============5724069972648811668==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: FILELIST: added "/usr/lib/firmware/amdgpu/gc_11_5_1_me.bin /usr/lib/firmware/amdgpu/vcn_4_0_6_1.bin /usr/lib/firmware/amdgpu/sdma_6_1_1.bin /usr/lib/firmware/amdgpu/psp_14_0_1_toc.bin /usr/lib/firmware/amdgpu/gc_11_5_1_mes1.bin /usr/lib/firmware/amdgpu/psp_14_0_1_ta.bin /usr/lib/firmware/amdgpu/isp_4_1_1.bin /usr/lib/firmware/amdgpu/vpe_6_1_1.bin /usr/lib/firmware/amdgpu/gc_11_5_1_mec.bin /usr/lib/firmware/amdgpu/gc_11_5_1_pfp.bin /usr/lib/firmware/amdgpu/gc_11_5_1_rlc.bin /usr/lib/firmware/amdgpu/gc_11_5_1_mes_2.bin /usr/lib/firmware/amdgpu/dcn_3_5_1_dmcub.bin /usr/lib/firmware/amdgpu/gc_11_5_1_imu.bin /usr/lib/firmware/amdgpu/vcn_4_0_6.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: FILELIST: added "/usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-l1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38f9.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c7.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38fa-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38fa-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c8.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38fa.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-r1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38f9-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-pro
 t-17aa38f9-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-l1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-r1.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: FILELIST: added "/usr/lib/firmware/iwlwifi-ma-b0-hr-b0-89.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-license: FILELIST: added "/usr/lib/firmware/LICENCE.ish /usr/lib/firmware/LICENSE.amdisp"
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGSIZE changed from 98464 to 117348 (+19%)
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: FILELIST: added "/usr/lib/firmware/rtw88/rtw8821a_fw.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PKGSIZE changed from 216662 to 248560 (+15%)
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: removed "/usr/lib/firmware/amlogic/bluetooth/w2_bt_fw_uart.bin /usr/lib/firmware/amlogic/bluetooth/w1u_bt_fw_uart.bin", added "/usr/lib/firmware/intel/ish/ish_lnlm.bin /usr/lib/firmware/qcom/aic100/sbl.bin /usr/lib/firmware/qcom/aic100/fw2.bin /usr/lib/firmware/amlogic/aml_w265s1_bt_uart.bin /usr/lib/firmware/amlogic/aml_w155s2_bt_uart.bin /usr/lib/firmware/ti-connectivity/cc33xx_fw.bin /usr/lib/firmware/amlogic/aml_w265s2_bt_uart.bin /usr/lib/firmware/qcom/aic100/fw1.bin /usr/lib/firmware/ti-connectivity/cc33xx_2nd_loader.bin /usr/lib/firmware/qcom/aic100/fw10.bin /usr/lib/firmware/qcom/aic100/fw5.bin /usr/lib/firmware/ti-connectivity/cc33xx-conf.bin /usr/lib/firmware/qcom/aic100/fw9.bin"

--===============5724069972648811668==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-linux-firmware-upgrade-20240513-20240709.patch"

RnJvbSA5MjM3OGQyODliZWNlOGYzZWRlYWQyZWE4ZmY1Y2JkOTRkODBlZGFkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSnVsIDIwMjQgMTU6NTM6MTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aW51eC1maXJtd2FyZTogdXBncmFkZSAyMDI0MDUxMyAtPiAyMDI0MDcwOQoKLS0tCiAuLi4yMDI0
MDUxMy5iYiA9PiBsaW51eC1maXJtd2FyZV8yMDI0MDcwOS5iYn0gfCAzNTUgKysrKysrKysrKysr
KysrKystCiAxIGZpbGUgY2hhbmdlZCwgMzUyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS97bGludXgtZmlybXdh
cmVfMjAyNDA1MTMuYmIgPT4gbGludXgtZmlybXdhcmVfMjAyNDA3MDkuYmJ9ICg4NiUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2Fy
ZV8yMDI0MDUxMy5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgt
ZmlybXdhcmVfMjAyNDA3MDkuYmIKc2ltaWxhcml0eSBpbmRleCA4NiUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZV8yMDI0MDUxMy5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJt
d2FyZV8yMDI0MDcwOS5iYgppbmRleCA0YTg3MTA1ZDk4Li41ZDNiYzk2MDM0IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlXzIwMjQw
NTEzLmJiCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgtZmly
bXdhcmVfMjAyNDA3MDkuYmIKQEAgLTEsMyArMSwzNTIgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklM
RVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4K
KyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRo
ZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlm
IG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3Nh
Z2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0
ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0t
LSBMSUNFTkNFLnRpLWNvbm5lY3Rpdml0eQorIyArKysgTElDRU5DRS50aS1jb25uZWN0aXZpdHkK
KyMgQEAgLTEsNCArMSw0IEBACisjIC1Db3B5cmlnaHQgKGMpIDIwMTYgVGV4YXMgSW5zdHJ1bWVu
dHMgSW5jb3Jwb3JhdGVkCisjICtDb3B5cmlnaHQgKGMpIDIwMTYtMjAyNCBUZXhhcyBJbnN0cnVt
ZW50cyBJbmNvcnBvcmF0ZWQKKyMgIAorIyAgQWxsIHJpZ2h0cyByZXNlcnZlZCBub3QgZ3JhbnRl
ZCBoZXJlaW4uCisjICAKKyMgLS0tIFdIRU5DRQorIyArKysgV0hFTkNFCisjIEBAIC0xMDE3LDI1
ICsxMDE3LDI1IEBACisjICBWZXJzaW9uOiA3NC5hNWU5NTg4Yi4wCisjICAKKyMgIEZpbGU6IGl3
bHdpZmktY2MtYTAtNzcudWNvZGUKKyMgLVZlcnNpb246IDc0LmEyMGZiMDdkLjAKKyMgK1ZlcnNp
b246IDc0LmMzNjBjNGIxLjAKKyMgIAorIyAgRmlsZTogaXdsd2lmaS1RdS1iMC1oci1iMC03Ny51
Y29kZQorIyAtVmVyc2lvbjogNzQuYTIwZmIwN2QuMAorIyArVmVyc2lvbjogNzQuYzM2MGM0YjEu
MAorIyAgCisjICBGaWxlOiBpd2x3aWZpLVF1LWIwLWpmLWIwLTc3LnVjb2RlCisjIC1WZXJzaW9u
OiA3NC5hMjBmYjA3ZC4wCisjICtWZXJzaW9uOiA3NC5jMzYwYzRiMS4wCisjICAKKyMgIEZpbGU6
IGl3bHdpZmktUXUtYzAtaHItYjAtNzcudWNvZGUKKyMgLVZlcnNpb246IDc0LmEyMGZiMDdkLjAK
KyMgK1ZlcnNpb246IDc0LmMzNjBjNGIxLjAKKyMgIAorIyAgRmlsZTogaXdsd2lmaS1RdS1jMC1q
Zi1iMC03Ny51Y29kZQorIyAtVmVyc2lvbjogNzQuYTIwZmIwN2QuMAorIyArVmVyc2lvbjogNzQu
YzM2MGM0YjEuMAorIyAgCisjICBGaWxlOiBpd2x3aWZpLVF1Wi1hMC1oci1iMC03Ny51Y29kZQor
IyAtVmVyc2lvbjogNzQuYTIwZmIwN2QuMAorIyArVmVyc2lvbjogNzQuYzM2MGM0YjEuMAorIyAg
CisjICBGaWxlOiBpd2x3aWZpLVF1Wi1hMC1qZi1iMC03Ny51Y29kZQorIyAtVmVyc2lvbjogNzQu
MjA2YjAxODQuMAorIyArVmVyc2lvbjogNzQuYzM2MGM0YjEuMAorIyAgCisjICBGaWxlOiBpd2x3
aWZpLXR5LWEwLWdmLWEwLTc3LnVjb2RlCisjICBWZXJzaW9uOiA3NC5mOTJiNWZlZC4wCisjIEBA
IC0xMDU5LDcgKzEwNTksNyBAQAorIyAgVmVyc2lvbjogODMuZmI1YzlhZWIuMAorIyAgCisjICBG
aWxlOiBpd2x3aWZpLXR5LWEwLWdmLWEwLTg5LnVjb2RlCisjIC1WZXJzaW9uOiA4Ny5lOWNlYzc4
ZS4wCisjICtWZXJzaW9uOiA4Ny4yMDJhMmY3Yi4wCisjICAKKyMgIEZpbGU6IGl3bHdpZmktc28t
YTAtZ2Y0LWEwLTc3LnVjb2RlCisjICBWZXJzaW9uOiA3NC5mOTJiNWZlZC4wCisjIEBAIC0xMDgz
LDcgKzEwODMsNyBAQAorIyAgVmVyc2lvbjogODMuZmI1YzlhZWIuMAorIyAgCisjICBGaWxlOiBp
d2x3aWZpLXNvLWEwLWdmNC1hMC04OS51Y29kZQorIyAtVmVyc2lvbjogODcuZTljZWM3OGUuMAor
IyArVmVyc2lvbjogODcuMjAyYTJmN2IuMAorIyAgCisjICBGaWxlOiBpd2x3aWZpLXNvLWEwLWdm
LWEwLTc3LnVjb2RlCisjICBWZXJzaW9uOiA3NC5mOTJiNWZlZC4wCisjIEBAIC0xMTA3LDcgKzEx
MDcsNyBAQAorIyAgVmVyc2lvbjogODMuZmI1YzlhZWIuMAorIyAgCisjICBGaWxlOiBpd2x3aWZp
LXNvLWEwLWdmLWEwLTg5LnVjb2RlCisjIC1WZXJzaW9uOiA4Ny5lOWNlYzc4ZS4wCisjICtWZXJz
aW9uOiA4Ny4yMDJhMmY3Yi4wCisjICAKKyMgIEZpbGU6IGl3bHdpZmktc28tYTAtaHItYjAtNzcu
dWNvZGUKKyMgIFZlcnNpb246IDc0LmY5MmI1ZmVkLjAKKyMgQEAgLTExMjgsNyArMTEyOCw3IEBA
CisjICBWZXJzaW9uOiA4My5mYjVjOWFlYi4wCisjICAKKyMgIEZpbGU6IGl3bHdpZmktc28tYTAt
aHItYjAtODkudWNvZGUKKyMgLVZlcnNpb246IDg3LmU5Y2VjNzhlLjAKKyMgK1ZlcnNpb246IDg3
LjIwMmEyZjdiLjAKKyMgIAorIyAgRmlsZTogaXdsd2lmaS1zby1hMC1qZi1iMC03Ny51Y29kZQor
IyAgVmVyc2lvbjogNzQuZjkyYjVmZWQuMAorIyBAQCAtMTE1Myw3ICsxMTUzLDcgQEAKKyMgIFZl
cnNpb246IDgzLmZiNWM5YWViLjAKKyMgIAorIyAgRmlsZTogaXdsd2lmaS1tYS1iMC1nZi1hMC04
OS51Y29kZQorIyAtVmVyc2lvbjogODcuZTljZWM3OGUuMAorIyArVmVyc2lvbjogODcuMjAyYTJm
N2IuMAorIyAgCisjICBGaWxlOiBpd2x3aWZpLW1hLWIwLWdmLWEwLnBudm0KKyMgIAorIyBAQCAt
MTE2NCw3ICsxMTY0LDcgQEAKKyMgIFZlcnNpb246IDgzLmZiNWM5YWViLjAKKyMgIAorIyAgRmls
ZTogaXdsd2lmaS1tYS1iMC1nZjQtYTAtODkudWNvZGUKKyMgLVZlcnNpb246IDg3LmU5Y2VjNzhl
LjAKKyMgK1ZlcnNpb246IDg3LjIwMmEyZjdiLjAKKyMgIAorIyAgRmlsZTogaXdsd2lmaS1tYS1i
MC1nZjQtYTAucG52bQorIyAgCisjIEBAIC0xMTczLDYgKzExNzMsOSBAQAorIyAgCisjICBGaWxl
OiBpd2x3aWZpLW1hLWIwLWhyLWIwLTg2LnVjb2RlCisjICBWZXJzaW9uOiA4My5mYjVjOWFlYi4w
CisjICsKKyMgK0ZpbGU6IGl3bHdpZmktbWEtYjAtaHItYjAtODkudWNvZGUKKyMgK1ZlcnNpb246
IDgzLjIwMmEyZjdiLjAKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElD
RU5DRS5pd2x3aWZpX2Zpcm13YXJlIGZvciBkZXRhaWxzCisjICAKKyMgQEAgLTI1NzcsMTIgKzI1
ODAsMjAgQEAKKyMgIEZpbGU6IGFtZGdwdS9nY18xMV81XzBfbWVzXzIuYmluCisjICBGaWxlOiBh
bWRncHUvZ2NfMTFfNV8wX3BmcC5iaW4KKyMgIEZpbGU6IGFtZGdwdS9nY18xMV81XzBfcmxjLmJp
bgorIyArRmlsZTogYW1kZ3B1L2djXzExXzVfMV9pbXUuYmluCisjICtGaWxlOiBhbWRncHUvZ2Nf
MTFfNV8xX21lLmJpbgorIyArRmlsZTogYW1kZ3B1L2djXzExXzVfMV9tZWMuYmluCisjICtGaWxl
OiBhbWRncHUvZ2NfMTFfNV8xX21lczEuYmluCisjICtGaWxlOiBhbWRncHUvZ2NfMTFfNV8xX21l
c18yLmJpbgorIyArRmlsZTogYW1kZ3B1L2djXzExXzVfMV9wZnAuYmluCisjICtGaWxlOiBhbWRn
cHUvZ2NfMTFfNV8xX3JsYy5iaW4KKyMgIEZpbGU6IGFtZGdwdS9kY25fM18xXzRfZG1jdWIuYmlu
CisjICBGaWxlOiBhbWRncHUvZGNuXzNfMV81X2RtY3ViLmJpbgorIyAgRmlsZTogYW1kZ3B1L2Rj
bl8zXzFfNl9kbWN1Yi5iaW4KKyMgIEZpbGU6IGFtZGdwdS9kY25fM18yXzBfZG1jdWIuYmluCisj
ICBGaWxlOiBhbWRncHUvZGNuXzNfMl8xX2RtY3ViLmJpbgorIyAgRmlsZTogYW1kZ3B1L2Rjbl8z
XzVfZG1jdWIuYmluCisjICtGaWxlOiBhbWRncHUvZGNuXzNfNV8xX2RtY3ViLmJpbgorIyAgRmls
ZTogYW1kZ3B1L3BzcF8xM18wXzBfc29zLmJpbgorIyAgRmlsZTogYW1kZ3B1L3BzcF8xM18wXzBf
dGEuYmluCisjICBGaWxlOiBhbWRncHUvcHNwXzEzXzBfNF90YS5iaW4KKyMgQEAgLTI2MDMsNiAr
MjYxNCw4IEBACisjICBGaWxlOiBhbWRncHUvcHNwXzEzXzBfMTFfdG9jLmJpbgorIyAgRmlsZTog
YW1kZ3B1L3BzcF8xNF8wXzBfdGEuYmluCisjICBGaWxlOiBhbWRncHUvcHNwXzE0XzBfMF90b2Mu
YmluCisjICtGaWxlOiBhbWRncHUvcHNwXzE0XzBfMV90YS5iaW4KKyMgK0ZpbGU6IGFtZGdwdS9w
c3BfMTRfMF8xX3RvYy5iaW4KKyMgIEZpbGU6IGFtZGdwdS9zZG1hXzRfNF8yLmJpbgorIyAgRmls
ZTogYW1kZ3B1L3NkbWFfNV8yXzYuYmluCisjICBGaWxlOiBhbWRncHUvc2RtYV81XzJfNy5iaW4K
KyMgQEAgLTI2MTEsNiArMjYyNCw3IEBACisjICBGaWxlOiBhbWRncHUvc2RtYV82XzBfMi5iaW4K
KyMgIEZpbGU6IGFtZGdwdS9zZG1hXzZfMF8zLmJpbgorIyAgRmlsZTogYW1kZ3B1L3NkbWFfNl8x
XzAuYmluCisjICtGaWxlOiBhbWRncHUvc2RtYV82XzFfMS5iaW4KKyMgIEZpbGU6IGFtZGdwdS9z
bXVfMTNfMF8wLmJpbgorIyAgRmlsZTogYW1kZ3B1L3NtdV8xM18wXzYuYmluCisjICBGaWxlOiBh
bWRncHUvc211XzEzXzBfNy5iaW4KKyMgQEAgLTI2MjIsNyArMjYzNiwxMCBAQAorIyAgRmlsZTog
YW1kZ3B1L3Zjbl80XzBfMy5iaW4KKyMgIEZpbGU6IGFtZGdwdS92Y25fNF8wXzQuYmluCisjICBG
aWxlOiBhbWRncHUvdmNuXzRfMF81LmJpbgorIyArRmlsZTogYW1kZ3B1L3Zjbl80XzBfNi5iaW4K
KyMgK0ZpbGU6IGFtZGdwdS92Y25fNF8wXzZfMS5iaW4KKyMgIEZpbGU6IGFtZGdwdS92cGVfNl8x
XzAuYmluCisjICtGaWxlOiBhbWRncHUvdnBlXzZfMV8xLmJpbgorIyAgCisjICBMaWNlbmNlOiBS
ZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLmFtZGdwdSBmb3IgZGV0YWlscy4KKyMgIAorIyBA
QCAtMzA2NCw2ICszMDgxLDMwIEBACisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAKKyMg
K0RyaXZlcjogY2MzM3h4IC0gVGV4YXMgSW5zdHJ1bWVudHMgODAyLjExIFdMQU4gZHJpdmVyIGZv
ciBDQzMzeHggY2hpcHMKKyMgKworIyArRmlsZTogdGktY29ubmVjdGl2aXR5L2NjMzN4eF8ybmRf
bG9hZGVyLmJpbgorIyArVmVyc2lvbjogMS4wLjAuMjMKKyMgK0ZpbGU6IHRpLWNvbm5lY3Rpdml0
eS9jYzMzeHhfZncuYmluCisjICtWZXJzaW9uOiAxLjcuMC4xMjAKKyMgK0ZpbGU6IHRpLWNvbm5l
Y3Rpdml0eS9jYzMzeHgtY29uZi5iaW4KKyMgK1ZlcnNpb246IDEuNy4wLjEyMAorIyArCisjICtM
aWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLnRpLWNvbm5lY3Rpdml0eSBmb3Ig
ZGV0YWlscy4KKyMgKworIyArVGhlIGNjMzN4eC1jb25mLmJpbiBpcyBhIGJpbmFyeSBjb250YWlu
aW5nIHR3byBwYXJ0czogcmFkaW8gY2FsaWJyYXRpb24KKyMgK2FuZCBoYXJkd2FyZSBjb25maWd1
cmF0aW9uLiBUaGUgYmluYXJ5IGNhbiBiZSBtb2RpZmllZCB1c2luZyB0aGUgdG9vbAorIyArY2Mz
M2NvbmYgd2hpY2ggY2FuIGJlIGZvdW5kIGluIHRoZSBDQzMzWFggTGludXggU0RLIGhlcmU6IAor
IyArCisjICtodHRwczovL3d3dy50aS5jb20vdG9vbC9DQzMzWFgtU09GVFdBUkUgCisjICsKKyMg
K1RoZSBkcml2ZXIgZXhwZWN0cyB0byBmaW5kIHRoZSBmaXJtd2FyZXMgdW5kZXIgYSB0aS1jb25u
ZWN0aXZpdHkKKyMgK3N1YmRpcmVjdG9yeS4gIFNvIGlmIHlvdXIgc3lzdGVtIGxvb2tzIGZvciBm
aXJtd2FyZXMgaW4gL2xpYi9maXJtd2FyZSwKKyMgK3RoZSBmaXJtd2FyZXMgZm9yIGNjMzN4eCBj
aGlwcyBtdXN0IGJlIGxvY2F0ZWQgaW4KKyMgKy9saWIvZmlybXdhcmUvdGktY29ubmVjdGl2aXR5
Ly4KKyMgKworIyArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgKworIyAgRHJpdmVyOiBUSV9TVCAtIFRl
eGFzIEluc3RydW1lbnRzIGJsdWV0b290aCBkcml2ZXIKKyMgIAorIyAgRmlsZTogdGktY29ubmVj
dGl2aXR5L1RJSW5pdF82LjIuMzEuYnRzCisjIEBAIC0zMjI2LDYgKzMyNjcsNyBAQAorIyAgRHJp
dmVyOiBydHc4OCAtIFJlYWx0ZWsgODAyLjExYWMgV0xBTiBkcml2ZXIgZm9yIFJUTDg4MjJCRSBh
bmQgUlRMODgyMkNFCisjICAKKyMgIEluZm86IFNlbnQgdG8gTGFycnkgRmluZ2VyIGJ5IFJlYWx0
ZWsgZW5naW5lZXIgWWFuLUhzdWFuIENodWFuZyA8eWhjaHVhbmdAcmVhbHRlay5jb20+CisjICtG
aWxlOiBydHc4OC9ydHc4ODIxYV9mdy5iaW4KKyMgIEZpbGU6IHJ0dzg4L3J0dzg4MjJiX2Z3LmJp
bgorIyAgRmlsZTogcnR3ODgvcnR3ODgyMmNfZncuYmluCisjICBGaWxlOiBydHc4OC9ydHc4ODIy
Y193b3dfZncuYmluCisjIEBAIC0zODgzLDE0ICszOTI1LDE3IEBACisjICBWZXJzaW9uOiBCVF9X
aW5kU3Rvcm1QZWFrX1JFTDEyOTkKKyMgIEZpbGU6IGludGVsL2lidC0xMi0xNi5zZmkKKyMgIFZl
cnNpb246IEJUX1dpbmRTdG9ybVBlYWtfUkVMMTI5OQorIyArCisjICBGaWxlOiBpbnRlbC9pYnQt
MTctMTYtMS5zZmkKKyMgLVZlcnNpb246IEJUX0plZmZlcnNvblBlYWtfQjBfQjBfUkVMMjAzOTcK
KyMgIEZpbGU6IGludGVsL2lidC0xNy0xNi0xLmRkYworIyAtVmVyc2lvbjogQlRfSmVmZmVyc29u
UGVha19CMF9CMF9SRUwyMDM5NworIyAgRmlsZTogaW50ZWwvaWJ0LTE3LTIuc2ZpCisjIC1WZXJz
aW9uOiBCVF9KZWZmZXJzb25QZWFrX0IwX0IwX1JFTDIwMzk3CisjICBGaWxlOiBpbnRlbC9pYnQt
MTctMi5kZGMKKyMgLVZlcnNpb246IEJUX0plZmZlcnNvblBlYWtfQjBfQjBfUkVMMjAzOTcKKyMg
K0ZpbGU6IGludGVsL2lidC0xOC0xNi0xLnNmaQorIyArRmlsZTogaW50ZWwvaWJ0LTE4LTE2LTEu
ZGRjCisjICtGaWxlOiBpbnRlbC9pYnQtMTgtMi5zZmkKKyMgK0ZpbGU6IGludGVsL2lidC0xOC0y
LmRkYworIyArVmVyc2lvbjogQlRfUHVsc2FyX1JFTDIwNDI1XzIyLjIwLjI0MTIuMjA0MjUKKyMg
KworIyAgRmlsZTogaW50ZWwvaWJ0LTE3LTAtMS5zZmkKKyMgIFZlcnNpb246IEJUX0plZmZlcnNv
blBlYWtfQTBfQjBfUkVMMDIwMQorIyAgRmlsZTogaW50ZWwvaWJ0LTE3LTAtMS5kZGMKKyMgQEAg
LTM4OTksMTQgKzM5NDQsNyBAQAorIyAgVmVyc2lvbjogQlRfSmVmZmVyc29uUGVha19BMF9CMF9S
RUwwMjAxCisjICBGaWxlOiBpbnRlbC9pYnQtMTctMS5kZGMKKyMgIFZlcnNpb246IEJUX0plZmZl
cnNvblBlYWtfQTBfQjBfUkVMMDIwMQorIyAtRmlsZTogaW50ZWwvaWJ0LTE4LTE2LTEuc2ZpCisj
IC1WZXJzaW9uOiBCVF9UaHVuZGVyUGVha19CMF9CMF9SRUwyMDM5NworIyAtRmlsZTogaW50ZWwv
aWJ0LTE4LTE2LTEuZGRjCisjIC1WZXJzaW9uOiBCVF9UaHVuZGVyUGVha19CMF9CMF9SRUwyMDM5
NworIyAtRmlsZTogaW50ZWwvaWJ0LTE4LTIuc2ZpCisjIC1WZXJzaW9uOiBCVF9UaHVuZGVyUGVh
a19CMF9CMF9SRUwyMDM5NworIyAtRmlsZTogaW50ZWwvaWJ0LTE4LTIuZGRjCisjIC1WZXJzaW9u
OiBCVF9UaHVuZGVyUGVha19CMF9CMF9SRUwyMDM5NworIyArCisjICBGaWxlOiBpbnRlbC9pYnQt
MTgtMC0xLnNmaQorIyAgVmVyc2lvbjogQlRfVGh1bmRlclBlYWtfQTBfQjBfUkVMMDIwMQorIyAg
RmlsZTogaW50ZWwvaWJ0LTE4LTAtMS5kZGMKKyMgQEAgLTM5ODIsNyArNDAyMCw3IEBACisjICBG
aWxlOiBpbnRlbC9pYnQtMDA0MC0xMDUwLmRkYworIyAgRmlsZTogaW50ZWwvaWJ0LTEwNDAtMTA1
MC5zZmkKKyMgIEZpbGU6IGludGVsL2lidC0xMDQwLTEwNTAuZGRjCisjIC1WZXJzaW9uOiBCVF9T
b2xhcl9SRUw4MTQ1NF8yMy41MC4yNDE0NC44MTQ1NAorIyArVmVyc2lvbjogQlRfU29sYXJfUkVM
ODE1MjhfMjMuNTAuMjQxODMuODE1MjgKKyMgIAorIyAgRmlsZTogaW50ZWwvaWJ0LTAwNDAtMTAy
MC5zZmkKKyMgIEZpbGU6IGludGVsL2lidC0wMDQwLTEwMjAuZGRjCisjIEBAIC0zOTk2LDcgKzQw
MzQsNyBAQAorIyAgCisjICBGaWxlOiBpbnRlbC9pYnQtMDI5MS0wMjkxLnNmaQorIyAgRmlsZTog
aW50ZWwvaWJ0LTAyOTEtMDI5MS5kZGMKKyMgLVZlcnNpb246IEJUX0JsYXphclVfU19SRUw1Njg4
OF8yMy41MC4yNDE0NC41Njg4OAorIyArVmVyc2lvbjogQlRfQmxhemFyVV9TX1JFTDU4MjExXzIz
LjYwLjI0MTgzLjU4MjExCisjICAKKyMgIEZpbGU6IGludGVsL2lidC0wMTgwLTAwNDEuc2ZpCisj
ICBGaWxlOiBpbnRlbC9pYnQtMDE4MC0wMDQxLmRkYworIyBAQCAtNDAwNCw3ICs0MDQyLDcgQEAK
KyMgIEZpbGU6IGludGVsL2lidC0wMTgwLTQxNTAuZGRjCisjICBGaWxlOiBpbnRlbC9pYnQtMDE4
MC0xMDUwLnNmaQorIyAgRmlsZTogaW50ZWwvaWJ0LTAxODAtMTA1MC5kZGMKKyMgLVZlcnNpb246
IEJUX01hZ25ldGFyX1JFTDEwMzE3MV8yMy41MC4yNDE0NC4xMDMxNzEKKyMgK1ZlcnNpb246IEJU
X01hZ25ldGFyX1JFTDEwMzI0M18yMy41MC4yNDE4My4xMDMyNDMKKyMgIAorIyAgTGljZW5jZTog
UmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5pYnRfZmlybXdhcmUgZm9yIGRldGFpbHMKKyMg
IAorIyBAQCAtNjk0OCw2ICs2OTg2LDIyIEBACisjICBGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3Ax
LXNway1wcm90LTE3YWEzODY1LXIwLmJpbgorIyAgRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1z
cGstcHJvdC0xN2FhMzg2Ni1sMC5iaW4KKyMgIEZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3Br
LXByb3QtMTdhYTM4NjYtcjAuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1w
cm90LTE3YWEzOGM3LndtZncgLT4gY3MzNWw0MS92Ni44My4wL2hhbG9fY3NwbF9SQU1fcmV2QjJf
MjkuODUuMC53bWZ3CisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTE3YWEz
OGM4LndtZncgLT4gY3MzNWw0MS92Ni44My4wL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuODUuMC53
bWZ3CisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTE3YWEzOGY5LndtZncg
LT4gY3MzNWw0MS92Ni42MS4xL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuNjMuMS53bWZ3CisjICtM
aW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTE3YWEzOGZhLndtZncgLT4gY3MzNWw0
MS92Ni42MS4xL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuNjMuMS53bWZ3CisjICtGaWxlOiBjaXJy
dXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTE3YWEzOGM3LXNwa2lkMC1sMC5iaW4KKyMgK0ZpbGU6
IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTdhYTM4Yzctc3BraWQwLXIwLmJpbgorIyAr
RmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xN2FhMzhjNy1zcGtpZDAtbDEuYmlu
CisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTE3YWEzOGM3LXNwa2lkMC1y
MS5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTdhYTM4Yzgtc3Br
aWQxLWwwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xN2FhMzhj
OC1zcGtpZDEtcjAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTE3
YWEzOGM4LXNwa2lkMS1sMS5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXBy
b3QtMTdhYTM4Yzgtc3BraWQxLXIxLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1z
cGstcHJvdC0xN2FhMzhmYS1zcGtpZDAtbDAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1k
c3AxLXNway1wcm90LTE3YWEzOGZhLXNwa2lkMC1yMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1
bDQxLWRzcDEtc3BrLXByb3QtMTdhYTM4Zjktc3BraWQxLWwwLmJpbgorIyArRmlsZTogY2lycnVz
L2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xN2FhMzhmOS1zcGtpZDEtcjAuYmluCisjICBMaW5rOiBj
aXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4YzI2LndtZncgLT4gY3MzNWw0MS92Ni42
MS4xL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuNjMuMS53bWZ3CisjICBMaW5rOiBjaXJydXMvY3Mz
NWw0MS1kc3AxLXNway1wcm90LTEwM2M4YjQyLndtZncgLT4gY3MzNWw0MS92Ni42MS4xL2hhbG9f
Y3NwbF9SQU1fcmV2QjJfMjkuNjMuMS53bWZ3CisjICBMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3Ax
LXNway1wcm90LTEwM2M4YjQzLndtZncgLT4gY3MzNWw0MS92Ni42MS4xL2hhbG9fY3NwbF9SQU1f
cmV2QjJfMjkuNjMuMS53bWZ3CisjIEBAIC03MTkwLDEzICs3MjQ0LDE3IEBACisjICAtLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQorIyAgCisjICBEcml2ZXI6IGFtbG9naWMgLSBBbWxvZ2ljIFNvQyBGaXJtd2Fy
ZQorIyAtRmlsZTogYW1sb2dpYy9ibHVldG9vdGgvdzJfYnRfZndfdWFydC5iaW4KKyMgLVZlcnNp
b246IDM4LjAxCisjIC1JbmZvOiAweGE5MTQKKyMgLQorIyAtRmlsZTogYW1sb2dpYy9ibHVldG9v
dGgvdzF1X2J0X2Z3X3VhcnQuYmluCisjIC1WZXJzaW9uOiA0MS4wNQorIyAtSW5mbzogMHhiMDI0
CisjICtGaWxlOiBhbWxvZ2ljL2FtbF93MTU1czJfYnRfdWFydC5iaW4KKyMgK1ZlcnNpb246IDQy
LjIzCisjICtJbmZvOiAweDJkZTgKKyMgKworIyArRmlsZTogYW1sb2dpYy9hbWxfdzI2NXMxX2J0
X3VhcnQuYmluCisjICtWZXJzaW9uOiA0My4xMworIyArSW5mbzogMHhjMWMyCisjICsKKyMgK0Zp
bGU6IGFtbG9naWMvYW1sX3cyNjVzMl9idF91YXJ0LmJpbgorIyArVmVyc2lvbjogNDIuMjgKKyMg
K0luZm86IDB4YjJmZAorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNF
TlNFLmFtbG9naWMgZm9yIGRldGFpbHMKKyMgIAorIyBAQCAtNzMyNCwzICs3MzgyLDI5IEBACisj
ICBWZXJzaW9uOiBhcmNoMTAuOAorIyAgCisjICBMaWNlbnNlOiBSZWRpc3RyaWJ1dGFibGUuIFNl
ZSBMSUNFTkNFLm1hbGlfY3NmZncgZm9yIGRldGFpbHMKKyMgKworIyArLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KKyMgK0RyaXZlcjogaXNwIC0gSW1hZ2UgU2lnbmFsIFByb2Nlc3NvciAoSVNQKSBkZXZpY2UK
KyMgK0ZpbGU6IGFtZGdwdS9pc3BfNF8xXzEuYmluCisjICsKKyMgK0xpY2Vuc2U6IFJlZGlzdHJp
YnV0YWJsZS4gU2VlIExJQ0VOU0UuYW1kaXNwIGZvciBkZXRhaWxzCisjICsKKyMgKy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCisjICsKKyMgK0RyaXZlcjogcWFpYyAtIFF1YWxjb21tIENsb3VkIEFJIGFjY2Vs
ZXJhdG9ycworIyArRmlsZTogcWNvbS9haWMxMDAvZncxLmJpbgorIyArRmlsZTogcWNvbS9haWMx
MDAvZncxMC5iaW4KKyMgK0ZpbGU6IHFjb20vYWljMTAwL2Z3Mi5iaW4KKyMgK0ZpbGU6IHFjb20v
YWljMTAwL2Z3NS5iaW4KKyMgK0ZpbGU6IHFjb20vYWljMTAwL2Z3OS5iaW4KKyMgK0ZpbGU6IHFj
b20vYWljMTAwL3NibC5iaW4KKyMgKworIyArTGljZW5zZTogUmVkaXN0cmlidXRhYmxlLiBTZWUg
TElDRU5TRS5xY29tIGFuZCBxY29tL05PVElDRS50eHQgZm9yIGRldGFpbHMKKyMgKworIyArLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KKyMgKworIyArRHJpdmVyOiBpc2ggLSBJbnRlbCBJbnRlZ3JhdGVkIFNl
bnNvciBIdWIKKyMgK0ZpbGU6IGludGVsL2lzaC9pc2hfbG5sbS5iaW4KKyMgK1ZlcnNpb246IDUu
OC4wLjc3MTYKKyMgKworIyArTGljZW5zZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5p
c2ggZm9yIGRldGFpbHMKKyMgCisjCisKIFNVTU1BUlkgPSAiRmlybXdhcmUgZmlsZXMgZm9yIHVz
ZSB3aXRoIExpbnV4IGtlcm5lbCIKIEhPTUVQQUdFID0gImh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcv
IgogREVTQ1JJUFRJT04gPSAiTGludXggZmlybXdhcmUgaXMgYSBwYWNrYWdlIGRpc3RyaWJ1dGVk
IGFsb25nc2lkZSB0aGUgTGludXgga2VybmVsIFwKQEAgLTE0NCw3ICs0OTMsNyBAQCBMSUNfRklM
RVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTkNFLkFiaWxpczttZDU9YjVlZTNmNDEwNzgwZTU2NzEx
YWQ0OGVhZGMyMmI4YmMgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5DRS5ydGx3
aWZpX2Zpcm13YXJlLnR4dDttZDU9MDBkMDZjZmQzZWRkZDVhMjY5ODk0OGVhZDJhZDU0YTUgXAog
ICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5TRS5zZG1hX2Zpcm13YXJlO21kNT01MWU4
YzE5ZWNjMjI3MGY0YjhlYTMwMzQxYWQ2M2NlOSBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6
Ly9MSUNFTkNFLnNpYW5vO21kNT00NTU2YzFiZjgzMDA2N2YxMmNhMTUxYWQ5NTNlYzJhNSBcCi0g
ICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTkNFLnRpLWNvbm5lY3Rpdml0eTttZDU9YzVl
MDJiZTYzM2YxNDk5YzEwOWQxNjUyNTE0ZDg1ZWMgXAorICAgICAgICAgICAgICAgICAgICBmaWxl
Oi8vTElDRU5DRS50aS1jb25uZWN0aXZpdHk7bWQ1PTNiMWU5Y2Y1NGFiYTgxNDZkYWQ0YjczNTc3
N2Q0MDZmIFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOQ0UudGkta2V5c3RvbmU7
bWQ1PTNhODYzMzVkMzI4NjRiMGJlZjk5NmJlZTI2Y2MwZjJjIFwKICAgICAgICAgICAgICAgICAg
ICAgZmlsZTovL0xJQ0VOQ0UudWVhZ2xlLWF0bTQtZmlybXdhcmU7bWQ1PTRlZDdlYTZiNTA3Y2Nj
NTgzYjlkNTk0NDE3NzE0MTE4IFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOQ0Uu
dmlhX3Z0NjY1NjttZDU9ZTQxNTk2OTRjYmE0MmQ0Mzc3YTkxMmU3OGE2ZTg1MGYgXApAQCAtMTUy
LDcgKzUwMSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOQ0UuQWJpbGlzO21k
NT1iNWVlM2Y0MTA3ODBlNTY3MTFhZDQ4ZWFkYzIyYjhiYyBcCiAgICAgICAgICAgICAgICAgICAg
IGZpbGU6Ly9MSUNFTkNFLnhjNDAwMDttZDU9MGZmNTFkMmRjNDlmY2UwNDgxNGM5MTU1MDgxMDky
ZjAgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5DRS54YzUwMDA7bWQ1PTFlMTcw
YzEzMTc1MzIzYzMyYzdmNGQwOTk4ZDUzZjY2IFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTov
L0xJQ0VOQ0UueGM1MDAwYzttZDU9MTJiMDJlZmEzMDQ5ZGI2NWQ1MjRhZWI0MThkZDg3Y2EgXAot
ICAgICAgICAgICAgICAgICAgICBmaWxlOi8vV0hFTkNFO21kNT0ke1dIRU5DRV9DSEtTVU19IFwK
KyAgICAgICAgICAgICAgICAgICAgZmlsZTovL1dIRU5DRTttZDU9OWVkNTc5ODlhODVjNmRlZjlm
YjdmYTNmYjVmYjA1ZjEgXAogICAgICAgICAgICAgICAgICAgICAiCiAjIFdIRU5DRSBjaGVja3N1
bSBpcyBkZWZpbmVkIHNlcGFyYXRlbHkgdG8gZWFzZSBvdmVycmlkaW5nIGl0IGlmCiAjIGNsYXNz
LWRldnVwc3RyZWFtIGlzIHNlbGVjdGVkLgpAQCAtMjQ0LDcgKzU5Myw3IEBAIFNSQ19VUkk6Y2xh
c3MtZGV2dXBzdHJlYW0gPSAiZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJu
ZWwvZ2l0L2Zpcm13CiAjIFBpbiB0aGlzIHRvIHRoZSAyMDIyMDUwOSByZWxlYXNlLCBvdmVycmlk
ZSB0aGlzIGluIGxvY2FsLmNvbmYKIFNSQ1JFVjpjbGFzcy1kZXZ1cHN0cmVhbSA/PSAiYjE5Y2Jk
Y2E3OGFiMmFkZmQyMTBjOTFiZTE1YTIyNTY4ZThiOGNhZSIKIAotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjlmMDVlZGI5OTY2ODEzNWQzN2NlZGM0ZmRkMThhYWMyODAyZGM5ZTQ1NjZlMDg2ZTZjNmMy
ZTMyMWYzZWNjNGUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNzE5NjYyZDJlODY0NGMwOTdmOWEw
YmZiNmU0Yzk3MjgwZjhiMjk0M2U3YmQ5YjQ3Zjc3Y2YwMzk0MTJmNWIxNCIKIAogaW5oZXJpdCBh
bGxhcmNoCiAKLS0gCjIuNDQuMAoK

--===============5724069972648811668==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/linux-firmware: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware: SRC_URI changed from "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20240513.tar.xz" to "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20240709.tar.xz"
packages/all-poky-linux/linux-firmware: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: FILELIST: added "/usr/lib/firmware/amdgpu/vpe_6_1_1.bin /usr/lib/firmware/amdgpu/isp_4_1_1.bin /usr/lib/firmware/amdgpu/gc_11_5_1_me.bin /usr/lib/firmware/amdgpu/psp_14_0_1_toc.bin /usr/lib/firmware/amdgpu/gc_11_5_1_mes1.bin /usr/lib/firmware/amdgpu/gc_11_5_1_imu.bin /usr/lib/firmware/amdgpu/gc_11_5_1_mec.bin /usr/lib/firmware/amdgpu/gc_11_5_1_pfp.bin /usr/lib/firmware/amdgpu/gc_11_5_1_rlc.bin /usr/lib/firmware/amdgpu/psp_14_0_1_ta.bin /usr/lib/firmware/amdgpu/gc_11_5_1_mes_2.bin /usr/lib/firmware/amdgpu/dcn_3_5_1_dmcub.bin /usr/lib/firmware/amdgpu/vcn_4_0_6_1.bin /usr/lib/firmware/amdgpu/sdma_6_1_1.bin /usr/lib/firmware/amdgpu/vcn_4_0_6.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PKGSIZE changed from 85527210 to 92857610 (+9%)
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar5523: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ar5523: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2x: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2x: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: FILELIST: added "/usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c7.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c8.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38f9.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38fa.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-l1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-r1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-l1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-r1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38f9-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-pro
 t-17aa38f9-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38fa-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38fa-spkid0-r0.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: PKGSIZE changed from 2260402 to 2325794 (+3%)
packages/all-poky-linux/linux-firmware/linux-firmware-cnm-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-cnm-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cnm: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-cnm: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PKGSIZE changed from 2601318 to 2601478 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-18: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-18: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-18: PKGSIZE changed from 2601318 to 2601478 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGSIZE changed from 19551369 to 19551697 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9260: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9260: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: FILELIST: added "/usr/lib/firmware/iwlwifi-ma-b0-hr-b0-89.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PKGSIZE changed from 164887640 to 166509776 (+1%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-license: FILELIST: added "/usr/lib/firmware/LICENSE.amdisp /usr/lib/firmware/LICENCE.ish"
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGSIZE changed from 98464 to 117348 (+19%)
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mali-csffw-arch108: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-mali-csffw-arch108: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mali-csffw-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-mali-csffw-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mellanox: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-mellanox: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-microchip-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-microchip-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-microchip: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-microchip: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-moxa-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-moxa-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-moxa: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-moxa: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7650: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7650: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x2: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x2: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8987-sdio: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8987-sdio: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-common: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-common: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-pcie: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-pcie: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-sdio: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-sdio: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-common: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-common: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-pcie: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-pcie: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-sdio: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-sdio: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw416-sdio: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw416-sdio: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw612-sdio: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw612-sdio: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-olpc-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-olpc-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-olpc: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-olpc: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-powervr-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-powervr-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-powervr: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-powervr: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-prestera: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-prestera: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PKGSIZE changed from 2444995 to 2445819 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a702: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a702: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-modem: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-modem: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-wifi: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-wifi: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-adreno: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-adreno: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-adreno: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-adreno: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-audio: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-audio: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-modem: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-modem: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-wifi: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-wifi: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-adreno: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-adreno: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-audio: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-audio: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-compute: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-compute: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-modem: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-modem: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-wifi: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-wifi: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-adreno: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-adreno: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-thundercomm-db845c-sensors: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-thundercomm-db845c-sensors: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-adreno: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-adreno: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-thundercomm-rb5-sensors: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-thundercomm-rb5-sensors: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-6.0: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-6.0: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-yamato-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-yamato-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qed: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qed: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-dptx: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-dptx: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-nic: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-nic: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8761: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8761: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: FILELIST: added "/usr/lib/firmware/rtw88/rtw8821a_fw.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PKGSIZE changed from 216662 to 248560 (+15%)
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8822: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8822: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8822: PKGSIZE changed from 802041 to 802689 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-src: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-src: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PKGSIZE changed from 2913 to 2918 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGSIZE changed from 274394 to 277434 (+1%)
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: removed "/usr/lib/firmware/amlogic/bluetooth/w1u_bt_fw_uart.bin /usr/lib/firmware/amlogic/bluetooth/w2_bt_fw_uart.bin", added "/usr/lib/firmware/amlogic/aml_w265s2_bt_uart.bin /usr/lib/firmware/ti-connectivity/cc33xx_2nd_loader.bin /usr/lib/firmware/ti-connectivity/cc33xx_fw.bin /usr/lib/firmware/qcom/aic100/fw5.bin /usr/lib/firmware/qcom/aic100/fw2.bin /usr/lib/firmware/ti-connectivity/cc33xx-conf.bin /usr/lib/firmware/qcom/aic100/sbl.bin /usr/lib/firmware/amlogic/aml_w155s2_bt_uart.bin /usr/lib/firmware/intel/ish/ish_lnlm.bin /usr/lib/firmware/qcom/aic100/fw1.bin /usr/lib/firmware/qcom/aic100/fw9.bin /usr/lib/firmware/qcom/aic100/fw10.bin /usr/lib/firmware/amlogic/aml_w265s1_bt_uart.bin"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware: PKGSIZE changed from 83811421 to 90315524 (+8%)

--===============5724069972648811668==--

