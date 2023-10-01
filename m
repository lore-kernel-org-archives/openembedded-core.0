Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E685BE78480
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 18:13:19 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.65017.1696183990731563320
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 11:13:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=cz0U3Wpr;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=TcEY6lzN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018aec71bd15-22a76dbb-6f63-4d7f-818f-fc63c62c69d9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1696183992;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WnYzxbd61MRZsn7GrQ6HGOw6QMvqbZxY3XZs4Vz0TDo=;
	b=cz0U3Wprzas2m1zNRvWMNZGVAq7ykxhR48BZIjYc23DD3urb43qz2P+n+1NoecRE
	5Rwu0cC3pkOHnRFmHnvNAzJNQBXgLW3xsnqT71kCFTRQefnjZcsQ2+9oxUbCkPITuSq
	ghAgEa7fxZSBcW4Yccete38jOcF9/h+Tik1d7xQc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1696183992;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WnYzxbd61MRZsn7GrQ6HGOw6QMvqbZxY3XZs4Vz0TDo=;
	b=TcEY6lzNdOgWc/ymNgsiVDjfRb1eQmJpYR5SbGe7YA2KWGuaUz+IeB3bEpLGNe76
	0r2BOEzgyy+4W4FqLMxYobQPOwIipQOqv1i44oziAO5i7Cqri0LRsnuvwcpmH3joouA
	1CPiBJAgwTKadcKFsTKOdUvTJ/IEa1e7/GQ2H7Xg=
Content-Type: multipart/mixed; boundary="===============7009953085331701283=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] linux-firmware: upgrading to 20230919 SUCCEEDED
Message-ID: <0101018aec71bd15-22a76dbb-6f63-4d7f-818f-fc63c62c69d9-000000@us-west-2.amazonses.com>
Date: Sun, 1 Oct 2023 18:13:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 18:13:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188575

--===============7009953085331701283==
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
From dca8401fd4ebbdbff537ba9a55c8bfdc56b74300 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Oct 2023 16:23:16 +0000
Subject: [PATCH] linux-firmware: upgrade 20230804 -> 20230919

