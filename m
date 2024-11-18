Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50EF1D591DE
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:18:04 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.4679.1731964633083259581
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:17:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=URHaIFaC;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=VLuEKdo7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101934123a270-c0df92a3-e4fe-484b-b0b8-d2c5a3ee6e6c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964674;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xY6pa+YC+wxhf/Zb8NZ4wXA1aGQDyaATTemrQD8HSX0=;
	b=URHaIFaCbdm0l8SyLW6vpmvGkCGlmObXVM3UcfBZdrE3kiFm3sWv7p5wNlhNCSJy
	Ueynuhi2eSEk+8nuJWnB01KjpZYYn7wY6K4flUOPgTsJcaRg2Rok6eqlGHvFU8+zCi0
	gHHokhChedr0NAhiEiiIBa6glbIBOProEyhad06E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964674;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xY6pa+YC+wxhf/Zb8NZ4wXA1aGQDyaATTemrQD8HSX0=;
	b=VLuEKdo7hxAnTQLpy2crxT8Cs+vFwEdgn4gu6XNZ4L+Hpqbilvxr7nHWd9OXM9SO
	TuFKrP0Vg0svmmZc/ki2vbCpLBhqDkzS6AvCaBcTO0jU1swxOWANMUvt+bxA5XJdBmY
	ElP/R9WKWgPqnL4rbw8ibg7oKiEE11Xb8JkwFRUY=
Content-Type: multipart/mixed; boundary="===============4061189947917792680=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] linux-firmware: upgrading to 20241110 SUCCEEDED
Message-ID: <010101934123a270-c0df92a3-e4fe-484b-b0b8-d2c5a3ee6e6c-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:17:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:18:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207342

--===============4061189947917792680==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *linux-firmware* to *20241110* has Succeeded.

Next steps:
    - apply the patch: git am 0001-linux-firmware-upgrade-20241017-20241110.patch
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
From c4142f0ceace7f0abf51d9e18083f71ef8032719 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 18 Nov 2024 04:13:46 +0000
Subject: [PATCH] linux-firmware: upgrade 20241017 -> 20241110

