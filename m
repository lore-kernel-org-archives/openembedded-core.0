Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8691EEB64DA
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:27 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.823.1686887483263578426
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Rv/ABkut;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010188c2544d76-cec9a16d-da68-4e92-9b4a-4885e3f79303-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887484;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Ysq+eUINojid6uNviflMB5/wlF+LiAQUXCB4iHikDm8=;
	b=Rv/ABkutVwbep5obdXVW1aiynFwSXKD9CPHvKz1xHRlgNkVbHdf/f8PzSEMF3IDs
	0BMMPgOGlorttcQp5YLn4vKiqnnAcEYJEyW5A5cYkW8ZMRQ0IU5YHs+TivAUcQ473ea
	xcU6uj/Lr1VJBh/DRsCzE5A+jdCHU7/6jCQqUkEU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887484;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Ysq+eUINojid6uNviflMB5/wlF+LiAQUXCB4iHikDm8=;
	b=XKpCC0dFKsB8x43qZwsdw0104KUIArp86Kd07E5n7gSRaALRixvPCcbOrCv+bgpa
	NxKrDpF/GZVMo3uD7pwJap7gMxC9QdVd2/axtPmlIz8j+aRvhIoQH4hMAgdSbwt3FGb
	KRwi/E8hFYYLhxJb4AFyFpDV7i2k9z14zIvf1bQI=
Content-Type: multipart/mixed; boundary="===============2902533235646686325=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] linux-firmware: upgrading to 20230515 SUCCEEDED
Message-ID: <01010188c2544d76-cec9a16d-da68-4e92-9b4a-4885e3f79303-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182976

--===============2902533235646686325==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *linux-firmware* to *20230515* has Succeeded.

Next steps:
    - apply the patch: git am 0001-linux-firmware-upgrade-20230404-20230515.patch
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
From 6c61e7703d935757a5f51e6856a9298d74c8fe20 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 22:14:46 +0000
Subject: [PATCH] linux-firmware: upgrade 20230404 -> 20230515

