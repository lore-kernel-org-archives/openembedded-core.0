Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0D13C3527A
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 13:08:56 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web12.10407.1647349735123762117
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 06:08:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=1aQtrgCO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 0101017f8db21ea1-56f1e792-bd74-4c76-86dd-b5fd8bbbd266-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1647349735;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2/0wvarm5igP+G7MkLBs40QgPh1dZFtc//tzJUBa40Q=;
	b=1aQtrgCOH3g7orfvZnmx0gwP00mca6gB/X2Xw6WQ9CjvsAQdzZVaIk3i9ZNsjj0L
	rMh3Y0iWfzc5wFiemnPl9jsMClmdrpwb/jpkn3IAG6cVsVUb7WVwBeRdC8qT+bQi7Pt
	aTePVoZq/x1IAfIU6/xd/OuBu6CzdqaH0rYbxxN8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1647349735;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2/0wvarm5igP+G7MkLBs40QgPh1dZFtc//tzJUBa40Q=;
	b=dDvt3rSLDoCnGDurGaf9snK3dL5VxVTmBuoadiPgrYyP+fogmbzRyeAXp0iTrWBT
	1XAgsD85rX7QJa2XfmB7zfDJ6aN1bEBVNPXri9n27TTI70I/yndE86bgK9tj93aKYY+
	EcElIhe8NpkmOjs4jqSasW+FT/GFb4ikRPnjg00E=
Content-Type: multipart/mixed; boundary="===============2072305231249380969=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] linux-firmware: upgrading to 20220310 SUCCEEDED
Message-ID: 
 <0101017f8db21ea1-56f1e792-bd74-4c76-86dd-b5fd8bbbd266-000000@us-west-2.amazonses.com>
Date: Tue, 15 Mar 2022 13:08:55 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.03.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 13:08:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163270

--===============2072305231249380969==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *linux-firmware* to *20220310* has Succeeded.

Next steps:
    - apply the patch: git am 0001-linux-firmware-upgrade-20220209-20220310.patch
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
--===============2072305231249380969==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-linux-firmware-upgrade-20220209-20220310.patch"

From b47c63fcb87c1ebea85d8207dc7ce6ffa8b4102d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Mar 2022 10:40:15 +0000
Subject: [PATCH] linux-firmware: upgrade 20220209 -> 20220310

