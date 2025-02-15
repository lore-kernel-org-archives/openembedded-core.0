Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F41C9C021AE
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 12:42:32 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.8057.1739623333782655408
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Feb 2025 04:42:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=hLvQBZB4;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=DKgYCnin;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019509a1bf5c-bcabcbe9-e3a6-4324-99d5-4e1949b8878a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1739623350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gc8QeuixYrHkB9QkrNKn8pGEo+GLx89XI0LSh9aE/Tg=;
	b=hLvQBZB4/VblP/kjhoKiOxlkRW+pWwTUlmvn5a2lub2dt+p1e63eKvkgqiuLrq+m
	9dpVthnw24H8FVwfjj0rzpYOQN9pP7HmkF2qNRClhRhYySvkeJNnNjZ2io/2RHzM9/7
	6TBDdWckmWlBUxzYIrlIdZwfyVcues1gcFAOvhl8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1739623350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gc8QeuixYrHkB9QkrNKn8pGEo+GLx89XI0LSh9aE/Tg=;
	b=DKgYCninMFXf4VZDdcT2XQzteoHbHxxzqDPAZ9oDld+W58FJPg6H2P6rhGJPmNZ+
	GwfTahyB2gEAWmr4rLK360zEK61ggqnKqmagfkt6VPRNaJBsjtPR/R1LG0TlINxDUyh
	XcHQ7gC9SGw1tVsUiqs2ZYKMBYYvcato8+sWZgBI=
Content-Type: multipart/mixed; boundary="===============4007131793297174907=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] linux-firmware: upgrading to 20250211 SUCCEEDED
Message-ID: <0101019509a1bf5c-bcabcbe9-e3a6-4324-99d5-4e1949b8878a-000000@us-west-2.amazonses.com>
Date: Sat, 15 Feb 2025 12:42:30 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 12:42:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211469

--===============4007131793297174907==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *linux-firmware* to *20250211* has Succeeded.

Next steps:
    - apply the patch: git am 0001-linux-firmware-upgrade-20250109-20250211.patch
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
From e06eb63bbf698e12c35433b90f49dc59893390a1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Feb 2025 10:42:19 +0000
Subject: [PATCH] linux-firmware: upgrade 20250109 -> 20250211

