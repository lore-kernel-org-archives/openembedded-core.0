Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B91DCC41513
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 19:45:20 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.102672.1697399114541423766
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 12:45:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=fsEdizCC;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=J4gSgFxD;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.192, mailfrom: 0101018b34df0f9c-948f3e86-c947-41c8-a150-352ff01fda28-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1697399115;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gDjtEHo2nyCaMmmSDmoAyD8iJb9RRDSkn2d/TAC1FvM=;
	b=fsEdizCCP3VYhL/IVkA33M824CcqC41IH/hbzlnU/96kP+xcPKzWRIlopgPu1wXJ
	0gCJDOHlcNk1rh/mTuDFwK1r+PYtULmtielNCcIrLdcI6S5ueHyPJ/USwOpNJCaFcos
	2Vu347gDRPD6WUsjqkX4+Ac/3mpMfseiW2cnLgvw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1697399115;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gDjtEHo2nyCaMmmSDmoAyD8iJb9RRDSkn2d/TAC1FvM=;
	b=J4gSgFxD5zxEfs1WxoP1Kev+snBykGiYCE53kSmmZay5tJrBmiskKv6pjn1Mn8vi
	vFVjxRkRg7n8BEQ/X4Vt28tVyVS4cNeVnVzXUZvQMgH540tk1dwhCcCn6BxNPzGjSo1
	VNKGgk4oR2hNhlgrO719k5v/vSCv0KVvE1hoBnKs=
Content-Type: multipart/mixed; boundary="===============4377777418540966808=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] linux-firmware: upgrading to 20230919 SUCCEEDED
Message-ID: <0101018b34df0f9c-948f3e86-c947-41c8-a150-352ff01fda28-000000@us-west-2.amazonses.com>
Date: Sun, 15 Oct 2023 19:45:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 19:45:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189244

--===============4377777418540966808==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *linux-firmware* to *20230919* has Succeeded.

Next steps:
    - apply the patch: git am 0001-linux-firmware-upgrade-20230804-20230919.patch
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
From 3007d23e0119c07a1bb8d6ddc087d5beab2ec27d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Oct 2023 18:13:37 +0000
Subject: [PATCH] linux-firmware: upgrade 20230804 -> 20230919

