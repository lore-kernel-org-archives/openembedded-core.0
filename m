Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D0BBEB64DD
	for <webhook@archiver.kernel.org>; Sat,  1 Jul 2023 16:02:06 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.10782.1688227325019974703
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jul 2023 09:02:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=gxD3lgYD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018912309f47-d0136816-5d66-46e0-a848-eaf0d3c40292-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1688227324;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=l5AAENvfEw0fbVwsz20PHqYVGski/AJThfh/Wbb3Lzc=;
	b=gxD3lgYDOXybB/KT17gK6GLsVo9LYjvi+QfpmzoKbK7Ry+rwd0dMs0n8rPlE/Mbm
	eKK8thLT3M7gj2cblsIW7v4TPE+QT5utBhX2OC17Jj46zcl0Z81gftB/WhnMnVHbLm6
	SgmsNYPZah9sRYkMWcnD34ZSO+3XwQ7DGMkvVu94=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1688227324;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=l5AAENvfEw0fbVwsz20PHqYVGski/AJThfh/Wbb3Lzc=;
	b=bP4Msn/ZJGvy6uTR6FgBM0tCf+BSJDbjTsXRQUBEUDgHCMbz2nc38sXUrpkguhZr
	JjOvlf3T8yEUPaL0rBb03HCofcjfSjB4ILw4DyFQ1HGUYUj5C1jevcsz7+/UbunQJE3
	liIQOMxc+6pi2E6Se4sy9BlgDOttULIBdji8XMQ8=
Content-Type: multipart/mixed; boundary="===============2836421228694007698=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] linux-firmware: upgrading to 20230625 SUCCEEDED
Message-ID: <0101018912309f47-d0136816-5d66-46e0-a848-eaf0d3c40292-000000@us-west-2.amazonses.com>
Date: Sat, 1 Jul 2023 16:02:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jul 2023 16:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183769

--===============2836421228694007698==
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
From bae52292a278dbf594671fc9cc4370612a3d8ade Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Jul 2023 13:54:52 +0000
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


--===============2836421228694007698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: FILELIST: added "/lib/firmware/amdgpu/gc_11_0_1_mes_2.bin /lib/firmware/amdgpu/gc_11_0_2_mes_2.bin /lib/firmware/amdgpu/gc_11_0_0_mes_2.bin /lib/firmware/amdgpu/gc_11_0_4_mes_2.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: FILELIST: added "/lib/firmware/brcm/brcmfmac43455-sdio.pine64,rockpro64-v2.1.txt /lib/firmware/brcm/brcmfmac43455-sdio.pine64,soquartz-model-a.txt /lib/firmware/brcm/brcmfmac43455-sdio.pine64,pinenote-v1.2.txt /lib/firmware/brcm/brcmfmac43455-sdio.pine64,quartz64-a.txt /lib/firmware/brcm/brcmfmac43455-sdio.pine64,rockpro64-v2.0.txt /lib/firmware/brcm/brcmfmac43455-sdio.pine64,soquartz-cm4io.txt /lib/firmware/brcm/brcmfmac43455-sdio.pine64,soquartz-blade.txt /lib/firmware/brcm/brcmfmac43455-sdio.pine64,pinenote-v1.1.txt"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: FILELIST: added "/lib/firmware/i915/mtl_huc_gsc.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-ice: FILELIST: removed "/lib/firmware/intel/ice/ddp-wireless_edge/ice_wireless_edge-1.3.7.0.pkg /lib/firmware/intel/ice/ddp-comms/ice_comms-1.3.31.0.pkg", added "/lib/firmware/intel/ice/ddp-comms/ice_comms-1.3.40.0.pkg /lib/firmware/intel/ice/ddp-wireless_edge/ice_wireless_edge-1.3.10.0.pkg"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: FILELIST: added "/lib/firmware/qcom/sdm845/modem_nm.mbn"
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: removed "/lib/firmware/cxgb4/t5fw-1.27.1.0.bin /lib/firmware/cxgb4/t6fw-1.27.1.0.bin /lib/firmware/cxgb4/t4fw-1.27.1.0.bin", added "/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431b93.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a20-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a20-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a40-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431a50.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a40-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431a20.wmfw /lib/firmware/qcom/apq8016/WCNSS_qcom_wlan_nv_sbc.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433
 a40-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a40-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431a40.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a30-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a30-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a40-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431a40.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431a50.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431a30.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid1-l0.bin /lib/firmware/qcom/apq8016/mba.mbn /lib/firmware/rtw89/rtw8851b_fw.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a40-spkid0-r0.bin /lib/firmware/cirrus
 /cs35l41-dsp1-spk-prot-10433a60-spkid0-l0.bin /lib/firmware/qcom/apq8016/modem.mbn /lib/firmware/qcom/apq8016/wcnss.mbn /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a60-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a40-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a40-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431b93.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431a60.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431a20.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431a30.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a20-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a20-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a60-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a60-spk
 id1-l0.bin /lib/firmware/rtlwifi/rtl8192fufw.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a20-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a20-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a30-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a30-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431b93-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431b93-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a20-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a20-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431a60.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431b93-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431b93-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a50-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a50-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a50-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1
 -spk-prot-10433a50-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid1-l0.bin /lib/firmware/cxgb4/t4fw-1.27.3.0.bin /lib/firmware/cxgb4/t5fw-1.27.3.0.bin /lib/firmware/cxgb4/t6fw-1.27.3.0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid1-r0.bin"

