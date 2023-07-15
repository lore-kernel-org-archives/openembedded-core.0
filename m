Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDE4AC10F1A
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:38 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.6025.1689456454451001600
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=SPu6nncd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101895b73b193-5435d2f6-7dfd-4c06-9a0d-d8cff1dc53d4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456456;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Xc1iDVV4JUmKrarb21gytihix2yrKfVT1XUytco4LPc=;
	b=SPu6nncdUIaY5GOYg7+D5uZLoD/K0RTy40P1b2o3kQS3myh1YhWtqpUHIZq5jf56
	lsfda0M0zgHYp2FDVaxEJ82HfkInRi5h5kJpJmovd5TTi0rOfwau2kk+4mW2qZNpnnW
	ZP9BJG0YAgqlIVTKziSzc47D67Rybd5OGZDmcFIU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456456;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Xc1iDVV4JUmKrarb21gytihix2yrKfVT1XUytco4LPc=;
	b=j9s9Va75+7egZAfdS5qoVfWVnhkYcm2XHqWVApHp9jjKyzTy9GlNgTzX91qcGlMw
	NF8LvWbTRRJ51pPgYyck1Ns0Qky8oKRjd+twaeja6cobJNNUBRPGVyvfEQ0/+Kx8xtB
	kY1WD5NfMnCdkVSkasvy7q0B8kmbUqlYEMgdFINw=
Content-Type: multipart/mixed; boundary="===============3867754439260922417=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] linux-firmware: upgrading to 20230625 SUCCEEDED
Message-ID: <010101895b73b193-5435d2f6-7dfd-4c06-9a0d-d8cff1dc53d4-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:36 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184393

--===============3867754439260922417==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *linux-firmware* to *20230625* has Succeeded.

Next steps:
    - apply the patch: git am 0001-linux-firmware-upgrade-20230515-20230625.patch
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
From c94c26f6ef7ba99fdbb32a4c9a9374fef490bec1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 19:34:00 +0000
Subject: [PATCH] linux-firmware: upgrade 20230515 -> 20230625

