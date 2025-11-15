Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C825CEDDBB
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:39:19 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11931.1763224714352186146
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:39:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=VZv0gMCV;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=cR/hOygi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019a88628488-36e73a72-565b-4514-9e67-662439961ad7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224749;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5TzN1ROR50EijdrmzWyKLLAr1v298SKjl1tjFdb+Pk0=;
	b=VZv0gMCVbIDiGNrw6JThybUYUFlZoNp5G2lvzIEKkxPbu+2Lj93J5UlaI0hM3N9w
	5veo3abperCZJovTWdyounwyW1ayWFJtowSb0iar3X8IAnDLF5tJn2mMt7fMIJPhovK
	kn7KOyBe+G8Q/brOzNiMLx4fN8s3zEFk1lA8EJGg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224749;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5TzN1ROR50EijdrmzWyKLLAr1v298SKjl1tjFdb+Pk0=;
	b=cR/hOygiHa8nWLWlRmQRM1rB8w3qQGA25fHfJ4uq5uOEazwCqyNqZZrVJrGyN/2T
	8h0xmPm1O4AjmjbYJ1uVjZ60BYnHTMD9Jpi8YbRR8k7wL6dxaH2/h7brMoVKNZFXITq
	mwMML+hPRC8Ha1VqIlXx/fhGqGaYGZbcusOgkDhE=
Content-Type: multipart/mixed; boundary="===============1171198889568205140=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] linux-firmware: upgrading to 20251111 FAILED
Message-ID: <0101019a88628488-36e73a72-565b-4514-9e67-662439961ad7-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:39:09 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:39:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226433

--===============1171198889568205140==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *linux-firmware* to *20251111* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-linux-firmware-upgrade-20251021-20251111.patch
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
From caf2ba22cbdd5b263d425f2bc7782c64fb1a341d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 15:09:05 +0000
Subject: [PATCH] linux-firmware: upgrade 20251021 -> 20251111