--===============2836421228694007698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/linux-firmware: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware: SRC_URI changed from "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20230515.tar.xz" to "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20230625.tar.xz"
packages/all-poky-linux/linux-firmware: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PV changed from "20230515" to "20230625"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: FILELIST: added "/lib/firmware/amdgpu/gc_11_0_2_mes_2.bin /lib/firmware/amdgpu/gc_11_0_4_mes_2.bin /lib/firmware/amdgpu/gc_11_0_0_mes_2.bin /lib/firmware/amdgpu/gc_11_0_1_mes_2.bin"
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
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: FILELIST: added "/lib/firmware/brcm/brcmfmac43455-sdio.pine64,pinenote-v1.2.txt /lib/firmware/brcm/brcmfmac43455-sdio.pine64,soquartz-blade.txt /lib/firmware/brcm/brcmfmac43455-sdio.pine64,soquartz-cm4io.txt /lib/firmware/brcm/brcmfmac43455-sdio.pine64,quartz64-a.txt /lib/firmware/brcm/brcmfmac43455-sdio.pine64,rockpro64-v2.1.txt /lib/firmware/brcm/brcmfmac43455-sdio.pine64,rockpro64-v2.0.txt /lib/firmware/brcm/brcmfmac43455-sdio.pine64,pinenote-v1.1.txt /lib/firmware/brcm/brcmfmac43455-sdio.pine64,soquartz-model-a.txt"
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
packages/all-poky-linux/linux-firmware/linux-firmware-ice: FILELIST: removed "/lib/firmware/intel/ice/ddp-comms/ice_comms-1.3.31.0.pkg /lib/firmware/intel/ice/ddp-wireless_edge/ice_wireless_edge-1.3.7.0.pkg", added "/lib/firmware/intel/ice/ddp-comms/ice_comms-1.3.40.0.pkg /lib/firmware/intel/ice/ddp-wireless_edge/ice_wireless_edge-1.3.10.0.pkg"
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
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: removed "/lib/firmware/cxgb4/t4fw-1.27.1.0.bin /lib/firmware/cxgb4/t5fw-1.27.1.0.bin /lib/firmware/cxgb4/t6fw-1.27.1.0.bin", added "/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431a20.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a30-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a30-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a20-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a20-spkid1-l0.bin /lib/firmware/rtw89/rtw8851b_fw.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a50-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a50-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a50-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a50-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a60-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431a30.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431a40.wmfw 
 /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a60-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a60-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a20-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a20-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431a60.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a40-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a40-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431a50.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a40-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a40-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431b93-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431b93-spkid1-r0.bin /lib/firmware/cirrus/cs35
 l41-dsp1-spk-prot-10431b93-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431b93-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a40-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a40-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431a30.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431a50.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a20-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a20-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431b93.wmfw /lib/firmware/qcom/apq8016/WCNSS_qcom_wlan_nv_sbc.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431b93.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a20-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a20-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid1-l0.bin /lib/firmware/
 cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a40-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a40-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid0-r0.bin /lib/firmware/qcom/apq8016/modem.mbn /lib/firmware/qcom/apq8016/wcnss.mbn /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431a60.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a60-spkid0-r0.bin /lib/firmware/cxgb4/t4fw-1.27.3.0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid1-r0.bin /lib/firmware/cxgb4/t5fw-1.27.3.0.bin /lib/firmwar
 e/cirrus/cs35l41-dsp1-spk-prot-10431a20.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a30-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a30-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid1-r0.bin /lib/firmware/qcom/apq8016/mba.mbn /lib/firmware/cxgb4/t6fw-1.27.3.0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431a40.wmfw /lib/firmware/rtlwifi/rtl8192fufw.bin"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGV changed from 20230515 [default] to 20230625 [default]
packages/all-poky-linux/linux-firmware/linux-firmware: PKGSIZE changed from 266923863 to 283276123 (+6%)

--===============2836421228694007698==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-linux-firmware-upgrade-20230515-20230625.patch"