---
 ...20230404.bb => linux-firmware_20230515.bb} | 535 +++++++++++++++++-
 1 file changed, 533 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20230404.bb => linux-firmware_20230515.bb} (70%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230404.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230515.bb
similarity index 70%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20230404.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20230515.bb
index 7412c022ba..8c7479d1e8 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230404.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230515.bb
@@ -1,3 +1,534 @@
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
+# @@ -1101,22 +1101,6 @@
+#  Link: intel/ipu3-fw.bin -> irci_irci_ecr-master_20161208_0213_20170112_1500.bin
+#  
+#  Licence: Redistributable. See LICENSE.ipu3_firmware for details
+# -
+# ---------------------------------------------------------------------------
+# -
+# -Driver: cx231xx - Conexant Cx23100/101/102 USB broadcast A/V decoder
+# -
+# -File: v4l-cx231xx-avcore-01.fw
+# -
+# -Licence: Redistributable.
+# -
+# -  Conexant grants permission to use and redistribute these firmware
+# -  files for use with Conexant devices, but not as a part of the Linux
+# -  kernel or in any other form which would require these files themselves
+# -  to be covered by the terms of the GNU General Public License.
+# -  These firmware files are distributed in the hope that they will be
+# -  useful, but WITHOUT ANY WARRANTY; without even the implied warranty
+# -  of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -1274,39 +1258,19 @@
+#  
+#  --------------------------------------------------------------------------
+#  
+# +Driver: cx231xx - Conexant Cx23100/101/102 USB broadcast A/V decoder
+# +
+# +File: v4l-cx231xx-avcore-01.fw
+# +
+#  Driver: cx23418 - Conexant PCI Broadcast A/V with MPEG encoder
+#  
+#  File: v4l-cx23418-apu.fw
+#  File: v4l-cx23418-cpu.fw
+#  File: v4l-cx23418-dig.fw
+#  
+# -Licence: Redistributable.
+# -
+# -  Conexant grants permission to use and redistribute these firmware
+# -  files for use with Conexant devices, but not as a part of the Linux
+# -  kernel or in any other form which would require these files themselves
+# -  to be covered by the terms of the GNU General Public License.
+# -  These firmware files are distributed in the hope that they will be
+# -  useful, but WITHOUT ANY WARRANTY; without even the implied warranty
+# -  of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
+# -
+# ---------------------------------------------------------------------------
+# -
+#  Driver: cx23885 - Conexant PCI Express Broadcast A/V decoder
+#  
+#  File: v4l-cx23885-avcore-01.fw
+# -
+# -Licence: Redistributable.
+# -
+# -  Conexant grants permission to use and redistribute these firmware
+# -  files for use with Conexant devices, but not as a part of the Linux
+# -  kernel or in any other form which would require these files themselves
+# -  to be covered by the terms of the GNU General Public License.
+# -  These firmware files are distributed in the hope that they will be
+# -  useful, but WITHOUT ANY WARRANTY; without even the implied warranty
+# -  of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
+# -
+# ---------------------------------------------------------------------------
+#  
+#  Driver: cx23840 - Conexant sideport Broadcast A/V decoder
+#  
+# @@ -1454,8 +1418,9 @@
+#  
+#  Driver: mt7601u - MediaTek MT7601U Wireless MACs
+#  
+# -File: mt7601u.bin
+# +File: mediatek/mt7601u.bin
+#  Version: 34
+# +Link: mt7601u.bin -> mediatek/mt7601u.bin
+#  
+#  Licence: Redistributable. See LICENCE.ralink_a_mediatek_company_firmware for details
+#  
+# @@ -3419,7 +3384,7 @@
+#  File: ath11k/IPQ6018/hw1.0/q6_fw.b08
+#  File: ath11k/IPQ6018/hw1.0/q6_fw.flist
+#  File: ath11k/IPQ6018/hw1.0/q6_fw.mdt
+# -Version: WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1
+# +Version: WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
+#  File: ath11k/IPQ6018/hw1.0/Notice.txt
+#  File: ath11k/IPQ8074/hw2.0/board-2.bin
+#  File: ath11k/IPQ8074/hw2.0/m3_fw.b00
+# @@ -3437,7 +3402,7 @@
+#  File: ath11k/IPQ8074/hw2.0/q6_fw.b08
+#  File: ath11k/IPQ8074/hw2.0/q6_fw.flist
+#  File: ath11k/IPQ8074/hw2.0/q6_fw.mdt
+# -Version: WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1
+# +Version: WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
+#  File: ath11k/IPQ8074/hw2.0/Notice.txt
+#  File: ath11k/QCA6390/hw2.0/board-2.bin
+#  File: ath11k/QCA6390/hw2.0/amss.bin
+# @@ -3457,7 +3422,7 @@
+#  File: ath11k/QCN9074/hw1.0/board-2.bin
+#  File: ath11k/QCN9074/hw1.0/amss.bin
+#  File: ath11k/QCN9074/hw1.0/m3.bin
+# -Version: WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1
+# +Version: WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
+#  File: ath11k/QCN9074/hw1.0/Notice.txt
+#  File: ath11k/WCN6750/hw1.0/board-2.bin
+#  File: ath11k/WCN6750/hw1.0/wpss.b00
+# @@ -3470,7 +3435,7 @@
+#  File: ath11k/WCN6750/hw1.0/wpss.b07
+#  File: ath11k/WCN6750/hw1.0/wpss.b08
+#  File: ath11k/WCN6750/hw1.0/wpss.mdt
+# -Version: WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
+# +Version: WLAN.MSL.1.0.1-01160-QCAMSLSWPLZ-1
+#  File: ath11k/WCN6750/hw1.0/Notice.txt
+#  File: ath11k/IPQ5018/hw1.0/board-2.bin
+#  File: ath11k/IPQ5018/hw1.0/m3_fw.b00
+# @@ -3694,69 +3659,69 @@
+#  File: intel/ibt-18-1.ddc
+#  Version: BT_ThunderPeak_A0_B0_REL0201
+#  File:intel/ibt-20-0-3.sfi
+# -Version: BT_CyclonePeak_A0_REL53263
+# +Version: BT_CyclonePeak_A0_REL53392
+#  File:intel/ibt-20-0-3.ddc
+# -Version: BT_CyclonePeak_A0_REL53263
+# +Version: BT_CyclonePeak_A0_REL53392
+#  File:intel/ibt-20-1-3.sfi
+# -Version: BT_CyclonePeak_A0_REL53263
+# +Version: BT_CyclonePeak_A0_REL53392
+#  File:intel/ibt-20-1-3.ddc
+# -Version: BT_CyclonePeak_A0_REL53263
+# +Version: BT_CyclonePeak_A0_REL53392
+#  File:intel/ibt-20-1-4.sfi
+# -Version: BT_CyclonePeak_A0_REL53263
+# +Version: BT_CyclonePeak_A0_REL53392
+#  File:intel/ibt-20-1-4.ddc
+# -Version: BT_CyclonePeak_A0_REL53263
+# +Version: BT_CyclonePeak_A0_REL53392
+#  File:intel/ibt-19-0-0.sfi
+# -Version: BT_Quasar_REL53263
+# +Version: BT_Quasar_REL53392
+#  File:intel/ibt-19-0-0.ddc
+# -Version: BT_Quasar_REL53263
+# +Version: BT_Quasar_REL53392
+#  File:intel/ibt-19-0-1.sfi
+# -Version: BT_Quasar_REL53263
+# +Version: BT_Quasar_REL53392
+#  File:intel/ibt-19-0-1.ddc
+# -Version: BT_Quasar_REL53263
+# +Version: BT_Quasar_REL53392
+#  File:intel/ibt-19-0-3.sfi
+#  Version: BT_Quasar_REL53263
+#  File:intel/ibt-19-0-3.ddc
+#  Version: BT_Quasar_REL53263
+#  File:intel/ibt-19-0-4.sfi
+# -Version: BT_HarrisonPeak_REL53263
+# +Version: BT_HarrisonPeak_REL53392
+#  File:intel/ibt-19-0-4.ddc
+# -Version: BT_HarrisonPeak_REL53263
+# +Version: BT_HarrisonPeak_REL53392
+#  File:intel/ibt-19-16-4.sfi
+# -Version: BT_HarrisonPeak_REL53263
+# +Version: BT_HarrisonPeak_REL53392
+#  File:intel/ibt-19-16-4.ddc
+# -Version: BT_HarrisonPeak_REL53263
+# +Version: BT_HarrisonPeak_REL53392
+#  File:intel/ibt-19-32-1.sfi
+# -Version: BT_HarrisonPeak_REL53263
+# +Version: BT_HarrisonPeak_REL53392
+#  File:intel/ibt-19-32-1.ddc
+# -Version: BT_HarrisonPeak_REL53263
+# +Version: BT_HarrisonPeak_REL53392
+#  File:intel/ibt-19-32-0.sfi
+# -Version: BT_HarrisonPeak_REL53263
+# +Version: BT_HarrisonPeak_REL53392
+#  File:intel/ibt-19-32-0.ddc
+# -Version: BT_HarrisonPeak_REL53263
+# +Version: BT_HarrisonPeak_REL53392
+#  File:intel/ibt-19-32-4.sfi
+# -Version: BT_HarrisonPeak_REL53263
+# +Version: BT_HarrisonPeak_REL53392
+#  File:intel/ibt-19-32-4.ddc
+# -Version: BT_HarrisonPeak_REL53263
+# +Version: BT_HarrisonPeak_REL53392
+#  File:intel/ibt-19-240-1.sfi
+# -Version: BT_HarrisonPeak_REL53263
+# +Version: BT_HarrisonPeak_REL53392
+#  File:intel/ibt-19-240-1.ddc
+# -Version: BT_HarrisonPeak_REL53263
+# +Version: BT_HarrisonPeak_REL53392
+#  File:intel/ibt-19-240-4.sfi
+# -Version: BT_HarrisonPeak_REL53263
+# +Version: BT_HarrisonPeak_REL53392
+#  File:intel/ibt-19-240-4.ddc
+# -Version: BT_HarrisonPeak_REL53263
+# +Version: BT_HarrisonPeak_REL53392
+#  File:intel/ibt-0041-0041.sfi
+# -Version: BT_TyphoonPeak_REL59564
+# +Version: BT_TyphoonPeak_REL62562
+#  File:intel/ibt-0041-0041.ddc
+# -Version: BT_TyphoonPeak_REL59564
+# +Version: BT_TyphoonPeak_REL62562
+#  File:intel/ibt-0040-0041.sfi
+# -Version: BT_Solar_GfP2_REL59564
+# +Version: BT_Solar_GfP2_REL62562
+#  File:intel/ibt-0040-0041.ddc
+# -Version: BT_Solar_GfP2_REL59564
+# +Version: BT_Solar_GfP2_REL62562
+#  File:intel/ibt-1040-0041.sfi
+# -Version: BT_SolarF_GfP2_REL59564
+# +Version: BT_SolarF_GfP2_REL62562
+#  File:intel/ibt-1040-0041.ddc
+# -Version: BT_SolarF_GfP2_REL59564
+# +Version: BT_SolarF_GfP2_REL62562
+#  
+#  File:intel/ibt-0040-1020.sfi
+#  Version: BT_Solar_JfP1_REL59564
+# @@ -3777,13 +3742,13 @@
+#  Version: BT_SolarF_JfP2_REL59564
+#  
+#  File:intel/ibt-0040-4150.sfi
+# -Version: BT_Solar_JnP2_REL59564
+# +Version: BT_Solar_JnP2_REL62562
+#  File:intel/ibt-0040-4150.ddc
+# -Version: BT_Solar_JnP2_REL59564
+# +Version: BT_Solar_JnP2_REL62562
+#  File:intel/ibt-1040-4150.sfi
+# -Version: BT_SolarF_JnP2_REL59564
+# +Version: BT_SolarF_JnP2_REL62562
+#  File:intel/ibt-1040-4150.ddc
+# -Version: BT_SolarF_JnP2_REL59564
+# +Version: BT_SolarF_JnP2_REL62562
+#  
+#  Licence: Redistributable. See LICENCE.ibt_firmware for details
+#  
+# @@ -3820,6 +3785,8 @@
+#  File: rtl_bt/rtl8852bu_config.bin
+#  File: rtl_bt/rtl8852cu_fw.bin
+#  File: rtl_bt/rtl8852cu_config.bin
+# +File: rtl_bt/rtl8851bu_fw.bin
+# +File: rtl_bt/rtl8851bu_config.bin
+#  
+#  Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
+#  
+# @@ -3827,23 +3794,17 @@
+#  From https://github.com/troy-tan/driver_store
+#  Files rtl_bt/rtl8822b_* came directly from Realtek. These files are
+#  updated on April 14, 2017.
+# -Files rtl_bt/rtl8821c_* and rtl_bt/rtl8723d_* came directly from Realtek.
+# -File rtl_bt/rtl8822cu_fw.bin came directly from Realtek.
+# -updated on February 24, 2019
+# -File rtl_bt/rtl8822cu_fw.bin came directly from Realtek.
+# -updated on October 23, 2019
+# -File rtl_bt/rtl8822cu_config.bin came directly from Realtek.
+#  
+#  Found in vendor driver, 20200806_LINUX_BT_DRIVER_RTL8761B_COEX_v0202.zip
+# -File rtl_bt/rtl8761b_fw.bin
+#  File rtl_bt/rtl8761b_config.bin
+# -File rtl_bt/rtl8761bu_fw.bin
+#  File rtl_bt/rtl8761bu_config.bin
+# +
+#  --------------------------------------------------------------------------
+#  
+#  Driver: btmtk_usb - Bluetooth USB driver
+#  
+# -File: mt7650.bin
+# +File: mediatek/mt7650.bin
+# +Link: mt7650.bin -> mediatek/mt7650.bin
+#  
+#  Licence: Redistributable. See LICENCE.ralink_a_mediatek_company_firmware for details
+#  
+# @@ -3917,7 +3878,7 @@
+#  File: amd-ucode/microcode_amd_fam16h.bin
+#  Version: 2014-10-28
+#  File: amd-ucode/microcode_amd_fam17h.bin
+# -Version: 2022-04-08
+# +Version: 2023-04-13
+#  File: amd-ucode/microcode_amd_fam19h.bin
+#  Version: 2023-01-31
+#  File: amd-ucode/README
+# @@ -4313,6 +4274,8 @@
+#  File: qca/msbtfw11.mbn
+#  File: qca/msbtfw11.tlv
+#  File: qca/msnv11.bin
+# +File: qca/msnv11.b0a
+# +File: qca/msnv11.b09
+#  
+#  Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k and qca/NOTICE.txt for details
+#  
+# @@ -4716,6 +4679,9 @@
+#  
+#  File: i915/mtl_dmc.bin
+#  Version: DMC API/APB ver 2 release 12 for Meteorlake
+# +
+# +File: i915/mtl_guc_70.bin
+# +Version: GuC API/APB ver 70.6.6 for Meteorlake
+#  
+#  License: Redistributable. See LICENSE.i915 for details
+#  --------------------------------------------------------------------------
+# @@ -5218,8 +5184,9 @@
+#  Version: 20180621204904
+#  File: mediatek/mt7668pr2h.bin
+#  Version: 20180517181834
+# -File: mediatek/mt7663pr2h.bin
+# -Version: 7663e2ccn04-2006030247
+# +# Note: explicitly commented out, since it's duplicated further down
+# +# File: mediatek/mt7663pr2h.bin
+# +# Version: 7663e2ccn04-2006030247
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -5248,11 +5215,13 @@
+#  
+#  Driver: mt76x2e - MediaTek MT76x2 Wireless MACs
+#  
+# -File: mt7662.bin
+# +File: mediatek/mt7662.bin
+#  Version: 1.9
+# -
+# -File: mt7662_rom_patch.bin
+# +Link: mt7662.bin -> mediatek/mt7662.bin
+# +
+# +File: mediatek/mt7662_rom_patch.bin
+#  Version: 0.0.2_P69
+# +Link: mt7662_rom_patch.bin -> mediatek/mt7662_rom_patch.bin
+#  
+#  Licence: Redistributable. See LICENCE.ralink_a_mediatek_company_firmware for details
+#  
+# @@ -5310,7 +5279,7 @@
+#  
+#  --------------------------------------------------------------------------
+#  
+# -Driver: mt7915e - MediaTek Wireless MACs for MT7915/MT7916/MT7986
+# +Driver: mt7915e - MediaTek Wireless MACs for MT7915/MT7916/MT7986/MT7981
+#  
+#  File: mediatek/mt7915_wm.bin
+#  Version: 20220929104145
+# @@ -5324,11 +5293,11 @@
+#  Version: 20200821
+#  
+#  File: mediatek/mt7916_wm.bin
+# -Version: 20221031154713
+# +Version: 20230202145005
+#  File: mediatek/mt7916_wa.bin
+# -Version: 20221031154757
+# +Version: 20230202143332
+#  File: mediatek/mt7916_rom_patch.bin
+# -Version: 20221031154652a
+# +Version: 20230202144915a
+#  File: mediatek/mt7916_eeprom.bin
+#  Version: 20211130
+#  
+# @@ -5355,6 +5324,15 @@
+#  File: mediatek/mt7986_eeprom_mt7975_dual.bin
+#  Version: 20220208
+#  
+# +File: mediatek/mt7981_wm.bin
+# +Version: 20221208201806
+# +File: mediatek/mt7981_wa.bin
+# +Version: 20221208202048
+# +File: mediatek/mt7981_rom_patch.bin
+# +Version: 20221208201745a
+# +File: mediatek/mt7981_wo.bin
+# +Version: 20221208202138
+# +
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+#  --------------------------------------------------------------------------
+# @@ -5362,9 +5340,9 @@
+#  Driver: mt7921 - MediaTek MT7921 Wireless MACs
+#  
+#  File: mediatek/WIFI_MT7961_patch_mcu_1_2_hdr.bin
+# -Version: 20230302150916a
+# +Version: 20230331110902a
+#  File: mediatek/WIFI_RAM_CODE_MT7961_1.bin
+# -Version: 20230302150956
+# +Version: 20230331110939
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -5373,7 +5351,7 @@
+#  Driver: mt7921 - MediaTek MT7921 bluetooth chipset
+#  
+#  File: mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin
+# -Version: 20230302151355
+# +Version: 20230331111156
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -5382,9 +5360,9 @@
+#  Driver: mt7922 - MediaTek MT7922 Wireless MACs
+#  
+#  File: mediatek/WIFI_MT7922_patch_mcu_1_1_hdr.bin
+# -Version: 20230328143229a
+# +Version: 20230509203612a
+#  File: mediatek/WIFI_RAM_CODE_MT7922_1.bin
+# -Version: 20230328143313
+# +Version: 20230509203655
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -5393,7 +5371,7 @@
+#  Driver: mt7922 - MediaTek MT7922 bluetooth chipset
+#  
+#  File: mediatek/BT_RAM_CODE_MT7922_1_1_hdr.bin
+# -Version: 20230328143444
+# +Version: 20230509203838
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -6095,6 +6073,110 @@
+#  File: cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid0-r0.bin
+#  File: cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid1-l0.bin
+#  File: cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid1-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-17aa2316.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-17aa2316.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-17aa2317.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-17aa2317.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +File: cirrus/cs35l41-dsp1-spk-prot-17aa2316-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-17aa2316-spkid0-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-17aa2316-spkid1-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-17aa2316-spkid1-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid0-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid1-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid1-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-17aa2317-spkid0-l0.bin -> cs35l41-dsp1-spk-prot-17aa2316-spkid0-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-17aa2317-spkid0-r0.bin -> cs35l41-dsp1-spk-prot-17aa2316-spkid0-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-17aa2317-spkid1-l0.bin -> cs35l41-dsp1-spk-prot-17aa2316-spkid1-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-17aa2317-spkid1-r0.bin -> cs35l41-dsp1-spk-prot-17aa2316-spkid1-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-17aa2317-spkid0-l0.bin -> cs35l41-dsp1-spk-cali-17aa2316-spkid0-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-17aa2317-spkid0-r0.bin -> cs35l41-dsp1-spk-cali-17aa2316-spkid0-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-17aa2317-spkid1-l0.bin -> cs35l41-dsp1-spk-cali-17aa2316-spkid1-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-17aa2317-spkid1-r0.bin -> cs35l41-dsp1-spk-cali-17aa2316-spkid1-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-17aa2318.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-17aa2318.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-17aa2319.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-17aa2319.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-17aa231a.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-17aa231a.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-17aa2318-l0.bin -> cs35l41-dsp1-spk-prot-17aa22f1-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-17aa2318-r0.bin -> cs35l41-dsp1-spk-prot-17aa22f1-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-17aa2318-l0.bin -> cs35l41-dsp1-spk-cali-17aa22f1-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-17aa2318-r0.bin -> cs35l41-dsp1-spk-cali-17aa22f1-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-17aa2319-l0.bin -> cs35l41-dsp1-spk-prot-17aa22f2-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-17aa2319-r0.bin -> cs35l41-dsp1-spk-prot-17aa22f2-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-17aa2319-l0.bin -> cs35l41-dsp1-spk-cali-17aa22f2-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-17aa2319-r0.bin -> cs35l41-dsp1-spk-cali-17aa22f2-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-17aa231a-l0.bin -> cs35l41-dsp1-spk-prot-17aa22f2-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-17aa231a-r0.bin -> cs35l41-dsp1-spk-prot-17aa22f2-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-17aa231a-l0.bin -> cs35l41-dsp1-spk-cali-17aa22f2-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-17aa231a-r0.bin -> cs35l41-dsp1-spk-cali-17aa22f2-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8c26.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-103c8c26.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8b42.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-103c8b42.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8b43.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-103c8b43.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8b44.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-103c8b44.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8b45.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-103c8b45.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8b46.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-103c8b46.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8b47.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-103c8b47.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8b63.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-103c8b63.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8b70.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-103c8b70.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8b72.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-103c8b72.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8b74.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-103c8b74.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8b77.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-103c8b77.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8b8f.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8b92.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +File: cirrus/cs35l41-dsp1-spk-prot-103c8b42.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-103c8b42.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-103c8b43.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-103c8b43.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-103c8b44.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-103c8b44.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-103c8b45.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-103c8b45.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8b46.bin -> cs35l41-dsp1-spk-prot-103c8b45.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-103c8b46.bin -> cs35l41-dsp1-spk-cali-103c8b45.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-103c8b47.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-103c8b47.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-103c8b63-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-103c8b63-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-103c8b63-r1.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-103c8b63-r1.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-103c8b63-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-103c8b63-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-103c8b63-l1.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-103c8b63-l1.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8b70.bin -> cs35l41-dsp1-spk-prot-103c8b42.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-103c8b70.bin -> cs35l41-dsp1-spk-cali-103c8b42.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8b72.bin -> cs35l41-dsp1-spk-prot-103c8b45.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-103c8b72.bin -> cs35l41-dsp1-spk-cali-103c8b45.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8b74.bin -> cs35l41-dsp1-spk-prot-103c8b47.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-103c8b74.bin -> cs35l41-dsp1-spk-cali-103c8b47.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8b77.bin -> cs35l41-dsp1-spk-prot-103c8b45.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-103c8b77.bin -> cs35l41-dsp1-spk-cali-103c8b45.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-103c8b8f-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-103c8b8f-r1.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-103c8b8f-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-103c8b8f-r1.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8b8f-l0.bin -> cs35l41-dsp1-spk-prot-103c8b8f-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8b8f-l1.bin -> cs35l41-dsp1-spk-prot-103c8b8f-r1.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-103c8b8f-l0.bin -> cs35l41-dsp1-spk-cali-103c8b8f-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-103c8b8f-l1.bin -> cs35l41-dsp1-spk-cali-103c8b8f-r1.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-103c8b92.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-103c8b92.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8c26.bin -> cs35l41-dsp1-spk-prot-103c8b45.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-103c8c26.bin -> cs35l41-dsp1-spk-cali-103c8b45.bin
+#  
+#  License: Redistributable. See LICENSE.cirrus for details.
+#  
+# 
+#
+
 SUMMARY = "Firmware files for use with Linux kernel"
 HOMEPAGE = "https://www.kernel.org/"
 DESCRIPTION = "Linux firmware is a package distributed alongside the Linux kernel \
@@ -130,7 +661,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=${WHENCE_CHKSUM} \
+                    file://WHENCE;md5=a0997fc7a9af4e46d96529d6ef13b58a \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
@@ -212,7 +743,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "c3f9ad2bb5311cce2490f37a8052f836703d6936aabd840246b6576f1f71f607"
+SRC_URI[sha256sum] = "8b1acfa16f1ee94732a6acb50d9d6c835cf53af11068bd89ed207bbe04a1e951"
 
 inherit allarch
 
-- 
2.39.2


--===============2902533235646686325==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/linux-firmware: SRC_URI changed from "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20230404.tar.xz" to "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20230515.tar.xz"
packages/all-poky-linux/linux-firmware: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PKGSIZE changed from 76476102 to 76476230 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PKGSIZE changed from 15679876 to 16465860 (+5%)
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PKGSIZE changed from 53289884 to 45569417 (-14%)
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2-mips: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2-mips: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-gplv2-license: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-gplv2-license: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915: FILELIST: added "/lib/firmware/i915/mtl_guc_70.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGSIZE changed from 25733611 to 26037547 (+1%)
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PKGSIZE changed from 2400659 to 2399295 (-0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGSIZE changed from 17474981 to 17502921 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-license: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u-license: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u-license: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PKGSIZE changed from 45412 to 20 (-100%)
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: RDEPENDS: added "linux-firmware"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PKGSIZE changed from 2269162 to 2196522 (-3%)
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca: FILELIST: added "/lib/firmware/qca/msnv11.b0a /lib/firmware/qca/msnv11.b09"
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PKGSIZE changed from 2155397 to 2168523 (+1%)
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-yamato-license: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-yamato-license: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8761: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8761: PKGSIZE changed from 160811 to 164447 (+2%)
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8761: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-src: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-src: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGSIZE changed from 205016 to 212265 (+4%)
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PV changed from "20230404" to "20230515"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGV changed from 20230404 [default] to 20230515 [default]
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: added "/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b47.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b92.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b47.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c26.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b46.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b70.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b44.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b8f-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b8f-l1.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b8f-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b8f-r1.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b63-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b63-l1.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b72.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b63-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b63-r1.bin /lib
 /firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b43.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa2316-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa2316-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa2317-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa2317-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b44.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b43.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b72.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b72.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b43.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b77.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b45.wmfw /lib/firmware/mediatek/mt7601u.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b47.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b92.bin /lib/firmware/mediatek/mt7981_wa.bin /lib/firmware/mediatek/mt7981_wm.bin /lib/firmware/mediatek/mt7981_wo.bin /lib/firmware/cirrus/cs35
 l41-dsp1-spk-prot-103c8b77.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b47.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa2316.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b42.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa2317.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b72.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b63.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa2317-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa2317-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b77.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c26.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b74.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b74.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b42.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b45.wmfw /lib/firmware/cirrus/c
 s35l41-dsp1-spk-prot-103c8b46.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa2317.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b8f-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b8f-r1.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b8f-l1.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b8f-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b63-r1.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b63-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b63-l1.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b63-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b46.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa2319.wmfw /lib/firmware/rtl_bt/rtl8851bu_config.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b46.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b45.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa2318-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa2318-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa
 2319-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa2319-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa231a-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa231a-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b63.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa2317-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa2318-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa2318-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa2319-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa2319-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa231a-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa231a-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa2316-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa2316-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa2317-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b74.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa2319.wmfw /lib/firmware/mediat
 ek/mt7650.bin /lib/firmware/mediatek/mt7662.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa2318.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c26.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa231a.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b70.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b42.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b43.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b70.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b77.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b74.wmfw /lib/firmware/mediatek/mt7662_rom_patch.bin /lib/firmware/mediatek/mt7981_rom_patch.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c26.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b44.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b44.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b8f.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b92.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b45.bin /lib/firmwa
 re/cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa2317-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa2317-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa2318.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa2316.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa231a.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b42.wmfw /lib/firmware/rtl_bt/rtl8851bu_fw.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b70.bin"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGSIZE changed from 261712074 to 266923863 (+2%)
packages/all-poky-linux/linux-firmware/linux-firmware: PV changed from "20230404" to "20230515"

--===============2902533235646686325==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PKGSIZE changed from 53289884 to 45569417 (-14%)
packages/all-poky-linux/linux-firmware/linux-firmware-i915: FILELIST: added "/lib/firmware/i915/mtl_guc_70.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: RDEPENDS: added "linux-firmware"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PKGSIZE changed from 45412 to 20 (-100%)
packages/all-poky-linux/linux-firmware/linux-firmware-qca: FILELIST: added "/lib/firmware/qca/msnv11.b09 /lib/firmware/qca/msnv11.b0a"
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: added "/lib/firmware/mediatek/mt7662_rom_patch.bin /lib/firmware/mediatek/mt7981_rom_patch.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b70.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b63-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b63-l1.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b63.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b44.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b42.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa2319.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b45.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b43.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b45.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b45.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b43.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b44.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b8f.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-ca
 li-17aa231a.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b43.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa2316.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c26.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b72.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b42.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa2317.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa2316.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b46.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa2317-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa2317-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa2316-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa2316-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa2317-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa2317-spkid1-r0.bin
  /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b47.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b47.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b77.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa2317.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b8f-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b8f-l1.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b47.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b92.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b8f-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b8f-r1.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b63-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b63-r1.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b92.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa231a.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b47.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b63.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b77.bin /lib/firmware/cirrus
 /cs35l41-dsp1-spk-prot-17aa2318.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b72.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b70.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b74.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b74.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c26.wmfw /lib/firmware/mediatek/mt7650.bin /lib/firmware/mediatek/mt7662.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa2318-l0.bin /lib/firmware/mediatek/mt7601u.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa2318-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa2319-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa2319-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa231a-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa231a-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b46.bin /lib/firmware/rtl_bt/rtl8851bu_config.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b44.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b63-l0.bin /lib/f
 irmware/cirrus/cs35l41-dsp1-spk-cali-103c8b63-l1.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b63-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b63-r1.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b8f-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b8f-l1.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b8f-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b8f-r1.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b43.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b70.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b46.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b77.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b74.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c26.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b46.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b77.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c26.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b45.bin /lib/firmware/cirrus/cs35
 l41-dsp1-spk-cali-103c8b72.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa2318-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa2318-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa2319-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa2319-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa231a-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa231a-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa2319.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b92.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b44.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b72.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa2317-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa2317-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa2316-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa2316-spki
 d0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa2317-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa2317-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa2318.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b70.wmfw /lib/firmware/mediatek/mt7981_wa.bin /lib/firmware/mediatek/mt7981_wm.bin /lib/firmware/mediatek/mt7981_wo.bin /lib/firmware/rtl_bt/rtl8851bu_fw.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b74.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8b42.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8b42.wmfw"

--===============2902533235646686325==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-linux-firmware-upgrade-20230404-20230515.patch"

RnJvbSA2YzYxZTc3MDNkOTM1NzU3YTVmNTFlNjg1NmE5Mjk4ZDc0YzhmZTIwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMjI6MTQ6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aW51eC1maXJtd2FyZTogdXBncmFkZSAyMDIzMDQwNCAtPiAyMDIzMDUxNQoKLS0tCiAuLi4yMDIz
MDQwNC5iYiA9PiBsaW51eC1maXJtd2FyZV8yMDIzMDUxNS5iYn0gfCA1MzUgKysrKysrKysrKysr
KysrKystCiAxIGZpbGUgY2hhbmdlZCwgNTMzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS97bGludXgtZmlybXdh
cmVfMjAyMzA0MDQuYmIgPT4gbGludXgtZmlybXdhcmVfMjAyMzA1MTUuYmJ9ICg3MCUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2Fy
ZV8yMDIzMDQwNC5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgt
ZmlybXdhcmVfMjAyMzA1MTUuYmIKc2ltaWxhcml0eSBpbmRleCA3MCUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZV8yMDIzMDQwNC5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJt
d2FyZV8yMDIzMDUxNS5iYgppbmRleCA3NDEyYzAyMmJhLi44Yzc0NzlkMWU4IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlXzIwMjMw
NDA0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgtZmly
bXdhcmVfMjAyMzA1MTUuYmIKQEAgLTEsMyArMSw1MzQgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklM
RVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4K
KyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRo
ZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlm
IG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3Nh
Z2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0
ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0t
LSBXSEVOQ0UKKyMgKysrIFdIRU5DRQorIyBAQCAtMTEwMSwyMiArMTEwMSw2IEBACisjICBMaW5r
OiBpbnRlbC9pcHUzLWZ3LmJpbiAtPiBpcmNpX2lyY2lfZWNyLW1hc3Rlcl8yMDE2MTIwOF8wMjEz
XzIwMTcwMTEyXzE1MDAuYmluCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2Vl
IExJQ0VOU0UuaXB1M19maXJtd2FyZSBmb3IgZGV0YWlscworIyAtCisjIC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQorIyAtCisjIC1Ecml2ZXI6IGN4MjMxeHggLSBDb25leGFudCBDeDIzMTAwLzEwMS8xMDIg
VVNCIGJyb2FkY2FzdCBBL1YgZGVjb2RlcgorIyAtCisjIC1GaWxlOiB2NGwtY3gyMzF4eC1hdmNv
cmUtMDEuZncKKyMgLQorIyAtTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLgorIyAtCisjIC0gIENv
bmV4YW50IGdyYW50cyBwZXJtaXNzaW9uIHRvIHVzZSBhbmQgcmVkaXN0cmlidXRlIHRoZXNlIGZp
cm13YXJlCisjIC0gIGZpbGVzIGZvciB1c2Ugd2l0aCBDb25leGFudCBkZXZpY2VzLCBidXQgbm90
IGFzIGEgcGFydCBvZiB0aGUgTGludXgKKyMgLSAga2VybmVsIG9yIGluIGFueSBvdGhlciBmb3Jt
IHdoaWNoIHdvdWxkIHJlcXVpcmUgdGhlc2UgZmlsZXMgdGhlbXNlbHZlcworIyAtICB0byBiZSBj
b3ZlcmVkIGJ5IHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UuCisj
IC0gIFRoZXNlIGZpcm13YXJlIGZpbGVzIGFyZSBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0
IHRoZXkgd2lsbCBiZQorIyAtICB1c2VmdWwsIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0
aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5CisjIC0gIG9mIE1FUkNIQU5UQUJJTElUWSBv
ciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4KKyMgIAorIyAgLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KKyMgIAorIyBAQCAtMTI3NCwzOSArMTI1OCwxOSBAQAorIyAgCisjICAtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQorIyAgCisjICtEcml2ZXI6IGN4MjMxeHggLSBDb25leGFudCBDeDIzMTAwLzEwMS8x
MDIgVVNCIGJyb2FkY2FzdCBBL1YgZGVjb2RlcgorIyArCisjICtGaWxlOiB2NGwtY3gyMzF4eC1h
dmNvcmUtMDEuZncKKyMgKworIyAgRHJpdmVyOiBjeDIzNDE4IC0gQ29uZXhhbnQgUENJIEJyb2Fk
Y2FzdCBBL1Ygd2l0aCBNUEVHIGVuY29kZXIKKyMgIAorIyAgRmlsZTogdjRsLWN4MjM0MTgtYXB1
LmZ3CisjICBGaWxlOiB2NGwtY3gyMzQxOC1jcHUuZncKKyMgIEZpbGU6IHY0bC1jeDIzNDE4LWRp
Zy5mdworIyAgCisjIC1MaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuCisjIC0KKyMgLSAgQ29uZXhh
bnQgZ3JhbnRzIHBlcm1pc3Npb24gdG8gdXNlIGFuZCByZWRpc3RyaWJ1dGUgdGhlc2UgZmlybXdh
cmUKKyMgLSAgZmlsZXMgZm9yIHVzZSB3aXRoIENvbmV4YW50IGRldmljZXMsIGJ1dCBub3QgYXMg
YSBwYXJ0IG9mIHRoZSBMaW51eAorIyAtICBrZXJuZWwgb3IgaW4gYW55IG90aGVyIGZvcm0gd2hp
Y2ggd291bGQgcmVxdWlyZSB0aGVzZSBmaWxlcyB0aGVtc2VsdmVzCisjIC0gIHRvIGJlIGNvdmVy
ZWQgYnkgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZS4KKyMgLSAg
VGhlc2UgZmlybXdhcmUgZmlsZXMgYXJlIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgdGhl
eSB3aWxsIGJlCisjIC0gIHVzZWZ1bCwgYnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0
IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkKKyMgLSAgb2YgTUVSQ0hBTlRBQklMSVRZIG9yIEZJ
VE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLgorIyAtCisjIC0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQorIyAtCisjICBEcml2ZXI6IGN4MjM4ODUgLSBDb25leGFudCBQQ0kgRXhwcmVzcyBCcm9hZGNh
c3QgQS9WIGRlY29kZXIKKyMgIAorIyAgRmlsZTogdjRsLWN4MjM4ODUtYXZjb3JlLTAxLmZ3Cisj
IC0KKyMgLUxpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4KKyMgLQorIyAtICBDb25leGFudCBncmFu
dHMgcGVybWlzc2lvbiB0byB1c2UgYW5kIHJlZGlzdHJpYnV0ZSB0aGVzZSBmaXJtd2FyZQorIyAt
ICBmaWxlcyBmb3IgdXNlIHdpdGggQ29uZXhhbnQgZGV2aWNlcywgYnV0IG5vdCBhcyBhIHBhcnQg
b2YgdGhlIExpbnV4CisjIC0gIGtlcm5lbCBvciBpbiBhbnkgb3RoZXIgZm9ybSB3aGljaCB3b3Vs
ZCByZXF1aXJlIHRoZXNlIGZpbGVzIHRoZW1zZWx2ZXMKKyMgLSAgdG8gYmUgY292ZXJlZCBieSB0
aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlLgorIyAtICBUaGVzZSBm
aXJtd2FyZSBmaWxlcyBhcmUgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCB0aGV5IHdpbGwg
YmUKKyMgLSAgdXNlZnVsLCBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0
aGUgaW1wbGllZCB3YXJyYW50eQorIyAtICBvZiBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBG
T1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuCisjIC0KKyMgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAK
KyMgIERyaXZlcjogY3gyMzg0MCAtIENvbmV4YW50IHNpZGVwb3J0IEJyb2FkY2FzdCBBL1YgZGVj
b2RlcgorIyAgCisjIEBAIC0xNDU0LDggKzE0MTgsOSBAQAorIyAgCisjICBEcml2ZXI6IG10NzYw
MXUgLSBNZWRpYVRlayBNVDc2MDFVIFdpcmVsZXNzIE1BQ3MKKyMgIAorIyAtRmlsZTogbXQ3NjAx
dS5iaW4KKyMgK0ZpbGU6IG1lZGlhdGVrL210NzYwMXUuYmluCisjICBWZXJzaW9uOiAzNAorIyAr
TGluazogbXQ3NjAxdS5iaW4gLT4gbWVkaWF0ZWsvbXQ3NjAxdS5iaW4KKyMgIAorIyAgTGljZW5j
ZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5yYWxpbmtfYV9tZWRpYXRla19jb21wYW55
X2Zpcm13YXJlIGZvciBkZXRhaWxzCisjICAKKyMgQEAgLTM0MTksNyArMzM4NCw3IEBACisjICBG
aWxlOiBhdGgxMWsvSVBRNjAxOC9odzEuMC9xNl9mdy5iMDgKKyMgIEZpbGU6IGF0aDExay9JUFE2
MDE4L2h3MS4wL3E2X2Z3LmZsaXN0CisjICBGaWxlOiBhdGgxMWsvSVBRNjAxOC9odzEuMC9xNl9m
dy5tZHQKKyMgLVZlcnNpb246IFdMQU4uSEsuMi41LjAuMS0wMTIwOC1RQ0FIS1NXUExfU0lMSUNP
TlotMQorIyArVmVyc2lvbjogV0xBTi5ISy4yLjcuMC4xLTAxNzQ0LVFDQUhLU1dQTF9TSUxJQ09O
Wi0xCisjICBGaWxlOiBhdGgxMWsvSVBRNjAxOC9odzEuMC9Ob3RpY2UudHh0CisjICBGaWxlOiBh
dGgxMWsvSVBRODA3NC9odzIuMC9ib2FyZC0yLmJpbgorIyAgRmlsZTogYXRoMTFrL0lQUTgwNzQv
aHcyLjAvbTNfZncuYjAwCisjIEBAIC0zNDM3LDcgKzM0MDIsNyBAQAorIyAgRmlsZTogYXRoMTFr
L0lQUTgwNzQvaHcyLjAvcTZfZncuYjA4CisjICBGaWxlOiBhdGgxMWsvSVBRODA3NC9odzIuMC9x
Nl9mdy5mbGlzdAorIyAgRmlsZTogYXRoMTFrL0lQUTgwNzQvaHcyLjAvcTZfZncubWR0CisjIC1W
ZXJzaW9uOiBXTEFOLkhLLjIuNS4wLjEtMDEyMDgtUUNBSEtTV1BMX1NJTElDT05aLTEKKyMgK1Zl
cnNpb246IFdMQU4uSEsuMi43LjAuMS0wMTc0NC1RQ0FIS1NXUExfU0lMSUNPTlotMQorIyAgRmls
ZTogYXRoMTFrL0lQUTgwNzQvaHcyLjAvTm90aWNlLnR4dAorIyAgRmlsZTogYXRoMTFrL1FDQTYz
OTAvaHcyLjAvYm9hcmQtMi5iaW4KKyMgIEZpbGU6IGF0aDExay9RQ0E2MzkwL2h3Mi4wL2Ftc3Mu
YmluCisjIEBAIC0zNDU3LDcgKzM0MjIsNyBAQAorIyAgRmlsZTogYXRoMTFrL1FDTjkwNzQvaHcx
LjAvYm9hcmQtMi5iaW4KKyMgIEZpbGU6IGF0aDExay9RQ045MDc0L2h3MS4wL2Ftc3MuYmluCisj
ICBGaWxlOiBhdGgxMWsvUUNOOTA3NC9odzEuMC9tMy5iaW4KKyMgLVZlcnNpb246IFdMQU4uSEsu
Mi41LjAuMS0wMTIwOC1RQ0FIS1NXUExfU0lMSUNPTlotMQorIyArVmVyc2lvbjogV0xBTi5ISy4y
LjcuMC4xLTAxNzQ0LVFDQUhLU1dQTF9TSUxJQ09OWi0xCisjICBGaWxlOiBhdGgxMWsvUUNOOTA3
NC9odzEuMC9Ob3RpY2UudHh0CisjICBGaWxlOiBhdGgxMWsvV0NONjc1MC9odzEuMC9ib2FyZC0y
LmJpbgorIyAgRmlsZTogYXRoMTFrL1dDTjY3NTAvaHcxLjAvd3Bzcy5iMDAKKyMgQEAgLTM0NzAs
NyArMzQzNSw3IEBACisjICBGaWxlOiBhdGgxMWsvV0NONjc1MC9odzEuMC93cHNzLmIwNworIyAg
RmlsZTogYXRoMTFrL1dDTjY3NTAvaHcxLjAvd3Bzcy5iMDgKKyMgIEZpbGU6IGF0aDExay9XQ042
NzUwL2h3MS4wL3dwc3MubWR0CisjIC1WZXJzaW9uOiBXTEFOLk1TTC4xLjAuMS0wMDg4Ny1RQ0FN
U0xTV1BMWi0xCisjICtWZXJzaW9uOiBXTEFOLk1TTC4xLjAuMS0wMTE2MC1RQ0FNU0xTV1BMWi0x
CisjICBGaWxlOiBhdGgxMWsvV0NONjc1MC9odzEuMC9Ob3RpY2UudHh0CisjICBGaWxlOiBhdGgx
MWsvSVBRNTAxOC9odzEuMC9ib2FyZC0yLmJpbgorIyAgRmlsZTogYXRoMTFrL0lQUTUwMTgvaHcx
LjAvbTNfZncuYjAwCisjIEBAIC0zNjk0LDY5ICszNjU5LDY5IEBACisjICBGaWxlOiBpbnRlbC9p
YnQtMTgtMS5kZGMKKyMgIFZlcnNpb246IEJUX1RodW5kZXJQZWFrX0EwX0IwX1JFTDAyMDEKKyMg
IEZpbGU6aW50ZWwvaWJ0LTIwLTAtMy5zZmkKKyMgLVZlcnNpb246IEJUX0N5Y2xvbmVQZWFrX0Ew
X1JFTDUzMjYzCisjICtWZXJzaW9uOiBCVF9DeWNsb25lUGVha19BMF9SRUw1MzM5MgorIyAgRmls
ZTppbnRlbC9pYnQtMjAtMC0zLmRkYworIyAtVmVyc2lvbjogQlRfQ3ljbG9uZVBlYWtfQTBfUkVM
NTMyNjMKKyMgK1ZlcnNpb246IEJUX0N5Y2xvbmVQZWFrX0EwX1JFTDUzMzkyCisjICBGaWxlOmlu
dGVsL2lidC0yMC0xLTMuc2ZpCisjIC1WZXJzaW9uOiBCVF9DeWNsb25lUGVha19BMF9SRUw1MzI2
MworIyArVmVyc2lvbjogQlRfQ3ljbG9uZVBlYWtfQTBfUkVMNTMzOTIKKyMgIEZpbGU6aW50ZWwv
aWJ0LTIwLTEtMy5kZGMKKyMgLVZlcnNpb246IEJUX0N5Y2xvbmVQZWFrX0EwX1JFTDUzMjYzCisj
ICtWZXJzaW9uOiBCVF9DeWNsb25lUGVha19BMF9SRUw1MzM5MgorIyAgRmlsZTppbnRlbC9pYnQt
MjAtMS00LnNmaQorIyAtVmVyc2lvbjogQlRfQ3ljbG9uZVBlYWtfQTBfUkVMNTMyNjMKKyMgK1Zl
cnNpb246IEJUX0N5Y2xvbmVQZWFrX0EwX1JFTDUzMzkyCisjICBGaWxlOmludGVsL2lidC0yMC0x
LTQuZGRjCisjIC1WZXJzaW9uOiBCVF9DeWNsb25lUGVha19BMF9SRUw1MzI2MworIyArVmVyc2lv
bjogQlRfQ3ljbG9uZVBlYWtfQTBfUkVMNTMzOTIKKyMgIEZpbGU6aW50ZWwvaWJ0LTE5LTAtMC5z
ZmkKKyMgLVZlcnNpb246IEJUX1F1YXNhcl9SRUw1MzI2MworIyArVmVyc2lvbjogQlRfUXVhc2Fy
X1JFTDUzMzkyCisjICBGaWxlOmludGVsL2lidC0xOS0wLTAuZGRjCisjIC1WZXJzaW9uOiBCVF9R
dWFzYXJfUkVMNTMyNjMKKyMgK1ZlcnNpb246IEJUX1F1YXNhcl9SRUw1MzM5MgorIyAgRmlsZTpp
bnRlbC9pYnQtMTktMC0xLnNmaQorIyAtVmVyc2lvbjogQlRfUXVhc2FyX1JFTDUzMjYzCisjICtW
ZXJzaW9uOiBCVF9RdWFzYXJfUkVMNTMzOTIKKyMgIEZpbGU6aW50ZWwvaWJ0LTE5LTAtMS5kZGMK
KyMgLVZlcnNpb246IEJUX1F1YXNhcl9SRUw1MzI2MworIyArVmVyc2lvbjogQlRfUXVhc2FyX1JF
TDUzMzkyCisjICBGaWxlOmludGVsL2lidC0xOS0wLTMuc2ZpCisjICBWZXJzaW9uOiBCVF9RdWFz
YXJfUkVMNTMyNjMKKyMgIEZpbGU6aW50ZWwvaWJ0LTE5LTAtMy5kZGMKKyMgIFZlcnNpb246IEJU
X1F1YXNhcl9SRUw1MzI2MworIyAgRmlsZTppbnRlbC9pYnQtMTktMC00LnNmaQorIyAtVmVyc2lv
bjogQlRfSGFycmlzb25QZWFrX1JFTDUzMjYzCisjICtWZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtf
UkVMNTMzOTIKKyMgIEZpbGU6aW50ZWwvaWJ0LTE5LTAtNC5kZGMKKyMgLVZlcnNpb246IEJUX0hh
cnJpc29uUGVha19SRUw1MzI2MworIyArVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDUzMzky
CisjICBGaWxlOmludGVsL2lidC0xOS0xNi00LnNmaQorIyAtVmVyc2lvbjogQlRfSGFycmlzb25Q
ZWFrX1JFTDUzMjYzCisjICtWZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMNTMzOTIKKyMgIEZp
bGU6aW50ZWwvaWJ0LTE5LTE2LTQuZGRjCisjIC1WZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVM
NTMyNjMKKyMgK1ZlcnNpb246IEJUX0hhcnJpc29uUGVha19SRUw1MzM5MgorIyAgRmlsZTppbnRl
bC9pYnQtMTktMzItMS5zZmkKKyMgLVZlcnNpb246IEJUX0hhcnJpc29uUGVha19SRUw1MzI2Mwor
IyArVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDUzMzkyCisjICBGaWxlOmludGVsL2lidC0x
OS0zMi0xLmRkYworIyAtVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDUzMjYzCisjICtWZXJz
aW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMNTMzOTIKKyMgIEZpbGU6aW50ZWwvaWJ0LTE5LTMyLTAu
c2ZpCisjIC1WZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMNTMyNjMKKyMgK1ZlcnNpb246IEJU
X0hhcnJpc29uUGVha19SRUw1MzM5MgorIyAgRmlsZTppbnRlbC9pYnQtMTktMzItMC5kZGMKKyMg
LVZlcnNpb246IEJUX0hhcnJpc29uUGVha19SRUw1MzI2MworIyArVmVyc2lvbjogQlRfSGFycmlz
b25QZWFrX1JFTDUzMzkyCisjICBGaWxlOmludGVsL2lidC0xOS0zMi00LnNmaQorIyAtVmVyc2lv
bjogQlRfSGFycmlzb25QZWFrX1JFTDUzMjYzCisjICtWZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtf
UkVMNTMzOTIKKyMgIEZpbGU6aW50ZWwvaWJ0LTE5LTMyLTQuZGRjCisjIC1WZXJzaW9uOiBCVF9I
YXJyaXNvblBlYWtfUkVMNTMyNjMKKyMgK1ZlcnNpb246IEJUX0hhcnJpc29uUGVha19SRUw1MzM5
MgorIyAgRmlsZTppbnRlbC9pYnQtMTktMjQwLTEuc2ZpCisjIC1WZXJzaW9uOiBCVF9IYXJyaXNv
blBlYWtfUkVMNTMyNjMKKyMgK1ZlcnNpb246IEJUX0hhcnJpc29uUGVha19SRUw1MzM5MgorIyAg
RmlsZTppbnRlbC9pYnQtMTktMjQwLTEuZGRjCisjIC1WZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtf
UkVMNTMyNjMKKyMgK1ZlcnNpb246IEJUX0hhcnJpc29uUGVha19SRUw1MzM5MgorIyAgRmlsZTpp
bnRlbC9pYnQtMTktMjQwLTQuc2ZpCisjIC1WZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMNTMy
NjMKKyMgK1ZlcnNpb246IEJUX0hhcnJpc29uUGVha19SRUw1MzM5MgorIyAgRmlsZTppbnRlbC9p
YnQtMTktMjQwLTQuZGRjCisjIC1WZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMNTMyNjMKKyMg
K1ZlcnNpb246IEJUX0hhcnJpc29uUGVha19SRUw1MzM5MgorIyAgRmlsZTppbnRlbC9pYnQtMDA0
MS0wMDQxLnNmaQorIyAtVmVyc2lvbjogQlRfVHlwaG9vblBlYWtfUkVMNTk1NjQKKyMgK1ZlcnNp
b246IEJUX1R5cGhvb25QZWFrX1JFTDYyNTYyCisjICBGaWxlOmludGVsL2lidC0wMDQxLTAwNDEu
ZGRjCisjIC1WZXJzaW9uOiBCVF9UeXBob29uUGVha19SRUw1OTU2NAorIyArVmVyc2lvbjogQlRf
VHlwaG9vblBlYWtfUkVMNjI1NjIKKyMgIEZpbGU6aW50ZWwvaWJ0LTAwNDAtMDA0MS5zZmkKKyMg
LVZlcnNpb246IEJUX1NvbGFyX0dmUDJfUkVMNTk1NjQKKyMgK1ZlcnNpb246IEJUX1NvbGFyX0dm
UDJfUkVMNjI1NjIKKyMgIEZpbGU6aW50ZWwvaWJ0LTAwNDAtMDA0MS5kZGMKKyMgLVZlcnNpb246
IEJUX1NvbGFyX0dmUDJfUkVMNTk1NjQKKyMgK1ZlcnNpb246IEJUX1NvbGFyX0dmUDJfUkVMNjI1
NjIKKyMgIEZpbGU6aW50ZWwvaWJ0LTEwNDAtMDA0MS5zZmkKKyMgLVZlcnNpb246IEJUX1NvbGFy
Rl9HZlAyX1JFTDU5NTY0CisjICtWZXJzaW9uOiBCVF9Tb2xhckZfR2ZQMl9SRUw2MjU2MgorIyAg
RmlsZTppbnRlbC9pYnQtMTA0MC0wMDQxLmRkYworIyAtVmVyc2lvbjogQlRfU29sYXJGX0dmUDJf
UkVMNTk1NjQKKyMgK1ZlcnNpb246IEJUX1NvbGFyRl9HZlAyX1JFTDYyNTYyCisjICAKKyMgIEZp
bGU6aW50ZWwvaWJ0LTAwNDAtMTAyMC5zZmkKKyMgIFZlcnNpb246IEJUX1NvbGFyX0pmUDFfUkVM
NTk1NjQKKyMgQEAgLTM3NzcsMTMgKzM3NDIsMTMgQEAKKyMgIFZlcnNpb246IEJUX1NvbGFyRl9K
ZlAyX1JFTDU5NTY0CisjICAKKyMgIEZpbGU6aW50ZWwvaWJ0LTAwNDAtNDE1MC5zZmkKKyMgLVZl
cnNpb246IEJUX1NvbGFyX0puUDJfUkVMNTk1NjQKKyMgK1ZlcnNpb246IEJUX1NvbGFyX0puUDJf
UkVMNjI1NjIKKyMgIEZpbGU6aW50ZWwvaWJ0LTAwNDAtNDE1MC5kZGMKKyMgLVZlcnNpb246IEJU
X1NvbGFyX0puUDJfUkVMNTk1NjQKKyMgK1ZlcnNpb246IEJUX1NvbGFyX0puUDJfUkVMNjI1NjIK
KyMgIEZpbGU6aW50ZWwvaWJ0LTEwNDAtNDE1MC5zZmkKKyMgLVZlcnNpb246IEJUX1NvbGFyRl9K
blAyX1JFTDU5NTY0CisjICtWZXJzaW9uOiBCVF9Tb2xhckZfSm5QMl9SRUw2MjU2MgorIyAgRmls
ZTppbnRlbC9pYnQtMTA0MC00MTUwLmRkYworIyAtVmVyc2lvbjogQlRfU29sYXJGX0puUDJfUkVM
NTk1NjQKKyMgK1ZlcnNpb246IEJUX1NvbGFyRl9KblAyX1JFTDYyNTYyCisjICAKKyMgIExpY2Vu
Y2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UuaWJ0X2Zpcm13YXJlIGZvciBkZXRhaWxz
CisjICAKKyMgQEAgLTM4MjAsNiArMzc4NSw4IEBACisjICBGaWxlOiBydGxfYnQvcnRsODg1MmJ1
X2NvbmZpZy5iaW4KKyMgIEZpbGU6IHJ0bF9idC9ydGw4ODUyY3VfZncuYmluCisjICBGaWxlOiBy
dGxfYnQvcnRsODg1MmN1X2NvbmZpZy5iaW4KKyMgK0ZpbGU6IHJ0bF9idC9ydGw4ODUxYnVfZncu
YmluCisjICtGaWxlOiBydGxfYnQvcnRsODg1MWJ1X2NvbmZpZy5iaW4KKyMgIAorIyAgTGljZW5j
ZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5ydGx3aWZpX2Zpcm13YXJlLnR4dCBmb3Ig
ZGV0YWlscy4KKyMgIAorIyBAQCAtMzgyNywyMyArMzc5NCwxNyBAQAorIyAgRnJvbSBodHRwczov
L2dpdGh1Yi5jb20vdHJveS10YW4vZHJpdmVyX3N0b3JlCisjICBGaWxlcyBydGxfYnQvcnRsODgy
MmJfKiBjYW1lIGRpcmVjdGx5IGZyb20gUmVhbHRlay4gVGhlc2UgZmlsZXMgYXJlCisjICB1cGRh
dGVkIG9uIEFwcmlsIDE0LCAyMDE3LgorIyAtRmlsZXMgcnRsX2J0L3J0bDg4MjFjXyogYW5kIHJ0
bF9idC9ydGw4NzIzZF8qIGNhbWUgZGlyZWN0bHkgZnJvbSBSZWFsdGVrLgorIyAtRmlsZSBydGxf
YnQvcnRsODgyMmN1X2Z3LmJpbiBjYW1lIGRpcmVjdGx5IGZyb20gUmVhbHRlay4KKyMgLXVwZGF0
ZWQgb24gRmVicnVhcnkgMjQsIDIwMTkKKyMgLUZpbGUgcnRsX2J0L3J0bDg4MjJjdV9mdy5iaW4g
Y2FtZSBkaXJlY3RseSBmcm9tIFJlYWx0ZWsuCisjIC11cGRhdGVkIG9uIE9jdG9iZXIgMjMsIDIw
MTkKKyMgLUZpbGUgcnRsX2J0L3J0bDg4MjJjdV9jb25maWcuYmluIGNhbWUgZGlyZWN0bHkgZnJv
bSBSZWFsdGVrLgorIyAgCisjICBGb3VuZCBpbiB2ZW5kb3IgZHJpdmVyLCAyMDIwMDgwNl9MSU5V
WF9CVF9EUklWRVJfUlRMODc2MUJfQ09FWF92MDIwMi56aXAKKyMgLUZpbGUgcnRsX2J0L3J0bDg3
NjFiX2Z3LmJpbgorIyAgRmlsZSBydGxfYnQvcnRsODc2MWJfY29uZmlnLmJpbgorIyAtRmlsZSBy
dGxfYnQvcnRsODc2MWJ1X2Z3LmJpbgorIyAgRmlsZSBydGxfYnQvcnRsODc2MWJ1X2NvbmZpZy5i
aW4KKyMgKworIyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgIAorIyAgRHJpdmVyOiBidG10a191c2Ig
LSBCbHVldG9vdGggVVNCIGRyaXZlcgorIyAgCisjIC1GaWxlOiBtdDc2NTAuYmluCisjICtGaWxl
OiBtZWRpYXRlay9tdDc2NTAuYmluCisjICtMaW5rOiBtdDc2NTAuYmluIC0+IG1lZGlhdGVrL210
NzY1MC5iaW4KKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5y
YWxpbmtfYV9tZWRpYXRla19jb21wYW55X2Zpcm13YXJlIGZvciBkZXRhaWxzCisjICAKKyMgQEAg
LTM5MTcsNyArMzg3OCw3IEBACisjICBGaWxlOiBhbWQtdWNvZGUvbWljcm9jb2RlX2FtZF9mYW0x
NmguYmluCisjICBWZXJzaW9uOiAyMDE0LTEwLTI4CisjICBGaWxlOiBhbWQtdWNvZGUvbWljcm9j
b2RlX2FtZF9mYW0xN2guYmluCisjIC1WZXJzaW9uOiAyMDIyLTA0LTA4CisjICtWZXJzaW9uOiAy
MDIzLTA0LTEzCisjICBGaWxlOiBhbWQtdWNvZGUvbWljcm9jb2RlX2FtZF9mYW0xOWguYmluCisj
ICBWZXJzaW9uOiAyMDIzLTAxLTMxCisjICBGaWxlOiBhbWQtdWNvZGUvUkVBRE1FCisjIEBAIC00
MzEzLDYgKzQyNzQsOCBAQAorIyAgRmlsZTogcWNhL21zYnRmdzExLm1ibgorIyAgRmlsZTogcWNh
L21zYnRmdzExLnRsdgorIyAgRmlsZTogcWNhL21zbnYxMS5iaW4KKyMgK0ZpbGU6IHFjYS9tc252
MTEuYjBhCisjICtGaWxlOiBxY2EvbXNudjExLmIwOQorIyAgCisjICBMaWNlbmNlOiBSZWRpc3Ry
aWJ1dGFibGUuIFNlZSBMSUNFTlNFLlF1YWxjb21tQXRoZXJvc19hdGgxMGsgYW5kIHFjYS9OT1RJ
Q0UudHh0IGZvciBkZXRhaWxzCisjICAKKyMgQEAgLTQ3MTYsNiArNDY3OSw5IEBACisjICAKKyMg
IEZpbGU6IGk5MTUvbXRsX2RtYy5iaW4KKyMgIFZlcnNpb246IERNQyBBUEkvQVBCIHZlciAyIHJl
bGVhc2UgMTIgZm9yIE1ldGVvcmxha2UKKyMgKworIyArRmlsZTogaTkxNS9tdGxfZ3VjXzcwLmJp
bgorIyArVmVyc2lvbjogR3VDIEFQSS9BUEIgdmVyIDcwLjYuNiBmb3IgTWV0ZW9ybGFrZQorIyAg
CisjICBMaWNlbnNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLmk5MTUgZm9yIGRldGFp
bHMKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjIEBAIC01MjE4LDggKzUxODQsOSBAQAorIyAgVmVy
c2lvbjogMjAxODA2MjEyMDQ5MDQKKyMgIEZpbGU6IG1lZGlhdGVrL210NzY2OHByMmguYmluCisj
ICBWZXJzaW9uOiAyMDE4MDUxNzE4MTgzNAorIyAtRmlsZTogbWVkaWF0ZWsvbXQ3NjYzcHIyaC5i
aW4KKyMgLVZlcnNpb246IDc2NjNlMmNjbjA0LTIwMDYwMzAyNDcKKyMgKyMgTm90ZTogZXhwbGlj
aXRseSBjb21tZW50ZWQgb3V0LCBzaW5jZSBpdCdzIGR1cGxpY2F0ZWQgZnVydGhlciBkb3duCisj
ICsjIEZpbGU6IG1lZGlhdGVrL210NzY2M3ByMmguYmluCisjICsjIFZlcnNpb246IDc2NjNlMmNj
bjA0LTIwMDYwMzAyNDcKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElD
RU5DRS5tZWRpYXRlayBmb3IgZGV0YWlscy4KKyMgIAorIyBAQCAtNTI0OCwxMSArNTIxNSwxMyBA
QAorIyAgCisjICBEcml2ZXI6IG10NzZ4MmUgLSBNZWRpYVRlayBNVDc2eDIgV2lyZWxlc3MgTUFD
cworIyAgCisjIC1GaWxlOiBtdDc2NjIuYmluCisjICtGaWxlOiBtZWRpYXRlay9tdDc2NjIuYmlu
CisjICBWZXJzaW9uOiAxLjkKKyMgLQorIyAtRmlsZTogbXQ3NjYyX3JvbV9wYXRjaC5iaW4KKyMg
K0xpbms6IG10NzY2Mi5iaW4gLT4gbWVkaWF0ZWsvbXQ3NjYyLmJpbgorIyArCisjICtGaWxlOiBt
ZWRpYXRlay9tdDc2NjJfcm9tX3BhdGNoLmJpbgorIyAgVmVyc2lvbjogMC4wLjJfUDY5CisjICtM
aW5rOiBtdDc2NjJfcm9tX3BhdGNoLmJpbiAtPiBtZWRpYXRlay9tdDc2NjJfcm9tX3BhdGNoLmJp
bgorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLnJhbGlua19h
X21lZGlhdGVrX2NvbXBhbnlfZmlybXdhcmUgZm9yIGRldGFpbHMKKyMgIAorIyBAQCAtNTMxMCw3
ICs1Mjc5LDcgQEAKKyMgIAorIyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgIAorIyAtRHJpdmVyOiBt
dDc5MTVlIC0gTWVkaWFUZWsgV2lyZWxlc3MgTUFDcyBmb3IgTVQ3OTE1L01UNzkxNi9NVDc5ODYK
KyMgK0RyaXZlcjogbXQ3OTE1ZSAtIE1lZGlhVGVrIFdpcmVsZXNzIE1BQ3MgZm9yIE1UNzkxNS9N
VDc5MTYvTVQ3OTg2L01UNzk4MQorIyAgCisjICBGaWxlOiBtZWRpYXRlay9tdDc5MTVfd20uYmlu
CisjICBWZXJzaW9uOiAyMDIyMDkyOTEwNDE0NQorIyBAQCAtNTMyNCwxMSArNTI5MywxMSBAQAor
IyAgVmVyc2lvbjogMjAyMDA4MjEKKyMgIAorIyAgRmlsZTogbWVkaWF0ZWsvbXQ3OTE2X3dtLmJp
bgorIyAtVmVyc2lvbjogMjAyMjEwMzExNTQ3MTMKKyMgK1ZlcnNpb246IDIwMjMwMjAyMTQ1MDA1
CisjICBGaWxlOiBtZWRpYXRlay9tdDc5MTZfd2EuYmluCisjIC1WZXJzaW9uOiAyMDIyMTAzMTE1
NDc1NworIyArVmVyc2lvbjogMjAyMzAyMDIxNDMzMzIKKyMgIEZpbGU6IG1lZGlhdGVrL210Nzkx
Nl9yb21fcGF0Y2guYmluCisjIC1WZXJzaW9uOiAyMDIyMTAzMTE1NDY1MmEKKyMgK1ZlcnNpb246
IDIwMjMwMjAyMTQ0OTE1YQorIyAgRmlsZTogbWVkaWF0ZWsvbXQ3OTE2X2VlcHJvbS5iaW4KKyMg
IFZlcnNpb246IDIwMjExMTMwCisjICAKKyMgQEAgLTUzNTUsNiArNTMyNCwxNSBAQAorIyAgRmls
ZTogbWVkaWF0ZWsvbXQ3OTg2X2VlcHJvbV9tdDc5NzVfZHVhbC5iaW4KKyMgIFZlcnNpb246IDIw
MjIwMjA4CisjICAKKyMgK0ZpbGU6IG1lZGlhdGVrL210Nzk4MV93bS5iaW4KKyMgK1ZlcnNpb246
IDIwMjIxMjA4MjAxODA2CisjICtGaWxlOiBtZWRpYXRlay9tdDc5ODFfd2EuYmluCisjICtWZXJz
aW9uOiAyMDIyMTIwODIwMjA0OAorIyArRmlsZTogbWVkaWF0ZWsvbXQ3OTgxX3JvbV9wYXRjaC5i
aW4KKyMgK1ZlcnNpb246IDIwMjIxMjA4MjAxNzQ1YQorIyArRmlsZTogbWVkaWF0ZWsvbXQ3OTgx
X3dvLmJpbgorIyArVmVyc2lvbjogMjAyMjEyMDgyMDIxMzgKKyMgKworIyAgTGljZW5jZTogUmVk
aXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5tZWRpYXRlayBmb3IgZGV0YWlscy4KKyMgIAorIyAg
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KKyMgQEAgLTUzNjIsOSArNTM0MCw5IEBACisjICBEcml2ZXI6IG10
NzkyMSAtIE1lZGlhVGVrIE1UNzkyMSBXaXJlbGVzcyBNQUNzCisjICAKKyMgIEZpbGU6IG1lZGlh
dGVrL1dJRklfTVQ3OTYxX3BhdGNoX21jdV8xXzJfaGRyLmJpbgorIyAtVmVyc2lvbjogMjAyMzAz
MDIxNTA5MTZhCisjICtWZXJzaW9uOiAyMDIzMDMzMTExMDkwMmEKKyMgIEZpbGU6IG1lZGlhdGVr
L1dJRklfUkFNX0NPREVfTVQ3OTYxXzEuYmluCisjIC1WZXJzaW9uOiAyMDIzMDMwMjE1MDk1Ngor
IyArVmVyc2lvbjogMjAyMzAzMzExMTA5MzkKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRh
YmxlLiBTZWUgTElDRU5DRS5tZWRpYXRlayBmb3IgZGV0YWlscy4KKyMgIAorIyBAQCAtNTM3Myw3
ICs1MzUxLDcgQEAKKyMgIERyaXZlcjogbXQ3OTIxIC0gTWVkaWFUZWsgTVQ3OTIxIGJsdWV0b290
aCBjaGlwc2V0CisjICAKKyMgIEZpbGU6IG1lZGlhdGVrL0JUX1JBTV9DT0RFX01UNzk2MV8xXzJf
aGRyLmJpbgorIyAtVmVyc2lvbjogMjAyMzAzMDIxNTEzNTUKKyMgK1ZlcnNpb246IDIwMjMwMzMx
MTExMTU2CisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UubWVk
aWF0ZWsgZm9yIGRldGFpbHMuCisjICAKKyMgQEAgLTUzODIsOSArNTM2MCw5IEBACisjICBEcml2
ZXI6IG10NzkyMiAtIE1lZGlhVGVrIE1UNzkyMiBXaXJlbGVzcyBNQUNzCisjICAKKyMgIEZpbGU6
IG1lZGlhdGVrL1dJRklfTVQ3OTIyX3BhdGNoX21jdV8xXzFfaGRyLmJpbgorIyAtVmVyc2lvbjog
MjAyMzAzMjgxNDMyMjlhCisjICtWZXJzaW9uOiAyMDIzMDUwOTIwMzYxMmEKKyMgIEZpbGU6IG1l
ZGlhdGVrL1dJRklfUkFNX0NPREVfTVQ3OTIyXzEuYmluCisjIC1WZXJzaW9uOiAyMDIzMDMyODE0
MzMxMworIyArVmVyc2lvbjogMjAyMzA1MDkyMDM2NTUKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0
cmlidXRhYmxlLiBTZWUgTElDRU5DRS5tZWRpYXRlayBmb3IgZGV0YWlscy4KKyMgIAorIyBAQCAt
NTM5Myw3ICs1MzcxLDcgQEAKKyMgIERyaXZlcjogbXQ3OTIyIC0gTWVkaWFUZWsgTVQ3OTIyIGJs
dWV0b290aCBjaGlwc2V0CisjICAKKyMgIEZpbGU6IG1lZGlhdGVrL0JUX1JBTV9DT0RFX01UNzky
Ml8xXzFfaGRyLmJpbgorIyAtVmVyc2lvbjogMjAyMzAzMjgxNDM0NDQKKyMgK1ZlcnNpb246IDIw
MjMwNTA5MjAzODM4CisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VO
Q0UubWVkaWF0ZWsgZm9yIGRldGFpbHMuCisjICAKKyMgQEAgLTYwOTUsNiArNjA3MywxMTAgQEAK
KyMgIEZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzFlMTItc3BraWQwLXIw
LmJpbgorIyAgRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMWUxMi1zcGtp
ZDEtbDAuYmluCisjICBGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMxZTEy
LXNwa2lkMS1yMC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTdh
YTIzMTYud21mdyAtPiBjczM1bDQxL3Y2LjYxLjEvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS42My4x
LndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTdhYTIzMTYud21m
dyAtPiBjczM1bDQxL3Y2LjYxLjEvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS42My4xLndtZncKKyMg
K0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTdhYTIzMTcud21mdyAtPiBjczM1
bDQxL3Y2LjYxLjEvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS42My4xLndtZncKKyMgK0xpbms6IGNp
cnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTdhYTIzMTcud21mdyAtPiBjczM1bDQxL3Y2LjYx
LjEvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS42My4xLndtZncKKyMgK0ZpbGU6IGNpcnJ1cy9jczM1
bDQxLWRzcDEtc3BrLXByb3QtMTdhYTIzMTYtc3BraWQwLWwwLmJpbgorIyArRmlsZTogY2lycnVz
L2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xN2FhMjMxNi1zcGtpZDAtcjAuYmluCisjICtGaWxlOiBj
aXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTE3YWEyMzE2LXNwa2lkMS1sMC5iaW4KKyMgK0Zp
bGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTdhYTIzMTYtc3BraWQxLXIwLmJpbgor
IyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xN2FhMjMxNi1zcGtpZDAtbDAu
YmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTE3YWEyMzE2LXNwa2lk
MC1yMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTdhYTIzMTYt
c3BraWQxLWwwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xN2Fh
MjMxNi1zcGtpZDEtcjAuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90
LTE3YWEyMzE3LXNwa2lkMC1sMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1wcm90LTE3YWEyMzE2
LXNwa2lkMC1sMC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTdh
YTIzMTctc3BraWQwLXIwLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLXByb3QtMTdhYTIzMTYtc3Br
aWQwLXIwLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xN2FhMjMx
Ny1zcGtpZDEtbDAuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstcHJvdC0xN2FhMjMxNi1zcGtpZDEt
bDAuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTE3YWEyMzE3LXNw
a2lkMS1yMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1wcm90LTE3YWEyMzE2LXNwa2lkMS1yMC5i
aW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTdhYTIzMTctc3BraWQw
LWwwLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLWNhbGktMTdhYTIzMTYtc3BraWQwLWwwLmJpbgor
IyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xN2FhMjMxNy1zcGtpZDAtcjAu
YmluIC0+IGNzMzVsNDEtZHNwMS1zcGstY2FsaS0xN2FhMjMxNi1zcGtpZDAtcjAuYmluCisjICtM
aW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTE3YWEyMzE3LXNwa2lkMS1sMC5iaW4g
LT4gY3MzNWw0MS1kc3AxLXNway1jYWxpLTE3YWEyMzE2LXNwa2lkMS1sMC5iaW4KKyMgK0xpbms6
IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTdhYTIzMTctc3BraWQxLXIwLmJpbiAtPiBj
czM1bDQxLWRzcDEtc3BrLWNhbGktMTdhYTIzMTYtc3BraWQxLXIwLmJpbgorIyArTGluazogY2ly
cnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xN2FhMjMxOC53bWZ3IC0+IGNzMzVsNDEvdjYuNjEu
MS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjYzLjEud21mdworIyArTGluazogY2lycnVzL2NzMzVs
NDEtZHNwMS1zcGstY2FsaS0xN2FhMjMxOC53bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2Nz
cGxfUkFNX3JldkIyXzI5LjYzLjEud21mdworIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1z
cGstcHJvdC0xN2FhMjMxOS53bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFNX3Jl
dkIyXzI5LjYzLjEud21mdworIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0x
N2FhMjMxOS53bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjYz
LjEud21mdworIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xN2FhMjMxYS53
bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjYzLjEud21mdwor
IyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xN2FhMjMxYS53bWZ3IC0+IGNz
MzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjYzLjEud21mdworIyArTGluazog
Y2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xN2FhMjMxOC1sMC5iaW4gLT4gY3MzNWw0MS1k
c3AxLXNway1wcm90LTE3YWEyMmYxLWwwLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNw
MS1zcGstcHJvdC0xN2FhMjMxOC1yMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1wcm90LTE3YWEy
MmYxLXIwLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xN2FhMjMx
OC1sMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1jYWxpLTE3YWEyMmYxLWwwLmJpbgorIyArTGlu
azogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xN2FhMjMxOC1yMC5iaW4gLT4gY3MzNWw0
MS1kc3AxLXNway1jYWxpLTE3YWEyMmYxLXIwLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEt
ZHNwMS1zcGstcHJvdC0xN2FhMjMxOS1sMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1wcm90LTE3
YWEyMmYyLWwwLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xN2Fh
MjMxOS1yMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1wcm90LTE3YWEyMmYyLXIwLmJpbgorIyAr
TGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xN2FhMjMxOS1sMC5iaW4gLT4gY3Mz
NWw0MS1kc3AxLXNway1jYWxpLTE3YWEyMmYyLWwwLmJpbgorIyArTGluazogY2lycnVzL2NzMzVs
NDEtZHNwMS1zcGstY2FsaS0xN2FhMjMxOS1yMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1jYWxp
LTE3YWEyMmYyLXIwLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0x
N2FhMjMxYS1sMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1wcm90LTE3YWEyMmYyLWwwLmJpbgor
IyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xN2FhMjMxYS1yMC5iaW4gLT4g
Y3MzNWw0MS1kc3AxLXNway1wcm90LTE3YWEyMmYyLXIwLmJpbgorIyArTGluazogY2lycnVzL2Nz
MzVsNDEtZHNwMS1zcGstY2FsaS0xN2FhMjMxYS1sMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1j
YWxpLTE3YWEyMmYyLWwwLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2Fs
aS0xN2FhMjMxYS1yMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1jYWxpLTE3YWEyMmYyLXIwLmJp
bgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGMyNi53bWZ3IC0+
IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjYzLjEud21mdworIyArTGlu
azogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDNjOGMyNi53bWZ3IC0+IGNzMzVsNDEv
djYuNjEuMS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjYzLjEud21mdworIyArTGluazogY2lycnVz
L2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGI0Mi53bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9o
YWxvX2NzcGxfUkFNX3JldkIyXzI5LjYzLjEud21mdworIyArTGluazogY2lycnVzL2NzMzVsNDEt
ZHNwMS1zcGstY2FsaS0xMDNjOGI0Mi53bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxf
UkFNX3JldkIyXzI5LjYzLjEud21mdworIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGst
cHJvdC0xMDNjOGI0My53bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFNX3JldkIy
XzI5LjYzLjEud21mdworIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDNj
OGI0My53bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjYzLjEu
d21mdworIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGI0NC53bWZ3
IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjYzLjEud21mdworIyAr
TGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDNjOGI0NC53bWZ3IC0+IGNzMzVs
NDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjYzLjEud21mdworIyArTGluazogY2ly
cnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGI0NS53bWZ3IC0+IGNzMzVsNDEvdjYuNjEu
MS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjYzLjEud21mdworIyArTGluazogY2lycnVzL2NzMzVs
NDEtZHNwMS1zcGstY2FsaS0xMDNjOGI0NS53bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2Nz
cGxfUkFNX3JldkIyXzI5LjYzLjEud21mdworIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1z
cGstcHJvdC0xMDNjOGI0Ni53bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFNX3Jl
dkIyXzI5LjYzLjEud21mdworIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0x
MDNjOGI0Ni53bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjYz
LjEud21mdworIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGI0Ny53
bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjYzLjEud21mdwor
IyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDNjOGI0Ny53bWZ3IC0+IGNz
MzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjYzLjEud21mdworIyArTGluazog
Y2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGI2My53bWZ3IC0+IGNzMzVsNDEvdjYu
NjEuMS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjYzLjEud21mdworIyArTGluazogY2lycnVzL2Nz
MzVsNDEtZHNwMS1zcGstY2FsaS0xMDNjOGI2My53bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxv
X2NzcGxfUkFNX3JldkIyXzI5LjYzLjEud21mdworIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNw
MS1zcGstcHJvdC0xMDNjOGI3MC53bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFN
X3JldkIyXzI5LjYzLjEud21mdworIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2Fs
aS0xMDNjOGI3MC53bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5
LjYzLjEud21mdworIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGI3
Mi53bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjYzLjEud21m
dworIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDNjOGI3Mi53bWZ3IC0+
IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjYzLjEud21mdworIyArTGlu
azogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGI3NC53bWZ3IC0+IGNzMzVsNDEv
djYuNjEuMS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjYzLjEud21mdworIyArTGluazogY2lycnVz
L2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDNjOGI3NC53bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9o
YWxvX2NzcGxfUkFNX3JldkIyXzI5LjYzLjEud21mdworIyArTGluazogY2lycnVzL2NzMzVsNDEt
ZHNwMS1zcGstcHJvdC0xMDNjOGI3Ny53bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxf
UkFNX3JldkIyXzI5LjYzLjEud21mdworIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGst
Y2FsaS0xMDNjOGI3Ny53bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFNX3JldkIy
XzI5LjYzLjEud21mdworIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNj
OGI4Zi53bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjYzLjEu
d21mdworIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGI5Mi53bWZ3
IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjYzLjEud21mdworIyAr
RmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGI0Mi5iaW4KKyMgK0ZpbGU6
IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTAzYzhiNDIuYmluCisjICtGaWxlOiBjaXJy
dXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4YjQzLmJpbgorIyArRmlsZTogY2lycnVzL2Nz
MzVsNDEtZHNwMS1zcGstY2FsaS0xMDNjOGI0My5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQx
LWRzcDEtc3BrLXByb3QtMTAzYzhiNDQuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3Ax
LXNway1jYWxpLTEwM2M4YjQ0LmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGst
cHJvdC0xMDNjOGI0NS5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGkt
MTAzYzhiNDUuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4
YjQ2LmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhiNDUuYmluCisjICtMaW5rOiBj
aXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwM2M4YjQ2LmJpbiAtPiBjczM1bDQxLWRzcDEt
c3BrLWNhbGktMTAzYzhiNDUuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1w
cm90LTEwM2M4YjQ3LmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0x
MDNjOGI0Ny5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhi
NjMtcjAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwM2M4YjYz
LXIwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGI2My1y
MS5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTAzYzhiNjMtcjEu
YmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4YjYzLWwwLmJp
bgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDNjOGI2My1sMC5iaW4K
KyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhiNjMtbDEuYmluCisj
ICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwM2M4YjYzLWwxLmJpbgorIyAr
TGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGI3MC5iaW4gLT4gY3MzNWw0
MS1kc3AxLXNway1wcm90LTEwM2M4YjQyLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNw
MS1zcGstY2FsaS0xMDNjOGI3MC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwM2M4YjQy
LmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGI3Mi5iaW4g
LT4gY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4YjQ1LmJpbgorIyArTGluazogY2lycnVzL2Nz
MzVsNDEtZHNwMS1zcGstY2FsaS0xMDNjOGI3Mi5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1jYWxp
LTEwM2M4YjQ1LmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNj
OGI3NC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4YjQ3LmJpbgorIyArTGluazog
Y2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDNjOGI3NC5iaW4gLT4gY3MzNWw0MS1kc3Ax
LXNway1jYWxpLTEwM2M4YjQ3LmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGst
cHJvdC0xMDNjOGI3Ny5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4YjQ1LmJpbgor
IyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDNjOGI3Ny5iaW4gLT4gY3Mz
NWw0MS1kc3AxLXNway1jYWxpLTEwM2M4YjQ1LmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEt
ZHNwMS1zcGstcHJvdC0xMDNjOGI4Zi1yMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRz
cDEtc3BrLXByb3QtMTAzYzhiOGYtcjEuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3Ax
LXNway1jYWxpLTEwM2M4YjhmLXIwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1z
cGstY2FsaS0xMDNjOGI4Zi1yMS5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3Br
LXByb3QtMTAzYzhiOGYtbDAuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGI4Zi1y
MC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhiOGYtbDEu
YmluIC0+IGNzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGI4Zi1yMS5iaW4KKyMgK0xpbms6IGNp
cnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTAzYzhiOGYtbDAuYmluIC0+IGNzMzVsNDEtZHNw
MS1zcGstY2FsaS0xMDNjOGI4Zi1yMC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEt
c3BrLWNhbGktMTAzYzhiOGYtbDEuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDNjOGI4
Zi1yMS5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhiOTIu
YmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwM2M4YjkyLmJpbgor
IyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGMyNi5iaW4gLT4gY3Mz
NWw0MS1kc3AxLXNway1wcm90LTEwM2M4YjQ1LmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEt
ZHNwMS1zcGstY2FsaS0xMDNjOGMyNi5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwM2M4
YjQ1LmJpbgorIyAgCisjICBMaWNlbnNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLmNp
cnJ1cyBmb3IgZGV0YWlscy4KKyMgIAorIyAKKyMKKwogU1VNTUFSWSA9ICJGaXJtd2FyZSBmaWxl
cyBmb3IgdXNlIHdpdGggTGludXgga2VybmVsIgogSE9NRVBBR0UgPSAiaHR0cHM6Ly93d3cua2Vy
bmVsLm9yZy8iCiBERVNDUklQVElPTiA9ICJMaW51eCBmaXJtd2FyZSBpcyBhIHBhY2thZ2UgZGlz
dHJpYnV0ZWQgYWxvbmdzaWRlIHRoZSBMaW51eCBrZXJuZWwgXApAQCAtMTMwLDcgKzY2MSw3IEBA
IExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOQ0UuQWJpbGlzO21kNT1iNWVlM2Y0MTA3
ODBlNTY3MTFhZDQ4ZWFkYzIyYjhiYyBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNF
TkNFLnhjNDAwMDttZDU9MGZmNTFkMmRjNDlmY2UwNDgxNGM5MTU1MDgxMDkyZjAgXAogICAgICAg
ICAgICAgICAgICAgICBmaWxlOi8vTElDRU5DRS54YzUwMDA7bWQ1PTFlMTcwYzEzMTc1MzIzYzMy
YzdmNGQwOTk4ZDUzZjY2IFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOQ0UueGM1
MDAwYzttZDU9MTJiMDJlZmEzMDQ5ZGI2NWQ1MjRhZWI0MThkZDg3Y2EgXAotICAgICAgICAgICAg
ICAgICAgICBmaWxlOi8vV0hFTkNFO21kNT0ke1dIRU5DRV9DSEtTVU19IFwKKyAgICAgICAgICAg
ICAgICAgICAgZmlsZTovL1dIRU5DRTttZDU9YTA5OTdmYzdhOWFmNGU0NmQ5NjUyOWQ2ZWYxM2I1
OGEgXAogICAgICAgICAgICAgICAgICAgICAiCiAjIFdIRU5DRSBjaGVja3N1bSBpcyBkZWZpbmVk
IHNlcGFyYXRlbHkgdG8gZWFzZSBvdmVycmlkaW5nIGl0IGlmCiAjIGNsYXNzLWRldnVwc3RyZWFt
IGlzIHNlbGVjdGVkLgpAQCAtMjEyLDcgKzc0Myw3IEBAIFNSQ19VUkk6Y2xhc3MtZGV2dXBzdHJl
YW0gPSAiZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2Zpcm13
CiAjIFBpbiB0aGlzIHRvIHRoZSAyMDIyMDUwOSByZWxlYXNlLCBvdmVycmlkZSB0aGlzIGluIGxv
Y2FsLmNvbmYKIFNSQ1JFVjpjbGFzcy1kZXZ1cHN0cmVhbSA/PSAiYjE5Y2JkY2E3OGFiMmFkZmQy
MTBjOTFiZTE1YTIyNTY4ZThiOGNhZSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImMzZjlhZDJi
YjUzMTFjY2UyNDkwZjM3YTgwNTJmODM2NzAzZDY5MzZhYWJkODQwMjQ2YjY1NzZmMWY3MWY2MDci
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOGIxYWNmYTE2ZjFlZTk0NzMyYTZhY2I1MGQ5ZDZjODM1
Y2Y1M2FmMTEwNjhiZDg5ZWQyMDdiYmUwNGExZTk1MSIKIAogaW5oZXJpdCBhbGxhcmNoCiAKLS0g
CjIuMzkuMgoK

--===============2902533235646686325==--