---
 ...20251021.bb => linux-firmware_20251111.bb} | 644 +++++++++++++++++-
 1 file changed, 642 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20251021.bb => linux-firmware_20251111.bb} (84%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20251021.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20251111.bb
similarity index 84%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20251021.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20251111.bb
index 66d3be90e7..98a292bc50 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20251021.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20251111.bb
@@ -1,3 +1,643 @@
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
+# @@ -3438,7 +3438,9 @@
+#  File: rtw89/rtw8852a_fw.bin
+#  File: rtw89/rtw8852b_fw.bin
+#  File: rtw89/rtw8852b_fw-1.bin
+# +File: rtw89/rtw8852b_fw-2.bin
+#  File: rtw89/rtw8852bt_fw.bin
+# +File: rtw89/rtw8852bt_fw-1.bin
+#  File: rtw89/rtw8852c_fw.bin
+#  File: rtw89/rtw8852c_fw-1.bin
+#  File: rtw89/rtw8852c_fw-2.bin
+# @@ -3609,6 +3611,9 @@
+#  
+#  File: rtl_nic/rtl8125d-2.fw
+#  Version: 0.0.4
+# +
+# +File: rtl_nic/rtl8125k-1.fw
+# +Version: 0.0.1
+#  
+#  File: rtl_nic/rtl8126a-2.fw
+#  Version: 0.0.2
+# @@ -4223,7 +4228,7 @@
+#  File: intel/ibt-0093-4150.ddc
+#  File: intel/ibt-0093-1050.sfi
+#  File: intel/ibt-0093-1050.ddc
+# -Version: BT_BlazarU_S_REL91726_23.160.25341.91726
+# +Version: BT_BlazarU_S_REL93327_23.170.25375.93327
+#  
+#  File: intel/ibt-0180-0041.sfi
+#  File: intel/ibt-0180-0041.ddc
+# @@ -4247,7 +4252,7 @@
+#  File: intel/ibt-0190-0291-pci.sfi
+#  File: intel/ibt-0190-0291-usb.ddc
+#  File: intel/ibt-0190-0291-usb.sfi
+# -Version: BT_BlazarI_S_REL99289_23.160.25341.99289
+# +Version: BT_BlazarI_S_REL100876_23.170.25375.100876
+#  
+#  Licence: Redistributable. See LICENCE.ibt_firmware for details
+#  
+# @@ -4267,6 +4272,8 @@
+#  File: rtl_bt/rtl8761b_config.bin
+#  File: rtl_bt/rtl8761bu_fw.bin
+#  File: rtl_bt/rtl8761bu_config.bin
+# +File: rtl_bt/rtl8761cu_fw.bin
+# +File: rtl_bt/rtl8761cu_config.bin
+#  File: rtl_bt/rtl8812ae_fw.bin
+#  File: rtl_bt/rtl8821a_fw.bin
+#  Link: rtl_bt/rtl8821a_config.bin -> rtl8821c_config.bin
+# @@ -4373,9 +4380,9 @@
+#  RawFile: amd-ucode/microcode_amd_fam17h.bin
+#  Version: 2024-11-21
+#  RawFile: amd-ucode/microcode_amd_fam19h.bin
+# -Version: 2025-07-29
+# +Version: 2025-10-27
+#  RawFile: amd-ucode/microcode_amd_fam1ah.bin
+# -Version: 2025-07-29
+# +Version: 2025-10-30
+#  File: amd-ucode/README
+#  
+#  License: Redistributable. See LICENSE.amd-ucode for details
+# @@ -5293,7 +5300,7 @@
+#  Version: GuC API/APB ver 70.4.1 for DG2
+#  
+#  File: i915/dg2_guc_70.bin
+# -Version: GuC API/APB ver 70.49.4 for DG2
+# +Version: GuC API/APB ver 70.53.0 for DG2
+#  
+#  File: i915/dg2_huc_gsc.bin
+#  Version: HuC API/APB ver 7.10.16 for DG2
+# @@ -5314,7 +5321,7 @@
+#  Version: DMC API/APB ver 2 release 23 for Meteorlake
+#  
+#  File: i915/mtl_guc_70.bin
+# -Version: GuC API/APB ver 70.49.4 for Meteorlake
+# +Version: GuC API/APB ver 70.53.0 for Meteorlake
+#  
+#  File: i915/mtl_huc_gsc.bin
+#  Version: HuC API/APB ver 8.5.4 for Meteorlake
+# @@ -5343,13 +5350,13 @@
+#  Version: GSC API/APB v1.0, release 104.0.5.1429, SVN 1 for Lunarlake
+#  
+#  File: xe/lnl_guc_70.bin
+# -Version: GuC API/APB ver 70.49.4 for Lunarlake
+# +Version: GuC API/APB ver 70.53.0 for Lunarlake
+#  
+#  File: xe/lnl_huc.bin
+#  Version: HuC API/APB ver 9.4.13 for Lunarlake
+#  
+#  File: xe/bmg_guc_70.bin
+# -Version: GuC API/APB ver 70.49.4 for Battlemage
+# +Version: GuC API/APB ver 70.53.0 for Battlemage
+#  
+#  File: xe/bmg_huc.bin
+#  Version: HuC API/APB ver 8.2.10 for Battlemage
+# @@ -5358,7 +5365,7 @@
+#  Version: fan_control ver 203.0.0.0 for Battlemage
+#  
+#  File: xe/ptl_guc_70.bin
+# -Version: GuC API/APB ver 70.49.4 for Pantherlake
+# +Version: GuC API/APB ver 70.53.0 for Pantherlake
+#  
+#  File: xe/ptl_huc.bin
+#  Version: HuC API/APB ver 10.3.3 for Pantherlake
+# @@ -6110,9 +6117,9 @@
+#  Driver: mt7920 - MediaTek MT7920 Wireless MACs
+#  
+#  File: mediatek/WIFI_MT7961_patch_mcu_1a_2_hdr.bin
+# -Version: 20250210151004a
+# +Version: 20251020150843a
+#  File: mediatek/WIFI_RAM_CODE_MT7961_1a.bin
+# -Version: 20250210150855
+# +Version: 20251020151401
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -6121,7 +6128,7 @@
+#  Driver: mt7920 - MediaTek MT7920 bluetooth chipset
+#  
+#  File: mediatek/BT_RAM_CODE_MT7961_1a_2_hdr.bin
+# -Version: 20250210151502
+# +Version: 20251020151255
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -6150,9 +6157,9 @@
+#  Driver: mt7922 - MediaTek MT7922 Wireless MACs
+#  
+#  File: mediatek/WIFI_MT7922_patch_mcu_1_1_hdr.bin
+# -Version: 20250523103150a
+# +Version: 20251020143135a
+#  File: mediatek/WIFI_RAM_CODE_MT7922_1.bin
+# -Version: 20250523103106
+# +Version: 20251020143009
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -6161,7 +6168,7 @@
+#  Driver: mt7922 - MediaTek MT7922 bluetooth chipset
+#  
+#  File: mediatek/BT_RAM_CODE_MT7922_1_1_hdr.bin
+# -Version: 20250903123504
+# +Version: 20251020143443
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -6170,9 +6177,9 @@
+#  Driver: mt7925 - MediaTek MT7925 Wireless MACs
+#  
+#  File: mediatek/mt7925/WIFI_MT7925_PATCH_MCU_1_1_hdr.bin
+# -Version: 20250825215832a
+# +Version: 20251015212927a
+#  File: mediatek/mt7925/WIFI_RAM_CODE_MT7925_1_1.bin
+# -Version: 20250825215728
+# +Version: 20251015212814
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -6181,16 +6188,20 @@
+#  Driver: mt7925 - MediaTek MT7925 bluetooth chipset
+#  
+#  File: mediatek/mt7925/BT_RAM_CODE_MT7925_1_1_hdr.bin
+# -Version: 20250825220109
+# +Version: 20251015213201
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+#  --------------------------------------------------------------------------
+#  
+# -Driver: mt7988 - MediaTek MT7988 Internal 2.5G Ethernet Phy
+# +Driver: mtk-2p5ge - MediaTek MT798x Internal 2.5G Ethernet Phy
+#  
+#  File: mediatek/mt7988/i2p5ge-phy-pmb.bin
+# -Version: 20230728
+# +Version: 20241030
+# +File: mediatek/mt7987/i2p5ge-phy-DSPBitTb.bin
+# +Version: 20250822
+# +File: mediatek/mt7987/i2p5ge-phy-pmb.bin
+# +Version: 20250822
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -6583,6 +6594,13 @@
+#  File: qcom/apq8096/modem.mbn
+#  Version: MPSS.TH.2.0.1-00481
+#  RawFile: qcom/apq8096/modemr.jsn
+# +File: qcom/kaanapali/adsp.mbn
+# +File: qcom/kaanapali/adsp_dtb.mbn
+# +Version: LPAIDSP.HT.1.2-00769-KAANAPALI-1
+# +RawFile: qcom/kaanapali/adspr.jsn
+# +RawFile: qcom/kaanapali/adsps.jsn
+# +RawFile: qcom/kaanapali/adspua.jsn
+# +RawFile: qcom/kaanapali/adspuo.jsn
+#  File: qcom/kaanapali/cdsp.mbn
+#  File: qcom/kaanapali/cdsp_dtb.mbn
+#  Version: CDSP.HT.3.2-00684-KAANAPALI-1
+# @@ -6729,6 +6747,10 @@
+#  cdsp.mbn has been converted from 21-cdsp_split/firmware/cdsp.* using
+#  https://github.com/andersson/pil-squasher
+#  
+# +File: qcom/kaanapali/soccp.mbn
+# +File: qcom/kaanapali/soccp_dtb.mbn
+# +Version: SOCCP.FW.2.1-00204-KAANAPALI_SOCCP_PACK-1
+# +RawFile: qcom/kaanapali/soccpr.jsn
+#  File: qcom/sa8775p/adsp.mbn
+#  Version: DSP.AT.1.0.1-00163-LEMANS-1
+#  RawFile: qcom/sa8775p/adspr.jsn
+# @@ -7683,10 +7705,8 @@
+#  Link: cirrus/cs35l41-dsp1-spk-prot-10433e00.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+#  Link: cirrus/cs35l41-dsp1-spk-prot-10431074.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+#  Link: cirrus/cs35l41-dsp1-spk-prot-10431054.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# -File: cirrus/cs35l41-dsp1-spk-prot-10431fb3-spkid0-l0.bin
+# -File: cirrus/cs35l41-dsp1-spk-prot-10431fb3-spkid0-r0.bin
+# -File: cirrus/cs35l41-dsp1-spk-prot-10431fb3-spkid1-l0.bin
+# -File: cirrus/cs35l41-dsp1-spk-prot-10431fb3-spkid1-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431fb3-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431fb3-r0.bin
+#  File: cirrus/cs35l41-dsp1-spk-prot-10431194-spkid0-l0.bin
+#  File: cirrus/cs35l41-dsp1-spk-prot-10431194-spkid0-r0.bin
+#  File: cirrus/cs35l41-dsp1-spk-prot-10431194-spkid1-l0.bin
+# @@ -7709,22 +7729,14 @@
+#  Link: cirrus/cs35l41-dsp1-spk-prot-10431054-spkid1-r0.bin -> cs35l41-dsp1-spk-prot-10431074-spkid1-r0.bin
+#  Link: cirrus/cs35l41-dsp1-spk-prot-10433d78.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+#  Link: cirrus/cs35l41-dsp1-spk-prot-10433d88.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# -File: cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid0-l0.bin
+# -File: cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid0-r0.bin
+# -File: cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid1-l0.bin
+# -File: cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid1-r0.bin
+# -Link: cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid0-l0.bincfg -> cs35l41/bincfgs/cs35l41-dsp1-14_5dB.bincfg
+# -Link: cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid0-r0.bincfg -> cs35l41/bincfgs/cs35l41-dsp1-14_5dB.bincfg
+# -Link: cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid1-l0.bincfg -> cs35l41/bincfgs/cs35l41-dsp1-14_5dB.bincfg
+# -Link: cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid1-r0.bincfg -> cs35l41/bincfgs/cs35l41-dsp1-14_5dB.bincfg
+# -Link: cirrus/cs35l41-dsp1-spk-prot-10433d88-spkid0-l0.bin -> cs35l41-dsp1-spk-prot-10433d78-spkid0-l0.bin
+# -Link: cirrus/cs35l41-dsp1-spk-prot-10433d88-spkid0-r0.bin -> cs35l41-dsp1-spk-prot-10433d78-spkid0-r0.bin
+# -Link: cirrus/cs35l41-dsp1-spk-prot-10433d88-spkid1-l0.bin -> cs35l41-dsp1-spk-prot-10433d78-spkid1-l0.bin
+# -Link: cirrus/cs35l41-dsp1-spk-prot-10433d88-spkid1-r0.bin -> cs35l41-dsp1-spk-prot-10433d78-spkid1-r0.bin
+# -Link: cirrus/cs35l41-dsp1-spk-prot-10433d88-spkid0-l0.bincfg -> cs35l41/bincfgs/cs35l41-dsp1-14_5dB.bincfg
+# -Link: cirrus/cs35l41-dsp1-spk-prot-10433d88-spkid0-r0.bincfg -> cs35l41/bincfgs/cs35l41-dsp1-14_5dB.bincfg
+# -Link: cirrus/cs35l41-dsp1-spk-prot-10433d88-spkid1-l0.bincfg -> cs35l41/bincfgs/cs35l41-dsp1-14_5dB.bincfg
+# -Link: cirrus/cs35l41-dsp1-spk-prot-10433d88-spkid1-r0.bincfg -> cs35l41/bincfgs/cs35l41-dsp1-14_5dB.bincfg
+# +File: cirrus/cs35l41-dsp1-spk-prot-10433d78-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10433d78-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433d78-l0.bincfg -> cs35l41/bincfgs/cs35l41-dsp1-14_5dB.bincfg
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433d78-r0.bincfg -> cs35l41/bincfgs/cs35l41-dsp1-14_5dB.bincfg
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433d88-l0.bin -> cs35l41-dsp1-spk-prot-10433d78-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433d88-r0.bin -> cs35l41-dsp1-spk-prot-10433d78-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433d88-l0.bincfg -> cs35l41/bincfgs/cs35l41-dsp1-14_5dB.bincfg
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433d88-r0.bincfg -> cs35l41/bincfgs/cs35l41-dsp1-14_5dB.bincfg
+#  Link: cirrus/cs35l41-dsp1-spk-prot-104388f4.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+#  File: cirrus/cs35l41-dsp1-spk-prot-104388f4-spkid0.bin
+#  File: cirrus/cs35l41-dsp1-spk-prot-104388f4-spkid1.bin
+# @@ -8556,165 +8568,215 @@
+#  
+#  --------------------------------------------------------------------------
+#  Driver: ti-tas2781 - tas2781 firmware
+# -File: ti/tas2781/TAS2XXX0C94.bin
+# -File: ti/tas2781/TAS2XXX0C95.bin
+# -File: ti/tas2781/TAS2XXX0C96.bin
+# -File: ti/tas2781/TAS2XXX0C97.bin
+# -File: ti/tas2781/TAS2XXX10A40.bin
+# -File: ti/tas2781/TAS2XXX10A41.bin
+# -File: ti/tas2781/TAS2XXX11540.bin
+# -File: ti/tas2781/TAS2XXX11541.bin
+# -File: ti/tas2781/TAS2XXX12040.bin
+# -File: ti/tas2781/TAS2XXX12041.bin
+# -File: ti/tas2781/TAS2XXX12140.bin
+# -File: ti/tas2781/TAS2XXX12141.bin
+# -File: ti/tas2781/TAS2XXX1EB30.bin
+# -File: ti/tas2781/TAS2XXX1EB31.bin
+# -File: ti/tas2781/TAS2XXX2234.bin
+# -File: ti/tas2781/TAS2XXX2326.bin
+# -File: ti/tas2781/TAS2XXX387D.bin
+# -File: ti/tas2781/TAS2XXX387E.bin
+# -File: ti/tas2781/TAS2XXX387F.bin
+# -File: ti/tas2781/TAS2XXX3880.bin
+# -File: ti/tas2781/TAS2XXX3881.bin
+# -File: ti/tas2781/TAS2XXX3882.bin
+# -File: ti/tas2781/TAS2XXX3884.bin
+# -File: ti/tas2781/TAS2XXX3886.bin
+# -File: ti/tas2781/TAS2XXX38A5.bin
+# -File: ti/tas2781/TAS2XXX38A7.bin
+# -File: ti/tas2781/TAS2XXX38A8.bin
+# -File: ti/tas2781/TAS2XXX38B8.bin
+# -File: ti/tas2781/TAS2XXX38B9.bin
+# -File: ti/tas2781/TAS2XXX38BA.bin
+# -File: ti/tas2781/TAS2XXX38BB.bin
+# -File: ti/tas2781/TAS2XXX38BE.bin
+# -File: ti/tas2781/TAS2XXX38BF.bin
+# -File: ti/tas2781/TAS2XXX38C3.bin
+# -File: ti/tas2781/TAS2XXX38CB.bin
+# -File: ti/tas2781/TAS2XXX38CD.bin
+# -File: ti/tas2781/TAS2XXX38D3.bin
+# -File: ti/tas2781/TAS2XXX38D4.bin
+# -File: ti/tas2781/TAS2XXX38D5.bin
+# -File: ti/tas2781/TAS2XXX38D6.bin
+# -File: ti/tas2781/TAS2XXX38DF.bin
+# -File: ti/tas2781/TAS2XXX38E0.bin
+# -File: ti/tas2781/TAS2XXX38FD.bin
+# -File: ti/tas2781/TAS2XXX391F.bin
+# -File: ti/tas2781/TAS2XXX3920.bin
+# -File: ti/tas2781/TAS2XXX3E300.bin
+# -File: ti/tas2781/TAS2XXX3E301.bin
+# -File: ti/tas2781/TAS2XXX3EE00.bin
+# -File: ti/tas2781/TAS2XXX3EE01.bin
+# -File: ti/tas2781/TAS2XXX3EF00.bin
+# -File: ti/tas2781/TAS2XXX3EF01.bin
+# -File: ti/tas2781/TAS2XXX3F000.bin
+# -File: ti/tas2781/TAS2XXX3F001.bin
+# -File: ti/tas2781/TAS2XXX3F100.bin
+# -File: ti/tas2781/TAS2XXX3F101.bin
+# -File: ti/tas2781/TAS2XXX3F200.bin
+# -File: ti/tas2781/TAS2XXX3F201.bin
+# -File: ti/tas2781/TAS2XXX3F300.bin
+# -File: ti/tas2781/TAS2XXX3F301.bin
+# -File: ti/tas2781/TAS2XXX8DE8.bin
+# -File: ti/tas2781/TAS2XXX8DE9.bin
+# -File: ti/tas2781/TXNW2781RCA0.bin
+# -File: ti/tas2781/TXNW2781RCA1.bin
+# -File: ti/tas2781/TIAS2781RCA2.bin
+# -File: ti/tas2781/TIAS2781RCA4.bin
+# -Link: TAS2XXX0C94.bin -> ti/tas2781/TAS2XXX0C94.bin
+# -Link: TAS2XXX0C95.bin -> ti/tas2781/TAS2XXX0C95.bin
+# -Link: TAS2XXX0C96.bin -> ti/tas2781/TAS2XXX0C96.bin
+# -Link: TAS2XXX0C97.bin -> ti/tas2781/TAS2XXX0C97.bin
+# -Link: TAS2XXX103C8DE80.bin -> ti/tas2781/TAS2XXX8DE8.bin
+# -Link: TAS2XXX103C8DE81.bin -> ti/tas2781/TAS2XXX8DE8.bin
+# -Link: TAS2XXX103C8DE90.bin -> ti/tas2781/TAS2XXX8DE9.bin
+# -Link: TAS2XXX103C8DE91.bin -> ti/tas2781/TAS2XXX8DE9.bin
+# -Link: TAS2XXX103C8DE8-0.bin -> ti/tas2781/TAS2XXX8DE8.bin
+# -Link: TAS2XXX103C8DE8-1.bin -> ti/tas2781/TAS2XXX8DE8.bin
+# -Link: TAS2XXX103C8DE9-0.bin -> ti/tas2781/TAS2XXX8DE9.bin
+# -Link: TAS2XXX103C8DE9-1.bin -> ti/tas2781/TAS2XXX8DE9.bin
+# -Link: TAS2XXX10A40.bin -> ti/tas2781/TAS2XXX10A40.bin
+# -Link: TAS2XXX10A41.bin -> ti/tas2781/TAS2XXX10A41.bin
+# -Link: TAS2XXX11540.bin -> ti/tas2781/TAS2XXX11540.bin
+# -Link: TAS2XXX11541.bin -> ti/tas2781/TAS2XXX11541.bin
+# -Link: TAS2XXX12040.bin -> ti/tas2781/TAS2XXX12040.bin
+# -Link: TAS2XXX12041.bin -> ti/tas2781/TAS2XXX12041.bin
+# -Link: TAS2XXX12140.bin -> ti/tas2781/TAS2XXX12140.bin
+# -Link: TAS2XXX12141.bin -> ti/tas2781/TAS2XXX12141.bin
+# -Link: TAS2XXX1EB3.bin -> ti/tas2781/TAS2XXX1EB30.bin
+# -Link: TAS2XXX1EB30.bin -> ti/tas2781/TAS2XXX1EB30.bin
+# -Link: TAS2XXX1EB31.bin -> ti/tas2781/TAS2XXX1EB31.bin
+# -Link: TAS2XXX2234.bin -> ti/tas2781/TAS2XXX2234.bin
+# -Link: TAS2XXX2326.bin -> ti/tas2781/TAS2XXX2326.bin
+# -Link: TAS2XXX387D.bin -> ti/tas2781/TAS2XXX387D.bin
+# -Link: TAS2XXX387E.bin -> ti/tas2781/TAS2XXX387E.bin
+# -Link: TAS2XXX387F.bin -> ti/tas2781/TAS2XXX387F.bin
+# -Link: TAS2XXX3880.bin -> ti/tas2781/TAS2XXX3880.bin
+# -Link: TAS2XXX3881.bin -> ti/tas2781/TAS2XXX3881.bin
+# -Link: TAS2XXX3882.bin -> ti/tas2781/TAS2XXX3882.bin
+# -Link: TAS2XXX3884.bin -> ti/tas2781/TAS2XXX3884.bin
+# -Link: TAS2XXX3886.bin -> ti/tas2781/TAS2XXX3886.bin
+# -Link: TAS2XXX38A5.bin -> ti/tas2781/TAS2XXX38A5.bin
+# -Link: TAS2XXX38A7.bin -> ti/tas2781/TAS2XXX38A7.bin
+# -Link: TAS2XXX38A8.bin -> ti/tas2781/TAS2XXX38A8.bin
+# -Link: TAS2XXX38B8.bin -> ti/tas2781/TAS2XXX38B8.bin
+# -Link: TAS2XXX38B9.bin -> ti/tas2781/TAS2XXX38B9.bin
+# -Link: TAS2XXX38BA.bin -> ti/tas2781/TAS2XXX38BA.bin
+# -Link: TAS2XXX38BB.bin -> ti/tas2781/TAS2XXX38BB.bin
+# -Link: TAS2XXX38BE.bin -> ti/tas2781/TAS2XXX38BE.bin
+# -Link: TAS2XXX38BF.bin -> ti/tas2781/TAS2XXX38BF.bin
+# -Link: TAS2XXX38C3.bin -> ti/tas2781/TAS2XXX38C3.bin
+# -Link: TAS2XXX38CB.bin -> ti/tas2781/TAS2XXX38CB.bin
+# -Link: TAS2XXX38CD.bin -> ti/tas2781/TAS2XXX38CD.bin
+# -Link: TAS2XXX38D3.bin -> ti/tas2781/TAS2XXX38D3.bin
+# -Link: TAS2XXX38D4.bin -> ti/tas2781/TAS2XXX38D4.bin
+# -Link: TAS2XXX38D5.bin -> ti/tas2781/TAS2XXX38D5.bin
+# -Link: TAS2XXX38D6.bin -> ti/tas2781/TAS2XXX38D6.bin
+# -Link: TAS2XXX38DF.bin -> ti/tas2781/TAS2XXX38DF.bin
+# -Link: TAS2XXX38E0.bin -> ti/tas2781/TAS2XXX38E0.bin
+# -Link: TAS2XXX38FD.bin -> ti/tas2781/TAS2XXX38FD.bin
+# -Link: TAS2XXX391F.bin -> ti/tas2781/TAS2XXX391F.bin
+# -Link: TAS2XXX3920.bin -> ti/tas2781/TAS2XXX3920.bin
+# -Link: TAS2XXX3E300.bin -> ti/tas2781/TAS2XXX3E300.bin
+# -Link: TAS2XXX3E301.bin -> ti/tas2781/TAS2XXX3E301.bin
+# -Link: TAS2XXX3EE00.bin -> ti/tas2781/TAS2XXX3EE00.bin
+# -Link: TAS2XXX3EE01.bin -> ti/tas2781/TAS2XXX3EE01.bin
+# -Link: TAS2XXX3EF00.bin -> ti/tas2781/TAS2XXX3EF00.bin
+# -Link: TAS2XXX3EF01.bin -> ti/tas2781/TAS2XXX3EF01.bin
+# -Link: TAS2XXX3F000.bin -> ti/tas2781/TAS2XXX3F000.bin
+# -Link: TAS2XXX3F001.bin -> ti/tas2781/TAS2XXX3F001.bin
+# -Link: TAS2XXX3F100.bin -> ti/tas2781/TAS2XXX3F100.bin
+# -Link: TAS2XXX3F101.bin -> ti/tas2781/TAS2XXX3F101.bin
+# -Link: TAS2XXX3F200.bin -> ti/tas2781/TAS2XXX3F200.bin
+# -Link: TAS2XXX3F201.bin -> ti/tas2781/TAS2XXX3F201.bin
+# -Link: TAS2XXX3F300.bin -> ti/tas2781/TAS2XXX3F300.bin
+# -Link: TAS2XXX3F301.bin -> ti/tas2781/TAS2XXX3F301.bin
+# -Link: TAS2XXX8DE8.bin -> ti/tas2781/TAS2XXX8DE8.bin
+# -Link: TAS2XXX8DE9.bin -> ti/tas2781/TAS2XXX8DE9.bin
+# -Link: TAS2XXX8DE80.bin -> ti/tas2781/TAS2XXX8DE8.bin
+# -Link: TAS2XXX8DE81.bin -> ti/tas2781/TAS2XXX8DE8.bin
+# -Link: TAS2XXX8DE90.bin -> ti/tas2781/TAS2XXX8DE9.bin
+# -Link: TAS2XXX8DE91.bin -> ti/tas2781/TAS2XXX8DE9.bin
+# -Link: TIAS2781RCA2.bin -> ti/tas2781/TIAS2781RCA2.bin
+# -Link: TIAS2781RCA4.bin -> ti/tas2781/TIAS2781RCA4.bin
+# -Link: TXNW2781RCA1.bin -> ti/tas2781/TXNW2781RCA0.bin
+# -Link: TXNW2781RCA0.bin -> ti/tas2781/TXNW2781RCA1.bin
+# -Link: TXNW2781RCA2.bin -> ti/tas2781/TIAS2781RCA2.bin
+# -Link: TXNW2781RCA4.bin -> ti/tas2781/TIAS2781RCA4.bin
+# +File: ti/audio/tas2781/TAS2XXX0C94.bin
+# +File: ti/audio/tas2781/TAS2XXX0C95.bin
+# +File: ti/audio/tas2781/TAS2XXX0C96.bin
+# +File: ti/audio/tas2781/TAS2XXX0C97.bin
+# +File: ti/audio/tas2781/TAS2XXX10A40.bin
+# +File: ti/audio/tas2781/TAS2XXX10A41.bin
+# +File: ti/audio/tas2781/TAS2XXX11540.bin
+# +File: ti/audio/tas2781/TAS2XXX11541.bin
+# +File: ti/audio/tas2781/TAS2XXX12040.bin
+# +File: ti/audio/tas2781/TAS2XXX12041.bin
+# +File: ti/audio/tas2781/TAS2XXX12140.bin
+# +File: ti/audio/tas2781/TAS2XXX12141.bin
+# +File: ti/audio/tas2781/TAS2XXX13840.bin
+# +File: ti/audio/tas2781/TAS2XXX13841.bin
+# +File: ti/audio/tas2781/TAS2XXX13940.bin
+# +File: ti/audio/tas2781/TAS2XXX13941.bin
+# +File: ti/audio/tas2781/TAS2XXX13A40.bin
+# +File: ti/audio/tas2781/TAS2XXX13A41.bin
+# +File: ti/audio/tas2781/TAS2XXX1EB30.bin
+# +File: ti/audio/tas2781/TAS2XXX1EB31.bin
+# +File: ti/audio/tas2781/TAS2XXX2234.bin
+# +File: ti/audio/tas2781/TAS2XXX2326.bin
+# +File: ti/audio/tas2781/TAS2XXX387D.bin
+# +File: ti/audio/tas2781/TAS2XXX387E.bin
+# +File: ti/audio/tas2781/TAS2XXX387F.bin
+# +File: ti/audio/tas2781/TAS2XXX3880.bin
+# +File: ti/audio/tas2781/TAS2XXX3881.bin
+# +File: ti/audio/tas2781/TAS2XXX3882.bin
+# +File: ti/audio/tas2781/TAS2XXX3884.bin
+# +File: ti/audio/tas2781/TAS2XXX3886.bin
+# +File: ti/audio/tas2781/TAS2XXX38A5.bin
+# +File: ti/audio/tas2781/TAS2XXX38A7.bin
+# +File: ti/audio/tas2781/TAS2XXX38A8.bin
+# +File: ti/audio/tas2781/TAS2XXX38B8.bin
+# +File: ti/audio/tas2781/TAS2XXX38B9.bin
+# +File: ti/audio/tas2781/TAS2XXX38BA.bin
+# +File: ti/audio/tas2781/TAS2XXX38BB.bin
+# +File: ti/audio/tas2781/TAS2XXX38BE.bin
+# +File: ti/audio/tas2781/TAS2XXX38BF.bin
+# +File: ti/audio/tas2781/TAS2XXX38C3.bin
+# +File: ti/audio/tas2781/TAS2XXX38CB.bin
+# +File: ti/audio/tas2781/TAS2XXX38CD.bin
+# +File: ti/audio/tas2781/TAS2XXX38D3.bin
+# +File: ti/audio/tas2781/TAS2XXX38D4.bin
+# +File: ti/audio/tas2781/TAS2XXX38D5.bin
+# +File: ti/audio/tas2781/TAS2XXX38D6.bin
+# +File: ti/audio/tas2781/TAS2XXX38DF.bin
+# +File: ti/audio/tas2781/TAS2XXX38E0.bin
+# +File: ti/audio/tas2781/TAS2XXX38FD.bin
+# +File: ti/audio/tas2781/TAS2XXX391F.bin
+# +File: ti/audio/tas2781/TAS2XXX3920.bin
+# +File: ti/audio/tas2781/TAS2XXX3E300.bin
+# +File: ti/audio/tas2781/TAS2XXX3E301.bin
+# +File: ti/audio/tas2781/TAS2XXX3EE00.bin
+# +File: ti/audio/tas2781/TAS2XXX3EE01.bin
+# +File: ti/audio/tas2781/TAS2XXX3EF00.bin
+# +File: ti/audio/tas2781/TAS2XXX3EF01.bin
+# +File: ti/audio/tas2781/TAS2XXX3F000.bin
+# +File: ti/audio/tas2781/TAS2XXX3F001.bin
+# +File: ti/audio/tas2781/TAS2XXX3F100.bin
+# +File: ti/audio/tas2781/TAS2XXX3F101.bin
+# +File: ti/audio/tas2781/TAS2XXX3F200.bin
+# +File: ti/audio/tas2781/TAS2XXX3F201.bin
+# +File: ti/audio/tas2781/TAS2XXX3F300.bin
+# +File: ti/audio/tas2781/TAS2XXX3F301.bin
+# +File: ti/audio/tas2781/TAS2XXX8C70.bin
+# +File: ti/audio/tas2781/TAS2XXX8C71.bin
+# +File: ti/audio/tas2781/TAS2XXX8C72.bin
+# +File: ti/audio/tas2781/TAS2XXX8D8E.bin
+# +File: ti/audio/tas2781/TAS2XXX8DAA.bin
+# +File: ti/audio/tas2781/TAS2XXX8DE8.bin
+# +File: ti/audio/tas2781/TAS2XXX8DE9.bin
+# +File: ti/audio/tas2781/TAS2XXX8E17.bin
+# +File: ti/audio/tas2781/TAS2XXX8E19.bin
+# +File: ti/audio/tas2781/TAS2XXX8E1C.bin
+# +File: ti/audio/tas2781/TAS2XXX8E8A.bin
+# +File: ti/audio/tas2781/TAS2XXX8ED5.bin
+# +File: ti/audio/tas2781/TAS2XXX8ED6.bin
+# +File: ti/audio/tas2781/TAS2XXX8ED7.bin
+# +File: ti/audio/tas2781/TAS2XXX8ED8.bin
+# +File: ti/audio/tas2781/TAS2XXX8ED9.bin
+# +File: ti/audio/tas2781/TAS2XXX8EDA.bin
+# +File: ti/audio/tas2781/TAS2XXX8F40.bin
+# +File: ti/audio/tas2781/TAS2XXX8F41.bin
+# +File: ti/audio/tas2781/TAS2XXX8F42.bin
+# +File: ti/audio/tas2781/TAS2XXX8F62.bin
+# +File: ti/audio/tas2781/TXNW2781RCA0.bin
+# +File: ti/audio/tas2781/TXNW2781RCA1.bin
+# +File: ti/audio/tas2781/TIAS2781RCA2.bin
+# +File: ti/audio/tas2781/TIAS2781RCA4.bin
+# +Link: TAS2XXX0C94.bin -> ti/audio/tas2781/TAS2XXX0C94.bin
+# +Link: TAS2XXX0C95.bin -> ti/audio/tas2781/TAS2XXX0C95.bin
+# +Link: TAS2XXX0C96.bin -> ti/audio/tas2781/TAS2XXX0C96.bin
+# +Link: TAS2XXX0C97.bin -> ti/audio/tas2781/TAS2XXX0C97.bin
+# +Link: TAS2XXX103C8DE80.bin -> ti/audio/tas2781/TAS2XXX8DE8.bin
+# +Link: TAS2XXX103C8DE81.bin -> ti/audio/tas2781/TAS2XXX8DE8.bin
+# +Link: TAS2XXX103C8DE90.bin -> ti/audio/tas2781/TAS2XXX8DE9.bin
+# +Link: TAS2XXX103C8DE91.bin -> ti/audio/tas2781/TAS2XXX8DE9.bin
+# +Link: TAS2XXX103C8DE8-0.bin -> ti/audio/tas2781/TAS2XXX8DE8.bin
+# +Link: TAS2XXX103C8DE8-1.bin -> ti/audio/tas2781/TAS2XXX8DE8.bin
+# +Link: TAS2XXX103C8DE9-0.bin -> ti/audio/tas2781/TAS2XXX8DE9.bin
+# +Link: TAS2XXX103C8DE9-1.bin -> ti/audio/tas2781/TAS2XXX8DE9.bin
+# +Link: TAS2XXX10A40.bin -> ti/audio/tas2781/TAS2XXX10A40.bin
+# +Link: TAS2XXX10A41.bin -> ti/audio/tas2781/TAS2XXX10A41.bin
+# +Link: TAS2XXX11540.bin -> ti/audio/tas2781/TAS2XXX11540.bin
+# +Link: TAS2XXX11541.bin -> ti/audio/tas2781/TAS2XXX11541.bin
+# +Link: TAS2XXX12040.bin -> ti/audio/tas2781/TAS2XXX12040.bin
+# +Link: TAS2XXX12041.bin -> ti/audio/tas2781/TAS2XXX12041.bin
+# +Link: TAS2XXX12140.bin -> ti/audio/tas2781/TAS2XXX12140.bin
+# +Link: TAS2XXX12141.bin -> ti/audio/tas2781/TAS2XXX12141.bin
+# +Link: TAS2XXX13840.bin -> ti/audio/tas2781/TAS2XXX13840.bin
+# +Link: TAS2XXX13841.bin -> ti/audio/tas2781/TAS2XXX13841.bin
+# +Link: TAS2XXX13940.bin -> ti/audio/tas2781/TAS2XXX13940.bin
+# +Link: TAS2XXX13941.bin -> ti/audio/tas2781/TAS2XXX13941.bin
+# +Link: TAS2XXX13A40.bin -> ti/audio/tas2781/TAS2XXX13A40.bin
+# +Link: TAS2XXX13A41.bin -> ti/audio/tas2781/TAS2XXX13A41.bin
+# +Link: TAS2XXX1EB3.bin -> ti/audio/tas2781/TAS2XXX1EB30.bin
+# +Link: TAS2XXX1EB30.bin -> ti/audio/tas2781/TAS2XXX1EB30.bin
+# +Link: TAS2XXX1EB31.bin -> ti/audio/tas2781/TAS2XXX1EB31.bin
+# +Link: TAS2XXX2234.bin -> ti/audio/tas2781/TAS2XXX2234.bin
+# +Link: TAS2XXX2326.bin -> ti/audio/tas2781/TAS2XXX2326.bin
+# +Link: TAS2XXX387D.bin -> ti/audio/tas2781/TAS2XXX387D.bin
+# +Link: TAS2XXX387E.bin -> ti/audio/tas2781/TAS2XXX387E.bin
+# +Link: TAS2XXX387F.bin -> ti/audio/tas2781/TAS2XXX387F.bin
+# +Link: TAS2XXX3880.bin -> ti/audio/tas2781/TAS2XXX3880.bin
+# +Link: TAS2XXX3881.bin -> ti/audio/tas2781/TAS2XXX3881.bin
+# +Link: TAS2XXX3882.bin -> ti/audio/tas2781/TAS2XXX3882.bin
+# +Link: TAS2XXX3884.bin -> ti/audio/tas2781/TAS2XXX3884.bin
+# +Link: TAS2XXX3886.bin -> ti/audio/tas2781/TAS2XXX3886.bin
+# +Link: TAS2XXX38A5.bin -> ti/audio/tas2781/TAS2XXX38A5.bin
+# +Link: TAS2XXX38A7.bin -> ti/audio/tas2781/TAS2XXX38A7.bin
+# +Link: TAS2XXX38A8.bin -> ti/audio/tas2781/TAS2XXX38A8.bin
+# +Link: TAS2XXX38B8.bin -> ti/audio/tas2781/TAS2XXX38B8.bin
+# +Link: TAS2XXX38B9.bin -> ti/audio/tas2781/TAS2XXX38B9.bin
+# +Link: TAS2XXX38BA.bin -> ti/audio/tas2781/TAS2XXX38BA.bin
+# +Link: TAS2XXX38BB.bin -> ti/audio/tas2781/TAS2XXX38BB.bin
+# +Link: TAS2XXX38BE.bin -> ti/audio/tas2781/TAS2XXX38BE.bin
+# +Link: TAS2XXX38BF.bin -> ti/audio/tas2781/TAS2XXX38BF.bin
+# +Link: TAS2XXX38C3.bin -> ti/audio/tas2781/TAS2XXX38C3.bin
+# +Link: TAS2XXX38CB.bin -> ti/audio/tas2781/TAS2XXX38CB.bin
+# +Link: TAS2XXX38CD.bin -> ti/audio/tas2781/TAS2XXX38CD.bin
+# +Link: TAS2XXX38D3.bin -> ti/audio/tas2781/TAS2XXX38D3.bin
+# +Link: TAS2XXX38D4.bin -> ti/audio/tas2781/TAS2XXX38D4.bin
+# +Link: TAS2XXX38D5.bin -> ti/audio/tas2781/TAS2XXX38D5.bin
+# +Link: TAS2XXX38D6.bin -> ti/audio/tas2781/TAS2XXX38D6.bin
+# +Link: TAS2XXX38DF.bin -> ti/audio/tas2781/TAS2XXX38DF.bin
+# +Link: TAS2XXX38E0.bin -> ti/audio/tas2781/TAS2XXX38E0.bin
+# +Link: TAS2XXX38FD.bin -> ti/audio/tas2781/TAS2XXX38FD.bin
+# +Link: TAS2XXX391F.bin -> ti/audio/tas2781/TAS2XXX391F.bin
+# +Link: TAS2XXX3920.bin -> ti/audio/tas2781/TAS2XXX3920.bin
+# +Link: TAS2XXX3E300.bin -> ti/audio/tas2781/TAS2XXX3E300.bin
+# +Link: TAS2XXX3E301.bin -> ti/audio/tas2781/TAS2XXX3E301.bin
+# +Link: TAS2XXX3EE00.bin -> ti/audio/tas2781/TAS2XXX3EE00.bin
+# +Link: TAS2XXX3EE01.bin -> ti/audio/tas2781/TAS2XXX3EE01.bin
+# +Link: TAS2XXX3EF00.bin -> ti/audio/tas2781/TAS2XXX3EF00.bin
+# +Link: TAS2XXX3EF01.bin -> ti/audio/tas2781/TAS2XXX3EF01.bin
+# +Link: TAS2XXX3F000.bin -> ti/audio/tas2781/TAS2XXX3F000.bin
+# +Link: TAS2XXX3F001.bin -> ti/audio/tas2781/TAS2XXX3F001.bin
+# +Link: TAS2XXX3F100.bin -> ti/audio/tas2781/TAS2XXX3F100.bin
+# +Link: TAS2XXX3F101.bin -> ti/audio/tas2781/TAS2XXX3F101.bin
+# +Link: TAS2XXX3F200.bin -> ti/audio/tas2781/TAS2XXX3F200.bin
+# +Link: TAS2XXX3F201.bin -> ti/audio/tas2781/TAS2XXX3F201.bin
+# +Link: TAS2XXX3F300.bin -> ti/audio/tas2781/TAS2XXX3F300.bin
+# +Link: TAS2XXX3F301.bin -> ti/audio/tas2781/TAS2XXX3F301.bin
+# +Link: TAS2XXX8C70.bin -> ti/audio/tas2781/TAS2XXX8C70.bin
+# +Link: TAS2XXX8C71.bin -> ti/audio/tas2781/TAS2XXX8C71.bin
+# +Link: TAS2XXX8C72.bin -> ti/audio/tas2781/TAS2XXX8C72.bin
+# +Link: TAS2XXX8D8E.bin -> ti/audio/tas2781/TAS2XXX8D8E.bin
+# +Link: TAS2XXX8DAA.bin -> ti/audio/tas2781/TAS2XXX8DAA.bin
+# +Link: TAS2XXX8DE8.bin -> ti/audio/tas2781/TAS2XXX8DE8.bin
+# +Link: TAS2XXX8DE9.bin -> ti/audio/tas2781/TAS2XXX8DE9.bin
+# +Link: TAS2XXX8DE80.bin -> ti/audio/tas2781/TAS2XXX8DE8.bin
+# +Link: TAS2XXX8DE81.bin -> ti/audio/tas2781/TAS2XXX8DE8.bin
+# +Link: TAS2XXX8DE90.bin -> ti/audio/tas2781/TAS2XXX8DE9.bin
+# +Link: TAS2XXX8DE91.bin -> ti/audio/tas2781/TAS2XXX8DE9.bin
+# +Link: TAS2XXX8E17.bin -> ti/audio/tas2781/TAS2XXX8E17.bin
+# +Link: TAS2XXX8E19.bin -> ti/audio/tas2781/TAS2XXX8E19.bin
+# +Link: TAS2XXX8E1C.bin -> ti/audio/tas2781/TAS2XXX8E1C.bin
+# +Link: TAS2XXX8E8A.bin -> ti/audio/tas2781/TAS2XXX8E8A.bin
+# +Link: TAS2XXX8ED5.bin -> ti/audio/tas2781/TAS2XXX8ED5.bin
+# +Link: TAS2XXX8ED6.bin -> ti/audio/tas2781/TAS2XXX8ED6.bin
+# +Link: TAS2XXX8ED7.bin -> ti/audio/tas2781/TAS2XXX8ED7.bin
+# +Link: TAS2XXX8ED8.bin -> ti/audio/tas2781/TAS2XXX8ED8.bin
+# +Link: TAS2XXX8ED9.bin -> ti/audio/tas2781/TAS2XXX8ED9.bin
+# +Link: TAS2XXX8EDA.bin -> ti/audio/tas2781/TAS2XXX8EDA.bin
+# +Link: TAS2XXX8F40.bin -> ti/audio/tas2781/TAS2XXX8F40.bin
+# +Link: TAS2XXX8F41.bin -> ti/audio/tas2781/TAS2XXX8F41.bin
+# +Link: TAS2XXX8F42.bin -> ti/audio/tas2781/TAS2XXX8F42.bin
+# +Link: TAS2XXX8F62.bin -> ti/audio/tas2781/TAS2XXX8F62.bin
+# +Link: TIAS2781RCA2.bin -> ti/audio/tas2781/TIAS2781RCA2.bin
+# +Link: TIAS2781RCA4.bin -> ti/audio/tas2781/TIAS2781RCA4.bin
+# +Link: TXNW2781RCA1.bin -> ti/audio/tas2781/TXNW2781RCA0.bin
+# +Link: TXNW2781RCA0.bin -> ti/audio/tas2781/TXNW2781RCA1.bin
+# +Link: TXNW2781RCA2.bin -> ti/audio/tas2781/TIAS2781RCA2.bin
+# +Link: TXNW2781RCA4.bin -> ti/audio/tas2781/TIAS2781RCA4.bin
+#  
+#  Licence: Redistributable. See LICENCE.ti-tspa for details. Marked:
+# -	 Copyright (C) 2023 - 2024 Texas Instruments
+# +	 Copyright (C) 2023 - 2025 Texas Instruments
+#  
+#  --------------------------------------------------------------------------
+#  
+#  Driver: ti-tas2563 - tas2563 firmware
+# -File: ti/tas2563/TAS2XXX3870.bin
+# -File: ti/tas2563/INT8866RCA2.bin
+# -Link: TAS2XXX3870.bin -> ti/tas2563/TAS2XXX3870.bin
+# -Link: INT8866RCA2.bin -> ti/tas2563/INT8866RCA2.bin
+# +File: ti/audio/tas2563/TAS2XXX3870.bin
+# +File: ti/audio/tas2563/INT8866RCA2.bin
+# +Link: TAS2XXX3870.bin -> ti/audio/tas2563/TAS2XXX3870.bin
+# +Link: INT8866RCA2.bin -> ti/audio/tas2563/INT8866RCA2.bin
+#  
+#  Licence: Redistributable. LICENCE.ti-tspa for details. Marked:
+# -	 Copyright (C) 2023 - 2024 Texas Instruments
+# +	 Copyright (C) 2023 - 2025 Texas Instruments
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -8776,8 +8838,8 @@
+#  
+#  License: Redistributable. See LICENCE.lenovo for details
+#  
+# -File: HP/ish/ish_lnlm_dba6b120_152c3222.bin
+# -Link: intel/ish/ish_lnlm_dba6b120_152c3222.bin -> ../../HP/ish/ish_lnlm_dba6b120_152c3222.bin
+# +File: HP/ish/ish_lnlm_12128606.bin
+# +Link: intel/ish/ish_lnlm_12128606.bin -> ../../HP/ish/ish_lnlm_12128606.bin
+#  Version: 5.8.200.7720_1029
+#  
+#  License: Redistributable. See LICENCE.HP for details
+# 
+#
+
 SUMMARY = "Firmware files for use with Linux kernel"
 HOMEPAGE = "https://www.kernel.org/"
 DESCRIPTION = "Linux firmware is a package distributed alongside the Linux kernel \
@@ -308,7 +948,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
                     file://LICENSE.xe;md5=c674d38774242bc0c528214721488118 \
                     file://wfx/LICENCE.wf200;md5=4d1beff00d902c05c9c7e95a5d8eb52d \
-                    file://WHENCE;md5=${WHENCE_CHKSUM} \
+                    file://WHENCE;md5=4a2863b38b43abbc3a09b24ece7d1196 \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
@@ -449,7 +1089,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "fa6130988ecd7968602938c77dd6f8d2dace4e03ba0da4c0e9624dfed657e6cf"
+SRC_URI[sha256sum] = "ab57a1526595090bb4874c35335e2252288dcbea546eff491654b2313438a47d"
 
 inherit allarch
 
-- 
2.47.1


--===============1171198889568205140==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-linux-firmware-upgrade-20251021-20251111.patch"

RnJvbSBjYWYyYmEyMmNiZGQ1YjI2M2Q0MjVmMmJjNzc4MmM2NGZiMWEzNDFkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMTU6MDk6MDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aW51eC1maXJtd2FyZTogdXBncmFkZSAyMDI1MTAyMSAtPiAyMDI1MTExMQoKLS0tCiAuLi4yMDI1
MTAyMS5iYiA9PiBsaW51eC1maXJtd2FyZV8yMDI1MTExMS5iYn0gfCA2NDQgKysrKysrKysrKysr
KysrKystCiAxIGZpbGUgY2hhbmdlZCwgNjQyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS97bGludXgtZmlybXdh
cmVfMjAyNTEwMjEuYmIgPT4gbGludXgtZmlybXdhcmVfMjAyNTExMTEuYmJ9ICg4NCUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2Fy
ZV8yMDI1MTAyMS5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgt
ZmlybXdhcmVfMjAyNTExMTEuYmIKc2ltaWxhcml0eSBpbmRleCA4NCUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZV8yMDI1MTAyMS5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJt
d2FyZV8yMDI1MTExMS5iYgppbmRleCA2NmQzYmU5MGU3Li45OGEyOTJiYzUwIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlXzIwMjUx
MDIxLmJiCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgtZmly
bXdhcmVfMjAyNTExMTEuYmIKQEAgLTEsMyArMSw2NDMgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklM
RVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4K
KyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRo
ZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlm
IG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3Nh
Z2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0
ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0t
LSBXSEVOQ0UKKyMgKysrIFdIRU5DRQorIyBAQCAtMzQzOCw3ICszNDM4LDkgQEAKKyMgIEZpbGU6
IHJ0dzg5L3J0dzg4NTJhX2Z3LmJpbgorIyAgRmlsZTogcnR3ODkvcnR3ODg1MmJfZncuYmluCisj
ICBGaWxlOiBydHc4OS9ydHc4ODUyYl9mdy0xLmJpbgorIyArRmlsZTogcnR3ODkvcnR3ODg1MmJf
ZnctMi5iaW4KKyMgIEZpbGU6IHJ0dzg5L3J0dzg4NTJidF9mdy5iaW4KKyMgK0ZpbGU6IHJ0dzg5
L3J0dzg4NTJidF9mdy0xLmJpbgorIyAgRmlsZTogcnR3ODkvcnR3ODg1MmNfZncuYmluCisjICBG
aWxlOiBydHc4OS9ydHc4ODUyY19mdy0xLmJpbgorIyAgRmlsZTogcnR3ODkvcnR3ODg1MmNfZnct
Mi5iaW4KKyMgQEAgLTM2MDksNiArMzYxMSw5IEBACisjICAKKyMgIEZpbGU6IHJ0bF9uaWMvcnRs
ODEyNWQtMi5mdworIyAgVmVyc2lvbjogMC4wLjQKKyMgKworIyArRmlsZTogcnRsX25pYy9ydGw4
MTI1ay0xLmZ3CisjICtWZXJzaW9uOiAwLjAuMQorIyAgCisjICBGaWxlOiBydGxfbmljL3J0bDgx
MjZhLTIuZncKKyMgIFZlcnNpb246IDAuMC4yCisjIEBAIC00MjIzLDcgKzQyMjgsNyBAQAorIyAg
RmlsZTogaW50ZWwvaWJ0LTAwOTMtNDE1MC5kZGMKKyMgIEZpbGU6IGludGVsL2lidC0wMDkzLTEw
NTAuc2ZpCisjICBGaWxlOiBpbnRlbC9pYnQtMDA5My0xMDUwLmRkYworIyAtVmVyc2lvbjogQlRf
QmxhemFyVV9TX1JFTDkxNzI2XzIzLjE2MC4yNTM0MS45MTcyNgorIyArVmVyc2lvbjogQlRfQmxh
emFyVV9TX1JFTDkzMzI3XzIzLjE3MC4yNTM3NS45MzMyNworIyAgCisjICBGaWxlOiBpbnRlbC9p
YnQtMDE4MC0wMDQxLnNmaQorIyAgRmlsZTogaW50ZWwvaWJ0LTAxODAtMDA0MS5kZGMKKyMgQEAg
LTQyNDcsNyArNDI1Miw3IEBACisjICBGaWxlOiBpbnRlbC9pYnQtMDE5MC0wMjkxLXBjaS5zZmkK
KyMgIEZpbGU6IGludGVsL2lidC0wMTkwLTAyOTEtdXNiLmRkYworIyAgRmlsZTogaW50ZWwvaWJ0
LTAxOTAtMDI5MS11c2Iuc2ZpCisjIC1WZXJzaW9uOiBCVF9CbGF6YXJJX1NfUkVMOTkyODlfMjMu
MTYwLjI1MzQxLjk5Mjg5CisjICtWZXJzaW9uOiBCVF9CbGF6YXJJX1NfUkVMMTAwODc2XzIzLjE3
MC4yNTM3NS4xMDA4NzYKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElD
RU5DRS5pYnRfZmlybXdhcmUgZm9yIGRldGFpbHMKKyMgIAorIyBAQCAtNDI2Nyw2ICs0MjcyLDgg
QEAKKyMgIEZpbGU6IHJ0bF9idC9ydGw4NzYxYl9jb25maWcuYmluCisjICBGaWxlOiBydGxfYnQv
cnRsODc2MWJ1X2Z3LmJpbgorIyAgRmlsZTogcnRsX2J0L3J0bDg3NjFidV9jb25maWcuYmluCisj
ICtGaWxlOiBydGxfYnQvcnRsODc2MWN1X2Z3LmJpbgorIyArRmlsZTogcnRsX2J0L3J0bDg3NjFj
dV9jb25maWcuYmluCisjICBGaWxlOiBydGxfYnQvcnRsODgxMmFlX2Z3LmJpbgorIyAgRmlsZTog
cnRsX2J0L3J0bDg4MjFhX2Z3LmJpbgorIyAgTGluazogcnRsX2J0L3J0bDg4MjFhX2NvbmZpZy5i
aW4gLT4gcnRsODgyMWNfY29uZmlnLmJpbgorIyBAQCAtNDM3Myw5ICs0MzgwLDkgQEAKKyMgIFJh
d0ZpbGU6IGFtZC11Y29kZS9taWNyb2NvZGVfYW1kX2ZhbTE3aC5iaW4KKyMgIFZlcnNpb246IDIw
MjQtMTEtMjEKKyMgIFJhd0ZpbGU6IGFtZC11Y29kZS9taWNyb2NvZGVfYW1kX2ZhbTE5aC5iaW4K
KyMgLVZlcnNpb246IDIwMjUtMDctMjkKKyMgK1ZlcnNpb246IDIwMjUtMTAtMjcKKyMgIFJhd0Zp
bGU6IGFtZC11Y29kZS9taWNyb2NvZGVfYW1kX2ZhbTFhaC5iaW4KKyMgLVZlcnNpb246IDIwMjUt
MDctMjkKKyMgK1ZlcnNpb246IDIwMjUtMTAtMzAKKyMgIEZpbGU6IGFtZC11Y29kZS9SRUFETUUK
KyMgIAorIyAgTGljZW5zZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5hbWQtdWNvZGUg
Zm9yIGRldGFpbHMKKyMgQEAgLTUyOTMsNyArNTMwMCw3IEBACisjICBWZXJzaW9uOiBHdUMgQVBJ
L0FQQiB2ZXIgNzAuNC4xIGZvciBERzIKKyMgIAorIyAgRmlsZTogaTkxNS9kZzJfZ3VjXzcwLmJp
bgorIyAtVmVyc2lvbjogR3VDIEFQSS9BUEIgdmVyIDcwLjQ5LjQgZm9yIERHMgorIyArVmVyc2lv
bjogR3VDIEFQSS9BUEIgdmVyIDcwLjUzLjAgZm9yIERHMgorIyAgCisjICBGaWxlOiBpOTE1L2Rn
Ml9odWNfZ3NjLmJpbgorIyAgVmVyc2lvbjogSHVDIEFQSS9BUEIgdmVyIDcuMTAuMTYgZm9yIERH
MgorIyBAQCAtNTMxNCw3ICs1MzIxLDcgQEAKKyMgIFZlcnNpb246IERNQyBBUEkvQVBCIHZlciAy
IHJlbGVhc2UgMjMgZm9yIE1ldGVvcmxha2UKKyMgIAorIyAgRmlsZTogaTkxNS9tdGxfZ3VjXzcw
LmJpbgorIyAtVmVyc2lvbjogR3VDIEFQSS9BUEIgdmVyIDcwLjQ5LjQgZm9yIE1ldGVvcmxha2UK
KyMgK1ZlcnNpb246IEd1QyBBUEkvQVBCIHZlciA3MC41My4wIGZvciBNZXRlb3JsYWtlCisjICAK
KyMgIEZpbGU6IGk5MTUvbXRsX2h1Y19nc2MuYmluCisjICBWZXJzaW9uOiBIdUMgQVBJL0FQQiB2
ZXIgOC41LjQgZm9yIE1ldGVvcmxha2UKKyMgQEAgLTUzNDMsMTMgKzUzNTAsMTMgQEAKKyMgIFZl
cnNpb246IEdTQyBBUEkvQVBCIHYxLjAsIHJlbGVhc2UgMTA0LjAuNS4xNDI5LCBTVk4gMSBmb3Ig
THVuYXJsYWtlCisjICAKKyMgIEZpbGU6IHhlL2xubF9ndWNfNzAuYmluCisjIC1WZXJzaW9uOiBH
dUMgQVBJL0FQQiB2ZXIgNzAuNDkuNCBmb3IgTHVuYXJsYWtlCisjICtWZXJzaW9uOiBHdUMgQVBJ
L0FQQiB2ZXIgNzAuNTMuMCBmb3IgTHVuYXJsYWtlCisjICAKKyMgIEZpbGU6IHhlL2xubF9odWMu
YmluCisjICBWZXJzaW9uOiBIdUMgQVBJL0FQQiB2ZXIgOS40LjEzIGZvciBMdW5hcmxha2UKKyMg
IAorIyAgRmlsZTogeGUvYm1nX2d1Y183MC5iaW4KKyMgLVZlcnNpb246IEd1QyBBUEkvQVBCIHZl
ciA3MC40OS40IGZvciBCYXR0bGVtYWdlCisjICtWZXJzaW9uOiBHdUMgQVBJL0FQQiB2ZXIgNzAu
NTMuMCBmb3IgQmF0dGxlbWFnZQorIyAgCisjICBGaWxlOiB4ZS9ibWdfaHVjLmJpbgorIyAgVmVy
c2lvbjogSHVDIEFQSS9BUEIgdmVyIDguMi4xMCBmb3IgQmF0dGxlbWFnZQorIyBAQCAtNTM1OCw3
ICs1MzY1LDcgQEAKKyMgIFZlcnNpb246IGZhbl9jb250cm9sIHZlciAyMDMuMC4wLjAgZm9yIEJh
dHRsZW1hZ2UKKyMgIAorIyAgRmlsZTogeGUvcHRsX2d1Y183MC5iaW4KKyMgLVZlcnNpb246IEd1
QyBBUEkvQVBCIHZlciA3MC40OS40IGZvciBQYW50aGVybGFrZQorIyArVmVyc2lvbjogR3VDIEFQ
SS9BUEIgdmVyIDcwLjUzLjAgZm9yIFBhbnRoZXJsYWtlCisjICAKKyMgIEZpbGU6IHhlL3B0bF9o
dWMuYmluCisjICBWZXJzaW9uOiBIdUMgQVBJL0FQQiB2ZXIgMTAuMy4zIGZvciBQYW50aGVybGFr
ZQorIyBAQCAtNjExMCw5ICs2MTE3LDkgQEAKKyMgIERyaXZlcjogbXQ3OTIwIC0gTWVkaWFUZWsg
TVQ3OTIwIFdpcmVsZXNzIE1BQ3MKKyMgIAorIyAgRmlsZTogbWVkaWF0ZWsvV0lGSV9NVDc5NjFf
cGF0Y2hfbWN1XzFhXzJfaGRyLmJpbgorIyAtVmVyc2lvbjogMjAyNTAyMTAxNTEwMDRhCisjICtW
ZXJzaW9uOiAyMDI1MTAyMDE1MDg0M2EKKyMgIEZpbGU6IG1lZGlhdGVrL1dJRklfUkFNX0NPREVf
TVQ3OTYxXzFhLmJpbgorIyAtVmVyc2lvbjogMjAyNTAyMTAxNTA4NTUKKyMgK1ZlcnNpb246IDIw
MjUxMDIwMTUxNDAxCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VO
Q0UubWVkaWF0ZWsgZm9yIGRldGFpbHMuCisjICAKKyMgQEAgLTYxMjEsNyArNjEyOCw3IEBACisj
ICBEcml2ZXI6IG10NzkyMCAtIE1lZGlhVGVrIE1UNzkyMCBibHVldG9vdGggY2hpcHNldAorIyAg
CisjICBGaWxlOiBtZWRpYXRlay9CVF9SQU1fQ09ERV9NVDc5NjFfMWFfMl9oZHIuYmluCisjIC1W
ZXJzaW9uOiAyMDI1MDIxMDE1MTUwMgorIyArVmVyc2lvbjogMjAyNTEwMjAxNTEyNTUKKyMgIAor
IyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5tZWRpYXRlayBmb3IgZGV0
YWlscy4KKyMgIAorIyBAQCAtNjE1MCw5ICs2MTU3LDkgQEAKKyMgIERyaXZlcjogbXQ3OTIyIC0g
TWVkaWFUZWsgTVQ3OTIyIFdpcmVsZXNzIE1BQ3MKKyMgIAorIyAgRmlsZTogbWVkaWF0ZWsvV0lG
SV9NVDc5MjJfcGF0Y2hfbWN1XzFfMV9oZHIuYmluCisjIC1WZXJzaW9uOiAyMDI1MDUyMzEwMzE1
MGEKKyMgK1ZlcnNpb246IDIwMjUxMDIwMTQzMTM1YQorIyAgRmlsZTogbWVkaWF0ZWsvV0lGSV9S
QU1fQ09ERV9NVDc5MjJfMS5iaW4KKyMgLVZlcnNpb246IDIwMjUwNTIzMTAzMTA2CisjICtWZXJz
aW9uOiAyMDI1MTAyMDE0MzAwOQorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNl
ZSBMSUNFTkNFLm1lZGlhdGVrIGZvciBkZXRhaWxzLgorIyAgCisjIEBAIC02MTYxLDcgKzYxNjgs
NyBAQAorIyAgRHJpdmVyOiBtdDc5MjIgLSBNZWRpYVRlayBNVDc5MjIgYmx1ZXRvb3RoIGNoaXBz
ZXQKKyMgIAorIyAgRmlsZTogbWVkaWF0ZWsvQlRfUkFNX0NPREVfTVQ3OTIyXzFfMV9oZHIuYmlu
CisjIC1WZXJzaW9uOiAyMDI1MDkwMzEyMzUwNAorIyArVmVyc2lvbjogMjAyNTEwMjAxNDM0NDMK
KyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5tZWRpYXRlayBm
b3IgZGV0YWlscy4KKyMgIAorIyBAQCAtNjE3MCw5ICs2MTc3LDkgQEAKKyMgIERyaXZlcjogbXQ3
OTI1IC0gTWVkaWFUZWsgTVQ3OTI1IFdpcmVsZXNzIE1BQ3MKKyMgIAorIyAgRmlsZTogbWVkaWF0
ZWsvbXQ3OTI1L1dJRklfTVQ3OTI1X1BBVENIX01DVV8xXzFfaGRyLmJpbgorIyAtVmVyc2lvbjog
MjAyNTA4MjUyMTU4MzJhCisjICtWZXJzaW9uOiAyMDI1MTAxNTIxMjkyN2EKKyMgIEZpbGU6IG1l
ZGlhdGVrL210NzkyNS9XSUZJX1JBTV9DT0RFX01UNzkyNV8xXzEuYmluCisjIC1WZXJzaW9uOiAy
MDI1MDgyNTIxNTcyOAorIyArVmVyc2lvbjogMjAyNTEwMTUyMTI4MTQKKyMgIAorIyAgTGljZW5j
ZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5tZWRpYXRlayBmb3IgZGV0YWlscy4KKyMg
IAorIyBAQCAtNjE4MSwxNiArNjE4OCwyMCBAQAorIyAgRHJpdmVyOiBtdDc5MjUgLSBNZWRpYVRl
ayBNVDc5MjUgYmx1ZXRvb3RoIGNoaXBzZXQKKyMgIAorIyAgRmlsZTogbWVkaWF0ZWsvbXQ3OTI1
L0JUX1JBTV9DT0RFX01UNzkyNV8xXzFfaGRyLmJpbgorIyAtVmVyc2lvbjogMjAyNTA4MjUyMjAx
MDkKKyMgK1ZlcnNpb246IDIwMjUxMDE1MjEzMjAxCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJp
YnV0YWJsZS4gU2VlIExJQ0VOQ0UubWVkaWF0ZWsgZm9yIGRldGFpbHMuCisjICAKKyMgIC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCisjICAKKyMgLURyaXZlcjogbXQ3OTg4IC0gTWVkaWFUZWsgTVQ3OTg4IElu
dGVybmFsIDIuNUcgRXRoZXJuZXQgUGh5CisjICtEcml2ZXI6IG10ay0ycDVnZSAtIE1lZGlhVGVr
IE1UNzk4eCBJbnRlcm5hbCAyLjVHIEV0aGVybmV0IFBoeQorIyAgCisjICBGaWxlOiBtZWRpYXRl
ay9tdDc5ODgvaTJwNWdlLXBoeS1wbWIuYmluCisjIC1WZXJzaW9uOiAyMDIzMDcyOAorIyArVmVy
c2lvbjogMjAyNDEwMzAKKyMgK0ZpbGU6IG1lZGlhdGVrL210Nzk4Ny9pMnA1Z2UtcGh5LURTUEJp
dFRiLmJpbgorIyArVmVyc2lvbjogMjAyNTA4MjIKKyMgK0ZpbGU6IG1lZGlhdGVrL210Nzk4Ny9p
MnA1Z2UtcGh5LXBtYi5iaW4KKyMgK1ZlcnNpb246IDIwMjUwODIyCisjICAKKyMgIExpY2VuY2U6
IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UubWVkaWF0ZWsgZm9yIGRldGFpbHMuCisjICAK
KyMgQEAgLTY1ODMsNiArNjU5NCwxMyBAQAorIyAgRmlsZTogcWNvbS9hcHE4MDk2L21vZGVtLm1i
bgorIyAgVmVyc2lvbjogTVBTUy5USC4yLjAuMS0wMDQ4MQorIyAgUmF3RmlsZTogcWNvbS9hcHE4
MDk2L21vZGVtci5qc24KKyMgK0ZpbGU6IHFjb20va2FhbmFwYWxpL2Fkc3AubWJuCisjICtGaWxl
OiBxY29tL2thYW5hcGFsaS9hZHNwX2R0Yi5tYm4KKyMgK1ZlcnNpb246IExQQUlEU1AuSFQuMS4y
LTAwNzY5LUtBQU5BUEFMSS0xCisjICtSYXdGaWxlOiBxY29tL2thYW5hcGFsaS9hZHNwci5qc24K
KyMgK1Jhd0ZpbGU6IHFjb20va2FhbmFwYWxpL2Fkc3BzLmpzbgorIyArUmF3RmlsZTogcWNvbS9r
YWFuYXBhbGkvYWRzcHVhLmpzbgorIyArUmF3RmlsZTogcWNvbS9rYWFuYXBhbGkvYWRzcHVvLmpz
bgorIyAgRmlsZTogcWNvbS9rYWFuYXBhbGkvY2RzcC5tYm4KKyMgIEZpbGU6IHFjb20va2FhbmFw
YWxpL2Nkc3BfZHRiLm1ibgorIyAgVmVyc2lvbjogQ0RTUC5IVC4zLjItMDA2ODQtS0FBTkFQQUxJ
LTEKKyMgQEAgLTY3MjksNiArNjc0NywxMCBAQAorIyAgY2RzcC5tYm4gaGFzIGJlZW4gY29udmVy
dGVkIGZyb20gMjEtY2RzcF9zcGxpdC9maXJtd2FyZS9jZHNwLiogdXNpbmcKKyMgIGh0dHBzOi8v
Z2l0aHViLmNvbS9hbmRlcnNzb24vcGlsLXNxdWFzaGVyCisjICAKKyMgK0ZpbGU6IHFjb20va2Fh
bmFwYWxpL3NvY2NwLm1ibgorIyArRmlsZTogcWNvbS9rYWFuYXBhbGkvc29jY3BfZHRiLm1ibgor
IyArVmVyc2lvbjogU09DQ1AuRlcuMi4xLTAwMjA0LUtBQU5BUEFMSV9TT0NDUF9QQUNLLTEKKyMg
K1Jhd0ZpbGU6IHFjb20va2FhbmFwYWxpL3NvY2Nwci5qc24KKyMgIEZpbGU6IHFjb20vc2E4Nzc1
cC9hZHNwLm1ibgorIyAgVmVyc2lvbjogRFNQLkFULjEuMC4xLTAwMTYzLUxFTUFOUy0xCisjICBS
YXdGaWxlOiBxY29tL3NhODc3NXAvYWRzcHIuanNuCisjIEBAIC03NjgzLDEwICs3NzA1LDggQEAK
KyMgIExpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzNlMDAud21mdyAtPiBj
czM1bDQxL3Y2LjgzLjAvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS44NS4wLndtZncKKyMgIExpbms6
IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzEwNzQud21mdyAtPiBjczM1bDQxL3Y2
LjgzLjAvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS44NS4wLndtZncKKyMgIExpbms6IGNpcnJ1cy9j
czM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzEwNTQud21mdyAtPiBjczM1bDQxL3Y2LjgzLjAvaGFs
b19jc3BsX1JBTV9yZXZCMl8yOS44NS4wLndtZncKKyMgLUZpbGU6IGNpcnJ1cy9jczM1bDQxLWRz
cDEtc3BrLXByb3QtMTA0MzFmYjMtc3BraWQwLWwwLmJpbgorIyAtRmlsZTogY2lycnVzL2NzMzVs
NDEtZHNwMS1zcGstcHJvdC0xMDQzMWZiMy1zcGtpZDAtcjAuYmluCisjIC1GaWxlOiBjaXJydXMv
Y3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMxZmIzLXNwa2lkMS1sMC5iaW4KKyMgLUZpbGU6IGNp
cnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzFmYjMtc3BraWQxLXIwLmJpbgorIyArRmls
ZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMWZiMy1sMC5iaW4KKyMgK0ZpbGU6
IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzFmYjMtcjAuYmluCisjICBGaWxlOiBj
aXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMxMTk0LXNwa2lkMC1sMC5iaW4KKyMgIEZp
bGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzExOTQtc3BraWQwLXIwLmJpbgor
IyAgRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMTE5NC1zcGtpZDEtbDAu
YmluCisjIEBAIC03NzA5LDIyICs3NzI5LDE0IEBACisjICBMaW5rOiBjaXJydXMvY3MzNWw0MS1k
c3AxLXNway1wcm90LTEwNDMxMDU0LXNwa2lkMS1yMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1w
cm90LTEwNDMxMDc0LXNwa2lkMS1yMC5iaW4KKyMgIExpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEt
c3BrLXByb3QtMTA0MzNkNzgud21mdyAtPiBjczM1bDQxL3Y2LjgzLjAvaGFsb19jc3BsX1JBTV9y
ZXZCMl8yOS44NS4wLndtZncKKyMgIExpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3Qt
MTA0MzNkODgud21mdyAtPiBjczM1bDQxL3Y2LjgzLjAvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS44
NS4wLndtZncKKyMgLUZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzNkNzgt
c3BraWQwLWwwLmJpbgorIyAtRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQz
M2Q3OC1zcGtpZDAtcjAuYmluCisjIC1GaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90
LTEwNDMzZDc4LXNwa2lkMS1sMC5iaW4KKyMgLUZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3Br
LXByb3QtMTA0MzNkNzgtc3BraWQxLXIwLmJpbgorIyAtTGluazogY2lycnVzL2NzMzVsNDEtZHNw
MS1zcGstcHJvdC0xMDQzM2Q3OC1zcGtpZDAtbDAuYmluY2ZnIC0+IGNzMzVsNDEvYmluY2Zncy9j
czM1bDQxLWRzcDEtMTRfNWRCLmJpbmNmZworIyAtTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1z
cGstcHJvdC0xMDQzM2Q3OC1zcGtpZDAtcjAuYmluY2ZnIC0+IGNzMzVsNDEvYmluY2Zncy9jczM1
bDQxLWRzcDEtMTRfNWRCLmJpbmNmZworIyAtTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGst
cHJvdC0xMDQzM2Q3OC1zcGtpZDEtbDAuYmluY2ZnIC0+IGNzMzVsNDEvYmluY2Zncy9jczM1bDQx
LWRzcDEtMTRfNWRCLmJpbmNmZworIyAtTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJv
dC0xMDQzM2Q3OC1zcGtpZDEtcjAuYmluY2ZnIC0+IGNzMzVsNDEvYmluY2Zncy9jczM1bDQxLWRz
cDEtMTRfNWRCLmJpbmNmZworIyAtTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0x
MDQzM2Q4OC1zcGtpZDAtbDAuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzM2Q3OC1z
cGtpZDAtbDAuYmluCisjIC1MaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMz
ZDg4LXNwa2lkMC1yMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMzZDc4LXNwa2lk
MC1yMC5iaW4KKyMgLUxpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzNkODgt
c3BraWQxLWwwLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzNkNzgtc3BraWQxLWww
LmJpbgorIyAtTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzM2Q4OC1zcGtp
ZDEtcjAuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzM2Q3OC1zcGtpZDEtcjAuYmlu
CisjIC1MaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMzZDg4LXNwa2lkMC1s
MC5iaW5jZmcgLT4gY3MzNWw0MS9iaW5jZmdzL2NzMzVsNDEtZHNwMS0xNF81ZEIuYmluY2ZnCisj
IC1MaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMzZDg4LXNwa2lkMC1yMC5i
aW5jZmcgLT4gY3MzNWw0MS9iaW5jZmdzL2NzMzVsNDEtZHNwMS0xNF81ZEIuYmluY2ZnCisjIC1M
aW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMzZDg4LXNwa2lkMS1sMC5iaW5j
ZmcgLT4gY3MzNWw0MS9iaW5jZmdzL2NzMzVsNDEtZHNwMS0xNF81ZEIuYmluY2ZnCisjIC1MaW5r
OiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMzZDg4LXNwa2lkMS1yMC5iaW5jZmcg
LT4gY3MzNWw0MS9iaW5jZmdzL2NzMzVsNDEtZHNwMS0xNF81ZEIuYmluY2ZnCisjICtGaWxlOiBj
aXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMzZDc4LWwwLmJpbgorIyArRmlsZTogY2ly
cnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzM2Q3OC1yMC5iaW4KKyMgK0xpbms6IGNpcnJ1
cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzNkNzgtbDAuYmluY2ZnIC0+IGNzMzVsNDEvYmlu
Y2Zncy9jczM1bDQxLWRzcDEtMTRfNWRCLmJpbmNmZworIyArTGluazogY2lycnVzL2NzMzVsNDEt
ZHNwMS1zcGstcHJvdC0xMDQzM2Q3OC1yMC5iaW5jZmcgLT4gY3MzNWw0MS9iaW5jZmdzL2NzMzVs
NDEtZHNwMS0xNF81ZEIuYmluY2ZnCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1w
cm90LTEwNDMzZDg4LWwwLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzNkNzgtbDAu
YmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMzZDg4LXIwLmJp
biAtPiBjczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzNkNzgtcjAuYmluCisjICtMaW5rOiBjaXJy
dXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMzZDg4LWwwLmJpbmNmZyAtPiBjczM1bDQxL2Jp
bmNmZ3MvY3MzNWw0MS1kc3AxLTE0XzVkQi5iaW5jZmcKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQx
LWRzcDEtc3BrLXByb3QtMTA0MzNkODgtcjAuYmluY2ZnIC0+IGNzMzVsNDEvYmluY2Zncy9jczM1
bDQxLWRzcDEtMTRfNWRCLmJpbmNmZworIyAgTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGst
cHJvdC0xMDQzODhmNC53bWZ3IC0+IGNzMzVsNDEvdjYuODMuMC9oYWxvX2NzcGxfUkFNX3JldkIy
XzI5Ljg1LjAud21mdworIyAgRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQz
ODhmNC1zcGtpZDAuYmluCisjICBGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEw
NDM4OGY0LXNwa2lkMS5iaW4KKyMgQEAgLTg1NTYsMTY1ICs4NTY4LDIxNSBAQAorIyAgCisjICAt
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQorIyAgRHJpdmVyOiB0aS10YXMyNzgxIC0gdGFzMjc4MSBmaXJtd2Fy
ZQorIyAtRmlsZTogdGkvdGFzMjc4MS9UQVMyWFhYMEM5NC5iaW4KKyMgLUZpbGU6IHRpL3RhczI3
ODEvVEFTMlhYWDBDOTUuYmluCisjIC1GaWxlOiB0aS90YXMyNzgxL1RBUzJYWFgwQzk2LmJpbgor
IyAtRmlsZTogdGkvdGFzMjc4MS9UQVMyWFhYMEM5Ny5iaW4KKyMgLUZpbGU6IHRpL3RhczI3ODEv
VEFTMlhYWDEwQTQwLmJpbgorIyAtRmlsZTogdGkvdGFzMjc4MS9UQVMyWFhYMTBBNDEuYmluCisj
IC1GaWxlOiB0aS90YXMyNzgxL1RBUzJYWFgxMTU0MC5iaW4KKyMgLUZpbGU6IHRpL3RhczI3ODEv
VEFTMlhYWDExNTQxLmJpbgorIyAtRmlsZTogdGkvdGFzMjc4MS9UQVMyWFhYMTIwNDAuYmluCisj
IC1GaWxlOiB0aS90YXMyNzgxL1RBUzJYWFgxMjA0MS5iaW4KKyMgLUZpbGU6IHRpL3RhczI3ODEv
VEFTMlhYWDEyMTQwLmJpbgorIyAtRmlsZTogdGkvdGFzMjc4MS9UQVMyWFhYMTIxNDEuYmluCisj
IC1GaWxlOiB0aS90YXMyNzgxL1RBUzJYWFgxRUIzMC5iaW4KKyMgLUZpbGU6IHRpL3RhczI3ODEv
VEFTMlhYWDFFQjMxLmJpbgorIyAtRmlsZTogdGkvdGFzMjc4MS9UQVMyWFhYMjIzNC5iaW4KKyMg
LUZpbGU6IHRpL3RhczI3ODEvVEFTMlhYWDIzMjYuYmluCisjIC1GaWxlOiB0aS90YXMyNzgxL1RB
UzJYWFgzODdELmJpbgorIyAtRmlsZTogdGkvdGFzMjc4MS9UQVMyWFhYMzg3RS5iaW4KKyMgLUZp
bGU6IHRpL3RhczI3ODEvVEFTMlhYWDM4N0YuYmluCisjIC1GaWxlOiB0aS90YXMyNzgxL1RBUzJY
WFgzODgwLmJpbgorIyAtRmlsZTogdGkvdGFzMjc4MS9UQVMyWFhYMzg4MS5iaW4KKyMgLUZpbGU6
IHRpL3RhczI3ODEvVEFTMlhYWDM4ODIuYmluCisjIC1GaWxlOiB0aS90YXMyNzgxL1RBUzJYWFgz
ODg0LmJpbgorIyAtRmlsZTogdGkvdGFzMjc4MS9UQVMyWFhYMzg4Ni5iaW4KKyMgLUZpbGU6IHRp
L3RhczI3ODEvVEFTMlhYWDM4QTUuYmluCisjIC1GaWxlOiB0aS90YXMyNzgxL1RBUzJYWFgzOEE3
LmJpbgorIyAtRmlsZTogdGkvdGFzMjc4MS9UQVMyWFhYMzhBOC5iaW4KKyMgLUZpbGU6IHRpL3Rh
czI3ODEvVEFTMlhYWDM4QjguYmluCisjIC1GaWxlOiB0aS90YXMyNzgxL1RBUzJYWFgzOEI5LmJp
bgorIyAtRmlsZTogdGkvdGFzMjc4MS9UQVMyWFhYMzhCQS5iaW4KKyMgLUZpbGU6IHRpL3RhczI3
ODEvVEFTMlhYWDM4QkIuYmluCisjIC1GaWxlOiB0aS90YXMyNzgxL1RBUzJYWFgzOEJFLmJpbgor
IyAtRmlsZTogdGkvdGFzMjc4MS9UQVMyWFhYMzhCRi5iaW4KKyMgLUZpbGU6IHRpL3RhczI3ODEv
VEFTMlhYWDM4QzMuYmluCisjIC1GaWxlOiB0aS90YXMyNzgxL1RBUzJYWFgzOENCLmJpbgorIyAt
RmlsZTogdGkvdGFzMjc4MS9UQVMyWFhYMzhDRC5iaW4KKyMgLUZpbGU6IHRpL3RhczI3ODEvVEFT
MlhYWDM4RDMuYmluCisjIC1GaWxlOiB0aS90YXMyNzgxL1RBUzJYWFgzOEQ0LmJpbgorIyAtRmls
ZTogdGkvdGFzMjc4MS9UQVMyWFhYMzhENS5iaW4KKyMgLUZpbGU6IHRpL3RhczI3ODEvVEFTMlhY
WDM4RDYuYmluCisjIC1GaWxlOiB0aS90YXMyNzgxL1RBUzJYWFgzOERGLmJpbgorIyAtRmlsZTog
dGkvdGFzMjc4MS9UQVMyWFhYMzhFMC5iaW4KKyMgLUZpbGU6IHRpL3RhczI3ODEvVEFTMlhYWDM4
RkQuYmluCisjIC1GaWxlOiB0aS90YXMyNzgxL1RBUzJYWFgzOTFGLmJpbgorIyAtRmlsZTogdGkv
dGFzMjc4MS9UQVMyWFhYMzkyMC5iaW4KKyMgLUZpbGU6IHRpL3RhczI3ODEvVEFTMlhYWDNFMzAw
LmJpbgorIyAtRmlsZTogdGkvdGFzMjc4MS9UQVMyWFhYM0UzMDEuYmluCisjIC1GaWxlOiB0aS90
YXMyNzgxL1RBUzJYWFgzRUUwMC5iaW4KKyMgLUZpbGU6IHRpL3RhczI3ODEvVEFTMlhYWDNFRTAx
LmJpbgorIyAtRmlsZTogdGkvdGFzMjc4MS9UQVMyWFhYM0VGMDAuYmluCisjIC1GaWxlOiB0aS90
YXMyNzgxL1RBUzJYWFgzRUYwMS5iaW4KKyMgLUZpbGU6IHRpL3RhczI3ODEvVEFTMlhYWDNGMDAw
LmJpbgorIyAtRmlsZTogdGkvdGFzMjc4MS9UQVMyWFhYM0YwMDEuYmluCisjIC1GaWxlOiB0aS90
YXMyNzgxL1RBUzJYWFgzRjEwMC5iaW4KKyMgLUZpbGU6IHRpL3RhczI3ODEvVEFTMlhYWDNGMTAx
LmJpbgorIyAtRmlsZTogdGkvdGFzMjc4MS9UQVMyWFhYM0YyMDAuYmluCisjIC1GaWxlOiB0aS90
YXMyNzgxL1RBUzJYWFgzRjIwMS5iaW4KKyMgLUZpbGU6IHRpL3RhczI3ODEvVEFTMlhYWDNGMzAw
LmJpbgorIyAtRmlsZTogdGkvdGFzMjc4MS9UQVMyWFhYM0YzMDEuYmluCisjIC1GaWxlOiB0aS90
YXMyNzgxL1RBUzJYWFg4REU4LmJpbgorIyAtRmlsZTogdGkvdGFzMjc4MS9UQVMyWFhYOERFOS5i
aW4KKyMgLUZpbGU6IHRpL3RhczI3ODEvVFhOVzI3ODFSQ0EwLmJpbgorIyAtRmlsZTogdGkvdGFz
Mjc4MS9UWE5XMjc4MVJDQTEuYmluCisjIC1GaWxlOiB0aS90YXMyNzgxL1RJQVMyNzgxUkNBMi5i
aW4KKyMgLUZpbGU6IHRpL3RhczI3ODEvVElBUzI3ODFSQ0E0LmJpbgorIyAtTGluazogVEFTMlhY
WDBDOTQuYmluIC0+IHRpL3RhczI3ODEvVEFTMlhYWDBDOTQuYmluCisjIC1MaW5rOiBUQVMyWFhY
MEM5NS5iaW4gLT4gdGkvdGFzMjc4MS9UQVMyWFhYMEM5NS5iaW4KKyMgLUxpbms6IFRBUzJYWFgw
Qzk2LmJpbiAtPiB0aS90YXMyNzgxL1RBUzJYWFgwQzk2LmJpbgorIyAtTGluazogVEFTMlhYWDBD
OTcuYmluIC0+IHRpL3RhczI3ODEvVEFTMlhYWDBDOTcuYmluCisjIC1MaW5rOiBUQVMyWFhYMTAz
QzhERTgwLmJpbiAtPiB0aS90YXMyNzgxL1RBUzJYWFg4REU4LmJpbgorIyAtTGluazogVEFTMlhY
WDEwM0M4REU4MS5iaW4gLT4gdGkvdGFzMjc4MS9UQVMyWFhYOERFOC5iaW4KKyMgLUxpbms6IFRB
UzJYWFgxMDNDOERFOTAuYmluIC0+IHRpL3RhczI3ODEvVEFTMlhYWDhERTkuYmluCisjIC1MaW5r
OiBUQVMyWFhYMTAzQzhERTkxLmJpbiAtPiB0aS90YXMyNzgxL1RBUzJYWFg4REU5LmJpbgorIyAt
TGluazogVEFTMlhYWDEwM0M4REU4LTAuYmluIC0+IHRpL3RhczI3ODEvVEFTMlhYWDhERTguYmlu
CisjIC1MaW5rOiBUQVMyWFhYMTAzQzhERTgtMS5iaW4gLT4gdGkvdGFzMjc4MS9UQVMyWFhYOERF
OC5iaW4KKyMgLUxpbms6IFRBUzJYWFgxMDNDOERFOS0wLmJpbiAtPiB0aS90YXMyNzgxL1RBUzJY
WFg4REU5LmJpbgorIyAtTGluazogVEFTMlhYWDEwM0M4REU5LTEuYmluIC0+IHRpL3RhczI3ODEv
VEFTMlhYWDhERTkuYmluCisjIC1MaW5rOiBUQVMyWFhYMTBBNDAuYmluIC0+IHRpL3RhczI3ODEv
VEFTMlhYWDEwQTQwLmJpbgorIyAtTGluazogVEFTMlhYWDEwQTQxLmJpbiAtPiB0aS90YXMyNzgx
L1RBUzJYWFgxMEE0MS5iaW4KKyMgLUxpbms6IFRBUzJYWFgxMTU0MC5iaW4gLT4gdGkvdGFzMjc4
MS9UQVMyWFhYMTE1NDAuYmluCisjIC1MaW5rOiBUQVMyWFhYMTE1NDEuYmluIC0+IHRpL3RhczI3
ODEvVEFTMlhYWDExNTQxLmJpbgorIyAtTGluazogVEFTMlhYWDEyMDQwLmJpbiAtPiB0aS90YXMy
NzgxL1RBUzJYWFgxMjA0MC5iaW4KKyMgLUxpbms6IFRBUzJYWFgxMjA0MS5iaW4gLT4gdGkvdGFz
Mjc4MS9UQVMyWFhYMTIwNDEuYmluCisjIC1MaW5rOiBUQVMyWFhYMTIxNDAuYmluIC0+IHRpL3Rh
czI3ODEvVEFTMlhYWDEyMTQwLmJpbgorIyAtTGluazogVEFTMlhYWDEyMTQxLmJpbiAtPiB0aS90
YXMyNzgxL1RBUzJYWFgxMjE0MS5iaW4KKyMgLUxpbms6IFRBUzJYWFgxRUIzLmJpbiAtPiB0aS90
YXMyNzgxL1RBUzJYWFgxRUIzMC5iaW4KKyMgLUxpbms6IFRBUzJYWFgxRUIzMC5iaW4gLT4gdGkv
dGFzMjc4MS9UQVMyWFhYMUVCMzAuYmluCisjIC1MaW5rOiBUQVMyWFhYMUVCMzEuYmluIC0+IHRp
L3RhczI3ODEvVEFTMlhYWDFFQjMxLmJpbgorIyAtTGluazogVEFTMlhYWDIyMzQuYmluIC0+IHRp
L3RhczI3ODEvVEFTMlhYWDIyMzQuYmluCisjIC1MaW5rOiBUQVMyWFhYMjMyNi5iaW4gLT4gdGkv
dGFzMjc4MS9UQVMyWFhYMjMyNi5iaW4KKyMgLUxpbms6IFRBUzJYWFgzODdELmJpbiAtPiB0aS90
YXMyNzgxL1RBUzJYWFgzODdELmJpbgorIyAtTGluazogVEFTMlhYWDM4N0UuYmluIC0+IHRpL3Rh
czI3ODEvVEFTMlhYWDM4N0UuYmluCisjIC1MaW5rOiBUQVMyWFhYMzg3Ri5iaW4gLT4gdGkvdGFz
Mjc4MS9UQVMyWFhYMzg3Ri5iaW4KKyMgLUxpbms6IFRBUzJYWFgzODgwLmJpbiAtPiB0aS90YXMy
NzgxL1RBUzJYWFgzODgwLmJpbgorIyAtTGluazogVEFTMlhYWDM4ODEuYmluIC0+IHRpL3RhczI3
ODEvVEFTMlhYWDM4ODEuYmluCisjIC1MaW5rOiBUQVMyWFhYMzg4Mi5iaW4gLT4gdGkvdGFzMjc4
MS9UQVMyWFhYMzg4Mi5iaW4KKyMgLUxpbms6IFRBUzJYWFgzODg0LmJpbiAtPiB0aS90YXMyNzgx
L1RBUzJYWFgzODg0LmJpbgorIyAtTGluazogVEFTMlhYWDM4ODYuYmluIC0+IHRpL3RhczI3ODEv
VEFTMlhYWDM4ODYuYmluCisjIC1MaW5rOiBUQVMyWFhYMzhBNS5iaW4gLT4gdGkvdGFzMjc4MS9U
QVMyWFhYMzhBNS5iaW4KKyMgLUxpbms6IFRBUzJYWFgzOEE3LmJpbiAtPiB0aS90YXMyNzgxL1RB
UzJYWFgzOEE3LmJpbgorIyAtTGluazogVEFTMlhYWDM4QTguYmluIC0+IHRpL3RhczI3ODEvVEFT
MlhYWDM4QTguYmluCisjIC1MaW5rOiBUQVMyWFhYMzhCOC5iaW4gLT4gdGkvdGFzMjc4MS9UQVMy
WFhYMzhCOC5iaW4KKyMgLUxpbms6IFRBUzJYWFgzOEI5LmJpbiAtPiB0aS90YXMyNzgxL1RBUzJY
WFgzOEI5LmJpbgorIyAtTGluazogVEFTMlhYWDM4QkEuYmluIC0+IHRpL3RhczI3ODEvVEFTMlhY
WDM4QkEuYmluCisjIC1MaW5rOiBUQVMyWFhYMzhCQi5iaW4gLT4gdGkvdGFzMjc4MS9UQVMyWFhY
MzhCQi5iaW4KKyMgLUxpbms6IFRBUzJYWFgzOEJFLmJpbiAtPiB0aS90YXMyNzgxL1RBUzJYWFgz
OEJFLmJpbgorIyAtTGluazogVEFTMlhYWDM4QkYuYmluIC0+IHRpL3RhczI3ODEvVEFTMlhYWDM4
QkYuYmluCisjIC1MaW5rOiBUQVMyWFhYMzhDMy5iaW4gLT4gdGkvdGFzMjc4MS9UQVMyWFhYMzhD
My5iaW4KKyMgLUxpbms6IFRBUzJYWFgzOENCLmJpbiAtPiB0aS90YXMyNzgxL1RBUzJYWFgzOENC
LmJpbgorIyAtTGluazogVEFTMlhYWDM4Q0QuYmluIC0+IHRpL3RhczI3ODEvVEFTMlhYWDM4Q0Qu
YmluCisjIC1MaW5rOiBUQVMyWFhYMzhEMy5iaW4gLT4gdGkvdGFzMjc4MS9UQVMyWFhYMzhEMy5i
aW4KKyMgLUxpbms6IFRBUzJYWFgzOEQ0LmJpbiAtPiB0aS90YXMyNzgxL1RBUzJYWFgzOEQ0LmJp
bgorIyAtTGluazogVEFTMlhYWDM4RDUuYmluIC0+IHRpL3RhczI3ODEvVEFTMlhYWDM4RDUuYmlu
CisjIC1MaW5rOiBUQVMyWFhYMzhENi5iaW4gLT4gdGkvdGFzMjc4MS9UQVMyWFhYMzhENi5iaW4K
KyMgLUxpbms6IFRBUzJYWFgzOERGLmJpbiAtPiB0aS90YXMyNzgxL1RBUzJYWFgzOERGLmJpbgor
IyAtTGluazogVEFTMlhYWDM4RTAuYmluIC0+IHRpL3RhczI3ODEvVEFTMlhYWDM4RTAuYmluCisj
IC1MaW5rOiBUQVMyWFhYMzhGRC5iaW4gLT4gdGkvdGFzMjc4MS9UQVMyWFhYMzhGRC5iaW4KKyMg
LUxpbms6IFRBUzJYWFgzOTFGLmJpbiAtPiB0aS90YXMyNzgxL1RBUzJYWFgzOTFGLmJpbgorIyAt
TGluazogVEFTMlhYWDM5MjAuYmluIC0+IHRpL3RhczI3ODEvVEFTMlhYWDM5MjAuYmluCisjIC1M
aW5rOiBUQVMyWFhYM0UzMDAuYmluIC0+IHRpL3RhczI3ODEvVEFTMlhYWDNFMzAwLmJpbgorIyAt
TGluazogVEFTMlhYWDNFMzAxLmJpbiAtPiB0aS90YXMyNzgxL1RBUzJYWFgzRTMwMS5iaW4KKyMg
LUxpbms6IFRBUzJYWFgzRUUwMC5iaW4gLT4gdGkvdGFzMjc4MS9UQVMyWFhYM0VFMDAuYmluCisj
IC1MaW5rOiBUQVMyWFhYM0VFMDEuYmluIC0+IHRpL3RhczI3ODEvVEFTMlhYWDNFRTAxLmJpbgor
IyAtTGluazogVEFTMlhYWDNFRjAwLmJpbiAtPiB0aS90YXMyNzgxL1RBUzJYWFgzRUYwMC5iaW4K
KyMgLUxpbms6IFRBUzJYWFgzRUYwMS5iaW4gLT4gdGkvdGFzMjc4MS9UQVMyWFhYM0VGMDEuYmlu
CisjIC1MaW5rOiBUQVMyWFhYM0YwMDAuYmluIC0+IHRpL3RhczI3ODEvVEFTMlhYWDNGMDAwLmJp
bgorIyAtTGluazogVEFTMlhYWDNGMDAxLmJpbiAtPiB0aS90YXMyNzgxL1RBUzJYWFgzRjAwMS5i
aW4KKyMgLUxpbms6IFRBUzJYWFgzRjEwMC5iaW4gLT4gdGkvdGFzMjc4MS9UQVMyWFhYM0YxMDAu
YmluCisjIC1MaW5rOiBUQVMyWFhYM0YxMDEuYmluIC0+IHRpL3RhczI3ODEvVEFTMlhYWDNGMTAx
LmJpbgorIyAtTGluazogVEFTMlhYWDNGMjAwLmJpbiAtPiB0aS90YXMyNzgxL1RBUzJYWFgzRjIw
MC5iaW4KKyMgLUxpbms6IFRBUzJYWFgzRjIwMS5iaW4gLT4gdGkvdGFzMjc4MS9UQVMyWFhYM0Yy
MDEuYmluCisjIC1MaW5rOiBUQVMyWFhYM0YzMDAuYmluIC0+IHRpL3RhczI3ODEvVEFTMlhYWDNG
MzAwLmJpbgorIyAtTGluazogVEFTMlhYWDNGMzAxLmJpbiAtPiB0aS90YXMyNzgxL1RBUzJYWFgz
RjMwMS5iaW4KKyMgLUxpbms6IFRBUzJYWFg4REU4LmJpbiAtPiB0aS90YXMyNzgxL1RBUzJYWFg4
REU4LmJpbgorIyAtTGluazogVEFTMlhYWDhERTkuYmluIC0+IHRpL3RhczI3ODEvVEFTMlhYWDhE
RTkuYmluCisjIC1MaW5rOiBUQVMyWFhYOERFODAuYmluIC0+IHRpL3RhczI3ODEvVEFTMlhYWDhE
RTguYmluCisjIC1MaW5rOiBUQVMyWFhYOERFODEuYmluIC0+IHRpL3RhczI3ODEvVEFTMlhYWDhE
RTguYmluCisjIC1MaW5rOiBUQVMyWFhYOERFOTAuYmluIC0+IHRpL3RhczI3ODEvVEFTMlhYWDhE
RTkuYmluCisjIC1MaW5rOiBUQVMyWFhYOERFOTEuYmluIC0+IHRpL3RhczI3ODEvVEFTMlhYWDhE
RTkuYmluCisjIC1MaW5rOiBUSUFTMjc4MVJDQTIuYmluIC0+IHRpL3RhczI3ODEvVElBUzI3ODFS
Q0EyLmJpbgorIyAtTGluazogVElBUzI3ODFSQ0E0LmJpbiAtPiB0aS90YXMyNzgxL1RJQVMyNzgx
UkNBNC5iaW4KKyMgLUxpbms6IFRYTlcyNzgxUkNBMS5iaW4gLT4gdGkvdGFzMjc4MS9UWE5XMjc4
MVJDQTAuYmluCisjIC1MaW5rOiBUWE5XMjc4MVJDQTAuYmluIC0+IHRpL3RhczI3ODEvVFhOVzI3
ODFSQ0ExLmJpbgorIyAtTGluazogVFhOVzI3ODFSQ0EyLmJpbiAtPiB0aS90YXMyNzgxL1RJQVMy
NzgxUkNBMi5iaW4KKyMgLUxpbms6IFRYTlcyNzgxUkNBNC5iaW4gLT4gdGkvdGFzMjc4MS9USUFT
Mjc4MVJDQTQuYmluCisjICtGaWxlOiB0aS9hdWRpby90YXMyNzgxL1RBUzJYWFgwQzk0LmJpbgor
IyArRmlsZTogdGkvYXVkaW8vdGFzMjc4MS9UQVMyWFhYMEM5NS5iaW4KKyMgK0ZpbGU6IHRpL2F1
ZGlvL3RhczI3ODEvVEFTMlhYWDBDOTYuYmluCisjICtGaWxlOiB0aS9hdWRpby90YXMyNzgxL1RB
UzJYWFgwQzk3LmJpbgorIyArRmlsZTogdGkvYXVkaW8vdGFzMjc4MS9UQVMyWFhYMTBBNDAuYmlu
CisjICtGaWxlOiB0aS9hdWRpby90YXMyNzgxL1RBUzJYWFgxMEE0MS5iaW4KKyMgK0ZpbGU6IHRp
L2F1ZGlvL3RhczI3ODEvVEFTMlhYWDExNTQwLmJpbgorIyArRmlsZTogdGkvYXVkaW8vdGFzMjc4
MS9UQVMyWFhYMTE1NDEuYmluCisjICtGaWxlOiB0aS9hdWRpby90YXMyNzgxL1RBUzJYWFgxMjA0
MC5iaW4KKyMgK0ZpbGU6IHRpL2F1ZGlvL3RhczI3ODEvVEFTMlhYWDEyMDQxLmJpbgorIyArRmls
ZTogdGkvYXVkaW8vdGFzMjc4MS9UQVMyWFhYMTIxNDAuYmluCisjICtGaWxlOiB0aS9hdWRpby90
YXMyNzgxL1RBUzJYWFgxMjE0MS5iaW4KKyMgK0ZpbGU6IHRpL2F1ZGlvL3RhczI3ODEvVEFTMlhY
WDEzODQwLmJpbgorIyArRmlsZTogdGkvYXVkaW8vdGFzMjc4MS9UQVMyWFhYMTM4NDEuYmluCisj
ICtGaWxlOiB0aS9hdWRpby90YXMyNzgxL1RBUzJYWFgxMzk0MC5iaW4KKyMgK0ZpbGU6IHRpL2F1
ZGlvL3RhczI3ODEvVEFTMlhYWDEzOTQxLmJpbgorIyArRmlsZTogdGkvYXVkaW8vdGFzMjc4MS9U
QVMyWFhYMTNBNDAuYmluCisjICtGaWxlOiB0aS9hdWRpby90YXMyNzgxL1RBUzJYWFgxM0E0MS5i
aW4KKyMgK0ZpbGU6IHRpL2F1ZGlvL3RhczI3ODEvVEFTMlhYWDFFQjMwLmJpbgorIyArRmlsZTog
dGkvYXVkaW8vdGFzMjc4MS9UQVMyWFhYMUVCMzEuYmluCisjICtGaWxlOiB0aS9hdWRpby90YXMy
NzgxL1RBUzJYWFgyMjM0LmJpbgorIyArRmlsZTogdGkvYXVkaW8vdGFzMjc4MS9UQVMyWFhYMjMy
Ni5iaW4KKyMgK0ZpbGU6IHRpL2F1ZGlvL3RhczI3ODEvVEFTMlhYWDM4N0QuYmluCisjICtGaWxl
OiB0aS9hdWRpby90YXMyNzgxL1RBUzJYWFgzODdFLmJpbgorIyArRmlsZTogdGkvYXVkaW8vdGFz
Mjc4MS9UQVMyWFhYMzg3Ri5iaW4KKyMgK0ZpbGU6IHRpL2F1ZGlvL3RhczI3ODEvVEFTMlhYWDM4
ODAuYmluCisjICtGaWxlOiB0aS9hdWRpby90YXMyNzgxL1RBUzJYWFgzODgxLmJpbgorIyArRmls
ZTogdGkvYXVkaW8vdGFzMjc4MS9UQVMyWFhYMzg4Mi5iaW4KKyMgK0ZpbGU6IHRpL2F1ZGlvL3Rh
czI3ODEvVEFTMlhYWDM4ODQuYmluCisjICtGaWxlOiB0aS9hdWRpby90YXMyNzgxL1RBUzJYWFgz
ODg2LmJpbgorIyArRmlsZTogdGkvYXVkaW8vdGFzMjc4MS9UQVMyWFhYMzhBNS5iaW4KKyMgK0Zp
bGU6IHRpL2F1ZGlvL3RhczI3ODEvVEFTMlhYWDM4QTcuYmluCisjICtGaWxlOiB0aS9hdWRpby90
YXMyNzgxL1RBUzJYWFgzOEE4LmJpbgorIyArRmlsZTogdGkvYXVkaW8vdGFzMjc4MS9UQVMyWFhY
MzhCOC5iaW4KKyMgK0ZpbGU6IHRpL2F1ZGlvL3RhczI3ODEvVEFTMlhYWDM4QjkuYmluCisjICtG
aWxlOiB0aS9hdWRpby90YXMyNzgxL1RBUzJYWFgzOEJBLmJpbgorIyArRmlsZTogdGkvYXVkaW8v
dGFzMjc4MS9UQVMyWFhYMzhCQi5iaW4KKyMgK0ZpbGU6IHRpL2F1ZGlvL3RhczI3ODEvVEFTMlhY
WDM4QkUuYmluCisjICtGaWxlOiB0aS9hdWRpby90YXMyNzgxL1RBUzJYWFgzOEJGLmJpbgorIyAr
RmlsZTogdGkvYXVkaW8vdGFzMjc4MS9UQVMyWFhYMzhDMy5iaW4KKyMgK0ZpbGU6IHRpL2F1ZGlv
L3RhczI3ODEvVEFTMlhYWDM4Q0IuYmluCisjICtGaWxlOiB0aS9hdWRpby90YXMyNzgxL1RBUzJY
WFgzOENELmJpbgorIyArRmlsZTogdGkvYXVkaW8vdGFzMjc4MS9UQVMyWFhYMzhEMy5iaW4KKyMg
K0ZpbGU6IHRpL2F1ZGlvL3RhczI3ODEvVEFTMlhYWDM4RDQuYmluCisjICtGaWxlOiB0aS9hdWRp
by90YXMyNzgxL1RBUzJYWFgzOEQ1LmJpbgorIyArRmlsZTogdGkvYXVkaW8vdGFzMjc4MS9UQVMy
WFhYMzhENi5iaW4KKyMgK0ZpbGU6IHRpL2F1ZGlvL3RhczI3ODEvVEFTMlhYWDM4REYuYmluCisj
ICtGaWxlOiB0aS9hdWRpby90YXMyNzgxL1RBUzJYWFgzOEUwLmJpbgorIyArRmlsZTogdGkvYXVk
aW8vdGFzMjc4MS9UQVMyWFhYMzhGRC5iaW4KKyMgK0ZpbGU6IHRpL2F1ZGlvL3RhczI3ODEvVEFT
MlhYWDM5MUYuYmluCisjICtGaWxlOiB0aS9hdWRpby90YXMyNzgxL1RBUzJYWFgzOTIwLmJpbgor
IyArRmlsZTogdGkvYXVkaW8vdGFzMjc4MS9UQVMyWFhYM0UzMDAuYmluCisjICtGaWxlOiB0aS9h
dWRpby90YXMyNzgxL1RBUzJYWFgzRTMwMS5iaW4KKyMgK0ZpbGU6IHRpL2F1ZGlvL3RhczI3ODEv
VEFTMlhYWDNFRTAwLmJpbgorIyArRmlsZTogdGkvYXVkaW8vdGFzMjc4MS9UQVMyWFhYM0VFMDEu
YmluCisjICtGaWxlOiB0aS9hdWRpby90YXMyNzgxL1RBUzJYWFgzRUYwMC5iaW4KKyMgK0ZpbGU6
IHRpL2F1ZGlvL3RhczI3ODEvVEFTMlhYWDNFRjAxLmJpbgorIyArRmlsZTogdGkvYXVkaW8vdGFz
Mjc4MS9UQVMyWFhYM0YwMDAuYmluCisjICtGaWxlOiB0aS9hdWRpby90YXMyNzgxL1RBUzJYWFgz
RjAwMS5iaW4KKyMgK0ZpbGU6IHRpL2F1ZGlvL3RhczI3ODEvVEFTMlhYWDNGMTAwLmJpbgorIyAr
RmlsZTogdGkvYXVkaW8vdGFzMjc4MS9UQVMyWFhYM0YxMDEuYmluCisjICtGaWxlOiB0aS9hdWRp
by90YXMyNzgxL1RBUzJYWFgzRjIwMC5iaW4KKyMgK0ZpbGU6IHRpL2F1ZGlvL3RhczI3ODEvVEFT
MlhYWDNGMjAxLmJpbgorIyArRmlsZTogdGkvYXVkaW8vdGFzMjc4MS9UQVMyWFhYM0YzMDAuYmlu
CisjICtGaWxlOiB0aS9hdWRpby90YXMyNzgxL1RBUzJYWFgzRjMwMS5iaW4KKyMgK0ZpbGU6IHRp
L2F1ZGlvL3RhczI3ODEvVEFTMlhYWDhDNzAuYmluCisjICtGaWxlOiB0aS9hdWRpby90YXMyNzgx
L1RBUzJYWFg4QzcxLmJpbgorIyArRmlsZTogdGkvYXVkaW8vdGFzMjc4MS9UQVMyWFhYOEM3Mi5i
aW4KKyMgK0ZpbGU6IHRpL2F1ZGlvL3RhczI3ODEvVEFTMlhYWDhEOEUuYmluCisjICtGaWxlOiB0
aS9hdWRpby90YXMyNzgxL1RBUzJYWFg4REFBLmJpbgorIyArRmlsZTogdGkvYXVkaW8vdGFzMjc4
MS9UQVMyWFhYOERFOC5iaW4KKyMgK0ZpbGU6IHRpL2F1ZGlvL3RhczI3ODEvVEFTMlhYWDhERTku
YmluCisjICtGaWxlOiB0aS9hdWRpby90YXMyNzgxL1RBUzJYWFg4RTE3LmJpbgorIyArRmlsZTog
dGkvYXVkaW8vdGFzMjc4MS9UQVMyWFhYOEUxOS5iaW4KKyMgK0ZpbGU6IHRpL2F1ZGlvL3RhczI3
ODEvVEFTMlhYWDhFMUMuYmluCisjICtGaWxlOiB0aS9hdWRpby90YXMyNzgxL1RBUzJYWFg4RThB
LmJpbgorIyArRmlsZTogdGkvYXVkaW8vdGFzMjc4MS9UQVMyWFhYOEVENS5iaW4KKyMgK0ZpbGU6
IHRpL2F1ZGlvL3RhczI3ODEvVEFTMlhYWDhFRDYuYmluCisjICtGaWxlOiB0aS9hdWRpby90YXMy
NzgxL1RBUzJYWFg4RUQ3LmJpbgorIyArRmlsZTogdGkvYXVkaW8vdGFzMjc4MS9UQVMyWFhYOEVE
OC5iaW4KKyMgK0ZpbGU6IHRpL2F1ZGlvL3RhczI3ODEvVEFTMlhYWDhFRDkuYmluCisjICtGaWxl
OiB0aS9hdWRpby90YXMyNzgxL1RBUzJYWFg4RURBLmJpbgorIyArRmlsZTogdGkvYXVkaW8vdGFz
Mjc4MS9UQVMyWFhYOEY0MC5iaW4KKyMgK0ZpbGU6IHRpL2F1ZGlvL3RhczI3ODEvVEFTMlhYWDhG
NDEuYmluCisjICtGaWxlOiB0aS9hdWRpby90YXMyNzgxL1RBUzJYWFg4RjQyLmJpbgorIyArRmls
ZTogdGkvYXVkaW8vdGFzMjc4MS9UQVMyWFhYOEY2Mi5iaW4KKyMgK0ZpbGU6IHRpL2F1ZGlvL3Rh
czI3ODEvVFhOVzI3ODFSQ0EwLmJpbgorIyArRmlsZTogdGkvYXVkaW8vdGFzMjc4MS9UWE5XMjc4
MVJDQTEuYmluCisjICtGaWxlOiB0aS9hdWRpby90YXMyNzgxL1RJQVMyNzgxUkNBMi5iaW4KKyMg
K0ZpbGU6IHRpL2F1ZGlvL3RhczI3ODEvVElBUzI3ODFSQ0E0LmJpbgorIyArTGluazogVEFTMlhY
WDBDOTQuYmluIC0+IHRpL2F1ZGlvL3RhczI3ODEvVEFTMlhYWDBDOTQuYmluCisjICtMaW5rOiBU
QVMyWFhYMEM5NS5iaW4gLT4gdGkvYXVkaW8vdGFzMjc4MS9UQVMyWFhYMEM5NS5iaW4KKyMgK0xp
bms6IFRBUzJYWFgwQzk2LmJpbiAtPiB0aS9hdWRpby90YXMyNzgxL1RBUzJYWFgwQzk2LmJpbgor
IyArTGluazogVEFTMlhYWDBDOTcuYmluIC0+IHRpL2F1ZGlvL3RhczI3ODEvVEFTMlhYWDBDOTcu
YmluCisjICtMaW5rOiBUQVMyWFhYMTAzQzhERTgwLmJpbiAtPiB0aS9hdWRpby90YXMyNzgxL1RB
UzJYWFg4REU4LmJpbgorIyArTGluazogVEFTMlhYWDEwM0M4REU4MS5iaW4gLT4gdGkvYXVkaW8v
dGFzMjc4MS9UQVMyWFhYOERFOC5iaW4KKyMgK0xpbms6IFRBUzJYWFgxMDNDOERFOTAuYmluIC0+
IHRpL2F1ZGlvL3RhczI3ODEvVEFTMlhYWDhERTkuYmluCisjICtMaW5rOiBUQVMyWFhYMTAzQzhE
RTkxLmJpbiAtPiB0aS9hdWRpby90YXMyNzgxL1RBUzJYWFg4REU5LmJpbgorIyArTGluazogVEFT
MlhYWDEwM0M4REU4LTAuYmluIC0+IHRpL2F1ZGlvL3RhczI3ODEvVEFTMlhYWDhERTguYmluCisj
ICtMaW5rOiBUQVMyWFhYMTAzQzhERTgtMS5iaW4gLT4gdGkvYXVkaW8vdGFzMjc4MS9UQVMyWFhY
OERFOC5iaW4KKyMgK0xpbms6IFRBUzJYWFgxMDNDOERFOS0wLmJpbiAtPiB0aS9hdWRpby90YXMy
NzgxL1RBUzJYWFg4REU5LmJpbgorIyArTGluazogVEFTMlhYWDEwM0M4REU5LTEuYmluIC0+IHRp
L2F1ZGlvL3RhczI3ODEvVEFTMlhYWDhERTkuYmluCisjICtMaW5rOiBUQVMyWFhYMTBBNDAuYmlu
IC0+IHRpL2F1ZGlvL3RhczI3ODEvVEFTMlhYWDEwQTQwLmJpbgorIyArTGluazogVEFTMlhYWDEw
QTQxLmJpbiAtPiB0aS9hdWRpby90YXMyNzgxL1RBUzJYWFgxMEE0MS5iaW4KKyMgK0xpbms6IFRB
UzJYWFgxMTU0MC5iaW4gLT4gdGkvYXVkaW8vdGFzMjc4MS9UQVMyWFhYMTE1NDAuYmluCisjICtM
aW5rOiBUQVMyWFhYMTE1NDEuYmluIC0+IHRpL2F1ZGlvL3RhczI3ODEvVEFTMlhYWDExNTQxLmJp
bgorIyArTGluazogVEFTMlhYWDEyMDQwLmJpbiAtPiB0aS9hdWRpby90YXMyNzgxL1RBUzJYWFgx
MjA0MC5iaW4KKyMgK0xpbms6IFRBUzJYWFgxMjA0MS5iaW4gLT4gdGkvYXVkaW8vdGFzMjc4MS9U
QVMyWFhYMTIwNDEuYmluCisjICtMaW5rOiBUQVMyWFhYMTIxNDAuYmluIC0+IHRpL2F1ZGlvL3Rh
czI3ODEvVEFTMlhYWDEyMTQwLmJpbgorIyArTGluazogVEFTMlhYWDEyMTQxLmJpbiAtPiB0aS9h
dWRpby90YXMyNzgxL1RBUzJYWFgxMjE0MS5iaW4KKyMgK0xpbms6IFRBUzJYWFgxMzg0MC5iaW4g
LT4gdGkvYXVkaW8vdGFzMjc4MS9UQVMyWFhYMTM4NDAuYmluCisjICtMaW5rOiBUQVMyWFhYMTM4
NDEuYmluIC0+IHRpL2F1ZGlvL3RhczI3ODEvVEFTMlhYWDEzODQxLmJpbgorIyArTGluazogVEFT
MlhYWDEzOTQwLmJpbiAtPiB0aS9hdWRpby90YXMyNzgxL1RBUzJYWFgxMzk0MC5iaW4KKyMgK0xp
bms6IFRBUzJYWFgxMzk0MS5iaW4gLT4gdGkvYXVkaW8vdGFzMjc4MS9UQVMyWFhYMTM5NDEuYmlu
CisjICtMaW5rOiBUQVMyWFhYMTNBNDAuYmluIC0+IHRpL2F1ZGlvL3RhczI3ODEvVEFTMlhYWDEz
QTQwLmJpbgorIyArTGluazogVEFTMlhYWDEzQTQxLmJpbiAtPiB0aS9hdWRpby90YXMyNzgxL1RB
UzJYWFgxM0E0MS5iaW4KKyMgK0xpbms6IFRBUzJYWFgxRUIzLmJpbiAtPiB0aS9hdWRpby90YXMy
NzgxL1RBUzJYWFgxRUIzMC5iaW4KKyMgK0xpbms6IFRBUzJYWFgxRUIzMC5iaW4gLT4gdGkvYXVk
aW8vdGFzMjc4MS9UQVMyWFhYMUVCMzAuYmluCisjICtMaW5rOiBUQVMyWFhYMUVCMzEuYmluIC0+
IHRpL2F1ZGlvL3RhczI3ODEvVEFTMlhYWDFFQjMxLmJpbgorIyArTGluazogVEFTMlhYWDIyMzQu
YmluIC0+IHRpL2F1ZGlvL3RhczI3ODEvVEFTMlhYWDIyMzQuYmluCisjICtMaW5rOiBUQVMyWFhY
MjMyNi5iaW4gLT4gdGkvYXVkaW8vdGFzMjc4MS9UQVMyWFhYMjMyNi5iaW4KKyMgK0xpbms6IFRB
UzJYWFgzODdELmJpbiAtPiB0aS9hdWRpby90YXMyNzgxL1RBUzJYWFgzODdELmJpbgorIyArTGlu
azogVEFTMlhYWDM4N0UuYmluIC0+IHRpL2F1ZGlvL3RhczI3ODEvVEFTMlhYWDM4N0UuYmluCisj
ICtMaW5rOiBUQVMyWFhYMzg3Ri5iaW4gLT4gdGkvYXVkaW8vdGFzMjc4MS9UQVMyWFhYMzg3Ri5i
aW4KKyMgK0xpbms6IFRBUzJYWFgzODgwLmJpbiAtPiB0aS9hdWRpby90YXMyNzgxL1RBUzJYWFgz
ODgwLmJpbgorIyArTGluazogVEFTMlhYWDM4ODEuYmluIC0+IHRpL2F1ZGlvL3RhczI3ODEvVEFT
MlhYWDM4ODEuYmluCisjICtMaW5rOiBUQVMyWFhYMzg4Mi5iaW4gLT4gdGkvYXVkaW8vdGFzMjc4
MS9UQVMyWFhYMzg4Mi5iaW4KKyMgK0xpbms6IFRBUzJYWFgzODg0LmJpbiAtPiB0aS9hdWRpby90
YXMyNzgxL1RBUzJYWFgzODg0LmJpbgorIyArTGluazogVEFTMlhYWDM4ODYuYmluIC0+IHRpL2F1
ZGlvL3RhczI3ODEvVEFTMlhYWDM4ODYuYmluCisjICtMaW5rOiBUQVMyWFhYMzhBNS5iaW4gLT4g
dGkvYXVkaW8vdGFzMjc4MS9UQVMyWFhYMzhBNS5iaW4KKyMgK0xpbms6IFRBUzJYWFgzOEE3LmJp
biAtPiB0aS9hdWRpby90YXMyNzgxL1RBUzJYWFgzOEE3LmJpbgorIyArTGluazogVEFTMlhYWDM4
QTguYmluIC0+IHRpL2F1ZGlvL3RhczI3ODEvVEFTMlhYWDM4QTguYmluCisjICtMaW5rOiBUQVMy
WFhYMzhCOC5iaW4gLT4gdGkvYXVkaW8vdGFzMjc4MS9UQVMyWFhYMzhCOC5iaW4KKyMgK0xpbms6
IFRBUzJYWFgzOEI5LmJpbiAtPiB0aS9hdWRpby90YXMyNzgxL1RBUzJYWFgzOEI5LmJpbgorIyAr
TGluazogVEFTMlhYWDM4QkEuYmluIC0+IHRpL2F1ZGlvL3RhczI3ODEvVEFTMlhYWDM4QkEuYmlu
CisjICtMaW5rOiBUQVMyWFhYMzhCQi5iaW4gLT4gdGkvYXVkaW8vdGFzMjc4MS9UQVMyWFhYMzhC
Qi5iaW4KKyMgK0xpbms6IFRBUzJYWFgzOEJFLmJpbiAtPiB0aS9hdWRpby90YXMyNzgxL1RBUzJY
WFgzOEJFLmJpbgorIyArTGluazogVEFTMlhYWDM4QkYuYmluIC0+IHRpL2F1ZGlvL3RhczI3ODEv
VEFTMlhYWDM4QkYuYmluCisjICtMaW5rOiBUQVMyWFhYMzhDMy5iaW4gLT4gdGkvYXVkaW8vdGFz
Mjc4MS9UQVMyWFhYMzhDMy5iaW4KKyMgK0xpbms6IFRBUzJYWFgzOENCLmJpbiAtPiB0aS9hdWRp
by90YXMyNzgxL1RBUzJYWFgzOENCLmJpbgorIyArTGluazogVEFTMlhYWDM4Q0QuYmluIC0+IHRp
L2F1ZGlvL3RhczI3ODEvVEFTMlhYWDM4Q0QuYmluCisjICtMaW5rOiBUQVMyWFhYMzhEMy5iaW4g
LT4gdGkvYXVkaW8vdGFzMjc4MS9UQVMyWFhYMzhEMy5iaW4KKyMgK0xpbms6IFRBUzJYWFgzOEQ0
LmJpbiAtPiB0aS9hdWRpby90YXMyNzgxL1RBUzJYWFgzOEQ0LmJpbgorIyArTGluazogVEFTMlhY
WDM4RDUuYmluIC0+IHRpL2F1ZGlvL3RhczI3ODEvVEFTMlhYWDM4RDUuYmluCisjICtMaW5rOiBU
QVMyWFhYMzhENi5iaW4gLT4gdGkvYXVkaW8vdGFzMjc4MS9UQVMyWFhYMzhENi5iaW4KKyMgK0xp
bms6IFRBUzJYWFgzOERGLmJpbiAtPiB0aS9hdWRpby90YXMyNzgxL1RBUzJYWFgzOERGLmJpbgor
IyArTGluazogVEFTMlhYWDM4RTAuYmluIC0+IHRpL2F1ZGlvL3RhczI3ODEvVEFTMlhYWDM4RTAu
YmluCisjICtMaW5rOiBUQVMyWFhYMzhGRC5iaW4gLT4gdGkvYXVkaW8vdGFzMjc4MS9UQVMyWFhY
MzhGRC5iaW4KKyMgK0xpbms6IFRBUzJYWFgzOTFGLmJpbiAtPiB0aS9hdWRpby90YXMyNzgxL1RB
UzJYWFgzOTFGLmJpbgorIyArTGluazogVEFTMlhYWDM5MjAuYmluIC0+IHRpL2F1ZGlvL3RhczI3
ODEvVEFTMlhYWDM5MjAuYmluCisjICtMaW5rOiBUQVMyWFhYM0UzMDAuYmluIC0+IHRpL2F1ZGlv
L3RhczI3ODEvVEFTMlhYWDNFMzAwLmJpbgorIyArTGluazogVEFTMlhYWDNFMzAxLmJpbiAtPiB0
aS9hdWRpby90YXMyNzgxL1RBUzJYWFgzRTMwMS5iaW4KKyMgK0xpbms6IFRBUzJYWFgzRUUwMC5i
aW4gLT4gdGkvYXVkaW8vdGFzMjc4MS9UQVMyWFhYM0VFMDAuYmluCisjICtMaW5rOiBUQVMyWFhY
M0VFMDEuYmluIC0+IHRpL2F1ZGlvL3RhczI3ODEvVEFTMlhYWDNFRTAxLmJpbgorIyArTGluazog
VEFTMlhYWDNFRjAwLmJpbiAtPiB0aS9hdWRpby90YXMyNzgxL1RBUzJYWFgzRUYwMC5iaW4KKyMg
K0xpbms6IFRBUzJYWFgzRUYwMS5iaW4gLT4gdGkvYXVkaW8vdGFzMjc4MS9UQVMyWFhYM0VGMDEu
YmluCisjICtMaW5rOiBUQVMyWFhYM0YwMDAuYmluIC0+IHRpL2F1ZGlvL3RhczI3ODEvVEFTMlhY
WDNGMDAwLmJpbgorIyArTGluazogVEFTMlhYWDNGMDAxLmJpbiAtPiB0aS9hdWRpby90YXMyNzgx
L1RBUzJYWFgzRjAwMS5iaW4KKyMgK0xpbms6IFRBUzJYWFgzRjEwMC5iaW4gLT4gdGkvYXVkaW8v
dGFzMjc4MS9UQVMyWFhYM0YxMDAuYmluCisjICtMaW5rOiBUQVMyWFhYM0YxMDEuYmluIC0+IHRp
L2F1ZGlvL3RhczI3ODEvVEFTMlhYWDNGMTAxLmJpbgorIyArTGluazogVEFTMlhYWDNGMjAwLmJp
biAtPiB0aS9hdWRpby90YXMyNzgxL1RBUzJYWFgzRjIwMC5iaW4KKyMgK0xpbms6IFRBUzJYWFgz
RjIwMS5iaW4gLT4gdGkvYXVkaW8vdGFzMjc4MS9UQVMyWFhYM0YyMDEuYmluCisjICtMaW5rOiBU
QVMyWFhYM0YzMDAuYmluIC0+IHRpL2F1ZGlvL3RhczI3ODEvVEFTMlhYWDNGMzAwLmJpbgorIyAr
TGluazogVEFTMlhYWDNGMzAxLmJpbiAtPiB0aS9hdWRpby90YXMyNzgxL1RBUzJYWFgzRjMwMS5i
aW4KKyMgK0xpbms6IFRBUzJYWFg4QzcwLmJpbiAtPiB0aS9hdWRpby90YXMyNzgxL1RBUzJYWFg4
QzcwLmJpbgorIyArTGluazogVEFTMlhYWDhDNzEuYmluIC0+IHRpL2F1ZGlvL3RhczI3ODEvVEFT
MlhYWDhDNzEuYmluCisjICtMaW5rOiBUQVMyWFhYOEM3Mi5iaW4gLT4gdGkvYXVkaW8vdGFzMjc4
MS9UQVMyWFhYOEM3Mi5iaW4KKyMgK0xpbms6IFRBUzJYWFg4RDhFLmJpbiAtPiB0aS9hdWRpby90
YXMyNzgxL1RBUzJYWFg4RDhFLmJpbgorIyArTGluazogVEFTMlhYWDhEQUEuYmluIC0+IHRpL2F1
ZGlvL3RhczI3ODEvVEFTMlhYWDhEQUEuYmluCisjICtMaW5rOiBUQVMyWFhYOERFOC5iaW4gLT4g
dGkvYXVkaW8vdGFzMjc4MS9UQVMyWFhYOERFOC5iaW4KKyMgK0xpbms6IFRBUzJYWFg4REU5LmJp
biAtPiB0aS9hdWRpby90YXMyNzgxL1RBUzJYWFg4REU5LmJpbgorIyArTGluazogVEFTMlhYWDhE
RTgwLmJpbiAtPiB0aS9hdWRpby90YXMyNzgxL1RBUzJYWFg4REU4LmJpbgorIyArTGluazogVEFT
MlhYWDhERTgxLmJpbiAtPiB0aS9hdWRpby90YXMyNzgxL1RBUzJYWFg4REU4LmJpbgorIyArTGlu
azogVEFTMlhYWDhERTkwLmJpbiAtPiB0aS9hdWRpby90YXMyNzgxL1RBUzJYWFg4REU5LmJpbgor
IyArTGluazogVEFTMlhYWDhERTkxLmJpbiAtPiB0aS9hdWRpby90YXMyNzgxL1RBUzJYWFg4REU5
LmJpbgorIyArTGluazogVEFTMlhYWDhFMTcuYmluIC0+IHRpL2F1ZGlvL3RhczI3ODEvVEFTMlhY
WDhFMTcuYmluCisjICtMaW5rOiBUQVMyWFhYOEUxOS5iaW4gLT4gdGkvYXVkaW8vdGFzMjc4MS9U
QVMyWFhYOEUxOS5iaW4KKyMgK0xpbms6IFRBUzJYWFg4RTFDLmJpbiAtPiB0aS9hdWRpby90YXMy
NzgxL1RBUzJYWFg4RTFDLmJpbgorIyArTGluazogVEFTMlhYWDhFOEEuYmluIC0+IHRpL2F1ZGlv
L3RhczI3ODEvVEFTMlhYWDhFOEEuYmluCisjICtMaW5rOiBUQVMyWFhYOEVENS5iaW4gLT4gdGkv
YXVkaW8vdGFzMjc4MS9UQVMyWFhYOEVENS5iaW4KKyMgK0xpbms6IFRBUzJYWFg4RUQ2LmJpbiAt
PiB0aS9hdWRpby90YXMyNzgxL1RBUzJYWFg4RUQ2LmJpbgorIyArTGluazogVEFTMlhYWDhFRDcu
YmluIC0+IHRpL2F1ZGlvL3RhczI3ODEvVEFTMlhYWDhFRDcuYmluCisjICtMaW5rOiBUQVMyWFhY
OEVEOC5iaW4gLT4gdGkvYXVkaW8vdGFzMjc4MS9UQVMyWFhYOEVEOC5iaW4KKyMgK0xpbms6IFRB
UzJYWFg4RUQ5LmJpbiAtPiB0aS9hdWRpby90YXMyNzgxL1RBUzJYWFg4RUQ5LmJpbgorIyArTGlu
azogVEFTMlhYWDhFREEuYmluIC0+IHRpL2F1ZGlvL3RhczI3ODEvVEFTMlhYWDhFREEuYmluCisj
ICtMaW5rOiBUQVMyWFhYOEY0MC5iaW4gLT4gdGkvYXVkaW8vdGFzMjc4MS9UQVMyWFhYOEY0MC5i
aW4KKyMgK0xpbms6IFRBUzJYWFg4RjQxLmJpbiAtPiB0aS9hdWRpby90YXMyNzgxL1RBUzJYWFg4
RjQxLmJpbgorIyArTGluazogVEFTMlhYWDhGNDIuYmluIC0+IHRpL2F1ZGlvL3RhczI3ODEvVEFT
MlhYWDhGNDIuYmluCisjICtMaW5rOiBUQVMyWFhYOEY2Mi5iaW4gLT4gdGkvYXVkaW8vdGFzMjc4
MS9UQVMyWFhYOEY2Mi5iaW4KKyMgK0xpbms6IFRJQVMyNzgxUkNBMi5iaW4gLT4gdGkvYXVkaW8v
dGFzMjc4MS9USUFTMjc4MVJDQTIuYmluCisjICtMaW5rOiBUSUFTMjc4MVJDQTQuYmluIC0+IHRp
L2F1ZGlvL3RhczI3ODEvVElBUzI3ODFSQ0E0LmJpbgorIyArTGluazogVFhOVzI3ODFSQ0ExLmJp
biAtPiB0aS9hdWRpby90YXMyNzgxL1RYTlcyNzgxUkNBMC5iaW4KKyMgK0xpbms6IFRYTlcyNzgx
UkNBMC5iaW4gLT4gdGkvYXVkaW8vdGFzMjc4MS9UWE5XMjc4MVJDQTEuYmluCisjICtMaW5rOiBU
WE5XMjc4MVJDQTIuYmluIC0+IHRpL2F1ZGlvL3RhczI3ODEvVElBUzI3ODFSQ0EyLmJpbgorIyAr
TGluazogVFhOVzI3ODFSQ0E0LmJpbiAtPiB0aS9hdWRpby90YXMyNzgxL1RJQVMyNzgxUkNBNC5i
aW4KKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS50aS10c3Bh
IGZvciBkZXRhaWxzLiBNYXJrZWQ6CisjIC0JIENvcHlyaWdodCAoQykgMjAyMyAtIDIwMjQgVGV4
YXMgSW5zdHJ1bWVudHMKKyMgKwkgQ29weXJpZ2h0IChDKSAyMDIzIC0gMjAyNSBUZXhhcyBJbnN0
cnVtZW50cworIyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisjICBEcml2ZXI6IHRpLXRh
czI1NjMgLSB0YXMyNTYzIGZpcm13YXJlCisjIC1GaWxlOiB0aS90YXMyNTYzL1RBUzJYWFgzODcw
LmJpbgorIyAtRmlsZTogdGkvdGFzMjU2My9JTlQ4ODY2UkNBMi5iaW4KKyMgLUxpbms6IFRBUzJY
WFgzODcwLmJpbiAtPiB0aS90YXMyNTYzL1RBUzJYWFgzODcwLmJpbgorIyAtTGluazogSU5UODg2
NlJDQTIuYmluIC0+IHRpL3RhczI1NjMvSU5UODg2NlJDQTIuYmluCisjICtGaWxlOiB0aS9hdWRp
by90YXMyNTYzL1RBUzJYWFgzODcwLmJpbgorIyArRmlsZTogdGkvYXVkaW8vdGFzMjU2My9JTlQ4
ODY2UkNBMi5iaW4KKyMgK0xpbms6IFRBUzJYWFgzODcwLmJpbiAtPiB0aS9hdWRpby90YXMyNTYz
L1RBUzJYWFgzODcwLmJpbgorIyArTGluazogSU5UODg2NlJDQTIuYmluIC0+IHRpL2F1ZGlvL3Rh
czI1NjMvSU5UODg2NlJDQTIuYmluCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4g
TElDRU5DRS50aS10c3BhIGZvciBkZXRhaWxzLiBNYXJrZWQ6CisjIC0JIENvcHlyaWdodCAoQykg
MjAyMyAtIDIwMjQgVGV4YXMgSW5zdHJ1bWVudHMKKyMgKwkgQ29weXJpZ2h0IChDKSAyMDIzIC0g
MjAyNSBUZXhhcyBJbnN0cnVtZW50cworIyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisj
IEBAIC04Nzc2LDggKzg4MzgsOCBAQAorIyAgCisjICBMaWNlbnNlOiBSZWRpc3RyaWJ1dGFibGUu
IFNlZSBMSUNFTkNFLmxlbm92byBmb3IgZGV0YWlscworIyAgCisjIC1GaWxlOiBIUC9pc2gvaXNo
X2xubG1fZGJhNmIxMjBfMTUyYzMyMjIuYmluCisjIC1MaW5rOiBpbnRlbC9pc2gvaXNoX2xubG1f
ZGJhNmIxMjBfMTUyYzMyMjIuYmluIC0+IC4uLy4uL0hQL2lzaC9pc2hfbG5sbV9kYmE2YjEyMF8x
NTJjMzIyMi5iaW4KKyMgK0ZpbGU6IEhQL2lzaC9pc2hfbG5sbV8xMjEyODYwNi5iaW4KKyMgK0xp
bms6IGludGVsL2lzaC9pc2hfbG5sbV8xMjEyODYwNi5iaW4gLT4gLi4vLi4vSFAvaXNoL2lzaF9s
bmxtXzEyMTI4NjA2LmJpbgorIyAgVmVyc2lvbjogNS44LjIwMC43NzIwXzEwMjkKKyMgIAorIyAg
TGljZW5zZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5IUCBmb3IgZGV0YWlscworIyAK
KyMKKwogU1VNTUFSWSA9ICJGaXJtd2FyZSBmaWxlcyBmb3IgdXNlIHdpdGggTGludXgga2VybmVs
IgogSE9NRVBBR0UgPSAiaHR0cHM6Ly93d3cua2VybmVsLm9yZy8iCiBERVNDUklQVElPTiA9ICJM
aW51eCBmaXJtd2FyZSBpcyBhIHBhY2thZ2UgZGlzdHJpYnV0ZWQgYWxvbmdzaWRlIHRoZSBMaW51
eCBrZXJuZWwgXApAQCAtMzA4LDcgKzk0OCw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTov
L0xJQ0VOQ0UuQWJpbGlzO21kNT1iNWVlM2Y0MTA3ODBlNTY3MTFhZDQ4ZWFkYzIyYjhiYyBcCiAg
ICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTkNFLnhjNTAwMGM7bWQ1PTEyYjAyZWZhMzA0
OWRiNjVkNTI0YWViNDE4ZGQ4N2NhIFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VO
U0UueGU7bWQ1PWM2NzRkMzg3NzQyNDJiYzBjNTI4MjE0NzIxNDg4MTE4IFwKICAgICAgICAgICAg
ICAgICAgICAgZmlsZTovL3dmeC9MSUNFTkNFLndmMjAwO21kNT00ZDFiZWZmMDBkOTAyYzA1Yzlj
N2U5NWE1ZDhlYjUyZCBcCi0gICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9XSEVOQ0U7bWQ1PSR7
V0hFTkNFX0NIS1NVTX0gXAorICAgICAgICAgICAgICAgICAgICBmaWxlOi8vV0hFTkNFO21kNT00
YTI4NjNiMzhiNDNhYmJjM2EwOWIyNGVjZTdkMTE5NiBcCiAgICAgICAgICAgICAgICAgICAgICIK
ICMgV0hFTkNFIGNoZWNrc3VtIGlzIGRlZmluZWQgc2VwYXJhdGVseSB0byBlYXNlIG92ZXJyaWRp
bmcgaXQgaWYKICMgY2xhc3MtZGV2dXBzdHJlYW0gaXMgc2VsZWN0ZWQuCkBAIC00NDksNyArMTA4
OSw3IEBAIFNSQ19VUkk6Y2xhc3MtZGV2dXBzdHJlYW0gPSAiZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2Zpcm13CiAjIFBpbiB0aGlzIHRvIHRoZSAyMDIyMDUw
OSByZWxlYXNlLCBvdmVycmlkZSB0aGlzIGluIGxvY2FsLmNvbmYKIFNSQ1JFVjpjbGFzcy1kZXZ1
cHN0cmVhbSA/PSAiYjE5Y2JkY2E3OGFiMmFkZmQyMTBjOTFiZTE1YTIyNTY4ZThiOGNhZSIKIAot
U1JDX1VSSVtzaGEyNTZzdW1dID0gImZhNjEzMDk4OGVjZDc5Njg2MDI5MzhjNzdkZDZmOGQyZGFj
ZTRlMDNiYTBkYTRjMGU5NjI0ZGZlZDY1N2U2Y2YiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYWI1
N2ExNTI2NTk1MDkwYmI0ODc0YzM1MzM1ZTIyNTIyODhkY2JlYTU0NmVmZjQ5MTY1NGIyMzEzNDM4
YTQ3ZCIKIAogaW5oZXJpdCBhbGxhcmNoCiAKLS0gCjIuNDcuMQoK

--===============1171198889568205140==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1944 entries from dependency cache.
Parsing recipes...done.
Parsing of 947 .bb files complete (946 cached, 1 parsed). 1944 targets, 47 skipped, 0 masked, 0 errors.
Removing 1 recipes from the allarch sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-1a9a0e12f72fd6ca0974b203561055d7753b8c79"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:1a9a0e12f72fd6ca0974b203561055d7753b8c79"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 62 Local 53 Mirrors 0 Missed 9 Current 148 (85% match, 95% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 203 of 210 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20251111.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-firmware-1_20251111-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-firmware-1_20251111-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 209 of 210 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20251111.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-firmware-1_20251111-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-firmware-1_20251111-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 210 of 210 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20251111.bb:do_recipe_qa_setscene)
NOTE: recipe linux-firmware-1_20251111-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-firmware-1_20251111-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 665 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20251111.bb:do_fetch)
NOTE: recipe linux-firmware-1_20251111-r0: task do_fetch: Started
NOTE: recipe linux-firmware-1_20251111-r0: task do_fetch: Succeeded
NOTE: Running task 666 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20251111.bb:do_unpack)
NOTE: Running task 667 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20251111.bb:do_prepare_recipe_sysroot)
NOTE: recipe linux-firmware-1_20251111-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-firmware-1_20251111-r0: task do_unpack: Started
NOTE: recipe linux-firmware-1_20251111-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe linux-firmware-1_20251111-r0: task do_unpack: Succeeded
NOTE: Running task 668 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20251111.bb:do_patch)
NOTE: Running task 669 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20251111.bb:do_collect_spdx_deps)
NOTE: recipe linux-firmware-1_20251111-r0: task do_collect_spdx_deps: Started
NOTE: recipe linux-firmware-1_20251111-r0: task do_patch: Started
NOTE: recipe linux-firmware-1_20251111-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe linux-firmware-1_20251111-r0: task do_patch: Succeeded
NOTE: Running task 671 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20251111.bb:do_configure)
NOTE: Running task 672 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20251111.bb:do_populate_lic)
NOTE: recipe linux-firmware-1_20251111-r0: task do_populate_lic: Started
NOTE: recipe linux-firmware-1_20251111-r0: task do_configure: Started
NOTE: recipe linux-firmware-1_20251111-r0: task do_configure: Succeeded
NOTE: Running task 673 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20251111.bb:do_compile)
NOTE: recipe linux-firmware-1_20251111-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20251111.bb:do_populate_lic unihash changed to a338cd3f04e7d853319deb1e2901abb472ada9f42900060c90bca857339be948
NOTE: recipe linux-firmware-1_20251111-r0: task do_compile: Started
NOTE: recipe linux-firmware-1_20251111-r0: task do_compile: Succeeded
NOTE: Running task 674 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20251111.bb:do_install)
NOTE: recipe linux-firmware-1_20251111-r0: task do_install: Started
NOTE: recipe linux-firmware-1_20251111-r0: task do_install: Succeeded
NOTE: Running task 675 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20251111.bb:do_package)
NOTE: recipe linux-firmware-1_20251111-r0: task do_package: Started
NOTE: recipe linux-firmware-1_20251111-r0: task do_package: Failed
NOTE: Tasks Summary: Attempted 676 tasks of which 666 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251115150750.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251115150750.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20251111.bb:do_package
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20251111/temp/log.do_package.688182
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: linux-firmware-1_20251111-r0 do_package: QA Issue: linux-firmware: Files/directories were installed but not shipped in any package:
  /usr/lib/firmware/HP
  /usr/lib/firmware/HP/ish
  /usr/lib/firmware/HP/ish/ish_lnlm_12128606.bin
  /usr/lib/firmware/ti/audio
  /usr/lib/firmware/ti/audio/tas2781
  /usr/lib/firmware/ti/audio/tas2563
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX8ED7.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX3886.bin
  /usr/lib/firmware/ti/audio/tas2781/TIAS2781RCA2.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX8ED9.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX12141.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX38BB.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX13841.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX2234.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX38C3.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX3881.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX3882.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX3E300.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX8C71.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX0C95.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX10A40.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX2326.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX3EE00.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX3F101.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX12140.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX0C97.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX1EB30.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX38D6.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX38E0.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX8C72.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX11541.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX3F200.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX12040.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX3E301.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX3F301.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX11540.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX8F40.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX3F001.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX10A41.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX387D.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX38D5.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX38DF.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX8E17.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX38B8.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX38BF.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX391F.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX3EE01.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX38BE.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX3F000.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX3F201.bin
  /usr/lib/firmware/ti/audio/tas2781/TXNW2781RCA1.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX8DE9.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX8C70.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX38FD.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX38A8.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX38B9.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX38BA.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX8EDA.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX13940.bin
  /usr/lib/firmware/ti/audio/tas2781/TIAS2781RCA4.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX12041.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX3920.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX8E19.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX1EB31.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX3884.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX8ED5.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX0C96.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX3EF00.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX38D3.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX3EF01.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX8ED8.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX387E.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX3880.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX38A5.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX8F42.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX8D8E.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX13941.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX387F.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX8E8A.bin
  /usr/lib/firmware/ti/audio/tas2781/TXNW2781RCA0.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX38CB.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX13A40.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX8E1C.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX0C94.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX8DAA.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX38A7.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX8F62.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX3F300.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX13A41.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX8DE8.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX8F41.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX8ED6.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX38CD.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX3F100.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX38D4.bin
  /usr/lib/firmware/ti/audio/tas2781/TAS2XXX13840.bin
  /usr/lib/firmware/ti/audio/tas2563/INT8866RCA2.bin
  /usr/lib/firmware/ti/audio/tas2563/TAS2XXX3870.bin
  /usr/lib/firmware/intel/ish/ish_lnlm_12128606.bin
  /usr/lib/firmware/qcom/kaanapali/adspr.jsn
  /usr/lib/firmware/qcom/kaanapali/soccp.mbn
  /usr/lib/firmware/qcom/kaanapali/adspuo.jsn
  /usr/lib/firmware/qcom/kaanapali/soccp_dtb.mbn
  /usr/lib/firmware/qcom/kaanapali/adsps.jsn
  /usr/lib/firmware/qcom/kaanapali/adsp_dtb.mbn
  /usr/lib/firmware/qcom/kaanapali/adsp.mbn
  /usr/lib/firmware/qcom/kaanapali/soccpr.jsn
  /usr/lib/firmware/qcom/kaanapali/adspua.jsn
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
linux-firmware: 108 installed and not shipped files. [installed-vs-shipped]
ERROR: linux-firmware-1_20251111-r0 do_package: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20251111/temp/log.do_package.688182
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20251111.bb:do_package) failed with exit code '1'

--===============1171198889568205140==--