---
 ...20230515.bb => linux-firmware_20230625.bb} | 342 +++++++++++++++++-
 1 file changed, 340 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20230515.bb => linux-firmware_20230625.bb} (78%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230515.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
similarity index 78%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20230515.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
index 3470131294..5a1c1e206a 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230515.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
@@ -1,3 +1,341 @@
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
+# @@ -536,14 +536,14 @@
+#  
+#  File: cxgb4/t4fw-1.14.4.0.bin
+#  File: cxgb4/t4fw-1.15.37.0.bin
+# -File: cxgb4/t4fw-1.27.1.0.bin
+# -Link: cxgb4/t4fw.bin -> t4fw-1.27.1.0.bin
+# +File: cxgb4/t4fw-1.27.3.0.bin
+# +Link: cxgb4/t4fw.bin -> t4fw-1.27.3.0.bin
+#  File: cxgb4/t5fw-1.14.4.0.bin
+#  File: cxgb4/t5fw-1.15.37.0.bin
+# -File: cxgb4/t5fw-1.27.1.0.bin
+# -Link: cxgb4/t5fw.bin -> t5fw-1.27.1.0.bin
+# -File: cxgb4/t6fw-1.27.1.0.bin
+# -Link: cxgb4/t6fw.bin -> t6fw-1.27.1.0.bin
+# +File: cxgb4/t5fw-1.27.3.0.bin
+# +Link: cxgb4/t5fw.bin -> t5fw-1.27.3.0.bin
+# +File: cxgb4/t6fw-1.27.3.0.bin
+# +Link: cxgb4/t6fw.bin -> t6fw-1.27.3.0.bin
+#  File: cxgb4/aq1202_fw.cld
+#  File: cxgb4/bcm8483.bin
+#  File: cxgb4/configs/t4-config-default.txt
+# @@ -2363,6 +2363,7 @@
+#  File: amdgpu/gc_11_0_0_mec.bin
+#  File: amdgpu/gc_11_0_0_mes1.bin
+#  File: amdgpu/gc_11_0_0_mes.bin
+# +File: amdgpu/gc_11_0_0_mes_2.bin
+#  File: amdgpu/gc_11_0_0_pfp.bin
+#  File: amdgpu/gc_11_0_0_rlc.bin
+#  File: amdgpu/gc_11_0_1_imu.bin
+# @@ -2370,6 +2371,7 @@
+#  File: amdgpu/gc_11_0_1_mec.bin
+#  File: amdgpu/gc_11_0_1_mes.bin
+#  File: amdgpu/gc_11_0_1_mes1.bin
+# +File: amdgpu/gc_11_0_1_mes_2.bin
+#  File: amdgpu/gc_11_0_1_pfp.bin
+#  File: amdgpu/gc_11_0_1_rlc.bin
+#  File: amdgpu/gc_11_0_2_imu.bin
+# @@ -2377,6 +2379,7 @@
+#  File: amdgpu/gc_11_0_2_mec.bin
+#  File: amdgpu/gc_11_0_2_mes1.bin
+#  File: amdgpu/gc_11_0_2_mes.bin
+# +File: amdgpu/gc_11_0_2_mes_2.bin
+#  File: amdgpu/gc_11_0_2_pfp.bin
+#  File: amdgpu/gc_11_0_2_rlc.bin
+#  File: amdgpu/gc_11_0_4_imu.bin
+# @@ -2384,6 +2387,7 @@
+#  File: amdgpu/gc_11_0_4_mec.bin
+#  File: amdgpu/gc_11_0_4_mes.bin
+#  File: amdgpu/gc_11_0_4_mes1.bin
+# +File: amdgpu/gc_11_0_4_mes_2.bin
+#  File: amdgpu/gc_11_0_4_pfp.bin
+#  File: amdgpu/gc_11_0_4_rlc.bin
+#  File: amdgpu/dcn_3_1_4_dmcub.bin
+# @@ -2718,8 +2722,16 @@
+#  File: brcm/brcmfmac43455-sdio.AW-CM256SM.txt
+#  Link: brcm/brcmfmac43455-sdio.beagle,am5729-beagleboneai.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
+#  Link: brcm/brcmfmac43455-sdio.pine64,pinebook-pro.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
+# +Link: brcm/brcmfmac43455-sdio.pine64,pinenote-v1.1.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
+# +Link: brcm/brcmfmac43455-sdio.pine64,pinenote-v1.2.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
+#  Link: brcm/brcmfmac43455-sdio.pine64,pinephone-pro.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
+# +Link: brcm/brcmfmac43455-sdio.pine64,quartz64-a.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
+#  Link: brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
+# +Link: brcm/brcmfmac43455-sdio.pine64,rockpro64-v2.0.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
+# +Link: brcm/brcmfmac43455-sdio.pine64,rockpro64-v2.1.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
+# +Link: brcm/brcmfmac43455-sdio.pine64,soquartz-model-a.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
+# +Link: brcm/brcmfmac43455-sdio.pine64,soquartz-cm4io.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
+# +Link: brcm/brcmfmac43455-sdio.pine64,soquartz-blade.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
+#  
+#  Licence: GPLv2. See GPL-2 for details.
+#  
+# @@ -2973,15 +2985,6 @@
+#  
+#  --------------------------------------------------------------------------
+#  
+# -Driver: rtl8188eu - Realtek 802.11n WLAN driver for RTL8188EU
+# -
+# -Info: Taken from Realtek version RTL8188EUS_linux_v4.1.4_6773.20130222
+# -File: rtlwifi/rtl8188eufw.bin
+# -
+# -Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
+# -
+# ---------------------------------------------------------------------------
+# -
+#  Driver: rtl8821ae - Realtek 802.11n WLAN driver for RTL8812AE
+#  
+#  Info: From Vendor's realtek/rtlwifi_linux_mac80211_0019.0320.2014V628 driver
+# @@ -3035,8 +3038,9 @@
+#  
+#  --------------------------------------------------------------------------
+#  
+# -Driver: rtw89 - Realtek 802.11ax WLAN driver for RTL8852A/RTL8852B/RTL8852C
+# -
+# +Driver: rtw89 - Realtek 802.11ax WLAN driver for RTL8851B/RTL8852A/RTL8852B/RTL8852C
+# +
+# +File: rtw89/rtw8851b_fw.bin
+#  File: rtw89/rtw8852a_fw.bin
+#  File: rtw89/rtw8852b_fw.bin
+#  File: rtw89/rtw8852b_fw-1.bin
+# @@ -3111,6 +3115,20 @@
+#  Version: 16.0
+#  File: rtlwifi/rtl8710bufw_UMC.bin
+#  Version: 16.0
+# +
+# +Info: rtl8188eu taken from Realtek driver version
+# +      v5.2.2.4_25483.20171222.
+# +      Firmware is embedded in the driver as data statements. This info
+# +      has been extracted into a binary file.
+# +File: rtlwifi/rtl8188eufw.bin
+# +Version: 28.0
+# +
+# +Info: rtl8192fu taken from Realtek driver version
+# +      v5.8.6.2_35538.20191028_COEX20190910-0d02.
+# +      Firmware is embedded in the driver as data statements. This info
+# +      has been extracted into a binary file.
+# +File: rtlwifi/rtl8192fufw.bin
+# +Version: 6.0
+#  
+#  Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
+#  
+# @@ -3872,14 +3890,19 @@
+#  Driver: microcode_amd - AMD CPU Microcode Update Driver for Linux
+#  
+#  File: amd-ucode/microcode_amd.bin
+# +Raw: amd-ucode/microcode_amd.bin
+#  Version: 2013-07-10
+#  File: amd-ucode/microcode_amd_fam15h.bin
+# +Raw: amd-ucode/microcode_amd_fam15h.bin
+#  Version: 2018-05-24
+#  File: amd-ucode/microcode_amd_fam16h.bin
+# +Raw: amd-ucode/microcode_amd_fam16h.bin
+#  Version: 2014-10-28
+#  File: amd-ucode/microcode_amd_fam17h.bin
+# +Raw: amd-ucode/microcode_amd_fam17h.bin
+#  Version: 2023-04-13
+#  File: amd-ucode/microcode_amd_fam19h.bin
+# +Raw: amd-ucode/microcode_amd_fam19h.bin
+#  Version: 2023-01-31
+#  File: amd-ucode/README
+#  
+# @@ -4682,6 +4705,9 @@
+#  
+#  File: i915/mtl_guc_70.bin
+#  Version: GuC API/APB ver 70.6.6 for Meteorlake
+# +
+# +File: i915/mtl_huc_gsc.bin
+# +Version: HuC API/APB ver 8.5.0 for Meteorlake
+#  
+#  License: Redistributable. See LICENSE.i915 for details
+#  --------------------------------------------------------------------------
+# @@ -5111,7 +5137,7 @@
+#  File: atmel/wilc1000_p2p_fw.bin
+#  File: atmel/wilc1000_wifi_firmware.bin
+#  File: atmel/wilc1000_wifi_firmware-1.bin
+# -Version: 15.6
+# +Version: 16.0
+#  
+#  License: Redistributable. See LICENSE.atmel for details
+#  
+# @@ -5172,7 +5198,7 @@
+#  File: mediatek/mt8192/scp.img
+#  Version: v2.0.20536
+#  File: mediatek/mt8195/scp.img
+# -Version: v2.0.20536
+# +Version: v2.0.11966
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -5340,9 +5366,9 @@
+#  Driver: mt7921 - MediaTek MT7921 Wireless MACs
+#  
+#  File: mediatek/WIFI_MT7961_patch_mcu_1_2_hdr.bin
+# -Version: 20230331110902a
+# +Version: 20230526130917a
+#  File: mediatek/WIFI_RAM_CODE_MT7961_1.bin
+# -Version: 20230331110939
+# +Version: 20230526130958
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -5351,7 +5377,7 @@
+#  Driver: mt7921 - MediaTek MT7921 bluetooth chipset
+#  
+#  File: mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin
+# -Version: 20230331111156
+# +Version: 20230526131214
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -5360,9 +5386,9 @@
+#  Driver: mt7922 - MediaTek MT7922 Wireless MACs
+#  
+#  File: mediatek/WIFI_MT7922_patch_mcu_1_1_hdr.bin
+# -Version: 20230509203612a
+# +Version: 20230530123154a
+#  File: mediatek/WIFI_RAM_CODE_MT7922_1.bin
+# -Version: 20230509203655
+# +Version: 20230530123236
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -5371,7 +5397,7 @@
+#  Driver: mt7922 - MediaTek MT7922 bluetooth chipset
+#  
+#  File: mediatek/BT_RAM_CODE_MT7922_1_1_hdr.bin
+# -Version: 20230509203838
+# +Version: 20230530123531
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -5578,6 +5604,10 @@
+#  
+#  Driver: qcom_q6v5_pas - Qualcomm remoteproc firmware
+#  
+# +File: qcom/apq8016/mba.mbn
+# +File: qcom/apq8016/modem.mbn
+# +File: qcom/apq8016/wcnss.mbn
+# +File: qcom/apq8016/WCNSS_qcom_wlan_nv_sbc.bin
+#  File: qcom/apq8096/adsp.mbn
+#  File: qcom/apq8096/adspr.jsn
+#  File: qcom/apq8096/adspua.jsn
+# @@ -5606,7 +5636,8 @@
+#  Licence: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
+#  
+#  Binary files supplied originally from
+# -http://releases.linaro.org/96boards/dragonboard845c/qualcomm/firmware/RB3_firmware_20190529180356-v4.zip
+# +http://releases.linaro.org/96boards/dragonboard410c/qualcomm/firmware/linux-board-support-package-r1036.1.zip
+# +http://releases.linaro.org/96boards/dragonboard845c/qualcomm/firmware/RB3_firmware_20221121000000-v5.zip
+#  http://releases.linaro.org/96boards/rb5/qualcomm/firmware/RB5_firmware_20210331-v4.zip
+#  
+#  adsp.mbn has been converted from 20-adsp_split/firmware/adsp.* using
+# @@ -5620,13 +5651,14 @@
+#  Driver: qcom_q6v5_mss - Qualcomm modem subsystem firmware
+#  
+#  File: qcom/sdm845/mba.mbn
+# -File: qcom/sdm845/modem.mbn
+# +File: qcom/sdm845/modem_nm.mbn
+#  File: qcom/sdm845/modemuw.jsn
+# +Link: qcom/sdm845/modem.mbn -> modem_nm.mbn
+#  
+#  Licence: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
+#  
+#  Binary files supplied originally from
+# -http://releases.linaro.org/96boards/dragonboard845c/qualcomm/firmware/RB3_firmware_20190529180356-v4.zip
+# +http://releases.linaro.org/96boards/dragonboard845c/qualcomm/firmware/RB3_firmware_20221121000000-v5.zip
+#  
+#  modem.mbn has been converted from 28-modem/modem.* using
+#  https://github.com/andersson/pil-squasher
+# @@ -5802,8 +5834,8 @@
+#  
+#  License: Redistributable. See LICENSE.ice for details
+#  
+# -File: intel/ice/ddp-comms/ice_comms-1.3.31.0.pkg
+# -File: intel/ice/ddp-wireless_edge/ice_wireless_edge-1.3.7.0.pkg
+# +File: intel/ice/ddp-comms/ice_comms-1.3.40.0.pkg
+# +File: intel/ice/ddp-wireless_edge/ice_wireless_edge-1.3.10.0.pkg
+#  
+#  License: Redistributable. See LICENSE.ice_enhanced for details
+#  
+# @@ -6073,6 +6105,66 @@
+#  File: cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid0-r0.bin
+#  File: cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid1-l0.bin
+#  File: cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid1-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10431b93.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10431b93.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10431a20.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10431a20.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10431a30.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10431a30.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10431a40.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10431a40.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10431a50.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10431a50.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10431a60.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10431a60.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431b93-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431b93-spkid0-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431b93-spkid1-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431b93-spkid1-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid0-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid1-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid1-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433a20-spkid0-l0.bin -> cs35l41-dsp1-spk-prot-10431b93-spkid0-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433a20-spkid0-r0.bin -> cs35l41-dsp1-spk-prot-10431b93-spkid0-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433a20-spkid1-l0.bin -> cs35l41-dsp1-spk-prot-10431b93-spkid1-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433a20-spkid1-r0.bin -> cs35l41-dsp1-spk-prot-10431b93-spkid1-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10433a20-spkid0-l0.bin -> cs35l41-dsp1-spk-cali-10431b93-spkid0-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10433a20-spkid0-r0.bin -> cs35l41-dsp1-spk-cali-10431b93-spkid0-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10433a20-spkid1-l0.bin -> cs35l41-dsp1-spk-cali-10431b93-spkid1-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10433a20-spkid1-r0.bin -> cs35l41-dsp1-spk-cali-10431b93-spkid1-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10433a30-spkid1-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid1-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10433a30-spkid1-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid1-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10433a30-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10433a30-spkid0-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid0-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433a40-spkid0-l0.bin -> cs35l41-dsp1-spk-prot-10433a30-spkid0-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433a40-spkid0-r0.bin -> cs35l41-dsp1-spk-prot-10433a30-spkid0-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433a40-spkid1-l0.bin -> cs35l41-dsp1-spk-prot-10433a30-spkid1-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433a40-spkid1-r0.bin -> cs35l41-dsp1-spk-prot-10433a30-spkid1-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10433a40-spkid0-l0.bin -> cs35l41-dsp1-spk-cali-10433a30-spkid0-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10433a40-spkid0-r0.bin -> cs35l41-dsp1-spk-cali-10433a30-spkid0-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10433a40-spkid1-l0.bin -> cs35l41-dsp1-spk-cali-10433a30-spkid1-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10433a40-spkid1-r0.bin -> cs35l41-dsp1-spk-cali-10433a30-spkid1-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10433a50-spkid1-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid1-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10433a50-spkid1-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid1-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10433a50-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10433a50-spkid0-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid0-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10433a60-spkid1-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid1-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10433a60-spkid1-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid1-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10433a60-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10433a60-spkid0-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid0-r0.bin
+#  Link: cirrus/cs35l41-dsp1-spk-prot-17aa2316.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+#  Link: cirrus/cs35l41-dsp1-spk-cali-17aa2316.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+#  Link: cirrus/cs35l41-dsp1-spk-prot-17aa2317.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# 
+#
+
 SUMMARY = "Firmware files for use with Linux kernel"
 HOMEPAGE = "https://www.kernel.org/"
 DESCRIPTION = "Linux firmware is a package distributed alongside the Linux kernel \
@@ -130,7 +468,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=${WHENCE_CHKSUM} \
+                    file://WHENCE;md5=57bf874056926f12aec2405d3fc390d9 \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
@@ -212,7 +550,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "8b1acfa16f1ee94732a6acb50d9d6c835cf53af11068bd89ed207bbe04a1e951"
+SRC_URI[sha256sum] = "87597111c0d4b71b31e53cb85a92c386921b84c825a402db8c82e0e86015500d"
 
 inherit allarch
 
-- 
2.39.2


--===============3867754439260922417==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/linux-firmware: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware: SRC_URI changed from "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20230515.tar.xz" to "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20230625.tar.xz"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: FILELIST: added "/lib/firmware/amdgpu/gc_11_0_1_mes_2.bin /lib/firmware/amdgpu/gc_11_0_4_mes_2.bin /lib/firmware/amdgpu/gc_11_0_0_mes_2.bin /lib/firmware/amdgpu/gc_11_0_2_mes_2.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PKGSIZE changed from 76476230 to 77944646 (+2%)
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: FILELIST: added "/lib/firmware/brcm/brcmfmac43455-sdio.pine64,rockpro64-v2.1.txt /lib/firmware/brcm/brcmfmac43455-sdio.pine64,quartz64-a.txt /lib/firmware/brcm/brcmfmac43455-sdio.pine64,soquartz-model-a.txt /lib/firmware/brcm/brcmfmac43455-sdio.pine64,pinenote-v1.1.txt /lib/firmware/brcm/brcmfmac43455-sdio.pine64,rockpro64-v2.0.txt /lib/firmware/brcm/brcmfmac43455-sdio.pine64,pinenote-v1.2.txt /lib/firmware/brcm/brcmfmac43455-sdio.pine64,soquartz-cm4io.txt /lib/firmware/brcm/brcmfmac43455-sdio.pine64,soquartz-blade.txt"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PKGSIZE changed from 658195 to 658459 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2-mips: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2-mips: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-gplv2-license: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-gplv2-license: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: FILELIST: added "/lib/firmware/i915/mtl_huc_gsc.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGSIZE changed from 26037547 to 26602795 (+2%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-ice: FILELIST: removed "/lib/firmware/intel/ice/ddp-wireless_edge/ice_wireless_edge-1.3.7.0.pkg /lib/firmware/intel/ice/ddp-comms/ice_comms-1.3.31.0.pkg", added "/lib/firmware/intel/ice/ddp-wireless_edge/ice_wireless_edge-1.3.10.0.pkg /lib/firmware/intel/ice/ddp-comms/ice_comms-1.3.40.0.pkg"
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PKGSIZE changed from 2127028 to 2143532 (+1%)
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-license: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u-license: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u-license: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PKGSIZE changed from 79080 to 79328 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PKGSIZE changed from 10421518 to 10426126 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PKGSIZE changed from 2705319 to 2709415 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: FILELIST: added "/lib/firmware/qcom/sdm845/modem_nm.mbn"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PKGSIZE changed from 5895840 to 5916348 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-yamato-license: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-yamato-license: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PKGSIZE changed from 46140 to 47498 (+3%)
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8761: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8761: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-src: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-src: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGSIZE changed from 212265 to 218681 (+3%)
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: removed "/lib/firmware/cxgb4/t5fw-1.27.1.0.bin /lib/firmware/cxgb4/t6fw-1.27.1.0.bin /lib/firmware/cxgb4/t4fw-1.27.1.0.bin", added "/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431a40.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a50-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a50-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a50-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a30-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a40-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a40-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a30-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a50-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a60-spkid1-l0.bin /lib/firmware/cirr
 us/cs35l41-dsp1-spk-prot-10433a60-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431a60.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431a30.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431a20.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431b93.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a20-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a20-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid1-r0.bin /lib/firmware/rtw89/rtw8851b_fw.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431b93-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431b93-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431b93-spkid0-l0.bin /lib/firmware/qcom/apq8016/modem.mbn /lib/firmware/qcom/apq8016/wcnss.mbn /lib/firmware/cir
 rus/cs35l41-dsp1-spk-prot-10431b93-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431a40.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a30-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a30-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a40-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a40-spkid0-r0.bin /lib/firmware/rtlwifi/rtl8192fufw.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a20-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a20-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a20-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a20-spkid0-r0.bin /lib/firmware/qcom/apq8016/mba.mbn /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431a50.wmfw /lib/firmware/qcom/apq8016/WCNSS_qcom_wlan_nv_sbc.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-1043
 3a60-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431a60.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a40-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a40-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a60-spkid0-r0.bin /lib/firmware/cxgb4/t4fw-1.27.3.0.bin /lib/firmware/cxgb4/t5fw-1.27.3.0.bin /lib/firmware/cxgb4/t6fw-1.27.3.0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431b93.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431a20.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1
 -spk-cali-10433a60-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431a30.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a20-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a20-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a40-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a40-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431a50.wmfw"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware: PKGSIZE changed from 266923863 to 283276123 (+6%)

--===============3867754439260922417==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: FILELIST: added "/lib/firmware/amdgpu/gc_11_0_0_mes_2.bin /lib/firmware/amdgpu/gc_11_0_2_mes_2.bin /lib/firmware/amdgpu/gc_11_0_4_mes_2.bin /lib/firmware/amdgpu/gc_11_0_1_mes_2.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: FILELIST: added "/lib/firmware/brcm/brcmfmac43455-sdio.pine64,pinenote-v1.2.txt /lib/firmware/brcm/brcmfmac43455-sdio.pine64,rockpro64-v2.1.txt /lib/firmware/brcm/brcmfmac43455-sdio.pine64,soquartz-blade.txt /lib/firmware/brcm/brcmfmac43455-sdio.pine64,rockpro64-v2.0.txt /lib/firmware/brcm/brcmfmac43455-sdio.pine64,quartz64-a.txt /lib/firmware/brcm/brcmfmac43455-sdio.pine64,pinenote-v1.1.txt /lib/firmware/brcm/brcmfmac43455-sdio.pine64,soquartz-cm4io.txt /lib/firmware/brcm/brcmfmac43455-sdio.pine64,soquartz-model-a.txt"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: FILELIST: added "/lib/firmware/i915/mtl_huc_gsc.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-ice: FILELIST: removed "/lib/firmware/intel/ice/ddp-wireless_edge/ice_wireless_edge-1.3.7.0.pkg /lib/firmware/intel/ice/ddp-comms/ice_comms-1.3.31.0.pkg", added "/lib/firmware/intel/ice/ddp-wireless_edge/ice_wireless_edge-1.3.10.0.pkg /lib/firmware/intel/ice/ddp-comms/ice_comms-1.3.40.0.pkg"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: FILELIST: added "/lib/firmware/qcom/sdm845/modem_nm.mbn"
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: removed "/lib/firmware/cxgb4/t5fw-1.27.1.0.bin /lib/firmware/cxgb4/t6fw-1.27.1.0.bin /lib/firmware/cxgb4/t4fw-1.27.1.0.bin", added "/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431a60.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a20-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a20-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431a20.wmfw /lib/firmware/qcom/apq8016/modem.mbn /lib/firmware/qcom/apq8016/wcnss.mbn /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431a30.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431b93.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a20-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a40-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a40-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a40-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk
 -prot-10433a20-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a40-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a30-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a30-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a20-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a20-spkid1-r0.bin /lib/firmware/cxgb4/t5fw-1.27.3.0.bin /lib/firmware/cxgb4/t6fw-1.27.3.0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431a40.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431a60.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a60-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a60-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431a30.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431a50.wmfw /lib
 /firmware/cirrus/cs35l41-dsp1-spk-cali-10433a40-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a40-spkid0-r0.bin /lib/firmware/qcom/apq8016/WCNSS_qcom_wlan_nv_sbc.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a40-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a40-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431b93-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431b93-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431b93-spkid1-l0.bin /lib/firmware/rtlwifi/rtl8192fufw.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431b93-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431b93.wmfw /lib/firmware/qcom/apq8016/mba.mbn /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431a20.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-
 spk-cali-10433a60-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431a50.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431a40.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a20-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a20-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a60-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a60-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a50-spkid1-
 l0.bin /lib/firmware/rtw89/rtw8851b_fw.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a30-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a30-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a50-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a50-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a50-spkid0-r0.bin /lib/firmware/cxgb4/t4fw-1.27.3.0.bin"

--===============3867754439260922417==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-linux-firmware-upgrade-20230515-20230625.patch"

RnJvbSBjOTRjMjZmNmVmN2JhOTlmZGJiMzJhNGM5YTkzNzRmZWY0OTBiZWMxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMTk6MzQ6MDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aW51eC1maXJtd2FyZTogdXBncmFkZSAyMDIzMDUxNSAtPiAyMDIzMDYyNQoKLS0tCiAuLi4yMDIz
MDUxNS5iYiA9PiBsaW51eC1maXJtd2FyZV8yMDIzMDYyNS5iYn0gfCAzNDIgKysrKysrKysrKysr
KysrKystCiAxIGZpbGUgY2hhbmdlZCwgMzQwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS97bGludXgtZmlybXdh
cmVfMjAyMzA1MTUuYmIgPT4gbGludXgtZmlybXdhcmVfMjAyMzA2MjUuYmJ9ICg3OCUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2Fy
ZV8yMDIzMDUxNS5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgt
ZmlybXdhcmVfMjAyMzA2MjUuYmIKc2ltaWxhcml0eSBpbmRleCA3OCUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZV8yMDIzMDUxNS5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJt
d2FyZV8yMDIzMDYyNS5iYgppbmRleCAzNDcwMTMxMjk0Li41YTFjMWUyMDZhIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlXzIwMjMw
NTE1LmJiCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgtZmly
bXdhcmVfMjAyMzA2MjUuYmIKQEAgLTEsMyArMSwzNDEgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklM
RVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4K
KyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRo
ZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlm
IG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3Nh
Z2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0
ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0t
LSBXSEVOQ0UKKyMgKysrIFdIRU5DRQorIyBAQCAtNTM2LDE0ICs1MzYsMTQgQEAKKyMgIAorIyAg
RmlsZTogY3hnYjQvdDRmdy0xLjE0LjQuMC5iaW4KKyMgIEZpbGU6IGN4Z2I0L3Q0ZnctMS4xNS4z
Ny4wLmJpbgorIyAtRmlsZTogY3hnYjQvdDRmdy0xLjI3LjEuMC5iaW4KKyMgLUxpbms6IGN4Z2I0
L3Q0ZncuYmluIC0+IHQ0ZnctMS4yNy4xLjAuYmluCisjICtGaWxlOiBjeGdiNC90NGZ3LTEuMjcu
My4wLmJpbgorIyArTGluazogY3hnYjQvdDRmdy5iaW4gLT4gdDRmdy0xLjI3LjMuMC5iaW4KKyMg
IEZpbGU6IGN4Z2I0L3Q1ZnctMS4xNC40LjAuYmluCisjICBGaWxlOiBjeGdiNC90NWZ3LTEuMTUu
MzcuMC5iaW4KKyMgLUZpbGU6IGN4Z2I0L3Q1ZnctMS4yNy4xLjAuYmluCisjIC1MaW5rOiBjeGdi
NC90NWZ3LmJpbiAtPiB0NWZ3LTEuMjcuMS4wLmJpbgorIyAtRmlsZTogY3hnYjQvdDZmdy0xLjI3
LjEuMC5iaW4KKyMgLUxpbms6IGN4Z2I0L3Q2ZncuYmluIC0+IHQ2ZnctMS4yNy4xLjAuYmluCisj
ICtGaWxlOiBjeGdiNC90NWZ3LTEuMjcuMy4wLmJpbgorIyArTGluazogY3hnYjQvdDVmdy5iaW4g
LT4gdDVmdy0xLjI3LjMuMC5iaW4KKyMgK0ZpbGU6IGN4Z2I0L3Q2ZnctMS4yNy4zLjAuYmluCisj
ICtMaW5rOiBjeGdiNC90NmZ3LmJpbiAtPiB0NmZ3LTEuMjcuMy4wLmJpbgorIyAgRmlsZTogY3hn
YjQvYXExMjAyX2Z3LmNsZAorIyAgRmlsZTogY3hnYjQvYmNtODQ4My5iaW4KKyMgIEZpbGU6IGN4
Z2I0L2NvbmZpZ3MvdDQtY29uZmlnLWRlZmF1bHQudHh0CisjIEBAIC0yMzYzLDYgKzIzNjMsNyBA
QAorIyAgRmlsZTogYW1kZ3B1L2djXzExXzBfMF9tZWMuYmluCisjICBGaWxlOiBhbWRncHUvZ2Nf
MTFfMF8wX21lczEuYmluCisjICBGaWxlOiBhbWRncHUvZ2NfMTFfMF8wX21lcy5iaW4KKyMgK0Zp
bGU6IGFtZGdwdS9nY18xMV8wXzBfbWVzXzIuYmluCisjICBGaWxlOiBhbWRncHUvZ2NfMTFfMF8w
X3BmcC5iaW4KKyMgIEZpbGU6IGFtZGdwdS9nY18xMV8wXzBfcmxjLmJpbgorIyAgRmlsZTogYW1k
Z3B1L2djXzExXzBfMV9pbXUuYmluCisjIEBAIC0yMzcwLDYgKzIzNzEsNyBAQAorIyAgRmlsZTog
YW1kZ3B1L2djXzExXzBfMV9tZWMuYmluCisjICBGaWxlOiBhbWRncHUvZ2NfMTFfMF8xX21lcy5i
aW4KKyMgIEZpbGU6IGFtZGdwdS9nY18xMV8wXzFfbWVzMS5iaW4KKyMgK0ZpbGU6IGFtZGdwdS9n
Y18xMV8wXzFfbWVzXzIuYmluCisjICBGaWxlOiBhbWRncHUvZ2NfMTFfMF8xX3BmcC5iaW4KKyMg
IEZpbGU6IGFtZGdwdS9nY18xMV8wXzFfcmxjLmJpbgorIyAgRmlsZTogYW1kZ3B1L2djXzExXzBf
Ml9pbXUuYmluCisjIEBAIC0yMzc3LDYgKzIzNzksNyBAQAorIyAgRmlsZTogYW1kZ3B1L2djXzEx
XzBfMl9tZWMuYmluCisjICBGaWxlOiBhbWRncHUvZ2NfMTFfMF8yX21lczEuYmluCisjICBGaWxl
OiBhbWRncHUvZ2NfMTFfMF8yX21lcy5iaW4KKyMgK0ZpbGU6IGFtZGdwdS9nY18xMV8wXzJfbWVz
XzIuYmluCisjICBGaWxlOiBhbWRncHUvZ2NfMTFfMF8yX3BmcC5iaW4KKyMgIEZpbGU6IGFtZGdw
dS9nY18xMV8wXzJfcmxjLmJpbgorIyAgRmlsZTogYW1kZ3B1L2djXzExXzBfNF9pbXUuYmluCisj
IEBAIC0yMzg0LDYgKzIzODcsNyBAQAorIyAgRmlsZTogYW1kZ3B1L2djXzExXzBfNF9tZWMuYmlu
CisjICBGaWxlOiBhbWRncHUvZ2NfMTFfMF80X21lcy5iaW4KKyMgIEZpbGU6IGFtZGdwdS9nY18x
MV8wXzRfbWVzMS5iaW4KKyMgK0ZpbGU6IGFtZGdwdS9nY18xMV8wXzRfbWVzXzIuYmluCisjICBG
aWxlOiBhbWRncHUvZ2NfMTFfMF80X3BmcC5iaW4KKyMgIEZpbGU6IGFtZGdwdS9nY18xMV8wXzRf
cmxjLmJpbgorIyAgRmlsZTogYW1kZ3B1L2Rjbl8zXzFfNF9kbWN1Yi5iaW4KKyMgQEAgLTI3MTgs
OCArMjcyMiwxNiBAQAorIyAgRmlsZTogYnJjbS9icmNtZm1hYzQzNDU1LXNkaW8uQVctQ00yNTZT
TS50eHQKKyMgIExpbms6IGJyY20vYnJjbWZtYWM0MzQ1NS1zZGlvLmJlYWdsZSxhbTU3MjktYmVh
Z2xlYm9uZWFpLnR4dCAtPiBicmNtZm1hYzQzNDU1LXNkaW8uQVctQ00yNTZTTS50eHQKKyMgIExp
bms6IGJyY20vYnJjbWZtYWM0MzQ1NS1zZGlvLnBpbmU2NCxwaW5lYm9vay1wcm8udHh0IC0+IGJy
Y21mbWFjNDM0NTUtc2Rpby5BVy1DTTI1NlNNLnR4dAorIyArTGluazogYnJjbS9icmNtZm1hYzQz
NDU1LXNkaW8ucGluZTY0LHBpbmVub3RlLXYxLjEudHh0IC0+IGJyY21mbWFjNDM0NTUtc2Rpby5B
Vy1DTTI1NlNNLnR4dAorIyArTGluazogYnJjbS9icmNtZm1hYzQzNDU1LXNkaW8ucGluZTY0LHBp
bmVub3RlLXYxLjIudHh0IC0+IGJyY21mbWFjNDM0NTUtc2Rpby5BVy1DTTI1NlNNLnR4dAorIyAg
TGluazogYnJjbS9icmNtZm1hYzQzNDU1LXNkaW8ucGluZTY0LHBpbmVwaG9uZS1wcm8udHh0IC0+
IGJyY21mbWFjNDM0NTUtc2Rpby5BVy1DTTI1NlNNLnR4dAorIyArTGluazogYnJjbS9icmNtZm1h
YzQzNDU1LXNkaW8ucGluZTY0LHF1YXJ0ejY0LWEudHh0IC0+IGJyY21mbWFjNDM0NTUtc2Rpby5B
Vy1DTTI1NlNNLnR4dAorIyAgTGluazogYnJjbS9icmNtZm1hYzQzNDU1LXNkaW8ucGluZTY0LHF1
YXJ0ejY0LWIudHh0IC0+IGJyY21mbWFjNDM0NTUtc2Rpby5BVy1DTTI1NlNNLnR4dAorIyArTGlu
azogYnJjbS9icmNtZm1hYzQzNDU1LXNkaW8ucGluZTY0LHJvY2twcm82NC12Mi4wLnR4dCAtPiBi
cmNtZm1hYzQzNDU1LXNkaW8uQVctQ00yNTZTTS50eHQKKyMgK0xpbms6IGJyY20vYnJjbWZtYWM0
MzQ1NS1zZGlvLnBpbmU2NCxyb2NrcHJvNjQtdjIuMS50eHQgLT4gYnJjbWZtYWM0MzQ1NS1zZGlv
LkFXLUNNMjU2U00udHh0CisjICtMaW5rOiBicmNtL2JyY21mbWFjNDM0NTUtc2Rpby5waW5lNjQs
c29xdWFydHotbW9kZWwtYS50eHQgLT4gYnJjbWZtYWM0MzQ1NS1zZGlvLkFXLUNNMjU2U00udHh0
CisjICtMaW5rOiBicmNtL2JyY21mbWFjNDM0NTUtc2Rpby5waW5lNjQsc29xdWFydHotY200aW8u
dHh0IC0+IGJyY21mbWFjNDM0NTUtc2Rpby5BVy1DTTI1NlNNLnR4dAorIyArTGluazogYnJjbS9i
cmNtZm1hYzQzNDU1LXNkaW8ucGluZTY0LHNvcXVhcnR6LWJsYWRlLnR4dCAtPiBicmNtZm1hYzQz
NDU1LXNkaW8uQVctQ00yNTZTTS50eHQKKyMgIAorIyAgTGljZW5jZTogR1BMdjIuIFNlZSBHUEwt
MiBmb3IgZGV0YWlscy4KKyMgIAorIyBAQCAtMjk3MywxNSArMjk4NSw2IEBACisjICAKKyMgIC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCisjICAKKyMgLURyaXZlcjogcnRsODE4OGV1IC0gUmVhbHRlayA4MDIu
MTFuIFdMQU4gZHJpdmVyIGZvciBSVEw4MTg4RVUKKyMgLQorIyAtSW5mbzogVGFrZW4gZnJvbSBS
ZWFsdGVrIHZlcnNpb24gUlRMODE4OEVVU19saW51eF92NC4xLjRfNjc3My4yMDEzMDIyMgorIyAt
RmlsZTogcnRsd2lmaS9ydGw4MTg4ZXVmdy5iaW4KKyMgLQorIyAtTGljZW5jZTogUmVkaXN0cmli
dXRhYmxlLiBTZWUgTElDRU5DRS5ydGx3aWZpX2Zpcm13YXJlLnR4dCBmb3IgZGV0YWlscy4KKyMg
LQorIyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgLQorIyAgRHJpdmVyOiBydGw4ODIxYWUgLSBSZWFs
dGVrIDgwMi4xMW4gV0xBTiBkcml2ZXIgZm9yIFJUTDg4MTJBRQorIyAgCisjICBJbmZvOiBGcm9t
IFZlbmRvcidzIHJlYWx0ZWsvcnRsd2lmaV9saW51eF9tYWM4MDIxMV8wMDE5LjAzMjAuMjAxNFY2
MjggZHJpdmVyCisjIEBAIC0zMDM1LDggKzMwMzgsOSBAQAorIyAgCisjICAtLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQorIyAgCisjIC1Ecml2ZXI6IHJ0dzg5IC0gUmVhbHRlayA4MDIuMTFheCBXTEFOIGRyaXZl
ciBmb3IgUlRMODg1MkEvUlRMODg1MkIvUlRMODg1MkMKKyMgLQorIyArRHJpdmVyOiBydHc4OSAt
IFJlYWx0ZWsgODAyLjExYXggV0xBTiBkcml2ZXIgZm9yIFJUTDg4NTFCL1JUTDg4NTJBL1JUTDg4
NTJCL1JUTDg4NTJDCisjICsKKyMgK0ZpbGU6IHJ0dzg5L3J0dzg4NTFiX2Z3LmJpbgorIyAgRmls
ZTogcnR3ODkvcnR3ODg1MmFfZncuYmluCisjICBGaWxlOiBydHc4OS9ydHc4ODUyYl9mdy5iaW4K
KyMgIEZpbGU6IHJ0dzg5L3J0dzg4NTJiX2Z3LTEuYmluCisjIEBAIC0zMTExLDYgKzMxMTUsMjAg
QEAKKyMgIFZlcnNpb246IDE2LjAKKyMgIEZpbGU6IHJ0bHdpZmkvcnRsODcxMGJ1ZndfVU1DLmJp
bgorIyAgVmVyc2lvbjogMTYuMAorIyArCisjICtJbmZvOiBydGw4MTg4ZXUgdGFrZW4gZnJvbSBS
ZWFsdGVrIGRyaXZlciB2ZXJzaW9uCisjICsgICAgICB2NS4yLjIuNF8yNTQ4My4yMDE3MTIyMi4K
KyMgKyAgICAgIEZpcm13YXJlIGlzIGVtYmVkZGVkIGluIHRoZSBkcml2ZXIgYXMgZGF0YSBzdGF0
ZW1lbnRzLiBUaGlzIGluZm8KKyMgKyAgICAgIGhhcyBiZWVuIGV4dHJhY3RlZCBpbnRvIGEgYmlu
YXJ5IGZpbGUuCisjICtGaWxlOiBydGx3aWZpL3J0bDgxODhldWZ3LmJpbgorIyArVmVyc2lvbjog
MjguMAorIyArCisjICtJbmZvOiBydGw4MTkyZnUgdGFrZW4gZnJvbSBSZWFsdGVrIGRyaXZlciB2
ZXJzaW9uCisjICsgICAgICB2NS44LjYuMl8zNTUzOC4yMDE5MTAyOF9DT0VYMjAxOTA5MTAtMGQw
Mi4KKyMgKyAgICAgIEZpcm13YXJlIGlzIGVtYmVkZGVkIGluIHRoZSBkcml2ZXIgYXMgZGF0YSBz
dGF0ZW1lbnRzLiBUaGlzIGluZm8KKyMgKyAgICAgIGhhcyBiZWVuIGV4dHJhY3RlZCBpbnRvIGEg
YmluYXJ5IGZpbGUuCisjICtGaWxlOiBydGx3aWZpL3J0bDgxOTJmdWZ3LmJpbgorIyArVmVyc2lv
bjogNi4wCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UucnRs
d2lmaV9maXJtd2FyZS50eHQgZm9yIGRldGFpbHMuCisjICAKKyMgQEAgLTM4NzIsMTQgKzM4OTAs
MTkgQEAKKyMgIERyaXZlcjogbWljcm9jb2RlX2FtZCAtIEFNRCBDUFUgTWljcm9jb2RlIFVwZGF0
ZSBEcml2ZXIgZm9yIExpbnV4CisjICAKKyMgIEZpbGU6IGFtZC11Y29kZS9taWNyb2NvZGVfYW1k
LmJpbgorIyArUmF3OiBhbWQtdWNvZGUvbWljcm9jb2RlX2FtZC5iaW4KKyMgIFZlcnNpb246IDIw
MTMtMDctMTAKKyMgIEZpbGU6IGFtZC11Y29kZS9taWNyb2NvZGVfYW1kX2ZhbTE1aC5iaW4KKyMg
K1JhdzogYW1kLXVjb2RlL21pY3JvY29kZV9hbWRfZmFtMTVoLmJpbgorIyAgVmVyc2lvbjogMjAx
OC0wNS0yNAorIyAgRmlsZTogYW1kLXVjb2RlL21pY3JvY29kZV9hbWRfZmFtMTZoLmJpbgorIyAr
UmF3OiBhbWQtdWNvZGUvbWljcm9jb2RlX2FtZF9mYW0xNmguYmluCisjICBWZXJzaW9uOiAyMDE0
LTEwLTI4CisjICBGaWxlOiBhbWQtdWNvZGUvbWljcm9jb2RlX2FtZF9mYW0xN2guYmluCisjICtS
YXc6IGFtZC11Y29kZS9taWNyb2NvZGVfYW1kX2ZhbTE3aC5iaW4KKyMgIFZlcnNpb246IDIwMjMt
MDQtMTMKKyMgIEZpbGU6IGFtZC11Y29kZS9taWNyb2NvZGVfYW1kX2ZhbTE5aC5iaW4KKyMgK1Jh
dzogYW1kLXVjb2RlL21pY3JvY29kZV9hbWRfZmFtMTloLmJpbgorIyAgVmVyc2lvbjogMjAyMy0w
MS0zMQorIyAgRmlsZTogYW1kLXVjb2RlL1JFQURNRQorIyAgCisjIEBAIC00NjgyLDYgKzQ3MDUs
OSBAQAorIyAgCisjICBGaWxlOiBpOTE1L210bF9ndWNfNzAuYmluCisjICBWZXJzaW9uOiBHdUMg
QVBJL0FQQiB2ZXIgNzAuNi42IGZvciBNZXRlb3JsYWtlCisjICsKKyMgK0ZpbGU6IGk5MTUvbXRs
X2h1Y19nc2MuYmluCisjICtWZXJzaW9uOiBIdUMgQVBJL0FQQiB2ZXIgOC41LjAgZm9yIE1ldGVv
cmxha2UKKyMgIAorIyAgTGljZW5zZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5pOTE1
IGZvciBkZXRhaWxzCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyBAQCAtNTExMSw3ICs1MTM3LDcg
QEAKKyMgIEZpbGU6IGF0bWVsL3dpbGMxMDAwX3AycF9mdy5iaW4KKyMgIEZpbGU6IGF0bWVsL3dp
bGMxMDAwX3dpZmlfZmlybXdhcmUuYmluCisjICBGaWxlOiBhdG1lbC93aWxjMTAwMF93aWZpX2Zp
cm13YXJlLTEuYmluCisjIC1WZXJzaW9uOiAxNS42CisjICtWZXJzaW9uOiAxNi4wCisjICAKKyMg
IExpY2Vuc2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UuYXRtZWwgZm9yIGRldGFpbHMK
KyMgIAorIyBAQCAtNTE3Miw3ICs1MTk4LDcgQEAKKyMgIEZpbGU6IG1lZGlhdGVrL210ODE5Mi9z
Y3AuaW1nCisjICBWZXJzaW9uOiB2Mi4wLjIwNTM2CisjICBGaWxlOiBtZWRpYXRlay9tdDgxOTUv
c2NwLmltZworIyAtVmVyc2lvbjogdjIuMC4yMDUzNgorIyArVmVyc2lvbjogdjIuMC4xMTk2Ngor
IyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLm1lZGlhdGVrIGZv
ciBkZXRhaWxzLgorIyAgCisjIEBAIC01MzQwLDkgKzUzNjYsOSBAQAorIyAgRHJpdmVyOiBtdDc5
MjEgLSBNZWRpYVRlayBNVDc5MjEgV2lyZWxlc3MgTUFDcworIyAgCisjICBGaWxlOiBtZWRpYXRl
ay9XSUZJX01UNzk2MV9wYXRjaF9tY3VfMV8yX2hkci5iaW4KKyMgLVZlcnNpb246IDIwMjMwMzMx
MTEwOTAyYQorIyArVmVyc2lvbjogMjAyMzA1MjYxMzA5MTdhCisjICBGaWxlOiBtZWRpYXRlay9X
SUZJX1JBTV9DT0RFX01UNzk2MV8xLmJpbgorIyAtVmVyc2lvbjogMjAyMzAzMzExMTA5MzkKKyMg
K1ZlcnNpb246IDIwMjMwNTI2MTMwOTU4CisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJs
ZS4gU2VlIExJQ0VOQ0UubWVkaWF0ZWsgZm9yIGRldGFpbHMuCisjICAKKyMgQEAgLTUzNTEsNyAr
NTM3Nyw3IEBACisjICBEcml2ZXI6IG10NzkyMSAtIE1lZGlhVGVrIE1UNzkyMSBibHVldG9vdGgg
Y2hpcHNldAorIyAgCisjICBGaWxlOiBtZWRpYXRlay9CVF9SQU1fQ09ERV9NVDc5NjFfMV8yX2hk
ci5iaW4KKyMgLVZlcnNpb246IDIwMjMwMzMxMTExMTU2CisjICtWZXJzaW9uOiAyMDIzMDUyNjEz
MTIxNAorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLm1lZGlh
dGVrIGZvciBkZXRhaWxzLgorIyAgCisjIEBAIC01MzYwLDkgKzUzODYsOSBAQAorIyAgRHJpdmVy
OiBtdDc5MjIgLSBNZWRpYVRlayBNVDc5MjIgV2lyZWxlc3MgTUFDcworIyAgCisjICBGaWxlOiBt
ZWRpYXRlay9XSUZJX01UNzkyMl9wYXRjaF9tY3VfMV8xX2hkci5iaW4KKyMgLVZlcnNpb246IDIw
MjMwNTA5MjAzNjEyYQorIyArVmVyc2lvbjogMjAyMzA1MzAxMjMxNTRhCisjICBGaWxlOiBtZWRp
YXRlay9XSUZJX1JBTV9DT0RFX01UNzkyMl8xLmJpbgorIyAtVmVyc2lvbjogMjAyMzA1MDkyMDM2
NTUKKyMgK1ZlcnNpb246IDIwMjMwNTMwMTIzMjM2CisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJp
YnV0YWJsZS4gU2VlIExJQ0VOQ0UubWVkaWF0ZWsgZm9yIGRldGFpbHMuCisjICAKKyMgQEAgLTUz
NzEsNyArNTM5Nyw3IEBACisjICBEcml2ZXI6IG10NzkyMiAtIE1lZGlhVGVrIE1UNzkyMiBibHVl
dG9vdGggY2hpcHNldAorIyAgCisjICBGaWxlOiBtZWRpYXRlay9CVF9SQU1fQ09ERV9NVDc5MjJf
MV8xX2hkci5iaW4KKyMgLVZlcnNpb246IDIwMjMwNTA5MjAzODM4CisjICtWZXJzaW9uOiAyMDIz
MDUzMDEyMzUzMQorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNF
Lm1lZGlhdGVrIGZvciBkZXRhaWxzLgorIyAgCisjIEBAIC01NTc4LDYgKzU2MDQsMTAgQEAKKyMg
IAorIyAgRHJpdmVyOiBxY29tX3E2djVfcGFzIC0gUXVhbGNvbW0gcmVtb3RlcHJvYyBmaXJtd2Fy
ZQorIyAgCisjICtGaWxlOiBxY29tL2FwcTgwMTYvbWJhLm1ibgorIyArRmlsZTogcWNvbS9hcHE4
MDE2L21vZGVtLm1ibgorIyArRmlsZTogcWNvbS9hcHE4MDE2L3djbnNzLm1ibgorIyArRmlsZTog
cWNvbS9hcHE4MDE2L1dDTlNTX3Fjb21fd2xhbl9udl9zYmMuYmluCisjICBGaWxlOiBxY29tL2Fw
cTgwOTYvYWRzcC5tYm4KKyMgIEZpbGU6IHFjb20vYXBxODA5Ni9hZHNwci5qc24KKyMgIEZpbGU6
IHFjb20vYXBxODA5Ni9hZHNwdWEuanNuCisjIEBAIC01NjA2LDcgKzU2MzYsOCBAQAorIyAgTGlj
ZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5xY29tIGFuZCBxY29tL05PVElDRS50
eHQgZm9yIGRldGFpbHMKKyMgIAorIyAgQmluYXJ5IGZpbGVzIHN1cHBsaWVkIG9yaWdpbmFsbHkg
ZnJvbQorIyAtaHR0cDovL3JlbGVhc2VzLmxpbmFyby5vcmcvOTZib2FyZHMvZHJhZ29uYm9hcmQ4
NDVjL3F1YWxjb21tL2Zpcm13YXJlL1JCM19maXJtd2FyZV8yMDE5MDUyOTE4MDM1Ni12NC56aXAK
KyMgK2h0dHA6Ly9yZWxlYXNlcy5saW5hcm8ub3JnLzk2Ym9hcmRzL2RyYWdvbmJvYXJkNDEwYy9x
dWFsY29tbS9maXJtd2FyZS9saW51eC1ib2FyZC1zdXBwb3J0LXBhY2thZ2UtcjEwMzYuMS56aXAK
KyMgK2h0dHA6Ly9yZWxlYXNlcy5saW5hcm8ub3JnLzk2Ym9hcmRzL2RyYWdvbmJvYXJkODQ1Yy9x
dWFsY29tbS9maXJtd2FyZS9SQjNfZmlybXdhcmVfMjAyMjExMjEwMDAwMDAtdjUuemlwCisjICBo
dHRwOi8vcmVsZWFzZXMubGluYXJvLm9yZy85NmJvYXJkcy9yYjUvcXVhbGNvbW0vZmlybXdhcmUv
UkI1X2Zpcm13YXJlXzIwMjEwMzMxLXY0LnppcAorIyAgCisjICBhZHNwLm1ibiBoYXMgYmVlbiBj
b252ZXJ0ZWQgZnJvbSAyMC1hZHNwX3NwbGl0L2Zpcm13YXJlL2Fkc3AuKiB1c2luZworIyBAQCAt
NTYyMCwxMyArNTY1MSwxNCBAQAorIyAgRHJpdmVyOiBxY29tX3E2djVfbXNzIC0gUXVhbGNvbW0g
bW9kZW0gc3Vic3lzdGVtIGZpcm13YXJlCisjICAKKyMgIEZpbGU6IHFjb20vc2RtODQ1L21iYS5t
Ym4KKyMgLUZpbGU6IHFjb20vc2RtODQ1L21vZGVtLm1ibgorIyArRmlsZTogcWNvbS9zZG04NDUv
bW9kZW1fbm0ubWJuCisjICBGaWxlOiBxY29tL3NkbTg0NS9tb2RlbXV3LmpzbgorIyArTGluazog
cWNvbS9zZG04NDUvbW9kZW0ubWJuIC0+IG1vZGVtX25tLm1ibgorIyAgCisjICBMaWNlbmNlOiBS
ZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLnFjb20gYW5kIHFjb20vTk9USUNFLnR4dCBmb3Ig
ZGV0YWlscworIyAgCisjICBCaW5hcnkgZmlsZXMgc3VwcGxpZWQgb3JpZ2luYWxseSBmcm9tCisj
IC1odHRwOi8vcmVsZWFzZXMubGluYXJvLm9yZy85NmJvYXJkcy9kcmFnb25ib2FyZDg0NWMvcXVh
bGNvbW0vZmlybXdhcmUvUkIzX2Zpcm13YXJlXzIwMTkwNTI5MTgwMzU2LXY0LnppcAorIyAraHR0
cDovL3JlbGVhc2VzLmxpbmFyby5vcmcvOTZib2FyZHMvZHJhZ29uYm9hcmQ4NDVjL3F1YWxjb21t
L2Zpcm13YXJlL1JCM19maXJtd2FyZV8yMDIyMTEyMTAwMDAwMC12NS56aXAKKyMgIAorIyAgbW9k
ZW0ubWJuIGhhcyBiZWVuIGNvbnZlcnRlZCBmcm9tIDI4LW1vZGVtL21vZGVtLiogdXNpbmcKKyMg
IGh0dHBzOi8vZ2l0aHViLmNvbS9hbmRlcnNzb24vcGlsLXNxdWFzaGVyCisjIEBAIC01ODAyLDgg
KzU4MzQsOCBAQAorIyAgCisjICBMaWNlbnNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNF
LmljZSBmb3IgZGV0YWlscworIyAgCisjIC1GaWxlOiBpbnRlbC9pY2UvZGRwLWNvbW1zL2ljZV9j
b21tcy0xLjMuMzEuMC5wa2cKKyMgLUZpbGU6IGludGVsL2ljZS9kZHAtd2lyZWxlc3NfZWRnZS9p
Y2Vfd2lyZWxlc3NfZWRnZS0xLjMuNy4wLnBrZworIyArRmlsZTogaW50ZWwvaWNlL2RkcC1jb21t
cy9pY2VfY29tbXMtMS4zLjQwLjAucGtnCisjICtGaWxlOiBpbnRlbC9pY2UvZGRwLXdpcmVsZXNz
X2VkZ2UvaWNlX3dpcmVsZXNzX2VkZ2UtMS4zLjEwLjAucGtnCisjICAKKyMgIExpY2Vuc2U6IFJl
ZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UuaWNlX2VuaGFuY2VkIGZvciBkZXRhaWxzCisjICAK
KyMgQEAgLTYwNzMsNiArNjEwNSw2NiBAQAorIyAgRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1z
cGstcHJvdC0xMDQzMWUxMi1zcGtpZDAtcjAuYmluCisjICBGaWxlOiBjaXJydXMvY3MzNWw0MS1k
c3AxLXNway1wcm90LTEwNDMxZTEyLXNwa2lkMS1sMC5iaW4KKyMgIEZpbGU6IGNpcnJ1cy9jczM1
bDQxLWRzcDEtc3BrLXByb3QtMTA0MzFlMTItc3BraWQxLXIwLmJpbgorIyArTGluazogY2lycnVz
L2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMWI5My53bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9o
YWxvX2NzcGxfUkFNX3JldkIyXzI5LjYzLjEud21mdworIyArTGluazogY2lycnVzL2NzMzVsNDEt
ZHNwMS1zcGstY2FsaS0xMDQzMWI5My53bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxf
UkFNX3JldkIyXzI5LjYzLjEud21mdworIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGst
cHJvdC0xMDQzMWEyMC53bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFNX3JldkIy
XzI5LjYzLjEud21mdworIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDQz
MWEyMC53bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjYzLjEu
d21mdworIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMWEzMC53bWZ3
IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjYzLjEud21mdworIyAr
TGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDQzMWEzMC53bWZ3IC0+IGNzMzVs
NDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjYzLjEud21mdworIyArTGluazogY2ly
cnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMWE0MC53bWZ3IC0+IGNzMzVsNDEvdjYuNjEu
MS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjYzLjEud21mdworIyArTGluazogY2lycnVzL2NzMzVs
NDEtZHNwMS1zcGstY2FsaS0xMDQzMWE0MC53bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2Nz
cGxfUkFNX3JldkIyXzI5LjYzLjEud21mdworIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1z
cGstcHJvdC0xMDQzMWE1MC53bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFNX3Jl
dkIyXzI5LjYzLjEud21mdworIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0x
MDQzMWE1MC53bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjYz
LjEud21mdworIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMWE2MC53
bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjYzLjEud21mdwor
IyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDQzMWE2MC53bWZ3IC0+IGNz
MzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjYzLjEud21mdworIyArRmlsZTog
Y2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMWI5My1zcGtpZDAtbDAuYmluCisjICtG
aWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMxYjkzLXNwa2lkMC1yMC5iaW4K
KyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzFiOTMtc3BraWQxLWww
LmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMWI5My1zcGtp
ZDEtcjAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwNDMxYjkz
LXNwa2lkMC1sMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTA0
MzFiOTMtc3BraWQwLXIwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2Fs
aS0xMDQzMWI5My1zcGtpZDEtbDAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNw
ay1jYWxpLTEwNDMxYjkzLXNwa2lkMS1yMC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRz
cDEtc3BrLXByb3QtMTA0MzNhMjAtc3BraWQwLWwwLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLXBy
b3QtMTA0MzFiOTMtc3BraWQwLWwwLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1z
cGstcHJvdC0xMDQzM2EyMC1zcGtpZDAtcjAuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstcHJvdC0x
MDQzMWI5My1zcGtpZDAtcjAuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1w
cm90LTEwNDMzYTIwLXNwa2lkMS1sMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMx
YjkzLXNwa2lkMS1sMC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3Qt
MTA0MzNhMjAtc3BraWQxLXIwLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzFiOTMt
c3BraWQxLXIwLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDQz
M2EyMC1zcGtpZDAtbDAuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDQzMWI5My1zcGtp
ZDAtbDAuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwNDMzYTIw
LXNwa2lkMC1yMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwNDMxYjkzLXNwa2lkMC1y
MC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTA0MzNhMjAtc3Br
aWQxLWwwLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLWNhbGktMTA0MzFiOTMtc3BraWQxLWwwLmJp
bgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDQzM2EyMC1zcGtpZDEt
cjAuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDQzMWI5My1zcGtpZDEtcjAuYmluCisj
ICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMzYTMwLXNwa2lkMS1sMC5i
aW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTA0MzNhMzAtc3BraWQx
LWwwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzM2EzMC1z
cGtpZDEtcjAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwNDMz
YTMwLXNwa2lkMS1yMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3Qt
MTA0MzNhMzAtc3BraWQwLWwwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGst
Y2FsaS0xMDQzM2EzMC1zcGtpZDAtbDAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3Ax
LXNway1wcm90LTEwNDMzYTMwLXNwa2lkMC1yMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQx
LWRzcDEtc3BrLWNhbGktMTA0MzNhMzAtc3BraWQwLXIwLmJpbgorIyArTGluazogY2lycnVzL2Nz
MzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzM2E0MC1zcGtpZDAtbDAuYmluIC0+IGNzMzVsNDEtZHNw
MS1zcGstcHJvdC0xMDQzM2EzMC1zcGtpZDAtbDAuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0
MS1kc3AxLXNway1wcm90LTEwNDMzYTQwLXNwa2lkMC1yMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNw
ay1wcm90LTEwNDMzYTMwLXNwa2lkMC1yMC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRz
cDEtc3BrLXByb3QtMTA0MzNhNDAtc3BraWQxLWwwLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLXBy
b3QtMTA0MzNhMzAtc3BraWQxLWwwLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1z
cGstcHJvdC0xMDQzM2E0MC1zcGtpZDEtcjAuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstcHJvdC0x
MDQzM2EzMC1zcGtpZDEtcjAuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1j
YWxpLTEwNDMzYTQwLXNwa2lkMC1sMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwNDMz
YTMwLXNwa2lkMC1sMC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGkt
MTA0MzNhNDAtc3BraWQwLXIwLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLWNhbGktMTA0MzNhMzAt
c3BraWQwLXIwLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDQz
M2E0MC1zcGtpZDEtbDAuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDQzM2EzMC1zcGtp
ZDEtbDAuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwNDMzYTQw
LXNwa2lkMS1yMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwNDMzYTMwLXNwa2lkMS1y
MC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzNhNTAtc3Br
aWQxLWwwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDQzM2E1
MC1zcGtpZDEtbDAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEw
NDMzYTUwLXNwa2lkMS1yMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNh
bGktMTA0MzNhNTAtc3BraWQxLXIwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1z
cGstcHJvdC0xMDQzM2E1MC1zcGtpZDAtbDAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1k
c3AxLXNway1jYWxpLTEwNDMzYTUwLXNwa2lkMC1sMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1
bDQxLWRzcDEtc3BrLXByb3QtMTA0MzNhNTAtc3BraWQwLXIwLmJpbgorIyArRmlsZTogY2lycnVz
L2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDQzM2E1MC1zcGtpZDAtcjAuYmluCisjICtGaWxlOiBj
aXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMzYTYwLXNwa2lkMS1sMC5iaW4KKyMgK0Zp
bGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTA0MzNhNjAtc3BraWQxLWwwLmJpbgor
IyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzM2E2MC1zcGtpZDEtcjAu
YmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwNDMzYTYwLXNwa2lk
MS1yMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzNhNjAt
c3BraWQwLWwwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDQz
M2E2MC1zcGtpZDAtbDAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90
LTEwNDMzYTYwLXNwa2lkMC1yMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3Br
LWNhbGktMTA0MzNhNjAtc3BraWQwLXIwLmJpbgorIyAgTGluazogY2lycnVzL2NzMzVsNDEtZHNw
MS1zcGstcHJvdC0xN2FhMjMxNi53bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFN
X3JldkIyXzI5LjYzLjEud21mdworIyAgTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2Fs
aS0xN2FhMjMxNi53bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5
LjYzLjEud21mdworIyAgTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xN2FhMjMx
Ny53bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjYzLjEud21m
dworIyAKKyMKKwogU1VNTUFSWSA9ICJGaXJtd2FyZSBmaWxlcyBmb3IgdXNlIHdpdGggTGludXgg
a2VybmVsIgogSE9NRVBBR0UgPSAiaHR0cHM6Ly93d3cua2VybmVsLm9yZy8iCiBERVNDUklQVElP
TiA9ICJMaW51eCBmaXJtd2FyZSBpcyBhIHBhY2thZ2UgZGlzdHJpYnV0ZWQgYWxvbmdzaWRlIHRo
ZSBMaW51eCBrZXJuZWwgXApAQCAtMTMwLDcgKzQ2OCw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0xJQ0VOQ0UuQWJpbGlzO21kNT1iNWVlM2Y0MTA3ODBlNTY3MTFhZDQ4ZWFkYzIyYjhi
YyBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTkNFLnhjNDAwMDttZDU9MGZmNTFk
MmRjNDlmY2UwNDgxNGM5MTU1MDgxMDkyZjAgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8v
TElDRU5DRS54YzUwMDA7bWQ1PTFlMTcwYzEzMTc1MzIzYzMyYzdmNGQwOTk4ZDUzZjY2IFwKICAg
ICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOQ0UueGM1MDAwYzttZDU9MTJiMDJlZmEzMDQ5
ZGI2NWQ1MjRhZWI0MThkZDg3Y2EgXAotICAgICAgICAgICAgICAgICAgICBmaWxlOi8vV0hFTkNF
O21kNT0ke1dIRU5DRV9DSEtTVU19IFwKKyAgICAgICAgICAgICAgICAgICAgZmlsZTovL1dIRU5D
RTttZDU9NTdiZjg3NDA1NjkyNmYxMmFlYzI0MDVkM2ZjMzkwZDkgXAogICAgICAgICAgICAgICAg
ICAgICAiCiAjIFdIRU5DRSBjaGVja3N1bSBpcyBkZWZpbmVkIHNlcGFyYXRlbHkgdG8gZWFzZSBv
dmVycmlkaW5nIGl0IGlmCiAjIGNsYXNzLWRldnVwc3RyZWFtIGlzIHNlbGVjdGVkLgpAQCAtMjEy
LDcgKzU1MCw3IEBAIFNSQ19VUkk6Y2xhc3MtZGV2dXBzdHJlYW0gPSAiZ2l0Oi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2Zpcm13CiAjIFBpbiB0aGlzIHRvIHRoZSAy
MDIyMDUwOSByZWxlYXNlLCBvdmVycmlkZSB0aGlzIGluIGxvY2FsLmNvbmYKIFNSQ1JFVjpjbGFz
cy1kZXZ1cHN0cmVhbSA/PSAiYjE5Y2JkY2E3OGFiMmFkZmQyMTBjOTFiZTE1YTIyNTY4ZThiOGNh
ZSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjhiMWFjZmExNmYxZWU5NDczMmE2YWNiNTBkOWQ2
YzgzNWNmNTNhZjExMDY4YmQ4OWVkMjA3YmJlMDRhMWU5NTEiCitTUkNfVVJJW3NoYTI1NnN1bV0g
PSAiODc1OTcxMTFjMGQ0YjcxYjMxZTUzY2I4NWE5MmMzODY5MjFiODRjODI1YTQwMmRiOGM4MmUw
ZTg2MDE1NTAwZCIKIAogaW5oZXJpdCBhbGxhcmNoCiAKLS0gCjIuMzkuMgoK

--===============3867754439260922417==--

