Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C500DC47DA7
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 13:12:05 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.4607.1704114721083144549
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 05:12:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Fz65HFOX;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=AQE5Jzj4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018cc5270e94-2d3b1103-17f6-4408-b22d-56ac0f003140-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1704114720;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6+dOqW5jqGFFumhmHei7fcnlhPMaIdHVknEnJNobKuA=;
	b=Fz65HFOXiKr1n41Y2GrNfp4AgrzTGSyRKwJvXAtMP00TT2rto27IdyWvtdmoBWzg
	u0fX2xwmaVpQCFj1th092LG9g5vtXP8nYPbW3otFekMsP5y24NeFpflZzkJbBGgDfL1
	UZwb5dSwfiMHAN/5/XVYcTAjJ7qK77EhkZWbMyb4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1704114720;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6+dOqW5jqGFFumhmHei7fcnlhPMaIdHVknEnJNobKuA=;
	b=AQE5Jzj4O3ejvPhHbYsvrpeH1FPTdylGPJwoLW0wCfK+rnNr5if0F0W3vtRcADOX
	620NYY/jYjP0turV1VxhWVIWof1iIiXpAgAql22A/wL0/Isp6QfeqmWbfZsLFYS0La/
	gWAsp7RxTX4Qx6/OVU0th6dYZ+kk3+Ym/F5bmFH8=
Content-Type: multipart/mixed; boundary="===============9010683765224970444=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] linux-firmware: upgrading to 20231211 FAILED
Message-ID: <0101018cc5270e94-2d3b1103-17f6-4408-b22d-56ac0f003140-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jan 2024 13:12:00 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 13:12:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193177

--===============9010683765224970444==
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
From 8b8cb7a4589f8631ae80acb7e64b5b6426d38adb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jan 2024 10:21:07 +0000
Subject: [PATCH] linux-firmware: upgrade 20231030 -> 20231211

