Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 841F0C4167B
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:11 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.8487.1698848704281599911
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=K63S308c;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=gkR1m7jW;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.33, mailfrom: 0101018b8b460dc0-0db8c16f-0fd0-4181-9593-909559bad09b-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848706;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rN0Mekf1DpSe8q+Anoi4B9uWmvKSEnboCriW94VS1gU=;
	b=K63S308cW1hIQ0FaX1XSDyhr211dY84VsQ5F/tvLGzZlW8IyLhVy8UbsiY8tXMy1
	v/OycPvJ4SSNpWZ3Rzdz0H2ZtFuO2IsFWRZx1Dhter/U+tUG8W/qledBaB0bbYLqkcT
	gLxW2tQS+gZ4RlVwMgiGA+9v9LQ4HGqJRUhNsMQI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848706;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rN0Mekf1DpSe8q+Anoi4B9uWmvKSEnboCriW94VS1gU=;
	b=gkR1m7jW+zmetN/L/QGDApOJqStP2ph+ahqx1Dxe6Y/RwzHFF7DIqPtdGsFj/NdZ
	bdE00LGvHXb4Bd2DqA1y0CrZBdGhzAApX4tWciB6OFOtDIsTCoUZeL4HrsuZmC3pLVa
	XJd6+QAeQG9q7rpxP8RkZm8kf/9FwjBBFpMLASXY=
Content-Type: multipart/mixed; boundary="===============7897568117522403864=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] linux-firmware: upgrading to 20231030 SUCCEEDED
Message-ID: <0101018b8b460dc0-0db8c16f-0fd0-4181-9593-909559bad09b-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:05 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190037

--===============7897568117522403864==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *linux-firmware* to *20231030* has Succeeded.

Next steps:
    - apply the patch: git am 0001-linux-firmware-upgrade-20230804-20231030.patch
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
From b1f0cadf960a3fa1a88960ab5d0a2d81142b66ac Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 13:40:58 +0000
Subject: [PATCH] linux-firmware: upgrade 20230804 -> 20231030

