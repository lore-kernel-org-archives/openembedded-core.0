Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69282C10F19
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 07:54:09 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.129516.1692086042179356092
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 00:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PE2luAQP;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=pN0TWb7D;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010189f8300593-99d613f6-ec48-46c0-b3c2-26eb66a09cdc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692086044;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Z5r0bJRYf+ffwpww0mQdTQHBgFm3Ylt34UVO7ai2AsA=;
	b=PE2luAQPabgaX8DBepLW7wRV5/t2+CZ1INYaEeu2+nYo/nQRxcsBosms+uYv1Kq6
	2xjtbDGwApmhyY1Y+H2f/IhsxLzMnypEjH0Pa5Ds2Vj6tfC6VL5kKki1G8QGj28G1sR
	5/VmSffa0uWlxjUdlwU16Une3Z7sSoD1+tmx2WHY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692086044;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Z5r0bJRYf+ffwpww0mQdTQHBgFm3Ylt34UVO7ai2AsA=;
	b=pN0TWb7D1mEnzBTGf/skDGRm2JbT9mQ+wajD9YHwK0yG/ZC4xliI4vbRtdotBIcq
	DfFh4klkreHIrnb6a99w873yNZoWWmdYXXT85SUchA+X6OFTe02VF2IHkWepMf8Kb0p
	dzfFgQ8mVn5/R/ip1JBdFsYwh9enTlW8fc01+ydg=
Content-Type: multipart/mixed; boundary="===============6328078789949903438=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] linux-firmware: upgrading to 20230804 SUCCEEDED
Message-ID: <01010189f8300593-99d613f6-ec48-46c0-b3c2-26eb66a09cdc-000000@us-west-2.amazonses.com>
Date: Tue, 15 Aug 2023 07:54:04 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 07:54:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186037

--===============6328078789949903438==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *linux-firmware* to *20230804* has Succeeded.

Next steps:
    - apply the patch: git am 0001-linux-firmware-upgrade-20230625-20230804.patch
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
From 8b97e0287b16503266cea15e46674edf12d030e8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Aug 2023 07:20:19 +0000
Subject: [PATCH] linux-firmware: upgrade 20230625 -> 20230804

