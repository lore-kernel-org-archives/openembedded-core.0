Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AB9AC3600C
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:44 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.10343.1742048303232312555
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=OTXkOlre;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=oIvo5Lm0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101959a2bc68c-49c8ff40-e165-439a-a53f-d97c4d4645bf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048315;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0tp4Qhp0B5Fumms+kHjVM7qcbykmLeEa7u1eeg4E6hU=;
	b=OTXkOlre4kT8l8TtpmoaI3/o4PEXfDHI/7kkpzjPUwIMmA5b8Y0CopnNxowZyJup
	VoanMQU2VEw1YUexAfQ6MdCYHQsEIHaZSVX9tvstpCBQw+KQUs29c1/Ks9bcSy4C/HL
	BLLbZw91xnUE8Q7UlNVeLp5U/hqOmnMPZhLgJMOc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048315;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0tp4Qhp0B5Fumms+kHjVM7qcbykmLeEa7u1eeg4E6hU=;
	b=oIvo5Lm0uK8bHqrX923wZTLlBfHSNmwg0Oc2MFwUO4PMBKEf+K6xS/loEOP5MEpz
	o4sJFD11bqeI5AbAK58JqR9rgbK/4aS9PMWIr1YzTgZhBIj647VPRd7qvVyq1ODK/X+
	PP+dC0IuIz9C1uM6BwbuPtmAR1AgdUd8dRJxLAsI=
Content-Type: multipart/mixed; boundary="===============8087125040661316516=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] linux-firmware: upgrading to 20250311 SUCCEEDED
Message-ID: <010101959a2bc68c-49c8ff40-e165-439a-a53f-d97c4d4645bf-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212965

--===============8087125040661316516==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *linux-firmware* to *20250311* has Succeeded.

Next steps:
    - apply the patch: git am 0001-linux-firmware-upgrade-20250211-20250311.patch
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
From b5eff98a7385c80e643644d32bb780b879b59c49 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Mar 2025 13:13:11 +0000
Subject: [PATCH] linux-firmware: upgrade 20250211 -> 20250311