RnJvbSBiYWU1MjI5MmEyNzhkYmY1OTQ2NzFmYzljYzQzNzA2MTJhM2Q4YWRlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBKdWwgMjAyMyAxMzo1NDo1MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
bnV4LWZpcm13YXJlOiB1cGdyYWRlIDIwMjMwNTE1IC0+IDIwMjMwNjI1CgotLS0KIC4uLjIwMjMw
NTE1LmJiID0+IGxpbnV4LWZpcm13YXJlXzIwMjMwNjI1LmJifSB8IDM0MiArKysrKysrKysrKysr
KysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzNDAgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL3tsaW51eC1maXJtd2Fy
ZV8yMDIzMDUxNS5iYiA9PiBsaW51eC1maXJtd2FyZV8yMDIzMDYyNS5iYn0gKDc4JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJl
XzIwMjMwNTE1LmJiIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1m
aXJtd2FyZV8yMDIzMDYyNS5iYgpzaW1pbGFyaXR5IGluZGV4IDc4JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlXzIwMjMwNTE1LmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13
YXJlXzIwMjMwNjI1LmJiCmluZGV4IDM0NzAxMzEyOTQuLjVhMWMxZTIwNmEgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgtZmlybXdhcmVfMjAyMzA1
MTUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJt
d2FyZV8yMDIzMDYyNS5iYgpAQCAtMSwzICsxLDM0MSBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxF
U19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgor
IyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhl
IG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYg
bmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2Fn
ZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRl
OiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0t
IFdIRU5DRQorIyArKysgV0hFTkNFCisjIEBAIC01MzYsMTQgKzUzNiwxNCBAQAorIyAgCisjICBG
aWxlOiBjeGdiNC90NGZ3LTEuMTQuNC4wLmJpbgorIyAgRmlsZTogY3hnYjQvdDRmdy0xLjE1LjM3
LjAuYmluCisjIC1GaWxlOiBjeGdiNC90NGZ3LTEuMjcuMS4wLmJpbgorIyAtTGluazogY3hnYjQv
dDRmdy5iaW4gLT4gdDRmdy0xLjI3LjEuMC5iaW4KKyMgK0ZpbGU6IGN4Z2I0L3Q0ZnctMS4yNy4z
LjAuYmluCisjICtMaW5rOiBjeGdiNC90NGZ3LmJpbiAtPiB0NGZ3LTEuMjcuMy4wLmJpbgorIyAg
RmlsZTogY3hnYjQvdDVmdy0xLjE0LjQuMC5iaW4KKyMgIEZpbGU6IGN4Z2I0L3Q1ZnctMS4xNS4z
Ny4wLmJpbgorIyAtRmlsZTogY3hnYjQvdDVmdy0xLjI3LjEuMC5iaW4KKyMgLUxpbms6IGN4Z2I0
L3Q1ZncuYmluIC0+IHQ1ZnctMS4yNy4xLjAuYmluCisjIC1GaWxlOiBjeGdiNC90NmZ3LTEuMjcu
MS4wLmJpbgorIyAtTGluazogY3hnYjQvdDZmdy5iaW4gLT4gdDZmdy0xLjI3LjEuMC5iaW4KKyMg
K0ZpbGU6IGN4Z2I0L3Q1ZnctMS4yNy4zLjAuYmluCisjICtMaW5rOiBjeGdiNC90NWZ3LmJpbiAt
PiB0NWZ3LTEuMjcuMy4wLmJpbgorIyArRmlsZTogY3hnYjQvdDZmdy0xLjI3LjMuMC5iaW4KKyMg
K0xpbms6IGN4Z2I0L3Q2ZncuYmluIC0+IHQ2ZnctMS4yNy4zLjAuYmluCisjICBGaWxlOiBjeGdi
NC9hcTEyMDJfZncuY2xkCisjICBGaWxlOiBjeGdiNC9iY204NDgzLmJpbgorIyAgRmlsZTogY3hn
YjQvY29uZmlncy90NC1jb25maWctZGVmYXVsdC50eHQKKyMgQEAgLTIzNjMsNiArMjM2Myw3IEBA
CisjICBGaWxlOiBhbWRncHUvZ2NfMTFfMF8wX21lYy5iaW4KKyMgIEZpbGU6IGFtZGdwdS9nY18x
MV8wXzBfbWVzMS5iaW4KKyMgIEZpbGU6IGFtZGdwdS9nY18xMV8wXzBfbWVzLmJpbgorIyArRmls
ZTogYW1kZ3B1L2djXzExXzBfMF9tZXNfMi5iaW4KKyMgIEZpbGU6IGFtZGdwdS9nY18xMV8wXzBf
cGZwLmJpbgorIyAgRmlsZTogYW1kZ3B1L2djXzExXzBfMF9ybGMuYmluCisjICBGaWxlOiBhbWRn
cHUvZ2NfMTFfMF8xX2ltdS5iaW4KKyMgQEAgLTIzNzAsNiArMjM3MSw3IEBACisjICBGaWxlOiBh
bWRncHUvZ2NfMTFfMF8xX21lYy5iaW4KKyMgIEZpbGU6IGFtZGdwdS9nY18xMV8wXzFfbWVzLmJp
bgorIyAgRmlsZTogYW1kZ3B1L2djXzExXzBfMV9tZXMxLmJpbgorIyArRmlsZTogYW1kZ3B1L2dj
XzExXzBfMV9tZXNfMi5iaW4KKyMgIEZpbGU6IGFtZGdwdS9nY18xMV8wXzFfcGZwLmJpbgorIyAg
RmlsZTogYW1kZ3B1L2djXzExXzBfMV9ybGMuYmluCisjICBGaWxlOiBhbWRncHUvZ2NfMTFfMF8y
X2ltdS5iaW4KKyMgQEAgLTIzNzcsNiArMjM3OSw3IEBACisjICBGaWxlOiBhbWRncHUvZ2NfMTFf
MF8yX21lYy5iaW4KKyMgIEZpbGU6IGFtZGdwdS9nY18xMV8wXzJfbWVzMS5iaW4KKyMgIEZpbGU6
IGFtZGdwdS9nY18xMV8wXzJfbWVzLmJpbgorIyArRmlsZTogYW1kZ3B1L2djXzExXzBfMl9tZXNf
Mi5iaW4KKyMgIEZpbGU6IGFtZGdwdS9nY18xMV8wXzJfcGZwLmJpbgorIyAgRmlsZTogYW1kZ3B1
L2djXzExXzBfMl9ybGMuYmluCisjICBGaWxlOiBhbWRncHUvZ2NfMTFfMF80X2ltdS5iaW4KKyMg
QEAgLTIzODQsNiArMjM4Nyw3IEBACisjICBGaWxlOiBhbWRncHUvZ2NfMTFfMF80X21lYy5iaW4K
KyMgIEZpbGU6IGFtZGdwdS9nY18xMV8wXzRfbWVzLmJpbgorIyAgRmlsZTogYW1kZ3B1L2djXzEx
XzBfNF9tZXMxLmJpbgorIyArRmlsZTogYW1kZ3B1L2djXzExXzBfNF9tZXNfMi5iaW4KKyMgIEZp
bGU6IGFtZGdwdS9nY18xMV8wXzRfcGZwLmJpbgorIyAgRmlsZTogYW1kZ3B1L2djXzExXzBfNF9y
bGMuYmluCisjICBGaWxlOiBhbWRncHUvZGNuXzNfMV80X2RtY3ViLmJpbgorIyBAQCAtMjcxOCw4
ICsyNzIyLDE2IEBACisjICBGaWxlOiBicmNtL2JyY21mbWFjNDM0NTUtc2Rpby5BVy1DTTI1NlNN
LnR4dAorIyAgTGluazogYnJjbS9icmNtZm1hYzQzNDU1LXNkaW8uYmVhZ2xlLGFtNTcyOS1iZWFn
bGVib25lYWkudHh0IC0+IGJyY21mbWFjNDM0NTUtc2Rpby5BVy1DTTI1NlNNLnR4dAorIyAgTGlu
azogYnJjbS9icmNtZm1hYzQzNDU1LXNkaW8ucGluZTY0LHBpbmVib29rLXByby50eHQgLT4gYnJj
bWZtYWM0MzQ1NS1zZGlvLkFXLUNNMjU2U00udHh0CisjICtMaW5rOiBicmNtL2JyY21mbWFjNDM0
NTUtc2Rpby5waW5lNjQscGluZW5vdGUtdjEuMS50eHQgLT4gYnJjbWZtYWM0MzQ1NS1zZGlvLkFX
LUNNMjU2U00udHh0CisjICtMaW5rOiBicmNtL2JyY21mbWFjNDM0NTUtc2Rpby5waW5lNjQscGlu
ZW5vdGUtdjEuMi50eHQgLT4gYnJjbWZtYWM0MzQ1NS1zZGlvLkFXLUNNMjU2U00udHh0CisjICBM
aW5rOiBicmNtL2JyY21mbWFjNDM0NTUtc2Rpby5waW5lNjQscGluZXBob25lLXByby50eHQgLT4g
YnJjbWZtYWM0MzQ1NS1zZGlvLkFXLUNNMjU2U00udHh0CisjICtMaW5rOiBicmNtL2JyY21mbWFj
NDM0NTUtc2Rpby5waW5lNjQscXVhcnR6NjQtYS50eHQgLT4gYnJjbWZtYWM0MzQ1NS1zZGlvLkFX
LUNNMjU2U00udHh0CisjICBMaW5rOiBicmNtL2JyY21mbWFjNDM0NTUtc2Rpby5waW5lNjQscXVh
cnR6NjQtYi50eHQgLT4gYnJjbWZtYWM0MzQ1NS1zZGlvLkFXLUNNMjU2U00udHh0CisjICtMaW5r
OiBicmNtL2JyY21mbWFjNDM0NTUtc2Rpby5waW5lNjQscm9ja3BybzY0LXYyLjAudHh0IC0+IGJy
Y21mbWFjNDM0NTUtc2Rpby5BVy1DTTI1NlNNLnR4dAorIyArTGluazogYnJjbS9icmNtZm1hYzQz
NDU1LXNkaW8ucGluZTY0LHJvY2twcm82NC12Mi4xLnR4dCAtPiBicmNtZm1hYzQzNDU1LXNkaW8u
QVctQ00yNTZTTS50eHQKKyMgK0xpbms6IGJyY20vYnJjbWZtYWM0MzQ1NS1zZGlvLnBpbmU2NCxz
b3F1YXJ0ei1tb2RlbC1hLnR4dCAtPiBicmNtZm1hYzQzNDU1LXNkaW8uQVctQ00yNTZTTS50eHQK
KyMgK0xpbms6IGJyY20vYnJjbWZtYWM0MzQ1NS1zZGlvLnBpbmU2NCxzb3F1YXJ0ei1jbTRpby50
eHQgLT4gYnJjbWZtYWM0MzQ1NS1zZGlvLkFXLUNNMjU2U00udHh0CisjICtMaW5rOiBicmNtL2Jy
Y21mbWFjNDM0NTUtc2Rpby5waW5lNjQsc29xdWFydHotYmxhZGUudHh0IC0+IGJyY21mbWFjNDM0
NTUtc2Rpby5BVy1DTTI1NlNNLnR4dAorIyAgCisjICBMaWNlbmNlOiBHUEx2Mi4gU2VlIEdQTC0y
IGZvciBkZXRhaWxzLgorIyAgCisjIEBAIC0yOTczLDE1ICsyOTg1LDYgQEAKKyMgIAorIyAgLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KKyMgIAorIyAtRHJpdmVyOiBydGw4MTg4ZXUgLSBSZWFsdGVrIDgwMi4x
MW4gV0xBTiBkcml2ZXIgZm9yIFJUTDgxODhFVQorIyAtCisjIC1JbmZvOiBUYWtlbiBmcm9tIFJl
YWx0ZWsgdmVyc2lvbiBSVEw4MTg4RVVTX2xpbnV4X3Y0LjEuNF82NzczLjIwMTMwMjIyCisjIC1G
aWxlOiBydGx3aWZpL3J0bDgxODhldWZ3LmJpbgorIyAtCisjIC1MaWNlbmNlOiBSZWRpc3RyaWJ1
dGFibGUuIFNlZSBMSUNFTkNFLnJ0bHdpZmlfZmlybXdhcmUudHh0IGZvciBkZXRhaWxzLgorIyAt
CisjIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAtCisjICBEcml2ZXI6IHJ0bDg4MjFhZSAtIFJlYWx0
ZWsgODAyLjExbiBXTEFOIGRyaXZlciBmb3IgUlRMODgxMkFFCisjICAKKyMgIEluZm86IEZyb20g
VmVuZG9yJ3MgcmVhbHRlay9ydGx3aWZpX2xpbnV4X21hYzgwMjExXzAwMTkuMDMyMC4yMDE0VjYy
OCBkcml2ZXIKKyMgQEAgLTMwMzUsOCArMzAzOCw5IEBACisjICAKKyMgIC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCisjICAKKyMgLURyaXZlcjogcnR3ODkgLSBSZWFsdGVrIDgwMi4xMWF4IFdMQU4gZHJpdmVy
IGZvciBSVEw4ODUyQS9SVEw4ODUyQi9SVEw4ODUyQworIyAtCisjICtEcml2ZXI6IHJ0dzg5IC0g
UmVhbHRlayA4MDIuMTFheCBXTEFOIGRyaXZlciBmb3IgUlRMODg1MUIvUlRMODg1MkEvUlRMODg1
MkIvUlRMODg1MkMKKyMgKworIyArRmlsZTogcnR3ODkvcnR3ODg1MWJfZncuYmluCisjICBGaWxl
OiBydHc4OS9ydHc4ODUyYV9mdy5iaW4KKyMgIEZpbGU6IHJ0dzg5L3J0dzg4NTJiX2Z3LmJpbgor
IyAgRmlsZTogcnR3ODkvcnR3ODg1MmJfZnctMS5iaW4KKyMgQEAgLTMxMTEsNiArMzExNSwyMCBA
QAorIyAgVmVyc2lvbjogMTYuMAorIyAgRmlsZTogcnRsd2lmaS9ydGw4NzEwYnVmd19VTUMuYmlu
CisjICBWZXJzaW9uOiAxNi4wCisjICsKKyMgK0luZm86IHJ0bDgxODhldSB0YWtlbiBmcm9tIFJl
YWx0ZWsgZHJpdmVyIHZlcnNpb24KKyMgKyAgICAgIHY1LjIuMi40XzI1NDgzLjIwMTcxMjIyLgor
IyArICAgICAgRmlybXdhcmUgaXMgZW1iZWRkZWQgaW4gdGhlIGRyaXZlciBhcyBkYXRhIHN0YXRl
bWVudHMuIFRoaXMgaW5mbworIyArICAgICAgaGFzIGJlZW4gZXh0cmFjdGVkIGludG8gYSBiaW5h
cnkgZmlsZS4KKyMgK0ZpbGU6IHJ0bHdpZmkvcnRsODE4OGV1ZncuYmluCisjICtWZXJzaW9uOiAy
OC4wCisjICsKKyMgK0luZm86IHJ0bDgxOTJmdSB0YWtlbiBmcm9tIFJlYWx0ZWsgZHJpdmVyIHZl
cnNpb24KKyMgKyAgICAgIHY1LjguNi4yXzM1NTM4LjIwMTkxMDI4X0NPRVgyMDE5MDkxMC0wZDAy
LgorIyArICAgICAgRmlybXdhcmUgaXMgZW1iZWRkZWQgaW4gdGhlIGRyaXZlciBhcyBkYXRhIHN0
YXRlbWVudHMuIFRoaXMgaW5mbworIyArICAgICAgaGFzIGJlZW4gZXh0cmFjdGVkIGludG8gYSBi
aW5hcnkgZmlsZS4KKyMgK0ZpbGU6IHJ0bHdpZmkvcnRsODE5MmZ1ZncuYmluCisjICtWZXJzaW9u
OiA2LjAKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5ydGx3
aWZpX2Zpcm13YXJlLnR4dCBmb3IgZGV0YWlscy4KKyMgIAorIyBAQCAtMzg3MiwxNCArMzg5MCwx
OSBAQAorIyAgRHJpdmVyOiBtaWNyb2NvZGVfYW1kIC0gQU1EIENQVSBNaWNyb2NvZGUgVXBkYXRl
IERyaXZlciBmb3IgTGludXgKKyMgIAorIyAgRmlsZTogYW1kLXVjb2RlL21pY3JvY29kZV9hbWQu
YmluCisjICtSYXc6IGFtZC11Y29kZS9taWNyb2NvZGVfYW1kLmJpbgorIyAgVmVyc2lvbjogMjAx
My0wNy0xMAorIyAgRmlsZTogYW1kLXVjb2RlL21pY3JvY29kZV9hbWRfZmFtMTVoLmJpbgorIyAr
UmF3OiBhbWQtdWNvZGUvbWljcm9jb2RlX2FtZF9mYW0xNWguYmluCisjICBWZXJzaW9uOiAyMDE4
LTA1LTI0CisjICBGaWxlOiBhbWQtdWNvZGUvbWljcm9jb2RlX2FtZF9mYW0xNmguYmluCisjICtS
YXc6IGFtZC11Y29kZS9taWNyb2NvZGVfYW1kX2ZhbTE2aC5iaW4KKyMgIFZlcnNpb246IDIwMTQt
MTAtMjgKKyMgIEZpbGU6IGFtZC11Y29kZS9taWNyb2NvZGVfYW1kX2ZhbTE3aC5iaW4KKyMgK1Jh
dzogYW1kLXVjb2RlL21pY3JvY29kZV9hbWRfZmFtMTdoLmJpbgorIyAgVmVyc2lvbjogMjAyMy0w
NC0xMworIyAgRmlsZTogYW1kLXVjb2RlL21pY3JvY29kZV9hbWRfZmFtMTloLmJpbgorIyArUmF3
OiBhbWQtdWNvZGUvbWljcm9jb2RlX2FtZF9mYW0xOWguYmluCisjICBWZXJzaW9uOiAyMDIzLTAx
LTMxCisjICBGaWxlOiBhbWQtdWNvZGUvUkVBRE1FCisjICAKKyMgQEAgLTQ2ODIsNiArNDcwNSw5
IEBACisjICAKKyMgIEZpbGU6IGk5MTUvbXRsX2d1Y183MC5iaW4KKyMgIFZlcnNpb246IEd1QyBB
UEkvQVBCIHZlciA3MC42LjYgZm9yIE1ldGVvcmxha2UKKyMgKworIyArRmlsZTogaTkxNS9tdGxf
aHVjX2dzYy5iaW4KKyMgK1ZlcnNpb246IEh1QyBBUEkvQVBCIHZlciA4LjUuMCBmb3IgTWV0ZW9y
bGFrZQorIyAgCisjICBMaWNlbnNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLmk5MTUg
Zm9yIGRldGFpbHMKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjIEBAIC01MTExLDcgKzUxMzcsNyBA
QAorIyAgRmlsZTogYXRtZWwvd2lsYzEwMDBfcDJwX2Z3LmJpbgorIyAgRmlsZTogYXRtZWwvd2ls
YzEwMDBfd2lmaV9maXJtd2FyZS5iaW4KKyMgIEZpbGU6IGF0bWVsL3dpbGMxMDAwX3dpZmlfZmly
bXdhcmUtMS5iaW4KKyMgLVZlcnNpb246IDE1LjYKKyMgK1ZlcnNpb246IDE2LjAKKyMgIAorIyAg
TGljZW5zZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5hdG1lbCBmb3IgZGV0YWlscwor
IyAgCisjIEBAIC01MTcyLDcgKzUxOTgsNyBAQAorIyAgRmlsZTogbWVkaWF0ZWsvbXQ4MTkyL3Nj
cC5pbWcKKyMgIFZlcnNpb246IHYyLjAuMjA1MzYKKyMgIEZpbGU6IG1lZGlhdGVrL210ODE5NS9z
Y3AuaW1nCisjIC1WZXJzaW9uOiB2Mi4wLjIwNTM2CisjICtWZXJzaW9uOiB2Mi4wLjExOTY2Cisj
ICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UubWVkaWF0ZWsgZm9y
IGRldGFpbHMuCisjICAKKyMgQEAgLTUzNDAsOSArNTM2Niw5IEBACisjICBEcml2ZXI6IG10Nzky
MSAtIE1lZGlhVGVrIE1UNzkyMSBXaXJlbGVzcyBNQUNzCisjICAKKyMgIEZpbGU6IG1lZGlhdGVr
L1dJRklfTVQ3OTYxX3BhdGNoX21jdV8xXzJfaGRyLmJpbgorIyAtVmVyc2lvbjogMjAyMzAzMzEx
MTA5MDJhCisjICtWZXJzaW9uOiAyMDIzMDUyNjEzMDkxN2EKKyMgIEZpbGU6IG1lZGlhdGVrL1dJ
RklfUkFNX0NPREVfTVQ3OTYxXzEuYmluCisjIC1WZXJzaW9uOiAyMDIzMDMzMTExMDkzOQorIyAr
VmVyc2lvbjogMjAyMzA1MjYxMzA5NTgKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxl
LiBTZWUgTElDRU5DRS5tZWRpYXRlayBmb3IgZGV0YWlscy4KKyMgIAorIyBAQCAtNTM1MSw3ICs1
Mzc3LDcgQEAKKyMgIERyaXZlcjogbXQ3OTIxIC0gTWVkaWFUZWsgTVQ3OTIxIGJsdWV0b290aCBj
aGlwc2V0CisjICAKKyMgIEZpbGU6IG1lZGlhdGVrL0JUX1JBTV9DT0RFX01UNzk2MV8xXzJfaGRy
LmJpbgorIyAtVmVyc2lvbjogMjAyMzAzMzExMTExNTYKKyMgK1ZlcnNpb246IDIwMjMwNTI2MTMx
MjE0CisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UubWVkaWF0
ZWsgZm9yIGRldGFpbHMuCisjICAKKyMgQEAgLTUzNjAsOSArNTM4Niw5IEBACisjICBEcml2ZXI6
IG10NzkyMiAtIE1lZGlhVGVrIE1UNzkyMiBXaXJlbGVzcyBNQUNzCisjICAKKyMgIEZpbGU6IG1l
ZGlhdGVrL1dJRklfTVQ3OTIyX3BhdGNoX21jdV8xXzFfaGRyLmJpbgorIyAtVmVyc2lvbjogMjAy
MzA1MDkyMDM2MTJhCisjICtWZXJzaW9uOiAyMDIzMDUzMDEyMzE1NGEKKyMgIEZpbGU6IG1lZGlh
dGVrL1dJRklfUkFNX0NPREVfTVQ3OTIyXzEuYmluCisjIC1WZXJzaW9uOiAyMDIzMDUwOTIwMzY1
NQorIyArVmVyc2lvbjogMjAyMzA1MzAxMjMyMzYKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmli
dXRhYmxlLiBTZWUgTElDRU5DRS5tZWRpYXRlayBmb3IgZGV0YWlscy4KKyMgIAorIyBAQCAtNTM3
MSw3ICs1Mzk3LDcgQEAKKyMgIERyaXZlcjogbXQ3OTIyIC0gTWVkaWFUZWsgTVQ3OTIyIGJsdWV0
b290aCBjaGlwc2V0CisjICAKKyMgIEZpbGU6IG1lZGlhdGVrL0JUX1JBTV9DT0RFX01UNzkyMl8x
XzFfaGRyLmJpbgorIyAtVmVyc2lvbjogMjAyMzA1MDkyMDM4MzgKKyMgK1ZlcnNpb246IDIwMjMw
NTMwMTIzNTMxCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0Uu
bWVkaWF0ZWsgZm9yIGRldGFpbHMuCisjICAKKyMgQEAgLTU1NzgsNiArNTYwNCwxMCBAQAorIyAg
CisjICBEcml2ZXI6IHFjb21fcTZ2NV9wYXMgLSBRdWFsY29tbSByZW1vdGVwcm9jIGZpcm13YXJl
CisjICAKKyMgK0ZpbGU6IHFjb20vYXBxODAxNi9tYmEubWJuCisjICtGaWxlOiBxY29tL2FwcTgw
MTYvbW9kZW0ubWJuCisjICtGaWxlOiBxY29tL2FwcTgwMTYvd2Nuc3MubWJuCisjICtGaWxlOiBx
Y29tL2FwcTgwMTYvV0NOU1NfcWNvbV93bGFuX252X3NiYy5iaW4KKyMgIEZpbGU6IHFjb20vYXBx
ODA5Ni9hZHNwLm1ibgorIyAgRmlsZTogcWNvbS9hcHE4MDk2L2Fkc3ByLmpzbgorIyAgRmlsZTog
cWNvbS9hcHE4MDk2L2Fkc3B1YS5qc24KKyMgQEAgLTU2MDYsNyArNTYzNiw4IEBACisjICBMaWNl
bmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLnFjb20gYW5kIHFjb20vTk9USUNFLnR4
dCBmb3IgZGV0YWlscworIyAgCisjICBCaW5hcnkgZmlsZXMgc3VwcGxpZWQgb3JpZ2luYWxseSBm
cm9tCisjIC1odHRwOi8vcmVsZWFzZXMubGluYXJvLm9yZy85NmJvYXJkcy9kcmFnb25ib2FyZDg0
NWMvcXVhbGNvbW0vZmlybXdhcmUvUkIzX2Zpcm13YXJlXzIwMTkwNTI5MTgwMzU2LXY0LnppcAor
IyAraHR0cDovL3JlbGVhc2VzLmxpbmFyby5vcmcvOTZib2FyZHMvZHJhZ29uYm9hcmQ0MTBjL3F1
YWxjb21tL2Zpcm13YXJlL2xpbnV4LWJvYXJkLXN1cHBvcnQtcGFja2FnZS1yMTAzNi4xLnppcAor
IyAraHR0cDovL3JlbGVhc2VzLmxpbmFyby5vcmcvOTZib2FyZHMvZHJhZ29uYm9hcmQ4NDVjL3F1
YWxjb21tL2Zpcm13YXJlL1JCM19maXJtd2FyZV8yMDIyMTEyMTAwMDAwMC12NS56aXAKKyMgIGh0
dHA6Ly9yZWxlYXNlcy5saW5hcm8ub3JnLzk2Ym9hcmRzL3JiNS9xdWFsY29tbS9maXJtd2FyZS9S
QjVfZmlybXdhcmVfMjAyMTAzMzEtdjQuemlwCisjICAKKyMgIGFkc3AubWJuIGhhcyBiZWVuIGNv
bnZlcnRlZCBmcm9tIDIwLWFkc3Bfc3BsaXQvZmlybXdhcmUvYWRzcC4qIHVzaW5nCisjIEBAIC01
NjIwLDEzICs1NjUxLDE0IEBACisjICBEcml2ZXI6IHFjb21fcTZ2NV9tc3MgLSBRdWFsY29tbSBt
b2RlbSBzdWJzeXN0ZW0gZmlybXdhcmUKKyMgIAorIyAgRmlsZTogcWNvbS9zZG04NDUvbWJhLm1i
bgorIyAtRmlsZTogcWNvbS9zZG04NDUvbW9kZW0ubWJuCisjICtGaWxlOiBxY29tL3NkbTg0NS9t
b2RlbV9ubS5tYm4KKyMgIEZpbGU6IHFjb20vc2RtODQ1L21vZGVtdXcuanNuCisjICtMaW5rOiBx
Y29tL3NkbTg0NS9tb2RlbS5tYm4gLT4gbW9kZW1fbm0ubWJuCisjICAKKyMgIExpY2VuY2U6IFJl
ZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UucWNvbSBhbmQgcWNvbS9OT1RJQ0UudHh0IGZvciBk
ZXRhaWxzCisjICAKKyMgIEJpbmFyeSBmaWxlcyBzdXBwbGllZCBvcmlnaW5hbGx5IGZyb20KKyMg
LWh0dHA6Ly9yZWxlYXNlcy5saW5hcm8ub3JnLzk2Ym9hcmRzL2RyYWdvbmJvYXJkODQ1Yy9xdWFs
Y29tbS9maXJtd2FyZS9SQjNfZmlybXdhcmVfMjAxOTA1MjkxODAzNTYtdjQuemlwCisjICtodHRw
Oi8vcmVsZWFzZXMubGluYXJvLm9yZy85NmJvYXJkcy9kcmFnb25ib2FyZDg0NWMvcXVhbGNvbW0v
ZmlybXdhcmUvUkIzX2Zpcm13YXJlXzIwMjIxMTIxMDAwMDAwLXY1LnppcAorIyAgCisjICBtb2Rl
bS5tYm4gaGFzIGJlZW4gY29udmVydGVkIGZyb20gMjgtbW9kZW0vbW9kZW0uKiB1c2luZworIyAg
aHR0cHM6Ly9naXRodWIuY29tL2FuZGVyc3Nvbi9waWwtc3F1YXNoZXIKKyMgQEAgLTU4MDIsOCAr
NTgzNCw4IEBACisjICAKKyMgIExpY2Vuc2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0Uu
aWNlIGZvciBkZXRhaWxzCisjICAKKyMgLUZpbGU6IGludGVsL2ljZS9kZHAtY29tbXMvaWNlX2Nv
bW1zLTEuMy4zMS4wLnBrZworIyAtRmlsZTogaW50ZWwvaWNlL2RkcC13aXJlbGVzc19lZGdlL2lj
ZV93aXJlbGVzc19lZGdlLTEuMy43LjAucGtnCisjICtGaWxlOiBpbnRlbC9pY2UvZGRwLWNvbW1z
L2ljZV9jb21tcy0xLjMuNDAuMC5wa2cKKyMgK0ZpbGU6IGludGVsL2ljZS9kZHAtd2lyZWxlc3Nf
ZWRnZS9pY2Vfd2lyZWxlc3NfZWRnZS0xLjMuMTAuMC5wa2cKKyMgIAorIyAgTGljZW5zZTogUmVk
aXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5pY2VfZW5oYW5jZWQgZm9yIGRldGFpbHMKKyMgIAor
IyBAQCAtNjA3Myw2ICs2MTA1LDY2IEBACisjICBGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNw
ay1wcm90LTEwNDMxZTEyLXNwa2lkMC1yMC5iaW4KKyMgIEZpbGU6IGNpcnJ1cy9jczM1bDQxLWRz
cDEtc3BrLXByb3QtMTA0MzFlMTItc3BraWQxLWwwLmJpbgorIyAgRmlsZTogY2lycnVzL2NzMzVs
NDEtZHNwMS1zcGstcHJvdC0xMDQzMWUxMi1zcGtpZDEtcjAuYmluCisjICtMaW5rOiBjaXJydXMv
Y3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMxYjkzLndtZncgLT4gY3MzNWw0MS92Ni42MS4xL2hh
bG9fY3NwbF9SQU1fcmV2QjJfMjkuNjMuMS53bWZ3CisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1k
c3AxLXNway1jYWxpLTEwNDMxYjkzLndtZncgLT4gY3MzNWw0MS92Ni42MS4xL2hhbG9fY3NwbF9S
QU1fcmV2QjJfMjkuNjMuMS53bWZ3CisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1w
cm90LTEwNDMxYTIwLndtZncgLT4gY3MzNWw0MS92Ni42MS4xL2hhbG9fY3NwbF9SQU1fcmV2QjJf
MjkuNjMuMS53bWZ3CisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwNDMx
YTIwLndtZncgLT4gY3MzNWw0MS92Ni42MS4xL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuNjMuMS53
bWZ3CisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMxYTMwLndtZncg
LT4gY3MzNWw0MS92Ni42MS4xL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuNjMuMS53bWZ3CisjICtM
aW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwNDMxYTMwLndtZncgLT4gY3MzNWw0
MS92Ni42MS4xL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuNjMuMS53bWZ3CisjICtMaW5rOiBjaXJy
dXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMxYTQwLndtZncgLT4gY3MzNWw0MS92Ni42MS4x
L2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuNjMuMS53bWZ3CisjICtMaW5rOiBjaXJydXMvY3MzNWw0
MS1kc3AxLXNway1jYWxpLTEwNDMxYTQwLndtZncgLT4gY3MzNWw0MS92Ni42MS4xL2hhbG9fY3Nw
bF9SQU1fcmV2QjJfMjkuNjMuMS53bWZ3CisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNw
ay1wcm90LTEwNDMxYTUwLndtZncgLT4gY3MzNWw0MS92Ni42MS4xL2hhbG9fY3NwbF9SQU1fcmV2
QjJfMjkuNjMuMS53bWZ3CisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEw
NDMxYTUwLndtZncgLT4gY3MzNWw0MS92Ni42MS4xL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuNjMu
MS53bWZ3CisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMxYTYwLndt
ZncgLT4gY3MzNWw0MS92Ni42MS4xL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuNjMuMS53bWZ3Cisj
ICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwNDMxYTYwLndtZncgLT4gY3Mz
NWw0MS92Ni42MS4xL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuNjMuMS53bWZ3CisjICtGaWxlOiBj
aXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMxYjkzLXNwa2lkMC1sMC5iaW4KKyMgK0Zp
bGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzFiOTMtc3BraWQwLXIwLmJpbgor
IyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMWI5My1zcGtpZDEtbDAu
YmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMxYjkzLXNwa2lk
MS1yMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTA0MzFiOTMt
c3BraWQwLWwwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDQz
MWI5My1zcGtpZDAtcjAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxp
LTEwNDMxYjkzLXNwa2lkMS1sMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3Br
LWNhbGktMTA0MzFiOTMtc3BraWQxLXIwLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNw
MS1zcGstcHJvdC0xMDQzM2EyMC1zcGtpZDAtbDAuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstcHJv
dC0xMDQzMWI5My1zcGtpZDAtbDAuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNw
ay1wcm90LTEwNDMzYTIwLXNwa2lkMC1yMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1wcm90LTEw
NDMxYjkzLXNwa2lkMC1yMC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXBy
b3QtMTA0MzNhMjAtc3BraWQxLWwwLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzFi
OTMtc3BraWQxLWwwLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0x
MDQzM2EyMC1zcGtpZDEtcjAuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMWI5My1z
cGtpZDEtcjAuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwNDMz
YTIwLXNwa2lkMC1sMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwNDMxYjkzLXNwa2lk
MC1sMC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTA0MzNhMjAt
c3BraWQwLXIwLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLWNhbGktMTA0MzFiOTMtc3BraWQwLXIw
LmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDQzM2EyMC1zcGtp
ZDEtbDAuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDQzMWI5My1zcGtpZDEtbDAuYmlu
CisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwNDMzYTIwLXNwa2lkMS1y
MC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwNDMxYjkzLXNwa2lkMS1yMC5iaW4KKyMg
K0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzNhMzAtc3BraWQxLWwwLmJp
bgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDQzM2EzMC1zcGtpZDEt
bDAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMzYTMwLXNw
a2lkMS1yMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTA0MzNh
MzAtc3BraWQxLXIwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0x
MDQzM2EzMC1zcGtpZDAtbDAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1j
YWxpLTEwNDMzYTMwLXNwa2lkMC1sMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEt
c3BrLXByb3QtMTA0MzNhMzAtc3BraWQwLXIwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEt
ZHNwMS1zcGstY2FsaS0xMDQzM2EzMC1zcGtpZDAtcjAuYmluCisjICtMaW5rOiBjaXJydXMvY3Mz
NWw0MS1kc3AxLXNway1wcm90LTEwNDMzYTQwLXNwa2lkMC1sMC5iaW4gLT4gY3MzNWw0MS1kc3Ax
LXNway1wcm90LTEwNDMzYTMwLXNwa2lkMC1sMC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQx
LWRzcDEtc3BrLXByb3QtMTA0MzNhNDAtc3BraWQwLXIwLmJpbiAtPiBjczM1bDQxLWRzcDEtc3Br
LXByb3QtMTA0MzNhMzAtc3BraWQwLXIwLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNw
MS1zcGstcHJvdC0xMDQzM2E0MC1zcGtpZDEtbDAuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstcHJv
dC0xMDQzM2EzMC1zcGtpZDEtbDAuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNw
ay1wcm90LTEwNDMzYTQwLXNwa2lkMS1yMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1wcm90LTEw
NDMzYTMwLXNwa2lkMS1yMC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNh
bGktMTA0MzNhNDAtc3BraWQwLWwwLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLWNhbGktMTA0MzNh
MzAtc3BraWQwLWwwLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0x
MDQzM2E0MC1zcGtpZDAtcjAuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDQzM2EzMC1z
cGtpZDAtcjAuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwNDMz
YTQwLXNwa2lkMS1sMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwNDMzYTMwLXNwa2lk
MS1sMC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTA0MzNhNDAt
c3BraWQxLXIwLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLWNhbGktMTA0MzNhMzAtc3BraWQxLXIw
LmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzM2E1MC1zcGtp
ZDEtbDAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwNDMzYTUw
LXNwa2lkMS1sMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0
MzNhNTAtc3BraWQxLXIwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2Fs
aS0xMDQzM2E1MC1zcGtpZDEtcjAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNw
ay1wcm90LTEwNDMzYTUwLXNwa2lkMC1sMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRz
cDEtc3BrLWNhbGktMTA0MzNhNTAtc3BraWQwLWwwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVs
NDEtZHNwMS1zcGstcHJvdC0xMDQzM2E1MC1zcGtpZDAtcjAuYmluCisjICtGaWxlOiBjaXJydXMv
Y3MzNWw0MS1kc3AxLXNway1jYWxpLTEwNDMzYTUwLXNwa2lkMC1yMC5iaW4KKyMgK0ZpbGU6IGNp
cnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzNhNjAtc3BraWQxLWwwLmJpbgorIyArRmls
ZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDQzM2E2MC1zcGtpZDEtbDAuYmluCisj
ICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMzYTYwLXNwa2lkMS1yMC5i
aW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTA0MzNhNjAtc3BraWQx
LXIwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzM2E2MC1z
cGtpZDAtbDAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwNDMz
YTYwLXNwa2lkMC1sMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3Qt
MTA0MzNhNjAtc3BraWQwLXIwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGst
Y2FsaS0xMDQzM2E2MC1zcGtpZDAtcjAuYmluCisjICBMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3Ax
LXNway1wcm90LTE3YWEyMzE2LndtZncgLT4gY3MzNWw0MS92Ni42MS4xL2hhbG9fY3NwbF9SQU1f
cmV2QjJfMjkuNjMuMS53bWZ3CisjICBMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxp
LTE3YWEyMzE2LndtZncgLT4gY3MzNWw0MS92Ni42MS4xL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjku
NjMuMS53bWZ3CisjICBMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTE3YWEyMzE3
LndtZncgLT4gY3MzNWw0MS92Ni42MS4xL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuNjMuMS53bWZ3
CisjIAorIworCiBTVU1NQVJZID0gIkZpcm13YXJlIGZpbGVzIGZvciB1c2Ugd2l0aCBMaW51eCBr
ZXJuZWwiCiBIT01FUEFHRSA9ICJodHRwczovL3d3dy5rZXJuZWwub3JnLyIKIERFU0NSSVBUSU9O
ID0gIkxpbnV4IGZpcm13YXJlIGlzIGEgcGFja2FnZSBkaXN0cmlidXRlZCBhbG9uZ3NpZGUgdGhl
IExpbnV4IGtlcm5lbCBcCkBAIC0xMzAsNyArNDY4LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vTElDRU5DRS5BYmlsaXM7bWQ1PWI1ZWUzZjQxMDc4MGU1NjcxMWFkNDhlYWRjMjJiOGJj
IFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOQ0UueGM0MDAwO21kNT0wZmY1MWQy
ZGM0OWZjZTA0ODE0YzkxNTUwODEwOTJmMCBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9M
SUNFTkNFLnhjNTAwMDttZDU9MWUxNzBjMTMxNzUzMjNjMzJjN2Y0ZDA5OThkNTNmNjYgXAogICAg
ICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5DRS54YzUwMDBjO21kNT0xMmIwMmVmYTMwNDlk
YjY1ZDUyNGFlYjQxOGRkODdjYSBcCi0gICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9XSEVOQ0U7
bWQ1PSR7V0hFTkNFX0NIS1NVTX0gXAorICAgICAgICAgICAgICAgICAgICBmaWxlOi8vV0hFTkNF
O21kNT01N2JmODc0MDU2OTI2ZjEyYWVjMjQwNWQzZmMzOTBkOSBcCiAgICAgICAgICAgICAgICAg
ICAgICIKICMgV0hFTkNFIGNoZWNrc3VtIGlzIGRlZmluZWQgc2VwYXJhdGVseSB0byBlYXNlIG92
ZXJyaWRpbmcgaXQgaWYKICMgY2xhc3MtZGV2dXBzdHJlYW0gaXMgc2VsZWN0ZWQuCkBAIC0yMTIs
NyArNTUwLDcgQEAgU1JDX1VSSTpjbGFzcy1kZXZ1cHN0cmVhbSA9ICJnaXQ6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvZmlybXcKICMgUGluIHRoaXMgdG8gdGhlIDIw
MjIwNTA5IHJlbGVhc2UsIG92ZXJyaWRlIHRoaXMgaW4gbG9jYWwuY29uZgogU1JDUkVWOmNsYXNz
LWRldnVwc3RyZWFtID89ICJiMTljYmRjYTc4YWIyYWRmZDIxMGM5MWJlMTVhMjI1NjhlOGI4Y2Fl
IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOGIxYWNmYTE2ZjFlZTk0NzMyYTZhY2I1MGQ5ZDZj
ODM1Y2Y1M2FmMTEwNjhiZDg5ZWQyMDdiYmUwNGExZTk1MSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICI4NzU5NzExMWMwZDRiNzFiMzFlNTNjYjg1YTkyYzM4NjkyMWI4NGM4MjVhNDAyZGI4YzgyZTBl
ODYwMTU1MDBkIgogCiBpbmhlcml0IGFsbGFyY2gKIAotLSAKMi4zOS4yCgo=

--===============2836421228694007698==--

