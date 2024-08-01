Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAD0DC531DC
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:26 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.75749.1722536827318457581
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=OTzj3pgP;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=LaPeyhsN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101910f3237aa-d5da272e-2323-472d-98de-d3557ab017b3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536835;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Zdl9p311iJBwZtlw+e4iUdi28Nr1OdGc7I5o4MYdGJo=;
	b=OTzj3pgPjOsgkTSIWrqZu/NDNC8/LVnyW9bcyLNrwdREI35tRklNpGMS14gutGSw
	xECrDx+GZ1VjvJ9TKTfGSG1mf6jAfmVUUZVsqByXvhoJFL0TWjRPCpNwTnnF5hoDaAT
	zw+fnAkZRo9M1571HC8ib9C2Wi/zmi9oq4shg1ts=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536835;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Zdl9p311iJBwZtlw+e4iUdi28Nr1OdGc7I5o4MYdGJo=;
	b=LaPeyhsNK5KkTPOcZn40t7uZk6kcgv+p/v1BRJ02QK+1uNnFKFAAZjwdWVfcdKhO
	QOQP0mPqe4Z+dVBh1C7wCrinbImFzbEtdwUbrQtKMH8BcN98db7hDxXkbsrQmI0Gkww
	8Rl8Zyz9gpvhckBsn4PZj7BpvDXNoFi5WrtuZOXM=
Content-Type: multipart/mixed; boundary="===============2790495153227861049=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] linux-firmware: upgrading to 20240709 SUCCEEDED
Message-ID: <010101910f3237aa-d5da272e-2323-472d-98de-d3557ab017b3-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:15 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202862

--===============2790495153227861049==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *linux-firmware* to *20240709* has Succeeded.

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
From c3c6657cf53a78df7bba5255f5c8ecbe2af18b25 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Aug 2024 15:08:16 +0000
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


--===============2790495153227861049==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: FILELIST: added "/usr/lib/firmware/amdgpu/isp_4_1_1.bin /usr/lib/firmware/amdgpu/vpe_6_1_1.bin /usr/lib/firmware/amdgpu/psp_14_0_1_ta.bin /usr/lib/firmware/amdgpu/dcn_3_5_1_dmcub.bin /usr/lib/firmware/amdgpu/gc_11_5_1_me.bin /usr/lib/firmware/amdgpu/vcn_4_0_6.bin /usr/lib/firmware/amdgpu/vcn_4_0_6_1.bin /usr/lib/firmware/amdgpu/sdma_6_1_1.bin /usr/lib/firmware/amdgpu/gc_11_5_1_pfp.bin /usr/lib/firmware/amdgpu/gc_11_5_1_mes1.bin /usr/lib/firmware/amdgpu/gc_11_5_1_rlc.bin /usr/lib/firmware/amdgpu/gc_11_5_1_imu.bin /usr/lib/firmware/amdgpu/gc_11_5_1_mec.bin /usr/lib/firmware/amdgpu/gc_11_5_1_mes_2.bin /usr/lib/firmware/amdgpu/psp_14_0_1_toc.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: FILELIST: added "/usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c8.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38f9.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38fa.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-r1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-l1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-l1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-r1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38f9-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38f9-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp
 1-spk-prot-17aa38fa-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38fa-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c7.wmfw"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: FILELIST: added "/usr/lib/firmware/iwlwifi-ma-b0-hr-b0-89.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-license: FILELIST: added "/usr/lib/firmware/LICENSE.amdisp /usr/lib/firmware/LICENCE.ish"
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGSIZE changed from 98464 to 117348 (+19%)
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: FILELIST: added "/usr/lib/firmware/rtw88/rtw8821a_fw.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PKGSIZE changed from 216662 to 248560 (+15%)
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: removed "/usr/lib/firmware/amlogic/bluetooth/w1u_bt_fw_uart.bin /usr/lib/firmware/amlogic/bluetooth/w2_bt_fw_uart.bin", added "/usr/lib/firmware/qcom/aic100/fw5.bin /usr/lib/firmware/ti-connectivity/cc33xx_2nd_loader.bin /usr/lib/firmware/amlogic/aml_w155s2_bt_uart.bin /usr/lib/firmware/qcom/aic100/fw10.bin /usr/lib/firmware/ti-connectivity/cc33xx-conf.bin /usr/lib/firmware/qcom/aic100/fw1.bin /usr/lib/firmware/ti-connectivity/cc33xx_fw.bin /usr/lib/firmware/qcom/aic100/fw2.bin /usr/lib/firmware/qcom/aic100/fw9.bin /usr/lib/firmware/amlogic/aml_w265s1_bt_uart.bin /usr/lib/firmware/amlogic/aml_w265s2_bt_uart.bin /usr/lib/firmware/qcom/aic100/sbl.bin /usr/lib/firmware/intel/ish/ish_lnlm.bin"

--===============2790495153227861049==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-linux-firmware-upgrade-20240513-20240709.patch"