---
 ...20230804.bb => linux-firmware_20230919.bb} | 384 +++++++++++++++++-
 1 file changed, 382 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20230804.bb => linux-firmware_20230919.bb} (79%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230919.bb
similarity index 79%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20230919.bb
index ee14630ce0..efdce9d952 100644
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
@@ -134,7 +514,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=${WHENCE_CHKSUM} \
+                    file://WHENCE;md5=2248e15a314a6db17cd94231d32eea17 \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
@@ -218,7 +598,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "88d46c543847ee3b03404d4941d91c92974690ee1f6fdcbee9cef3e5f97db688"
+SRC_URI[sha256sum] = "97fada0d02bdafc4e017a4dcc456e7fa48bc8daf2ddf75161f39a92e38f084ad"
 
 inherit allarch
 
-- 
2.39.2


--===============7009953085331701283==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/linux-firmware: SRC_URI changed from "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20230804.tar.xz" to "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20230919.tar.xz"
packages/all-poky-linux/linux-firmware: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PKGSIZE changed from 80314150 to 80320166 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: RDEPENDS: added "linux-firmware-qcom-sdm845-modem"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PKGSIZE changed from 16465860 to 12713844 (-23%)
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: FILELIST: removed "/usr/lib/firmware/ath10k/WCN3990/hw1.0/notice.txt_wlanmdsp"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2-mips: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2-mips: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dev: RRECOMMENDS: removed "linux-firmware-ath10k-dev", added "linux-firmware-qcom-sdm845-modem-dev linux-firmware-qcom-sc8280xp-lenovo-x13s-audio-dev"
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-gplv2-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-gplv2-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGSIZE changed from 26630347 to 27765163 (+4%)
packages/all-poky-linux/linux-firmware/linux-firmware-i915: FILELIST: added "/usr/lib/firmware/i915/mtl_gsc_1.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PKGSIZE changed from 2402083 to 2399511 (-0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGSIZE changed from 17514185 to 17329041 (-1%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8987-sdio: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8987-sdio: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-common: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-common: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-pcie: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-pcie: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-sdio: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-sdio: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-common: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-common: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-pcie: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-pcie: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-sdio: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-sdio: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw416-sdio: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw416-sdio: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw612-sdio: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw612-sdio: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PKGSIZE changed from 2168523 to 2185947 (+1%)
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-modem: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-modem: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-wifi: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-wifi: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-adreno: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-adreno: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-adreno: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-adreno: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: RDEPENDS: removed "linux-firmware-ath10k"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PKGSIZE changed from 5916348 to 9641353 (+63%)
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-thundercomm-db845c-sensors: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-thundercomm-db845c-sensors: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-adreno: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-adreno: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PKGSIZE changed from 5822631 to 5826727 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PKGSIZE changed from 1973549 to 1974893 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-yamato-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-yamato-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8761: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8761: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8822: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8822: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-src: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-src: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGSIZE changed from 236962 to 240527 (+2%)
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PKGV changed from 20230804 [default] to 20230919 [default]
packages/all-poky-linux/linux-firmware/linux-firmware: RDEPENDS: added "linux-firmware-qcom-sc8280xp-lenovo-x13s-audio"
packages/all-poky-linux/linux-firmware/linux-firmware: PV changed from "20230804" to "20230919"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGSIZE changed from 279157731 to 337649447 (+21%)
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: removed "/usr/lib/firmware/cxgb4/t6fw-1.27.3.0.bin /usr/lib/firmware/cxgb4/t5fw-1.27.3.0.bin /usr/lib/firmware/cxgb4/t4fw-1.27.3.0.bin", added "/usr/lib/firmware/qcom/qcm2290/modemr.jsn /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c46.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c47.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c48.wmfw /usr/lib/firmware/qcom/sc8280xp/SC8280XP-LENOVO-X13S-tplg.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c46.wmfw /usr/lib/firmware/qcom/qrb4210/adspua.jsn /usr/lib/firmware/qcom/venus-6.0/venus.mbn /usr/lib/firmware/qcom/qcm2290/adsps.jsn /usr/lib/firmware/qcom/qrb4210/adsp.mbn /usr/lib/firmware/qcom/qrb4210/cdsp.mbn /usr/lib/firmware/cxgb4/t5fw-1.27.4.0.bin /usr/lib/firmware/cxgb4/t6fw-1.27.4.0.bin /usr/lib/firmware/cxgb4/t4fw-1.27.4.0.bin /usr/lib/firmware/qcom/qcm2290/modem.mbn /usr/lib/firmware/cirrus/cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0
 .wmfw /usr/lib/firmware/qcom/sdm845/notice.txt_wlanmdsp /usr/lib/firmware/qcom/qrb4210/modemuw.jsn /usr/lib/firmware/qcom/qcm2290/a702_zap.mbn /usr/lib/firmware/qcom/sm8250/Thundercomm/RB5/slpir.jsn /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c47.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c48.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c49.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c70.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c71.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c72.bin /usr/lib/firmware/qcom/qrb4210/adspr.jsn /usr/lib/firmware/qcom/qrb4210/adsps.jsn /usr/lib/firmware/qcom/qrb4210/cdspr.jsn /usr/lib/firmware/qcom/a702_sqe.fw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c49.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c46.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c47.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c48.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-sp
 k-cali-103c8c70.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c71.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c72.bin /usr/lib/firmware/qcom/sm8250/Thundercomm/RB5/slpius.jsn /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c46.bin /usr/lib/firmware/qcom/qrb4210/modemr.jsn /usr/lib/firmware/qcom/sm8250/Thundercomm/RB5/slpi.mbn /usr/lib/firmware/qcom/qcm2290/adspua.jsn /usr/lib/firmware/rtl_bt/rtl8852cu_fw_v2.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c71.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c72.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c49.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c70.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c70.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c47.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c49.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c48.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c71.wmfw /usr/li
 b/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c72.wmfw /usr/lib/firmware/amd/amd_sev_fam19h_model1xh.sbin /usr/lib/firmware/qcom/qcm2290/adsp.mbn /usr/lib/firmware/qcom/qcm2290/wlanmdsp.mbn /usr/lib/firmware/qcom/qrb4210/modem.mbn /usr/lib/firmware/qcom/qrb4210/a610_zap.mbn /usr/lib/firmware/qcom/qrb4210/wlanmdsp.mbn /usr/lib/firmware/qcom/qcm2290/modemuw.jsn /usr/lib/firmware/qcom/qcm2290/adspr.jsn"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGV changed from 20230804 [default] to 20230919 [default]

--===============7009953085331701283==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-linux-firmware-upgrade-20230804-20230919.patch"

RnJvbSBkY2E4NDAxZmQ0ZWJiZGJmZjUzN2JhOWE1NWM4YmZkYzU2Yjc0MzAwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBPY3QgMjAyMyAxNjoyMzoxNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
bnV4LWZpcm13YXJlOiB1cGdyYWRlIDIwMjMwODA0IC0+IDIwMjMwOTE5CgotLS0KIC4uLjIwMjMw
ODA0LmJiID0+IGxpbnV4LWZpcm13YXJlXzIwMjMwOTE5LmJifSB8IDM4NCArKysrKysrKysrKysr
KysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzODIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL3tsaW51eC1maXJtd2Fy
ZV8yMDIzMDgwNC5iYiA9PiBsaW51eC1maXJtd2FyZV8yMDIzMDkxOS5iYn0gKDc5JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJl
XzIwMjMwODA0LmJiIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1m
aXJtd2FyZV8yMDIzMDkxOS5iYgpzaW1pbGFyaXR5IGluZGV4IDc5JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlXzIwMjMwODA0LmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13
YXJlXzIwMjMwOTE5LmJiCmluZGV4IGVlMTQ2MzBjZTAuLmVmZGNlOWQ5NTIgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgtZmlybXdhcmVfMjAyMzA4
MDQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJt
d2FyZV8yMDIzMDkxOS5iYgpAQCAtMSwzICsxLDM4MyBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxF
U19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgor
IyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhl
IG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYg
bmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2Fn
ZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRl
OiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0t
IFdIRU5DRQorIyArKysgV0hFTkNFCisjIEBAIC01MzYsMTQgKzUzNiwxNCBAQAorIyAgCisjICBG
aWxlOiBjeGdiNC90NGZ3LTEuMTQuNC4wLmJpbgorIyAgRmlsZTogY3hnYjQvdDRmdy0xLjE1LjM3
LjAuYmluCisjIC1GaWxlOiBjeGdiNC90NGZ3LTEuMjcuMy4wLmJpbgorIyAtTGluazogY3hnYjQv
dDRmdy5iaW4gLT4gdDRmdy0xLjI3LjMuMC5iaW4KKyMgK0ZpbGU6IGN4Z2I0L3Q0ZnctMS4yNy40
LjAuYmluCisjICtMaW5rOiBjeGdiNC90NGZ3LmJpbiAtPiB0NGZ3LTEuMjcuNC4wLmJpbgorIyAg
RmlsZTogY3hnYjQvdDVmdy0xLjE0LjQuMC5iaW4KKyMgIEZpbGU6IGN4Z2I0L3Q1ZnctMS4xNS4z
Ny4wLmJpbgorIyAtRmlsZTogY3hnYjQvdDVmdy0xLjI3LjMuMC5iaW4KKyMgLUxpbms6IGN4Z2I0
L3Q1ZncuYmluIC0+IHQ1ZnctMS4yNy4zLjAuYmluCisjIC1GaWxlOiBjeGdiNC90NmZ3LTEuMjcu
My4wLmJpbgorIyAtTGluazogY3hnYjQvdDZmdy5iaW4gLT4gdDZmdy0xLjI3LjMuMC5iaW4KKyMg
K0ZpbGU6IGN4Z2I0L3Q1ZnctMS4yNy40LjAuYmluCisjICtMaW5rOiBjeGdiNC90NWZ3LmJpbiAt
PiB0NWZ3LTEuMjcuNC4wLmJpbgorIyArRmlsZTogY3hnYjQvdDZmdy0xLjI3LjQuMC5iaW4KKyMg
K0xpbms6IGN4Z2I0L3Q2ZncuYmluIC0+IHQ2ZnctMS4yNy40LjAuYmluCisjICBGaWxlOiBjeGdi
NC9hcTEyMDJfZncuY2xkCisjICBGaWxlOiBjeGdiNC9iY204NDgzLmJpbgorIyAgRmlsZTogY3hn
YjQvY29uZmlncy90NC1jb25maWctZGVmYXVsdC50eHQKKyMgQEAgLTMzOTUsMTAgKzMzOTUsMTAg
QEAKKyMgIEZpbGU6IGF0aDEway9RQ0E5Mzc3L2h3MS4wL25vdGljZV9hdGgxMGtfZmlybXdhcmUt
Ni50eHQKKyMgIEZpbGU6IGF0aDEway9XQ04zOTkwL2h3MS4wL2JvYXJkLTIuYmluCisjICBGaWxl
OiBhdGgxMGsvV0NOMzk5MC9odzEuMC9maXJtd2FyZS01LmJpbgorIyAtRmlsZTogYXRoMTBrL1dD
TjM5OTAvaHcxLjAvd2xhbm1kc3AubWJuCisjIC1MaW5rOiBxY29tL3NkbTg0NS93bGFubWRzcC5t
Ym4gLT4gLi4vLi4vYXRoMTBrL1dDTjM5OTAvaHcxLjAvd2xhbm1kc3AubWJuCisjICtGaWxlOiBx
Y29tL3NkbTg0NS93bGFubWRzcC5tYm4KKyMgK0xpbms6IGF0aDEway9XQ04zOTkwL2h3MS4wL3ds
YW5tZHNwLm1ibiAtPiAuLi8uLi8uLi9xY29tL3NkbTg0NS93bGFubWRzcC5tYm4KKyMgIFZlcnNp
b246IFdMQU4uSEwuMi4wLTAxMzg3LVFDQUhMU1dNVFBMWi0xCisjIC1GaWxlOiBhdGgxMGsvV0NO
Mzk5MC9odzEuMC9ub3RpY2UudHh0X3dsYW5tZHNwCisjICtGaWxlOiBxY29tL3NkbTg0NS9ub3Rp
Y2UudHh0X3dsYW5tZHNwCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJ
Q0VOU0UuUXVhbGNvbW1BdGhlcm9zX2F0aDEwayBmb3IgZGV0YWlscworIyAgCisjIEBAIC0zNjk3
LDY5ICszNjk3LDY5IEBACisjICBGaWxlOiBpbnRlbC9pYnQtMTgtMS5kZGMKKyMgIFZlcnNpb246
IEJUX1RodW5kZXJQZWFrX0EwX0IwX1JFTDAyMDEKKyMgIEZpbGU6aW50ZWwvaWJ0LTIwLTAtMy5z
ZmkKKyMgLVZlcnNpb246IEJUX0N5Y2xvbmVQZWFrX0EwX1JFTDUzNDU0CisjICtWZXJzaW9uOiBC
VF9DeWNsb25lUGVha19BMF9SRUw1MzQ5NworIyAgRmlsZTppbnRlbC9pYnQtMjAtMC0zLmRkYwor
IyAtVmVyc2lvbjogQlRfQ3ljbG9uZVBlYWtfQTBfUkVMNTM0NTQKKyMgK1ZlcnNpb246IEJUX0N5
Y2xvbmVQZWFrX0EwX1JFTDUzNDk3CisjICBGaWxlOmludGVsL2lidC0yMC0xLTMuc2ZpCisjIC1W
ZXJzaW9uOiBCVF9DeWNsb25lUGVha19BMF9SRUw1MzQ1NAorIyArVmVyc2lvbjogQlRfQ3ljbG9u
ZVBlYWtfQTBfUkVMNTM0OTcKKyMgIEZpbGU6aW50ZWwvaWJ0LTIwLTEtMy5kZGMKKyMgLVZlcnNp
b246IEJUX0N5Y2xvbmVQZWFrX0EwX1JFTDUzNDU0CisjICtWZXJzaW9uOiBCVF9DeWNsb25lUGVh
a19BMF9SRUw1MzQ5NworIyAgRmlsZTppbnRlbC9pYnQtMjAtMS00LnNmaQorIyAtVmVyc2lvbjog
QlRfQ3ljbG9uZVBlYWtfQTBfUkVMNTM0NTQKKyMgK1ZlcnNpb246IEJUX0N5Y2xvbmVQZWFrX0Ew
X1JFTDUzNDk3CisjICBGaWxlOmludGVsL2lidC0yMC0xLTQuZGRjCisjIC1WZXJzaW9uOiBCVF9D
eWNsb25lUGVha19BMF9SRUw1MzQ1NAorIyArVmVyc2lvbjogQlRfQ3ljbG9uZVBlYWtfQTBfUkVM
NTM0OTcKKyMgIEZpbGU6aW50ZWwvaWJ0LTE5LTAtMC5zZmkKKyMgLVZlcnNpb246IEJUX1F1YXNh
cl9SRUw1MzQ1NAorIyArVmVyc2lvbjogQlRfUXVhc2FyX1JFTDUzNDk3CisjICBGaWxlOmludGVs
L2lidC0xOS0wLTAuZGRjCisjIC1WZXJzaW9uOiBCVF9RdWFzYXJfUkVMNTM0NTQKKyMgK1ZlcnNp
b246IEJUX1F1YXNhcl9SRUw1MzQ5NworIyAgRmlsZTppbnRlbC9pYnQtMTktMC0xLnNmaQorIyAt
VmVyc2lvbjogQlRfUXVhc2FyX1JFTDUzNDU0CisjICtWZXJzaW9uOiBCVF9RdWFzYXJfUkVMNTM0
OTcKKyMgIEZpbGU6aW50ZWwvaWJ0LTE5LTAtMS5kZGMKKyMgLVZlcnNpb246IEJUX1F1YXNhcl9S
RUw1MzQ1NAorIyArVmVyc2lvbjogQlRfUXVhc2FyX1JFTDUzNDk3CisjICBGaWxlOmludGVsL2li
dC0xOS0wLTMuc2ZpCisjICBWZXJzaW9uOiBCVF9RdWFzYXJfUkVMNTMyNjMKKyMgIEZpbGU6aW50
ZWwvaWJ0LTE5LTAtMy5kZGMKKyMgIFZlcnNpb246IEJUX1F1YXNhcl9SRUw1MzI2MworIyAgRmls
ZTppbnRlbC9pYnQtMTktMC00LnNmaQorIyAtVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDUz
NDU0CisjICtWZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMNTM0OTcKKyMgIEZpbGU6aW50ZWwv
aWJ0LTE5LTAtNC5kZGMKKyMgLVZlcnNpb246IEJUX0hhcnJpc29uUGVha19SRUw1MzQ1NAorIyAr
VmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDUzNDk3CisjICBGaWxlOmludGVsL2lidC0xOS0x
Ni00LnNmaQorIyAtVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDUzNDU0CisjICtWZXJzaW9u
OiBCVF9IYXJyaXNvblBlYWtfUkVMNTM0OTcKKyMgIEZpbGU6aW50ZWwvaWJ0LTE5LTE2LTQuZGRj
CisjIC1WZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMNTM0NTQKKyMgK1ZlcnNpb246IEJUX0hh
cnJpc29uUGVha19SRUw1MzQ5NworIyAgRmlsZTppbnRlbC9pYnQtMTktMzItMS5zZmkKKyMgLVZl
cnNpb246IEJUX0hhcnJpc29uUGVha19SRUw1MzQ1NAorIyArVmVyc2lvbjogQlRfSGFycmlzb25Q
ZWFrX1JFTDUzNDk3CisjICBGaWxlOmludGVsL2lidC0xOS0zMi0xLmRkYworIyAtVmVyc2lvbjog
QlRfSGFycmlzb25QZWFrX1JFTDUzNDU0CisjICtWZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVM
NTM0OTcKKyMgIEZpbGU6aW50ZWwvaWJ0LTE5LTMyLTAuc2ZpCisjIC1WZXJzaW9uOiBCVF9IYXJy
aXNvblBlYWtfUkVMNTM0NTQKKyMgK1ZlcnNpb246IEJUX0hhcnJpc29uUGVha19SRUw1MzQ5Nwor
IyAgRmlsZTppbnRlbC9pYnQtMTktMzItMC5kZGMKKyMgLVZlcnNpb246IEJUX0hhcnJpc29uUGVh
a19SRUw1MzQ1NAorIyArVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDUzNDk3CisjICBGaWxl
OmludGVsL2lidC0xOS0zMi00LnNmaQorIyAtVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDUz
NDU0CisjICtWZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMNTM0OTcKKyMgIEZpbGU6aW50ZWwv
aWJ0LTE5LTMyLTQuZGRjCisjIC1WZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMNTM0NTQKKyMg
K1ZlcnNpb246IEJUX0hhcnJpc29uUGVha19SRUw1MzQ5NworIyAgRmlsZTppbnRlbC9pYnQtMTkt
MjQwLTEuc2ZpCisjIC1WZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMNTM0NTQKKyMgK1ZlcnNp
b246IEJUX0hhcnJpc29uUGVha19SRUw1MzQ5NworIyAgRmlsZTppbnRlbC9pYnQtMTktMjQwLTEu
ZGRjCisjIC1WZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMNTM0NTQKKyMgK1ZlcnNpb246IEJU
X0hhcnJpc29uUGVha19SRUw1MzQ5NworIyAgRmlsZTppbnRlbC9pYnQtMTktMjQwLTQuc2ZpCisj
IC1WZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMNTM0NTQKKyMgK1ZlcnNpb246IEJUX0hhcnJp
c29uUGVha19SRUw1MzQ5NworIyAgRmlsZTppbnRlbC9pYnQtMTktMjQwLTQuZGRjCisjIC1WZXJz
aW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMNTM0NTQKKyMgK1ZlcnNpb246IEJUX0hhcnJpc29uUGVh
a19SRUw1MzQ5NworIyAgRmlsZTppbnRlbC9pYnQtMDA0MS0wMDQxLnNmaQorIyAtVmVyc2lvbjog
QlRfVHlwaG9vblBlYWtfUkVMNjcwNjgKKyMgK1ZlcnNpb246IEJUX1R5cGhvb25QZWFrX1JFTDY4
MzUwCisjICBGaWxlOmludGVsL2lidC0wMDQxLTAwNDEuZGRjCisjIC1WZXJzaW9uOiBCVF9UeXBo
b29uUGVha19SRUw2NzA2OAorIyArVmVyc2lvbjogQlRfVHlwaG9vblBlYWtfUkVMNjgzNTAKKyMg
IEZpbGU6aW50ZWwvaWJ0LTAwNDAtMDA0MS5zZmkKKyMgLVZlcnNpb246IEJUX1NvbGFyX0dmUDJf
UkVMNjcwNjgKKyMgK1ZlcnNpb246IEJUX1NvbGFyX0dmUDJfUkVMNjgzNTAKKyMgIEZpbGU6aW50
ZWwvaWJ0LTAwNDAtMDA0MS5kZGMKKyMgLVZlcnNpb246IEJUX1NvbGFyX0dmUDJfUkVMNjcwNjgK
KyMgK1ZlcnNpb246IEJUX1NvbGFyX0dmUDJfUkVMNjgzNTAKKyMgIEZpbGU6aW50ZWwvaWJ0LTEw
NDAtMDA0MS5zZmkKKyMgLVZlcnNpb246IEJUX1NvbGFyRl9HZlAyX1JFTDY3MDY4CisjICtWZXJz
aW9uOiBCVF9Tb2xhckZfR2ZQMl9SRUw2ODM1MAorIyAgRmlsZTppbnRlbC9pYnQtMTA0MC0wMDQx
LmRkYworIyAtVmVyc2lvbjogQlRfU29sYXJGX0dmUDJfUkVMNjcwNjgKKyMgK1ZlcnNpb246IEJU
X1NvbGFyRl9HZlAyX1JFTDY4MzUwCisjICAKKyMgIEZpbGU6aW50ZWwvaWJ0LTAwNDAtMTAyMC5z
ZmkKKyMgIFZlcnNpb246IEJUX1NvbGFyX0pmUDFfUkVMNTk1NjQKKyMgQEAgLTM3ODAsMTMgKzM3
ODAsMTMgQEAKKyMgIFZlcnNpb246IEJUX1NvbGFyRl9KZlAyX1JFTDU5NTY0CisjICAKKyMgIEZp
bGU6aW50ZWwvaWJ0LTAwNDAtNDE1MC5zZmkKKyMgLVZlcnNpb246IEJUX1NvbGFyX0puUDJfUkVM
NjcwNjgKKyMgK1ZlcnNpb246IEJUX1NvbGFyX0puUDJfUkVMNjgzNTAKKyMgIEZpbGU6aW50ZWwv
aWJ0LTAwNDAtNDE1MC5kZGMKKyMgLVZlcnNpb246IEJUX1NvbGFyX0puUDJfUkVMNjcwNjgKKyMg
K1ZlcnNpb246IEJUX1NvbGFyX0puUDJfUkVMNjgzNTAKKyMgIEZpbGU6aW50ZWwvaWJ0LTEwNDAt
NDE1MC5zZmkKKyMgLVZlcnNpb246IEJUX1NvbGFyRl9KblAyX1JFTDY3MDY4CisjICtWZXJzaW9u
OiBCVF9Tb2xhckZfSm5QMl9SRUw2ODM1MAorIyAgRmlsZTppbnRlbC9pYnQtMTA0MC00MTUwLmRk
YworIyAtVmVyc2lvbjogQlRfU29sYXJGX0puUDJfUkVMNjcwNjgKKyMgK1ZlcnNpb246IEJUX1Nv
bGFyRl9KblAyX1JFTDY4MzUwCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2Vl
IExJQ0VOQ0UuaWJ0X2Zpcm13YXJlIGZvciBkZXRhaWxzCisjICAKKyMgQEAgLTM4MjIsNiArMzgy
Miw3IEBACisjICBGaWxlOiBydGxfYnQvcnRsODg1MmJ1X2Z3LmJpbgorIyAgRmlsZTogcnRsX2J0
L3J0bDg4NTJidV9jb25maWcuYmluCisjICBGaWxlOiBydGxfYnQvcnRsODg1MmN1X2Z3LmJpbgor
IyArRmlsZTogcnRsX2J0L3J0bDg4NTJjdV9md192Mi5iaW4KKyMgIEZpbGU6IHJ0bF9idC9ydGw4
ODUyY3VfY29uZmlnLmJpbgorIyAgRmlsZTogcnRsX2J0L3J0bDg4NTFidV9mdy5iaW4KKyMgIEZp
bGU6IHJ0bF9idC9ydGw4ODUxYnVfY29uZmlnLmJpbgorIyBAQCAtMzkwMSw3ICszOTAyLDkgQEAK
KyMgIEZpbGU6IGFtZC9hbWRfc2V2X2ZhbTE3aF9tb2RlbDN4aC5zYmluCisjICBWZXJzaW9uOiAy
MDIyLTItMjUKKyMgIEZpbGU6IGFtZC9hbWRfc2V2X2ZhbTE5aF9tb2RlbDB4aC5zYmluCisjIC1W
ZXJzaW9uOiAyMDIyLTItMjUKKyMgK1ZlcnNpb246IDIwMjMtOC0yMworIyArRmlsZTogYW1kL2Ft
ZF9zZXZfZmFtMTloX21vZGVsMXhoLnNiaW4KKyMgK1ZlcnNpb246IDIwMjMtOC0yMworIyAgCisj
ICBMaWNlbnNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLmFtZC1zZXYgZm9yIGRldGFp
bHMKKyMgIAorIyBAQCAtMzkwOSwyMSArMzkxMiwxNiBAQAorIyAgCisjICBEcml2ZXI6IG1pY3Jv
Y29kZV9hbWQgLSBBTUQgQ1BVIE1pY3JvY29kZSBVcGRhdGUgRHJpdmVyIGZvciBMaW51eAorIyAg
CisjIC1GaWxlOiBhbWQtdWNvZGUvbWljcm9jb2RlX2FtZC5iaW4KKyMgLVJhdzogYW1kLXVjb2Rl
L21pY3JvY29kZV9hbWQuYmluCisjICtSYXdGaWxlOiBhbWQtdWNvZGUvbWljcm9jb2RlX2FtZC5i
aW4KKyMgIFZlcnNpb246IDIwMTMtMDctMTAKKyMgLUZpbGU6IGFtZC11Y29kZS9taWNyb2NvZGVf
YW1kX2ZhbTE1aC5iaW4KKyMgLVJhdzogYW1kLXVjb2RlL21pY3JvY29kZV9hbWRfZmFtMTVoLmJp
bgorIyArUmF3RmlsZTogYW1kLXVjb2RlL21pY3JvY29kZV9hbWRfZmFtMTVoLmJpbgorIyAgVmVy
c2lvbjogMjAxOC0wNS0yNAorIyAtRmlsZTogYW1kLXVjb2RlL21pY3JvY29kZV9hbWRfZmFtMTZo
LmJpbgorIyAtUmF3OiBhbWQtdWNvZGUvbWljcm9jb2RlX2FtZF9mYW0xNmguYmluCisjICtSYXdG
aWxlOiBhbWQtdWNvZGUvbWljcm9jb2RlX2FtZF9mYW0xNmguYmluCisjICBWZXJzaW9uOiAyMDE0
LTEwLTI4CisjIC1GaWxlOiBhbWQtdWNvZGUvbWljcm9jb2RlX2FtZF9mYW0xN2guYmluCisjIC1S
YXc6IGFtZC11Y29kZS9taWNyb2NvZGVfYW1kX2ZhbTE3aC5iaW4KKyMgK1Jhd0ZpbGU6IGFtZC11
Y29kZS9taWNyb2NvZGVfYW1kX2ZhbTE3aC5iaW4KKyMgIFZlcnNpb246IDIwMjMtMDctMTkKKyMg
LUZpbGU6IGFtZC11Y29kZS9taWNyb2NvZGVfYW1kX2ZhbTE5aC5iaW4KKyMgLVJhdzogYW1kLXVj
b2RlL21pY3JvY29kZV9hbWRfZmFtMTloLmJpbgorIyAtVmVyc2lvbjogMjAyMy0wNy0xOAorIyAr
UmF3RmlsZTogYW1kLXVjb2RlL21pY3JvY29kZV9hbWRfZmFtMTloLmJpbgorIyArVmVyc2lvbjog
MjAyMy0wOC0wOAorIyAgRmlsZTogYW1kLXVjb2RlL1JFQURNRQorIyAgCisjICBMaWNlbnNlOiBS
ZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLmFtZC11Y29kZSBmb3IgZGV0YWlscworIyBAQCAt
NDcyMSwxMyArNDcxOSwxNiBAQAorIyAgVmVyc2lvbjogRE1DIEFQSS9BUEIgdmVyIDIgcmVsZWFz
ZSAxMCBmb3IgTWV0ZW9ybGFrZQorIyAgCisjICBGaWxlOiBpOTE1L210bF9kbWMuYmluCisjIC1W
ZXJzaW9uOiBETUMgQVBJL0FQQiB2ZXIgMiByZWxlYXNlIDEzIGZvciBNZXRlb3JsYWtlCisjICtW
ZXJzaW9uOiBETUMgQVBJL0FQQiB2ZXIgMiByZWxlYXNlIDE2IGZvciBNZXRlb3JsYWtlCisjICAK
KyMgIEZpbGU6IGk5MTUvbXRsX2d1Y183MC5iaW4KKyMgIFZlcnNpb246IEd1QyBBUEkvQVBCIHZl
ciA3MC44LjAgZm9yIE1ldGVvcmxha2UKKyMgIAorIyAgRmlsZTogaTkxNS9tdGxfaHVjX2dzYy5i
aW4KKyMgLVZlcnNpb246IEh1QyBBUEkvQVBCIHZlciA4LjUuMSBmb3IgTWV0ZW9ybGFrZQorIyAr
VmVyc2lvbjogSHVDIEFQSS9BUEIgdmVyIDguNS40IGZvciBNZXRlb3JsYWtlCisjICsKKyMgK0Zp
bGU6IGk5MTUvbXRsX2dzY18xLmJpbgorIyArVmVyc2lvbjogR1NDIEFQSS9BUEIgdjEuMCwgcmVs
ZWFzZSAxMDIuMC4wLjE2NTUsIFNWTiAxIGZvciBNZXRlb3JsYWtlCisjICAKKyMgIExpY2Vuc2U6
IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UuaTkxNSBmb3IgZGV0YWlscworIyAgLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KKyMgQEAgLTU1NDgsNiArNTU0OSwxMCBAQAorIyAgCisjICBWZXJzaW9uOiA1
LjQtMDAwNTMKKyMgIAorIyArRmlsZTogcWNvbS92ZW51cy02LjAvdmVudXMubWJuCisjICsKKyMg
K1ZlcnNpb246IFZJREVPLlZFLjYuMC0wMDA0OS1QUk9ELTEKKyMgKworIyAgRmlsZTogcWNvbS92
cHUtMS4wL3ZlbnVzLm1ibgorIyAgTGluazogcWNvbS92cHUtMS4wL3ZlbnVzLm1kdCAtPiB2ZW51
cy5tYm4KKyMgIAorIyBAQCAtNTU5OCw2ICs1NjAzLDcgQEAKKyMgIEZpbGU6IHFjb20vc204MjUw
L2E2NTBfemFwLm1ibgorIyAgRmlsZTogcWNvbS9hNjYwX2dtdS5iaW4KKyMgIEZpbGU6IHFjb20v
YTY2MF9zcWUuZncKKyMgK0ZpbGU6IHFjb20vYTcwMl9zcWUuZncKKyMgIEZpbGU6IHFjb20vbGVp
YV9wZnBfNDcwLmZ3CisjICBGaWxlOiBxY29tL2xlaWFfcG00XzQ3MC5mdworIyAgRmlsZTogcWNv
bS9zYzgyODB4cC9MRU5PVk8vMjFCWC9xY2R4a21zdWM4MjgwLm1ibgorIyBAQCAtNTYyOSwyOCAr
NTYzNSw1MSBAQAorIyAgRmlsZTogcWNvbS9hcHE4MDE2L3djbnNzLm1ibgorIyAgRmlsZTogcWNv
bS9hcHE4MDE2L1dDTlNTX3Fjb21fd2xhbl9udl9zYmMuYmluCisjICBGaWxlOiBxY29tL2FwcTgw
OTYvYWRzcC5tYm4KKyMgLUZpbGU6IHFjb20vYXBxODA5Ni9hZHNwci5qc24KKyMgLUZpbGU6IHFj
b20vYXBxODA5Ni9hZHNwdWEuanNuCisjICtSYXdGaWxlOiBxY29tL2FwcTgwOTYvYWRzcHIuanNu
CisjICtSYXdGaWxlOiBxY29tL2FwcTgwOTYvYWRzcHVhLmpzbgorIyAgRmlsZTogcWNvbS9hcHE4
MDk2L21iYS5tYm4KKyMgIEZpbGU6IHFjb20vYXBxODA5Ni9tb2RlbS5tYm4KKyMgLUZpbGU6IHFj
b20vYXBxODA5Ni9tb2RlbXIuanNuCisjICtSYXdGaWxlOiBxY29tL2FwcTgwOTYvbW9kZW1yLmpz
bgorIyArRmlsZTogcWNvbS9xY20yMjkwL2E3MDJfemFwLm1ibgorIyArRmlsZTogcWNvbS9xY20y
MjkwL2Fkc3AubWJuCisjICtSYXdGaWxlOiBxY29tL3FjbTIyOTAvYWRzcHIuanNuCisjICtSYXdG
aWxlOiBxY29tL3FjbTIyOTAvYWRzcHMuanNuCisjICtSYXdGaWxlOiBxY29tL3FjbTIyOTAvYWRz
cHVhLmpzbgorIyArRmlsZTogcWNvbS9xY20yMjkwL21vZGVtLm1ibgorIyArUmF3RmlsZTogcWNv
bS9xY20yMjkwL21vZGVtci5qc24KKyMgK1Jhd0ZpbGU6IHFjb20vcWNtMjI5MC9tb2RlbXV3Lmpz
bgorIyArRmlsZTogcWNvbS9xY20yMjkwL3dsYW5tZHNwLm1ibgorIyArRmlsZTogcWNvbS9xcmI0
MjEwL2E2MTBfemFwLm1ibgorIyArRmlsZTogcWNvbS9xcmI0MjEwL2Fkc3AubWJuCisjICtSYXdG
aWxlOiBxY29tL3FyYjQyMTAvYWRzcHIuanNuCisjICtSYXdGaWxlOiBxY29tL3FyYjQyMTAvYWRz
cHMuanNuCisjICtSYXdGaWxlOiBxY29tL3FyYjQyMTAvYWRzcHVhLmpzbgorIyArRmlsZTogcWNv
bS9xcmI0MjEwL2Nkc3AubWJuCisjICtSYXdGaWxlOiBxY29tL3FyYjQyMTAvY2RzcHIuanNuCisj
ICtGaWxlOiBxY29tL3FyYjQyMTAvbW9kZW0ubWJuCisjICtSYXdGaWxlOiBxY29tL3FyYjQyMTAv
bW9kZW1yLmpzbgorIyArUmF3RmlsZTogcWNvbS9xcmI0MjEwL21vZGVtdXcuanNuCisjICtMaW5r
OiBxY29tL3FyYjQyMTAvd2xhbm1kc3AubWJuIC0+IC4uL3FjbTIyOTAvd2xhbm1kc3AubWJuCisj
ICBGaWxlOiBxY29tL3NkbTg0NS9hZHNwLm1ibgorIyAtRmlsZTogcWNvbS9zZG04NDUvYWRzcHIu
anNuCisjIC1GaWxlOiBxY29tL3NkbTg0NS9hZHNwdWEuanNuCisjICtSYXdGaWxlOiBxY29tL3Nk
bTg0NS9hZHNwci5qc24KKyMgK1Jhd0ZpbGU6IHFjb20vc2RtODQ1L2Fkc3B1YS5qc24KKyMgIEZp
bGU6IHFjb20vc2RtODQ1L2Nkc3AubWJuCisjIC1GaWxlOiBxY29tL3NkbTg0NS9jZHNwci5qc24K
KyMgK1Jhd0ZpbGU6IHFjb20vc2RtODQ1L2Nkc3ByLmpzbgorIyAgRmlsZTogcWNvbS9zZG04NDUv
VGh1bmRlcmNvbW0vZGI4NDVjL3NscGkubWJuCisjIC1GaWxlOiBxY29tL3NkbTg0NS9UaHVuZGVy
Y29tbS9kYjg0NWMvc2xwaXIuanNuCisjIC1GaWxlOiBxY29tL3NkbTg0NS9UaHVuZGVyY29tbS9k
Yjg0NWMvc2xwaXVzLmpzbgorIyArUmF3RmlsZTogcWNvbS9zZG04NDUvVGh1bmRlcmNvbW0vZGI4
NDVjL3NscGlyLmpzbgorIyArUmF3RmlsZTogcWNvbS9zZG04NDUvVGh1bmRlcmNvbW0vZGI4NDVj
L3NscGl1cy5qc24KKyMgIEZpbGU6IHFjb20vc204MjUwL2Fkc3AubWJuCisjIC1GaWxlOiBxY29t
L3NtODI1MC9hZHNwci5qc24KKyMgLUZpbGU6IHFjb20vc204MjUwL2Fkc3B1YS5qc24KKyMgK1Jh
d0ZpbGU6IHFjb20vc204MjUwL2Fkc3ByLmpzbgorIyArUmF3RmlsZTogcWNvbS9zbTgyNTAvYWRz
cHVhLmpzbgorIyAgRmlsZTogcWNvbS9zbTgyNTAvY2RzcC5tYm4KKyMgLUZpbGU6IHFjb20vc204
MjUwL2Nkc3ByLmpzbgorIyAtRmlsZTogcWNvbS9zYzgyODB4cC9MRU5PVk8vMjFCWC9hZHNwci5q
c24KKyMgLUZpbGU6IHFjb20vc2M4MjgweHAvTEVOT1ZPLzIxQlgvYWRzcHVhLmpzbgorIyAtRmls
ZTogcWNvbS9zYzgyODB4cC9MRU5PVk8vMjFCWC9iYXR0bWdyLmpzbgorIyAtRmlsZTogcWNvbS9z
YzgyODB4cC9MRU5PVk8vMjFCWC9jZHNwci5qc24KKyMgK1Jhd0ZpbGU6IHFjb20vc204MjUwL2Nk
c3ByLmpzbgorIyArRmlsZTogcWNvbS9zbTgyNTAvVGh1bmRlcmNvbW0vUkI1L3NscGkubWJuCisj
ICtSYXdGaWxlOiBxY29tL3NtODI1MC9UaHVuZGVyY29tbS9SQjUvc2xwaXIuanNuCisjICtSYXdG
aWxlOiBxY29tL3NtODI1MC9UaHVuZGVyY29tbS9SQjUvc2xwaXVzLmpzbgorIyArUmF3RmlsZTog
cWNvbS9zYzgyODB4cC9MRU5PVk8vMjFCWC9hZHNwci5qc24KKyMgK1Jhd0ZpbGU6IHFjb20vc2M4
MjgweHAvTEVOT1ZPLzIxQlgvYWRzcHVhLmpzbgorIyArUmF3RmlsZTogcWNvbS9zYzgyODB4cC9M
RU5PVk8vMjFCWC9iYXR0bWdyLmpzbgorIyArUmF3RmlsZTogcWNvbS9zYzgyODB4cC9MRU5PVk8v
MjFCWC9jZHNwci5qc24KKyMgIEZpbGU6IHFjb20vc2M4MjgweHAvTEVOT1ZPLzIxQlgvcWNhZHNw
ODI4MC5tYm4KKyMgIEZpbGU6IHFjb20vc2M4MjgweHAvTEVOT1ZPLzIxQlgvcWNjZHNwODI4MC5t
Ym4KKyMgIEZpbGU6IHFjb20vc2M4MjgweHAvTEVOT1ZPLzIxQlgvcWNzbHBpODI4MC5tYm4KKyMg
QEAgLTU2NjAsNiArNTY4OSw4IEBACisjICBCaW5hcnkgZmlsZXMgc3VwcGxpZWQgb3JpZ2luYWxs
eSBmcm9tCisjICBodHRwOi8vcmVsZWFzZXMubGluYXJvLm9yZy85NmJvYXJkcy9kcmFnb25ib2Fy
ZDQxMGMvcXVhbGNvbW0vZmlybXdhcmUvbGludXgtYm9hcmQtc3VwcG9ydC1wYWNrYWdlLXIxMDM2
LjEuemlwCisjICBodHRwOi8vcmVsZWFzZXMubGluYXJvLm9yZy85NmJvYXJkcy9kcmFnb25ib2Fy
ZDg0NWMvcXVhbGNvbW0vZmlybXdhcmUvUkIzX2Zpcm13YXJlXzIwMjIxMTIxMDAwMDAwLXY1Lnpp
cAorIyAraHR0cHM6Ly9yZWxlYXNlcy5saW5hcm8ub3JnLzk2Ym9hcmRzL3JiMS9xdWFsY29tbS9m
aXJtd2FyZS9SQjFfZmlybXdhcmVfMjAyMzA4MjMtdjIuemlwCisjICtodHRwczovL3JlbGVhc2Vz
LmxpbmFyby5vcmcvOTZib2FyZHMvcmIyL3F1YWxjb21tL2Zpcm13YXJlL1JCMl9maXJtd2FyZV8y
MDIzMDgyMy12Mi56aXAKKyMgIGh0dHA6Ly9yZWxlYXNlcy5saW5hcm8ub3JnLzk2Ym9hcmRzL3Ji
NS9xdWFsY29tbS9maXJtd2FyZS9SQjVfZmlybXdhcmVfMjAyMTAzMzEtdjQuemlwCisjICAKKyMg
IGFkc3AubWJuIGhhcyBiZWVuIGNvbnZlcnRlZCBmcm9tIDIwLWFkc3Bfc3BsaXQvZmlybXdhcmUv
YWRzcC4qIHVzaW5nCisjIEBAIC01Njc0LDcgKzU3MDUsNyBAQAorIyAgCisjICBGaWxlOiBxY29t
L3NkbTg0NS9tYmEubWJuCisjICBGaWxlOiBxY29tL3NkbTg0NS9tb2RlbV9ubS5tYm4KKyMgLUZp
bGU6IHFjb20vc2RtODQ1L21vZGVtdXcuanNuCisjICtSYXdGaWxlOiBxY29tL3NkbTg0NS9tb2Rl
bXV3LmpzbgorIyAgTGluazogcWNvbS9zZG04NDUvbW9kZW0ubWJuIC0+IG1vZGVtX25tLm1ibgor
IyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLnFjb20gYW5kIHFj
b20vTk9USUNFLnR4dCBmb3IgZGV0YWlscworIyBAQCAtNjA0NSw2ICs2MDc2LDM1IEBACisjICBG
aWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwM2M4OTgxLXIxLmJpbgorIyAgRmls
ZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDNjODk4MS1sMC5iaW4KKyMgIEZpbGU6
IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTAzYzg5ODEtbDEuYmluCisjICtGaWxlOiBj
aXJydXMvY3MzNWw0MS92Ni44My4wL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuODUuMC53bWZ3Cisj
ICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4YzQ2LndtZncgLT4gY3Mz
NWw0MS92Ni44My4wL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuODUuMC53bWZ3CisjICtMaW5rOiBj
aXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwM2M4YzQ2LndtZncgLT4gY3MzNWw0MS92Ni44
My4wL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuODUuMC53bWZ3CisjICtMaW5rOiBjaXJydXMvY3Mz
NWw0MS1kc3AxLXNway1wcm90LTEwM2M4YzQ3LndtZncgLT4gY3MzNWw0MS92Ni44My4wL2hhbG9f
Y3NwbF9SQU1fcmV2QjJfMjkuODUuMC53bWZ3CisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3Ax
LXNway1jYWxpLTEwM2M4YzQ3LndtZncgLT4gY3MzNWw0MS92Ni44My4wL2hhbG9fY3NwbF9SQU1f
cmV2QjJfMjkuODUuMC53bWZ3CisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90
LTEwM2M4YzQ4LndtZncgLT4gY3MzNWw0MS92Ni44My4wL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjku
ODUuMC53bWZ3CisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwM2M4YzQ4
LndtZncgLT4gY3MzNWw0MS92Ni44My4wL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuODUuMC53bWZ3
CisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4YzQ5LndtZncgLT4g
Y3MzNWw0MS92Ni44My4wL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuODUuMC53bWZ3CisjICtMaW5r
OiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwM2M4YzQ5LndtZncgLT4gY3MzNWw0MS92
Ni44My4wL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuODUuMC53bWZ3CisjICtMaW5rOiBjaXJydXMv
Y3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4YzcwLndtZncgLT4gY3MzNWw0MS92Ni44My4wL2hh
bG9fY3NwbF9SQU1fcmV2QjJfMjkuODUuMC53bWZ3CisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1k
c3AxLXNway1jYWxpLTEwM2M4YzcwLndtZncgLT4gY3MzNWw0MS92Ni44My4wL2hhbG9fY3NwbF9S
QU1fcmV2QjJfMjkuODUuMC53bWZ3CisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1w
cm90LTEwM2M4YzcxLndtZncgLT4gY3MzNWw0MS92Ni44My4wL2hhbG9fY3NwbF9SQU1fcmV2QjJf
MjkuODUuMC53bWZ3CisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwM2M4
YzcxLndtZncgLT4gY3MzNWw0MS92Ni44My4wL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuODUuMC53
bWZ3CisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4YzcyLndtZncg
LT4gY3MzNWw0MS92Ni44My4wL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuODUuMC53bWZ3CisjICtM
aW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwM2M4YzcyLndtZncgLT4gY3MzNWw0
MS92Ni44My4wL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuODUuMC53bWZ3CisjICtGaWxlOiBjaXJy
dXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4YzQ2LmJpbgorIyArRmlsZTogY2lycnVzL2Nz
MzVsNDEtZHNwMS1zcGstY2FsaS0xMDNjOGM0Ni5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQx
LWRzcDEtc3BrLXByb3QtMTAzYzhjNDcuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3Ax
LXNway1jYWxpLTEwM2M4YzQ3LmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGst
cHJvdC0xMDNjOGM0OC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGkt
MTAzYzhjNDguYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4
YzQ5LmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDNjOGM0OS5i
aW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhjNzAuYmluIC0+
IGNzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGM0Ni5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1
bDQxLWRzcDEtc3BrLWNhbGktMTAzYzhjNzAuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstY2FsaS0x
MDNjOGM0Ni5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhj
NzEuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGM0Ny5iaW4KKyMgK0xpbms6IGNp
cnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTAzYzhjNzEuYmluIC0+IGNzMzVsNDEtZHNwMS1z
cGstY2FsaS0xMDNjOGM0Ny5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXBy
b3QtMTAzYzhjNzIuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGM0OC5iaW4KKyMg
K0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTAzYzhjNzIuYmluIC0+IGNzMzVs
NDEtZHNwMS1zcGstY2FsaS0xMDNjOGM0OC5iaW4KKyMgIEZpbGU6IGNpcnJ1cy9jczM1bDQxL3Y2
LjM5LjAvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS40MS4wLndtZncKKyMgIExpbms6IGNpcnJ1cy9j
czM1bDQxLWRzcDEtc3BrLXByb3QtMTdhYTM4NDcud21mdyAtPiBjczM1bDQxL3Y2LjM5LjAvaGFs
b19jc3BsX1JBTV9yZXZCMl8yOS40MS4wLndtZncKKyMgIExpbms6IGNpcnJ1cy9jczM1bDQxLWRz
cDEtc3BrLWNhbGktMTdhYTM4NDcud21mdyAtPiBjczM1bDQxL3Y2LjM5LjAvaGFsb19jc3BsX1JB
TV9yZXZCMl8yOS40MS4wLndtZncKKyMgQEAgLTY1NjcsNiArNjYyNyw3IEBACisjICAKKyMgIERy
aXZlcjogcWNvbS1zYzgyODB4cCAtIFF1YWxjb21tIEFTb0MgdHBsZyBGaXJtd2FyZQorIyAgRmls
ZTogcWNvbS9zYzgyODB4cC9MRU5PVk8vMjFCWC9hdWRpb3JlYWNoLXRwbGcuYmluCisjICtMaW5r
OiBxY29tL3NjODI4MHhwL1NDODI4MFhQLUxFTk9WTy1YMTNTLXRwbGcuYmluIC0+IExFTk9WTy8y
MUJYL2F1ZGlvcmVhY2gtdHBsZy5iaW4KKyMgIFZlcnNpb246IHYwLjEuMAorIyAgCisjICBMaWNl
bmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLmxpbmFybyBmb3IgZGV0YWlscworIyAK
KyMKKwogU1VNTUFSWSA9ICJGaXJtd2FyZSBmaWxlcyBmb3IgdXNlIHdpdGggTGludXgga2VybmVs
IgogSE9NRVBBR0UgPSAiaHR0cHM6Ly93d3cua2VybmVsLm9yZy8iCiBERVNDUklQVElPTiA9ICJM
aW51eCBmaXJtd2FyZSBpcyBhIHBhY2thZ2UgZGlzdHJpYnV0ZWQgYWxvbmdzaWRlIHRoZSBMaW51
eCBrZXJuZWwgXApAQCAtMTM0LDcgKzUxNCw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTov
L0xJQ0VOQ0UuQWJpbGlzO21kNT1iNWVlM2Y0MTA3ODBlNTY3MTFhZDQ4ZWFkYzIyYjhiYyBcCiAg
ICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTkNFLnhjNDAwMDttZDU9MGZmNTFkMmRjNDlm
Y2UwNDgxNGM5MTU1MDgxMDkyZjAgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5D
RS54YzUwMDA7bWQ1PTFlMTcwYzEzMTc1MzIzYzMyYzdmNGQwOTk4ZDUzZjY2IFwKICAgICAgICAg
ICAgICAgICAgICAgZmlsZTovL0xJQ0VOQ0UueGM1MDAwYzttZDU9MTJiMDJlZmEzMDQ5ZGI2NWQ1
MjRhZWI0MThkZDg3Y2EgXAotICAgICAgICAgICAgICAgICAgICBmaWxlOi8vV0hFTkNFO21kNT0k
e1dIRU5DRV9DSEtTVU19IFwKKyAgICAgICAgICAgICAgICAgICAgZmlsZTovL1dIRU5DRTttZDU9
MjI0OGUxNWEzMTRhNmRiMTdjZDk0MjMxZDMyZWVhMTcgXAogICAgICAgICAgICAgICAgICAgICAi
CiAjIFdIRU5DRSBjaGVja3N1bSBpcyBkZWZpbmVkIHNlcGFyYXRlbHkgdG8gZWFzZSBvdmVycmlk
aW5nIGl0IGlmCiAjIGNsYXNzLWRldnVwc3RyZWFtIGlzIHNlbGVjdGVkLgpAQCAtMjE4LDcgKzU5
OCw3IEBAIFNSQ19VUkk6Y2xhc3MtZGV2dXBzdHJlYW0gPSAiZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2Zpcm13CiAjIFBpbiB0aGlzIHRvIHRoZSAyMDIyMDUw
OSByZWxlYXNlLCBvdmVycmlkZSB0aGlzIGluIGxvY2FsLmNvbmYKIFNSQ1JFVjpjbGFzcy1kZXZ1
cHN0cmVhbSA/PSAiYjE5Y2JkY2E3OGFiMmFkZmQyMTBjOTFiZTE1YTIyNTY4ZThiOGNhZSIKIAot
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjg4ZDQ2YzU0Mzg0N2VlM2IwMzQwNGQ0OTQxZDkxYzkyOTc0
NjkwZWUxZjZmZGNiZWU5Y2VmM2U1Zjk3ZGI2ODgiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOTdm
YWRhMGQwMmJkYWZjNGUwMTdhNGRjYzQ1NmU3ZmE0OGJjOGRhZjJkZGY3NTE2MWYzOWE5MmUzOGYw
ODRhZCIKIAogaW5oZXJpdCBhbGxhcmNoCiAKLS0gCjIuMzkuMgoK

--===============7009953085331701283==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PKGSIZE changed from 16465860 to 12713844 (-23%)
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: FILELIST: removed "/usr/lib/firmware/ath10k/WCN3990/hw1.0/notice.txt_wlanmdsp"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: RDEPENDS: added "linux-firmware-qcom-sdm845-modem"
packages/all-poky-linux/linux-firmware/linux-firmware-dev: RRECOMMENDS: removed "linux-firmware-ath10k-dev", added "linux-firmware-qcom-sc8280xp-lenovo-x13s-audio-dev linux-firmware-qcom-sdm845-modem-dev"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: FILELIST: added "/usr/lib/firmware/i915/mtl_gsc_1.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PKGSIZE changed from 5916348 to 9641353 (+63%)
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: RDEPENDS: removed "linux-firmware-ath10k"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGSIZE changed from 279157731 to 337649447 (+21%)
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: removed "/usr/lib/firmware/cxgb4/t6fw-1.27.3.0.bin /usr/lib/firmware/cxgb4/t5fw-1.27.3.0.bin /usr/lib/firmware/cxgb4/t4fw-1.27.3.0.bin", added "/usr/lib/firmware/qcom/qrb4210/modem.mbn /usr/lib/firmware/amd/amd_sev_fam19h_model1xh.sbin /usr/lib/firmware/qcom/sm8250/Thundercomm/RB5/slpi.mbn /usr/lib/firmware/qcom/venus-6.0/venus.mbn /usr/lib/firmware/qcom/qcm2290/modemr.jsn /usr/lib/firmware/qcom/qcm2290/a702_zap.mbn /usr/lib/firmware/qcom/sc8280xp/SC8280XP-LENOVO-X13S-tplg.bin /usr/lib/firmware/qcom/qrb4210/adsps.jsn /usr/lib/firmware/qcom/sm8250/Thundercomm/RB5/slpius.jsn /usr/lib/firmware/qcom/sdm845/notice.txt_wlanmdsp /usr/lib/firmware/qcom/qcm2290/adsp.mbn /usr/lib/firmware/qcom/qcm2290/wlanmdsp.mbn /usr/lib/firmware/qcom/qrb4210/adspr.jsn /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c72.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c72.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c46.
 wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c47.wmfw /usr/lib/firmware/qcom/qrb4210/cdspr.jsn /usr/lib/firmware/qcom/qcm2290/modemuw.jsn /usr/lib/firmware/rtl_bt/rtl8852cu_fw_v2.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c46.bin /usr/lib/firmware/qcom/qrb4210/adsp.mbn /usr/lib/firmware/qcom/qrb4210/cdsp.mbn /usr/lib/firmware/qcom/qrb4210/adspua.jsn /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c47.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c48.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c49.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c70.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c71.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c72.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c72.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c49.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c48.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c70.wmfw /usr/lib/firmware
 /cirrus/cs35l41-dsp1-spk-cali-103c8c71.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c46.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c47.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c48.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c49.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c70.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c71.wmfw /usr/lib/firmware/qcom/qrb4210/wlanmdsp.mbn /usr/lib/firmware/qcom/qcm2290/adspr.jsn /usr/lib/firmware/qcom/qrb4210/modemr.jsn /usr/lib/firmware/cirrus/cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw /usr/lib/firmware/qcom/a702_sqe.fw /usr/lib/firmware/qcom/qrb4210/a610_zap.mbn /usr/lib/firmware/qcom/qcm2290/adsps.jsn /usr/lib/firmware/cxgb4/t5fw-1.27.4.0.bin /usr/lib/firmware/cxgb4/t4fw-1.27.4.0.bin /usr/lib/firmware/qcom/qrb4210/modemuw.jsn /usr/lib/firmware/cxgb4/t6fw-1.27.4.0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c47.bin /usr/lib/firmware/qcom/qcm2290/modem.
 mbn /usr/lib/firmware/qcom/qcm2290/adspua.jsn /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c48.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c49.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c46.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c70.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c71.bin /usr/lib/firmware/qcom/sm8250/Thundercomm/RB5/slpir.jsn"
packages/all-poky-linux/linux-firmware/linux-firmware: RDEPENDS: added "linux-firmware-qcom-sc8280xp-lenovo-x13s-audio"

--===============7009953085331701283==--

