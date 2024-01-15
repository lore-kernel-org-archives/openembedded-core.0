Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8D6DC47DD0
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 17:33:58 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.88862.1705340030512087669
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 09:33:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KwkbHKHz;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=IifNEPKn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018d0e2fcf9c-bc6bcc43-0df9-45c7-b08b-941859b93145-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1705340031;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fOu26sLQuwaJgRpEizgghuJZhTCBE8aw/COsdNGDiLs=;
	b=KwkbHKHz/aVzMwSba9Y8e3t8WqRIYqfmwXRcglsCXMjUT2pa/1dX1OAdF9iSsxhE
	iJl+nINvXNdKsROjUPqwwxmcEYUnvGPFcB/+xArZBqKcqun66w8Cl+1/j93tVuSOV5/
	1J5GZG8rF12zTtogicevwbXFz15mVXDh1s2jJBLs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1705340031;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fOu26sLQuwaJgRpEizgghuJZhTCBE8aw/COsdNGDiLs=;
	b=IifNEPKnfG8RBsQuU9WMkliREWqzNwTSMHPJ/zehX92XeMoKW0ws/MARd/wrPl3v
	H9ooYI7Izp1RdxRaAvCyk1Y2fqzazdy6W8ldFUI7pV2GV+iGAp5o0aA7lsi/yZ53B2W
	n+hhomxExCvHGhOGBRte1RVZija24zFN66C3v0FQ=
Content-Type: multipart/mixed; boundary="===============0433085120061299457=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] linux-firmware: upgrading to 20231211 FAILED
Message-ID: <0101018d0e2fcf9c-bc6bcc43-0df9-45c7-b08b-941859b93145-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jan 2024 17:33:50 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193778

--===============0433085120061299457==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *linux-firmware* to *20231211* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-linux-firmware-upgrade-20231030-20231211.patch
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
From 0e6872c47beac70df864894d6d3e5f8518fa6a43 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jan 2024 13:15:17 +0000
Subject: [PATCH] linux-firmware: upgrade 20231030 -> 20231211

