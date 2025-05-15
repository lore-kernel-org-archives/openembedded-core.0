Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28F19C7112F
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 12:32:14 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.11027.1747312306375871539
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 05:32:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=tUGFGVTm;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=JBr016mQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010196d3ee3650-64252574-198a-463f-a12e-ca1539261c19-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1747312326;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=n7D2eB8d3ckf4pcjUJsAJj/3BErUn0AtQ3cdCPoJAdg=;
	b=tUGFGVTmIQd+8vHvY3se9YuTI1ErjQ5uZ/LHaUOEFp6fd6vxpX6OFvYu9QgQ5Ums
	/2w1+jBCgSbevQIc0B3347Spi2nuDOWRBYxObTWaLXwEO1bDHQXjEIAzuhjrg8vdHha
	TLIn43OTTo+8qg80yx5Wg0pQ2rT+GObCcS/EGzxc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1747312326;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=n7D2eB8d3ckf4pcjUJsAJj/3BErUn0AtQ3cdCPoJAdg=;
	b=JBr016mQ2q4dG4hULUw7UVxLCDZhUbJYae35Px0O72Wn/LDG1LO4IVXXPTygjxxN
	fiINeKD1wiHCUkCCC2h3zzb+SZPDhOSqNDmN4yBcX1/mKfHh84hX/5MbwKwt0n0QRCm
	j5fvsopnvfjRRWMIhd604eHxQ5ROFBTaXCa5eSe4=
Content-Type: multipart/mixed; boundary="===============4378525154724947533=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] linux-firmware: upgrading to 20250509 SUCCEEDED
Message-ID: <01010196d3ee3650-64252574-198a-463f-a12e-ca1539261c19-000000@us-west-2.amazonses.com>
Date: Thu, 15 May 2025 12:32:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:32:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216654

--===============4378525154724947533==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *linux-firmware* to *20250509* has Succeeded.

Next steps:
    - apply the patch: git am 0001-linux-firmware-upgrade-20250410-20250509.patch
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
From 63dd4e6c3ef43a9dde4a91e2428e82c94ae25836 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 May 2025 11:13:56 +0000
Subject: [PATCH] linux-firmware: upgrade 20250410 -> 20250509