---
 ...20230804.bb => linux-firmware_20230919.bb} | 384 +++++++++++++++++-
 1 file changed, 382 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20230804.bb => linux-firmware_20230919.bb} (79%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230919.bb
similarity index 79%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20230919.bb
index 1dbe8374bc..00724537d0 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230919.bb
@@ -1,3 +1,383 @@
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
+# -File: cxgb4/t4fw-1.27.3.0.bin
+# -Link: cxgb4/t4fw.bin -> t4fw-1.27.3.0.bin
+# +File: cxgb4/t4fw-1.27.4.0.bin
+# +Link: cxgb4/t4fw.bin -> t4fw-1.27.4.0.bin
+#  File: cxgb4/t5fw-1.14.4.0.bin
+#  File: cxgb4/t5fw-1.15.37.0.bin
+# -File: cxgb4/t5fw-1.27.3.0.bin
+# -Link: cxgb4/t5fw.bin -> t5fw-1.27.3.0.bin
+# -File: cxgb4/t6fw-1.27.3.0.bin
+# -Link: cxgb4/t6fw.bin -> t6fw-1.27.3.0.bin
+# +File: cxgb4/t5fw-1.27.4.0.bin
+# +Link: cxgb4/t5fw.bin -> t5fw-1.27.4.0.bin
+# +File: cxgb4/t6fw-1.27.4.0.bin
+# +Link: cxgb4/t6fw.bin -> t6fw-1.27.4.0.bin
+#  File: cxgb4/aq1202_fw.cld
+#  File: cxgb4/bcm8483.bin
+#  File: cxgb4/configs/t4-config-default.txt
+# @@ -3395,10 +3395,10 @@
+#  File: ath10k/QCA9377/hw1.0/notice_ath10k_firmware-6.txt
+#  File: ath10k/WCN3990/hw1.0/board-2.bin
+#  File: ath10k/WCN3990/hw1.0/firmware-5.bin
+# -File: ath10k/WCN3990/hw1.0/wlanmdsp.mbn
+# -Link: qcom/sdm845/wlanmdsp.mbn -> ../../ath10k/WCN3990/hw1.0/wlanmdsp.mbn
+# +File: qcom/sdm845/wlanmdsp.mbn
+# +Link: ath10k/WCN3990/hw1.0/wlanmdsp.mbn -> ../../../qcom/sdm845/wlanmdsp.mbn
+#  Version: WLAN.HL.2.0-01387-QCAHLSWMTPLZ-1
+# -File: ath10k/WCN3990/hw1.0/notice.txt_wlanmdsp
+# +File: qcom/sdm845/notice.txt_wlanmdsp
+#  
+#  Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k for details
+#  
+# @@ -3697,69 +3697,69 @@
+#  File: intel/ibt-18-1.ddc
+#  Version: BT_ThunderPeak_A0_B0_REL0201
+#  File:intel/ibt-20-0-3.sfi
+# -Version: BT_CyclonePeak_A0_REL53454
+# +Version: BT_CyclonePeak_A0_REL53497
+#  File:intel/ibt-20-0-3.ddc
+# -Version: BT_CyclonePeak_A0_REL53454
+# +Version: BT_CyclonePeak_A0_REL53497
+#  File:intel/ibt-20-1-3.sfi
+# -Version: BT_CyclonePeak_A0_REL53454
+# +Version: BT_CyclonePeak_A0_REL53497
+#  File:intel/ibt-20-1-3.ddc
+# -Version: BT_CyclonePeak_A0_REL53454
+# +Version: BT_CyclonePeak_A0_REL53497
+#  File:intel/ibt-20-1-4.sfi
+# -Version: BT_CyclonePeak_A0_REL53454
+# +Version: BT_CyclonePeak_A0_REL53497
+#  File:intel/ibt-20-1-4.ddc
+# -Version: BT_CyclonePeak_A0_REL53454
+# +Version: BT_CyclonePeak_A0_REL53497
+#  File:intel/ibt-19-0-0.sfi
+# -Version: BT_Quasar_REL53454
+# +Version: BT_Quasar_REL53497
+#  File:intel/ibt-19-0-0.ddc
+# -Version: BT_Quasar_REL53454
+# +Version: BT_Quasar_REL53497
+#  File:intel/ibt-19-0-1.sfi
+# -Version: BT_Quasar_REL53454
+# +Version: BT_Quasar_REL53497
+#  File:intel/ibt-19-0-1.ddc
+# -Version: BT_Quasar_REL53454
+# +Version: BT_Quasar_REL53497
+#  File:intel/ibt-19-0-3.sfi
+#  Version: BT_Quasar_REL53263
+#  File:intel/ibt-19-0-3.ddc
+#  Version: BT_Quasar_REL53263
+#  File:intel/ibt-19-0-4.sfi
+# -Version: BT_HarrisonPeak_REL53454
+# +Version: BT_HarrisonPeak_REL53497
+#  File:intel/ibt-19-0-4.ddc
+# -Version: BT_HarrisonPeak_REL53454
+# +Version: BT_HarrisonPeak_REL53497
+#  File:intel/ibt-19-16-4.sfi
+# -Version: BT_HarrisonPeak_REL53454
+# +Version: BT_HarrisonPeak_REL53497
+#  File:intel/ibt-19-16-4.ddc
+# -Version: BT_HarrisonPeak_REL53454
+# +Version: BT_HarrisonPeak_REL53497
+#  File:intel/ibt-19-32-1.sfi
+# -Version: BT_HarrisonPeak_REL53454
+# +Version: BT_HarrisonPeak_REL53497
+#  File:intel/ibt-19-32-1.ddc
+# -Version: BT_HarrisonPeak_REL53454
+# +Version: BT_HarrisonPeak_REL53497
+#  File:intel/ibt-19-32-0.sfi
+# -Version: BT_HarrisonPeak_REL53454
+# +Version: BT_HarrisonPeak_REL53497
+#  File:intel/ibt-19-32-0.ddc
+# -Version: BT_HarrisonPeak_REL53454
+# +Version: BT_HarrisonPeak_REL53497
+#  File:intel/ibt-19-32-4.sfi
+# -Version: BT_HarrisonPeak_REL53454
+# +Version: BT_HarrisonPeak_REL53497
+#  File:intel/ibt-19-32-4.ddc
+# -Version: BT_HarrisonPeak_REL53454
+# +Version: BT_HarrisonPeak_REL53497
+#  File:intel/ibt-19-240-1.sfi
+# -Version: BT_HarrisonPeak_REL53454
+# +Version: BT_HarrisonPeak_REL53497
+#  File:intel/ibt-19-240-1.ddc
+# -Version: BT_HarrisonPeak_REL53454
+# +Version: BT_HarrisonPeak_REL53497
+#  File:intel/ibt-19-240-4.sfi
+# -Version: BT_HarrisonPeak_REL53454
+# +Version: BT_HarrisonPeak_REL53497
+#  File:intel/ibt-19-240-4.ddc
+# -Version: BT_HarrisonPeak_REL53454
+# +Version: BT_HarrisonPeak_REL53497
+#  File:intel/ibt-0041-0041.sfi
+# -Version: BT_TyphoonPeak_REL67068
+# +Version: BT_TyphoonPeak_REL68350
+#  File:intel/ibt-0041-0041.ddc
+# -Version: BT_TyphoonPeak_REL67068
+# +Version: BT_TyphoonPeak_REL68350
+#  File:intel/ibt-0040-0041.sfi
+# -Version: BT_Solar_GfP2_REL67068
+# +Version: BT_Solar_GfP2_REL68350
+#  File:intel/ibt-0040-0041.ddc
+# -Version: BT_Solar_GfP2_REL67068
+# +Version: BT_Solar_GfP2_REL68350
+#  File:intel/ibt-1040-0041.sfi
+# -Version: BT_SolarF_GfP2_REL67068
+# +Version: BT_SolarF_GfP2_REL68350
+#  File:intel/ibt-1040-0041.ddc
+# -Version: BT_SolarF_GfP2_REL67068
+# +Version: BT_SolarF_GfP2_REL68350
+#  
+#  File:intel/ibt-0040-1020.sfi
+#  Version: BT_Solar_JfP1_REL59564
+# @@ -3780,13 +3780,13 @@
+#  Version: BT_SolarF_JfP2_REL59564
+#  
+#  File:intel/ibt-0040-4150.sfi
+# -Version: BT_Solar_JnP2_REL67068
+# +Version: BT_Solar_JnP2_REL68350
+#  File:intel/ibt-0040-4150.ddc
+# -Version: BT_Solar_JnP2_REL67068
+# +Version: BT_Solar_JnP2_REL68350
+#  File:intel/ibt-1040-4150.sfi
+# -Version: BT_SolarF_JnP2_REL67068
+# +Version: BT_SolarF_JnP2_REL68350
+#  File:intel/ibt-1040-4150.ddc
+# -Version: BT_SolarF_JnP2_REL67068
+# +Version: BT_SolarF_JnP2_REL68350
+#  
+#  Licence: Redistributable. See LICENCE.ibt_firmware for details
+#  
+# @@ -3822,6 +3822,7 @@
+#  File: rtl_bt/rtl8852bu_fw.bin
+#  File: rtl_bt/rtl8852bu_config.bin
+#  File: rtl_bt/rtl8852cu_fw.bin
+# +File: rtl_bt/rtl8852cu_fw_v2.bin
+#  File: rtl_bt/rtl8852cu_config.bin
+#  File: rtl_bt/rtl8851bu_fw.bin
+#  File: rtl_bt/rtl8851bu_config.bin
+# @@ -3901,7 +3902,9 @@
+#  File: amd/amd_sev_fam17h_model3xh.sbin
+#  Version: 2022-2-25
+#  File: amd/amd_sev_fam19h_model0xh.sbin
+# -Version: 2022-2-25
+# +Version: 2023-8-23
+# +File: amd/amd_sev_fam19h_model1xh.sbin
+# +Version: 2023-8-23
+#  
+#  License: Redistributable. See LICENSE.amd-sev for details
+#  
+# @@ -3909,21 +3912,16 @@
+#  
+#  Driver: microcode_amd - AMD CPU Microcode Update Driver for Linux
+#  
+# -File: amd-ucode/microcode_amd.bin
+# -Raw: amd-ucode/microcode_amd.bin
+# +RawFile: amd-ucode/microcode_amd.bin
+#  Version: 2013-07-10
+# -File: amd-ucode/microcode_amd_fam15h.bin
+# -Raw: amd-ucode/microcode_amd_fam15h.bin
+# +RawFile: amd-ucode/microcode_amd_fam15h.bin
+#  Version: 2018-05-24
+# -File: amd-ucode/microcode_amd_fam16h.bin
+# -Raw: amd-ucode/microcode_amd_fam16h.bin
+# +RawFile: amd-ucode/microcode_amd_fam16h.bin
+#  Version: 2014-10-28
+# -File: amd-ucode/microcode_amd_fam17h.bin
+# -Raw: amd-ucode/microcode_amd_fam17h.bin
+# +RawFile: amd-ucode/microcode_amd_fam17h.bin
+#  Version: 2023-07-19
+# -File: amd-ucode/microcode_amd_fam19h.bin
+# -Raw: amd-ucode/microcode_amd_fam19h.bin
+# -Version: 2023-07-18
+# +RawFile: amd-ucode/microcode_amd_fam19h.bin
+# +Version: 2023-08-08
+#  File: amd-ucode/README
+#  
+#  License: Redistributable. See LICENSE.amd-ucode for details
+# @@ -4721,13 +4719,16 @@
+#  Version: DMC API/APB ver 2 release 10 for Meteorlake
+#  
+#  File: i915/mtl_dmc.bin
+# -Version: DMC API/APB ver 2 release 13 for Meteorlake
+# +Version: DMC API/APB ver 2 release 16 for Meteorlake
+#  
+#  File: i915/mtl_guc_70.bin
+#  Version: GuC API/APB ver 70.8.0 for Meteorlake
+#  
+#  File: i915/mtl_huc_gsc.bin
+# -Version: HuC API/APB ver 8.5.1 for Meteorlake
+# +Version: HuC API/APB ver 8.5.4 for Meteorlake
+# +
+# +File: i915/mtl_gsc_1.bin
+# +Version: GSC API/APB v1.0, release 102.0.0.1655, SVN 1 for Meteorlake
+#  
+#  License: Redistributable. See LICENSE.i915 for details
+#  --------------------------------------------------------------------------
+# @@ -5548,6 +5549,10 @@
+#  
+#  Version: 5.4-00053
+#  
+# +File: qcom/venus-6.0/venus.mbn
+# +
+# +Version: VIDEO.VE.6.0-00049-PROD-1
+# +
+#  File: qcom/vpu-1.0/venus.mbn
+#  Link: qcom/vpu-1.0/venus.mdt -> venus.mbn
+#  
+# @@ -5598,6 +5603,7 @@
+#  File: qcom/sm8250/a650_zap.mbn
+#  File: qcom/a660_gmu.bin
+#  File: qcom/a660_sqe.fw
+# +File: qcom/a702_sqe.fw
+#  File: qcom/leia_pfp_470.fw
+#  File: qcom/leia_pm4_470.fw
+#  File: qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn
+# @@ -5629,28 +5635,51 @@
+#  File: qcom/apq8016/wcnss.mbn
+#  File: qcom/apq8016/WCNSS_qcom_wlan_nv_sbc.bin
+#  File: qcom/apq8096/adsp.mbn
+# -File: qcom/apq8096/adspr.jsn
+# -File: qcom/apq8096/adspua.jsn
+# +RawFile: qcom/apq8096/adspr.jsn
+# +RawFile: qcom/apq8096/adspua.jsn
+#  File: qcom/apq8096/mba.mbn
+#  File: qcom/apq8096/modem.mbn
+# -File: qcom/apq8096/modemr.jsn
+# +RawFile: qcom/apq8096/modemr.jsn
+# +File: qcom/qcm2290/a702_zap.mbn
+# +File: qcom/qcm2290/adsp.mbn
+# +RawFile: qcom/qcm2290/adspr.jsn
+# +RawFile: qcom/qcm2290/adsps.jsn
+# +RawFile: qcom/qcm2290/adspua.jsn
+# +File: qcom/qcm2290/modem.mbn
+# +RawFile: qcom/qcm2290/modemr.jsn
+# +RawFile: qcom/qcm2290/modemuw.jsn
+# +File: qcom/qcm2290/wlanmdsp.mbn
+# +File: qcom/qrb4210/a610_zap.mbn
+# +File: qcom/qrb4210/adsp.mbn
+# +RawFile: qcom/qrb4210/adspr.jsn
+# +RawFile: qcom/qrb4210/adsps.jsn
+# +RawFile: qcom/qrb4210/adspua.jsn
+# +File: qcom/qrb4210/cdsp.mbn
+# +RawFile: qcom/qrb4210/cdspr.jsn
+# +File: qcom/qrb4210/modem.mbn
+# +RawFile: qcom/qrb4210/modemr.jsn
+# +RawFile: qcom/qrb4210/modemuw.jsn
+# +Link: qcom/qrb4210/wlanmdsp.mbn -> ../qcm2290/wlanmdsp.mbn
+#  File: qcom/sdm845/adsp.mbn
+# -File: qcom/sdm845/adspr.jsn
+# -File: qcom/sdm845/adspua.jsn
+# +RawFile: qcom/sdm845/adspr.jsn
+# +RawFile: qcom/sdm845/adspua.jsn
+#  File: qcom/sdm845/cdsp.mbn
+# -File: qcom/sdm845/cdspr.jsn
+# +RawFile: qcom/sdm845/cdspr.jsn
+#  File: qcom/sdm845/Thundercomm/db845c/slpi.mbn
+# -File: qcom/sdm845/Thundercomm/db845c/slpir.jsn
+# -File: qcom/sdm845/Thundercomm/db845c/slpius.jsn
+# +RawFile: qcom/sdm845/Thundercomm/db845c/slpir.jsn
+# +RawFile: qcom/sdm845/Thundercomm/db845c/slpius.jsn
+#  File: qcom/sm8250/adsp.mbn
+# -File: qcom/sm8250/adspr.jsn
+# -File: qcom/sm8250/adspua.jsn
+# +RawFile: qcom/sm8250/adspr.jsn
+# +RawFile: qcom/sm8250/adspua.jsn
+#  File: qcom/sm8250/cdsp.mbn
+# -File: qcom/sm8250/cdspr.jsn
+# -File: qcom/sc8280xp/LENOVO/21BX/adspr.jsn
+# -File: qcom/sc8280xp/LENOVO/21BX/adspua.jsn
+# -File: qcom/sc8280xp/LENOVO/21BX/battmgr.jsn
+# -File: qcom/sc8280xp/LENOVO/21BX/cdspr.jsn
+# +RawFile: qcom/sm8250/cdspr.jsn
+# +File: qcom/sm8250/Thundercomm/RB5/slpi.mbn
+# +RawFile: qcom/sm8250/Thundercomm/RB5/slpir.jsn
+# +RawFile: qcom/sm8250/Thundercomm/RB5/slpius.jsn
+# +RawFile: qcom/sc8280xp/LENOVO/21BX/adspr.jsn
+# +RawFile: qcom/sc8280xp/LENOVO/21BX/adspua.jsn
+# +RawFile: qcom/sc8280xp/LENOVO/21BX/battmgr.jsn
+# +RawFile: qcom/sc8280xp/LENOVO/21BX/cdspr.jsn
+#  File: qcom/sc8280xp/LENOVO/21BX/qcadsp8280.mbn
+#  File: qcom/sc8280xp/LENOVO/21BX/qccdsp8280.mbn
+#  File: qcom/sc8280xp/LENOVO/21BX/qcslpi8280.mbn
+# @@ -5660,6 +5689,8 @@
+#  Binary files supplied originally from
+#  http://releases.linaro.org/96boards/dragonboard410c/qualcomm/firmware/linux-board-support-package-r1036.1.zip
+#  http://releases.linaro.org/96boards/dragonboard845c/qualcomm/firmware/RB3_firmware_20221121000000-v5.zip
+# +https://releases.linaro.org/96boards/rb1/qualcomm/firmware/RB1_firmware_20230823-v2.zip
+# +https://releases.linaro.org/96boards/rb2/qualcomm/firmware/RB2_firmware_20230823-v2.zip
+#  http://releases.linaro.org/96boards/rb5/qualcomm/firmware/RB5_firmware_20210331-v4.zip
+#  
+#  adsp.mbn has been converted from 20-adsp_split/firmware/adsp.* using
+# @@ -5674,7 +5705,7 @@
+#  
+#  File: qcom/sdm845/mba.mbn
+#  File: qcom/sdm845/modem_nm.mbn
+# -File: qcom/sdm845/modemuw.jsn
+# +RawFile: qcom/sdm845/modemuw.jsn
+#  Link: qcom/sdm845/modem.mbn -> modem_nm.mbn
+#  
+#  Licence: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
+# @@ -6045,6 +6076,35 @@
+#  File: cirrus/cs35l41-dsp1-spk-cali-103c8981-r1.bin
+#  File: cirrus/cs35l41-dsp1-spk-cali-103c8981-l0.bin
+#  File: cirrus/cs35l41-dsp1-spk-cali-103c8981-l1.bin
+# +File: cirrus/cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8c46.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-103c8c46.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8c47.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-103c8c47.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8c48.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-103c8c48.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8c49.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-103c8c49.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8c70.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-103c8c70.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8c71.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-103c8c71.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8c72.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-103c8c72.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +File: cirrus/cs35l41-dsp1-spk-prot-103c8c46.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-103c8c46.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-103c8c47.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-103c8c47.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-103c8c48.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-103c8c48.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-103c8c49.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-103c8c49.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8c70.bin -> cs35l41-dsp1-spk-prot-103c8c46.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-103c8c70.bin -> cs35l41-dsp1-spk-cali-103c8c46.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8c71.bin -> cs35l41-dsp1-spk-prot-103c8c47.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-103c8c71.bin -> cs35l41-dsp1-spk-cali-103c8c47.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8c72.bin -> cs35l41-dsp1-spk-prot-103c8c48.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-103c8c72.bin -> cs35l41-dsp1-spk-cali-103c8c48.bin
+#  File: cirrus/cs35l41/v6.39.0/halo_cspl_RAM_revB2_29.41.0.wmfw
+#  Link: cirrus/cs35l41-dsp1-spk-prot-17aa3847.wmfw -> cs35l41/v6.39.0/halo_cspl_RAM_revB2_29.41.0.wmfw
+#  Link: cirrus/cs35l41-dsp1-spk-cali-17aa3847.wmfw -> cs35l41/v6.39.0/halo_cspl_RAM_revB2_29.41.0.wmfw
+# @@ -6567,6 +6627,7 @@
+#  
+#  Driver: qcom-sc8280xp - Qualcomm ASoC tplg Firmware
+#  File: qcom/sc8280xp/LENOVO/21BX/audioreach-tplg.bin
+# +Link: qcom/sc8280xp/SC8280XP-LENOVO-X13S-tplg.bin -> LENOVO/21BX/audioreach-tplg.bin
+#  Version: v0.1.0
+#  
+#  Licence: Redistributable. See LICENCE.linaro for details
+# 
+#
+
 SUMMARY = "Firmware files for use with Linux kernel"
 HOMEPAGE = "https://www.kernel.org/"
 DESCRIPTION = "Linux firmware is a package distributed alongside the Linux kernel \
@@ -138,7 +518,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=${WHENCE_CHKSUM} \
+                    file://WHENCE;md5=2248e15a314a6db17cd94231d32eea17 \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
@@ -224,7 +604,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "88d46c543847ee3b03404d4941d91c92974690ee1f6fdcbee9cef3e5f97db688"
+SRC_URI[sha256sum] = "97fada0d02bdafc4e017a4dcc456e7fa48bc8daf2ddf75161f39a92e38f084ad"
 
 inherit allarch
 
-- 
2.39.2


--===============4377777418540966808==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: FILELIST: removed "/usr/lib/firmware/ath10k/WCN3990/hw1.0/notice.txt_wlanmdsp"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PKGSIZE changed from 16465860 to 12713844 (-23%)
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: RDEPENDS: added "linux-firmware-qcom-sdm845-modem"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: FILELIST: added "/usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c72.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c46.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c47.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c48.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c49.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c72.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c46.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c71.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c47.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c48.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c70.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c49.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c72.bin /usr/lib/firmware/cirrus/cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c70.bin /usr
 /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c71.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c49.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c70.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c71.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c46.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c47.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c47.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c48.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c49.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c46.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c70.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c71.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c72.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c48.wmfw"
packages/all-poky-linux/linux-firmware/linux-firmware-dev: RRECOMMENDS: removed "linux-firmware-ath10k-dev", added "linux-firmware-qcom-sc8280xp-lenovo-x13s-audio-dev linux-firmware-qcom-sdm845-modem-dev"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: FILELIST: added "/usr/lib/firmware/i915/mtl_gsc_1.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PKGSIZE changed from 5916348 to 9641353 (+63%)
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: RDEPENDS: removed "linux-firmware-ath10k"
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: removed "/usr/lib/firmware/cxgb4/t6fw-1.27.3.0.bin /usr/lib/firmware/cxgb4/t5fw-1.27.3.0.bin /usr/lib/firmware/cxgb4/t4fw-1.27.3.0.bin", added "/usr/lib/firmware/qcom/qcm2290/adspua.jsn /usr/lib/firmware/qcom/qcm2290/modemuw.jsn /usr/lib/firmware/cxgb4/t6fw-1.27.4.0.bin /usr/lib/firmware/cxgb4/t5fw-1.27.4.0.bin /usr/lib/firmware/qcom/qrb4210/wlanmdsp.mbn /usr/lib/firmware/cxgb4/t4fw-1.27.4.0.bin /usr/lib/firmware/qcom/sc8280xp/SC8280XP-LENOVO-X13S-tplg.bin /usr/lib/firmware/qcom/qrb4210/adsps.jsn /usr/lib/firmware/qcom/qcm2290/adsps.jsn /usr/lib/firmware/qcom/qcm2290/wlanmdsp.mbn /usr/lib/firmware/qcom/qrb4210/modemuw.jsn /usr/lib/firmware/qcom/qrb4210/adspua.jsn /usr/lib/firmware/qcom/qrb4210/a610_zap.mbn /usr/lib/firmware/qcom/venus-6.0/venus.mbn /usr/lib/firmware/qcom/qcm2290/adsp.mbn /usr/lib/firmware/qcom/sm8250/Thundercomm/RB5/slpir.jsn /usr/lib/firmware/qcom/qcm2290/modem.mbn /usr/lib/firmware/qcom/a702_sqe.fw /u
 sr/lib/firmware/qcom/qcm2290/adspr.jsn /usr/lib/firmware/rtl_bt/rtl8852cu_fw_v2.bin /usr/lib/firmware/qcom/qrb4210/modemr.jsn /usr/lib/firmware/qcom/qcm2290/modemr.jsn /usr/lib/firmware/qcom/sm8250/Thundercomm/RB5/slpius.jsn /usr/lib/firmware/qcom/qrb4210/cdsp.mbn /usr/lib/firmware/qcom/sdm845/notice.txt_wlanmdsp /usr/lib/firmware/qcom/sm8250/Thundercomm/RB5/slpi.mbn /usr/lib/firmware/qcom/qrb4210/adspr.jsn /usr/lib/firmware/qcom/qrb4210/cdspr.jsn /usr/lib/firmware/qcom/qcm2290/a702_zap.mbn /usr/lib/firmware/amd/amd_sev_fam19h_model1xh.sbin /usr/lib/firmware/qcom/qrb4210/adsp.mbn /usr/lib/firmware/qcom/qrb4210/modem.mbn"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGSIZE changed from 277080051 to 335509223 (+21%)
packages/all-poky-linux/linux-firmware/linux-firmware: RDEPENDS: added "linux-firmware-qcom-sc8280xp-lenovo-x13s-audio"

--===============4377777418540966808==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/linux-firmware: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware: SRC_URI changed from "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20230804.tar.xz" to "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20230919.tar.xz"
packages/all-poky-linux/linux-firmware: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PKGSIZE changed from 80314150 to 80320166 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: RDEPENDS: added "linux-firmware-qcom-sdm845-modem"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PKGSIZE changed from 16465860 to 12713844 (-23%)
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: FILELIST: removed "/usr/lib/firmware/ath10k/WCN3990/hw1.0/notice.txt_wlanmdsp"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2-mips: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2-mips: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: PKGSIZE changed from 1078832 to 1141376 (+6%)
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: FILELIST: added "/usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c49.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c70.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c71.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c72.wmfw /usr/lib/firmware/cirrus/cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c46.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c48.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c47.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c70.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c71.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c72.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c46.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c47.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c48.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c49.bin /
 usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c49.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c70.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c71.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c72.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c46.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c47.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c48.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c49.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c70.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c71.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c72.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c46.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c47.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c48.wmfw"
packages/all-poky-linux/linux-firmware/linux-firmware-cnm-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cnm-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-cnm: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cnm: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-dev: RRECOMMENDS: removed "linux-firmware-ath10k-dev", added "linux-firmware-qcom-sdm845-modem-dev linux-firmware-qcom-sc8280xp-lenovo-x13s-audio-dev"
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-gplv2-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-gplv2-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGSIZE changed from 26630347 to 27765163 (+4%)
packages/all-poky-linux/linux-firmware/linux-firmware-i915: FILELIST: added "/usr/lib/firmware/i915/mtl_gsc_1.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PKGSIZE changed from 2402083 to 2399511 (-0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGSIZE changed from 17514185 to 17329041 (-1%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8987-sdio: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8987-sdio: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-common: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-common: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-pcie: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-pcie: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-sdio: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-sdio: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-common: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-common: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-pcie: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-pcie: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-sdio: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-sdio: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw416-sdio: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw416-sdio: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw612-sdio: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw612-sdio: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PKGSIZE changed from 2168523 to 2185947 (+1%)
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-modem: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-modem: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-wifi: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-wifi: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-adreno: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-adreno: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-adreno: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-adreno: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: RDEPENDS: removed "linux-firmware-ath10k"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PKGSIZE changed from 5916348 to 9641353 (+63%)
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-thundercomm-db845c-sensors: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-thundercomm-db845c-sensors: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-adreno: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-adreno: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PKGSIZE changed from 5822631 to 5826727 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PKGSIZE changed from 1973549 to 1974893 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-yamato-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-yamato-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8761: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8761: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8822: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8822: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-src: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-src: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGSIZE changed from 236962 to 240527 (+2%)
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware: RDEPENDS: added "linux-firmware-qcom-sc8280xp-lenovo-x13s-audio"
packages/all-poky-linux/linux-firmware/linux-firmware: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGSIZE changed from 277080051 to 335509223 (+21%)
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: removed "/usr/lib/firmware/cxgb4/t4fw-1.27.3.0.bin /usr/lib/firmware/cxgb4/t5fw-1.27.3.0.bin /usr/lib/firmware/cxgb4/t6fw-1.27.3.0.bin", added "/usr/lib/firmware/qcom/qrb4210/modem.mbn /usr/lib/firmware/qcom/sdm845/notice.txt_wlanmdsp /usr/lib/firmware/rtl_bt/rtl8852cu_fw_v2.bin /usr/lib/firmware/qcom/qcm2290/adsp.mbn /usr/lib/firmware/qcom/qrb4210/a610_zap.mbn /usr/lib/firmware/qcom/qcm2290/modemuw.jsn /usr/lib/firmware/qcom/venus-6.0/venus.mbn /usr/lib/firmware/qcom/qrb4210/modemr.jsn /usr/lib/firmware/qcom/sm8250/Thundercomm/RB5/slpi.mbn /usr/lib/firmware/amd/amd_sev_fam19h_model1xh.sbin /usr/lib/firmware/qcom/qcm2290/adsps.jsn /usr/lib/firmware/qcom/qrb4210/modemuw.jsn /usr/lib/firmware/qcom/qcm2290/a702_zap.mbn /usr/lib/firmware/qcom/qcm2290/wlanmdsp.mbn /usr/lib/firmware/qcom/qrb4210/adsp.mbn /usr/lib/firmware/qcom/qrb4210/cdsp.mbn /usr/lib/firmware/qcom/qcm2290/modem.mbn /usr/lib/firmware/qcom/qcm2290/adspua.jsn 
 /usr/lib/firmware/qcom/qrb4210/wlanmdsp.mbn /usr/lib/firmware/qcom/a702_sqe.fw /usr/lib/firmware/qcom/sm8250/Thundercomm/RB5/slpius.jsn /usr/lib/firmware/qcom/qrb4210/cdspr.jsn /usr/lib/firmware/qcom/qrb4210/adspr.jsn /usr/lib/firmware/qcom/sc8280xp/SC8280XP-LENOVO-X13S-tplg.bin /usr/lib/firmware/cxgb4/t6fw-1.27.4.0.bin /usr/lib/firmware/qcom/qrb4210/adspua.jsn /usr/lib/firmware/qcom/qcm2290/adspr.jsn /usr/lib/firmware/qcom/sm8250/Thundercomm/RB5/slpir.jsn /usr/lib/firmware/cxgb4/t5fw-1.27.4.0.bin /usr/lib/firmware/qcom/qcm2290/modemr.jsn /usr/lib/firmware/cxgb4/t4fw-1.27.4.0.bin /usr/lib/firmware/qcom/qrb4210/adsps.jsn"

--===============4377777418540966808==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-linux-firmware-upgrade-20230804-20230919.patch"

RnJvbSAzMDA3ZDIzZTAxMTljMDdhMWJiOGQ2ZGRjMDg3ZDViZWFiMmVjMjdkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgT2N0IDIwMjMgMTg6MTM6MzcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aW51eC1maXJtd2FyZTogdXBncmFkZSAyMDIzMDgwNCAtPiAyMDIzMDkxOQoKLS0tCiAuLi4yMDIz
MDgwNC5iYiA9PiBsaW51eC1maXJtd2FyZV8yMDIzMDkxOS5iYn0gfCAzODQgKysrKysrKysrKysr
KysrKystCiAxIGZpbGUgY2hhbmdlZCwgMzgyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS97bGludXgtZmlybXdh
cmVfMjAyMzA4MDQuYmIgPT4gbGludXgtZmlybXdhcmVfMjAyMzA5MTkuYmJ9ICg3OSUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2Fy
ZV8yMDIzMDgwNC5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgt
ZmlybXdhcmVfMjAyMzA5MTkuYmIKc2ltaWxhcml0eSBpbmRleCA3OSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZV8yMDIzMDgwNC5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJt
d2FyZV8yMDIzMDkxOS5iYgppbmRleCAxZGJlODM3NGJjLi4wMDcyNDUzN2QwIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlXzIwMjMw
ODA0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgtZmly
bXdhcmVfMjAyMzA5MTkuYmIKQEAgLTEsMyArMSwzODMgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklM
RVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4K
KyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRo
ZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlm
IG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3Nh
Z2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0
ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0t
LSBXSEVOQ0UKKyMgKysrIFdIRU5DRQorIyBAQCAtNTM2LDE0ICs1MzYsMTQgQEAKKyMgIAorIyAg
RmlsZTogY3hnYjQvdDRmdy0xLjE0LjQuMC5iaW4KKyMgIEZpbGU6IGN4Z2I0L3Q0ZnctMS4xNS4z
Ny4wLmJpbgorIyAtRmlsZTogY3hnYjQvdDRmdy0xLjI3LjMuMC5iaW4KKyMgLUxpbms6IGN4Z2I0
L3Q0ZncuYmluIC0+IHQ0ZnctMS4yNy4zLjAuYmluCisjICtGaWxlOiBjeGdiNC90NGZ3LTEuMjcu
NC4wLmJpbgorIyArTGluazogY3hnYjQvdDRmdy5iaW4gLT4gdDRmdy0xLjI3LjQuMC5iaW4KKyMg
IEZpbGU6IGN4Z2I0L3Q1ZnctMS4xNC40LjAuYmluCisjICBGaWxlOiBjeGdiNC90NWZ3LTEuMTUu
MzcuMC5iaW4KKyMgLUZpbGU6IGN4Z2I0L3Q1ZnctMS4yNy4zLjAuYmluCisjIC1MaW5rOiBjeGdi
NC90NWZ3LmJpbiAtPiB0NWZ3LTEuMjcuMy4wLmJpbgorIyAtRmlsZTogY3hnYjQvdDZmdy0xLjI3
LjMuMC5iaW4KKyMgLUxpbms6IGN4Z2I0L3Q2ZncuYmluIC0+IHQ2ZnctMS4yNy4zLjAuYmluCisj
ICtGaWxlOiBjeGdiNC90NWZ3LTEuMjcuNC4wLmJpbgorIyArTGluazogY3hnYjQvdDVmdy5iaW4g
LT4gdDVmdy0xLjI3LjQuMC5iaW4KKyMgK0ZpbGU6IGN4Z2I0L3Q2ZnctMS4yNy40LjAuYmluCisj
ICtMaW5rOiBjeGdiNC90NmZ3LmJpbiAtPiB0NmZ3LTEuMjcuNC4wLmJpbgorIyAgRmlsZTogY3hn
YjQvYXExMjAyX2Z3LmNsZAorIyAgRmlsZTogY3hnYjQvYmNtODQ4My5iaW4KKyMgIEZpbGU6IGN4
Z2I0L2NvbmZpZ3MvdDQtY29uZmlnLWRlZmF1bHQudHh0CisjIEBAIC0zMzk1LDEwICszMzk1LDEw
IEBACisjICBGaWxlOiBhdGgxMGsvUUNBOTM3Ny9odzEuMC9ub3RpY2VfYXRoMTBrX2Zpcm13YXJl
LTYudHh0CisjICBGaWxlOiBhdGgxMGsvV0NOMzk5MC9odzEuMC9ib2FyZC0yLmJpbgorIyAgRmls
ZTogYXRoMTBrL1dDTjM5OTAvaHcxLjAvZmlybXdhcmUtNS5iaW4KKyMgLUZpbGU6IGF0aDEway9X
Q04zOTkwL2h3MS4wL3dsYW5tZHNwLm1ibgorIyAtTGluazogcWNvbS9zZG04NDUvd2xhbm1kc3Au
bWJuIC0+IC4uLy4uL2F0aDEway9XQ04zOTkwL2h3MS4wL3dsYW5tZHNwLm1ibgorIyArRmlsZTog
cWNvbS9zZG04NDUvd2xhbm1kc3AubWJuCisjICtMaW5rOiBhdGgxMGsvV0NOMzk5MC9odzEuMC93
bGFubWRzcC5tYm4gLT4gLi4vLi4vLi4vcWNvbS9zZG04NDUvd2xhbm1kc3AubWJuCisjICBWZXJz
aW9uOiBXTEFOLkhMLjIuMC0wMTM4Ny1RQ0FITFNXTVRQTFotMQorIyAtRmlsZTogYXRoMTBrL1dD
TjM5OTAvaHcxLjAvbm90aWNlLnR4dF93bGFubWRzcAorIyArRmlsZTogcWNvbS9zZG04NDUvbm90
aWNlLnR4dF93bGFubWRzcAorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBM
SUNFTlNFLlF1YWxjb21tQXRoZXJvc19hdGgxMGsgZm9yIGRldGFpbHMKKyMgIAorIyBAQCAtMzY5
Nyw2OSArMzY5Nyw2OSBAQAorIyAgRmlsZTogaW50ZWwvaWJ0LTE4LTEuZGRjCisjICBWZXJzaW9u
OiBCVF9UaHVuZGVyUGVha19BMF9CMF9SRUwwMjAxCisjICBGaWxlOmludGVsL2lidC0yMC0wLTMu
c2ZpCisjIC1WZXJzaW9uOiBCVF9DeWNsb25lUGVha19BMF9SRUw1MzQ1NAorIyArVmVyc2lvbjog
QlRfQ3ljbG9uZVBlYWtfQTBfUkVMNTM0OTcKKyMgIEZpbGU6aW50ZWwvaWJ0LTIwLTAtMy5kZGMK
KyMgLVZlcnNpb246IEJUX0N5Y2xvbmVQZWFrX0EwX1JFTDUzNDU0CisjICtWZXJzaW9uOiBCVF9D
eWNsb25lUGVha19BMF9SRUw1MzQ5NworIyAgRmlsZTppbnRlbC9pYnQtMjAtMS0zLnNmaQorIyAt
VmVyc2lvbjogQlRfQ3ljbG9uZVBlYWtfQTBfUkVMNTM0NTQKKyMgK1ZlcnNpb246IEJUX0N5Y2xv
bmVQZWFrX0EwX1JFTDUzNDk3CisjICBGaWxlOmludGVsL2lidC0yMC0xLTMuZGRjCisjIC1WZXJz
aW9uOiBCVF9DeWNsb25lUGVha19BMF9SRUw1MzQ1NAorIyArVmVyc2lvbjogQlRfQ3ljbG9uZVBl
YWtfQTBfUkVMNTM0OTcKKyMgIEZpbGU6aW50ZWwvaWJ0LTIwLTEtNC5zZmkKKyMgLVZlcnNpb246
IEJUX0N5Y2xvbmVQZWFrX0EwX1JFTDUzNDU0CisjICtWZXJzaW9uOiBCVF9DeWNsb25lUGVha19B
MF9SRUw1MzQ5NworIyAgRmlsZTppbnRlbC9pYnQtMjAtMS00LmRkYworIyAtVmVyc2lvbjogQlRf
Q3ljbG9uZVBlYWtfQTBfUkVMNTM0NTQKKyMgK1ZlcnNpb246IEJUX0N5Y2xvbmVQZWFrX0EwX1JF
TDUzNDk3CisjICBGaWxlOmludGVsL2lidC0xOS0wLTAuc2ZpCisjIC1WZXJzaW9uOiBCVF9RdWFz
YXJfUkVMNTM0NTQKKyMgK1ZlcnNpb246IEJUX1F1YXNhcl9SRUw1MzQ5NworIyAgRmlsZTppbnRl
bC9pYnQtMTktMC0wLmRkYworIyAtVmVyc2lvbjogQlRfUXVhc2FyX1JFTDUzNDU0CisjICtWZXJz
aW9uOiBCVF9RdWFzYXJfUkVMNTM0OTcKKyMgIEZpbGU6aW50ZWwvaWJ0LTE5LTAtMS5zZmkKKyMg
LVZlcnNpb246IEJUX1F1YXNhcl9SRUw1MzQ1NAorIyArVmVyc2lvbjogQlRfUXVhc2FyX1JFTDUz
NDk3CisjICBGaWxlOmludGVsL2lidC0xOS0wLTEuZGRjCisjIC1WZXJzaW9uOiBCVF9RdWFzYXJf
UkVMNTM0NTQKKyMgK1ZlcnNpb246IEJUX1F1YXNhcl9SRUw1MzQ5NworIyAgRmlsZTppbnRlbC9p
YnQtMTktMC0zLnNmaQorIyAgVmVyc2lvbjogQlRfUXVhc2FyX1JFTDUzMjYzCisjICBGaWxlOmlu
dGVsL2lidC0xOS0wLTMuZGRjCisjICBWZXJzaW9uOiBCVF9RdWFzYXJfUkVMNTMyNjMKKyMgIEZp
bGU6aW50ZWwvaWJ0LTE5LTAtNC5zZmkKKyMgLVZlcnNpb246IEJUX0hhcnJpc29uUGVha19SRUw1
MzQ1NAorIyArVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDUzNDk3CisjICBGaWxlOmludGVs
L2lidC0xOS0wLTQuZGRjCisjIC1WZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMNTM0NTQKKyMg
K1ZlcnNpb246IEJUX0hhcnJpc29uUGVha19SRUw1MzQ5NworIyAgRmlsZTppbnRlbC9pYnQtMTkt
MTYtNC5zZmkKKyMgLVZlcnNpb246IEJUX0hhcnJpc29uUGVha19SRUw1MzQ1NAorIyArVmVyc2lv
bjogQlRfSGFycmlzb25QZWFrX1JFTDUzNDk3CisjICBGaWxlOmludGVsL2lidC0xOS0xNi00LmRk
YworIyAtVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDUzNDU0CisjICtWZXJzaW9uOiBCVF9I
YXJyaXNvblBlYWtfUkVMNTM0OTcKKyMgIEZpbGU6aW50ZWwvaWJ0LTE5LTMyLTEuc2ZpCisjIC1W
ZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMNTM0NTQKKyMgK1ZlcnNpb246IEJUX0hhcnJpc29u
UGVha19SRUw1MzQ5NworIyAgRmlsZTppbnRlbC9pYnQtMTktMzItMS5kZGMKKyMgLVZlcnNpb246
IEJUX0hhcnJpc29uUGVha19SRUw1MzQ1NAorIyArVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JF
TDUzNDk3CisjICBGaWxlOmludGVsL2lidC0xOS0zMi0wLnNmaQorIyAtVmVyc2lvbjogQlRfSGFy
cmlzb25QZWFrX1JFTDUzNDU0CisjICtWZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMNTM0OTcK
KyMgIEZpbGU6aW50ZWwvaWJ0LTE5LTMyLTAuZGRjCisjIC1WZXJzaW9uOiBCVF9IYXJyaXNvblBl
YWtfUkVMNTM0NTQKKyMgK1ZlcnNpb246IEJUX0hhcnJpc29uUGVha19SRUw1MzQ5NworIyAgRmls
ZTppbnRlbC9pYnQtMTktMzItNC5zZmkKKyMgLVZlcnNpb246IEJUX0hhcnJpc29uUGVha19SRUw1
MzQ1NAorIyArVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDUzNDk3CisjICBGaWxlOmludGVs
L2lidC0xOS0zMi00LmRkYworIyAtVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDUzNDU0Cisj
ICtWZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMNTM0OTcKKyMgIEZpbGU6aW50ZWwvaWJ0LTE5
LTI0MC0xLnNmaQorIyAtVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDUzNDU0CisjICtWZXJz
aW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMNTM0OTcKKyMgIEZpbGU6aW50ZWwvaWJ0LTE5LTI0MC0x
LmRkYworIyAtVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDUzNDU0CisjICtWZXJzaW9uOiBC
VF9IYXJyaXNvblBlYWtfUkVMNTM0OTcKKyMgIEZpbGU6aW50ZWwvaWJ0LTE5LTI0MC00LnNmaQor
IyAtVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDUzNDU0CisjICtWZXJzaW9uOiBCVF9IYXJy
aXNvblBlYWtfUkVMNTM0OTcKKyMgIEZpbGU6aW50ZWwvaWJ0LTE5LTI0MC00LmRkYworIyAtVmVy
c2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDUzNDU0CisjICtWZXJzaW9uOiBCVF9IYXJyaXNvblBl
YWtfUkVMNTM0OTcKKyMgIEZpbGU6aW50ZWwvaWJ0LTAwNDEtMDA0MS5zZmkKKyMgLVZlcnNpb246
IEJUX1R5cGhvb25QZWFrX1JFTDY3MDY4CisjICtWZXJzaW9uOiBCVF9UeXBob29uUGVha19SRUw2
ODM1MAorIyAgRmlsZTppbnRlbC9pYnQtMDA0MS0wMDQxLmRkYworIyAtVmVyc2lvbjogQlRfVHlw
aG9vblBlYWtfUkVMNjcwNjgKKyMgK1ZlcnNpb246IEJUX1R5cGhvb25QZWFrX1JFTDY4MzUwCisj
ICBGaWxlOmludGVsL2lidC0wMDQwLTAwNDEuc2ZpCisjIC1WZXJzaW9uOiBCVF9Tb2xhcl9HZlAy
X1JFTDY3MDY4CisjICtWZXJzaW9uOiBCVF9Tb2xhcl9HZlAyX1JFTDY4MzUwCisjICBGaWxlOmlu
dGVsL2lidC0wMDQwLTAwNDEuZGRjCisjIC1WZXJzaW9uOiBCVF9Tb2xhcl9HZlAyX1JFTDY3MDY4
CisjICtWZXJzaW9uOiBCVF9Tb2xhcl9HZlAyX1JFTDY4MzUwCisjICBGaWxlOmludGVsL2lidC0x
MDQwLTAwNDEuc2ZpCisjIC1WZXJzaW9uOiBCVF9Tb2xhckZfR2ZQMl9SRUw2NzA2OAorIyArVmVy
c2lvbjogQlRfU29sYXJGX0dmUDJfUkVMNjgzNTAKKyMgIEZpbGU6aW50ZWwvaWJ0LTEwNDAtMDA0
MS5kZGMKKyMgLVZlcnNpb246IEJUX1NvbGFyRl9HZlAyX1JFTDY3MDY4CisjICtWZXJzaW9uOiBC
VF9Tb2xhckZfR2ZQMl9SRUw2ODM1MAorIyAgCisjICBGaWxlOmludGVsL2lidC0wMDQwLTEwMjAu
c2ZpCisjICBWZXJzaW9uOiBCVF9Tb2xhcl9KZlAxX1JFTDU5NTY0CisjIEBAIC0zNzgwLDEzICsz
NzgwLDEzIEBACisjICBWZXJzaW9uOiBCVF9Tb2xhckZfSmZQMl9SRUw1OTU2NAorIyAgCisjICBG
aWxlOmludGVsL2lidC0wMDQwLTQxNTAuc2ZpCisjIC1WZXJzaW9uOiBCVF9Tb2xhcl9KblAyX1JF
TDY3MDY4CisjICtWZXJzaW9uOiBCVF9Tb2xhcl9KblAyX1JFTDY4MzUwCisjICBGaWxlOmludGVs
L2lidC0wMDQwLTQxNTAuZGRjCisjIC1WZXJzaW9uOiBCVF9Tb2xhcl9KblAyX1JFTDY3MDY4Cisj
ICtWZXJzaW9uOiBCVF9Tb2xhcl9KblAyX1JFTDY4MzUwCisjICBGaWxlOmludGVsL2lidC0xMDQw
LTQxNTAuc2ZpCisjIC1WZXJzaW9uOiBCVF9Tb2xhckZfSm5QMl9SRUw2NzA2OAorIyArVmVyc2lv
bjogQlRfU29sYXJGX0puUDJfUkVMNjgzNTAKKyMgIEZpbGU6aW50ZWwvaWJ0LTEwNDAtNDE1MC5k
ZGMKKyMgLVZlcnNpb246IEJUX1NvbGFyRl9KblAyX1JFTDY3MDY4CisjICtWZXJzaW9uOiBCVF9T
b2xhckZfSm5QMl9SRUw2ODM1MAorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNl
ZSBMSUNFTkNFLmlidF9maXJtd2FyZSBmb3IgZGV0YWlscworIyAgCisjIEBAIC0zODIyLDYgKzM4
MjIsNyBAQAorIyAgRmlsZTogcnRsX2J0L3J0bDg4NTJidV9mdy5iaW4KKyMgIEZpbGU6IHJ0bF9i
dC9ydGw4ODUyYnVfY29uZmlnLmJpbgorIyAgRmlsZTogcnRsX2J0L3J0bDg4NTJjdV9mdy5iaW4K
KyMgK0ZpbGU6IHJ0bF9idC9ydGw4ODUyY3VfZndfdjIuYmluCisjICBGaWxlOiBydGxfYnQvcnRs
ODg1MmN1X2NvbmZpZy5iaW4KKyMgIEZpbGU6IHJ0bF9idC9ydGw4ODUxYnVfZncuYmluCisjICBG
aWxlOiBydGxfYnQvcnRsODg1MWJ1X2NvbmZpZy5iaW4KKyMgQEAgLTM5MDEsNyArMzkwMiw5IEBA
CisjICBGaWxlOiBhbWQvYW1kX3Nldl9mYW0xN2hfbW9kZWwzeGguc2JpbgorIyAgVmVyc2lvbjog
MjAyMi0yLTI1CisjICBGaWxlOiBhbWQvYW1kX3Nldl9mYW0xOWhfbW9kZWwweGguc2JpbgorIyAt
VmVyc2lvbjogMjAyMi0yLTI1CisjICtWZXJzaW9uOiAyMDIzLTgtMjMKKyMgK0ZpbGU6IGFtZC9h
bWRfc2V2X2ZhbTE5aF9tb2RlbDF4aC5zYmluCisjICtWZXJzaW9uOiAyMDIzLTgtMjMKKyMgIAor
IyAgTGljZW5zZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5hbWQtc2V2IGZvciBkZXRh
aWxzCisjICAKKyMgQEAgLTM5MDksMjEgKzM5MTIsMTYgQEAKKyMgIAorIyAgRHJpdmVyOiBtaWNy
b2NvZGVfYW1kIC0gQU1EIENQVSBNaWNyb2NvZGUgVXBkYXRlIERyaXZlciBmb3IgTGludXgKKyMg
IAorIyAtRmlsZTogYW1kLXVjb2RlL21pY3JvY29kZV9hbWQuYmluCisjIC1SYXc6IGFtZC11Y29k
ZS9taWNyb2NvZGVfYW1kLmJpbgorIyArUmF3RmlsZTogYW1kLXVjb2RlL21pY3JvY29kZV9hbWQu
YmluCisjICBWZXJzaW9uOiAyMDEzLTA3LTEwCisjIC1GaWxlOiBhbWQtdWNvZGUvbWljcm9jb2Rl
X2FtZF9mYW0xNWguYmluCisjIC1SYXc6IGFtZC11Y29kZS9taWNyb2NvZGVfYW1kX2ZhbTE1aC5i
aW4KKyMgK1Jhd0ZpbGU6IGFtZC11Y29kZS9taWNyb2NvZGVfYW1kX2ZhbTE1aC5iaW4KKyMgIFZl
cnNpb246IDIwMTgtMDUtMjQKKyMgLUZpbGU6IGFtZC11Y29kZS9taWNyb2NvZGVfYW1kX2ZhbTE2
aC5iaW4KKyMgLVJhdzogYW1kLXVjb2RlL21pY3JvY29kZV9hbWRfZmFtMTZoLmJpbgorIyArUmF3
RmlsZTogYW1kLXVjb2RlL21pY3JvY29kZV9hbWRfZmFtMTZoLmJpbgorIyAgVmVyc2lvbjogMjAx
NC0xMC0yOAorIyAtRmlsZTogYW1kLXVjb2RlL21pY3JvY29kZV9hbWRfZmFtMTdoLmJpbgorIyAt
UmF3OiBhbWQtdWNvZGUvbWljcm9jb2RlX2FtZF9mYW0xN2guYmluCisjICtSYXdGaWxlOiBhbWQt
dWNvZGUvbWljcm9jb2RlX2FtZF9mYW0xN2guYmluCisjICBWZXJzaW9uOiAyMDIzLTA3LTE5Cisj
IC1GaWxlOiBhbWQtdWNvZGUvbWljcm9jb2RlX2FtZF9mYW0xOWguYmluCisjIC1SYXc6IGFtZC11
Y29kZS9taWNyb2NvZGVfYW1kX2ZhbTE5aC5iaW4KKyMgLVZlcnNpb246IDIwMjMtMDctMTgKKyMg
K1Jhd0ZpbGU6IGFtZC11Y29kZS9taWNyb2NvZGVfYW1kX2ZhbTE5aC5iaW4KKyMgK1ZlcnNpb246
IDIwMjMtMDgtMDgKKyMgIEZpbGU6IGFtZC11Y29kZS9SRUFETUUKKyMgIAorIyAgTGljZW5zZTog
UmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5hbWQtdWNvZGUgZm9yIGRldGFpbHMKKyMgQEAg
LTQ3MjEsMTMgKzQ3MTksMTYgQEAKKyMgIFZlcnNpb246IERNQyBBUEkvQVBCIHZlciAyIHJlbGVh
c2UgMTAgZm9yIE1ldGVvcmxha2UKKyMgIAorIyAgRmlsZTogaTkxNS9tdGxfZG1jLmJpbgorIyAt
VmVyc2lvbjogRE1DIEFQSS9BUEIgdmVyIDIgcmVsZWFzZSAxMyBmb3IgTWV0ZW9ybGFrZQorIyAr
VmVyc2lvbjogRE1DIEFQSS9BUEIgdmVyIDIgcmVsZWFzZSAxNiBmb3IgTWV0ZW9ybGFrZQorIyAg
CisjICBGaWxlOiBpOTE1L210bF9ndWNfNzAuYmluCisjICBWZXJzaW9uOiBHdUMgQVBJL0FQQiB2
ZXIgNzAuOC4wIGZvciBNZXRlb3JsYWtlCisjICAKKyMgIEZpbGU6IGk5MTUvbXRsX2h1Y19nc2Mu
YmluCisjIC1WZXJzaW9uOiBIdUMgQVBJL0FQQiB2ZXIgOC41LjEgZm9yIE1ldGVvcmxha2UKKyMg
K1ZlcnNpb246IEh1QyBBUEkvQVBCIHZlciA4LjUuNCBmb3IgTWV0ZW9ybGFrZQorIyArCisjICtG
aWxlOiBpOTE1L210bF9nc2NfMS5iaW4KKyMgK1ZlcnNpb246IEdTQyBBUEkvQVBCIHYxLjAsIHJl
bGVhc2UgMTAyLjAuMC4xNjU1LCBTVk4gMSBmb3IgTWV0ZW9ybGFrZQorIyAgCisjICBMaWNlbnNl
OiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLmk5MTUgZm9yIGRldGFpbHMKKyMgIC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCisjIEBAIC01NTQ4LDYgKzU1NDksMTAgQEAKKyMgIAorIyAgVmVyc2lvbjog
NS40LTAwMDUzCisjICAKKyMgK0ZpbGU6IHFjb20vdmVudXMtNi4wL3ZlbnVzLm1ibgorIyArCisj
ICtWZXJzaW9uOiBWSURFTy5WRS42LjAtMDAwNDktUFJPRC0xCisjICsKKyMgIEZpbGU6IHFjb20v
dnB1LTEuMC92ZW51cy5tYm4KKyMgIExpbms6IHFjb20vdnB1LTEuMC92ZW51cy5tZHQgLT4gdmVu
dXMubWJuCisjICAKKyMgQEAgLTU1OTgsNiArNTYwMyw3IEBACisjICBGaWxlOiBxY29tL3NtODI1
MC9hNjUwX3phcC5tYm4KKyMgIEZpbGU6IHFjb20vYTY2MF9nbXUuYmluCisjICBGaWxlOiBxY29t
L2E2NjBfc3FlLmZ3CisjICtGaWxlOiBxY29tL2E3MDJfc3FlLmZ3CisjICBGaWxlOiBxY29tL2xl
aWFfcGZwXzQ3MC5mdworIyAgRmlsZTogcWNvbS9sZWlhX3BtNF80NzAuZncKKyMgIEZpbGU6IHFj
b20vc2M4MjgweHAvTEVOT1ZPLzIxQlgvcWNkeGttc3VjODI4MC5tYm4KKyMgQEAgLTU2MjksMjgg
KzU2MzUsNTEgQEAKKyMgIEZpbGU6IHFjb20vYXBxODAxNi93Y25zcy5tYm4KKyMgIEZpbGU6IHFj
b20vYXBxODAxNi9XQ05TU19xY29tX3dsYW5fbnZfc2JjLmJpbgorIyAgRmlsZTogcWNvbS9hcHE4
MDk2L2Fkc3AubWJuCisjIC1GaWxlOiBxY29tL2FwcTgwOTYvYWRzcHIuanNuCisjIC1GaWxlOiBx
Y29tL2FwcTgwOTYvYWRzcHVhLmpzbgorIyArUmF3RmlsZTogcWNvbS9hcHE4MDk2L2Fkc3ByLmpz
bgorIyArUmF3RmlsZTogcWNvbS9hcHE4MDk2L2Fkc3B1YS5qc24KKyMgIEZpbGU6IHFjb20vYXBx
ODA5Ni9tYmEubWJuCisjICBGaWxlOiBxY29tL2FwcTgwOTYvbW9kZW0ubWJuCisjIC1GaWxlOiBx
Y29tL2FwcTgwOTYvbW9kZW1yLmpzbgorIyArUmF3RmlsZTogcWNvbS9hcHE4MDk2L21vZGVtci5q
c24KKyMgK0ZpbGU6IHFjb20vcWNtMjI5MC9hNzAyX3phcC5tYm4KKyMgK0ZpbGU6IHFjb20vcWNt
MjI5MC9hZHNwLm1ibgorIyArUmF3RmlsZTogcWNvbS9xY20yMjkwL2Fkc3ByLmpzbgorIyArUmF3
RmlsZTogcWNvbS9xY20yMjkwL2Fkc3BzLmpzbgorIyArUmF3RmlsZTogcWNvbS9xY20yMjkwL2Fk
c3B1YS5qc24KKyMgK0ZpbGU6IHFjb20vcWNtMjI5MC9tb2RlbS5tYm4KKyMgK1Jhd0ZpbGU6IHFj
b20vcWNtMjI5MC9tb2RlbXIuanNuCisjICtSYXdGaWxlOiBxY29tL3FjbTIyOTAvbW9kZW11dy5q
c24KKyMgK0ZpbGU6IHFjb20vcWNtMjI5MC93bGFubWRzcC5tYm4KKyMgK0ZpbGU6IHFjb20vcXJi
NDIxMC9hNjEwX3phcC5tYm4KKyMgK0ZpbGU6IHFjb20vcXJiNDIxMC9hZHNwLm1ibgorIyArUmF3
RmlsZTogcWNvbS9xcmI0MjEwL2Fkc3ByLmpzbgorIyArUmF3RmlsZTogcWNvbS9xcmI0MjEwL2Fk
c3BzLmpzbgorIyArUmF3RmlsZTogcWNvbS9xcmI0MjEwL2Fkc3B1YS5qc24KKyMgK0ZpbGU6IHFj
b20vcXJiNDIxMC9jZHNwLm1ibgorIyArUmF3RmlsZTogcWNvbS9xcmI0MjEwL2Nkc3ByLmpzbgor
IyArRmlsZTogcWNvbS9xcmI0MjEwL21vZGVtLm1ibgorIyArUmF3RmlsZTogcWNvbS9xcmI0MjEw
L21vZGVtci5qc24KKyMgK1Jhd0ZpbGU6IHFjb20vcXJiNDIxMC9tb2RlbXV3LmpzbgorIyArTGlu
azogcWNvbS9xcmI0MjEwL3dsYW5tZHNwLm1ibiAtPiAuLi9xY20yMjkwL3dsYW5tZHNwLm1ibgor
IyAgRmlsZTogcWNvbS9zZG04NDUvYWRzcC5tYm4KKyMgLUZpbGU6IHFjb20vc2RtODQ1L2Fkc3By
LmpzbgorIyAtRmlsZTogcWNvbS9zZG04NDUvYWRzcHVhLmpzbgorIyArUmF3RmlsZTogcWNvbS9z
ZG04NDUvYWRzcHIuanNuCisjICtSYXdGaWxlOiBxY29tL3NkbTg0NS9hZHNwdWEuanNuCisjICBG
aWxlOiBxY29tL3NkbTg0NS9jZHNwLm1ibgorIyAtRmlsZTogcWNvbS9zZG04NDUvY2RzcHIuanNu
CisjICtSYXdGaWxlOiBxY29tL3NkbTg0NS9jZHNwci5qc24KKyMgIEZpbGU6IHFjb20vc2RtODQ1
L1RodW5kZXJjb21tL2RiODQ1Yy9zbHBpLm1ibgorIyAtRmlsZTogcWNvbS9zZG04NDUvVGh1bmRl
cmNvbW0vZGI4NDVjL3NscGlyLmpzbgorIyAtRmlsZTogcWNvbS9zZG04NDUvVGh1bmRlcmNvbW0v
ZGI4NDVjL3NscGl1cy5qc24KKyMgK1Jhd0ZpbGU6IHFjb20vc2RtODQ1L1RodW5kZXJjb21tL2Ri
ODQ1Yy9zbHBpci5qc24KKyMgK1Jhd0ZpbGU6IHFjb20vc2RtODQ1L1RodW5kZXJjb21tL2RiODQ1
Yy9zbHBpdXMuanNuCisjICBGaWxlOiBxY29tL3NtODI1MC9hZHNwLm1ibgorIyAtRmlsZTogcWNv
bS9zbTgyNTAvYWRzcHIuanNuCisjIC1GaWxlOiBxY29tL3NtODI1MC9hZHNwdWEuanNuCisjICtS
YXdGaWxlOiBxY29tL3NtODI1MC9hZHNwci5qc24KKyMgK1Jhd0ZpbGU6IHFjb20vc204MjUwL2Fk
c3B1YS5qc24KKyMgIEZpbGU6IHFjb20vc204MjUwL2Nkc3AubWJuCisjIC1GaWxlOiBxY29tL3Nt
ODI1MC9jZHNwci5qc24KKyMgLUZpbGU6IHFjb20vc2M4MjgweHAvTEVOT1ZPLzIxQlgvYWRzcHIu
anNuCisjIC1GaWxlOiBxY29tL3NjODI4MHhwL0xFTk9WTy8yMUJYL2Fkc3B1YS5qc24KKyMgLUZp
bGU6IHFjb20vc2M4MjgweHAvTEVOT1ZPLzIxQlgvYmF0dG1nci5qc24KKyMgLUZpbGU6IHFjb20v
c2M4MjgweHAvTEVOT1ZPLzIxQlgvY2RzcHIuanNuCisjICtSYXdGaWxlOiBxY29tL3NtODI1MC9j
ZHNwci5qc24KKyMgK0ZpbGU6IHFjb20vc204MjUwL1RodW5kZXJjb21tL1JCNS9zbHBpLm1ibgor
IyArUmF3RmlsZTogcWNvbS9zbTgyNTAvVGh1bmRlcmNvbW0vUkI1L3NscGlyLmpzbgorIyArUmF3
RmlsZTogcWNvbS9zbTgyNTAvVGh1bmRlcmNvbW0vUkI1L3NscGl1cy5qc24KKyMgK1Jhd0ZpbGU6
IHFjb20vc2M4MjgweHAvTEVOT1ZPLzIxQlgvYWRzcHIuanNuCisjICtSYXdGaWxlOiBxY29tL3Nj
ODI4MHhwL0xFTk9WTy8yMUJYL2Fkc3B1YS5qc24KKyMgK1Jhd0ZpbGU6IHFjb20vc2M4MjgweHAv
TEVOT1ZPLzIxQlgvYmF0dG1nci5qc24KKyMgK1Jhd0ZpbGU6IHFjb20vc2M4MjgweHAvTEVOT1ZP
LzIxQlgvY2RzcHIuanNuCisjICBGaWxlOiBxY29tL3NjODI4MHhwL0xFTk9WTy8yMUJYL3FjYWRz
cDgyODAubWJuCisjICBGaWxlOiBxY29tL3NjODI4MHhwL0xFTk9WTy8yMUJYL3FjY2RzcDgyODAu
bWJuCisjICBGaWxlOiBxY29tL3NjODI4MHhwL0xFTk9WTy8yMUJYL3Fjc2xwaTgyODAubWJuCisj
IEBAIC01NjYwLDYgKzU2ODksOCBAQAorIyAgQmluYXJ5IGZpbGVzIHN1cHBsaWVkIG9yaWdpbmFs
bHkgZnJvbQorIyAgaHR0cDovL3JlbGVhc2VzLmxpbmFyby5vcmcvOTZib2FyZHMvZHJhZ29uYm9h
cmQ0MTBjL3F1YWxjb21tL2Zpcm13YXJlL2xpbnV4LWJvYXJkLXN1cHBvcnQtcGFja2FnZS1yMTAz
Ni4xLnppcAorIyAgaHR0cDovL3JlbGVhc2VzLmxpbmFyby5vcmcvOTZib2FyZHMvZHJhZ29uYm9h
cmQ4NDVjL3F1YWxjb21tL2Zpcm13YXJlL1JCM19maXJtd2FyZV8yMDIyMTEyMTAwMDAwMC12NS56
aXAKKyMgK2h0dHBzOi8vcmVsZWFzZXMubGluYXJvLm9yZy85NmJvYXJkcy9yYjEvcXVhbGNvbW0v
ZmlybXdhcmUvUkIxX2Zpcm13YXJlXzIwMjMwODIzLXYyLnppcAorIyAraHR0cHM6Ly9yZWxlYXNl
cy5saW5hcm8ub3JnLzk2Ym9hcmRzL3JiMi9xdWFsY29tbS9maXJtd2FyZS9SQjJfZmlybXdhcmVf
MjAyMzA4MjMtdjIuemlwCisjICBodHRwOi8vcmVsZWFzZXMubGluYXJvLm9yZy85NmJvYXJkcy9y
YjUvcXVhbGNvbW0vZmlybXdhcmUvUkI1X2Zpcm13YXJlXzIwMjEwMzMxLXY0LnppcAorIyAgCisj
ICBhZHNwLm1ibiBoYXMgYmVlbiBjb252ZXJ0ZWQgZnJvbSAyMC1hZHNwX3NwbGl0L2Zpcm13YXJl
L2Fkc3AuKiB1c2luZworIyBAQCAtNTY3NCw3ICs1NzA1LDcgQEAKKyMgIAorIyAgRmlsZTogcWNv
bS9zZG04NDUvbWJhLm1ibgorIyAgRmlsZTogcWNvbS9zZG04NDUvbW9kZW1fbm0ubWJuCisjIC1G
aWxlOiBxY29tL3NkbTg0NS9tb2RlbXV3LmpzbgorIyArUmF3RmlsZTogcWNvbS9zZG04NDUvbW9k
ZW11dy5qc24KKyMgIExpbms6IHFjb20vc2RtODQ1L21vZGVtLm1ibiAtPiBtb2RlbV9ubS5tYm4K
KyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5xY29tIGFuZCBx
Y29tL05PVElDRS50eHQgZm9yIGRldGFpbHMKKyMgQEAgLTYwNDUsNiArNjA3NiwzNSBAQAorIyAg
RmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDNjODk4MS1yMS5iaW4KKyMgIEZp
bGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTAzYzg5ODEtbDAuYmluCisjICBGaWxl
OiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwM2M4OTgxLWwxLmJpbgorIyArRmlsZTog
Y2lycnVzL2NzMzVsNDEvdjYuODMuMC9oYWxvX2NzcGxfUkFNX3JldkIyXzI5Ljg1LjAud21mdwor
IyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGM0Ni53bWZ3IC0+IGNz
MzVsNDEvdjYuODMuMC9oYWxvX2NzcGxfUkFNX3JldkIyXzI5Ljg1LjAud21mdworIyArTGluazog
Y2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDNjOGM0Ni53bWZ3IC0+IGNzMzVsNDEvdjYu
ODMuMC9oYWxvX2NzcGxfUkFNX3JldkIyXzI5Ljg1LjAud21mdworIyArTGluazogY2lycnVzL2Nz
MzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGM0Ny53bWZ3IC0+IGNzMzVsNDEvdjYuODMuMC9oYWxv
X2NzcGxfUkFNX3JldkIyXzI5Ljg1LjAud21mdworIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNw
MS1zcGstY2FsaS0xMDNjOGM0Ny53bWZ3IC0+IGNzMzVsNDEvdjYuODMuMC9oYWxvX2NzcGxfUkFN
X3JldkIyXzI5Ljg1LjAud21mdworIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJv
dC0xMDNjOGM0OC53bWZ3IC0+IGNzMzVsNDEvdjYuODMuMC9oYWxvX2NzcGxfUkFNX3JldkIyXzI5
Ljg1LjAud21mdworIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDNjOGM0
OC53bWZ3IC0+IGNzMzVsNDEvdjYuODMuMC9oYWxvX2NzcGxfUkFNX3JldkIyXzI5Ljg1LjAud21m
dworIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGM0OS53bWZ3IC0+
IGNzMzVsNDEvdjYuODMuMC9oYWxvX2NzcGxfUkFNX3JldkIyXzI5Ljg1LjAud21mdworIyArTGlu
azogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDNjOGM0OS53bWZ3IC0+IGNzMzVsNDEv
djYuODMuMC9oYWxvX2NzcGxfUkFNX3JldkIyXzI5Ljg1LjAud21mdworIyArTGluazogY2lycnVz
L2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGM3MC53bWZ3IC0+IGNzMzVsNDEvdjYuODMuMC9o
YWxvX2NzcGxfUkFNX3JldkIyXzI5Ljg1LjAud21mdworIyArTGluazogY2lycnVzL2NzMzVsNDEt
ZHNwMS1zcGstY2FsaS0xMDNjOGM3MC53bWZ3IC0+IGNzMzVsNDEvdjYuODMuMC9oYWxvX2NzcGxf
UkFNX3JldkIyXzI5Ljg1LjAud21mdworIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGst
cHJvdC0xMDNjOGM3MS53bWZ3IC0+IGNzMzVsNDEvdjYuODMuMC9oYWxvX2NzcGxfUkFNX3JldkIy
XzI5Ljg1LjAud21mdworIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDNj
OGM3MS53bWZ3IC0+IGNzMzVsNDEvdjYuODMuMC9oYWxvX2NzcGxfUkFNX3JldkIyXzI5Ljg1LjAu
d21mdworIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGM3Mi53bWZ3
IC0+IGNzMzVsNDEvdjYuODMuMC9oYWxvX2NzcGxfUkFNX3JldkIyXzI5Ljg1LjAud21mdworIyAr
TGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDNjOGM3Mi53bWZ3IC0+IGNzMzVs
NDEvdjYuODMuMC9oYWxvX2NzcGxfUkFNX3JldkIyXzI5Ljg1LjAud21mdworIyArRmlsZTogY2ly
cnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGM0Ni5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9j
czM1bDQxLWRzcDEtc3BrLWNhbGktMTAzYzhjNDYuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0
MS1kc3AxLXNway1wcm90LTEwM2M4YzQ3LmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNw
MS1zcGstY2FsaS0xMDNjOGM0Ny5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3Br
LXByb3QtMTAzYzhjNDguYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxp
LTEwM2M4YzQ4LmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNj
OGM0OS5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTAzYzhjNDku
YmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4YzcwLmJpbiAt
PiBjczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhjNDYuYmluCisjICtMaW5rOiBjaXJydXMvY3Mz
NWw0MS1kc3AxLXNway1jYWxpLTEwM2M4YzcwLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLWNhbGkt
MTAzYzhjNDYuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4
YzcxLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhjNDcuYmluCisjICtMaW5rOiBj
aXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwM2M4YzcxLmJpbiAtPiBjczM1bDQxLWRzcDEt
c3BrLWNhbGktMTAzYzhjNDcuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1w
cm90LTEwM2M4YzcyLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhjNDguYmluCisj
ICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwM2M4YzcyLmJpbiAtPiBjczM1
bDQxLWRzcDEtc3BrLWNhbGktMTAzYzhjNDguYmluCisjICBGaWxlOiBjaXJydXMvY3MzNWw0MS92
Ni4zOS4wL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuNDEuMC53bWZ3CisjICBMaW5rOiBjaXJydXMv
Y3MzNWw0MS1kc3AxLXNway1wcm90LTE3YWEzODQ3LndtZncgLT4gY3MzNWw0MS92Ni4zOS4wL2hh
bG9fY3NwbF9SQU1fcmV2QjJfMjkuNDEuMC53bWZ3CisjICBMaW5rOiBjaXJydXMvY3MzNWw0MS1k
c3AxLXNway1jYWxpLTE3YWEzODQ3LndtZncgLT4gY3MzNWw0MS92Ni4zOS4wL2hhbG9fY3NwbF9S
QU1fcmV2QjJfMjkuNDEuMC53bWZ3CisjIEBAIC02NTY3LDYgKzY2MjcsNyBAQAorIyAgCisjICBE
cml2ZXI6IHFjb20tc2M4MjgweHAgLSBRdWFsY29tbSBBU29DIHRwbGcgRmlybXdhcmUKKyMgIEZp
bGU6IHFjb20vc2M4MjgweHAvTEVOT1ZPLzIxQlgvYXVkaW9yZWFjaC10cGxnLmJpbgorIyArTGlu
azogcWNvbS9zYzgyODB4cC9TQzgyODBYUC1MRU5PVk8tWDEzUy10cGxnLmJpbiAtPiBMRU5PVk8v
MjFCWC9hdWRpb3JlYWNoLXRwbGcuYmluCisjICBWZXJzaW9uOiB2MC4xLjAKKyMgIAorIyAgTGlj
ZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5saW5hcm8gZm9yIGRldGFpbHMKKyMg
CisjCisKIFNVTU1BUlkgPSAiRmlybXdhcmUgZmlsZXMgZm9yIHVzZSB3aXRoIExpbnV4IGtlcm5l
bCIKIEhPTUVQQUdFID0gImh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvIgogREVTQ1JJUFRJT04gPSAi
TGludXggZmlybXdhcmUgaXMgYSBwYWNrYWdlIGRpc3RyaWJ1dGVkIGFsb25nc2lkZSB0aGUgTGlu
dXgga2VybmVsIFwKQEAgLTEzOCw3ICs1MTgsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9MSUNFTkNFLkFiaWxpczttZDU9YjVlZTNmNDEwNzgwZTU2NzExYWQ0OGVhZGMyMmI4YmMgXAog
ICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5DRS54YzQwMDA7bWQ1PTBmZjUxZDJkYzQ5
ZmNlMDQ4MTRjOTE1NTA4MTA5MmYwIFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VO
Q0UueGM1MDAwO21kNT0xZTE3MGMxMzE3NTMyM2MzMmM3ZjRkMDk5OGQ1M2Y2NiBcCiAgICAgICAg
ICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTkNFLnhjNTAwMGM7bWQ1PTEyYjAyZWZhMzA0OWRiNjVk
NTI0YWViNDE4ZGQ4N2NhIFwKLSAgICAgICAgICAgICAgICAgICAgZmlsZTovL1dIRU5DRTttZDU9
JHtXSEVOQ0VfQ0hLU1VNfSBcCisgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9XSEVOQ0U7bWQ1
PTIyNDhlMTVhMzE0YTZkYjE3Y2Q5NDIzMWQzMmVlYTE3IFwKICAgICAgICAgICAgICAgICAgICAg
IgogIyBXSEVOQ0UgY2hlY2tzdW0gaXMgZGVmaW5lZCBzZXBhcmF0ZWx5IHRvIGVhc2Ugb3ZlcnJp
ZGluZyBpdCBpZgogIyBjbGFzcy1kZXZ1cHN0cmVhbSBpcyBzZWxlY3RlZC4KQEAgLTIyNCw3ICs2
MDQsNyBAQCBTUkNfVVJJOmNsYXNzLWRldnVwc3RyZWFtID0gImdpdDovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9maXJtdwogIyBQaW4gdGhpcyB0byB0aGUgMjAyMjA1
MDkgcmVsZWFzZSwgb3ZlcnJpZGUgdGhpcyBpbiBsb2NhbC5jb25mCiBTUkNSRVY6Y2xhc3MtZGV2
dXBzdHJlYW0gPz0gImIxOWNiZGNhNzhhYjJhZGZkMjEwYzkxYmUxNWEyMjU2OGU4YjhjYWUiCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICI4OGQ0NmM1NDM4NDdlZTNiMDM0MDRkNDk0MWQ5MWM5Mjk3
NDY5MGVlMWY2ZmRjYmVlOWNlZjNlNWY5N2RiNjg4IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjk3
ZmFkYTBkMDJiZGFmYzRlMDE3YTRkY2M0NTZlN2ZhNDhiYzhkYWYyZGRmNzUxNjFmMzlhOTJlMzhm
MDg0YWQiCiAKIGluaGVyaXQgYWxsYXJjaAogCi0tIAoyLjM5LjIKCg==

--===============4377777418540966808==--