---
 ...20230625.bb => linux-firmware_20230804.bb} | 602 +++++++++++++++++-
 1 file changed, 600 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20230625.bb => linux-firmware_20230804.bb} (65%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
similarity index 65%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
index 6765226b9d..036e92d625 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
@@ -1,3 +1,601 @@
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
+# @@ -1017,22 +1017,22 @@
+#  Version: 74.a5e9588b.0
+#  
+#  File: iwlwifi-cc-a0-77.ucode
+# -Version: 74.206b0184.0
+# +Version: 74.2df8986f.0
+#  
+#  File: iwlwifi-Qu-b0-hr-b0-77.ucode
+# -Version: 74.206b0184.0
+# +Version: 74.2df8986f.0
+#  
+#  File: iwlwifi-Qu-b0-jf-b0-77.ucode
+# -Version: 74.206b0184.0
+# +Version: 74.2df8986f.0
+#  
+#  File: iwlwifi-Qu-c0-hr-b0-77.ucode
+# -Version: 74.206b0184.0
+# +Version: 74.2df8986f.0
+#  
+#  File: iwlwifi-Qu-c0-jf-b0-77.ucode
+# -Version: 74.206b0184.0
+# +Version: 74.2df8986f.0
+#  
+#  File: iwlwifi-QuZ-a0-hr-b0-77.ucode
+# -Version: 74.206b0184.0
+# +Version: 74.2df8986f.0
+#  
+#  File: iwlwifi-QuZ-a0-jf-b0-77.ucode
+#  Version: 74.206b0184.0
+# @@ -1049,6 +1049,9 @@
+#  File: iwlwifi-ty-a0-gf-a0-81.ucode
+#  Version: 78.31fc9ae6.0
+#  
+# +File: iwlwifi-ty-a0-gf-a0-83.ucode
+# +Version: 80.e8f84e98.0
+# +
+#  File: iwlwifi-so-a0-gf4-a0-77.ucode
+#  Version: 74.f92b5fed.0
+#  
+# @@ -1061,6 +1064,9 @@
+#  File: iwlwifi-so-a0-gf4-a0-81.ucode
+#  Version: 78.31fc9ae6.0
+#  
+# +File: iwlwifi-so-a0-gf4-a0-83.ucode
+# +Version: 80.e8f84e98.0
+# +
+#  File: iwlwifi-so-a0-gf-a0-77.ucode
+#  Version: 74.f92b5fed.0
+#  
+# @@ -1072,6 +1078,9 @@
+#  
+#  File: iwlwifi-so-a0-gf-a0-81.ucode
+#  Version: 78.31fc9ae6.0
+# +
+# +File: iwlwifi-so-a0-gf-a0-83.ucode
+# +Version: 80.e8f84e98.0
+#  
+#  File: iwlwifi-so-a0-hr-b0-77.ucode
+#  Version: 74.f92b5fed.0
+# @@ -2382,6 +2391,13 @@
+#  File: amdgpu/gc_11_0_2_mes_2.bin
+#  File: amdgpu/gc_11_0_2_pfp.bin
+#  File: amdgpu/gc_11_0_2_rlc.bin
+# +File: amdgpu/gc_11_0_3_imu.bin
+# +File: amdgpu/gc_11_0_3_me.bin
+# +File: amdgpu/gc_11_0_3_mec.bin
+# +File: amdgpu/gc_11_0_3_mes1.bin
+# +File: amdgpu/gc_11_0_3_mes_2.bin
+# +File: amdgpu/gc_11_0_3_pfp.bin
+# +File: amdgpu/gc_11_0_3_rlc.bin
+#  File: amdgpu/gc_11_0_4_imu.bin
+#  File: amdgpu/gc_11_0_4_me.bin
+#  File: amdgpu/gc_11_0_4_mec.bin
+# @@ -2407,6 +2423,8 @@
+#  File: amdgpu/psp_13_0_8_asd.bin
+#  File: amdgpu/psp_13_0_8_ta.bin
+#  File: amdgpu/psp_13_0_8_toc.bin
+# +File: amdgpu/psp_13_0_10_sos.bin
+# +File: amdgpu/psp_13_0_10_ta.bin
+#  File: amdgpu/psp_13_0_11_ta.bin
+#  File: amdgpu/psp_13_0_11_toc.bin
+#  File: amdgpu/sdma_5_2_6.bin
+# @@ -2414,8 +2432,10 @@
+#  File: amdgpu/sdma_6_0_0.bin
+#  File: amdgpu/sdma_6_0_1.bin
+#  File: amdgpu/sdma_6_0_2.bin
+# +File: amdgpu/sdma_6_0_3.bin
+#  File: amdgpu/smu_13_0_0.bin
+#  File: amdgpu/smu_13_0_7.bin
+# +File: amdgpu/smu_13_0_10.bin
+#  File: amdgpu/vcn_3_1_2.bin
+#  File: amdgpu/vcn_4_0_0.bin
+#  File: amdgpu/vcn_4_0_2.bin
+# @@ -3677,69 +3697,69 @@
+#  File: intel/ibt-18-1.ddc
+#  Version: BT_ThunderPeak_A0_B0_REL0201
+#  File:intel/ibt-20-0-3.sfi
+# -Version: BT_CyclonePeak_A0_REL53392
+# +Version: BT_CyclonePeak_A0_REL53454
+#  File:intel/ibt-20-0-3.ddc
+# -Version: BT_CyclonePeak_A0_REL53392
+# +Version: BT_CyclonePeak_A0_REL53454
+#  File:intel/ibt-20-1-3.sfi
+# -Version: BT_CyclonePeak_A0_REL53392
+# +Version: BT_CyclonePeak_A0_REL53454
+#  File:intel/ibt-20-1-3.ddc
+# -Version: BT_CyclonePeak_A0_REL53392
+# +Version: BT_CyclonePeak_A0_REL53454
+#  File:intel/ibt-20-1-4.sfi
+# -Version: BT_CyclonePeak_A0_REL53392
+# +Version: BT_CyclonePeak_A0_REL53454
+#  File:intel/ibt-20-1-4.ddc
+# -Version: BT_CyclonePeak_A0_REL53392
+# +Version: BT_CyclonePeak_A0_REL53454
+#  File:intel/ibt-19-0-0.sfi
+# -Version: BT_Quasar_REL53392
+# +Version: BT_Quasar_REL53454
+#  File:intel/ibt-19-0-0.ddc
+# -Version: BT_Quasar_REL53392
+# +Version: BT_Quasar_REL53454
+#  File:intel/ibt-19-0-1.sfi
+# -Version: BT_Quasar_REL53392
+# +Version: BT_Quasar_REL53454
+#  File:intel/ibt-19-0-1.ddc
+# -Version: BT_Quasar_REL53392
+# +Version: BT_Quasar_REL53454
+#  File:intel/ibt-19-0-3.sfi
+#  Version: BT_Quasar_REL53263
+#  File:intel/ibt-19-0-3.ddc
+#  Version: BT_Quasar_REL53263
+#  File:intel/ibt-19-0-4.sfi
+# -Version: BT_HarrisonPeak_REL53392
+# +Version: BT_HarrisonPeak_REL53454
+#  File:intel/ibt-19-0-4.ddc
+# -Version: BT_HarrisonPeak_REL53392
+# +Version: BT_HarrisonPeak_REL53454
+#  File:intel/ibt-19-16-4.sfi
+# -Version: BT_HarrisonPeak_REL53392
+# +Version: BT_HarrisonPeak_REL53454
+#  File:intel/ibt-19-16-4.ddc
+# -Version: BT_HarrisonPeak_REL53392
+# +Version: BT_HarrisonPeak_REL53454
+#  File:intel/ibt-19-32-1.sfi
+# -Version: BT_HarrisonPeak_REL53392
+# +Version: BT_HarrisonPeak_REL53454
+#  File:intel/ibt-19-32-1.ddc
+# -Version: BT_HarrisonPeak_REL53392
+# +Version: BT_HarrisonPeak_REL53454
+#  File:intel/ibt-19-32-0.sfi
+# -Version: BT_HarrisonPeak_REL53392
+# +Version: BT_HarrisonPeak_REL53454
+#  File:intel/ibt-19-32-0.ddc
+# -Version: BT_HarrisonPeak_REL53392
+# +Version: BT_HarrisonPeak_REL53454
+#  File:intel/ibt-19-32-4.sfi
+# -Version: BT_HarrisonPeak_REL53392
+# +Version: BT_HarrisonPeak_REL53454
+#  File:intel/ibt-19-32-4.ddc
+# -Version: BT_HarrisonPeak_REL53392
+# +Version: BT_HarrisonPeak_REL53454
+#  File:intel/ibt-19-240-1.sfi
+# -Version: BT_HarrisonPeak_REL53392
+# +Version: BT_HarrisonPeak_REL53454
+#  File:intel/ibt-19-240-1.ddc
+# -Version: BT_HarrisonPeak_REL53392
+# +Version: BT_HarrisonPeak_REL53454
+#  File:intel/ibt-19-240-4.sfi
+# -Version: BT_HarrisonPeak_REL53392
+# +Version: BT_HarrisonPeak_REL53454
+#  File:intel/ibt-19-240-4.ddc
+# -Version: BT_HarrisonPeak_REL53392
+# +Version: BT_HarrisonPeak_REL53454
+#  File:intel/ibt-0041-0041.sfi
+# -Version: BT_TyphoonPeak_REL62562
+# +Version: BT_TyphoonPeak_REL67068
+#  File:intel/ibt-0041-0041.ddc
+# -Version: BT_TyphoonPeak_REL62562
+# +Version: BT_TyphoonPeak_REL67068
+#  File:intel/ibt-0040-0041.sfi
+# -Version: BT_Solar_GfP2_REL62562
+# +Version: BT_Solar_GfP2_REL67068
+#  File:intel/ibt-0040-0041.ddc
+# -Version: BT_Solar_GfP2_REL62562
+# +Version: BT_Solar_GfP2_REL67068
+#  File:intel/ibt-1040-0041.sfi
+# -Version: BT_SolarF_GfP2_REL62562
+# +Version: BT_SolarF_GfP2_REL67068
+#  File:intel/ibt-1040-0041.ddc
+# -Version: BT_SolarF_GfP2_REL62562
+# +Version: BT_SolarF_GfP2_REL67068
+#  
+#  File:intel/ibt-0040-1020.sfi
+#  Version: BT_Solar_JfP1_REL59564
+# @@ -3760,13 +3780,13 @@
+#  Version: BT_SolarF_JfP2_REL59564
+#  
+#  File:intel/ibt-0040-4150.sfi
+# -Version: BT_Solar_JnP2_REL62562
+# +Version: BT_Solar_JnP2_REL67068
+#  File:intel/ibt-0040-4150.ddc
+# -Version: BT_Solar_JnP2_REL62562
+# +Version: BT_Solar_JnP2_REL67068
+#  File:intel/ibt-1040-4150.sfi
+# -Version: BT_SolarF_JnP2_REL62562
+# +Version: BT_SolarF_JnP2_REL67068
+#  File:intel/ibt-1040-4150.ddc
+# -Version: BT_SolarF_JnP2_REL62562
+# +Version: BT_SolarF_JnP2_REL67068
+#  
+#  Licence: Redistributable. See LICENCE.ibt_firmware for details
+#  
+# @@ -3900,10 +3920,10 @@
+#  Version: 2014-10-28
+#  File: amd-ucode/microcode_amd_fam17h.bin
+#  Raw: amd-ucode/microcode_amd_fam17h.bin
+# -Version: 2023-04-13
+# +Version: 2023-07-19
+#  File: amd-ucode/microcode_amd_fam19h.bin
+#  Raw: amd-ucode/microcode_amd_fam19h.bin
+# -Version: 2023-01-31
+# +Version: 2023-07-18
+#  File: amd-ucode/README
+#  
+#  License: Redistributable. See LICENSE.amd-ucode for details
+# @@ -4662,7 +4682,7 @@
+#  Version: DMC API/APB ver 2 release 16 for Alderlake P
+#  
+#  File: i915/adlp_dmc.bin
+# -Version: DMC API/APB ver 2 release 19 for Alderlake P
+# +Version: DMC API/APB ver 2 release 20 for Alderlake P
+#  
+#  File: i915/adlp_guc_62.0.3.bin
+#  Version: GuC API/APB ver 62.0.3 for Alderlake P
+# @@ -4683,7 +4703,7 @@
+#  Version: GuC API/APB ver 70.4.1 for DG2
+#  
+#  File: i915/dg2_guc_70.bin
+# -Version: GuC API/APB ver 70.5.1 for DG2
+# +Version: GuC API/APB ver 70.8.0 for DG2
+#  
+#  File: i915/dg2_huc_gsc.bin
+#  Version: HuC API/APB ver 7.10.3 for DG2
+# @@ -4701,13 +4721,13 @@
+#  Version: DMC API/APB ver 2 release 10 for Meteorlake
+#  
+#  File: i915/mtl_dmc.bin
+# -Version: DMC API/APB ver 2 release 12 for Meteorlake
+# +Version: DMC API/APB ver 2 release 13 for Meteorlake
+#  
+#  File: i915/mtl_guc_70.bin
+# -Version: GuC API/APB ver 70.6.6 for Meteorlake
+# +Version: GuC API/APB ver 70.8.0 for Meteorlake
+#  
+#  File: i915/mtl_huc_gsc.bin
+# -Version: HuC API/APB ver 8.5.0 for Meteorlake
+# +Version: HuC API/APB ver 8.5.1 for Meteorlake
+#  
+#  License: Redistributable. See LICENSE.i915 for details
+#  --------------------------------------------------------------------------
+# @@ -5198,7 +5218,7 @@
+#  File: mediatek/mt8192/scp.img
+#  Version: v2.0.20536
+#  File: mediatek/mt8195/scp.img
+# -Version: v2.0.11966
+# +Version: v2.0.21961
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -5386,9 +5406,9 @@
+#  Driver: mt7922 - MediaTek MT7922 Wireless MACs
+#  
+#  File: mediatek/WIFI_MT7922_patch_mcu_1_1_hdr.bin
+# -Version: 20230530123154a
+# +Version: 20230627143702a
+#  File: mediatek/WIFI_RAM_CODE_MT7922_1.bin
+# -Version: 20230530123236
+# +Version: 20230627143946
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -5397,7 +5417,7 @@
+#  Driver: mt7922 - MediaTek MT7922 bluetooth chipset
+#  
+#  File: mediatek/BT_RAM_CODE_MT7922_1_1_hdr.bin
+# -Version: 20230530123531
+# +Version: 20230627144220
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -5619,6 +5639,9 @@
+#  File: qcom/sdm845/adspua.jsn
+#  File: qcom/sdm845/cdsp.mbn
+#  File: qcom/sdm845/cdspr.jsn
+# +File: qcom/sdm845/Thundercomm/db845c/slpi.mbn
+# +File: qcom/sdm845/Thundercomm/db845c/slpir.jsn
+# +File: qcom/sdm845/Thundercomm/db845c/slpius.jsn
+#  File: qcom/sm8250/adsp.mbn
+#  File: qcom/sm8250/adspr.jsn
+#  File: qcom/sm8250/adspua.jsn
+# @@ -5631,7 +5654,6 @@
+#  File: qcom/sc8280xp/LENOVO/21BX/qcadsp8280.mbn
+#  File: qcom/sc8280xp/LENOVO/21BX/qccdsp8280.mbn
+#  File: qcom/sc8280xp/LENOVO/21BX/qcslpi8280.mbn
+# -Link: qcom/LENOVO/21BX -> ../sc8280xp/LENOVO/21BX
+#  
+#  Licence: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
+#  
+# @@ -5731,6 +5753,10 @@
+#  File: mellanox/mlxsw_spectrum2-29.2010.3146.mfa2
+#  File: mellanox/mlxsw_spectrum3-30.2010.3146.mfa2
+#  File: mellanox/lc_ini_bundle_2010_3146.bin
+# +File: mellanox/mlxsw_spectrum-13.2012.1012.mfa2
+# +File: mellanox/mlxsw_spectrum2-29.2012.1012.mfa2
+# +File: mellanox/mlxsw_spectrum3-30.2012.1012.mfa2
+# +File: mellanox/mlxsw_spectrum4-34.2012.1012.mfa2
+#  
+#  Licence:
+#   Copyright (c) 2017-2020 Mellanox Technologies, Ltd. All rights reserved.
+# @@ -5831,6 +5857,7 @@
+#  
+#  File: intel/ice/ddp/ice-1.3.30.0.pkg
+#  Link: intel/ice/ddp/ice.pkg -> ice-1.3.30.0.pkg
+# +File: intel/ice/ddp-lag/ice_lag-1.3.1.0.pkg
+#  
+#  License: Redistributable. See LICENSE.ice for details
+#  
+# @@ -5879,7 +5906,7 @@
+#  Driver: wfx - Silicon Labs Wi-Fi Transceiver
+#  
+#  File: wfx/wfm_wf200_C0.sec
+# -Version: 3.14
+# +Version: 3.16.1
+#  
+#  File: wfx/brd4001a.pds
+#  File: wfx/brd8022a.pds
+# @@ -6105,6 +6132,175 @@
+#  File: cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid0-r0.bin
+#  File: cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid1-l0.bin
+#  File: cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid1-r0.bin
+# +File: cirrus/cs35l41/v6.78.0/halo_cspl_RAM_revB2_29.80.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10431573.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10431573.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10431463.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10431463.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10431483.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10431483.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10431663.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10431663.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10431473.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10431473.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10431493.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10431493.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10431533.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10431533.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10431433.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10431433.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10431caf.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10431caf.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10431cef.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10431cef.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-104314d3.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-104314d3.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10431c9f.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10431c9f.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10431cdf.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10431cdf.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10431ccf.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10431ccf.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10431503.wmfw -> cs35l41/v6.78.0/halo_cspl_RAM_revB2_29.80.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10431503.wmfw -> cs35l41/v6.78.0/halo_cspl_RAM_revB2_29.80.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-104314e3.wmfw -> cs35l41/v6.78.0/halo_cspl_RAM_revB2_29.80.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-104314e3.wmfw -> cs35l41/v6.78.0/halo_cspl_RAM_revB2_29.80.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10431d1f.wmfw -> cs35l41/v6.78.0/halo_cspl_RAM_revB2_29.80.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10431d1f.wmfw -> cs35l41/v6.78.0/halo_cspl_RAM_revB2_29.80.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-104317f3.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-104317f3.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431c9f-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431c9f-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431c9f-spkid0-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431c9f-spkid0-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431c9f-spkid1-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431c9f-spkid1-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431c9f-spkid1-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431c9f-spkid1-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431caf-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431caf-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431caf-spkid0-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431caf-spkid0-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431caf-spkid1-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431caf-spkid1-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431caf-spkid1-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431caf-spkid1-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431503-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431503-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431503-spkid0-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431503-spkid0-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431503-spkid1-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431503-spkid1-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431503-spkid1-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431503-spkid1-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431ccf-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431ccf-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431ccf-spkid0-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431ccf-spkid0-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431ccf-spkid1-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431ccf-spkid1-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431ccf-spkid1-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431ccf-spkid1-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431cef-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431cef-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431cef-spkid0-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431cef-spkid0-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431cef-spkid1-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431cef-spkid1-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431cef-spkid1-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431cef-spkid1-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431463-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431463-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431463-spkid0-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431463-spkid0-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431463-spkid1-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431463-spkid1-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431463-spkid1-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431463-spkid1-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431483-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431483-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431483-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431483-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431473-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431473-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431473-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431473-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431533-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431533-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431533-spkid0-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431533-spkid0-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431533-spkid1-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431533-spkid1-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431533-spkid1-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431533-spkid1-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431433-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431433-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431433-spkid0-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431433-spkid0-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431433-spkid1-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431433-spkid1-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431433-spkid1-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431433-spkid1-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431573-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431573-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431573-spkid0-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431573-spkid0-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431573-spkid1-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431573-spkid1-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431573-spkid1-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431573-spkid1-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-104317f3-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-104317f3-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-104317f3-spkid0-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-104317f3-spkid0-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-104317f3-spkid1-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-104317f3-spkid1-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-104317f3-spkid1-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-104317f3-spkid1-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431493-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431493-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431493-spkid0-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431493-spkid0-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431493-spkid1-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431493-spkid1-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10431493-spkid1-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10431493-spkid1-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10431663-l0.bin -> cs35l41-dsp1-spk-prot-10431483-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10431663-l0.bin -> cs35l41-dsp1-spk-cali-10431483-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10431663-r0.bin -> cs35l41-dsp1-spk-prot-10431483-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10431663-r0.bin -> cs35l41-dsp1-spk-cali-10431483-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-104314d3-spkid0-l0.bin -> cs35l41-dsp1-spk-prot-10431c9f-spkid0-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-104314d3-spkid0-l0.bin -> cs35l41-dsp1-spk-cali-10431c9f-spkid0-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-104314d3-spkid0-r0.bin -> cs35l41-dsp1-spk-prot-10431c9f-spkid0-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-104314d3-spkid0-r0.bin -> cs35l41-dsp1-spk-cali-10431c9f-spkid0-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-104314d3-spkid1-l0.bin -> cs35l41-dsp1-spk-prot-10431c9f-spkid1-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-104314d3-spkid1-l0.bin -> cs35l41-dsp1-spk-cali-10431c9f-spkid1-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-104314d3-spkid1-r0.bin -> cs35l41-dsp1-spk-prot-10431c9f-spkid1-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-104314d3-spkid1-r0.bin -> cs35l41-dsp1-spk-cali-10431c9f-spkid1-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10431cdf-spkid0-l0.bin -> cs35l41-dsp1-spk-prot-10431ccf-spkid0-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10431cdf-spkid0-l0.bin -> cs35l41-dsp1-spk-cali-10431ccf-spkid0-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10431cdf-spkid0-r0.bin -> cs35l41-dsp1-spk-prot-10431ccf-spkid0-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10431cdf-spkid0-r0.bin -> cs35l41-dsp1-spk-cali-10431ccf-spkid0-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10431cdf-spkid1-l0.bin -> cs35l41-dsp1-spk-prot-10431ccf-spkid1-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10431cdf-spkid1-l0.bin -> cs35l41-dsp1-spk-cali-10431ccf-spkid1-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10431cdf-spkid1-r0.bin -> cs35l41-dsp1-spk-prot-10431ccf-spkid1-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10431cdf-spkid1-r0.bin -> cs35l41-dsp1-spk-cali-10431ccf-spkid1-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-104314e3-spkid0-l0.bin -> cs35l41-dsp1-spk-prot-10431503-spkid0-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-104314e3-spkid0-l0.bin -> cs35l41-dsp1-spk-cali-10431503-spkid0-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-104314e3-spkid0-r0.bin -> cs35l41-dsp1-spk-prot-10431503-spkid0-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-104314e3-spkid0-r0.bin -> cs35l41-dsp1-spk-cali-10431503-spkid0-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-104314e3-spkid1-l0.bin -> cs35l41-dsp1-spk-prot-10431503-spkid1-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-104314e3-spkid1-l0.bin -> cs35l41-dsp1-spk-cali-10431503-spkid1-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-104314e3-spkid1-r0.bin -> cs35l41-dsp1-spk-prot-10431503-spkid1-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-104314e3-spkid1-r0.bin -> cs35l41-dsp1-spk-cali-10431503-spkid1-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10431d1f-spkid0-l0.bin -> cs35l41-dsp1-spk-prot-10431503-spkid0-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10431d1f-spkid0-l0.bin -> cs35l41-dsp1-spk-cali-10431503-spkid0-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10431d1f-spkid0-r0.bin -> cs35l41-dsp1-spk-prot-10431503-spkid0-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10431d1f-spkid0-r0.bin -> cs35l41-dsp1-spk-cali-10431503-spkid0-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10431d1f-spkid1-l0.bin -> cs35l41-dsp1-spk-prot-10431503-spkid1-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10431d1f-spkid1-l0.bin -> cs35l41-dsp1-spk-cali-10431503-spkid1-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10431d1f-spkid1-r0.bin -> cs35l41-dsp1-spk-prot-10431503-spkid1-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10431d1f-spkid1-r0.bin -> cs35l41-dsp1-spk-cali-10431503-spkid1-r0.bin
+#  Link: cirrus/cs35l41-dsp1-spk-prot-10431b93.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+#  Link: cirrus/cs35l41-dsp1-spk-cali-10431b93.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+#  Link: cirrus/cs35l41-dsp1-spk-prot-10431a20.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# @@ -6269,6 +6465,48 @@
+#  File: cirrus/cs35l41-dsp1-spk-cali-103c8b92.bin
+#  Link: cirrus/cs35l41-dsp1-spk-prot-103c8c26.bin -> cs35l41-dsp1-spk-prot-103c8b45.bin
+#  Link: cirrus/cs35l41-dsp1-spk-cali-103c8c26.bin -> cs35l41-dsp1-spk-cali-103c8b45.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10280cbd.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10280cbd.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10280cbe.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10280cbe.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10280cbf.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10280cbf.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10280cc1.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10280cc1.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10280cc2.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10280cc2.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10280cc3.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10280cc3.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10280cc4.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10280cc4.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +File: cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10280cbd-spkid0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid1.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-10280cbd-spkid1.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10280cbe-spkid0.bin -> cs35l41-dsp1-spk-prot-10280cbd-spkid0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10280cbe-spkid0.bin -> cs35l41-dsp1-spk-cali-10280cbd-spkid0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10280cbe-spkid1.bin -> cs35l41-dsp1-spk-prot-10280cbd-spkid1.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10280cbe-spkid1.bin -> cs35l41-dsp1-spk-cali-10280cbd-spkid1.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10280cbf-spkid0.bin -> cs35l41-dsp1-spk-prot-10280cbd-spkid0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10280cbf-spkid0.bin -> cs35l41-dsp1-spk-cali-10280cbd-spkid0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10280cbf-spkid1.bin -> cs35l41-dsp1-spk-prot-10280cbd-spkid1.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10280cbf-spkid1.bin -> cs35l41-dsp1-spk-cali-10280cbd-spkid1.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10280cc1-spkid0.bin -> cs35l41-dsp1-spk-prot-10280cbd-spkid0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10280cc1-spkid0.bin -> cs35l41-dsp1-spk-cali-10280cbd-spkid0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10280cc1-spkid1.bin -> cs35l41-dsp1-spk-prot-10280cbd-spkid1.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10280cc1-spkid1.bin -> cs35l41-dsp1-spk-cali-10280cbd-spkid1.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10280cc2-spkid0.bin -> cs35l41-dsp1-spk-prot-10280cbd-spkid0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10280cc2-spkid0.bin -> cs35l41-dsp1-spk-cali-10280cbd-spkid0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10280cc2-spkid1.bin -> cs35l41-dsp1-spk-prot-10280cbd-spkid1.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10280cc2-spkid1.bin -> cs35l41-dsp1-spk-cali-10280cbd-spkid1.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10280cc3-spkid0.bin -> cs35l41-dsp1-spk-prot-10280cbd-spkid0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10280cc3-spkid0.bin -> cs35l41-dsp1-spk-cali-10280cbd-spkid0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10280cc3-spkid1.bin -> cs35l41-dsp1-spk-prot-10280cbd-spkid1.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10280cc3-spkid1.bin -> cs35l41-dsp1-spk-cali-10280cbd-spkid1.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10280cc4-spkid0.bin -> cs35l41-dsp1-spk-prot-10280cbd-spkid0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10280cc4-spkid0.bin -> cs35l41-dsp1-spk-cali-10280cbd-spkid0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10280cc4-spkid1.bin -> cs35l41-dsp1-spk-prot-10280cbd-spkid1.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-10280cc4-spkid1.bin -> cs35l41-dsp1-spk-cali-10280cbd-spkid1.bin
+#  
+#  License: Redistributable. See LICENSE.cirrus for details.
+#  
+# @@ -6299,7 +6537,7 @@
+#  
+#  Driver: nxp-sr1xx - NXP Ultra Wide Band driver
+#  File: nxp/sr150_fw.bin
+# -Version: 35.00.03
+# +Version: 44.00.02
+#  
+#  Licence: Redistributable. See LICENSE.nxp for details
+#  Originates from https://github.com/NXP/uwb-NXPUWB-FW.git
+# @@ -6323,4 +6561,14 @@
+#  
+#  Licence: Redistributable. See LICENSE.nxp for details
+#  
+# ---------------------------------------------------------------------------
+# +Originates from https://github.com/nxp-imx/imx-firmware/tree/lf-6.1.22_2.0.0/nxp
+# +
+# +--------------------------------------------------------------------------
+# +
+# +Driver: qcom-sc8280xp - Qualcomm ASoC tplg Firmware
+# +File: qcom/sc8280xp/LENOVO/21BX/audioreach-tplg.bin
+# +Version: v0.1.0
+# +
+# +Licence: Redistributable. See LICENCE.linaro for details
+# +Originates from https://git.linaro.org/people/srinivas.kandagatla/audioreach-topology.git
+# +--------------------------------------------------------------------------
+# 
+#
+
 SUMMARY = "Firmware files for use with Linux kernel"
 HOMEPAGE = "https://www.kernel.org/"
 DESCRIPTION = "Linux firmware is a package distributed alongside the Linux kernel \
@@ -130,7 +728,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=${WHENCE_CHKSUM} \
+                    file://WHENCE;md5=41f9a48bf27971b126a36f9344594dcd \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
@@ -212,7 +810,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "87597111c0d4b71b31e53cb85a92c386921b84c825a402db8c82e0e86015500d"
+SRC_URI[sha256sum] = "88d46c543847ee3b03404d4941d91c92974690ee1f6fdcbee9cef3e5f97db688"
 
 inherit allarch
 
-- 
2.39.2


--===============6328078789949903438==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/linux-firmware: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware: SRC_URI changed from "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20230625.tar.xz" to "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20230804.tar.xz"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: FILELIST: added "/lib/firmware/amdgpu/gc_11_0_3_mes_2.bin /lib/firmware/amdgpu/sdma_6_0_3.bin /lib/firmware/amdgpu/gc_11_0_3_mes1.bin /lib/firmware/amdgpu/gc_11_0_3_mec.bin /lib/firmware/amdgpu/smu_13_0_10.bin /lib/firmware/amdgpu/psp_13_0_10_sos.bin /lib/firmware/amdgpu/gc_11_0_3_pfp.bin /lib/firmware/amdgpu/gc_11_0_3_imu.bin /lib/firmware/amdgpu/psp_13_0_10_ta.bin /lib/firmware/amdgpu/gc_11_0_3_me.bin /lib/firmware/amdgpu/gc_11_0_3_rlc.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PKGSIZE changed from 77944646 to 80314150 (+3%)
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2-mips: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2-mips: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-gplv2-license: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-gplv2-license: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGSIZE changed from 26602795 to 26630347 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PKGSIZE changed from 2399295 to 2402083 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGSIZE changed from 17502921 to 17514185 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice: FILELIST: added "/lib/firmware/intel/ice/ddp-lag/ice_lag-1.3.1.0.pkg"
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PKGSIZE changed from 2143532 to 2836308 (+32%)
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: FILELIST: added "/lib/firmware/iwlwifi-so-a0-gf-a0-83.ucode /lib/firmware/iwlwifi-so-a0-gf4-a0-83.ucode /lib/firmware/iwlwifi-ty-a0-gf-a0-83.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PKGSIZE changed from 125994872 to 131123076 (+4%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-license: FILELIST: added "/lib/firmware/LICENCE.linaro"
packages/all-poky-linux/linux-firmware/linux-firmware-license: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGSIZE changed from 135358 to 136967 (+1%)
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u-license: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u-license: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-modem: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-modem: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-wifi: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-wifi: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-adreno: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-adreno: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: FILELIST: removed all items "/lib/firmware/qcom/LENOVO/21BX"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PKGSIZE changed from 23 to 0 (-100%)
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-adreno: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-adreno: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-adreno: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-adreno: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-yamato-license: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-yamato-license: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8761: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8761: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8822: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8822: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-src: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-src: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGSIZE changed from 218681 to 236962 (+8%)
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PKGV changed from 20230625 [default] to 20230804 [default]
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: added "/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104314e3-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104314e3-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431493-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431493-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104314d3-spkid1-l0.bin /lib/firmware/qcom/sc8280xp/LENOVO/21BX/audioreach-tplg.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104314d3-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431433-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431433-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431463-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431ccf-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10280cc4.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431ccf-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10280cbd-spkid0.bin /lib/firmware/cirrus
 /cs35l41-dsp1-spk-prot-10431ccf-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431c9f-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431caf-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431c9f-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431caf-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431cdf-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431cdf-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431d1f-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431463.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431483.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431d1f-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431463-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431663-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431483-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431483-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431663-r0.bin /lib/fi
 rmware/cirrus/cs35l41-dsp1-spk-cali-10431463-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431573-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431573-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10280cbd.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431533-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431533-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431503-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431503-spkid1-r0.bin /lib/firmware/qcom/sdm845/Thundercomm/db845c/slpius.jsn /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431cdf.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104317f3-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431473.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104317f3-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431d1f-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431d1f-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431cef
 -spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431cef-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431ccf-spkid1-l0.bin /lib/firmware/mellanox/mlxsw_spectrum-13.2012.1012.mfa2 /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431ccf-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431c9f-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431c9f-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431caf-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431caf-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431cdf-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10280cc2.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431d1f.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104314e3-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10280cc1.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431cef-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431cef-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-
 dsp1-spk-cali-10431473.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431433.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10280cc3.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431cef.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431573.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431433-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431433-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-104314d3-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-104314d3-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431493-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431493-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431493.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid1.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10280cbe-spkid1.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10280cbf-spkid1.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431cdf-spkid0-r0.bin /lib/firmware/qcom/sdm845/Thunder
 comm/db845c/slpir.jsn /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10280cc1-spkid1.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10280cc2-spkid1.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10280cc3-spkid1.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10280cc4-spkid1.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10280cc4.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-104317f3-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-104317f3-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10280cbe-spkid0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10280cbf-spkid0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-104314e3-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-104314e3-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431c9f.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431573-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431573-spkid0-r0.bin /lib/firmware/cirrus/cs3
 5l41-dsp1-spk-cali-10431503-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431503-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431533-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431533-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431cdf-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431663.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10280cc1.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431483-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431483-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10280cbf.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-104314d3.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10280cbe.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431493-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431493-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104314d3-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104314d3-spkid0-r0.bin /lib/firmware/cirrus/cs3
 5l41-dsp1-spk-prot-10431433-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431433-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431463-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431463-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431caf.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104314e3-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431663-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431663-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10280cc1-spkid0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10280cc2-spkid0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10280cc3-spkid0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10280cc4-spkid0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431cef-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431cef-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431c9f-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431c9f-spkid1-r0.bin 
 /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431caf-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431caf-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431cdf-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104317f3.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431473-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431473-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10280cbd.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431ccf-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431533-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431533-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431503-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431503-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431573-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104314e3.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431caf.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431573-spkid
 1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104317f3-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104317f3-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431493.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431503.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431d1f-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431d1f-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431483.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431433.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10280cbe.wmfw /lib/firmware/cirrus/cs35l41/v6.78.0/halo_cspl_RAM_revB2_29.80.0.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431cef-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431cef-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431ccf-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431ccf-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431c9f-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-c
 ali-10431c9f-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431caf-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10280cc3.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431cdf.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431caf-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431503.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10280cc2.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431463.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10280cbe-spkid0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10280cbf-spkid0.bin /lib/firmware/mellanox/mlxsw_spectrum4-34.2012.1012.mfa2 /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431573.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10280cbf.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-104314e3.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431ccf.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431533.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431c9f.wmfw /lib/firmware/qcom/sdm845/Th
 undercomm/db845c/slpi.mbn /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431663.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431533.wmfw /lib/firmware/mellanox/mlxsw_spectrum2-29.2012.1012.mfa2 /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431493-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431493-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431463-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431463-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-104314e3-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-104314e3-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431433-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431433-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-104314d3-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-104314d3-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10280cc1-spkid1.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10280cc2-spkid1.bin /lib/firmware/
 cirrus/cs35l41-dsp1-spk-prot-10280cc3-spkid1.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10280cc4-spkid1.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10280cbe-spkid1.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10280cbd-spkid1.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10280cbf-spkid1.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104314d3.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431d1f-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431d1f-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-104317f3-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-104317f3-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-104317f3.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10280cc1-spkid0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10280cc2-spkid0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10280cc3-spkid0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431d1f.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10280cc4-spkid0.bin /lib/firm
 ware/cirrus/cs35l41-dsp1-spk-cali-10431573-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431573-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431503-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431503-spkid0-r0.bin /lib/firmware/mellanox/mlxsw_spectrum3-30.2012.1012.mfa2 /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431cdf-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431cdf-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431533-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431533-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431cef.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431463-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431473-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431473-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431ccf.wmfw"
packages/all-poky-linux/linux-firmware/linux-firmware: PV changed from "20230625" to "20230804"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGSIZE changed from 267378507 to 287204383 (+7%)
packages/all-poky-linux/linux-firmware/linux-firmware: PKGV changed from 20230625 [default] to 20230804 [default]

--===============6328078789949903438==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: FILELIST: added "/lib/firmware/amdgpu/gc_11_0_3_mec.bin /lib/firmware/amdgpu/psp_13_0_10_sos.bin /lib/firmware/amdgpu/gc_11_0_3_rlc.bin /lib/firmware/amdgpu/gc_11_0_3_pfp.bin /lib/firmware/amdgpu/gc_11_0_3_me.bin /lib/firmware/amdgpu/gc_11_0_3_imu.bin /lib/firmware/amdgpu/gc_11_0_3_mes1.bin /lib/firmware/amdgpu/gc_11_0_3_mes_2.bin /lib/firmware/amdgpu/psp_13_0_10_ta.bin /lib/firmware/amdgpu/sdma_6_0_3.bin /lib/firmware/amdgpu/smu_13_0_10.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-ice: FILELIST: added "/lib/firmware/intel/ice/ddp-lag/ice_lag-1.3.1.0.pkg"
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PKGSIZE changed from 2143532 to 2836308 (+32%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: FILELIST: added "/lib/firmware/iwlwifi-ty-a0-gf-a0-83.ucode /lib/firmware/iwlwifi-so-a0-gf-a0-83.ucode /lib/firmware/iwlwifi-so-a0-gf4-a0-83.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-license: FILELIST: added "/lib/firmware/LICENCE.linaro"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: FILELIST: removed all items "/lib/firmware/qcom/LENOVO/21BX"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PKGSIZE changed from 23 to 0 (-100%)
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: added "/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431503-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431503-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431573-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431573-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431533-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431533-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104317f3-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104317f3-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104314d3-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431d1f-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431473-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431473-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431d1f-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104314d3.wmfw /lib/firmware/cirrus/cs35
 l41-dsp1-spk-cali-104317f3-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-104317f3-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431663.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431433.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-104314d3-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-104314d3-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431c9f.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431663-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431483-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431483-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431663-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10280cc1-spkid0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10280cc2-spkid0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10280cc3-spkid0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10280cc4-spkid0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10280cbd.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot
 -10431433-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104314d3-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104314e3-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104314e3-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431463-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431463-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431433-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10280cc1-spkid0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10280cc2-spkid0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10280cc3-spkid0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-104317f3.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10280cc2.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid1.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10280cbe-spkid1.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10280cbf-spkid1.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10280cbf.wmfw /lib/firmware/cirrus/cs35l41
 -dsp1-spk-cali-10431533.wmfw /lib/firmware/mellanox/mlxsw_spectrum2-29.2012.1012.mfa2 /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431493-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431493-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431503.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10280cbd.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10280cc4.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431493.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431533-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431ccf.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431463.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431503-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431503-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10280cbf.wmfw /lib/firmware/cirrus/cs35l41/v6.78.0/halo_cspl_RAM_revB2_29.80.0.wmfw /lib/firmware/mellanox/mlxsw_spectrum4-34.2012.1012.mfa2 /lib/firmware/mellanox/mlxsw_spectrum3-30.2012.1012.mfa
 2 /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431d1f-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431d1f-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431c9f-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431533-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431533-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431503-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431503-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431573-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431573-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10280cc1-spkid1.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431493-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-104314d3-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-104314d3-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431cdf-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431cdf-spkid0-r0.bin /lib/fir
 mware/cirrus/cs35l41-dsp1-spk-cali-10431caf-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431493-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10280cbe.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431c9f-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431c9f-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431caf-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431ccf-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431ccf-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431cef-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431cef-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431ccf-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431ccf-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431cdf-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431cdf-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431c9f-spkid1-l0.bin /lib/firmware/cirrus/cs3
 5l41-dsp1-spk-prot-10431c9f-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431caf-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431caf-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431533.wmfw /lib/firmware/qcom/sc8280xp/LENOVO/21BX/audioreach-tplg.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431573.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431cef.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431493.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431ccf-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431ccf-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431caf.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10280cbe.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431573.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431433.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10280cc3.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431caf.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431663-l0.bin /l
 ib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431663-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431533-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431533-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431503-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431503-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431573-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431573-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104317f3-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104317f3-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10280cc2.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431483-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431483-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431d1f-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431d1f-spkid1-r0.bin /lib/firmware/qcom/sdm845/Thundercomm/db845c/slpir.jsn /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-104317f
 3-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-104317f3-spkid0-r0.bin /lib/firmware/qcom/sdm845/Thundercomm/db845c/slpi.mbn /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104314d3-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431cef-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431cef.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431cef-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104317f3.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431473-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431473-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10280cbd-spkid0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10280cbe-spkid0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10280cbf-spkid0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431663.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10280cc2-spkid1.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431463-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10280cbd-spki
 d0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10280cbe-spkid0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10280cbf-spkid0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431463-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104314e3-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104314e3-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431433-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431433-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104314d3-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431473.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431463-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431463-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10280cc1-spkid1.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10280cc2-spkid1.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10280cc3-spkid1.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10280cc4-spkid1.bin /lib/firmware/cirrus/cs35l4
 1-dsp1-spk-prot-10431483.wmfw /lib/firmware/mellanox/mlxsw_spectrum-13.2012.1012.mfa2 /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-104314d3.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431cdf.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431cdf.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431d1f.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431493-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431493-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104314e3.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431473.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431463.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431ccf.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10280cc1.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-104314e3.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-104314e3-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-104314e3-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431d1f-spkid1-l0.bin /lib/firmwa
 re/cirrus/cs35l41-dsp1-spk-cali-10431d1f-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431573-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431573-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431533-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10280cbd-spkid1.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10280cc4.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10280cbe-spkid1.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10280cbf-spkid1.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431433-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431433-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431463-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431cef-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431cef-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431463-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-104314e3-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-sp
 k-cali-104314e3-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431cdf-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431cdf-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431caf-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431caf-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431c9f-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10280cc4-spkid1.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431483.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10280cc3-spkid1.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431433-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431433-spkid1-r0.bin /lib/firmware/qcom/sdm845/Thundercomm/db845c/slpius.jsn /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10280cc4-spkid0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10280cc1.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431cef-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431cef-spkid0-r0.bin /lib/firmware/
 cirrus/cs35l41-dsp1-spk-prot-10431ccf-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431ccf-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431cdf-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431cdf-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431c9f-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431c9f-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431caf-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431caf-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431493-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431493-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431d1f.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431503.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431c9f.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10280cc3.wmfw"

--===============6328078789949903438==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-linux-firmware-upgrade-20230625-20230804.patch"

RnJvbSA4Yjk3ZTAyODdiMTY1MDMyNjZjZWExNWU0NjY3NGVkZjEyZDAzMGU4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgQXVnIDIwMjMgMDc6MjA6MTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aW51eC1maXJtd2FyZTogdXBncmFkZSAyMDIzMDYyNSAtPiAyMDIzMDgwNAoKLS0tCiAuLi4yMDIz
MDYyNS5iYiA9PiBsaW51eC1maXJtd2FyZV8yMDIzMDgwNC5iYn0gfCA2MDIgKysrKysrKysrKysr
KysrKystCiAxIGZpbGUgY2hhbmdlZCwgNjAwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS97bGludXgtZmlybXdh
cmVfMjAyMzA2MjUuYmIgPT4gbGludXgtZmlybXdhcmVfMjAyMzA4MDQuYmJ9ICg2NSUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2Fy
ZV8yMDIzMDYyNS5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgt
ZmlybXdhcmVfMjAyMzA4MDQuYmIKc2ltaWxhcml0eSBpbmRleCA2NSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZV8yMDIzMDYyNS5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJt
d2FyZV8yMDIzMDgwNC5iYgppbmRleCA2NzY1MjI2YjlkLi4wMzZlOTJkNjI1IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlXzIwMjMw
NjI1LmJiCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgtZmly
bXdhcmVfMjAyMzA4MDQuYmIKQEAgLTEsMyArMSw2MDEgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklM
RVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4K
KyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRo
ZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlm
IG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3Nh
Z2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0
ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0t
LSBXSEVOQ0UKKyMgKysrIFdIRU5DRQorIyBAQCAtMTAxNywyMiArMTAxNywyMiBAQAorIyAgVmVy
c2lvbjogNzQuYTVlOTU4OGIuMAorIyAgCisjICBGaWxlOiBpd2x3aWZpLWNjLWEwLTc3LnVjb2Rl
CisjIC1WZXJzaW9uOiA3NC4yMDZiMDE4NC4wCisjICtWZXJzaW9uOiA3NC4yZGY4OTg2Zi4wCisj
ICAKKyMgIEZpbGU6IGl3bHdpZmktUXUtYjAtaHItYjAtNzcudWNvZGUKKyMgLVZlcnNpb246IDc0
LjIwNmIwMTg0LjAKKyMgK1ZlcnNpb246IDc0LjJkZjg5ODZmLjAKKyMgIAorIyAgRmlsZTogaXds
d2lmaS1RdS1iMC1qZi1iMC03Ny51Y29kZQorIyAtVmVyc2lvbjogNzQuMjA2YjAxODQuMAorIyAr
VmVyc2lvbjogNzQuMmRmODk4NmYuMAorIyAgCisjICBGaWxlOiBpd2x3aWZpLVF1LWMwLWhyLWIw
LTc3LnVjb2RlCisjIC1WZXJzaW9uOiA3NC4yMDZiMDE4NC4wCisjICtWZXJzaW9uOiA3NC4yZGY4
OTg2Zi4wCisjICAKKyMgIEZpbGU6IGl3bHdpZmktUXUtYzAtamYtYjAtNzcudWNvZGUKKyMgLVZl
cnNpb246IDc0LjIwNmIwMTg0LjAKKyMgK1ZlcnNpb246IDc0LjJkZjg5ODZmLjAKKyMgIAorIyAg
RmlsZTogaXdsd2lmaS1RdVotYTAtaHItYjAtNzcudWNvZGUKKyMgLVZlcnNpb246IDc0LjIwNmIw
MTg0LjAKKyMgK1ZlcnNpb246IDc0LjJkZjg5ODZmLjAKKyMgIAorIyAgRmlsZTogaXdsd2lmaS1R
dVotYTAtamYtYjAtNzcudWNvZGUKKyMgIFZlcnNpb246IDc0LjIwNmIwMTg0LjAKKyMgQEAgLTEw
NDksNiArMTA0OSw5IEBACisjICBGaWxlOiBpd2x3aWZpLXR5LWEwLWdmLWEwLTgxLnVjb2RlCisj
ICBWZXJzaW9uOiA3OC4zMWZjOWFlNi4wCisjICAKKyMgK0ZpbGU6IGl3bHdpZmktdHktYTAtZ2Yt
YTAtODMudWNvZGUKKyMgK1ZlcnNpb246IDgwLmU4Zjg0ZTk4LjAKKyMgKworIyAgRmlsZTogaXds
d2lmaS1zby1hMC1nZjQtYTAtNzcudWNvZGUKKyMgIFZlcnNpb246IDc0LmY5MmI1ZmVkLjAKKyMg
IAorIyBAQCAtMTA2MSw2ICsxMDY0LDkgQEAKKyMgIEZpbGU6IGl3bHdpZmktc28tYTAtZ2Y0LWEw
LTgxLnVjb2RlCisjICBWZXJzaW9uOiA3OC4zMWZjOWFlNi4wCisjICAKKyMgK0ZpbGU6IGl3bHdp
Zmktc28tYTAtZ2Y0LWEwLTgzLnVjb2RlCisjICtWZXJzaW9uOiA4MC5lOGY4NGU5OC4wCisjICsK
KyMgIEZpbGU6IGl3bHdpZmktc28tYTAtZ2YtYTAtNzcudWNvZGUKKyMgIFZlcnNpb246IDc0LmY5
MmI1ZmVkLjAKKyMgIAorIyBAQCAtMTA3Miw2ICsxMDc4LDkgQEAKKyMgIAorIyAgRmlsZTogaXds
d2lmaS1zby1hMC1nZi1hMC04MS51Y29kZQorIyAgVmVyc2lvbjogNzguMzFmYzlhZTYuMAorIyAr
CisjICtGaWxlOiBpd2x3aWZpLXNvLWEwLWdmLWEwLTgzLnVjb2RlCisjICtWZXJzaW9uOiA4MC5l
OGY4NGU5OC4wCisjICAKKyMgIEZpbGU6IGl3bHdpZmktc28tYTAtaHItYjAtNzcudWNvZGUKKyMg
IFZlcnNpb246IDc0LmY5MmI1ZmVkLjAKKyMgQEAgLTIzODIsNiArMjM5MSwxMyBAQAorIyAgRmls
ZTogYW1kZ3B1L2djXzExXzBfMl9tZXNfMi5iaW4KKyMgIEZpbGU6IGFtZGdwdS9nY18xMV8wXzJf
cGZwLmJpbgorIyAgRmlsZTogYW1kZ3B1L2djXzExXzBfMl9ybGMuYmluCisjICtGaWxlOiBhbWRn
cHUvZ2NfMTFfMF8zX2ltdS5iaW4KKyMgK0ZpbGU6IGFtZGdwdS9nY18xMV8wXzNfbWUuYmluCisj
ICtGaWxlOiBhbWRncHUvZ2NfMTFfMF8zX21lYy5iaW4KKyMgK0ZpbGU6IGFtZGdwdS9nY18xMV8w
XzNfbWVzMS5iaW4KKyMgK0ZpbGU6IGFtZGdwdS9nY18xMV8wXzNfbWVzXzIuYmluCisjICtGaWxl
OiBhbWRncHUvZ2NfMTFfMF8zX3BmcC5iaW4KKyMgK0ZpbGU6IGFtZGdwdS9nY18xMV8wXzNfcmxj
LmJpbgorIyAgRmlsZTogYW1kZ3B1L2djXzExXzBfNF9pbXUuYmluCisjICBGaWxlOiBhbWRncHUv
Z2NfMTFfMF80X21lLmJpbgorIyAgRmlsZTogYW1kZ3B1L2djXzExXzBfNF9tZWMuYmluCisjIEBA
IC0yNDA3LDYgKzI0MjMsOCBAQAorIyAgRmlsZTogYW1kZ3B1L3BzcF8xM18wXzhfYXNkLmJpbgor
IyAgRmlsZTogYW1kZ3B1L3BzcF8xM18wXzhfdGEuYmluCisjICBGaWxlOiBhbWRncHUvcHNwXzEz
XzBfOF90b2MuYmluCisjICtGaWxlOiBhbWRncHUvcHNwXzEzXzBfMTBfc29zLmJpbgorIyArRmls
ZTogYW1kZ3B1L3BzcF8xM18wXzEwX3RhLmJpbgorIyAgRmlsZTogYW1kZ3B1L3BzcF8xM18wXzEx
X3RhLmJpbgorIyAgRmlsZTogYW1kZ3B1L3BzcF8xM18wXzExX3RvYy5iaW4KKyMgIEZpbGU6IGFt
ZGdwdS9zZG1hXzVfMl82LmJpbgorIyBAQCAtMjQxNCw4ICsyNDMyLDEwIEBACisjICBGaWxlOiBh
bWRncHUvc2RtYV82XzBfMC5iaW4KKyMgIEZpbGU6IGFtZGdwdS9zZG1hXzZfMF8xLmJpbgorIyAg
RmlsZTogYW1kZ3B1L3NkbWFfNl8wXzIuYmluCisjICtGaWxlOiBhbWRncHUvc2RtYV82XzBfMy5i
aW4KKyMgIEZpbGU6IGFtZGdwdS9zbXVfMTNfMF8wLmJpbgorIyAgRmlsZTogYW1kZ3B1L3NtdV8x
M18wXzcuYmluCisjICtGaWxlOiBhbWRncHUvc211XzEzXzBfMTAuYmluCisjICBGaWxlOiBhbWRn
cHUvdmNuXzNfMV8yLmJpbgorIyAgRmlsZTogYW1kZ3B1L3Zjbl80XzBfMC5iaW4KKyMgIEZpbGU6
IGFtZGdwdS92Y25fNF8wXzIuYmluCisjIEBAIC0zNjc3LDY5ICszNjk3LDY5IEBACisjICBGaWxl
OiBpbnRlbC9pYnQtMTgtMS5kZGMKKyMgIFZlcnNpb246IEJUX1RodW5kZXJQZWFrX0EwX0IwX1JF
TDAyMDEKKyMgIEZpbGU6aW50ZWwvaWJ0LTIwLTAtMy5zZmkKKyMgLVZlcnNpb246IEJUX0N5Y2xv
bmVQZWFrX0EwX1JFTDUzMzkyCisjICtWZXJzaW9uOiBCVF9DeWNsb25lUGVha19BMF9SRUw1MzQ1
NAorIyAgRmlsZTppbnRlbC9pYnQtMjAtMC0zLmRkYworIyAtVmVyc2lvbjogQlRfQ3ljbG9uZVBl
YWtfQTBfUkVMNTMzOTIKKyMgK1ZlcnNpb246IEJUX0N5Y2xvbmVQZWFrX0EwX1JFTDUzNDU0Cisj
ICBGaWxlOmludGVsL2lidC0yMC0xLTMuc2ZpCisjIC1WZXJzaW9uOiBCVF9DeWNsb25lUGVha19B
MF9SRUw1MzM5MgorIyArVmVyc2lvbjogQlRfQ3ljbG9uZVBlYWtfQTBfUkVMNTM0NTQKKyMgIEZp
bGU6aW50ZWwvaWJ0LTIwLTEtMy5kZGMKKyMgLVZlcnNpb246IEJUX0N5Y2xvbmVQZWFrX0EwX1JF
TDUzMzkyCisjICtWZXJzaW9uOiBCVF9DeWNsb25lUGVha19BMF9SRUw1MzQ1NAorIyAgRmlsZTpp
bnRlbC9pYnQtMjAtMS00LnNmaQorIyAtVmVyc2lvbjogQlRfQ3ljbG9uZVBlYWtfQTBfUkVMNTMz
OTIKKyMgK1ZlcnNpb246IEJUX0N5Y2xvbmVQZWFrX0EwX1JFTDUzNDU0CisjICBGaWxlOmludGVs
L2lidC0yMC0xLTQuZGRjCisjIC1WZXJzaW9uOiBCVF9DeWNsb25lUGVha19BMF9SRUw1MzM5Mgor
IyArVmVyc2lvbjogQlRfQ3ljbG9uZVBlYWtfQTBfUkVMNTM0NTQKKyMgIEZpbGU6aW50ZWwvaWJ0
LTE5LTAtMC5zZmkKKyMgLVZlcnNpb246IEJUX1F1YXNhcl9SRUw1MzM5MgorIyArVmVyc2lvbjog
QlRfUXVhc2FyX1JFTDUzNDU0CisjICBGaWxlOmludGVsL2lidC0xOS0wLTAuZGRjCisjIC1WZXJz
aW9uOiBCVF9RdWFzYXJfUkVMNTMzOTIKKyMgK1ZlcnNpb246IEJUX1F1YXNhcl9SRUw1MzQ1NAor
IyAgRmlsZTppbnRlbC9pYnQtMTktMC0xLnNmaQorIyAtVmVyc2lvbjogQlRfUXVhc2FyX1JFTDUz
MzkyCisjICtWZXJzaW9uOiBCVF9RdWFzYXJfUkVMNTM0NTQKKyMgIEZpbGU6aW50ZWwvaWJ0LTE5
LTAtMS5kZGMKKyMgLVZlcnNpb246IEJUX1F1YXNhcl9SRUw1MzM5MgorIyArVmVyc2lvbjogQlRf
UXVhc2FyX1JFTDUzNDU0CisjICBGaWxlOmludGVsL2lidC0xOS0wLTMuc2ZpCisjICBWZXJzaW9u
OiBCVF9RdWFzYXJfUkVMNTMyNjMKKyMgIEZpbGU6aW50ZWwvaWJ0LTE5LTAtMy5kZGMKKyMgIFZl
cnNpb246IEJUX1F1YXNhcl9SRUw1MzI2MworIyAgRmlsZTppbnRlbC9pYnQtMTktMC00LnNmaQor
IyAtVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDUzMzkyCisjICtWZXJzaW9uOiBCVF9IYXJy
aXNvblBlYWtfUkVMNTM0NTQKKyMgIEZpbGU6aW50ZWwvaWJ0LTE5LTAtNC5kZGMKKyMgLVZlcnNp
b246IEJUX0hhcnJpc29uUGVha19SRUw1MzM5MgorIyArVmVyc2lvbjogQlRfSGFycmlzb25QZWFr
X1JFTDUzNDU0CisjICBGaWxlOmludGVsL2lidC0xOS0xNi00LnNmaQorIyAtVmVyc2lvbjogQlRf
SGFycmlzb25QZWFrX1JFTDUzMzkyCisjICtWZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMNTM0
NTQKKyMgIEZpbGU6aW50ZWwvaWJ0LTE5LTE2LTQuZGRjCisjIC1WZXJzaW9uOiBCVF9IYXJyaXNv
blBlYWtfUkVMNTMzOTIKKyMgK1ZlcnNpb246IEJUX0hhcnJpc29uUGVha19SRUw1MzQ1NAorIyAg
RmlsZTppbnRlbC9pYnQtMTktMzItMS5zZmkKKyMgLVZlcnNpb246IEJUX0hhcnJpc29uUGVha19S
RUw1MzM5MgorIyArVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDUzNDU0CisjICBGaWxlOmlu
dGVsL2lidC0xOS0zMi0xLmRkYworIyAtVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDUzMzky
CisjICtWZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMNTM0NTQKKyMgIEZpbGU6aW50ZWwvaWJ0
LTE5LTMyLTAuc2ZpCisjIC1WZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMNTMzOTIKKyMgK1Zl
cnNpb246IEJUX0hhcnJpc29uUGVha19SRUw1MzQ1NAorIyAgRmlsZTppbnRlbC9pYnQtMTktMzIt
MC5kZGMKKyMgLVZlcnNpb246IEJUX0hhcnJpc29uUGVha19SRUw1MzM5MgorIyArVmVyc2lvbjog
QlRfSGFycmlzb25QZWFrX1JFTDUzNDU0CisjICBGaWxlOmludGVsL2lidC0xOS0zMi00LnNmaQor
IyAtVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDUzMzkyCisjICtWZXJzaW9uOiBCVF9IYXJy
aXNvblBlYWtfUkVMNTM0NTQKKyMgIEZpbGU6aW50ZWwvaWJ0LTE5LTMyLTQuZGRjCisjIC1WZXJz
aW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMNTMzOTIKKyMgK1ZlcnNpb246IEJUX0hhcnJpc29uUGVh
a19SRUw1MzQ1NAorIyAgRmlsZTppbnRlbC9pYnQtMTktMjQwLTEuc2ZpCisjIC1WZXJzaW9uOiBC
VF9IYXJyaXNvblBlYWtfUkVMNTMzOTIKKyMgK1ZlcnNpb246IEJUX0hhcnJpc29uUGVha19SRUw1
MzQ1NAorIyAgRmlsZTppbnRlbC9pYnQtMTktMjQwLTEuZGRjCisjIC1WZXJzaW9uOiBCVF9IYXJy
aXNvblBlYWtfUkVMNTMzOTIKKyMgK1ZlcnNpb246IEJUX0hhcnJpc29uUGVha19SRUw1MzQ1NAor
IyAgRmlsZTppbnRlbC9pYnQtMTktMjQwLTQuc2ZpCisjIC1WZXJzaW9uOiBCVF9IYXJyaXNvblBl
YWtfUkVMNTMzOTIKKyMgK1ZlcnNpb246IEJUX0hhcnJpc29uUGVha19SRUw1MzQ1NAorIyAgRmls
ZTppbnRlbC9pYnQtMTktMjQwLTQuZGRjCisjIC1WZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVM
NTMzOTIKKyMgK1ZlcnNpb246IEJUX0hhcnJpc29uUGVha19SRUw1MzQ1NAorIyAgRmlsZTppbnRl
bC9pYnQtMDA0MS0wMDQxLnNmaQorIyAtVmVyc2lvbjogQlRfVHlwaG9vblBlYWtfUkVMNjI1NjIK
KyMgK1ZlcnNpb246IEJUX1R5cGhvb25QZWFrX1JFTDY3MDY4CisjICBGaWxlOmludGVsL2lidC0w
MDQxLTAwNDEuZGRjCisjIC1WZXJzaW9uOiBCVF9UeXBob29uUGVha19SRUw2MjU2MgorIyArVmVy
c2lvbjogQlRfVHlwaG9vblBlYWtfUkVMNjcwNjgKKyMgIEZpbGU6aW50ZWwvaWJ0LTAwNDAtMDA0
MS5zZmkKKyMgLVZlcnNpb246IEJUX1NvbGFyX0dmUDJfUkVMNjI1NjIKKyMgK1ZlcnNpb246IEJU
X1NvbGFyX0dmUDJfUkVMNjcwNjgKKyMgIEZpbGU6aW50ZWwvaWJ0LTAwNDAtMDA0MS5kZGMKKyMg
LVZlcnNpb246IEJUX1NvbGFyX0dmUDJfUkVMNjI1NjIKKyMgK1ZlcnNpb246IEJUX1NvbGFyX0dm
UDJfUkVMNjcwNjgKKyMgIEZpbGU6aW50ZWwvaWJ0LTEwNDAtMDA0MS5zZmkKKyMgLVZlcnNpb246
IEJUX1NvbGFyRl9HZlAyX1JFTDYyNTYyCisjICtWZXJzaW9uOiBCVF9Tb2xhckZfR2ZQMl9SRUw2
NzA2OAorIyAgRmlsZTppbnRlbC9pYnQtMTA0MC0wMDQxLmRkYworIyAtVmVyc2lvbjogQlRfU29s
YXJGX0dmUDJfUkVMNjI1NjIKKyMgK1ZlcnNpb246IEJUX1NvbGFyRl9HZlAyX1JFTDY3MDY4Cisj
ICAKKyMgIEZpbGU6aW50ZWwvaWJ0LTAwNDAtMTAyMC5zZmkKKyMgIFZlcnNpb246IEJUX1NvbGFy
X0pmUDFfUkVMNTk1NjQKKyMgQEAgLTM3NjAsMTMgKzM3ODAsMTMgQEAKKyMgIFZlcnNpb246IEJU
X1NvbGFyRl9KZlAyX1JFTDU5NTY0CisjICAKKyMgIEZpbGU6aW50ZWwvaWJ0LTAwNDAtNDE1MC5z
ZmkKKyMgLVZlcnNpb246IEJUX1NvbGFyX0puUDJfUkVMNjI1NjIKKyMgK1ZlcnNpb246IEJUX1Nv
bGFyX0puUDJfUkVMNjcwNjgKKyMgIEZpbGU6aW50ZWwvaWJ0LTAwNDAtNDE1MC5kZGMKKyMgLVZl
cnNpb246IEJUX1NvbGFyX0puUDJfUkVMNjI1NjIKKyMgK1ZlcnNpb246IEJUX1NvbGFyX0puUDJf
UkVMNjcwNjgKKyMgIEZpbGU6aW50ZWwvaWJ0LTEwNDAtNDE1MC5zZmkKKyMgLVZlcnNpb246IEJU
X1NvbGFyRl9KblAyX1JFTDYyNTYyCisjICtWZXJzaW9uOiBCVF9Tb2xhckZfSm5QMl9SRUw2NzA2
OAorIyAgRmlsZTppbnRlbC9pYnQtMTA0MC00MTUwLmRkYworIyAtVmVyc2lvbjogQlRfU29sYXJG
X0puUDJfUkVMNjI1NjIKKyMgK1ZlcnNpb246IEJUX1NvbGFyRl9KblAyX1JFTDY3MDY4CisjICAK
KyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UuaWJ0X2Zpcm13YXJlIGZv
ciBkZXRhaWxzCisjICAKKyMgQEAgLTM5MDAsMTAgKzM5MjAsMTAgQEAKKyMgIFZlcnNpb246IDIw
MTQtMTAtMjgKKyMgIEZpbGU6IGFtZC11Y29kZS9taWNyb2NvZGVfYW1kX2ZhbTE3aC5iaW4KKyMg
IFJhdzogYW1kLXVjb2RlL21pY3JvY29kZV9hbWRfZmFtMTdoLmJpbgorIyAtVmVyc2lvbjogMjAy
My0wNC0xMworIyArVmVyc2lvbjogMjAyMy0wNy0xOQorIyAgRmlsZTogYW1kLXVjb2RlL21pY3Jv
Y29kZV9hbWRfZmFtMTloLmJpbgorIyAgUmF3OiBhbWQtdWNvZGUvbWljcm9jb2RlX2FtZF9mYW0x
OWguYmluCisjIC1WZXJzaW9uOiAyMDIzLTAxLTMxCisjICtWZXJzaW9uOiAyMDIzLTA3LTE4Cisj
ICBGaWxlOiBhbWQtdWNvZGUvUkVBRE1FCisjICAKKyMgIExpY2Vuc2U6IFJlZGlzdHJpYnV0YWJs
ZS4gU2VlIExJQ0VOU0UuYW1kLXVjb2RlIGZvciBkZXRhaWxzCisjIEBAIC00NjYyLDcgKzQ2ODIs
NyBAQAorIyAgVmVyc2lvbjogRE1DIEFQSS9BUEIgdmVyIDIgcmVsZWFzZSAxNiBmb3IgQWxkZXJs
YWtlIFAKKyMgIAorIyAgRmlsZTogaTkxNS9hZGxwX2RtYy5iaW4KKyMgLVZlcnNpb246IERNQyBB
UEkvQVBCIHZlciAyIHJlbGVhc2UgMTkgZm9yIEFsZGVybGFrZSBQCisjICtWZXJzaW9uOiBETUMg
QVBJL0FQQiB2ZXIgMiByZWxlYXNlIDIwIGZvciBBbGRlcmxha2UgUAorIyAgCisjICBGaWxlOiBp
OTE1L2FkbHBfZ3VjXzYyLjAuMy5iaW4KKyMgIFZlcnNpb246IEd1QyBBUEkvQVBCIHZlciA2Mi4w
LjMgZm9yIEFsZGVybGFrZSBQCisjIEBAIC00NjgzLDcgKzQ3MDMsNyBAQAorIyAgVmVyc2lvbjog
R3VDIEFQSS9BUEIgdmVyIDcwLjQuMSBmb3IgREcyCisjICAKKyMgIEZpbGU6IGk5MTUvZGcyX2d1
Y183MC5iaW4KKyMgLVZlcnNpb246IEd1QyBBUEkvQVBCIHZlciA3MC41LjEgZm9yIERHMgorIyAr
VmVyc2lvbjogR3VDIEFQSS9BUEIgdmVyIDcwLjguMCBmb3IgREcyCisjICAKKyMgIEZpbGU6IGk5
MTUvZGcyX2h1Y19nc2MuYmluCisjICBWZXJzaW9uOiBIdUMgQVBJL0FQQiB2ZXIgNy4xMC4zIGZv
ciBERzIKKyMgQEAgLTQ3MDEsMTMgKzQ3MjEsMTMgQEAKKyMgIFZlcnNpb246IERNQyBBUEkvQVBC
IHZlciAyIHJlbGVhc2UgMTAgZm9yIE1ldGVvcmxha2UKKyMgIAorIyAgRmlsZTogaTkxNS9tdGxf
ZG1jLmJpbgorIyAtVmVyc2lvbjogRE1DIEFQSS9BUEIgdmVyIDIgcmVsZWFzZSAxMiBmb3IgTWV0
ZW9ybGFrZQorIyArVmVyc2lvbjogRE1DIEFQSS9BUEIgdmVyIDIgcmVsZWFzZSAxMyBmb3IgTWV0
ZW9ybGFrZQorIyAgCisjICBGaWxlOiBpOTE1L210bF9ndWNfNzAuYmluCisjIC1WZXJzaW9uOiBH
dUMgQVBJL0FQQiB2ZXIgNzAuNi42IGZvciBNZXRlb3JsYWtlCisjICtWZXJzaW9uOiBHdUMgQVBJ
L0FQQiB2ZXIgNzAuOC4wIGZvciBNZXRlb3JsYWtlCisjICAKKyMgIEZpbGU6IGk5MTUvbXRsX2h1
Y19nc2MuYmluCisjIC1WZXJzaW9uOiBIdUMgQVBJL0FQQiB2ZXIgOC41LjAgZm9yIE1ldGVvcmxh
a2UKKyMgK1ZlcnNpb246IEh1QyBBUEkvQVBCIHZlciA4LjUuMSBmb3IgTWV0ZW9ybGFrZQorIyAg
CisjICBMaWNlbnNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLmk5MTUgZm9yIGRldGFp
bHMKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjIEBAIC01MTk4LDcgKzUyMTgsNyBAQAorIyAgRmls
ZTogbWVkaWF0ZWsvbXQ4MTkyL3NjcC5pbWcKKyMgIFZlcnNpb246IHYyLjAuMjA1MzYKKyMgIEZp
bGU6IG1lZGlhdGVrL210ODE5NS9zY3AuaW1nCisjIC1WZXJzaW9uOiB2Mi4wLjExOTY2CisjICtW
ZXJzaW9uOiB2Mi4wLjIxOTYxCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2Vl
IExJQ0VOQ0UubWVkaWF0ZWsgZm9yIGRldGFpbHMuCisjICAKKyMgQEAgLTUzODYsOSArNTQwNiw5
IEBACisjICBEcml2ZXI6IG10NzkyMiAtIE1lZGlhVGVrIE1UNzkyMiBXaXJlbGVzcyBNQUNzCisj
ICAKKyMgIEZpbGU6IG1lZGlhdGVrL1dJRklfTVQ3OTIyX3BhdGNoX21jdV8xXzFfaGRyLmJpbgor
IyAtVmVyc2lvbjogMjAyMzA1MzAxMjMxNTRhCisjICtWZXJzaW9uOiAyMDIzMDYyNzE0MzcwMmEK
KyMgIEZpbGU6IG1lZGlhdGVrL1dJRklfUkFNX0NPREVfTVQ3OTIyXzEuYmluCisjIC1WZXJzaW9u
OiAyMDIzMDUzMDEyMzIzNgorIyArVmVyc2lvbjogMjAyMzA2MjcxNDM5NDYKKyMgIAorIyAgTGlj
ZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5tZWRpYXRlayBmb3IgZGV0YWlscy4K
KyMgIAorIyBAQCAtNTM5Nyw3ICs1NDE3LDcgQEAKKyMgIERyaXZlcjogbXQ3OTIyIC0gTWVkaWFU
ZWsgTVQ3OTIyIGJsdWV0b290aCBjaGlwc2V0CisjICAKKyMgIEZpbGU6IG1lZGlhdGVrL0JUX1JB
TV9DT0RFX01UNzkyMl8xXzFfaGRyLmJpbgorIyAtVmVyc2lvbjogMjAyMzA1MzAxMjM1MzEKKyMg
K1ZlcnNpb246IDIwMjMwNjI3MTQ0MjIwCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJs
ZS4gU2VlIExJQ0VOQ0UubWVkaWF0ZWsgZm9yIGRldGFpbHMuCisjICAKKyMgQEAgLTU2MTksNiAr
NTYzOSw5IEBACisjICBGaWxlOiBxY29tL3NkbTg0NS9hZHNwdWEuanNuCisjICBGaWxlOiBxY29t
L3NkbTg0NS9jZHNwLm1ibgorIyAgRmlsZTogcWNvbS9zZG04NDUvY2RzcHIuanNuCisjICtGaWxl
OiBxY29tL3NkbTg0NS9UaHVuZGVyY29tbS9kYjg0NWMvc2xwaS5tYm4KKyMgK0ZpbGU6IHFjb20v
c2RtODQ1L1RodW5kZXJjb21tL2RiODQ1Yy9zbHBpci5qc24KKyMgK0ZpbGU6IHFjb20vc2RtODQ1
L1RodW5kZXJjb21tL2RiODQ1Yy9zbHBpdXMuanNuCisjICBGaWxlOiBxY29tL3NtODI1MC9hZHNw
Lm1ibgorIyAgRmlsZTogcWNvbS9zbTgyNTAvYWRzcHIuanNuCisjICBGaWxlOiBxY29tL3NtODI1
MC9hZHNwdWEuanNuCisjIEBAIC01NjMxLDcgKzU2NTQsNiBAQAorIyAgRmlsZTogcWNvbS9zYzgy
ODB4cC9MRU5PVk8vMjFCWC9xY2Fkc3A4MjgwLm1ibgorIyAgRmlsZTogcWNvbS9zYzgyODB4cC9M
RU5PVk8vMjFCWC9xY2Nkc3A4MjgwLm1ibgorIyAgRmlsZTogcWNvbS9zYzgyODB4cC9MRU5PVk8v
MjFCWC9xY3NscGk4MjgwLm1ibgorIyAtTGluazogcWNvbS9MRU5PVk8vMjFCWCAtPiAuLi9zYzgy
ODB4cC9MRU5PVk8vMjFCWAorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBM
SUNFTlNFLnFjb20gYW5kIHFjb20vTk9USUNFLnR4dCBmb3IgZGV0YWlscworIyAgCisjIEBAIC01
NzMxLDYgKzU3NTMsMTAgQEAKKyMgIEZpbGU6IG1lbGxhbm94L21seHN3X3NwZWN0cnVtMi0yOS4y
MDEwLjMxNDYubWZhMgorIyAgRmlsZTogbWVsbGFub3gvbWx4c3dfc3BlY3RydW0zLTMwLjIwMTAu
MzE0Ni5tZmEyCisjICBGaWxlOiBtZWxsYW5veC9sY19pbmlfYnVuZGxlXzIwMTBfMzE0Ni5iaW4K
KyMgK0ZpbGU6IG1lbGxhbm94L21seHN3X3NwZWN0cnVtLTEzLjIwMTIuMTAxMi5tZmEyCisjICtG
aWxlOiBtZWxsYW5veC9tbHhzd19zcGVjdHJ1bTItMjkuMjAxMi4xMDEyLm1mYTIKKyMgK0ZpbGU6
IG1lbGxhbm94L21seHN3X3NwZWN0cnVtMy0zMC4yMDEyLjEwMTIubWZhMgorIyArRmlsZTogbWVs
bGFub3gvbWx4c3dfc3BlY3RydW00LTM0LjIwMTIuMTAxMi5tZmEyCisjICAKKyMgIExpY2VuY2U6
CisjICAgQ29weXJpZ2h0IChjKSAyMDE3LTIwMjAgTWVsbGFub3ggVGVjaG5vbG9naWVzLCBMdGQu
IEFsbCByaWdodHMgcmVzZXJ2ZWQuCisjIEBAIC01ODMxLDYgKzU4NTcsNyBAQAorIyAgCisjICBG
aWxlOiBpbnRlbC9pY2UvZGRwL2ljZS0xLjMuMzAuMC5wa2cKKyMgIExpbms6IGludGVsL2ljZS9k
ZHAvaWNlLnBrZyAtPiBpY2UtMS4zLjMwLjAucGtnCisjICtGaWxlOiBpbnRlbC9pY2UvZGRwLWxh
Zy9pY2VfbGFnLTEuMy4xLjAucGtnCisjICAKKyMgIExpY2Vuc2U6IFJlZGlzdHJpYnV0YWJsZS4g
U2VlIExJQ0VOU0UuaWNlIGZvciBkZXRhaWxzCisjICAKKyMgQEAgLTU4NzksNyArNTkwNiw3IEBA
CisjICBEcml2ZXI6IHdmeCAtIFNpbGljb24gTGFicyBXaS1GaSBUcmFuc2NlaXZlcgorIyAgCisj
ICBGaWxlOiB3Zngvd2ZtX3dmMjAwX0MwLnNlYworIyAtVmVyc2lvbjogMy4xNAorIyArVmVyc2lv
bjogMy4xNi4xCisjICAKKyMgIEZpbGU6IHdmeC9icmQ0MDAxYS5wZHMKKyMgIEZpbGU6IHdmeC9i
cmQ4MDIyYS5wZHMKKyMgQEAgLTYxMDUsNiArNjEzMiwxNzUgQEAKKyMgIEZpbGU6IGNpcnJ1cy9j
czM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzFlMTItc3BraWQwLXIwLmJpbgorIyAgRmlsZTogY2ly
cnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMWUxMi1zcGtpZDEtbDAuYmluCisjICBGaWxl
OiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMxZTEyLXNwa2lkMS1yMC5iaW4KKyMg
K0ZpbGU6IGNpcnJ1cy9jczM1bDQxL3Y2Ljc4LjAvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS44MC4w
LndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzE1NzMud21m
dyAtPiBjczM1bDQxL3Y2LjYxLjEvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS42My4xLndtZncKKyMg
K0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTA0MzE1NzMud21mdyAtPiBjczM1
bDQxL3Y2LjYxLjEvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS42My4xLndtZncKKyMgK0xpbms6IGNp
cnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzE0NjMud21mdyAtPiBjczM1bDQxL3Y2LjYx
LjEvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS42My4xLndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1
bDQxLWRzcDEtc3BrLWNhbGktMTA0MzE0NjMud21mdyAtPiBjczM1bDQxL3Y2LjYxLjEvaGFsb19j
c3BsX1JBTV9yZXZCMl8yOS42My4xLndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEt
c3BrLXByb3QtMTA0MzE0ODMud21mdyAtPiBjczM1bDQxL3Y2LjYxLjEvaGFsb19jc3BsX1JBTV9y
ZXZCMl8yOS42My4xLndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGkt
MTA0MzE0ODMud21mdyAtPiBjczM1bDQxL3Y2LjYxLjEvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS42
My4xLndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzE2NjMu
d21mdyAtPiBjczM1bDQxL3Y2LjYxLjEvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS42My4xLndtZncK
KyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTA0MzE2NjMud21mdyAtPiBj
czM1bDQxL3Y2LjYxLjEvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS42My4xLndtZncKKyMgK0xpbms6
IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzE0NzMud21mdyAtPiBjczM1bDQxL3Y2
LjYxLjEvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS42My4xLndtZncKKyMgK0xpbms6IGNpcnJ1cy9j
czM1bDQxLWRzcDEtc3BrLWNhbGktMTA0MzE0NzMud21mdyAtPiBjczM1bDQxL3Y2LjYxLjEvaGFs
b19jc3BsX1JBTV9yZXZCMl8yOS42My4xLndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRz
cDEtc3BrLXByb3QtMTA0MzE0OTMud21mdyAtPiBjczM1bDQxL3Y2LjYxLjEvaGFsb19jc3BsX1JB
TV9yZXZCMl8yOS42My4xLndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNh
bGktMTA0MzE0OTMud21mdyAtPiBjczM1bDQxL3Y2LjYxLjEvaGFsb19jc3BsX1JBTV9yZXZCMl8y
OS42My4xLndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzE1
MzMud21mdyAtPiBjczM1bDQxL3Y2LjYxLjEvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS42My4xLndt
ZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTA0MzE1MzMud21mdyAt
PiBjczM1bDQxL3Y2LjYxLjEvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS42My4xLndtZncKKyMgK0xp
bms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzE0MzMud21mdyAtPiBjczM1bDQx
L3Y2LjYxLjEvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS42My4xLndtZncKKyMgK0xpbms6IGNpcnJ1
cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTA0MzE0MzMud21mdyAtPiBjczM1bDQxL3Y2LjYxLjEv
aGFsb19jc3BsX1JBTV9yZXZCMl8yOS42My4xLndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQx
LWRzcDEtc3BrLXByb3QtMTA0MzFjYWYud21mdyAtPiBjczM1bDQxL3Y2LjYxLjEvaGFsb19jc3Bs
X1JBTV9yZXZCMl8yOS42My4xLndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3Br
LWNhbGktMTA0MzFjYWYud21mdyAtPiBjczM1bDQxL3Y2LjYxLjEvaGFsb19jc3BsX1JBTV9yZXZC
Ml8yOS42My4xLndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0
MzFjZWYud21mdyAtPiBjczM1bDQxL3Y2LjYxLjEvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS42My4x
LndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTA0MzFjZWYud21m
dyAtPiBjczM1bDQxL3Y2LjYxLjEvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS42My4xLndtZncKKyMg
K0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzE0ZDMud21mdyAtPiBjczM1
bDQxL3Y2LjYxLjEvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS42My4xLndtZncKKyMgK0xpbms6IGNp
cnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTA0MzE0ZDMud21mdyAtPiBjczM1bDQxL3Y2LjYx
LjEvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS42My4xLndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1
bDQxLWRzcDEtc3BrLXByb3QtMTA0MzFjOWYud21mdyAtPiBjczM1bDQxL3Y2LjYxLjEvaGFsb19j
c3BsX1JBTV9yZXZCMl8yOS42My4xLndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEt
c3BrLWNhbGktMTA0MzFjOWYud21mdyAtPiBjczM1bDQxL3Y2LjYxLjEvaGFsb19jc3BsX1JBTV9y
ZXZCMl8yOS42My4xLndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3Qt
MTA0MzFjZGYud21mdyAtPiBjczM1bDQxL3Y2LjYxLjEvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS42
My4xLndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTA0MzFjZGYu
d21mdyAtPiBjczM1bDQxL3Y2LjYxLjEvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS42My4xLndtZncK
KyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzFjY2Yud21mdyAtPiBj
czM1bDQxL3Y2LjYxLjEvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS42My4xLndtZncKKyMgK0xpbms6
IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTA0MzFjY2Yud21mdyAtPiBjczM1bDQxL3Y2
LjYxLjEvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS42My4xLndtZncKKyMgK0xpbms6IGNpcnJ1cy9j
czM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzE1MDMud21mdyAtPiBjczM1bDQxL3Y2Ljc4LjAvaGFs
b19jc3BsX1JBTV9yZXZCMl8yOS44MC4wLndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRz
cDEtc3BrLWNhbGktMTA0MzE1MDMud21mdyAtPiBjczM1bDQxL3Y2Ljc4LjAvaGFsb19jc3BsX1JB
TV9yZXZCMl8yOS44MC4wLndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXBy
b3QtMTA0MzE0ZTMud21mdyAtPiBjczM1bDQxL3Y2Ljc4LjAvaGFsb19jc3BsX1JBTV9yZXZCMl8y
OS44MC4wLndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTA0MzE0
ZTMud21mdyAtPiBjczM1bDQxL3Y2Ljc4LjAvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS44MC4wLndt
ZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzFkMWYud21mdyAt
PiBjczM1bDQxL3Y2Ljc4LjAvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS44MC4wLndtZncKKyMgK0xp
bms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTA0MzFkMWYud21mdyAtPiBjczM1bDQx
L3Y2Ljc4LjAvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS44MC4wLndtZncKKyMgK0xpbms6IGNpcnJ1
cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzE3ZjMud21mdyAtPiBjczM1bDQxL3Y2LjYxLjEv
aGFsb19jc3BsX1JBTV9yZXZCMl8yOS42My4xLndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQx
LWRzcDEtc3BrLWNhbGktMTA0MzE3ZjMud21mdyAtPiBjczM1bDQxL3Y2LjYxLjEvaGFsb19jc3Bs
X1JBTV9yZXZCMl8yOS42My4xLndtZncKKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3Br
LXByb3QtMTA0MzFjOWYtc3BraWQwLWwwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNw
MS1zcGstY2FsaS0xMDQzMWM5Zi1zcGtpZDAtbDAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0
MS1kc3AxLXNway1wcm90LTEwNDMxYzlmLXNwa2lkMC1yMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9j
czM1bDQxLWRzcDEtc3BrLWNhbGktMTA0MzFjOWYtc3BraWQwLXIwLmJpbgorIyArRmlsZTogY2ly
cnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMWM5Zi1zcGtpZDEtbDAuYmluCisjICtGaWxl
OiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwNDMxYzlmLXNwa2lkMS1sMC5iaW4KKyMg
K0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzFjOWYtc3BraWQxLXIwLmJp
bgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDQzMWM5Zi1zcGtpZDEt
cjAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMxY2FmLXNw
a2lkMC1sMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTA0MzFj
YWYtc3BraWQwLWwwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0x
MDQzMWNhZi1zcGtpZDAtcjAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1j
YWxpLTEwNDMxY2FmLXNwa2lkMC1yMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEt
c3BrLXByb3QtMTA0MzFjYWYtc3BraWQxLWwwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEt
ZHNwMS1zcGstY2FsaS0xMDQzMWNhZi1zcGtpZDEtbDAuYmluCisjICtGaWxlOiBjaXJydXMvY3Mz
NWw0MS1kc3AxLXNway1wcm90LTEwNDMxY2FmLXNwa2lkMS1yMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1
cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTA0MzFjYWYtc3BraWQxLXIwLmJpbgorIyArRmlsZTog
Y2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMTUwMy1zcGtpZDAtbDAuYmluCisjICtG
aWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwNDMxNTAzLXNwa2lkMC1sMC5iaW4K
KyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzE1MDMtc3BraWQwLXIw
LmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDQzMTUwMy1zcGtp
ZDAtcjAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMxNTAz
LXNwa2lkMS1sMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTA0
MzE1MDMtc3BraWQxLWwwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJv
dC0xMDQzMTUwMy1zcGtpZDEtcjAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNw
ay1jYWxpLTEwNDMxNTAzLXNwa2lkMS1yMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRz
cDEtc3BrLXByb3QtMTA0MzFjY2Ytc3BraWQwLWwwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVs
NDEtZHNwMS1zcGstY2FsaS0xMDQzMWNjZi1zcGtpZDAtbDAuYmluCisjICtGaWxlOiBjaXJydXMv
Y3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMxY2NmLXNwa2lkMC1yMC5iaW4KKyMgK0ZpbGU6IGNp
cnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTA0MzFjY2Ytc3BraWQwLXIwLmJpbgorIyArRmls
ZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMWNjZi1zcGtpZDEtbDAuYmluCisj
ICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwNDMxY2NmLXNwa2lkMS1sMC5i
aW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzFjY2Ytc3BraWQx
LXIwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDQzMWNjZi1z
cGtpZDEtcjAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMx
Y2VmLXNwa2lkMC1sMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGkt
MTA0MzFjZWYtc3BraWQwLWwwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGst
cHJvdC0xMDQzMWNlZi1zcGtpZDAtcjAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3Ax
LXNway1jYWxpLTEwNDMxY2VmLXNwa2lkMC1yMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQx
LWRzcDEtc3BrLXByb3QtMTA0MzFjZWYtc3BraWQxLWwwLmJpbgorIyArRmlsZTogY2lycnVzL2Nz
MzVsNDEtZHNwMS1zcGstY2FsaS0xMDQzMWNlZi1zcGtpZDEtbDAuYmluCisjICtGaWxlOiBjaXJy
dXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMxY2VmLXNwa2lkMS1yMC5iaW4KKyMgK0ZpbGU6
IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTA0MzFjZWYtc3BraWQxLXIwLmJpbgorIyAr
RmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMTQ2My1zcGtpZDAtbDAuYmlu
CisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwNDMxNDYzLXNwa2lkMC1s
MC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzE0NjMtc3Br
aWQwLXIwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDQzMTQ2
My1zcGtpZDAtcjAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEw
NDMxNDYzLXNwa2lkMS1sMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNh
bGktMTA0MzE0NjMtc3BraWQxLWwwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1z
cGstcHJvdC0xMDQzMTQ2My1zcGtpZDEtcjAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1k
c3AxLXNway1jYWxpLTEwNDMxNDYzLXNwa2lkMS1yMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1
bDQxLWRzcDEtc3BrLXByb3QtMTA0MzE0ODMtbDAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0
MS1kc3AxLXNway1jYWxpLTEwNDMxNDgzLWwwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEt
ZHNwMS1zcGstcHJvdC0xMDQzMTQ4My1yMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRz
cDEtc3BrLWNhbGktMTA0MzE0ODMtcjAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3Ax
LXNway1wcm90LTEwNDMxNDczLWwwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1z
cGstY2FsaS0xMDQzMTQ3My1sMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3Br
LXByb3QtMTA0MzE0NzMtcjAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1j
YWxpLTEwNDMxNDczLXIwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJv
dC0xMDQzMTUzMy1zcGtpZDAtbDAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNw
ay1jYWxpLTEwNDMxNTMzLXNwa2lkMC1sMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRz
cDEtc3BrLXByb3QtMTA0MzE1MzMtc3BraWQwLXIwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVs
NDEtZHNwMS1zcGstY2FsaS0xMDQzMTUzMy1zcGtpZDAtcjAuYmluCisjICtGaWxlOiBjaXJydXMv
Y3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMxNTMzLXNwa2lkMS1sMC5iaW4KKyMgK0ZpbGU6IGNp
cnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTA0MzE1MzMtc3BraWQxLWwwLmJpbgorIyArRmls
ZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMTUzMy1zcGtpZDEtcjAuYmluCisj
ICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwNDMxNTMzLXNwa2lkMS1yMC5i
aW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzE0MzMtc3BraWQw
LWwwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDQzMTQzMy1z
cGtpZDAtbDAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMx
NDMzLXNwa2lkMC1yMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGkt
MTA0MzE0MzMtc3BraWQwLXIwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGst
cHJvdC0xMDQzMTQzMy1zcGtpZDEtbDAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3Ax
LXNway1jYWxpLTEwNDMxNDMzLXNwa2lkMS1sMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQx
LWRzcDEtc3BrLXByb3QtMTA0MzE0MzMtc3BraWQxLXIwLmJpbgorIyArRmlsZTogY2lycnVzL2Nz
MzVsNDEtZHNwMS1zcGstY2FsaS0xMDQzMTQzMy1zcGtpZDEtcjAuYmluCisjICtGaWxlOiBjaXJy
dXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMxNTczLXNwa2lkMC1sMC5iaW4KKyMgK0ZpbGU6
IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTA0MzE1NzMtc3BraWQwLWwwLmJpbgorIyAr
RmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMTU3My1zcGtpZDAtcjAuYmlu
CisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwNDMxNTczLXNwa2lkMC1y
MC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzE1NzMtc3Br
aWQxLWwwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDQzMTU3
My1zcGtpZDEtbDAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEw
NDMxNTczLXNwa2lkMS1yMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNh
bGktMTA0MzE1NzMtc3BraWQxLXIwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1z
cGstcHJvdC0xMDQzMTdmMy1zcGtpZDAtbDAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1k
c3AxLXNway1jYWxpLTEwNDMxN2YzLXNwa2lkMC1sMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1
bDQxLWRzcDEtc3BrLXByb3QtMTA0MzE3ZjMtc3BraWQwLXIwLmJpbgorIyArRmlsZTogY2lycnVz
L2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDQzMTdmMy1zcGtpZDAtcjAuYmluCisjICtGaWxlOiBj
aXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMxN2YzLXNwa2lkMS1sMC5iaW4KKyMgK0Zp
bGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTA0MzE3ZjMtc3BraWQxLWwwLmJpbgor
IyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMTdmMy1zcGtpZDEtcjAu
YmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwNDMxN2YzLXNwa2lk
MS1yMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzE0OTMt
c3BraWQwLWwwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDQz
MTQ5My1zcGtpZDAtbDAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90
LTEwNDMxNDkzLXNwa2lkMC1yMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3Br
LWNhbGktMTA0MzE0OTMtc3BraWQwLXIwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNw
MS1zcGstcHJvdC0xMDQzMTQ5My1zcGtpZDEtbDAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0
MS1kc3AxLXNway1jYWxpLTEwNDMxNDkzLXNwa2lkMS1sMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9j
czM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzE0OTMtc3BraWQxLXIwLmJpbgorIyArRmlsZTogY2ly
cnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDQzMTQ5My1zcGtpZDEtcjAuYmluCisjICtMaW5r
OiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMxNjYzLWwwLmJpbiAtPiBjczM1bDQx
LWRzcDEtc3BrLXByb3QtMTA0MzE0ODMtbDAuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1k
c3AxLXNway1jYWxpLTEwNDMxNjYzLWwwLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLWNhbGktMTA0
MzE0ODMtbDAuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMx
NjYzLXIwLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzE0ODMtcjAuYmluCisjICtM
aW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwNDMxNjYzLXIwLmJpbiAtPiBjczM1
bDQxLWRzcDEtc3BrLWNhbGktMTA0MzE0ODMtcjAuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0
MS1kc3AxLXNway1wcm90LTEwNDMxNGQzLXNwa2lkMC1sMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNw
ay1wcm90LTEwNDMxYzlmLXNwa2lkMC1sMC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRz
cDEtc3BrLWNhbGktMTA0MzE0ZDMtc3BraWQwLWwwLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLWNh
bGktMTA0MzFjOWYtc3BraWQwLWwwLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1z
cGstcHJvdC0xMDQzMTRkMy1zcGtpZDAtcjAuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstcHJvdC0x
MDQzMWM5Zi1zcGtpZDAtcjAuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1j
YWxpLTEwNDMxNGQzLXNwa2lkMC1yMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwNDMx
YzlmLXNwa2lkMC1yMC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3Qt
MTA0MzE0ZDMtc3BraWQxLWwwLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzFjOWYt
c3BraWQxLWwwLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDQz
MTRkMy1zcGtpZDEtbDAuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDQzMWM5Zi1zcGtp
ZDEtbDAuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMxNGQz
LXNwa2lkMS1yMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMxYzlmLXNwa2lkMS1y
MC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTA0MzE0ZDMtc3Br
aWQxLXIwLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLWNhbGktMTA0MzFjOWYtc3BraWQxLXIwLmJp
bgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMWNkZi1zcGtpZDAt
bDAuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMWNjZi1zcGtpZDAtbDAuYmluCisj
ICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwNDMxY2RmLXNwa2lkMC1sMC5i
aW4gLT4gY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwNDMxY2NmLXNwa2lkMC1sMC5iaW4KKyMgK0xp
bms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzFjZGYtc3BraWQwLXIwLmJpbiAt
PiBjczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzFjY2Ytc3BraWQwLXIwLmJpbgorIyArTGluazog
Y2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDQzMWNkZi1zcGtpZDAtcjAuYmluIC0+IGNz
MzVsNDEtZHNwMS1zcGstY2FsaS0xMDQzMWNjZi1zcGtpZDAtcjAuYmluCisjICtMaW5rOiBjaXJy
dXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMxY2RmLXNwa2lkMS1sMC5iaW4gLT4gY3MzNWw0
MS1kc3AxLXNway1wcm90LTEwNDMxY2NmLXNwa2lkMS1sMC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9j
czM1bDQxLWRzcDEtc3BrLWNhbGktMTA0MzFjZGYtc3BraWQxLWwwLmJpbiAtPiBjczM1bDQxLWRz
cDEtc3BrLWNhbGktMTA0MzFjY2Ytc3BraWQxLWwwLmJpbgorIyArTGluazogY2lycnVzL2NzMzVs
NDEtZHNwMS1zcGstcHJvdC0xMDQzMWNkZi1zcGtpZDEtcjAuYmluIC0+IGNzMzVsNDEtZHNwMS1z
cGstcHJvdC0xMDQzMWNjZi1zcGtpZDEtcjAuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1k
c3AxLXNway1jYWxpLTEwNDMxY2RmLXNwa2lkMS1yMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1j
YWxpLTEwNDMxY2NmLXNwa2lkMS1yMC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEt
c3BrLXByb3QtMTA0MzE0ZTMtc3BraWQwLWwwLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLXByb3Qt
MTA0MzE1MDMtc3BraWQwLWwwLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGst
Y2FsaS0xMDQzMTRlMy1zcGtpZDAtbDAuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDQz
MTUwMy1zcGtpZDAtbDAuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90
LTEwNDMxNGUzLXNwa2lkMC1yMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMxNTAz
LXNwa2lkMC1yMC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTA0
MzE0ZTMtc3BraWQwLXIwLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLWNhbGktMTA0MzE1MDMtc3Br
aWQwLXIwLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMTRl
My1zcGtpZDEtbDAuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMTUwMy1zcGtpZDEt
bDAuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwNDMxNGUzLXNw
a2lkMS1sMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwNDMxNTAzLXNwa2lkMS1sMC5i
aW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzE0ZTMtc3BraWQx
LXIwLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzE1MDMtc3BraWQxLXIwLmJpbgor
IyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDQzMTRlMy1zcGtpZDEtcjAu
YmluIC0+IGNzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDQzMTUwMy1zcGtpZDEtcjAuYmluCisjICtM
aW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMxZDFmLXNwa2lkMC1sMC5iaW4g
LT4gY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMxNTAzLXNwa2lkMC1sMC5iaW4KKyMgK0xpbms6
IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTA0MzFkMWYtc3BraWQwLWwwLmJpbiAtPiBj
czM1bDQxLWRzcDEtc3BrLWNhbGktMTA0MzE1MDMtc3BraWQwLWwwLmJpbgorIyArTGluazogY2ly
cnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMWQxZi1zcGtpZDAtcjAuYmluIC0+IGNzMzVs
NDEtZHNwMS1zcGstcHJvdC0xMDQzMTUwMy1zcGtpZDAtcjAuYmluCisjICtMaW5rOiBjaXJydXMv
Y3MzNWw0MS1kc3AxLXNway1jYWxpLTEwNDMxZDFmLXNwa2lkMC1yMC5iaW4gLT4gY3MzNWw0MS1k
c3AxLXNway1jYWxpLTEwNDMxNTAzLXNwa2lkMC1yMC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1
bDQxLWRzcDEtc3BrLXByb3QtMTA0MzFkMWYtc3BraWQxLWwwLmJpbiAtPiBjczM1bDQxLWRzcDEt
c3BrLXByb3QtMTA0MzE1MDMtc3BraWQxLWwwLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEt
ZHNwMS1zcGstY2FsaS0xMDQzMWQxZi1zcGtpZDEtbDAuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGst
Y2FsaS0xMDQzMTUwMy1zcGtpZDEtbDAuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3Ax
LXNway1wcm90LTEwNDMxZDFmLXNwa2lkMS1yMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1wcm90
LTEwNDMxNTAzLXNwa2lkMS1yMC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3Br
LWNhbGktMTA0MzFkMWYtc3BraWQxLXIwLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLWNhbGktMTA0
MzE1MDMtc3BraWQxLXIwLmJpbgorIyAgTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJv
dC0xMDQzMWI5My53bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5
LjYzLjEud21mdworIyAgTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDQzMWI5
My53bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjYzLjEud21m
dworIyAgTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMWEyMC53bWZ3IC0+
IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjYzLjEud21mdworIyBAQCAt
NjI2OSw2ICs2NDY1LDQ4IEBACisjICBGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxp
LTEwM2M4YjkyLmJpbgorIyAgTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNj
OGMyNi5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4YjQ1LmJpbgorIyAgTGluazog
Y2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDNjOGMyNi5iaW4gLT4gY3MzNWw0MS1kc3Ax
LXNway1jYWxpLTEwM2M4YjQ1LmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGst
cHJvdC0xMDI4MGNiZC53bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFNX3JldkIy
XzI5LjYzLjEud21mdworIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDI4
MGNiZC53bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjYzLjEu
d21mdworIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDI4MGNiZS53bWZ3
IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjYzLjEud21mdworIyAr
TGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDI4MGNiZS53bWZ3IC0+IGNzMzVs
NDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjYzLjEud21mdworIyArTGluazogY2ly
cnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDI4MGNiZi53bWZ3IC0+IGNzMzVsNDEvdjYuNjEu
MS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjYzLjEud21mdworIyArTGluazogY2lycnVzL2NzMzVs
NDEtZHNwMS1zcGstY2FsaS0xMDI4MGNiZi53bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2Nz
cGxfUkFNX3JldkIyXzI5LjYzLjEud21mdworIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1z
cGstcHJvdC0xMDI4MGNjMS53bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFNX3Jl
dkIyXzI5LjYzLjEud21mdworIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0x
MDI4MGNjMS53bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjYz
LjEud21mdworIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDI4MGNjMi53
bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjYzLjEud21mdwor
IyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDI4MGNjMi53bWZ3IC0+IGNz
MzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjYzLjEud21mdworIyArTGluazog
Y2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDI4MGNjMy53bWZ3IC0+IGNzMzVsNDEvdjYu
NjEuMS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjYzLjEud21mdworIyArTGluazogY2lycnVzL2Nz
MzVsNDEtZHNwMS1zcGstY2FsaS0xMDI4MGNjMy53bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxv
X2NzcGxfUkFNX3JldkIyXzI5LjYzLjEud21mdworIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNw
MS1zcGstcHJvdC0xMDI4MGNjNC53bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFN
X3JldkIyXzI5LjYzLjEud21mdworIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2Fs
aS0xMDI4MGNjNC53bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5
LjYzLjEud21mdworIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDI4MGNi
ZC1zcGtpZDAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwMjgw
Y2JkLXNwa2lkMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTAy
ODBjYmQtc3BraWQxLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0x
MDI4MGNiZC1zcGtpZDEuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90
LTEwMjgwY2JlLXNwa2lkMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1wcm90LTEwMjgwY2JkLXNw
a2lkMC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTAyODBjYmUt
c3BraWQwLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLWNhbGktMTAyODBjYmQtc3BraWQwLmJpbgor
IyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDI4MGNiZS1zcGtpZDEuYmlu
IC0+IGNzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDI4MGNiZC1zcGtpZDEuYmluCisjICtMaW5rOiBj
aXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwMjgwY2JlLXNwa2lkMS5iaW4gLT4gY3MzNWw0
MS1kc3AxLXNway1jYWxpLTEwMjgwY2JkLXNwa2lkMS5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1
bDQxLWRzcDEtc3BrLXByb3QtMTAyODBjYmYtc3BraWQwLmJpbiAtPiBjczM1bDQxLWRzcDEtc3Br
LXByb3QtMTAyODBjYmQtc3BraWQwLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1z
cGstY2FsaS0xMDI4MGNiZi1zcGtpZDAuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDI4
MGNiZC1zcGtpZDAuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEw
MjgwY2JmLXNwa2lkMS5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1wcm90LTEwMjgwY2JkLXNwa2lk
MS5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTAyODBjYmYtc3Br
aWQxLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLWNhbGktMTAyODBjYmQtc3BraWQxLmJpbgorIyAr
TGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDI4MGNjMS1zcGtpZDAuYmluIC0+
IGNzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDI4MGNiZC1zcGtpZDAuYmluCisjICtMaW5rOiBjaXJy
dXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwMjgwY2MxLXNwa2lkMC5iaW4gLT4gY3MzNWw0MS1k
c3AxLXNway1jYWxpLTEwMjgwY2JkLXNwa2lkMC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQx
LWRzcDEtc3BrLXByb3QtMTAyODBjYzEtc3BraWQxLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLXBy
b3QtMTAyODBjYmQtc3BraWQxLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGst
Y2FsaS0xMDI4MGNjMS1zcGtpZDEuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDI4MGNi
ZC1zcGtpZDEuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwMjgw
Y2MyLXNwa2lkMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1wcm90LTEwMjgwY2JkLXNwa2lkMC5i
aW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTAyODBjYzItc3BraWQw
LmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLWNhbGktMTAyODBjYmQtc3BraWQwLmJpbgorIyArTGlu
azogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDI4MGNjMi1zcGtpZDEuYmluIC0+IGNz
MzVsNDEtZHNwMS1zcGstcHJvdC0xMDI4MGNiZC1zcGtpZDEuYmluCisjICtMaW5rOiBjaXJydXMv
Y3MzNWw0MS1kc3AxLXNway1jYWxpLTEwMjgwY2MyLXNwa2lkMS5iaW4gLT4gY3MzNWw0MS1kc3Ax
LXNway1jYWxpLTEwMjgwY2JkLXNwa2lkMS5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRz
cDEtc3BrLXByb3QtMTAyODBjYzMtc3BraWQwLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLXByb3Qt
MTAyODBjYmQtc3BraWQwLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2Fs
aS0xMDI4MGNjMy1zcGtpZDAuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDI4MGNiZC1z
cGtpZDAuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwMjgwY2Mz
LXNwa2lkMS5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1wcm90LTEwMjgwY2JkLXNwa2lkMS5iaW4K
KyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTAyODBjYzMtc3BraWQxLmJp
biAtPiBjczM1bDQxLWRzcDEtc3BrLWNhbGktMTAyODBjYmQtc3BraWQxLmJpbgorIyArTGluazog
Y2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDI4MGNjNC1zcGtpZDAuYmluIC0+IGNzMzVs
NDEtZHNwMS1zcGstcHJvdC0xMDI4MGNiZC1zcGtpZDAuYmluCisjICtMaW5rOiBjaXJydXMvY3Mz
NWw0MS1kc3AxLXNway1jYWxpLTEwMjgwY2M0LXNwa2lkMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNw
ay1jYWxpLTEwMjgwY2JkLXNwa2lkMC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEt
c3BrLXByb3QtMTAyODBjYzQtc3BraWQxLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLXByb3QtMTAy
ODBjYmQtc3BraWQxLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0x
MDI4MGNjNC1zcGtpZDEuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDI4MGNiZC1zcGtp
ZDEuYmluCisjICAKKyMgIExpY2Vuc2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UuY2ly
cnVzIGZvciBkZXRhaWxzLgorIyAgCisjIEBAIC02Mjk5LDcgKzY1MzcsNyBAQAorIyAgCisjICBE
cml2ZXI6IG54cC1zcjF4eCAtIE5YUCBVbHRyYSBXaWRlIEJhbmQgZHJpdmVyCisjICBGaWxlOiBu
eHAvc3IxNTBfZncuYmluCisjIC1WZXJzaW9uOiAzNS4wMC4wMworIyArVmVyc2lvbjogNDQuMDAu
MDIKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5ueHAgZm9y
IGRldGFpbHMKKyMgIE9yaWdpbmF0ZXMgZnJvbSBodHRwczovL2dpdGh1Yi5jb20vTlhQL3V3Yi1O
WFBVV0ItRlcuZ2l0CisjIEBAIC02MzIzLDQgKzY1NjEsMTQgQEAKKyMgIAorIyAgTGljZW5jZTog
UmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5ueHAgZm9yIGRldGFpbHMKKyMgIAorIyAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KKyMgK09yaWdpbmF0ZXMgZnJvbSBodHRwczovL2dpdGh1Yi5jb20vbnhw
LWlteC9pbXgtZmlybXdhcmUvdHJlZS9sZi02LjEuMjJfMi4wLjAvbnhwCisjICsKKyMgKy0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCisjICsKKyMgK0RyaXZlcjogcWNvbS1zYzgyODB4cCAtIFF1YWxjb21tIEFT
b0MgdHBsZyBGaXJtd2FyZQorIyArRmlsZTogcWNvbS9zYzgyODB4cC9MRU5PVk8vMjFCWC9hdWRp
b3JlYWNoLXRwbGcuYmluCisjICtWZXJzaW9uOiB2MC4xLjAKKyMgKworIyArTGljZW5jZTogUmVk
aXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5saW5hcm8gZm9yIGRldGFpbHMKKyMgK09yaWdpbmF0
ZXMgZnJvbSBodHRwczovL2dpdC5saW5hcm8ub3JnL3Blb3BsZS9zcmluaXZhcy5rYW5kYWdhdGxh
L2F1ZGlvcmVhY2gtdG9wb2xvZ3kuZ2l0CisjICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAKKyMKKwog
U1VNTUFSWSA9ICJGaXJtd2FyZSBmaWxlcyBmb3IgdXNlIHdpdGggTGludXgga2VybmVsIgogSE9N
RVBBR0UgPSAiaHR0cHM6Ly93d3cua2VybmVsLm9yZy8iCiBERVNDUklQVElPTiA9ICJMaW51eCBm
aXJtd2FyZSBpcyBhIHBhY2thZ2UgZGlzdHJpYnV0ZWQgYWxvbmdzaWRlIHRoZSBMaW51eCBrZXJu
ZWwgXApAQCAtMTMwLDcgKzcyOCw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VO
Q0UuQWJpbGlzO21kNT1iNWVlM2Y0MTA3ODBlNTY3MTFhZDQ4ZWFkYzIyYjhiYyBcCiAgICAgICAg
ICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTkNFLnhjNDAwMDttZDU9MGZmNTFkMmRjNDlmY2UwNDgx
NGM5MTU1MDgxMDkyZjAgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5DRS54YzUw
MDA7bWQ1PTFlMTcwYzEzMTc1MzIzYzMyYzdmNGQwOTk4ZDUzZjY2IFwKICAgICAgICAgICAgICAg
ICAgICAgZmlsZTovL0xJQ0VOQ0UueGM1MDAwYzttZDU9MTJiMDJlZmEzMDQ5ZGI2NWQ1MjRhZWI0
MThkZDg3Y2EgXAotICAgICAgICAgICAgICAgICAgICBmaWxlOi8vV0hFTkNFO21kNT0ke1dIRU5D
RV9DSEtTVU19IFwKKyAgICAgICAgICAgICAgICAgICAgZmlsZTovL1dIRU5DRTttZDU9NDFmOWE0
OGJmMjc5NzFiMTI2YTM2ZjkzNDQ1OTRkY2QgXAogICAgICAgICAgICAgICAgICAgICAiCiAjIFdI
RU5DRSBjaGVja3N1bSBpcyBkZWZpbmVkIHNlcGFyYXRlbHkgdG8gZWFzZSBvdmVycmlkaW5nIGl0
IGlmCiAjIGNsYXNzLWRldnVwc3RyZWFtIGlzIHNlbGVjdGVkLgpAQCAtMjEyLDcgKzgxMCw3IEBA
IFNSQ19VUkk6Y2xhc3MtZGV2dXBzdHJlYW0gPSAiZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L2Zpcm13CiAjIFBpbiB0aGlzIHRvIHRoZSAyMDIyMDUwOSByZWxl
YXNlLCBvdmVycmlkZSB0aGlzIGluIGxvY2FsLmNvbmYKIFNSQ1JFVjpjbGFzcy1kZXZ1cHN0cmVh
bSA/PSAiYjE5Y2JkY2E3OGFiMmFkZmQyMTBjOTFiZTE1YTIyNTY4ZThiOGNhZSIKIAotU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjg3NTk3MTExYzBkNGI3MWIzMWU1M2NiODVhOTJjMzg2OTIxYjg0Yzgy
NWE0MDJkYjhjODJlMGU4NjAxNTUwMGQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiODhkNDZjNTQz
ODQ3ZWUzYjAzNDA0ZDQ5NDFkOTFjOTI5NzQ2OTBlZTFmNmZkY2JlZTljZWYzZTVmOTdkYjY4OCIK
IAogaW5oZXJpdCBhbGxhcmNoCiAKLS0gCjIuMzkuMgoK

--===============6328078789949903438==--