RnJvbSBjM2M2NjU3Y2Y1M2E3OGRmN2JiYTUyNTVmNWM4ZWNiZTJhZjE4YjI1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBBdWcgMjAyNCAxNTowODoxNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
bnV4LWZpcm13YXJlOiB1cGdyYWRlIDIwMjQwNTEzIC0+IDIwMjQwNzA5CgotLS0KIC4uLjIwMjQw
NTEzLmJiID0+IGxpbnV4LWZpcm13YXJlXzIwMjQwNzA5LmJifSB8IDM1NSArKysrKysrKysrKysr
KysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzNTIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL3tsaW51eC1maXJtd2Fy
ZV8yMDI0MDUxMy5iYiA9PiBsaW51eC1maXJtd2FyZV8yMDI0MDcwOS5iYn0gKDg2JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJl
XzIwMjQwNTEzLmJiIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1m
aXJtd2FyZV8yMDI0MDcwOS5iYgpzaW1pbGFyaXR5IGluZGV4IDg2JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlXzIwMjQwNTEzLmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13
YXJlXzIwMjQwNzA5LmJiCmluZGV4IDRhODcxMDVkOTguLjVkM2JjOTYwMzQgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgtZmlybXdhcmVfMjAyNDA1
MTMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJt
d2FyZV8yMDI0MDcwOS5iYgpAQCAtMSwzICsxLDM1MiBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxF
U19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgor
IyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhl
IG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYg
bmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2Fn
ZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRl
OiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0t
IExJQ0VOQ0UudGktY29ubmVjdGl2aXR5CisjICsrKyBMSUNFTkNFLnRpLWNvbm5lY3Rpdml0eQor
IyBAQCAtMSw0ICsxLDQgQEAKKyMgLUNvcHlyaWdodCAoYykgMjAxNiBUZXhhcyBJbnN0cnVtZW50
cyBJbmNvcnBvcmF0ZWQKKyMgK0NvcHlyaWdodCAoYykgMjAxNi0yMDI0IFRleGFzIEluc3RydW1l
bnRzIEluY29ycG9yYXRlZAorIyAgCisjICBBbGwgcmlnaHRzIHJlc2VydmVkIG5vdCBncmFudGVk
IGhlcmVpbi4KKyMgIAorIyAtLS0gV0hFTkNFCisjICsrKyBXSEVOQ0UKKyMgQEAgLTEwMTcsMjUg
KzEwMTcsMjUgQEAKKyMgIFZlcnNpb246IDc0LmE1ZTk1ODhiLjAKKyMgIAorIyAgRmlsZTogaXds
d2lmaS1jYy1hMC03Ny51Y29kZQorIyAtVmVyc2lvbjogNzQuYTIwZmIwN2QuMAorIyArVmVyc2lv
bjogNzQuYzM2MGM0YjEuMAorIyAgCisjICBGaWxlOiBpd2x3aWZpLVF1LWIwLWhyLWIwLTc3LnVj
b2RlCisjIC1WZXJzaW9uOiA3NC5hMjBmYjA3ZC4wCisjICtWZXJzaW9uOiA3NC5jMzYwYzRiMS4w
CisjICAKKyMgIEZpbGU6IGl3bHdpZmktUXUtYjAtamYtYjAtNzcudWNvZGUKKyMgLVZlcnNpb246
IDc0LmEyMGZiMDdkLjAKKyMgK1ZlcnNpb246IDc0LmMzNjBjNGIxLjAKKyMgIAorIyAgRmlsZTog
aXdsd2lmaS1RdS1jMC1oci1iMC03Ny51Y29kZQorIyAtVmVyc2lvbjogNzQuYTIwZmIwN2QuMAor
IyArVmVyc2lvbjogNzQuYzM2MGM0YjEuMAorIyAgCisjICBGaWxlOiBpd2x3aWZpLVF1LWMwLWpm
LWIwLTc3LnVjb2RlCisjIC1WZXJzaW9uOiA3NC5hMjBmYjA3ZC4wCisjICtWZXJzaW9uOiA3NC5j
MzYwYzRiMS4wCisjICAKKyMgIEZpbGU6IGl3bHdpZmktUXVaLWEwLWhyLWIwLTc3LnVjb2RlCisj
IC1WZXJzaW9uOiA3NC5hMjBmYjA3ZC4wCisjICtWZXJzaW9uOiA3NC5jMzYwYzRiMS4wCisjICAK
KyMgIEZpbGU6IGl3bHdpZmktUXVaLWEwLWpmLWIwLTc3LnVjb2RlCisjIC1WZXJzaW9uOiA3NC4y
MDZiMDE4NC4wCisjICtWZXJzaW9uOiA3NC5jMzYwYzRiMS4wCisjICAKKyMgIEZpbGU6IGl3bHdp
ZmktdHktYTAtZ2YtYTAtNzcudWNvZGUKKyMgIFZlcnNpb246IDc0LmY5MmI1ZmVkLjAKKyMgQEAg
LTEwNTksNyArMTA1OSw3IEBACisjICBWZXJzaW9uOiA4My5mYjVjOWFlYi4wCisjICAKKyMgIEZp
bGU6IGl3bHdpZmktdHktYTAtZ2YtYTAtODkudWNvZGUKKyMgLVZlcnNpb246IDg3LmU5Y2VjNzhl
LjAKKyMgK1ZlcnNpb246IDg3LjIwMmEyZjdiLjAKKyMgIAorIyAgRmlsZTogaXdsd2lmaS1zby1h
MC1nZjQtYTAtNzcudWNvZGUKKyMgIFZlcnNpb246IDc0LmY5MmI1ZmVkLjAKKyMgQEAgLTEwODMs
NyArMTA4Myw3IEBACisjICBWZXJzaW9uOiA4My5mYjVjOWFlYi4wCisjICAKKyMgIEZpbGU6IGl3
bHdpZmktc28tYTAtZ2Y0LWEwLTg5LnVjb2RlCisjIC1WZXJzaW9uOiA4Ny5lOWNlYzc4ZS4wCisj
ICtWZXJzaW9uOiA4Ny4yMDJhMmY3Yi4wCisjICAKKyMgIEZpbGU6IGl3bHdpZmktc28tYTAtZ2Yt
YTAtNzcudWNvZGUKKyMgIFZlcnNpb246IDc0LmY5MmI1ZmVkLjAKKyMgQEAgLTExMDcsNyArMTEw
Nyw3IEBACisjICBWZXJzaW9uOiA4My5mYjVjOWFlYi4wCisjICAKKyMgIEZpbGU6IGl3bHdpZmkt
c28tYTAtZ2YtYTAtODkudWNvZGUKKyMgLVZlcnNpb246IDg3LmU5Y2VjNzhlLjAKKyMgK1ZlcnNp
b246IDg3LjIwMmEyZjdiLjAKKyMgIAorIyAgRmlsZTogaXdsd2lmaS1zby1hMC1oci1iMC03Ny51
Y29kZQorIyAgVmVyc2lvbjogNzQuZjkyYjVmZWQuMAorIyBAQCAtMTEyOCw3ICsxMTI4LDcgQEAK
KyMgIFZlcnNpb246IDgzLmZiNWM5YWViLjAKKyMgIAorIyAgRmlsZTogaXdsd2lmaS1zby1hMC1o
ci1iMC04OS51Y29kZQorIyAtVmVyc2lvbjogODcuZTljZWM3OGUuMAorIyArVmVyc2lvbjogODcu
MjAyYTJmN2IuMAorIyAgCisjICBGaWxlOiBpd2x3aWZpLXNvLWEwLWpmLWIwLTc3LnVjb2RlCisj
ICBWZXJzaW9uOiA3NC5mOTJiNWZlZC4wCisjIEBAIC0xMTUzLDcgKzExNTMsNyBAQAorIyAgVmVy
c2lvbjogODMuZmI1YzlhZWIuMAorIyAgCisjICBGaWxlOiBpd2x3aWZpLW1hLWIwLWdmLWEwLTg5
LnVjb2RlCisjIC1WZXJzaW9uOiA4Ny5lOWNlYzc4ZS4wCisjICtWZXJzaW9uOiA4Ny4yMDJhMmY3
Yi4wCisjICAKKyMgIEZpbGU6IGl3bHdpZmktbWEtYjAtZ2YtYTAucG52bQorIyAgCisjIEBAIC0x
MTY0LDcgKzExNjQsNyBAQAorIyAgVmVyc2lvbjogODMuZmI1YzlhZWIuMAorIyAgCisjICBGaWxl
OiBpd2x3aWZpLW1hLWIwLWdmNC1hMC04OS51Y29kZQorIyAtVmVyc2lvbjogODcuZTljZWM3OGUu
MAorIyArVmVyc2lvbjogODcuMjAyYTJmN2IuMAorIyAgCisjICBGaWxlOiBpd2x3aWZpLW1hLWIw
LWdmNC1hMC5wbnZtCisjICAKKyMgQEAgLTExNzMsNiArMTE3Myw5IEBACisjICAKKyMgIEZpbGU6
IGl3bHdpZmktbWEtYjAtaHItYjAtODYudWNvZGUKKyMgIFZlcnNpb246IDgzLmZiNWM5YWViLjAK
KyMgKworIyArRmlsZTogaXdsd2lmaS1tYS1iMC1oci1iMC04OS51Y29kZQorIyArVmVyc2lvbjog
ODMuMjAyYTJmN2IuMAorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNF
TkNFLml3bHdpZmlfZmlybXdhcmUgZm9yIGRldGFpbHMKKyMgIAorIyBAQCAtMjU3NywxMiArMjU4
MCwyMCBAQAorIyAgRmlsZTogYW1kZ3B1L2djXzExXzVfMF9tZXNfMi5iaW4KKyMgIEZpbGU6IGFt
ZGdwdS9nY18xMV81XzBfcGZwLmJpbgorIyAgRmlsZTogYW1kZ3B1L2djXzExXzVfMF9ybGMuYmlu
CisjICtGaWxlOiBhbWRncHUvZ2NfMTFfNV8xX2ltdS5iaW4KKyMgK0ZpbGU6IGFtZGdwdS9nY18x
MV81XzFfbWUuYmluCisjICtGaWxlOiBhbWRncHUvZ2NfMTFfNV8xX21lYy5iaW4KKyMgK0ZpbGU6
IGFtZGdwdS9nY18xMV81XzFfbWVzMS5iaW4KKyMgK0ZpbGU6IGFtZGdwdS9nY18xMV81XzFfbWVz
XzIuYmluCisjICtGaWxlOiBhbWRncHUvZ2NfMTFfNV8xX3BmcC5iaW4KKyMgK0ZpbGU6IGFtZGdw
dS9nY18xMV81XzFfcmxjLmJpbgorIyAgRmlsZTogYW1kZ3B1L2Rjbl8zXzFfNF9kbWN1Yi5iaW4K
KyMgIEZpbGU6IGFtZGdwdS9kY25fM18xXzVfZG1jdWIuYmluCisjICBGaWxlOiBhbWRncHUvZGNu
XzNfMV82X2RtY3ViLmJpbgorIyAgRmlsZTogYW1kZ3B1L2Rjbl8zXzJfMF9kbWN1Yi5iaW4KKyMg
IEZpbGU6IGFtZGdwdS9kY25fM18yXzFfZG1jdWIuYmluCisjICBGaWxlOiBhbWRncHUvZGNuXzNf
NV9kbWN1Yi5iaW4KKyMgK0ZpbGU6IGFtZGdwdS9kY25fM181XzFfZG1jdWIuYmluCisjICBGaWxl
OiBhbWRncHUvcHNwXzEzXzBfMF9zb3MuYmluCisjICBGaWxlOiBhbWRncHUvcHNwXzEzXzBfMF90
YS5iaW4KKyMgIEZpbGU6IGFtZGdwdS9wc3BfMTNfMF80X3RhLmJpbgorIyBAQCAtMjYwMyw2ICsy
NjE0LDggQEAKKyMgIEZpbGU6IGFtZGdwdS9wc3BfMTNfMF8xMV90b2MuYmluCisjICBGaWxlOiBh
bWRncHUvcHNwXzE0XzBfMF90YS5iaW4KKyMgIEZpbGU6IGFtZGdwdS9wc3BfMTRfMF8wX3RvYy5i
aW4KKyMgK0ZpbGU6IGFtZGdwdS9wc3BfMTRfMF8xX3RhLmJpbgorIyArRmlsZTogYW1kZ3B1L3Bz
cF8xNF8wXzFfdG9jLmJpbgorIyAgRmlsZTogYW1kZ3B1L3NkbWFfNF80XzIuYmluCisjICBGaWxl
OiBhbWRncHUvc2RtYV81XzJfNi5iaW4KKyMgIEZpbGU6IGFtZGdwdS9zZG1hXzVfMl83LmJpbgor
IyBAQCAtMjYxMSw2ICsyNjI0LDcgQEAKKyMgIEZpbGU6IGFtZGdwdS9zZG1hXzZfMF8yLmJpbgor
IyAgRmlsZTogYW1kZ3B1L3NkbWFfNl8wXzMuYmluCisjICBGaWxlOiBhbWRncHUvc2RtYV82XzFf
MC5iaW4KKyMgK0ZpbGU6IGFtZGdwdS9zZG1hXzZfMV8xLmJpbgorIyAgRmlsZTogYW1kZ3B1L3Nt
dV8xM18wXzAuYmluCisjICBGaWxlOiBhbWRncHUvc211XzEzXzBfNi5iaW4KKyMgIEZpbGU6IGFt
ZGdwdS9zbXVfMTNfMF83LmJpbgorIyBAQCAtMjYyMiw3ICsyNjM2LDEwIEBACisjICBGaWxlOiBh
bWRncHUvdmNuXzRfMF8zLmJpbgorIyAgRmlsZTogYW1kZ3B1L3Zjbl80XzBfNC5iaW4KKyMgIEZp
bGU6IGFtZGdwdS92Y25fNF8wXzUuYmluCisjICtGaWxlOiBhbWRncHUvdmNuXzRfMF82LmJpbgor
IyArRmlsZTogYW1kZ3B1L3Zjbl80XzBfNl8xLmJpbgorIyAgRmlsZTogYW1kZ3B1L3ZwZV82XzFf
MC5iaW4KKyMgK0ZpbGU6IGFtZGdwdS92cGVfNl8xXzEuYmluCisjICAKKyMgIExpY2VuY2U6IFJl
ZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UuYW1kZ3B1IGZvciBkZXRhaWxzLgorIyAgCisjIEBA
IC0zMDY0LDYgKzMwODEsMzAgQEAKKyMgIAorIyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgIAorIyAr
RHJpdmVyOiBjYzMzeHggLSBUZXhhcyBJbnN0cnVtZW50cyA4MDIuMTEgV0xBTiBkcml2ZXIgZm9y
IENDMzN4eCBjaGlwcworIyArCisjICtGaWxlOiB0aS1jb25uZWN0aXZpdHkvY2MzM3h4XzJuZF9s
b2FkZXIuYmluCisjICtWZXJzaW9uOiAxLjAuMC4yMworIyArRmlsZTogdGktY29ubmVjdGl2aXR5
L2NjMzN4eF9mdy5iaW4KKyMgK1ZlcnNpb246IDEuNy4wLjEyMAorIyArRmlsZTogdGktY29ubmVj
dGl2aXR5L2NjMzN4eC1jb25mLmJpbgorIyArVmVyc2lvbjogMS43LjAuMTIwCisjICsKKyMgK0xp
Y2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UudGktY29ubmVjdGl2aXR5IGZvciBk
ZXRhaWxzLgorIyArCisjICtUaGUgY2MzM3h4LWNvbmYuYmluIGlzIGEgYmluYXJ5IGNvbnRhaW5p
bmcgdHdvIHBhcnRzOiByYWRpbyBjYWxpYnJhdGlvbgorIyArYW5kIGhhcmR3YXJlIGNvbmZpZ3Vy
YXRpb24uIFRoZSBiaW5hcnkgY2FuIGJlIG1vZGlmaWVkIHVzaW5nIHRoZSB0b29sCisjICtjYzMz
Y29uZiB3aGljaCBjYW4gYmUgZm91bmQgaW4gdGhlIENDMzNYWCBMaW51eCBTREsgaGVyZTogCisj
ICsKKyMgK2h0dHBzOi8vd3d3LnRpLmNvbS90b29sL0NDMzNYWC1TT0ZUV0FSRSAKKyMgKworIyAr
VGhlIGRyaXZlciBleHBlY3RzIHRvIGZpbmQgdGhlIGZpcm13YXJlcyB1bmRlciBhIHRpLWNvbm5l
Y3Rpdml0eQorIyArc3ViZGlyZWN0b3J5LiAgU28gaWYgeW91ciBzeXN0ZW0gbG9va3MgZm9yIGZp
cm13YXJlcyBpbiAvbGliL2Zpcm13YXJlLAorIyArdGhlIGZpcm13YXJlcyBmb3IgY2MzM3h4IGNo
aXBzIG11c3QgYmUgbG9jYXRlZCBpbgorIyArL2xpYi9maXJtd2FyZS90aS1jb25uZWN0aXZpdHkv
LgorIyArCisjICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyArCisjICBEcml2ZXI6IFRJX1NUIC0gVGV4
YXMgSW5zdHJ1bWVudHMgYmx1ZXRvb3RoIGRyaXZlcgorIyAgCisjICBGaWxlOiB0aS1jb25uZWN0
aXZpdHkvVElJbml0XzYuMi4zMS5idHMKKyMgQEAgLTMyMjYsNiArMzI2Nyw3IEBACisjICBEcml2
ZXI6IHJ0dzg4IC0gUmVhbHRlayA4MDIuMTFhYyBXTEFOIGRyaXZlciBmb3IgUlRMODgyMkJFIGFu
ZCBSVEw4ODIyQ0UKKyMgIAorIyAgSW5mbzogU2VudCB0byBMYXJyeSBGaW5nZXIgYnkgUmVhbHRl
ayBlbmdpbmVlciBZYW4tSHN1YW4gQ2h1YW5nIDx5aGNodWFuZ0ByZWFsdGVrLmNvbT4KKyMgK0Zp
bGU6IHJ0dzg4L3J0dzg4MjFhX2Z3LmJpbgorIyAgRmlsZTogcnR3ODgvcnR3ODgyMmJfZncuYmlu
CisjICBGaWxlOiBydHc4OC9ydHc4ODIyY19mdy5iaW4KKyMgIEZpbGU6IHJ0dzg4L3J0dzg4MjJj
X3dvd19mdy5iaW4KKyMgQEAgLTM4ODMsMTQgKzM5MjUsMTcgQEAKKyMgIFZlcnNpb246IEJUX1dp
bmRTdG9ybVBlYWtfUkVMMTI5OQorIyAgRmlsZTogaW50ZWwvaWJ0LTEyLTE2LnNmaQorIyAgVmVy
c2lvbjogQlRfV2luZFN0b3JtUGVha19SRUwxMjk5CisjICsKKyMgIEZpbGU6IGludGVsL2lidC0x
Ny0xNi0xLnNmaQorIyAtVmVyc2lvbjogQlRfSmVmZmVyc29uUGVha19CMF9CMF9SRUwyMDM5Nwor
IyAgRmlsZTogaW50ZWwvaWJ0LTE3LTE2LTEuZGRjCisjIC1WZXJzaW9uOiBCVF9KZWZmZXJzb25Q
ZWFrX0IwX0IwX1JFTDIwMzk3CisjICBGaWxlOiBpbnRlbC9pYnQtMTctMi5zZmkKKyMgLVZlcnNp
b246IEJUX0plZmZlcnNvblBlYWtfQjBfQjBfUkVMMjAzOTcKKyMgIEZpbGU6IGludGVsL2lidC0x
Ny0yLmRkYworIyAtVmVyc2lvbjogQlRfSmVmZmVyc29uUGVha19CMF9CMF9SRUwyMDM5NworIyAr
RmlsZTogaW50ZWwvaWJ0LTE4LTE2LTEuc2ZpCisjICtGaWxlOiBpbnRlbC9pYnQtMTgtMTYtMS5k
ZGMKKyMgK0ZpbGU6IGludGVsL2lidC0xOC0yLnNmaQorIyArRmlsZTogaW50ZWwvaWJ0LTE4LTIu
ZGRjCisjICtWZXJzaW9uOiBCVF9QdWxzYXJfUkVMMjA0MjVfMjIuMjAuMjQxMi4yMDQyNQorIyAr
CisjICBGaWxlOiBpbnRlbC9pYnQtMTctMC0xLnNmaQorIyAgVmVyc2lvbjogQlRfSmVmZmVyc29u
UGVha19BMF9CMF9SRUwwMjAxCisjICBGaWxlOiBpbnRlbC9pYnQtMTctMC0xLmRkYworIyBAQCAt
Mzg5OSwxNCArMzk0NCw3IEBACisjICBWZXJzaW9uOiBCVF9KZWZmZXJzb25QZWFrX0EwX0IwX1JF
TDAyMDEKKyMgIEZpbGU6IGludGVsL2lidC0xNy0xLmRkYworIyAgVmVyc2lvbjogQlRfSmVmZmVy
c29uUGVha19BMF9CMF9SRUwwMjAxCisjIC1GaWxlOiBpbnRlbC9pYnQtMTgtMTYtMS5zZmkKKyMg
LVZlcnNpb246IEJUX1RodW5kZXJQZWFrX0IwX0IwX1JFTDIwMzk3CisjIC1GaWxlOiBpbnRlbC9p
YnQtMTgtMTYtMS5kZGMKKyMgLVZlcnNpb246IEJUX1RodW5kZXJQZWFrX0IwX0IwX1JFTDIwMzk3
CisjIC1GaWxlOiBpbnRlbC9pYnQtMTgtMi5zZmkKKyMgLVZlcnNpb246IEJUX1RodW5kZXJQZWFr
X0IwX0IwX1JFTDIwMzk3CisjIC1GaWxlOiBpbnRlbC9pYnQtMTgtMi5kZGMKKyMgLVZlcnNpb246
IEJUX1RodW5kZXJQZWFrX0IwX0IwX1JFTDIwMzk3CisjICsKKyMgIEZpbGU6IGludGVsL2lidC0x
OC0wLTEuc2ZpCisjICBWZXJzaW9uOiBCVF9UaHVuZGVyUGVha19BMF9CMF9SRUwwMjAxCisjICBG
aWxlOiBpbnRlbC9pYnQtMTgtMC0xLmRkYworIyBAQCAtMzk4Miw3ICs0MDIwLDcgQEAKKyMgIEZp
bGU6IGludGVsL2lidC0wMDQwLTEwNTAuZGRjCisjICBGaWxlOiBpbnRlbC9pYnQtMTA0MC0xMDUw
LnNmaQorIyAgRmlsZTogaW50ZWwvaWJ0LTEwNDAtMTA1MC5kZGMKKyMgLVZlcnNpb246IEJUX1Nv
bGFyX1JFTDgxNDU0XzIzLjUwLjI0MTQ0LjgxNDU0CisjICtWZXJzaW9uOiBCVF9Tb2xhcl9SRUw4
MTUyOF8yMy41MC4yNDE4My44MTUyOAorIyAgCisjICBGaWxlOiBpbnRlbC9pYnQtMDA0MC0xMDIw
LnNmaQorIyAgRmlsZTogaW50ZWwvaWJ0LTAwNDAtMTAyMC5kZGMKKyMgQEAgLTM5OTYsNyArNDAz
NCw3IEBACisjICAKKyMgIEZpbGU6IGludGVsL2lidC0wMjkxLTAyOTEuc2ZpCisjICBGaWxlOiBp
bnRlbC9pYnQtMDI5MS0wMjkxLmRkYworIyAtVmVyc2lvbjogQlRfQmxhemFyVV9TX1JFTDU2ODg4
XzIzLjUwLjI0MTQ0LjU2ODg4CisjICtWZXJzaW9uOiBCVF9CbGF6YXJVX1NfUkVMNTgyMTFfMjMu
NjAuMjQxODMuNTgyMTEKKyMgIAorIyAgRmlsZTogaW50ZWwvaWJ0LTAxODAtMDA0MS5zZmkKKyMg
IEZpbGU6IGludGVsL2lidC0wMTgwLTAwNDEuZGRjCisjIEBAIC00MDA0LDcgKzQwNDIsNyBAQAor
IyAgRmlsZTogaW50ZWwvaWJ0LTAxODAtNDE1MC5kZGMKKyMgIEZpbGU6IGludGVsL2lidC0wMTgw
LTEwNTAuc2ZpCisjICBGaWxlOiBpbnRlbC9pYnQtMDE4MC0xMDUwLmRkYworIyAtVmVyc2lvbjog
QlRfTWFnbmV0YXJfUkVMMTAzMTcxXzIzLjUwLjI0MTQ0LjEwMzE3MQorIyArVmVyc2lvbjogQlRf
TWFnbmV0YXJfUkVMMTAzMjQzXzIzLjUwLjI0MTgzLjEwMzI0MworIyAgCisjICBMaWNlbmNlOiBS
ZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLmlidF9maXJtd2FyZSBmb3IgZGV0YWlscworIyAg
CisjIEBAIC02OTQ4LDYgKzY5ODYsMjIgQEAKKyMgIEZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEt
c3BrLXByb3QtMTdhYTM4NjUtcjAuYmluCisjICBGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNw
ay1wcm90LTE3YWEzODY2LWwwLmJpbgorIyAgRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGst
cHJvdC0xN2FhMzg2Ni1yMC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXBy
b3QtMTdhYTM4Yzcud21mdyAtPiBjczM1bDQxL3Y2LjgzLjAvaGFsb19jc3BsX1JBTV9yZXZCMl8y
OS44NS4wLndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTdhYTM4
Yzgud21mdyAtPiBjczM1bDQxL3Y2LjgzLjAvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS44NS4wLndt
ZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTdhYTM4Zjkud21mdyAt
PiBjczM1bDQxL3Y2LjYxLjEvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS42My4xLndtZncKKyMgK0xp
bms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTdhYTM4ZmEud21mdyAtPiBjczM1bDQx
L3Y2LjYxLjEvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS42My4xLndtZncKKyMgK0ZpbGU6IGNpcnJ1
cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTdhYTM4Yzctc3BraWQwLWwwLmJpbgorIyArRmlsZTog
Y2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xN2FhMzhjNy1zcGtpZDAtcjAuYmluCisjICtG
aWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTE3YWEzOGM3LXNwa2lkMC1sMS5iaW4K
KyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTdhYTM4Yzctc3BraWQwLXIx
LmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xN2FhMzhjOC1zcGtp
ZDEtbDAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTE3YWEzOGM4
LXNwa2lkMS1yMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTdh
YTM4Yzgtc3BraWQxLWwxLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJv
dC0xN2FhMzhjOC1zcGtpZDEtcjEuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNw
ay1wcm90LTE3YWEzOGZhLXNwa2lkMC1sMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRz
cDEtc3BrLXByb3QtMTdhYTM4ZmEtc3BraWQwLXIwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVs
NDEtZHNwMS1zcGstcHJvdC0xN2FhMzhmOS1zcGtpZDEtbDAuYmluCisjICtGaWxlOiBjaXJydXMv
Y3MzNWw0MS1kc3AxLXNway1wcm90LTE3YWEzOGY5LXNwa2lkMS1yMC5iaW4KKyMgIExpbms6IGNp
cnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhjMjYud21mdyAtPiBjczM1bDQxL3Y2LjYx
LjEvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS42My4xLndtZncKKyMgIExpbms6IGNpcnJ1cy9jczM1
bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhiNDIud21mdyAtPiBjczM1bDQxL3Y2LjYxLjEvaGFsb19j
c3BsX1JBTV9yZXZCMl8yOS42My4xLndtZncKKyMgIExpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEt
c3BrLXByb3QtMTAzYzhiNDMud21mdyAtPiBjczM1bDQxL3Y2LjYxLjEvaGFsb19jc3BsX1JBTV9y
ZXZCMl8yOS42My4xLndtZncKKyMgQEAgLTcxOTAsMTMgKzcyNDQsMTcgQEAKKyMgIC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCisjICAKKyMgIERyaXZlcjogYW1sb2dpYyAtIEFtbG9naWMgU29DIEZpcm13YXJl
CisjIC1GaWxlOiBhbWxvZ2ljL2JsdWV0b290aC93Ml9idF9md191YXJ0LmJpbgorIyAtVmVyc2lv
bjogMzguMDEKKyMgLUluZm86IDB4YTkxNAorIyAtCisjIC1GaWxlOiBhbWxvZ2ljL2JsdWV0b290
aC93MXVfYnRfZndfdWFydC5iaW4KKyMgLVZlcnNpb246IDQxLjA1CisjIC1JbmZvOiAweGIwMjQK
KyMgK0ZpbGU6IGFtbG9naWMvYW1sX3cxNTVzMl9idF91YXJ0LmJpbgorIyArVmVyc2lvbjogNDIu
MjMKKyMgK0luZm86IDB4MmRlOAorIyArCisjICtGaWxlOiBhbWxvZ2ljL2FtbF93MjY1czFfYnRf
dWFydC5iaW4KKyMgK1ZlcnNpb246IDQzLjEzCisjICtJbmZvOiAweGMxYzIKKyMgKworIyArRmls
ZTogYW1sb2dpYy9hbWxfdzI2NXMyX2J0X3VhcnQuYmluCisjICtWZXJzaW9uOiA0Mi4yOAorIyAr
SW5mbzogMHhiMmZkCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VO
U0UuYW1sb2dpYyBmb3IgZGV0YWlscworIyAgCisjIEBAIC03MzI0LDMgKzczODIsMjkgQEAKKyMg
IFZlcnNpb246IGFyY2gxMC44CisjICAKKyMgIExpY2Vuc2U6IFJlZGlzdHJpYnV0YWJsZS4gU2Vl
IExJQ0VOQ0UubWFsaV9jc2ZmdyBmb3IgZGV0YWlscworIyArCisjICstLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQorIyArRHJpdmVyOiBpc3AgLSBJbWFnZSBTaWduYWwgUHJvY2Vzc29yIChJU1ApIGRldmljZQor
IyArRmlsZTogYW1kZ3B1L2lzcF80XzFfMS5iaW4KKyMgKworIyArTGljZW5zZTogUmVkaXN0cmli
dXRhYmxlLiBTZWUgTElDRU5TRS5hbWRpc3AgZm9yIGRldGFpbHMKKyMgKworIyArLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KKyMgKworIyArRHJpdmVyOiBxYWljIC0gUXVhbGNvbW0gQ2xvdWQgQUkgYWNjZWxl
cmF0b3JzCisjICtGaWxlOiBxY29tL2FpYzEwMC9mdzEuYmluCisjICtGaWxlOiBxY29tL2FpYzEw
MC9mdzEwLmJpbgorIyArRmlsZTogcWNvbS9haWMxMDAvZncyLmJpbgorIyArRmlsZTogcWNvbS9h
aWMxMDAvZnc1LmJpbgorIyArRmlsZTogcWNvbS9haWMxMDAvZnc5LmJpbgorIyArRmlsZTogcWNv
bS9haWMxMDAvc2JsLmJpbgorIyArCisjICtMaWNlbnNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBM
SUNFTlNFLnFjb20gYW5kIHFjb20vTk9USUNFLnR4dCBmb3IgZGV0YWlscworIyArCisjICstLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQorIyArCisjICtEcml2ZXI6IGlzaCAtIEludGVsIEludGVncmF0ZWQgU2Vu
c29yIEh1YgorIyArRmlsZTogaW50ZWwvaXNoL2lzaF9sbmxtLmJpbgorIyArVmVyc2lvbjogNS44
LjAuNzcxNgorIyArCisjICtMaWNlbnNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLmlz
aCBmb3IgZGV0YWlscworIyAKKyMKKwogU1VNTUFSWSA9ICJGaXJtd2FyZSBmaWxlcyBmb3IgdXNl
IHdpdGggTGludXgga2VybmVsIgogSE9NRVBBR0UgPSAiaHR0cHM6Ly93d3cua2VybmVsLm9yZy8i
CiBERVNDUklQVElPTiA9ICJMaW51eCBmaXJtd2FyZSBpcyBhIHBhY2thZ2UgZGlzdHJpYnV0ZWQg
YWxvbmdzaWRlIHRoZSBMaW51eCBrZXJuZWwgXApAQCAtMTQ0LDcgKzQ5Myw3IEBAIExJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOQ0UuQWJpbGlzO21kNT1iNWVlM2Y0MTA3ODBlNTY3MTFh
ZDQ4ZWFkYzIyYjhiYyBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTkNFLnJ0bHdp
ZmlfZmlybXdhcmUudHh0O21kNT0wMGQwNmNmZDNlZGRkNWEyNjk4OTQ4ZWFkMmFkNTRhNSBcCiAg
ICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTlNFLnNkbWFfZmlybXdhcmU7bWQ1PTUxZThj
MTllY2MyMjcwZjRiOGVhMzAzNDFhZDYzY2U5IFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTov
L0xJQ0VOQ0Uuc2lhbm87bWQ1PTQ1NTZjMWJmODMwMDY3ZjEyY2ExNTFhZDk1M2VjMmE1IFwKLSAg
ICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOQ0UudGktY29ubmVjdGl2aXR5O21kNT1jNWUw
MmJlNjMzZjE0OTljMTA5ZDE2NTI1MTRkODVlYyBcCisgICAgICAgICAgICAgICAgICAgIGZpbGU6
Ly9MSUNFTkNFLnRpLWNvbm5lY3Rpdml0eTttZDU9M2IxZTljZjU0YWJhODE0NmRhZDRiNzM1Nzc3
ZDQwNmYgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5DRS50aS1rZXlzdG9uZTtt
ZDU9M2E4NjMzNWQzMjg2NGIwYmVmOTk2YmVlMjZjYzBmMmMgXAogICAgICAgICAgICAgICAgICAg
ICBmaWxlOi8vTElDRU5DRS51ZWFnbGUtYXRtNC1maXJtd2FyZTttZDU9NGVkN2VhNmI1MDdjY2M1
ODNiOWQ1OTQ0MTc3MTQxMTggXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5DRS52
aWFfdnQ2NjU2O21kNT1lNDE1OTY5NGNiYTQyZDQzNzdhOTEyZTc4YTZlODUwZiBcCkBAIC0xNTIs
NyArNTAxLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5DRS5BYmlsaXM7bWQ1
PWI1ZWUzZjQxMDc4MGU1NjcxMWFkNDhlYWRjMjJiOGJjIFwKICAgICAgICAgICAgICAgICAgICAg
ZmlsZTovL0xJQ0VOQ0UueGM0MDAwO21kNT0wZmY1MWQyZGM0OWZjZTA0ODE0YzkxNTUwODEwOTJm
MCBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTkNFLnhjNTAwMDttZDU9MWUxNzBj
MTMxNzUzMjNjMzJjN2Y0ZDA5OThkNTNmNjYgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8v
TElDRU5DRS54YzUwMDBjO21kNT0xMmIwMmVmYTMwNDlkYjY1ZDUyNGFlYjQxOGRkODdjYSBcCi0g
ICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9XSEVOQ0U7bWQ1PSR7V0hFTkNFX0NIS1NVTX0gXAor
ICAgICAgICAgICAgICAgICAgICBmaWxlOi8vV0hFTkNFO21kNT05ZWQ1Nzk4OWE4NWM2ZGVmOWZi
N2ZhM2ZiNWZiMDVmMSBcCiAgICAgICAgICAgICAgICAgICAgICIKICMgV0hFTkNFIGNoZWNrc3Vt
IGlzIGRlZmluZWQgc2VwYXJhdGVseSB0byBlYXNlIG92ZXJyaWRpbmcgaXQgaWYKICMgY2xhc3Mt
ZGV2dXBzdHJlYW0gaXMgc2VsZWN0ZWQuCkBAIC0yNDQsNyArNTkzLDcgQEAgU1JDX1VSSTpjbGFz
cy1kZXZ1cHN0cmVhbSA9ICJnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvZmlybXcKICMgUGluIHRoaXMgdG8gdGhlIDIwMjIwNTA5IHJlbGVhc2UsIG92ZXJyaWRl
IHRoaXMgaW4gbG9jYWwuY29uZgogU1JDUkVWOmNsYXNzLWRldnVwc3RyZWFtID89ICJiMTljYmRj
YTc4YWIyYWRmZDIxMGM5MWJlMTVhMjI1NjhlOGI4Y2FlIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiOWYwNWVkYjk5NjY4MTM1ZDM3Y2VkYzRmZGQxOGFhYzI4MDJkYzllNDU2NmUwODZlNmM2YzJl
MzIxZjNlY2M0ZSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI3MTk2NjJkMmU4NjQ0YzA5N2Y5YTBi
ZmI2ZTRjOTcyODBmOGIyOTQzZTdiZDliNDdmNzdjZjAzOTQxMmY1YjE0IgogCiBpbmhlcml0IGFs
bGFyY2gKIAotLSAKMi40NC4wCgo=