---
 ...20231030.bb => linux-firmware_20231211.bb} | 508 +++++++++++++++++-
 1 file changed, 506 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20231030.bb => linux-firmware_20231211.bb} (79%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb
similarity index 79%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb
index b1f5247975..edc25f9b49 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb
@@ -1,3 +1,507 @@
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
+# -File: cxgb4/t4fw-1.27.4.0.bin
+# -Link: cxgb4/t4fw.bin -> t4fw-1.27.4.0.bin
+# +File: cxgb4/t4fw-1.27.5.0.bin
+# +Link: cxgb4/t4fw.bin -> t4fw-1.27.5.0.bin
+#  File: cxgb4/t5fw-1.14.4.0.bin
+#  File: cxgb4/t5fw-1.15.37.0.bin
+# -File: cxgb4/t5fw-1.27.4.0.bin
+# -Link: cxgb4/t5fw.bin -> t5fw-1.27.4.0.bin
+# -File: cxgb4/t6fw-1.27.4.0.bin
+# -Link: cxgb4/t6fw.bin -> t6fw-1.27.4.0.bin
+# +File: cxgb4/t5fw-1.27.5.0.bin
+# +Link: cxgb4/t5fw.bin -> t5fw-1.27.5.0.bin
+# +File: cxgb4/t6fw-1.27.5.0.bin
+# +Link: cxgb4/t6fw.bin -> t6fw-1.27.5.0.bin
+#  File: cxgb4/aq1202_fw.cld
+#  File: cxgb4/bcm8483.bin
+#  File: cxgb4/configs/t4-config-default.txt
+# @@ -1017,22 +1017,22 @@
+#  Version: 74.a5e9588b.0
+#  
+#  File: iwlwifi-cc-a0-77.ucode
+# -Version: 74.bd067429.0
+# +Version: 74.ad46c98b.0
+#  
+#  File: iwlwifi-Qu-b0-hr-b0-77.ucode
+# -Version: 74.bd067429.0
+# +Version: 74.ad46c98b.0
+#  
+#  File: iwlwifi-Qu-b0-jf-b0-77.ucode
+# -Version: 74.bd067429.0
+# +Version: 74.ad46c98b.0
+#  
+#  File: iwlwifi-Qu-c0-hr-b0-77.ucode
+# -Version: 74.bd067429.0
+# +Version: 74.ad46c98b.0
+#  
+#  File: iwlwifi-Qu-c0-jf-b0-77.ucode
+# -Version: 74.bd067429.0
+# +Version: 74.ad46c98b.0
+#  
+#  File: iwlwifi-QuZ-a0-hr-b0-77.ucode
+# -Version: 74.bd06742.0
+# +Version: 74.ad46c98b.0
+#  
+#  File: iwlwifi-QuZ-a0-jf-b0-77.ucode
+#  Version: 74.206b0184.0
+# @@ -1055,6 +1055,9 @@
+#  File: iwlwifi-ty-a0-gf-a0-84.ucode
+#  Version: 81.8e5c544c.0
+#  
+# +File: iwlwifi-ty-a0-gf-a0-86.ucode
+# +Version: 83.fb5c9aeb.0
+# +
+#  File: iwlwifi-so-a0-gf4-a0-77.ucode
+#  Version: 74.f92b5fed.0
+#  
+# @@ -1073,6 +1076,9 @@
+#  File: iwlwifi-so-a0-gf4-a0-84.ucode
+#  Version: 81.8e5c544c.0
+#  
+# +File: iwlwifi-so-a0-gf4-a0-86.ucode
+# +Version: 83.fb5c9aeb.0
+# +
+#  File: iwlwifi-so-a0-gf-a0-77.ucode
+#  Version: 74.f92b5fed.0
+#  
+# @@ -1091,6 +1097,9 @@
+#  File: iwlwifi-so-a0-gf-a0-84.ucode
+#  Version: 81.8e5c544c.0
+#  
+# +File: iwlwifi-so-a0-gf-a0-86.ucode
+# +Version: 83.fb5c9aeb.0
+# +
+#  File: iwlwifi-so-a0-hr-b0-77.ucode
+#  Version: 74.f92b5fed.0
+#  
+# @@ -1106,6 +1115,9 @@
+#  File: iwlwifi-so-a0-hr-b0-84.ucode
+#  Version: 81.8e5c544c.0
+#  
+# +File: iwlwifi-so-a0-hr-b0-86.ucode
+# +Version: 83.fb5c9aeb.0
+# +
+#  File: iwlwifi-so-a0-jf-b0-77.ucode
+#  Version: 74.f92b5fed.0
+#  
+# @@ -1114,20 +1126,32 @@
+#  File: iwlwifi-gl-c0-fm-c0-83.ucode
+#  Version: 80.d24e06ed.0
+#  
+# +File: iwlwifi-gl-c0-fm-c0-86.ucode
+# +Version: 83.fb5c9aeb.0
+# +
+#  File: iwlwifi-gl-c0-fm-c0.pnvm
+#  
+#  File: iwlwifi-ma-b0-gf-a0-83.ucode
+#  Version: 80.d24e06ed.0
+#  
+# +File: iwlwifi-ma-b0-gf-a0-86.ucode
+# +Version: 83.fb5c9aeb.0
+# +
+#  File: iwlwifi-ma-b0-gf-a0.pnvm
+#  
+#  File: iwlwifi-ma-b0-gf4-a0-83.ucode
+#  Version: 80.d24e06ed.0
+#  
+# +File: iwlwifi-ma-b0-gf4-a0-86.ucode
+# +Version: 83.fb5c9aeb.0
+# +
+#  File: iwlwifi-ma-b0-gf4-a0.pnvm
+#  
+#  File: iwlwifi-ma-b0-hr-b0-83.ucode
+#  Version: 80.d24e06ed.0
+# +
+# +File: iwlwifi-ma-b0-hr-b0-86.ucode
+# +Version: 83.fb5c9aeb.0
+#  
+#  Licence: Redistributable. See LICENCE.iwlwifi_firmware for details
+#  
+# @@ -1143,6 +1167,16 @@
+#  Link: intel/ipu3-fw.bin -> irci_irci_ecr-master_20161208_0213_20170112_1500.bin
+#  
+#  Licence: Redistributable. See LICENSE.ipu3_firmware for details
+# +
+# +--------------------------------------------------------------------------
+# +
+# +Driver: ixp4xx-npe - Intel IXP4xx XScale Network Processing Engine (NPE) Firmware
+# +File: ixp4xx/NPE-A
+# +File: ixp4xx/NPE-A-HSS
+# +File: ixp4xx/NPE-B
+# +File: ixp4xx/NPE-C
+# +Version: date = February 26, 2007
+# +License: Redistributable. See LICENSE.ixp4xx for details
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -1914,6 +1948,15 @@
+#  File: radeon/si58_mc.bin
+#  
+#  Licence: Redistributable. See LICENSE.radeon for details.
+# +
+# +--------------------------------------------------------------------------
+# +
+# +Driver: en8811h - Airoha 2.5G Ethernet Phy
+# +
+# +File: airoha/EthMD32.dm.bin
+# +File: airoha/EthMD32.DSP.bin
+# +
+# +Licence: Redistributable. See LICENSE.airoha for details.
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -3644,6 +3687,7 @@
+#  File: s5p-mfc-v6-v2.fw
+#  File: s5p-mfc-v7.fw
+#  File: s5p-mfc-v8.fw
+# +File: s5p-mfc-v12.fw
+#  
+#  Licence: Redistributable.
+#  
+# @@ -3794,17 +3838,17 @@
+#  File:intel/ibt-19-240-4.ddc
+#  Version: BT_HarrisonPeak_REL53497
+#  File:intel/ibt-0041-0041.sfi
+# -Version: BT_TyphoonPeak_REL66410
+# +Version: BT_TyphoonPeak_REL73111
+#  File:intel/ibt-0041-0041.ddc
+# -Version: BT_TyphoonPeak_REL66410
+# +Version: BT_TyphoonPeak_REL73111
+#  File:intel/ibt-0040-0041.sfi
+# -Version: BT_Solar_GfP2_REL66410
+# +Version: BT_Solar_GfP2_REL73111
+#  File:intel/ibt-0040-0041.ddc
+# -Version: BT_Solar_GfP2_REL66410
+# +Version: BT_Solar_GfP2_REL73111
+#  File:intel/ibt-1040-0041.sfi
+# -Version: BT_SolarF_GfP2_REL66410
+# +Version: BT_SolarF_GfP2_REL73111
+#  File:intel/ibt-1040-0041.ddc
+# -Version: BT_SolarF_GfP2_REL66410
+# +Version: BT_SolarF_GfP2_REL73111
+#  
+#  File:intel/ibt-0040-1020.sfi
+#  Version: BT_Solar_JfP1_REL59564
+# @@ -3824,34 +3868,43 @@
+#  File:intel/ibt-1040-2120.ddc
+#  Version: BT_SolarF_JfP2_REL59564
+#  
+# +File:intel/ibt-0040-1050.sfi
+# +Version: BT_Solar_HrP1_REL73111
+# +File:intel/ibt-0040-1050.ddc
+# +Version: BT_Solar_HrP1_REL73111
+# +File:intel/ibt-1040-1050.sfi
+# +Version: BT_SolarF_HrP1_REL73111
+# +File:intel/ibt-1040-1050.ddc
+# +Version: BT_SolarF_HrP1_REL73111
+# +
+#  File:intel/ibt-0040-4150.sfi
+# -Version: BT_Solar_JnP2_REL66410
+# +Version: BT_Solar_JnP2_REL73111
+#  File:intel/ibt-0040-4150.ddc
+# -Version: BT_Solar_JnP2_REL66410
+# +Version: BT_Solar_JnP2_REL73111
+#  File:intel/ibt-1040-4150.sfi
+# -Version: BT_SolarF_JnP2_REL66410
+# +Version: BT_SolarF_JnP2_REL73111
+#  File:intel/ibt-1040-4150.ddc
+# -Version: BT_SolarF_JnP2_REL66410
+# +Version: BT_SolarF_JnP2_REL73111
+#  
+#  File:intel/ibt-0291-0291.sfi
+# -Version: BT_GalePeak_REL39025
+# +Version: BT_GalePeak_REL45894
+#  File:intel/ibt-0291-0291.ddc
+# -Version: BT_GalePeak_REL39025
+# +Version: BT_GalePeak_REL45894
+#  
+#  File:intel/ibt-0180-0041.sfi
+# -Version: BT_Magnetar_GfP2_REL82221
+# +Version: BT_Magnetar_GfP2_REL91648
+#  File:intel/ibt-0180-0041.ddc
+# -Version: BT_Magnetar_GfP2_REL82221
+# +Version: BT_Magnetar_GfP2_REL91648
+#  
+#  File:intel/ibt-0180-4150.sfi
+# -Version: BT_Magnetar_HrP2_REL82221
+# +Version: BT_Magnetar_JnP2_REL91648
+#  File:intel/ibt-0180-4150.ddc
+# -Version: BT_Magnetar_HrP2_REL82221
+# +Version: BT_Magnetar_JnP2_REL91648
+#  
+#  File:intel/ibt-0180-1050.sfi
+# -Version: BT_Magnetar_HrP1_REL82221
+# +Version: BT_Magnetar_HrP1_REL91648
+#  File:intel/ibt-0180-1050.ddc
+# -Version: BT_Magnetar_HrP1_REL82221
+# +Version: BT_Magnetar_HrP1_REL91648
+#  
+#  Licence: Redistributable. See LICENCE.ibt_firmware for details
+#  
+# @@ -3984,7 +4037,7 @@
+#  RawFile: amd-ucode/microcode_amd_fam16h.bin
+#  Version: 2014-10-28
+#  RawFile: amd-ucode/microcode_amd_fam17h.bin
+# -Version: 2023-07-19
+# +Version: 2023-12-05
+#  RawFile: amd-ucode/microcode_amd_fam19h.bin
+#  Version: 2023-10-19
+#  File: amd-ucode/README
+# @@ -4367,6 +4420,17 @@
+#  
+#  --------------------------------------------------------------------------
+#  
+# +Driver: qca - Qualcomm Atheros Bluetooth support for WCN3988 chips
+# +
+# +File: qca/apbtfw10.tlv
+# +File: qca/apbtfw11.tlv
+# +File: qca/apnv10.bin
+# +File: qca/apnv11.bin
+# +
+# +Licence: Redistributable. See LICENSE.qcom and qca/NOTICE.txt for details
+# +
+# +--------------------------------------------------------------------------
+# +
+#  Driver: qca - Qualcomm Atheros Bluetooth support for WCN399x chips
+#  
+#  File: qca/crbtfw21.tlv
+# @@ -4784,7 +4848,7 @@
+#  Version: DMC API/APB ver 2 release 10 for Meteorlake
+#  
+#  File: i915/mtl_dmc.bin
+# -Version: DMC API/APB ver 2 release 17 for Meteorlake
+# +Version: DMC API/APB ver 2 release 19 for Meteorlake
+#  
+#  File: i915/mtl_guc_70.bin
+#  Version: GuC API/APB ver 70.13.1 for Meteorlake
+# @@ -5212,6 +5276,48 @@
+#  File: nvidia/tu10x/typec/ccg_secondary.cyacd
+#  File: nvidia/tu10x/typec/ccg_boot.cyacd
+#  
+# +Firmware images needed for GSP-RM:
+# +
+# +File: nvidia/tu102/gsp/bootloader-535.113.01.bin
+# +File: nvidia/tu102/gsp/booter_load-535.113.01.bin
+# +File: nvidia/tu102/gsp/booter_unload-535.113.01.bin
+# +Link: nvidia/tu104/gsp -> ../tu102/gsp
+# +Link: nvidia/tu106/gsp -> ../tu102/gsp
+# +
+# +File: nvidia/tu116/gsp/booter_load-535.113.01.bin
+# +File: nvidia/tu116/gsp/booter_unload-535.113.01.bin
+# +Link: nvidia/tu116/gsp/bootloader-535.113.01.bin -> ../../tu102/gsp/bootloader-535.113.01.bin
+# +Link: nvidia/tu117/gsp -> ../tu116/gsp
+# +
+# +File: nvidia/ga100/gsp/bootloader-535.113.01.bin
+# +File: nvidia/ga100/gsp/booter_load-535.113.01.bin
+# +File: nvidia/ga100/gsp/booter_unload-535.113.01.bin
+# +
+# +File: nvidia/ad102/gsp/bootloader-535.113.01.bin
+# +File: nvidia/ad102/gsp/booter_load-535.113.01.bin
+# +File: nvidia/ad102/gsp/booter_unload-535.113.01.bin
+# +Link: nvidia/ad103/gsp -> ../ad102/gsp
+# +Link: nvidia/ad104/gsp -> ../ad102/gsp
+# +Link: nvidia/ad106/gsp -> ../ad102/gsp
+# +Link: nvidia/ad107/gsp -> ../ad102/gsp
+# +
+# +File: nvidia/ga102/gsp/bootloader-535.113.01.bin
+# +File: nvidia/ga102/gsp/booter_load-535.113.01.bin
+# +File: nvidia/ga102/gsp/booter_unload-535.113.01.bin
+# +Link: nvidia/ga103/gsp -> ../ga102/gsp
+# +Link: nvidia/ga104/gsp -> ../ga102/gsp
+# +Link: nvidia/ga106/gsp -> ../ga102/gsp
+# +Link: nvidia/ga107/gsp -> ../ga102/gsp
+# +
+# +File: nvidia/tu102/gsp/gsp-535.113.01.bin
+# +Origin: gsp_tu10x.bin from NVIDIA-Linux-x86_64-535.113.01.run
+# +Link: nvidia/tu116/gsp/gsp-535.113.01.bin -> ../../tu102/gsp/gsp-535.113.01.bin
+# +Link: nvidia/ga100/gsp/gsp-535.113.01.bin -> ../../tu102/gsp/gsp-535.113.01.bin
+# +
+# +File: nvidia/ga102/gsp/gsp-535.113.01.bin
+# +Origin: gsp_ga10x.bin from NVIDIA-Linux-x86_64-535.113.01.run
+# +Link: nvidia/ad102/gsp/gsp-535.113.01.bin -> ../../ga102/gsp/gsp-535.113.01.bin
+# +
+#  Licence: Redistributable. See LICENCE.nvidia for details
+#  
+#  --------------------------------------------------------------------------
+# @@ -5452,9 +5558,9 @@
+#  Driver: mt7921 - MediaTek MT7921 Wireless MACs
+#  
+#  File: mediatek/WIFI_MT7961_patch_mcu_1_2_hdr.bin
+# -Version: 20230526130917a
+# +Version: 20231109190918a
+#  File: mediatek/WIFI_RAM_CODE_MT7961_1.bin
+# -Version: 20230526130958
+# +Version: 20231109190959
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -5463,7 +5569,7 @@
+#  Driver: mt7921 - MediaTek MT7921 bluetooth chipset
+#  
+#  File: mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin
+# -Version: 20230526131214
+# +Version: 20231109191416
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -5472,9 +5578,9 @@
+#  Driver: mt7922 - MediaTek MT7922 Wireless MACs
+#  
+#  File: mediatek/WIFI_MT7922_patch_mcu_1_1_hdr.bin
+# -Version: 20230627143702a
+# +Version: 20231120183400a
+#  File: mediatek/WIFI_RAM_CODE_MT7922_1.bin
+# -Version: 20230627143946
+# +Version: 20231120183441
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -5483,7 +5589,16 @@
+#  Driver: mt7922 - MediaTek MT7922 bluetooth chipset
+#  
+#  File: mediatek/BT_RAM_CODE_MT7922_1_1_hdr.bin
+# -Version: 20230627144220
+# +Version: 20231120183620
+# +
+# +Licence: Redistributable. See LICENCE.mediatek for details.
+# +
+# +--------------------------------------------------------------------------
+# +
+# +Driver: mt7988 - MediaTek MT7988 Internal 2.5G Ethernet Phy
+# +
+# +File: mediatek/mt7988/i2p5ge-phy-pmb.bin
+# +Version: 20230728
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -5951,14 +6066,14 @@
+#  
+#  Driver: ice - Intel(R) Ethernet Connection E800 Series
+#  
+# -File: intel/ice/ddp/ice-1.3.30.0.pkg
+# -Link: intel/ice/ddp/ice.pkg -> ice-1.3.30.0.pkg
+# +File: intel/ice/ddp/ice-1.3.35.0.pkg
+# +Link: intel/ice/ddp/ice.pkg -> ice-1.3.35.0.pkg
+#  File: intel/ice/ddp-lag/ice_lag-1.3.1.0.pkg
+#  
+#  License: Redistributable. See LICENSE.ice for details
+#  
+# -File: intel/ice/ddp-comms/ice_comms-1.3.40.0.pkg
+# -File: intel/ice/ddp-wireless_edge/ice_wireless_edge-1.3.10.0.pkg
+# +File: intel/ice/ddp-comms/ice_comms-1.3.45.0.pkg
+# +File: intel/ice/ddp-wireless_edge/ice_wireless_edge-1.3.13.0.pkg
+#  
+#  License: Redistributable. See LICENSE.ice_enhanced for details
+#  
+# @@ -6002,7 +6117,7 @@
+#  Driver: wfx - Silicon Labs Wi-Fi Transceiver
+#  
+#  File: wfx/wfm_wf200_C0.sec
+# -Version: 3.16.1
+# +Version: 3.17
+#  
+#  File: wfx/brd4001a.pds
+#  File: wfx/brd8022a.pds
+# @@ -6170,6 +6285,24 @@
+#  Link: cirrus/cs35l41-dsp1-spk-cali-103c8c71.bin -> cs35l41-dsp1-spk-cali-103c8c47.bin
+#  Link: cirrus/cs35l41-dsp1-spk-prot-103c8c72.bin -> cs35l41-dsp1-spk-prot-103c8c48.bin
+#  Link: cirrus/cs35l41-dsp1-spk-cali-103c8c72.bin -> cs35l41-dsp1-spk-cali-103c8c48.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8ca4.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-103c8ca4.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8ca7.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-103c8ca7.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +File: cirrus/cs35l41-dsp1-spk-prot-103c8ca4.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-103c8ca4.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8ca7.wmfw -> cs35l41-dsp1-spk-prot-103c8ca4.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-103c8ca7.wmfw -> cs35l41-dsp1-spk-cali-103c8ca4.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8ca7.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-103c8ca7.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +File: cirrus/cs35l41-dsp1-spk-prot-103c8cf5-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-103c8cf5-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-103c8cf5-l1.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-103c8cf5-l1.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-103c8cf5-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-103c8cf5-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-103c8cf5-r1.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-103c8cf5-r1.bin
+#  File: cirrus/cs35l41/v6.39.0/halo_cspl_RAM_revB2_29.41.0.wmfw
+#  Link: cirrus/cs35l41-dsp1-spk-prot-17aa3847.wmfw -> cs35l41/v6.39.0/halo_cspl_RAM_revB2_29.41.0.wmfw
+#  Link: cirrus/cs35l41-dsp1-spk-cali-17aa3847.wmfw -> cs35l41/v6.39.0/halo_cspl_RAM_revB2_29.41.0.wmfw
+# @@ -6486,6 +6619,46 @@
+#  File: cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid0-l0.bin
+#  File: cirrus/cs35l41-dsp1-spk-prot-10433a60-spkid0-r0.bin
+#  File: cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid0-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10431c33.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10431c33.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10431c03.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10431c03.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10431a63.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10431a63.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10431c43.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10431c43.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431c03-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431c03-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431c03-spkid0-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431c03-spkid0-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431c03-spkid1-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431c03-spkid1-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431c03-spkid1-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431c03-spkid1-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431a63-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431a63-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431a63-spkid0-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431a63-spkid0-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431a63-spkid1-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431a63-spkid1-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431a63-spkid1-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431a63-spkid1-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431c33-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431c33-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431c33-spkid0-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431c33-spkid0-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431c33-spkid1-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431c33-spkid1-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431c33-spkid1-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431c33-spkid1-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431c43-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431c43-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431c43-spkid0-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431c43-spkid0-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431c43-spkid1-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431c43-spkid1-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431c43-spkid1-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431c43-spkid1-r0.bin
+#  Link: cirrus/cs35l41-dsp1-spk-prot-17aa2316.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+#  Link: cirrus/cs35l41-dsp1-spk-cali-17aa2316.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+#  Link: cirrus/cs35l41-dsp1-spk-prot-17aa2317.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# @@ -6706,3 +6879,10 @@
+#  Licence: Redistributable. See LICENSE.amlogic for details
+#  
+#  --------------------------------------------------------------------------
+# +
+# +Driver: powervr - Imagination Technologies PowerVR graphics driver
+# +
+# +File: powervr/rogue_33.15.11.3_v1.fw
+# +Version: 1.0.OS@6503725
+# +
+# +License: Redistributable. See LICENSE.powervr for details
+# 
+#
+
 SUMMARY = "Firmware files for use with Linux kernel"
 HOMEPAGE = "https://www.kernel.org/"
 DESCRIPTION = "Linux firmware is a package distributed alongside the Linux kernel \
@@ -147,7 +651,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=${WHENCE_CHKSUM} \
+                    file://WHENCE;md5=3113c4ea08e5171555f3bf49eceb5b07 \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
@@ -237,7 +741,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "c98d200fc4a3120de1a594713ce34e135819dff23e883a4ed387863ba25679c7"
+SRC_URI[sha256sum] = "96af7e4b5eabd37869cdb3dcbb7ab36911106d39b76e799fa1caab16a9dbe8bb"
 
 inherit allarch
 
-- 
2.42.0


--===============0433085120061299457==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1851 entries from dependency cache.
Parsing recipes...done.
Parsing of 914 .bb files complete (913 cached, 1 parsed). 1850 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the allarch sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-28c45a77468e9fd5cad975ca83ca3ee71c5227e6"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:28c45a77468e9fd5cad975ca83ca3ee71c5227e6"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 60 Local 49 Mirrors 0 Missed 11 Current 150 (81% match, 94% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 165 of 210 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb:do_recipe_qa_setscene)
NOTE: recipe linux-firmware-1_20231211-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-firmware-1_20231211-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 663 of 682 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb:do_fetch)
NOTE: recipe linux-firmware-1_20231211-r0: task do_fetch: Started
NOTE: recipe linux-firmware-1_20231211-r0: task do_fetch: Succeeded
NOTE: Running task 664 of 682 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb:do_unpack)
NOTE: Running task 665 of 682 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb:do_prepare_recipe_sysroot)
NOTE: recipe linux-firmware-1_20231211-r0: task do_unpack: Started
NOTE: recipe linux-firmware-1_20231211-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-firmware-1_20231211-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe linux-firmware-1_20231211-r0: task do_unpack: Succeeded
NOTE: Running task 666 of 682 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb:do_patch)
NOTE: Running task 667 of 682 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb:do_collect_spdx_deps)
NOTE: recipe linux-firmware-1_20231211-r0: task do_patch: Started
NOTE: recipe linux-firmware-1_20231211-r0: task do_collect_spdx_deps: Started
NOTE: recipe linux-firmware-1_20231211-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe linux-firmware-1_20231211-r0: task do_patch: Succeeded
NOTE: Running task 668 of 682 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb:do_deploy_source_date_epoch)
NOTE: Running task 669 of 682 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb:do_populate_lic)
NOTE: recipe linux-firmware-1_20231211-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe linux-firmware-1_20231211-r0: task do_populate_lic: Started
NOTE: recipe linux-firmware-1_20231211-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb:do_populate_lic unihash changed to cf686bded25ae5c349b4ae202fb65ff2e5382d5332690c5daad3dca19d1f8503
NOTE: recipe linux-firmware-1_20231211-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb:do_deploy_source_date_epoch unihash changed to b1669584a529bb764e0b0b725763ccd95d54fc98f2e64680a0b4fe0942937c9f
NOTE: Setscene tasks completed
NOTE: Running task 670 of 682 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb:do_configure)
NOTE: recipe linux-firmware-1_20231211-r0: task do_configure: Started
NOTE: recipe linux-firmware-1_20231211-r0: task do_configure: Succeeded
NOTE: Running task 671 of 682 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb:do_compile)
NOTE: recipe linux-firmware-1_20231211-r0: task do_compile: Started
NOTE: recipe linux-firmware-1_20231211-r0: task do_compile: Succeeded
NOTE: Running task 672 of 682 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb:do_install)
NOTE: recipe linux-firmware-1_20231211-r0: task do_install: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['gettext-minimal-native', 'libtool-native', 'quilt-native', 'texinfo-dummy-native', 'patch-native', 'pseudo-native', 'xz-native', 'attr-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_install
| NOTE: make -j 16 -l 52 DESTDIR=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20231211/image FIRMWAREDIR=/usr/lib/firmware install
| install -d /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20231211/image/usr/lib/firmware
| ./copy-firmware.sh  /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20231211/image/usr/lib/firmware
| ERROR: rdfind is not installed.  Pass --ignore-duplicates to skip deduplication
| make: *** [Makefile:31: install] Error 1
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20231211/temp/run.do_install.2219886:174 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20231211/temp/run.do_install.2219886, line 174
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20231211/temp/run.do_install.2219886, line 158
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20231211/temp/run.do_install.2219886, line 153
| 	#4: do_install, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20231211/temp/run.do_install.2219886, line 144
| 	#5: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20231211/temp/run.do_install.2219886, line 187
NOTE: recipe linux-firmware-1_20231211-r0: task do_install: Failed
NOTE: Tasks Summary: Attempted 672 tasks of which 662 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240115131444.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240115131444.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb:do_install
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: linux-firmware-1_20231211-r0 do_install: oe_runmake failed
ERROR: linux-firmware-1_20231211-r0 do_install: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20231211/temp/run.do_install.2219886', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20231211/temp/log.do_install.2219886
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb:do_install) failed with exit code '1'