---
 ...20250211.bb => linux-firmware_20250311.bb} | 486 +++++++++++++++++-
 1 file changed, 484 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20250211.bb => linux-firmware_20250311.bb} (78%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250311.bb
similarity index 78%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20250311.bb
index 68e0a3b1e4..c822e88ddc 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250311.bb
@@ -1,3 +1,485 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- WHENCE
+# +++ WHENCE
+# @@ -3859,9 +3859,10 @@
+#  Link: ath11k/WCN6855/hw2.1/amss.bin -> ../hw2.0/amss.bin
+#  Link: ath11k/WCN6855/hw2.1/m3.bin -> ../hw2.0/m3.bin
+#  File: ath11k/QCN9074/hw1.0/board-2.bin
+# +File: ath11k/QCN9074/hw1.0/.notice
+#  File: ath11k/QCN9074/hw1.0/amss.bin
+#  File: ath11k/QCN9074/hw1.0/m3.bin
+# -Version: WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
+# +Version: WLAN.HK.2.9.0.1-02175-QCAHKSWPL_SILICONZ-2
+#  File: ath11k/QCN9074/hw1.0/Notice.txt
+#  File: ath11k/WCN6750/hw1.0/board-2.bin
+#  File: ath11k/WCN6750/hw1.0/sc7280/wpss.mbn
+# @@ -3899,7 +3900,7 @@
+#  File: ath11k/QCA6698AQ/hw2.1/board-2.bin
+#  File: ath11k/QCA6698AQ/hw2.1/amss.bin
+#  File: ath11k/QCA6698AQ/hw2.1/m3.bin
+# -Version: WLAN.HSP.1.1-04479-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
+# +Version: WLAN.HSP.1.1-04604-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
+#  File: ath11k/QCA6698AQ/hw2.1/Notice.txt
+#  
+#  Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k for details
+# @@ -4208,7 +4209,7 @@
+#  File: intel/ibt-0093-4150.ddc
+#  File: intel/ibt-0093-1050.sfi
+#  File: intel/ibt-0093-1050.ddc
+# -Version: BT_BlazarU_S_REL72721_23.100.24491.72721
+# +Version: BT_BlazarU_S_REL76693_23.120.25071.76693
+#  
+#  File: intel/ibt-0180-0041.sfi
+#  File: intel/ibt-0180-0041.ddc
+# @@ -4224,7 +4225,7 @@
+#  File: intel/ibt-0190-0041.sfi
+#  File: intel/ibt-0190-0041-iml.sfi
+#  File: intel/ibt-0190-0041.ddc
+# -Version: BT_BlazarI_S_REL64160_23.70.24233.64160
+# +Version: BT_BlazarI_S_REL82746_23.120.25071.82746
+#  
+#  Licence: Redistributable. See LICENCE.ibt_firmware for details
+#  
+# @@ -4344,11 +4345,13 @@
+#  File: amd/amd_sev_fam17h_model3xh.sbin
+#  Version: 2024-8-20
+#  File: amd/amd_sev_fam19h_model0xh.sbin
+# -Version: 2024-8-20
+# +Version: 2025-2-20
+#  File: amd/amd_sev_fam19h_model1xh.sbin
+# -Version: 2024-8-20
+# +Version: 2025-2-20
+#  File: amd/amd_sev_fam19h_modelaxh.sbin
+# -Version: 2024-8-20
+# +Version: 2025-2-20
+# +File: amd/amd_sev_fam1ah_model0xh.sbin
+# +Version: 2025-2-20
+#  
+#  License: Redistributable. See LICENSE.amd-sev for details
+#  
+# @@ -4463,6 +4466,8 @@
+#  File: qat_4xxx_mmp.bin
+#  File: qat_402xx.bin
+#  File: qat_402xx_mmp.bin
+# +File: qat_420xx.bin
+# +File: qat_420xx_mmp.bin
+#  
+#  Licence: Redistributable. See LICENCE.qat_firmware for details
+#  
+# @@ -4744,7 +4749,7 @@
+#  File: qca/nvm_usb_00130200_0109.bin
+#  File: qca/nvm_usb_00130200_0110.bin
+#  File: qca/rampatch_usb_00130201.bin
+# -Version: BTFW.HSP.2.1.0-00650-USB_PATCHZ-1
+# +Version: BTFW.HSP.2.1.0-00653-USB_PATCHZ-3
+#  File: qca/nvm_usb_00130201.bin
+#  File: qca/nvm_usb_00130201_010a.bin
+#  File: qca/nvm_usb_00130201_010b.bin
+# @@ -4754,6 +4759,10 @@
+#  File: qca/nvm_usb_00130201_gf_010b.bin
+#  File: qca/nvm_usb_00130201_gf_0303.bin
+#  File: qca/rampatch_usb_00190200.bin
+# +File: qca/QCA2066/rampatch_usb_00130201.bin
+# +Version: BTFW.HSP.2.1.0-00653-VER_PATCHZ-3
+# +File: qca/QCA2066/nvm_usb_00130201_030a.bin
+# +File: qca/QCA2066/nvm_usb_00130201_gf_030a.bin
+#  Version: BTFW.HAMILTON.2.0.0-00515-USB_PATCHZ-2
+#  File: qca/nvm_usb_00190200.bin
+#  File: qca/nvm_usb_00190200_010e.bin
+# @@ -4804,7 +4813,7 @@
+#  File: qca/apbtfw10.tlv
+#  Version: BTFM.CHE.2.0.0-00082-QCACHROMZ-1
+#  File: qca/apbtfw11.tlv
+# -Version: BTFM.CHE.2.1.3-00357-QCACHROMZ-1
+# +Version: BTFM.CHE.2.1.5.c5-00042-QCACHROMZ-2
+#  File: qca/apnv10.bin
+#  File: qca/apnv11.bin
+#  
+# @@ -4843,7 +4852,7 @@
+#  Driver: qca - Qualcomm Atheros Bluetooth support for QCA2066 chips
+#  
+#  File: qca/hpbtfw21.tlv
+# -Version: BTFW.HSP.2.1.0-00641-VER_PATCHZ-1
+# +Version: BTFW.HSP.2.1.0-00653-VER_PATCHZ-3
+#  File: qca/hpnv21.bin
+#  File: qca/hpnv21g.bin
+#  File: qca/hpnv21.301
+# @@ -4852,6 +4861,8 @@
+#  File: qca/hpnv21g.302
+#  File: qca/hpnv21.309
+#  File: qca/hpnv21g.309
+# +File: qca/hpnv21.30a
+# +File: qca/hpnv21g.30a
+#  File: qca/hpnv21.b8c
+#  File: qca/hpnv21.b9f
+#  File: qca/hpnv21.ba0
+# @@ -5315,7 +5326,7 @@
+#  Version: DMC API/APB ver 2 release 28 for Xe2LPD
+#  
+#  File: i915/xe3lpd_dmc.bin
+# -Version: DMC API/APB ver 2 release 13 for Xe3LPD
+# +Version: DMC API/APB ver 2 release 20 for Xe3LPD
+#  
+#  License: Redistributable. See LICENSE.i915 for details
+#  --------------------------------------------------------------------------
+# @@ -5326,13 +5337,13 @@
+#  Version: GSC API/APB v1.0, release 104.0.0.1263, SVN 1 for Lunarlake
+#  
+#  File: xe/lnl_guc_70.bin
+# -Version: GuC API/APB ver 70.36.0 for Lunarlake
+# +Version: GuC API/APB ver 70.40.2 for Lunarlake
+#  
+#  File: xe/lnl_huc.bin
+#  Version: HuC API/APB ver 9.4.13 for Lunarlake
+#  
+#  File: xe/bmg_guc_70.bin
+# -Version: GuC API/APB ver 70.36.0 for Battlemage
+# +Version: GuC API/APB ver 70.40.2 for Battlemage
+#  
+#  File: xe/bmg_huc.bin
+#  Version: HuC API/APB ver 8.2.10 for Battlemage
+# @@ -6031,9 +6042,9 @@
+#  Driver: mt7920 - MediaTek MT7920 Wireless MACs
+#  
+#  File: mediatek/WIFI_MT7961_patch_mcu_1a_2_hdr.bin
+# -Version: 20241104091014a
+# +Version: 20250210151004a
+#  File: mediatek/WIFI_RAM_CODE_MT7961_1a.bin
+# -Version: 20241104090857
+# +Version: 20250210150855
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -6042,7 +6053,7 @@
+#  Driver: mt7920 - MediaTek MT7920 bluetooth chipset
+#  
+#  File: mediatek/BT_RAM_CODE_MT7961_1a_2_hdr.bin
+# -Version: 20241104091246
+# +Version: 20250210151502
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -6091,9 +6102,9 @@
+#  Driver: mt7925 - MediaTek MT7925 Wireless MACs
+#  
+#  File: mediatek/mt7925/WIFI_MT7925_PATCH_MCU_1_1_hdr.bin
+# -Version: 20250113153001a
+# +Version: 20250305132908a
+#  File: mediatek/mt7925/WIFI_RAM_CODE_MT7925_1_1.bin
+# -Version: 20250113152854
+# +Version: 20250305132802
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -6102,7 +6113,7 @@
+#  Driver: mt7925 - MediaTek MT7925 bluetooth chipset
+#  
+#  File: mediatek/mt7925/BT_RAM_CODE_MT7925_1_1_hdr.bin
+# -Version: 20250113153307
+# +Version: 20250305133215
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -6369,6 +6380,8 @@
+#  
+#  Driver: adreno - Qualcomm Adreno GPU firmware
+#  
+# +File: qcom/a225_pfp.fw
+# +File: qcom/a225_pm4.fw
+#  File: qcom/a300_pfp.fw
+#  Link: a300_pfp.fw -> qcom/a300_pfp.fw
+#  File: qcom/a300_pm4.fw
+# @@ -6402,6 +6415,8 @@
+#  File: qcom/a663_gmu.bin
+#  File: qcom/sa8775p/a663_zap.mbn
+#  File: qcom/qcs615/a612_zap.mbn
+# +File: qcom/a623_gmu.bin
+# +File: qcom/qcs8300/a623_zap.mbn
+#  
+#  Licence: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
+#  
+# @@ -6862,7 +6877,7 @@
+#  
+#  --------------------------------------------------------------------------
+#  
+# -Driver: cs35l41_hda - CS35l41 ALSA HDA audio driver
+# +Driver: cs35l41 - CS35L41 ALSA audio driver (includes cs35l41_hda)
+#  
+#  File: cirrus/cs35l41-dsp1-spk-prot.wmfw
+#  File: cirrus/cs35l41-dsp1-spk-prot.bin
+# @@ -7445,6 +7460,117 @@
+#  File: cirrus/cs35l41-dsp1-spk-prot-10431ed3-spkid0-r0.bin
+#  File: cirrus/cs35l41-dsp1-spk-prot-10431ed3-spkid1-l0.bin
+#  File: cirrus/cs35l41-dsp1-spk-prot-10431ed3-spkid1-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-104330c1.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-104331e1.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-104330e1.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-104331f1.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433011.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433fd0.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +File: cirrus/cs35l41-dsp1-spk-prot-104330c1-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-104330c1-spkid0-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-104330c1-spkid1-l0.bin -> cs35l41-dsp1-spk-prot-104330c1-spkid0-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-104330c1-spkid1-r0.bin -> cs35l41-dsp1-spk-prot-104330c1-spkid0-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-104331e1-spkid0-l0.bin -> cs35l41-dsp1-spk-prot-104330c1-spkid0-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-104331e1-spkid0-r0.bin -> cs35l41-dsp1-spk-prot-104330c1-spkid0-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-104331e1-spkid1-l0.bin -> cs35l41-dsp1-spk-prot-104330c1-spkid0-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-104331e1-spkid1-r0.bin -> cs35l41-dsp1-spk-prot-104330c1-spkid0-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-104330e1-spkid0-l0.bin -> cs35l41-dsp1-spk-prot-104330c1-spkid0-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-104330e1-spkid0-r0.bin -> cs35l41-dsp1-spk-prot-104330c1-spkid0-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-104330e1-spkid1-l0.bin -> cs35l41-dsp1-spk-prot-104330c1-spkid0-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-104330e1-spkid1-r0.bin -> cs35l41-dsp1-spk-prot-104330c1-spkid0-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-104331f1-spkid0-l0.bin -> cs35l41-dsp1-spk-prot-104330c1-spkid0-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-104331f1-spkid0-r0.bin -> cs35l41-dsp1-spk-prot-104330c1-spkid0-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-104331f1-spkid1-l0.bin -> cs35l41-dsp1-spk-prot-104330c1-spkid0-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-104331f1-spkid1-r0.bin -> cs35l41-dsp1-spk-prot-104330c1-spkid0-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433011-spkid0-l0.bin -> cs35l41-dsp1-spk-prot-104330c1-spkid0-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433011-spkid0-r0.bin -> cs35l41-dsp1-spk-prot-104330c1-spkid0-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433011-spkid1-l0.bin -> cs35l41-dsp1-spk-prot-104330c1-spkid0-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433011-spkid1-r0.bin -> cs35l41-dsp1-spk-prot-104330c1-spkid0-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433fd0-spkid0-l0.bin -> cs35l41-dsp1-spk-prot-104330c1-spkid0-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433fd0-spkid0-r0.bin -> cs35l41-dsp1-spk-prot-104330c1-spkid0-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433fd0-spkid1-l0.bin -> cs35l41-dsp1-spk-prot-104330c1-spkid0-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433fd0-spkid1-r0.bin -> cs35l41-dsp1-spk-prot-104330c1-spkid0-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433071.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-104330d1.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433ff0.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +File: cirrus/cs35l41-dsp1-spk-prot-10433071-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10433071-spkid0-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433071-spkid1-l0.bin -> cs35l41-dsp1-spk-prot-10433071-spkid0-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433071-spkid1-r0.bin -> cs35l41-dsp1-spk-prot-10433071-spkid0-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-104330d1-spkid0-l0.bin -> cs35l41-dsp1-spk-prot-10433071-spkid0-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-104330d1-spkid0-r0.bin -> cs35l41-dsp1-spk-prot-10433071-spkid0-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-104330d1-spkid1-l0.bin -> cs35l41-dsp1-spk-prot-10433071-spkid0-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-104330d1-spkid1-r0.bin -> cs35l41-dsp1-spk-prot-10433071-spkid0-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433ff0-spkid0-l0.bin -> cs35l41-dsp1-spk-prot-10433071-spkid0-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433ff0-spkid0-r0.bin -> cs35l41-dsp1-spk-prot-10433071-spkid0-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433ff0-spkid1-l0.bin -> cs35l41-dsp1-spk-prot-10433071-spkid0-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433ff0-spkid1-r0.bin -> cs35l41-dsp1-spk-prot-10433071-spkid0-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433061.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-104312b4.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10431294.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +File: cirrus/cs35l41-dsp1-spk-prot-10433061-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10433061-spkid0-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433061-spkid1-l0.bin -> cs35l41-dsp1-spk-prot-10433061-spkid0-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433061-spkid1-r0.bin -> cs35l41-dsp1-spk-prot-10433061-spkid0-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-104312b4-spkid0-l0.bin -> cs35l41-dsp1-spk-prot-10433061-spkid0-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-104312b4-spkid0-r0.bin -> cs35l41-dsp1-spk-prot-10433061-spkid0-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-104312b4-spkid1-l0.bin -> cs35l41-dsp1-spk-prot-10433061-spkid0-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-104312b4-spkid1-r0.bin -> cs35l41-dsp1-spk-prot-10433061-spkid0-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10431294-spkid0-l0.bin -> cs35l41-dsp1-spk-prot-10433061-spkid0-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10431294-spkid0-r0.bin -> cs35l41-dsp1-spk-prot-10433061-spkid0-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10431294-spkid1-l0.bin -> cs35l41-dsp1-spk-prot-10433061-spkid0-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10431294-spkid1-r0.bin -> cs35l41-dsp1-spk-prot-10433061-spkid0-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10431f63.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431f63-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431f63-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10431fb3.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10431194.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433e20.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433e00.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10431074.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10431054.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431fb3-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431fb3-spkid0-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431fb3-spkid1-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431fb3-spkid1-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431194-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431194-spkid0-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431194-spkid1-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431194-spkid1-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10433e20-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10433e20-spkid0-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10433e20-spkid1-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10433e20-spkid1-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433e00-spkid0-l0.bin -> cs35l41-dsp1-spk-prot-10433e20-spkid0-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433e00-spkid0-r0.bin -> cs35l41-dsp1-spk-prot-10433e20-spkid0-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433e00-spkid1-l0.bin -> cs35l41-dsp1-spk-prot-10433e20-spkid1-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433e00-spkid1-r0.bin -> cs35l41-dsp1-spk-prot-10433e20-spkid1-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431074-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431074-spkid0-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431074-spkid1-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431074-spkid1-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10431054-spkid0-l0.bin -> cs35l41-dsp1-spk-prot-10431074-spkid0-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10431054-spkid0-r0.bin -> cs35l41-dsp1-spk-prot-10431074-spkid0-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10431054-spkid1-l0.bin -> cs35l41-dsp1-spk-prot-10431074-spkid1-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10431054-spkid1-r0.bin -> cs35l41-dsp1-spk-prot-10431074-spkid1-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433d78.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433d88.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +File: cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid0-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid1-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid1-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid0-l0.bincfg -> cs35l41/bincfgs/cs35l41-dsp1-14_5dB.bincfg
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid0-r0.bincfg -> cs35l41/bincfgs/cs35l41-dsp1-14_5dB.bincfg
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid1-l0.bincfg -> cs35l41/bincfgs/cs35l41-dsp1-14_5dB.bincfg
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid1-r0.bincfg -> cs35l41/bincfgs/cs35l41-dsp1-14_5dB.bincfg
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433d88-spkid0-l0.bin -> cs35l41-dsp1-spk-prot-10433d78-spkid0-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433d88-spkid0-r0.bin -> cs35l41-dsp1-spk-prot-10433d78-spkid0-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433d88-spkid1-l0.bin -> cs35l41-dsp1-spk-prot-10433d78-spkid1-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433d88-spkid1-r0.bin -> cs35l41-dsp1-spk-prot-10433d78-spkid1-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433d88-spkid0-l0.bincfg -> cs35l41/bincfgs/cs35l41-dsp1-14_5dB.bincfg
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433d88-spkid0-r0.bincfg -> cs35l41/bincfgs/cs35l41-dsp1-14_5dB.bincfg
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433d88-spkid1-l0.bincfg -> cs35l41/bincfgs/cs35l41-dsp1-14_5dB.bincfg
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433d88-spkid1-r0.bincfg -> cs35l41/bincfgs/cs35l41-dsp1-14_5dB.bincfg
+#  Link: cirrus/cs35l41-dsp1-spk-prot-17aa2316.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+#  Link: cirrus/cs35l41-dsp1-spk-prot-17aa2317.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+#  File: cirrus/cs35l41-dsp1-spk-prot-17aa2316-spkid0-l0.bin
+# @@ -7590,6 +7716,9 @@
+#  Link: cirrus/cs35l41-dsp1-spk-prot-103c8ce0-spkid1-r0.bin -> cs35l41-dsp1-spk-prot-103c8cdf-spkid1-l0.bin
+#  Link: cirrus/cs35l41-dsp1-spk-prot-1f660105.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+#  File: cirrus/cs35l41-dsp1-spk-prot-1f660105.bin
+# +File: cirrus/cs35l41/v6.51.0/halo_cspl_RAM_revB2_29.53.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-vlv1776.wmfw -> cs35l41/v6.51.0/halo_cspl_RAM_revB2_29.53.0.wmfw
+# +File: cirrus/cs35l41-dsp1-spk-prot-vlv1776.bin
+#  
+#  License: Redistributable. See LICENSE.cirrus for details.
+#  
+# @@ -7608,9 +7737,9 @@
+#  File: cirrus/cs35l56/CS35L56_Rev3.11.16.wmfw
+#  File: cirrus/cs35l56/CS35L56_Rev3.11.18.wmfw
+#  File: cirrus/cs35l56/CS35L56_Rev3.11.20.wmfw
+# +File: cirrus/cs35l56/CS35L56_Rev3.11.21.wmfw
+#  File: cirrus/cs35l56/CS35L56_Rev3.11.25.wmfw
+#  File: cirrus/cs35l56/CS35L56_Rev3.11.26.wmfw
+# -File: cirrus/cs35l56/CS35L56_Rev3.11.27.wmfw
+#  File: cirrus/cs35l56/CS35L56_Rev3.11.28.wmfw
+#  Link: cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid0.wmfw -> cs35l56/CS35L56_Rev3.11.11.wmfw
+#  File: cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid0-amp1.bin
+# @@ -7666,16 +7795,16 @@
+#  Link: cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid3.wmfw -> cs35l56/CS35L56_Rev3.11.25.wmfw
+#  File: cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid3-ampl.bin
+#  File: cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid3-ampr.bin
+# -Link: cirrus/cs35l56-b0-dsp1-misc-10280d12-spkid0.wmfw -> cs35l56/CS35L56_Rev3.11.27.wmfw
+# +Link: cirrus/cs35l56-b0-dsp1-misc-10280d12-spkid0.wmfw -> cs35l56/CS35L56_Rev3.11.28.wmfw
+#  File: cirrus/cs35l56-b0-dsp1-misc-10280d12-spkid0-amp1.bin
+#  File: cirrus/cs35l56-b0-dsp1-misc-10280d12-spkid0-amp2.bin
+# -Link: cirrus/cs35l56-b0-dsp1-misc-10280d12-spkid1.wmfw -> cs35l56/CS35L56_Rev3.11.27.wmfw
+# +Link: cirrus/cs35l56-b0-dsp1-misc-10280d12-spkid1.wmfw -> cs35l56/CS35L56_Rev3.11.28.wmfw
+#  File: cirrus/cs35l56-b0-dsp1-misc-10280d12-spkid1-amp1.bin
+#  File: cirrus/cs35l56-b0-dsp1-misc-10280d12-spkid1-amp2.bin
+# -Link: cirrus/cs35l56-b0-dsp1-misc-10280d13-spkid0.wmfw -> cs35l56/CS35L56_Rev3.11.27.wmfw
+# +Link: cirrus/cs35l56-b0-dsp1-misc-10280d13-spkid0.wmfw -> cs35l56/CS35L56_Rev3.11.28.wmfw
+#  File: cirrus/cs35l56-b0-dsp1-misc-10280d13-spkid0-amp1.bin
+#  File: cirrus/cs35l56-b0-dsp1-misc-10280d13-spkid0-amp2.bin
+# -Link: cirrus/cs35l56-b0-dsp1-misc-10280d13-spkid1.wmfw -> cs35l56/CS35L56_Rev3.11.27.wmfw
+# +Link: cirrus/cs35l56-b0-dsp1-misc-10280d13-spkid1.wmfw -> cs35l56/CS35L56_Rev3.11.28.wmfw
+#  File: cirrus/cs35l56-b0-dsp1-misc-10280d13-spkid1-amp1.bin
+#  File: cirrus/cs35l56-b0-dsp1-misc-10280d13-spkid1-amp2.bin
+#  Link: cirrus/cs35l56-b0-dsp1-misc-103c8c52.wmfw -> cs35l56/CS35L56_Rev3.11.16.wmfw
+# @@ -7694,10 +7823,10 @@
+#  File: cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp3.bin
+#  File: cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp4.bin
+#  Link: cirrus/cs35l54-b0-dsp1-misc-103c8d08.wmfw -> cs35l56/CS35L56_Rev3.11.18.wmfw
+# -Link: cirrus/cs35l54-b0-dsp1-misc-103c8d08-amp1.bin -> cs35l54-b0-dsp1-misc-103c8d01-amp1.bin
+# -Link: cirrus/cs35l54-b0-dsp1-misc-103c8d08-amp2.bin -> cs35l54-b0-dsp1-misc-103c8d01-amp2.bin
+# -Link: cirrus/cs35l54-b0-dsp1-misc-103c8d08-amp3.bin -> cs35l54-b0-dsp1-misc-103c8d01-amp3.bin
+# -Link: cirrus/cs35l54-b0-dsp1-misc-103c8d08-amp4.bin -> cs35l54-b0-dsp1-misc-103c8d01-amp4.bin
+# +File: cirrus/cs35l54-b0-dsp1-misc-103c8d08-amp1.bin
+# +File: cirrus/cs35l54-b0-dsp1-misc-103c8d08-amp2.bin
+# +File: cirrus/cs35l54-b0-dsp1-misc-103c8d08-amp3.bin
+# +File: cirrus/cs35l54-b0-dsp1-misc-103c8d08-amp4.bin
+#  Link: cirrus/cs35l54-b0-dsp1-misc-103c8d85.wmfw -> cs35l56/CS35L56_Rev3.11.11.1.wmfw
+#  File: cirrus/cs35l54-b0-dsp1-misc-103c8d85-amp1.bin
+#  File: cirrus/cs35l54-b0-dsp1-misc-103c8d85-amp2.bin
+# @@ -7762,6 +7891,18 @@
+#  Link: cirrus/cs35l56-b0-dsp1-misc-103c8e2c.wmfw -> cs35l56/CS35L56_Rev3.11.11.1.wmfw
+#  Link: cirrus/cs35l56-b0-dsp1-misc-103c8e2c-amp1.bin -> cs35l56-b0-dsp1-misc-103c8d90-amp1.bin
+#  Link: cirrus/cs35l56-b0-dsp1-misc-103c8e2c-amp2.bin -> cs35l56-b0-dsp1-misc-103c8d90-amp2.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-10431024-spkid0.wmfw -> cs35l56/CS35L56_Rev3.11.16.wmfw
+# +Link: cirrus/cs35l56-b0-dsp1-misc-10431024-spkid0-amp1.bin -> cs35l56-b0-dsp1-misc-10431044-spkid0-amp1.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-10431024-spkid0-amp2.bin -> cs35l56-b0-dsp1-misc-10431044-spkid0-amp2.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-10431024-spkid1.wmfw -> cs35l56/CS35L56_Rev3.11.16.wmfw
+# +Link: cirrus/cs35l56-b0-dsp1-misc-10431024-spkid1-amp1.bin -> cs35l56-b0-dsp1-misc-10431044-spkid1-amp1.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-10431024-spkid1-amp2.bin -> cs35l56-b0-dsp1-misc-10431044-spkid1-amp2.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-10431044-spkid0.wmfw -> cs35l56/CS35L56_Rev3.11.16.wmfw
+# +File: cirrus/cs35l56-b0-dsp1-misc-10431044-spkid0-amp1.bin
+# +File: cirrus/cs35l56-b0-dsp1-misc-10431044-spkid0-amp2.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-10431044-spkid1.wmfw -> cs35l56/CS35L56_Rev3.11.16.wmfw
+# +File: cirrus/cs35l56-b0-dsp1-misc-10431044-spkid1-amp1.bin
+# +File: cirrus/cs35l56-b0-dsp1-misc-10431044-spkid1-amp2.bin
+#  Link: cirrus/cs35l56-b0-dsp1-misc-10431264.wmfw -> cs35l56/CS35L56_Rev3.11.16.wmfw
+#  Link: cirrus/cs35l56-b0-dsp1-misc-10431264-amp1.bin -> cs35l56-b0-dsp1-misc-10431df3-amp1.bin
+#  Link: cirrus/cs35l56-b0-dsp1-misc-10431264-amp2.bin -> cs35l56-b0-dsp1-misc-10431df3-amp2.bin
+# @@ -7825,9 +7966,39 @@
+#  Link: cirrus/cs35l56-b0-dsp1-misc-17aa3832-spkid1.wmfw -> cs35l56/CS35L56_Rev3.11.26.wmfw
+#  File: cirrus/cs35l56-b0-dsp1-misc-17aa3832-spkid1-ampl.bin
+#  File: cirrus/cs35l56-b0-dsp1-misc-17aa3832-spkid1-ampr.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid0.wmfw -> cs35l56/CS35L56_Rev3.11.20.wmfw
+# +File: cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid0-ampl.bin
+# +File: cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid0-ampr.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid1.wmfw -> cs35l56/CS35L56_Rev3.11.20.wmfw
+# +File: cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid1-ampl.bin
+# +File: cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid1-ampr.bin
+#  Link: cirrus/cs35l56-b0-dsp1-misc-17aa3905.wmfw -> cs35l56/CS35L56_Rev3.11.18.wmfw
+#  File: cirrus/cs35l56-b0-dsp1-misc-17aa3905-amp1.bin
+#  File: cirrus/cs35l56-b0-dsp1-misc-17aa3905-amp2.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-17aa390b.wmfw -> cs35l56/CS35L56_Rev3.11.21.wmfw
+# +File: cirrus/cs35l56-b0-dsp1-misc-17aa390b-amp1.bin
+# +File: cirrus/cs35l56-b0-dsp1-misc-17aa390b-amp2.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-17aa390c-spkid1.wmfw -> cs35l56/CS35L56_Rev3.11.18.wmfw
+# +File: cirrus/cs35l56-b0-dsp1-misc-17aa390c-spkid1-amp1.bin
+# +File: cirrus/cs35l56-b0-dsp1-misc-17aa390c-spkid1-amp2.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-17aa390d-spkid0.wmfw -> cs35l56/CS35L56_Rev3.11.18.wmfw
+# +File: cirrus/cs35l56-b0-dsp1-misc-17aa390d-spkid0-amp1.bin
+# +File: cirrus/cs35l56-b0-dsp1-misc-17aa390d-spkid0-amp2.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-17aa3910-spkid1.wmfw -> cs35l56/CS35L56_Rev3.11.18.wmfw
+# +File: cirrus/cs35l56-b0-dsp1-misc-17aa3910-spkid1-amp1.bin
+# +File: cirrus/cs35l56-b0-dsp1-misc-17aa3910-spkid1-amp2.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-17aa3911-spkid0.wmfw -> cs35l56/CS35L56_Rev3.11.18.wmfw
+# +File: cirrus/cs35l56-b0-dsp1-misc-17aa3911-spkid0-amp1.bin
+# +File: cirrus/cs35l56-b0-dsp1-misc-17aa3911-spkid0-amp2.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-17aa391b-spkid0.wmfw -> cs35l56/CS35L56_Rev3.11.21.wmfw
+# +File: cirrus/cs35l56-b0-dsp1-misc-17aa391b-spkid0-amp1.bin
+# +File: cirrus/cs35l56-b0-dsp1-misc-17aa391b-spkid0-amp2.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid1.wmfw -> cs35l56/CS35L56_Rev3.11.21.wmfw
+# +File: cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid1-amp1.bin
+# +File: cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid1-amp2.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid0.wmfw -> cs35l56/CS35L56_Rev3.11.21.wmfw
+# +File: cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid0-amp1.bin
+# +File: cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid0-amp2.bin
+#  
+#  License: Redistributable. See LICENSE.cirrus for details.
+#  
+# @@ -8031,6 +8202,10 @@
+#  Link: TAS2XXX103C8DE81.bin -> ti/tas2781/TAS2XXX8DE8.bin
+#  Link: TAS2XXX103C8DE90.bin -> ti/tas2781/TAS2XXX8DE9.bin
+#  Link: TAS2XXX103C8DE91.bin -> ti/tas2781/TAS2XXX8DE9.bin
+# +Link: TAS2XXX103C8DE8-0.bin -> ti/tas2781/TAS2XXX8DE8.bin
+# +Link: TAS2XXX103C8DE8-1.bin -> ti/tas2781/TAS2XXX8DE8.bin
+# +Link: TAS2XXX103C8DE9-0.bin -> ti/tas2781/TAS2XXX8DE9.bin
+# +Link: TAS2XXX103C8DE9-1.bin -> ti/tas2781/TAS2XXX8DE9.bin
+#  Link: TAS2XXX10A40.bin -> ti/tas2781/TAS2XXX10A40.bin
+#  Link: TAS2XXX10A41.bin -> ti/tas2781/TAS2XXX10A41.bin
+#  Link: TAS2XXX11540.bin -> ti/tas2781/TAS2XXX11540.bin
+# @@ -8162,3 +8337,17 @@
+#  File: qcom/qdu100/xbl_s.melf
+#  
+#  License: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
+# +
+# +--------------------------------------------------------------------------
+# +
+# +Driver: intel_vpu -- Intel NPU driver
+# +
+# +File: intel/vpu/vpu_37xx_v1.bin
+# +Version: ci_tag_ud202504_vpu_rc_20250115_1905
+# +Link: intel/vpu/vpu_37xx_v0.0.bin -> vpu_37xx_v1.bin
+# +
+# +File: intel/vpu/vpu_40xx_v1.bin
+# +Version: ci_tag_ud202504_vpu_rc_20250115_1905
+# +Link: intel/vpu/vpu_40xx_v0.0.bin -> vpu_40xx_v1.bin
+# +
+# +License: Redistributable. See LICENSE.intel_vpu for details
+# 
+#
+
 SUMMARY = "Firmware files for use with Linux kernel"
 HOMEPAGE = "https://www.kernel.org/"
 DESCRIPTION = "Linux firmware is a package distributed alongside the Linux kernel \
@@ -156,7 +638,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
                     file://wfx/LICENCE.wf200;md5=4d1beff00d902c05c9c7e95a5d8eb52d \
-                    file://WHENCE;md5=${WHENCE_CHKSUM} \
+                    file://WHENCE;md5=886924eb733c4efcec21dff980795771 \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
@@ -250,7 +732,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "2de1345897bf839d532c5de0fdb348770ca2a5f4edfb21971582597abb45297d"
+SRC_URI[sha256sum] = "b1083a36f19aea46f661dcfd4cd462d13933dcb4e7f0dc809525552dd5c3541d"
 
 inherit allarch
 
-- 
2.44.1


--===============8087125040661316516==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-linux-firmware-upgrade-20250211-20250311.patch"

RnJvbSBiNWVmZjk4YTczODVjODBlNjQzNjQ0ZDMyYmI3ODBiODc5YjU5YzQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTWFyIDIwMjUgMTM6MTM6MTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aW51eC1maXJtd2FyZTogdXBncmFkZSAyMDI1MDIxMSAtPiAyMDI1MDMxMQoKLS0tCiAuLi4yMDI1
MDIxMS5iYiA9PiBsaW51eC1maXJtd2FyZV8yMDI1MDMxMS5iYn0gfCA0ODYgKysrKysrKysrKysr
KysrKystCiAxIGZpbGUgY2hhbmdlZCwgNDg0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS97bGludXgtZmlybXdh
cmVfMjAyNTAyMTEuYmIgPT4gbGludXgtZmlybXdhcmVfMjAyNTAzMTEuYmJ9ICg3OCUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2Fy
ZV8yMDI1MDIxMS5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgt
ZmlybXdhcmVfMjAyNTAzMTEuYmIKc2ltaWxhcml0eSBpbmRleCA3OCUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZV8yMDI1MDIxMS5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJt
d2FyZV8yMDI1MDMxMS5iYgppbmRleCA2OGUwYTNiMWU0Li5jODIyZTg4ZGRjIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlXzIwMjUw
MjExLmJiCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgtZmly
bXdhcmVfMjAyNTAzMTEuYmIKQEAgLTEsMyArMSw0ODUgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklM
RVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4K
KyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRo
ZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlm
IG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3Nh
Z2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0
ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0t
LSBXSEVOQ0UKKyMgKysrIFdIRU5DRQorIyBAQCAtMzg1OSw5ICszODU5LDEwIEBACisjICBMaW5r
OiBhdGgxMWsvV0NONjg1NS9odzIuMS9hbXNzLmJpbiAtPiAuLi9odzIuMC9hbXNzLmJpbgorIyAg
TGluazogYXRoMTFrL1dDTjY4NTUvaHcyLjEvbTMuYmluIC0+IC4uL2h3Mi4wL20zLmJpbgorIyAg
RmlsZTogYXRoMTFrL1FDTjkwNzQvaHcxLjAvYm9hcmQtMi5iaW4KKyMgK0ZpbGU6IGF0aDExay9R
Q045MDc0L2h3MS4wLy5ub3RpY2UKKyMgIEZpbGU6IGF0aDExay9RQ045MDc0L2h3MS4wL2Ftc3Mu
YmluCisjICBGaWxlOiBhdGgxMWsvUUNOOTA3NC9odzEuMC9tMy5iaW4KKyMgLVZlcnNpb246IFdM
QU4uSEsuMi45LjAuMS0wMjE0Ni1RQ0FIS1NXUExfU0lMSUNPTlotMQorIyArVmVyc2lvbjogV0xB
Ti5ISy4yLjkuMC4xLTAyMTc1LVFDQUhLU1dQTF9TSUxJQ09OWi0yCisjICBGaWxlOiBhdGgxMWsv
UUNOOTA3NC9odzEuMC9Ob3RpY2UudHh0CisjICBGaWxlOiBhdGgxMWsvV0NONjc1MC9odzEuMC9i
b2FyZC0yLmJpbgorIyAgRmlsZTogYXRoMTFrL1dDTjY3NTAvaHcxLjAvc2M3MjgwL3dwc3MubWJu
CisjIEBAIC0zODk5LDcgKzM5MDAsNyBAQAorIyAgRmlsZTogYXRoMTFrL1FDQTY2OThBUS9odzIu
MS9ib2FyZC0yLmJpbgorIyAgRmlsZTogYXRoMTFrL1FDQTY2OThBUS9odzIuMS9hbXNzLmJpbgor
IyAgRmlsZTogYXRoMTFrL1FDQTY2OThBUS9odzIuMS9tMy5iaW4KKyMgLVZlcnNpb246IFdMQU4u
SFNQLjEuMS0wNDQ3OS1RQ0FIU1BTV1BMX1YxX1YyX1NJTElDT05aX0lPRS0xCisjICtWZXJzaW9u
OiBXTEFOLkhTUC4xLjEtMDQ2MDQtUUNBSFNQU1dQTF9WMV9WMl9TSUxJQ09OWl9JT0UtMQorIyAg
RmlsZTogYXRoMTFrL1FDQTY2OThBUS9odzIuMS9Ob3RpY2UudHh0CisjICAKKyMgIExpY2VuY2U6
IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UuUXVhbGNvbW1BdGhlcm9zX2F0aDEwayBmb3Ig
ZGV0YWlscworIyBAQCAtNDIwOCw3ICs0MjA5LDcgQEAKKyMgIEZpbGU6IGludGVsL2lidC0wMDkz
LTQxNTAuZGRjCisjICBGaWxlOiBpbnRlbC9pYnQtMDA5My0xMDUwLnNmaQorIyAgRmlsZTogaW50
ZWwvaWJ0LTAwOTMtMTA1MC5kZGMKKyMgLVZlcnNpb246IEJUX0JsYXphclVfU19SRUw3MjcyMV8y
My4xMDAuMjQ0OTEuNzI3MjEKKyMgK1ZlcnNpb246IEJUX0JsYXphclVfU19SRUw3NjY5M18yMy4x
MjAuMjUwNzEuNzY2OTMKKyMgIAorIyAgRmlsZTogaW50ZWwvaWJ0LTAxODAtMDA0MS5zZmkKKyMg
IEZpbGU6IGludGVsL2lidC0wMTgwLTAwNDEuZGRjCisjIEBAIC00MjI0LDcgKzQyMjUsNyBAQAor
IyAgRmlsZTogaW50ZWwvaWJ0LTAxOTAtMDA0MS5zZmkKKyMgIEZpbGU6IGludGVsL2lidC0wMTkw
LTAwNDEtaW1sLnNmaQorIyAgRmlsZTogaW50ZWwvaWJ0LTAxOTAtMDA0MS5kZGMKKyMgLVZlcnNp
b246IEJUX0JsYXphcklfU19SRUw2NDE2MF8yMy43MC4yNDIzMy42NDE2MAorIyArVmVyc2lvbjog
QlRfQmxhemFySV9TX1JFTDgyNzQ2XzIzLjEyMC4yNTA3MS44Mjc0NgorIyAgCisjICBMaWNlbmNl
OiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLmlidF9maXJtd2FyZSBmb3IgZGV0YWlscwor
IyAgCisjIEBAIC00MzQ0LDExICs0MzQ1LDEzIEBACisjICBGaWxlOiBhbWQvYW1kX3Nldl9mYW0x
N2hfbW9kZWwzeGguc2JpbgorIyAgVmVyc2lvbjogMjAyNC04LTIwCisjICBGaWxlOiBhbWQvYW1k
X3Nldl9mYW0xOWhfbW9kZWwweGguc2JpbgorIyAtVmVyc2lvbjogMjAyNC04LTIwCisjICtWZXJz
aW9uOiAyMDI1LTItMjAKKyMgIEZpbGU6IGFtZC9hbWRfc2V2X2ZhbTE5aF9tb2RlbDF4aC5zYmlu
CisjIC1WZXJzaW9uOiAyMDI0LTgtMjAKKyMgK1ZlcnNpb246IDIwMjUtMi0yMAorIyAgRmlsZTog
YW1kL2FtZF9zZXZfZmFtMTloX21vZGVsYXhoLnNiaW4KKyMgLVZlcnNpb246IDIwMjQtOC0yMAor
IyArVmVyc2lvbjogMjAyNS0yLTIwCisjICtGaWxlOiBhbWQvYW1kX3Nldl9mYW0xYWhfbW9kZWww
eGguc2JpbgorIyArVmVyc2lvbjogMjAyNS0yLTIwCisjICAKKyMgIExpY2Vuc2U6IFJlZGlzdHJp
YnV0YWJsZS4gU2VlIExJQ0VOU0UuYW1kLXNldiBmb3IgZGV0YWlscworIyAgCisjIEBAIC00NDYz
LDYgKzQ0NjYsOCBAQAorIyAgRmlsZTogcWF0XzR4eHhfbW1wLmJpbgorIyAgRmlsZTogcWF0XzQw
Mnh4LmJpbgorIyAgRmlsZTogcWF0XzQwMnh4X21tcC5iaW4KKyMgK0ZpbGU6IHFhdF80MjB4eC5i
aW4KKyMgK0ZpbGU6IHFhdF80MjB4eF9tbXAuYmluCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJp
YnV0YWJsZS4gU2VlIExJQ0VOQ0UucWF0X2Zpcm13YXJlIGZvciBkZXRhaWxzCisjICAKKyMgQEAg
LTQ3NDQsNyArNDc0OSw3IEBACisjICBGaWxlOiBxY2EvbnZtX3VzYl8wMDEzMDIwMF8wMTA5LmJp
bgorIyAgRmlsZTogcWNhL252bV91c2JfMDAxMzAyMDBfMDExMC5iaW4KKyMgIEZpbGU6IHFjYS9y
YW1wYXRjaF91c2JfMDAxMzAyMDEuYmluCisjIC1WZXJzaW9uOiBCVEZXLkhTUC4yLjEuMC0wMDY1
MC1VU0JfUEFUQ0haLTEKKyMgK1ZlcnNpb246IEJURlcuSFNQLjIuMS4wLTAwNjUzLVVTQl9QQVRD
SFotMworIyAgRmlsZTogcWNhL252bV91c2JfMDAxMzAyMDEuYmluCisjICBGaWxlOiBxY2EvbnZt
X3VzYl8wMDEzMDIwMV8wMTBhLmJpbgorIyAgRmlsZTogcWNhL252bV91c2JfMDAxMzAyMDFfMDEw
Yi5iaW4KKyMgQEAgLTQ3NTQsNiArNDc1OSwxMCBAQAorIyAgRmlsZTogcWNhL252bV91c2JfMDAx
MzAyMDFfZ2ZfMDEwYi5iaW4KKyMgIEZpbGU6IHFjYS9udm1fdXNiXzAwMTMwMjAxX2dmXzAzMDMu
YmluCisjICBGaWxlOiBxY2EvcmFtcGF0Y2hfdXNiXzAwMTkwMjAwLmJpbgorIyArRmlsZTogcWNh
L1FDQTIwNjYvcmFtcGF0Y2hfdXNiXzAwMTMwMjAxLmJpbgorIyArVmVyc2lvbjogQlRGVy5IU1Au
Mi4xLjAtMDA2NTMtVkVSX1BBVENIWi0zCisjICtGaWxlOiBxY2EvUUNBMjA2Ni9udm1fdXNiXzAw
MTMwMjAxXzAzMGEuYmluCisjICtGaWxlOiBxY2EvUUNBMjA2Ni9udm1fdXNiXzAwMTMwMjAxX2dm
XzAzMGEuYmluCisjICBWZXJzaW9uOiBCVEZXLkhBTUlMVE9OLjIuMC4wLTAwNTE1LVVTQl9QQVRD
SFotMgorIyAgRmlsZTogcWNhL252bV91c2JfMDAxOTAyMDAuYmluCisjICBGaWxlOiBxY2EvbnZt
X3VzYl8wMDE5MDIwMF8wMTBlLmJpbgorIyBAQCAtNDgwNCw3ICs0ODEzLDcgQEAKKyMgIEZpbGU6
IHFjYS9hcGJ0ZncxMC50bHYKKyMgIFZlcnNpb246IEJURk0uQ0hFLjIuMC4wLTAwMDgyLVFDQUNI
Uk9NWi0xCisjICBGaWxlOiBxY2EvYXBidGZ3MTEudGx2CisjIC1WZXJzaW9uOiBCVEZNLkNIRS4y
LjEuMy0wMDM1Ny1RQ0FDSFJPTVotMQorIyArVmVyc2lvbjogQlRGTS5DSEUuMi4xLjUuYzUtMDAw
NDItUUNBQ0hST01aLTIKKyMgIEZpbGU6IHFjYS9hcG52MTAuYmluCisjICBGaWxlOiBxY2EvYXBu
djExLmJpbgorIyAgCisjIEBAIC00ODQzLDcgKzQ4NTIsNyBAQAorIyAgRHJpdmVyOiBxY2EgLSBR
dWFsY29tbSBBdGhlcm9zIEJsdWV0b290aCBzdXBwb3J0IGZvciBRQ0EyMDY2IGNoaXBzCisjICAK
KyMgIEZpbGU6IHFjYS9ocGJ0ZncyMS50bHYKKyMgLVZlcnNpb246IEJURlcuSFNQLjIuMS4wLTAw
NjQxLVZFUl9QQVRDSFotMQorIyArVmVyc2lvbjogQlRGVy5IU1AuMi4xLjAtMDA2NTMtVkVSX1BB
VENIWi0zCisjICBGaWxlOiBxY2EvaHBudjIxLmJpbgorIyAgRmlsZTogcWNhL2hwbnYyMWcuYmlu
CisjICBGaWxlOiBxY2EvaHBudjIxLjMwMQorIyBAQCAtNDg1Miw2ICs0ODYxLDggQEAKKyMgIEZp
bGU6IHFjYS9ocG52MjFnLjMwMgorIyAgRmlsZTogcWNhL2hwbnYyMS4zMDkKKyMgIEZpbGU6IHFj
YS9ocG52MjFnLjMwOQorIyArRmlsZTogcWNhL2hwbnYyMS4zMGEKKyMgK0ZpbGU6IHFjYS9ocG52
MjFnLjMwYQorIyAgRmlsZTogcWNhL2hwbnYyMS5iOGMKKyMgIEZpbGU6IHFjYS9ocG52MjEuYjlm
CisjICBGaWxlOiBxY2EvaHBudjIxLmJhMAorIyBAQCAtNTMxNSw3ICs1MzI2LDcgQEAKKyMgIFZl
cnNpb246IERNQyBBUEkvQVBCIHZlciAyIHJlbGVhc2UgMjggZm9yIFhlMkxQRAorIyAgCisjICBG
aWxlOiBpOTE1L3hlM2xwZF9kbWMuYmluCisjIC1WZXJzaW9uOiBETUMgQVBJL0FQQiB2ZXIgMiBy
ZWxlYXNlIDEzIGZvciBYZTNMUEQKKyMgK1ZlcnNpb246IERNQyBBUEkvQVBCIHZlciAyIHJlbGVh
c2UgMjAgZm9yIFhlM0xQRAorIyAgCisjICBMaWNlbnNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBM
SUNFTlNFLmk5MTUgZm9yIGRldGFpbHMKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjIEBAIC01MzI2
LDEzICs1MzM3LDEzIEBACisjICBWZXJzaW9uOiBHU0MgQVBJL0FQQiB2MS4wLCByZWxlYXNlIDEw
NC4wLjAuMTI2MywgU1ZOIDEgZm9yIEx1bmFybGFrZQorIyAgCisjICBGaWxlOiB4ZS9sbmxfZ3Vj
XzcwLmJpbgorIyAtVmVyc2lvbjogR3VDIEFQSS9BUEIgdmVyIDcwLjM2LjAgZm9yIEx1bmFybGFr
ZQorIyArVmVyc2lvbjogR3VDIEFQSS9BUEIgdmVyIDcwLjQwLjIgZm9yIEx1bmFybGFrZQorIyAg
CisjICBGaWxlOiB4ZS9sbmxfaHVjLmJpbgorIyAgVmVyc2lvbjogSHVDIEFQSS9BUEIgdmVyIDku
NC4xMyBmb3IgTHVuYXJsYWtlCisjICAKKyMgIEZpbGU6IHhlL2JtZ19ndWNfNzAuYmluCisjIC1W
ZXJzaW9uOiBHdUMgQVBJL0FQQiB2ZXIgNzAuMzYuMCBmb3IgQmF0dGxlbWFnZQorIyArVmVyc2lv
bjogR3VDIEFQSS9BUEIgdmVyIDcwLjQwLjIgZm9yIEJhdHRsZW1hZ2UKKyMgIAorIyAgRmlsZTog
eGUvYm1nX2h1Yy5iaW4KKyMgIFZlcnNpb246IEh1QyBBUEkvQVBCIHZlciA4LjIuMTAgZm9yIEJh
dHRsZW1hZ2UKKyMgQEAgLTYwMzEsOSArNjA0Miw5IEBACisjICBEcml2ZXI6IG10NzkyMCAtIE1l
ZGlhVGVrIE1UNzkyMCBXaXJlbGVzcyBNQUNzCisjICAKKyMgIEZpbGU6IG1lZGlhdGVrL1dJRklf
TVQ3OTYxX3BhdGNoX21jdV8xYV8yX2hkci5iaW4KKyMgLVZlcnNpb246IDIwMjQxMTA0MDkxMDE0
YQorIyArVmVyc2lvbjogMjAyNTAyMTAxNTEwMDRhCisjICBGaWxlOiBtZWRpYXRlay9XSUZJX1JB
TV9DT0RFX01UNzk2MV8xYS5iaW4KKyMgLVZlcnNpb246IDIwMjQxMTA0MDkwODU3CisjICtWZXJz
aW9uOiAyMDI1MDIxMDE1MDg1NQorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNl
ZSBMSUNFTkNFLm1lZGlhdGVrIGZvciBkZXRhaWxzLgorIyAgCisjIEBAIC02MDQyLDcgKzYwNTMs
NyBAQAorIyAgRHJpdmVyOiBtdDc5MjAgLSBNZWRpYVRlayBNVDc5MjAgYmx1ZXRvb3RoIGNoaXBz
ZXQKKyMgIAorIyAgRmlsZTogbWVkaWF0ZWsvQlRfUkFNX0NPREVfTVQ3OTYxXzFhXzJfaGRyLmJp
bgorIyAtVmVyc2lvbjogMjAyNDExMDQwOTEyNDYKKyMgK1ZlcnNpb246IDIwMjUwMjEwMTUxNTAy
CisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UubWVkaWF0ZWsg
Zm9yIGRldGFpbHMuCisjICAKKyMgQEAgLTYwOTEsOSArNjEwMiw5IEBACisjICBEcml2ZXI6IG10
NzkyNSAtIE1lZGlhVGVrIE1UNzkyNSBXaXJlbGVzcyBNQUNzCisjICAKKyMgIEZpbGU6IG1lZGlh
dGVrL210NzkyNS9XSUZJX01UNzkyNV9QQVRDSF9NQ1VfMV8xX2hkci5iaW4KKyMgLVZlcnNpb246
IDIwMjUwMTEzMTUzMDAxYQorIyArVmVyc2lvbjogMjAyNTAzMDUxMzI5MDhhCisjICBGaWxlOiBt
ZWRpYXRlay9tdDc5MjUvV0lGSV9SQU1fQ09ERV9NVDc5MjVfMV8xLmJpbgorIyAtVmVyc2lvbjog
MjAyNTAxMTMxNTI4NTQKKyMgK1ZlcnNpb246IDIwMjUwMzA1MTMyODAyCisjICAKKyMgIExpY2Vu
Y2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UubWVkaWF0ZWsgZm9yIGRldGFpbHMuCisj
ICAKKyMgQEAgLTYxMDIsNyArNjExMyw3IEBACisjICBEcml2ZXI6IG10NzkyNSAtIE1lZGlhVGVr
IE1UNzkyNSBibHVldG9vdGggY2hpcHNldAorIyAgCisjICBGaWxlOiBtZWRpYXRlay9tdDc5MjUv
QlRfUkFNX0NPREVfTVQ3OTI1XzFfMV9oZHIuYmluCisjIC1WZXJzaW9uOiAyMDI1MDExMzE1MzMw
NworIyArVmVyc2lvbjogMjAyNTAzMDUxMzMyMTUKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmli
dXRhYmxlLiBTZWUgTElDRU5DRS5tZWRpYXRlayBmb3IgZGV0YWlscy4KKyMgIAorIyBAQCAtNjM2
OSw2ICs2MzgwLDggQEAKKyMgIAorIyAgRHJpdmVyOiBhZHJlbm8gLSBRdWFsY29tbSBBZHJlbm8g
R1BVIGZpcm13YXJlCisjICAKKyMgK0ZpbGU6IHFjb20vYTIyNV9wZnAuZncKKyMgK0ZpbGU6IHFj
b20vYTIyNV9wbTQuZncKKyMgIEZpbGU6IHFjb20vYTMwMF9wZnAuZncKKyMgIExpbms6IGEzMDBf
cGZwLmZ3IC0+IHFjb20vYTMwMF9wZnAuZncKKyMgIEZpbGU6IHFjb20vYTMwMF9wbTQuZncKKyMg
QEAgLTY0MDIsNiArNjQxNSw4IEBACisjICBGaWxlOiBxY29tL2E2NjNfZ211LmJpbgorIyAgRmls
ZTogcWNvbS9zYTg3NzVwL2E2NjNfemFwLm1ibgorIyAgRmlsZTogcWNvbS9xY3M2MTUvYTYxMl96
YXAubWJuCisjICtGaWxlOiBxY29tL2E2MjNfZ211LmJpbgorIyArRmlsZTogcWNvbS9xY3M4MzAw
L2E2MjNfemFwLm1ibgorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNF
TlNFLnFjb20gYW5kIHFjb20vTk9USUNFLnR4dCBmb3IgZGV0YWlscworIyAgCisjIEBAIC02ODYy
LDcgKzY4NzcsNyBAQAorIyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisjIC1Ecml2ZXI6
IGNzMzVsNDFfaGRhIC0gQ1MzNWw0MSBBTFNBIEhEQSBhdWRpbyBkcml2ZXIKKyMgK0RyaXZlcjog
Y3MzNWw0MSAtIENTMzVMNDEgQUxTQSBhdWRpbyBkcml2ZXIgKGluY2x1ZGVzIGNzMzVsNDFfaGRh
KQorIyAgCisjICBGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LndtZncKKyMgIEZp
bGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QuYmluCisjIEBAIC03NDQ1LDYgKzc0NjAs
MTE3IEBACisjICBGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMxZWQzLXNw
a2lkMC1yMC5iaW4KKyMgIEZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzFl
ZDMtc3BraWQxLWwwLmJpbgorIyAgRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0x
MDQzMWVkMy1zcGtpZDEtcjAuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1w
cm90LTEwNDMzMGMxLndtZncgLT4gY3MzNWw0MS92Ni44My4wL2hhbG9fY3NwbF9SQU1fcmV2QjJf
MjkuODUuMC53bWZ3CisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMz
MWUxLndtZncgLT4gY3MzNWw0MS92Ni44My4wL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuODUuMC53
bWZ3CisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMzMGUxLndtZncg
LT4gY3MzNWw0MS92Ni44My4wL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuODUuMC53bWZ3CisjICtM
aW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMzMWYxLndtZncgLT4gY3MzNWw0
MS92Ni44My4wL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuODUuMC53bWZ3CisjICtMaW5rOiBjaXJy
dXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMzMDExLndtZncgLT4gY3MzNWw0MS92Ni44My4w
L2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuODUuMC53bWZ3CisjICtMaW5rOiBjaXJydXMvY3MzNWw0
MS1kc3AxLXNway1wcm90LTEwNDMzZmQwLndtZncgLT4gY3MzNWw0MS92Ni44My4wL2hhbG9fY3Nw
bF9SQU1fcmV2QjJfMjkuODUuMC53bWZ3CisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNw
ay1wcm90LTEwNDMzMGMxLXNwa2lkMC1sMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRz
cDEtc3BrLXByb3QtMTA0MzMwYzEtc3BraWQwLXIwLmJpbgorIyArTGluazogY2lycnVzL2NzMzVs
NDEtZHNwMS1zcGstcHJvdC0xMDQzMzBjMS1zcGtpZDEtbDAuYmluIC0+IGNzMzVsNDEtZHNwMS1z
cGstcHJvdC0xMDQzMzBjMS1zcGtpZDAtbDAuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1k
c3AxLXNway1wcm90LTEwNDMzMGMxLXNwa2lkMS1yMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1w
cm90LTEwNDMzMGMxLXNwa2lkMC1yMC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEt
c3BrLXByb3QtMTA0MzMxZTEtc3BraWQwLWwwLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLXByb3Qt
MTA0MzMwYzEtc3BraWQwLWwwLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGst
cHJvdC0xMDQzMzFlMS1zcGtpZDAtcjAuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQz
MzBjMS1zcGtpZDAtcjAuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90
LTEwNDMzMWUxLXNwa2lkMS1sMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMzMGMx
LXNwa2lkMC1sMC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0
MzMxZTEtc3BraWQxLXIwLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzMwYzEtc3Br
aWQwLXIwLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMzBl
MS1zcGtpZDAtbDAuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMzBjMS1zcGtpZDAt
bDAuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMzMGUxLXNw
a2lkMC1yMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMzMGMxLXNwa2lkMC1yMC5i
aW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzMwZTEtc3BraWQx
LWwwLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzMwYzEtc3BraWQwLWwwLmJpbgor
IyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMzBlMS1zcGtpZDEtcjAu
YmluIC0+IGNzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMzBjMS1zcGtpZDAtcjAuYmluCisjICtM
aW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMzMWYxLXNwa2lkMC1sMC5iaW4g
LT4gY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMzMGMxLXNwa2lkMC1sMC5iaW4KKyMgK0xpbms6
IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzMxZjEtc3BraWQwLXIwLmJpbiAtPiBj
czM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzMwYzEtc3BraWQwLXIwLmJpbgorIyArTGluazogY2ly
cnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMzFmMS1zcGtpZDEtbDAuYmluIC0+IGNzMzVs
NDEtZHNwMS1zcGstcHJvdC0xMDQzMzBjMS1zcGtpZDAtbDAuYmluCisjICtMaW5rOiBjaXJydXMv
Y3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMzMWYxLXNwa2lkMS1yMC5iaW4gLT4gY3MzNWw0MS1k
c3AxLXNway1wcm90LTEwNDMzMGMxLXNwa2lkMC1yMC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1
bDQxLWRzcDEtc3BrLXByb3QtMTA0MzMwMTEtc3BraWQwLWwwLmJpbiAtPiBjczM1bDQxLWRzcDEt
c3BrLXByb3QtMTA0MzMwYzEtc3BraWQwLWwwLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEt
ZHNwMS1zcGstcHJvdC0xMDQzMzAxMS1zcGtpZDAtcjAuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGst
cHJvdC0xMDQzMzBjMS1zcGtpZDAtcjAuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3Ax
LXNway1wcm90LTEwNDMzMDExLXNwa2lkMS1sMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1wcm90
LTEwNDMzMGMxLXNwa2lkMC1sMC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3Br
LXByb3QtMTA0MzMwMTEtc3BraWQxLXIwLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0
MzMwYzEtc3BraWQwLXIwLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJv
dC0xMDQzM2ZkMC1zcGtpZDAtbDAuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMzBj
MS1zcGtpZDAtbDAuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEw
NDMzZmQwLXNwa2lkMC1yMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMzMGMxLXNw
a2lkMC1yMC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzNm
ZDAtc3BraWQxLWwwLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzMwYzEtc3BraWQw
LWwwLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzM2ZkMC1z
cGtpZDEtcjAuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMzBjMS1zcGtpZDAtcjAu
YmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMzMDcxLndtZncg
LT4gY3MzNWw0MS92Ni44My4wL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuODUuMC53bWZ3CisjICtM
aW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMzMGQxLndtZncgLT4gY3MzNWw0
MS92Ni44My4wL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuODUuMC53bWZ3CisjICtMaW5rOiBjaXJy
dXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMzZmYwLndtZncgLT4gY3MzNWw0MS92Ni44My4w
L2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuODUuMC53bWZ3CisjICtGaWxlOiBjaXJydXMvY3MzNWw0
MS1kc3AxLXNway1wcm90LTEwNDMzMDcxLXNwa2lkMC1sMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9j
czM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzMwNzEtc3BraWQwLXIwLmJpbgorIyArTGluazogY2ly
cnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMzA3MS1zcGtpZDEtbDAuYmluIC0+IGNzMzVs
NDEtZHNwMS1zcGstcHJvdC0xMDQzMzA3MS1zcGtpZDAtbDAuYmluCisjICtMaW5rOiBjaXJydXMv
Y3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMzMDcxLXNwa2lkMS1yMC5iaW4gLT4gY3MzNWw0MS1k
c3AxLXNway1wcm90LTEwNDMzMDcxLXNwa2lkMC1yMC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1
bDQxLWRzcDEtc3BrLXByb3QtMTA0MzMwZDEtc3BraWQwLWwwLmJpbiAtPiBjczM1bDQxLWRzcDEt
c3BrLXByb3QtMTA0MzMwNzEtc3BraWQwLWwwLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEt
ZHNwMS1zcGstcHJvdC0xMDQzMzBkMS1zcGtpZDAtcjAuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGst
cHJvdC0xMDQzMzA3MS1zcGtpZDAtcjAuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3Ax
LXNway1wcm90LTEwNDMzMGQxLXNwa2lkMS1sMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1wcm90
LTEwNDMzMDcxLXNwa2lkMC1sMC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3Br
LXByb3QtMTA0MzMwZDEtc3BraWQxLXIwLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0
MzMwNzEtc3BraWQwLXIwLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJv
dC0xMDQzM2ZmMC1zcGtpZDAtbDAuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMzA3
MS1zcGtpZDAtbDAuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEw
NDMzZmYwLXNwa2lkMC1yMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMzMDcxLXNw
a2lkMC1yMC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzNm
ZjAtc3BraWQxLWwwLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzMwNzEtc3BraWQw
LWwwLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzM2ZmMC1z
cGtpZDEtcjAuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMzA3MS1zcGtpZDAtcjAu
YmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMzMDYxLndtZncg
LT4gY3MzNWw0MS92Ni44My4wL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuODUuMC53bWZ3CisjICtM
aW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMxMmI0LndtZncgLT4gY3MzNWw0
MS92Ni44My4wL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuODUuMC53bWZ3CisjICtMaW5rOiBjaXJy
dXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMxMjk0LndtZncgLT4gY3MzNWw0MS92Ni44My4w
L2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuODUuMC53bWZ3CisjICtGaWxlOiBjaXJydXMvY3MzNWw0
MS1kc3AxLXNway1wcm90LTEwNDMzMDYxLXNwa2lkMC1sMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9j
czM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzMwNjEtc3BraWQwLXIwLmJpbgorIyArTGluazogY2ly
cnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMzA2MS1zcGtpZDEtbDAuYmluIC0+IGNzMzVs
NDEtZHNwMS1zcGstcHJvdC0xMDQzMzA2MS1zcGtpZDAtbDAuYmluCisjICtMaW5rOiBjaXJydXMv
Y3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMzMDYxLXNwa2lkMS1yMC5iaW4gLT4gY3MzNWw0MS1k
c3AxLXNway1wcm90LTEwNDMzMDYxLXNwa2lkMC1yMC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1
bDQxLWRzcDEtc3BrLXByb3QtMTA0MzEyYjQtc3BraWQwLWwwLmJpbiAtPiBjczM1bDQxLWRzcDEt
c3BrLXByb3QtMTA0MzMwNjEtc3BraWQwLWwwLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEt
ZHNwMS1zcGstcHJvdC0xMDQzMTJiNC1zcGtpZDAtcjAuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGst
cHJvdC0xMDQzMzA2MS1zcGtpZDAtcjAuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3Ax
LXNway1wcm90LTEwNDMxMmI0LXNwa2lkMS1sMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1wcm90
LTEwNDMzMDYxLXNwa2lkMC1sMC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3Br
LXByb3QtMTA0MzEyYjQtc3BraWQxLXIwLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0
MzMwNjEtc3BraWQwLXIwLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJv
dC0xMDQzMTI5NC1zcGtpZDAtbDAuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMzA2
MS1zcGtpZDAtbDAuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEw
NDMxMjk0LXNwa2lkMC1yMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMzMDYxLXNw
a2lkMC1yMC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzEy
OTQtc3BraWQxLWwwLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzMwNjEtc3BraWQw
LWwwLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMTI5NC1z
cGtpZDEtcjAuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMzA2MS1zcGtpZDAtcjAu
YmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMxZjYzLndtZncg
LT4gY3MzNWw0MS92Ni44My4wL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuODUuMC53bWZ3CisjICtG
aWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMxZjYzLWwwLmJpbgorIyArRmls
ZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMWY2My1yMC5iaW4KKyMgK0xpbms6
IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzFmYjMud21mdyAtPiBjczM1bDQxL3Y2
LjgzLjAvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS44NS4wLndtZncKKyMgK0xpbms6IGNpcnJ1cy9j
czM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzExOTQud21mdyAtPiBjczM1bDQxL3Y2LjgzLjAvaGFs
b19jc3BsX1JBTV9yZXZCMl8yOS44NS4wLndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRz
cDEtc3BrLXByb3QtMTA0MzNlMjAud21mdyAtPiBjczM1bDQxL3Y2LjgzLjAvaGFsb19jc3BsX1JB
TV9yZXZCMl8yOS44NS4wLndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXBy
b3QtMTA0MzNlMDAud21mdyAtPiBjczM1bDQxL3Y2LjgzLjAvaGFsb19jc3BsX1JBTV9yZXZCMl8y
OS44NS4wLndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzEw
NzQud21mdyAtPiBjczM1bDQxL3Y2LjgzLjAvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS44NS4wLndt
ZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzEwNTQud21mdyAt
PiBjczM1bDQxL3Y2LjgzLjAvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS44NS4wLndtZncKKyMgK0Zp
bGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzFmYjMtc3BraWQwLWwwLmJpbgor
IyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMWZiMy1zcGtpZDAtcjAu
YmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMxZmIzLXNwa2lk
MS1sMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzFmYjMt
c3BraWQxLXIwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQz
MTE5NC1zcGtpZDAtbDAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90
LTEwNDMxMTk0LXNwa2lkMC1yMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3Br
LXByb3QtMTA0MzExOTQtc3BraWQxLWwwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNw
MS1zcGstcHJvdC0xMDQzMTE5NC1zcGtpZDEtcjAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0
MS1kc3AxLXNway1wcm90LTEwNDMzZTIwLXNwa2lkMC1sMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9j
czM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzNlMjAtc3BraWQwLXIwLmJpbgorIyArRmlsZTogY2ly
cnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzM2UyMC1zcGtpZDEtbDAuYmluCisjICtGaWxl
OiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMzZTIwLXNwa2lkMS1yMC5iaW4KKyMg
K0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzNlMDAtc3BraWQwLWwwLmJp
biAtPiBjczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzNlMjAtc3BraWQwLWwwLmJpbgorIyArTGlu
azogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzM2UwMC1zcGtpZDAtcjAuYmluIC0+
IGNzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzM2UyMC1zcGtpZDAtcjAuYmluCisjICtMaW5rOiBj
aXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMzZTAwLXNwa2lkMS1sMC5iaW4gLT4gY3Mz
NWw0MS1kc3AxLXNway1wcm90LTEwNDMzZTIwLXNwa2lkMS1sMC5iaW4KKyMgK0xpbms6IGNpcnJ1
cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzNlMDAtc3BraWQxLXIwLmJpbiAtPiBjczM1bDQx
LWRzcDEtc3BrLXByb3QtMTA0MzNlMjAtc3BraWQxLXIwLmJpbgorIyArRmlsZTogY2lycnVzL2Nz
MzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMTA3NC1zcGtpZDAtbDAuYmluCisjICtGaWxlOiBjaXJy
dXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMxMDc0LXNwa2lkMC1yMC5iaW4KKyMgK0ZpbGU6
IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzEwNzQtc3BraWQxLWwwLmJpbgorIyAr
RmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMTA3NC1zcGtpZDEtcjAuYmlu
CisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMxMDU0LXNwa2lkMC1s
MC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMxMDc0LXNwa2lkMC1sMC5iaW4KKyMg
K0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzEwNTQtc3BraWQwLXIwLmJp
biAtPiBjczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzEwNzQtc3BraWQwLXIwLmJpbgorIyArTGlu
azogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMTA1NC1zcGtpZDEtbDAuYmluIC0+
IGNzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMTA3NC1zcGtpZDEtbDAuYmluCisjICtMaW5rOiBj
aXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMxMDU0LXNwa2lkMS1yMC5iaW4gLT4gY3Mz
NWw0MS1kc3AxLXNway1wcm90LTEwNDMxMDc0LXNwa2lkMS1yMC5iaW4KKyMgK0xpbms6IGNpcnJ1
cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzNkNzgud21mdyAtPiBjczM1bDQxL3Y2LjgzLjAv
aGFsb19jc3BsX1JBTV9yZXZCMl8yOS44NS4wLndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQx
LWRzcDEtc3BrLXByb3QtMTA0MzNkODgud21mdyAtPiBjczM1bDQxL3Y2LjgzLjAvaGFsb19jc3Bs
X1JBTV9yZXZCMl8yOS44NS4wLndtZncKKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3Br
LXByb3QtMTA0MzNkNzgtc3BraWQwLWwwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNw
MS1zcGstcHJvdC0xMDQzM2Q3OC1zcGtpZDAtcjAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0
MS1kc3AxLXNway1wcm90LTEwNDMzZDc4LXNwa2lkMS1sMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9j
czM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzNkNzgtc3BraWQxLXIwLmJpbgorIyArTGluazogY2ly
cnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzM2Q3OC1zcGtpZDAtbDAuYmluY2ZnIC0+IGNz
MzVsNDEvYmluY2Zncy9jczM1bDQxLWRzcDEtMTRfNWRCLmJpbmNmZworIyArTGluazogY2lycnVz
L2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzM2Q3OC1zcGtpZDAtcjAuYmluY2ZnIC0+IGNzMzVs
NDEvYmluY2Zncy9jczM1bDQxLWRzcDEtMTRfNWRCLmJpbmNmZworIyArTGluazogY2lycnVzL2Nz
MzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzM2Q3OC1zcGtpZDEtbDAuYmluY2ZnIC0+IGNzMzVsNDEv
YmluY2Zncy9jczM1bDQxLWRzcDEtMTRfNWRCLmJpbmNmZworIyArTGluazogY2lycnVzL2NzMzVs
NDEtZHNwMS1zcGstcHJvdC0xMDQzM2Q3OC1zcGtpZDEtcjAuYmluY2ZnIC0+IGNzMzVsNDEvYmlu
Y2Zncy9jczM1bDQxLWRzcDEtMTRfNWRCLmJpbmNmZworIyArTGluazogY2lycnVzL2NzMzVsNDEt
ZHNwMS1zcGstcHJvdC0xMDQzM2Q4OC1zcGtpZDAtbDAuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGst
cHJvdC0xMDQzM2Q3OC1zcGtpZDAtbDAuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3Ax
LXNway1wcm90LTEwNDMzZDg4LXNwa2lkMC1yMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1wcm90
LTEwNDMzZDc4LXNwa2lkMC1yMC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3Br
LXByb3QtMTA0MzNkODgtc3BraWQxLWwwLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0
MzNkNzgtc3BraWQxLWwwLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJv
dC0xMDQzM2Q4OC1zcGtpZDEtcjAuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzM2Q3
OC1zcGtpZDEtcjAuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEw
NDMzZDg4LXNwa2lkMC1sMC5iaW5jZmcgLT4gY3MzNWw0MS9iaW5jZmdzL2NzMzVsNDEtZHNwMS0x
NF81ZEIuYmluY2ZnCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMz
ZDg4LXNwa2lkMC1yMC5iaW5jZmcgLT4gY3MzNWw0MS9iaW5jZmdzL2NzMzVsNDEtZHNwMS0xNF81
ZEIuYmluY2ZnCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMzZDg4
LXNwa2lkMS1sMC5iaW5jZmcgLT4gY3MzNWw0MS9iaW5jZmdzL2NzMzVsNDEtZHNwMS0xNF81ZEIu
YmluY2ZnCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMzZDg4LXNw
a2lkMS1yMC5iaW5jZmcgLT4gY3MzNWw0MS9iaW5jZmdzL2NzMzVsNDEtZHNwMS0xNF81ZEIuYmlu
Y2ZnCisjICBMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTE3YWEyMzE2LndtZncg
LT4gY3MzNWw0MS92Ni42MS4xL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuNjMuMS53bWZ3CisjICBM
aW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTE3YWEyMzE3LndtZncgLT4gY3MzNWw0
MS92Ni42MS4xL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuNjMuMS53bWZ3CisjICBGaWxlOiBjaXJy
dXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTE3YWEyMzE2LXNwa2lkMC1sMC5iaW4KKyMgQEAgLTc1
OTAsNiArNzcxNiw5IEBACisjICBMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEw
M2M4Y2UwLXNwa2lkMS1yMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4Y2RmLXNw
a2lkMS1sMC5iaW4KKyMgIExpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMWY2NjAx
MDUud21mdyAtPiBjczM1bDQxL3Y2LjgzLjAvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS44NS4wLndt
ZncKKyMgIEZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMWY2NjAxMDUuYmluCisj
ICtGaWxlOiBjaXJydXMvY3MzNWw0MS92Ni41MS4wL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuNTMu
MC53bWZ3CisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LXZsdjE3NzYud21m
dyAtPiBjczM1bDQxL3Y2LjUxLjAvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS41My4wLndtZncKKyMg
K0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3Qtdmx2MTc3Ni5iaW4KKyMgIAorIyAg
TGljZW5zZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5jaXJydXMgZm9yIGRldGFpbHMu
CisjICAKKyMgQEAgLTc2MDgsOSArNzczNyw5IEBACisjICBGaWxlOiBjaXJydXMvY3MzNWw1Ni9D
UzM1TDU2X1JldjMuMTEuMTYud21mdworIyAgRmlsZTogY2lycnVzL2NzMzVsNTYvQ1MzNUw1Nl9S
ZXYzLjExLjE4LndtZncKKyMgIEZpbGU6IGNpcnJ1cy9jczM1bDU2L0NTMzVMNTZfUmV2My4xMS4y
MC53bWZ3CisjICtGaWxlOiBjaXJydXMvY3MzNWw1Ni9DUzM1TDU2X1JldjMuMTEuMjEud21mdwor
IyAgRmlsZTogY2lycnVzL2NzMzVsNTYvQ1MzNUw1Nl9SZXYzLjExLjI1LndtZncKKyMgIEZpbGU6
IGNpcnJ1cy9jczM1bDU2L0NTMzVMNTZfUmV2My4xMS4yNi53bWZ3CisjIC1GaWxlOiBjaXJydXMv
Y3MzNWw1Ni9DUzM1TDU2X1JldjMuMTEuMjcud21mdworIyAgRmlsZTogY2lycnVzL2NzMzVsNTYv
Q1MzNUw1Nl9SZXYzLjExLjI4LndtZncKKyMgIExpbms6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEt
bWlzYy0xMDI4MGM2Mi1zcGtpZDAud21mdyAtPiBjczM1bDU2L0NTMzVMNTZfUmV2My4xMS4xMS53
bWZ3CisjICBGaWxlOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTAyODBjNjItc3BraWQw
LWFtcDEuYmluCisjIEBAIC03NjY2LDE2ICs3Nzk1LDE2IEBACisjICBMaW5rOiBjaXJydXMvY3Mz
NWw1Ni1iMC1kc3AxLW1pc2MtMTAyODBjZTQtc3BraWQzLndtZncgLT4gY3MzNWw1Ni9DUzM1TDU2
X1JldjMuMTEuMjUud21mdworIyAgRmlsZTogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTEw
MjgwY2U0LXNwa2lkMy1hbXBsLmJpbgorIyAgRmlsZTogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1t
aXNjLTEwMjgwY2U0LXNwa2lkMy1hbXByLmJpbgorIyAtTGluazogY2lycnVzL2NzMzVsNTYtYjAt
ZHNwMS1taXNjLTEwMjgwZDEyLXNwa2lkMC53bWZ3IC0+IGNzMzVsNTYvQ1MzNUw1Nl9SZXYzLjEx
LjI3LndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xMDI4MGQxMi1z
cGtpZDAud21mdyAtPiBjczM1bDU2L0NTMzVMNTZfUmV2My4xMS4yOC53bWZ3CisjICBGaWxlOiBj
aXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTAyODBkMTItc3BraWQwLWFtcDEuYmluCisjICBG
aWxlOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTAyODBkMTItc3BraWQwLWFtcDIuYmlu
CisjIC1MaW5rOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTAyODBkMTItc3BraWQxLndt
ZncgLT4gY3MzNWw1Ni9DUzM1TDU2X1JldjMuMTEuMjcud21mdworIyArTGluazogY2lycnVzL2Nz
MzVsNTYtYjAtZHNwMS1taXNjLTEwMjgwZDEyLXNwa2lkMS53bWZ3IC0+IGNzMzVsNTYvQ1MzNUw1
Nl9SZXYzLjExLjI4LndtZncKKyMgIEZpbGU6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0x
MDI4MGQxMi1zcGtpZDEtYW1wMS5iaW4KKyMgIEZpbGU6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEt
bWlzYy0xMDI4MGQxMi1zcGtpZDEtYW1wMi5iaW4KKyMgLUxpbms6IGNpcnJ1cy9jczM1bDU2LWIw
LWRzcDEtbWlzYy0xMDI4MGQxMy1zcGtpZDAud21mdyAtPiBjczM1bDU2L0NTMzVMNTZfUmV2My4x
MS4yNy53bWZ3CisjICtMaW5rOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTAyODBkMTMt
c3BraWQwLndtZncgLT4gY3MzNWw1Ni9DUzM1TDU2X1JldjMuMTEuMjgud21mdworIyAgRmlsZTog
Y2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTEwMjgwZDEzLXNwa2lkMC1hbXAxLmJpbgorIyAg
RmlsZTogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTEwMjgwZDEzLXNwa2lkMC1hbXAyLmJp
bgorIyAtTGluazogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTEwMjgwZDEzLXNwa2lkMS53
bWZ3IC0+IGNzMzVsNTYvQ1MzNUw1Nl9SZXYzLjExLjI3LndtZncKKyMgK0xpbms6IGNpcnJ1cy9j
czM1bDU2LWIwLWRzcDEtbWlzYy0xMDI4MGQxMy1zcGtpZDEud21mdyAtPiBjczM1bDU2L0NTMzVM
NTZfUmV2My4xMS4yOC53bWZ3CisjICBGaWxlOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2Mt
MTAyODBkMTMtc3BraWQxLWFtcDEuYmluCisjICBGaWxlOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3Ax
LW1pc2MtMTAyODBkMTMtc3BraWQxLWFtcDIuYmluCisjICBMaW5rOiBjaXJydXMvY3MzNWw1Ni1i
MC1kc3AxLW1pc2MtMTAzYzhjNTIud21mdyAtPiBjczM1bDU2L0NTMzVMNTZfUmV2My4xMS4xNi53
bWZ3CisjIEBAIC03Njk0LDEwICs3ODIzLDEwIEBACisjICBGaWxlOiBjaXJydXMvY3MzNWw1NC1i
MC1kc3AxLW1pc2MtMTAzYzhkMDEtYW1wMy5iaW4KKyMgIEZpbGU6IGNpcnJ1cy9jczM1bDU0LWIw
LWRzcDEtbWlzYy0xMDNjOGQwMS1hbXA0LmJpbgorIyAgTGluazogY2lycnVzL2NzMzVsNTQtYjAt
ZHNwMS1taXNjLTEwM2M4ZDA4LndtZncgLT4gY3MzNWw1Ni9DUzM1TDU2X1JldjMuMTEuMTgud21m
dworIyAtTGluazogY2lycnVzL2NzMzVsNTQtYjAtZHNwMS1taXNjLTEwM2M4ZDA4LWFtcDEuYmlu
IC0+IGNzMzVsNTQtYjAtZHNwMS1taXNjLTEwM2M4ZDAxLWFtcDEuYmluCisjIC1MaW5rOiBjaXJy
dXMvY3MzNWw1NC1iMC1kc3AxLW1pc2MtMTAzYzhkMDgtYW1wMi5iaW4gLT4gY3MzNWw1NC1iMC1k
c3AxLW1pc2MtMTAzYzhkMDEtYW1wMi5iaW4KKyMgLUxpbms6IGNpcnJ1cy9jczM1bDU0LWIwLWRz
cDEtbWlzYy0xMDNjOGQwOC1hbXAzLmJpbiAtPiBjczM1bDU0LWIwLWRzcDEtbWlzYy0xMDNjOGQw
MS1hbXAzLmJpbgorIyAtTGluazogY2lycnVzL2NzMzVsNTQtYjAtZHNwMS1taXNjLTEwM2M4ZDA4
LWFtcDQuYmluIC0+IGNzMzVsNTQtYjAtZHNwMS1taXNjLTEwM2M4ZDAxLWFtcDQuYmluCisjICtG
aWxlOiBjaXJydXMvY3MzNWw1NC1iMC1kc3AxLW1pc2MtMTAzYzhkMDgtYW1wMS5iaW4KKyMgK0Zp
bGU6IGNpcnJ1cy9jczM1bDU0LWIwLWRzcDEtbWlzYy0xMDNjOGQwOC1hbXAyLmJpbgorIyArRmls
ZTogY2lycnVzL2NzMzVsNTQtYjAtZHNwMS1taXNjLTEwM2M4ZDA4LWFtcDMuYmluCisjICtGaWxl
OiBjaXJydXMvY3MzNWw1NC1iMC1kc3AxLW1pc2MtMTAzYzhkMDgtYW1wNC5iaW4KKyMgIExpbms6
IGNpcnJ1cy9jczM1bDU0LWIwLWRzcDEtbWlzYy0xMDNjOGQ4NS53bWZ3IC0+IGNzMzVsNTYvQ1Mz
NUw1Nl9SZXYzLjExLjExLjEud21mdworIyAgRmlsZTogY2lycnVzL2NzMzVsNTQtYjAtZHNwMS1t
aXNjLTEwM2M4ZDg1LWFtcDEuYmluCisjICBGaWxlOiBjaXJydXMvY3MzNWw1NC1iMC1kc3AxLW1p
c2MtMTAzYzhkODUtYW1wMi5iaW4KKyMgQEAgLTc3NjIsNiArNzg5MSwxOCBAQAorIyAgTGluazog
Y2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTEwM2M4ZTJjLndtZncgLT4gY3MzNWw1Ni9DUzM1
TDU2X1JldjMuMTEuMTEuMS53bWZ3CisjICBMaW5rOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1p
c2MtMTAzYzhlMmMtYW1wMS5iaW4gLT4gY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTAzYzhkOTAtYW1w
MS5iaW4KKyMgIExpbms6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xMDNjOGUyYy1hbXAy
LmJpbiAtPiBjczM1bDU2LWIwLWRzcDEtbWlzYy0xMDNjOGQ5MC1hbXAyLmJpbgorIyArTGluazog
Y2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTEwNDMxMDI0LXNwa2lkMC53bWZ3IC0+IGNzMzVs
NTYvQ1MzNUw1Nl9SZXYzLjExLjE2LndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDU2LWIwLWRz
cDEtbWlzYy0xMDQzMTAyNC1zcGtpZDAtYW1wMS5iaW4gLT4gY3MzNWw1Ni1iMC1kc3AxLW1pc2Mt
MTA0MzEwNDQtc3BraWQwLWFtcDEuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3Ax
LW1pc2MtMTA0MzEwMjQtc3BraWQwLWFtcDIuYmluIC0+IGNzMzVsNTYtYjAtZHNwMS1taXNjLTEw
NDMxMDQ0LXNwa2lkMC1hbXAyLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1t
aXNjLTEwNDMxMDI0LXNwa2lkMS53bWZ3IC0+IGNzMzVsNTYvQ1MzNUw1Nl9SZXYzLjExLjE2Lndt
ZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xMDQzMTAyNC1zcGtpZDEt
YW1wMS5iaW4gLT4gY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTA0MzEwNDQtc3BraWQxLWFtcDEuYmlu
CisjICtMaW5rOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTA0MzEwMjQtc3BraWQxLWFt
cDIuYmluIC0+IGNzMzVsNTYtYjAtZHNwMS1taXNjLTEwNDMxMDQ0LXNwa2lkMS1hbXAyLmJpbgor
IyArTGluazogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTEwNDMxMDQ0LXNwa2lkMC53bWZ3
IC0+IGNzMzVsNTYvQ1MzNUw1Nl9SZXYzLjExLjE2LndtZncKKyMgK0ZpbGU6IGNpcnJ1cy9jczM1
bDU2LWIwLWRzcDEtbWlzYy0xMDQzMTA0NC1zcGtpZDAtYW1wMS5iaW4KKyMgK0ZpbGU6IGNpcnJ1
cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xMDQzMTA0NC1zcGtpZDAtYW1wMi5iaW4KKyMgK0xpbms6
IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xMDQzMTA0NC1zcGtpZDEud21mdyAtPiBjczM1
bDU2L0NTMzVMNTZfUmV2My4xMS4xNi53bWZ3CisjICtGaWxlOiBjaXJydXMvY3MzNWw1Ni1iMC1k
c3AxLW1pc2MtMTA0MzEwNDQtc3BraWQxLWFtcDEuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw1
Ni1iMC1kc3AxLW1pc2MtMTA0MzEwNDQtc3BraWQxLWFtcDIuYmluCisjICBMaW5rOiBjaXJydXMv
Y3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTA0MzEyNjQud21mdyAtPiBjczM1bDU2L0NTMzVMNTZfUmV2
My4xMS4xNi53bWZ3CisjICBMaW5rOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTA0MzEy
NjQtYW1wMS5iaW4gLT4gY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTA0MzFkZjMtYW1wMS5iaW4KKyMg
IExpbms6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xMDQzMTI2NC1hbXAyLmJpbiAtPiBj
czM1bDU2LWIwLWRzcDEtbWlzYy0xMDQzMWRmMy1hbXAyLmJpbgorIyBAQCAtNzgyNSw5ICs3OTY2
LDM5IEBACisjICBMaW5rOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTdhYTM4MzItc3Br
aWQxLndtZncgLT4gY3MzNWw1Ni9DUzM1TDU2X1JldjMuMTEuMjYud21mdworIyAgRmlsZTogY2ly
cnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTE3YWEzODMyLXNwa2lkMS1hbXBsLmJpbgorIyAgRmls
ZTogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTE3YWEzODMyLXNwa2lkMS1hbXByLmJpbgor
IyArTGluazogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTE3YWEzODM4LXNwa2lkMC53bWZ3
IC0+IGNzMzVsNTYvQ1MzNUw1Nl9SZXYzLjExLjIwLndtZncKKyMgK0ZpbGU6IGNpcnJ1cy9jczM1
bDU2LWIwLWRzcDEtbWlzYy0xN2FhMzgzOC1zcGtpZDAtYW1wbC5iaW4KKyMgK0ZpbGU6IGNpcnJ1
cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xN2FhMzgzOC1zcGtpZDAtYW1wci5iaW4KKyMgK0xpbms6
IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xN2FhMzgzOC1zcGtpZDEud21mdyAtPiBjczM1
bDU2L0NTMzVMNTZfUmV2My4xMS4yMC53bWZ3CisjICtGaWxlOiBjaXJydXMvY3MzNWw1Ni1iMC1k
c3AxLW1pc2MtMTdhYTM4Mzgtc3BraWQxLWFtcGwuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw1
Ni1iMC1kc3AxLW1pc2MtMTdhYTM4Mzgtc3BraWQxLWFtcHIuYmluCisjICBMaW5rOiBjaXJydXMv
Y3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTdhYTM5MDUud21mdyAtPiBjczM1bDU2L0NTMzVMNTZfUmV2
My4xMS4xOC53bWZ3CisjICBGaWxlOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTdhYTM5
MDUtYW1wMS5iaW4KKyMgIEZpbGU6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xN2FhMzkw
NS1hbXAyLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTE3YWEzOTBi
LndtZncgLT4gY3MzNWw1Ni9DUzM1TDU2X1JldjMuMTEuMjEud21mdworIyArRmlsZTogY2lycnVz
L2NzMzVsNTYtYjAtZHNwMS1taXNjLTE3YWEzOTBiLWFtcDEuYmluCisjICtGaWxlOiBjaXJydXMv
Y3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTdhYTM5MGItYW1wMi5iaW4KKyMgK0xpbms6IGNpcnJ1cy9j
czM1bDU2LWIwLWRzcDEtbWlzYy0xN2FhMzkwYy1zcGtpZDEud21mdyAtPiBjczM1bDU2L0NTMzVM
NTZfUmV2My4xMS4xOC53bWZ3CisjICtGaWxlOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2Mt
MTdhYTM5MGMtc3BraWQxLWFtcDEuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3Ax
LW1pc2MtMTdhYTM5MGMtc3BraWQxLWFtcDIuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw1Ni1i
MC1kc3AxLW1pc2MtMTdhYTM5MGQtc3BraWQwLndtZncgLT4gY3MzNWw1Ni9DUzM1TDU2X1JldjMu
MTEuMTgud21mdworIyArRmlsZTogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTE3YWEzOTBk
LXNwa2lkMC1hbXAxLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTE3
YWEzOTBkLXNwa2lkMC1hbXAyLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1t
aXNjLTE3YWEzOTEwLXNwa2lkMS53bWZ3IC0+IGNzMzVsNTYvQ1MzNUw1Nl9SZXYzLjExLjE4Lndt
ZncKKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xN2FhMzkxMC1zcGtpZDEt
YW1wMS5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xN2FhMzkxMC1z
cGtpZDEtYW1wMi5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xN2Fh
MzkxMS1zcGtpZDAud21mdyAtPiBjczM1bDU2L0NTMzVMNTZfUmV2My4xMS4xOC53bWZ3CisjICtG
aWxlOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTdhYTM5MTEtc3BraWQwLWFtcDEuYmlu
CisjICtGaWxlOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTdhYTM5MTEtc3BraWQwLWFt
cDIuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTdhYTM5MWItc3Br
aWQwLndtZncgLT4gY3MzNWw1Ni9DUzM1TDU2X1JldjMuMTEuMjEud21mdworIyArRmlsZTogY2ly
cnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTE3YWEzOTFiLXNwa2lkMC1hbXAxLmJpbgorIyArRmls
ZTogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTE3YWEzOTFiLXNwa2lkMC1hbXAyLmJpbgor
IyArTGluazogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTE3YWEzOTFlLXNwa2lkMS53bWZ3
IC0+IGNzMzVsNTYvQ1MzNUw1Nl9SZXYzLjExLjIxLndtZncKKyMgK0ZpbGU6IGNpcnJ1cy9jczM1
bDU2LWIwLWRzcDEtbWlzYy0xN2FhMzkxZS1zcGtpZDEtYW1wMS5iaW4KKyMgK0ZpbGU6IGNpcnJ1
cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xN2FhMzkxZS1zcGtpZDEtYW1wMi5iaW4KKyMgK0xpbms6
IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xN2FhMzkyMS1zcGtpZDAud21mdyAtPiBjczM1
bDU2L0NTMzVMNTZfUmV2My4xMS4yMS53bWZ3CisjICtGaWxlOiBjaXJydXMvY3MzNWw1Ni1iMC1k
c3AxLW1pc2MtMTdhYTM5MjEtc3BraWQwLWFtcDEuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw1
Ni1iMC1kc3AxLW1pc2MtMTdhYTM5MjEtc3BraWQwLWFtcDIuYmluCisjICAKKyMgIExpY2Vuc2U6
IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UuY2lycnVzIGZvciBkZXRhaWxzLgorIyAgCisj
IEBAIC04MDMxLDYgKzgyMDIsMTAgQEAKKyMgIExpbms6IFRBUzJYWFgxMDNDOERFODEuYmluIC0+
IHRpL3RhczI3ODEvVEFTMlhYWDhERTguYmluCisjICBMaW5rOiBUQVMyWFhYMTAzQzhERTkwLmJp
biAtPiB0aS90YXMyNzgxL1RBUzJYWFg4REU5LmJpbgorIyAgTGluazogVEFTMlhYWDEwM0M4REU5
MS5iaW4gLT4gdGkvdGFzMjc4MS9UQVMyWFhYOERFOS5iaW4KKyMgK0xpbms6IFRBUzJYWFgxMDND
OERFOC0wLmJpbiAtPiB0aS90YXMyNzgxL1RBUzJYWFg4REU4LmJpbgorIyArTGluazogVEFTMlhY
WDEwM0M4REU4LTEuYmluIC0+IHRpL3RhczI3ODEvVEFTMlhYWDhERTguYmluCisjICtMaW5rOiBU
QVMyWFhYMTAzQzhERTktMC5iaW4gLT4gdGkvdGFzMjc4MS9UQVMyWFhYOERFOS5iaW4KKyMgK0xp
bms6IFRBUzJYWFgxMDNDOERFOS0xLmJpbiAtPiB0aS90YXMyNzgxL1RBUzJYWFg4REU5LmJpbgor
IyAgTGluazogVEFTMlhYWDEwQTQwLmJpbiAtPiB0aS90YXMyNzgxL1RBUzJYWFgxMEE0MC5iaW4K
KyMgIExpbms6IFRBUzJYWFgxMEE0MS5iaW4gLT4gdGkvdGFzMjc4MS9UQVMyWFhYMTBBNDEuYmlu
CisjICBMaW5rOiBUQVMyWFhYMTE1NDAuYmluIC0+IHRpL3RhczI3ODEvVEFTMlhYWDExNTQwLmJp
bgorIyBAQCAtODE2MiwzICs4MzM3LDE3IEBACisjICBGaWxlOiBxY29tL3FkdTEwMC94Ymxfcy5t
ZWxmCisjICAKKyMgIExpY2Vuc2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UucWNvbSBh
bmQgcWNvbS9OT1RJQ0UudHh0IGZvciBkZXRhaWxzCisjICsKKyMgKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CisjICsKKyMgK0RyaXZlcjogaW50ZWxfdnB1IC0tIEludGVsIE5QVSBkcml2ZXIKKyMgKworIyAr
RmlsZTogaW50ZWwvdnB1L3ZwdV8zN3h4X3YxLmJpbgorIyArVmVyc2lvbjogY2lfdGFnX3VkMjAy
NTA0X3ZwdV9yY18yMDI1MDExNV8xOTA1CisjICtMaW5rOiBpbnRlbC92cHUvdnB1XzM3eHhfdjAu
MC5iaW4gLT4gdnB1XzM3eHhfdjEuYmluCisjICsKKyMgK0ZpbGU6IGludGVsL3ZwdS92cHVfNDB4
eF92MS5iaW4KKyMgK1ZlcnNpb246IGNpX3RhZ191ZDIwMjUwNF92cHVfcmNfMjAyNTAxMTVfMTkw
NQorIyArTGluazogaW50ZWwvdnB1L3ZwdV80MHh4X3YwLjAuYmluIC0+IHZwdV80MHh4X3YxLmJp
bgorIyArCisjICtMaWNlbnNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLmludGVsX3Zw
dSBmb3IgZGV0YWlscworIyAKKyMKKwogU1VNTUFSWSA9ICJGaXJtd2FyZSBmaWxlcyBmb3IgdXNl
IHdpdGggTGludXgga2VybmVsIgogSE9NRVBBR0UgPSAiaHR0cHM6Ly93d3cua2VybmVsLm9yZy8i
CiBERVNDUklQVElPTiA9ICJMaW51eCBmaXJtd2FyZSBpcyBhIHBhY2thZ2UgZGlzdHJpYnV0ZWQg
YWxvbmdzaWRlIHRoZSBMaW51eCBrZXJuZWwgXApAQCAtMTU2LDcgKzYzOCw3IEBAIExJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOQ0UuQWJpbGlzO21kNT1iNWVlM2Y0MTA3ODBlNTY3MTFh
ZDQ4ZWFkYzIyYjhiYyBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTkNFLnhjNTAw
MDttZDU9MWUxNzBjMTMxNzUzMjNjMzJjN2Y0ZDA5OThkNTNmNjYgXAogICAgICAgICAgICAgICAg
ICAgICBmaWxlOi8vTElDRU5DRS54YzUwMDBjO21kNT0xMmIwMmVmYTMwNDlkYjY1ZDUyNGFlYjQx
OGRkODdjYSBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly93ZngvTElDRU5DRS53ZjIwMDtt
ZDU9NGQxYmVmZjAwZDkwMmMwNWM5YzdlOTVhNWQ4ZWI1MmQgXAotICAgICAgICAgICAgICAgICAg
ICBmaWxlOi8vV0hFTkNFO21kNT0ke1dIRU5DRV9DSEtTVU19IFwKKyAgICAgICAgICAgICAgICAg
ICAgZmlsZTovL1dIRU5DRTttZDU9ODg2OTI0ZWI3MzNjNGVmY2VjMjFkZmY5ODA3OTU3NzEgXAog
ICAgICAgICAgICAgICAgICAgICAiCiAjIFdIRU5DRSBjaGVja3N1bSBpcyBkZWZpbmVkIHNlcGFy
YXRlbHkgdG8gZWFzZSBvdmVycmlkaW5nIGl0IGlmCiAjIGNsYXNzLWRldnVwc3RyZWFtIGlzIHNl
bGVjdGVkLgpAQCAtMjUwLDcgKzczMiw3IEBAIFNSQ19VUkk6Y2xhc3MtZGV2dXBzdHJlYW0gPSAi
Z2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2Zpcm13CiAjIFBp
biB0aGlzIHRvIHRoZSAyMDIyMDUwOSByZWxlYXNlLCBvdmVycmlkZSB0aGlzIGluIGxvY2FsLmNv
bmYKIFNSQ1JFVjpjbGFzcy1kZXZ1cHN0cmVhbSA/PSAiYjE5Y2JkY2E3OGFiMmFkZmQyMTBjOTFi
ZTE1YTIyNTY4ZThiOGNhZSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjJkZTEzNDU4OTdiZjgz
OWQ1MzJjNWRlMGZkYjM0ODc3MGNhMmE1ZjRlZGZiMjE5NzE1ODI1OTdhYmI0NTI5N2QiCitTUkNf
VVJJW3NoYTI1NnN1bV0gPSAiYjEwODNhMzZmMTlhZWE0NmY2NjFkY2ZkNGNkNDYyZDEzOTMzZGNi
NGU3ZjBkYzgwOTUyNTU1MmRkNWMzNTQxZCIKIAogaW5oZXJpdCBhbGxhcmNoCiAKLS0gCjIuNDQu
MQoK

--===============8087125040661316516==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/linux-firmware: SRC_URI changed from "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20250211.tar.xz" to "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20250311.tar.xz"
packages/all-poky-linux/linux-firmware: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-aldebaran: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-aldebaran: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-aldebaran: PKGSIZE changed from 2403020 to 2407116 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-carrizo: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-carrizo: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-cezanne: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-cezanne: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-fiji: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-fiji: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-hawaii: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-hawaii: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-misc: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-misc: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-misc: PKGSIZE changed from 56196628 to 57776452 (+3%)
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi10: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi10: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi10: PKGSIZE changed from 2530774 to 2529910 (-0%)
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi14: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi14: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi21: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi21: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi21: PKGSIZE changed from 3044264 to 3036584 (-0%)
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi22: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi22: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi22: PKGSIZE changed from 2909810 to 2902130 (-0%)
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi23: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi23: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi23: PKGSIZE changed from 2901514 to 2893834 (-0%)
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi24: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi24: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi24: PKGSIZE changed from 2882418 to 2882674 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi31: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi31: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi31: PKGSIZE changed from 3749636 to 3749940 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi32: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi32: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi32: PKGSIZE changed from 2654960 to 2655264 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-oland: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-oland: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-polaris10: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-polaris10: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-polaris11: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-polaris11: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-polaris12: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-polaris12: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-raven: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-raven: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-rembrandt: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-rembrandt: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-rembrandt: PKGSIZE changed from 2757648 to 2749584 (-0%)
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-renoir: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-renoir: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-stoney: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-stoney: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-tonga: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-tonga: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-topaz: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-topaz: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-vega10: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-vega10: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-vega12: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-vega12: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar5523: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ar5523: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-misc: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-misc: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca4019: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca4019: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca6174: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca6174: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca9377: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca9377: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca9887: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca9887: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca9888: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca9888: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca988x: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca988x: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca9984: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca9984: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca99x0: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca99x0: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-wcn3990: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-wcn3990: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-ipq5018: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-ipq5018: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-ipq6018: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-ipq6018: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-ipq8074: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-ipq8074: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-misc: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-misc: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qca2066: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qca2066: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qca6390: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qca6390: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qca6698aq: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qca6698aq: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qca6698aq: PKGSIZE changed from 6417486 to 6545942 (+2%)
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qcn9074: FILELIST: added "/usr/lib/firmware/ath11k/QCN9074/hw1.0/.notice"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qcn9074: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qcn9074: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qcn9074: PKGSIZE changed from 5510810 to 5511076 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-wcn6750: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-wcn6750: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-wcn6855: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-wcn6855: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k-misc: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k-misc: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k-qcn9274: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k-qcn9274: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k-wcn7850: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k-wcn7850: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2x: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2x: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cc33xx: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-cc33xx: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: FILELIST: removed "/usr/lib/firmware/cirrus/cs35l56/CS35L56_Rev3.11.27.wmfw", added "/usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431fb3-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431fb3-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431fb3-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433071-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104331e1-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104331e1-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104331e1-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104331f1-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104331f1-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104331f1-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid0-ampr.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid1-ampr.bin /usr/lib/
 firmware/cirrus/cs35l41-dsp1-spk-prot-10433d88-spkid0-r0.bincfg /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433d88-spkid1-l0.bincfg /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433d88-spkid1-r0.bincfg /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid0-l0.bincfg /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid0-r0.bincfg /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid1-l0.bincfg /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid1-r0.bincfg /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433d88-spkid0-l0.bincfg /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10431024-spkid0-amp1.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10431024-spkid1-amp1.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10431044-spkid0-amp1.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10431044-spkid1-amp1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433071-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433071-spkid0-r0.bi
 n /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-vlv1776.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa390c-spkid1-amp2.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa390d-spkid0-amp2.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa3910-spkid1-amp2.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa3911-spkid0-amp2.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa391b-spkid0-amp2.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid1-amp2.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid0-amp2.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104331f1-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433011-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433011-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433011-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431074-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431194-spkid0-l0.bin /usr/lib/firmware/c
 irrus/cs35l41-dsp1-spk-prot-10431194-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431194-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431194-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431294-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433011.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433061.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433071.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104330c1.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104330d1.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104330e1.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104331e1.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid0.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid1.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104331f1.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid1.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-1
 7aa390c-spkid1.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa390d-spkid0.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa3910-spkid1.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa3911-spkid0.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa391b-spkid0.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid0.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa390b-amp2.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433061-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433061-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433e20.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433fd0.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433ff0.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid1-amp1.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid0-amp1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433fd0-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-p
 rot-10433ff0-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433ff0-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433ff0-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433ff0-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104330e1-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104330e1-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104330e1-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433d88-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433d88-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431294-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431294-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431054-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104312b4-spki
 d0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104312b4-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104312b4-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104312b4-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10431044-spkid1-amp2.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10431024-spkid0-amp2.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10431024-spkid1-amp2.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10431044-spkid0-amp2.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa390b-amp1.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa390b.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433071-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431f63-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-vlv1776.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10431024-spkid0.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp
 1-misc-10431024-spkid1.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10431044-spkid0.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10431044-spkid1.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104330c1-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104330c1-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104330c1-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104330d1-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104330d1-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104330d1-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104330d1-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104330e1-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104331e1-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433e20-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l56/CS35L56_Rev3.11.21.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid0-ampl.bin /usr/li
 b/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid1-ampl.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431f63-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433d78.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433d88.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431054.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431074.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431194.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104312b4.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431294.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431f63.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431fb3.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433e00.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431294-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433d88-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433d88-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104
 33d78-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433e00-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433e00-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433e00-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433e00-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433e20-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433e20-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41/v6.51.0/halo_cspl_RAM_revB2_29.53.0.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433061-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433061-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433e20-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433011-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431fb3-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431054-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431054-spkid1-
 l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431054-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431074-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431074-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431074-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104330c1-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa390c-spkid1-amp1.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa390d-spkid0-amp1.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa3910-spkid1-amp1.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa3911-spkid0-amp1.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa391b-spkid0-amp1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433fd0-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433fd0-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433fd0-spkid1-l0.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: PKGSIZE changed from 3275565 to 3645351 (+11%)
packages/all-poky-linux/linux-firmware/linux-firmware-cnm-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-cnm-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cnm: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-cnm: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGSIZE changed from 28038723 to 28068259 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-18: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-18: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGSIZE changed from 25045491 to 25122558 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9260: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9260: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-license: FILELIST: added "/usr/lib/firmware/LICENSE.intel_vpu"
packages/all-poky-linux/linux-firmware/linux-firmware-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGSIZE changed from 116925 to 118966 (+2%)
packages/all-poky-linux/linux-firmware/linux-firmware-linaro-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-linaro-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mali-csffw-arch108: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-mali-csffw-arch108: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mali-csffw-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-mali-csffw-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek: PKGSIZE changed from 45450177 to 45542913 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-mellanox: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-mellanox: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-microchip-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-microchip-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-microchip: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-microchip: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-moxa-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-moxa-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-moxa: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-moxa: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7650: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7650: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x2: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x2: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8987-sdio: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8987-sdio: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-common: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-common: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-pcie: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-pcie: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-sdio: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-sdio: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-common: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-common: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-pcie: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-pcie: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-sdio: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-sdio: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw416-sdio: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw416-sdio: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw612-sdio: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw612-sdio: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-olpc-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-olpc-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-olpc: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-olpc: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-powervr-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-powervr-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-powervr: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-powervr: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-prestera: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-prestera: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat: FILELIST: added "/usr/lib/firmware/qat_420xx.bin /usr/lib/firmware/qat_420xx_mmp.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PKGSIZE changed from 3011966 to 3827794 (+27%)
packages/all-poky-linux/linux-firmware/linux-firmware-qca-misc: FILELIST: added "/usr/lib/firmware/qca/hpnv21g.30a /usr/lib/firmware/qca/QCA2066/nvm_usb_00130201_gf_030a.bin /usr/lib/firmware/qca/hpnv21.30a /usr/lib/firmware/qca/QCA2066/nvm_usb_00130201_030a.bin /usr/lib/firmware/qca/QCA2066/rampatch_usb_00130201.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-misc: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-misc: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-misc: PKGSIZE changed from 0 to 187456 (+100%)
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca2066: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca2066: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca2066: PKGSIZE changed from 352628 to 357708 (+1%)
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca61x4-serial: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca61x4-serial: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca61x4-usb: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca61x4-usb: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca61x4-usb: PKGSIZE changed from 942966 to 943382 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca6390: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca6390: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca6698: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca6698: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn3950: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn3950: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn3988: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn3988: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn3988: PKGSIZE changed from 236880 to 279596 (+18%)
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn399x: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn399x: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn6750: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn6750: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn7850: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn7850: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-2-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-2-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PKGSIZE changed from 73352 to 73512 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a663: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a663: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a702: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a702: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-g750: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-g750: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-aic100: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-aic100: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-modem: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-modem: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-wifi: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-wifi: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-adreno: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-adreno: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-adreno: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-adreno: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-audio: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-audio: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-modem: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-modem: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-wifi: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-wifi: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-adreno: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-adreno: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-audio: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-audio: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-compute: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-compute: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-ipa: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-ipa: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-wifi: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-wifi: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcs615-adreno: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcs615-adreno: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qdu100: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qdu100: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-adreno: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-adreno: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-audio: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-audio: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-compute: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-compute: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-modem: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-modem: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-wifi: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-wifi: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sa8775p-adreno: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sa8775p-adreno: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sa8775p-audio: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sa8775p-audio: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sa8775p-compute: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sa8775p-compute: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sa8775p-generalpurpose: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sa8775p-generalpurpose: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-adreno: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-adreno: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-thundercomm-db845c-sensors: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-thundercomm-db845c-sensors: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-adreno: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-adreno: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-thundercomm-rb5-sensors: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-thundercomm-rb5-sensors: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8550-audio-tplg: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8550-audio-tplg: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8650-audio-tplg: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8650-audio-tplg: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-6.0: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-6.0: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-adreno: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-adreno: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-audio: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-audio: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-t14s-g6-adreno: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-t14s-g6-adreno: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-t14s-g6-audio: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-t14s-g6-audio: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-t14s-g6-compute: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-t14s-g6-compute: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-yamato-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-yamato-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qed: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qed: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-dptx: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-dptx: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-nic: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-nic: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8761: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8761: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8822: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8822: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-src: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-src: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wfx-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-wfx-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wfx: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-wfx: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGSIZE changed from 309174 to 323764 (+5%)
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c-license: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c-license: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: added "/usr/lib/firmware/TAS2XXX103C8DE8-1.bin /usr/lib/firmware/intel/vpu/vpu_40xx_v1.bin /usr/lib/firmware/qcom/a225_pfp.fw /usr/lib/firmware/qcom/a225_pm4.fw /usr/lib/firmware/intel/vpu/vpu_37xx_v0.0.bin /usr/lib/firmware/intel/vpu/vpu_40xx_v0.0.bin /usr/lib/firmware/intel/vpu/vpu_37xx_v1.bin /usr/lib/firmware/TAS2XXX103C8DE8-0.bin /usr/lib/firmware/amd/amd_sev_fam1ah_model0xh.sbin /usr/lib/firmware/TAS2XXX103C8DE9-0.bin /usr/lib/firmware/qcom/qcs8300/a623_zap.mbn /usr/lib/firmware/qcom/a623_gmu.bin /usr/lib/firmware/TAS2XXX103C8DE9-1.bin"
packages/all-poky-linux/linux-firmware/linux-firmware: PV changed from "20250211" to "20250311"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGV changed from 20250211 [default] to 20250311 [default]
packages/all-poky-linux/linux-firmware/linux-firmware: PKGSIZE changed from 99218359 to 104926265 (+6%)

--===============8087125040661316516==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qcn9074: FILELIST: added "/usr/lib/firmware/ath11k/QCN9074/hw1.0/.notice"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: PKGSIZE changed from 3275565 to 3645351 (+11%)
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: FILELIST: removed "/usr/lib/firmware/cirrus/cs35l56/CS35L56_Rev3.11.27.wmfw", added "/usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa390b-amp2.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433e00.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433e20.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433fd0.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433ff0.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431f63.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431fb3.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431054.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431074.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431194.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431294.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433d88-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433d88-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1
 -spk-prot-10433e00-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433e00-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433e00-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104331f1-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104331f1-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104331f1-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104331f1-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433fd0-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433fd0-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433fd0-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433fd0-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433ff0-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433ff0-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431f63-r0.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid0
 -ampr.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid1-ampr.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-vlv1776.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104330c1-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104330c1-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433ff0-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433ff0-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433d88-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433d88-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104330d1-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104330d1-spkid1-r0.bin /usr/lib/firmware
 /cirrus/cs35l41-dsp1-spk-prot-104330e1-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104330e1-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104331e1-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104331e1-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104331e1-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104331e1-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431fb3-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431fb3-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431074-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431074-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431074-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid0-ampl.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid1-ampl.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-vlv1776.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-m
 isc-17aa390b-amp1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433071-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433071-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104330c1-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104330c1-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104330d1-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104330d1-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104330e1-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104330e1-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433011-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433011-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433011-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433011-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433061-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433061-spkid0-r0
 .bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433061-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433061-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433071-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433071-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10431024-spkid0-amp1.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10431024-spkid1-amp1.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10431044-spkid0-amp1.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10431044-spkid1-amp1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431194-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431194-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431294-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431294-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431294-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431294-spkid1-r0.bin /usr/lib
 /firmware/cirrus/cs35l41-dsp1-spk-prot-10431f63-l0.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10431024-spkid0-amp2.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10431024-spkid1-amp2.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10431044-spkid0-amp2.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10431044-spkid1-amp2.bin /usr/lib/firmware/cirrus/cs35l56/CS35L56_Rev3.11.21.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa391b-spkid0-amp2.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid1-amp2.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid0-amp2.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa390c-spkid1-amp2.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa390d-spkid0-amp2.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431194-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431194-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa3910-spkid1-amp2.bin /usr/lib/firmware/cirrus/cs35l56-b0
 -dsp1-misc-17aa3911-spkid0-amp2.bin /usr/lib/firmware/cirrus/cs35l41/v6.51.0/halo_cspl_RAM_revB2_29.53.0.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433011.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433061.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433071.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104330c1.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104330d1.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104330e1.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa390c-spkid1-amp1.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa390d-spkid0-amp1.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa3910-spkid1-amp1.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa3911-spkid0-amp1.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa391b-spkid0-amp1.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid1-amp1.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid0-amp1.bin /usr/lib/firmware/cirrus
 /cs35l41-dsp1-spk-prot-10433d78-spkid1-r0.bincfg /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433d88-spkid0-l0.bincfg /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433d88-spkid0-r0.bincfg /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid1-l0.bincfg /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid0-r0.bincfg /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433d88-spkid1-l0.bincfg /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433d88-spkid1-r0.bincfg /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa390c-spkid1.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa390d-spkid0.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa3910-spkid1.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa3911-spkid0.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa391b-spkid0.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid1.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid0.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-
 misc-17aa3838-spkid1.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid0.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433e00-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433e20-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433e20-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433e20-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433e20-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa390b.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431fb3-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431fb3-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104312b4-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104312b4-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104312b4-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104312b4-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431054-spkid0-l0.bin /usr
 /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431054-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431054-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431054-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431074-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10431024-spkid0.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10431024-spkid1.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10431044-spkid0.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10431044-spkid1.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104331e1.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104331f1.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433d78.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433d88.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104312b4.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid0-l0.bincfg"
packages/all-poky-linux/linux-firmware/linux-firmware-license: FILELIST: added "/usr/lib/firmware/LICENSE.intel_vpu"
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PKGSIZE changed from 3011966 to 3827794 (+27%)
packages/all-poky-linux/linux-firmware/linux-firmware-qat: FILELIST: added "/usr/lib/firmware/qat_420xx_mmp.bin /usr/lib/firmware/qat_420xx.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-misc: PKGSIZE changed from 0 to 187456 (+100%)
packages/all-poky-linux/linux-firmware/linux-firmware-qca-misc: FILELIST: added "/usr/lib/firmware/qca/QCA2066/nvm_usb_00130201_030a.bin /usr/lib/firmware/qca/hpnv21.30a /usr/lib/firmware/qca/hpnv21g.30a /usr/lib/firmware/qca/QCA2066/nvm_usb_00130201_gf_030a.bin /usr/lib/firmware/qca/QCA2066/rampatch_usb_00130201.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn3988: PKGSIZE changed from 236880 to 279596 (+18%)
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: added "/usr/lib/firmware/qcom/a225_pfp.fw /usr/lib/firmware/qcom/a225_pm4.fw /usr/lib/firmware/intel/vpu/vpu_40xx_v1.bin /usr/lib/firmware/qcom/qcs8300/a623_zap.mbn /usr/lib/firmware/intel/vpu/vpu_37xx_v1.bin /usr/lib/firmware/TAS2XXX103C8DE9-1.bin /usr/lib/firmware/qcom/a623_gmu.bin /usr/lib/firmware/amd/amd_sev_fam1ah_model0xh.sbin /usr/lib/firmware/TAS2XXX103C8DE8-1.bin /usr/lib/firmware/intel/vpu/vpu_37xx_v0.0.bin /usr/lib/firmware/TAS2XXX103C8DE9-0.bin /usr/lib/firmware/intel/vpu/vpu_40xx_v0.0.bin /usr/lib/firmware/TAS2XXX103C8DE8-0.bin"

--===============8087125040661316516==--