---
 ...20230804.bb => linux-firmware_20231030.bb} | 611 +++++++++++++++++-
 1 file changed, 609 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20230804.bb => linux-firmware_20231030.bb} (75%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
similarity index 75%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
index 0e8005bfc9..356fbb0fb9 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
@@ -1,3 +1,610 @@
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
+# @@ -726,10 +726,10 @@
+#  Version: W16.68.1.p179
+#  
+#  File: mrvl/pcieusb8997_combo_v4.bin
+# -Version: W16.68.1.p195
+# +Version: W16.68.10.p159.1
+#  
+#  File: mrvl/pcie8997_wlan_v4.bin
+# -Version: W16.68.1.p195
+# +Version: W16.68.10.p159.1
+#  
+#  File: mrvl/usbusb8997_combo_v4.bin
+#  Version: W16.68.1.p183
+# @@ -1017,22 +1017,22 @@
+#  Version: 74.a5e9588b.0
+#  
+#  File: iwlwifi-cc-a0-77.ucode
+# -Version: 74.2df8986f.0
+# +Version: 74.bd067429.0
+#  
+#  File: iwlwifi-Qu-b0-hr-b0-77.ucode
+# -Version: 74.2df8986f.0
+# +Version: 74.bd067429.0
+#  
+#  File: iwlwifi-Qu-b0-jf-b0-77.ucode
+# -Version: 74.2df8986f.0
+# +Version: 74.bd067429.0
+#  
+#  File: iwlwifi-Qu-c0-hr-b0-77.ucode
+# -Version: 74.2df8986f.0
+# +Version: 74.bd067429.0
+#  
+#  File: iwlwifi-Qu-c0-jf-b0-77.ucode
+# -Version: 74.2df8986f.0
+# +Version: 74.bd067429.0
+#  
+#  File: iwlwifi-QuZ-a0-hr-b0-77.ucode
+# -Version: 74.2df8986f.0
+# +Version: 74.bd06742.0
+#  
+#  File: iwlwifi-QuZ-a0-jf-b0-77.ucode
+#  Version: 74.206b0184.0
+# @@ -1052,6 +1052,9 @@
+#  File: iwlwifi-ty-a0-gf-a0-83.ucode
+#  Version: 80.e8f84e98.0
+#  
+# +File: iwlwifi-ty-a0-gf-a0-84.ucode
+# +Version: 81.8e5c544c.0
+# +
+#  File: iwlwifi-so-a0-gf4-a0-77.ucode
+#  Version: 74.f92b5fed.0
+#  
+# @@ -1067,6 +1070,9 @@
+#  File: iwlwifi-so-a0-gf4-a0-83.ucode
+#  Version: 80.e8f84e98.0
+#  
+# +File: iwlwifi-so-a0-gf4-a0-84.ucode
+# +Version: 81.8e5c544c.0
+# +
+#  File: iwlwifi-so-a0-gf-a0-77.ucode
+#  Version: 74.f92b5fed.0
+#  
+# @@ -1082,6 +1088,9 @@
+#  File: iwlwifi-so-a0-gf-a0-83.ucode
+#  Version: 80.e8f84e98.0
+#  
+# +File: iwlwifi-so-a0-gf-a0-84.ucode
+# +Version: 81.8e5c544c.0
+# +
+#  File: iwlwifi-so-a0-hr-b0-77.ucode
+#  Version: 74.f92b5fed.0
+#  
+# @@ -1091,10 +1100,34 @@
+#  File: iwlwifi-so-a0-hr-b0-81.ucode
+#  Version: 78.31fc9ae6.0
+#  
+# +File: iwlwifi-so-a0-hr-b0-83.ucode
+# +Version: 80.e8f84e98.0
+# +
+# +File: iwlwifi-so-a0-hr-b0-84.ucode
+# +Version: 81.8e5c544c.0
+# +
+#  File: iwlwifi-so-a0-jf-b0-77.ucode
+#  Version: 74.f92b5fed.0
+#  
+#  File: iwlwifi-ty-a0-gf-a0.pnvm
+# +
+# +File: iwlwifi-gl-c0-fm-c0-83.ucode
+# +Version: 80.d24e06ed.0
+# +
+# +File: iwlwifi-gl-c0-fm-c0.pnvm
+# +
+# +File: iwlwifi-ma-b0-gf-a0-83.ucode
+# +Version: 80.d24e06ed.0
+# +
+# +File: iwlwifi-ma-b0-gf-a0.pnvm
+# +
+# +File: iwlwifi-ma-b0-gf4-a0-83.ucode
+# +Version: 80.d24e06ed.0
+# +
+# +File: iwlwifi-ma-b0-gf4-a0.pnvm
+# +
+# +File: iwlwifi-ma-b0-hr-b0-83.ucode
+# +Version: 80.d24e06ed.0
+#  
+#  Licence: Redistributable. See LICENCE.iwlwifi_firmware for details
+#  
+# @@ -2445,6 +2478,17 @@
+#  
+#  --------------------------------------------------------------------------
+#  
+# +--------------------------------------------------------------------------
+# +
+# +Driver: amd_pmf - AMD Platform Management Framework TA
+# +
+# +File: amdtee/773bd96f-b83f-4d52-b12dc529b13d8543.bin
+# +Link: amdtee/amd_pmf_v3.bin -> 773bd96f-b83f-4d52-b12dc529b13d8543.bin
+# +
+# +Licence: Redistributable. See LICENSE.amd_pmf for details.
+# +
+# +--------------------------------------------------------------------------
+# +
+#  Driver: s2255drv
+#  
+#  File: f2255usb.bin
+# @@ -2716,6 +2760,7 @@
+#  Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m2-zero.txt -> brcmfmac43430-sdio.AP6212.txt
+#  Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m2-ultra.txt -> brcmfmac43430-sdio.AP6212.txt
+#  Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m3.txt -> brcmfmac43430-sdio.AP6212.txt
+# +Link: brcm/brcmfmac43430-sdio.sinovoip,bananapi-m64.txt -> brcmfmac43430-sdio.AP6212.txt
+#  Link: brcm/brcmfmac43430-sdio.friendlyarm,nanopi-r1.txt -> brcmfmac43430-sdio.AP6212.txt
+#  Link: brcm/brcmfmac43430-sdio.starfive,visionfive-v1.txt -> brcmfmac43430-sdio.AP6212.txt
+#  Link: brcm/brcmfmac43430-sdio.beagle,beaglev-starlight-jh7100-a1.txt -> brcmfmac43430-sdio.AP6212.txt
+# @@ -3395,10 +3440,10 @@
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
+# @@ -3665,13 +3710,13 @@
+#  File: intel/ibt-12-16.sfi
+#  Version: BT_WindStormPeak_REL1299
+#  File: intel/ibt-17-16-1.sfi
+# -Version: BT_JeffersonPeak_B0_B0_REL20332
+# +Version: BT_JeffersonPeak_B0_B0_REL20379
+#  File: intel/ibt-17-16-1.ddc
+# -Version: BT_JeffersonPeak_B0_B0_REL20332
+# +Version: BT_JeffersonPeak_B0_B0_REL20379
+#  File: intel/ibt-17-2.sfi
+# -Version: BT_JeffersonPeak_B0_B0_REL20332
+# +Version: BT_JeffersonPeak_B0_B0_REL20379
+#  File: intel/ibt-17-2.ddc
+# -Version: BT_JeffersonPeak_B0_B0_REL20332
+# +Version: BT_JeffersonPeak_B0_B0_REL20379
+#  File: intel/ibt-17-0-1.sfi
+#  Version: BT_JeffersonPeak_A0_B0_REL0201
+#  File: intel/ibt-17-0-1.ddc
+# @@ -3681,13 +3726,13 @@
+#  File: intel/ibt-17-1.ddc
+#  Version: BT_JeffersonPeak_A0_B0_REL0201
+#  File: intel/ibt-18-16-1.sfi
+# -Version: BT_ThunderPeak_B0_B0_REL20182
+# +Version: BT_ThunderPeak_B0_B0_REL20379
+#  File: intel/ibt-18-16-1.ddc
+# -Version: BT_ThunderPeak_B0_B0_REL20182
+# +Version: BT_ThunderPeak_B0_B0_REL20379
+#  File: intel/ibt-18-2.sfi
+# -Version: BT_ThunderPeak_B0_B0_REL20182
+# +Version: BT_ThunderPeak_B0_B0_REL20379
+#  File: intel/ibt-18-2.ddc
+# -Version: BT_ThunderPeak_B0_B0_REL20182
+# +Version: BT_ThunderPeak_B0_B0_REL20379
+#  File: intel/ibt-18-0-1.sfi
+#  Version: BT_ThunderPeak_A0_B0_REL0201
+#  File: intel/ibt-18-0-1.ddc
+# @@ -3697,69 +3742,69 @@
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
+# +Version: BT_TyphoonPeak_REL66410
+#  File:intel/ibt-0041-0041.ddc
+# -Version: BT_TyphoonPeak_REL67068
+# +Version: BT_TyphoonPeak_REL66410
+#  File:intel/ibt-0040-0041.sfi
+# -Version: BT_Solar_GfP2_REL67068
+# +Version: BT_Solar_GfP2_REL66410
+#  File:intel/ibt-0040-0041.ddc
+# -Version: BT_Solar_GfP2_REL67068
+# +Version: BT_Solar_GfP2_REL66410
+#  File:intel/ibt-1040-0041.sfi
+# -Version: BT_SolarF_GfP2_REL67068
+# +Version: BT_SolarF_GfP2_REL66410
+#  File:intel/ibt-1040-0041.ddc
+# -Version: BT_SolarF_GfP2_REL67068
+# +Version: BT_SolarF_GfP2_REL66410
+#  
+#  File:intel/ibt-0040-1020.sfi
+#  Version: BT_Solar_JfP1_REL59564
+# @@ -3780,13 +3825,33 @@
+#  Version: BT_SolarF_JfP2_REL59564
+#  
+#  File:intel/ibt-0040-4150.sfi
+# -Version: BT_Solar_JnP2_REL67068
+# +Version: BT_Solar_JnP2_REL66410
+#  File:intel/ibt-0040-4150.ddc
+# -Version: BT_Solar_JnP2_REL67068
+# +Version: BT_Solar_JnP2_REL66410
+#  File:intel/ibt-1040-4150.sfi
+# -Version: BT_SolarF_JnP2_REL67068
+# +Version: BT_SolarF_JnP2_REL66410
+#  File:intel/ibt-1040-4150.ddc
+# -Version: BT_SolarF_JnP2_REL67068
+# +Version: BT_SolarF_JnP2_REL66410
+# +
+# +File:intel/ibt-0291-0291.sfi
+# +Version: BT_GalePeak_REL39025
+# +File:intel/ibt-0291-0291.ddc
+# +Version: BT_GalePeak_REL39025
+# +
+# +File:intel/ibt-0180-0041.sfi
+# +Version: BT_Magnetar_GfP2_REL82221
+# +File:intel/ibt-0180-0041.ddc
+# +Version: BT_Magnetar_GfP2_REL82221
+# +
+# +File:intel/ibt-0180-4150.sfi
+# +Version: BT_Magnetar_HrP2_REL82221
+# +File:intel/ibt-0180-4150.ddc
+# +Version: BT_Magnetar_HrP2_REL82221
+# +
+# +File:intel/ibt-0180-1050.sfi
+# +Version: BT_Magnetar_HrP1_REL82221
+# +File:intel/ibt-0180-1050.ddc
+# +Version: BT_Magnetar_HrP1_REL82221
+#  
+#  Licence: Redistributable. See LICENCE.ibt_firmware for details
+#  
+# @@ -3822,6 +3887,7 @@
+#  File: rtl_bt/rtl8852bu_fw.bin
+#  File: rtl_bt/rtl8852bu_config.bin
+#  File: rtl_bt/rtl8852cu_fw.bin
+# +File: rtl_bt/rtl8852cu_fw_v2.bin
+#  File: rtl_bt/rtl8852cu_config.bin
+#  File: rtl_bt/rtl8851bu_fw.bin
+#  File: rtl_bt/rtl8851bu_config.bin
+# @@ -3901,7 +3967,9 @@
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
+# @@ -3909,21 +3977,16 @@
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
+# +Version: 2023-10-19
+#  File: amd-ucode/README
+#  
+#  License: Redistributable. See LICENSE.amd-ucode for details
+# @@ -4613,7 +4676,7 @@
+#  Version: GuC API/APB ver 70.1.1 for Tigerlake
+#  
+#  File: i915/tgl_guc_70.bin
+# -Version: GuC API/APB ver 70.5.1 for Tigerlake
+# +Version: GuC API/APB ver 70.13.1 for Tigerlake
+#  
+#  File: i915/tgl_huc_7.0.3.bin
+#  Version: Huc API/APB ver 7 release 0 for Tigerlake
+# @@ -4694,7 +4757,7 @@
+#  Version: GuC API/APB ver 70.1.1 for Alderlake P
+#  
+#  File: i915/adlp_guc_70.bin
+# -Version: GuC API/APB ver 70.5.1 for Alderlake P
+# +Version: GuC API/APB ver 70.13.1 for Alderlake P
+#  
+#  File: i915/dg2_guc_70.1.2.bin
+#  Version: GuC API/APB ver 70.1.2 for DG2
+# @@ -4703,7 +4766,7 @@
+#  Version: GuC API/APB ver 70.4.1 for DG2
+#  
+#  File: i915/dg2_guc_70.bin
+# -Version: GuC API/APB ver 70.8.0 for DG2
+# +Version: GuC API/APB ver 70.13.1 for DG2
+#  
+#  File: i915/dg2_huc_gsc.bin
+#  Version: HuC API/APB ver 7.10.3 for DG2
+# @@ -4721,13 +4784,16 @@
+#  Version: DMC API/APB ver 2 release 10 for Meteorlake
+#  
+#  File: i915/mtl_dmc.bin
+# -Version: DMC API/APB ver 2 release 13 for Meteorlake
+# +Version: DMC API/APB ver 2 release 17 for Meteorlake
+#  
+#  File: i915/mtl_guc_70.bin
+# -Version: GuC API/APB ver 70.8.0 for Meteorlake
+# +Version: GuC API/APB ver 70.13.1 for Meteorlake
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
+# @@ -5548,6 +5614,10 @@
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
+# @@ -5598,6 +5668,7 @@
+#  File: qcom/sm8250/a650_zap.mbn
+#  File: qcom/a660_gmu.bin
+#  File: qcom/a660_sqe.fw
+# +File: qcom/a702_sqe.fw
+#  File: qcom/leia_pfp_470.fw
+#  File: qcom/leia_pm4_470.fw
+#  File: qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn
+# @@ -5629,28 +5700,51 @@
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
+# @@ -5660,6 +5754,8 @@
+#  Binary files supplied originally from
+#  http://releases.linaro.org/96boards/dragonboard410c/qualcomm/firmware/linux-board-support-package-r1036.1.zip
+#  http://releases.linaro.org/96boards/dragonboard845c/qualcomm/firmware/RB3_firmware_20221121000000-v5.zip
+# +https://releases.linaro.org/96boards/rb1/qualcomm/firmware/RB1_firmware_20230823-v2.zip
+# +https://releases.linaro.org/96boards/rb2/qualcomm/firmware/RB2_firmware_20230823-v2.zip
+#  http://releases.linaro.org/96boards/rb5/qualcomm/firmware/RB5_firmware_20210331-v4.zip
+#  
+#  adsp.mbn has been converted from 20-adsp_split/firmware/adsp.* using
+# @@ -5674,7 +5770,7 @@
+#  
+#  File: qcom/sdm845/mba.mbn
+#  File: qcom/sdm845/modem_nm.mbn
+# -File: qcom/sdm845/modemuw.jsn
+# +RawFile: qcom/sdm845/modemuw.jsn
+#  Link: qcom/sdm845/modem.mbn -> modem_nm.mbn
+#  
+#  Licence: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
+# @@ -6045,6 +6141,35 @@
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
+# @@ -6567,8 +6692,17 @@
+#  
+#  Driver: qcom-sc8280xp - Qualcomm ASoC tplg Firmware
+#  File: qcom/sc8280xp/LENOVO/21BX/audioreach-tplg.bin
+# +Link: qcom/sc8280xp/SC8280XP-LENOVO-X13S-tplg.bin -> LENOVO/21BX/audioreach-tplg.bin
+#  Version: v0.1.0
+#  
+#  Licence: Redistributable. See LICENCE.linaro for details
+#  Originates from https://git.linaro.org/people/srinivas.kandagatla/audioreach-topology.git
+#  --------------------------------------------------------------------------
+# +
+# +Driver: amlogic - Amlogic SoC Firmware
+# +File: amlogic/bluetooth/w2_bt_fw_uart.bin
+# +Version: date = 38.01, number = 0xa914
+# +
+# +Licence: Redistributable. See LICENSE.amlogic for details
+# +
+# +--------------------------------------------------------------------------
+# 
+#
+
 SUMMARY = "Firmware files for use with Linux kernel"
 HOMEPAGE = "https://www.kernel.org/"
 DESCRIPTION = "Linux firmware is a package distributed alongside the Linux kernel \
@@ -147,7 +754,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=${WHENCE_CHKSUM} \
+                    file://WHENCE;md5=ceb5248746d24d165b603e71b288cf75 \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
@@ -237,7 +844,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "88d46c543847ee3b03404d4941d91c92974690ee1f6fdcbee9cef3e5f97db688"
+SRC_URI[sha256sum] = "c98d200fc4a3120de1a594713ce34e135819dff23e883a4ed387863ba25679c7"
 
 inherit allarch
 
-- 
2.39.2


--===============7897568117522403864==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/linux-firmware: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware: SRC_URI changed from "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20230804.tar.xz" to "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20231030.tar.xz"
packages/all-poky-linux/linux-firmware: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PKGSIZE changed from 80314150 to 80232454 (-0%)
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu-license: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu-license: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-ar5523: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar5523: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: FILELIST: removed "/usr/lib/firmware/ath10k/WCN3990/hw1.0/notice.txt_wlanmdsp"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: RDEPENDS: added "linux-firmware-qcom-sdm845-modem"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PKGSIZE changed from 16465860 to 12713844 (-23%)
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: FILELIST: added "/usr/lib/firmware/brcm/brcmfmac43430-sdio.sinovoip,bananapi-m64.txt"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PKGSIZE changed from 428426 to 428455 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2-mips: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2-mips: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus-license: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus-license: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: FILELIST: added "/usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c49.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c46.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c47.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c48.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c49.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c46.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c46.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c47.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c48.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c70.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c71.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c72.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c47.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c48.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c70.bin /usr/lib/
 firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c71.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c72.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c46.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c49.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c70.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c48.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c47.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c71.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c72.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c49.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c70.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c71.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c72.wmfw /usr/lib/firmware/cirrus/cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: PKGSIZE changed from 1078832 to 1141376 (+6%)
packages/all-poky-linux/linux-firmware/linux-firmware-cnm-license: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cnm-license: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-cnm: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cnm: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200-license: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200-license: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dev: RRECOMMENDS: removed "linux-firmware-ath10k-dev", added "linux-firmware-qcom-sc8280xp-lenovo-x13s-audio-dev linux-firmware-qcom-sdm845-modem-dev"
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-gplv2-license: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-gplv2-license: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915: FILELIST: added "/usr/lib/firmware/i915/mtl_gsc_1.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGSIZE changed from 26630347 to 27969251 (+5%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PKGSIZE changed from 2402083 to 2399511 (-0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: FILELIST: added "/usr/lib/firmware/intel/ibt-0291-0291.sfi /usr/lib/firmware/intel/ibt-0180-0041.sfi /usr/lib/firmware/intel/ibt-0180-4150.sfi /usr/lib/firmware/intel/ibt-0180-1050.sfi /usr/lib/firmware/intel/ibt-0180-0041.ddc /usr/lib/firmware/intel/ibt-0180-1050.ddc /usr/lib/firmware/intel/ibt-0180-4150.ddc /usr/lib/firmware/intel/ibt-0291-0291.ddc"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGSIZE changed from 17514185 to 20888805 (+19%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced-license: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced-license: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: FILELIST: added "/usr/lib/firmware/iwlwifi-so-a0-gf4-a0-84.ucode /usr/lib/firmware/iwlwifi-ma-b0-gf4-a0-83.ucode /usr/lib/firmware/iwlwifi-ma-b0-hr-b0-83.ucode /usr/lib/firmware/iwlwifi-ty-a0-gf-a0-84.ucode /usr/lib/firmware/iwlwifi-so-a0-gf-a0-84.ucode /usr/lib/firmware/iwlwifi-ma-b0-gf-a0-83.ucode /usr/lib/firmware/iwlwifi-so-a0-hr-b0-83.ucode /usr/lib/firmware/iwlwifi-so-a0-hr-b0-84.ucode /usr/lib/firmware/iwlwifi-gl-c0-fm-c0-83.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PKGSIZE changed from 131123076 to 146195704 (+11%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-license: FILELIST: added "/usr/lib/firmware/LICENSE.amlogic /usr/lib/firmware/LICENSE.amd_pmf"
packages/all-poky-linux/linux-firmware/linux-firmware-license: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGSIZE changed from 86624 to 90314 (+4%)
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek-license: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek-license: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-microchip-license: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-microchip-license: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-microchip: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-microchip: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-moxa-license: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-moxa-license: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-moxa: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-moxa: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u-license: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u-license: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7650-license: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7650-license: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7650: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7650: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x2-license: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x2-license: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x2: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x2: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-license: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-license: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc-license: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc-license: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8987-sdio: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8987-sdio: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-common: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-common: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-pcie: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-pcie: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-sdio: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-sdio: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-common: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-common: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-pcie: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-pcie: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-sdio: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-sdio: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw416-sdio: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw416-sdio: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw612-sdio: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw612-sdio: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-olpc-license: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-olpc-license: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-olpc: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-olpc: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PKGSIZE changed from 1727720 to 1735784 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw-license: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw-license: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PKGSIZE changed from 2168523 to 2185947 (+1%)
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-modem: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-modem: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-wifi: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-wifi: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-adreno: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-adreno: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-adreno: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-adreno: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: RDEPENDS: removed "linux-firmware-ath10k"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PKGSIZE changed from 5916348 to 9641353 (+63%)
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-thundercomm-db845c-sensors: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-thundercomm-db845c-sensors: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-adreno: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-adreno: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PKGSIZE changed from 5822631 to 5826727 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PKGSIZE changed from 1973549 to 1974893 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-yamato-license: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-yamato-license: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx-license: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx-license: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8761: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8761: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8822: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8822: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-src: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-src: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone-license: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone-license: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGSIZE changed from 236962 to 242410 (+2%)
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251-license: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251-license: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000-license: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000-license: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000-license: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000-license: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c-license: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c-license: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGV changed from 20230804 [default] to 20231030 [default]
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: removed "/usr/lib/firmware/cxgb4/t6fw-1.27.3.0.bin /usr/lib/firmware/cxgb4/t5fw-1.27.3.0.bin /usr/lib/firmware/cxgb4/t4fw-1.27.3.0.bin", added "/usr/lib/firmware/qcom/qrb4210/adspr.jsn /usr/lib/firmware/qcom/qrb4210/cdspr.jsn /usr/lib/firmware/qcom/sm8250/Thundercomm/RB5/slpir.jsn /usr/lib/firmware/qcom/qrb4210/modem.mbn /usr/lib/firmware/qcom/venus-6.0/venus.mbn /usr/lib/firmware/qcom/qcm2290/modemuw.jsn /usr/lib/firmware/cxgb4/t5fw-1.27.4.0.bin /usr/lib/firmware/cxgb4/t4fw-1.27.4.0.bin /usr/lib/firmware/cxgb4/t6fw-1.27.4.0.bin /usr/lib/firmware/qcom/qrb4210/adsp.mbn /usr/lib/firmware/qcom/qrb4210/cdsp.mbn /usr/lib/firmware/iwlwifi-ma-b0-gf4-a0.pnvm /usr/lib/firmware/qcom/qcm2290/adspr.jsn /usr/lib/firmware/qcom/qrb4210/a610_zap.mbn /usr/lib/firmware/qcom/qcm2290/wlanmdsp.mbn /usr/lib/firmware/rtl_bt/rtl8852cu_fw_v2.bin /usr/lib/firmware/qcom/qcm2290/adsp.mbn /usr/lib/firmware/qcom/qcm2290/a702_zap.mbn /usr/lib/firmwar
 e/qcom/qrb4210/wlanmdsp.mbn /usr/lib/firmware/qcom/qcm2290/adspua.jsn /usr/lib/firmware/qcom/qrb4210/adspua.jsn /usr/lib/firmware/qcom/sm8250/Thundercomm/RB5/slpi.mbn /usr/lib/firmware/qcom/qrb4210/adsps.jsn /usr/lib/firmware/iwlwifi-gl-c0-fm-c0.pnvm /usr/lib/firmware/qcom/qcm2290/modem.mbn /usr/lib/firmware/qcom/qrb4210/modemr.jsn /usr/lib/firmware/iwlwifi-ma-b0-gf-a0.pnvm /usr/lib/firmware/amdtee/amd_pmf_v3.bin /usr/lib/firmware/qcom/sc8280xp/SC8280XP-LENOVO-X13S-tplg.bin /usr/lib/firmware/qcom/qcm2290/modemr.jsn /usr/lib/firmware/qcom/sm8250/Thundercomm/RB5/slpius.jsn /usr/lib/firmware/amd/amd_sev_fam19h_model1xh.sbin /usr/lib/firmware/amlogic/bluetooth/w2_bt_fw_uart.bin /usr/lib/firmware/qcom/sdm845/notice.txt_wlanmdsp /usr/lib/firmware/qcom/qcm2290/adsps.jsn /usr/lib/firmware/amdtee/773bd96f-b83f-4d52-b12dc529b13d8543.bin /usr/lib/firmware/qcom/qrb4210/modemuw.jsn /usr/lib/firmware/qcom/a702_sqe.fw"
packages/all-poky-linux/linux-firmware/linux-firmware: RDEPENDS: added "linux-firmware-qcom-sc8280xp-lenovo-x13s-audio"
packages/all-poky-linux/linux-firmware/linux-firmware: PV changed from "20230804" to "20231030"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGSIZE changed from 226276715 to 285705814 (+26%)

--===============7897568117522403864==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PKGSIZE changed from 16465860 to 12713844 (-23%)
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: FILELIST: removed "/usr/lib/firmware/ath10k/WCN3990/hw1.0/notice.txt_wlanmdsp"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: RDEPENDS: added "linux-firmware-qcom-sdm845-modem"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: FILELIST: added "/usr/lib/firmware/brcm/brcmfmac43430-sdio.sinovoip,bananapi-m64.txt"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: FILELIST: added "/usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c49.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c46.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c47.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c48.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c49.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c70.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c71.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c72.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c46.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c47.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c48.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c48.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c49.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c71.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c72.wmfw /usr/li
 b/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c70.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c46.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c71.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c72.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c70.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c71.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c72.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c46.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c47.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c48.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c49.wmfw /usr/lib/firmware/cirrus/cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8c70.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8c47.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-dev: RRECOMMENDS: removed "linux-firmware-ath10k-dev", added "linux-firmware-qcom-sdm845-modem-dev linux-firmware-qcom-sc8280xp-lenovo-x13s-audio-dev"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: FILELIST: added "/usr/lib/firmware/i915/mtl_gsc_1.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGSIZE changed from 17514185 to 20888805 (+19%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: FILELIST: added "/usr/lib/firmware/intel/ibt-0180-0041.sfi /usr/lib/firmware/intel/ibt-0180-1050.sfi /usr/lib/firmware/intel/ibt-0180-4150.sfi /usr/lib/firmware/intel/ibt-0291-0291.sfi /usr/lib/firmware/intel/ibt-0180-1050.ddc /usr/lib/firmware/intel/ibt-0291-0291.ddc /usr/lib/firmware/intel/ibt-0180-0041.ddc /usr/lib/firmware/intel/ibt-0180-4150.ddc"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PKGSIZE changed from 131123076 to 146195704 (+11%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: FILELIST: added "/usr/lib/firmware/iwlwifi-so-a0-hr-b0-83.ucode /usr/lib/firmware/iwlwifi-ma-b0-gf-a0-83.ucode /usr/lib/firmware/iwlwifi-so-a0-gf-a0-84.ucode /usr/lib/firmware/iwlwifi-ma-b0-hr-b0-83.ucode /usr/lib/firmware/iwlwifi-ty-a0-gf-a0-84.ucode /usr/lib/firmware/iwlwifi-ma-b0-gf4-a0-83.ucode /usr/lib/firmware/iwlwifi-gl-c0-fm-c0-83.ucode /usr/lib/firmware/iwlwifi-so-a0-hr-b0-84.ucode /usr/lib/firmware/iwlwifi-so-a0-gf4-a0-84.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-license: FILELIST: added "/usr/lib/firmware/LICENSE.amlogic /usr/lib/firmware/LICENSE.amd_pmf"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PKGSIZE changed from 5916348 to 9641353 (+63%)
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: RDEPENDS: removed "linux-firmware-ath10k"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGSIZE changed from 226276715 to 285705814 (+26%)
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: removed "/usr/lib/firmware/cxgb4/t6fw-1.27.3.0.bin /usr/lib/firmware/cxgb4/t5fw-1.27.3.0.bin /usr/lib/firmware/cxgb4/t4fw-1.27.3.0.bin", added "/usr/lib/firmware/qcom/qrb4210/adsps.jsn /usr/lib/firmware/cxgb4/t6fw-1.27.4.0.bin /usr/lib/firmware/cxgb4/t5fw-1.27.4.0.bin /usr/lib/firmware/cxgb4/t4fw-1.27.4.0.bin /usr/lib/firmware/qcom/qrb4210/modemr.jsn /usr/lib/firmware/qcom/sc8280xp/SC8280XP-LENOVO-X13S-tplg.bin /usr/lib/firmware/qcom/qcm2290/wlanmdsp.mbn /usr/lib/firmware/qcom/qcm2290/a702_zap.mbn /usr/lib/firmware/amdtee/amd_pmf_v3.bin /usr/lib/firmware/amdtee/773bd96f-b83f-4d52-b12dc529b13d8543.bin /usr/lib/firmware/qcom/sdm845/notice.txt_wlanmdsp /usr/lib/firmware/qcom/qrb4210/wlanmdsp.mbn /usr/lib/firmware/qcom/sm8250/Thundercomm/RB5/slpi.mbn /usr/lib/firmware/qcom/qcm2290/modemuw.jsn /usr/lib/firmware/qcom/qrb4210/modem.mbn /usr/lib/firmware/qcom/sm8250/Thundercomm/RB5/slpius.jsn /usr/lib/firmware/qcom/sm8250/Thund
 ercomm/RB5/slpir.jsn /usr/lib/firmware/qcom/qcm2290/modemr.jsn /usr/lib/firmware/amlogic/bluetooth/w2_bt_fw_uart.bin /usr/lib/firmware/qcom/qcm2290/modem.mbn /usr/lib/firmware/qcom/venus-6.0/venus.mbn /usr/lib/firmware/qcom/qrb4210/adspr.jsn /usr/lib/firmware/qcom/qrb4210/cdspr.jsn /usr/lib/firmware/qcom/qrb4210/a610_zap.mbn /usr/lib/firmware/qcom/qrb4210/adspua.jsn /usr/lib/firmware/qcom/qrb4210/cdsp.mbn /usr/lib/firmware/qcom/qrb4210/adsp.mbn /usr/lib/firmware/iwlwifi-gl-c0-fm-c0.pnvm /usr/lib/firmware/qcom/qcm2290/adspua.jsn /usr/lib/firmware/iwlwifi-ma-b0-gf-a0.pnvm /usr/lib/firmware/qcom/qrb4210/modemuw.jsn /usr/lib/firmware/qcom/qcm2290/adspr.jsn /usr/lib/firmware/iwlwifi-ma-b0-gf4-a0.pnvm /usr/lib/firmware/amd/amd_sev_fam19h_model1xh.sbin /usr/lib/firmware/rtl_bt/rtl8852cu_fw_v2.bin /usr/lib/firmware/qcom/qcm2290/adsps.jsn /usr/lib/firmware/qcom/a702_sqe.fw /usr/lib/firmware/qcom/qcm2290/adsp.mbn"
packages/all-poky-linux/linux-firmware/linux-firmware: RDEPENDS: added "linux-firmware-qcom-sc8280xp-lenovo-x13s-audio"

--===============7897568117522403864==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-linux-firmware-upgrade-20230804-20231030.patch"

RnJvbSBiMWYwY2FkZjk2MGEzZmExYTg4OTYwYWI1ZDBhMmQ4MTE0MmI2NmFjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAxMzo0MDo1OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
bnV4LWZpcm13YXJlOiB1cGdyYWRlIDIwMjMwODA0IC0+IDIwMjMxMDMwCgotLS0KIC4uLjIwMjMw
ODA0LmJiID0+IGxpbnV4LWZpcm13YXJlXzIwMjMxMDMwLmJifSB8IDYxMSArKysrKysrKysrKysr
KysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA2MDkgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL3tsaW51eC1maXJtd2Fy
ZV8yMDIzMDgwNC5iYiA9PiBsaW51eC1maXJtd2FyZV8yMDIzMTAzMC5iYn0gKDc1JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJl
XzIwMjMwODA0LmJiIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1m
aXJtd2FyZV8yMDIzMTAzMC5iYgpzaW1pbGFyaXR5IGluZGV4IDc1JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlXzIwMjMwODA0LmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13
YXJlXzIwMjMxMDMwLmJiCmluZGV4IDBlODAwNWJmYzkuLjM1NmZiYjBmYjkgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgtZmlybXdhcmVfMjAyMzA4
MDQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJt
d2FyZV8yMDIzMTAzMC5iYgpAQCAtMSwzICsxLDYxMCBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxF
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
YjQvY29uZmlncy90NC1jb25maWctZGVmYXVsdC50eHQKKyMgQEAgLTcyNiwxMCArNzI2LDEwIEBA
CisjICBWZXJzaW9uOiBXMTYuNjguMS5wMTc5CisjICAKKyMgIEZpbGU6IG1ydmwvcGNpZXVzYjg5
OTdfY29tYm9fdjQuYmluCisjIC1WZXJzaW9uOiBXMTYuNjguMS5wMTk1CisjICtWZXJzaW9uOiBX
MTYuNjguMTAucDE1OS4xCisjICAKKyMgIEZpbGU6IG1ydmwvcGNpZTg5OTdfd2xhbl92NC5iaW4K
KyMgLVZlcnNpb246IFcxNi42OC4xLnAxOTUKKyMgK1ZlcnNpb246IFcxNi42OC4xMC5wMTU5LjEK
KyMgIAorIyAgRmlsZTogbXJ2bC91c2J1c2I4OTk3X2NvbWJvX3Y0LmJpbgorIyAgVmVyc2lvbjog
VzE2LjY4LjEucDE4MworIyBAQCAtMTAxNywyMiArMTAxNywyMiBAQAorIyAgVmVyc2lvbjogNzQu
YTVlOTU4OGIuMAorIyAgCisjICBGaWxlOiBpd2x3aWZpLWNjLWEwLTc3LnVjb2RlCisjIC1WZXJz
aW9uOiA3NC4yZGY4OTg2Zi4wCisjICtWZXJzaW9uOiA3NC5iZDA2NzQyOS4wCisjICAKKyMgIEZp
bGU6IGl3bHdpZmktUXUtYjAtaHItYjAtNzcudWNvZGUKKyMgLVZlcnNpb246IDc0LjJkZjg5ODZm
LjAKKyMgK1ZlcnNpb246IDc0LmJkMDY3NDI5LjAKKyMgIAorIyAgRmlsZTogaXdsd2lmaS1RdS1i
MC1qZi1iMC03Ny51Y29kZQorIyAtVmVyc2lvbjogNzQuMmRmODk4NmYuMAorIyArVmVyc2lvbjog
NzQuYmQwNjc0MjkuMAorIyAgCisjICBGaWxlOiBpd2x3aWZpLVF1LWMwLWhyLWIwLTc3LnVjb2Rl
CisjIC1WZXJzaW9uOiA3NC4yZGY4OTg2Zi4wCisjICtWZXJzaW9uOiA3NC5iZDA2NzQyOS4wCisj
ICAKKyMgIEZpbGU6IGl3bHdpZmktUXUtYzAtamYtYjAtNzcudWNvZGUKKyMgLVZlcnNpb246IDc0
LjJkZjg5ODZmLjAKKyMgK1ZlcnNpb246IDc0LmJkMDY3NDI5LjAKKyMgIAorIyAgRmlsZTogaXds
d2lmaS1RdVotYTAtaHItYjAtNzcudWNvZGUKKyMgLVZlcnNpb246IDc0LjJkZjg5ODZmLjAKKyMg
K1ZlcnNpb246IDc0LmJkMDY3NDIuMAorIyAgCisjICBGaWxlOiBpd2x3aWZpLVF1Wi1hMC1qZi1i
MC03Ny51Y29kZQorIyAgVmVyc2lvbjogNzQuMjA2YjAxODQuMAorIyBAQCAtMTA1Miw2ICsxMDUy
LDkgQEAKKyMgIEZpbGU6IGl3bHdpZmktdHktYTAtZ2YtYTAtODMudWNvZGUKKyMgIFZlcnNpb246
IDgwLmU4Zjg0ZTk4LjAKKyMgIAorIyArRmlsZTogaXdsd2lmaS10eS1hMC1nZi1hMC04NC51Y29k
ZQorIyArVmVyc2lvbjogODEuOGU1YzU0NGMuMAorIyArCisjICBGaWxlOiBpd2x3aWZpLXNvLWEw
LWdmNC1hMC03Ny51Y29kZQorIyAgVmVyc2lvbjogNzQuZjkyYjVmZWQuMAorIyAgCisjIEBAIC0x
MDY3LDYgKzEwNzAsOSBAQAorIyAgRmlsZTogaXdsd2lmaS1zby1hMC1nZjQtYTAtODMudWNvZGUK
KyMgIFZlcnNpb246IDgwLmU4Zjg0ZTk4LjAKKyMgIAorIyArRmlsZTogaXdsd2lmaS1zby1hMC1n
ZjQtYTAtODQudWNvZGUKKyMgK1ZlcnNpb246IDgxLjhlNWM1NDRjLjAKKyMgKworIyAgRmlsZTog
aXdsd2lmaS1zby1hMC1nZi1hMC03Ny51Y29kZQorIyAgVmVyc2lvbjogNzQuZjkyYjVmZWQuMAor
IyAgCisjIEBAIC0xMDgyLDYgKzEwODgsOSBAQAorIyAgRmlsZTogaXdsd2lmaS1zby1hMC1nZi1h
MC04My51Y29kZQorIyAgVmVyc2lvbjogODAuZThmODRlOTguMAorIyAgCisjICtGaWxlOiBpd2x3
aWZpLXNvLWEwLWdmLWEwLTg0LnVjb2RlCisjICtWZXJzaW9uOiA4MS44ZTVjNTQ0Yy4wCisjICsK
KyMgIEZpbGU6IGl3bHdpZmktc28tYTAtaHItYjAtNzcudWNvZGUKKyMgIFZlcnNpb246IDc0LmY5
MmI1ZmVkLjAKKyMgIAorIyBAQCAtMTA5MSwxMCArMTEwMCwzNCBAQAorIyAgRmlsZTogaXdsd2lm
aS1zby1hMC1oci1iMC04MS51Y29kZQorIyAgVmVyc2lvbjogNzguMzFmYzlhZTYuMAorIyAgCisj
ICtGaWxlOiBpd2x3aWZpLXNvLWEwLWhyLWIwLTgzLnVjb2RlCisjICtWZXJzaW9uOiA4MC5lOGY4
NGU5OC4wCisjICsKKyMgK0ZpbGU6IGl3bHdpZmktc28tYTAtaHItYjAtODQudWNvZGUKKyMgK1Zl
cnNpb246IDgxLjhlNWM1NDRjLjAKKyMgKworIyAgRmlsZTogaXdsd2lmaS1zby1hMC1qZi1iMC03
Ny51Y29kZQorIyAgVmVyc2lvbjogNzQuZjkyYjVmZWQuMAorIyAgCisjICBGaWxlOiBpd2x3aWZp
LXR5LWEwLWdmLWEwLnBudm0KKyMgKworIyArRmlsZTogaXdsd2lmaS1nbC1jMC1mbS1jMC04My51
Y29kZQorIyArVmVyc2lvbjogODAuZDI0ZTA2ZWQuMAorIyArCisjICtGaWxlOiBpd2x3aWZpLWds
LWMwLWZtLWMwLnBudm0KKyMgKworIyArRmlsZTogaXdsd2lmaS1tYS1iMC1nZi1hMC04My51Y29k
ZQorIyArVmVyc2lvbjogODAuZDI0ZTA2ZWQuMAorIyArCisjICtGaWxlOiBpd2x3aWZpLW1hLWIw
LWdmLWEwLnBudm0KKyMgKworIyArRmlsZTogaXdsd2lmaS1tYS1iMC1nZjQtYTAtODMudWNvZGUK
KyMgK1ZlcnNpb246IDgwLmQyNGUwNmVkLjAKKyMgKworIyArRmlsZTogaXdsd2lmaS1tYS1iMC1n
ZjQtYTAucG52bQorIyArCisjICtGaWxlOiBpd2x3aWZpLW1hLWIwLWhyLWIwLTgzLnVjb2RlCisj
ICtWZXJzaW9uOiA4MC5kMjRlMDZlZC4wCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJs
ZS4gU2VlIExJQ0VOQ0UuaXdsd2lmaV9maXJtd2FyZSBmb3IgZGV0YWlscworIyAgCisjIEBAIC0y
NDQ1LDYgKzI0NzgsMTcgQEAKKyMgIAorIyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgIAorIyArLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KKyMgKworIyArRHJpdmVyOiBhbWRfcG1mIC0gQU1EIFBsYXRmb3JtIE1h
bmFnZW1lbnQgRnJhbWV3b3JrIFRBCisjICsKKyMgK0ZpbGU6IGFtZHRlZS83NzNiZDk2Zi1iODNm
LTRkNTItYjEyZGM1MjliMTNkODU0My5iaW4KKyMgK0xpbms6IGFtZHRlZS9hbWRfcG1mX3YzLmJp
biAtPiA3NzNiZDk2Zi1iODNmLTRkNTItYjEyZGM1MjliMTNkODU0My5iaW4KKyMgKworIyArTGlj
ZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5hbWRfcG1mIGZvciBkZXRhaWxzLgor
IyArCisjICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyArCisjICBEcml2ZXI6IHMyMjU1ZHJ2CisjICAK
KyMgIEZpbGU6IGYyMjU1dXNiLmJpbgorIyBAQCAtMjcxNiw2ICsyNzYwLDcgQEAKKyMgIExpbms6
IGJyY20vYnJjbWZtYWM0MzQzMC1zZGlvLnNpbm92b2lwLGJwaS1tMi16ZXJvLnR4dCAtPiBicmNt
Zm1hYzQzNDMwLXNkaW8uQVA2MjEyLnR4dAorIyAgTGluazogYnJjbS9icmNtZm1hYzQzNDMwLXNk
aW8uc2lub3ZvaXAsYnBpLW0yLXVsdHJhLnR4dCAtPiBicmNtZm1hYzQzNDMwLXNkaW8uQVA2MjEy
LnR4dAorIyAgTGluazogYnJjbS9icmNtZm1hYzQzNDMwLXNkaW8uc2lub3ZvaXAsYnBpLW0zLnR4
dCAtPiBicmNtZm1hYzQzNDMwLXNkaW8uQVA2MjEyLnR4dAorIyArTGluazogYnJjbS9icmNtZm1h
YzQzNDMwLXNkaW8uc2lub3ZvaXAsYmFuYW5hcGktbTY0LnR4dCAtPiBicmNtZm1hYzQzNDMwLXNk
aW8uQVA2MjEyLnR4dAorIyAgTGluazogYnJjbS9icmNtZm1hYzQzNDMwLXNkaW8uZnJpZW5kbHlh
cm0sbmFub3BpLXIxLnR4dCAtPiBicmNtZm1hYzQzNDMwLXNkaW8uQVA2MjEyLnR4dAorIyAgTGlu
azogYnJjbS9icmNtZm1hYzQzNDMwLXNkaW8uc3RhcmZpdmUsdmlzaW9uZml2ZS12MS50eHQgLT4g
YnJjbWZtYWM0MzQzMC1zZGlvLkFQNjIxMi50eHQKKyMgIExpbms6IGJyY20vYnJjbWZtYWM0MzQz
MC1zZGlvLmJlYWdsZSxiZWFnbGV2LXN0YXJsaWdodC1qaDcxMDAtYTEudHh0IC0+IGJyY21mbWFj
NDM0MzAtc2Rpby5BUDYyMTIudHh0CisjIEBAIC0zMzk1LDEwICszNDQwLDEwIEBACisjICBGaWxl
OiBhdGgxMGsvUUNBOTM3Ny9odzEuMC9ub3RpY2VfYXRoMTBrX2Zpcm13YXJlLTYudHh0CisjICBG
aWxlOiBhdGgxMGsvV0NOMzk5MC9odzEuMC9ib2FyZC0yLmJpbgorIyAgRmlsZTogYXRoMTBrL1dD
TjM5OTAvaHcxLjAvZmlybXdhcmUtNS5iaW4KKyMgLUZpbGU6IGF0aDEway9XQ04zOTkwL2h3MS4w
L3dsYW5tZHNwLm1ibgorIyAtTGluazogcWNvbS9zZG04NDUvd2xhbm1kc3AubWJuIC0+IC4uLy4u
L2F0aDEway9XQ04zOTkwL2h3MS4wL3dsYW5tZHNwLm1ibgorIyArRmlsZTogcWNvbS9zZG04NDUv
d2xhbm1kc3AubWJuCisjICtMaW5rOiBhdGgxMGsvV0NOMzk5MC9odzEuMC93bGFubWRzcC5tYm4g
LT4gLi4vLi4vLi4vcWNvbS9zZG04NDUvd2xhbm1kc3AubWJuCisjICBWZXJzaW9uOiBXTEFOLkhM
LjIuMC0wMTM4Ny1RQ0FITFNXTVRQTFotMQorIyAtRmlsZTogYXRoMTBrL1dDTjM5OTAvaHcxLjAv
bm90aWNlLnR4dF93bGFubWRzcAorIyArRmlsZTogcWNvbS9zZG04NDUvbm90aWNlLnR4dF93bGFu
bWRzcAorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLlF1YWxj
b21tQXRoZXJvc19hdGgxMGsgZm9yIGRldGFpbHMKKyMgIAorIyBAQCAtMzY2NSwxMyArMzcxMCwx
MyBAQAorIyAgRmlsZTogaW50ZWwvaWJ0LTEyLTE2LnNmaQorIyAgVmVyc2lvbjogQlRfV2luZFN0
b3JtUGVha19SRUwxMjk5CisjICBGaWxlOiBpbnRlbC9pYnQtMTctMTYtMS5zZmkKKyMgLVZlcnNp
b246IEJUX0plZmZlcnNvblBlYWtfQjBfQjBfUkVMMjAzMzIKKyMgK1ZlcnNpb246IEJUX0plZmZl
cnNvblBlYWtfQjBfQjBfUkVMMjAzNzkKKyMgIEZpbGU6IGludGVsL2lidC0xNy0xNi0xLmRkYwor
IyAtVmVyc2lvbjogQlRfSmVmZmVyc29uUGVha19CMF9CMF9SRUwyMDMzMgorIyArVmVyc2lvbjog
QlRfSmVmZmVyc29uUGVha19CMF9CMF9SRUwyMDM3OQorIyAgRmlsZTogaW50ZWwvaWJ0LTE3LTIu
c2ZpCisjIC1WZXJzaW9uOiBCVF9KZWZmZXJzb25QZWFrX0IwX0IwX1JFTDIwMzMyCisjICtWZXJz
aW9uOiBCVF9KZWZmZXJzb25QZWFrX0IwX0IwX1JFTDIwMzc5CisjICBGaWxlOiBpbnRlbC9pYnQt
MTctMi5kZGMKKyMgLVZlcnNpb246IEJUX0plZmZlcnNvblBlYWtfQjBfQjBfUkVMMjAzMzIKKyMg
K1ZlcnNpb246IEJUX0plZmZlcnNvblBlYWtfQjBfQjBfUkVMMjAzNzkKKyMgIEZpbGU6IGludGVs
L2lidC0xNy0wLTEuc2ZpCisjICBWZXJzaW9uOiBCVF9KZWZmZXJzb25QZWFrX0EwX0IwX1JFTDAy
MDEKKyMgIEZpbGU6IGludGVsL2lidC0xNy0wLTEuZGRjCisjIEBAIC0zNjgxLDEzICszNzI2LDEz
IEBACisjICBGaWxlOiBpbnRlbC9pYnQtMTctMS5kZGMKKyMgIFZlcnNpb246IEJUX0plZmZlcnNv
blBlYWtfQTBfQjBfUkVMMDIwMQorIyAgRmlsZTogaW50ZWwvaWJ0LTE4LTE2LTEuc2ZpCisjIC1W
ZXJzaW9uOiBCVF9UaHVuZGVyUGVha19CMF9CMF9SRUwyMDE4MgorIyArVmVyc2lvbjogQlRfVGh1
bmRlclBlYWtfQjBfQjBfUkVMMjAzNzkKKyMgIEZpbGU6IGludGVsL2lidC0xOC0xNi0xLmRkYwor
IyAtVmVyc2lvbjogQlRfVGh1bmRlclBlYWtfQjBfQjBfUkVMMjAxODIKKyMgK1ZlcnNpb246IEJU
X1RodW5kZXJQZWFrX0IwX0IwX1JFTDIwMzc5CisjICBGaWxlOiBpbnRlbC9pYnQtMTgtMi5zZmkK
KyMgLVZlcnNpb246IEJUX1RodW5kZXJQZWFrX0IwX0IwX1JFTDIwMTgyCisjICtWZXJzaW9uOiBC
VF9UaHVuZGVyUGVha19CMF9CMF9SRUwyMDM3OQorIyAgRmlsZTogaW50ZWwvaWJ0LTE4LTIuZGRj
CisjIC1WZXJzaW9uOiBCVF9UaHVuZGVyUGVha19CMF9CMF9SRUwyMDE4MgorIyArVmVyc2lvbjog
QlRfVGh1bmRlclBlYWtfQjBfQjBfUkVMMjAzNzkKKyMgIEZpbGU6IGludGVsL2lidC0xOC0wLTEu
c2ZpCisjICBWZXJzaW9uOiBCVF9UaHVuZGVyUGVha19BMF9CMF9SRUwwMjAxCisjICBGaWxlOiBp
bnRlbC9pYnQtMTgtMC0xLmRkYworIyBAQCAtMzY5Nyw2OSArMzc0Miw2OSBAQAorIyAgRmlsZTog
aW50ZWwvaWJ0LTE4LTEuZGRjCisjICBWZXJzaW9uOiBCVF9UaHVuZGVyUGVha19BMF9CMF9SRUww
MjAxCisjICBGaWxlOmludGVsL2lidC0yMC0wLTMuc2ZpCisjIC1WZXJzaW9uOiBCVF9DeWNsb25l
UGVha19BMF9SRUw1MzQ1NAorIyArVmVyc2lvbjogQlRfQ3ljbG9uZVBlYWtfQTBfUkVMNTM0OTcK
KyMgIEZpbGU6aW50ZWwvaWJ0LTIwLTAtMy5kZGMKKyMgLVZlcnNpb246IEJUX0N5Y2xvbmVQZWFr
X0EwX1JFTDUzNDU0CisjICtWZXJzaW9uOiBCVF9DeWNsb25lUGVha19BMF9SRUw1MzQ5NworIyAg
RmlsZTppbnRlbC9pYnQtMjAtMS0zLnNmaQorIyAtVmVyc2lvbjogQlRfQ3ljbG9uZVBlYWtfQTBf
UkVMNTM0NTQKKyMgK1ZlcnNpb246IEJUX0N5Y2xvbmVQZWFrX0EwX1JFTDUzNDk3CisjICBGaWxl
OmludGVsL2lidC0yMC0xLTMuZGRjCisjIC1WZXJzaW9uOiBCVF9DeWNsb25lUGVha19BMF9SRUw1
MzQ1NAorIyArVmVyc2lvbjogQlRfQ3ljbG9uZVBlYWtfQTBfUkVMNTM0OTcKKyMgIEZpbGU6aW50
ZWwvaWJ0LTIwLTEtNC5zZmkKKyMgLVZlcnNpb246IEJUX0N5Y2xvbmVQZWFrX0EwX1JFTDUzNDU0
CisjICtWZXJzaW9uOiBCVF9DeWNsb25lUGVha19BMF9SRUw1MzQ5NworIyAgRmlsZTppbnRlbC9p
YnQtMjAtMS00LmRkYworIyAtVmVyc2lvbjogQlRfQ3ljbG9uZVBlYWtfQTBfUkVMNTM0NTQKKyMg
K1ZlcnNpb246IEJUX0N5Y2xvbmVQZWFrX0EwX1JFTDUzNDk3CisjICBGaWxlOmludGVsL2lidC0x
OS0wLTAuc2ZpCisjIC1WZXJzaW9uOiBCVF9RdWFzYXJfUkVMNTM0NTQKKyMgK1ZlcnNpb246IEJU
X1F1YXNhcl9SRUw1MzQ5NworIyAgRmlsZTppbnRlbC9pYnQtMTktMC0wLmRkYworIyAtVmVyc2lv
bjogQlRfUXVhc2FyX1JFTDUzNDU0CisjICtWZXJzaW9uOiBCVF9RdWFzYXJfUkVMNTM0OTcKKyMg
IEZpbGU6aW50ZWwvaWJ0LTE5LTAtMS5zZmkKKyMgLVZlcnNpb246IEJUX1F1YXNhcl9SRUw1MzQ1
NAorIyArVmVyc2lvbjogQlRfUXVhc2FyX1JFTDUzNDk3CisjICBGaWxlOmludGVsL2lidC0xOS0w
LTEuZGRjCisjIC1WZXJzaW9uOiBCVF9RdWFzYXJfUkVMNTM0NTQKKyMgK1ZlcnNpb246IEJUX1F1
YXNhcl9SRUw1MzQ5NworIyAgRmlsZTppbnRlbC9pYnQtMTktMC0zLnNmaQorIyAgVmVyc2lvbjog
QlRfUXVhc2FyX1JFTDUzMjYzCisjICBGaWxlOmludGVsL2lidC0xOS0wLTMuZGRjCisjICBWZXJz
aW9uOiBCVF9RdWFzYXJfUkVMNTMyNjMKKyMgIEZpbGU6aW50ZWwvaWJ0LTE5LTAtNC5zZmkKKyMg
LVZlcnNpb246IEJUX0hhcnJpc29uUGVha19SRUw1MzQ1NAorIyArVmVyc2lvbjogQlRfSGFycmlz
b25QZWFrX1JFTDUzNDk3CisjICBGaWxlOmludGVsL2lidC0xOS0wLTQuZGRjCisjIC1WZXJzaW9u
OiBCVF9IYXJyaXNvblBlYWtfUkVMNTM0NTQKKyMgK1ZlcnNpb246IEJUX0hhcnJpc29uUGVha19S
RUw1MzQ5NworIyAgRmlsZTppbnRlbC9pYnQtMTktMTYtNC5zZmkKKyMgLVZlcnNpb246IEJUX0hh
cnJpc29uUGVha19SRUw1MzQ1NAorIyArVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDUzNDk3
CisjICBGaWxlOmludGVsL2lidC0xOS0xNi00LmRkYworIyAtVmVyc2lvbjogQlRfSGFycmlzb25Q
ZWFrX1JFTDUzNDU0CisjICtWZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMNTM0OTcKKyMgIEZp
bGU6aW50ZWwvaWJ0LTE5LTMyLTEuc2ZpCisjIC1WZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVM
NTM0NTQKKyMgK1ZlcnNpb246IEJUX0hhcnJpc29uUGVha19SRUw1MzQ5NworIyAgRmlsZTppbnRl
bC9pYnQtMTktMzItMS5kZGMKKyMgLVZlcnNpb246IEJUX0hhcnJpc29uUGVha19SRUw1MzQ1NAor
IyArVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDUzNDk3CisjICBGaWxlOmludGVsL2lidC0x
OS0zMi0wLnNmaQorIyAtVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDUzNDU0CisjICtWZXJz
aW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMNTM0OTcKKyMgIEZpbGU6aW50ZWwvaWJ0LTE5LTMyLTAu
ZGRjCisjIC1WZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMNTM0NTQKKyMgK1ZlcnNpb246IEJU
X0hhcnJpc29uUGVha19SRUw1MzQ5NworIyAgRmlsZTppbnRlbC9pYnQtMTktMzItNC5zZmkKKyMg
LVZlcnNpb246IEJUX0hhcnJpc29uUGVha19SRUw1MzQ1NAorIyArVmVyc2lvbjogQlRfSGFycmlz
b25QZWFrX1JFTDUzNDk3CisjICBGaWxlOmludGVsL2lidC0xOS0zMi00LmRkYworIyAtVmVyc2lv
bjogQlRfSGFycmlzb25QZWFrX1JFTDUzNDU0CisjICtWZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtf
UkVMNTM0OTcKKyMgIEZpbGU6aW50ZWwvaWJ0LTE5LTI0MC0xLnNmaQorIyAtVmVyc2lvbjogQlRf
SGFycmlzb25QZWFrX1JFTDUzNDU0CisjICtWZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMNTM0
OTcKKyMgIEZpbGU6aW50ZWwvaWJ0LTE5LTI0MC0xLmRkYworIyAtVmVyc2lvbjogQlRfSGFycmlz
b25QZWFrX1JFTDUzNDU0CisjICtWZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMNTM0OTcKKyMg
IEZpbGU6aW50ZWwvaWJ0LTE5LTI0MC00LnNmaQorIyAtVmVyc2lvbjogQlRfSGFycmlzb25QZWFr
X1JFTDUzNDU0CisjICtWZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMNTM0OTcKKyMgIEZpbGU6
aW50ZWwvaWJ0LTE5LTI0MC00LmRkYworIyAtVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDUz
NDU0CisjICtWZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMNTM0OTcKKyMgIEZpbGU6aW50ZWwv
aWJ0LTAwNDEtMDA0MS5zZmkKKyMgLVZlcnNpb246IEJUX1R5cGhvb25QZWFrX1JFTDY3MDY4Cisj
ICtWZXJzaW9uOiBCVF9UeXBob29uUGVha19SRUw2NjQxMAorIyAgRmlsZTppbnRlbC9pYnQtMDA0
MS0wMDQxLmRkYworIyAtVmVyc2lvbjogQlRfVHlwaG9vblBlYWtfUkVMNjcwNjgKKyMgK1ZlcnNp
b246IEJUX1R5cGhvb25QZWFrX1JFTDY2NDEwCisjICBGaWxlOmludGVsL2lidC0wMDQwLTAwNDEu
c2ZpCisjIC1WZXJzaW9uOiBCVF9Tb2xhcl9HZlAyX1JFTDY3MDY4CisjICtWZXJzaW9uOiBCVF9T
b2xhcl9HZlAyX1JFTDY2NDEwCisjICBGaWxlOmludGVsL2lidC0wMDQwLTAwNDEuZGRjCisjIC1W
ZXJzaW9uOiBCVF9Tb2xhcl9HZlAyX1JFTDY3MDY4CisjICtWZXJzaW9uOiBCVF9Tb2xhcl9HZlAy
X1JFTDY2NDEwCisjICBGaWxlOmludGVsL2lidC0xMDQwLTAwNDEuc2ZpCisjIC1WZXJzaW9uOiBC
VF9Tb2xhckZfR2ZQMl9SRUw2NzA2OAorIyArVmVyc2lvbjogQlRfU29sYXJGX0dmUDJfUkVMNjY0
MTAKKyMgIEZpbGU6aW50ZWwvaWJ0LTEwNDAtMDA0MS5kZGMKKyMgLVZlcnNpb246IEJUX1NvbGFy
Rl9HZlAyX1JFTDY3MDY4CisjICtWZXJzaW9uOiBCVF9Tb2xhckZfR2ZQMl9SRUw2NjQxMAorIyAg
CisjICBGaWxlOmludGVsL2lidC0wMDQwLTEwMjAuc2ZpCisjICBWZXJzaW9uOiBCVF9Tb2xhcl9K
ZlAxX1JFTDU5NTY0CisjIEBAIC0zNzgwLDEzICszODI1LDMzIEBACisjICBWZXJzaW9uOiBCVF9T
b2xhckZfSmZQMl9SRUw1OTU2NAorIyAgCisjICBGaWxlOmludGVsL2lidC0wMDQwLTQxNTAuc2Zp
CisjIC1WZXJzaW9uOiBCVF9Tb2xhcl9KblAyX1JFTDY3MDY4CisjICtWZXJzaW9uOiBCVF9Tb2xh
cl9KblAyX1JFTDY2NDEwCisjICBGaWxlOmludGVsL2lidC0wMDQwLTQxNTAuZGRjCisjIC1WZXJz
aW9uOiBCVF9Tb2xhcl9KblAyX1JFTDY3MDY4CisjICtWZXJzaW9uOiBCVF9Tb2xhcl9KblAyX1JF
TDY2NDEwCisjICBGaWxlOmludGVsL2lidC0xMDQwLTQxNTAuc2ZpCisjIC1WZXJzaW9uOiBCVF9T
b2xhckZfSm5QMl9SRUw2NzA2OAorIyArVmVyc2lvbjogQlRfU29sYXJGX0puUDJfUkVMNjY0MTAK
KyMgIEZpbGU6aW50ZWwvaWJ0LTEwNDAtNDE1MC5kZGMKKyMgLVZlcnNpb246IEJUX1NvbGFyRl9K
blAyX1JFTDY3MDY4CisjICtWZXJzaW9uOiBCVF9Tb2xhckZfSm5QMl9SRUw2NjQxMAorIyArCisj
ICtGaWxlOmludGVsL2lidC0wMjkxLTAyOTEuc2ZpCisjICtWZXJzaW9uOiBCVF9HYWxlUGVha19S
RUwzOTAyNQorIyArRmlsZTppbnRlbC9pYnQtMDI5MS0wMjkxLmRkYworIyArVmVyc2lvbjogQlRf
R2FsZVBlYWtfUkVMMzkwMjUKKyMgKworIyArRmlsZTppbnRlbC9pYnQtMDE4MC0wMDQxLnNmaQor
IyArVmVyc2lvbjogQlRfTWFnbmV0YXJfR2ZQMl9SRUw4MjIyMQorIyArRmlsZTppbnRlbC9pYnQt
MDE4MC0wMDQxLmRkYworIyArVmVyc2lvbjogQlRfTWFnbmV0YXJfR2ZQMl9SRUw4MjIyMQorIyAr
CisjICtGaWxlOmludGVsL2lidC0wMTgwLTQxNTAuc2ZpCisjICtWZXJzaW9uOiBCVF9NYWduZXRh
cl9IclAyX1JFTDgyMjIxCisjICtGaWxlOmludGVsL2lidC0wMTgwLTQxNTAuZGRjCisjICtWZXJz
aW9uOiBCVF9NYWduZXRhcl9IclAyX1JFTDgyMjIxCisjICsKKyMgK0ZpbGU6aW50ZWwvaWJ0LTAx
ODAtMTA1MC5zZmkKKyMgK1ZlcnNpb246IEJUX01hZ25ldGFyX0hyUDFfUkVMODIyMjEKKyMgK0Zp
bGU6aW50ZWwvaWJ0LTAxODAtMTA1MC5kZGMKKyMgK1ZlcnNpb246IEJUX01hZ25ldGFyX0hyUDFf
UkVMODIyMjEKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5p
YnRfZmlybXdhcmUgZm9yIGRldGFpbHMKKyMgIAorIyBAQCAtMzgyMiw2ICszODg3LDcgQEAKKyMg
IEZpbGU6IHJ0bF9idC9ydGw4ODUyYnVfZncuYmluCisjICBGaWxlOiBydGxfYnQvcnRsODg1MmJ1
X2NvbmZpZy5iaW4KKyMgIEZpbGU6IHJ0bF9idC9ydGw4ODUyY3VfZncuYmluCisjICtGaWxlOiBy
dGxfYnQvcnRsODg1MmN1X2Z3X3YyLmJpbgorIyAgRmlsZTogcnRsX2J0L3J0bDg4NTJjdV9jb25m
aWcuYmluCisjICBGaWxlOiBydGxfYnQvcnRsODg1MWJ1X2Z3LmJpbgorIyAgRmlsZTogcnRsX2J0
L3J0bDg4NTFidV9jb25maWcuYmluCisjIEBAIC0zOTAxLDcgKzM5NjcsOSBAQAorIyAgRmlsZTog
YW1kL2FtZF9zZXZfZmFtMTdoX21vZGVsM3hoLnNiaW4KKyMgIFZlcnNpb246IDIwMjItMi0yNQor
IyAgRmlsZTogYW1kL2FtZF9zZXZfZmFtMTloX21vZGVsMHhoLnNiaW4KKyMgLVZlcnNpb246IDIw
MjItMi0yNQorIyArVmVyc2lvbjogMjAyMy04LTIzCisjICtGaWxlOiBhbWQvYW1kX3Nldl9mYW0x
OWhfbW9kZWwxeGguc2JpbgorIyArVmVyc2lvbjogMjAyMy04LTIzCisjICAKKyMgIExpY2Vuc2U6
IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UuYW1kLXNldiBmb3IgZGV0YWlscworIyAgCisj
IEBAIC0zOTA5LDIxICszOTc3LDE2IEBACisjICAKKyMgIERyaXZlcjogbWljcm9jb2RlX2FtZCAt
IEFNRCBDUFUgTWljcm9jb2RlIFVwZGF0ZSBEcml2ZXIgZm9yIExpbnV4CisjICAKKyMgLUZpbGU6
IGFtZC11Y29kZS9taWNyb2NvZGVfYW1kLmJpbgorIyAtUmF3OiBhbWQtdWNvZGUvbWljcm9jb2Rl
X2FtZC5iaW4KKyMgK1Jhd0ZpbGU6IGFtZC11Y29kZS9taWNyb2NvZGVfYW1kLmJpbgorIyAgVmVy
c2lvbjogMjAxMy0wNy0xMAorIyAtRmlsZTogYW1kLXVjb2RlL21pY3JvY29kZV9hbWRfZmFtMTVo
LmJpbgorIyAtUmF3OiBhbWQtdWNvZGUvbWljcm9jb2RlX2FtZF9mYW0xNWguYmluCisjICtSYXdG
aWxlOiBhbWQtdWNvZGUvbWljcm9jb2RlX2FtZF9mYW0xNWguYmluCisjICBWZXJzaW9uOiAyMDE4
LTA1LTI0CisjIC1GaWxlOiBhbWQtdWNvZGUvbWljcm9jb2RlX2FtZF9mYW0xNmguYmluCisjIC1S
YXc6IGFtZC11Y29kZS9taWNyb2NvZGVfYW1kX2ZhbTE2aC5iaW4KKyMgK1Jhd0ZpbGU6IGFtZC11
Y29kZS9taWNyb2NvZGVfYW1kX2ZhbTE2aC5iaW4KKyMgIFZlcnNpb246IDIwMTQtMTAtMjgKKyMg
LUZpbGU6IGFtZC11Y29kZS9taWNyb2NvZGVfYW1kX2ZhbTE3aC5iaW4KKyMgLVJhdzogYW1kLXVj
b2RlL21pY3JvY29kZV9hbWRfZmFtMTdoLmJpbgorIyArUmF3RmlsZTogYW1kLXVjb2RlL21pY3Jv
Y29kZV9hbWRfZmFtMTdoLmJpbgorIyAgVmVyc2lvbjogMjAyMy0wNy0xOQorIyAtRmlsZTogYW1k
LXVjb2RlL21pY3JvY29kZV9hbWRfZmFtMTloLmJpbgorIyAtUmF3OiBhbWQtdWNvZGUvbWljcm9j
b2RlX2FtZF9mYW0xOWguYmluCisjIC1WZXJzaW9uOiAyMDIzLTA3LTE4CisjICtSYXdGaWxlOiBh
bWQtdWNvZGUvbWljcm9jb2RlX2FtZF9mYW0xOWguYmluCisjICtWZXJzaW9uOiAyMDIzLTEwLTE5
CisjICBGaWxlOiBhbWQtdWNvZGUvUkVBRE1FCisjICAKKyMgIExpY2Vuc2U6IFJlZGlzdHJpYnV0
YWJsZS4gU2VlIExJQ0VOU0UuYW1kLXVjb2RlIGZvciBkZXRhaWxzCisjIEBAIC00NjEzLDcgKzQ2
NzYsNyBAQAorIyAgVmVyc2lvbjogR3VDIEFQSS9BUEIgdmVyIDcwLjEuMSBmb3IgVGlnZXJsYWtl
CisjICAKKyMgIEZpbGU6IGk5MTUvdGdsX2d1Y183MC5iaW4KKyMgLVZlcnNpb246IEd1QyBBUEkv
QVBCIHZlciA3MC41LjEgZm9yIFRpZ2VybGFrZQorIyArVmVyc2lvbjogR3VDIEFQSS9BUEIgdmVy
IDcwLjEzLjEgZm9yIFRpZ2VybGFrZQorIyAgCisjICBGaWxlOiBpOTE1L3RnbF9odWNfNy4wLjMu
YmluCisjICBWZXJzaW9uOiBIdWMgQVBJL0FQQiB2ZXIgNyByZWxlYXNlIDAgZm9yIFRpZ2VybGFr
ZQorIyBAQCAtNDY5NCw3ICs0NzU3LDcgQEAKKyMgIFZlcnNpb246IEd1QyBBUEkvQVBCIHZlciA3
MC4xLjEgZm9yIEFsZGVybGFrZSBQCisjICAKKyMgIEZpbGU6IGk5MTUvYWRscF9ndWNfNzAuYmlu
CisjIC1WZXJzaW9uOiBHdUMgQVBJL0FQQiB2ZXIgNzAuNS4xIGZvciBBbGRlcmxha2UgUAorIyAr
VmVyc2lvbjogR3VDIEFQSS9BUEIgdmVyIDcwLjEzLjEgZm9yIEFsZGVybGFrZSBQCisjICAKKyMg
IEZpbGU6IGk5MTUvZGcyX2d1Y183MC4xLjIuYmluCisjICBWZXJzaW9uOiBHdUMgQVBJL0FQQiB2
ZXIgNzAuMS4yIGZvciBERzIKKyMgQEAgLTQ3MDMsNyArNDc2Niw3IEBACisjICBWZXJzaW9uOiBH
dUMgQVBJL0FQQiB2ZXIgNzAuNC4xIGZvciBERzIKKyMgIAorIyAgRmlsZTogaTkxNS9kZzJfZ3Vj
XzcwLmJpbgorIyAtVmVyc2lvbjogR3VDIEFQSS9BUEIgdmVyIDcwLjguMCBmb3IgREcyCisjICtW
ZXJzaW9uOiBHdUMgQVBJL0FQQiB2ZXIgNzAuMTMuMSBmb3IgREcyCisjICAKKyMgIEZpbGU6IGk5
MTUvZGcyX2h1Y19nc2MuYmluCisjICBWZXJzaW9uOiBIdUMgQVBJL0FQQiB2ZXIgNy4xMC4zIGZv
ciBERzIKKyMgQEAgLTQ3MjEsMTMgKzQ3ODQsMTYgQEAKKyMgIFZlcnNpb246IERNQyBBUEkvQVBC
IHZlciAyIHJlbGVhc2UgMTAgZm9yIE1ldGVvcmxha2UKKyMgIAorIyAgRmlsZTogaTkxNS9tdGxf
ZG1jLmJpbgorIyAtVmVyc2lvbjogRE1DIEFQSS9BUEIgdmVyIDIgcmVsZWFzZSAxMyBmb3IgTWV0
ZW9ybGFrZQorIyArVmVyc2lvbjogRE1DIEFQSS9BUEIgdmVyIDIgcmVsZWFzZSAxNyBmb3IgTWV0
ZW9ybGFrZQorIyAgCisjICBGaWxlOiBpOTE1L210bF9ndWNfNzAuYmluCisjIC1WZXJzaW9uOiBH
dUMgQVBJL0FQQiB2ZXIgNzAuOC4wIGZvciBNZXRlb3JsYWtlCisjICtWZXJzaW9uOiBHdUMgQVBJ
L0FQQiB2ZXIgNzAuMTMuMSBmb3IgTWV0ZW9ybGFrZQorIyAgCisjICBGaWxlOiBpOTE1L210bF9o
dWNfZ3NjLmJpbgorIyAtVmVyc2lvbjogSHVDIEFQSS9BUEIgdmVyIDguNS4xIGZvciBNZXRlb3Js
YWtlCisjICtWZXJzaW9uOiBIdUMgQVBJL0FQQiB2ZXIgOC41LjQgZm9yIE1ldGVvcmxha2UKKyMg
KworIyArRmlsZTogaTkxNS9tdGxfZ3NjXzEuYmluCisjICtWZXJzaW9uOiBHU0MgQVBJL0FQQiB2
MS4wLCByZWxlYXNlIDEwMi4wLjAuMTY1NSwgU1ZOIDEgZm9yIE1ldGVvcmxha2UKKyMgIAorIyAg
TGljZW5zZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5pOTE1IGZvciBkZXRhaWxzCisj
ICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQorIyBAQCAtNTU0OCw2ICs1NjE0LDEwIEBACisjICAKKyMgIFZl
cnNpb246IDUuNC0wMDA1MworIyAgCisjICtGaWxlOiBxY29tL3ZlbnVzLTYuMC92ZW51cy5tYm4K
KyMgKworIyArVmVyc2lvbjogVklERU8uVkUuNi4wLTAwMDQ5LVBST0QtMQorIyArCisjICBGaWxl
OiBxY29tL3ZwdS0xLjAvdmVudXMubWJuCisjICBMaW5rOiBxY29tL3ZwdS0xLjAvdmVudXMubWR0
IC0+IHZlbnVzLm1ibgorIyAgCisjIEBAIC01NTk4LDYgKzU2NjgsNyBAQAorIyAgRmlsZTogcWNv
bS9zbTgyNTAvYTY1MF96YXAubWJuCisjICBGaWxlOiBxY29tL2E2NjBfZ211LmJpbgorIyAgRmls
ZTogcWNvbS9hNjYwX3NxZS5mdworIyArRmlsZTogcWNvbS9hNzAyX3NxZS5mdworIyAgRmlsZTog
cWNvbS9sZWlhX3BmcF80NzAuZncKKyMgIEZpbGU6IHFjb20vbGVpYV9wbTRfNDcwLmZ3CisjICBG
aWxlOiBxY29tL3NjODI4MHhwL0xFTk9WTy8yMUJYL3FjZHhrbXN1YzgyODAubWJuCisjIEBAIC01
NjI5LDI4ICs1NzAwLDUxIEBACisjICBGaWxlOiBxY29tL2FwcTgwMTYvd2Nuc3MubWJuCisjICBG
aWxlOiBxY29tL2FwcTgwMTYvV0NOU1NfcWNvbV93bGFuX252X3NiYy5iaW4KKyMgIEZpbGU6IHFj
b20vYXBxODA5Ni9hZHNwLm1ibgorIyAtRmlsZTogcWNvbS9hcHE4MDk2L2Fkc3ByLmpzbgorIyAt
RmlsZTogcWNvbS9hcHE4MDk2L2Fkc3B1YS5qc24KKyMgK1Jhd0ZpbGU6IHFjb20vYXBxODA5Ni9h
ZHNwci5qc24KKyMgK1Jhd0ZpbGU6IHFjb20vYXBxODA5Ni9hZHNwdWEuanNuCisjICBGaWxlOiBx
Y29tL2FwcTgwOTYvbWJhLm1ibgorIyAgRmlsZTogcWNvbS9hcHE4MDk2L21vZGVtLm1ibgorIyAt
RmlsZTogcWNvbS9hcHE4MDk2L21vZGVtci5qc24KKyMgK1Jhd0ZpbGU6IHFjb20vYXBxODA5Ni9t
b2RlbXIuanNuCisjICtGaWxlOiBxY29tL3FjbTIyOTAvYTcwMl96YXAubWJuCisjICtGaWxlOiBx
Y29tL3FjbTIyOTAvYWRzcC5tYm4KKyMgK1Jhd0ZpbGU6IHFjb20vcWNtMjI5MC9hZHNwci5qc24K
KyMgK1Jhd0ZpbGU6IHFjb20vcWNtMjI5MC9hZHNwcy5qc24KKyMgK1Jhd0ZpbGU6IHFjb20vcWNt
MjI5MC9hZHNwdWEuanNuCisjICtGaWxlOiBxY29tL3FjbTIyOTAvbW9kZW0ubWJuCisjICtSYXdG
aWxlOiBxY29tL3FjbTIyOTAvbW9kZW1yLmpzbgorIyArUmF3RmlsZTogcWNvbS9xY20yMjkwL21v
ZGVtdXcuanNuCisjICtGaWxlOiBxY29tL3FjbTIyOTAvd2xhbm1kc3AubWJuCisjICtGaWxlOiBx
Y29tL3FyYjQyMTAvYTYxMF96YXAubWJuCisjICtGaWxlOiBxY29tL3FyYjQyMTAvYWRzcC5tYm4K
KyMgK1Jhd0ZpbGU6IHFjb20vcXJiNDIxMC9hZHNwci5qc24KKyMgK1Jhd0ZpbGU6IHFjb20vcXJi
NDIxMC9hZHNwcy5qc24KKyMgK1Jhd0ZpbGU6IHFjb20vcXJiNDIxMC9hZHNwdWEuanNuCisjICtG
aWxlOiBxY29tL3FyYjQyMTAvY2RzcC5tYm4KKyMgK1Jhd0ZpbGU6IHFjb20vcXJiNDIxMC9jZHNw
ci5qc24KKyMgK0ZpbGU6IHFjb20vcXJiNDIxMC9tb2RlbS5tYm4KKyMgK1Jhd0ZpbGU6IHFjb20v
cXJiNDIxMC9tb2RlbXIuanNuCisjICtSYXdGaWxlOiBxY29tL3FyYjQyMTAvbW9kZW11dy5qc24K
KyMgK0xpbms6IHFjb20vcXJiNDIxMC93bGFubWRzcC5tYm4gLT4gLi4vcWNtMjI5MC93bGFubWRz
cC5tYm4KKyMgIEZpbGU6IHFjb20vc2RtODQ1L2Fkc3AubWJuCisjIC1GaWxlOiBxY29tL3NkbTg0
NS9hZHNwci5qc24KKyMgLUZpbGU6IHFjb20vc2RtODQ1L2Fkc3B1YS5qc24KKyMgK1Jhd0ZpbGU6
IHFjb20vc2RtODQ1L2Fkc3ByLmpzbgorIyArUmF3RmlsZTogcWNvbS9zZG04NDUvYWRzcHVhLmpz
bgorIyAgRmlsZTogcWNvbS9zZG04NDUvY2RzcC5tYm4KKyMgLUZpbGU6IHFjb20vc2RtODQ1L2Nk
c3ByLmpzbgorIyArUmF3RmlsZTogcWNvbS9zZG04NDUvY2RzcHIuanNuCisjICBGaWxlOiBxY29t
L3NkbTg0NS9UaHVuZGVyY29tbS9kYjg0NWMvc2xwaS5tYm4KKyMgLUZpbGU6IHFjb20vc2RtODQ1
L1RodW5kZXJjb21tL2RiODQ1Yy9zbHBpci5qc24KKyMgLUZpbGU6IHFjb20vc2RtODQ1L1RodW5k
ZXJjb21tL2RiODQ1Yy9zbHBpdXMuanNuCisjICtSYXdGaWxlOiBxY29tL3NkbTg0NS9UaHVuZGVy
Y29tbS9kYjg0NWMvc2xwaXIuanNuCisjICtSYXdGaWxlOiBxY29tL3NkbTg0NS9UaHVuZGVyY29t
bS9kYjg0NWMvc2xwaXVzLmpzbgorIyAgRmlsZTogcWNvbS9zbTgyNTAvYWRzcC5tYm4KKyMgLUZp
bGU6IHFjb20vc204MjUwL2Fkc3ByLmpzbgorIyAtRmlsZTogcWNvbS9zbTgyNTAvYWRzcHVhLmpz
bgorIyArUmF3RmlsZTogcWNvbS9zbTgyNTAvYWRzcHIuanNuCisjICtSYXdGaWxlOiBxY29tL3Nt
ODI1MC9hZHNwdWEuanNuCisjICBGaWxlOiBxY29tL3NtODI1MC9jZHNwLm1ibgorIyAtRmlsZTog
cWNvbS9zbTgyNTAvY2RzcHIuanNuCisjIC1GaWxlOiBxY29tL3NjODI4MHhwL0xFTk9WTy8yMUJY
L2Fkc3ByLmpzbgorIyAtRmlsZTogcWNvbS9zYzgyODB4cC9MRU5PVk8vMjFCWC9hZHNwdWEuanNu
CisjIC1GaWxlOiBxY29tL3NjODI4MHhwL0xFTk9WTy8yMUJYL2JhdHRtZ3IuanNuCisjIC1GaWxl
OiBxY29tL3NjODI4MHhwL0xFTk9WTy8yMUJYL2Nkc3ByLmpzbgorIyArUmF3RmlsZTogcWNvbS9z
bTgyNTAvY2RzcHIuanNuCisjICtGaWxlOiBxY29tL3NtODI1MC9UaHVuZGVyY29tbS9SQjUvc2xw
aS5tYm4KKyMgK1Jhd0ZpbGU6IHFjb20vc204MjUwL1RodW5kZXJjb21tL1JCNS9zbHBpci5qc24K
KyMgK1Jhd0ZpbGU6IHFjb20vc204MjUwL1RodW5kZXJjb21tL1JCNS9zbHBpdXMuanNuCisjICtS
YXdGaWxlOiBxY29tL3NjODI4MHhwL0xFTk9WTy8yMUJYL2Fkc3ByLmpzbgorIyArUmF3RmlsZTog
cWNvbS9zYzgyODB4cC9MRU5PVk8vMjFCWC9hZHNwdWEuanNuCisjICtSYXdGaWxlOiBxY29tL3Nj
ODI4MHhwL0xFTk9WTy8yMUJYL2JhdHRtZ3IuanNuCisjICtSYXdGaWxlOiBxY29tL3NjODI4MHhw
L0xFTk9WTy8yMUJYL2Nkc3ByLmpzbgorIyAgRmlsZTogcWNvbS9zYzgyODB4cC9MRU5PVk8vMjFC
WC9xY2Fkc3A4MjgwLm1ibgorIyAgRmlsZTogcWNvbS9zYzgyODB4cC9MRU5PVk8vMjFCWC9xY2Nk
c3A4MjgwLm1ibgorIyAgRmlsZTogcWNvbS9zYzgyODB4cC9MRU5PVk8vMjFCWC9xY3NscGk4Mjgw
Lm1ibgorIyBAQCAtNTY2MCw2ICs1NzU0LDggQEAKKyMgIEJpbmFyeSBmaWxlcyBzdXBwbGllZCBv
cmlnaW5hbGx5IGZyb20KKyMgIGh0dHA6Ly9yZWxlYXNlcy5saW5hcm8ub3JnLzk2Ym9hcmRzL2Ry
YWdvbmJvYXJkNDEwYy9xdWFsY29tbS9maXJtd2FyZS9saW51eC1ib2FyZC1zdXBwb3J0LXBhY2th
Z2UtcjEwMzYuMS56aXAKKyMgIGh0dHA6Ly9yZWxlYXNlcy5saW5hcm8ub3JnLzk2Ym9hcmRzL2Ry
YWdvbmJvYXJkODQ1Yy9xdWFsY29tbS9maXJtd2FyZS9SQjNfZmlybXdhcmVfMjAyMjExMjEwMDAw
MDAtdjUuemlwCisjICtodHRwczovL3JlbGVhc2VzLmxpbmFyby5vcmcvOTZib2FyZHMvcmIxL3F1
YWxjb21tL2Zpcm13YXJlL1JCMV9maXJtd2FyZV8yMDIzMDgyMy12Mi56aXAKKyMgK2h0dHBzOi8v
cmVsZWFzZXMubGluYXJvLm9yZy85NmJvYXJkcy9yYjIvcXVhbGNvbW0vZmlybXdhcmUvUkIyX2Zp
cm13YXJlXzIwMjMwODIzLXYyLnppcAorIyAgaHR0cDovL3JlbGVhc2VzLmxpbmFyby5vcmcvOTZi
b2FyZHMvcmI1L3F1YWxjb21tL2Zpcm13YXJlL1JCNV9maXJtd2FyZV8yMDIxMDMzMS12NC56aXAK
KyMgIAorIyAgYWRzcC5tYm4gaGFzIGJlZW4gY29udmVydGVkIGZyb20gMjAtYWRzcF9zcGxpdC9m
aXJtd2FyZS9hZHNwLiogdXNpbmcKKyMgQEAgLTU2NzQsNyArNTc3MCw3IEBACisjICAKKyMgIEZp
bGU6IHFjb20vc2RtODQ1L21iYS5tYm4KKyMgIEZpbGU6IHFjb20vc2RtODQ1L21vZGVtX25tLm1i
bgorIyAtRmlsZTogcWNvbS9zZG04NDUvbW9kZW11dy5qc24KKyMgK1Jhd0ZpbGU6IHFjb20vc2Rt
ODQ1L21vZGVtdXcuanNuCisjICBMaW5rOiBxY29tL3NkbTg0NS9tb2RlbS5tYm4gLT4gbW9kZW1f
bm0ubWJuCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UucWNv
bSBhbmQgcWNvbS9OT1RJQ0UudHh0IGZvciBkZXRhaWxzCisjIEBAIC02MDQ1LDYgKzYxNDEsMzUg
QEAKKyMgIEZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTAzYzg5ODEtcjEuYmlu
CisjICBGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwM2M4OTgxLWwwLmJpbgor
IyAgRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDNjODk4MS1sMS5iaW4KKyMg
K0ZpbGU6IGNpcnJ1cy9jczM1bDQxL3Y2LjgzLjAvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS44NS4w
LndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhjNDYud21m
dyAtPiBjczM1bDQxL3Y2LjgzLjAvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS44NS4wLndtZncKKyMg
K0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTAzYzhjNDYud21mdyAtPiBjczM1
bDQxL3Y2LjgzLjAvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS44NS4wLndtZncKKyMgK0xpbms6IGNp
cnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhjNDcud21mdyAtPiBjczM1bDQxL3Y2Ljgz
LjAvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS44NS4wLndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1
bDQxLWRzcDEtc3BrLWNhbGktMTAzYzhjNDcud21mdyAtPiBjczM1bDQxL3Y2LjgzLjAvaGFsb19j
c3BsX1JBTV9yZXZCMl8yOS44NS4wLndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEt
c3BrLXByb3QtMTAzYzhjNDgud21mdyAtPiBjczM1bDQxL3Y2LjgzLjAvaGFsb19jc3BsX1JBTV9y
ZXZCMl8yOS44NS4wLndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGkt
MTAzYzhjNDgud21mdyAtPiBjczM1bDQxL3Y2LjgzLjAvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS44
NS4wLndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhjNDku
d21mdyAtPiBjczM1bDQxL3Y2LjgzLjAvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS44NS4wLndtZncK
KyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTAzYzhjNDkud21mdyAtPiBj
czM1bDQxL3Y2LjgzLjAvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS44NS4wLndtZncKKyMgK0xpbms6
IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhjNzAud21mdyAtPiBjczM1bDQxL3Y2
LjgzLjAvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS44NS4wLndtZncKKyMgK0xpbms6IGNpcnJ1cy9j
czM1bDQxLWRzcDEtc3BrLWNhbGktMTAzYzhjNzAud21mdyAtPiBjczM1bDQxL3Y2LjgzLjAvaGFs
b19jc3BsX1JBTV9yZXZCMl8yOS44NS4wLndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRz
cDEtc3BrLXByb3QtMTAzYzhjNzEud21mdyAtPiBjczM1bDQxL3Y2LjgzLjAvaGFsb19jc3BsX1JB
TV9yZXZCMl8yOS44NS4wLndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNh
bGktMTAzYzhjNzEud21mdyAtPiBjczM1bDQxL3Y2LjgzLjAvaGFsb19jc3BsX1JBTV9yZXZCMl8y
OS44NS4wLndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhj
NzIud21mdyAtPiBjczM1bDQxL3Y2LjgzLjAvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS44NS4wLndt
ZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTAzYzhjNzIud21mdyAt
PiBjczM1bDQxL3Y2LjgzLjAvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS44NS4wLndtZncKKyMgK0Zp
bGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhjNDYuYmluCisjICtGaWxlOiBj
aXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwM2M4YzQ2LmJpbgorIyArRmlsZTogY2lycnVz
L2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGM0Ny5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1
bDQxLWRzcDEtc3BrLWNhbGktMTAzYzhjNDcuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1k
c3AxLXNway1wcm90LTEwM2M4YzQ4LmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1z
cGstY2FsaS0xMDNjOGM0OC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXBy
b3QtMTAzYzhjNDkuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEw
M2M4YzQ5LmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGM3
MC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4YzQ2LmJpbgorIyArTGluazogY2ly
cnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDNjOGM3MC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNw
ay1jYWxpLTEwM2M4YzQ2LmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJv
dC0xMDNjOGM3MS5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4YzQ3LmJpbgorIyAr
TGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDNjOGM3MS5iaW4gLT4gY3MzNWw0
MS1kc3AxLXNway1jYWxpLTEwM2M4YzQ3LmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNw
MS1zcGstcHJvdC0xMDNjOGM3Mi5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4YzQ4
LmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDNjOGM3Mi5iaW4g
LT4gY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwM2M4YzQ4LmJpbgorIyAgRmlsZTogY2lycnVzL2Nz
MzVsNDEvdjYuMzkuMC9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjQxLjAud21mdworIyAgTGluazog
Y2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xN2FhMzg0Ny53bWZ3IC0+IGNzMzVsNDEvdjYu
MzkuMC9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjQxLjAud21mdworIyAgTGluazogY2lycnVzL2Nz
MzVsNDEtZHNwMS1zcGstY2FsaS0xN2FhMzg0Ny53bWZ3IC0+IGNzMzVsNDEvdjYuMzkuMC9oYWxv
X2NzcGxfUkFNX3JldkIyXzI5LjQxLjAud21mdworIyBAQCAtNjU2Nyw4ICs2NjkyLDE3IEBACisj
ICAKKyMgIERyaXZlcjogcWNvbS1zYzgyODB4cCAtIFF1YWxjb21tIEFTb0MgdHBsZyBGaXJtd2Fy
ZQorIyAgRmlsZTogcWNvbS9zYzgyODB4cC9MRU5PVk8vMjFCWC9hdWRpb3JlYWNoLXRwbGcuYmlu
CisjICtMaW5rOiBxY29tL3NjODI4MHhwL1NDODI4MFhQLUxFTk9WTy1YMTNTLXRwbGcuYmluIC0+
IExFTk9WTy8yMUJYL2F1ZGlvcmVhY2gtdHBsZy5iaW4KKyMgIFZlcnNpb246IHYwLjEuMAorIyAg
CisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLmxpbmFybyBmb3IgZGV0
YWlscworIyAgT3JpZ2luYXRlcyBmcm9tIGh0dHBzOi8vZ2l0LmxpbmFyby5vcmcvcGVvcGxlL3Ny
aW5pdmFzLmthbmRhZ2F0bGEvYXVkaW9yZWFjaC10b3BvbG9neS5naXQKKyMgIC0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCisjICsKKyMgK0RyaXZlcjogYW1sb2dpYyAtIEFtbG9naWMgU29DIEZpcm13YXJlCisj
ICtGaWxlOiBhbWxvZ2ljL2JsdWV0b290aC93Ml9idF9md191YXJ0LmJpbgorIyArVmVyc2lvbjog
ZGF0ZSA9IDM4LjAxLCBudW1iZXIgPSAweGE5MTQKKyMgKworIyArTGljZW5jZTogUmVkaXN0cmli
dXRhYmxlLiBTZWUgTElDRU5TRS5hbWxvZ2ljIGZvciBkZXRhaWxzCisjICsKKyMgKy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCisjIAorIworCiBTVU1NQVJZID0gIkZpcm13YXJlIGZpbGVzIGZvciB1c2Ugd2l0
aCBMaW51eCBrZXJuZWwiCiBIT01FUEFHRSA9ICJodHRwczovL3d3dy5rZXJuZWwub3JnLyIKIERF
U0NSSVBUSU9OID0gIkxpbnV4IGZpcm13YXJlIGlzIGEgcGFja2FnZSBkaXN0cmlidXRlZCBhbG9u
Z3NpZGUgdGhlIExpbnV4IGtlcm5lbCBcCkBAIC0xNDcsNyArNzU0LDcgQEAgTElDX0ZJTEVTX0NI
S1NVTSA9ICJmaWxlOi8vTElDRU5DRS5BYmlsaXM7bWQ1PWI1ZWUzZjQxMDc4MGU1NjcxMWFkNDhl
YWRjMjJiOGJjIFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOQ0UueGM0MDAwO21k
NT0wZmY1MWQyZGM0OWZjZTA0ODE0YzkxNTUwODEwOTJmMCBcCiAgICAgICAgICAgICAgICAgICAg
IGZpbGU6Ly9MSUNFTkNFLnhjNTAwMDttZDU9MWUxNzBjMTMxNzUzMjNjMzJjN2Y0ZDA5OThkNTNm
NjYgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5DRS54YzUwMDBjO21kNT0xMmIw
MmVmYTMwNDlkYjY1ZDUyNGFlYjQxOGRkODdjYSBcCi0gICAgICAgICAgICAgICAgICAgIGZpbGU6
Ly9XSEVOQ0U7bWQ1PSR7V0hFTkNFX0NIS1NVTX0gXAorICAgICAgICAgICAgICAgICAgICBmaWxl
Oi8vV0hFTkNFO21kNT1jZWI1MjQ4NzQ2ZDI0ZDE2NWI2MDNlNzFiMjg4Y2Y3NSBcCiAgICAgICAg
ICAgICAgICAgICAgICIKICMgV0hFTkNFIGNoZWNrc3VtIGlzIGRlZmluZWQgc2VwYXJhdGVseSB0
byBlYXNlIG92ZXJyaWRpbmcgaXQgaWYKICMgY2xhc3MtZGV2dXBzdHJlYW0gaXMgc2VsZWN0ZWQu
CkBAIC0yMzcsNyArODQ0LDcgQEAgU1JDX1VSSTpjbGFzcy1kZXZ1cHN0cmVhbSA9ICJnaXQ6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvZmlybXcKICMgUGluIHRoaXMg
dG8gdGhlIDIwMjIwNTA5IHJlbGVhc2UsIG92ZXJyaWRlIHRoaXMgaW4gbG9jYWwuY29uZgogU1JD
UkVWOmNsYXNzLWRldnVwc3RyZWFtID89ICJiMTljYmRjYTc4YWIyYWRmZDIxMGM5MWJlMTVhMjI1
NjhlOGI4Y2FlIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiODhkNDZjNTQzODQ3ZWUzYjAzNDA0
ZDQ5NDFkOTFjOTI5NzQ2OTBlZTFmNmZkY2JlZTljZWYzZTVmOTdkYjY4OCIKK1NSQ19VUklbc2hh
MjU2c3VtXSA9ICJjOThkMjAwZmM0YTMxMjBkZTFhNTk0NzEzY2UzNGUxMzU4MTlkZmYyM2U4ODNh
NGVkMzg3ODYzYmEyNTY3OWM3IgogCiBpbmhlcml0IGFsbGFyY2gKIAotLSAKMi4zOS4yCgo=

--===============7897568117522403864==--