--===============0433085120061299457==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-linux-firmware-upgrade-20231030-20231211.patch"

RnJvbSAwZTY4NzJjNDdiZWFjNzBkZjg2NDg5NGQ2ZDNlNWY4NTE4ZmE2YTQzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSmFuIDIwMjQgMTM6MTU6MTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aW51eC1maXJtd2FyZTogdXBncmFkZSAyMDIzMTAzMCAtPiAyMDIzMTIxMQoKLS0tCiAuLi4yMDIz
MTAzMC5iYiA9PiBsaW51eC1maXJtd2FyZV8yMDIzMTIxMS5iYn0gfCA1MDggKysrKysrKysrKysr
KysrKystCiAxIGZpbGUgY2hhbmdlZCwgNTA2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS97bGludXgtZmlybXdh
cmVfMjAyMzEwMzAuYmIgPT4gbGludXgtZmlybXdhcmVfMjAyMzEyMTEuYmJ9ICg3OSUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2Fy
ZV8yMDIzMTAzMC5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgt
ZmlybXdhcmVfMjAyMzEyMTEuYmIKc2ltaWxhcml0eSBpbmRleCA3OSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZV8yMDIzMTAzMC5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJt
d2FyZV8yMDIzMTIxMS5iYgppbmRleCBiMWY1MjQ3OTc1Li5lZGMyNWY5YjQ5IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlXzIwMjMx
MDMwLmJiCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgtZmly
bXdhcmVfMjAyMzEyMTEuYmIKQEAgLTEsMyArMSw1MDcgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklM
RVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4K
KyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRo
ZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlm
IG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3Nh
Z2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0
ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0t
LSBXSEVOQ0UKKyMgKysrIFdIRU5DRQorIyBAQCAtNTM2LDE0ICs1MzYsMTQgQEAKKyMgIAorIyAg
RmlsZTogY3hnYjQvdDRmdy0xLjE0LjQuMC5iaW4KKyMgIEZpbGU6IGN4Z2I0L3Q0ZnctMS4xNS4z
Ny4wLmJpbgorIyAtRmlsZTogY3hnYjQvdDRmdy0xLjI3LjQuMC5iaW4KKyMgLUxpbms6IGN4Z2I0
L3Q0ZncuYmluIC0+IHQ0ZnctMS4yNy40LjAuYmluCisjICtGaWxlOiBjeGdiNC90NGZ3LTEuMjcu
NS4wLmJpbgorIyArTGluazogY3hnYjQvdDRmdy5iaW4gLT4gdDRmdy0xLjI3LjUuMC5iaW4KKyMg
IEZpbGU6IGN4Z2I0L3Q1ZnctMS4xNC40LjAuYmluCisjICBGaWxlOiBjeGdiNC90NWZ3LTEuMTUu
MzcuMC5iaW4KKyMgLUZpbGU6IGN4Z2I0L3Q1ZnctMS4yNy40LjAuYmluCisjIC1MaW5rOiBjeGdi
NC90NWZ3LmJpbiAtPiB0NWZ3LTEuMjcuNC4wLmJpbgorIyAtRmlsZTogY3hnYjQvdDZmdy0xLjI3
LjQuMC5iaW4KKyMgLUxpbms6IGN4Z2I0L3Q2ZncuYmluIC0+IHQ2ZnctMS4yNy40LjAuYmluCisj
ICtGaWxlOiBjeGdiNC90NWZ3LTEuMjcuNS4wLmJpbgorIyArTGluazogY3hnYjQvdDVmdy5iaW4g
LT4gdDVmdy0xLjI3LjUuMC5iaW4KKyMgK0ZpbGU6IGN4Z2I0L3Q2ZnctMS4yNy41LjAuYmluCisj
ICtMaW5rOiBjeGdiNC90NmZ3LmJpbiAtPiB0NmZ3LTEuMjcuNS4wLmJpbgorIyAgRmlsZTogY3hn
YjQvYXExMjAyX2Z3LmNsZAorIyAgRmlsZTogY3hnYjQvYmNtODQ4My5iaW4KKyMgIEZpbGU6IGN4
Z2I0L2NvbmZpZ3MvdDQtY29uZmlnLWRlZmF1bHQudHh0CisjIEBAIC0xMDE3LDIyICsxMDE3LDIy
IEBACisjICBWZXJzaW9uOiA3NC5hNWU5NTg4Yi4wCisjICAKKyMgIEZpbGU6IGl3bHdpZmktY2Mt
YTAtNzcudWNvZGUKKyMgLVZlcnNpb246IDc0LmJkMDY3NDI5LjAKKyMgK1ZlcnNpb246IDc0LmFk
NDZjOThiLjAKKyMgIAorIyAgRmlsZTogaXdsd2lmaS1RdS1iMC1oci1iMC03Ny51Y29kZQorIyAt
VmVyc2lvbjogNzQuYmQwNjc0MjkuMAorIyArVmVyc2lvbjogNzQuYWQ0NmM5OGIuMAorIyAgCisj
ICBGaWxlOiBpd2x3aWZpLVF1LWIwLWpmLWIwLTc3LnVjb2RlCisjIC1WZXJzaW9uOiA3NC5iZDA2
NzQyOS4wCisjICtWZXJzaW9uOiA3NC5hZDQ2Yzk4Yi4wCisjICAKKyMgIEZpbGU6IGl3bHdpZmkt
UXUtYzAtaHItYjAtNzcudWNvZGUKKyMgLVZlcnNpb246IDc0LmJkMDY3NDI5LjAKKyMgK1ZlcnNp
b246IDc0LmFkNDZjOThiLjAKKyMgIAorIyAgRmlsZTogaXdsd2lmaS1RdS1jMC1qZi1iMC03Ny51
Y29kZQorIyAtVmVyc2lvbjogNzQuYmQwNjc0MjkuMAorIyArVmVyc2lvbjogNzQuYWQ0NmM5OGIu
MAorIyAgCisjICBGaWxlOiBpd2x3aWZpLVF1Wi1hMC1oci1iMC03Ny51Y29kZQorIyAtVmVyc2lv
bjogNzQuYmQwNjc0Mi4wCisjICtWZXJzaW9uOiA3NC5hZDQ2Yzk4Yi4wCisjICAKKyMgIEZpbGU6
IGl3bHdpZmktUXVaLWEwLWpmLWIwLTc3LnVjb2RlCisjICBWZXJzaW9uOiA3NC4yMDZiMDE4NC4w
CisjIEBAIC0xMDU1LDYgKzEwNTUsOSBAQAorIyAgRmlsZTogaXdsd2lmaS10eS1hMC1nZi1hMC04
NC51Y29kZQorIyAgVmVyc2lvbjogODEuOGU1YzU0NGMuMAorIyAgCisjICtGaWxlOiBpd2x3aWZp
LXR5LWEwLWdmLWEwLTg2LnVjb2RlCisjICtWZXJzaW9uOiA4My5mYjVjOWFlYi4wCisjICsKKyMg
IEZpbGU6IGl3bHdpZmktc28tYTAtZ2Y0LWEwLTc3LnVjb2RlCisjICBWZXJzaW9uOiA3NC5mOTJi
NWZlZC4wCisjICAKKyMgQEAgLTEwNzMsNiArMTA3Niw5IEBACisjICBGaWxlOiBpd2x3aWZpLXNv
LWEwLWdmNC1hMC04NC51Y29kZQorIyAgVmVyc2lvbjogODEuOGU1YzU0NGMuMAorIyAgCisjICtG
aWxlOiBpd2x3aWZpLXNvLWEwLWdmNC1hMC04Ni51Y29kZQorIyArVmVyc2lvbjogODMuZmI1Yzlh
ZWIuMAorIyArCisjICBGaWxlOiBpd2x3aWZpLXNvLWEwLWdmLWEwLTc3LnVjb2RlCisjICBWZXJz
aW9uOiA3NC5mOTJiNWZlZC4wCisjICAKKyMgQEAgLTEwOTEsNiArMTA5Nyw5IEBACisjICBGaWxl
OiBpd2x3aWZpLXNvLWEwLWdmLWEwLTg0LnVjb2RlCisjICBWZXJzaW9uOiA4MS44ZTVjNTQ0Yy4w
CisjICAKKyMgK0ZpbGU6IGl3bHdpZmktc28tYTAtZ2YtYTAtODYudWNvZGUKKyMgK1ZlcnNpb246
IDgzLmZiNWM5YWViLjAKKyMgKworIyAgRmlsZTogaXdsd2lmaS1zby1hMC1oci1iMC03Ny51Y29k
ZQorIyAgVmVyc2lvbjogNzQuZjkyYjVmZWQuMAorIyAgCisjIEBAIC0xMTA2LDYgKzExMTUsOSBA
QAorIyAgRmlsZTogaXdsd2lmaS1zby1hMC1oci1iMC04NC51Y29kZQorIyAgVmVyc2lvbjogODEu
OGU1YzU0NGMuMAorIyAgCisjICtGaWxlOiBpd2x3aWZpLXNvLWEwLWhyLWIwLTg2LnVjb2RlCisj
ICtWZXJzaW9uOiA4My5mYjVjOWFlYi4wCisjICsKKyMgIEZpbGU6IGl3bHdpZmktc28tYTAtamYt
YjAtNzcudWNvZGUKKyMgIFZlcnNpb246IDc0LmY5MmI1ZmVkLjAKKyMgIAorIyBAQCAtMTExNCwy
MCArMTEyNiwzMiBAQAorIyAgRmlsZTogaXdsd2lmaS1nbC1jMC1mbS1jMC04My51Y29kZQorIyAg
VmVyc2lvbjogODAuZDI0ZTA2ZWQuMAorIyAgCisjICtGaWxlOiBpd2x3aWZpLWdsLWMwLWZtLWMw
LTg2LnVjb2RlCisjICtWZXJzaW9uOiA4My5mYjVjOWFlYi4wCisjICsKKyMgIEZpbGU6IGl3bHdp
ZmktZ2wtYzAtZm0tYzAucG52bQorIyAgCisjICBGaWxlOiBpd2x3aWZpLW1hLWIwLWdmLWEwLTgz
LnVjb2RlCisjICBWZXJzaW9uOiA4MC5kMjRlMDZlZC4wCisjICAKKyMgK0ZpbGU6IGl3bHdpZmkt
bWEtYjAtZ2YtYTAtODYudWNvZGUKKyMgK1ZlcnNpb246IDgzLmZiNWM5YWViLjAKKyMgKworIyAg
RmlsZTogaXdsd2lmaS1tYS1iMC1nZi1hMC5wbnZtCisjICAKKyMgIEZpbGU6IGl3bHdpZmktbWEt
YjAtZ2Y0LWEwLTgzLnVjb2RlCisjICBWZXJzaW9uOiA4MC5kMjRlMDZlZC4wCisjICAKKyMgK0Zp
bGU6IGl3bHdpZmktbWEtYjAtZ2Y0LWEwLTg2LnVjb2RlCisjICtWZXJzaW9uOiA4My5mYjVjOWFl
Yi4wCisjICsKKyMgIEZpbGU6IGl3bHdpZmktbWEtYjAtZ2Y0LWEwLnBudm0KKyMgIAorIyAgRmls
ZTogaXdsd2lmaS1tYS1iMC1oci1iMC04My51Y29kZQorIyAgVmVyc2lvbjogODAuZDI0ZTA2ZWQu
MAorIyArCisjICtGaWxlOiBpd2x3aWZpLW1hLWIwLWhyLWIwLTg2LnVjb2RlCisjICtWZXJzaW9u
OiA4My5mYjVjOWFlYi4wCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJ
Q0VOQ0UuaXdsd2lmaV9maXJtd2FyZSBmb3IgZGV0YWlscworIyAgCisjIEBAIC0xMTQzLDYgKzEx
NjcsMTYgQEAKKyMgIExpbms6IGludGVsL2lwdTMtZncuYmluIC0+IGlyY2lfaXJjaV9lY3ItbWFz
dGVyXzIwMTYxMjA4XzAyMTNfMjAxNzAxMTJfMTUwMC5iaW4KKyMgIAorIyAgTGljZW5jZTogUmVk
aXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5pcHUzX2Zpcm13YXJlIGZvciBkZXRhaWxzCisjICsK
KyMgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICsKKyMgK0RyaXZlcjogaXhwNHh4LW5wZSAtIEludGVs
IElYUDR4eCBYU2NhbGUgTmV0d29yayBQcm9jZXNzaW5nIEVuZ2luZSAoTlBFKSBGaXJtd2FyZQor
IyArRmlsZTogaXhwNHh4L05QRS1BCisjICtGaWxlOiBpeHA0eHgvTlBFLUEtSFNTCisjICtGaWxl
OiBpeHA0eHgvTlBFLUIKKyMgK0ZpbGU6IGl4cDR4eC9OUEUtQworIyArVmVyc2lvbjogZGF0ZSA9
IEZlYnJ1YXJ5IDI2LCAyMDA3CisjICtMaWNlbnNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNF
TlNFLml4cDR4eCBmb3IgZGV0YWlscworIyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisj
IEBAIC0xOTE0LDYgKzE5NDgsMTUgQEAKKyMgIEZpbGU6IHJhZGVvbi9zaTU4X21jLmJpbgorIyAg
CisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLnJhZGVvbiBmb3IgZGV0
YWlscy4KKyMgKworIyArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgKworIyArRHJpdmVyOiBlbjg4MTFo
IC0gQWlyb2hhIDIuNUcgRXRoZXJuZXQgUGh5CisjICsKKyMgK0ZpbGU6IGFpcm9oYS9FdGhNRDMy
LmRtLmJpbgorIyArRmlsZTogYWlyb2hhL0V0aE1EMzIuRFNQLmJpbgorIyArCisjICtMaWNlbmNl
OiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLmFpcm9oYSBmb3IgZGV0YWlscy4KKyMgIAor
IyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgIAorIyBAQCAtMzY0NCw2ICszNjg3LDcgQEAKKyMgIEZp
bGU6IHM1cC1tZmMtdjYtdjIuZncKKyMgIEZpbGU6IHM1cC1tZmMtdjcuZncKKyMgIEZpbGU6IHM1
cC1tZmMtdjguZncKKyMgK0ZpbGU6IHM1cC1tZmMtdjEyLmZ3CisjICAKKyMgIExpY2VuY2U6IFJl
ZGlzdHJpYnV0YWJsZS4KKyMgIAorIyBAQCAtMzc5NCwxNyArMzgzOCwxNyBAQAorIyAgRmlsZTpp
bnRlbC9pYnQtMTktMjQwLTQuZGRjCisjICBWZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMNTM0
OTcKKyMgIEZpbGU6aW50ZWwvaWJ0LTAwNDEtMDA0MS5zZmkKKyMgLVZlcnNpb246IEJUX1R5cGhv
b25QZWFrX1JFTDY2NDEwCisjICtWZXJzaW9uOiBCVF9UeXBob29uUGVha19SRUw3MzExMQorIyAg
RmlsZTppbnRlbC9pYnQtMDA0MS0wMDQxLmRkYworIyAtVmVyc2lvbjogQlRfVHlwaG9vblBlYWtf
UkVMNjY0MTAKKyMgK1ZlcnNpb246IEJUX1R5cGhvb25QZWFrX1JFTDczMTExCisjICBGaWxlOmlu
dGVsL2lidC0wMDQwLTAwNDEuc2ZpCisjIC1WZXJzaW9uOiBCVF9Tb2xhcl9HZlAyX1JFTDY2NDEw
CisjICtWZXJzaW9uOiBCVF9Tb2xhcl9HZlAyX1JFTDczMTExCisjICBGaWxlOmludGVsL2lidC0w
MDQwLTAwNDEuZGRjCisjIC1WZXJzaW9uOiBCVF9Tb2xhcl9HZlAyX1JFTDY2NDEwCisjICtWZXJz
aW9uOiBCVF9Tb2xhcl9HZlAyX1JFTDczMTExCisjICBGaWxlOmludGVsL2lidC0xMDQwLTAwNDEu
c2ZpCisjIC1WZXJzaW9uOiBCVF9Tb2xhckZfR2ZQMl9SRUw2NjQxMAorIyArVmVyc2lvbjogQlRf
U29sYXJGX0dmUDJfUkVMNzMxMTEKKyMgIEZpbGU6aW50ZWwvaWJ0LTEwNDAtMDA0MS5kZGMKKyMg
LVZlcnNpb246IEJUX1NvbGFyRl9HZlAyX1JFTDY2NDEwCisjICtWZXJzaW9uOiBCVF9Tb2xhckZf
R2ZQMl9SRUw3MzExMQorIyAgCisjICBGaWxlOmludGVsL2lidC0wMDQwLTEwMjAuc2ZpCisjICBW
ZXJzaW9uOiBCVF9Tb2xhcl9KZlAxX1JFTDU5NTY0CisjIEBAIC0zODI0LDM0ICszODY4LDQzIEBA
CisjICBGaWxlOmludGVsL2lidC0xMDQwLTIxMjAuZGRjCisjICBWZXJzaW9uOiBCVF9Tb2xhckZf
SmZQMl9SRUw1OTU2NAorIyAgCisjICtGaWxlOmludGVsL2lidC0wMDQwLTEwNTAuc2ZpCisjICtW
ZXJzaW9uOiBCVF9Tb2xhcl9IclAxX1JFTDczMTExCisjICtGaWxlOmludGVsL2lidC0wMDQwLTEw
NTAuZGRjCisjICtWZXJzaW9uOiBCVF9Tb2xhcl9IclAxX1JFTDczMTExCisjICtGaWxlOmludGVs
L2lidC0xMDQwLTEwNTAuc2ZpCisjICtWZXJzaW9uOiBCVF9Tb2xhckZfSHJQMV9SRUw3MzExMQor
IyArRmlsZTppbnRlbC9pYnQtMTA0MC0xMDUwLmRkYworIyArVmVyc2lvbjogQlRfU29sYXJGX0hy
UDFfUkVMNzMxMTEKKyMgKworIyAgRmlsZTppbnRlbC9pYnQtMDA0MC00MTUwLnNmaQorIyAtVmVy
c2lvbjogQlRfU29sYXJfSm5QMl9SRUw2NjQxMAorIyArVmVyc2lvbjogQlRfU29sYXJfSm5QMl9S
RUw3MzExMQorIyAgRmlsZTppbnRlbC9pYnQtMDA0MC00MTUwLmRkYworIyAtVmVyc2lvbjogQlRf
U29sYXJfSm5QMl9SRUw2NjQxMAorIyArVmVyc2lvbjogQlRfU29sYXJfSm5QMl9SRUw3MzExMQor
IyAgRmlsZTppbnRlbC9pYnQtMTA0MC00MTUwLnNmaQorIyAtVmVyc2lvbjogQlRfU29sYXJGX0pu
UDJfUkVMNjY0MTAKKyMgK1ZlcnNpb246IEJUX1NvbGFyRl9KblAyX1JFTDczMTExCisjICBGaWxl
OmludGVsL2lidC0xMDQwLTQxNTAuZGRjCisjIC1WZXJzaW9uOiBCVF9Tb2xhckZfSm5QMl9SRUw2
NjQxMAorIyArVmVyc2lvbjogQlRfU29sYXJGX0puUDJfUkVMNzMxMTEKKyMgIAorIyAgRmlsZTpp
bnRlbC9pYnQtMDI5MS0wMjkxLnNmaQorIyAtVmVyc2lvbjogQlRfR2FsZVBlYWtfUkVMMzkwMjUK
KyMgK1ZlcnNpb246IEJUX0dhbGVQZWFrX1JFTDQ1ODk0CisjICBGaWxlOmludGVsL2lidC0wMjkx
LTAyOTEuZGRjCisjIC1WZXJzaW9uOiBCVF9HYWxlUGVha19SRUwzOTAyNQorIyArVmVyc2lvbjog
QlRfR2FsZVBlYWtfUkVMNDU4OTQKKyMgIAorIyAgRmlsZTppbnRlbC9pYnQtMDE4MC0wMDQxLnNm
aQorIyAtVmVyc2lvbjogQlRfTWFnbmV0YXJfR2ZQMl9SRUw4MjIyMQorIyArVmVyc2lvbjogQlRf
TWFnbmV0YXJfR2ZQMl9SRUw5MTY0OAorIyAgRmlsZTppbnRlbC9pYnQtMDE4MC0wMDQxLmRkYwor
IyAtVmVyc2lvbjogQlRfTWFnbmV0YXJfR2ZQMl9SRUw4MjIyMQorIyArVmVyc2lvbjogQlRfTWFn
bmV0YXJfR2ZQMl9SRUw5MTY0OAorIyAgCisjICBGaWxlOmludGVsL2lidC0wMTgwLTQxNTAuc2Zp
CisjIC1WZXJzaW9uOiBCVF9NYWduZXRhcl9IclAyX1JFTDgyMjIxCisjICtWZXJzaW9uOiBCVF9N
YWduZXRhcl9KblAyX1JFTDkxNjQ4CisjICBGaWxlOmludGVsL2lidC0wMTgwLTQxNTAuZGRjCisj
IC1WZXJzaW9uOiBCVF9NYWduZXRhcl9IclAyX1JFTDgyMjIxCisjICtWZXJzaW9uOiBCVF9NYWdu
ZXRhcl9KblAyX1JFTDkxNjQ4CisjICAKKyMgIEZpbGU6aW50ZWwvaWJ0LTAxODAtMTA1MC5zZmkK
KyMgLVZlcnNpb246IEJUX01hZ25ldGFyX0hyUDFfUkVMODIyMjEKKyMgK1ZlcnNpb246IEJUX01h
Z25ldGFyX0hyUDFfUkVMOTE2NDgKKyMgIEZpbGU6aW50ZWwvaWJ0LTAxODAtMTA1MC5kZGMKKyMg
LVZlcnNpb246IEJUX01hZ25ldGFyX0hyUDFfUkVMODIyMjEKKyMgK1ZlcnNpb246IEJUX01hZ25l
dGFyX0hyUDFfUkVMOTE2NDgKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUg
TElDRU5DRS5pYnRfZmlybXdhcmUgZm9yIGRldGFpbHMKKyMgIAorIyBAQCAtMzk4NCw3ICs0MDM3
LDcgQEAKKyMgIFJhd0ZpbGU6IGFtZC11Y29kZS9taWNyb2NvZGVfYW1kX2ZhbTE2aC5iaW4KKyMg
IFZlcnNpb246IDIwMTQtMTAtMjgKKyMgIFJhd0ZpbGU6IGFtZC11Y29kZS9taWNyb2NvZGVfYW1k
X2ZhbTE3aC5iaW4KKyMgLVZlcnNpb246IDIwMjMtMDctMTkKKyMgK1ZlcnNpb246IDIwMjMtMTIt
MDUKKyMgIFJhd0ZpbGU6IGFtZC11Y29kZS9taWNyb2NvZGVfYW1kX2ZhbTE5aC5iaW4KKyMgIFZl
cnNpb246IDIwMjMtMTAtMTkKKyMgIEZpbGU6IGFtZC11Y29kZS9SRUFETUUKKyMgQEAgLTQzNjcs
NiArNDQyMCwxNyBAQAorIyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisjICtEcml2ZXI6
IHFjYSAtIFF1YWxjb21tIEF0aGVyb3MgQmx1ZXRvb3RoIHN1cHBvcnQgZm9yIFdDTjM5ODggY2hp
cHMKKyMgKworIyArRmlsZTogcWNhL2FwYnRmdzEwLnRsdgorIyArRmlsZTogcWNhL2FwYnRmdzEx
LnRsdgorIyArRmlsZTogcWNhL2FwbnYxMC5iaW4KKyMgK0ZpbGU6IHFjYS9hcG52MTEuYmluCisj
ICsKKyMgK0xpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UucWNvbSBhbmQgcWNh
L05PVElDRS50eHQgZm9yIGRldGFpbHMKKyMgKworIyArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgKwor
IyAgRHJpdmVyOiBxY2EgLSBRdWFsY29tbSBBdGhlcm9zIEJsdWV0b290aCBzdXBwb3J0IGZvciBX
Q04zOTl4IGNoaXBzCisjICAKKyMgIEZpbGU6IHFjYS9jcmJ0ZncyMS50bHYKKyMgQEAgLTQ3ODQs
NyArNDg0OCw3IEBACisjICBWZXJzaW9uOiBETUMgQVBJL0FQQiB2ZXIgMiByZWxlYXNlIDEwIGZv
ciBNZXRlb3JsYWtlCisjICAKKyMgIEZpbGU6IGk5MTUvbXRsX2RtYy5iaW4KKyMgLVZlcnNpb246
IERNQyBBUEkvQVBCIHZlciAyIHJlbGVhc2UgMTcgZm9yIE1ldGVvcmxha2UKKyMgK1ZlcnNpb246
IERNQyBBUEkvQVBCIHZlciAyIHJlbGVhc2UgMTkgZm9yIE1ldGVvcmxha2UKKyMgIAorIyAgRmls
ZTogaTkxNS9tdGxfZ3VjXzcwLmJpbgorIyAgVmVyc2lvbjogR3VDIEFQSS9BUEIgdmVyIDcwLjEz
LjEgZm9yIE1ldGVvcmxha2UKKyMgQEAgLTUyMTIsNiArNTI3Niw0OCBAQAorIyAgRmlsZTogbnZp
ZGlhL3R1MTB4L3R5cGVjL2NjZ19zZWNvbmRhcnkuY3lhY2QKKyMgIEZpbGU6IG52aWRpYS90dTEw
eC90eXBlYy9jY2dfYm9vdC5jeWFjZAorIyAgCisjICtGaXJtd2FyZSBpbWFnZXMgbmVlZGVkIGZv
ciBHU1AtUk06CisjICsKKyMgK0ZpbGU6IG52aWRpYS90dTEwMi9nc3AvYm9vdGxvYWRlci01MzUu
MTEzLjAxLmJpbgorIyArRmlsZTogbnZpZGlhL3R1MTAyL2dzcC9ib290ZXJfbG9hZC01MzUuMTEz
LjAxLmJpbgorIyArRmlsZTogbnZpZGlhL3R1MTAyL2dzcC9ib290ZXJfdW5sb2FkLTUzNS4xMTMu
MDEuYmluCisjICtMaW5rOiBudmlkaWEvdHUxMDQvZ3NwIC0+IC4uL3R1MTAyL2dzcAorIyArTGlu
azogbnZpZGlhL3R1MTA2L2dzcCAtPiAuLi90dTEwMi9nc3AKKyMgKworIyArRmlsZTogbnZpZGlh
L3R1MTE2L2dzcC9ib290ZXJfbG9hZC01MzUuMTEzLjAxLmJpbgorIyArRmlsZTogbnZpZGlhL3R1
MTE2L2dzcC9ib290ZXJfdW5sb2FkLTUzNS4xMTMuMDEuYmluCisjICtMaW5rOiBudmlkaWEvdHUx
MTYvZ3NwL2Jvb3Rsb2FkZXItNTM1LjExMy4wMS5iaW4gLT4gLi4vLi4vdHUxMDIvZ3NwL2Jvb3Rs
b2FkZXItNTM1LjExMy4wMS5iaW4KKyMgK0xpbms6IG52aWRpYS90dTExNy9nc3AgLT4gLi4vdHUx
MTYvZ3NwCisjICsKKyMgK0ZpbGU6IG52aWRpYS9nYTEwMC9nc3AvYm9vdGxvYWRlci01MzUuMTEz
LjAxLmJpbgorIyArRmlsZTogbnZpZGlhL2dhMTAwL2dzcC9ib290ZXJfbG9hZC01MzUuMTEzLjAx
LmJpbgorIyArRmlsZTogbnZpZGlhL2dhMTAwL2dzcC9ib290ZXJfdW5sb2FkLTUzNS4xMTMuMDEu
YmluCisjICsKKyMgK0ZpbGU6IG52aWRpYS9hZDEwMi9nc3AvYm9vdGxvYWRlci01MzUuMTEzLjAx
LmJpbgorIyArRmlsZTogbnZpZGlhL2FkMTAyL2dzcC9ib290ZXJfbG9hZC01MzUuMTEzLjAxLmJp
bgorIyArRmlsZTogbnZpZGlhL2FkMTAyL2dzcC9ib290ZXJfdW5sb2FkLTUzNS4xMTMuMDEuYmlu
CisjICtMaW5rOiBudmlkaWEvYWQxMDMvZ3NwIC0+IC4uL2FkMTAyL2dzcAorIyArTGluazogbnZp
ZGlhL2FkMTA0L2dzcCAtPiAuLi9hZDEwMi9nc3AKKyMgK0xpbms6IG52aWRpYS9hZDEwNi9nc3Ag
LT4gLi4vYWQxMDIvZ3NwCisjICtMaW5rOiBudmlkaWEvYWQxMDcvZ3NwIC0+IC4uL2FkMTAyL2dz
cAorIyArCisjICtGaWxlOiBudmlkaWEvZ2ExMDIvZ3NwL2Jvb3Rsb2FkZXItNTM1LjExMy4wMS5i
aW4KKyMgK0ZpbGU6IG52aWRpYS9nYTEwMi9nc3AvYm9vdGVyX2xvYWQtNTM1LjExMy4wMS5iaW4K
KyMgK0ZpbGU6IG52aWRpYS9nYTEwMi9nc3AvYm9vdGVyX3VubG9hZC01MzUuMTEzLjAxLmJpbgor
IyArTGluazogbnZpZGlhL2dhMTAzL2dzcCAtPiAuLi9nYTEwMi9nc3AKKyMgK0xpbms6IG52aWRp
YS9nYTEwNC9nc3AgLT4gLi4vZ2ExMDIvZ3NwCisjICtMaW5rOiBudmlkaWEvZ2ExMDYvZ3NwIC0+
IC4uL2dhMTAyL2dzcAorIyArTGluazogbnZpZGlhL2dhMTA3L2dzcCAtPiAuLi9nYTEwMi9nc3AK
KyMgKworIyArRmlsZTogbnZpZGlhL3R1MTAyL2dzcC9nc3AtNTM1LjExMy4wMS5iaW4KKyMgK09y
aWdpbjogZ3NwX3R1MTB4LmJpbiBmcm9tIE5WSURJQS1MaW51eC14ODZfNjQtNTM1LjExMy4wMS5y
dW4KKyMgK0xpbms6IG52aWRpYS90dTExNi9nc3AvZ3NwLTUzNS4xMTMuMDEuYmluIC0+IC4uLy4u
L3R1MTAyL2dzcC9nc3AtNTM1LjExMy4wMS5iaW4KKyMgK0xpbms6IG52aWRpYS9nYTEwMC9nc3Av
Z3NwLTUzNS4xMTMuMDEuYmluIC0+IC4uLy4uL3R1MTAyL2dzcC9nc3AtNTM1LjExMy4wMS5iaW4K
KyMgKworIyArRmlsZTogbnZpZGlhL2dhMTAyL2dzcC9nc3AtNTM1LjExMy4wMS5iaW4KKyMgK09y
aWdpbjogZ3NwX2dhMTB4LmJpbiBmcm9tIE5WSURJQS1MaW51eC14ODZfNjQtNTM1LjExMy4wMS5y
dW4KKyMgK0xpbms6IG52aWRpYS9hZDEwMi9nc3AvZ3NwLTUzNS4xMTMuMDEuYmluIC0+IC4uLy4u
L2dhMTAyL2dzcC9nc3AtNTM1LjExMy4wMS5iaW4KKyMgKworIyAgTGljZW5jZTogUmVkaXN0cmli
dXRhYmxlLiBTZWUgTElDRU5DRS5udmlkaWEgZm9yIGRldGFpbHMKKyMgIAorIyAgLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KKyMgQEAgLTU0NTIsOSArNTU1OCw5IEBACisjICBEcml2ZXI6IG10NzkyMSAtIE1l
ZGlhVGVrIE1UNzkyMSBXaXJlbGVzcyBNQUNzCisjICAKKyMgIEZpbGU6IG1lZGlhdGVrL1dJRklf
TVQ3OTYxX3BhdGNoX21jdV8xXzJfaGRyLmJpbgorIyAtVmVyc2lvbjogMjAyMzA1MjYxMzA5MTdh
CisjICtWZXJzaW9uOiAyMDIzMTEwOTE5MDkxOGEKKyMgIEZpbGU6IG1lZGlhdGVrL1dJRklfUkFN
X0NPREVfTVQ3OTYxXzEuYmluCisjIC1WZXJzaW9uOiAyMDIzMDUyNjEzMDk1OAorIyArVmVyc2lv
bjogMjAyMzExMDkxOTA5NTkKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUg
TElDRU5DRS5tZWRpYXRlayBmb3IgZGV0YWlscy4KKyMgIAorIyBAQCAtNTQ2Myw3ICs1NTY5LDcg
QEAKKyMgIERyaXZlcjogbXQ3OTIxIC0gTWVkaWFUZWsgTVQ3OTIxIGJsdWV0b290aCBjaGlwc2V0
CisjICAKKyMgIEZpbGU6IG1lZGlhdGVrL0JUX1JBTV9DT0RFX01UNzk2MV8xXzJfaGRyLmJpbgor
IyAtVmVyc2lvbjogMjAyMzA1MjYxMzEyMTQKKyMgK1ZlcnNpb246IDIwMjMxMTA5MTkxNDE2Cisj
ICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UubWVkaWF0ZWsgZm9y
IGRldGFpbHMuCisjICAKKyMgQEAgLTU0NzIsOSArNTU3OCw5IEBACisjICBEcml2ZXI6IG10Nzky
MiAtIE1lZGlhVGVrIE1UNzkyMiBXaXJlbGVzcyBNQUNzCisjICAKKyMgIEZpbGU6IG1lZGlhdGVr
L1dJRklfTVQ3OTIyX3BhdGNoX21jdV8xXzFfaGRyLmJpbgorIyAtVmVyc2lvbjogMjAyMzA2Mjcx
NDM3MDJhCisjICtWZXJzaW9uOiAyMDIzMTEyMDE4MzQwMGEKKyMgIEZpbGU6IG1lZGlhdGVrL1dJ
RklfUkFNX0NPREVfTVQ3OTIyXzEuYmluCisjIC1WZXJzaW9uOiAyMDIzMDYyNzE0Mzk0NgorIyAr
VmVyc2lvbjogMjAyMzExMjAxODM0NDEKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxl
LiBTZWUgTElDRU5DRS5tZWRpYXRlayBmb3IgZGV0YWlscy4KKyMgIAorIyBAQCAtNTQ4Myw3ICs1
NTg5LDE2IEBACisjICBEcml2ZXI6IG10NzkyMiAtIE1lZGlhVGVrIE1UNzkyMiBibHVldG9vdGgg
Y2hpcHNldAorIyAgCisjICBGaWxlOiBtZWRpYXRlay9CVF9SQU1fQ09ERV9NVDc5MjJfMV8xX2hk
ci5iaW4KKyMgLVZlcnNpb246IDIwMjMwNjI3MTQ0MjIwCisjICtWZXJzaW9uOiAyMDIzMTEyMDE4
MzYyMAorIyArCisjICtMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLm1lZGlh
dGVrIGZvciBkZXRhaWxzLgorIyArCisjICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyArCisjICtEcml2
ZXI6IG10Nzk4OCAtIE1lZGlhVGVrIE1UNzk4OCBJbnRlcm5hbCAyLjVHIEV0aGVybmV0IFBoeQor
IyArCisjICtGaWxlOiBtZWRpYXRlay9tdDc5ODgvaTJwNWdlLXBoeS1wbWIuYmluCisjICtWZXJz
aW9uOiAyMDIzMDcyOAorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNF
TkNFLm1lZGlhdGVrIGZvciBkZXRhaWxzLgorIyAgCisjIEBAIC01OTUxLDE0ICs2MDY2LDE0IEBA
CisjICAKKyMgIERyaXZlcjogaWNlIC0gSW50ZWwoUikgRXRoZXJuZXQgQ29ubmVjdGlvbiBFODAw
IFNlcmllcworIyAgCisjIC1GaWxlOiBpbnRlbC9pY2UvZGRwL2ljZS0xLjMuMzAuMC5wa2cKKyMg
LUxpbms6IGludGVsL2ljZS9kZHAvaWNlLnBrZyAtPiBpY2UtMS4zLjMwLjAucGtnCisjICtGaWxl
OiBpbnRlbC9pY2UvZGRwL2ljZS0xLjMuMzUuMC5wa2cKKyMgK0xpbms6IGludGVsL2ljZS9kZHAv
aWNlLnBrZyAtPiBpY2UtMS4zLjM1LjAucGtnCisjICBGaWxlOiBpbnRlbC9pY2UvZGRwLWxhZy9p
Y2VfbGFnLTEuMy4xLjAucGtnCisjICAKKyMgIExpY2Vuc2U6IFJlZGlzdHJpYnV0YWJsZS4gU2Vl
IExJQ0VOU0UuaWNlIGZvciBkZXRhaWxzCisjICAKKyMgLUZpbGU6IGludGVsL2ljZS9kZHAtY29t
bXMvaWNlX2NvbW1zLTEuMy40MC4wLnBrZworIyAtRmlsZTogaW50ZWwvaWNlL2RkcC13aXJlbGVz
c19lZGdlL2ljZV93aXJlbGVzc19lZGdlLTEuMy4xMC4wLnBrZworIyArRmlsZTogaW50ZWwvaWNl
L2RkcC1jb21tcy9pY2VfY29tbXMtMS4zLjQ1LjAucGtnCisjICtGaWxlOiBpbnRlbC9pY2UvZGRw
LXdpcmVsZXNzX2VkZ2UvaWNlX3dpcmVsZXNzX2VkZ2UtMS4zLjEzLjAucGtnCisjICAKKyMgIExp
Y2Vuc2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UuaWNlX2VuaGFuY2VkIGZvciBkZXRh
aWxzCisjICAKKyMgQEAgLTYwMDIsNyArNjExNyw3IEBACisjICBEcml2ZXI6IHdmeCAtIFNpbGlj
b24gTGFicyBXaS1GaSBUcmFuc2NlaXZlcgorIyAgCisjICBGaWxlOiB3Zngvd2ZtX3dmMjAwX0Mw
LnNlYworIyAtVmVyc2lvbjogMy4xNi4xCisjICtWZXJzaW9uOiAzLjE3CisjICAKKyMgIEZpbGU6
IHdmeC9icmQ0MDAxYS5wZHMKKyMgIEZpbGU6IHdmeC9icmQ4MDIyYS5wZHMKKyMgQEAgLTYxNzAs
NiArNjI4NSwyNCBAQAorIyAgTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDNj
OGM3MS5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwM2M4YzQ3LmJpbgorIyAgTGluazog
Y2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGM3Mi5iaW4gLT4gY3MzNWw0MS1kc3Ax
LXNway1wcm90LTEwM2M4YzQ4LmJpbgorIyAgTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGst
Y2FsaS0xMDNjOGM3Mi5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwM2M4YzQ4LmJpbgor
IyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGNhNC53bWZ3IC0+IGNz
MzVsNDEvdjYuODMuMC9oYWxvX2NzcGxfUkFNX3JldkIyXzI5Ljg1LjAud21mdworIyArTGluazog
Y2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDNjOGNhNC53bWZ3IC0+IGNzMzVsNDEvdjYu
ODMuMC9oYWxvX2NzcGxfUkFNX3JldkIyXzI5Ljg1LjAud21mdworIyArTGluazogY2lycnVzL2Nz
MzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGNhNy53bWZ3IC0+IGNzMzVsNDEvdjYuODMuMC9oYWxv
X2NzcGxfUkFNX3JldkIyXzI5Ljg1LjAud21mdworIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNw
MS1zcGstY2FsaS0xMDNjOGNhNy53bWZ3IC0+IGNzMzVsNDEvdjYuODMuMC9oYWxvX2NzcGxfUkFN
X3JldkIyXzI5Ljg1LjAud21mdworIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJv
dC0xMDNjOGNhNC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTAz
YzhjYTQuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4Y2E3
LndtZncgLT4gY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4Y2E0LmJpbgorIyArTGluazogY2ly
cnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDNjOGNhNy53bWZ3IC0+IGNzMzVsNDEtZHNwMS1z
cGstY2FsaS0xMDNjOGNhNC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXBy
b3QtMTAzYzhjYTcud21mdyAtPiBjczM1bDQxL3Y2LjgzLjAvaGFsb19jc3BsX1JBTV9yZXZCMl8y
OS44NS4wLndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTAzYzhj
YTcud21mdyAtPiBjczM1bDQxL3Y2LjgzLjAvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS44NS4wLndt
ZncKKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhjZjUtbDAuYmlu
CisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwM2M4Y2Y1LWwwLmJpbgor
IyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGNmNS1sMS5iaW4KKyMg
K0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTAzYzhjZjUtbDEuYmluCisjICtG
aWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4Y2Y1LXIwLmJpbgorIyArRmls
ZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDNjOGNmNS1yMC5iaW4KKyMgK0ZpbGU6
IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhjZjUtcjEuYmluCisjICtGaWxlOiBj
aXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwM2M4Y2Y1LXIxLmJpbgorIyAgRmlsZTogY2ly
cnVzL2NzMzVsNDEvdjYuMzkuMC9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjQxLjAud21mdworIyAg
TGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xN2FhMzg0Ny53bWZ3IC0+IGNzMzVs
NDEvdjYuMzkuMC9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjQxLjAud21mdworIyAgTGluazogY2ly
cnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xN2FhMzg0Ny53bWZ3IC0+IGNzMzVsNDEvdjYuMzku
MC9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjQxLjAud21mdworIyBAQCAtNjQ4Niw2ICs2NjE5LDQ2
IEBACisjICBGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwNDMzYTYwLXNwa2lk
MC1sMC5iaW4KKyMgIEZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzNhNjAt
c3BraWQwLXIwLmJpbgorIyAgRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDQz
M2E2MC1zcGtpZDAtcjAuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90
LTEwNDMxYzMzLndtZncgLT4gY3MzNWw0MS92Ni42MS4xL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjku
NjMuMS53bWZ3CisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwNDMxYzMz
LndtZncgLT4gY3MzNWw0MS92Ni42MS4xL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuNjMuMS53bWZ3
CisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMxYzAzLndtZncgLT4g
Y3MzNWw0MS92Ni44My4wL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuODUuMC53bWZ3CisjICtMaW5r
OiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwNDMxYzAzLndtZncgLT4gY3MzNWw0MS92
Ni44My4wL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuODUuMC53bWZ3CisjICtMaW5rOiBjaXJydXMv
Y3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMxYTYzLndtZncgLT4gY3MzNWw0MS92Ni44My4wL2hh
bG9fY3NwbF9SQU1fcmV2QjJfMjkuODUuMC53bWZ3CisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1k
c3AxLXNway1jYWxpLTEwNDMxYTYzLndtZncgLT4gY3MzNWw0MS92Ni44My4wL2hhbG9fY3NwbF9S
QU1fcmV2QjJfMjkuODUuMC53bWZ3CisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1w
cm90LTEwNDMxYzQzLndtZncgLT4gY3MzNWw0MS92Ni44My4wL2hhbG9fY3NwbF9SQU1fcmV2QjJf
MjkuODUuMC53bWZ3CisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwNDMx
YzQzLndtZncgLT4gY3MzNWw0MS92Ni44My4wL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuODUuMC53
bWZ3CisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMxYzAzLXNwa2lk
MC1sMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTA0MzFjMDMt
c3BraWQwLWwwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQz
MWMwMy1zcGtpZDAtcjAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxp
LTEwNDMxYzAzLXNwa2lkMC1yMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3Br
LXByb3QtMTA0MzFjMDMtc3BraWQxLWwwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNw
MS1zcGstY2FsaS0xMDQzMWMwMy1zcGtpZDEtbDAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0
MS1kc3AxLXNway1wcm90LTEwNDMxYzAzLXNwa2lkMS1yMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9j
czM1bDQxLWRzcDEtc3BrLWNhbGktMTA0MzFjMDMtc3BraWQxLXIwLmJpbgorIyArRmlsZTogY2ly
cnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMWE2My1zcGtpZDAtbDAuYmluCisjICtGaWxl
OiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwNDMxYTYzLXNwa2lkMC1sMC5iaW4KKyMg
K0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzFhNjMtc3BraWQwLXIwLmJp
bgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDQzMWE2My1zcGtpZDAt
cjAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMxYTYzLXNw
a2lkMS1sMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTA0MzFh
NjMtc3BraWQxLWwwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0x
MDQzMWE2My1zcGtpZDEtcjAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1j
YWxpLTEwNDMxYTYzLXNwa2lkMS1yMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEt
c3BrLXByb3QtMTA0MzFjMzMtc3BraWQwLWwwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEt
ZHNwMS1zcGstY2FsaS0xMDQzMWMzMy1zcGtpZDAtbDAuYmluCisjICtGaWxlOiBjaXJydXMvY3Mz
NWw0MS1kc3AxLXNway1wcm90LTEwNDMxYzMzLXNwa2lkMC1yMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1
cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTA0MzFjMzMtc3BraWQwLXIwLmJpbgorIyArRmlsZTog
Y2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMWMzMy1zcGtpZDEtbDAuYmluCisjICtG
aWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwNDMxYzMzLXNwa2lkMS1sMC5iaW4K
KyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzFjMzMtc3BraWQxLXIw
LmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDQzMWMzMy1zcGtp
ZDEtcjAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMxYzQz
LXNwa2lkMC1sMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTA0
MzFjNDMtc3BraWQwLWwwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJv
dC0xMDQzMWM0My1zcGtpZDAtcjAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNw
ay1jYWxpLTEwNDMxYzQzLXNwa2lkMC1yMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRz
cDEtc3BrLXByb3QtMTA0MzFjNDMtc3BraWQxLWwwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVs
NDEtZHNwMS1zcGstY2FsaS0xMDQzMWM0My1zcGtpZDEtbDAuYmluCisjICtGaWxlOiBjaXJydXMv
Y3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMxYzQzLXNwa2lkMS1yMC5iaW4KKyMgK0ZpbGU6IGNp
cnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTA0MzFjNDMtc3BraWQxLXIwLmJpbgorIyAgTGlu
azogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xN2FhMjMxNi53bWZ3IC0+IGNzMzVsNDEv
djYuNjEuMS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjYzLjEud21mdworIyAgTGluazogY2lycnVz
L2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xN2FhMjMxNi53bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9o
YWxvX2NzcGxfUkFNX3JldkIyXzI5LjYzLjEud21mdworIyAgTGluazogY2lycnVzL2NzMzVsNDEt
ZHNwMS1zcGstcHJvdC0xN2FhMjMxNy53bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxf
UkFNX3JldkIyXzI5LjYzLjEud21mdworIyBAQCAtNjcwNiwzICs2ODc5LDEwIEBACisjICBMaWNl
bmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLmFtbG9naWMgZm9yIGRldGFpbHMKKyMg
IAorIyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgKworIyArRHJpdmVyOiBwb3dlcnZyIC0gSW1hZ2lu
YXRpb24gVGVjaG5vbG9naWVzIFBvd2VyVlIgZ3JhcGhpY3MgZHJpdmVyCisjICsKKyMgK0ZpbGU6
IHBvd2VydnIvcm9ndWVfMzMuMTUuMTEuM192MS5mdworIyArVmVyc2lvbjogMS4wLk9TQDY1MDM3
MjUKKyMgKworIyArTGljZW5zZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5wb3dlcnZy
IGZvciBkZXRhaWxzCisjIAorIworCiBTVU1NQVJZID0gIkZpcm13YXJlIGZpbGVzIGZvciB1c2Ug
d2l0aCBMaW51eCBrZXJuZWwiCiBIT01FUEFHRSA9ICJodHRwczovL3d3dy5rZXJuZWwub3JnLyIK
IERFU0NSSVBUSU9OID0gIkxpbnV4IGZpcm13YXJlIGlzIGEgcGFja2FnZSBkaXN0cmlidXRlZCBh
bG9uZ3NpZGUgdGhlIExpbnV4IGtlcm5lbCBcCkBAIC0xNDcsNyArNjUxLDcgQEAgTElDX0ZJTEVT
X0NIS1NVTSA9ICJmaWxlOi8vTElDRU5DRS5BYmlsaXM7bWQ1PWI1ZWUzZjQxMDc4MGU1NjcxMWFk
NDhlYWRjMjJiOGJjIFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOQ0UueGM0MDAw
O21kNT0wZmY1MWQyZGM0OWZjZTA0ODE0YzkxNTUwODEwOTJmMCBcCiAgICAgICAgICAgICAgICAg
ICAgIGZpbGU6Ly9MSUNFTkNFLnhjNTAwMDttZDU9MWUxNzBjMTMxNzUzMjNjMzJjN2Y0ZDA5OThk
NTNmNjYgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5DRS54YzUwMDBjO21kNT0x
MmIwMmVmYTMwNDlkYjY1ZDUyNGFlYjQxOGRkODdjYSBcCi0gICAgICAgICAgICAgICAgICAgIGZp
bGU6Ly9XSEVOQ0U7bWQ1PSR7V0hFTkNFX0NIS1NVTX0gXAorICAgICAgICAgICAgICAgICAgICBm
aWxlOi8vV0hFTkNFO21kNT0zMTEzYzRlYTA4ZTUxNzE1NTVmM2JmNDllY2ViNWIwNyBcCiAgICAg
ICAgICAgICAgICAgICAgICIKICMgV0hFTkNFIGNoZWNrc3VtIGlzIGRlZmluZWQgc2VwYXJhdGVs
eSB0byBlYXNlIG92ZXJyaWRpbmcgaXQgaWYKICMgY2xhc3MtZGV2dXBzdHJlYW0gaXMgc2VsZWN0
ZWQuCkBAIC0yMzcsNyArNzQxLDcgQEAgU1JDX1VSSTpjbGFzcy1kZXZ1cHN0cmVhbSA9ICJnaXQ6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvZmlybXcKICMgUGluIHRo
aXMgdG8gdGhlIDIwMjIwNTA5IHJlbGVhc2UsIG92ZXJyaWRlIHRoaXMgaW4gbG9jYWwuY29uZgog
U1JDUkVWOmNsYXNzLWRldnVwc3RyZWFtID89ICJiMTljYmRjYTc4YWIyYWRmZDIxMGM5MWJlMTVh
MjI1NjhlOGI4Y2FlIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYzk4ZDIwMGZjNGEzMTIwZGUx
YTU5NDcxM2NlMzRlMTM1ODE5ZGZmMjNlODgzYTRlZDM4Nzg2M2JhMjU2NzljNyIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICI5NmFmN2U0YjVlYWJkMzc4NjljZGIzZGNiYjdhYjM2OTExMTA2ZDM5Yjc2
ZTc5OWZhMWNhYWIxNmE5ZGJlOGJiIgogCiBpbmhlcml0IGFsbGFyY2gKIAotLSAKMi40Mi4wCgo=

--===============0433085120061299457==--