--===============2790495153227861049==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/linux-firmware: SRC_URI changed from "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20240513.tar.xz" to "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20240709.tar.xz"
packages/all-poky-linux/linux-firmware: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PKGSIZE changed from 85527210 to 92857610 (+9%)
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: FILELIST: added "/usr/lib/firmware/amdgpu/vcn_4_0_6_1.bin /usr/lib/firmware/amdgpu/gc_11_5_1_imu.bin /usr/lib/firmware/amdgpu/gc_11_5_1_mec.bin /usr/lib/firmware/amdgpu/gc_11_5_1_pfp.bin /usr/lib/firmware/amdgpu/gc_11_5_1_rlc.bin /usr/lib/firmware/amdgpu/vpe_6_1_1.bin /usr/lib/firmware/amdgpu/isp_4_1_1.bin /usr/lib/firmware/amdgpu/psp_14_0_1_ta.bin /usr/lib/firmware/amdgpu/dcn_3_5_1_dmcub.bin /usr/lib/firmware/amdgpu/sdma_6_1_1.bin /usr/lib/firmware/amdgpu/vcn_4_0_6.bin /usr/lib/firmware/amdgpu/gc_11_5_1_me.bin /usr/lib/firmware/amdgpu/psp_14_0_1_toc.bin /usr/lib/firmware/amdgpu/gc_11_5_1_mes1.bin /usr/lib/firmware/amdgpu/gc_11_5_1_mes_2.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ar5523: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar5523: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2x: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2x: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: PKGSIZE changed from 2260402 to 2325794 (+3%)
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: FILELIST: added "/usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38f9-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38f9-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-l1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-r1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-l1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-r1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38fa-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c7.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c8.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38f9.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38fa-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp
 1-spk-prot-17aa38fa.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-r0.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-cnm-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cnm-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-cnm: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cnm: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PKGSIZE changed from 2601318 to 2601478 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-18: PKGSIZE changed from 2601318 to 2601478 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-18: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-18: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGSIZE changed from 19551369 to 19551697 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9260: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9260: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PKGSIZE changed from 164887640 to 166509776 (+1%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: FILELIST: added "/usr/lib/firmware/iwlwifi-ma-b0-hr-b0-89.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGSIZE changed from 98464 to 117348 (+19%)
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-license: FILELIST: added "/usr/lib/firmware/LICENCE.ish /usr/lib/firmware/LICENSE.amdisp"
packages/all-poky-linux/linux-firmware/linux-firmware-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-mali-csffw-arch108: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mali-csffw-arch108: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-mali-csffw-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mali-csffw-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-mellanox: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mellanox: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-microchip-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-microchip-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-microchip: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-microchip: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-moxa-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-moxa-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-moxa: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-moxa: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7650: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7650: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x2: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x2: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8987-sdio: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8987-sdio: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-common: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-common: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-pcie: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-pcie: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-sdio: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-sdio: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-common: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-common: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-pcie: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-pcie: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-sdio: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-sdio: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw416-sdio: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw416-sdio: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw612-sdio: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw612-sdio: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-olpc-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-olpc-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-olpc: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-olpc: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-powervr-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-powervr-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-powervr: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-powervr: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-prestera: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-prestera: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PKGSIZE changed from 2444995 to 2445819 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a702: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a702: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-modem: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-modem: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-wifi: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-wifi: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-adreno: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-adreno: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-adreno: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-adreno: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-audio: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-audio: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-modem: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-modem: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-wifi: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-wifi: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-adreno: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-adreno: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-audio: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-audio: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-compute: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-compute: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-modem: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-modem: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-wifi: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-wifi: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-adreno: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-adreno: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-thundercomm-db845c-sensors: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-thundercomm-db845c-sensors: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-adreno: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-adreno: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-thundercomm-rb5-sensors: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-thundercomm-rb5-sensors: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-6.0: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-6.0: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-yamato-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-yamato-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qed: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qed: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-dptx: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-dptx: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-nic: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-nic: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8761: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8761: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PKGSIZE changed from 216662 to 248560 (+15%)
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: FILELIST: added "/usr/lib/firmware/rtw88/rtw8821a_fw.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8822: PKGSIZE changed from 802041 to 802689 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8822: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8822: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-src: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-src: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PKGSIZE changed from 2913 to 2918 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGSIZE changed from 274394 to 277434 (+1%)
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c-license: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c-license: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c: PV changed from "20240513" to "20240709"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGSIZE changed from 83811421 to 90315524 (+8%)
packages/all-poky-linux/linux-firmware/linux-firmware: PKGV changed from 20240513 [default] to 20240709 [default]
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: removed "/usr/lib/firmware/amlogic/bluetooth/w1u_bt_fw_uart.bin /usr/lib/firmware/amlogic/bluetooth/w2_bt_fw_uart.bin", added "/usr/lib/firmware/ti-connectivity/cc33xx_fw.bin /usr/lib/firmware/intel/ish/ish_lnlm.bin /usr/lib/firmware/qcom/aic100/fw9.bin /usr/lib/firmware/ti-connectivity/cc33xx-conf.bin /usr/lib/firmware/amlogic/aml_w265s2_bt_uart.bin /usr/lib/firmware/amlogic/aml_w155s2_bt_uart.bin /usr/lib/firmware/qcom/aic100/sbl.bin /usr/lib/firmware/ti-connectivity/cc33xx_2nd_loader.bin /usr/lib/firmware/qcom/aic100/fw2.bin /usr/lib/firmware/qcom/aic100/fw5.bin /usr/lib/firmware/qcom/aic100/fw10.bin /usr/lib/firmware/amlogic/aml_w265s1_bt_uart.bin /usr/lib/firmware/qcom/aic100/fw1.bin"
packages/all-poky-linux/linux-firmware/linux-firmware: PV changed from "20240513" to "20240709"

--===============2790495153227861049==--