---
 ...20231030.bb => linux-firmware_20231211.bb} | 508 +++++++++++++++++-
 1 file changed, 506 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20231030.bb => linux-firmware_20231211.bb} (79%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb
similarity index 79%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb
index 6667f00612..39d1cd27f8 100644
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


--===============9010683765224970444==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-linux-firmware-upgrade-20231030-20231211.patch"

RnJvbSA4YjhjYjdhNDU4OWY4NjMxYWU4MGFjYjdlNjRiNWI2NDI2ZDM4YWRiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKYW4gMjAyNCAxMDoyMTowNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
bnV4LWZpcm13YXJlOiB1cGdyYWRlIDIwMjMxMDMwIC0+IDIwMjMxMjExCgotLS0KIC4uLjIwMjMx
MDMwLmJiID0+IGxpbnV4LWZpcm13YXJlXzIwMjMxMjExLmJifSB8IDUwOCArKysrKysrKysrKysr
KysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA1MDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL3tsaW51eC1maXJtd2Fy
ZV8yMDIzMTAzMC5iYiA9PiBsaW51eC1maXJtd2FyZV8yMDIzMTIxMS5iYn0gKDc5JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJl
XzIwMjMxMDMwLmJiIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1m
aXJtd2FyZV8yMDIzMTIxMS5iYgpzaW1pbGFyaXR5IGluZGV4IDc5JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlXzIwMjMxMDMwLmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13
YXJlXzIwMjMxMjExLmJiCmluZGV4IDY2NjdmMDA2MTIuLjM5ZDFjZDI3ZjggMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgtZmlybXdhcmVfMjAyMzEw
MzAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJt
d2FyZV8yMDIzMTIxMS5iYgpAQCAtMSwzICsxLDUwNyBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxF
U19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgor
IyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhl
IG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYg
bmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2Fn
ZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRl
OiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0t
IFdIRU5DRQorIyArKysgV0hFTkNFCisjIEBAIC01MzYsMTQgKzUzNiwxNCBAQAorIyAgCisjICBG
aWxlOiBjeGdiNC90NGZ3LTEuMTQuNC4wLmJpbgorIyAgRmlsZTogY3hnYjQvdDRmdy0xLjE1LjM3
LjAuYmluCisjIC1GaWxlOiBjeGdiNC90NGZ3LTEuMjcuNC4wLmJpbgorIyAtTGluazogY3hnYjQv
dDRmdy5iaW4gLT4gdDRmdy0xLjI3LjQuMC5iaW4KKyMgK0ZpbGU6IGN4Z2I0L3Q0ZnctMS4yNy41
LjAuYmluCisjICtMaW5rOiBjeGdiNC90NGZ3LmJpbiAtPiB0NGZ3LTEuMjcuNS4wLmJpbgorIyAg
RmlsZTogY3hnYjQvdDVmdy0xLjE0LjQuMC5iaW4KKyMgIEZpbGU6IGN4Z2I0L3Q1ZnctMS4xNS4z
Ny4wLmJpbgorIyAtRmlsZTogY3hnYjQvdDVmdy0xLjI3LjQuMC5iaW4KKyMgLUxpbms6IGN4Z2I0
L3Q1ZncuYmluIC0+IHQ1ZnctMS4yNy40LjAuYmluCisjIC1GaWxlOiBjeGdiNC90NmZ3LTEuMjcu
NC4wLmJpbgorIyAtTGluazogY3hnYjQvdDZmdy5iaW4gLT4gdDZmdy0xLjI3LjQuMC5iaW4KKyMg
K0ZpbGU6IGN4Z2I0L3Q1ZnctMS4yNy41LjAuYmluCisjICtMaW5rOiBjeGdiNC90NWZ3LmJpbiAt
PiB0NWZ3LTEuMjcuNS4wLmJpbgorIyArRmlsZTogY3hnYjQvdDZmdy0xLjI3LjUuMC5iaW4KKyMg
K0xpbms6IGN4Z2I0L3Q2ZncuYmluIC0+IHQ2ZnctMS4yNy41LjAuYmluCisjICBGaWxlOiBjeGdi
NC9hcTEyMDJfZncuY2xkCisjICBGaWxlOiBjeGdiNC9iY204NDgzLmJpbgorIyAgRmlsZTogY3hn
YjQvY29uZmlncy90NC1jb25maWctZGVmYXVsdC50eHQKKyMgQEAgLTEwMTcsMjIgKzEwMTcsMjIg
QEAKKyMgIFZlcnNpb246IDc0LmE1ZTk1ODhiLjAKKyMgIAorIyAgRmlsZTogaXdsd2lmaS1jYy1h
MC03Ny51Y29kZQorIyAtVmVyc2lvbjogNzQuYmQwNjc0MjkuMAorIyArVmVyc2lvbjogNzQuYWQ0
NmM5OGIuMAorIyAgCisjICBGaWxlOiBpd2x3aWZpLVF1LWIwLWhyLWIwLTc3LnVjb2RlCisjIC1W
ZXJzaW9uOiA3NC5iZDA2NzQyOS4wCisjICtWZXJzaW9uOiA3NC5hZDQ2Yzk4Yi4wCisjICAKKyMg
IEZpbGU6IGl3bHdpZmktUXUtYjAtamYtYjAtNzcudWNvZGUKKyMgLVZlcnNpb246IDc0LmJkMDY3
NDI5LjAKKyMgK1ZlcnNpb246IDc0LmFkNDZjOThiLjAKKyMgIAorIyAgRmlsZTogaXdsd2lmaS1R
dS1jMC1oci1iMC03Ny51Y29kZQorIyAtVmVyc2lvbjogNzQuYmQwNjc0MjkuMAorIyArVmVyc2lv
bjogNzQuYWQ0NmM5OGIuMAorIyAgCisjICBGaWxlOiBpd2x3aWZpLVF1LWMwLWpmLWIwLTc3LnVj
b2RlCisjIC1WZXJzaW9uOiA3NC5iZDA2NzQyOS4wCisjICtWZXJzaW9uOiA3NC5hZDQ2Yzk4Yi4w
CisjICAKKyMgIEZpbGU6IGl3bHdpZmktUXVaLWEwLWhyLWIwLTc3LnVjb2RlCisjIC1WZXJzaW9u
OiA3NC5iZDA2NzQyLjAKKyMgK1ZlcnNpb246IDc0LmFkNDZjOThiLjAKKyMgIAorIyAgRmlsZTog
aXdsd2lmaS1RdVotYTAtamYtYjAtNzcudWNvZGUKKyMgIFZlcnNpb246IDc0LjIwNmIwMTg0LjAK
KyMgQEAgLTEwNTUsNiArMTA1NSw5IEBACisjICBGaWxlOiBpd2x3aWZpLXR5LWEwLWdmLWEwLTg0
LnVjb2RlCisjICBWZXJzaW9uOiA4MS44ZTVjNTQ0Yy4wCisjICAKKyMgK0ZpbGU6IGl3bHdpZmkt
dHktYTAtZ2YtYTAtODYudWNvZGUKKyMgK1ZlcnNpb246IDgzLmZiNWM5YWViLjAKKyMgKworIyAg
RmlsZTogaXdsd2lmaS1zby1hMC1nZjQtYTAtNzcudWNvZGUKKyMgIFZlcnNpb246IDc0LmY5MmI1
ZmVkLjAKKyMgIAorIyBAQCAtMTA3Myw2ICsxMDc2LDkgQEAKKyMgIEZpbGU6IGl3bHdpZmktc28t
YTAtZ2Y0LWEwLTg0LnVjb2RlCisjICBWZXJzaW9uOiA4MS44ZTVjNTQ0Yy4wCisjICAKKyMgK0Zp
bGU6IGl3bHdpZmktc28tYTAtZ2Y0LWEwLTg2LnVjb2RlCisjICtWZXJzaW9uOiA4My5mYjVjOWFl
Yi4wCisjICsKKyMgIEZpbGU6IGl3bHdpZmktc28tYTAtZ2YtYTAtNzcudWNvZGUKKyMgIFZlcnNp
b246IDc0LmY5MmI1ZmVkLjAKKyMgIAorIyBAQCAtMTA5MSw2ICsxMDk3LDkgQEAKKyMgIEZpbGU6
IGl3bHdpZmktc28tYTAtZ2YtYTAtODQudWNvZGUKKyMgIFZlcnNpb246IDgxLjhlNWM1NDRjLjAK
KyMgIAorIyArRmlsZTogaXdsd2lmaS1zby1hMC1nZi1hMC04Ni51Y29kZQorIyArVmVyc2lvbjog
ODMuZmI1YzlhZWIuMAorIyArCisjICBGaWxlOiBpd2x3aWZpLXNvLWEwLWhyLWIwLTc3LnVjb2Rl
CisjICBWZXJzaW9uOiA3NC5mOTJiNWZlZC4wCisjICAKKyMgQEAgLTExMDYsNiArMTExNSw5IEBA
CisjICBGaWxlOiBpd2x3aWZpLXNvLWEwLWhyLWIwLTg0LnVjb2RlCisjICBWZXJzaW9uOiA4MS44
ZTVjNTQ0Yy4wCisjICAKKyMgK0ZpbGU6IGl3bHdpZmktc28tYTAtaHItYjAtODYudWNvZGUKKyMg
K1ZlcnNpb246IDgzLmZiNWM5YWViLjAKKyMgKworIyAgRmlsZTogaXdsd2lmaS1zby1hMC1qZi1i
MC03Ny51Y29kZQorIyAgVmVyc2lvbjogNzQuZjkyYjVmZWQuMAorIyAgCisjIEBAIC0xMTE0LDIw
ICsxMTI2LDMyIEBACisjICBGaWxlOiBpd2x3aWZpLWdsLWMwLWZtLWMwLTgzLnVjb2RlCisjICBW
ZXJzaW9uOiA4MC5kMjRlMDZlZC4wCisjICAKKyMgK0ZpbGU6IGl3bHdpZmktZ2wtYzAtZm0tYzAt
ODYudWNvZGUKKyMgK1ZlcnNpb246IDgzLmZiNWM5YWViLjAKKyMgKworIyAgRmlsZTogaXdsd2lm
aS1nbC1jMC1mbS1jMC5wbnZtCisjICAKKyMgIEZpbGU6IGl3bHdpZmktbWEtYjAtZ2YtYTAtODMu
dWNvZGUKKyMgIFZlcnNpb246IDgwLmQyNGUwNmVkLjAKKyMgIAorIyArRmlsZTogaXdsd2lmaS1t
YS1iMC1nZi1hMC04Ni51Y29kZQorIyArVmVyc2lvbjogODMuZmI1YzlhZWIuMAorIyArCisjICBG
aWxlOiBpd2x3aWZpLW1hLWIwLWdmLWEwLnBudm0KKyMgIAorIyAgRmlsZTogaXdsd2lmaS1tYS1i
MC1nZjQtYTAtODMudWNvZGUKKyMgIFZlcnNpb246IDgwLmQyNGUwNmVkLjAKKyMgIAorIyArRmls
ZTogaXdsd2lmaS1tYS1iMC1nZjQtYTAtODYudWNvZGUKKyMgK1ZlcnNpb246IDgzLmZiNWM5YWVi
LjAKKyMgKworIyAgRmlsZTogaXdsd2lmaS1tYS1iMC1nZjQtYTAucG52bQorIyAgCisjICBGaWxl
OiBpd2x3aWZpLW1hLWIwLWhyLWIwLTgzLnVjb2RlCisjICBWZXJzaW9uOiA4MC5kMjRlMDZlZC4w
CisjICsKKyMgK0ZpbGU6IGl3bHdpZmktbWEtYjAtaHItYjAtODYudWNvZGUKKyMgK1ZlcnNpb246
IDgzLmZiNWM5YWViLjAKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElD
RU5DRS5pd2x3aWZpX2Zpcm13YXJlIGZvciBkZXRhaWxzCisjICAKKyMgQEAgLTExNDMsNiArMTE2
NywxNiBAQAorIyAgTGluazogaW50ZWwvaXB1My1mdy5iaW4gLT4gaXJjaV9pcmNpX2Vjci1tYXN0
ZXJfMjAxNjEyMDhfMDIxM18yMDE3MDExMl8xNTAwLmJpbgorIyAgCisjICBMaWNlbmNlOiBSZWRp
c3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLmlwdTNfZmlybXdhcmUgZm9yIGRldGFpbHMKKyMgKwor
IyArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgKworIyArRHJpdmVyOiBpeHA0eHgtbnBlIC0gSW50ZWwg
SVhQNHh4IFhTY2FsZSBOZXR3b3JrIFByb2Nlc3NpbmcgRW5naW5lIChOUEUpIEZpcm13YXJlCisj
ICtGaWxlOiBpeHA0eHgvTlBFLUEKKyMgK0ZpbGU6IGl4cDR4eC9OUEUtQS1IU1MKKyMgK0ZpbGU6
IGl4cDR4eC9OUEUtQgorIyArRmlsZTogaXhwNHh4L05QRS1DCisjICtWZXJzaW9uOiBkYXRlID0g
RmVicnVhcnkgMjYsIDIwMDcKKyMgK0xpY2Vuc2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VO
U0UuaXhwNHh4IGZvciBkZXRhaWxzCisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAKKyMg
QEAgLTE5MTQsNiArMTk0OCwxNSBAQAorIyAgRmlsZTogcmFkZW9uL3NpNThfbWMuYmluCisjICAK
KyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UucmFkZW9uIGZvciBkZXRh
aWxzLgorIyArCisjICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyArCisjICtEcml2ZXI6IGVuODgxMWgg
LSBBaXJvaGEgMi41RyBFdGhlcm5ldCBQaHkKKyMgKworIyArRmlsZTogYWlyb2hhL0V0aE1EMzIu
ZG0uYmluCisjICtGaWxlOiBhaXJvaGEvRXRoTUQzMi5EU1AuYmluCisjICsKKyMgK0xpY2VuY2U6
IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UuYWlyb2hhIGZvciBkZXRhaWxzLgorIyAgCisj
ICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisjIEBAIC0zNjQ0LDYgKzM2ODcsNyBAQAorIyAgRmls
ZTogczVwLW1mYy12Ni12Mi5mdworIyAgRmlsZTogczVwLW1mYy12Ny5mdworIyAgRmlsZTogczVw
LW1mYy12OC5mdworIyArRmlsZTogczVwLW1mYy12MTIuZncKKyMgIAorIyAgTGljZW5jZTogUmVk
aXN0cmlidXRhYmxlLgorIyAgCisjIEBAIC0zNzk0LDE3ICszODM4LDE3IEBACisjICBGaWxlOmlu
dGVsL2lidC0xOS0yNDAtNC5kZGMKKyMgIFZlcnNpb246IEJUX0hhcnJpc29uUGVha19SRUw1MzQ5
NworIyAgRmlsZTppbnRlbC9pYnQtMDA0MS0wMDQxLnNmaQorIyAtVmVyc2lvbjogQlRfVHlwaG9v
blBlYWtfUkVMNjY0MTAKKyMgK1ZlcnNpb246IEJUX1R5cGhvb25QZWFrX1JFTDczMTExCisjICBG
aWxlOmludGVsL2lidC0wMDQxLTAwNDEuZGRjCisjIC1WZXJzaW9uOiBCVF9UeXBob29uUGVha19S
RUw2NjQxMAorIyArVmVyc2lvbjogQlRfVHlwaG9vblBlYWtfUkVMNzMxMTEKKyMgIEZpbGU6aW50
ZWwvaWJ0LTAwNDAtMDA0MS5zZmkKKyMgLVZlcnNpb246IEJUX1NvbGFyX0dmUDJfUkVMNjY0MTAK
KyMgK1ZlcnNpb246IEJUX1NvbGFyX0dmUDJfUkVMNzMxMTEKKyMgIEZpbGU6aW50ZWwvaWJ0LTAw
NDAtMDA0MS5kZGMKKyMgLVZlcnNpb246IEJUX1NvbGFyX0dmUDJfUkVMNjY0MTAKKyMgK1ZlcnNp
b246IEJUX1NvbGFyX0dmUDJfUkVMNzMxMTEKKyMgIEZpbGU6aW50ZWwvaWJ0LTEwNDAtMDA0MS5z
ZmkKKyMgLVZlcnNpb246IEJUX1NvbGFyRl9HZlAyX1JFTDY2NDEwCisjICtWZXJzaW9uOiBCVF9T
b2xhckZfR2ZQMl9SRUw3MzExMQorIyAgRmlsZTppbnRlbC9pYnQtMTA0MC0wMDQxLmRkYworIyAt
VmVyc2lvbjogQlRfU29sYXJGX0dmUDJfUkVMNjY0MTAKKyMgK1ZlcnNpb246IEJUX1NvbGFyRl9H
ZlAyX1JFTDczMTExCisjICAKKyMgIEZpbGU6aW50ZWwvaWJ0LTAwNDAtMTAyMC5zZmkKKyMgIFZl
cnNpb246IEJUX1NvbGFyX0pmUDFfUkVMNTk1NjQKKyMgQEAgLTM4MjQsMzQgKzM4NjgsNDMgQEAK
KyMgIEZpbGU6aW50ZWwvaWJ0LTEwNDAtMjEyMC5kZGMKKyMgIFZlcnNpb246IEJUX1NvbGFyRl9K
ZlAyX1JFTDU5NTY0CisjICAKKyMgK0ZpbGU6aW50ZWwvaWJ0LTAwNDAtMTA1MC5zZmkKKyMgK1Zl
cnNpb246IEJUX1NvbGFyX0hyUDFfUkVMNzMxMTEKKyMgK0ZpbGU6aW50ZWwvaWJ0LTAwNDAtMTA1
MC5kZGMKKyMgK1ZlcnNpb246IEJUX1NvbGFyX0hyUDFfUkVMNzMxMTEKKyMgK0ZpbGU6aW50ZWwv
aWJ0LTEwNDAtMTA1MC5zZmkKKyMgK1ZlcnNpb246IEJUX1NvbGFyRl9IclAxX1JFTDczMTExCisj
ICtGaWxlOmludGVsL2lidC0xMDQwLTEwNTAuZGRjCisjICtWZXJzaW9uOiBCVF9Tb2xhckZfSHJQ
MV9SRUw3MzExMQorIyArCisjICBGaWxlOmludGVsL2lidC0wMDQwLTQxNTAuc2ZpCisjIC1WZXJz
aW9uOiBCVF9Tb2xhcl9KblAyX1JFTDY2NDEwCisjICtWZXJzaW9uOiBCVF9Tb2xhcl9KblAyX1JF
TDczMTExCisjICBGaWxlOmludGVsL2lidC0wMDQwLTQxNTAuZGRjCisjIC1WZXJzaW9uOiBCVF9T
b2xhcl9KblAyX1JFTDY2NDEwCisjICtWZXJzaW9uOiBCVF9Tb2xhcl9KblAyX1JFTDczMTExCisj
ICBGaWxlOmludGVsL2lidC0xMDQwLTQxNTAuc2ZpCisjIC1WZXJzaW9uOiBCVF9Tb2xhckZfSm5Q
Ml9SRUw2NjQxMAorIyArVmVyc2lvbjogQlRfU29sYXJGX0puUDJfUkVMNzMxMTEKKyMgIEZpbGU6
aW50ZWwvaWJ0LTEwNDAtNDE1MC5kZGMKKyMgLVZlcnNpb246IEJUX1NvbGFyRl9KblAyX1JFTDY2
NDEwCisjICtWZXJzaW9uOiBCVF9Tb2xhckZfSm5QMl9SRUw3MzExMQorIyAgCisjICBGaWxlOmlu
dGVsL2lidC0wMjkxLTAyOTEuc2ZpCisjIC1WZXJzaW9uOiBCVF9HYWxlUGVha19SRUwzOTAyNQor
IyArVmVyc2lvbjogQlRfR2FsZVBlYWtfUkVMNDU4OTQKKyMgIEZpbGU6aW50ZWwvaWJ0LTAyOTEt
MDI5MS5kZGMKKyMgLVZlcnNpb246IEJUX0dhbGVQZWFrX1JFTDM5MDI1CisjICtWZXJzaW9uOiBC
VF9HYWxlUGVha19SRUw0NTg5NAorIyAgCisjICBGaWxlOmludGVsL2lidC0wMTgwLTAwNDEuc2Zp
CisjIC1WZXJzaW9uOiBCVF9NYWduZXRhcl9HZlAyX1JFTDgyMjIxCisjICtWZXJzaW9uOiBCVF9N
YWduZXRhcl9HZlAyX1JFTDkxNjQ4CisjICBGaWxlOmludGVsL2lidC0wMTgwLTAwNDEuZGRjCisj
IC1WZXJzaW9uOiBCVF9NYWduZXRhcl9HZlAyX1JFTDgyMjIxCisjICtWZXJzaW9uOiBCVF9NYWdu
ZXRhcl9HZlAyX1JFTDkxNjQ4CisjICAKKyMgIEZpbGU6aW50ZWwvaWJ0LTAxODAtNDE1MC5zZmkK
KyMgLVZlcnNpb246IEJUX01hZ25ldGFyX0hyUDJfUkVMODIyMjEKKyMgK1ZlcnNpb246IEJUX01h
Z25ldGFyX0puUDJfUkVMOTE2NDgKKyMgIEZpbGU6aW50ZWwvaWJ0LTAxODAtNDE1MC5kZGMKKyMg
LVZlcnNpb246IEJUX01hZ25ldGFyX0hyUDJfUkVMODIyMjEKKyMgK1ZlcnNpb246IEJUX01hZ25l
dGFyX0puUDJfUkVMOTE2NDgKKyMgIAorIyAgRmlsZTppbnRlbC9pYnQtMDE4MC0xMDUwLnNmaQor
IyAtVmVyc2lvbjogQlRfTWFnbmV0YXJfSHJQMV9SRUw4MjIyMQorIyArVmVyc2lvbjogQlRfTWFn
bmV0YXJfSHJQMV9SRUw5MTY0OAorIyAgRmlsZTppbnRlbC9pYnQtMDE4MC0xMDUwLmRkYworIyAt
VmVyc2lvbjogQlRfTWFnbmV0YXJfSHJQMV9SRUw4MjIyMQorIyArVmVyc2lvbjogQlRfTWFnbmV0
YXJfSHJQMV9SRUw5MTY0OAorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBM
SUNFTkNFLmlidF9maXJtd2FyZSBmb3IgZGV0YWlscworIyAgCisjIEBAIC0zOTg0LDcgKzQwMzcs
NyBAQAorIyAgUmF3RmlsZTogYW1kLXVjb2RlL21pY3JvY29kZV9hbWRfZmFtMTZoLmJpbgorIyAg
VmVyc2lvbjogMjAxNC0xMC0yOAorIyAgUmF3RmlsZTogYW1kLXVjb2RlL21pY3JvY29kZV9hbWRf
ZmFtMTdoLmJpbgorIyAtVmVyc2lvbjogMjAyMy0wNy0xOQorIyArVmVyc2lvbjogMjAyMy0xMi0w
NQorIyAgUmF3RmlsZTogYW1kLXVjb2RlL21pY3JvY29kZV9hbWRfZmFtMTloLmJpbgorIyAgVmVy
c2lvbjogMjAyMy0xMC0xOQorIyAgRmlsZTogYW1kLXVjb2RlL1JFQURNRQorIyBAQCAtNDM2Nyw2
ICs0NDIwLDE3IEBACisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAKKyMgK0RyaXZlcjog
cWNhIC0gUXVhbGNvbW0gQXRoZXJvcyBCbHVldG9vdGggc3VwcG9ydCBmb3IgV0NOMzk4OCBjaGlw
cworIyArCisjICtGaWxlOiBxY2EvYXBidGZ3MTAudGx2CisjICtGaWxlOiBxY2EvYXBidGZ3MTEu
dGx2CisjICtGaWxlOiBxY2EvYXBudjEwLmJpbgorIyArRmlsZTogcWNhL2FwbnYxMS5iaW4KKyMg
KworIyArTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5xY29tIGFuZCBxY2Ev
Tk9USUNFLnR4dCBmb3IgZGV0YWlscworIyArCisjICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyArCisj
ICBEcml2ZXI6IHFjYSAtIFF1YWxjb21tIEF0aGVyb3MgQmx1ZXRvb3RoIHN1cHBvcnQgZm9yIFdD
TjM5OXggY2hpcHMKKyMgIAorIyAgRmlsZTogcWNhL2NyYnRmdzIxLnRsdgorIyBAQCAtNDc4NCw3
ICs0ODQ4LDcgQEAKKyMgIFZlcnNpb246IERNQyBBUEkvQVBCIHZlciAyIHJlbGVhc2UgMTAgZm9y
IE1ldGVvcmxha2UKKyMgIAorIyAgRmlsZTogaTkxNS9tdGxfZG1jLmJpbgorIyAtVmVyc2lvbjog
RE1DIEFQSS9BUEIgdmVyIDIgcmVsZWFzZSAxNyBmb3IgTWV0ZW9ybGFrZQorIyArVmVyc2lvbjog
RE1DIEFQSS9BUEIgdmVyIDIgcmVsZWFzZSAxOSBmb3IgTWV0ZW9ybGFrZQorIyAgCisjICBGaWxl
OiBpOTE1L210bF9ndWNfNzAuYmluCisjICBWZXJzaW9uOiBHdUMgQVBJL0FQQiB2ZXIgNzAuMTMu
MSBmb3IgTWV0ZW9ybGFrZQorIyBAQCAtNTIxMiw2ICs1Mjc2LDQ4IEBACisjICBGaWxlOiBudmlk
aWEvdHUxMHgvdHlwZWMvY2NnX3NlY29uZGFyeS5jeWFjZAorIyAgRmlsZTogbnZpZGlhL3R1MTB4
L3R5cGVjL2NjZ19ib290LmN5YWNkCisjICAKKyMgK0Zpcm13YXJlIGltYWdlcyBuZWVkZWQgZm9y
IEdTUC1STToKKyMgKworIyArRmlsZTogbnZpZGlhL3R1MTAyL2dzcC9ib290bG9hZGVyLTUzNS4x
MTMuMDEuYmluCisjICtGaWxlOiBudmlkaWEvdHUxMDIvZ3NwL2Jvb3Rlcl9sb2FkLTUzNS4xMTMu
MDEuYmluCisjICtGaWxlOiBudmlkaWEvdHUxMDIvZ3NwL2Jvb3Rlcl91bmxvYWQtNTM1LjExMy4w
MS5iaW4KKyMgK0xpbms6IG52aWRpYS90dTEwNC9nc3AgLT4gLi4vdHUxMDIvZ3NwCisjICtMaW5r
OiBudmlkaWEvdHUxMDYvZ3NwIC0+IC4uL3R1MTAyL2dzcAorIyArCisjICtGaWxlOiBudmlkaWEv
dHUxMTYvZ3NwL2Jvb3Rlcl9sb2FkLTUzNS4xMTMuMDEuYmluCisjICtGaWxlOiBudmlkaWEvdHUx
MTYvZ3NwL2Jvb3Rlcl91bmxvYWQtNTM1LjExMy4wMS5iaW4KKyMgK0xpbms6IG52aWRpYS90dTEx
Ni9nc3AvYm9vdGxvYWRlci01MzUuMTEzLjAxLmJpbiAtPiAuLi8uLi90dTEwMi9nc3AvYm9vdGxv
YWRlci01MzUuMTEzLjAxLmJpbgorIyArTGluazogbnZpZGlhL3R1MTE3L2dzcCAtPiAuLi90dTEx
Ni9nc3AKKyMgKworIyArRmlsZTogbnZpZGlhL2dhMTAwL2dzcC9ib290bG9hZGVyLTUzNS4xMTMu
MDEuYmluCisjICtGaWxlOiBudmlkaWEvZ2ExMDAvZ3NwL2Jvb3Rlcl9sb2FkLTUzNS4xMTMuMDEu
YmluCisjICtGaWxlOiBudmlkaWEvZ2ExMDAvZ3NwL2Jvb3Rlcl91bmxvYWQtNTM1LjExMy4wMS5i
aW4KKyMgKworIyArRmlsZTogbnZpZGlhL2FkMTAyL2dzcC9ib290bG9hZGVyLTUzNS4xMTMuMDEu
YmluCisjICtGaWxlOiBudmlkaWEvYWQxMDIvZ3NwL2Jvb3Rlcl9sb2FkLTUzNS4xMTMuMDEuYmlu
CisjICtGaWxlOiBudmlkaWEvYWQxMDIvZ3NwL2Jvb3Rlcl91bmxvYWQtNTM1LjExMy4wMS5iaW4K
KyMgK0xpbms6IG52aWRpYS9hZDEwMy9nc3AgLT4gLi4vYWQxMDIvZ3NwCisjICtMaW5rOiBudmlk
aWEvYWQxMDQvZ3NwIC0+IC4uL2FkMTAyL2dzcAorIyArTGluazogbnZpZGlhL2FkMTA2L2dzcCAt
PiAuLi9hZDEwMi9nc3AKKyMgK0xpbms6IG52aWRpYS9hZDEwNy9nc3AgLT4gLi4vYWQxMDIvZ3Nw
CisjICsKKyMgK0ZpbGU6IG52aWRpYS9nYTEwMi9nc3AvYm9vdGxvYWRlci01MzUuMTEzLjAxLmJp
bgorIyArRmlsZTogbnZpZGlhL2dhMTAyL2dzcC9ib290ZXJfbG9hZC01MzUuMTEzLjAxLmJpbgor
IyArRmlsZTogbnZpZGlhL2dhMTAyL2dzcC9ib290ZXJfdW5sb2FkLTUzNS4xMTMuMDEuYmluCisj
ICtMaW5rOiBudmlkaWEvZ2ExMDMvZ3NwIC0+IC4uL2dhMTAyL2dzcAorIyArTGluazogbnZpZGlh
L2dhMTA0L2dzcCAtPiAuLi9nYTEwMi9nc3AKKyMgK0xpbms6IG52aWRpYS9nYTEwNi9nc3AgLT4g
Li4vZ2ExMDIvZ3NwCisjICtMaW5rOiBudmlkaWEvZ2ExMDcvZ3NwIC0+IC4uL2dhMTAyL2dzcAor
IyArCisjICtGaWxlOiBudmlkaWEvdHUxMDIvZ3NwL2dzcC01MzUuMTEzLjAxLmJpbgorIyArT3Jp
Z2luOiBnc3BfdHUxMHguYmluIGZyb20gTlZJRElBLUxpbnV4LXg4Nl82NC01MzUuMTEzLjAxLnJ1
bgorIyArTGluazogbnZpZGlhL3R1MTE2L2dzcC9nc3AtNTM1LjExMy4wMS5iaW4gLT4gLi4vLi4v
dHUxMDIvZ3NwL2dzcC01MzUuMTEzLjAxLmJpbgorIyArTGluazogbnZpZGlhL2dhMTAwL2dzcC9n
c3AtNTM1LjExMy4wMS5iaW4gLT4gLi4vLi4vdHUxMDIvZ3NwL2dzcC01MzUuMTEzLjAxLmJpbgor
IyArCisjICtGaWxlOiBudmlkaWEvZ2ExMDIvZ3NwL2dzcC01MzUuMTEzLjAxLmJpbgorIyArT3Jp
Z2luOiBnc3BfZ2ExMHguYmluIGZyb20gTlZJRElBLUxpbnV4LXg4Nl82NC01MzUuMTEzLjAxLnJ1
bgorIyArTGluazogbnZpZGlhL2FkMTAyL2dzcC9nc3AtNTM1LjExMy4wMS5iaW4gLT4gLi4vLi4v
Z2ExMDIvZ3NwL2dzcC01MzUuMTEzLjAxLmJpbgorIyArCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1
dGFibGUuIFNlZSBMSUNFTkNFLm52aWRpYSBmb3IgZGV0YWlscworIyAgCisjICAtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQorIyBAQCAtNTQ1Miw5ICs1NTU4LDkgQEAKKyMgIERyaXZlcjogbXQ3OTIxIC0gTWVk
aWFUZWsgTVQ3OTIxIFdpcmVsZXNzIE1BQ3MKKyMgIAorIyAgRmlsZTogbWVkaWF0ZWsvV0lGSV9N
VDc5NjFfcGF0Y2hfbWN1XzFfMl9oZHIuYmluCisjIC1WZXJzaW9uOiAyMDIzMDUyNjEzMDkxN2EK
KyMgK1ZlcnNpb246IDIwMjMxMTA5MTkwOTE4YQorIyAgRmlsZTogbWVkaWF0ZWsvV0lGSV9SQU1f
Q09ERV9NVDc5NjFfMS5iaW4KKyMgLVZlcnNpb246IDIwMjMwNTI2MTMwOTU4CisjICtWZXJzaW9u
OiAyMDIzMTEwOTE5MDk1OQorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBM
SUNFTkNFLm1lZGlhdGVrIGZvciBkZXRhaWxzLgorIyAgCisjIEBAIC01NDYzLDcgKzU1NjksNyBA
QAorIyAgRHJpdmVyOiBtdDc5MjEgLSBNZWRpYVRlayBNVDc5MjEgYmx1ZXRvb3RoIGNoaXBzZXQK
KyMgIAorIyAgRmlsZTogbWVkaWF0ZWsvQlRfUkFNX0NPREVfTVQ3OTYxXzFfMl9oZHIuYmluCisj
IC1WZXJzaW9uOiAyMDIzMDUyNjEzMTIxNAorIyArVmVyc2lvbjogMjAyMzExMDkxOTE0MTYKKyMg
IAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5tZWRpYXRlayBmb3Ig
ZGV0YWlscy4KKyMgIAorIyBAQCAtNTQ3Miw5ICs1NTc4LDkgQEAKKyMgIERyaXZlcjogbXQ3OTIy
IC0gTWVkaWFUZWsgTVQ3OTIyIFdpcmVsZXNzIE1BQ3MKKyMgIAorIyAgRmlsZTogbWVkaWF0ZWsv
V0lGSV9NVDc5MjJfcGF0Y2hfbWN1XzFfMV9oZHIuYmluCisjIC1WZXJzaW9uOiAyMDIzMDYyNzE0
MzcwMmEKKyMgK1ZlcnNpb246IDIwMjMxMTIwMTgzNDAwYQorIyAgRmlsZTogbWVkaWF0ZWsvV0lG
SV9SQU1fQ09ERV9NVDc5MjJfMS5iaW4KKyMgLVZlcnNpb246IDIwMjMwNjI3MTQzOTQ2CisjICtW
ZXJzaW9uOiAyMDIzMTEyMDE4MzQ0MQorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUu
IFNlZSBMSUNFTkNFLm1lZGlhdGVrIGZvciBkZXRhaWxzLgorIyAgCisjIEBAIC01NDgzLDcgKzU1
ODksMTYgQEAKKyMgIERyaXZlcjogbXQ3OTIyIC0gTWVkaWFUZWsgTVQ3OTIyIGJsdWV0b290aCBj
aGlwc2V0CisjICAKKyMgIEZpbGU6IG1lZGlhdGVrL0JUX1JBTV9DT0RFX01UNzkyMl8xXzFfaGRy
LmJpbgorIyAtVmVyc2lvbjogMjAyMzA2MjcxNDQyMjAKKyMgK1ZlcnNpb246IDIwMjMxMTIwMTgz
NjIwCisjICsKKyMgK0xpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UubWVkaWF0
ZWsgZm9yIGRldGFpbHMuCisjICsKKyMgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICsKKyMgK0RyaXZl
cjogbXQ3OTg4IC0gTWVkaWFUZWsgTVQ3OTg4IEludGVybmFsIDIuNUcgRXRoZXJuZXQgUGh5Cisj
ICsKKyMgK0ZpbGU6IG1lZGlhdGVrL210Nzk4OC9pMnA1Z2UtcGh5LXBtYi5iaW4KKyMgK1ZlcnNp
b246IDIwMjMwNzI4CisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VO
Q0UubWVkaWF0ZWsgZm9yIGRldGFpbHMuCisjICAKKyMgQEAgLTU5NTEsMTQgKzYwNjYsMTQgQEAK
KyMgIAorIyAgRHJpdmVyOiBpY2UgLSBJbnRlbChSKSBFdGhlcm5ldCBDb25uZWN0aW9uIEU4MDAg
U2VyaWVzCisjICAKKyMgLUZpbGU6IGludGVsL2ljZS9kZHAvaWNlLTEuMy4zMC4wLnBrZworIyAt
TGluazogaW50ZWwvaWNlL2RkcC9pY2UucGtnIC0+IGljZS0xLjMuMzAuMC5wa2cKKyMgK0ZpbGU6
IGludGVsL2ljZS9kZHAvaWNlLTEuMy4zNS4wLnBrZworIyArTGluazogaW50ZWwvaWNlL2RkcC9p
Y2UucGtnIC0+IGljZS0xLjMuMzUuMC5wa2cKKyMgIEZpbGU6IGludGVsL2ljZS9kZHAtbGFnL2lj
ZV9sYWctMS4zLjEuMC5wa2cKKyMgIAorIyAgTGljZW5zZTogUmVkaXN0cmlidXRhYmxlLiBTZWUg
TElDRU5TRS5pY2UgZm9yIGRldGFpbHMKKyMgIAorIyAtRmlsZTogaW50ZWwvaWNlL2RkcC1jb21t
cy9pY2VfY29tbXMtMS4zLjQwLjAucGtnCisjIC1GaWxlOiBpbnRlbC9pY2UvZGRwLXdpcmVsZXNz
X2VkZ2UvaWNlX3dpcmVsZXNzX2VkZ2UtMS4zLjEwLjAucGtnCisjICtGaWxlOiBpbnRlbC9pY2Uv
ZGRwLWNvbW1zL2ljZV9jb21tcy0xLjMuNDUuMC5wa2cKKyMgK0ZpbGU6IGludGVsL2ljZS9kZHAt
d2lyZWxlc3NfZWRnZS9pY2Vfd2lyZWxlc3NfZWRnZS0xLjMuMTMuMC5wa2cKKyMgIAorIyAgTGlj
ZW5zZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5pY2VfZW5oYW5jZWQgZm9yIGRldGFp
bHMKKyMgIAorIyBAQCAtNjAwMiw3ICs2MTE3LDcgQEAKKyMgIERyaXZlcjogd2Z4IC0gU2lsaWNv
biBMYWJzIFdpLUZpIFRyYW5zY2VpdmVyCisjICAKKyMgIEZpbGU6IHdmeC93Zm1fd2YyMDBfQzAu
c2VjCisjIC1WZXJzaW9uOiAzLjE2LjEKKyMgK1ZlcnNpb246IDMuMTcKKyMgIAorIyAgRmlsZTog
d2Z4L2JyZDQwMDFhLnBkcworIyAgRmlsZTogd2Z4L2JyZDgwMjJhLnBkcworIyBAQCAtNjE3MCw2
ICs2Mjg1LDI0IEBACisjICBMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwM2M4
YzcxLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLWNhbGktMTAzYzhjNDcuYmluCisjICBMaW5rOiBj
aXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4YzcyLmJpbiAtPiBjczM1bDQxLWRzcDEt
c3BrLXByb3QtMTAzYzhjNDguYmluCisjICBMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1j
YWxpLTEwM2M4YzcyLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLWNhbGktMTAzYzhjNDguYmluCisj
ICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4Y2E0LndtZncgLT4gY3Mz
NWw0MS92Ni44My4wL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuODUuMC53bWZ3CisjICtMaW5rOiBj
aXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwM2M4Y2E0LndtZncgLT4gY3MzNWw0MS92Ni44
My4wL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuODUuMC53bWZ3CisjICtMaW5rOiBjaXJydXMvY3Mz
NWw0MS1kc3AxLXNway1wcm90LTEwM2M4Y2E3LndtZncgLT4gY3MzNWw0MS92Ni44My4wL2hhbG9f
Y3NwbF9SQU1fcmV2QjJfMjkuODUuMC53bWZ3CisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3Ax
LXNway1jYWxpLTEwM2M4Y2E3LndtZncgLT4gY3MzNWw0MS92Ni44My4wL2hhbG9fY3NwbF9SQU1f
cmV2QjJfMjkuODUuMC53bWZ3CisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90
LTEwM2M4Y2E0LmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDNj
OGNhNC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhjYTcu
d21mdyAtPiBjczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhjYTQuYmluCisjICtMaW5rOiBjaXJy
dXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwM2M4Y2E3LndtZncgLT4gY3MzNWw0MS1kc3AxLXNw
ay1jYWxpLTEwM2M4Y2E0LmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJv
dC0xMDNjOGNhNy53bWZ3IC0+IGNzMzVsNDEvdjYuODMuMC9oYWxvX2NzcGxfUkFNX3JldkIyXzI5
Ljg1LjAud21mdworIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDNjOGNh
Ny53bWZ3IC0+IGNzMzVsNDEvdjYuODMuMC9oYWxvX2NzcGxfUkFNX3JldkIyXzI5Ljg1LjAud21m
dworIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGNmNS1sMC5iaW4K
KyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTAzYzhjZjUtbDAuYmluCisj
ICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4Y2Y1LWwxLmJpbgorIyAr
RmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDNjOGNmNS1sMS5iaW4KKyMgK0Zp
bGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhjZjUtcjAuYmluCisjICtGaWxl
OiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwM2M4Y2Y1LXIwLmJpbgorIyArRmlsZTog
Y2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGNmNS1yMS5iaW4KKyMgK0ZpbGU6IGNp
cnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTAzYzhjZjUtcjEuYmluCisjICBGaWxlOiBjaXJy
dXMvY3MzNWw0MS92Ni4zOS4wL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuNDEuMC53bWZ3CisjICBM
aW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTE3YWEzODQ3LndtZncgLT4gY3MzNWw0
MS92Ni4zOS4wL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuNDEuMC53bWZ3CisjICBMaW5rOiBjaXJy
dXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTE3YWEzODQ3LndtZncgLT4gY3MzNWw0MS92Ni4zOS4w
L2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuNDEuMC53bWZ3CisjIEBAIC02NDg2LDYgKzY2MTksNDYg
QEAKKyMgIEZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTA0MzNhNjAtc3BraWQw
LWwwLmJpbgorIyAgRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzM2E2MC1z
cGtpZDAtcjAuYmluCisjICBGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwNDMz
YTYwLXNwa2lkMC1yMC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3Qt
MTA0MzFjMzMud21mdyAtPiBjczM1bDQxL3Y2LjYxLjEvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS42
My4xLndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTA0MzFjMzMu
d21mdyAtPiBjczM1bDQxL3Y2LjYxLjEvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS42My4xLndtZncK
KyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzFjMDMud21mdyAtPiBj
czM1bDQxL3Y2LjgzLjAvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS44NS4wLndtZncKKyMgK0xpbms6
IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTA0MzFjMDMud21mdyAtPiBjczM1bDQxL3Y2
LjgzLjAvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS44NS4wLndtZncKKyMgK0xpbms6IGNpcnJ1cy9j
czM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzFhNjMud21mdyAtPiBjczM1bDQxL3Y2LjgzLjAvaGFs
b19jc3BsX1JBTV9yZXZCMl8yOS44NS4wLndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRz
cDEtc3BrLWNhbGktMTA0MzFhNjMud21mdyAtPiBjczM1bDQxL3Y2LjgzLjAvaGFsb19jc3BsX1JB
TV9yZXZCMl8yOS44NS4wLndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXBy
b3QtMTA0MzFjNDMud21mdyAtPiBjczM1bDQxL3Y2LjgzLjAvaGFsb19jc3BsX1JBTV9yZXZCMl8y
OS44NS4wLndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTA0MzFj
NDMud21mdyAtPiBjczM1bDQxL3Y2LjgzLjAvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS44NS4wLndt
ZncKKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzFjMDMtc3BraWQw
LWwwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDQzMWMwMy1z
cGtpZDAtbDAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMx
YzAzLXNwa2lkMC1yMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGkt
MTA0MzFjMDMtc3BraWQwLXIwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGst
cHJvdC0xMDQzMWMwMy1zcGtpZDEtbDAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3Ax
LXNway1jYWxpLTEwNDMxYzAzLXNwa2lkMS1sMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQx
LWRzcDEtc3BrLXByb3QtMTA0MzFjMDMtc3BraWQxLXIwLmJpbgorIyArRmlsZTogY2lycnVzL2Nz
MzVsNDEtZHNwMS1zcGstY2FsaS0xMDQzMWMwMy1zcGtpZDEtcjAuYmluCisjICtGaWxlOiBjaXJy
dXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMxYTYzLXNwa2lkMC1sMC5iaW4KKyMgK0ZpbGU6
IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTA0MzFhNjMtc3BraWQwLWwwLmJpbgorIyAr
RmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMWE2My1zcGtpZDAtcjAuYmlu
CisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwNDMxYTYzLXNwa2lkMC1y
MC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzFhNjMtc3Br
aWQxLWwwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDQzMWE2
My1zcGtpZDEtbDAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEw
NDMxYTYzLXNwa2lkMS1yMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNh
bGktMTA0MzFhNjMtc3BraWQxLXIwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1z
cGstcHJvdC0xMDQzMWMzMy1zcGtpZDAtbDAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1k
c3AxLXNway1jYWxpLTEwNDMxYzMzLXNwa2lkMC1sMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1
bDQxLWRzcDEtc3BrLXByb3QtMTA0MzFjMzMtc3BraWQwLXIwLmJpbgorIyArRmlsZTogY2lycnVz
L2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDQzMWMzMy1zcGtpZDAtcjAuYmluCisjICtGaWxlOiBj
aXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMxYzMzLXNwa2lkMS1sMC5iaW4KKyMgK0Zp
bGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTA0MzFjMzMtc3BraWQxLWwwLmJpbgor
IyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMWMzMy1zcGtpZDEtcjAu
YmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwNDMxYzMzLXNwa2lk
MS1yMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzFjNDMt
c3BraWQwLWwwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDQz
MWM0My1zcGtpZDAtbDAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90
LTEwNDMxYzQzLXNwa2lkMC1yMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3Br
LWNhbGktMTA0MzFjNDMtc3BraWQwLXIwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNw
MS1zcGstcHJvdC0xMDQzMWM0My1zcGtpZDEtbDAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0
MS1kc3AxLXNway1jYWxpLTEwNDMxYzQzLXNwa2lkMS1sMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9j
czM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzFjNDMtc3BraWQxLXIwLmJpbgorIyArRmlsZTogY2ly
cnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDQzMWM0My1zcGtpZDEtcjAuYmluCisjICBMaW5r
OiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTE3YWEyMzE2LndtZncgLT4gY3MzNWw0MS92
Ni42MS4xL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuNjMuMS53bWZ3CisjICBMaW5rOiBjaXJydXMv
Y3MzNWw0MS1kc3AxLXNway1jYWxpLTE3YWEyMzE2LndtZncgLT4gY3MzNWw0MS92Ni42MS4xL2hh
bG9fY3NwbF9SQU1fcmV2QjJfMjkuNjMuMS53bWZ3CisjICBMaW5rOiBjaXJydXMvY3MzNWw0MS1k
c3AxLXNway1wcm90LTE3YWEyMzE3LndtZncgLT4gY3MzNWw0MS92Ni42MS4xL2hhbG9fY3NwbF9S
QU1fcmV2QjJfMjkuNjMuMS53bWZ3CisjIEBAIC02NzA2LDMgKzY4NzksMTAgQEAKKyMgIExpY2Vu
Y2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UuYW1sb2dpYyBmb3IgZGV0YWlscworIyAg
CisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyArCisjICtEcml2ZXI6IHBvd2VydnIgLSBJbWFnaW5h
dGlvbiBUZWNobm9sb2dpZXMgUG93ZXJWUiBncmFwaGljcyBkcml2ZXIKKyMgKworIyArRmlsZTog
cG93ZXJ2ci9yb2d1ZV8zMy4xNS4xMS4zX3YxLmZ3CisjICtWZXJzaW9uOiAxLjAuT1NANjUwMzcy
NQorIyArCisjICtMaWNlbnNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLnBvd2VydnIg
Zm9yIGRldGFpbHMKKyMgCisjCisKIFNVTU1BUlkgPSAiRmlybXdhcmUgZmlsZXMgZm9yIHVzZSB3
aXRoIExpbnV4IGtlcm5lbCIKIEhPTUVQQUdFID0gImh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvIgog
REVTQ1JJUFRJT04gPSAiTGludXggZmlybXdhcmUgaXMgYSBwYWNrYWdlIGRpc3RyaWJ1dGVkIGFs
b25nc2lkZSB0aGUgTGludXgga2VybmVsIFwKQEAgLTE0Nyw3ICs2NTEsNyBAQCBMSUNfRklMRVNf
Q0hLU1VNID0gImZpbGU6Ly9MSUNFTkNFLkFiaWxpczttZDU9YjVlZTNmNDEwNzgwZTU2NzExYWQ0
OGVhZGMyMmI4YmMgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5DRS54YzQwMDA7
bWQ1PTBmZjUxZDJkYzQ5ZmNlMDQ4MTRjOTE1NTA4MTA5MmYwIFwKICAgICAgICAgICAgICAgICAg
ICAgZmlsZTovL0xJQ0VOQ0UueGM1MDAwO21kNT0xZTE3MGMxMzE3NTMyM2MzMmM3ZjRkMDk5OGQ1
M2Y2NiBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTkNFLnhjNTAwMGM7bWQ1PTEy
YjAyZWZhMzA0OWRiNjVkNTI0YWViNDE4ZGQ4N2NhIFwKLSAgICAgICAgICAgICAgICAgICAgZmls
ZTovL1dIRU5DRTttZDU9JHtXSEVOQ0VfQ0hLU1VNfSBcCisgICAgICAgICAgICAgICAgICAgIGZp
bGU6Ly9XSEVOQ0U7bWQ1PTMxMTNjNGVhMDhlNTE3MTU1NWYzYmY0OWVjZWI1YjA3IFwKICAgICAg
ICAgICAgICAgICAgICAgIgogIyBXSEVOQ0UgY2hlY2tzdW0gaXMgZGVmaW5lZCBzZXBhcmF0ZWx5
IHRvIGVhc2Ugb3ZlcnJpZGluZyBpdCBpZgogIyBjbGFzcy1kZXZ1cHN0cmVhbSBpcyBzZWxlY3Rl
ZC4KQEAgLTIzNyw3ICs3NDEsNyBAQCBTUkNfVVJJOmNsYXNzLWRldnVwc3RyZWFtID0gImdpdDov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9maXJtdwogIyBQaW4gdGhp
cyB0byB0aGUgMjAyMjA1MDkgcmVsZWFzZSwgb3ZlcnJpZGUgdGhpcyBpbiBsb2NhbC5jb25mCiBT
UkNSRVY6Y2xhc3MtZGV2dXBzdHJlYW0gPz0gImIxOWNiZGNhNzhhYjJhZGZkMjEwYzkxYmUxNWEy
MjU2OGU4YjhjYWUiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJjOThkMjAwZmM0YTMxMjBkZTFh
NTk0NzEzY2UzNGUxMzU4MTlkZmYyM2U4ODNhNGVkMzg3ODYzYmEyNTY3OWM3IgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjk2YWY3ZTRiNWVhYmQzNzg2OWNkYjNkY2JiN2FiMzY5MTExMDZkMzliNzZl
Nzk5ZmExY2FhYjE2YTlkYmU4YmIiCiAKIGluaGVyaXQgYWxsYXJjaAogCi0tIAoyLjQyLjAKCg==

--===============9010683765224970444==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1848 entries from dependency cache.
Parsing recipes...done.
Parsing of 913 .bb files complete (912 cached, 1 parsed). 1847 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the allarch sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-e4ca5d8989cba7609734f5ec57a415d0ff6a8e9c"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:e4ca5d8989cba7609734f5ec57a415d0ff6a8e9c"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 62 Local 50 Mirrors 0 Missed 12 Current 148 (80% match, 94% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 448 of 682 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb:do_recipe_qa)
NOTE: recipe linux-firmware-1_20231211-r0: task do_recipe_qa: Started
NOTE: recipe linux-firmware-1_20231211-r0: task do_recipe_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb:do_recipe_qa unihash changed to 2b827c605e5a63ada454c4490352c04d31f8ea090bdf769cab51a3d9642e3062
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
NOTE: recipe linux-firmware-1_20231211-r0: task do_populate_lic: Started
NOTE: recipe linux-firmware-1_20231211-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe linux-firmware-1_20231211-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb:do_deploy_source_date_epoch unihash changed to b1669584a529bb764e0b0b725763ccd95d54fc98f2e64680a0b4fe0942937c9f
NOTE: recipe linux-firmware-1_20231211-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb:do_populate_lic unihash changed to cf686bded25ae5c349b4ae202fb65ff2e5382d5332690c5daad3dca19d1f8503
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
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20231211/temp/run.do_install.2073489:174 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20231211/temp/run.do_install.2073489, line 174
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20231211/temp/run.do_install.2073489, line 158
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20231211/temp/run.do_install.2073489, line 153
| 	#4: do_install, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20231211/temp/run.do_install.2073489, line 144
| 	#5: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20231211/temp/run.do_install.2073489, line 187
NOTE: recipe linux-firmware-1_20231211-r0: task do_install: Failed
NOTE: Tasks Summary: Attempted 672 tasks of which 661 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240101102032.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240101102032.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb:do_install
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: linux-firmware-1_20231211-r0 do_install: oe_runmake failed
ERROR: linux-firmware-1_20231211-r0 do_install: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20231211/temp/run.do_install.2073489', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20231211/temp/log.do_install.2073489
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb:do_install) failed with exit code '1'

--===============9010683765224970444==--