---
 ...20250109.bb => linux-firmware_20250211.bb} | 801 +++++++++++++++++-
 1 file changed, 799 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20250109.bb => linux-firmware_20250211.bb} (76%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
similarity index 76%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
index b932300742..e812b0f976 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
@@ -1,3 +1,800 @@
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
+# @@ -740,7 +740,7 @@
+#  Version: W16.68.1.p183
+#  
+#  File: mrvl/sdsd8997_combo_v4.bin
+# -Version: W16.68.1.p179
+# +Version: W16.68.1.p197.1
+#  
+#  File: mrvl/sdsd8977_combo_v2.bin
+#  Version: W16.68.1.p195
+# @@ -1022,25 +1022,25 @@
+#  Version: 74.a5e9588b.0
+#  
+#  File: iwlwifi-cc-a0-77.ucode
+# -Version: 74.0b4c06ad.0
+# +Version: 74.b405f9d4.0
+#  
+#  File: iwlwifi-Qu-b0-hr-b0-77.ucode
+# -Version: 74.0b4c06ad.0
+# +Version: 74.b405f9d4.0
+#  
+#  File: iwlwifi-Qu-b0-jf-b0-77.ucode
+# -Version: 74.0b4c06ad.0
+# +Version: 74.b405f9d4.0
+#  
+#  File: iwlwifi-Qu-c0-hr-b0-77.ucode
+# -Version: 74.0b4c06ad.0
+# +Version: 74.b405f9d4.0
+#  
+#  File: iwlwifi-Qu-c0-jf-b0-77.ucode
+# -Version: 74.0b4c06ad.0
+# +Version: 74.b405f9d4.0
+#  
+#  File: iwlwifi-QuZ-a0-hr-b0-77.ucode
+# -Version: 74.0b4c06ad.0
+# +Version: 74.b405f9d4.0
+#  
+#  File: iwlwifi-QuZ-a0-jf-b0-77.ucode
+# -Version: 74.0b4c06ad.0
+# +Version: 74.b405f9d4.0
+#  
+#  File: iwlwifi-ty-a0-gf-a0-77.ucode
+#  Version: 74.f92b5fed.0
+# @@ -1064,7 +1064,7 @@
+#  Version: 83.fb5c9aeb.0
+#  
+#  File: iwlwifi-ty-a0-gf-a0-89.ucode
+# -Version: 86.6b44fa0b.0
+# +Version: 86.1a492d28.0
+#  
+#  File: iwlwifi-so-a0-gf4-a0-77.ucode
+#  Version: 74.f92b5fed.0
+# @@ -1088,7 +1088,7 @@
+#  Version: 83.fb5c9aeb.0
+#  
+#  File: iwlwifi-so-a0-gf4-a0-89.ucode
+# -Version: 86.6b44fa0b.0
+# +Version: 86.1a492d28.0
+#  
+#  File: iwlwifi-so-a0-gf-a0-77.ucode
+#  Version: 74.f92b5fed.0
+# @@ -1112,7 +1112,7 @@
+#  Version: 83.fb5c9aeb.0
+#  
+#  File: iwlwifi-so-a0-gf-a0-89.ucode
+# -Version: 86.6b44fa0b.0
+# +Version: 86.1a492d28.0
+#  
+#  File: iwlwifi-so-a0-hr-b0-77.ucode
+#  Version: 74.f92b5fed.0
+# @@ -1133,7 +1133,7 @@
+#  Version: 83.fb5c9aeb.0
+#  
+#  File: iwlwifi-so-a0-hr-b0-89.ucode
+# -Version: 86.6b44fa0b.0
+# +Version: 86.1a492d28.0
+#  
+#  File: iwlwifi-so-a0-jf-b0-77.ucode
+#  Version: 74.f92b5fed.0
+# @@ -1146,6 +1146,9 @@
+#  File: iwlwifi-bz-b0-gf-a0-94.ucode
+#  Version: 91.62990553.0
+#  
+# +File: iwlwifi-bz-b0-gf-a0-96.ucode
+# +Version: 93.44729d4e.0
+# +
+#  File: iwlwifi-bz-b0-gf-a0.pnvm
+#  
+#  File: iwlwifi-gl-c0-fm-c0-83.ucode
+# @@ -1163,14 +1166,23 @@
+#  File: iwlwifi-gl-c0-fm-c0-94.ucode
+#  Version: 91.62990553.0
+#  
+# +File: iwlwifi-gl-c0-fm-c0-96.ucode
+# +Version: 93.44729d4e.0
+# +
+#  File: iwlwifi-gl-c0-fm-c0.pnvm
+#  
+#  File: iwlwifi-bz-b0-fm-c0-92.ucode
+#  Version: 89.67ce4588.0
+#  
+# +File: iwlwifi-bz-b0-fm-c0-93.ucode
+# +Version: 90.26a2cb89.0
+# +
+#  File: iwlwifi-bz-b0-fm-c0-94.ucode
+#  Version: 91.62990553.0
+#  
+# +File: iwlwifi-bz-b0-fm-c0-96.ucode
+# +Version: 93.44729d4e.0
+# +
+#  File: iwlwifi-bz-b0-fm-c0.pnvm
+#  
+#  File: iwlwifi-ma-b0-gf-a0-83.ucode
+# @@ -1180,7 +1192,7 @@
+#  Version: 83.fb5c9aeb.0
+#  
+#  File: iwlwifi-ma-b0-gf-a0-89.ucode
+# -Version: 86.6b44fa0b.0
+# +Version: 86.1a492d28.0
+#  
+#  File: iwlwifi-ma-b0-gf-a0.pnvm
+#  
+# @@ -1191,7 +1203,7 @@
+#  Version: 83.fb5c9aeb.0
+#  
+#  File: iwlwifi-ma-b0-gf4-a0-89.ucode
+# -Version: 86.6b44fa0b.0
+# +Version: 86.1a492d28.0
+#  
+#  File: iwlwifi-ma-b0-gf4-a0.pnvm
+#  
+# @@ -1202,7 +1214,7 @@
+#  Version: 83.fb5c9aeb.0
+#  
+#  File: iwlwifi-ma-b0-hr-b0-89.ucode
+# -Version: 86.6b44fa0b.0
+# +Version: 86.1a492d28.0
+#  
+#  Licence: Redistributable. See LICENCE.iwlwifi_firmware for details
+#  
+# @@ -3408,6 +3420,7 @@
+#  File: rtw89/rtw8922a_fw.bin
+#  File: rtw89/rtw8922a_fw-1.bin
+#  File: rtw89/rtw8922a_fw-2.bin
+# +File: rtw89/rtw8922a_fw-3.bin
+#  
+#  Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
+#  
+# @@ -3810,7 +3823,7 @@
+#  File: ath11k/IPQ6018/hw1.0/q6_fw.b08
+#  File: ath11k/IPQ6018/hw1.0/q6_fw.flist
+#  File: ath11k/IPQ6018/hw1.0/q6_fw.mdt
+# -Version: WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
+# +Version: WLAN.HK.2.7.0.1-02409-QCAHKSWPL_SILICONZ-1
+#  File: ath11k/IPQ6018/hw1.0/Notice.txt
+#  File: ath11k/IPQ8074/hw2.0/board-2.bin
+#  File: ath11k/IPQ8074/hw2.0/m3_fw.b00
+# @@ -3828,7 +3841,7 @@
+#  File: ath11k/IPQ8074/hw2.0/q6_fw.b08
+#  File: ath11k/IPQ8074/hw2.0/q6_fw.flist
+#  File: ath11k/IPQ8074/hw2.0/q6_fw.mdt
+# -Version: WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
+# +Version: WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
+#  File: ath11k/IPQ8074/hw2.0/Notice.txt
+#  File: ath11k/QCA6390/hw2.0/board-2.bin
+#  File: ath11k/QCA6390/hw2.0/amss.bin
+# @@ -3848,7 +3861,7 @@
+#  File: ath11k/QCN9074/hw1.0/board-2.bin
+#  File: ath11k/QCN9074/hw1.0/amss.bin
+#  File: ath11k/QCN9074/hw1.0/m3.bin
+# -Version: WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
+# +Version: WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
+#  File: ath11k/QCN9074/hw1.0/Notice.txt
+#  File: ath11k/WCN6750/hw1.0/board-2.bin
+#  File: ath11k/WCN6750/hw1.0/sc7280/wpss.mbn
+# @@ -3881,10 +3894,22 @@
+#  File: ath11k/QCA2066/hw2.1/board-2.bin
+#  File: ath11k/QCA2066/hw2.1/amss.bin
+#  File: ath11k/QCA2066/hw2.1/m3.bin
+# -Version: WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.3
+# +Version: WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6
+#  File: ath11k/QCA2066/hw2.1/Notice.txt
+# +File: ath11k/QCA6698AQ/hw2.1/board-2.bin
+# +File: ath11k/QCA6698AQ/hw2.1/amss.bin
+# +File: ath11k/QCA6698AQ/hw2.1/m3.bin
+# +Version: WLAN.HSP.1.1-04479-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
+# +File: ath11k/QCA6698AQ/hw2.1/Notice.txt
+#  
+#  Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k for details
+# +
+# +File: ath11k/WCN6750/hw1.0/qcm6490/wpss.mbn
+# +Version: WLAN.MSL.2.0.c2-00204-QCAMSLSWPLZ-1
+# +Link: qcom/qcm6490/wpss.mbn -> ../../ath11k/WCN6750/hw1.0/qcm6490/wpss.mbn
+# +Link: qcom/qcs6490/wpss.mbn -> ../../ath11k/WCN6750/hw1.0/qcm6490/wpss.mbn
+# +
+# +Licence: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -3897,7 +3922,7 @@
+#  File: ath12k/WCN7850/hw2.0/Notice.txt
+#  File: ath12k/QCN9274/hw2.0/board-2.bin
+#  File: ath12k/QCN9274/hw2.0/firmware-2.bin
+# -Version: WLAN.WBE.1.3.1-00162-QCAHKSWPL_SILICONZ-1
+# +Version: WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
+#  File: ath12k/QCN9274/hw2.0/Notice.txt
+#  
+#  Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k for details
+# @@ -4161,7 +4186,7 @@
+#  File: intel/ibt-0040-1050.ddc
+#  File: intel/ibt-1040-1050.sfi
+#  File: intel/ibt-1040-1050.ddc
+# -Version: BT_Solar_REL81755_23.50.24332.81755
+# +Version: BT_Solar_REL81864_23.50.24483.81864
+#  
+#  File: intel/ibt-0040-1020.sfi
+#  File: intel/ibt-0040-1020.ddc
+# @@ -4183,7 +4208,7 @@
+#  File: intel/ibt-0093-4150.ddc
+#  File: intel/ibt-0093-1050.sfi
+#  File: intel/ibt-0093-1050.ddc
+# -Version: BT_BlazarU_S_REL67159_23.90.24382.67159
+# +Version: BT_BlazarU_S_REL72721_23.100.24491.72721
+#  
+#  File: intel/ibt-0180-0041.sfi
+#  File: intel/ibt-0180-0041.ddc
+# @@ -4191,7 +4216,7 @@
+#  File: intel/ibt-0180-4150.ddc
+#  File: intel/ibt-0180-1050.sfi
+#  File: intel/ibt-0180-1050.ddc
+# -Version: BT_Magnetar_REL103427_23.50.24332.103427
+# +Version: BT_Magnetar_REL103604_23.50.24483.103604
+#  
+#  File: intel/ibt-0190-0291.sfi
+#  File: intel/ibt-0190-0291-iml.sfi
+# @@ -4696,30 +4721,21 @@
+#  
+#  --------------------------------------------------------------------------
+#  
+# -Driver: btqca - Qualcomm Atheros Bluetooth support for QCA61x4 chips
+# +Driver: btqca - Qualcomm Atheros Bluetooth support for QCA61x4 USB chips
+#  
+#  File: qca/nvm_usb_00000201.bin
+#  File: qca/nvm_usb_00000200.bin
+#  File: qca/nvm_usb_00000300.bin
+#  File: qca/nvm_usb_00000302.bin
+# -File: qca/nvm_00130300.bin
+# -File: qca/nvm_00130302.bin
+# -File: qca/nvm_00230302.bin
+#  File: qca/rampatch_usb_00000200.bin
+#  File: qca/rampatch_usb_00000201.bin
+#  File: qca/rampatch_usb_00000300.bin
+# +Version: BTFM.RM.2.2.c3-00031-QCABTFMSWP-1
+#  File: qca/rampatch_usb_00000302.bin
+# -File: qca/rampatch_00130300.bin
+# -File: qca/rampatch_00130302.bin
+# -File: qca/rampatch_00230302.bin
+# -File: qca/nvm_00440302.bin
+# -File: qca/rampatch_00440302.bin
+# -File: qca/nvm_00440302_eu.bin
+# -File: qca/nvm_00440302_i2s_eu.bin
+# +Version: BTFM.RM.4.4.1-00028-QCABTFMSWP-1
+#  File: qca/nvm_usb_00000302_eu.bin
+# -File: qca/htbtfw20.tlv
+# -File: qca/htnv20.bin
+#  File: qca/rampatch_usb_00130200.bin
+# +Version: BTFW.HSP.2.0.0-00609-USB_PATCHZ-1
+#  File: qca/nvm_usb_00130200.bin
+#  File: qca/nvm_usb_00130200_0104.bin
+#  File: qca/nvm_usb_00130200_0105.bin
+# @@ -4728,6 +4744,7 @@
+#  File: qca/nvm_usb_00130200_0109.bin
+#  File: qca/nvm_usb_00130200_0110.bin
+#  File: qca/rampatch_usb_00130201.bin
+# +Version: BTFW.HSP.2.1.0-00650-USB_PATCHZ-1
+#  File: qca/nvm_usb_00130201.bin
+#  File: qca/nvm_usb_00130201_010a.bin
+#  File: qca/nvm_usb_00130201_010b.bin
+# @@ -4737,6 +4754,7 @@
+#  File: qca/nvm_usb_00130201_gf_010b.bin
+#  File: qca/nvm_usb_00130201_gf_0303.bin
+#  File: qca/rampatch_usb_00190200.bin
+# +Version: BTFW.HAMILTON.2.0.0-00515-USB_PATCHZ-2
+#  File: qca/nvm_usb_00190200.bin
+#  File: qca/nvm_usb_00190200_010e.bin
+#  File: qca/nvm_usb_00190200_0112.bin
+# @@ -4745,10 +4763,48 @@
+#  
+#  --------------------------------------------------------------------------
+#  
+# +Driver: btqca - Qualcomm Atheros Bluetooth support for QCA61x4 serial chips
+# +
+# +File: qca/rampatch_00130300.bin
+# +Version: BTFM.RM.2.2.c3-00031-QCABTFMSWP-1
+# +File: qca/rampatch_00130302.bin
+# +Version: BTFM.RM.2.2.c3-00031-QCABTFMSWP-1
+# +File: qca/rampatch_00230302.bin
+# +Version: QCA6174_DEV.BLD.0111
+# +File: qca/nvm_00130300.bin
+# +File: qca/nvm_00130302.bin
+# +File: qca/nvm_00230302.bin
+# +File: qca/rampatch_00440302.bin
+# +Version: BTFM.RM.4.4.1-00028-QCABTFMSWP-1
+# +File: qca/nvm_00440302.bin
+# +File: qca/nvm_00440302_eu.bin
+# +File: qca/nvm_00440302_i2s_eu.bin
+# +
+# +Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k and qca/NOTICE.txt for details
+# +
+# +--------------------------------------------------------------------------
+# +
+# +Driver: qca - Qualcomm Atheros Bluetooth support for WCN3950 chips
+# +
+# +File: qca/cmbtfw12.tlv
+# +Version: BTFM.CMC.1.2.0-00218-QCACHROMZ-2
+# +File: qca/cmbtfw13.tlv
+# +Version: BTFM.CMC.1.3.0-00108-QCACHROMZ-1
+# +File: qca/cmnv12.bin
+# +File: qca/cmnv13.bin
+# +File: qca/cmnv13s.bin
+# +File: qca/cmnv13t.bin
+# +
+# +Licence: Redistributable. See LICENSE.qcom and qca/NOTICE.txt for details
+# +
+# +--------------------------------------------------------------------------
+# +
+#  Driver: qca - Qualcomm Atheros Bluetooth support for WCN3988 chips
+#  
+#  File: qca/apbtfw10.tlv
+# +Version: BTFM.CHE.2.0.0-00082-QCACHROMZ-1
+#  File: qca/apbtfw11.tlv
+# +Version: BTFM.CHE.2.1.3-00357-QCACHROMZ-1
+#  File: qca/apnv10.bin
+#  File: qca/apnv11.bin
+#  
+# @@ -4759,24 +4815,35 @@
+#  Driver: qca - Qualcomm Atheros Bluetooth support for WCN399x chips
+#  
+#  File: qca/crbtfw21.tlv
+# +Version: BTFM.CHE.2.1.3.c7-00024-QCACHROM-1
+#  File: qca/crnv21.bin
+#  File: qca/crbtfw32.tlv
+# +Version: BTFM.CHE.3.2.0.c2-00044-QCACHROMZ-1
+#  File: qca/crnv32.bin
+#  File: qca/crnv32u.bin
+#  
+# +Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k and qca/NOTICE.txt for details
+# +
+# +--------------------------------------------------------------------------
+# +
+#  Driver: qca - Qualcomm Atheros Bluetooth support for WCN6750 chips
+#  
+#  File: qca/msbtfw11.mbn
+# +Version: BTFW.MOSELLE.1.1.3-00069-MSL_PATCHZ-1
+#  File: qca/msbtfw11.tlv
+# +Version: BTFW.MOSELLE.1.1.3-00069-MSL_PATCHZ-1
+#  File: qca/msnv11.bin
+#  File: qca/msnv11.b0a
+#  File: qca/msnv11.b09
+#  
+#  Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k and qca/NOTICE.txt for details
+#  
+# +--------------------------------------------------------------------------
+# +
+#  Driver: qca - Qualcomm Atheros Bluetooth support for QCA2066 chips
+#  
+#  File: qca/hpbtfw21.tlv
+# +Version: BTFW.HSP.2.1.0-00641-VER_PATCHZ-1
+#  File: qca/hpnv21.bin
+#  File: qca/hpnv21g.bin
+#  File: qca/hpnv21.301
+# @@ -4808,21 +4875,43 @@
+#  File: qca/hpnv21g.b10c
+#  File: qca/hpnv21g.b111
+#  
+# -
+#  Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k and qca/NOTICE.txt for details
+#  
+#  --------------------------------------------------------------------------
+#  
+# +Driver: qca - Qualcomm Atheros Bluetooth support for QCA6390 chips
+# +
+# +File: qca/htbtfw20.tlv
+# +Version: BTFM.HST.2.0.0-00943-QCACHROM-1
+# +File: qca/htnv20.bin
+# +
+# +Licence: Redistributable. See LICENSE.qcom and qca/NOTICE.txt for details
+# +
+# +--------------------------------------------------------------------------
+# +
+#  Driver: qca - Qualcomm Atheros Bluetooth support for WCN7850 chips
+#  
+#  File: qca/hmtbtfw20.tlv
+# +Version: BTFW.HAMILTON.2.0.1-00349-WOS_PATCHZ-2
+#  File: qca/hmtnv20.b10f
+#  File: qca/hmtnv20.b112
+#  File: qca/hmtnv20.bin
+#  
+#  Licence: Redistributable. See LICENSE.qcom and qca/NOTICE.txt for details
+#  
+# ---------------------------------------------------------------------------
+# +---------------------------------------------------------------------------
+# +
+# +Driver: qca - Qualcomm Atheros Bluetooth support for QCA6698AQ chips
+# +
+# +File: qca/QCA6698/hpbtfw21.tlv
+# +Version: BTFW.HSP.2.1.2-00035-PATCHZ-1
+# +File: qca/QCA6698/hpnv21.b206
+# +File: qca/QCA6698/hpnv21.b207
+# +File: qca/QCA6698/hpnv21.bin
+# +
+# +Licence: Redistributable. See LICENSE.qcom and qca/NOTICE.txt for details
+# +
+# +-------------------------------------------------------------------------
+#  
+#  Driver: liquidio -- Cavium LiquidIO driver
+#  
+# @@ -5223,7 +5312,7 @@
+#  Version: DMC API/APB ver 2 release 6 for Battlemage
+#  
+#  File: i915/xe2lpd_dmc.bin
+# -Version: DMC API/APB ver 2 release 24 for Xe2LPD
+# +Version: DMC API/APB ver 2 release 28 for Xe2LPD
+#  
+#  File: i915/xe3lpd_dmc.bin
+#  Version: DMC API/APB ver 2 release 13 for Xe3LPD
+# @@ -5711,14 +5800,15 @@
+#  
+#  --------------------------------------------------------------------------
+#  
+# -Driver: wilc1000 - Atmel 802.11n WLAN driver for WILC1000
+# +Driver: wilc1000 - Atmel 802.11n WLAN driver for WILC1000 & WILC3000
+#  
+#  File: atmel/wilc1000_fw.bin
+#  File: atmel/wilc1000_ap_fw.bin
+#  File: atmel/wilc1000_p2p_fw.bin
+#  File: atmel/wilc1000_wifi_firmware.bin
+#  File: atmel/wilc1000_wifi_firmware-1.bin
+# -Version: 16.0
+# +File: atmel/wilc3000_wifi_firmware-1.bin
+# +Version: 16.1.2
+#  
+#  License: Redistributable. See LICENSE.atmel for details
+#  
+# @@ -6001,9 +6091,9 @@
+#  Driver: mt7925 - MediaTek MT7925 Wireless MACs
+#  
+#  File: mediatek/mt7925/WIFI_MT7925_PATCH_MCU_1_1_hdr.bin
+# -Version: 20241104132949a
+# +Version: 20250113153001a
+#  File: mediatek/mt7925/WIFI_RAM_CODE_MT7925_1_1.bin
+# -Version: 20241104132855
+# +Version: 20250113152854
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -6012,7 +6102,7 @@
+#  Driver: mt7925 - MediaTek MT7925 bluetooth chipset
+#  
+#  File: mediatek/mt7925/BT_RAM_CODE_MT7925_1_1_hdr.bin
+# -Version: 20241104133214
+# +Version: 20250113153307
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -6213,17 +6303,17 @@
+#  File: qcom/venus-1.8/venus.mbn
+#  Link: qcom/venus-1.8/venus.mdt -> venus.mbn
+#  
+# -Version: 1.8-00109
+# +Version: VIDEO.VE.1.8-00109
+#  
+#  File: qcom/venus-4.2/venus.mbn
+#  Link: qcom/venus-4.2/venus.mdt -> venus.mbn
+#  
+# -Version: 4.2
+# +Version: VIDEO.VE.4.0-00119
+#  
+#  File: qcom/venus-5.2/venus.mbn
+#  Link: qcom/venus-5.2/venus.mdt -> venus.mbn
+#  
+# -Version: 5.2-00023
+# +Version: VIDEO.VE.5.2-00023-PROD-2
+#  
+#  File: qcom/venus-5.4/venus.mbn
+#  Link: qcom/venus-5.4/venus.mdt -> venus.mbn
+# @@ -6238,7 +6328,7 @@
+#  Link: qcom/vpu-1.0/venus.mbn -> ../vpu/vpu20_p4.mbn
+#  Link: qcom/vpu-1.0/venus.mdt -> ../vpu/vpu20_p4.mbn
+#  
+# -Version: VIDEO.VPU.1.0-00087-PROD-1
+# +Version: VIDEO.VPU.1.0-00097-PROD-1
+#  
+#  File: qcom/vpu/vpu20_p1.mbn
+#  Link: qcom/vpu-2.0/venus.mbn -> ../vpu/vpu20_p1.mbn
+# @@ -6338,20 +6428,26 @@
+#  
+#  File: qcom/apq8016/mba.mbn
+#  File: qcom/apq8016/modem.mbn
+# +Version: MPSS.DPM.2.0.2.C1.23-00008
+#  File: qcom/apq8016/wcnss.mbn
+# +Version: CNSS.PR.2.0.1.2.C1-00074
+#  File: qcom/apq8016/WCNSS_qcom_wlan_nv_sbc.bin
+#  File: qcom/apq8096/adsp.mbn
+# +Version: ADSP.8996.2.7.1-00138
+#  RawFile: qcom/apq8096/adspr.jsn
+#  RawFile: qcom/apq8096/adspua.jsn
+#  File: qcom/apq8096/mba.mbn
+#  File: qcom/apq8096/modem.mbn
+# +Version: MPSS.TH.2.0.1-00481
+#  RawFile: qcom/apq8096/modemr.jsn
+#  File: qcom/qcm2290/a702_zap.mbn
+#  File: qcom/qcm2290/adsp.mbn
+# +Version: ADSP.VT.5.4.1.c4-00013-KAMORTA-1
+#  RawFile: qcom/qcm2290/adspr.jsn
+#  RawFile: qcom/qcm2290/adsps.jsn
+#  RawFile: qcom/qcm2290/adspua.jsn
+#  File: qcom/qcm2290/modem.mbn
+# +Version: MPSS.HA.1.1-00435-KD_ALL_PACK-1
+#  RawFile: qcom/qcm2290/modemr.jsn
+#  RawFile: qcom/qcm2290/modemuw.jsn
+#  File: qcom/qcm6490/adsp.mbn
+# @@ -6373,28 +6469,37 @@
+#  Link: qcom/qcs6490/cdspr.jsn -> ../qcm6490/cdspr.jsn
+#  File: qcom/qrb4210/a610_zap.mbn
+#  File: qcom/qrb4210/adsp.mbn
+# +Version: ADSP.VT.5.4.1.c4-00013-KAMORTA-1
+#  RawFile: qcom/qrb4210/adspr.jsn
+#  RawFile: qcom/qrb4210/adsps.jsn
+#  RawFile: qcom/qrb4210/adspua.jsn
+#  File: qcom/qrb4210/cdsp.mbn
+# +Version: CDSP.VT.2.4.1-00269-KAMORTA-1
+#  RawFile: qcom/qrb4210/cdspr.jsn
+#  File: qcom/qrb4210/modem.mbn
+# +Version: MPSS.HA.1.1-00435-KD_ALL_PACK-1
+#  RawFile: qcom/qrb4210/modemr.jsn
+#  RawFile: qcom/qrb4210/modemuw.jsn
+#  File: qcom/sdm845/adsp.mbn
+# +Version: ADSP.HT.4.0-00593-SDM845-1
+#  RawFile: qcom/sdm845/adspr.jsn
+#  RawFile: qcom/sdm845/adspua.jsn
+#  File: qcom/sdm845/cdsp.mbn
+# +Version: CDSP.HT.1.0-00559-SDM845-1
+#  RawFile: qcom/sdm845/cdspr.jsn
+#  File: qcom/sdm845/Thundercomm/db845c/slpi.mbn
+# +Version: SLPI.HY.1.0-00365-SDM845AZL-1
+#  RawFile: qcom/sdm845/Thundercomm/db845c/slpir.jsn
+#  RawFile: qcom/sdm845/Thundercomm/db845c/slpius.jsn
+#  File: qcom/sm8250/adsp.mbn
+# +Version: ADSP.HT.5.3.c2-00082-SM8250-1
+#  RawFile: qcom/sm8250/adspr.jsn
+#  RawFile: qcom/sm8250/adspua.jsn
+#  File: qcom/sm8250/cdsp.mbn
+# +Version: CDSP.HT.2.3.c1-00076-SM8250-1
+#  RawFile: qcom/sm8250/cdspr.jsn
+#  File: qcom/sm8250/Thundercomm/RB5/slpi.mbn
+# +Version: SLPI.HY.3.1-00049-SM8250AZL-2
+#  RawFile: qcom/sm8250/Thundercomm/RB5/slpir.jsn
+#  RawFile: qcom/sm8250/Thundercomm/RB5/slpius.jsn
+#  RawFile: qcom/sc8280xp/LENOVO/21BX/adspr.jsn
+# @@ -6402,8 +6507,11 @@
+#  RawFile: qcom/sc8280xp/LENOVO/21BX/battmgr.jsn
+#  RawFile: qcom/sc8280xp/LENOVO/21BX/cdspr.jsn
+#  File: qcom/sc8280xp/LENOVO/21BX/qcadsp8280.mbn
+# +Version: ADSP.HT.5.6-00729-MAKENA-1
+#  File: qcom/sc8280xp/LENOVO/21BX/qccdsp8280.mbn
+# +Version: CDSP.HT.2.6-00698-MAKENA-1
+#  File: qcom/sc8280xp/LENOVO/21BX/qcslpi8280.mbn
+# +Version: SLPI.HY.4.1-00048-MAKENA-1
+#  File: qcom/x1e80100/adsp.mbn
+#  File: qcom/x1e80100/adsp_dtb.mbn
+#  Version: ADSP.HT.5.9-00796-HAMOA-1
+# @@ -6411,6 +6519,18 @@
+#  RawFile: qcom/x1e80100/adsps.jsn
+#  RawFile: qcom/x1e80100/adspua.jsn
+#  RawFile: qcom/x1e80100/battmgr.jsn
+# +RawFile: qcom/x1e80100/LENOVO/21N1/adspua.jsn
+# +File: qcom/x1e80100/LENOVO/21N1/qcadsp8380.mbn
+# +Version: ADSP.HT.5.9-00787.2-HAMOA-1
+# +File: qcom/x1e80100/LENOVO/21N1/adsp_dtbs.elf
+# +RawFile: qcom/x1e80100/LENOVO/21N1/adspr.jsn
+# +File: qcom/x1e80100/LENOVO/21N1/cdsp_dtbs.elf
+# +RawFile: qcom/x1e80100/LENOVO/21N1/adsps.jsn
+# +File: qcom/x1e80100/LENOVO/21N1/qccdsp8380.mbn
+# +Version: CDSP.HT.2.9-00447-HAMOA-2
+# +RawFile: qcom/x1e80100/LENOVO/21N1/cdspr.jsn
+# +File: qcom/x1e80100/LENOVO/21N1/qcdxkmsuc8380.mbn
+# +RawFile: qcom/x1e80100/LENOVO/21N1/battmgr.jsn
+#  
+#  Licence: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
+#  
+# @@ -6427,6 +6547,24 @@
+#  
+#  cdsp.mbn has been converted from 21-cdsp_split/firmware/cdsp.* using
+#  https://github.com/andersson/pil-squasher
+# +
+# +File: qcom/sa8775p/adsp.mbn
+# +Version: DSP.AT.1.0.1-00079.2-LEMANS-1
+# +RawFile: qcom/sa8775p/adspr.jsn
+# +RawFile: qcom/sa8775p/adspua.jsn
+# +File: qcom/sa8775p/cdsp0.mbn
+# +Version: DSP.AT.1.0.1-00079.2-LEMANS-1
+# +File: qcom/sa8775p/cdsp1.mbn
+# +Version: DSP.AT.1.0.1-00079.2-LEMANS-1
+# +RawFile: qcom/sa8775p/cdspr.jsn
+# +File: qcom/sa8775p/gpdsp0.mbn
+# +Version: DSP.AT.1.0.1-00079.2-LEMANS-1
+# +File: qcom/sa8775p/gpdsp1.mbn
+# +Version: DSP.AT.1.0.1-00079.2-LEMANS-1
+# +RawFile: qcom/sa8775p/gpdsp1r.jsn
+# +RawFile: qcom/sa8775p/gpdspr.jsn
+# +
+# +Licence: Redistributable. See LICENSE.qcom-2 and qcom/NOTICE.txt for details
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -7581,16 +7719,16 @@
+#  File: cirrus/cs35l54-b0-dsp1-misc-103c8d8e-amp2.bin
+#  Link: cirrus/cs35l54-b0-dsp1-misc-103c8d8f.wmfw -> cs35l56/CS35L56_Rev3.11.11.1.wmfw
+#  Link: cirrus/cs35l54-b0-dsp1-misc-103c8d8f-amp1.bin -> cs35l54-b0-dsp1-misc-103c8d8e-amp1.bin
+# -Link: cirrus/cs35l54-b0-dsp1-misc-103c8d8f-amp2.bin -> cs35l54-b0-dsp1-misc-103c8d8e-amp1.bin
+# +Link: cirrus/cs35l54-b0-dsp1-misc-103c8d8f-amp2.bin -> cs35l54-b0-dsp1-misc-103c8d8e-amp2.bin
+#  Link: cirrus/cs35l56-b0-dsp1-misc-103c8d90.wmfw -> cs35l56/CS35L56_Rev3.11.11.1.wmfw
+#  File: cirrus/cs35l56-b0-dsp1-misc-103c8d90-amp1.bin
+#  File: cirrus/cs35l56-b0-dsp1-misc-103c8d90-amp2.bin
+#  Link: cirrus/cs35l54-b0-dsp1-misc-103c8d91.wmfw -> cs35l56/CS35L56_Rev3.11.11.1.wmfw
+#  Link: cirrus/cs35l54-b0-dsp1-misc-103c8d91-amp1.bin -> cs35l54-b0-dsp1-misc-103c8d8e-amp1.bin
+# -Link: cirrus/cs35l54-b0-dsp1-misc-103c8d91-amp2.bin -> cs35l54-b0-dsp1-misc-103c8d8e-amp1.bin
+# +Link: cirrus/cs35l54-b0-dsp1-misc-103c8d91-amp2.bin -> cs35l54-b0-dsp1-misc-103c8d8e-amp2.bin
+#  Link: cirrus/cs35l56-b0-dsp1-misc-103c8d91.wmfw -> cs35l56/CS35L56_Rev3.11.11.1.wmfw
+#  Link: cirrus/cs35l56-b0-dsp1-misc-103c8d91-amp1.bin -> cs35l54-b0-dsp1-misc-103c8d8e-amp1.bin
+# -Link: cirrus/cs35l56-b0-dsp1-misc-103c8d91-amp2.bin -> cs35l54-b0-dsp1-misc-103c8d8e-amp1.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-103c8d91-amp2.bin -> cs35l54-b0-dsp1-misc-103c8d8e-amp2.bin
+#  Link: cirrus/cs35l56-b0-dsp1-misc-103c8d92.wmfw -> cs35l56/CS35L56_Rev3.11.11.1.wmfw
+#  Link: cirrus/cs35l56-b0-dsp1-misc-103c8d92-amp1.bin -> cs35l56-b0-dsp1-misc-103c8d90-amp1.bin
+#  Link: cirrus/cs35l56-b0-dsp1-misc-103c8d92-amp2.bin -> cs35l56-b0-dsp1-misc-103c8d90-amp2.bin
+# @@ -7605,22 +7743,22 @@
+#  Link: cirrus/cs35l54-b0-dsp1-misc-103c8e16-amp2.bin -> cs35l54-b0-dsp1-misc-103c8e14-amp2.bin
+#  Link: cirrus/cs35l54-b0-dsp1-misc-103c8e17.wmfw -> cs35l56/CS35L56_Rev3.11.11.1.wmfw
+#  Link: cirrus/cs35l54-b0-dsp1-misc-103c8e17-amp1.bin -> cs35l54-b0-dsp1-misc-103c8e15-amp1.bin
+# -Link: cirrus/cs35l54-b0-dsp1-misc-103c8e17-amp2.bin -> cs35l54-b0-dsp1-misc-103c8e15-amp1.bin
+# +Link: cirrus/cs35l54-b0-dsp1-misc-103c8e17-amp2.bin -> cs35l54-b0-dsp1-misc-103c8e15-amp2.bin
+#  Link: cirrus/cs35l54-b0-dsp1-misc-103c8e18.wmfw -> cs35l56/CS35L56_Rev3.11.11.1.wmfw
+#  Link: cirrus/cs35l54-b0-dsp1-misc-103c8e18-amp1.bin -> cs35l54-b0-dsp1-misc-103c8e15-amp1.bin
+# -Link: cirrus/cs35l54-b0-dsp1-misc-103c8e18-amp2.bin -> cs35l54-b0-dsp1-misc-103c8e15-amp1.bin
+# +Link: cirrus/cs35l54-b0-dsp1-misc-103c8e18-amp2.bin -> cs35l54-b0-dsp1-misc-103c8e15-amp2.bin
+#  Link: cirrus/cs35l54-b0-dsp1-misc-103c8e19.wmfw -> cs35l56/CS35L56_Rev3.11.11.1.wmfw
+#  Link: cirrus/cs35l54-b0-dsp1-misc-103c8e19-amp1.bin -> cs35l54-b0-dsp1-misc-103c8e15-amp1.bin
+# -Link: cirrus/cs35l54-b0-dsp1-misc-103c8e19-amp2.bin -> cs35l54-b0-dsp1-misc-103c8e15-amp1.bin
+# +Link: cirrus/cs35l54-b0-dsp1-misc-103c8e19-amp2.bin -> cs35l54-b0-dsp1-misc-103c8e15-amp2.bin
+#  Link: cirrus/cs35l54-b0-dsp1-misc-103c8e1a.wmfw -> cs35l56/CS35L56_Rev3.11.11.1.wmfw
+#  Link: cirrus/cs35l54-b0-dsp1-misc-103c8e1a-amp1.bin -> cs35l54-b0-dsp1-misc-103c8e15-amp1.bin
+# -Link: cirrus/cs35l54-b0-dsp1-misc-103c8e1a-amp2.bin -> cs35l54-b0-dsp1-misc-103c8e15-amp1.bin
+# +Link: cirrus/cs35l54-b0-dsp1-misc-103c8e1a-amp2.bin -> cs35l54-b0-dsp1-misc-103c8e15-amp2.bin
+#  Link: cirrus/cs35l54-b0-dsp1-misc-103c8e1b.wmfw -> cs35l56/CS35L56_Rev3.11.11.1.wmfw
+#  File: cirrus/cs35l54-b0-dsp1-misc-103c8e1b-amp1.bin
+#  File: cirrus/cs35l54-b0-dsp1-misc-103c8e1b-amp2.bin
+#  Link: cirrus/cs35l54-b0-dsp1-misc-103c8e1c.wmfw -> cs35l56/CS35L56_Rev3.11.11.1.wmfw
+#  Link: cirrus/cs35l54-b0-dsp1-misc-103c8e1c-amp1.bin -> cs35l54-b0-dsp1-misc-103c8e1b-amp1.bin
+# -Link: cirrus/cs35l54-b0-dsp1-misc-103c8e1c-amp2.bin -> cs35l54-b0-dsp1-misc-103c8e1b-amp1.bin
+# +Link: cirrus/cs35l54-b0-dsp1-misc-103c8e1c-amp2.bin -> cs35l54-b0-dsp1-misc-103c8e1b-amp2.bin
+#  Link: cirrus/cs35l56-b0-dsp1-misc-103c8e2c.wmfw -> cs35l56/CS35L56_Rev3.11.11.1.wmfw
+#  Link: cirrus/cs35l56-b0-dsp1-misc-103c8e2c-amp1.bin -> cs35l56-b0-dsp1-misc-103c8d90-amp1.bin
+#  Link: cirrus/cs35l56-b0-dsp1-misc-103c8e2c-amp2.bin -> cs35l56-b0-dsp1-misc-103c8d90-amp2.bin
+# @@ -7783,8 +7921,8 @@
+#  Info: 0xc1c2
+#  
+#  File: amlogic/aml_w265s2_bt_uart.bin
+# -Version: 42.28
+# -Info: 0xb2fd
+# +Version: 51.06
+# +Info: 0xe863
+#  
+#  Licence: Redistributable. See LICENSE.amlogic for details
+#  
+# @@ -7820,9 +7958,22 @@
+#  --------------------------------------------------------------------------
+#  
+#  Driver: ti-tas2781 - tas2781 firmware
+# +File: ti/tas2781/TAS2XXX0C94.bin
+# +File: ti/tas2781/TAS2XXX0C95.bin
+# +File: ti/tas2781/TAS2XXX0C96.bin
+# +File: ti/tas2781/TAS2XXX0C97.bin
+# +File: ti/tas2781/TAS2XXX10A40.bin
+# +File: ti/tas2781/TAS2XXX10A41.bin
+# +File: ti/tas2781/TAS2XXX11540.bin
+# +File: ti/tas2781/TAS2XXX11541.bin
+# +File: ti/tas2781/TAS2XXX12040.bin
+# +File: ti/tas2781/TAS2XXX12041.bin
+# +File: ti/tas2781/TAS2XXX12140.bin
+# +File: ti/tas2781/TAS2XXX12141.bin
+#  File: ti/tas2781/TAS2XXX1EB30.bin
+#  File: ti/tas2781/TAS2XXX1EB31.bin
+#  File: ti/tas2781/TAS2XXX2234.bin
+# +File: ti/tas2781/TAS2XXX2326.bin
+#  File: ti/tas2781/TAS2XXX387D.bin
+#  File: ti/tas2781/TAS2XXX387E.bin
+#  File: ti/tas2781/TAS2XXX387F.bin
+# @@ -7849,12 +8000,50 @@
+#  File: ti/tas2781/TAS2XXX38D6.bin
+#  File: ti/tas2781/TAS2XXX38DF.bin
+#  File: ti/tas2781/TAS2XXX38E0.bin
+# +File: ti/tas2781/TAS2XXX38FD.bin
+# +File: ti/tas2781/TAS2XXX391F.bin
+# +File: ti/tas2781/TAS2XXX3920.bin
+# +File: ti/tas2781/TAS2XXX3E300.bin
+# +File: ti/tas2781/TAS2XXX3E301.bin
+# +File: ti/tas2781/TAS2XXX3EE00.bin
+# +File: ti/tas2781/TAS2XXX3EE01.bin
+# +File: ti/tas2781/TAS2XXX3EF00.bin
+# +File: ti/tas2781/TAS2XXX3EF01.bin
+# +File: ti/tas2781/TAS2XXX3F000.bin
+# +File: ti/tas2781/TAS2XXX3F001.bin
+# +File: ti/tas2781/TAS2XXX3F100.bin
+# +File: ti/tas2781/TAS2XXX3F101.bin
+# +File: ti/tas2781/TAS2XXX3F200.bin
+# +File: ti/tas2781/TAS2XXX3F201.bin
+# +File: ti/tas2781/TAS2XXX3F300.bin
+# +File: ti/tas2781/TAS2XXX3F301.bin
+# +File: ti/tas2781/TAS2XXX8DE8.bin
+# +File: ti/tas2781/TAS2XXX8DE9.bin
+# +File: ti/tas2781/TXNW2781RCA0.bin
+# +File: ti/tas2781/TXNW2781RCA1.bin
+#  File: ti/tas2781/TIAS2781RCA2.bin
+#  File: ti/tas2781/TIAS2781RCA4.bin
+# +Link: TAS2XXX0C94.bin -> ti/tas2781/TAS2XXX0C94.bin
+# +Link: TAS2XXX0C95.bin -> ti/tas2781/TAS2XXX0C95.bin
+# +Link: TAS2XXX0C96.bin -> ti/tas2781/TAS2XXX0C96.bin
+# +Link: TAS2XXX0C97.bin -> ti/tas2781/TAS2XXX0C97.bin
+# +Link: TAS2XXX103C8DE80.bin -> ti/tas2781/TAS2XXX8DE8.bin
+# +Link: TAS2XXX103C8DE81.bin -> ti/tas2781/TAS2XXX8DE8.bin
+# +Link: TAS2XXX103C8DE90.bin -> ti/tas2781/TAS2XXX8DE9.bin
+# +Link: TAS2XXX103C8DE91.bin -> ti/tas2781/TAS2XXX8DE9.bin
+# +Link: TAS2XXX10A40.bin -> ti/tas2781/TAS2XXX10A40.bin
+# +Link: TAS2XXX10A41.bin -> ti/tas2781/TAS2XXX10A41.bin
+# +Link: TAS2XXX11540.bin -> ti/tas2781/TAS2XXX11540.bin
+# +Link: TAS2XXX11541.bin -> ti/tas2781/TAS2XXX11541.bin
+# +Link: TAS2XXX12040.bin -> ti/tas2781/TAS2XXX12040.bin
+# +Link: TAS2XXX12041.bin -> ti/tas2781/TAS2XXX12041.bin
+# +Link: TAS2XXX12140.bin -> ti/tas2781/TAS2XXX12140.bin
+# +Link: TAS2XXX12141.bin -> ti/tas2781/TAS2XXX12141.bin
+#  Link: TAS2XXX1EB3.bin -> ti/tas2781/TAS2XXX1EB30.bin
+#  Link: TAS2XXX1EB30.bin -> ti/tas2781/TAS2XXX1EB30.bin
+#  Link: TAS2XXX1EB31.bin -> ti/tas2781/TAS2XXX1EB31.bin
+#  Link: TAS2XXX2234.bin -> ti/tas2781/TAS2XXX2234.bin
+# +Link: TAS2XXX2326.bin -> ti/tas2781/TAS2XXX2326.bin
+#  Link: TAS2XXX387D.bin -> ti/tas2781/TAS2XXX387D.bin
+#  Link: TAS2XXX387E.bin -> ti/tas2781/TAS2XXX387E.bin
+#  Link: TAS2XXX387F.bin -> ti/tas2781/TAS2XXX387F.bin
+# @@ -7881,8 +8070,35 @@
+#  Link: TAS2XXX38D6.bin -> ti/tas2781/TAS2XXX38D6.bin
+#  Link: TAS2XXX38DF.bin -> ti/tas2781/TAS2XXX38DF.bin
+#  Link: TAS2XXX38E0.bin -> ti/tas2781/TAS2XXX38E0.bin
+# +Link: TAS2XXX38FD.bin -> ti/tas2781/TAS2XXX38FD.bin
+# +Link: TAS2XXX391F.bin -> ti/tas2781/TAS2XXX391F.bin
+# +Link: TAS2XXX3920.bin -> ti/tas2781/TAS2XXX3920.bin
+# +Link: TAS2XXX3E300.bin -> ti/tas2781/TAS2XXX3E300.bin
+# +Link: TAS2XXX3E301.bin -> ti/tas2781/TAS2XXX3E301.bin
+# +Link: TAS2XXX3EE00.bin -> ti/tas2781/TAS2XXX3EE00.bin
+# +Link: TAS2XXX3EE01.bin -> ti/tas2781/TAS2XXX3EE01.bin
+# +Link: TAS2XXX3EF00.bin -> ti/tas2781/TAS2XXX3EF00.bin
+# +Link: TAS2XXX3EF01.bin -> ti/tas2781/TAS2XXX3EF01.bin
+# +Link: TAS2XXX3F000.bin -> ti/tas2781/TAS2XXX3F000.bin
+# +Link: TAS2XXX3F001.bin -> ti/tas2781/TAS2XXX3F001.bin
+# +Link: TAS2XXX3F100.bin -> ti/tas2781/TAS2XXX3F100.bin
+# +Link: TAS2XXX3F101.bin -> ti/tas2781/TAS2XXX3F101.bin
+# +Link: TAS2XXX3F200.bin -> ti/tas2781/TAS2XXX3F200.bin
+# +Link: TAS2XXX3F201.bin -> ti/tas2781/TAS2XXX3F201.bin
+# +Link: TAS2XXX3F300.bin -> ti/tas2781/TAS2XXX3F300.bin
+# +Link: TAS2XXX3F301.bin -> ti/tas2781/TAS2XXX3F301.bin
+# +Link: TAS2XXX8DE8.bin -> ti/tas2781/TAS2XXX8DE8.bin
+# +Link: TAS2XXX8DE9.bin -> ti/tas2781/TAS2XXX8DE9.bin
+# +Link: TAS2XXX8DE80.bin -> ti/tas2781/TAS2XXX8DE8.bin
+# +Link: TAS2XXX8DE81.bin -> ti/tas2781/TAS2XXX8DE8.bin
+# +Link: TAS2XXX8DE90.bin -> ti/tas2781/TAS2XXX8DE9.bin
+# +Link: TAS2XXX8DE91.bin -> ti/tas2781/TAS2XXX8DE9.bin
+#  Link: TIAS2781RCA2.bin -> ti/tas2781/TIAS2781RCA2.bin
+#  Link: TIAS2781RCA4.bin -> ti/tas2781/TIAS2781RCA4.bin
+# +Link: TXNW2781RCA0.bin -> ti/tas2781/TXNW2781RCA0.bin
+# +Link: TXNW2781RCA1.bin -> ti/tas2781/TXNW2781RCA1.bin
+# +Link: TXNW2781RCA2.bin -> ti/tas2781/TIAS2781RCA2.bin
+# +Link: TXNW2781RCA4.bin -> ti/tas2781/TIAS2781RCA4.bin
+#  
+#  Licence: Redistributable. See LICENCE.ti-tspa for details. Marked:
+#  	 Copyright (C) 2023 - 2024 Texas Instruments
+# 
+#
+
 SUMMARY = "Firmware files for use with Linux kernel"
 HOMEPAGE = "https://www.kernel.org/"
 DESCRIPTION = "Linux firmware is a package distributed alongside the Linux kernel \
@@ -154,7 +951,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
                     file://wfx/LICENCE.wf200;md5=4d1beff00d902c05c9c7e95a5d8eb52d \
-                    file://WHENCE;md5=${WHENCE_CHKSUM} \
+                    file://WHENCE;md5=65c2919e6511a0d348a009ac419375b7 \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
@@ -247,7 +1044,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "a12cb38f4793394bf56c6702be29b6e4f09deca0714943bba98a492030651570"
+SRC_URI[sha256sum] = "2de1345897bf839d532c5de0fdb348770ca2a5f4edfb21971582597abb45297d"
 
 inherit allarch
 
-- 
2.44.1


--===============4007131793297174907==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/linux-firmware: SRC_URI changed from "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20250109.tar.xz" to "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20250211.tar.xz"
packages/all-poky-linux/linux-firmware: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-aldebaran: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-aldebaran: PKGSIZE changed from 2403044 to 2403020 (-0%)
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-aldebaran: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-carrizo: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-carrizo: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-cezanne: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-cezanne: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-fiji: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-fiji: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-hawaii: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-hawaii: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-misc: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-misc: PKGSIZE changed from 55617900 to 56196628 (+1%)
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-misc: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi10: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi10: PKGSIZE changed from 2522582 to 2530774 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi10: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi14: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi14: PKGSIZE changed from 3845094 to 3853286 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi14: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi21: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi21: PKGSIZE changed from 3036072 to 3044264 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi21: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi22: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi22: PKGSIZE changed from 2901618 to 2909810 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi22: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi23: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi23: PKGSIZE changed from 2893322 to 2901514 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi23: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi24: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi24: PKGSIZE changed from 2873970 to 2882418 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi24: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi31: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi31: PKGSIZE changed from 3737556 to 3749636 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi31: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi32: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi32: PKGSIZE changed from 2649936 to 2654960 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi32: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-oland: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-oland: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-polaris10: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-polaris10: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-polaris11: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-polaris11: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-polaris12: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-polaris12: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-raven: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-raven: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-rembrandt: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-rembrandt: PKGSIZE changed from 2749456 to 2757648 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-rembrandt: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-renoir: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-renoir: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-stoney: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-stoney: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-tonga: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-tonga: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-topaz: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-topaz: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-vega10: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-vega10: PKGSIZE changed from 2077260 to 2081356 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-vega10: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-vega12: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-vega12: PKGSIZE changed from 1825832 to 1829928 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-vega12: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu-license: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu-license: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar5523: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ar5523: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-misc: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-misc: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca4019: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca4019: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca6174: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca6174: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca9377: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca9377: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca9887: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca9887: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca9888: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca9888: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca988x: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca988x: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca9984: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca9984: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca99x0: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca99x0: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-wcn3990: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-wcn3990: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-ipq5018: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-ipq5018: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-ipq6018: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-ipq6018: PKGSIZE changed from 4942479 to 4945011 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-ipq6018: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-ipq8074: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-ipq8074: PKGSIZE changed from 6662892 to 7010920 (+5%)
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-ipq8074: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-misc: FILELIST: added "/usr/lib/firmware/ath11k/QCA6698AQ/hw2.1/board-2.bin /usr/lib/firmware/ath11k/QCA6698AQ/hw2.1/Notice.txt /usr/lib/firmware/ath11k/QCA6698AQ/hw2.1/m3.bin /usr/lib/firmware/ath11k/QCA6698AQ/hw2.1/amss.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-misc: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-misc: PKGSIZE changed from 0 to 6417486 (+100%)
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-misc: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qca2066: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qca2066: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qca6390: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qca6390: PKGSIZE changed from 4201047 to 4259043 (+1%)
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qca6390: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qcn9074: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qcn9074: PKGSIZE changed from 5251638 to 5510810 (+5%)
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qcn9074: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-wcn6750: FILELIST: added "/usr/lib/firmware/ath11k/WCN6750/hw1.0/qcm6490/wpss.mbn"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-wcn6750: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-wcn6750: PKGSIZE changed from 8625097 to 16443593 (+91%)
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-wcn6750: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-wcn6855: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-wcn6855: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k-misc: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k-misc: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k-qcn9274: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k-qcn9274: PKGSIZE changed from 15673506 to 16857826 (+8%)
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k-qcn9274: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k-wcn7850: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k-wcn7850: PKGSIZE changed from 8341323 to 8430307 (+1%)
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k-wcn7850: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2x: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2x: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cc33xx: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-cc33xx: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus-license: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus-license: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cnm-license: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-cnm-license: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cnm: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-cnm: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200-license: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200-license: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dev: RRECOMMENDS: added "linux-firmware-ath11k-wcn6750-dev"
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGSIZE changed from 28038339 to 28038723 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-18: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-18: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGSIZE changed from 25039263 to 25045491 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced-license: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced-license: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9260: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9260: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: FILELIST: added "/usr/lib/firmware/iwlwifi-bz-b0-fm-c0-96.ucode /usr/lib/firmware/iwlwifi-bz-b0-fm-c0-93.ucode /usr/lib/firmware/iwlwifi-gl-c0-fm-c0-96.ucode /usr/lib/firmware/iwlwifi-bz-b0-gf-a0-96.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PKGSIZE changed from 178109560 to 185648544 (+4%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-license: FILELIST: added "/usr/lib/firmware/LICENSE.qcom-2"
packages/all-poky-linux/linux-firmware/linux-firmware-license: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGSIZE changed from 116925 to 131342 (+12%)
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-linaro-license: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-linaro-license: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mali-csffw-arch108: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-mali-csffw-arch108: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mali-csffw-license: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-mali-csffw-license: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek-license: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek-license: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek: PKGSIZE changed from 45446913 to 45450177 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mellanox: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-mellanox: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-microchip-license: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-microchip-license: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-microchip: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-microchip: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-moxa-license: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-moxa-license: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-moxa: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-moxa: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7650: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7650: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x-license: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x-license: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x2: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x2: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-license: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-license: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc-license: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc-license: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8987-sdio: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8987-sdio: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-common: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-common: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-pcie: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-pcie: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-sdio: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-sdio: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-common: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-common: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-pcie: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-pcie: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-sdio: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-sdio: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw416-sdio: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw416-sdio: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw612-sdio: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw612-sdio: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-olpc-license: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-olpc-license: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-olpc: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-olpc: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw-license: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw-license: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-powervr-license: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-powervr-license: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-powervr: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-powervr: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-prestera: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-prestera: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-misc: FILELIST: added "/usr/lib/firmware/qca/cmbtfw12.tlv /usr/lib/firmware/qca/cmbtfw13.tlv /usr/lib/firmware/qca/QCA6698/hpbtfw21.tlv /usr/lib/firmware/qca/cmnv12.bin /usr/lib/firmware/qca/cmnv13s.bin /usr/lib/firmware/qca/cmnv13t.bin /usr/lib/firmware/qca/QCA6698/hpnv21.bin /usr/lib/firmware/qca/cmnv13.bin /usr/lib/firmware/qca/QCA6698/hpnv21.b207 /usr/lib/firmware/qca/QCA6698/hpnv21.b206"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-misc: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-misc: PKGSIZE changed from 134054 to 392295 (+193%)
packages/all-poky-linux/linux-firmware/linux-firmware-qca-misc: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca2066: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca2066: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca61x4-serial: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca61x4-serial: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca61x4-usb: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca61x4-usb: PKGSIZE changed from 808328 to 808792 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca61x4-usb: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca6390: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca6390: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn3988: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn3988: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn399x: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn399x: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn6750: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn6750: PKGSIZE changed from 340433 to 417209 (+23%)
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn6750: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn7850: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn7850: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a663: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a663: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a702: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a702: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-g750: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-g750: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-aic100: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-aic100: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-modem: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-modem: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-wifi: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-wifi: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-adreno: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-adreno: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-adreno: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-adreno: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-audio: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-audio: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-modem: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-modem: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-wifi: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-wifi: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-adreno: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-adreno: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-audio: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-audio: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-compute: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-compute: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-ipa: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-ipa: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcs615-adreno: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcs615-adreno: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qdu100: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qdu100: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-adreno: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-adreno: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-audio: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-audio: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-compute: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-compute: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-modem: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-modem: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-wifi: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-wifi: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sa8775p-adreno: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sa8775p-adreno: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-adreno: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-adreno: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-thundercomm-db845c-sensors: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-thundercomm-db845c-sensors: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-adreno: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-adreno: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-thundercomm-rb5-sensors: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-thundercomm-rb5-sensors: PKGSIZE changed from 5647104 to 7455860 (+32%)
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-thundercomm-rb5-sensors: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8550-audio-tplg: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8550-audio-tplg: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8650-audio-tplg: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8650-audio-tplg: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-6.0: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-6.0: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-adreno: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-adreno: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-audio: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-audio: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-yamato-license: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-yamato-license: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qed: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qed: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx-license: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx-license: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-dptx: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-dptx: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-license: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-license: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-nic: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-nic: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8761: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8761: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8822: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8822: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PKGSIZE changed from 623261 to 623373 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-src: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-src: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone-license: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone-license: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wfx-license: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-wfx-license: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wfx: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-wfx: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGSIZE changed from 300671 to 309174 (+3%)
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251-license: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251-license: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000-license: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000-license: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000-license: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000-license: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c-license: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c-license: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c: PKGV changed from 20250109 [default] to 20250211 [default]
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: added "/usr/lib/firmware/qcom/sa8775p/adspr.jsn /usr/lib/firmware/qcom/sa8775p/cdspr.jsn /usr/lib/firmware/qcom/sa8775p/cdsp0.mbn /usr/lib/firmware/ti/tas2781/TAS2XXX3EE01.bin /usr/lib/firmware/ti/tas2781/TAS2XXX3EF01.bin /usr/lib/firmware/ti/tas2781/TAS2XXX3F001.bin /usr/lib/firmware/ti/tas2781/TAS2XXX3F101.bin /usr/lib/firmware/ti/tas2781/TAS2XXX3F301.bin /usr/lib/firmware/ti/tas2781/TAS2XXX3F201.bin /usr/lib/firmware/ti/tas2781/TAS2XXX10A41.bin /usr/lib/firmware/ti/tas2781/TAS2XXX11541.bin /usr/lib/firmware/ti/tas2781/TAS2XXX12041.bin /usr/lib/firmware/ti/tas2781/TAS2XXX12141.bin /usr/lib/firmware/TAS2XXX103C8DE91.bin /usr/lib/firmware/TAS2XXX0C96.bin /usr/lib/firmware/TAS2XXX8DE9.bin /usr/lib/firmware/TAS2XXX0C94.bin /usr/lib/firmware/TAS2XXX0C95.bin /usr/lib/firmware/TAS2XXX8DE8.bin /usr/lib/firmware/TAS2XXX0C97.bin /usr/lib/firmware/TAS2XXX103C8DE90.bin /usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/adspr.jsn /usr/li
 b/firmware/qcom/x1e80100/LENOVO/21N1/cdspr.jsn /usr/lib/firmware/TAS2XXX2326.bin /usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/adsp_dtbs.elf /usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/cdsp_dtbs.elf /usr/lib/firmware/ti/tas2781/TAS2XXX3F100.bin /usr/lib/firmware/TAS2XXX8DE81.bin /usr/lib/firmware/TAS2XXX8DE90.bin /usr/lib/firmware/TAS2XXX8DE91.bin /usr/lib/firmware/TAS2XXX8DE80.bin /usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/adsps.jsn /usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/adspua.jsn /usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/qcadsp8380.mbn /usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/qccdsp8380.mbn /usr/lib/firmware/qcom/sa8775p/cdsp1.mbn /usr/lib/firmware/qcom/qcs6490/wpss.mbn /usr/lib/firmware/TAS2XXX3F301.bin /usr/lib/firmware/TAS2XXX3F000.bin /usr/lib/firmware/TAS2XXX3F001.bin /usr/lib/firmware/TAS2XXX3F100.bin /usr/lib/firmware/TAS2XXX3F101.bin /usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/qcdxkmsuc8380.mbn /usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/battmgr.jsn /usr/lib/firm
 ware/TAS2XXX3EF01.bin /usr/lib/firmware/qcom/sa8775p/adsp.mbn /usr/lib/firmware/ti/tas2781/TAS2XXX8DE9.bin /usr/lib/firmware/qcom/sa8775p/adspua.jsn /usr/lib/firmware/TAS2XXX391F.bin /usr/lib/firmware/TAS2XXX3920.bin /usr/lib/firmware/TAS2XXX38FD.bin /usr/lib/firmware/rtw89/rtw8922a_fw-3.bin /usr/lib/firmware/TAS2XXX103C8DE80.bin /usr/lib/firmware/ti/tas2781/TXNW2781RCA0.bin /usr/lib/firmware/qcom/sa8775p/gpdsp1r.jsn /usr/lib/firmware/ti/tas2781/TAS2XXX3E301.bin /usr/lib/firmware/TAS2XXX11540.bin /usr/lib/firmware/TAS2XXX11541.bin /usr/lib/firmware/TAS2XXX12040.bin /usr/lib/firmware/TAS2XXX12041.bin /usr/lib/firmware/TAS2XXX12140.bin /usr/lib/firmware/TAS2XXX12141.bin /usr/lib/firmware/TAS2XXX10A40.bin /usr/lib/firmware/TAS2XXX10A41.bin /usr/lib/firmware/TAS2XXX3E300.bin /usr/lib/firmware/TAS2XXX3E301.bin /usr/lib/firmware/ti/tas2781/TXNW2781RCA1.bin /usr/lib/firmware/TAS2XXX3EE00.bin /usr/lib/firmware/TAS2XXX3EE01.bin /usr/lib/firmware/TAS2XXX3EF00.bin /usr/lib/firmware/TAS2XXX3F20
 0.bin /usr/lib/firmware/TAS2XXX3F201.bin /usr/lib/firmware/TAS2XXX3F300.bin /usr/lib/firmware/qcom/sa8775p/gpdsp0.mbn /usr/lib/firmware/atmel/wilc3000_wifi_firmware-1.bin /usr/lib/firmware/qcom/sa8775p/gpdsp1.mbn /usr/lib/firmware/qcom/sa8775p/gpdspr.jsn /usr/lib/firmware/TXNW2781RCA0.bin /usr/lib/firmware/TXNW2781RCA1.bin /usr/lib/firmware/TXNW2781RCA2.bin /usr/lib/firmware/ti/tas2781/TAS2XXX3F200.bin /usr/lib/firmware/ti/tas2781/TAS2XXX3F300.bin /usr/lib/firmware/ti/tas2781/TAS2XXX10A40.bin /usr/lib/firmware/ti/tas2781/TAS2XXX11540.bin /usr/lib/firmware/ti/tas2781/TAS2XXX12040.bin /usr/lib/firmware/ti/tas2781/TAS2XXX12140.bin /usr/lib/firmware/ti/tas2781/TAS2XXX3E300.bin /usr/lib/firmware/ti/tas2781/TAS2XXX3EE00.bin /usr/lib/firmware/ti/tas2781/TAS2XXX3EF00.bin /usr/lib/firmware/ti/tas2781/TAS2XXX3F000.bin /usr/lib/firmware/TXNW2781RCA4.bin /usr/lib/firmware/ti/tas2781/TAS2XXX8DE8.bin /usr/lib/firmware/ti/tas2781/TAS2XXX0C94.bin /usr/lib/firmware/ti/tas2781/TAS2XXX0C95.bin /usr/li
 b/firmware/ti/tas2781/TAS2XXX0C96.bin /usr/lib/firmware/ti/tas2781/TAS2XXX0C97.bin /usr/lib/firmware/ti/tas2781/TAS2XXX2326.bin /usr/lib/firmware/ti/tas2781/TAS2XXX38FD.bin /usr/lib/firmware/ti/tas2781/TAS2XXX3920.bin /usr/lib/firmware/ti/tas2781/TAS2XXX391F.bin /usr/lib/firmware/TAS2XXX103C8DE81.bin /usr/lib/firmware/qcom/qcm6490/wpss.mbn"
packages/all-poky-linux/linux-firmware/linux-firmware: RDEPENDS: added "linux-firmware-ath11k-wcn6750"
packages/all-poky-linux/linux-firmware/linux-firmware: PV changed from "20250109" to "20250211"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGSIZE changed from 95586763 to 148902840 (+56%)
packages/all-poky-linux/linux-firmware/linux-firmware: PKGV changed from 20250109 [default] to 20250211 [default]

--===============4007131793297174907==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-linux-firmware-upgrade-20250109-20250211.patch"

RnJvbSBlMDZlYjYzYmJmNjk4ZTEyYzM1NDMzYjkwZjQ5ZGM1OTg5MzM5MGExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgRmViIDIwMjUgMTA6NDI6MTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aW51eC1maXJtd2FyZTogdXBncmFkZSAyMDI1MDEwOSAtPiAyMDI1MDIxMQoKLS0tCiAuLi4yMDI1
MDEwOS5iYiA9PiBsaW51eC1maXJtd2FyZV8yMDI1MDIxMS5iYn0gfCA4MDEgKysrKysrKysrKysr
KysrKystCiAxIGZpbGUgY2hhbmdlZCwgNzk5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS97bGludXgtZmlybXdh
cmVfMjAyNTAxMDkuYmIgPT4gbGludXgtZmlybXdhcmVfMjAyNTAyMTEuYmJ9ICg3NiUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2Fy
ZV8yMDI1MDEwOS5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgt
ZmlybXdhcmVfMjAyNTAyMTEuYmIKc2ltaWxhcml0eSBpbmRleCA3NiUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZV8yMDI1MDEwOS5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJt
d2FyZV8yMDI1MDIxMS5iYgppbmRleCBiOTMyMzAwNzQyLi5lODEyYjBmOTc2IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlXzIwMjUw
MTA5LmJiCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgtZmly
bXdhcmVfMjAyNTAyMTEuYmIKQEAgLTEsMyArMSw4MDAgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklM
RVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4K
KyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRo
ZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlm
IG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3Nh
Z2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0
ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0t
LSBXSEVOQ0UKKyMgKysrIFdIRU5DRQorIyBAQCAtNzQwLDcgKzc0MCw3IEBACisjICBWZXJzaW9u
OiBXMTYuNjguMS5wMTgzCisjICAKKyMgIEZpbGU6IG1ydmwvc2RzZDg5OTdfY29tYm9fdjQuYmlu
CisjIC1WZXJzaW9uOiBXMTYuNjguMS5wMTc5CisjICtWZXJzaW9uOiBXMTYuNjguMS5wMTk3LjEK
KyMgIAorIyAgRmlsZTogbXJ2bC9zZHNkODk3N19jb21ib192Mi5iaW4KKyMgIFZlcnNpb246IFcx
Ni42OC4xLnAxOTUKKyMgQEAgLTEwMjIsMjUgKzEwMjIsMjUgQEAKKyMgIFZlcnNpb246IDc0LmE1
ZTk1ODhiLjAKKyMgIAorIyAgRmlsZTogaXdsd2lmaS1jYy1hMC03Ny51Y29kZQorIyAtVmVyc2lv
bjogNzQuMGI0YzA2YWQuMAorIyArVmVyc2lvbjogNzQuYjQwNWY5ZDQuMAorIyAgCisjICBGaWxl
OiBpd2x3aWZpLVF1LWIwLWhyLWIwLTc3LnVjb2RlCisjIC1WZXJzaW9uOiA3NC4wYjRjMDZhZC4w
CisjICtWZXJzaW9uOiA3NC5iNDA1ZjlkNC4wCisjICAKKyMgIEZpbGU6IGl3bHdpZmktUXUtYjAt
amYtYjAtNzcudWNvZGUKKyMgLVZlcnNpb246IDc0LjBiNGMwNmFkLjAKKyMgK1ZlcnNpb246IDc0
LmI0MDVmOWQ0LjAKKyMgIAorIyAgRmlsZTogaXdsd2lmaS1RdS1jMC1oci1iMC03Ny51Y29kZQor
IyAtVmVyc2lvbjogNzQuMGI0YzA2YWQuMAorIyArVmVyc2lvbjogNzQuYjQwNWY5ZDQuMAorIyAg
CisjICBGaWxlOiBpd2x3aWZpLVF1LWMwLWpmLWIwLTc3LnVjb2RlCisjIC1WZXJzaW9uOiA3NC4w
YjRjMDZhZC4wCisjICtWZXJzaW9uOiA3NC5iNDA1ZjlkNC4wCisjICAKKyMgIEZpbGU6IGl3bHdp
ZmktUXVaLWEwLWhyLWIwLTc3LnVjb2RlCisjIC1WZXJzaW9uOiA3NC4wYjRjMDZhZC4wCisjICtW
ZXJzaW9uOiA3NC5iNDA1ZjlkNC4wCisjICAKKyMgIEZpbGU6IGl3bHdpZmktUXVaLWEwLWpmLWIw
LTc3LnVjb2RlCisjIC1WZXJzaW9uOiA3NC4wYjRjMDZhZC4wCisjICtWZXJzaW9uOiA3NC5iNDA1
ZjlkNC4wCisjICAKKyMgIEZpbGU6IGl3bHdpZmktdHktYTAtZ2YtYTAtNzcudWNvZGUKKyMgIFZl
cnNpb246IDc0LmY5MmI1ZmVkLjAKKyMgQEAgLTEwNjQsNyArMTA2NCw3IEBACisjICBWZXJzaW9u
OiA4My5mYjVjOWFlYi4wCisjICAKKyMgIEZpbGU6IGl3bHdpZmktdHktYTAtZ2YtYTAtODkudWNv
ZGUKKyMgLVZlcnNpb246IDg2LjZiNDRmYTBiLjAKKyMgK1ZlcnNpb246IDg2LjFhNDkyZDI4LjAK
KyMgIAorIyAgRmlsZTogaXdsd2lmaS1zby1hMC1nZjQtYTAtNzcudWNvZGUKKyMgIFZlcnNpb246
IDc0LmY5MmI1ZmVkLjAKKyMgQEAgLTEwODgsNyArMTA4OCw3IEBACisjICBWZXJzaW9uOiA4My5m
YjVjOWFlYi4wCisjICAKKyMgIEZpbGU6IGl3bHdpZmktc28tYTAtZ2Y0LWEwLTg5LnVjb2RlCisj
IC1WZXJzaW9uOiA4Ni42YjQ0ZmEwYi4wCisjICtWZXJzaW9uOiA4Ni4xYTQ5MmQyOC4wCisjICAK
KyMgIEZpbGU6IGl3bHdpZmktc28tYTAtZ2YtYTAtNzcudWNvZGUKKyMgIFZlcnNpb246IDc0LmY5
MmI1ZmVkLjAKKyMgQEAgLTExMTIsNyArMTExMiw3IEBACisjICBWZXJzaW9uOiA4My5mYjVjOWFl
Yi4wCisjICAKKyMgIEZpbGU6IGl3bHdpZmktc28tYTAtZ2YtYTAtODkudWNvZGUKKyMgLVZlcnNp
b246IDg2LjZiNDRmYTBiLjAKKyMgK1ZlcnNpb246IDg2LjFhNDkyZDI4LjAKKyMgIAorIyAgRmls
ZTogaXdsd2lmaS1zby1hMC1oci1iMC03Ny51Y29kZQorIyAgVmVyc2lvbjogNzQuZjkyYjVmZWQu
MAorIyBAQCAtMTEzMyw3ICsxMTMzLDcgQEAKKyMgIFZlcnNpb246IDgzLmZiNWM5YWViLjAKKyMg
IAorIyAgRmlsZTogaXdsd2lmaS1zby1hMC1oci1iMC04OS51Y29kZQorIyAtVmVyc2lvbjogODYu
NmI0NGZhMGIuMAorIyArVmVyc2lvbjogODYuMWE0OTJkMjguMAorIyAgCisjICBGaWxlOiBpd2x3
aWZpLXNvLWEwLWpmLWIwLTc3LnVjb2RlCisjICBWZXJzaW9uOiA3NC5mOTJiNWZlZC4wCisjIEBA
IC0xMTQ2LDYgKzExNDYsOSBAQAorIyAgRmlsZTogaXdsd2lmaS1iei1iMC1nZi1hMC05NC51Y29k
ZQorIyAgVmVyc2lvbjogOTEuNjI5OTA1NTMuMAorIyAgCisjICtGaWxlOiBpd2x3aWZpLWJ6LWIw
LWdmLWEwLTk2LnVjb2RlCisjICtWZXJzaW9uOiA5My40NDcyOWQ0ZS4wCisjICsKKyMgIEZpbGU6
IGl3bHdpZmktYnotYjAtZ2YtYTAucG52bQorIyAgCisjICBGaWxlOiBpd2x3aWZpLWdsLWMwLWZt
LWMwLTgzLnVjb2RlCisjIEBAIC0xMTYzLDE0ICsxMTY2LDIzIEBACisjICBGaWxlOiBpd2x3aWZp
LWdsLWMwLWZtLWMwLTk0LnVjb2RlCisjICBWZXJzaW9uOiA5MS42Mjk5MDU1My4wCisjICAKKyMg
K0ZpbGU6IGl3bHdpZmktZ2wtYzAtZm0tYzAtOTYudWNvZGUKKyMgK1ZlcnNpb246IDkzLjQ0NzI5
ZDRlLjAKKyMgKworIyAgRmlsZTogaXdsd2lmaS1nbC1jMC1mbS1jMC5wbnZtCisjICAKKyMgIEZp
bGU6IGl3bHdpZmktYnotYjAtZm0tYzAtOTIudWNvZGUKKyMgIFZlcnNpb246IDg5LjY3Y2U0NTg4
LjAKKyMgIAorIyArRmlsZTogaXdsd2lmaS1iei1iMC1mbS1jMC05My51Y29kZQorIyArVmVyc2lv
bjogOTAuMjZhMmNiODkuMAorIyArCisjICBGaWxlOiBpd2x3aWZpLWJ6LWIwLWZtLWMwLTk0LnVj
b2RlCisjICBWZXJzaW9uOiA5MS42Mjk5MDU1My4wCisjICAKKyMgK0ZpbGU6IGl3bHdpZmktYnot
YjAtZm0tYzAtOTYudWNvZGUKKyMgK1ZlcnNpb246IDkzLjQ0NzI5ZDRlLjAKKyMgKworIyAgRmls
ZTogaXdsd2lmaS1iei1iMC1mbS1jMC5wbnZtCisjICAKKyMgIEZpbGU6IGl3bHdpZmktbWEtYjAt
Z2YtYTAtODMudWNvZGUKKyMgQEAgLTExODAsNyArMTE5Miw3IEBACisjICBWZXJzaW9uOiA4My5m
YjVjOWFlYi4wCisjICAKKyMgIEZpbGU6IGl3bHdpZmktbWEtYjAtZ2YtYTAtODkudWNvZGUKKyMg
LVZlcnNpb246IDg2LjZiNDRmYTBiLjAKKyMgK1ZlcnNpb246IDg2LjFhNDkyZDI4LjAKKyMgIAor
IyAgRmlsZTogaXdsd2lmaS1tYS1iMC1nZi1hMC5wbnZtCisjICAKKyMgQEAgLTExOTEsNyArMTIw
Myw3IEBACisjICBWZXJzaW9uOiA4My5mYjVjOWFlYi4wCisjICAKKyMgIEZpbGU6IGl3bHdpZmkt
bWEtYjAtZ2Y0LWEwLTg5LnVjb2RlCisjIC1WZXJzaW9uOiA4Ni42YjQ0ZmEwYi4wCisjICtWZXJz
aW9uOiA4Ni4xYTQ5MmQyOC4wCisjICAKKyMgIEZpbGU6IGl3bHdpZmktbWEtYjAtZ2Y0LWEwLnBu
dm0KKyMgIAorIyBAQCAtMTIwMiw3ICsxMjE0LDcgQEAKKyMgIFZlcnNpb246IDgzLmZiNWM5YWVi
LjAKKyMgIAorIyAgRmlsZTogaXdsd2lmaS1tYS1iMC1oci1iMC04OS51Y29kZQorIyAtVmVyc2lv
bjogODYuNmI0NGZhMGIuMAorIyArVmVyc2lvbjogODYuMWE0OTJkMjguMAorIyAgCisjICBMaWNl
bmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLml3bHdpZmlfZmlybXdhcmUgZm9yIGRl
dGFpbHMKKyMgIAorIyBAQCAtMzQwOCw2ICszNDIwLDcgQEAKKyMgIEZpbGU6IHJ0dzg5L3J0dzg5
MjJhX2Z3LmJpbgorIyAgRmlsZTogcnR3ODkvcnR3ODkyMmFfZnctMS5iaW4KKyMgIEZpbGU6IHJ0
dzg5L3J0dzg5MjJhX2Z3LTIuYmluCisjICtGaWxlOiBydHc4OS9ydHc4OTIyYV9mdy0zLmJpbgor
IyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLnJ0bHdpZmlfZmly
bXdhcmUudHh0IGZvciBkZXRhaWxzLgorIyAgCisjIEBAIC0zODEwLDcgKzM4MjMsNyBAQAorIyAg
RmlsZTogYXRoMTFrL0lQUTYwMTgvaHcxLjAvcTZfZncuYjA4CisjICBGaWxlOiBhdGgxMWsvSVBR
NjAxOC9odzEuMC9xNl9mdy5mbGlzdAorIyAgRmlsZTogYXRoMTFrL0lQUTYwMTgvaHcxLjAvcTZf
ZncubWR0CisjIC1WZXJzaW9uOiBXTEFOLkhLLjIuNy4wLjEtMDE3NDQtUUNBSEtTV1BMX1NJTElD
T05aLTEKKyMgK1ZlcnNpb246IFdMQU4uSEsuMi43LjAuMS0wMjQwOS1RQ0FIS1NXUExfU0lMSUNP
TlotMQorIyAgRmlsZTogYXRoMTFrL0lQUTYwMTgvaHcxLjAvTm90aWNlLnR4dAorIyAgRmlsZTog
YXRoMTFrL0lQUTgwNzQvaHcyLjAvYm9hcmQtMi5iaW4KKyMgIEZpbGU6IGF0aDExay9JUFE4MDc0
L2h3Mi4wL20zX2Z3LmIwMAorIyBAQCAtMzgyOCw3ICszODQxLDcgQEAKKyMgIEZpbGU6IGF0aDEx
ay9JUFE4MDc0L2h3Mi4wL3E2X2Z3LmIwOAorIyAgRmlsZTogYXRoMTFrL0lQUTgwNzQvaHcyLjAv
cTZfZncuZmxpc3QKKyMgIEZpbGU6IGF0aDExay9JUFE4MDc0L2h3Mi4wL3E2X2Z3Lm1kdAorIyAt
VmVyc2lvbjogV0xBTi5ISy4yLjcuMC4xLTAxNzQ0LVFDQUhLU1dQTF9TSUxJQ09OWi0xCisjICtW
ZXJzaW9uOiBXTEFOLkhLLjIuOS4wLjEtMDIxNDYtUUNBSEtTV1BMX1NJTElDT05aLTEKKyMgIEZp
bGU6IGF0aDExay9JUFE4MDc0L2h3Mi4wL05vdGljZS50eHQKKyMgIEZpbGU6IGF0aDExay9RQ0E2
MzkwL2h3Mi4wL2JvYXJkLTIuYmluCisjICBGaWxlOiBhdGgxMWsvUUNBNjM5MC9odzIuMC9hbXNz
LmJpbgorIyBAQCAtMzg0OCw3ICszODYxLDcgQEAKKyMgIEZpbGU6IGF0aDExay9RQ045MDc0L2h3
MS4wL2JvYXJkLTIuYmluCisjICBGaWxlOiBhdGgxMWsvUUNOOTA3NC9odzEuMC9hbXNzLmJpbgor
IyAgRmlsZTogYXRoMTFrL1FDTjkwNzQvaHcxLjAvbTMuYmluCisjIC1WZXJzaW9uOiBXTEFOLkhL
LjIuNy4wLjEtMDE3NDQtUUNBSEtTV1BMX1NJTElDT05aLTEKKyMgK1ZlcnNpb246IFdMQU4uSEsu
Mi45LjAuMS0wMjE0Ni1RQ0FIS1NXUExfU0lMSUNPTlotMQorIyAgRmlsZTogYXRoMTFrL1FDTjkw
NzQvaHcxLjAvTm90aWNlLnR4dAorIyAgRmlsZTogYXRoMTFrL1dDTjY3NTAvaHcxLjAvYm9hcmQt
Mi5iaW4KKyMgIEZpbGU6IGF0aDExay9XQ042NzUwL2h3MS4wL3NjNzI4MC93cHNzLm1ibgorIyBA
QCAtMzg4MSwxMCArMzg5NCwyMiBAQAorIyAgRmlsZTogYXRoMTFrL1FDQTIwNjYvaHcyLjEvYm9h
cmQtMi5iaW4KKyMgIEZpbGU6IGF0aDExay9RQ0EyMDY2L2h3Mi4xL2Ftc3MuYmluCisjICBGaWxl
OiBhdGgxMWsvUUNBMjA2Ni9odzIuMS9tMy5iaW4KKyMgLVZlcnNpb246IFdMQU4uSFNQLjEuMS0w
MzkyNi4xMy1RQ0FIU1BTV1BMX1YyX1NJTElDT05aX0NFLTIuNTIyOTcuMworIyArVmVyc2lvbjog
V0xBTi5IU1AuMS4xLTAzOTI2LjEzLVFDQUhTUFNXUExfVjJfU0lMSUNPTlpfQ0UtMi41MjI5Ny42
CisjICBGaWxlOiBhdGgxMWsvUUNBMjA2Ni9odzIuMS9Ob3RpY2UudHh0CisjICtGaWxlOiBhdGgx
MWsvUUNBNjY5OEFRL2h3Mi4xL2JvYXJkLTIuYmluCisjICtGaWxlOiBhdGgxMWsvUUNBNjY5OEFR
L2h3Mi4xL2Ftc3MuYmluCisjICtGaWxlOiBhdGgxMWsvUUNBNjY5OEFRL2h3Mi4xL20zLmJpbgor
IyArVmVyc2lvbjogV0xBTi5IU1AuMS4xLTA0NDc5LVFDQUhTUFNXUExfVjFfVjJfU0lMSUNPTlpf
SU9FLTEKKyMgK0ZpbGU6IGF0aDExay9RQ0E2Njk4QVEvaHcyLjEvTm90aWNlLnR4dAorIyAgCisj
ICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLlF1YWxjb21tQXRoZXJvc19h
dGgxMGsgZm9yIGRldGFpbHMKKyMgKworIyArRmlsZTogYXRoMTFrL1dDTjY3NTAvaHcxLjAvcWNt
NjQ5MC93cHNzLm1ibgorIyArVmVyc2lvbjogV0xBTi5NU0wuMi4wLmMyLTAwMjA0LVFDQU1TTFNX
UExaLTEKKyMgK0xpbms6IHFjb20vcWNtNjQ5MC93cHNzLm1ibiAtPiAuLi8uLi9hdGgxMWsvV0NO
Njc1MC9odzEuMC9xY202NDkwL3dwc3MubWJuCisjICtMaW5rOiBxY29tL3FjczY0OTAvd3Bzcy5t
Ym4gLT4gLi4vLi4vYXRoMTFrL1dDTjY3NTAvaHcxLjAvcWNtNjQ5MC93cHNzLm1ibgorIyArCisj
ICtMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLnFjb20gYW5kIHFjb20vTk9U
SUNFLnR4dCBmb3IgZGV0YWlscworIyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisjIEBA
IC0zODk3LDcgKzM5MjIsNyBAQAorIyAgRmlsZTogYXRoMTJrL1dDTjc4NTAvaHcyLjAvTm90aWNl
LnR4dAorIyAgRmlsZTogYXRoMTJrL1FDTjkyNzQvaHcyLjAvYm9hcmQtMi5iaW4KKyMgIEZpbGU6
IGF0aDEyay9RQ045Mjc0L2h3Mi4wL2Zpcm13YXJlLTIuYmluCisjIC1WZXJzaW9uOiBXTEFOLldC
RS4xLjMuMS0wMDE2Mi1RQ0FIS1NXUExfU0lMSUNPTlotMQorIyArVmVyc2lvbjogV0xBTi5XQkUu
MS40LjEtMDAxOTktUUNBSEtTV1BMX1NJTElDT05aLTEKKyMgIEZpbGU6IGF0aDEyay9RQ045Mjc0
L2h3Mi4wL05vdGljZS50eHQKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUg
TElDRU5TRS5RdWFsY29tbUF0aGVyb3NfYXRoMTBrIGZvciBkZXRhaWxzCisjIEBAIC00MTYxLDcg
KzQxODYsNyBAQAorIyAgRmlsZTogaW50ZWwvaWJ0LTAwNDAtMTA1MC5kZGMKKyMgIEZpbGU6IGlu
dGVsL2lidC0xMDQwLTEwNTAuc2ZpCisjICBGaWxlOiBpbnRlbC9pYnQtMTA0MC0xMDUwLmRkYwor
IyAtVmVyc2lvbjogQlRfU29sYXJfUkVMODE3NTVfMjMuNTAuMjQzMzIuODE3NTUKKyMgK1ZlcnNp
b246IEJUX1NvbGFyX1JFTDgxODY0XzIzLjUwLjI0NDgzLjgxODY0CisjICAKKyMgIEZpbGU6IGlu
dGVsL2lidC0wMDQwLTEwMjAuc2ZpCisjICBGaWxlOiBpbnRlbC9pYnQtMDA0MC0xMDIwLmRkYwor
IyBAQCAtNDE4Myw3ICs0MjA4LDcgQEAKKyMgIEZpbGU6IGludGVsL2lidC0wMDkzLTQxNTAuZGRj
CisjICBGaWxlOiBpbnRlbC9pYnQtMDA5My0xMDUwLnNmaQorIyAgRmlsZTogaW50ZWwvaWJ0LTAw
OTMtMTA1MC5kZGMKKyMgLVZlcnNpb246IEJUX0JsYXphclVfU19SRUw2NzE1OV8yMy45MC4yNDM4
Mi42NzE1OQorIyArVmVyc2lvbjogQlRfQmxhemFyVV9TX1JFTDcyNzIxXzIzLjEwMC4yNDQ5MS43
MjcyMQorIyAgCisjICBGaWxlOiBpbnRlbC9pYnQtMDE4MC0wMDQxLnNmaQorIyAgRmlsZTogaW50
ZWwvaWJ0LTAxODAtMDA0MS5kZGMKKyMgQEAgLTQxOTEsNyArNDIxNiw3IEBACisjICBGaWxlOiBp
bnRlbC9pYnQtMDE4MC00MTUwLmRkYworIyAgRmlsZTogaW50ZWwvaWJ0LTAxODAtMTA1MC5zZmkK
KyMgIEZpbGU6IGludGVsL2lidC0wMTgwLTEwNTAuZGRjCisjIC1WZXJzaW9uOiBCVF9NYWduZXRh
cl9SRUwxMDM0MjdfMjMuNTAuMjQzMzIuMTAzNDI3CisjICtWZXJzaW9uOiBCVF9NYWduZXRhcl9S
RUwxMDM2MDRfMjMuNTAuMjQ0ODMuMTAzNjA0CisjICAKKyMgIEZpbGU6IGludGVsL2lidC0wMTkw
LTAyOTEuc2ZpCisjICBGaWxlOiBpbnRlbC9pYnQtMDE5MC0wMjkxLWltbC5zZmkKKyMgQEAgLTQ2
OTYsMzAgKzQ3MjEsMjEgQEAKKyMgIAorIyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgIAorIyAtRHJp
dmVyOiBidHFjYSAtIFF1YWxjb21tIEF0aGVyb3MgQmx1ZXRvb3RoIHN1cHBvcnQgZm9yIFFDQTYx
eDQgY2hpcHMKKyMgK0RyaXZlcjogYnRxY2EgLSBRdWFsY29tbSBBdGhlcm9zIEJsdWV0b290aCBz
dXBwb3J0IGZvciBRQ0E2MXg0IFVTQiBjaGlwcworIyAgCisjICBGaWxlOiBxY2EvbnZtX3VzYl8w
MDAwMDIwMS5iaW4KKyMgIEZpbGU6IHFjYS9udm1fdXNiXzAwMDAwMjAwLmJpbgorIyAgRmlsZTog
cWNhL252bV91c2JfMDAwMDAzMDAuYmluCisjICBGaWxlOiBxY2EvbnZtX3VzYl8wMDAwMDMwMi5i
aW4KKyMgLUZpbGU6IHFjYS9udm1fMDAxMzAzMDAuYmluCisjIC1GaWxlOiBxY2EvbnZtXzAwMTMw
MzAyLmJpbgorIyAtRmlsZTogcWNhL252bV8wMDIzMDMwMi5iaW4KKyMgIEZpbGU6IHFjYS9yYW1w
YXRjaF91c2JfMDAwMDAyMDAuYmluCisjICBGaWxlOiBxY2EvcmFtcGF0Y2hfdXNiXzAwMDAwMjAx
LmJpbgorIyAgRmlsZTogcWNhL3JhbXBhdGNoX3VzYl8wMDAwMDMwMC5iaW4KKyMgK1ZlcnNpb246
IEJURk0uUk0uMi4yLmMzLTAwMDMxLVFDQUJURk1TV1AtMQorIyAgRmlsZTogcWNhL3JhbXBhdGNo
X3VzYl8wMDAwMDMwMi5iaW4KKyMgLUZpbGU6IHFjYS9yYW1wYXRjaF8wMDEzMDMwMC5iaW4KKyMg
LUZpbGU6IHFjYS9yYW1wYXRjaF8wMDEzMDMwMi5iaW4KKyMgLUZpbGU6IHFjYS9yYW1wYXRjaF8w
MDIzMDMwMi5iaW4KKyMgLUZpbGU6IHFjYS9udm1fMDA0NDAzMDIuYmluCisjIC1GaWxlOiBxY2Ev
cmFtcGF0Y2hfMDA0NDAzMDIuYmluCisjIC1GaWxlOiBxY2EvbnZtXzAwNDQwMzAyX2V1LmJpbgor
IyAtRmlsZTogcWNhL252bV8wMDQ0MDMwMl9pMnNfZXUuYmluCisjICtWZXJzaW9uOiBCVEZNLlJN
LjQuNC4xLTAwMDI4LVFDQUJURk1TV1AtMQorIyAgRmlsZTogcWNhL252bV91c2JfMDAwMDAzMDJf
ZXUuYmluCisjIC1GaWxlOiBxY2EvaHRidGZ3MjAudGx2CisjIC1GaWxlOiBxY2EvaHRudjIwLmJp
bgorIyAgRmlsZTogcWNhL3JhbXBhdGNoX3VzYl8wMDEzMDIwMC5iaW4KKyMgK1ZlcnNpb246IEJU
RlcuSFNQLjIuMC4wLTAwNjA5LVVTQl9QQVRDSFotMQorIyAgRmlsZTogcWNhL252bV91c2JfMDAx
MzAyMDAuYmluCisjICBGaWxlOiBxY2EvbnZtX3VzYl8wMDEzMDIwMF8wMTA0LmJpbgorIyAgRmls
ZTogcWNhL252bV91c2JfMDAxMzAyMDBfMDEwNS5iaW4KKyMgQEAgLTQ3MjgsNiArNDc0NCw3IEBA
CisjICBGaWxlOiBxY2EvbnZtX3VzYl8wMDEzMDIwMF8wMTA5LmJpbgorIyAgRmlsZTogcWNhL252
bV91c2JfMDAxMzAyMDBfMDExMC5iaW4KKyMgIEZpbGU6IHFjYS9yYW1wYXRjaF91c2JfMDAxMzAy
MDEuYmluCisjICtWZXJzaW9uOiBCVEZXLkhTUC4yLjEuMC0wMDY1MC1VU0JfUEFUQ0haLTEKKyMg
IEZpbGU6IHFjYS9udm1fdXNiXzAwMTMwMjAxLmJpbgorIyAgRmlsZTogcWNhL252bV91c2JfMDAx
MzAyMDFfMDEwYS5iaW4KKyMgIEZpbGU6IHFjYS9udm1fdXNiXzAwMTMwMjAxXzAxMGIuYmluCisj
IEBAIC00NzM3LDYgKzQ3NTQsNyBAQAorIyAgRmlsZTogcWNhL252bV91c2JfMDAxMzAyMDFfZ2Zf
MDEwYi5iaW4KKyMgIEZpbGU6IHFjYS9udm1fdXNiXzAwMTMwMjAxX2dmXzAzMDMuYmluCisjICBG
aWxlOiBxY2EvcmFtcGF0Y2hfdXNiXzAwMTkwMjAwLmJpbgorIyArVmVyc2lvbjogQlRGVy5IQU1J
TFRPTi4yLjAuMC0wMDUxNS1VU0JfUEFUQ0haLTIKKyMgIEZpbGU6IHFjYS9udm1fdXNiXzAwMTkw
MjAwLmJpbgorIyAgRmlsZTogcWNhL252bV91c2JfMDAxOTAyMDBfMDEwZS5iaW4KKyMgIEZpbGU6
IHFjYS9udm1fdXNiXzAwMTkwMjAwXzAxMTIuYmluCisjIEBAIC00NzQ1LDEwICs0NzYzLDQ4IEBA
CisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAKKyMgK0RyaXZlcjogYnRxY2EgLSBRdWFs
Y29tbSBBdGhlcm9zIEJsdWV0b290aCBzdXBwb3J0IGZvciBRQ0E2MXg0IHNlcmlhbCBjaGlwcwor
IyArCisjICtGaWxlOiBxY2EvcmFtcGF0Y2hfMDAxMzAzMDAuYmluCisjICtWZXJzaW9uOiBCVEZN
LlJNLjIuMi5jMy0wMDAzMS1RQ0FCVEZNU1dQLTEKKyMgK0ZpbGU6IHFjYS9yYW1wYXRjaF8wMDEz
MDMwMi5iaW4KKyMgK1ZlcnNpb246IEJURk0uUk0uMi4yLmMzLTAwMDMxLVFDQUJURk1TV1AtMQor
IyArRmlsZTogcWNhL3JhbXBhdGNoXzAwMjMwMzAyLmJpbgorIyArVmVyc2lvbjogUUNBNjE3NF9E
RVYuQkxELjAxMTEKKyMgK0ZpbGU6IHFjYS9udm1fMDAxMzAzMDAuYmluCisjICtGaWxlOiBxY2Ev
bnZtXzAwMTMwMzAyLmJpbgorIyArRmlsZTogcWNhL252bV8wMDIzMDMwMi5iaW4KKyMgK0ZpbGU6
IHFjYS9yYW1wYXRjaF8wMDQ0MDMwMi5iaW4KKyMgK1ZlcnNpb246IEJURk0uUk0uNC40LjEtMDAw
MjgtUUNBQlRGTVNXUC0xCisjICtGaWxlOiBxY2EvbnZtXzAwNDQwMzAyLmJpbgorIyArRmlsZTog
cWNhL252bV8wMDQ0MDMwMl9ldS5iaW4KKyMgK0ZpbGU6IHFjYS9udm1fMDA0NDAzMDJfaTJzX2V1
LmJpbgorIyArCisjICtMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLlF1YWxj
b21tQXRoZXJvc19hdGgxMGsgYW5kIHFjYS9OT1RJQ0UudHh0IGZvciBkZXRhaWxzCisjICsKKyMg
Ky0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCisjICsKKyMgK0RyaXZlcjogcWNhIC0gUXVhbGNvbW0gQXRoZXJv
cyBCbHVldG9vdGggc3VwcG9ydCBmb3IgV0NOMzk1MCBjaGlwcworIyArCisjICtGaWxlOiBxY2Ev
Y21idGZ3MTIudGx2CisjICtWZXJzaW9uOiBCVEZNLkNNQy4xLjIuMC0wMDIxOC1RQ0FDSFJPTVot
MgorIyArRmlsZTogcWNhL2NtYnRmdzEzLnRsdgorIyArVmVyc2lvbjogQlRGTS5DTUMuMS4zLjAt
MDAxMDgtUUNBQ0hST01aLTEKKyMgK0ZpbGU6IHFjYS9jbW52MTIuYmluCisjICtGaWxlOiBxY2Ev
Y21udjEzLmJpbgorIyArRmlsZTogcWNhL2NtbnYxM3MuYmluCisjICtGaWxlOiBxY2EvY21udjEz
dC5iaW4KKyMgKworIyArTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5xY29t
IGFuZCBxY2EvTk9USUNFLnR4dCBmb3IgZGV0YWlscworIyArCisjICstLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQorIyArCisjICBEcml2ZXI6IHFjYSAtIFF1YWxjb21tIEF0aGVyb3MgQmx1ZXRvb3RoIHN1cHBv
cnQgZm9yIFdDTjM5ODggY2hpcHMKKyMgIAorIyAgRmlsZTogcWNhL2FwYnRmdzEwLnRsdgorIyAr
VmVyc2lvbjogQlRGTS5DSEUuMi4wLjAtMDAwODItUUNBQ0hST01aLTEKKyMgIEZpbGU6IHFjYS9h
cGJ0ZncxMS50bHYKKyMgK1ZlcnNpb246IEJURk0uQ0hFLjIuMS4zLTAwMzU3LVFDQUNIUk9NWi0x
CisjICBGaWxlOiBxY2EvYXBudjEwLmJpbgorIyAgRmlsZTogcWNhL2FwbnYxMS5iaW4KKyMgIAor
IyBAQCAtNDc1OSwyNCArNDgxNSwzNSBAQAorIyAgRHJpdmVyOiBxY2EgLSBRdWFsY29tbSBBdGhl
cm9zIEJsdWV0b290aCBzdXBwb3J0IGZvciBXQ04zOTl4IGNoaXBzCisjICAKKyMgIEZpbGU6IHFj
YS9jcmJ0ZncyMS50bHYKKyMgK1ZlcnNpb246IEJURk0uQ0hFLjIuMS4zLmM3LTAwMDI0LVFDQUNI
Uk9NLTEKKyMgIEZpbGU6IHFjYS9jcm52MjEuYmluCisjICBGaWxlOiBxY2EvY3JidGZ3MzIudGx2
CisjICtWZXJzaW9uOiBCVEZNLkNIRS4zLjIuMC5jMi0wMDA0NC1RQ0FDSFJPTVotMQorIyAgRmls
ZTogcWNhL2NybnYzMi5iaW4KKyMgIEZpbGU6IHFjYS9jcm52MzJ1LmJpbgorIyAgCisjICtMaWNl
bmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLlF1YWxjb21tQXRoZXJvc19hdGgxMGsg
YW5kIHFjYS9OT1RJQ0UudHh0IGZvciBkZXRhaWxzCisjICsKKyMgKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CisjICsKKyMgIERyaXZlcjogcWNhIC0gUXVhbGNvbW0gQXRoZXJvcyBCbHVldG9vdGggc3VwcG9y
dCBmb3IgV0NONjc1MCBjaGlwcworIyAgCisjICBGaWxlOiBxY2EvbXNidGZ3MTEubWJuCisjICtW
ZXJzaW9uOiBCVEZXLk1PU0VMTEUuMS4xLjMtMDAwNjktTVNMX1BBVENIWi0xCisjICBGaWxlOiBx
Y2EvbXNidGZ3MTEudGx2CisjICtWZXJzaW9uOiBCVEZXLk1PU0VMTEUuMS4xLjMtMDAwNjktTVNM
X1BBVENIWi0xCisjICBGaWxlOiBxY2EvbXNudjExLmJpbgorIyAgRmlsZTogcWNhL21zbnYxMS5i
MGEKKyMgIEZpbGU6IHFjYS9tc252MTEuYjA5CisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0
YWJsZS4gU2VlIExJQ0VOU0UuUXVhbGNvbW1BdGhlcm9zX2F0aDEwayBhbmQgcWNhL05PVElDRS50
eHQgZm9yIGRldGFpbHMKKyMgIAorIyArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgKworIyAgRHJpdmVy
OiBxY2EgLSBRdWFsY29tbSBBdGhlcm9zIEJsdWV0b290aCBzdXBwb3J0IGZvciBRQ0EyMDY2IGNo
aXBzCisjICAKKyMgIEZpbGU6IHFjYS9ocGJ0ZncyMS50bHYKKyMgK1ZlcnNpb246IEJURlcuSFNQ
LjIuMS4wLTAwNjQxLVZFUl9QQVRDSFotMQorIyAgRmlsZTogcWNhL2hwbnYyMS5iaW4KKyMgIEZp
bGU6IHFjYS9ocG52MjFnLmJpbgorIyAgRmlsZTogcWNhL2hwbnYyMS4zMDEKKyMgQEAgLTQ4MDgs
MjEgKzQ4NzUsNDMgQEAKKyMgIEZpbGU6IHFjYS9ocG52MjFnLmIxMGMKKyMgIEZpbGU6IHFjYS9o
cG52MjFnLmIxMTEKKyMgIAorIyAtCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBM
SUNFTlNFLlF1YWxjb21tQXRoZXJvc19hdGgxMGsgYW5kIHFjYS9OT1RJQ0UudHh0IGZvciBkZXRh
aWxzCisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAKKyMgK0RyaXZlcjogcWNhIC0gUXVh
bGNvbW0gQXRoZXJvcyBCbHVldG9vdGggc3VwcG9ydCBmb3IgUUNBNjM5MCBjaGlwcworIyArCisj
ICtGaWxlOiBxY2EvaHRidGZ3MjAudGx2CisjICtWZXJzaW9uOiBCVEZNLkhTVC4yLjAuMC0wMDk0
My1RQ0FDSFJPTS0xCisjICtGaWxlOiBxY2EvaHRudjIwLmJpbgorIyArCisjICtMaWNlbmNlOiBS
ZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLnFjb20gYW5kIHFjYS9OT1RJQ0UudHh0IGZvciBk
ZXRhaWxzCisjICsKKyMgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICsKKyMgIERyaXZlcjogcWNhIC0g
UXVhbGNvbW0gQXRoZXJvcyBCbHVldG9vdGggc3VwcG9ydCBmb3IgV0NONzg1MCBjaGlwcworIyAg
CisjICBGaWxlOiBxY2EvaG10YnRmdzIwLnRsdgorIyArVmVyc2lvbjogQlRGVy5IQU1JTFRPTi4y
LjAuMS0wMDM0OS1XT1NfUEFUQ0haLTIKKyMgIEZpbGU6IHFjYS9obXRudjIwLmIxMGYKKyMgIEZp
bGU6IHFjYS9obXRudjIwLmIxMTIKKyMgIEZpbGU6IHFjYS9obXRudjIwLmJpbgorIyAgCisjICBM
aWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLnFjb20gYW5kIHFjYS9OT1RJQ0Uu
dHh0IGZvciBkZXRhaWxzCisjICAKKyMgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICstLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KKyMgKworIyArRHJpdmVyOiBxY2EgLSBRdWFsY29tbSBBdGhlcm9zIEJsdWV0b290
aCBzdXBwb3J0IGZvciBRQ0E2Njk4QVEgY2hpcHMKKyMgKworIyArRmlsZTogcWNhL1FDQTY2OTgv
aHBidGZ3MjEudGx2CisjICtWZXJzaW9uOiBCVEZXLkhTUC4yLjEuMi0wMDAzNS1QQVRDSFotMQor
IyArRmlsZTogcWNhL1FDQTY2OTgvaHBudjIxLmIyMDYKKyMgK0ZpbGU6IHFjYS9RQ0E2Njk4L2hw
bnYyMS5iMjA3CisjICtGaWxlOiBxY2EvUUNBNjY5OC9ocG52MjEuYmluCisjICsKKyMgK0xpY2Vu
Y2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UucWNvbSBhbmQgcWNhL05PVElDRS50eHQg
Zm9yIGRldGFpbHMKKyMgKworIyArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisjICBEcml2ZXI6IGxp
cXVpZGlvIC0tIENhdml1bSBMaXF1aWRJTyBkcml2ZXIKKyMgIAorIyBAQCAtNTIyMyw3ICs1MzEy
LDcgQEAKKyMgIFZlcnNpb246IERNQyBBUEkvQVBCIHZlciAyIHJlbGVhc2UgNiBmb3IgQmF0dGxl
bWFnZQorIyAgCisjICBGaWxlOiBpOTE1L3hlMmxwZF9kbWMuYmluCisjIC1WZXJzaW9uOiBETUMg
QVBJL0FQQiB2ZXIgMiByZWxlYXNlIDI0IGZvciBYZTJMUEQKKyMgK1ZlcnNpb246IERNQyBBUEkv
QVBCIHZlciAyIHJlbGVhc2UgMjggZm9yIFhlMkxQRAorIyAgCisjICBGaWxlOiBpOTE1L3hlM2xw
ZF9kbWMuYmluCisjICBWZXJzaW9uOiBETUMgQVBJL0FQQiB2ZXIgMiByZWxlYXNlIDEzIGZvciBY
ZTNMUEQKKyMgQEAgLTU3MTEsMTQgKzU4MDAsMTUgQEAKKyMgIAorIyAgLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KKyMgIAorIyAtRHJpdmVyOiB3aWxjMTAwMCAtIEF0bWVsIDgwMi4xMW4gV0xBTiBkcml2ZXIg
Zm9yIFdJTEMxMDAwCisjICtEcml2ZXI6IHdpbGMxMDAwIC0gQXRtZWwgODAyLjExbiBXTEFOIGRy
aXZlciBmb3IgV0lMQzEwMDAgJiBXSUxDMzAwMAorIyAgCisjICBGaWxlOiBhdG1lbC93aWxjMTAw
MF9mdy5iaW4KKyMgIEZpbGU6IGF0bWVsL3dpbGMxMDAwX2FwX2Z3LmJpbgorIyAgRmlsZTogYXRt
ZWwvd2lsYzEwMDBfcDJwX2Z3LmJpbgorIyAgRmlsZTogYXRtZWwvd2lsYzEwMDBfd2lmaV9maXJt
d2FyZS5iaW4KKyMgIEZpbGU6IGF0bWVsL3dpbGMxMDAwX3dpZmlfZmlybXdhcmUtMS5iaW4KKyMg
LVZlcnNpb246IDE2LjAKKyMgK0ZpbGU6IGF0bWVsL3dpbGMzMDAwX3dpZmlfZmlybXdhcmUtMS5i
aW4KKyMgK1ZlcnNpb246IDE2LjEuMgorIyAgCisjICBMaWNlbnNlOiBSZWRpc3RyaWJ1dGFibGUu
IFNlZSBMSUNFTlNFLmF0bWVsIGZvciBkZXRhaWxzCisjICAKKyMgQEAgLTYwMDEsOSArNjA5MSw5
IEBACisjICBEcml2ZXI6IG10NzkyNSAtIE1lZGlhVGVrIE1UNzkyNSBXaXJlbGVzcyBNQUNzCisj
ICAKKyMgIEZpbGU6IG1lZGlhdGVrL210NzkyNS9XSUZJX01UNzkyNV9QQVRDSF9NQ1VfMV8xX2hk
ci5iaW4KKyMgLVZlcnNpb246IDIwMjQxMTA0MTMyOTQ5YQorIyArVmVyc2lvbjogMjAyNTAxMTMx
NTMwMDFhCisjICBGaWxlOiBtZWRpYXRlay9tdDc5MjUvV0lGSV9SQU1fQ09ERV9NVDc5MjVfMV8x
LmJpbgorIyAtVmVyc2lvbjogMjAyNDExMDQxMzI4NTUKKyMgK1ZlcnNpb246IDIwMjUwMTEzMTUy
ODU0CisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UubWVkaWF0
ZWsgZm9yIGRldGFpbHMuCisjICAKKyMgQEAgLTYwMTIsNyArNjEwMiw3IEBACisjICBEcml2ZXI6
IG10NzkyNSAtIE1lZGlhVGVrIE1UNzkyNSBibHVldG9vdGggY2hpcHNldAorIyAgCisjICBGaWxl
OiBtZWRpYXRlay9tdDc5MjUvQlRfUkFNX0NPREVfTVQ3OTI1XzFfMV9oZHIuYmluCisjIC1WZXJz
aW9uOiAyMDI0MTEwNDEzMzIxNAorIyArVmVyc2lvbjogMjAyNTAxMTMxNTMzMDcKKyMgIAorIyAg
TGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5tZWRpYXRlayBmb3IgZGV0YWls
cy4KKyMgIAorIyBAQCAtNjIxMywxNyArNjMwMywxNyBAQAorIyAgRmlsZTogcWNvbS92ZW51cy0x
LjgvdmVudXMubWJuCisjICBMaW5rOiBxY29tL3ZlbnVzLTEuOC92ZW51cy5tZHQgLT4gdmVudXMu
bWJuCisjICAKKyMgLVZlcnNpb246IDEuOC0wMDEwOQorIyArVmVyc2lvbjogVklERU8uVkUuMS44
LTAwMTA5CisjICAKKyMgIEZpbGU6IHFjb20vdmVudXMtNC4yL3ZlbnVzLm1ibgorIyAgTGluazog
cWNvbS92ZW51cy00LjIvdmVudXMubWR0IC0+IHZlbnVzLm1ibgorIyAgCisjIC1WZXJzaW9uOiA0
LjIKKyMgK1ZlcnNpb246IFZJREVPLlZFLjQuMC0wMDExOQorIyAgCisjICBGaWxlOiBxY29tL3Zl
bnVzLTUuMi92ZW51cy5tYm4KKyMgIExpbms6IHFjb20vdmVudXMtNS4yL3ZlbnVzLm1kdCAtPiB2
ZW51cy5tYm4KKyMgIAorIyAtVmVyc2lvbjogNS4yLTAwMDIzCisjICtWZXJzaW9uOiBWSURFTy5W
RS41LjItMDAwMjMtUFJPRC0yCisjICAKKyMgIEZpbGU6IHFjb20vdmVudXMtNS40L3ZlbnVzLm1i
bgorIyAgTGluazogcWNvbS92ZW51cy01LjQvdmVudXMubWR0IC0+IHZlbnVzLm1ibgorIyBAQCAt
NjIzOCw3ICs2MzI4LDcgQEAKKyMgIExpbms6IHFjb20vdnB1LTEuMC92ZW51cy5tYm4gLT4gLi4v
dnB1L3ZwdTIwX3A0Lm1ibgorIyAgTGluazogcWNvbS92cHUtMS4wL3ZlbnVzLm1kdCAtPiAuLi92
cHUvdnB1MjBfcDQubWJuCisjICAKKyMgLVZlcnNpb246IFZJREVPLlZQVS4xLjAtMDAwODctUFJP
RC0xCisjICtWZXJzaW9uOiBWSURFTy5WUFUuMS4wLTAwMDk3LVBST0QtMQorIyAgCisjICBGaWxl
OiBxY29tL3ZwdS92cHUyMF9wMS5tYm4KKyMgIExpbms6IHFjb20vdnB1LTIuMC92ZW51cy5tYm4g
LT4gLi4vdnB1L3ZwdTIwX3AxLm1ibgorIyBAQCAtNjMzOCwyMCArNjQyOCwyNiBAQAorIyAgCisj
ICBGaWxlOiBxY29tL2FwcTgwMTYvbWJhLm1ibgorIyAgRmlsZTogcWNvbS9hcHE4MDE2L21vZGVt
Lm1ibgorIyArVmVyc2lvbjogTVBTUy5EUE0uMi4wLjIuQzEuMjMtMDAwMDgKKyMgIEZpbGU6IHFj
b20vYXBxODAxNi93Y25zcy5tYm4KKyMgK1ZlcnNpb246IENOU1MuUFIuMi4wLjEuMi5DMS0wMDA3
NAorIyAgRmlsZTogcWNvbS9hcHE4MDE2L1dDTlNTX3Fjb21fd2xhbl9udl9zYmMuYmluCisjICBG
aWxlOiBxY29tL2FwcTgwOTYvYWRzcC5tYm4KKyMgK1ZlcnNpb246IEFEU1AuODk5Ni4yLjcuMS0w
MDEzOAorIyAgUmF3RmlsZTogcWNvbS9hcHE4MDk2L2Fkc3ByLmpzbgorIyAgUmF3RmlsZTogcWNv
bS9hcHE4MDk2L2Fkc3B1YS5qc24KKyMgIEZpbGU6IHFjb20vYXBxODA5Ni9tYmEubWJuCisjICBG
aWxlOiBxY29tL2FwcTgwOTYvbW9kZW0ubWJuCisjICtWZXJzaW9uOiBNUFNTLlRILjIuMC4xLTAw
NDgxCisjICBSYXdGaWxlOiBxY29tL2FwcTgwOTYvbW9kZW1yLmpzbgorIyAgRmlsZTogcWNvbS9x
Y20yMjkwL2E3MDJfemFwLm1ibgorIyAgRmlsZTogcWNvbS9xY20yMjkwL2Fkc3AubWJuCisjICtW
ZXJzaW9uOiBBRFNQLlZULjUuNC4xLmM0LTAwMDEzLUtBTU9SVEEtMQorIyAgUmF3RmlsZTogcWNv
bS9xY20yMjkwL2Fkc3ByLmpzbgorIyAgUmF3RmlsZTogcWNvbS9xY20yMjkwL2Fkc3BzLmpzbgor
IyAgUmF3RmlsZTogcWNvbS9xY20yMjkwL2Fkc3B1YS5qc24KKyMgIEZpbGU6IHFjb20vcWNtMjI5
MC9tb2RlbS5tYm4KKyMgK1ZlcnNpb246IE1QU1MuSEEuMS4xLTAwNDM1LUtEX0FMTF9QQUNLLTEK
KyMgIFJhd0ZpbGU6IHFjb20vcWNtMjI5MC9tb2RlbXIuanNuCisjICBSYXdGaWxlOiBxY29tL3Fj
bTIyOTAvbW9kZW11dy5qc24KKyMgIEZpbGU6IHFjb20vcWNtNjQ5MC9hZHNwLm1ibgorIyBAQCAt
NjM3MywyOCArNjQ2OSwzNyBAQAorIyAgTGluazogcWNvbS9xY3M2NDkwL2Nkc3ByLmpzbiAtPiAu
Li9xY202NDkwL2Nkc3ByLmpzbgorIyAgRmlsZTogcWNvbS9xcmI0MjEwL2E2MTBfemFwLm1ibgor
IyAgRmlsZTogcWNvbS9xcmI0MjEwL2Fkc3AubWJuCisjICtWZXJzaW9uOiBBRFNQLlZULjUuNC4x
LmM0LTAwMDEzLUtBTU9SVEEtMQorIyAgUmF3RmlsZTogcWNvbS9xcmI0MjEwL2Fkc3ByLmpzbgor
IyAgUmF3RmlsZTogcWNvbS9xcmI0MjEwL2Fkc3BzLmpzbgorIyAgUmF3RmlsZTogcWNvbS9xcmI0
MjEwL2Fkc3B1YS5qc24KKyMgIEZpbGU6IHFjb20vcXJiNDIxMC9jZHNwLm1ibgorIyArVmVyc2lv
bjogQ0RTUC5WVC4yLjQuMS0wMDI2OS1LQU1PUlRBLTEKKyMgIFJhd0ZpbGU6IHFjb20vcXJiNDIx
MC9jZHNwci5qc24KKyMgIEZpbGU6IHFjb20vcXJiNDIxMC9tb2RlbS5tYm4KKyMgK1ZlcnNpb246
IE1QU1MuSEEuMS4xLTAwNDM1LUtEX0FMTF9QQUNLLTEKKyMgIFJhd0ZpbGU6IHFjb20vcXJiNDIx
MC9tb2RlbXIuanNuCisjICBSYXdGaWxlOiBxY29tL3FyYjQyMTAvbW9kZW11dy5qc24KKyMgIEZp
bGU6IHFjb20vc2RtODQ1L2Fkc3AubWJuCisjICtWZXJzaW9uOiBBRFNQLkhULjQuMC0wMDU5My1T
RE04NDUtMQorIyAgUmF3RmlsZTogcWNvbS9zZG04NDUvYWRzcHIuanNuCisjICBSYXdGaWxlOiBx
Y29tL3NkbTg0NS9hZHNwdWEuanNuCisjICBGaWxlOiBxY29tL3NkbTg0NS9jZHNwLm1ibgorIyAr
VmVyc2lvbjogQ0RTUC5IVC4xLjAtMDA1NTktU0RNODQ1LTEKKyMgIFJhd0ZpbGU6IHFjb20vc2Rt
ODQ1L2Nkc3ByLmpzbgorIyAgRmlsZTogcWNvbS9zZG04NDUvVGh1bmRlcmNvbW0vZGI4NDVjL3Ns
cGkubWJuCisjICtWZXJzaW9uOiBTTFBJLkhZLjEuMC0wMDM2NS1TRE04NDVBWkwtMQorIyAgUmF3
RmlsZTogcWNvbS9zZG04NDUvVGh1bmRlcmNvbW0vZGI4NDVjL3NscGlyLmpzbgorIyAgUmF3Rmls
ZTogcWNvbS9zZG04NDUvVGh1bmRlcmNvbW0vZGI4NDVjL3NscGl1cy5qc24KKyMgIEZpbGU6IHFj
b20vc204MjUwL2Fkc3AubWJuCisjICtWZXJzaW9uOiBBRFNQLkhULjUuMy5jMi0wMDA4Mi1TTTgy
NTAtMQorIyAgUmF3RmlsZTogcWNvbS9zbTgyNTAvYWRzcHIuanNuCisjICBSYXdGaWxlOiBxY29t
L3NtODI1MC9hZHNwdWEuanNuCisjICBGaWxlOiBxY29tL3NtODI1MC9jZHNwLm1ibgorIyArVmVy
c2lvbjogQ0RTUC5IVC4yLjMuYzEtMDAwNzYtU004MjUwLTEKKyMgIFJhd0ZpbGU6IHFjb20vc204
MjUwL2Nkc3ByLmpzbgorIyAgRmlsZTogcWNvbS9zbTgyNTAvVGh1bmRlcmNvbW0vUkI1L3NscGku
bWJuCisjICtWZXJzaW9uOiBTTFBJLkhZLjMuMS0wMDA0OS1TTTgyNTBBWkwtMgorIyAgUmF3Rmls
ZTogcWNvbS9zbTgyNTAvVGh1bmRlcmNvbW0vUkI1L3NscGlyLmpzbgorIyAgUmF3RmlsZTogcWNv
bS9zbTgyNTAvVGh1bmRlcmNvbW0vUkI1L3NscGl1cy5qc24KKyMgIFJhd0ZpbGU6IHFjb20vc2M4
MjgweHAvTEVOT1ZPLzIxQlgvYWRzcHIuanNuCisjIEBAIC02NDAyLDggKzY1MDcsMTEgQEAKKyMg
IFJhd0ZpbGU6IHFjb20vc2M4MjgweHAvTEVOT1ZPLzIxQlgvYmF0dG1nci5qc24KKyMgIFJhd0Zp
bGU6IHFjb20vc2M4MjgweHAvTEVOT1ZPLzIxQlgvY2RzcHIuanNuCisjICBGaWxlOiBxY29tL3Nj
ODI4MHhwL0xFTk9WTy8yMUJYL3FjYWRzcDgyODAubWJuCisjICtWZXJzaW9uOiBBRFNQLkhULjUu
Ni0wMDcyOS1NQUtFTkEtMQorIyAgRmlsZTogcWNvbS9zYzgyODB4cC9MRU5PVk8vMjFCWC9xY2Nk
c3A4MjgwLm1ibgorIyArVmVyc2lvbjogQ0RTUC5IVC4yLjYtMDA2OTgtTUFLRU5BLTEKKyMgIEZp
bGU6IHFjb20vc2M4MjgweHAvTEVOT1ZPLzIxQlgvcWNzbHBpODI4MC5tYm4KKyMgK1ZlcnNpb246
IFNMUEkuSFkuNC4xLTAwMDQ4LU1BS0VOQS0xCisjICBGaWxlOiBxY29tL3gxZTgwMTAwL2Fkc3Au
bWJuCisjICBGaWxlOiBxY29tL3gxZTgwMTAwL2Fkc3BfZHRiLm1ibgorIyAgVmVyc2lvbjogQURT
UC5IVC41LjktMDA3OTYtSEFNT0EtMQorIyBAQCAtNjQxMSw2ICs2NTE5LDE4IEBACisjICBSYXdG
aWxlOiBxY29tL3gxZTgwMTAwL2Fkc3BzLmpzbgorIyAgUmF3RmlsZTogcWNvbS94MWU4MDEwMC9h
ZHNwdWEuanNuCisjICBSYXdGaWxlOiBxY29tL3gxZTgwMTAwL2JhdHRtZ3IuanNuCisjICtSYXdG
aWxlOiBxY29tL3gxZTgwMTAwL0xFTk9WTy8yMU4xL2Fkc3B1YS5qc24KKyMgK0ZpbGU6IHFjb20v
eDFlODAxMDAvTEVOT1ZPLzIxTjEvcWNhZHNwODM4MC5tYm4KKyMgK1ZlcnNpb246IEFEU1AuSFQu
NS45LTAwNzg3LjItSEFNT0EtMQorIyArRmlsZTogcWNvbS94MWU4MDEwMC9MRU5PVk8vMjFOMS9h
ZHNwX2R0YnMuZWxmCisjICtSYXdGaWxlOiBxY29tL3gxZTgwMTAwL0xFTk9WTy8yMU4xL2Fkc3By
LmpzbgorIyArRmlsZTogcWNvbS94MWU4MDEwMC9MRU5PVk8vMjFOMS9jZHNwX2R0YnMuZWxmCisj
ICtSYXdGaWxlOiBxY29tL3gxZTgwMTAwL0xFTk9WTy8yMU4xL2Fkc3BzLmpzbgorIyArRmlsZTog
cWNvbS94MWU4MDEwMC9MRU5PVk8vMjFOMS9xY2Nkc3A4MzgwLm1ibgorIyArVmVyc2lvbjogQ0RT
UC5IVC4yLjktMDA0NDctSEFNT0EtMgorIyArUmF3RmlsZTogcWNvbS94MWU4MDEwMC9MRU5PVk8v
MjFOMS9jZHNwci5qc24KKyMgK0ZpbGU6IHFjb20veDFlODAxMDAvTEVOT1ZPLzIxTjEvcWNkeGtt
c3VjODM4MC5tYm4KKyMgK1Jhd0ZpbGU6IHFjb20veDFlODAxMDAvTEVOT1ZPLzIxTjEvYmF0dG1n
ci5qc24KKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5xY29t
IGFuZCBxY29tL05PVElDRS50eHQgZm9yIGRldGFpbHMKKyMgIAorIyBAQCAtNjQyNyw2ICs2NTQ3
LDI0IEBACisjICAKKyMgIGNkc3AubWJuIGhhcyBiZWVuIGNvbnZlcnRlZCBmcm9tIDIxLWNkc3Bf
c3BsaXQvZmlybXdhcmUvY2RzcC4qIHVzaW5nCisjICBodHRwczovL2dpdGh1Yi5jb20vYW5kZXJz
c29uL3BpbC1zcXVhc2hlcgorIyArCisjICtGaWxlOiBxY29tL3NhODc3NXAvYWRzcC5tYm4KKyMg
K1ZlcnNpb246IERTUC5BVC4xLjAuMS0wMDA3OS4yLUxFTUFOUy0xCisjICtSYXdGaWxlOiBxY29t
L3NhODc3NXAvYWRzcHIuanNuCisjICtSYXdGaWxlOiBxY29tL3NhODc3NXAvYWRzcHVhLmpzbgor
IyArRmlsZTogcWNvbS9zYTg3NzVwL2Nkc3AwLm1ibgorIyArVmVyc2lvbjogRFNQLkFULjEuMC4x
LTAwMDc5LjItTEVNQU5TLTEKKyMgK0ZpbGU6IHFjb20vc2E4Nzc1cC9jZHNwMS5tYm4KKyMgK1Zl
cnNpb246IERTUC5BVC4xLjAuMS0wMDA3OS4yLUxFTUFOUy0xCisjICtSYXdGaWxlOiBxY29tL3Nh
ODc3NXAvY2RzcHIuanNuCisjICtGaWxlOiBxY29tL3NhODc3NXAvZ3Bkc3AwLm1ibgorIyArVmVy
c2lvbjogRFNQLkFULjEuMC4xLTAwMDc5LjItTEVNQU5TLTEKKyMgK0ZpbGU6IHFjb20vc2E4Nzc1
cC9ncGRzcDEubWJuCisjICtWZXJzaW9uOiBEU1AuQVQuMS4wLjEtMDAwNzkuMi1MRU1BTlMtMQor
IyArUmF3RmlsZTogcWNvbS9zYTg3NzVwL2dwZHNwMXIuanNuCisjICtSYXdGaWxlOiBxY29tL3Nh
ODc3NXAvZ3Bkc3ByLmpzbgorIyArCisjICtMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBM
SUNFTlNFLnFjb20tMiBhbmQgcWNvbS9OT1RJQ0UudHh0IGZvciBkZXRhaWxzCisjICAKKyMgIC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCisjICAKKyMgQEAgLTc1ODEsMTYgKzc3MTksMTYgQEAKKyMgIEZpbGU6
IGNpcnJ1cy9jczM1bDU0LWIwLWRzcDEtbWlzYy0xMDNjOGQ4ZS1hbXAyLmJpbgorIyAgTGluazog
Y2lycnVzL2NzMzVsNTQtYjAtZHNwMS1taXNjLTEwM2M4ZDhmLndtZncgLT4gY3MzNWw1Ni9DUzM1
TDU2X1JldjMuMTEuMTEuMS53bWZ3CisjICBMaW5rOiBjaXJydXMvY3MzNWw1NC1iMC1kc3AxLW1p
c2MtMTAzYzhkOGYtYW1wMS5iaW4gLT4gY3MzNWw1NC1iMC1kc3AxLW1pc2MtMTAzYzhkOGUtYW1w
MS5iaW4KKyMgLUxpbms6IGNpcnJ1cy9jczM1bDU0LWIwLWRzcDEtbWlzYy0xMDNjOGQ4Zi1hbXAy
LmJpbiAtPiBjczM1bDU0LWIwLWRzcDEtbWlzYy0xMDNjOGQ4ZS1hbXAxLmJpbgorIyArTGluazog
Y2lycnVzL2NzMzVsNTQtYjAtZHNwMS1taXNjLTEwM2M4ZDhmLWFtcDIuYmluIC0+IGNzMzVsNTQt
YjAtZHNwMS1taXNjLTEwM2M4ZDhlLWFtcDIuYmluCisjICBMaW5rOiBjaXJydXMvY3MzNWw1Ni1i
MC1kc3AxLW1pc2MtMTAzYzhkOTAud21mdyAtPiBjczM1bDU2L0NTMzVMNTZfUmV2My4xMS4xMS4x
LndtZncKKyMgIEZpbGU6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xMDNjOGQ5MC1hbXAx
LmJpbgorIyAgRmlsZTogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTEwM2M4ZDkwLWFtcDIu
YmluCisjICBMaW5rOiBjaXJydXMvY3MzNWw1NC1iMC1kc3AxLW1pc2MtMTAzYzhkOTEud21mdyAt
PiBjczM1bDU2L0NTMzVMNTZfUmV2My4xMS4xMS4xLndtZncKKyMgIExpbms6IGNpcnJ1cy9jczM1
bDU0LWIwLWRzcDEtbWlzYy0xMDNjOGQ5MS1hbXAxLmJpbiAtPiBjczM1bDU0LWIwLWRzcDEtbWlz
Yy0xMDNjOGQ4ZS1hbXAxLmJpbgorIyAtTGluazogY2lycnVzL2NzMzVsNTQtYjAtZHNwMS1taXNj
LTEwM2M4ZDkxLWFtcDIuYmluIC0+IGNzMzVsNTQtYjAtZHNwMS1taXNjLTEwM2M4ZDhlLWFtcDEu
YmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw1NC1iMC1kc3AxLW1pc2MtMTAzYzhkOTEtYW1wMi5i
aW4gLT4gY3MzNWw1NC1iMC1kc3AxLW1pc2MtMTAzYzhkOGUtYW1wMi5iaW4KKyMgIExpbms6IGNp
cnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xMDNjOGQ5MS53bWZ3IC0+IGNzMzVsNTYvQ1MzNUw1
Nl9SZXYzLjExLjExLjEud21mdworIyAgTGluazogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNj
LTEwM2M4ZDkxLWFtcDEuYmluIC0+IGNzMzVsNTQtYjAtZHNwMS1taXNjLTEwM2M4ZDhlLWFtcDEu
YmluCisjIC1MaW5rOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTAzYzhkOTEtYW1wMi5i
aW4gLT4gY3MzNWw1NC1iMC1kc3AxLW1pc2MtMTAzYzhkOGUtYW1wMS5iaW4KKyMgK0xpbms6IGNp
cnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xMDNjOGQ5MS1hbXAyLmJpbiAtPiBjczM1bDU0LWIw
LWRzcDEtbWlzYy0xMDNjOGQ4ZS1hbXAyLmJpbgorIyAgTGluazogY2lycnVzL2NzMzVsNTYtYjAt
ZHNwMS1taXNjLTEwM2M4ZDkyLndtZncgLT4gY3MzNWw1Ni9DUzM1TDU2X1JldjMuMTEuMTEuMS53
bWZ3CisjICBMaW5rOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTAzYzhkOTItYW1wMS5i
aW4gLT4gY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTAzYzhkOTAtYW1wMS5iaW4KKyMgIExpbms6IGNp
cnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xMDNjOGQ5Mi1hbXAyLmJpbiAtPiBjczM1bDU2LWIw
LWRzcDEtbWlzYy0xMDNjOGQ5MC1hbXAyLmJpbgorIyBAQCAtNzYwNSwyMiArNzc0MywyMiBAQAor
IyAgTGluazogY2lycnVzL2NzMzVsNTQtYjAtZHNwMS1taXNjLTEwM2M4ZTE2LWFtcDIuYmluIC0+
IGNzMzVsNTQtYjAtZHNwMS1taXNjLTEwM2M4ZTE0LWFtcDIuYmluCisjICBMaW5rOiBjaXJydXMv
Y3MzNWw1NC1iMC1kc3AxLW1pc2MtMTAzYzhlMTcud21mdyAtPiBjczM1bDU2L0NTMzVMNTZfUmV2
My4xMS4xMS4xLndtZncKKyMgIExpbms6IGNpcnJ1cy9jczM1bDU0LWIwLWRzcDEtbWlzYy0xMDNj
OGUxNy1hbXAxLmJpbiAtPiBjczM1bDU0LWIwLWRzcDEtbWlzYy0xMDNjOGUxNS1hbXAxLmJpbgor
IyAtTGluazogY2lycnVzL2NzMzVsNTQtYjAtZHNwMS1taXNjLTEwM2M4ZTE3LWFtcDIuYmluIC0+
IGNzMzVsNTQtYjAtZHNwMS1taXNjLTEwM2M4ZTE1LWFtcDEuYmluCisjICtMaW5rOiBjaXJydXMv
Y3MzNWw1NC1iMC1kc3AxLW1pc2MtMTAzYzhlMTctYW1wMi5iaW4gLT4gY3MzNWw1NC1iMC1kc3Ax
LW1pc2MtMTAzYzhlMTUtYW1wMi5iaW4KKyMgIExpbms6IGNpcnJ1cy9jczM1bDU0LWIwLWRzcDEt
bWlzYy0xMDNjOGUxOC53bWZ3IC0+IGNzMzVsNTYvQ1MzNUw1Nl9SZXYzLjExLjExLjEud21mdwor
IyAgTGluazogY2lycnVzL2NzMzVsNTQtYjAtZHNwMS1taXNjLTEwM2M4ZTE4LWFtcDEuYmluIC0+
IGNzMzVsNTQtYjAtZHNwMS1taXNjLTEwM2M4ZTE1LWFtcDEuYmluCisjIC1MaW5rOiBjaXJydXMv
Y3MzNWw1NC1iMC1kc3AxLW1pc2MtMTAzYzhlMTgtYW1wMi5iaW4gLT4gY3MzNWw1NC1iMC1kc3Ax
LW1pc2MtMTAzYzhlMTUtYW1wMS5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDU0LWIwLWRzcDEt
bWlzYy0xMDNjOGUxOC1hbXAyLmJpbiAtPiBjczM1bDU0LWIwLWRzcDEtbWlzYy0xMDNjOGUxNS1h
bXAyLmJpbgorIyAgTGluazogY2lycnVzL2NzMzVsNTQtYjAtZHNwMS1taXNjLTEwM2M4ZTE5Lndt
ZncgLT4gY3MzNWw1Ni9DUzM1TDU2X1JldjMuMTEuMTEuMS53bWZ3CisjICBMaW5rOiBjaXJydXMv
Y3MzNWw1NC1iMC1kc3AxLW1pc2MtMTAzYzhlMTktYW1wMS5iaW4gLT4gY3MzNWw1NC1iMC1kc3Ax
LW1pc2MtMTAzYzhlMTUtYW1wMS5iaW4KKyMgLUxpbms6IGNpcnJ1cy9jczM1bDU0LWIwLWRzcDEt
bWlzYy0xMDNjOGUxOS1hbXAyLmJpbiAtPiBjczM1bDU0LWIwLWRzcDEtbWlzYy0xMDNjOGUxNS1h
bXAxLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNTQtYjAtZHNwMS1taXNjLTEwM2M4ZTE5LWFt
cDIuYmluIC0+IGNzMzVsNTQtYjAtZHNwMS1taXNjLTEwM2M4ZTE1LWFtcDIuYmluCisjICBMaW5r
OiBjaXJydXMvY3MzNWw1NC1iMC1kc3AxLW1pc2MtMTAzYzhlMWEud21mdyAtPiBjczM1bDU2L0NT
MzVMNTZfUmV2My4xMS4xMS4xLndtZncKKyMgIExpbms6IGNpcnJ1cy9jczM1bDU0LWIwLWRzcDEt
bWlzYy0xMDNjOGUxYS1hbXAxLmJpbiAtPiBjczM1bDU0LWIwLWRzcDEtbWlzYy0xMDNjOGUxNS1h
bXAxLmJpbgorIyAtTGluazogY2lycnVzL2NzMzVsNTQtYjAtZHNwMS1taXNjLTEwM2M4ZTFhLWFt
cDIuYmluIC0+IGNzMzVsNTQtYjAtZHNwMS1taXNjLTEwM2M4ZTE1LWFtcDEuYmluCisjICtMaW5r
OiBjaXJydXMvY3MzNWw1NC1iMC1kc3AxLW1pc2MtMTAzYzhlMWEtYW1wMi5iaW4gLT4gY3MzNWw1
NC1iMC1kc3AxLW1pc2MtMTAzYzhlMTUtYW1wMi5iaW4KKyMgIExpbms6IGNpcnJ1cy9jczM1bDU0
LWIwLWRzcDEtbWlzYy0xMDNjOGUxYi53bWZ3IC0+IGNzMzVsNTYvQ1MzNUw1Nl9SZXYzLjExLjEx
LjEud21mdworIyAgRmlsZTogY2lycnVzL2NzMzVsNTQtYjAtZHNwMS1taXNjLTEwM2M4ZTFiLWFt
cDEuYmluCisjICBGaWxlOiBjaXJydXMvY3MzNWw1NC1iMC1kc3AxLW1pc2MtMTAzYzhlMWItYW1w
Mi5iaW4KKyMgIExpbms6IGNpcnJ1cy9jczM1bDU0LWIwLWRzcDEtbWlzYy0xMDNjOGUxYy53bWZ3
IC0+IGNzMzVsNTYvQ1MzNUw1Nl9SZXYzLjExLjExLjEud21mdworIyAgTGluazogY2lycnVzL2Nz
MzVsNTQtYjAtZHNwMS1taXNjLTEwM2M4ZTFjLWFtcDEuYmluIC0+IGNzMzVsNTQtYjAtZHNwMS1t
aXNjLTEwM2M4ZTFiLWFtcDEuYmluCisjIC1MaW5rOiBjaXJydXMvY3MzNWw1NC1iMC1kc3AxLW1p
c2MtMTAzYzhlMWMtYW1wMi5iaW4gLT4gY3MzNWw1NC1iMC1kc3AxLW1pc2MtMTAzYzhlMWItYW1w
MS5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDU0LWIwLWRzcDEtbWlzYy0xMDNjOGUxYy1hbXAy
LmJpbiAtPiBjczM1bDU0LWIwLWRzcDEtbWlzYy0xMDNjOGUxYi1hbXAyLmJpbgorIyAgTGluazog
Y2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTEwM2M4ZTJjLndtZncgLT4gY3MzNWw1Ni9DUzM1
TDU2X1JldjMuMTEuMTEuMS53bWZ3CisjICBMaW5rOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1p
c2MtMTAzYzhlMmMtYW1wMS5iaW4gLT4gY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTAzYzhkOTAtYW1w
MS5iaW4KKyMgIExpbms6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xMDNjOGUyYy1hbXAy
LmJpbiAtPiBjczM1bDU2LWIwLWRzcDEtbWlzYy0xMDNjOGQ5MC1hbXAyLmJpbgorIyBAQCAtNzc4
Myw4ICs3OTIxLDggQEAKKyMgIEluZm86IDB4YzFjMgorIyAgCisjICBGaWxlOiBhbWxvZ2ljL2Ft
bF93MjY1czJfYnRfdWFydC5iaW4KKyMgLVZlcnNpb246IDQyLjI4CisjIC1JbmZvOiAweGIyZmQK
KyMgK1ZlcnNpb246IDUxLjA2CisjICtJbmZvOiAweGU4NjMKKyMgIAorIyAgTGljZW5jZTogUmVk
aXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5hbWxvZ2ljIGZvciBkZXRhaWxzCisjICAKKyMgQEAg
LTc4MjAsOSArNzk1OCwyMiBAQAorIyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgIAorIyAgRHJpdmVy
OiB0aS10YXMyNzgxIC0gdGFzMjc4MSBmaXJtd2FyZQorIyArRmlsZTogdGkvdGFzMjc4MS9UQVMy
WFhYMEM5NC5iaW4KKyMgK0ZpbGU6IHRpL3RhczI3ODEvVEFTMlhYWDBDOTUuYmluCisjICtGaWxl
OiB0aS90YXMyNzgxL1RBUzJYWFgwQzk2LmJpbgorIyArRmlsZTogdGkvdGFzMjc4MS9UQVMyWFhY
MEM5Ny5iaW4KKyMgK0ZpbGU6IHRpL3RhczI3ODEvVEFTMlhYWDEwQTQwLmJpbgorIyArRmlsZTog
dGkvdGFzMjc4MS9UQVMyWFhYMTBBNDEuYmluCisjICtGaWxlOiB0aS90YXMyNzgxL1RBUzJYWFgx
MTU0MC5iaW4KKyMgK0ZpbGU6IHRpL3RhczI3ODEvVEFTMlhYWDExNTQxLmJpbgorIyArRmlsZTog
dGkvdGFzMjc4MS9UQVMyWFhYMTIwNDAuYmluCisjICtGaWxlOiB0aS90YXMyNzgxL1RBUzJYWFgx
MjA0MS5iaW4KKyMgK0ZpbGU6IHRpL3RhczI3ODEvVEFTMlhYWDEyMTQwLmJpbgorIyArRmlsZTog
dGkvdGFzMjc4MS9UQVMyWFhYMTIxNDEuYmluCisjICBGaWxlOiB0aS90YXMyNzgxL1RBUzJYWFgx
RUIzMC5iaW4KKyMgIEZpbGU6IHRpL3RhczI3ODEvVEFTMlhYWDFFQjMxLmJpbgorIyAgRmlsZTog
dGkvdGFzMjc4MS9UQVMyWFhYMjIzNC5iaW4KKyMgK0ZpbGU6IHRpL3RhczI3ODEvVEFTMlhYWDIz
MjYuYmluCisjICBGaWxlOiB0aS90YXMyNzgxL1RBUzJYWFgzODdELmJpbgorIyAgRmlsZTogdGkv
dGFzMjc4MS9UQVMyWFhYMzg3RS5iaW4KKyMgIEZpbGU6IHRpL3RhczI3ODEvVEFTMlhYWDM4N0Yu
YmluCisjIEBAIC03ODQ5LDEyICs4MDAwLDUwIEBACisjICBGaWxlOiB0aS90YXMyNzgxL1RBUzJY
WFgzOEQ2LmJpbgorIyAgRmlsZTogdGkvdGFzMjc4MS9UQVMyWFhYMzhERi5iaW4KKyMgIEZpbGU6
IHRpL3RhczI3ODEvVEFTMlhYWDM4RTAuYmluCisjICtGaWxlOiB0aS90YXMyNzgxL1RBUzJYWFgz
OEZELmJpbgorIyArRmlsZTogdGkvdGFzMjc4MS9UQVMyWFhYMzkxRi5iaW4KKyMgK0ZpbGU6IHRp
L3RhczI3ODEvVEFTMlhYWDM5MjAuYmluCisjICtGaWxlOiB0aS90YXMyNzgxL1RBUzJYWFgzRTMw
MC5iaW4KKyMgK0ZpbGU6IHRpL3RhczI3ODEvVEFTMlhYWDNFMzAxLmJpbgorIyArRmlsZTogdGkv
dGFzMjc4MS9UQVMyWFhYM0VFMDAuYmluCisjICtGaWxlOiB0aS90YXMyNzgxL1RBUzJYWFgzRUUw
MS5iaW4KKyMgK0ZpbGU6IHRpL3RhczI3ODEvVEFTMlhYWDNFRjAwLmJpbgorIyArRmlsZTogdGkv
dGFzMjc4MS9UQVMyWFhYM0VGMDEuYmluCisjICtGaWxlOiB0aS90YXMyNzgxL1RBUzJYWFgzRjAw
MC5iaW4KKyMgK0ZpbGU6IHRpL3RhczI3ODEvVEFTMlhYWDNGMDAxLmJpbgorIyArRmlsZTogdGkv
dGFzMjc4MS9UQVMyWFhYM0YxMDAuYmluCisjICtGaWxlOiB0aS90YXMyNzgxL1RBUzJYWFgzRjEw
MS5iaW4KKyMgK0ZpbGU6IHRpL3RhczI3ODEvVEFTMlhYWDNGMjAwLmJpbgorIyArRmlsZTogdGkv
dGFzMjc4MS9UQVMyWFhYM0YyMDEuYmluCisjICtGaWxlOiB0aS90YXMyNzgxL1RBUzJYWFgzRjMw
MC5iaW4KKyMgK0ZpbGU6IHRpL3RhczI3ODEvVEFTMlhYWDNGMzAxLmJpbgorIyArRmlsZTogdGkv
dGFzMjc4MS9UQVMyWFhYOERFOC5iaW4KKyMgK0ZpbGU6IHRpL3RhczI3ODEvVEFTMlhYWDhERTku
YmluCisjICtGaWxlOiB0aS90YXMyNzgxL1RYTlcyNzgxUkNBMC5iaW4KKyMgK0ZpbGU6IHRpL3Rh
czI3ODEvVFhOVzI3ODFSQ0ExLmJpbgorIyAgRmlsZTogdGkvdGFzMjc4MS9USUFTMjc4MVJDQTIu
YmluCisjICBGaWxlOiB0aS90YXMyNzgxL1RJQVMyNzgxUkNBNC5iaW4KKyMgK0xpbms6IFRBUzJY
WFgwQzk0LmJpbiAtPiB0aS90YXMyNzgxL1RBUzJYWFgwQzk0LmJpbgorIyArTGluazogVEFTMlhY
WDBDOTUuYmluIC0+IHRpL3RhczI3ODEvVEFTMlhYWDBDOTUuYmluCisjICtMaW5rOiBUQVMyWFhY
MEM5Ni5iaW4gLT4gdGkvdGFzMjc4MS9UQVMyWFhYMEM5Ni5iaW4KKyMgK0xpbms6IFRBUzJYWFgw
Qzk3LmJpbiAtPiB0aS90YXMyNzgxL1RBUzJYWFgwQzk3LmJpbgorIyArTGluazogVEFTMlhYWDEw
M0M4REU4MC5iaW4gLT4gdGkvdGFzMjc4MS9UQVMyWFhYOERFOC5iaW4KKyMgK0xpbms6IFRBUzJY
WFgxMDNDOERFODEuYmluIC0+IHRpL3RhczI3ODEvVEFTMlhYWDhERTguYmluCisjICtMaW5rOiBU
QVMyWFhYMTAzQzhERTkwLmJpbiAtPiB0aS90YXMyNzgxL1RBUzJYWFg4REU5LmJpbgorIyArTGlu
azogVEFTMlhYWDEwM0M4REU5MS5iaW4gLT4gdGkvdGFzMjc4MS9UQVMyWFhYOERFOS5iaW4KKyMg
K0xpbms6IFRBUzJYWFgxMEE0MC5iaW4gLT4gdGkvdGFzMjc4MS9UQVMyWFhYMTBBNDAuYmluCisj
ICtMaW5rOiBUQVMyWFhYMTBBNDEuYmluIC0+IHRpL3RhczI3ODEvVEFTMlhYWDEwQTQxLmJpbgor
IyArTGluazogVEFTMlhYWDExNTQwLmJpbiAtPiB0aS90YXMyNzgxL1RBUzJYWFgxMTU0MC5iaW4K
KyMgK0xpbms6IFRBUzJYWFgxMTU0MS5iaW4gLT4gdGkvdGFzMjc4MS9UQVMyWFhYMTE1NDEuYmlu
CisjICtMaW5rOiBUQVMyWFhYMTIwNDAuYmluIC0+IHRpL3RhczI3ODEvVEFTMlhYWDEyMDQwLmJp
bgorIyArTGluazogVEFTMlhYWDEyMDQxLmJpbiAtPiB0aS90YXMyNzgxL1RBUzJYWFgxMjA0MS5i
aW4KKyMgK0xpbms6IFRBUzJYWFgxMjE0MC5iaW4gLT4gdGkvdGFzMjc4MS9UQVMyWFhYMTIxNDAu
YmluCisjICtMaW5rOiBUQVMyWFhYMTIxNDEuYmluIC0+IHRpL3RhczI3ODEvVEFTMlhYWDEyMTQx
LmJpbgorIyAgTGluazogVEFTMlhYWDFFQjMuYmluIC0+IHRpL3RhczI3ODEvVEFTMlhYWDFFQjMw
LmJpbgorIyAgTGluazogVEFTMlhYWDFFQjMwLmJpbiAtPiB0aS90YXMyNzgxL1RBUzJYWFgxRUIz
MC5iaW4KKyMgIExpbms6IFRBUzJYWFgxRUIzMS5iaW4gLT4gdGkvdGFzMjc4MS9UQVMyWFhYMUVC
MzEuYmluCisjICBMaW5rOiBUQVMyWFhYMjIzNC5iaW4gLT4gdGkvdGFzMjc4MS9UQVMyWFhYMjIz
NC5iaW4KKyMgK0xpbms6IFRBUzJYWFgyMzI2LmJpbiAtPiB0aS90YXMyNzgxL1RBUzJYWFgyMzI2
LmJpbgorIyAgTGluazogVEFTMlhYWDM4N0QuYmluIC0+IHRpL3RhczI3ODEvVEFTMlhYWDM4N0Qu
YmluCisjICBMaW5rOiBUQVMyWFhYMzg3RS5iaW4gLT4gdGkvdGFzMjc4MS9UQVMyWFhYMzg3RS5i
aW4KKyMgIExpbms6IFRBUzJYWFgzODdGLmJpbiAtPiB0aS90YXMyNzgxL1RBUzJYWFgzODdGLmJp
bgorIyBAQCAtNzg4MSw4ICs4MDcwLDM1IEBACisjICBMaW5rOiBUQVMyWFhYMzhENi5iaW4gLT4g
dGkvdGFzMjc4MS9UQVMyWFhYMzhENi5iaW4KKyMgIExpbms6IFRBUzJYWFgzOERGLmJpbiAtPiB0
aS90YXMyNzgxL1RBUzJYWFgzOERGLmJpbgorIyAgTGluazogVEFTMlhYWDM4RTAuYmluIC0+IHRp
L3RhczI3ODEvVEFTMlhYWDM4RTAuYmluCisjICtMaW5rOiBUQVMyWFhYMzhGRC5iaW4gLT4gdGkv
dGFzMjc4MS9UQVMyWFhYMzhGRC5iaW4KKyMgK0xpbms6IFRBUzJYWFgzOTFGLmJpbiAtPiB0aS90
YXMyNzgxL1RBUzJYWFgzOTFGLmJpbgorIyArTGluazogVEFTMlhYWDM5MjAuYmluIC0+IHRpL3Rh
czI3ODEvVEFTMlhYWDM5MjAuYmluCisjICtMaW5rOiBUQVMyWFhYM0UzMDAuYmluIC0+IHRpL3Rh
czI3ODEvVEFTMlhYWDNFMzAwLmJpbgorIyArTGluazogVEFTMlhYWDNFMzAxLmJpbiAtPiB0aS90
YXMyNzgxL1RBUzJYWFgzRTMwMS5iaW4KKyMgK0xpbms6IFRBUzJYWFgzRUUwMC5iaW4gLT4gdGkv
dGFzMjc4MS9UQVMyWFhYM0VFMDAuYmluCisjICtMaW5rOiBUQVMyWFhYM0VFMDEuYmluIC0+IHRp
L3RhczI3ODEvVEFTMlhYWDNFRTAxLmJpbgorIyArTGluazogVEFTMlhYWDNFRjAwLmJpbiAtPiB0
aS90YXMyNzgxL1RBUzJYWFgzRUYwMC5iaW4KKyMgK0xpbms6IFRBUzJYWFgzRUYwMS5iaW4gLT4g
dGkvdGFzMjc4MS9UQVMyWFhYM0VGMDEuYmluCisjICtMaW5rOiBUQVMyWFhYM0YwMDAuYmluIC0+
IHRpL3RhczI3ODEvVEFTMlhYWDNGMDAwLmJpbgorIyArTGluazogVEFTMlhYWDNGMDAxLmJpbiAt
PiB0aS90YXMyNzgxL1RBUzJYWFgzRjAwMS5iaW4KKyMgK0xpbms6IFRBUzJYWFgzRjEwMC5iaW4g
LT4gdGkvdGFzMjc4MS9UQVMyWFhYM0YxMDAuYmluCisjICtMaW5rOiBUQVMyWFhYM0YxMDEuYmlu
IC0+IHRpL3RhczI3ODEvVEFTMlhYWDNGMTAxLmJpbgorIyArTGluazogVEFTMlhYWDNGMjAwLmJp
biAtPiB0aS90YXMyNzgxL1RBUzJYWFgzRjIwMC5iaW4KKyMgK0xpbms6IFRBUzJYWFgzRjIwMS5i
aW4gLT4gdGkvdGFzMjc4MS9UQVMyWFhYM0YyMDEuYmluCisjICtMaW5rOiBUQVMyWFhYM0YzMDAu
YmluIC0+IHRpL3RhczI3ODEvVEFTMlhYWDNGMzAwLmJpbgorIyArTGluazogVEFTMlhYWDNGMzAx
LmJpbiAtPiB0aS90YXMyNzgxL1RBUzJYWFgzRjMwMS5iaW4KKyMgK0xpbms6IFRBUzJYWFg4REU4
LmJpbiAtPiB0aS90YXMyNzgxL1RBUzJYWFg4REU4LmJpbgorIyArTGluazogVEFTMlhYWDhERTku
YmluIC0+IHRpL3RhczI3ODEvVEFTMlhYWDhERTkuYmluCisjICtMaW5rOiBUQVMyWFhYOERFODAu
YmluIC0+IHRpL3RhczI3ODEvVEFTMlhYWDhERTguYmluCisjICtMaW5rOiBUQVMyWFhYOERFODEu
YmluIC0+IHRpL3RhczI3ODEvVEFTMlhYWDhERTguYmluCisjICtMaW5rOiBUQVMyWFhYOERFOTAu
YmluIC0+IHRpL3RhczI3ODEvVEFTMlhYWDhERTkuYmluCisjICtMaW5rOiBUQVMyWFhYOERFOTEu
YmluIC0+IHRpL3RhczI3ODEvVEFTMlhYWDhERTkuYmluCisjICBMaW5rOiBUSUFTMjc4MVJDQTIu
YmluIC0+IHRpL3RhczI3ODEvVElBUzI3ODFSQ0EyLmJpbgorIyAgTGluazogVElBUzI3ODFSQ0E0
LmJpbiAtPiB0aS90YXMyNzgxL1RJQVMyNzgxUkNBNC5iaW4KKyMgK0xpbms6IFRYTlcyNzgxUkNB
MC5iaW4gLT4gdGkvdGFzMjc4MS9UWE5XMjc4MVJDQTAuYmluCisjICtMaW5rOiBUWE5XMjc4MVJD
QTEuYmluIC0+IHRpL3RhczI3ODEvVFhOVzI3ODFSQ0ExLmJpbgorIyArTGluazogVFhOVzI3ODFS
Q0EyLmJpbiAtPiB0aS90YXMyNzgxL1RJQVMyNzgxUkNBMi5iaW4KKyMgK0xpbms6IFRYTlcyNzgx
UkNBNC5iaW4gLT4gdGkvdGFzMjc4MS9USUFTMjc4MVJDQTQuYmluCisjICAKKyMgIExpY2VuY2U6
IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UudGktdHNwYSBmb3IgZGV0YWlscy4gTWFya2Vk
OgorIyAgCSBDb3B5cmlnaHQgKEMpIDIwMjMgLSAyMDI0IFRleGFzIEluc3RydW1lbnRzCisjIAor
IworCiBTVU1NQVJZID0gIkZpcm13YXJlIGZpbGVzIGZvciB1c2Ugd2l0aCBMaW51eCBrZXJuZWwi
CiBIT01FUEFHRSA9ICJodHRwczovL3d3dy5rZXJuZWwub3JnLyIKIERFU0NSSVBUSU9OID0gIkxp
bnV4IGZpcm13YXJlIGlzIGEgcGFja2FnZSBkaXN0cmlidXRlZCBhbG9uZ3NpZGUgdGhlIExpbnV4
IGtlcm5lbCBcCkBAIC0xNTQsNyArOTUxLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8v
TElDRU5DRS5BYmlsaXM7bWQ1PWI1ZWUzZjQxMDc4MGU1NjcxMWFkNDhlYWRjMjJiOGJjIFwKICAg
ICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOQ0UueGM1MDAwO21kNT0xZTE3MGMxMzE3NTMy
M2MzMmM3ZjRkMDk5OGQ1M2Y2NiBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTkNF
LnhjNTAwMGM7bWQ1PTEyYjAyZWZhMzA0OWRiNjVkNTI0YWViNDE4ZGQ4N2NhIFwKICAgICAgICAg
ICAgICAgICAgICAgZmlsZTovL3dmeC9MSUNFTkNFLndmMjAwO21kNT00ZDFiZWZmMDBkOTAyYzA1
YzljN2U5NWE1ZDhlYjUyZCBcCi0gICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9XSEVOQ0U7bWQ1
PSR7V0hFTkNFX0NIS1NVTX0gXAorICAgICAgICAgICAgICAgICAgICBmaWxlOi8vV0hFTkNFO21k
NT02NWMyOTE5ZTY1MTFhMGQzNDhhMDA5YWM0MTkzNzViNyBcCiAgICAgICAgICAgICAgICAgICAg
ICIKICMgV0hFTkNFIGNoZWNrc3VtIGlzIGRlZmluZWQgc2VwYXJhdGVseSB0byBlYXNlIG92ZXJy
aWRpbmcgaXQgaWYKICMgY2xhc3MtZGV2dXBzdHJlYW0gaXMgc2VsZWN0ZWQuCkBAIC0yNDcsNyAr
MTA0NCw3IEBAIFNSQ19VUkk6Y2xhc3MtZGV2dXBzdHJlYW0gPSAiZ2l0Oi8vZ2l0Lmtlcm5lbC5v
cmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2Zpcm13CiAjIFBpbiB0aGlzIHRvIHRoZSAyMDIy
MDUwOSByZWxlYXNlLCBvdmVycmlkZSB0aGlzIGluIGxvY2FsLmNvbmYKIFNSQ1JFVjpjbGFzcy1k
ZXZ1cHN0cmVhbSA/PSAiYjE5Y2JkY2E3OGFiMmFkZmQyMTBjOTFiZTE1YTIyNTY4ZThiOGNhZSIK
IAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImExMmNiMzhmNDc5MzM5NGJmNTZjNjcwMmJlMjliNmU0
ZjA5ZGVjYTA3MTQ5NDNiYmE5OGE0OTIwMzA2NTE1NzAiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAi
MmRlMTM0NTg5N2JmODM5ZDUzMmM1ZGUwZmRiMzQ4NzcwY2EyYTVmNGVkZmIyMTk3MTU4MjU5N2Fi
YjQ1Mjk3ZCIKIAogaW5oZXJpdCBhbGxhcmNoCiAKLS0gCjIuNDQuMQoK

--===============4007131793297174907==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-misc: PKGSIZE changed from 0 to 6417486 (+100%)
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-misc: FILELIST: added "/usr/lib/firmware/ath11k/QCA6698AQ/hw2.1/amss.bin /usr/lib/firmware/ath11k/QCA6698AQ/hw2.1/board-2.bin /usr/lib/firmware/ath11k/QCA6698AQ/hw2.1/m3.bin /usr/lib/firmware/ath11k/QCA6698AQ/hw2.1/Notice.txt"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-wcn6750: PKGSIZE changed from 8625097 to 16443593 (+91%)
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-wcn6750: FILELIST: added "/usr/lib/firmware/ath11k/WCN6750/hw1.0/qcm6490/wpss.mbn"
packages/all-poky-linux/linux-firmware/linux-firmware-dev: RRECOMMENDS: added "linux-firmware-ath11k-wcn6750-dev"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: FILELIST: added "/usr/lib/firmware/iwlwifi-gl-c0-fm-c0-96.ucode /usr/lib/firmware/iwlwifi-bz-b0-gf-a0-96.ucode /usr/lib/firmware/iwlwifi-bz-b0-fm-c0-96.ucode /usr/lib/firmware/iwlwifi-bz-b0-fm-c0-93.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGSIZE changed from 116925 to 131342 (+12%)
packages/all-poky-linux/linux-firmware/linux-firmware-license: FILELIST: added "/usr/lib/firmware/LICENSE.qcom-2"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-misc: PKGSIZE changed from 134054 to 392295 (+193%)
packages/all-poky-linux/linux-firmware/linux-firmware-qca-misc: FILELIST: added "/usr/lib/firmware/qca/cmbtfw12.tlv /usr/lib/firmware/qca/cmbtfw13.tlv /usr/lib/firmware/qca/QCA6698/hpnv21.bin /usr/lib/firmware/qca/cmnv13s.bin /usr/lib/firmware/qca/cmnv13t.bin /usr/lib/firmware/qca/cmnv13.bin /usr/lib/firmware/qca/QCA6698/hpnv21.b206 /usr/lib/firmware/qca/QCA6698/hpbtfw21.tlv /usr/lib/firmware/qca/cmnv12.bin /usr/lib/firmware/qca/QCA6698/hpnv21.b207"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn6750: PKGSIZE changed from 340433 to 417209 (+23%)
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-thundercomm-rb5-sensors: PKGSIZE changed from 5647104 to 7455860 (+32%)
packages/all-poky-linux/linux-firmware/linux-firmware: PKGSIZE changed from 95586763 to 148902840 (+56%)
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: added "/usr/lib/firmware/qcom/sa8775p/gpdsp0.mbn /usr/lib/firmware/qcom/sa8775p/gpdsp1.mbn /usr/lib/firmware/qcom/sa8775p/gpdsp1r.jsn /usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/battmgr.jsn /usr/lib/firmware/ti/tas2781/TAS2XXX10A40.bin /usr/lib/firmware/ti/tas2781/TAS2XXX11540.bin /usr/lib/firmware/ti/tas2781/TAS2XXX12040.bin /usr/lib/firmware/ti/tas2781/TAS2XXX12140.bin /usr/lib/firmware/ti/tas2781/TAS2XXX3E300.bin /usr/lib/firmware/ti/tas2781/TAS2XXX3EE00.bin /usr/lib/firmware/ti/tas2781/TAS2XXX3EF00.bin /usr/lib/firmware/ti/tas2781/TAS2XXX3F000.bin /usr/lib/firmware/ti/tas2781/TAS2XXX3F100.bin /usr/lib/firmware/ti/tas2781/TAS2XXX3F200.bin /usr/lib/firmware/TAS2XXX103C8DE81.bin /usr/lib/firmware/TAS2XXX12140.bin /usr/lib/firmware/TAS2XXX12141.bin /usr/lib/firmware/TAS2XXX3EF00.bin /usr/lib/firmware/TAS2XXX3F300.bin /usr/lib/firmware/TAS2XXX3F301.bin /usr/lib/firmware/TAS2XXX3F200.bin /usr/lib/firmware/TAS2XXX3F201.bin
  /usr/lib/firmware/TAS2XXX3E300.bin /usr/lib/firmware/TAS2XXX3EE00.bin /usr/lib/firmware/TAS2XXX3F001.bin /usr/lib/firmware/qcom/sa8775p/gpdspr.jsn /usr/lib/firmware/ti/tas2781/TAS2XXX3EE01.bin /usr/lib/firmware/ti/tas2781/TAS2XXX3EF01.bin /usr/lib/firmware/ti/tas2781/TXNW2781RCA0.bin /usr/lib/firmware/qcom/qcs6490/wpss.mbn /usr/lib/firmware/TXNW2781RCA1.bin /usr/lib/firmware/TXNW2781RCA2.bin /usr/lib/firmware/TXNW2781RCA4.bin /usr/lib/firmware/TXNW2781RCA0.bin /usr/lib/firmware/qcom/qcm6490/wpss.mbn /usr/lib/firmware/ti/tas2781/TAS2XXX3F300.bin /usr/lib/firmware/qcom/sa8775p/adspua.jsn /usr/lib/firmware/rtw89/rtw8922a_fw-3.bin /usr/lib/firmware/qcom/sa8775p/cdsp0.mbn /usr/lib/firmware/TAS2XXX2326.bin /usr/lib/firmware/TAS2XXX103C8DE90.bin /usr/lib/firmware/TAS2XXX8DE8.bin /usr/lib/firmware/TAS2XXX8DE9.bin /usr/lib/firmware/TAS2XXX0C95.bin /usr/lib/firmware/TAS2XXX0C94.bin /usr/lib/firmware/TAS2XXX0C96.bin /usr/lib/firmware/TAS2XXX0C97.bin /usr/lib/firmware/ti/tas2781/TXNW2781RCA1.b
 in /usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/adsps.jsn /usr/lib/firmware/ti/tas2781/TAS2XXX3F101.bin /usr/lib/firmware/ti/tas2781/TAS2XXX3F201.bin /usr/lib/firmware/ti/tas2781/TAS2XXX3F301.bin /usr/lib/firmware/ti/tas2781/TAS2XXX10A41.bin /usr/lib/firmware/ti/tas2781/TAS2XXX11541.bin /usr/lib/firmware/ti/tas2781/TAS2XXX12041.bin /usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/adspua.jsn /usr/lib/firmware/ti/tas2781/TAS2XXX12141.bin /usr/lib/firmware/ti/tas2781/TAS2XXX3E301.bin /usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/adspr.jsn /usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/cdspr.jsn /usr/lib/firmware/TAS2XXX103C8DE91.bin /usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/qcadsp8380.mbn /usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/qccdsp8380.mbn /usr/lib/firmware/qcom/sa8775p/adspr.jsn /usr/lib/firmware/qcom/sa8775p/cdspr.jsn /usr/lib/firmware/ti/tas2781/TAS2XXX0C94.bin /usr/lib/firmware/ti/tas2781/TAS2XXX0C95.bin /usr/lib/firmware/ti/tas2781/TAS2XXX0C96.bin /usr/lib/firmware/ti/tas2781/TAS2XX
 X0C97.bin /usr/lib/firmware/ti/tas2781/TAS2XXX2326.bin /usr/lib/firmware/ti/tas2781/TAS2XXX38FD.bin /usr/lib/firmware/ti/tas2781/TAS2XXX391F.bin /usr/lib/firmware/ti/tas2781/TAS2XXX3920.bin /usr/lib/firmware/ti/tas2781/TAS2XXX8DE8.bin /usr/lib/firmware/ti/tas2781/TAS2XXX8DE9.bin /usr/lib/firmware/TAS2XXX11540.bin /usr/lib/firmware/TAS2XXX11541.bin /usr/lib/firmware/TAS2XXX12040.bin /usr/lib/firmware/TAS2XXX12041.bin /usr/lib/firmware/TAS2XXX10A41.bin /usr/lib/firmware/TAS2XXX10A40.bin /usr/lib/firmware/TAS2XXX3E301.bin /usr/lib/firmware/TAS2XXX3EE01.bin /usr/lib/firmware/TAS2XXX3EF01.bin /usr/lib/firmware/TAS2XXX3F000.bin /usr/lib/firmware/TAS2XXX3F100.bin /usr/lib/firmware/TAS2XXX3F101.bin /usr/lib/firmware/TAS2XXX8DE80.bin /usr/lib/firmware/TAS2XXX8DE81.bin /usr/lib/firmware/TAS2XXX8DE90.bin /usr/lib/firmware/TAS2XXX8DE91.bin /usr/lib/firmware/qcom/sa8775p/cdsp1.mbn /usr/lib/firmware/TAS2XXX103C8DE80.bin /usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/qcdxkmsuc8380.mbn /usr/lib/firmwa
 re/qcom/sa8775p/adsp.mbn /usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/adsp_dtbs.elf /usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/cdsp_dtbs.elf /usr/lib/firmware/atmel/wilc3000_wifi_firmware-1.bin /usr/lib/firmware/ti/tas2781/TAS2XXX3F001.bin /usr/lib/firmware/TAS2XXX38FD.bin /usr/lib/firmware/TAS2XXX391F.bin /usr/lib/firmware/TAS2XXX3920.bin"
packages/all-poky-linux/linux-firmware/linux-firmware: RDEPENDS: added "linux-firmware-ath11k-wcn6750"

--===============4007131793297174907==--