---
 ...20250410.bb => linux-firmware_20250509.bb} | 421 +++++++++++++++++-
 1 file changed, 419 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20250410.bb => linux-firmware_20250509.bb} (87%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250410.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250509.bb
similarity index 87%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20250410.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20250509.bb
index e9491a74bd..c11716731f 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250410.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250509.bb
@@ -1,3 +1,420 @@
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
+# @@ -1022,25 +1022,25 @@
+#  Version: 74.a5e9588b.0
+#  
+#  File: iwlwifi-cc-a0-77.ucode
+# -Version: 74.2753b721.0
+# +Version: 74.f31a351f.0
+#  
+#  File: iwlwifi-Qu-b0-hr-b0-77.ucode
+# -Version: 74.2753b721.0
+# +Version: 74.f31a351f.0
+#  
+#  File: iwlwifi-Qu-b0-jf-b0-77.ucode
+# -Version: 74.2753b721.0
+# +Version: 74.f31a351f.0
+#  
+#  File: iwlwifi-Qu-c0-hr-b0-77.ucode
+# -Version: 74.2753b721.0
+# +Version: 74.f31a351f.0
+#  
+#  File: iwlwifi-Qu-c0-jf-b0-77.ucode
+# -Version: 74.2753b721.0
+# +Version: 74.f31a351f.0
+#  
+#  File: iwlwifi-QuZ-a0-hr-b0-77.ucode
+# -Version: 74.2753b721.0
+# +Version: 74.f31a351f.0
+#  
+#  File: iwlwifi-QuZ-a0-jf-b0-77.ucode
+# -Version: 74.2753b721.0
+# +Version: 74.f31a351f.0
+#  
+#  File: iwlwifi-ty-a0-gf-a0-77.ucode
+#  Version: 74.f92b5fed.0
+# @@ -1064,7 +1064,7 @@
+#  Version: 83.fb5c9aeb.0
+#  
+#  File: iwlwifi-ty-a0-gf-a0-89.ucode
+# -Version: 86.4d42c933.0
+# +Version: 86.7f71c7f4.0
+#  
+#  File: iwlwifi-so-a0-gf4-a0-77.ucode
+#  Version: 74.f92b5fed.0
+# @@ -1088,7 +1088,7 @@
+#  Version: 83.fb5c9aeb.0
+#  
+#  File: iwlwifi-so-a0-gf4-a0-89.ucode
+# -Version: 86.4d42c933.0
+# +Version: 86.7f71c7f4.0
+#  
+#  File: iwlwifi-so-a0-gf-a0-77.ucode
+#  Version: 74.f92b5fed.0
+# @@ -1112,7 +1112,7 @@
+#  Version: 83.fb5c9aeb.0
+#  
+#  File: iwlwifi-so-a0-gf-a0-89.ucode
+# -Version: 86.4d42c933.0
+# +Version: 86.7f71c7f4.0
+#  
+#  File: iwlwifi-so-a0-hr-b0-77.ucode
+#  Version: 74.f92b5fed.0
+# @@ -1133,13 +1133,21 @@
+#  Version: 83.fb5c9aeb.0
+#  
+#  File: iwlwifi-so-a0-hr-b0-89.ucode
+# -Version: 86.4d42c933.0
+# +Version: 86.7f71c7f4.0
+#  
+#  File: iwlwifi-so-a0-jf-b0-77.ucode
+#  Version: 74.f92b5fed.0
+#  
+#  File: iwlwifi-ty-a0-gf-a0.pnvm
+#  
+# +File: iwlwifi-bz-b0-hr-b0-96.ucode
+# +Version: 93.44729d4e.0
+# +
+# +File: iwlwifi-bz-b0-hr-b0-98.ucode
+# +Version: 95.d661c37c.0
+# +
+# +File: iwlwifi-bz-b0-hr-b0.pnvm
+# +
+#  File: iwlwifi-bz-b0-gf-a0-92.ucode
+#  Version: 89.7541f516.0
+#  
+# @@ -1152,6 +1160,9 @@
+#  File: iwlwifi-bz-b0-gf-a0-97.ucode
+#  Version: 94.8049d69b.0
+#  
+# +File: iwlwifi-bz-b0-gf-a0-98.ucode
+# +Version: 95.d661c37c.0
+# +
+#  File: iwlwifi-bz-b0-gf-a0.pnvm
+#  
+#  File: iwlwifi-gl-c0-fm-c0-83.ucode
+# @@ -1175,6 +1186,9 @@
+#  File: iwlwifi-gl-c0-fm-c0-97.ucode
+#  Version: 94.8049d69b.0
+#  
+# +File: iwlwifi-gl-c0-fm-c0-98.ucode
+# +Version: 95.d661c37c.0
+# +
+#  File: iwlwifi-gl-c0-fm-c0.pnvm
+#  
+#  File: iwlwifi-bz-b0-fm-c0-92.ucode
+# @@ -1192,6 +1206,9 @@
+#  File: iwlwifi-bz-b0-fm-c0-97.ucode
+#  Version: 94.8049d69b.0
+#  
+# +File: iwlwifi-bz-b0-fm-c0-98.ucode
+# +Version: 95.d661c37c.0
+# +
+#  File: iwlwifi-bz-b0-fm-c0.pnvm
+#  
+#  File: iwlwifi-ma-b0-gf-a0-83.ucode
+# @@ -1201,7 +1218,7 @@
+#  Version: 83.fb5c9aeb.0
+#  
+#  File: iwlwifi-ma-b0-gf-a0-89.ucode
+# -Version: 86.4d42c933.0
+# +Version: 86.7f71c7f4.0
+#  
+#  File: iwlwifi-ma-b0-gf-a0.pnvm
+#  
+# @@ -1212,7 +1229,7 @@
+#  Version: 83.fb5c9aeb.0
+#  
+#  File: iwlwifi-ma-b0-gf4-a0-89.ucode
+# -Version: 86.4d42c933.0
+# +Version: 86.7f71c7f4.0
+#  
+#  File: iwlwifi-ma-b0-gf4-a0.pnvm
+#  
+# @@ -1223,7 +1240,7 @@
+#  Version: 83.fb5c9aeb.0
+#  
+#  File: iwlwifi-ma-b0-hr-b0-89.ucode
+# -Version: 86.4d42c933.0
+# +Version: 86.7f71c7f4.0
+#  
+#  Licence: Redistributable. See LICENCE.iwlwifi_firmware for details
+#  
+# @@ -2765,6 +2782,8 @@
+#  
+#  File: amdtee/773bd96f-b83f-4d52-b12dc529b13d8543.bin
+#  Link: amdtee/amd_pmf_v3.bin -> 773bd96f-b83f-4d52-b12dc529b13d8543.bin
+# +File: amdtee/f29bb3d9-bd66-5441-afb88acc2b2b60d6.bin
+# +Link: amdtee/amd_pmf_v3_1.bin -> f29bb3d9-bd66-5441-afb88acc2b2b60d6.bin
+#  
+#  Licence: Redistributable. See LICENSE.amd_pmf for details.
+#  
+# @@ -3055,6 +3074,7 @@
+#  Link: brcm/brcmfmac43455-sdio.Raspberry\ Pi\ Foundation-Raspberry\ Pi\ 4\ Model\ B.txt -> brcmfmac43455-sdio.raspberrypi,4-model-b.txt
+#  Link: brcm/brcmfmac43455-sdio.Raspberry\ Pi\ Foundation-Raspberry\ Pi\ Compute\ Module\ 4.txt -> brcmfmac43455-sdio.raspberrypi,4-model-b.txt
+#  File: "brcm/brcmfmac43455-sdio.MINIX-NEO Z83-4.txt"
+# +File: "brcm/brcmfmac43455-sdio.Radxa-ROCK Pi X.txt"
+#  File: "brcm/brcmfmac4356-pcie.gpd-win-pocket.txt"
+#  File: "brcm/brcmfmac4356-pcie.Intel Corporation-CHERRYVIEW D1 PLATFORM.txt"
+#  File: "brcm/brcmfmac4356-pcie.Xiaomi Inc-Mipad2.txt"
+# @@ -3435,6 +3455,7 @@
+#  File: rtw89/rtw8852bt_fw.bin
+#  File: rtw89/rtw8852c_fw.bin
+#  File: rtw89/rtw8852c_fw-1.bin
+# +File: rtw89/rtw8852c_fw-2.bin
+#  File: rtw89/rtw8922a_fw.bin
+#  File: rtw89/rtw8922a_fw-1.bin
+#  File: rtw89/rtw8922a_fw-2.bin
+# @@ -3908,7 +3929,7 @@
+#  File: ath11k/IPQ5018/hw1.0/q6_fw.b14
+#  File: ath11k/IPQ5018/hw1.0/q6_fw.flist
+#  File: ath11k/IPQ5018/hw1.0/q6_fw.mdt
+# -Version: WLAN.HK.2.6.0.1-01291-QCAHKSWPL_SILICONZ-1
+# +Version: WLAN.HK.2.6.0.1-01300-QCAHKSWPL_SILICONZ-1
+#  File: ath11k/IPQ5018/hw1.0/Notice.txt
+#  File: ath11k/QCA2066/hw2.1/board-2.bin
+#  File: ath11k/QCA2066/hw2.1/amss.bin
+# @@ -3937,7 +3958,7 @@
+#  File: ath12k/WCN7850/hw2.0/board-2.bin
+#  File: ath12k/WCN7850/hw2.0/amss.bin
+#  File: ath12k/WCN7850/hw2.0/m3.bin
+# -Version: WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
+# +Version: WLAN.HMT.1.1.c5-00284-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
+#  File: ath12k/WCN7850/hw2.0/Notice.txt
+#  File: ath12k/QCN9274/hw2.0/board-2.bin
+#  File: ath12k/QCN9274/hw2.0/firmware-2.bin
+# @@ -5234,7 +5255,7 @@
+#  Version: GuC API/APB ver 70.1.1 for Tigerlake
+#  
+#  File: i915/tgl_guc_70.bin
+# -Version: GuC API/APB ver 70.36.0 for Tigerlake
+# +Version: GuC API/APB ver 70.44.1 for Tigerlake
+#  
+#  File: i915/tgl_huc_7.0.3.bin
+#  Version: Huc API/APB ver 7 release 0 for Tigerlake
+# @@ -5273,7 +5294,7 @@
+#  Version: GuC API/APB ver 70.1.1 for DG1
+#  
+#  File: i915/dg1_guc_70.bin
+# -Version: GuC API/APB ver 70.36.0 for DG1
+# +Version: GuC API/APB ver 70.44.1 for DG1
+#  
+#  File: i915/dg1_huc_7.7.1.bin
+#  Version: Huc API/APB ver 7 release 1 for DG1
+# @@ -5315,7 +5336,7 @@
+#  Version: GuC API/APB ver 70.1.1 for Alderlake P
+#  
+#  File: i915/adlp_guc_70.bin
+# -Version: GuC API/APB ver 70.36.0 for Alderlake P
+# +Version: GuC API/APB ver 70.44.1 for Alderlake P
+#  
+#  File: i915/dg2_guc_70.1.2.bin
+#  Version: GuC API/APB ver 70.1.2 for DG2
+# @@ -5324,7 +5345,7 @@
+#  Version: GuC API/APB ver 70.4.1 for DG2
+#  
+#  File: i915/dg2_guc_70.bin
+# -Version: GuC API/APB ver 70.36.0 for DG2
+# +Version: GuC API/APB ver 70.44.1 for DG2
+#  
+#  File: i915/dg2_huc_gsc.bin
+#  Version: HuC API/APB ver 7.10.16 for DG2
+# @@ -5345,7 +5366,7 @@
+#  Version: DMC API/APB ver 2 release 23 for Meteorlake
+#  
+#  File: i915/mtl_guc_70.bin
+# -Version: GuC API/APB ver 70.36.0 for Meteorlake
+# +Version: GuC API/APB ver 70.44.1 for Meteorlake
+#  
+#  File: i915/mtl_huc_gsc.bin
+#  Version: HuC API/APB ver 8.5.4 for Meteorlake
+# @@ -5360,7 +5381,7 @@
+#  Version: DMC API/APB ver 2 release 28 for Xe2LPD
+#  
+#  File: i915/xe3lpd_dmc.bin
+# -Version: DMC API/APB ver 2 release 20 for Xe3LPD
+# +Version: DMC API/APB ver 2 release 23 for Xe3LPD
+#  
+#  License: Redistributable. See LICENSE.i915 for details
+#  --------------------------------------------------------------------------
+# @@ -5371,13 +5392,13 @@
+#  Version: GSC API/APB v1.0, release 104.0.0.1263, SVN 1 for Lunarlake
+#  
+#  File: xe/lnl_guc_70.bin
+# -Version: GuC API/APB ver 70.40.2 for Lunarlake
+# +Version: GuC API/APB ver 70.44.1 for Lunarlake
+#  
+#  File: xe/lnl_huc.bin
+#  Version: HuC API/APB ver 9.4.13 for Lunarlake
+#  
+#  File: xe/bmg_guc_70.bin
+# -Version: GuC API/APB ver 70.40.2 for Battlemage
+# +Version: GuC API/APB ver 70.44.1 for Battlemage
+#  
+#  File: xe/bmg_huc.bin
+#  Version: HuC API/APB ver 8.2.10 for Battlemage
+# @@ -6138,9 +6159,9 @@
+#  Driver: mt7925 - MediaTek MT7925 Wireless MACs
+#  
+#  File: mediatek/mt7925/WIFI_MT7925_PATCH_MCU_1_1_hdr.bin
+# -Version: 20250305132908a
+# +Version: 20250425072955a
+#  File: mediatek/mt7925/WIFI_RAM_CODE_MT7925_1_1.bin
+# -Version: 20250305132802
+# +Version: 20250425072801
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -6149,7 +6170,7 @@
+#  Driver: mt7925 - MediaTek MT7925 bluetooth chipset
+#  
+#  File: mediatek/mt7925/BT_RAM_CODE_MT7925_1_1_hdr.bin
+# -Version: 20250305133215
+# +Version: 20250425073330
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -6399,6 +6420,14 @@
+#  
+#  Version: VIDEO.VPU.3.1-0074
+#  
+# +File: qcom/vpu/vpu30_p4_s6_16mb.mbn
+# +
+# +Version: VIDEO.VPU.3.1-0090
+# +
+# +File: qcom/vpu/vpu20_p1_gen2.mbn
+# +
+# +Version: VIDEO.VPU.2.4.2-00025
+# +
+#  Licence: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
+#  
+#  --------------------------------------------------------------------------
+# @@ -6441,6 +6470,7 @@
+#  File: qcom/a660_sqe.fw
+#  File: qcom/qcm6490/a660_zap.mbn
+#  Link: qcom/qcs6490/a660_zap.mbn -> ../qcm6490/a660_zap.mbn
+# +Link: qcom/sm8350/a660_zap.mbn -> ../qcm6490/a660_zap.mbn
+#  File: qcom/a702_sqe.fw
+#  File: qcom/leia_pfp_470.fw
+#  File: qcom/leia_pm4_470.fw
+# @@ -8014,6 +8044,12 @@
+#  Link: cirrus/cs35l56-b0-dsp1-misc-10431024-spkid1.wmfw -> cs35l56/CS35L56_Rev3.11.16.wmfw
+#  Link: cirrus/cs35l56-b0-dsp1-misc-10431024-spkid1-amp1.bin -> cs35l56-b0-dsp1-misc-10431044-spkid1-amp1.bin
+#  Link: cirrus/cs35l56-b0-dsp1-misc-10431024-spkid1-amp2.bin -> cs35l56-b0-dsp1-misc-10431044-spkid1-amp2.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-10431034-spkid0.wmfw -> cs35l56/CS35L56_Rev3.11.16.wmfw
+# +File: cirrus/cs35l56-b0-dsp1-misc-10431034-spkid0-amp1.bin
+# +File: cirrus/cs35l56-b0-dsp1-misc-10431034-spkid0-amp2.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-10431034-spkid1.wmfw -> cs35l56/CS35L56_Rev3.11.16.wmfw
+# +File: cirrus/cs35l56-b0-dsp1-misc-10431034-spkid1-amp1.bin
+# +File: cirrus/cs35l56-b0-dsp1-misc-10431034-spkid1-amp2.bin
+#  Link: cirrus/cs35l56-b0-dsp1-misc-10431044-spkid0.wmfw -> cs35l56/CS35L56_Rev3.11.16.wmfw
+#  File: cirrus/cs35l56-b0-dsp1-misc-10431044-spkid0-amp1.bin
+#  File: cirrus/cs35l56-b0-dsp1-misc-10431044-spkid0-amp2.bin
+# @@ -8025,6 +8061,12 @@
+#  Link: cirrus/cs35l56-b0-dsp1-misc-10431264-amp2.bin -> cs35l56-b0-dsp1-misc-10431df3-amp2.bin
+#  Link: cirrus/cs35l56-b0-dsp1-misc-10431264-amp3.bin -> cs35l56-b0-dsp1-misc-10431df3-amp3.bin
+#  Link: cirrus/cs35l56-b0-dsp1-misc-10431264-amp4.bin -> cs35l56-b0-dsp1-misc-10431df3-amp4.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-10431314-spkid0.wmfw -> cs35l56/CS35L56_Rev3.11.16.wmfw
+# +Link: cirrus/cs35l56-b0-dsp1-misc-10431314-spkid0-amp1.bin -> cs35l56-b0-dsp1-misc-10431034-spkid0-amp1.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-10431314-spkid0-amp2.bin -> cs35l56-b0-dsp1-misc-10431034-spkid0-amp2.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-10431314-spkid1.wmfw -> cs35l56/CS35L56_Rev3.11.16.wmfw
+# +Link: cirrus/cs35l56-b0-dsp1-misc-10431314-spkid1-amp1.bin -> cs35l56-b0-dsp1-misc-10431034-spkid1-amp1.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-10431314-spkid1-amp2.bin -> cs35l56-b0-dsp1-misc-10431034-spkid1-amp2.bin
+#  Link: cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid0.wmfw -> cs35l56/CS35L56_Rev3.11.16.wmfw
+#  File: cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid0-amp1.bin
+#  File: cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid0-amp2.bin
+# @@ -8109,15 +8151,31 @@
+#  Link: cirrus/cs35l56-b0-dsp1-misc-17aa3911-spkid0.wmfw -> cs35l56/CS35L56_Rev3.11.18.wmfw
+#  File: cirrus/cs35l56-b0-dsp1-misc-17aa3911-spkid0-amp1.bin
+#  File: cirrus/cs35l56-b0-dsp1-misc-17aa3911-spkid0-amp2.bin
+# -Link: cirrus/cs35l56-b0-dsp1-misc-17aa391b-spkid0.wmfw -> cs35l56/CS35L56_Rev3.11.21.wmfw
+# -File: cirrus/cs35l56-b0-dsp1-misc-17aa391b-spkid0-amp1.bin
+# -File: cirrus/cs35l56-b0-dsp1-misc-17aa391b-spkid0-amp2.bin
+# -Link: cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid1.wmfw -> cs35l56/CS35L56_Rev3.11.21.wmfw
+# -File: cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid1-amp1.bin
+# -File: cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid1-amp2.bin
+# -Link: cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid0.wmfw -> cs35l56/CS35L56_Rev3.11.21.wmfw
+# -File: cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid0-amp1.bin
+# -File: cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid0-amp2.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-17aa391b.wmfw -> cs35l56/CS35L56_Rev3.11.21.wmfw
+# +File: cirrus/cs35l56-b0-dsp1-misc-17aa391b-amp1.bin
+# +File: cirrus/cs35l56-b0-dsp1-misc-17aa391b-amp2.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid0.wmfw -> cs35l56/CS35L56_Rev3.11.21.wmfw
+# +File: cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid0-amp1.bin
+# +File: cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid0-amp2.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid1.wmfw -> cs35l56/CS35L56_Rev3.11.21.wmfw
+# +File: cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp1.bin
+# +File: cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp2.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-17aa392c-spkid1.wmfw -> cs35l56/CS35L56_Rev3.11.21.wmfw
+# +File: cirrus/cs35l56-b0-dsp1-misc-17aa392c-spkid1-amp1.bin
+# +File: cirrus/cs35l56-b0-dsp1-misc-17aa392c-spkid1-amp2.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-17aa392d-spkid0.wmfw -> cs35l56/CS35L56_Rev3.11.21.wmfw
+# +File: cirrus/cs35l56-b0-dsp1-misc-17aa392d-spkid0-amp1.bin
+# +File: cirrus/cs35l56-b0-dsp1-misc-17aa392d-spkid0-amp2.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-17aa392e.wmfw -> cs35l56/CS35L56_Rev3.11.28.wmfw
+# +File: cirrus/cs35l56-b0-dsp1-misc-17aa392e-amp1.bin
+# +File: cirrus/cs35l56-b0-dsp1-misc-17aa392e-amp2.bin
+# +File: cirrus/cs35l56-b0-dsp1-misc-17aa392e-amp3.bin
+# +File: cirrus/cs35l56-b0-dsp1-misc-17aa392e-amp4.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-17aa3932.wmfw -> cs35l56/CS35L56_Rev3.11.28.wmfw
+# +Link: cirrus/cs35l56-b0-dsp1-misc-17aa3932-amp1.bin -> cs35l56-b0-dsp1-misc-17aa392e-amp1.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-17aa3932-amp2.bin -> cs35l56-b0-dsp1-misc-17aa392e-amp2.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-17aa3932-amp3.bin -> cs35l56-b0-dsp1-misc-17aa392e-amp3.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-17aa3932-amp4.bin -> cs35l56-b0-dsp1-misc-17aa392e-amp4.bin
+#  
+#  License: Redistributable. See LICENSE.cirrus for details.
+#  
+# @@ -8412,8 +8470,8 @@
+#  Link: TAS2XXX8DE91.bin -> ti/tas2781/TAS2XXX8DE9.bin
+#  Link: TIAS2781RCA2.bin -> ti/tas2781/TIAS2781RCA2.bin
+#  Link: TIAS2781RCA4.bin -> ti/tas2781/TIAS2781RCA4.bin
+# -Link: TXNW2781RCA0.bin -> ti/tas2781/TXNW2781RCA0.bin
+# -Link: TXNW2781RCA1.bin -> ti/tas2781/TXNW2781RCA1.bin
+# +Link: TXNW2781RCA1.bin -> ti/tas2781/TXNW2781RCA0.bin
+# +Link: TXNW2781RCA0.bin -> ti/tas2781/TXNW2781RCA1.bin
+#  Link: TXNW2781RCA2.bin -> ti/tas2781/TIAS2781RCA2.bin
+#  Link: TXNW2781RCA4.bin -> ti/tas2781/TIAS2781RCA4.bin
+#  
+# @@ -8471,7 +8529,7 @@
+#  File: intel/ish/ish_lnlm.bin
+#  Version: 5.8.0.7716
+#  
+# -License: Redistributable. See LICENCE.ish for details
+# +License: Redistributable. See LICENSE.intel for details
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -8493,3 +8551,19 @@
+#  Link: intel/vpu/vpu_40xx_v0.0.bin -> vpu_40xx_v1.bin
+#  
+#  License: Redistributable. See LICENSE.intel_vpu for details
+# +
+# +--------------------------------------------------------------------------
+# +
+# +Driver: bmi260 - Bosch BMI260 IMU configuration data
+# +File: bmi260-init-data.fw
+# +
+# +License: Redistributable. See LICENSE.bmi260 for details
+# +
+# +Originates from https://source.chromium.org/chromiumos/chromiumos/codesearch/+/main:src/platform/ec/third_party/bmi260/accelgyro_bmi260_config_tbin.h
+# +
+# +---------------------------------------------------------------------------
+# +
+# +Driver: qcs9100 - Qualcomm QUPv3 firmware image file
+# +File: qcom/sa8775p/qupv3fw.elf
+# +
+# +License: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
+# 
+#
+
 SUMMARY = "Firmware files for use with Linux kernel"
 HOMEPAGE = "https://www.kernel.org/"
 DESCRIPTION = "Linux firmware is a package distributed alongside the Linux kernel \
@@ -156,7 +573,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
                     file://wfx/LICENCE.wf200;md5=4d1beff00d902c05c9c7e95a5d8eb52d \
-                    file://WHENCE;md5=${WHENCE_CHKSUM} \
+                    file://WHENCE;md5=d85e2f182f489a235400712cbfdb017a \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
@@ -250,7 +667,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "2ae6aab2d8930fd54bf30ae15498f1625721bc3630b894644db5d21fad5a20f9"
+SRC_URI[sha256sum] = "f2c60d66f226a28130cb5643e6e544d3229673460e127c91ba03f1080cbd703e"
 
 inherit allarch
 
-- 
2.47.1


--===============4378525154724947533==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-linux-firmware-upgrade-20250410-20250509.patch"

RnJvbSA2M2RkNGU2YzNlZjQzYTlkZGU0YTkxZTI0MjhlODJjOTRhZTI1ODM2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgTWF5IDIwMjUgMTE6MTM6NTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aW51eC1maXJtd2FyZTogdXBncmFkZSAyMDI1MDQxMCAtPiAyMDI1MDUwOQoKLS0tCiAuLi4yMDI1
MDQxMC5iYiA9PiBsaW51eC1maXJtd2FyZV8yMDI1MDUwOS5iYn0gfCA0MjEgKysrKysrKysrKysr
KysrKystCiAxIGZpbGUgY2hhbmdlZCwgNDE5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS97bGludXgtZmlybXdh
cmVfMjAyNTA0MTAuYmIgPT4gbGludXgtZmlybXdhcmVfMjAyNTA1MDkuYmJ9ICg4NyUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2Fy
ZV8yMDI1MDQxMC5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgt
ZmlybXdhcmVfMjAyNTA1MDkuYmIKc2ltaWxhcml0eSBpbmRleCA4NyUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZV8yMDI1MDQxMC5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJt
d2FyZV8yMDI1MDUwOS5iYgppbmRleCBlOTQ5MWE3NGJkLi5jMTE3MTY3MzFmIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlXzIwMjUw
NDEwLmJiCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgtZmly
bXdhcmVfMjAyNTA1MDkuYmIKQEAgLTEsMyArMSw0MjAgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklM
RVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4K
KyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRo
ZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlm
IG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3Nh
Z2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0
ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0t
LSBXSEVOQ0UKKyMgKysrIFdIRU5DRQorIyBAQCAtMTAyMiwyNSArMTAyMiwyNSBAQAorIyAgVmVy
c2lvbjogNzQuYTVlOTU4OGIuMAorIyAgCisjICBGaWxlOiBpd2x3aWZpLWNjLWEwLTc3LnVjb2Rl
CisjIC1WZXJzaW9uOiA3NC4yNzUzYjcyMS4wCisjICtWZXJzaW9uOiA3NC5mMzFhMzUxZi4wCisj
ICAKKyMgIEZpbGU6IGl3bHdpZmktUXUtYjAtaHItYjAtNzcudWNvZGUKKyMgLVZlcnNpb246IDc0
LjI3NTNiNzIxLjAKKyMgK1ZlcnNpb246IDc0LmYzMWEzNTFmLjAKKyMgIAorIyAgRmlsZTogaXds
d2lmaS1RdS1iMC1qZi1iMC03Ny51Y29kZQorIyAtVmVyc2lvbjogNzQuMjc1M2I3MjEuMAorIyAr
VmVyc2lvbjogNzQuZjMxYTM1MWYuMAorIyAgCisjICBGaWxlOiBpd2x3aWZpLVF1LWMwLWhyLWIw
LTc3LnVjb2RlCisjIC1WZXJzaW9uOiA3NC4yNzUzYjcyMS4wCisjICtWZXJzaW9uOiA3NC5mMzFh
MzUxZi4wCisjICAKKyMgIEZpbGU6IGl3bHdpZmktUXUtYzAtamYtYjAtNzcudWNvZGUKKyMgLVZl
cnNpb246IDc0LjI3NTNiNzIxLjAKKyMgK1ZlcnNpb246IDc0LmYzMWEzNTFmLjAKKyMgIAorIyAg
RmlsZTogaXdsd2lmaS1RdVotYTAtaHItYjAtNzcudWNvZGUKKyMgLVZlcnNpb246IDc0LjI3NTNi
NzIxLjAKKyMgK1ZlcnNpb246IDc0LmYzMWEzNTFmLjAKKyMgIAorIyAgRmlsZTogaXdsd2lmaS1R
dVotYTAtamYtYjAtNzcudWNvZGUKKyMgLVZlcnNpb246IDc0LjI3NTNiNzIxLjAKKyMgK1ZlcnNp
b246IDc0LmYzMWEzNTFmLjAKKyMgIAorIyAgRmlsZTogaXdsd2lmaS10eS1hMC1nZi1hMC03Ny51
Y29kZQorIyAgVmVyc2lvbjogNzQuZjkyYjVmZWQuMAorIyBAQCAtMTA2NCw3ICsxMDY0LDcgQEAK
KyMgIFZlcnNpb246IDgzLmZiNWM5YWViLjAKKyMgIAorIyAgRmlsZTogaXdsd2lmaS10eS1hMC1n
Zi1hMC04OS51Y29kZQorIyAtVmVyc2lvbjogODYuNGQ0MmM5MzMuMAorIyArVmVyc2lvbjogODYu
N2Y3MWM3ZjQuMAorIyAgCisjICBGaWxlOiBpd2x3aWZpLXNvLWEwLWdmNC1hMC03Ny51Y29kZQor
IyAgVmVyc2lvbjogNzQuZjkyYjVmZWQuMAorIyBAQCAtMTA4OCw3ICsxMDg4LDcgQEAKKyMgIFZl
cnNpb246IDgzLmZiNWM5YWViLjAKKyMgIAorIyAgRmlsZTogaXdsd2lmaS1zby1hMC1nZjQtYTAt
ODkudWNvZGUKKyMgLVZlcnNpb246IDg2LjRkNDJjOTMzLjAKKyMgK1ZlcnNpb246IDg2LjdmNzFj
N2Y0LjAKKyMgIAorIyAgRmlsZTogaXdsd2lmaS1zby1hMC1nZi1hMC03Ny51Y29kZQorIyAgVmVy
c2lvbjogNzQuZjkyYjVmZWQuMAorIyBAQCAtMTExMiw3ICsxMTEyLDcgQEAKKyMgIFZlcnNpb246
IDgzLmZiNWM5YWViLjAKKyMgIAorIyAgRmlsZTogaXdsd2lmaS1zby1hMC1nZi1hMC04OS51Y29k
ZQorIyAtVmVyc2lvbjogODYuNGQ0MmM5MzMuMAorIyArVmVyc2lvbjogODYuN2Y3MWM3ZjQuMAor
IyAgCisjICBGaWxlOiBpd2x3aWZpLXNvLWEwLWhyLWIwLTc3LnVjb2RlCisjICBWZXJzaW9uOiA3
NC5mOTJiNWZlZC4wCisjIEBAIC0xMTMzLDEzICsxMTMzLDIxIEBACisjICBWZXJzaW9uOiA4My5m
YjVjOWFlYi4wCisjICAKKyMgIEZpbGU6IGl3bHdpZmktc28tYTAtaHItYjAtODkudWNvZGUKKyMg
LVZlcnNpb246IDg2LjRkNDJjOTMzLjAKKyMgK1ZlcnNpb246IDg2LjdmNzFjN2Y0LjAKKyMgIAor
IyAgRmlsZTogaXdsd2lmaS1zby1hMC1qZi1iMC03Ny51Y29kZQorIyAgVmVyc2lvbjogNzQuZjky
YjVmZWQuMAorIyAgCisjICBGaWxlOiBpd2x3aWZpLXR5LWEwLWdmLWEwLnBudm0KKyMgIAorIyAr
RmlsZTogaXdsd2lmaS1iei1iMC1oci1iMC05Ni51Y29kZQorIyArVmVyc2lvbjogOTMuNDQ3Mjlk
NGUuMAorIyArCisjICtGaWxlOiBpd2x3aWZpLWJ6LWIwLWhyLWIwLTk4LnVjb2RlCisjICtWZXJz
aW9uOiA5NS5kNjYxYzM3Yy4wCisjICsKKyMgK0ZpbGU6IGl3bHdpZmktYnotYjAtaHItYjAucG52
bQorIyArCisjICBGaWxlOiBpd2x3aWZpLWJ6LWIwLWdmLWEwLTkyLnVjb2RlCisjICBWZXJzaW9u
OiA4OS43NTQxZjUxNi4wCisjICAKKyMgQEAgLTExNTIsNiArMTE2MCw5IEBACisjICBGaWxlOiBp
d2x3aWZpLWJ6LWIwLWdmLWEwLTk3LnVjb2RlCisjICBWZXJzaW9uOiA5NC44MDQ5ZDY5Yi4wCisj
ICAKKyMgK0ZpbGU6IGl3bHdpZmktYnotYjAtZ2YtYTAtOTgudWNvZGUKKyMgK1ZlcnNpb246IDk1
LmQ2NjFjMzdjLjAKKyMgKworIyAgRmlsZTogaXdsd2lmaS1iei1iMC1nZi1hMC5wbnZtCisjICAK
KyMgIEZpbGU6IGl3bHdpZmktZ2wtYzAtZm0tYzAtODMudWNvZGUKKyMgQEAgLTExNzUsNiArMTE4
Niw5IEBACisjICBGaWxlOiBpd2x3aWZpLWdsLWMwLWZtLWMwLTk3LnVjb2RlCisjICBWZXJzaW9u
OiA5NC44MDQ5ZDY5Yi4wCisjICAKKyMgK0ZpbGU6IGl3bHdpZmktZ2wtYzAtZm0tYzAtOTgudWNv
ZGUKKyMgK1ZlcnNpb246IDk1LmQ2NjFjMzdjLjAKKyMgKworIyAgRmlsZTogaXdsd2lmaS1nbC1j
MC1mbS1jMC5wbnZtCisjICAKKyMgIEZpbGU6IGl3bHdpZmktYnotYjAtZm0tYzAtOTIudWNvZGUK
KyMgQEAgLTExOTIsNiArMTIwNiw5IEBACisjICBGaWxlOiBpd2x3aWZpLWJ6LWIwLWZtLWMwLTk3
LnVjb2RlCisjICBWZXJzaW9uOiA5NC44MDQ5ZDY5Yi4wCisjICAKKyMgK0ZpbGU6IGl3bHdpZmkt
YnotYjAtZm0tYzAtOTgudWNvZGUKKyMgK1ZlcnNpb246IDk1LmQ2NjFjMzdjLjAKKyMgKworIyAg
RmlsZTogaXdsd2lmaS1iei1iMC1mbS1jMC5wbnZtCisjICAKKyMgIEZpbGU6IGl3bHdpZmktbWEt
YjAtZ2YtYTAtODMudWNvZGUKKyMgQEAgLTEyMDEsNyArMTIxOCw3IEBACisjICBWZXJzaW9uOiA4
My5mYjVjOWFlYi4wCisjICAKKyMgIEZpbGU6IGl3bHdpZmktbWEtYjAtZ2YtYTAtODkudWNvZGUK
KyMgLVZlcnNpb246IDg2LjRkNDJjOTMzLjAKKyMgK1ZlcnNpb246IDg2LjdmNzFjN2Y0LjAKKyMg
IAorIyAgRmlsZTogaXdsd2lmaS1tYS1iMC1nZi1hMC5wbnZtCisjICAKKyMgQEAgLTEyMTIsNyAr
MTIyOSw3IEBACisjICBWZXJzaW9uOiA4My5mYjVjOWFlYi4wCisjICAKKyMgIEZpbGU6IGl3bHdp
ZmktbWEtYjAtZ2Y0LWEwLTg5LnVjb2RlCisjIC1WZXJzaW9uOiA4Ni40ZDQyYzkzMy4wCisjICtW
ZXJzaW9uOiA4Ni43ZjcxYzdmNC4wCisjICAKKyMgIEZpbGU6IGl3bHdpZmktbWEtYjAtZ2Y0LWEw
LnBudm0KKyMgIAorIyBAQCAtMTIyMyw3ICsxMjQwLDcgQEAKKyMgIFZlcnNpb246IDgzLmZiNWM5
YWViLjAKKyMgIAorIyAgRmlsZTogaXdsd2lmaS1tYS1iMC1oci1iMC04OS51Y29kZQorIyAtVmVy
c2lvbjogODYuNGQ0MmM5MzMuMAorIyArVmVyc2lvbjogODYuN2Y3MWM3ZjQuMAorIyAgCisjICBM
aWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLml3bHdpZmlfZmlybXdhcmUgZm9y
IGRldGFpbHMKKyMgIAorIyBAQCAtMjc2NSw2ICsyNzgyLDggQEAKKyMgIAorIyAgRmlsZTogYW1k
dGVlLzc3M2JkOTZmLWI4M2YtNGQ1Mi1iMTJkYzUyOWIxM2Q4NTQzLmJpbgorIyAgTGluazogYW1k
dGVlL2FtZF9wbWZfdjMuYmluIC0+IDc3M2JkOTZmLWI4M2YtNGQ1Mi1iMTJkYzUyOWIxM2Q4NTQz
LmJpbgorIyArRmlsZTogYW1kdGVlL2YyOWJiM2Q5LWJkNjYtNTQ0MS1hZmI4OGFjYzJiMmI2MGQ2
LmJpbgorIyArTGluazogYW1kdGVlL2FtZF9wbWZfdjNfMS5iaW4gLT4gZjI5YmIzZDktYmQ2Ni01
NDQxLWFmYjg4YWNjMmIyYjYwZDYuYmluCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJs
ZS4gU2VlIExJQ0VOU0UuYW1kX3BtZiBmb3IgZGV0YWlscy4KKyMgIAorIyBAQCAtMzA1NSw2ICsz
MDc0LDcgQEAKKyMgIExpbms6IGJyY20vYnJjbWZtYWM0MzQ1NS1zZGlvLlJhc3BiZXJyeVwgUGlc
IEZvdW5kYXRpb24tUmFzcGJlcnJ5XCBQaVwgNFwgTW9kZWxcIEIudHh0IC0+IGJyY21mbWFjNDM0
NTUtc2Rpby5yYXNwYmVycnlwaSw0LW1vZGVsLWIudHh0CisjICBMaW5rOiBicmNtL2JyY21mbWFj
NDM0NTUtc2Rpby5SYXNwYmVycnlcIFBpXCBGb3VuZGF0aW9uLVJhc3BiZXJyeVwgUGlcIENvbXB1
dGVcIE1vZHVsZVwgNC50eHQgLT4gYnJjbWZtYWM0MzQ1NS1zZGlvLnJhc3BiZXJyeXBpLDQtbW9k
ZWwtYi50eHQKKyMgIEZpbGU6ICJicmNtL2JyY21mbWFjNDM0NTUtc2Rpby5NSU5JWC1ORU8gWjgz
LTQudHh0IgorIyArRmlsZTogImJyY20vYnJjbWZtYWM0MzQ1NS1zZGlvLlJhZHhhLVJPQ0sgUGkg
WC50eHQiCisjICBGaWxlOiAiYnJjbS9icmNtZm1hYzQzNTYtcGNpZS5ncGQtd2luLXBvY2tldC50
eHQiCisjICBGaWxlOiAiYnJjbS9icmNtZm1hYzQzNTYtcGNpZS5JbnRlbCBDb3Jwb3JhdGlvbi1D
SEVSUllWSUVXIEQxIFBMQVRGT1JNLnR4dCIKKyMgIEZpbGU6ICJicmNtL2JyY21mbWFjNDM1Ni1w
Y2llLlhpYW9taSBJbmMtTWlwYWQyLnR4dCIKKyMgQEAgLTM0MzUsNiArMzQ1NSw3IEBACisjICBG
aWxlOiBydHc4OS9ydHc4ODUyYnRfZncuYmluCisjICBGaWxlOiBydHc4OS9ydHc4ODUyY19mdy5i
aW4KKyMgIEZpbGU6IHJ0dzg5L3J0dzg4NTJjX2Z3LTEuYmluCisjICtGaWxlOiBydHc4OS9ydHc4
ODUyY19mdy0yLmJpbgorIyAgRmlsZTogcnR3ODkvcnR3ODkyMmFfZncuYmluCisjICBGaWxlOiBy
dHc4OS9ydHc4OTIyYV9mdy0xLmJpbgorIyAgRmlsZTogcnR3ODkvcnR3ODkyMmFfZnctMi5iaW4K
KyMgQEAgLTM5MDgsNyArMzkyOSw3IEBACisjICBGaWxlOiBhdGgxMWsvSVBRNTAxOC9odzEuMC9x
Nl9mdy5iMTQKKyMgIEZpbGU6IGF0aDExay9JUFE1MDE4L2h3MS4wL3E2X2Z3LmZsaXN0CisjICBG
aWxlOiBhdGgxMWsvSVBRNTAxOC9odzEuMC9xNl9mdy5tZHQKKyMgLVZlcnNpb246IFdMQU4uSEsu
Mi42LjAuMS0wMTI5MS1RQ0FIS1NXUExfU0lMSUNPTlotMQorIyArVmVyc2lvbjogV0xBTi5ISy4y
LjYuMC4xLTAxMzAwLVFDQUhLU1dQTF9TSUxJQ09OWi0xCisjICBGaWxlOiBhdGgxMWsvSVBRNTAx
OC9odzEuMC9Ob3RpY2UudHh0CisjICBGaWxlOiBhdGgxMWsvUUNBMjA2Ni9odzIuMS9ib2FyZC0y
LmJpbgorIyAgRmlsZTogYXRoMTFrL1FDQTIwNjYvaHcyLjEvYW1zcy5iaW4KKyMgQEAgLTM5Mzcs
NyArMzk1OCw3IEBACisjICBGaWxlOiBhdGgxMmsvV0NONzg1MC9odzIuMC9ib2FyZC0yLmJpbgor
IyAgRmlsZTogYXRoMTJrL1dDTjc4NTAvaHcyLjAvYW1zcy5iaW4KKyMgIEZpbGU6IGF0aDEyay9X
Q043ODUwL2h3Mi4wL20zLmJpbgorIyAtVmVyc2lvbjogV0xBTi5ITVQuMS4wLmM1LTAwNDgxLVFD
QUhNVFNXUExfVjEuMF9WMi4wX1NJTElDT05aLTMKKyMgK1ZlcnNpb246IFdMQU4uSE1ULjEuMS5j
NS0wMDI4NC1RQ0FITVRTV1BMX1YxLjBfVjIuMF9TSUxJQ09OWi0zCisjICBGaWxlOiBhdGgxMmsv
V0NONzg1MC9odzIuMC9Ob3RpY2UudHh0CisjICBGaWxlOiBhdGgxMmsvUUNOOTI3NC9odzIuMC9i
b2FyZC0yLmJpbgorIyAgRmlsZTogYXRoMTJrL1FDTjkyNzQvaHcyLjAvZmlybXdhcmUtMi5iaW4K
KyMgQEAgLTUyMzQsNyArNTI1NSw3IEBACisjICBWZXJzaW9uOiBHdUMgQVBJL0FQQiB2ZXIgNzAu
MS4xIGZvciBUaWdlcmxha2UKKyMgIAorIyAgRmlsZTogaTkxNS90Z2xfZ3VjXzcwLmJpbgorIyAt
VmVyc2lvbjogR3VDIEFQSS9BUEIgdmVyIDcwLjM2LjAgZm9yIFRpZ2VybGFrZQorIyArVmVyc2lv
bjogR3VDIEFQSS9BUEIgdmVyIDcwLjQ0LjEgZm9yIFRpZ2VybGFrZQorIyAgCisjICBGaWxlOiBp
OTE1L3RnbF9odWNfNy4wLjMuYmluCisjICBWZXJzaW9uOiBIdWMgQVBJL0FQQiB2ZXIgNyByZWxl
YXNlIDAgZm9yIFRpZ2VybGFrZQorIyBAQCAtNTI3Myw3ICs1Mjk0LDcgQEAKKyMgIFZlcnNpb246
IEd1QyBBUEkvQVBCIHZlciA3MC4xLjEgZm9yIERHMQorIyAgCisjICBGaWxlOiBpOTE1L2RnMV9n
dWNfNzAuYmluCisjIC1WZXJzaW9uOiBHdUMgQVBJL0FQQiB2ZXIgNzAuMzYuMCBmb3IgREcxCisj
ICtWZXJzaW9uOiBHdUMgQVBJL0FQQiB2ZXIgNzAuNDQuMSBmb3IgREcxCisjICAKKyMgIEZpbGU6
IGk5MTUvZGcxX2h1Y183LjcuMS5iaW4KKyMgIFZlcnNpb246IEh1YyBBUEkvQVBCIHZlciA3IHJl
bGVhc2UgMSBmb3IgREcxCisjIEBAIC01MzE1LDcgKzUzMzYsNyBAQAorIyAgVmVyc2lvbjogR3VD
IEFQSS9BUEIgdmVyIDcwLjEuMSBmb3IgQWxkZXJsYWtlIFAKKyMgIAorIyAgRmlsZTogaTkxNS9h
ZGxwX2d1Y183MC5iaW4KKyMgLVZlcnNpb246IEd1QyBBUEkvQVBCIHZlciA3MC4zNi4wIGZvciBB
bGRlcmxha2UgUAorIyArVmVyc2lvbjogR3VDIEFQSS9BUEIgdmVyIDcwLjQ0LjEgZm9yIEFsZGVy
bGFrZSBQCisjICAKKyMgIEZpbGU6IGk5MTUvZGcyX2d1Y183MC4xLjIuYmluCisjICBWZXJzaW9u
OiBHdUMgQVBJL0FQQiB2ZXIgNzAuMS4yIGZvciBERzIKKyMgQEAgLTUzMjQsNyArNTM0NSw3IEBA
CisjICBWZXJzaW9uOiBHdUMgQVBJL0FQQiB2ZXIgNzAuNC4xIGZvciBERzIKKyMgIAorIyAgRmls
ZTogaTkxNS9kZzJfZ3VjXzcwLmJpbgorIyAtVmVyc2lvbjogR3VDIEFQSS9BUEIgdmVyIDcwLjM2
LjAgZm9yIERHMgorIyArVmVyc2lvbjogR3VDIEFQSS9BUEIgdmVyIDcwLjQ0LjEgZm9yIERHMgor
IyAgCisjICBGaWxlOiBpOTE1L2RnMl9odWNfZ3NjLmJpbgorIyAgVmVyc2lvbjogSHVDIEFQSS9B
UEIgdmVyIDcuMTAuMTYgZm9yIERHMgorIyBAQCAtNTM0NSw3ICs1MzY2LDcgQEAKKyMgIFZlcnNp
b246IERNQyBBUEkvQVBCIHZlciAyIHJlbGVhc2UgMjMgZm9yIE1ldGVvcmxha2UKKyMgIAorIyAg
RmlsZTogaTkxNS9tdGxfZ3VjXzcwLmJpbgorIyAtVmVyc2lvbjogR3VDIEFQSS9BUEIgdmVyIDcw
LjM2LjAgZm9yIE1ldGVvcmxha2UKKyMgK1ZlcnNpb246IEd1QyBBUEkvQVBCIHZlciA3MC40NC4x
IGZvciBNZXRlb3JsYWtlCisjICAKKyMgIEZpbGU6IGk5MTUvbXRsX2h1Y19nc2MuYmluCisjICBW
ZXJzaW9uOiBIdUMgQVBJL0FQQiB2ZXIgOC41LjQgZm9yIE1ldGVvcmxha2UKKyMgQEAgLTUzNjAs
NyArNTM4MSw3IEBACisjICBWZXJzaW9uOiBETUMgQVBJL0FQQiB2ZXIgMiByZWxlYXNlIDI4IGZv
ciBYZTJMUEQKKyMgIAorIyAgRmlsZTogaTkxNS94ZTNscGRfZG1jLmJpbgorIyAtVmVyc2lvbjog
RE1DIEFQSS9BUEIgdmVyIDIgcmVsZWFzZSAyMCBmb3IgWGUzTFBECisjICtWZXJzaW9uOiBETUMg
QVBJL0FQQiB2ZXIgMiByZWxlYXNlIDIzIGZvciBYZTNMUEQKKyMgIAorIyAgTGljZW5zZTogUmVk
aXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5pOTE1IGZvciBkZXRhaWxzCisjICAtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQorIyBAQCAtNTM3MSwxMyArNTM5MiwxMyBAQAorIyAgVmVyc2lvbjogR1NDIEFQSS9B
UEIgdjEuMCwgcmVsZWFzZSAxMDQuMC4wLjEyNjMsIFNWTiAxIGZvciBMdW5hcmxha2UKKyMgIAor
IyAgRmlsZTogeGUvbG5sX2d1Y183MC5iaW4KKyMgLVZlcnNpb246IEd1QyBBUEkvQVBCIHZlciA3
MC40MC4yIGZvciBMdW5hcmxha2UKKyMgK1ZlcnNpb246IEd1QyBBUEkvQVBCIHZlciA3MC40NC4x
IGZvciBMdW5hcmxha2UKKyMgIAorIyAgRmlsZTogeGUvbG5sX2h1Yy5iaW4KKyMgIFZlcnNpb246
IEh1QyBBUEkvQVBCIHZlciA5LjQuMTMgZm9yIEx1bmFybGFrZQorIyAgCisjICBGaWxlOiB4ZS9i
bWdfZ3VjXzcwLmJpbgorIyAtVmVyc2lvbjogR3VDIEFQSS9BUEIgdmVyIDcwLjQwLjIgZm9yIEJh
dHRsZW1hZ2UKKyMgK1ZlcnNpb246IEd1QyBBUEkvQVBCIHZlciA3MC40NC4xIGZvciBCYXR0bGVt
YWdlCisjICAKKyMgIEZpbGU6IHhlL2JtZ19odWMuYmluCisjICBWZXJzaW9uOiBIdUMgQVBJL0FQ
QiB2ZXIgOC4yLjEwIGZvciBCYXR0bGVtYWdlCisjIEBAIC02MTM4LDkgKzYxNTksOSBAQAorIyAg
RHJpdmVyOiBtdDc5MjUgLSBNZWRpYVRlayBNVDc5MjUgV2lyZWxlc3MgTUFDcworIyAgCisjICBG
aWxlOiBtZWRpYXRlay9tdDc5MjUvV0lGSV9NVDc5MjVfUEFUQ0hfTUNVXzFfMV9oZHIuYmluCisj
IC1WZXJzaW9uOiAyMDI1MDMwNTEzMjkwOGEKKyMgK1ZlcnNpb246IDIwMjUwNDI1MDcyOTU1YQor
IyAgRmlsZTogbWVkaWF0ZWsvbXQ3OTI1L1dJRklfUkFNX0NPREVfTVQ3OTI1XzFfMS5iaW4KKyMg
LVZlcnNpb246IDIwMjUwMzA1MTMyODAyCisjICtWZXJzaW9uOiAyMDI1MDQyNTA3MjgwMQorIyAg
CisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLm1lZGlhdGVrIGZvciBk
ZXRhaWxzLgorIyAgCisjIEBAIC02MTQ5LDcgKzYxNzAsNyBAQAorIyAgRHJpdmVyOiBtdDc5MjUg
LSBNZWRpYVRlayBNVDc5MjUgYmx1ZXRvb3RoIGNoaXBzZXQKKyMgIAorIyAgRmlsZTogbWVkaWF0
ZWsvbXQ3OTI1L0JUX1JBTV9DT0RFX01UNzkyNV8xXzFfaGRyLmJpbgorIyAtVmVyc2lvbjogMjAy
NTAzMDUxMzMyMTUKKyMgK1ZlcnNpb246IDIwMjUwNDI1MDczMzMwCisjICAKKyMgIExpY2VuY2U6
IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UubWVkaWF0ZWsgZm9yIGRldGFpbHMuCisjICAK
KyMgQEAgLTYzOTksNiArNjQyMCwxNCBAQAorIyAgCisjICBWZXJzaW9uOiBWSURFTy5WUFUuMy4x
LTAwNzQKKyMgIAorIyArRmlsZTogcWNvbS92cHUvdnB1MzBfcDRfczZfMTZtYi5tYm4KKyMgKwor
IyArVmVyc2lvbjogVklERU8uVlBVLjMuMS0wMDkwCisjICsKKyMgK0ZpbGU6IHFjb20vdnB1L3Zw
dTIwX3AxX2dlbjIubWJuCisjICsKKyMgK1ZlcnNpb246IFZJREVPLlZQVS4yLjQuMi0wMDAyNQor
IyArCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLnFjb20gYW5kIHFj
b20vTk9USUNFLnR4dCBmb3IgZGV0YWlscworIyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyBA
QCAtNjQ0MSw2ICs2NDcwLDcgQEAKKyMgIEZpbGU6IHFjb20vYTY2MF9zcWUuZncKKyMgIEZpbGU6
IHFjb20vcWNtNjQ5MC9hNjYwX3phcC5tYm4KKyMgIExpbms6IHFjb20vcWNzNjQ5MC9hNjYwX3ph
cC5tYm4gLT4gLi4vcWNtNjQ5MC9hNjYwX3phcC5tYm4KKyMgK0xpbms6IHFjb20vc204MzUwL2E2
NjBfemFwLm1ibiAtPiAuLi9xY202NDkwL2E2NjBfemFwLm1ibgorIyAgRmlsZTogcWNvbS9hNzAy
X3NxZS5mdworIyAgRmlsZTogcWNvbS9sZWlhX3BmcF80NzAuZncKKyMgIEZpbGU6IHFjb20vbGVp
YV9wbTRfNDcwLmZ3CisjIEBAIC04MDE0LDYgKzgwNDQsMTIgQEAKKyMgIExpbms6IGNpcnJ1cy9j
czM1bDU2LWIwLWRzcDEtbWlzYy0xMDQzMTAyNC1zcGtpZDEud21mdyAtPiBjczM1bDU2L0NTMzVM
NTZfUmV2My4xMS4xNi53bWZ3CisjICBMaW5rOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2Mt
MTA0MzEwMjQtc3BraWQxLWFtcDEuYmluIC0+IGNzMzVsNTYtYjAtZHNwMS1taXNjLTEwNDMxMDQ0
LXNwa2lkMS1hbXAxLmJpbgorIyAgTGluazogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTEw
NDMxMDI0LXNwa2lkMS1hbXAyLmJpbiAtPiBjczM1bDU2LWIwLWRzcDEtbWlzYy0xMDQzMTA0NC1z
cGtpZDEtYW1wMi5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xMDQz
MTAzNC1zcGtpZDAud21mdyAtPiBjczM1bDU2L0NTMzVMNTZfUmV2My4xMS4xNi53bWZ3CisjICtG
aWxlOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTA0MzEwMzQtc3BraWQwLWFtcDEuYmlu
CisjICtGaWxlOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTA0MzEwMzQtc3BraWQwLWFt
cDIuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTA0MzEwMzQtc3Br
aWQxLndtZncgLT4gY3MzNWw1Ni9DUzM1TDU2X1JldjMuMTEuMTYud21mdworIyArRmlsZTogY2ly
cnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTEwNDMxMDM0LXNwa2lkMS1hbXAxLmJpbgorIyArRmls
ZTogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTEwNDMxMDM0LXNwa2lkMS1hbXAyLmJpbgor
IyAgTGluazogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTEwNDMxMDQ0LXNwa2lkMC53bWZ3
IC0+IGNzMzVsNTYvQ1MzNUw1Nl9SZXYzLjExLjE2LndtZncKKyMgIEZpbGU6IGNpcnJ1cy9jczM1
bDU2LWIwLWRzcDEtbWlzYy0xMDQzMTA0NC1zcGtpZDAtYW1wMS5iaW4KKyMgIEZpbGU6IGNpcnJ1
cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xMDQzMTA0NC1zcGtpZDAtYW1wMi5iaW4KKyMgQEAgLTgw
MjUsNiArODA2MSwxMiBAQAorIyAgTGluazogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTEw
NDMxMjY0LWFtcDIuYmluIC0+IGNzMzVsNTYtYjAtZHNwMS1taXNjLTEwNDMxZGYzLWFtcDIuYmlu
CisjICBMaW5rOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTA0MzEyNjQtYW1wMy5iaW4g
LT4gY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTA0MzFkZjMtYW1wMy5iaW4KKyMgIExpbms6IGNpcnJ1
cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xMDQzMTI2NC1hbXA0LmJpbiAtPiBjczM1bDU2LWIwLWRz
cDEtbWlzYy0xMDQzMWRmMy1hbXA0LmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNTYtYjAtZHNw
MS1taXNjLTEwNDMxMzE0LXNwa2lkMC53bWZ3IC0+IGNzMzVsNTYvQ1MzNUw1Nl9SZXYzLjExLjE2
LndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xMDQzMTMxNC1zcGtp
ZDAtYW1wMS5iaW4gLT4gY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTA0MzEwMzQtc3BraWQwLWFtcDEu
YmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTA0MzEzMTQtc3BraWQw
LWFtcDIuYmluIC0+IGNzMzVsNTYtYjAtZHNwMS1taXNjLTEwNDMxMDM0LXNwa2lkMC1hbXAyLmJp
bgorIyArTGluazogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTEwNDMxMzE0LXNwa2lkMS53
bWZ3IC0+IGNzMzVsNTYvQ1MzNUw1Nl9SZXYzLjExLjE2LndtZncKKyMgK0xpbms6IGNpcnJ1cy9j
czM1bDU2LWIwLWRzcDEtbWlzYy0xMDQzMTMxNC1zcGtpZDEtYW1wMS5iaW4gLT4gY3MzNWw1Ni1i
MC1kc3AxLW1pc2MtMTA0MzEwMzQtc3BraWQxLWFtcDEuYmluCisjICtMaW5rOiBjaXJydXMvY3Mz
NWw1Ni1iMC1kc3AxLW1pc2MtMTA0MzEzMTQtc3BraWQxLWFtcDIuYmluIC0+IGNzMzVsNTYtYjAt
ZHNwMS1taXNjLTEwNDMxMDM0LXNwa2lkMS1hbXAyLmJpbgorIyAgTGluazogY2lycnVzL2NzMzVs
NTYtYjAtZHNwMS1taXNjLTEwNDMxYjEzLXNwa2lkMC53bWZ3IC0+IGNzMzVsNTYvQ1MzNUw1Nl9S
ZXYzLjExLjE2LndtZncKKyMgIEZpbGU6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xMDQz
MWIxMy1zcGtpZDAtYW1wMS5iaW4KKyMgIEZpbGU6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlz
Yy0xMDQzMWIxMy1zcGtpZDAtYW1wMi5iaW4KKyMgQEAgLTgxMDksMTUgKzgxNTEsMzEgQEAKKyMg
IExpbms6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xN2FhMzkxMS1zcGtpZDAud21mdyAt
PiBjczM1bDU2L0NTMzVMNTZfUmV2My4xMS4xOC53bWZ3CisjICBGaWxlOiBjaXJydXMvY3MzNWw1
Ni1iMC1kc3AxLW1pc2MtMTdhYTM5MTEtc3BraWQwLWFtcDEuYmluCisjICBGaWxlOiBjaXJydXMv
Y3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTdhYTM5MTEtc3BraWQwLWFtcDIuYmluCisjIC1MaW5rOiBj
aXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTdhYTM5MWItc3BraWQwLndtZncgLT4gY3MzNWw1
Ni9DUzM1TDU2X1JldjMuMTEuMjEud21mdworIyAtRmlsZTogY2lycnVzL2NzMzVsNTYtYjAtZHNw
MS1taXNjLTE3YWEzOTFiLXNwa2lkMC1hbXAxLmJpbgorIyAtRmlsZTogY2lycnVzL2NzMzVsNTYt
YjAtZHNwMS1taXNjLTE3YWEzOTFiLXNwa2lkMC1hbXAyLmJpbgorIyAtTGluazogY2lycnVzL2Nz
MzVsNTYtYjAtZHNwMS1taXNjLTE3YWEzOTFlLXNwa2lkMS53bWZ3IC0+IGNzMzVsNTYvQ1MzNUw1
Nl9SZXYzLjExLjIxLndtZncKKyMgLUZpbGU6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0x
N2FhMzkxZS1zcGtpZDEtYW1wMS5iaW4KKyMgLUZpbGU6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEt
bWlzYy0xN2FhMzkxZS1zcGtpZDEtYW1wMi5iaW4KKyMgLUxpbms6IGNpcnJ1cy9jczM1bDU2LWIw
LWRzcDEtbWlzYy0xN2FhMzkyMS1zcGtpZDAud21mdyAtPiBjczM1bDU2L0NTMzVMNTZfUmV2My4x
MS4yMS53bWZ3CisjIC1GaWxlOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTdhYTM5MjEt
c3BraWQwLWFtcDEuYmluCisjIC1GaWxlOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTdh
YTM5MjEtc3BraWQwLWFtcDIuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1p
c2MtMTdhYTM5MWIud21mdyAtPiBjczM1bDU2L0NTMzVMNTZfUmV2My4xMS4yMS53bWZ3CisjICtG
aWxlOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTdhYTM5MWItYW1wMS5iaW4KKyMgK0Zp
bGU6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xN2FhMzkxYi1hbXAyLmJpbgorIyArTGlu
azogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTE3YWEzOTFlLXNwa2lkMC53bWZ3IC0+IGNz
MzVsNTYvQ1MzNUw1Nl9SZXYzLjExLjIxLndtZncKKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDU2LWIw
LWRzcDEtbWlzYy0xN2FhMzkxZS1zcGtpZDAtYW1wMS5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1
bDU2LWIwLWRzcDEtbWlzYy0xN2FhMzkxZS1zcGtpZDAtYW1wMi5iaW4KKyMgK0xpbms6IGNpcnJ1
cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xN2FhMzkyMS1zcGtpZDEud21mdyAtPiBjczM1bDU2L0NT
MzVMNTZfUmV2My4xMS4yMS53bWZ3CisjICtGaWxlOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1p
c2MtMTdhYTM5MjEtc3BraWQxLWFtcDEuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw1Ni1iMC1k
c3AxLW1pc2MtMTdhYTM5MjEtc3BraWQxLWFtcDIuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw1
Ni1iMC1kc3AxLW1pc2MtMTdhYTM5MmMtc3BraWQxLndtZncgLT4gY3MzNWw1Ni9DUzM1TDU2X1Jl
djMuMTEuMjEud21mdworIyArRmlsZTogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTE3YWEz
OTJjLXNwa2lkMS1hbXAxLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNj
LTE3YWEzOTJjLXNwa2lkMS1hbXAyLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNTYtYjAtZHNw
MS1taXNjLTE3YWEzOTJkLXNwa2lkMC53bWZ3IC0+IGNzMzVsNTYvQ1MzNUw1Nl9SZXYzLjExLjIx
LndtZncKKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xN2FhMzkyZC1zcGtp
ZDAtYW1wMS5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xN2FhMzky
ZC1zcGtpZDAtYW1wMi5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0x
N2FhMzkyZS53bWZ3IC0+IGNzMzVsNTYvQ1MzNUw1Nl9SZXYzLjExLjI4LndtZncKKyMgK0ZpbGU6
IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xN2FhMzkyZS1hbXAxLmJpbgorIyArRmlsZTog
Y2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTE3YWEzOTJlLWFtcDIuYmluCisjICtGaWxlOiBj
aXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTdhYTM5MmUtYW1wMy5iaW4KKyMgK0ZpbGU6IGNp
cnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xN2FhMzkyZS1hbXA0LmJpbgorIyArTGluazogY2ly
cnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTE3YWEzOTMyLndtZncgLT4gY3MzNWw1Ni9DUzM1TDU2
X1JldjMuMTEuMjgud21mdworIyArTGluazogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTE3
YWEzOTMyLWFtcDEuYmluIC0+IGNzMzVsNTYtYjAtZHNwMS1taXNjLTE3YWEzOTJlLWFtcDEuYmlu
CisjICtMaW5rOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTdhYTM5MzItYW1wMi5iaW4g
LT4gY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTdhYTM5MmUtYW1wMi5iaW4KKyMgK0xpbms6IGNpcnJ1
cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xN2FhMzkzMi1hbXAzLmJpbiAtPiBjczM1bDU2LWIwLWRz
cDEtbWlzYy0xN2FhMzkyZS1hbXAzLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNTYtYjAtZHNw
MS1taXNjLTE3YWEzOTMyLWFtcDQuYmluIC0+IGNzMzVsNTYtYjAtZHNwMS1taXNjLTE3YWEzOTJl
LWFtcDQuYmluCisjICAKKyMgIExpY2Vuc2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0Uu
Y2lycnVzIGZvciBkZXRhaWxzLgorIyAgCisjIEBAIC04NDEyLDggKzg0NzAsOCBAQAorIyAgTGlu
azogVEFTMlhYWDhERTkxLmJpbiAtPiB0aS90YXMyNzgxL1RBUzJYWFg4REU5LmJpbgorIyAgTGlu
azogVElBUzI3ODFSQ0EyLmJpbiAtPiB0aS90YXMyNzgxL1RJQVMyNzgxUkNBMi5iaW4KKyMgIExp
bms6IFRJQVMyNzgxUkNBNC5iaW4gLT4gdGkvdGFzMjc4MS9USUFTMjc4MVJDQTQuYmluCisjIC1M
aW5rOiBUWE5XMjc4MVJDQTAuYmluIC0+IHRpL3RhczI3ODEvVFhOVzI3ODFSQ0EwLmJpbgorIyAt
TGluazogVFhOVzI3ODFSQ0ExLmJpbiAtPiB0aS90YXMyNzgxL1RYTlcyNzgxUkNBMS5iaW4KKyMg
K0xpbms6IFRYTlcyNzgxUkNBMS5iaW4gLT4gdGkvdGFzMjc4MS9UWE5XMjc4MVJDQTAuYmluCisj
ICtMaW5rOiBUWE5XMjc4MVJDQTAuYmluIC0+IHRpL3RhczI3ODEvVFhOVzI3ODFSQ0ExLmJpbgor
IyAgTGluazogVFhOVzI3ODFSQ0EyLmJpbiAtPiB0aS90YXMyNzgxL1RJQVMyNzgxUkNBMi5iaW4K
KyMgIExpbms6IFRYTlcyNzgxUkNBNC5iaW4gLT4gdGkvdGFzMjc4MS9USUFTMjc4MVJDQTQuYmlu
CisjICAKKyMgQEAgLTg0NzEsNyArODUyOSw3IEBACisjICBGaWxlOiBpbnRlbC9pc2gvaXNoX2xu
bG0uYmluCisjICBWZXJzaW9uOiA1LjguMC43NzE2CisjICAKKyMgLUxpY2Vuc2U6IFJlZGlzdHJp
YnV0YWJsZS4gU2VlIExJQ0VOQ0UuaXNoIGZvciBkZXRhaWxzCisjICtMaWNlbnNlOiBSZWRpc3Ry
aWJ1dGFibGUuIFNlZSBMSUNFTlNFLmludGVsIGZvciBkZXRhaWxzCisjICAKKyMgIC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCisjICAKKyMgQEAgLTg0OTMsMyArODU1MSwxOSBAQAorIyAgTGluazogaW50ZWwv
dnB1L3ZwdV80MHh4X3YwLjAuYmluIC0+IHZwdV80MHh4X3YxLmJpbgorIyAgCisjICBMaWNlbnNl
OiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLmludGVsX3ZwdSBmb3IgZGV0YWlscworIyAr
CisjICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyArCisjICtEcml2ZXI6IGJtaTI2MCAtIEJvc2NoIEJN
STI2MCBJTVUgY29uZmlndXJhdGlvbiBkYXRhCisjICtGaWxlOiBibWkyNjAtaW5pdC1kYXRhLmZ3
CisjICsKKyMgK0xpY2Vuc2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UuYm1pMjYwIGZv
ciBkZXRhaWxzCisjICsKKyMgK09yaWdpbmF0ZXMgZnJvbSBodHRwczovL3NvdXJjZS5jaHJvbWl1
bS5vcmcvY2hyb21pdW1vcy9jaHJvbWl1bW9zL2NvZGVzZWFyY2gvKy9tYWluOnNyYy9wbGF0Zm9y
bS9lYy90aGlyZF9wYXJ0eS9ibWkyNjAvYWNjZWxneXJvX2JtaTI2MF9jb25maWdfdGJpbi5oCisj
ICsKKyMgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyArCisjICtEcml2ZXI6IHFjczkxMDAgLSBRdWFs
Y29tbSBRVVB2MyBmaXJtd2FyZSBpbWFnZSBmaWxlCisjICtGaWxlOiBxY29tL3NhODc3NXAvcXVw
djNmdy5lbGYKKyMgKworIyArTGljZW5zZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5x
Y29tIGFuZCBxY29tL05PVElDRS50eHQgZm9yIGRldGFpbHMKKyMgCisjCisKIFNVTU1BUlkgPSAi
RmlybXdhcmUgZmlsZXMgZm9yIHVzZSB3aXRoIExpbnV4IGtlcm5lbCIKIEhPTUVQQUdFID0gImh0
dHBzOi8vd3d3Lmtlcm5lbC5vcmcvIgogREVTQ1JJUFRJT04gPSAiTGludXggZmlybXdhcmUgaXMg
YSBwYWNrYWdlIGRpc3RyaWJ1dGVkIGFsb25nc2lkZSB0aGUgTGludXgga2VybmVsIFwKQEAgLTE1
Niw3ICs1NzMsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTkNFLkFiaWxpcztt
ZDU9YjVlZTNmNDEwNzgwZTU2NzExYWQ0OGVhZGMyMmI4YmMgXAogICAgICAgICAgICAgICAgICAg
ICBmaWxlOi8vTElDRU5DRS54YzUwMDA7bWQ1PTFlMTcwYzEzMTc1MzIzYzMyYzdmNGQwOTk4ZDUz
ZjY2IFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOQ0UueGM1MDAwYzttZDU9MTJi
MDJlZmEzMDQ5ZGI2NWQ1MjRhZWI0MThkZDg3Y2EgXAogICAgICAgICAgICAgICAgICAgICBmaWxl
Oi8vd2Z4L0xJQ0VOQ0Uud2YyMDA7bWQ1PTRkMWJlZmYwMGQ5MDJjMDVjOWM3ZTk1YTVkOGViNTJk
IFwKLSAgICAgICAgICAgICAgICAgICAgZmlsZTovL1dIRU5DRTttZDU9JHtXSEVOQ0VfQ0hLU1VN
fSBcCisgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9XSEVOQ0U7bWQ1PWQ4NWUyZjE4MmY0ODlh
MjM1NDAwNzEyY2JmZGIwMTdhIFwKICAgICAgICAgICAgICAgICAgICAgIgogIyBXSEVOQ0UgY2hl
Y2tzdW0gaXMgZGVmaW5lZCBzZXBhcmF0ZWx5IHRvIGVhc2Ugb3ZlcnJpZGluZyBpdCBpZgogIyBj
bGFzcy1kZXZ1cHN0cmVhbSBpcyBzZWxlY3RlZC4KQEAgLTI1MCw3ICs2NjcsNyBAQCBTUkNfVVJJ
OmNsYXNzLWRldnVwc3RyZWFtID0gImdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC9maXJtdwogIyBQaW4gdGhpcyB0byB0aGUgMjAyMjA1MDkgcmVsZWFzZSwgb3Zl
cnJpZGUgdGhpcyBpbiBsb2NhbC5jb25mCiBTUkNSRVY6Y2xhc3MtZGV2dXBzdHJlYW0gPz0gImIx
OWNiZGNhNzhhYjJhZGZkMjEwYzkxYmUxNWEyMjU2OGU4YjhjYWUiCiAKLVNSQ19VUklbc2hhMjU2
c3VtXSA9ICIyYWU2YWFiMmQ4OTMwZmQ1NGJmMzBhZTE1NDk4ZjE2MjU3MjFiYzM2MzBiODk0NjQ0
ZGI1ZDIxZmFkNWEyMGY5IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImYyYzYwZDY2ZjIyNmEyODEz
MGNiNTY0M2U2ZTU0NGQzMjI5NjczNDYwZTEyN2M5MWJhMDNmMTA4MGNiZDcwM2UiCiAKIGluaGVy
aXQgYWxsYXJjaAogCi0tIAoyLjQ3LjEKCg==

--===============4378525154724947533==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/linux-firmware: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware: SRC_URI changed from "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20250410.tar.xz" to "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20250509.tar.xz"
packages/all-poky-linux/linux-firmware: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-aldebaran: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-aldebaran: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-carrizo: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-carrizo: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-cezanne: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-cezanne: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-fiji: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-fiji: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-hawaii: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-hawaii: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-misc: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-misc: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-misc: PKGSIZE changed from 57781828 to 57809476 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi10: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi10: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi10: PKGSIZE changed from 2529910 to 2530038 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi14: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi14: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi14: PKGSIZE changed from 3853286 to 3852550 (-0%)
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi21: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi21: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi21: PKGSIZE changed from 3036584 to 3036712 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi22: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi22: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi22: PKGSIZE changed from 2902130 to 2902258 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi23: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi23: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi23: PKGSIZE changed from 2893834 to 2893962 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi24: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi24: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi24: PKGSIZE changed from 2882674 to 2882802 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi31: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi31: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi31: PKGSIZE changed from 3749940 to 3750340 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi32: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi32: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi32: PKGSIZE changed from 2655264 to 2655632 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-oland: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-oland: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-polaris10: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-polaris10: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-polaris11: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-polaris11: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-polaris12: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-polaris12: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-raven: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-raven: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-rembrandt: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-rembrandt: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-renoir: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-renoir: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-stoney: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-stoney: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-tonga: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-tonga: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-topaz: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-topaz: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-vega10: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-vega10: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-vega12: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-vega12: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu: PKGSIZE changed from 512308 to 510636 (-0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-ar5523: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar5523: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-misc: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-misc: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca4019: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca4019: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca6174: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca6174: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca9377: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca9377: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca9887: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca9887: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca9888: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca9888: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca988x: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca988x: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca9984: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca9984: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca99x0: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca99x0: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-wcn3990: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-wcn3990: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-ipq5018: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-ipq5018: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-ipq5018: PKGSIZE changed from 4326398 to 4201960 (-3%)
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-ipq6018: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-ipq6018: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-ipq8074: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-ipq8074: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-misc: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-misc: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qca2066: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qca2066: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qca6390: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qca6390: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qca6698aq: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qca6698aq: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qcn9074: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qcn9074: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-wcn6750: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-wcn6750: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-wcn6855: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-wcn6855: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k-misc: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k-misc: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k-qcn9274: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k-qcn9274: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k-qcn9274: PKGSIZE changed from 16857826 to 18175522 (+8%)
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k-wcn7850: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k-wcn7850: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k-wcn7850: PKGSIZE changed from 8430307 to 8512227 (+1%)
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PKGSIZE changed from 658635 to 660546 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: FILELIST: added "/usr/lib/firmware/brcm/brcmfmac43455-sdio.Radxa-ROCK Pi X.txt"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2x: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2x: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-cc33xx: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cc33xx: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: PKGSIZE changed from 3685161 to 3793993 (+3%)
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: FILELIST: removed "/usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid1-amp1.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid0-amp1.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa391b-spkid0.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid1.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid0.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid0-amp2.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa391b-spkid0-amp2.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid1-amp2.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa391b-spkid0-amp1.bin", added "/usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10431034-spkid0-amp1.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10431034-spkid1-amp1.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10431314-spkid0-amp1.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10431034-spkid0-amp2.b
 in /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10431034-spkid1-amp2.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10431314-spkid1-amp1.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10431314-spkid0-amp2.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10431314-spkid1-amp2.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa391b-amp2.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa392e-amp2.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa3932-amp2.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa391b.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa392e.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa3932.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10431034-spkid1.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10431314-spkid0.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10431314-spkid1.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10431034-spkid0.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa392e-amp3.bin /usr/l
 ib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa3932-amp3.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp1.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa392c-spkid1-amp1.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa392d-spkid0-amp1.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid0-amp1.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa392c-spkid1-amp2.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa392d-spkid0-amp2.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid0-amp2.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp2.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid0.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid1.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa392c-spkid1.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa392d-spkid0.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa392e-amp4.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp
 1-misc-17aa3932-amp4.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa391b-amp1.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa392e-amp1.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa3932-amp1.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-cnm-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cnm-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-cnm: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cnm: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-dev: RRECOMMENDS: added "linux-firmware-qcom-qcm6490-adreno-dev"
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGSIZE changed from 28068259 to 28085871 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-18: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-18: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9260: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9260: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PKGSIZE changed from 191259744 to 200009536 (+5%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: FILELIST: added "/usr/lib/firmware/iwlwifi-bz-b0-fm-c0-98.ucode /usr/lib/firmware/iwlwifi-bz-b0-hr-b0-98.ucode /usr/lib/firmware/iwlwifi-bz-b0-hr-b0-96.ucode /usr/lib/firmware/iwlwifi-bz-b0-gf-a0-98.ucode /usr/lib/firmware/iwlwifi-gl-c0-fm-c0-98.ucode /usr/lib/firmware/iwlwifi-bz-b0-hr-b0.pnvm"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGSIZE changed from 119586 to 112528 (-6%)
packages/all-poky-linux/linux-firmware/linux-firmware-license: FILELIST: removed "/usr/lib/firmware/LICENCE.ish", added "/usr/lib/firmware/LICENSE.bmi260 /usr/lib/firmware/LICENSE.intel"
packages/all-poky-linux/linux-firmware/linux-firmware-linaro-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-linaro-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-mali-csffw-arch108: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mali-csffw-arch108: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-mali-csffw-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mali-csffw-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek: PKGSIZE changed from 46378231 to 46379319 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-mellanox: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mellanox: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-microchip-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-microchip-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-microchip: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-microchip: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-moxa-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-moxa-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-moxa: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-moxa: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7650: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7650: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x2: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x2: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8987-sdio: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8987-sdio: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-common: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-common: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-pcie: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-pcie: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-sdio: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-sdio: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-common: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-common: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-pcie: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-pcie: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-sdio: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-sdio: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw416-sdio: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw416-sdio: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw612-sdio: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw612-sdio: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-olpc-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-olpc-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-olpc: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-olpc: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-powervr-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-powervr-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-powervr: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-powervr: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-prestera: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-prestera: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-misc: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-misc: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca2066: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca2066: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca61x4-serial: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca61x4-serial: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca61x4-usb: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca61x4-usb: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca6390: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca6390: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca6698: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca6698: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn3950: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn3950: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn3988: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn3988: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn399x: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn399x: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn6750: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn6750: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn7850: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn7850: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-2-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-2-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a623: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a623: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a663: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a663: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a702: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a702: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-g750: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-g750: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-aic100: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-aic100: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-modem: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-modem: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-wifi: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-wifi: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-adreno: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-adreno: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-adreno: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-adreno: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-audio: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-audio: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-modem: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-modem: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-wifi: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-wifi: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-adreno: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-adreno: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-audio: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-audio: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-compute: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-compute: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-ipa: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-ipa: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-wifi: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-wifi: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcs615-adreno: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcs615-adreno: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcs8300-adreno: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcs8300-adreno: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcs8300-audio: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcs8300-audio: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcs8300-compute: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcs8300-compute: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcs8300-generalpurpose: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcs8300-generalpurpose: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qdu100: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qdu100: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-adreno: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-adreno: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-audio: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-audio: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-compute: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-compute: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-modem: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-modem: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-wifi: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-wifi: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sa8775p-adreno: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sa8775p-adreno: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sa8775p-audio: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sa8775p-audio: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sa8775p-compute: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sa8775p-compute: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sa8775p-generalpurpose: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sa8775p-generalpurpose: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-adreno: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-adreno: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-thundercomm-db845c-sensors: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-thundercomm-db845c-sensors: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-adreno: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-adreno: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-thundercomm-rb5-sensors: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-thundercomm-rb5-sensors: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8550-audio-tplg: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8550-audio-tplg: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8650-audio-tplg: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8650-audio-tplg: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-6.0: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-6.0: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu: PKGSIZE changed from 8619213 to 12967529 (+50%)
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu: FILELIST: added "/usr/lib/firmware/qcom/vpu/vpu20_p1_gen2.mbn /usr/lib/firmware/qcom/vpu/vpu30_p4_s6_16mb.mbn"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-adreno: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-adreno: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-audio: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-audio: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-t14s-g6-adreno: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-t14s-g6-adreno: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-t14s-g6-audio: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-t14s-g6-audio: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-t14s-g6-compute: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-t14s-g6-compute: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-t14s-g6-vpu: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-t14s-g6-vpu: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-yoga-slim7x-adreno: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-yoga-slim7x-adreno: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-yoga-slim7x-audio: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-yoga-slim7x-audio: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-yoga-slim7x-compute: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-yoga-slim7x-compute: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-yoga-slim7x-vpu: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-yoga-slim7x-vpu: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-yamato-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-yamato-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qed: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qed: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-dptx: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-dptx: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-nic: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-nic: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8761: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8761: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8822: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8822: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-src: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-src: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-wfx-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wfx-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-wfx: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wfx: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGSIZE changed from 331923 to 335426 (+1%)
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c-license: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c-license: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGV changed from 20250410 [default] to 20250509 [default]
packages/all-poky-linux/linux-firmware/linux-firmware: PV changed from "20250410" to "20250509"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGSIZE changed from 102119670 to 104676889 (+3%)
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: added "/usr/lib/firmware/qcom/sm8350/a660_zap.mbn /usr/lib/firmware/qcom/sa8775p/qupv3fw.elf /usr/lib/firmware/bmi260-init-data.fw /usr/lib/firmware/amdtee/amd_pmf_v3_1.bin /usr/lib/firmware/amdtee/f29bb3d9-bd66-5441-afb88acc2b2b60d6.bin /usr/lib/firmware/rtw89/rtw8852c_fw-2.bin"
packages/all-poky-linux/linux-firmware/linux-firmware: RDEPENDS: added "linux-firmware-qcom-qcm6490-adreno"

--===============4378525154724947533==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: FILELIST: added "/usr/lib/firmware/brcm/brcmfmac43455-sdio.Radxa-ROCK Pi X.txt"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: FILELIST: removed "/usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa391b-spkid0.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid0.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid1.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid0-amp1.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa391b-spkid0-amp2.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid1-amp2.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid0-amp2.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid1-amp1.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa391b-spkid0-amp1.bin", added "/usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa3932-amp2.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa392e-amp2.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa391b-amp2.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid0.wmfw /usr/lib/firmware/cirr
 us/cs35l56-b0-dsp1-misc-17aa3921-spkid1.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa392c-spkid1.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa392d-spkid0.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa392e-amp3.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa3932-amp3.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10431314-spkid1-amp2.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10431034-spkid0-amp2.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10431034-spkid1-amp2.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10431314-spkid0-amp2.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa391b-amp1.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa392e-amp1.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa3932-amp1.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa391b.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa392e.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa3932.wmfw /usr/lib/firmware/cirrus/cs35l56-b
 0-dsp1-misc-17aa391e-spkid0-amp1.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp1.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa392c-spkid1-amp1.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10431314-spkid0-amp1.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10431314-spkid1-amp1.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10431034-spkid0-amp1.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10431034-spkid0.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10431034-spkid1.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10431314-spkid1.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10431034-spkid1-amp1.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10431314-spkid0.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid0-amp2.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp2.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa3932-amp4.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa392e-amp4.
 bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa392d-spkid0-amp1.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa392c-spkid1-amp2.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-17aa392d-spkid0-amp2.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-dev: RRECOMMENDS: added "linux-firmware-qcom-qcm6490-adreno-dev"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: FILELIST: added "/usr/lib/firmware/iwlwifi-bz-b0-fm-c0-98.ucode /usr/lib/firmware/iwlwifi-gl-c0-fm-c0-98.ucode /usr/lib/firmware/iwlwifi-bz-b0-gf-a0-98.ucode /usr/lib/firmware/iwlwifi-bz-b0-hr-b0.pnvm /usr/lib/firmware/iwlwifi-bz-b0-hr-b0-98.ucode /usr/lib/firmware/iwlwifi-bz-b0-hr-b0-96.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-license: FILELIST: removed "/usr/lib/firmware/LICENCE.ish", added "/usr/lib/firmware/LICENSE.intel /usr/lib/firmware/LICENSE.bmi260"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu: FILELIST: added "/usr/lib/firmware/qcom/vpu/vpu20_p1_gen2.mbn /usr/lib/firmware/qcom/vpu/vpu30_p4_s6_16mb.mbn"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu: PKGSIZE changed from 8619213 to 12967529 (+50%)
packages/all-poky-linux/linux-firmware/linux-firmware: RDEPENDS: added "linux-firmware-qcom-qcm6490-adreno"
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: added "/usr/lib/firmware/amdtee/f29bb3d9-bd66-5441-afb88acc2b2b60d6.bin /usr/lib/firmware/rtw89/rtw8852c_fw-2.bin /usr/lib/firmware/amdtee/amd_pmf_v3_1.bin /usr/lib/firmware/bmi260-init-data.fw /usr/lib/firmware/qcom/sm8350/a660_zap.mbn /usr/lib/firmware/qcom/sa8775p/qupv3fw.elf"

--===============4378525154724947533==--