---
 ...om-Add-link-for-QCS6490-GPU-firmware.patch |  31 ---
 ...20241017.bb => linux-firmware_20241110.bb} | 237 +++++++++++++++++-
 2 files changed, 231 insertions(+), 37 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux-firmware/linux-firmware/0001-qcom-Add-link-for-QCS6490-GPU-firmware.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20241017.bb => linux-firmware_20241110.bb} (89%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware/0001-qcom-Add-link-for-QCS6490-GPU-firmware.patch b/meta/recipes-kernel/linux-firmware/linux-firmware/0001-qcom-Add-link-for-QCS6490-GPU-firmware.patch
deleted file mode 100644
index 7a07ef97f1..0000000000
--- a/meta/recipes-kernel/linux-firmware/linux-firmware/0001-qcom-Add-link-for-QCS6490-GPU-firmware.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 62fa39d0b4384be8f14d837ea79183ad93d0996c Mon Sep 17 00:00:00 2001
-From: Akhil P Oommen <quic_akhilpo@quicinc.com>
-Date: Fri, 1 Nov 2024 21:52:24 +0530
-Subject: [PATCH] qcom: Add link for QCS6490 GPU firmware
-
-Create a symlink between qcom/qcm6490/a660_zap.mbn and
-qcom/qcs6490/a660_zap.mbn.
-
-Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
-Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-Upstream-Status: Submitted [https://lore.kernel.org/linux-firmware/ctvtlkh4t54wdtwcw3jnbyi7xwks534k5ksvjtv6pt2zrr72wn@h5k6vfk7bzqe]
----
- WHENCE | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/WHENCE b/WHENCE
-index bdee94fe33fc..b7ef9bdd5b59 100644
---- a/WHENCE
-+++ b/WHENCE
-@@ -6145,6 +6145,7 @@ File: qcom/sm8250/a650_zap.mbn
- File: qcom/a660_gmu.bin
- File: qcom/a660_sqe.fw
- File: qcom/qcm6490/a660_zap.mbn
-+Link: qcom/qcs6490/a660_zap.mbn -> ../qcm6490/a660_zap.mbn
- File: qcom/a702_sqe.fw
- File: qcom/leia_pfp_470.fw
- File: qcom/leia_pm4_470.fw
--- 
-2.39.5
-
diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20241110.bb
similarity index 89%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20241110.bb
index 708c28b632..e7df2bbaec 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20241110.bb
@@ -1,3 +1,231 @@
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
+# @@ -3313,6 +3313,7 @@
+#  File: rtw88/rtw8821c_fw.bin
+#  File: rtw88/rtw8703b_fw.bin
+#  File: rtw88/rtw8703b_wow_fw.bin
+# +File: rtw88/rtw8812a_fw.bin
+#  
+#  Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
+#  
+# @@ -3775,16 +3776,8 @@
+#  Version: WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
+#  File: ath11k/QCN9074/hw1.0/Notice.txt
+#  File: ath11k/WCN6750/hw1.0/board-2.bin
+# -File: ath11k/WCN6750/hw1.0/wpss.b00
+# -File: ath11k/WCN6750/hw1.0/wpss.b01
+# -File: ath11k/WCN6750/hw1.0/wpss.b02
+# -File: ath11k/WCN6750/hw1.0/wpss.b03
+# -File: ath11k/WCN6750/hw1.0/wpss.b04
+# -File: ath11k/WCN6750/hw1.0/wpss.b05
+# -File: ath11k/WCN6750/hw1.0/wpss.b06
+# -File: ath11k/WCN6750/hw1.0/wpss.b07
+# -File: ath11k/WCN6750/hw1.0/wpss.b08
+# -File: ath11k/WCN6750/hw1.0/wpss.mdt
+# +File: ath11k/WCN6750/hw1.0/sc7280/wpss.mbn
+# +Link: ath11k/WCN6750/hw1.0/wpss.mdt -> sc7280/wpss.mbn
+#  Version: WLAN.MSL.1.0.1-01160-QCAMSLSWPLZ-1
+#  File: ath11k/WCN6750/hw1.0/Notice.txt
+#  File: ath11k/IPQ5018/hw1.0/board-2.bin
+# @@ -4105,9 +4098,13 @@
+#  File: intel/ibt-1040-2120.ddc
+#  Version: BT_SolarJfp_REL151_22.180.2405.151
+#  
+# +File: intel/ibt-0093-0291.sfi
+# +File: intel/ibt-0093-0291.ddc
+# +File: intel/ibt-0093-0041.sfi
+# +File: intel/ibt-0093-0041.ddc
+#  File: intel/ibt-0291-0291.sfi
+#  File: intel/ibt-0291-0291.ddc
+# -Version: BT_BlazarU_S_REL64815_23.80.24332.64815
+# +Version: BT_BlazarU_S_REL67159_23.90.24382.67159
+#  
+#  File: intel/ibt-0180-0041.sfi
+#  File: intel/ibt-0180-0041.ddc
+# @@ -4116,6 +4113,14 @@
+#  File: intel/ibt-0180-1050.sfi
+#  File: intel/ibt-0180-1050.ddc
+#  Version: BT_Magnetar_REL103427_23.50.24332.103427
+# +
+# +File: intel/ibt-0190-0291.sfi
+# +File: intel/ibt-0190-0291-iml.sfi
+# +File: intel/ibt-0190-0291.ddc
+# +File: intel/ibt-0190-0041.sfi
+# +File: intel/ibt-0190-0041-iml.sfi
+# +File: intel/ibt-0190-0041.ddc
+# +Version: BT_BlazarI_S_REL64160_23.70.24233.64160
+#  
+#  Licence: Redistributable. See LICENCE.ibt_firmware for details
+#  
+# @@ -5108,13 +5113,16 @@
+#  Version: HuC API/APB ver 8.5.4 for Meteorlake
+#  
+#  File: i915/mtl_gsc_1.bin
+# -Version: GSC API/APB v1.0, release 102.0.10.1878, SVN 1 for Meteorlake
+# +Version: GSC API/APB v1.0, release 102.1.15.1926, SVN 1 for Meteorlake
+#  
+#  File: i915/bmg_dmc.bin
+#  Version: DMC API/APB ver 2 release 6 for Battlemage
+#  
+#  File: i915/xe2lpd_dmc.bin
+# -Version: DMC API/APB ver 2 release 21 for Xe2LPD
+# +Version: DMC API/APB ver 2 release 23 for Xe2LPD
+# +
+# +File: i915/xe3lpd_dmc.bin
+# +Version: DMC API/APB ver 2 release 13 for Xe3LPD
+#  
+#  License: Redistributable. See LICENSE.i915 for details
+#  --------------------------------------------------------------------------
+# @@ -5122,7 +5130,7 @@
+#  Driver: xe -- Intel Graphics driver
+#  
+#  File: xe/lnl_gsc_1.bin
+# -Version: GSC API/APB v1.0, release 104.0.0.1161, SVN 1 for Lunarlake
+# +Version: GSC API/APB v1.0, release 104.0.0.1263, SVN 1 for Lunarlake
+#  
+#  File: xe/lnl_guc_70.bin
+#  Version: GuC API/APB ver 70.29.2 for Lunarlake
+# @@ -5829,9 +5837,9 @@
+#  Driver: mt7920 - MediaTek MT7920 Wireless MACs
+#  
+#  File: mediatek/WIFI_MT7961_patch_mcu_1a_2_hdr.bin
+# -Version: 20240930111002a
+# +Version: 20241104091014a
+#  File: mediatek/WIFI_RAM_CODE_MT7961_1a.bin
+# -Version: 20240930111041
+# +Version: 20241104090857
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -5840,7 +5848,7 @@
+#  Driver: mt7920 - MediaTek MT7920 bluetooth chipset
+#  
+#  File: mediatek/BT_RAM_CODE_MT7961_1a_2_hdr.bin
+# -Version: 20240930111457
+# +Version: 20241104091246
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -5889,9 +5897,9 @@
+#  Driver: mt7925 - MediaTek MT7925 Wireless MACs
+#  
+#  File: mediatek/mt7925/WIFI_MT7925_PATCH_MCU_1_1_hdr.bin
+# -Version: 20240816132951a
+# +Version: 20241104132949a
+#  File: mediatek/mt7925/WIFI_RAM_CODE_MT7925_1_1.bin
+# -Version: 20240816133044
+# +Version: 20241104132855
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -5900,7 +5908,7 @@
+#  Driver: mt7925 - MediaTek MT7925 bluetooth chipset
+#  
+#  File: mediatek/mt7925/BT_RAM_CODE_MT7925_1_1_hdr.bin
+# -Version: 20240816133202
+# +Version: 20241104133214
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -6199,6 +6207,7 @@
+#  File: qcom/x1e80100/gen70500_zap.mbn
+#  File: qcom/a663_gmu.bin
+#  File: qcom/sa8775p/a663_zap.mbn
+# +File: qcom/qcs615/a612_zap.mbn
+#  
+#  Licence: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
+#  
+# @@ -6290,6 +6299,13 @@
+#  File: qcom/sc8280xp/LENOVO/21BX/qcadsp8280.mbn
+#  File: qcom/sc8280xp/LENOVO/21BX/qccdsp8280.mbn
+#  File: qcom/sc8280xp/LENOVO/21BX/qcslpi8280.mbn
+# +File: qcom/x1e80100/adsp.mbn
+# +File: qcom/x1e80100/adsp_dtb.mbn
+# +Version: ADSP.HT.5.9-00796-HAMOA-1
+# +RawFile: qcom/x1e80100/adspr.jsn
+# +RawFile: qcom/x1e80100/adsps.jsn
+# +RawFile: qcom/x1e80100/adspua.jsn
+# +RawFile: qcom/x1e80100/battmgr.jsn
+#  
+#  Licence: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
+#  
+# @@ -7316,6 +7332,16 @@
+#  File: cirrus/cs35l41-dsp1-spk-prot-10280c4d-spkid1-r0.bin
+#  File: cirrus/cs35l41-dsp1-spk-prot-10280c4d-spkid1-l1.bin
+#  File: cirrus/cs35l41-dsp1-spk-prot-10280c4d-spkid1-r1.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8cdf.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8ce0.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +File: cirrus/cs35l41-dsp1-spk-prot-103c8cdf-spkid0-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8cdf-spkid0-r0.bin -> cs35l41-dsp1-spk-prot-103c8cdf-spkid0-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8ce0-spkid0-l0.bin -> cs35l41-dsp1-spk-prot-103c8cdf-spkid0-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8ce0-spkid0-r0.bin -> cs35l41-dsp1-spk-prot-103c8cdf-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-103c8cdf-spkid1-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8cdf-spkid1-r0.bin -> cs35l41-dsp1-spk-prot-103c8cdf-spkid1-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8ce0-spkid1-l0.bin -> cs35l41-dsp1-spk-prot-103c8cdf-spkid1-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8ce0-spkid1-r0.bin -> cs35l41-dsp1-spk-prot-103c8cdf-spkid1-l0.bin
+#  
+#  License: Redistributable. See LICENSE.cirrus for details.
+#  
+# @@ -7334,6 +7360,7 @@
+#  File: cirrus/cs35l56/CS35L56_Rev3.11.16.wmfw
+#  File: cirrus/cs35l56/CS35L56_Rev3.11.18.wmfw
+#  File: cirrus/cs35l56/CS35L56_Rev3.11.20.wmfw
+# +File: cirrus/cs35l56/CS35L56_Rev3.11.25.wmfw
+#  Link: cirrus/cs35l54-b0-dsp1-misc-103c8d01.wmfw -> cs35l56/CS35L56_Rev3.11.18.wmfw
+#  File: cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp1.bin
+#  File: cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp2.bin
+# @@ -7374,6 +7401,30 @@
+#  File: cirrus/cs35l56-b0-dsp1-misc-10280c6b-spkid1-amp2.bin
+#  File: cirrus/cs35l56-b0-dsp1-misc-10280c6b-spkid1-amp3.bin
+#  File: cirrus/cs35l56-b0-dsp1-misc-10280c6b-spkid1-amp4.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid0.wmfw -> cs35l56/CS35L56_Rev3.11.25.wmfw
+# +File: cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid0-ampl.bin
+# +File: cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid0-ampr.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid1.wmfw -> cs35l56/CS35L56_Rev3.11.25.wmfw
+# +File: cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid1-ampl.bin
+# +File: cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid1-ampr.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid2.wmfw -> cs35l56/CS35L56_Rev3.11.25.wmfw
+# +File: cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid2-ampl.bin
+# +File: cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid2-ampr.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid3.wmfw -> cs35l56/CS35L56_Rev3.11.25.wmfw
+# +File: cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid3-ampl.bin
+# +File: cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid3-ampr.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid0.wmfw -> cs35l56/CS35L56_Rev3.11.25.wmfw
+# +File: cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid0-ampl.bin
+# +File: cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid0-ampr.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid1.wmfw -> cs35l56/CS35L56_Rev3.11.25.wmfw
+# +File: cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid1-ampl.bin
+# +File: cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid1-ampr.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid2.wmfw -> cs35l56/CS35L56_Rev3.11.25.wmfw
+# +File: cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid2-ampl.bin
+# +File: cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid2-ampr.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid3.wmfw -> cs35l56/CS35L56_Rev3.11.25.wmfw
+# +File: cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid3-ampl.bin
+# +File: cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid3-ampr.bin
+#  Link: cirrus/cs35l56-b0-dsp1-misc-103c8c52.wmfw -> cs35l56/CS35L56_Rev3.11.16.wmfw
+#  File: cirrus/cs35l56-b0-dsp1-misc-103c8c52-amp1.bin
+#  File: cirrus/cs35l56-b0-dsp1-misc-103c8c52-amp2.bin
+# @@ -7530,6 +7581,9 @@
+#  File: mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682.tplg
+#  Version: v0.4.2
+#  
+# +File: mediatek/sof-tplg/sof-mt8195-mt6359-max98390-rt5682.tplg
+# +Version: v0.4.3
+# +
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+#  --------------------------------------------------------------------------
+# 
+#
+
 SUMMARY = "Firmware files for use with Linux kernel"
 HOMEPAGE = "https://www.kernel.org/"
 DESCRIPTION = "Linux firmware is a package distributed alongside the Linux kernel \
@@ -154,7 +382,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
                     file://wfx/LICENCE.wf200;md5=4d1beff00d902c05c9c7e95a5d8eb52d \
-                    file://WHENCE;md5=${WHENCE_CHKSUM} \
+                    file://WHENCE;md5=cc90b04cb170ac983b67b00f4ec8f73d \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
@@ -238,17 +466,14 @@ NO_GENERIC_LICENSE[WHENCE] = "WHENCE"
 
 PE = "1"
 
-SRC_URI = "\
-  ${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz \
-  file://0001-qcom-Add-link-for-QCS6490-GPU-firmware.patch \
-"
+SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
 BBCLASSEXTEND = "devupstream:target"
 SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git;protocol=https;branch=main"
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "a26c38ef5a83272f2b98ce8bf8ca1865a852a3deea49ce5a8dd804b914351273"
+SRC_URI[sha256sum] = "32e6d3eb5c7fcb69fe5d58976c6deafa0d6552719c6e74835064aff049d25bd7"
 
 inherit allarch
 
-- 
2.44.1


--===============4061189947917792680==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-linux-firmware-upgrade-20241017-20241110.patch"

RnJvbSBjNDE0MmYwY2VhY2U3ZjBhYmY1MWQ5ZTE4MDgzZjcxZWY4MDMyNzE5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTggTm92IDIwMjQgMDQ6MTM6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aW51eC1maXJtd2FyZTogdXBncmFkZSAyMDI0MTAxNyAtPiAyMDI0MTExMAoKLS0tCiAuLi5vbS1B
ZGQtbGluay1mb3ItUUNTNjQ5MC1HUFUtZmlybXdhcmUucGF0Y2ggfCAgMzEgLS0tCiAuLi4yMDI0
MTAxNy5iYiA9PiBsaW51eC1maXJtd2FyZV8yMDI0MTExMC5iYn0gfCAyMzcgKysrKysrKysrKysr
KysrKystCiAyIGZpbGVzIGNoYW5nZWQsIDIzMSBpbnNlcnRpb25zKCspLCAzNyBkZWxldGlvbnMo
LSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJl
L2xpbnV4LWZpcm13YXJlLzAwMDEtcWNvbS1BZGQtbGluay1mb3ItUUNTNjQ5MC1HUFUtZmlybXdh
cmUucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL3tsaW51
eC1maXJtd2FyZV8yMDI0MTAxNy5iYiA9PiBsaW51eC1maXJtd2FyZV8yMDI0MTExMC5iYn0gKDg5
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4
LWZpcm13YXJlLzAwMDEtcWNvbS1BZGQtbGluay1mb3ItUUNTNjQ5MC1HUFUtZmlybXdhcmUucGF0
Y2ggYi9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlLzAw
MDEtcWNvbS1BZGQtbGluay1mb3ItUUNTNjQ5MC1HUFUtZmlybXdhcmUucGF0Y2gKZGVsZXRlZCBm
aWxlIG1vZGUgMTAwNjQ0CmluZGV4IDdhMDdlZjk3ZjEuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9y
ZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZS8wMDAxLXFjb20tQWRk
LWxpbmstZm9yLVFDUzY0OTAtR1BVLWZpcm13YXJlLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEs
MzEgKzAsMCBAQAotRnJvbSA2MmZhMzlkMGI0Mzg0YmU4ZjE0ZDgzN2VhNzkxODNhZDkzZDA5OTZj
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogQWtoaWwgUCBPb21tZW4gPHF1aWNfYWto
aWxwb0BxdWljaW5jLmNvbT4KLURhdGU6IEZyaSwgMSBOb3YgMjAyNCAyMTo1MjoyNCArMDUzMAot
U3ViamVjdDogW1BBVENIXSBxY29tOiBBZGQgbGluayBmb3IgUUNTNjQ5MCBHUFUgZmlybXdhcmUK
LQotQ3JlYXRlIGEgc3ltbGluayBiZXR3ZWVuIHFjb20vcWNtNjQ5MC9hNjYwX3phcC5tYm4gYW5k
Ci1xY29tL3FjczY0OTAvYTY2MF96YXAubWJuLgotCi1TaWduZWQtb2ZmLWJ5OiBBa2hpbCBQIE9v
bW1lbiA8cXVpY19ha2hpbHBvQHF1aWNpbmMuY29tPgotUmV2aWV3ZWQtYnk6IERtaXRyeSBCYXJ5
c2hrb3YgPGRtaXRyeS5iYXJ5c2hrb3ZAbGluYXJvLm9yZz4KLVNpZ25lZC1vZmYtYnk6IERtaXRy
eSBCYXJ5c2hrb3YgPGRtaXRyeS5iYXJ5c2hrb3ZAbGluYXJvLm9yZz4KLVVwc3RyZWFtLVN0YXR1
czogU3VibWl0dGVkIFtodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1maXJtd2FyZS9jdHZ0
bGtoNHQ1NHdkdHdjdzNqbmJ5aTd4d2tzNTM0azVrc3ZqdHY2cHQyenJyNzJ3bkBoNWs2dmZrN2J6
cWVdCi0tLS0KLSBXSEVOQ0UgfCAxICsKLSAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykK
LQotZGlmZiAtLWdpdCBhL1dIRU5DRSBiL1dIRU5DRQotaW5kZXggYmRlZTk0ZmUzM2ZjLi5iN2Vm
OWJkZDViNTkgMTAwNjQ0Ci0tLS0gYS9XSEVOQ0UKLSsrKyBiL1dIRU5DRQotQEAgLTYxNDUsNiAr
NjE0NSw3IEBAIEZpbGU6IHFjb20vc204MjUwL2E2NTBfemFwLm1ibgotIEZpbGU6IHFjb20vYTY2
MF9nbXUuYmluCi0gRmlsZTogcWNvbS9hNjYwX3NxZS5mdwotIEZpbGU6IHFjb20vcWNtNjQ5MC9h
NjYwX3phcC5tYm4KLStMaW5rOiBxY29tL3FjczY0OTAvYTY2MF96YXAubWJuIC0+IC4uL3FjbTY0
OTAvYTY2MF96YXAubWJuCi0gRmlsZTogcWNvbS9hNzAyX3NxZS5mdwotIEZpbGU6IHFjb20vbGVp
YV9wZnBfNDcwLmZ3Ci0gRmlsZTogcWNvbS9sZWlhX3BtNF80NzAuZncKLS0tIAotMi4zOS41Ci0K
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgtZmly
bXdhcmVfMjAyNDEwMTcuYmIgYi9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xp
bnV4LWZpcm13YXJlXzIwMjQxMTEwLmJiCnNpbWlsYXJpdHkgaW5kZXggODklCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgtZmlybXdhcmVfMjAyNDEw
MTcuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgt
ZmlybXdhcmVfMjAyNDExMTAuYmIKaW5kZXggNzA4YzI4YjYzMi4uZTdkZjJiYmFlYyAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZV8y
MDI0MTAxNy5iYgorKysgYi9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4
LWZpcm13YXJlXzIwMjQxMTEwLmJiCkBAIC0xLDMgKzEsMjMxIEBACisjIEZJWE1FOiB0aGUgTElD
X0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFk
ZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFu
ZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1
ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBt
ZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1V
cGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIwor
IyAtLS0gV0hFTkNFCisjICsrKyBXSEVOQ0UKKyMgQEAgLTMzMTMsNiArMzMxMyw3IEBACisjICBG
aWxlOiBydHc4OC9ydHc4ODIxY19mdy5iaW4KKyMgIEZpbGU6IHJ0dzg4L3J0dzg3MDNiX2Z3LmJp
bgorIyAgRmlsZTogcnR3ODgvcnR3ODcwM2Jfd293X2Z3LmJpbgorIyArRmlsZTogcnR3ODgvcnR3
ODgxMmFfZncuYmluCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VO
Q0UucnRsd2lmaV9maXJtd2FyZS50eHQgZm9yIGRldGFpbHMuCisjICAKKyMgQEAgLTM3NzUsMTYg
KzM3NzYsOCBAQAorIyAgVmVyc2lvbjogV0xBTi5ISy4yLjcuMC4xLTAxNzQ0LVFDQUhLU1dQTF9T
SUxJQ09OWi0xCisjICBGaWxlOiBhdGgxMWsvUUNOOTA3NC9odzEuMC9Ob3RpY2UudHh0CisjICBG
aWxlOiBhdGgxMWsvV0NONjc1MC9odzEuMC9ib2FyZC0yLmJpbgorIyAtRmlsZTogYXRoMTFrL1dD
TjY3NTAvaHcxLjAvd3Bzcy5iMDAKKyMgLUZpbGU6IGF0aDExay9XQ042NzUwL2h3MS4wL3dwc3Mu
YjAxCisjIC1GaWxlOiBhdGgxMWsvV0NONjc1MC9odzEuMC93cHNzLmIwMgorIyAtRmlsZTogYXRo
MTFrL1dDTjY3NTAvaHcxLjAvd3Bzcy5iMDMKKyMgLUZpbGU6IGF0aDExay9XQ042NzUwL2h3MS4w
L3dwc3MuYjA0CisjIC1GaWxlOiBhdGgxMWsvV0NONjc1MC9odzEuMC93cHNzLmIwNQorIyAtRmls
ZTogYXRoMTFrL1dDTjY3NTAvaHcxLjAvd3Bzcy5iMDYKKyMgLUZpbGU6IGF0aDExay9XQ042NzUw
L2h3MS4wL3dwc3MuYjA3CisjIC1GaWxlOiBhdGgxMWsvV0NONjc1MC9odzEuMC93cHNzLmIwOAor
IyAtRmlsZTogYXRoMTFrL1dDTjY3NTAvaHcxLjAvd3Bzcy5tZHQKKyMgK0ZpbGU6IGF0aDExay9X
Q042NzUwL2h3MS4wL3NjNzI4MC93cHNzLm1ibgorIyArTGluazogYXRoMTFrL1dDTjY3NTAvaHcx
LjAvd3Bzcy5tZHQgLT4gc2M3MjgwL3dwc3MubWJuCisjICBWZXJzaW9uOiBXTEFOLk1TTC4xLjAu
MS0wMTE2MC1RQ0FNU0xTV1BMWi0xCisjICBGaWxlOiBhdGgxMWsvV0NONjc1MC9odzEuMC9Ob3Rp
Y2UudHh0CisjICBGaWxlOiBhdGgxMWsvSVBRNTAxOC9odzEuMC9ib2FyZC0yLmJpbgorIyBAQCAt
NDEwNSw5ICs0MDk4LDEzIEBACisjICBGaWxlOiBpbnRlbC9pYnQtMTA0MC0yMTIwLmRkYworIyAg
VmVyc2lvbjogQlRfU29sYXJKZnBfUkVMMTUxXzIyLjE4MC4yNDA1LjE1MQorIyAgCisjICtGaWxl
OiBpbnRlbC9pYnQtMDA5My0wMjkxLnNmaQorIyArRmlsZTogaW50ZWwvaWJ0LTAwOTMtMDI5MS5k
ZGMKKyMgK0ZpbGU6IGludGVsL2lidC0wMDkzLTAwNDEuc2ZpCisjICtGaWxlOiBpbnRlbC9pYnQt
MDA5My0wMDQxLmRkYworIyAgRmlsZTogaW50ZWwvaWJ0LTAyOTEtMDI5MS5zZmkKKyMgIEZpbGU6
IGludGVsL2lidC0wMjkxLTAyOTEuZGRjCisjIC1WZXJzaW9uOiBCVF9CbGF6YXJVX1NfUkVMNjQ4
MTVfMjMuODAuMjQzMzIuNjQ4MTUKKyMgK1ZlcnNpb246IEJUX0JsYXphclVfU19SRUw2NzE1OV8y
My45MC4yNDM4Mi42NzE1OQorIyAgCisjICBGaWxlOiBpbnRlbC9pYnQtMDE4MC0wMDQxLnNmaQor
IyAgRmlsZTogaW50ZWwvaWJ0LTAxODAtMDA0MS5kZGMKKyMgQEAgLTQxMTYsNiArNDExMywxNCBA
QAorIyAgRmlsZTogaW50ZWwvaWJ0LTAxODAtMTA1MC5zZmkKKyMgIEZpbGU6IGludGVsL2lidC0w
MTgwLTEwNTAuZGRjCisjICBWZXJzaW9uOiBCVF9NYWduZXRhcl9SRUwxMDM0MjdfMjMuNTAuMjQz
MzIuMTAzNDI3CisjICsKKyMgK0ZpbGU6IGludGVsL2lidC0wMTkwLTAyOTEuc2ZpCisjICtGaWxl
OiBpbnRlbC9pYnQtMDE5MC0wMjkxLWltbC5zZmkKKyMgK0ZpbGU6IGludGVsL2lidC0wMTkwLTAy
OTEuZGRjCisjICtGaWxlOiBpbnRlbC9pYnQtMDE5MC0wMDQxLnNmaQorIyArRmlsZTogaW50ZWwv
aWJ0LTAxOTAtMDA0MS1pbWwuc2ZpCisjICtGaWxlOiBpbnRlbC9pYnQtMDE5MC0wMDQxLmRkYwor
IyArVmVyc2lvbjogQlRfQmxhemFySV9TX1JFTDY0MTYwXzIzLjcwLjI0MjMzLjY0MTYwCisjICAK
KyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UuaWJ0X2Zpcm13YXJlIGZv
ciBkZXRhaWxzCisjICAKKyMgQEAgLTUxMDgsMTMgKzUxMTMsMTYgQEAKKyMgIFZlcnNpb246IEh1
QyBBUEkvQVBCIHZlciA4LjUuNCBmb3IgTWV0ZW9ybGFrZQorIyAgCisjICBGaWxlOiBpOTE1L210
bF9nc2NfMS5iaW4KKyMgLVZlcnNpb246IEdTQyBBUEkvQVBCIHYxLjAsIHJlbGVhc2UgMTAyLjAu
MTAuMTg3OCwgU1ZOIDEgZm9yIE1ldGVvcmxha2UKKyMgK1ZlcnNpb246IEdTQyBBUEkvQVBCIHYx
LjAsIHJlbGVhc2UgMTAyLjEuMTUuMTkyNiwgU1ZOIDEgZm9yIE1ldGVvcmxha2UKKyMgIAorIyAg
RmlsZTogaTkxNS9ibWdfZG1jLmJpbgorIyAgVmVyc2lvbjogRE1DIEFQSS9BUEIgdmVyIDIgcmVs
ZWFzZSA2IGZvciBCYXR0bGVtYWdlCisjICAKKyMgIEZpbGU6IGk5MTUveGUybHBkX2RtYy5iaW4K
KyMgLVZlcnNpb246IERNQyBBUEkvQVBCIHZlciAyIHJlbGVhc2UgMjEgZm9yIFhlMkxQRAorIyAr
VmVyc2lvbjogRE1DIEFQSS9BUEIgdmVyIDIgcmVsZWFzZSAyMyBmb3IgWGUyTFBECisjICsKKyMg
K0ZpbGU6IGk5MTUveGUzbHBkX2RtYy5iaW4KKyMgK1ZlcnNpb246IERNQyBBUEkvQVBCIHZlciAy
IHJlbGVhc2UgMTMgZm9yIFhlM0xQRAorIyAgCisjICBMaWNlbnNlOiBSZWRpc3RyaWJ1dGFibGUu
IFNlZSBMSUNFTlNFLmk5MTUgZm9yIGRldGFpbHMKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjIEBA
IC01MTIyLDcgKzUxMzAsNyBAQAorIyAgRHJpdmVyOiB4ZSAtLSBJbnRlbCBHcmFwaGljcyBkcml2
ZXIKKyMgIAorIyAgRmlsZTogeGUvbG5sX2dzY18xLmJpbgorIyAtVmVyc2lvbjogR1NDIEFQSS9B
UEIgdjEuMCwgcmVsZWFzZSAxMDQuMC4wLjExNjEsIFNWTiAxIGZvciBMdW5hcmxha2UKKyMgK1Zl
cnNpb246IEdTQyBBUEkvQVBCIHYxLjAsIHJlbGVhc2UgMTA0LjAuMC4xMjYzLCBTVk4gMSBmb3Ig
THVuYXJsYWtlCisjICAKKyMgIEZpbGU6IHhlL2xubF9ndWNfNzAuYmluCisjICBWZXJzaW9uOiBH
dUMgQVBJL0FQQiB2ZXIgNzAuMjkuMiBmb3IgTHVuYXJsYWtlCisjIEBAIC01ODI5LDkgKzU4Mzcs
OSBAQAorIyAgRHJpdmVyOiBtdDc5MjAgLSBNZWRpYVRlayBNVDc5MjAgV2lyZWxlc3MgTUFDcwor
IyAgCisjICBGaWxlOiBtZWRpYXRlay9XSUZJX01UNzk2MV9wYXRjaF9tY3VfMWFfMl9oZHIuYmlu
CisjIC1WZXJzaW9uOiAyMDI0MDkzMDExMTAwMmEKKyMgK1ZlcnNpb246IDIwMjQxMTA0MDkxMDE0
YQorIyAgRmlsZTogbWVkaWF0ZWsvV0lGSV9SQU1fQ09ERV9NVDc5NjFfMWEuYmluCisjIC1WZXJz
aW9uOiAyMDI0MDkzMDExMTA0MQorIyArVmVyc2lvbjogMjAyNDExMDQwOTA4NTcKKyMgIAorIyAg
TGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5tZWRpYXRlayBmb3IgZGV0YWls
cy4KKyMgIAorIyBAQCAtNTg0MCw3ICs1ODQ4LDcgQEAKKyMgIERyaXZlcjogbXQ3OTIwIC0gTWVk
aWFUZWsgTVQ3OTIwIGJsdWV0b290aCBjaGlwc2V0CisjICAKKyMgIEZpbGU6IG1lZGlhdGVrL0JU
X1JBTV9DT0RFX01UNzk2MV8xYV8yX2hkci5iaW4KKyMgLVZlcnNpb246IDIwMjQwOTMwMTExNDU3
CisjICtWZXJzaW9uOiAyMDI0MTEwNDA5MTI0NgorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1
dGFibGUuIFNlZSBMSUNFTkNFLm1lZGlhdGVrIGZvciBkZXRhaWxzLgorIyAgCisjIEBAIC01ODg5
LDkgKzU4OTcsOSBAQAorIyAgRHJpdmVyOiBtdDc5MjUgLSBNZWRpYVRlayBNVDc5MjUgV2lyZWxl
c3MgTUFDcworIyAgCisjICBGaWxlOiBtZWRpYXRlay9tdDc5MjUvV0lGSV9NVDc5MjVfUEFUQ0hf
TUNVXzFfMV9oZHIuYmluCisjIC1WZXJzaW9uOiAyMDI0MDgxNjEzMjk1MWEKKyMgK1ZlcnNpb246
IDIwMjQxMTA0MTMyOTQ5YQorIyAgRmlsZTogbWVkaWF0ZWsvbXQ3OTI1L1dJRklfUkFNX0NPREVf
TVQ3OTI1XzFfMS5iaW4KKyMgLVZlcnNpb246IDIwMjQwODE2MTMzMDQ0CisjICtWZXJzaW9uOiAy
MDI0MTEwNDEzMjg1NQorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNF
TkNFLm1lZGlhdGVrIGZvciBkZXRhaWxzLgorIyAgCisjIEBAIC01OTAwLDcgKzU5MDgsNyBAQAor
IyAgRHJpdmVyOiBtdDc5MjUgLSBNZWRpYVRlayBNVDc5MjUgYmx1ZXRvb3RoIGNoaXBzZXQKKyMg
IAorIyAgRmlsZTogbWVkaWF0ZWsvbXQ3OTI1L0JUX1JBTV9DT0RFX01UNzkyNV8xXzFfaGRyLmJp
bgorIyAtVmVyc2lvbjogMjAyNDA4MTYxMzMyMDIKKyMgK1ZlcnNpb246IDIwMjQxMTA0MTMzMjE0
CisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UubWVkaWF0ZWsg
Zm9yIGRldGFpbHMuCisjICAKKyMgQEAgLTYxOTksNiArNjIwNyw3IEBACisjICBGaWxlOiBxY29t
L3gxZTgwMTAwL2dlbjcwNTAwX3phcC5tYm4KKyMgIEZpbGU6IHFjb20vYTY2M19nbXUuYmluCisj
ICBGaWxlOiBxY29tL3NhODc3NXAvYTY2M196YXAubWJuCisjICtGaWxlOiBxY29tL3FjczYxNS9h
NjEyX3phcC5tYm4KKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5T
RS5xY29tIGFuZCBxY29tL05PVElDRS50eHQgZm9yIGRldGFpbHMKKyMgIAorIyBAQCAtNjI5MCw2
ICs2Mjk5LDEzIEBACisjICBGaWxlOiBxY29tL3NjODI4MHhwL0xFTk9WTy8yMUJYL3FjYWRzcDgy
ODAubWJuCisjICBGaWxlOiBxY29tL3NjODI4MHhwL0xFTk9WTy8yMUJYL3FjY2RzcDgyODAubWJu
CisjICBGaWxlOiBxY29tL3NjODI4MHhwL0xFTk9WTy8yMUJYL3Fjc2xwaTgyODAubWJuCisjICtG
aWxlOiBxY29tL3gxZTgwMTAwL2Fkc3AubWJuCisjICtGaWxlOiBxY29tL3gxZTgwMTAwL2Fkc3Bf
ZHRiLm1ibgorIyArVmVyc2lvbjogQURTUC5IVC41LjktMDA3OTYtSEFNT0EtMQorIyArUmF3Rmls
ZTogcWNvbS94MWU4MDEwMC9hZHNwci5qc24KKyMgK1Jhd0ZpbGU6IHFjb20veDFlODAxMDAvYWRz
cHMuanNuCisjICtSYXdGaWxlOiBxY29tL3gxZTgwMTAwL2Fkc3B1YS5qc24KKyMgK1Jhd0ZpbGU6
IHFjb20veDFlODAxMDAvYmF0dG1nci5qc24KKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRh
YmxlLiBTZWUgTElDRU5TRS5xY29tIGFuZCBxY29tL05PVElDRS50eHQgZm9yIGRldGFpbHMKKyMg
IAorIyBAQCAtNzMxNiw2ICs3MzMyLDE2IEBACisjICBGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3Ax
LXNway1wcm90LTEwMjgwYzRkLXNwa2lkMS1yMC5iaW4KKyMgIEZpbGU6IGNpcnJ1cy9jczM1bDQx
LWRzcDEtc3BrLXByb3QtMTAyODBjNGQtc3BraWQxLWwxLmJpbgorIyAgRmlsZTogY2lycnVzL2Nz
MzVsNDEtZHNwMS1zcGstcHJvdC0xMDI4MGM0ZC1zcGtpZDEtcjEuYmluCisjICtMaW5rOiBjaXJy
dXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4Y2RmLndtZncgLT4gY3MzNWw0MS92Ni44My4w
L2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuODUuMC53bWZ3CisjICtMaW5rOiBjaXJydXMvY3MzNWw0
MS1kc3AxLXNway1wcm90LTEwM2M4Y2UwLndtZncgLT4gY3MzNWw0MS92Ni44My4wL2hhbG9fY3Nw
bF9SQU1fcmV2QjJfMjkuODUuMC53bWZ3CisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNw
ay1wcm90LTEwM2M4Y2RmLXNwa2lkMC1sMC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRz
cDEtc3BrLXByb3QtMTAzYzhjZGYtc3BraWQwLXIwLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLXBy
b3QtMTAzYzhjZGYtc3BraWQwLWwwLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1z
cGstcHJvdC0xMDNjOGNlMC1zcGtpZDAtbDAuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstcHJvdC0x
MDNjOGNkZi1zcGtpZDAtbDAuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1w
cm90LTEwM2M4Y2UwLXNwa2lkMC1yMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4
Y2RmLXNwa2lkMC1sMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3Qt
MTAzYzhjZGYtc3BraWQxLWwwLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGst
cHJvdC0xMDNjOGNkZi1zcGtpZDEtcjAuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNj
OGNkZi1zcGtpZDEtbDAuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90
LTEwM2M4Y2UwLXNwa2lkMS1sMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4Y2Rm
LXNwa2lkMS1sMC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTAz
YzhjZTAtc3BraWQxLXIwLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhjZGYtc3Br
aWQxLWwwLmJpbgorIyAgCisjICBMaWNlbnNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNF
LmNpcnJ1cyBmb3IgZGV0YWlscy4KKyMgIAorIyBAQCAtNzMzNCw2ICs3MzYwLDcgQEAKKyMgIEZp
bGU6IGNpcnJ1cy9jczM1bDU2L0NTMzVMNTZfUmV2My4xMS4xNi53bWZ3CisjICBGaWxlOiBjaXJy
dXMvY3MzNWw1Ni9DUzM1TDU2X1JldjMuMTEuMTgud21mdworIyAgRmlsZTogY2lycnVzL2NzMzVs
NTYvQ1MzNUw1Nl9SZXYzLjExLjIwLndtZncKKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDU2L0NTMzVM
NTZfUmV2My4xMS4yNS53bWZ3CisjICBMaW5rOiBjaXJydXMvY3MzNWw1NC1iMC1kc3AxLW1pc2Mt
MTAzYzhkMDEud21mdyAtPiBjczM1bDU2L0NTMzVMNTZfUmV2My4xMS4xOC53bWZ3CisjICBGaWxl
OiBjaXJydXMvY3MzNWw1NC1iMC1kc3AxLW1pc2MtMTAzYzhkMDEtYW1wMS5iaW4KKyMgIEZpbGU6
IGNpcnJ1cy9jczM1bDU0LWIwLWRzcDEtbWlzYy0xMDNjOGQwMS1hbXAyLmJpbgorIyBAQCAtNzM3
NCw2ICs3NDAxLDMwIEBACisjICBGaWxlOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTAy
ODBjNmItc3BraWQxLWFtcDIuYmluCisjICBGaWxlOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1p
c2MtMTAyODBjNmItc3BraWQxLWFtcDMuYmluCisjICBGaWxlOiBjaXJydXMvY3MzNWw1Ni1iMC1k
c3AxLW1pc2MtMTAyODBjNmItc3BraWQxLWFtcDQuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw1
Ni1iMC1kc3AxLW1pc2MtMTAyODBjZTMtc3BraWQwLndtZncgLT4gY3MzNWw1Ni9DUzM1TDU2X1Jl
djMuMTEuMjUud21mdworIyArRmlsZTogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTEwMjgw
Y2UzLXNwa2lkMC1hbXBsLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNj
LTEwMjgwY2UzLXNwa2lkMC1hbXByLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNTYtYjAtZHNw
MS1taXNjLTEwMjgwY2UzLXNwa2lkMS53bWZ3IC0+IGNzMzVsNTYvQ1MzNUw1Nl9SZXYzLjExLjI1
LndtZncKKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xMDI4MGNlMy1zcGtp
ZDEtYW1wbC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xMDI4MGNl
My1zcGtpZDEtYW1wci5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0x
MDI4MGNlMy1zcGtpZDIud21mdyAtPiBjczM1bDU2L0NTMzVMNTZfUmV2My4xMS4yNS53bWZ3Cisj
ICtGaWxlOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTAyODBjZTMtc3BraWQyLWFtcGwu
YmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTAyODBjZTMtc3BraWQy
LWFtcHIuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTAyODBjZTMt
c3BraWQzLndtZncgLT4gY3MzNWw1Ni9DUzM1TDU2X1JldjMuMTEuMjUud21mdworIyArRmlsZTog
Y2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTEwMjgwY2UzLXNwa2lkMy1hbXBsLmJpbgorIyAr
RmlsZTogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTEwMjgwY2UzLXNwa2lkMy1hbXByLmJp
bgorIyArTGluazogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTEwMjgwY2U0LXNwa2lkMC53
bWZ3IC0+IGNzMzVsNTYvQ1MzNUw1Nl9SZXYzLjExLjI1LndtZncKKyMgK0ZpbGU6IGNpcnJ1cy9j
czM1bDU2LWIwLWRzcDEtbWlzYy0xMDI4MGNlNC1zcGtpZDAtYW1wbC5iaW4KKyMgK0ZpbGU6IGNp
cnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xMDI4MGNlNC1zcGtpZDAtYW1wci5iaW4KKyMgK0xp
bms6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xMDI4MGNlNC1zcGtpZDEud21mdyAtPiBj
czM1bDU2L0NTMzVMNTZfUmV2My4xMS4yNS53bWZ3CisjICtGaWxlOiBjaXJydXMvY3MzNWw1Ni1i
MC1kc3AxLW1pc2MtMTAyODBjZTQtc3BraWQxLWFtcGwuYmluCisjICtGaWxlOiBjaXJydXMvY3Mz
NWw1Ni1iMC1kc3AxLW1pc2MtMTAyODBjZTQtc3BraWQxLWFtcHIuYmluCisjICtMaW5rOiBjaXJy
dXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTAyODBjZTQtc3BraWQyLndtZncgLT4gY3MzNWw1Ni9D
UzM1TDU2X1JldjMuMTEuMjUud21mdworIyArRmlsZTogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1t
aXNjLTEwMjgwY2U0LXNwa2lkMi1hbXBsLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNTYtYjAt
ZHNwMS1taXNjLTEwMjgwY2U0LXNwa2lkMi1hbXByLmJpbgorIyArTGluazogY2lycnVzL2NzMzVs
NTYtYjAtZHNwMS1taXNjLTEwMjgwY2U0LXNwa2lkMy53bWZ3IC0+IGNzMzVsNTYvQ1MzNUw1Nl9S
ZXYzLjExLjI1LndtZncKKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xMDI4
MGNlNC1zcGtpZDMtYW1wbC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlz
Yy0xMDI4MGNlNC1zcGtpZDMtYW1wci5iaW4KKyMgIExpbms6IGNpcnJ1cy9jczM1bDU2LWIwLWRz
cDEtbWlzYy0xMDNjOGM1Mi53bWZ3IC0+IGNzMzVsNTYvQ1MzNUw1Nl9SZXYzLjExLjE2LndtZncK
KyMgIEZpbGU6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xMDNjOGM1Mi1hbXAxLmJpbgor
IyAgRmlsZTogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTEwM2M4YzUyLWFtcDIuYmluCisj
IEBAIC03NTMwLDYgKzc1ODEsOSBAQAorIyAgRmlsZTogbWVkaWF0ZWsvc29mLXRwbGcvc29mLW10
ODE5NS1tdDYzNTktcnQxMDE5LXJ0NTY4Mi50cGxnCisjICBWZXJzaW9uOiB2MC40LjIKKyMgIAor
IyArRmlsZTogbWVkaWF0ZWsvc29mLXRwbGcvc29mLW10ODE5NS1tdDYzNTktbWF4OTgzOTAtcnQ1
NjgyLnRwbGcKKyMgK1ZlcnNpb246IHYwLjQuMworIyArCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1
dGFibGUuIFNlZSBMSUNFTkNFLm1lZGlhdGVrIGZvciBkZXRhaWxzLgorIyAgCisjICAtLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQorIyAKKyMKKwogU1VNTUFSWSA9ICJGaXJtd2FyZSBmaWxlcyBmb3IgdXNlIHdp
dGggTGludXgga2VybmVsIgogSE9NRVBBR0UgPSAiaHR0cHM6Ly93d3cua2VybmVsLm9yZy8iCiBE
RVNDUklQVElPTiA9ICJMaW51eCBmaXJtd2FyZSBpcyBhIHBhY2thZ2UgZGlzdHJpYnV0ZWQgYWxv
bmdzaWRlIHRoZSBMaW51eCBrZXJuZWwgXApAQCAtMTU0LDcgKzM4Miw3IEBAIExJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL0xJQ0VOQ0UuQWJpbGlzO21kNT1iNWVlM2Y0MTA3ODBlNTY3MTFhZDQ4
ZWFkYzIyYjhiYyBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTkNFLnhjNTAwMDtt
ZDU9MWUxNzBjMTMxNzUzMjNjMzJjN2Y0ZDA5OThkNTNmNjYgXAogICAgICAgICAgICAgICAgICAg
ICBmaWxlOi8vTElDRU5DRS54YzUwMDBjO21kNT0xMmIwMmVmYTMwNDlkYjY1ZDUyNGFlYjQxOGRk
ODdjYSBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly93ZngvTElDRU5DRS53ZjIwMDttZDU9
NGQxYmVmZjAwZDkwMmMwNWM5YzdlOTVhNWQ4ZWI1MmQgXAotICAgICAgICAgICAgICAgICAgICBm
aWxlOi8vV0hFTkNFO21kNT0ke1dIRU5DRV9DSEtTVU19IFwKKyAgICAgICAgICAgICAgICAgICAg
ZmlsZTovL1dIRU5DRTttZDU9Y2M5MGIwNGNiMTcwYWM5ODNiNjdiMDBmNGVjOGY3M2QgXAogICAg
ICAgICAgICAgICAgICAgICAiCiAjIFdIRU5DRSBjaGVja3N1bSBpcyBkZWZpbmVkIHNlcGFyYXRl
bHkgdG8gZWFzZSBvdmVycmlkaW5nIGl0IGlmCiAjIGNsYXNzLWRldnVwc3RyZWFtIGlzIHNlbGVj
dGVkLgpAQCAtMjM4LDE3ICs0NjYsMTQgQEAgTk9fR0VORVJJQ19MSUNFTlNFW1dIRU5DRV0gPSAi
V0hFTkNFIgogCiBQRSA9ICIxIgogCi1TUkNfVVJJID0gIlwKLSAgJHtLRVJORUxPUkdfTUlSUk9S
fS9saW51eC9rZXJuZWwvZmlybXdhcmUvJHtCUE59LSR7UFZ9LnRhci54eiBcCi0gIGZpbGU6Ly8w
MDAxLXFjb20tQWRkLWxpbmstZm9yLVFDUzY0OTAtR1BVLWZpcm13YXJlLnBhdGNoIFwKLSIKK1NS
Q19VUkkgPSAiJHtLRVJORUxPUkdfTUlSUk9SfS9saW51eC9rZXJuZWwvZmlybXdhcmUvJHtCUE59
LSR7UFZ9LnRhci54eiIKIAogQkJDTEFTU0VYVEVORCA9ICJkZXZ1cHN0cmVhbTp0YXJnZXQiCiBT
UkNfVVJJOmNsYXNzLWRldnVwc3RyZWFtID0gImdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20v
bGludXgva2VybmVsL2dpdC9maXJtd2FyZS9saW51eC1maXJtd2FyZS5naXQ7cHJvdG9jb2w9aHR0
cHM7YnJhbmNoPW1haW4iCiAjIFBpbiB0aGlzIHRvIHRoZSAyMDIyMDUwOSByZWxlYXNlLCBvdmVy
cmlkZSB0aGlzIGluIGxvY2FsLmNvbmYKIFNSQ1JFVjpjbGFzcy1kZXZ1cHN0cmVhbSA/PSAiYjE5
Y2JkY2E3OGFiMmFkZmQyMTBjOTFiZTE1YTIyNTY4ZThiOGNhZSIKIAotU1JDX1VSSVtzaGEyNTZz
dW1dID0gImEyNmMzOGVmNWE4MzI3MmYyYjk4Y2U4YmY4Y2ExODY1YTg1MmEzZGVlYTQ5Y2U1YThk
ZDgwNGI5MTQzNTEyNzMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzJlNmQzZWI1YzdmY2I2OWZl
NWQ1ODk3NmM2ZGVhZmEwZDY1NTI3MTljNmU3NDgzNTA2NGFmZjA0OWQyNWJkNyIKIAogaW5oZXJp
dCBhbGxhcmNoCiAKLS0gCjIuNDQuMQoK

--===============4061189947917792680==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: FILELIST: removed "/usr/lib/firmware/ath11k/WCN6750/hw1.0/wpss.b03 /usr/lib/firmware/ath11k/WCN6750/hw1.0/wpss.b02 /usr/lib/firmware/ath11k/WCN6750/hw1.0/wpss.b01 /usr/lib/firmware/ath11k/WCN6750/hw1.0/wpss.b00 /usr/lib/firmware/ath11k/WCN6750/hw1.0/wpss.b07 /usr/lib/firmware/ath11k/WCN6750/hw1.0/wpss.b06 /usr/lib/firmware/ath11k/WCN6750/hw1.0/wpss.b05 /usr/lib/firmware/ath11k/WCN6750/hw1.0/wpss.b04 /usr/lib/firmware/ath11k/WCN6750/hw1.0/wpss.b08", added "/usr/lib/firmware/ath11k/WCN6750/hw1.0/sc7280/wpss.mbn"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: FILELIST: added "/usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8cdf.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8ce0.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid1.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid0.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid1.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid2.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid3.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid0.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid2.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid3.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid0-ampr.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid1-ampr.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid2-ampr.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10
 280ce3-spkid3-ampr.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid0-ampl.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid1-ampl.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid2-ampl.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid3-ampl.bin /usr/lib/firmware/cirrus/cs35l56/CS35L56_Rev3.11.25.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid0-ampr.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid1-ampr.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid2-ampr.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid3-ampr.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8ce0-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8cdf-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8cdf-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8ce0-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8ce0-spkid0-r0.bin
  /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid2-ampl.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8ce0-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid0-ampl.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8cdf-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8cdf-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid1-ampl.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid3-ampl.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: FILELIST: added "/usr/lib/firmware/i915/xe3lpd_dmc.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGSIZE changed from 19549065 to 23222845 (+19%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: FILELIST: added "/usr/lib/firmware/intel/ibt-0093-0291.ddc /usr/lib/firmware/intel/ibt-0190-0041.ddc /usr/lib/firmware/intel/ibt-0190-0291.ddc /usr/lib/firmware/intel/ibt-0093-0041.sfi /usr/lib/firmware/intel/ibt-0190-0041.sfi /usr/lib/firmware/intel/ibt-0093-0291.sfi /usr/lib/firmware/intel/ibt-0190-0291.sfi /usr/lib/firmware/intel/ibt-0190-0041-iml.sfi /usr/lib/firmware/intel/ibt-0190-0291-iml.sfi /usr/lib/firmware/intel/ibt-0093-0041.ddc"
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek: FILELIST: added "/usr/lib/firmware/mediatek/sof-tplg/sof-mt8195-mt6359-max98390-rt5682.tplg"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGSIZE changed from 98795025 to 121204720 (+23%)
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: added "/usr/lib/firmware/rtw88/rtw8812a_fw.bin /usr/lib/firmware/qcom/x1e80100/adsps.jsn /usr/lib/firmware/qcom/x1e80100/adspua.jsn /usr/lib/firmware/qcom/x1e80100/adsp.mbn /usr/lib/firmware/qcom/x1e80100/battmgr.jsn /usr/lib/firmware/qcom/x1e80100/adspr.jsn /usr/lib/firmware/qcom/x1e80100/adsp_dtb.mbn /usr/lib/firmware/qcom/qcs615/a612_zap.mbn"

--===============4061189947917792680==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/linux-firmware: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware: SRC_URI changed from "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20241017.tar.xz file://0001-qcom-Add-link-for-QCS6490-GPU-firmware.patch" to "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20241110.tar.xz"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PKGSIZE changed from 95197846 to 95200918 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu-license: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu-license: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-ar5523: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar5523: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-wcn3990: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-wcn3990: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PKGSIZE changed from 52317187 to 52324775 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: FILELIST: removed "/usr/lib/firmware/ath11k/WCN6750/hw1.0/wpss.b07 /usr/lib/firmware/ath11k/WCN6750/hw1.0/wpss.b06 /usr/lib/firmware/ath11k/WCN6750/hw1.0/wpss.b05 /usr/lib/firmware/ath11k/WCN6750/hw1.0/wpss.b04 /usr/lib/firmware/ath11k/WCN6750/hw1.0/wpss.b03 /usr/lib/firmware/ath11k/WCN6750/hw1.0/wpss.b02 /usr/lib/firmware/ath11k/WCN6750/hw1.0/wpss.b01 /usr/lib/firmware/ath11k/WCN6750/hw1.0/wpss.b00 /usr/lib/firmware/ath11k/WCN6750/hw1.0/wpss.b08", added "/usr/lib/firmware/ath11k/WCN6750/hw1.0/sc7280/wpss.mbn"
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2x: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2x: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-cc33xx: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cc33xx: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus-license: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus-license: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: PKGSIZE changed from 2718200 to 2946488 (+8%)
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: FILELIST: added "/usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8cdf-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8cdf-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid1-ampl.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid2-ampl.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid3-ampl.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid0-ampl.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid1-ampl.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid0-ampl.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid2-ampl.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid3-ampl.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8ce0.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8cdf.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid0.wmfw /usr/lib/firmware/cirr
 us/cs35l56/CS35L56_Rev3.11.25.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid1.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid2.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8ce0-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8ce0-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8cdf-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8cdf-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8ce0-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8ce0-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid3-ampr.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid2-ampr.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid0-ampr.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid1-ampr.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid1-ampr.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10280ce
 4-spkid2-ampr.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid3-ampr.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid0-ampr.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid3.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid0.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid1.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid2.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid3.wmfw"
packages/all-poky-linux/linux-firmware/linux-firmware-cnm-license: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cnm-license: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-cnm: PKGSIZE changed from 998848 to 999104 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-cnm: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cnm: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200-license: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200-license: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGSIZE changed from 27942107 to 27995835 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: FILELIST: added "/usr/lib/firmware/i915/xe3lpd_dmc.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-18: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-18: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGSIZE changed from 19549065 to 23222845 (+19%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: FILELIST: added "/usr/lib/firmware/intel/ibt-0093-0041.sfi /usr/lib/firmware/intel/ibt-0190-0041.sfi /usr/lib/firmware/intel/ibt-0093-0291.sfi /usr/lib/firmware/intel/ibt-0190-0291.sfi /usr/lib/firmware/intel/ibt-0093-0041.ddc /usr/lib/firmware/intel/ibt-0093-0291.ddc /usr/lib/firmware/intel/ibt-0190-0041.ddc /usr/lib/firmware/intel/ibt-0190-0291.ddc /usr/lib/firmware/intel/ibt-0190-0291-iml.sfi /usr/lib/firmware/intel/ibt-0190-0041-iml.sfi"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced-license: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced-license: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9260: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9260: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-license: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-linaro-license: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-linaro-license: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-mali-csffw-arch108: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mali-csffw-arch108: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-mali-csffw-license: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mali-csffw-license: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek-license: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek-license: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek: PKGSIZE changed from 45306262 to 45447809 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek: FILELIST: added "/usr/lib/firmware/mediatek/sof-tplg/sof-mt8195-mt6359-max98390-rt5682.tplg"
packages/all-poky-linux/linux-firmware/linux-firmware-mellanox: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mellanox: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-microchip-license: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-microchip-license: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-microchip: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-microchip: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-moxa-license: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-moxa-license: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-moxa: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-moxa: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7650: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7650: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x-license: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x-license: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x2: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x2: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-license: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-license: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc-license: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc-license: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8987-sdio: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8987-sdio: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-common: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-common: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-pcie: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-pcie: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-sdio: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-sdio: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-common: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-common: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-pcie: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-pcie: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-sdio: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-sdio: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw416-sdio: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw416-sdio: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw612-sdio: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw612-sdio: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-olpc-license: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-olpc-license: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-olpc: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-olpc: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw-license: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw-license: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-powervr-license: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-powervr-license: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-powervr: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-powervr: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-prestera: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-prestera: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a663: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a663: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a702: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a702: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-g750: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-g750: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-modem: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-modem: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-wifi: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-wifi: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-adreno: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-adreno: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-adreno: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-adreno: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-audio: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-audio: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-modem: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-modem: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-wifi: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-wifi: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-adreno: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-adreno: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-audio: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-audio: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-compute: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-compute: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-ipa: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-ipa: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-adreno: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-adreno: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-audio: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-audio: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-compute: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-compute: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-modem: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-modem: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-wifi: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-wifi: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sa8775p-adreno: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sa8775p-adreno: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-adreno: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-adreno: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-thundercomm-db845c-sensors: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-thundercomm-db845c-sensors: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-adreno: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-adreno: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-thundercomm-rb5-sensors: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-thundercomm-rb5-sensors: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8550-audio-tplg: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8550-audio-tplg: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8650-audio-tplg: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8650-audio-tplg: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-6.0: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-6.0: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-adreno: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-adreno: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-yamato-license: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-yamato-license: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qed: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qed: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx-license: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx-license: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-dptx: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-dptx: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-license: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-license: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-nic: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-nic: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8761: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8761: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8822: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8822: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-src: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-src: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone-license: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone-license: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-wfx-license: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wfx-license: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-wfx: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wfx: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGSIZE changed from 291897 to 295103 (+1%)
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251-license: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251-license: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000-license: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000-license: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000-license: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000-license: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c-license: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c-license: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGSIZE changed from 98795025 to 121204720 (+23%)
packages/all-poky-linux/linux-firmware/linux-firmware: PKGV changed from 20241017 [default] to 20241110 [default]
packages/all-poky-linux/linux-firmware/linux-firmware: PV changed from "20241017" to "20241110"
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: added "/usr/lib/firmware/qcom/x1e80100/adsps.jsn /usr/lib/firmware/qcom/x1e80100/adspr.jsn /usr/lib/firmware/qcom/qcs615/a612_zap.mbn /usr/lib/firmware/qcom/x1e80100/battmgr.jsn /usr/lib/firmware/qcom/x1e80100/adsp.mbn /usr/lib/firmware/qcom/x1e80100/adsp_dtb.mbn /usr/lib/firmware/qcom/x1e80100/adspua.jsn /usr/lib/firmware/rtw88/rtw8812a_fw.bin"

--===============4061189947917792680==--