---
 ...20220209.bb => linux-firmware_20220310.bb} | 528 +++++++++++++++++-
 1 file changed, 525 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220209.bb => linux-firmware_20220310.bb} (73%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220209.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220310.bb
similarity index 73%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20220209.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20220310.bb
index fe51892eb4..a91887bf93 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220209.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220310.bb
@@ -1,3 +1,525 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE.amdgpu
+# +++ LICENSE.amdgpu
+# @@ -1,4 +1,4 @@
+# -Copyright (C) 2020  Advanced Micro Devices, Inc. All rights reserved.
+# +Copyright (C) 2022  Advanced Micro Devices, Inc. All rights reserved.
+#  
+#  REDISTRIBUTION: Permission is hereby granted, free of any license fees,
+#  to any person obtaining a copy of this microcode (the "Software"), to
+# --- WHENCE
+# +++ WHENCE
+# @@ -1027,7 +1027,7 @@
+#  Version: 43.95eb4e97.0
+#  
+#  File: iwlwifi-9000-pu-b0-jf-b0-46.ucode
+# -Version: 46.4e1ceb39.0
+# +Version: 46.fae53a8b.0
+#  
+#  File: iwlwifi-9260-th-b0-jf-b0-33.ucode
+#  Version: 33.610294.0
+# @@ -1045,7 +1045,7 @@
+#  Version: 43.95eb4e97.0
+#  
+#  File: iwlwifi-9260-th-b0-jf-b0-46.ucode
+# -Version: 46.4e1ceb39.0
+# +Version: 46.fae53a8b.0
+#  
+#  File: iwlwifi-cc-a0-46.ucode
+#  Version: 46.3cfab8da.0
+# @@ -1293,6 +1293,42 @@
+#  
+#  File: iwlwifi-so-a0-jf-b0-68.ucode
+#  Version: 68.01d30b0c.0
+# +
+# +File: iwlwifi-cc-a0-71.ucode
+# +Version: 71.058653f6.0
+# +
+# +File: iwlwifi-Qu-b0-hr-b0-71.ucode
+# +Version: 71.058653f6.0
+# +
+# +File: iwlwifi-Qu-b0-jf-b0-71.ucode
+# +Version: 71.058653f6.0
+# +
+# +File: iwlwifi-Qu-c0-hr-b0-71.ucode
+# +Version: 71.058653f6.0
+# +
+# +File: iwlwifi-Qu-c0-jf-b0-71.ucode
+# +Version: 71.058653f6.0
+# +
+# +File: iwlwifi-QuZ-a0-hr-b0-71.ucode
+# +Version: 71.058653f6.0
+# +
+# +File: iwlwifi-QuZ-a0-jf-b0-71.ucode
+# +Version: 71.058653f6.0
+# +
+# +File: iwlwifi-ty-a0-gf-a0-71.ucode
+# +Version: 71.058653f6.0
+# +
+# +File: iwlwifi-so-a0-gf4-a0-71.ucode
+# +Version: 71.058653f6.0
+# +
+# +File: iwlwifi-so-a0-gf-a0-71.ucode
+# +Version: 71.058653f6.0
+# +
+# +File: iwlwifi-so-a0-hr-b0-71.ucode
+# +Version: 71.058653f6.0
+# +
+# +File: iwlwifi-so-a0-jf-b0-71.ucode
+# +Version: 71.058653f6.0
+#  
+#  File: iwlwifi-so-a0-gf-a0.pnvm
+#  
+# @@ -2674,6 +2710,25 @@
+#  File: amdgpu/cyan_skillfish2_rlc.bin
+#  File: amdgpu/cyan_skillfish2_sdma.bin
+#  File: amdgpu/cyan_skillfish2_sdma1.bin
+# +File: amdgpu/aldebaran_mec2.bin
+# +File: amdgpu/aldebaran_mec.bin
+# +File: amdgpu/aldebaran_rlc.bin
+# +File: amdgpu/aldebaran_sdma.bin
+# +File: amdgpu/aldebaran_smc.bin
+# +File: amdgpu/aldebaran_sos.bin
+# +File: amdgpu/aldebaran_ta.bin
+# +File: amdgpu/aldebaran_vcn.bin
+# +File: amdgpu/gc_10_3_7_ce.bin
+# +File: amdgpu/gc_10_3_7_me.bin
+# +File: amdgpu/gc_10_3_7_mec.bin
+# +File: amdgpu/gc_10_3_7_mec2.bin
+# +File: amdgpu/gc_10_3_7_pfp.bin
+# +File: amdgpu/gc_10_3_7_rlc.bin
+# +File: amdgpu/dcn_3_1_6_dmcub.bin
+# +File: amdgpu/psp_13_0_8_asd.bin
+# +File: amdgpu/psp_13_0_8_ta.bin
+# +File: amdgpu/psp_13_0_8_toc.bin
+# +File: amdgpu/sdma_5_2_7.bin
+#  
+#  Licence: Redistributable. See LICENSE.amdgpu for details.
+#  
+# @@ -3549,62 +3604,62 @@
+#  File: ath10k/QCA988X/hw2.0/board.bin
+#  File: ath10k/QCA988X/hw2.0/firmware-4.bin
+#  Version: 10.2.4.45
+# -Licence: ath10k/QCA988X/hw2.0/notice_ath10k_firmware-4.txt
+# +File: ath10k/QCA988X/hw2.0/notice_ath10k_firmware-4.txt
+#  File: ath10k/QCA988X/hw2.0/firmware-5.bin
+#  Version: 10.2.4-1.0-00047
+# -Licence: ath10k/QCA988X/hw2.0/notice_ath10k_firmware-5.txt
+# +File: ath10k/QCA988X/hw2.0/notice_ath10k_firmware-5.txt
+#  File: ath10k/QCA6174/hw2.1/board.bin
+#  File: ath10k/QCA6174/hw2.1/board-2.bin
+#  File: ath10k/QCA6174/hw2.1/firmware-5.bin
+#  Version: SW_RM.1.1.1-00157-QCARMSWPZ-1
+# -Licence: ath10k/QCA6174/hw2.1/notice_ath10k_firmware-5.txt
+# +File: ath10k/QCA6174/hw2.1/notice_ath10k_firmware-5.txt
+#  File: ath10k/QCA6174/hw3.0/board.bin
+#  File: ath10k/QCA6174/hw3.0/board-2.bin
+#  File: ath10k/QCA6174/hw3.0/firmware-4.bin
+#  Version: WLAN.RM.2.0-00180-QCARMSWPZ-1
+# -Licence: ath10k/QCA6174/hw3.0/notice_ath10k_firmware-4.txt
+# +File: ath10k/QCA6174/hw3.0/notice_ath10k_firmware-4.txt
+#  File: ath10k/QCA6174/hw3.0/firmware-6.bin
+#  Version: WLAN.RM.4.4.1-00157-QCARMSWPZ-1
+# -Licence: ath10k/QCA6174/hw3.0/notice_ath10k_firmware-6.txt
+# +File: ath10k/QCA6174/hw3.0/notice_ath10k_firmware-6.txt
+#  File: ath10k/QCA6174/hw3.0/firmware-sdio-6.bin
+#  Version: WLAN.RMH.4.4.1-00077
+# -Licence: ath10k/QCA6174/hw3.0/notice_ath10k_firmware-sdio-6.txt
+# +File: ath10k/QCA6174/hw3.0/notice_ath10k_firmware-sdio-6.txt
+#  File: ath10k/QCA9377/hw1.0/board.bin
+#  File: ath10k/QCA9377/hw1.0/board-2.bin
+#  File: ath10k/QCA9377/hw1.0/firmware-5.bin
+#  Version: WLAN.TF.1.0-00002-QCATFSWPZ-5
+# -Licence: ath10k/QCA9377/hw1.0/notice_ath10k_firmware-5.txt
+# +File: ath10k/QCA9377/hw1.0/notice_ath10k_firmware-5.txt
+#  File: ath10k/QCA9377/hw1.0/firmware-sdio-5.bin
+#  Version: WLAN.TF.1.1.1-00061-QCATFSWPZ-1
+# -Licence: ath10k/QCA9377/hw1.0/notice_ath10k_firmware-sdio-5.txt
+# +File: ath10k/QCA9377/hw1.0/notice_ath10k_firmware-sdio-5.txt
+#  File: ath10k/QCA99X0/hw2.0/board.bin
+#  File: ath10k/QCA99X0/hw2.0/firmware-5.bin
+#  Version: 10.4.1.00030-1
+# -Licence: ath10k/QCA99X0/hw2.0/notice_ath10k_firmware-5.txt
+# +File: ath10k/QCA99X0/hw2.0/notice_ath10k_firmware-5.txt
+#  File: ath10k/QCA4019/hw1.0/board-2.bin
+#  File: ath10k/QCA4019/hw1.0/firmware-5.bin
+#  Version: 10.4-3.6-00140
+# -Licence: ath10k/QCA4019/hw1.0/notice_ath10k_firmware-5.txt
+# +File: ath10k/QCA4019/hw1.0/notice_ath10k_firmware-5.txt
+#  File: ath10k/QCA9887/hw1.0/board.bin
+#  File: ath10k/QCA9887/hw1.0/firmware-5.bin
+#  Version: 10.2.4-1.0-00047
+# -Licence: ath10k/QCA9887/hw1.0/notice_ath10k_firmware-5.txt
+# +File: ath10k/QCA9887/hw1.0/notice_ath10k_firmware-5.txt
+#  File: ath10k/QCA9888/hw2.0/board-2.bin
+#  File: ath10k/QCA9888/hw2.0/firmware-5.bin
+#  Version: 10.4-3.9.0.2-00131
+# -Licence: ath10k/QCA9888/hw2.0/notice_ath10k_firmware-5.txt
+# +File: ath10k/QCA9888/hw2.0/notice_ath10k_firmware-5.txt
+#  File: ath10k/QCA9984/hw1.0/board-2.bin
+#  File: ath10k/QCA9984/hw1.0/firmware-5.bin
+#  Version: 10.4-3.9.0.2-00131
+# -Licence: ath10k/QCA9984/hw1.0/notice_ath10k_firmware-5.txt
+# +File: ath10k/QCA9984/hw1.0/notice_ath10k_firmware-5.txt
+#  File: ath10k/QCA9377/hw1.0/firmware-6.bin
+#  Version: WLAN.TF.2.1-00021-QCARMSWP-1
+# -Licence: ath10k/QCA9377/hw1.0/notice_ath10k_firmware-6.txt
+# +File: ath10k/QCA9377/hw1.0/notice_ath10k_firmware-6.txt
+#  File: ath10k/WCN3990/hw1.0/firmware-5.bin
+#  File: ath10k/WCN3990/hw1.0/wlanmdsp.mbn
+#  Link: qcom/sdm845/wlanmdsp.mbn -> ../../ath10k/WCN3990/hw1.0/wlanmdsp.mbn
+#  Version: WLAN.HL.2.0-01387-QCAHLSWMTPLZ-1
+# -Licence: ath10k/WCN3990/hw1.0/notice.txt_wlanmdsp
+# +File: ath10k/WCN3990/hw1.0/notice.txt_wlanmdsp
+#  
+#  Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k for details
+#  
+# @@ -3629,7 +3684,7 @@
+#  File: ath11k/IPQ6018/hw1.0/q6_fw.flist
+#  File: ath11k/IPQ6018/hw1.0/q6_fw.mdt
+#  Version: WLAN.HK.2.1.0.1-01238-QCAHKSWPL_SILICONZ-2
+# -Licence: ath11k/IPQ6018/hw1.0/Notice.txt
+# +File: ath11k/IPQ6018/hw1.0/Notice.txt
+#  File: ath11k/IPQ8074/hw2.0/board-2.bin
+#  File: ath11k/IPQ8074/hw2.0/m3_fw.b00
+#  File: ath11k/IPQ8074/hw2.0/m3_fw.b01
+# @@ -3647,12 +3702,22 @@
+#  File: ath11k/IPQ8074/hw2.0/q6_fw.flist
+#  File: ath11k/IPQ8074/hw2.0/q6_fw.mdt
+#  Version: WLAN.HK.2.1.0.1-01238-QCAHKSWPL_SILICONZ-2
+# -Licence: ath11k/IPQ8074/hw2.0/Notice.txt
+# +File: ath11k/IPQ8074/hw2.0/Notice.txt
+#  File: ath11k/QCA6390/hw2.0/board-2.bin
+#  File: ath11k/QCA6390/hw2.0/amss.bin
+#  File: ath11k/QCA6390/hw2.0/m3.bin
+#  Version: WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
+# -Licence: ath11k/QCA6390/hw2.0/Notice.txt
+# +File: ath11k/QCA6390/hw2.0/Notice.txt
+# +File: ath11k/WCN6855/hw2.0/board-2.bin
+# +File: ath11k/WCN6855/hw2.0/regdb.bin
+# +File: ath11k/WCN6855/hw2.0/amss.bin
+# +File: ath11k/WCN6855/hw2.0/m3.bin
+# +Version: WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
+# +File: ath11k/WCN6855/hw2.0/Notice.txt
+# +Link: ath11k/WCN6855/hw2.1/board-2.bin -> ../hw2.0/board-2.bin
+# +Link: ath11k/WCN6855/hw2.1/regdb.bin -> ../hw2.0/regdb.bin
+# +Link: ath11k/WCN6855/hw2.1/amss.bin -> ../hw2.0/amss.bin
+# +Link: ath11k/WCN6855/hw2.1/m3.bin -> ../hw2.0/m3.bin
+#  
+#  Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k for details
+#  
+# @@ -3810,23 +3875,23 @@
+#  File: intel/ibt-hw-37.8.10-fw-1.10.3.11.e.bseq
+#  Version: BT_StonePeak_D0_REL_50_0002
+#  File: intel/ibt-hw-37.8.10-fw-22.50.19.14.f.bseq
+# -Version: BT_StonePeak_D1_REL_66_1167
+# +Version: BT_StonePeak_D1_REL_67_1278
+#  File: intel/ibt-11-5.ddc
+# -Version: LnP/SfP_REL0522
+# +Version: LnP/SfP_REL1294
+#  File: intel/ibt-11-5.sfi
+#  Version: BT_LightningPeak_REL0487
+#  File: intel/ibt-12-16.ddc
+# -Version: BT_WindStormPeak_REL1236
+# +Version: BT_WindStormPeak_REL1299
+#  File: intel/ibt-12-16.sfi
+# -Version: BT_WindStormPeak_REL1236
+# +Version: BT_WindStormPeak_REL1299
+#  File: intel/ibt-17-16-1.sfi
+# -Version: BT_JeffersonPeak_B0_B0_REL20054
+# +Version: BT_JeffersonPeak_B0_B0_REL20142
+#  File: intel/ibt-17-16-1.ddc
+# -Version: BT_JeffersonPeak_B0_B0_REL20054
+# +Version: BT_JeffersonPeak_B0_B0_REL20142
+#  File: intel/ibt-17-2.sfi
+# -Version: BT_JeffersonPeak_B0_B0_REL20054
+# +Version: BT_JeffersonPeak_B0_B0_REL20142
+#  File: intel/ibt-17-2.ddc
+# -Version: BT_JeffersonPeak_B0_B0_REL20054
+# +Version: BT_JeffersonPeak_B0_B0_REL20142
+#  File: intel/ibt-17-0-1.sfi
+#  Version: BT_JeffersonPeak_A0_B0_REL0201
+#  File: intel/ibt-17-0-1.ddc
+# @@ -3836,13 +3901,13 @@
+#  File: intel/ibt-17-1.ddc
+#  Version: BT_JeffersonPeak_A0_B0_REL0201
+#  File: intel/ibt-18-16-1.sfi
+# -Version: BT_ThunderPeak_B0_B0_REL20054
+# +Version: BT_ThunderPeak_B0_B0_REL20142
+#  File: intel/ibt-18-16-1.ddc
+# -Version: BT_ThunderPeak_B0_B0_REL20054
+# +Version: BT_ThunderPeak_B0_B0_REL20142
+#  File: intel/ibt-18-2.sfi
+# -Version: BT_ThunderPeak_B0_B0_REL20054
+# +Version: BT_ThunderPeak_B0_B0_REL20142
+#  File: intel/ibt-18-2.ddc
+# -Version: BT_ThunderPeak_B0_B0_REL20054
+# +Version: BT_ThunderPeak_B0_B0_REL20142
+#  File: intel/ibt-18-0-1.sfi
+#  Version: BT_ThunderPeak_A0_B0_REL0201
+#  File: intel/ibt-18-0-1.ddc
+# @@ -3852,92 +3917,92 @@
+#  File: intel/ibt-18-1.ddc
+#  Version: BT_ThunderPeak_A0_B0_REL0201
+#  File:intel/ibt-20-0-3.sfi
+# -Version: BT_CyclonePeak_A0_REL35819
+# +Version: BT_CyclonePeak_A0_REL37758
+#  File:intel/ibt-20-0-3.ddc
+# -Version: BT_CyclonePeak_A0_REL35819
+# +Version: BT_CyclonePeak_A0_REL37758
+#  File:intel/ibt-20-1-3.sfi
+# -Version: BT_CyclonePeak_A0_REL35819
+# +Version: BT_CyclonePeak_A0_REL37758
+#  File:intel/ibt-20-1-3.ddc
+# -Version: BT_CyclonePeak_A0_REL35819
+# +Version: BT_CyclonePeak_A0_REL37758
+#  File:intel/ibt-20-1-4.sfi
+# -Version: BT_CyclonePeak_A0_REL35819
+# +Version: BT_CyclonePeak_A0_REL37758
+#  File:intel/ibt-20-1-4.ddc
+# -Version: BT_CyclonePeak_A0_REL35819
+# +Version: BT_CyclonePeak_A0_REL37758
+#  File:intel/ibt-19-0-0.sfi
+# -Version: BT_Quasar_REL35819
+# +Version: BT_Quasar_REL37758
+#  File:intel/ibt-19-0-0.ddc
+# -Version: BT_Quasar_REL35819
+# +Version: BT_Quasar_REL37758
+#  File:intel/ibt-19-0-1.sfi
+# -Version: BT_Quasar_REL35819
+# +Version: BT_Quasar_REL37758
+#  File:intel/ibt-19-0-1.ddc
+# -Version: BT_Quasar_REL35819
+# +Version: BT_Quasar_REL37758
+#  File:intel/ibt-19-0-4.sfi
+# -Version: BT_HarrisonPeak_REL35819
+# +Version: BT_HarrisonPeak_REL37758
+#  File:intel/ibt-19-0-4.ddc
+# -Version: BT_HarrisonPeak_REL35819
+# +Version: BT_HarrisonPeak_REL37758
+#  File:intel/ibt-19-16-4.sfi
+# -Version: BT_HarrisonPeak_REL35819
+# +Version: BT_HarrisonPeak_REL37758
+#  File:intel/ibt-19-16-4.ddc
+# -Version: BT_HarrisonPeak_REL35819
+# +Version: BT_HarrisonPeak_REL37758
+#  File:intel/ibt-19-32-1.sfi
+# -Version: BT_HarrisonPeak_REL35819
+# +Version: BT_HarrisonPeak_REL37758
+#  File:intel/ibt-19-32-1.ddc
+# -Version: BT_HarrisonPeak_REL35819
+# +Version: BT_HarrisonPeak_REL37758
+#  File:intel/ibt-19-32-0.sfi
+# -Version: BT_HarrisonPeak_REL35819
+# +Version: BT_HarrisonPeak_REL37758
+#  File:intel/ibt-19-32-0.ddc
+# -Version: BT_HarrisonPeak_REL35819
+# +Version: BT_HarrisonPeak_REL37758
+#  File:intel/ibt-19-32-4.sfi
+# -Version: BT_HarrisonPeak_REL35819
+# +Version: BT_HarrisonPeak_REL37758
+#  File:intel/ibt-19-32-4.ddc
+# -Version: BT_HarrisonPeak_REL35819
+# +Version: BT_HarrisonPeak_REL37758
+#  File:intel/ibt-19-240-1.sfi
+# -Version: BT_HarrisonPeak_REL35819
+# +Version: BT_HarrisonPeak_REL37758
+#  File:intel/ibt-19-240-1.ddc
+# -Version: BT_HarrisonPeak_REL35819
+# +Version: BT_HarrisonPeak_REL37758
+#  File:intel/ibt-19-240-4.sfi
+# -Version: BT_HarrisonPeak_REL35819
+# +Version: BT_HarrisonPeak_REL37758
+#  File:intel/ibt-19-240-4.ddc
+# -Version: BT_HarrisonPeak_REL35819
+# +Version: BT_HarrisonPeak_REL37758
+#  File:intel/ibt-0041-0041.sfi
+# -Version: BT_TyphoonPeak_REL36030
+# +Version: BT_TyphoonPeak_REL38020
+#  File:intel/ibt-0041-0041.ddc
+# -Version: BT_TyphoonPeak_REL36030
+# +Version: BT_TyphoonPeak_REL38020
+#  File:intel/ibt-0040-0041.sfi
+# -Version: BT_Solar_GfP2_REL36030
+# +Version: BT_Solar_GfP2_REL38020
+#  File:intel/ibt-0040-0041.ddc
+# -Version: BT_Solar_GfP2_REL36030
+# +Version: BT_Solar_GfP2_REL38020
+#  File:intel/ibt-1040-0041.sfi
+# -Version: BT_SolarF_GfP2_REL36030
+# +Version: BT_SolarF_GfP2_REL38020
+#  File:intel/ibt-1040-0041.ddc
+# -Version: BT_SolarF_GfP2_REL36030
+# +Version: BT_SolarF_GfP2_REL38020
+#  
+#  File:intel/ibt-0040-1020.sfi
+# -Version: BT_Solar_JfP1_REL36030
+# +Version: BT_Solar_JfP1_REL38020
+#  File:intel/ibt-0040-1020.ddc
+# -Version: BT_Solar_JfP1_REL36030
+# +Version: BT_Solar_JfP1_REL38020
+#  File:intel/ibt-1040-1020.sfi
+# -Version: BT_SolarF_JfP1_REL36030
+# +Version: BT_SolarF_JfP1_REL38020
+#  File:intel/ibt-1040-1020.ddc
+# -Version: BT_SolarF_JfP1_REL36030
+# +Version: BT_SolarF_JfP1_REL38020
+#  
+#  File:intel/ibt-0040-2120.sfi
+# -Version: BT_Solar_JfP2_REL36030
+# +Version: BT_Solar_JfP2_REL38020
+#  File:intel/ibt-0040-2120.ddc
+# -Version: BT_Solar_JfP2_REL36030
+# +Version: BT_Solar_JfP2_REL38020
+#  File:intel/ibt-1040-2120.sfi
+# -Version: BT_SolarF_JfP2_REL36030
+# +Version: BT_SolarF_JfP2_REL38020
+#  File:intel/ibt-1040-2120.ddc
+# -Version: BT_SolarF_JfP2_REL36030
+# +Version: BT_SolarF_JfP2_REL38020
+#  
+#  File:intel/ibt-0040-4150.sfi
+# -Version: BT_Solar_HrP2_REL36030
+# +Version: BT_Solar_HrP2_REL38020
+#  File:intel/ibt-0040-4150.ddc
+# -Version: BT_Solar_HrP2_REL36030
+# +Version: BT_Solar_HrP2_REL38020
+#  File:intel/ibt-1040-4150.sfi
+# -Version: BT_SolarF_HrP2_REL36030
+# +Version: BT_SolarF_HrP2_REL38020
+#  File:intel/ibt-1040-4150.ddc
+# -Version: BT_SolarF_HrP2_REL36030
+# +Version: BT_SolarF_HrP2_REL38020
+#  
+#  Licence: Redistributable. See LICENCE.ibt_firmware for details
+#  
+# @@ -4046,11 +4111,11 @@
+#  Driver: ccp - Platform Security Processor (PSP) device
+#  
+#  File: amd/amd_sev_fam17h_model0xh.sbin
+# -Version: 2021-9-10
+# +Version: 2022-2-25
+#  File: amd/amd_sev_fam17h_model3xh.sbin
+# -Version: 2021-9-10
+# +Version: 2022-2-25
+#  File: amd/amd_sev_fam19h_model0xh.sbin
+# -Version: 2021-9-10
+# +Version: 2022-2-25
+#  
+#  License: Redistributable. See LICENSE.amd-sev for details
+#  
+# @@ -4067,7 +4132,7 @@
+#  File: amd-ucode/microcode_amd_fam17h.bin
+#  Version: 2019-12-18
+#  File: amd-ucode/microcode_amd_fam19h.bin
+# -Version: 2021-11-15
+# +Version: 2022-02-14
+#  
+#  License: Redistributable. See LICENSE.amd-ucode for details
+#  
+# @@ -5307,7 +5372,7 @@
+#  
+#  --------------------------------------------------------------------------
+#  
+# -Driver: mt7915e - MediaTek Wireless MACs for MT7915/MT7916
+# +Driver: mt7915e - MediaTek Wireless MACs for MT7915/MT7916/MT7986
+#  
+#  File: mediatek/mt7915_wm.bin
+#  Version: 20211222184052
+# @@ -5329,6 +5394,25 @@
+#  File: mediatek/mt7916_eeprom.bin
+#  Version: 20211130
+#  
+# +File: mediatek/mt7986_wm.bin
+# +Version: 20220113162641
+# +File: mediatek/mt7986_wm_mt7975.bin
+# +Version: 20220113162756
+# +File: mediatek/mt7986_wa.bin
+# +Version: 20220113163034
+# +File: mediatek/mt7986_rom_patch.bin
+# +Version: 20220113162543a
+# +File: mediatek/mt7986_rom_patch_mt7975.bin
+# +Version: 20220113162701a
+# +File: mediatek/mt7986_eeprom_mt7976.bin
+# +Version: 20211105
+# +File: mediatek/mt7986_eeprom_mt7976_dbdc.bin
+# +Version: 20220223
+# +File: mediatek/mt7986_eeprom_mt7976_dual.bin
+# +Version: 20211115
+# +File: mediatek/mt7986_eeprom_mt7975_dual.bin
+# +Version: 20220208
+# +
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+#  --------------------------------------------------------------------------
+# @@ -5336,9 +5420,9 @@
+#  Driver: mt7921 - MediaTek MT7921 Wireless MACs
+#  
+#  File: mediatek/WIFI_MT7961_patch_mcu_1_2_hdr.bin
+# -Version: 20220110230855a
+# +Version: 20220209150832a
+#  File: mediatek/WIFI_RAM_CODE_MT7961_1.bin
+# -Version: 20220110230951
+# +Version: 20220209150915
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -5347,7 +5431,7 @@
+#  Driver: mt7921 - MediaTek MT7921 bluetooth chipset
+#  
+#  File: mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin
+# -Version: 20220110231230
+# +Version: 20220209151054
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -5690,6 +5774,9 @@
+#  File: mellanox/mlxsw_spectrum-13.2010.1232.mfa2
+#  File: mellanox/mlxsw_spectrum2-29.2010.1232.mfa2
+#  File: mellanox/mlxsw_spectrum3-30.2010.1232.mfa2
+# +File: mellanox/mlxsw_spectrum-13.2010.1406.mfa2
+# +File: mellanox/mlxsw_spectrum2-29.2010.1406.mfa2
+# +File: mellanox/mlxsw_spectrum3-30.2010.1406.mfa2
+#  
+#  Licence:
+#   Copyright (c) 2017-2020 Mellanox Technologies, Ltd. All rights reserved.
+# @@ -5834,11 +5921,21 @@
+#  
+#  Driver: wfx - Silicon Labs Wi-Fi Transceiver
+#  
+# -File: silabs/wfm_wf200_C0.sec
+# -Version: 3.12.1
+# -
+# -Licence: Redistributable. See silabs/LICENCE.wf200 for details.
+# -Originates from https://github.com/SiliconLabs/wfx-firmware
+# +File: wfx/wfm_wf200_C0.sec
+# +Version: 3.14
+# +
+# +File: wfx/brd4001a.pds not listed in WHENCE
+# +File: wfx/brd8022a.pds not listed in WHENCE
+# +File: wfx/brd8023a.pds not listed in WHENCE
+# +
+# +Licence: Redistributable. See wfx/LICENCE.wf200 for details.
+# +
+# +The firmware itself originates from https://github.com/SiliconLabs/wfx-firmware
+# +
+# +The *.pds files come from https://github.com/SiliconLabs/wfx-pds
+# +
+# +They have been processed with the tool "pds_compress" available on
+# +https://github.com/SiliconLabs/wfx-linux-tools
+#  
+#  --------------------------------------------------------------------------
+#  
+# 
+#
+
 SUMMARY = "Firmware files for use with Linux kernel"
 HOMEPAGE = "https://www.kernel.org/"
 DESCRIPTION = "Linux firmware is a package distributed alongside the Linux kernel \
@@ -72,7 +594,7 @@ LICENSE = "\
 LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.adsp_sst;md5=615c45b91a5a4a9fe046d6ab9a2df728 \
                     file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31 \
-                    file://LICENSE.amdgpu;md5=d357524f5099e2a3db3c1838921c593f \
+                    file://LICENSE.amdgpu;md5=44c1166d052226cb2d6c8d7400090203 \
                     file://LICENSE.amd-ucode;md5=3c5399dc9148d7f0e1f41e34b69cf14f \
                     file://LICENSE.amlogic_vdec;md5=dc44f59bf64a81643e500ad3f39a468a \
                     file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13 \
@@ -132,7 +654,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=ed3d7426e4df06fbadcca24ebf00cc5f \
+                    file://WHENCE;md5=45a9c4a92d152e9495db81e1192f2bdc \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -205,7 +727,7 @@ PE = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "e2e46fa618414952bbf2f6920cd3abcddbef45bfb7d1352994b4bfc35394d177"
+SRC_URI[sha256sum] = "5938ee717b2023b48f6bfcf344b40ddc947e3e22c0bc36d4c3418f90fea68182"
 
 inherit allarch
 
-- 
2.27.0


--===============2072305231249380969==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/linux-firmware: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware: SRC_URI changed from "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20220209.tar.xz" to "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20220310.tar.xz"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PKGSIZE changed from 13766348 to 14337032 (+4%)
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: FILELIST: added "/lib/firmware/ath10k/QCA6174/hw2.1/notice_ath10k_firmware-5.txt /lib/firmware/ath10k/QCA4019/hw1.0/notice_ath10k_firmware-5.txt /lib/firmware/ath10k/QCA9377/hw1.0/notice_ath10k_firmware-5.txt /lib/firmware/ath10k/QCA9888/hw2.0/notice_ath10k_firmware-5.txt /lib/firmware/ath10k/QCA9984/hw1.0/notice_ath10k_firmware-5.txt /lib/firmware/ath10k/WCN3990/hw1.0/notice.txt_wlanmdsp /lib/firmware/ath10k/QCA988X/hw2.0/notice_ath10k_firmware-4.txt /lib/firmware/ath10k/QCA6174/hw3.0/notice_ath10k_firmware-4.txt /lib/firmware/ath10k/QCA9377/hw1.0/notice_ath10k_firmware-6.txt /lib/firmware/ath10k/QCA99X0/hw2.0/notice_ath10k_firmware-5.txt /lib/firmware/ath10k/QCA6174/hw3.0/notice_ath10k_firmware-sdio-6.txt /lib/firmware/ath10k/QCA9887/hw1.0/notice_ath10k_firmware-5.txt /lib/firmware/ath10k/QCA988X/hw2.0/notice_ath10k_firmware-5.txt /lib/firmware/ath10k/QCA6174/hw3.0/notice_ath10k_firmware-6.txt /lib/firmware/ath10k/QCA937
 7/hw1.0/notice_ath10k_firmware-sdio-5.txt"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PKGSIZE changed from 14412313 to 21312166 (+48%)
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: FILELIST: added "/lib/firmware/ath11k/WCN6855/hw2.0/m3.bin /lib/firmware/ath11k/WCN6855/hw2.0/regdb.bin /lib/firmware/ath11k/QCA6390/hw2.0/Notice.txt /lib/firmware/ath11k/WCN6855/hw2.0/Notice.txt /lib/firmware/ath11k/WCN6855/hw2.1/m3.bin /lib/firmware/ath11k/WCN6855/hw2.1/amss.bin /lib/firmware/ath11k/IPQ6018/hw1.0/Notice.txt /lib/firmware/ath11k/WCN6855/hw2.1/regdb.bin /lib/firmware/ath11k/WCN6855/hw2.0/board-2.bin /lib/firmware/ath11k/WCN6855/hw2.0/amss.bin /lib/firmware/ath11k/WCN6855/hw2.1/board-2.bin /lib/firmware/ath11k/IPQ8074/hw2.0/Notice.txt"
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2-mips: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2-mips: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-gplv2-license: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-gplv2-license: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PKGSIZE changed from 588214 to 586934 (-0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PKGSIZE changed from 583990 to 584106 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PKGSIZE changed from 2389931 to 2396855 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PKGSIZE changed from 117264 to 117340 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGSIZE changed from 16373216 to 16417104 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PKGSIZE changed from 14515016 to 14515680 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PKGSIZE changed from 126628096 to 143367116 (+13%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: FILELIST: added "/lib/firmware/iwlwifi-ty-a0-gf-a0-71.ucode /lib/firmware/iwlwifi-so-a0-gf-a0-71.ucode /lib/firmware/iwlwifi-Qu-c0-jf-b0-71.ucode /lib/firmware/iwlwifi-so-a0-jf-b0-71.ucode /lib/firmware/iwlwifi-QuZ-a0-jf-b0-71.ucode /lib/firmware/iwlwifi-QuZ-a0-hr-b0-71.ucode /lib/firmware/iwlwifi-cc-a0-71.ucode /lib/firmware/iwlwifi-Qu-c0-hr-b0-71.ucode /lib/firmware/iwlwifi-so-a0-hr-b0-71.ucode /lib/firmware/iwlwifi-so-a0-gf4-a0-71.ucode /lib/firmware/iwlwifi-Qu-b0-hr-b0-71.ucode /lib/firmware/iwlwifi-Qu-b0-jf-b0-71.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-license: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u-license: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u-license: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-src: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-src: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGSIZE changed from 185302 to 188043 (+1%)
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware: PKGSIZE changed from 269168662 to 282387182 (+5%)
packages/all-poky-linux/linux-firmware/linux-firmware: PV changed from "20220209" to "20220310"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGV changed from 20220209 [default] to 20220310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: directory renamed /lib/firmware/silabs -> /lib/firmware/wfx, added "/lib/firmware/amdgpu/aldebaran_smc.bin /lib/firmware/amdgpu/aldebaran_ta.bin /lib/firmware/amdgpu/aldebaran_sdma.bin /lib/firmware/amdgpu/gc_10_3_7_me.bin /lib/firmware/mediatek/mt7986_rom_patch.bin /lib/firmware/amdgpu/gc_10_3_7_mec.bin /lib/firmware/amdgpu/aldebaran_vcn.bin /lib/firmware/amdgpu/sdma_5_2_7.bin /lib/firmware/amdgpu/gc_10_3_7_mec2.bin /lib/firmware/amdgpu/aldebaran_mec2.bin /lib/firmware/mediatek/mt7986_eeprom_mt7976.bin /lib/firmware/amdgpu/gc_10_3_7_ce.bin /lib/firmware/mediatek/mt7986_wa.bin /lib/firmware/amdgpu/aldebaran_rlc.bin /lib/firmware/mediatek/mt7986_eeprom_mt7976_dbdc.bin /lib/firmware/mellanox/mlxsw_spectrum2-29.2010.1406.mfa2 /lib/firmware/mediatek/mt7986_wm_mt7975.bin /lib/firmware/amdgpu/aldebaran_mec.bin /lib/firmware/mellanox/mlxsw_spectrum3-30.2010.1406.mfa2 /lib/firmware/amdgpu/gc_10_3_7_rlc.bin /lib/firmware/amdgpu/
 psp_13_0_8_ta.bin /lib/firmware/mediatek/mt7986_eeprom_mt7975_dual.bin /lib/firmware/amdgpu/psp_13_0_8_toc.bin /lib/firmware/amdgpu/psp_13_0_8_asd.bin /lib/firmware/amdgpu/gc_10_3_7_pfp.bin /lib/firmware/mediatek/mt7986_eeprom_mt7976_dual.bin /lib/firmware/mediatek/mt7986_rom_patch_mt7975.bin /lib/firmware/mellanox/mlxsw_spectrum-13.2010.1406.mfa2 /lib/firmware/mediatek/mt7986_wm.bin /lib/firmware/amdgpu/aldebaran_sos.bin /lib/firmware/amdgpu/dcn_3_1_6_dmcub.bin"
Changes to packages/all-poky-linux/linux-firmware (sysroot):
  /lib/firmware/amdgpu/aldebaran_mec2.bin was added
  /lib/firmware/amdgpu/aldebaran_mec.bin was added
  /lib/firmware/amdgpu/aldebaran_rlc.bin was added
  /lib/firmware/amdgpu/aldebaran_sdma.bin was added
  /lib/firmware/amdgpu/aldebaran_smc.bin was added
  /lib/firmware/amdgpu/aldebaran_sos.bin was added
  /lib/firmware/amdgpu/aldebaran_ta.bin was added
  /lib/firmware/amdgpu/aldebaran_vcn.bin was added
  /lib/firmware/amdgpu/dcn_3_1_6_dmcub.bin was added
  /lib/firmware/amdgpu/gc_10_3_7_ce.bin was added
  /lib/firmware/amdgpu/gc_10_3_7_me.bin was added
  /lib/firmware/amdgpu/gc_10_3_7_mec2.bin was added
  /lib/firmware/amdgpu/gc_10_3_7_mec.bin was added
  /lib/firmware/amdgpu/gc_10_3_7_pfp.bin was added
  /lib/firmware/amdgpu/gc_10_3_7_rlc.bin was added
  /lib/firmware/amdgpu/psp_13_0_8_asd.bin was added
  /lib/firmware/amdgpu/psp_13_0_8_ta.bin was added
  /lib/firmware/amdgpu/psp_13_0_8_toc.bin was added
  /lib/firmware/amdgpu/sdma_5_2_7.bin was added
  /lib/firmware/ath10k/QCA4019/hw1.0/notice_ath10k_firmware-5.txt was added
  /lib/firmware/ath10k/QCA6174/hw2.1/notice_ath10k_firmware-5.txt was added
  /lib/firmware/ath10k/QCA6174/hw3.0/notice_ath10k_firmware-4.txt was added
  /lib/firmware/ath10k/QCA6174/hw3.0/notice_ath10k_firmware-6.txt was added
  /lib/firmware/ath10k/QCA6174/hw3.0/notice_ath10k_firmware-sdio-6.txt was added
  /lib/firmware/ath10k/QCA9377/hw1.0/notice_ath10k_firmware-5.txt was added
  /lib/firmware/ath10k/QCA9377/hw1.0/notice_ath10k_firmware-6.txt was added
  /lib/firmware/ath10k/QCA9377/hw1.0/notice_ath10k_firmware-sdio-5.txt was added
  /lib/firmware/ath10k/QCA9887/hw1.0/notice_ath10k_firmware-5.txt was added
  /lib/firmware/ath10k/QCA9888/hw2.0/notice_ath10k_firmware-5.txt was added
  /lib/firmware/ath10k/QCA988X/hw2.0/notice_ath10k_firmware-4.txt was added
  /lib/firmware/ath10k/QCA988X/hw2.0/notice_ath10k_firmware-5.txt was added
  /lib/firmware/ath10k/QCA9984/hw1.0/notice_ath10k_firmware-5.txt was added
  /lib/firmware/ath10k/QCA99X0/hw2.0/notice_ath10k_firmware-5.txt was added
  /lib/firmware/ath10k/WCN3990/hw1.0/notice.txt_wlanmdsp was added
  /lib/firmware/ath11k/IPQ6018/hw1.0/Notice.txt was added
  /lib/firmware/ath11k/IPQ8074/hw2.0/Notice.txt was added
  /lib/firmware/ath11k/QCA6390/hw2.0/Notice.txt was added
  /lib/firmware/ath11k/WCN6855 was added
  /lib/firmware/ath11k/WCN6855/hw2.0 was added
  /lib/firmware/ath11k/WCN6855/hw2.0/amss.bin was added
  /lib/firmware/ath11k/WCN6855/hw2.0/board-2.bin was added
  /lib/firmware/ath11k/WCN6855/hw2.0/m3.bin was added
  /lib/firmware/ath11k/WCN6855/hw2.0/Notice.txt was added
  /lib/firmware/ath11k/WCN6855/hw2.0/regdb.bin was added
  /lib/firmware/ath11k/WCN6855/hw2.1 was added
  /lib/firmware/ath11k/WCN6855/hw2.1/amss.bin was added
  /lib/firmware/ath11k/WCN6855/hw2.1/board-2.bin was added
  /lib/firmware/ath11k/WCN6855/hw2.1/m3.bin was added
  /lib/firmware/ath11k/WCN6855/hw2.1/regdb.bin was added
  /lib/firmware/iwlwifi-cc-a0-71.ucode was added
  /lib/firmware/iwlwifi-Qu-b0-hr-b0-71.ucode was added
  /lib/firmware/iwlwifi-Qu-b0-jf-b0-71.ucode was added
  /lib/firmware/iwlwifi-Qu-c0-hr-b0-71.ucode was added
  /lib/firmware/iwlwifi-Qu-c0-jf-b0-71.ucode was added
  /lib/firmware/iwlwifi-QuZ-a0-hr-b0-71.ucode was added
  /lib/firmware/iwlwifi-QuZ-a0-jf-b0-71.ucode was added
  /lib/firmware/iwlwifi-so-a0-gf4-a0-71.ucode was added
  /lib/firmware/iwlwifi-so-a0-gf-a0-71.ucode was added
  /lib/firmware/iwlwifi-so-a0-hr-b0-71.ucode was added
  /lib/firmware/iwlwifi-so-a0-jf-b0-71.ucode was added
  /lib/firmware/iwlwifi-ty-a0-gf-a0-71.ucode was added
  /lib/firmware/mediatek/mt7986_eeprom_mt7975_dual.bin was added
  /lib/firmware/mediatek/mt7986_eeprom_mt7976.bin was added
  /lib/firmware/mediatek/mt7986_eeprom_mt7976_dbdc.bin was added
  /lib/firmware/mediatek/mt7986_eeprom_mt7976_dual.bin was added
  /lib/firmware/mediatek/mt7986_rom_patch.bin was added
  /lib/firmware/mediatek/mt7986_rom_patch_mt7975.bin was added
  /lib/firmware/mediatek/mt7986_wa.bin was added
  /lib/firmware/mediatek/mt7986_wm.bin was added
  /lib/firmware/mediatek/mt7986_wm_mt7975.bin was added
  /lib/firmware/mellanox/mlxsw_spectrum-13.2010.1406.mfa2 was added
  /lib/firmware/mellanox/mlxsw_spectrum2-29.2010.1406.mfa2 was added
  /lib/firmware/mellanox/mlxsw_spectrum3-30.2010.1406.mfa2 was added
  /lib/firmware/wfx was added
  /lib/firmware/wfx/wfm_wf200_C0.sec was added
  /lib/firmware/silabs was removed
  /lib/firmware/silabs/wfm_wf200_C0.sec was removed

--===============2072305231249380969==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: FILELIST: added "/lib/firmware/ath10k/WCN3990/hw1.0/notice.txt_wlanmdsp /lib/firmware/ath10k/QCA988X/hw2.0/notice_ath10k_firmware-4.txt /lib/firmware/ath10k/QCA6174/hw3.0/notice_ath10k_firmware-6.txt /lib/firmware/ath10k/QCA9377/hw1.0/notice_ath10k_firmware-6.txt /lib/firmware/ath10k/QCA9887/hw1.0/notice_ath10k_firmware-5.txt /lib/firmware/ath10k/QCA6174/hw3.0/notice_ath10k_firmware-4.txt /lib/firmware/ath10k/QCA9377/hw1.0/notice_ath10k_firmware-5.txt /lib/firmware/ath10k/QCA9377/hw1.0/notice_ath10k_firmware-sdio-5.txt /lib/firmware/ath10k/QCA6174/hw2.1/notice_ath10k_firmware-5.txt /lib/firmware/ath10k/QCA99X0/hw2.0/notice_ath10k_firmware-5.txt /lib/firmware/ath10k/QCA4019/hw1.0/notice_ath10k_firmware-5.txt /lib/firmware/ath10k/QCA6174/hw3.0/notice_ath10k_firmware-sdio-6.txt /lib/firmware/ath10k/QCA9984/hw1.0/notice_ath10k_firmware-5.txt /lib/firmware/ath10k/QCA9888/hw2.0/notice_ath10k_firmware-5.txt /lib/firmware/ath10k/Q
 CA988X/hw2.0/notice_ath10k_firmware-5.txt"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: FILELIST: added "/lib/firmware/ath11k/WCN6855/hw2.1/board-2.bin /lib/firmware/ath11k/WCN6855/hw2.1/regdb.bin /lib/firmware/ath11k/WCN6855/hw2.0/amss.bin /lib/firmware/ath11k/IPQ8074/hw2.0/Notice.txt /lib/firmware/ath11k/WCN6855/hw2.1/m3.bin /lib/firmware/ath11k/WCN6855/hw2.0/regdb.bin /lib/firmware/ath11k/IPQ6018/hw1.0/Notice.txt /lib/firmware/ath11k/WCN6855/hw2.0/m3.bin /lib/firmware/ath11k/WCN6855/hw2.0/board-2.bin /lib/firmware/ath11k/WCN6855/hw2.0/Notice.txt /lib/firmware/ath11k/WCN6855/hw2.1/amss.bin /lib/firmware/ath11k/QCA6390/hw2.0/Notice.txt"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PKGSIZE changed from 14412313 to 21312166 (+48%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: FILELIST: added "/lib/firmware/iwlwifi-so-a0-gf-a0-71.ucode /lib/firmware/iwlwifi-Qu-c0-jf-b0-71.ucode /lib/firmware/iwlwifi-so-a0-jf-b0-71.ucode /lib/firmware/iwlwifi-Qu-b0-jf-b0-71.ucode /lib/firmware/iwlwifi-so-a0-hr-b0-71.ucode /lib/firmware/iwlwifi-QuZ-a0-jf-b0-71.ucode /lib/firmware/iwlwifi-Qu-c0-hr-b0-71.ucode /lib/firmware/iwlwifi-ty-a0-gf-a0-71.ucode /lib/firmware/iwlwifi-Qu-b0-hr-b0-71.ucode /lib/firmware/iwlwifi-cc-a0-71.ucode /lib/firmware/iwlwifi-QuZ-a0-hr-b0-71.ucode /lib/firmware/iwlwifi-so-a0-gf4-a0-71.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PKGSIZE changed from 126628096 to 143367116 (+13%)
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: directory renamed /lib/firmware/silabs -> /lib/firmware/wfx, added "/lib/firmware/mellanox/mlxsw_spectrum3-30.2010.1406.mfa2 /lib/firmware/mediatek/mt7986_eeprom_mt7976_dbdc.bin /lib/firmware/amdgpu/aldebaran_mec.bin /lib/firmware/amdgpu/sdma_5_2_7.bin /lib/firmware/amdgpu/aldebaran_sos.bin /lib/firmware/mellanox/mlxsw_spectrum-13.2010.1406.mfa2 /lib/firmware/amdgpu/gc_10_3_7_mec.bin /lib/firmware/amdgpu/psp_13_0_8_toc.bin /lib/firmware/amdgpu/aldebaran_smc.bin /lib/firmware/amdgpu/psp_13_0_8_ta.bin /lib/firmware/amdgpu/dcn_3_1_6_dmcub.bin /lib/firmware/amdgpu/psp_13_0_8_asd.bin /lib/firmware/amdgpu/gc_10_3_7_pfp.bin /lib/firmware/mediatek/mt7986_eeprom_mt7975_dual.bin /lib/firmware/mediatek/mt7986_wm_mt7975.bin /lib/firmware/amdgpu/gc_10_3_7_me.bin /lib/firmware/amdgpu/gc_10_3_7_rlc.bin /lib/firmware/amdgpu/aldebaran_vcn.bin /lib/firmware/mediatek/mt7986_rom_patch.bin /lib/firmware/amdgpu/aldebaran_sdma.bin /lib/firmwa
 re/mediatek/mt7986_eeprom_mt7976_dual.bin /lib/firmware/amdgpu/gc_10_3_7_mec2.bin /lib/firmware/mediatek/mt7986_wa.bin /lib/firmware/amdgpu/aldebaran_ta.bin /lib/firmware/mediatek/mt7986_wm.bin /lib/firmware/mediatek/mt7986_rom_patch_mt7975.bin /lib/firmware/amdgpu/aldebaran_rlc.bin /lib/firmware/mediatek/mt7986_eeprom_mt7976.bin /lib/firmware/amdgpu/gc_10_3_7_ce.bin /lib/firmware/mellanox/mlxsw_spectrum2-29.2010.1406.mfa2 /lib/firmware/amdgpu/aldebaran_mec2.bin"
Changes to packages/all-poky-linux/linux-firmware (sysroot):
  /lib/firmware/amdgpu/aldebaran_mec2.bin was added
  /lib/firmware/amdgpu/aldebaran_mec.bin was added
  /lib/firmware/amdgpu/aldebaran_rlc.bin was added
  /lib/firmware/amdgpu/aldebaran_sdma.bin was added
  /lib/firmware/amdgpu/aldebaran_smc.bin was added
  /lib/firmware/amdgpu/aldebaran_sos.bin was added
  /lib/firmware/amdgpu/aldebaran_ta.bin was added
  /lib/firmware/amdgpu/aldebaran_vcn.bin was added
  /lib/firmware/amdgpu/dcn_3_1_6_dmcub.bin was added
  /lib/firmware/amdgpu/gc_10_3_7_ce.bin was added
  /lib/firmware/amdgpu/gc_10_3_7_me.bin was added
  /lib/firmware/amdgpu/gc_10_3_7_mec2.bin was added
  /lib/firmware/amdgpu/gc_10_3_7_mec.bin was added
  /lib/firmware/amdgpu/gc_10_3_7_pfp.bin was added
  /lib/firmware/amdgpu/gc_10_3_7_rlc.bin was added
  /lib/firmware/amdgpu/psp_13_0_8_asd.bin was added
  /lib/firmware/amdgpu/psp_13_0_8_ta.bin was added
  /lib/firmware/amdgpu/psp_13_0_8_toc.bin was added
  /lib/firmware/amdgpu/sdma_5_2_7.bin was added
  /lib/firmware/ath10k/QCA4019/hw1.0/notice_ath10k_firmware-5.txt was added
  /lib/firmware/ath10k/QCA6174/hw2.1/notice_ath10k_firmware-5.txt was added
  /lib/firmware/ath10k/QCA6174/hw3.0/notice_ath10k_firmware-4.txt was added
  /lib/firmware/ath10k/QCA6174/hw3.0/notice_ath10k_firmware-6.txt was added
  /lib/firmware/ath10k/QCA6174/hw3.0/notice_ath10k_firmware-sdio-6.txt was added
  /lib/firmware/ath10k/QCA9377/hw1.0/notice_ath10k_firmware-5.txt was added
  /lib/firmware/ath10k/QCA9377/hw1.0/notice_ath10k_firmware-6.txt was added
  /lib/firmware/ath10k/QCA9377/hw1.0/notice_ath10k_firmware-sdio-5.txt was added
  /lib/firmware/ath10k/QCA9887/hw1.0/notice_ath10k_firmware-5.txt was added
  /lib/firmware/ath10k/QCA9888/hw2.0/notice_ath10k_firmware-5.txt was added
  /lib/firmware/ath10k/QCA988X/hw2.0/notice_ath10k_firmware-4.txt was added
  /lib/firmware/ath10k/QCA988X/hw2.0/notice_ath10k_firmware-5.txt was added
  /lib/firmware/ath10k/QCA9984/hw1.0/notice_ath10k_firmware-5.txt was added
  /lib/firmware/ath10k/QCA99X0/hw2.0/notice_ath10k_firmware-5.txt was added
  /lib/firmware/ath10k/WCN3990/hw1.0/notice.txt_wlanmdsp was added
  /lib/firmware/ath11k/IPQ6018/hw1.0/Notice.txt was added
  /lib/firmware/ath11k/IPQ8074/hw2.0/Notice.txt was added
  /lib/firmware/ath11k/QCA6390/hw2.0/Notice.txt was added
  /lib/firmware/ath11k/WCN6855 was added
  /lib/firmware/ath11k/WCN6855/hw2.0 was added
  /lib/firmware/ath11k/WCN6855/hw2.0/amss.bin was added
  /lib/firmware/ath11k/WCN6855/hw2.0/board-2.bin was added
  /lib/firmware/ath11k/WCN6855/hw2.0/m3.bin was added
  /lib/firmware/ath11k/WCN6855/hw2.0/Notice.txt was added
  /lib/firmware/ath11k/WCN6855/hw2.0/regdb.bin was added
  /lib/firmware/ath11k/WCN6855/hw2.1 was added
  /lib/firmware/ath11k/WCN6855/hw2.1/amss.bin was added
  /lib/firmware/ath11k/WCN6855/hw2.1/board-2.bin was added
  /lib/firmware/ath11k/WCN6855/hw2.1/m3.bin was added
  /lib/firmware/ath11k/WCN6855/hw2.1/regdb.bin was added
  /lib/firmware/iwlwifi-cc-a0-71.ucode was added
  /lib/firmware/iwlwifi-Qu-b0-hr-b0-71.ucode was added
  /lib/firmware/iwlwifi-Qu-b0-jf-b0-71.ucode was added
  /lib/firmware/iwlwifi-Qu-c0-hr-b0-71.ucode was added
  /lib/firmware/iwlwifi-Qu-c0-jf-b0-71.ucode was added
  /lib/firmware/iwlwifi-QuZ-a0-hr-b0-71.ucode was added
  /lib/firmware/iwlwifi-QuZ-a0-jf-b0-71.ucode was added
  /lib/firmware/iwlwifi-so-a0-gf4-a0-71.ucode was added
  /lib/firmware/iwlwifi-so-a0-gf-a0-71.ucode was added
  /lib/firmware/iwlwifi-so-a0-hr-b0-71.ucode was added
  /lib/firmware/iwlwifi-so-a0-jf-b0-71.ucode was added
  /lib/firmware/iwlwifi-ty-a0-gf-a0-71.ucode was added
  /lib/firmware/mediatek/mt7986_eeprom_mt7975_dual.bin was added
  /lib/firmware/mediatek/mt7986_eeprom_mt7976.bin was added
  /lib/firmware/mediatek/mt7986_eeprom_mt7976_dbdc.bin was added
  /lib/firmware/mediatek/mt7986_eeprom_mt7976_dual.bin was added
  /lib/firmware/mediatek/mt7986_rom_patch.bin was added
  /lib/firmware/mediatek/mt7986_rom_patch_mt7975.bin was added
  /lib/firmware/mediatek/mt7986_wa.bin was added
  /lib/firmware/mediatek/mt7986_wm.bin was added
  /lib/firmware/mediatek/mt7986_wm_mt7975.bin was added
  /lib/firmware/mellanox/mlxsw_spectrum-13.2010.1406.mfa2 was added
  /lib/firmware/mellanox/mlxsw_spectrum2-29.2010.1406.mfa2 was added
  /lib/firmware/mellanox/mlxsw_spectrum3-30.2010.1406.mfa2 was added
  /lib/firmware/wfx was added
  /lib/firmware/wfx/wfm_wf200_C0.sec was added
  /lib/firmware/silabs was removed
  /lib/firmware/silabs/wfm_wf200_C0.sec was removed

--===============2072305231249380969==--

