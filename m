Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 987A5C3ABB9
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 13:33:18 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.20160.1744723980087972619
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 06:33:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=PcqDt8py;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=sf42uGXF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019639a754c6-055a3b5e-1792-4475-b0a8-9e6c374766dc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1744723989;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Sj//ysgkye7lLLSkyr5irMen0V5lzN3kpHHbGVQD4wY=;
	b=PcqDt8pybJuuIbdiT2V4lNvpP+wBU+v/yVYltQv07s/QRxH9gfCATcitjR0l2toC
	B4ofeyA5yVzLPxh3yHIr7r0miP398xovkFo8vVVUmEY9lEILgpgJZduk1gOQ7xE3/v4
	LGlFz6fHUFVgLvYtBVnR89Feq4IA1SMCZGXCBbfk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1744723989;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Sj//ysgkye7lLLSkyr5irMen0V5lzN3kpHHbGVQD4wY=;
	b=sf42uGXF23OthwpS/b5WcZsUl0Wz2Qx2XUsSCOkwjQ4k3khr1OAK3AL4FXaaac+t
	tTuLPO5un2TYSrnkVbPoB9ovpOFRbMhcnHmxmV8K4nFcObcGQFbjU5tEI0sxU6SZHfJ
	mrZK3m+utacRzmJtMvSNg/VMqfvGc48r+/lSSQVA=
Content-Type: multipart/mixed; boundary="===============4471392081627547756=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] linux-firmware: upgrading to 20250410 SUCCEEDED
Message-ID: <0101019639a754c6-055a3b5e-1792-4475-b0a8-9e6c374766dc-000000@us-west-2.amazonses.com>
Date: Tue, 15 Apr 2025 13:33:09 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 13:33:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214923

--===============4471392081627547756==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *linux-firmware* to *20250410* has Succeeded.

Next steps:
    - apply the patch: git am 0001-linux-firmware-upgrade-20250311-20250410.patch
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
From 72227c0cf44f6c5793672274dd7ffe9cab202922 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Apr 2025 10:26:01 +0000
Subject: [PATCH] linux-firmware: upgrade 20250311 -> 20250410

---
 ...20250311.bb => linux-firmware_20250410.bb} | 413 +++++++++++++++++-
 1 file changed, 411 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20250311.bb => linux-firmware_20250410.bb} (85%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250311.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250410.bb
similarity index 85%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20250311.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20250410.bb
index 675d378376..f4e757eb17 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250311.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250410.bb
@@ -1,3 +1,412 @@
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
+# @@ -1022,25 +1022,25 @@
+#  Version: 74.a5e9588b.0
+#  
+#  File: iwlwifi-cc-a0-77.ucode
+# -Version: 74.b405f9d4.0
+# +Version: 74.2753b721.0
+#  
+#  File: iwlwifi-Qu-b0-hr-b0-77.ucode
+# -Version: 74.b405f9d4.0
+# +Version: 74.2753b721.0
+#  
+#  File: iwlwifi-Qu-b0-jf-b0-77.ucode
+# -Version: 74.b405f9d4.0
+# +Version: 74.2753b721.0
+#  
+#  File: iwlwifi-Qu-c0-hr-b0-77.ucode
+# -Version: 74.b405f9d4.0
+# +Version: 74.2753b721.0
+#  
+#  File: iwlwifi-Qu-c0-jf-b0-77.ucode
+# -Version: 74.b405f9d4.0
+# +Version: 74.2753b721.0
+#  
+#  File: iwlwifi-QuZ-a0-hr-b0-77.ucode
+# -Version: 74.b405f9d4.0
+# +Version: 74.2753b721.0
+#  
+#  File: iwlwifi-QuZ-a0-jf-b0-77.ucode
+# -Version: 74.b405f9d4.0
+# +Version: 74.2753b721.0
+#  
+#  File: iwlwifi-ty-a0-gf-a0-77.ucode
+#  Version: 74.f92b5fed.0
+# @@ -1064,7 +1064,7 @@
+#  Version: 83.fb5c9aeb.0
+#  
+#  File: iwlwifi-ty-a0-gf-a0-89.ucode
+# -Version: 86.1a492d28.0
+# +Version: 86.4d42c933.0
+#  
+#  File: iwlwifi-so-a0-gf4-a0-77.ucode
+#  Version: 74.f92b5fed.0
+# @@ -1088,7 +1088,7 @@
+#  Version: 83.fb5c9aeb.0
+#  
+#  File: iwlwifi-so-a0-gf4-a0-89.ucode
+# -Version: 86.1a492d28.0
+# +Version: 86.4d42c933.0
+#  
+#  File: iwlwifi-so-a0-gf-a0-77.ucode
+#  Version: 74.f92b5fed.0
+# @@ -1112,7 +1112,7 @@
+#  Version: 83.fb5c9aeb.0
+#  
+#  File: iwlwifi-so-a0-gf-a0-89.ucode
+# -Version: 86.1a492d28.0
+# +Version: 86.4d42c933.0
+#  
+#  File: iwlwifi-so-a0-hr-b0-77.ucode
+#  Version: 74.f92b5fed.0
+# @@ -1133,7 +1133,7 @@
+#  Version: 83.fb5c9aeb.0
+#  
+#  File: iwlwifi-so-a0-hr-b0-89.ucode
+# -Version: 86.1a492d28.0
+# +Version: 86.4d42c933.0
+#  
+#  File: iwlwifi-so-a0-jf-b0-77.ucode
+#  Version: 74.f92b5fed.0
+# @@ -1149,6 +1149,9 @@
+#  File: iwlwifi-bz-b0-gf-a0-96.ucode
+#  Version: 93.44729d4e.0
+#  
+# +File: iwlwifi-bz-b0-gf-a0-97.ucode
+# +Version: 94.8049d69b.0
+# +
+#  File: iwlwifi-bz-b0-gf-a0.pnvm
+#  
+#  File: iwlwifi-gl-c0-fm-c0-83.ucode
+# @@ -1169,6 +1172,9 @@
+#  File: iwlwifi-gl-c0-fm-c0-96.ucode
+#  Version: 93.44729d4e.0
+#  
+# +File: iwlwifi-gl-c0-fm-c0-97.ucode
+# +Version: 94.8049d69b.0
+# +
+#  File: iwlwifi-gl-c0-fm-c0.pnvm
+#  
+#  File: iwlwifi-bz-b0-fm-c0-92.ucode
+# @@ -1183,6 +1189,9 @@
+#  File: iwlwifi-bz-b0-fm-c0-96.ucode
+#  Version: 93.44729d4e.0
+#  
+# +File: iwlwifi-bz-b0-fm-c0-97.ucode
+# +Version: 94.8049d69b.0
+# +
+#  File: iwlwifi-bz-b0-fm-c0.pnvm
+#  
+#  File: iwlwifi-ma-b0-gf-a0-83.ucode
+# @@ -1192,7 +1201,7 @@
+#  Version: 83.fb5c9aeb.0
+#  
+#  File: iwlwifi-ma-b0-gf-a0-89.ucode
+# -Version: 86.1a492d28.0
+# +Version: 86.4d42c933.0
+#  
+#  File: iwlwifi-ma-b0-gf-a0.pnvm
+#  
+# @@ -1203,7 +1212,7 @@
+#  Version: 83.fb5c9aeb.0
+#  
+#  File: iwlwifi-ma-b0-gf4-a0-89.ucode
+# -Version: 86.1a492d28.0
+# +Version: 86.4d42c933.0
+#  
+#  File: iwlwifi-ma-b0-gf4-a0.pnvm
+#  
+# @@ -1214,7 +1223,7 @@
+#  Version: 83.fb5c9aeb.0
+#  
+#  File: iwlwifi-ma-b0-hr-b0-89.ucode
+# -Version: 86.1a492d28.0
+# +Version: 86.4d42c933.0
+#  
+#  Licence: Redistributable. See LICENCE.iwlwifi_firmware for details
+#  
+# @@ -2075,6 +2084,14 @@
+#  File: radeon/si58_mc.bin
+#  
+#  Licence: Redistributable. See LICENSE.radeon for details.
+# +
+# +--------------------------------------------------------------------------
+# +
+# +Driver: as21xxx - Aeonsemi AS21x1x 1G/2.5G/5G/10G Ethernet Phy
+# +
+# +File: aeonsemi/as21x1x_fw.bin
+# +
+# +Licence: Redistributable. See LICENSE.aeonsemi for details.
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -3394,6 +3411,7 @@
+#  File: rtw88/rtw8703b_fw.bin
+#  File: rtw88/rtw8703b_wow_fw.bin
+#  File: rtw88/rtw8812a_fw.bin
+# +File: rtw88/rtw8814a_fw.bin
+#  
+#  Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
+#  
+# @@ -4225,6 +4243,14 @@
+#  File: intel/ibt-0190-0041.sfi
+#  File: intel/ibt-0190-0041-iml.sfi
+#  File: intel/ibt-0190-0041.ddc
+# +File: intel/ibt-0190-0041-pci.ddc
+# +File: intel/ibt-0190-0041-pci.sfi
+# +File: intel/ibt-0190-0041-usb.ddc
+# +File: intel/ibt-0190-0041-usb.sfi
+# +File: intel/ibt-0190-0291-pci.ddc
+# +File: intel/ibt-0190-0291-pci.sfi
+# +File: intel/ibt-0190-0291-usb.ddc
+# +File: intel/ibt-0190-0291-usb.sfi
+#  Version: BT_BlazarI_S_REL82746_23.120.25071.82746
+#  
+#  Licence: Redistributable. See LICENCE.ibt_firmware for details
+# @@ -4763,9 +4789,17 @@
+#  Version: BTFW.HSP.2.1.0-00653-VER_PATCHZ-3
+#  File: qca/QCA2066/nvm_usb_00130201_030a.bin
+#  File: qca/QCA2066/nvm_usb_00130201_gf_030a.bin
+# -Version: BTFW.HAMILTON.2.0.0-00515-USB_PATCHZ-2
+# +Version: BTFW.HAMILTON.2.0.0-00790-USB_PATCHZ-3
+#  File: qca/nvm_usb_00190200.bin
+# +File: qca/nvm_usb_00190200_0104.bin
+# +File: qca/nvm_usb_00190200_0106.bin
+# +File: qca/nvm_usb_00190200_0108.bin
+# +File: qca/nvm_usb_00190200_0109.bin
+# +File: qca/nvm_usb_00190200_010a.bin
+# +File: qca/nvm_usb_00190200_010c.bin
+#  File: qca/nvm_usb_00190200_010e.bin
+# +File: qca/nvm_usb_00190200_0110.bin
+# +File: qca/nvm_usb_00190200_0111.bin
+#  File: qca/nvm_usb_00190200_0112.bin
+#  
+#  Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k and qca/NOTICE.txt for details
+# @@ -5881,6 +5915,8 @@
+#  Version: v2.0.20536
+#  File: mediatek/mt8195/scp.img
+#  Version: v2.0.21961
+# +File: mediatek/mt8188/scp.img
+# +Version: v2.0.27748
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -6339,7 +6375,7 @@
+#  Link: qcom/vpu-1.0/venus.mbn -> ../vpu/vpu20_p4.mbn
+#  Link: qcom/vpu-1.0/venus.mdt -> ../vpu/vpu20_p4.mbn
+#  
+# -Version: VIDEO.VPU.1.0-00097-PROD-1
+# +Version: VIDEO.VPU.1.0-00119-PROD-1
+#  
+#  File: qcom/vpu/vpu20_p1.mbn
+#  Link: qcom/vpu-2.0/venus.mbn -> ../vpu/vpu20_p1.mbn
+# @@ -6527,6 +6563,8 @@
+#  Version: CDSP.HT.2.6-00698-MAKENA-1
+#  File: qcom/sc8280xp/LENOVO/21BX/qcslpi8280.mbn
+#  Version: SLPI.HY.4.1-00048-MAKENA-1
+# +File: qcom/x1e80100/LENOVO/21N1/qcvss8380.mbn
+# +Version: vfw-3.1:rel0085-070fa3311d9ef968015fee7fea07198d7eb208a1
+#  File: qcom/x1e80100/adsp.mbn
+#  File: qcom/x1e80100/adsp_dtb.mbn
+#  Version: ADSP.HT.5.9-00796-HAMOA-1
+# @@ -6546,6 +6584,21 @@
+#  RawFile: qcom/x1e80100/LENOVO/21N1/cdspr.jsn
+#  File: qcom/x1e80100/LENOVO/21N1/qcdxkmsuc8380.mbn
+#  RawFile: qcom/x1e80100/LENOVO/21N1/battmgr.jsn
+# +File: qcom/x1e80100/LENOVO/83ED/adsp_dtbs.elf
+# +RawFile: qcom/x1e80100/LENOVO/83ED/adspr.jsn
+# +RawFile: qcom/x1e80100/LENOVO/83ED/adsps.jsn
+# +RawFile: qcom/x1e80100/LENOVO/83ED/adspua.jsn
+# +RawFile: qcom/x1e80100/LENOVO/83ED/battmgr.jsn
+# +RawFile: qcom/x1e80100/LENOVO/83ED/cdspr.jsn
+# +File: qcom/x1e80100/LENOVO/83ED/qcadsp8380.mbn
+# +Version: ADSP.HT.5.9.c1-00059-HAMOA-1
+# +File: qcom/x1e80100/LENOVO/83ED/qcav1e8380.mbn
+# +Version: CDSP.HT.2.9.c2-00051-HAMOA-1
+# +File: qcom/x1e80100/LENOVO/83ED/qccdsp8380.mbn
+# +Version: CDSP.HT.2.9.c2-00051-HAMOA-1
+# +File: qcom/x1e80100/LENOVO/83ED/qcdxkmsuc8380.mbn
+# +File: qcom/x1e80100/LENOVO/83ED/qcvss8380.mbn
+# +Version: video-firmware.3.1-e5aea20c64cb6df9a1c9be99e206053b36424939
+#  
+#  Licence: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
+#  
+# @@ -6578,6 +6631,15 @@
+#  Version: DSP.AT.1.0.1-00079.2-LEMANS-1
+#  RawFile: qcom/sa8775p/gpdsp1r.jsn
+#  RawFile: qcom/sa8775p/gpdspr.jsn
+# +File: qcom/qcs8300/adsp.mbn
+# +Version: DSP.AT.1.0.1-00096-LEMANS-1
+# +RawFile: qcom/qcs8300/adspr.jsn
+# +RawFile: qcom/qcs8300/adspua.jsn
+# +File: qcom/qcs8300/cdsp0.mbn
+# +Version: DSP.AT.1.0.1-00096-LEMANS-1
+# +RawFile: qcom/qcs8300/cdspr.jsn
+# +File: qcom/qcs8300/gpdsp0.mbn
+# +Version: DSP.AT.1.0.1-00096-LEMANS-1
+#  
+#  Licence: Redistributable. See LICENSE.qcom-2 and qcom/NOTICE.txt for details
+#  
+# @@ -6671,6 +6733,10 @@
+#  File: mellanox/mlxsw_spectrum2-29.2012.1012.mfa2
+#  File: mellanox/mlxsw_spectrum3-30.2012.1012.mfa2
+#  File: mellanox/mlxsw_spectrum4-34.2012.1012.mfa2
+# +File: mellanox/mlxsw_spectrum-13.2014.4012.mfa2
+# +File: mellanox/mlxsw_spectrum2-29.2014.4012.mfa2
+# +File: mellanox/mlxsw_spectrum3-30.2014.4012.mfa2
+# +File: mellanox/mlxsw_spectrum4-34.2014.4012.mfa2
+#  
+#  Licence:
+#   Copyright (c) 2017-2020 Mellanox Technologies, Ltd. All rights reserved.
+# @@ -7662,6 +7728,57 @@
+#  Link: cirrus/cs35l41-dsp1-spk-prot-103c8b8f-l1.bin -> cs35l41-dsp1-spk-prot-103c8b8f-r1.bin
+#  File: cirrus/cs35l41-dsp1-spk-prot-103c8b92.bin
+#  Link: cirrus/cs35l41-dsp1-spk-prot-103c8c26.bin -> cs35l41-dsp1-spk-prot-103c8b45.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8d9f.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8da7.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8e36.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +File: cirrus/cs35l41-dsp1-spk-prot-103c8d9f-spkid0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-103c8d9f-spkid1.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8da7-spkid0.bin -> cs35l41-dsp1-spk-prot-103c8d9f-spkid0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8da7-spkid1.bin -> cs35l41-dsp1-spk-prot-103c8d9f-spkid1.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8e36-spkid0.bin -> cs35l41-dsp1-spk-prot-103c8d9f-spkid0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8e36-spkid1.bin -> cs35l41-dsp1-spk-prot-103c8d9f-spkid1.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8da0.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8da1.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8e37.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8da8.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +File: cirrus/cs35l41-dsp1-spk-prot-103c8da0-spkid0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-103c8da0-spkid1.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8da1-spkid0.bin -> cs35l41-dsp1-spk-prot-103c8da0-spkid0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8da1-spkid1.bin -> cs35l41-dsp1-spk-prot-103c8da0-spkid1.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8e37-spkid0.bin -> cs35l41-dsp1-spk-prot-103c8da0-spkid0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8e37-spkid1.bin -> cs35l41-dsp1-spk-prot-103c8da0-spkid1.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8da8-spkid0.bin -> cs35l41-dsp1-spk-prot-103c8da0-spkid0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8da8-spkid1.bin -> cs35l41-dsp1-spk-prot-103c8da0-spkid1.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8d9b.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8d9c.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8d9d.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8d9e.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +File: cirrus/cs35l41-dsp1-spk-prot-103c8d9b-spkid0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-103c8d9b-spkid1.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8d9c-spkid0.bin -> cs35l41-dsp1-spk-prot-103c8d9b-spkid0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8d9c-spkid1.bin -> cs35l41-dsp1-spk-prot-103c8d9b-spkid1.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8d9d-spkid0.bin -> cs35l41-dsp1-spk-prot-103c8d9b-spkid0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8d9d-spkid1.bin -> cs35l41-dsp1-spk-prot-103c8d9b-spkid1.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8d9e-spkid0.bin -> cs35l41-dsp1-spk-prot-103c8d9b-spkid0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8d9e-spkid1.bin -> cs35l41-dsp1-spk-prot-103c8d9b-spkid1.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8e11.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8e12.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8e13.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8e60.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8e61.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8e62.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +File: cirrus/cs35l41-dsp1-spk-prot-103c8e11-spkid0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-103c8e11-spkid1.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8e12-spkid0.bin -> cs35l41-dsp1-spk-prot-103c8e11-spkid0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8e12-spkid1.bin -> cs35l41-dsp1-spk-prot-103c8e11-spkid1.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8e13-spkid0.bin -> cs35l41-dsp1-spk-prot-103c8e11-spkid0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8e13-spkid1.bin -> cs35l41-dsp1-spk-prot-103c8e11-spkid1.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8e60-spkid0.bin -> cs35l41-dsp1-spk-prot-103c8e11-spkid0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8e60-spkid1.bin -> cs35l41-dsp1-spk-prot-103c8e11-spkid1.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8e61-spkid0.bin -> cs35l41-dsp1-spk-prot-103c8e11-spkid0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8e61-spkid1.bin -> cs35l41-dsp1-spk-prot-103c8e11-spkid1.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8e62-spkid0.bin -> cs35l41-dsp1-spk-prot-103c8e11-spkid0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8e62-spkid1.bin -> cs35l41-dsp1-spk-prot-103c8e11-spkid1.bin
+#  Link: cirrus/cs35l41-dsp1-spk-prot-10280cbd.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+#  Link: cirrus/cs35l41-dsp1-spk-prot-10280cbe.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+#  Link: cirrus/cs35l41-dsp1-spk-prot-10280cbf.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# @@ -7882,12 +7999,12 @@
+#  Link: cirrus/cs35l54-b0-dsp1-misc-103c8e1a.wmfw -> cs35l56/CS35L56_Rev3.11.11.1.wmfw
+#  Link: cirrus/cs35l54-b0-dsp1-misc-103c8e1a-amp1.bin -> cs35l54-b0-dsp1-misc-103c8e15-amp1.bin
+#  Link: cirrus/cs35l54-b0-dsp1-misc-103c8e1a-amp2.bin -> cs35l54-b0-dsp1-misc-103c8e15-amp2.bin
+# -Link: cirrus/cs35l54-b0-dsp1-misc-103c8e1b.wmfw -> cs35l56/CS35L56_Rev3.11.11.1.wmfw
+# -File: cirrus/cs35l54-b0-dsp1-misc-103c8e1b-amp1.bin
+# -File: cirrus/cs35l54-b0-dsp1-misc-103c8e1b-amp2.bin
+# -Link: cirrus/cs35l54-b0-dsp1-misc-103c8e1c.wmfw -> cs35l56/CS35L56_Rev3.11.11.1.wmfw
+# -Link: cirrus/cs35l54-b0-dsp1-misc-103c8e1c-amp1.bin -> cs35l54-b0-dsp1-misc-103c8e1b-amp1.bin
+# -Link: cirrus/cs35l54-b0-dsp1-misc-103c8e1c-amp2.bin -> cs35l54-b0-dsp1-misc-103c8e1b-amp2.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-103c8e1b.wmfw -> cs35l56/CS35L56_Rev3.11.11.1.wmfw
+# +File: cirrus/cs35l56-b0-dsp1-misc-103c8e1b-amp1.bin
+# +File: cirrus/cs35l56-b0-dsp1-misc-103c8e1b-amp2.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-103c8e1c.wmfw -> cs35l56/CS35L56_Rev3.11.11.1.wmfw
+# +Link: cirrus/cs35l56-b0-dsp1-misc-103c8e1c-amp1.bin -> cs35l56-b0-dsp1-misc-103c8e1b-amp1.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-103c8e1c-amp2.bin -> cs35l56-b0-dsp1-misc-103c8e1b-amp2.bin
+#  Link: cirrus/cs35l56-b0-dsp1-misc-103c8e2c.wmfw -> cs35l56/CS35L56_Rev3.11.11.1.wmfw
+#  Link: cirrus/cs35l56-b0-dsp1-misc-103c8e2c-amp1.bin -> cs35l56-b0-dsp1-misc-103c8d90-amp1.bin
+#  Link: cirrus/cs35l56-b0-dsp1-misc-103c8e2c-amp2.bin -> cs35l56-b0-dsp1-misc-103c8d90-amp2.bin
+# @@ -7906,6 +8023,8 @@
+#  Link: cirrus/cs35l56-b0-dsp1-misc-10431264.wmfw -> cs35l56/CS35L56_Rev3.11.16.wmfw
+#  Link: cirrus/cs35l56-b0-dsp1-misc-10431264-amp1.bin -> cs35l56-b0-dsp1-misc-10431df3-amp1.bin
+#  Link: cirrus/cs35l56-b0-dsp1-misc-10431264-amp2.bin -> cs35l56-b0-dsp1-misc-10431df3-amp2.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-10431264-amp3.bin -> cs35l56-b0-dsp1-misc-10431df3-amp3.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-10431264-amp4.bin -> cs35l56-b0-dsp1-misc-10431df3-amp4.bin
+#  Link: cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid0.wmfw -> cs35l56/CS35L56_Rev3.11.16.wmfw
+#  File: cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid0-amp1.bin
+#  File: cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid0-amp2.bin
+# @@ -8039,6 +8158,14 @@
+#  File: mediatek/sof-tplg/sof-mt8195-mt6359-max98390-rt5682.tplg
+#  Version: v0.4.3
+#  
+# +File: mediatek/sof/sof-mt8188.ri
+# +File: mediatek/sof/sof-mt8188.ldc
+# +File: mediatek/sof-tplg/sof-mt8188.tplg
+# +Version: v2.8
+# +
+# +File: mediatek/sof-tplg/sof-mt8195.tplg
+# +Version: v2.8
+# +
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+#  --------------------------------------------------------------------------
+# @@ -8128,6 +8255,21 @@
+#  
+#  --------------------------------------------------------------------------
+#  
+# +Driver: qcom-x1e80100 - Qualcomm ASoC tplg Firmware
+# +File: qcom/x1e80100/LENOVO/21N1/X1E80100-LENOVO-Thinkpad-T14s-tplg.bin
+# +Link: qcom/x1e80100/X1E80100-LENOVO-Thinkpad-T14s-tplg.bin -> LENOVO/21N1/X1E80100-LENOVO-Thinkpad-T14s-tplg.bin
+# +Version: v0.1.0
+# +Info: DATE=17.03.2025
+# +
+# +File: qcom/x1e80100/LENOVO/83ED/X1E80100-LENOVO-Yoga-Slim7x-tplg.bin
+# +Link: qcom/x1e80100/X1E80100-LENOVO-Yoga-Slim7x-tplg.bin -> LENOVO/83ED/X1E80100-LENOVO-Yoga-Slim7x-tplg.bin
+# +Version: v0.1.0
+# +Info: DATE=17.03.2025
+# +
+# +Licence: Redistributable. See LICENCE.linaro for details
+# +Originates from https://github.com/linux-msm/audioreach-topology.git
+# +
+# +--------------------------------------------------------------------------
+#  Driver: ti-tas2781 - tas2781 firmware
+#  File: ti/tas2781/TAS2XXX0C94.bin
+#  File: ti/tas2781/TAS2XXX0C95.bin
+# @@ -8343,11 +8485,11 @@
+#  Driver: intel_vpu -- Intel NPU driver
+#  
+#  File: intel/vpu/vpu_37xx_v1.bin
+# -Version: ci_tag_ud202504_vpu_rc_20250115_1905
+# +Version: ci_tag_ud202512_vpu_rc_20250306_1130
+#  Link: intel/vpu/vpu_37xx_v0.0.bin -> vpu_37xx_v1.bin
+#  
+#  File: intel/vpu/vpu_40xx_v1.bin
+# -Version: ci_tag_ud202504_vpu_rc_20250115_1905
+# +Version: ci_tag_ud202512_vpu_rc_20250306_1130
+#  Link: intel/vpu/vpu_40xx_v0.0.bin -> vpu_40xx_v1.bin
+#  
+#  License: Redistributable. See LICENSE.intel_vpu for details
+# 
+#
+
 SUMMARY = "Firmware files for use with Linux kernel"
 HOMEPAGE = "https://www.kernel.org/"
 DESCRIPTION = "Linux firmware is a package distributed alongside the Linux kernel \
@@ -156,7 +565,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
                     file://wfx/LICENCE.wf200;md5=4d1beff00d902c05c9c7e95a5d8eb52d \
-                    file://WHENCE;md5=${WHENCE_CHKSUM} \
+                    file://WHENCE;md5=7ddfb44c16e34dcd8bbacc4839ab78dc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
@@ -250,7 +659,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "b1083a36f19aea46f661dcfd4cd462d13933dcb4e7f0dc809525552dd5c3541d"
+SRC_URI[sha256sum] = "2ae6aab2d8930fd54bf30ae15498f1625721bc3630b894644db5d21fad5a20f9"
 
 inherit allarch
 
-- 
2.47.1


--===============4471392081627547756==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-linux-firmware-upgrade-20250311-20250410.patch"

RnJvbSA3MjIyN2MwY2Y0NGY2YzU3OTM2NzIyNzRkZDdmZmU5Y2FiMjAyOTIyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgQXByIDIwMjUgMTA6MjY6MDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aW51eC1maXJtd2FyZTogdXBncmFkZSAyMDI1MDMxMSAtPiAyMDI1MDQxMAoKLS0tCiAuLi4yMDI1
MDMxMS5iYiA9PiBsaW51eC1maXJtd2FyZV8yMDI1MDQxMC5iYn0gfCA0MTMgKysrKysrKysrKysr
KysrKystCiAxIGZpbGUgY2hhbmdlZCwgNDExIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS97bGludXgtZmlybXdh
cmVfMjAyNTAzMTEuYmIgPT4gbGludXgtZmlybXdhcmVfMjAyNTA0MTAuYmJ9ICg4NSUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2Fy
ZV8yMDI1MDMxMS5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgt
ZmlybXdhcmVfMjAyNTA0MTAuYmIKc2ltaWxhcml0eSBpbmRleCA4NSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZV8yMDI1MDMxMS5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJt
d2FyZV8yMDI1MDQxMC5iYgppbmRleCA2NzVkMzc4Mzc2Li5mNGU3NTdlYjE3IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlXzIwMjUw
MzExLmJiCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgtZmly
bXdhcmVfMjAyNTA0MTAuYmIKQEAgLTEsMyArMSw0MTIgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklM
RVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4K
KyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRo
ZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlm
IG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3Nh
Z2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0
ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0t
LSBXSEVOQ0UKKyMgKysrIFdIRU5DRQorIyBAQCAtMTAyMiwyNSArMTAyMiwyNSBAQAorIyAgVmVy
c2lvbjogNzQuYTVlOTU4OGIuMAorIyAgCisjICBGaWxlOiBpd2x3aWZpLWNjLWEwLTc3LnVjb2Rl
CisjIC1WZXJzaW9uOiA3NC5iNDA1ZjlkNC4wCisjICtWZXJzaW9uOiA3NC4yNzUzYjcyMS4wCisj
ICAKKyMgIEZpbGU6IGl3bHdpZmktUXUtYjAtaHItYjAtNzcudWNvZGUKKyMgLVZlcnNpb246IDc0
LmI0MDVmOWQ0LjAKKyMgK1ZlcnNpb246IDc0LjI3NTNiNzIxLjAKKyMgIAorIyAgRmlsZTogaXds
d2lmaS1RdS1iMC1qZi1iMC03Ny51Y29kZQorIyAtVmVyc2lvbjogNzQuYjQwNWY5ZDQuMAorIyAr
VmVyc2lvbjogNzQuMjc1M2I3MjEuMAorIyAgCisjICBGaWxlOiBpd2x3aWZpLVF1LWMwLWhyLWIw
LTc3LnVjb2RlCisjIC1WZXJzaW9uOiA3NC5iNDA1ZjlkNC4wCisjICtWZXJzaW9uOiA3NC4yNzUz
YjcyMS4wCisjICAKKyMgIEZpbGU6IGl3bHdpZmktUXUtYzAtamYtYjAtNzcudWNvZGUKKyMgLVZl
cnNpb246IDc0LmI0MDVmOWQ0LjAKKyMgK1ZlcnNpb246IDc0LjI3NTNiNzIxLjAKKyMgIAorIyAg
RmlsZTogaXdsd2lmaS1RdVotYTAtaHItYjAtNzcudWNvZGUKKyMgLVZlcnNpb246IDc0LmI0MDVm
OWQ0LjAKKyMgK1ZlcnNpb246IDc0LjI3NTNiNzIxLjAKKyMgIAorIyAgRmlsZTogaXdsd2lmaS1R
dVotYTAtamYtYjAtNzcudWNvZGUKKyMgLVZlcnNpb246IDc0LmI0MDVmOWQ0LjAKKyMgK1ZlcnNp
b246IDc0LjI3NTNiNzIxLjAKKyMgIAorIyAgRmlsZTogaXdsd2lmaS10eS1hMC1nZi1hMC03Ny51
Y29kZQorIyAgVmVyc2lvbjogNzQuZjkyYjVmZWQuMAorIyBAQCAtMTA2NCw3ICsxMDY0LDcgQEAK
KyMgIFZlcnNpb246IDgzLmZiNWM5YWViLjAKKyMgIAorIyAgRmlsZTogaXdsd2lmaS10eS1hMC1n
Zi1hMC04OS51Y29kZQorIyAtVmVyc2lvbjogODYuMWE0OTJkMjguMAorIyArVmVyc2lvbjogODYu
NGQ0MmM5MzMuMAorIyAgCisjICBGaWxlOiBpd2x3aWZpLXNvLWEwLWdmNC1hMC03Ny51Y29kZQor
IyAgVmVyc2lvbjogNzQuZjkyYjVmZWQuMAorIyBAQCAtMTA4OCw3ICsxMDg4LDcgQEAKKyMgIFZl
cnNpb246IDgzLmZiNWM5YWViLjAKKyMgIAorIyAgRmlsZTogaXdsd2lmaS1zby1hMC1nZjQtYTAt
ODkudWNvZGUKKyMgLVZlcnNpb246IDg2LjFhNDkyZDI4LjAKKyMgK1ZlcnNpb246IDg2LjRkNDJj
OTMzLjAKKyMgIAorIyAgRmlsZTogaXdsd2lmaS1zby1hMC1nZi1hMC03Ny51Y29kZQorIyAgVmVy
c2lvbjogNzQuZjkyYjVmZWQuMAorIyBAQCAtMTExMiw3ICsxMTEyLDcgQEAKKyMgIFZlcnNpb246
IDgzLmZiNWM5YWViLjAKKyMgIAorIyAgRmlsZTogaXdsd2lmaS1zby1hMC1nZi1hMC04OS51Y29k
ZQorIyAtVmVyc2lvbjogODYuMWE0OTJkMjguMAorIyArVmVyc2lvbjogODYuNGQ0MmM5MzMuMAor
IyAgCisjICBGaWxlOiBpd2x3aWZpLXNvLWEwLWhyLWIwLTc3LnVjb2RlCisjICBWZXJzaW9uOiA3
NC5mOTJiNWZlZC4wCisjIEBAIC0xMTMzLDcgKzExMzMsNyBAQAorIyAgVmVyc2lvbjogODMuZmI1
YzlhZWIuMAorIyAgCisjICBGaWxlOiBpd2x3aWZpLXNvLWEwLWhyLWIwLTg5LnVjb2RlCisjIC1W
ZXJzaW9uOiA4Ni4xYTQ5MmQyOC4wCisjICtWZXJzaW9uOiA4Ni40ZDQyYzkzMy4wCisjICAKKyMg
IEZpbGU6IGl3bHdpZmktc28tYTAtamYtYjAtNzcudWNvZGUKKyMgIFZlcnNpb246IDc0LmY5MmI1
ZmVkLjAKKyMgQEAgLTExNDksNiArMTE0OSw5IEBACisjICBGaWxlOiBpd2x3aWZpLWJ6LWIwLWdm
LWEwLTk2LnVjb2RlCisjICBWZXJzaW9uOiA5My40NDcyOWQ0ZS4wCisjICAKKyMgK0ZpbGU6IGl3
bHdpZmktYnotYjAtZ2YtYTAtOTcudWNvZGUKKyMgK1ZlcnNpb246IDk0LjgwNDlkNjliLjAKKyMg
KworIyAgRmlsZTogaXdsd2lmaS1iei1iMC1nZi1hMC5wbnZtCisjICAKKyMgIEZpbGU6IGl3bHdp
ZmktZ2wtYzAtZm0tYzAtODMudWNvZGUKKyMgQEAgLTExNjksNiArMTE3Miw5IEBACisjICBGaWxl
OiBpd2x3aWZpLWdsLWMwLWZtLWMwLTk2LnVjb2RlCisjICBWZXJzaW9uOiA5My40NDcyOWQ0ZS4w
CisjICAKKyMgK0ZpbGU6IGl3bHdpZmktZ2wtYzAtZm0tYzAtOTcudWNvZGUKKyMgK1ZlcnNpb246
IDk0LjgwNDlkNjliLjAKKyMgKworIyAgRmlsZTogaXdsd2lmaS1nbC1jMC1mbS1jMC5wbnZtCisj
ICAKKyMgIEZpbGU6IGl3bHdpZmktYnotYjAtZm0tYzAtOTIudWNvZGUKKyMgQEAgLTExODMsNiAr
MTE4OSw5IEBACisjICBGaWxlOiBpd2x3aWZpLWJ6LWIwLWZtLWMwLTk2LnVjb2RlCisjICBWZXJz
aW9uOiA5My40NDcyOWQ0ZS4wCisjICAKKyMgK0ZpbGU6IGl3bHdpZmktYnotYjAtZm0tYzAtOTcu
dWNvZGUKKyMgK1ZlcnNpb246IDk0LjgwNDlkNjliLjAKKyMgKworIyAgRmlsZTogaXdsd2lmaS1i
ei1iMC1mbS1jMC5wbnZtCisjICAKKyMgIEZpbGU6IGl3bHdpZmktbWEtYjAtZ2YtYTAtODMudWNv
ZGUKKyMgQEAgLTExOTIsNyArMTIwMSw3IEBACisjICBWZXJzaW9uOiA4My5mYjVjOWFlYi4wCisj
ICAKKyMgIEZpbGU6IGl3bHdpZmktbWEtYjAtZ2YtYTAtODkudWNvZGUKKyMgLVZlcnNpb246IDg2
LjFhNDkyZDI4LjAKKyMgK1ZlcnNpb246IDg2LjRkNDJjOTMzLjAKKyMgIAorIyAgRmlsZTogaXds
d2lmaS1tYS1iMC1nZi1hMC5wbnZtCisjICAKKyMgQEAgLTEyMDMsNyArMTIxMiw3IEBACisjICBW
ZXJzaW9uOiA4My5mYjVjOWFlYi4wCisjICAKKyMgIEZpbGU6IGl3bHdpZmktbWEtYjAtZ2Y0LWEw
LTg5LnVjb2RlCisjIC1WZXJzaW9uOiA4Ni4xYTQ5MmQyOC4wCisjICtWZXJzaW9uOiA4Ni40ZDQy
YzkzMy4wCisjICAKKyMgIEZpbGU6IGl3bHdpZmktbWEtYjAtZ2Y0LWEwLnBudm0KKyMgIAorIyBA
QCAtMTIxNCw3ICsxMjIzLDcgQEAKKyMgIFZlcnNpb246IDgzLmZiNWM5YWViLjAKKyMgIAorIyAg
RmlsZTogaXdsd2lmaS1tYS1iMC1oci1iMC04OS51Y29kZQorIyAtVmVyc2lvbjogODYuMWE0OTJk
MjguMAorIyArVmVyc2lvbjogODYuNGQ0MmM5MzMuMAorIyAgCisjICBMaWNlbmNlOiBSZWRpc3Ry
aWJ1dGFibGUuIFNlZSBMSUNFTkNFLml3bHdpZmlfZmlybXdhcmUgZm9yIGRldGFpbHMKKyMgIAor
IyBAQCAtMjA3NSw2ICsyMDg0LDE0IEBACisjICBGaWxlOiByYWRlb24vc2k1OF9tYy5iaW4KKyMg
IAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5yYWRlb24gZm9yIGRl
dGFpbHMuCisjICsKKyMgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICsKKyMgK0RyaXZlcjogYXMyMXh4
eCAtIEFlb25zZW1pIEFTMjF4MXggMUcvMi41Ry81Ry8xMEcgRXRoZXJuZXQgUGh5CisjICsKKyMg
K0ZpbGU6IGFlb25zZW1pL2FzMjF4MXhfZncuYmluCisjICsKKyMgK0xpY2VuY2U6IFJlZGlzdHJp
YnV0YWJsZS4gU2VlIExJQ0VOU0UuYWVvbnNlbWkgZm9yIGRldGFpbHMuCisjICAKKyMgIC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCisjICAKKyMgQEAgLTMzOTQsNiArMzQxMSw3IEBACisjICBGaWxlOiBydHc4
OC9ydHc4NzAzYl9mdy5iaW4KKyMgIEZpbGU6IHJ0dzg4L3J0dzg3MDNiX3dvd19mdy5iaW4KKyMg
IEZpbGU6IHJ0dzg4L3J0dzg4MTJhX2Z3LmJpbgorIyArRmlsZTogcnR3ODgvcnR3ODgxNGFfZncu
YmluCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UucnRsd2lm
aV9maXJtd2FyZS50eHQgZm9yIGRldGFpbHMuCisjICAKKyMgQEAgLTQyMjUsNiArNDI0MywxNCBA
QAorIyAgRmlsZTogaW50ZWwvaWJ0LTAxOTAtMDA0MS5zZmkKKyMgIEZpbGU6IGludGVsL2lidC0w
MTkwLTAwNDEtaW1sLnNmaQorIyAgRmlsZTogaW50ZWwvaWJ0LTAxOTAtMDA0MS5kZGMKKyMgK0Zp
bGU6IGludGVsL2lidC0wMTkwLTAwNDEtcGNpLmRkYworIyArRmlsZTogaW50ZWwvaWJ0LTAxOTAt
MDA0MS1wY2kuc2ZpCisjICtGaWxlOiBpbnRlbC9pYnQtMDE5MC0wMDQxLXVzYi5kZGMKKyMgK0Zp
bGU6IGludGVsL2lidC0wMTkwLTAwNDEtdXNiLnNmaQorIyArRmlsZTogaW50ZWwvaWJ0LTAxOTAt
MDI5MS1wY2kuZGRjCisjICtGaWxlOiBpbnRlbC9pYnQtMDE5MC0wMjkxLXBjaS5zZmkKKyMgK0Zp
bGU6IGludGVsL2lidC0wMTkwLTAyOTEtdXNiLmRkYworIyArRmlsZTogaW50ZWwvaWJ0LTAxOTAt
MDI5MS11c2Iuc2ZpCisjICBWZXJzaW9uOiBCVF9CbGF6YXJJX1NfUkVMODI3NDZfMjMuMTIwLjI1
MDcxLjgyNzQ2CisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0Uu
aWJ0X2Zpcm13YXJlIGZvciBkZXRhaWxzCisjIEBAIC00NzYzLDkgKzQ3ODksMTcgQEAKKyMgIFZl
cnNpb246IEJURlcuSFNQLjIuMS4wLTAwNjUzLVZFUl9QQVRDSFotMworIyAgRmlsZTogcWNhL1FD
QTIwNjYvbnZtX3VzYl8wMDEzMDIwMV8wMzBhLmJpbgorIyAgRmlsZTogcWNhL1FDQTIwNjYvbnZt
X3VzYl8wMDEzMDIwMV9nZl8wMzBhLmJpbgorIyAtVmVyc2lvbjogQlRGVy5IQU1JTFRPTi4yLjAu
MC0wMDUxNS1VU0JfUEFUQ0haLTIKKyMgK1ZlcnNpb246IEJURlcuSEFNSUxUT04uMi4wLjAtMDA3
OTAtVVNCX1BBVENIWi0zCisjICBGaWxlOiBxY2EvbnZtX3VzYl8wMDE5MDIwMC5iaW4KKyMgK0Zp
bGU6IHFjYS9udm1fdXNiXzAwMTkwMjAwXzAxMDQuYmluCisjICtGaWxlOiBxY2EvbnZtX3VzYl8w
MDE5MDIwMF8wMTA2LmJpbgorIyArRmlsZTogcWNhL252bV91c2JfMDAxOTAyMDBfMDEwOC5iaW4K
KyMgK0ZpbGU6IHFjYS9udm1fdXNiXzAwMTkwMjAwXzAxMDkuYmluCisjICtGaWxlOiBxY2EvbnZt
X3VzYl8wMDE5MDIwMF8wMTBhLmJpbgorIyArRmlsZTogcWNhL252bV91c2JfMDAxOTAyMDBfMDEw
Yy5iaW4KKyMgIEZpbGU6IHFjYS9udm1fdXNiXzAwMTkwMjAwXzAxMGUuYmluCisjICtGaWxlOiBx
Y2EvbnZtX3VzYl8wMDE5MDIwMF8wMTEwLmJpbgorIyArRmlsZTogcWNhL252bV91c2JfMDAxOTAy
MDBfMDExMS5iaW4KKyMgIEZpbGU6IHFjYS9udm1fdXNiXzAwMTkwMjAwXzAxMTIuYmluCisjICAK
KyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UuUXVhbGNvbW1BdGhlcm9z
X2F0aDEwayBhbmQgcWNhL05PVElDRS50eHQgZm9yIGRldGFpbHMKKyMgQEAgLTU4ODEsNiArNTkx
NSw4IEBACisjICBWZXJzaW9uOiB2Mi4wLjIwNTM2CisjICBGaWxlOiBtZWRpYXRlay9tdDgxOTUv
c2NwLmltZworIyAgVmVyc2lvbjogdjIuMC4yMTk2MQorIyArRmlsZTogbWVkaWF0ZWsvbXQ4MTg4
L3NjcC5pbWcKKyMgK1ZlcnNpb246IHYyLjAuMjc3NDgKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0
cmlidXRhYmxlLiBTZWUgTElDRU5DRS5tZWRpYXRlayBmb3IgZGV0YWlscy4KKyMgIAorIyBAQCAt
NjMzOSw3ICs2Mzc1LDcgQEAKKyMgIExpbms6IHFjb20vdnB1LTEuMC92ZW51cy5tYm4gLT4gLi4v
dnB1L3ZwdTIwX3A0Lm1ibgorIyAgTGluazogcWNvbS92cHUtMS4wL3ZlbnVzLm1kdCAtPiAuLi92
cHUvdnB1MjBfcDQubWJuCisjICAKKyMgLVZlcnNpb246IFZJREVPLlZQVS4xLjAtMDAwOTctUFJP
RC0xCisjICtWZXJzaW9uOiBWSURFTy5WUFUuMS4wLTAwMTE5LVBST0QtMQorIyAgCisjICBGaWxl
OiBxY29tL3ZwdS92cHUyMF9wMS5tYm4KKyMgIExpbms6IHFjb20vdnB1LTIuMC92ZW51cy5tYm4g
LT4gLi4vdnB1L3ZwdTIwX3AxLm1ibgorIyBAQCAtNjUyNyw2ICs2NTYzLDggQEAKKyMgIFZlcnNp
b246IENEU1AuSFQuMi42LTAwNjk4LU1BS0VOQS0xCisjICBGaWxlOiBxY29tL3NjODI4MHhwL0xF
Tk9WTy8yMUJYL3Fjc2xwaTgyODAubWJuCisjICBWZXJzaW9uOiBTTFBJLkhZLjQuMS0wMDA0OC1N
QUtFTkEtMQorIyArRmlsZTogcWNvbS94MWU4MDEwMC9MRU5PVk8vMjFOMS9xY3ZzczgzODAubWJu
CisjICtWZXJzaW9uOiB2ZnctMy4xOnJlbDAwODUtMDcwZmEzMzExZDllZjk2ODAxNWZlZTdmZWEw
NzE5OGQ3ZWIyMDhhMQorIyAgRmlsZTogcWNvbS94MWU4MDEwMC9hZHNwLm1ibgorIyAgRmlsZTog
cWNvbS94MWU4MDEwMC9hZHNwX2R0Yi5tYm4KKyMgIFZlcnNpb246IEFEU1AuSFQuNS45LTAwNzk2
LUhBTU9BLTEKKyMgQEAgLTY1NDYsNiArNjU4NCwyMSBAQAorIyAgUmF3RmlsZTogcWNvbS94MWU4
MDEwMC9MRU5PVk8vMjFOMS9jZHNwci5qc24KKyMgIEZpbGU6IHFjb20veDFlODAxMDAvTEVOT1ZP
LzIxTjEvcWNkeGttc3VjODM4MC5tYm4KKyMgIFJhd0ZpbGU6IHFjb20veDFlODAxMDAvTEVOT1ZP
LzIxTjEvYmF0dG1nci5qc24KKyMgK0ZpbGU6IHFjb20veDFlODAxMDAvTEVOT1ZPLzgzRUQvYWRz
cF9kdGJzLmVsZgorIyArUmF3RmlsZTogcWNvbS94MWU4MDEwMC9MRU5PVk8vODNFRC9hZHNwci5q
c24KKyMgK1Jhd0ZpbGU6IHFjb20veDFlODAxMDAvTEVOT1ZPLzgzRUQvYWRzcHMuanNuCisjICtS
YXdGaWxlOiBxY29tL3gxZTgwMTAwL0xFTk9WTy84M0VEL2Fkc3B1YS5qc24KKyMgK1Jhd0ZpbGU6
IHFjb20veDFlODAxMDAvTEVOT1ZPLzgzRUQvYmF0dG1nci5qc24KKyMgK1Jhd0ZpbGU6IHFjb20v
eDFlODAxMDAvTEVOT1ZPLzgzRUQvY2RzcHIuanNuCisjICtGaWxlOiBxY29tL3gxZTgwMTAwL0xF
Tk9WTy84M0VEL3FjYWRzcDgzODAubWJuCisjICtWZXJzaW9uOiBBRFNQLkhULjUuOS5jMS0wMDA1
OS1IQU1PQS0xCisjICtGaWxlOiBxY29tL3gxZTgwMTAwL0xFTk9WTy84M0VEL3FjYXYxZTgzODAu
bWJuCisjICtWZXJzaW9uOiBDRFNQLkhULjIuOS5jMi0wMDA1MS1IQU1PQS0xCisjICtGaWxlOiBx
Y29tL3gxZTgwMTAwL0xFTk9WTy84M0VEL3FjY2RzcDgzODAubWJuCisjICtWZXJzaW9uOiBDRFNQ
LkhULjIuOS5jMi0wMDA1MS1IQU1PQS0xCisjICtGaWxlOiBxY29tL3gxZTgwMTAwL0xFTk9WTy84
M0VEL3FjZHhrbXN1YzgzODAubWJuCisjICtGaWxlOiBxY29tL3gxZTgwMTAwL0xFTk9WTy84M0VE
L3FjdnNzODM4MC5tYm4KKyMgK1ZlcnNpb246IHZpZGVvLWZpcm13YXJlLjMuMS1lNWFlYTIwYzY0
Y2I2ZGY5YTFjOWJlOTllMjA2MDUzYjM2NDI0OTM5CisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJp
YnV0YWJsZS4gU2VlIExJQ0VOU0UucWNvbSBhbmQgcWNvbS9OT1RJQ0UudHh0IGZvciBkZXRhaWxz
CisjICAKKyMgQEAgLTY1NzgsNiArNjYzMSwxNSBAQAorIyAgVmVyc2lvbjogRFNQLkFULjEuMC4x
LTAwMDc5LjItTEVNQU5TLTEKKyMgIFJhd0ZpbGU6IHFjb20vc2E4Nzc1cC9ncGRzcDFyLmpzbgor
IyAgUmF3RmlsZTogcWNvbS9zYTg3NzVwL2dwZHNwci5qc24KKyMgK0ZpbGU6IHFjb20vcWNzODMw
MC9hZHNwLm1ibgorIyArVmVyc2lvbjogRFNQLkFULjEuMC4xLTAwMDk2LUxFTUFOUy0xCisjICtS
YXdGaWxlOiBxY29tL3FjczgzMDAvYWRzcHIuanNuCisjICtSYXdGaWxlOiBxY29tL3FjczgzMDAv
YWRzcHVhLmpzbgorIyArRmlsZTogcWNvbS9xY3M4MzAwL2Nkc3AwLm1ibgorIyArVmVyc2lvbjog
RFNQLkFULjEuMC4xLTAwMDk2LUxFTUFOUy0xCisjICtSYXdGaWxlOiBxY29tL3FjczgzMDAvY2Rz
cHIuanNuCisjICtGaWxlOiBxY29tL3FjczgzMDAvZ3Bkc3AwLm1ibgorIyArVmVyc2lvbjogRFNQ
LkFULjEuMC4xLTAwMDk2LUxFTUFOUy0xCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJs
ZS4gU2VlIExJQ0VOU0UucWNvbS0yIGFuZCBxY29tL05PVElDRS50eHQgZm9yIGRldGFpbHMKKyMg
IAorIyBAQCAtNjY3MSw2ICs2NzMzLDEwIEBACisjICBGaWxlOiBtZWxsYW5veC9tbHhzd19zcGVj
dHJ1bTItMjkuMjAxMi4xMDEyLm1mYTIKKyMgIEZpbGU6IG1lbGxhbm94L21seHN3X3NwZWN0cnVt
My0zMC4yMDEyLjEwMTIubWZhMgorIyAgRmlsZTogbWVsbGFub3gvbWx4c3dfc3BlY3RydW00LTM0
LjIwMTIuMTAxMi5tZmEyCisjICtGaWxlOiBtZWxsYW5veC9tbHhzd19zcGVjdHJ1bS0xMy4yMDE0
LjQwMTIubWZhMgorIyArRmlsZTogbWVsbGFub3gvbWx4c3dfc3BlY3RydW0yLTI5LjIwMTQuNDAx
Mi5tZmEyCisjICtGaWxlOiBtZWxsYW5veC9tbHhzd19zcGVjdHJ1bTMtMzAuMjAxNC40MDEyLm1m
YTIKKyMgK0ZpbGU6IG1lbGxhbm94L21seHN3X3NwZWN0cnVtNC0zNC4yMDE0LjQwMTIubWZhMgor
IyAgCisjICBMaWNlbmNlOgorIyAgIENvcHlyaWdodCAoYykgMjAxNy0yMDIwIE1lbGxhbm94IFRl
Y2hub2xvZ2llcywgTHRkLiBBbGwgcmlnaHRzIHJlc2VydmVkLgorIyBAQCAtNzY2Miw2ICs3NzI4
LDU3IEBACisjICBMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4YjhmLWwx
LmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhiOGYtcjEuYmluCisjICBGaWxlOiBj
aXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4YjkyLmJpbgorIyAgTGluazogY2lycnVz
L2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGMyNi5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1w
cm90LTEwM2M4YjQ1LmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0x
MDNjOGQ5Zi53bWZ3IC0+IGNzMzVsNDEvdjYuODMuMC9oYWxvX2NzcGxfUkFNX3JldkIyXzI5Ljg1
LjAud21mdworIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGRhNy53
bWZ3IC0+IGNzMzVsNDEvdjYuODMuMC9oYWxvX2NzcGxfUkFNX3JldkIyXzI5Ljg1LjAud21mdwor
IyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGUzNi53bWZ3IC0+IGNz
MzVsNDEvdjYuODMuMC9oYWxvX2NzcGxfUkFNX3JldkIyXzI5Ljg1LjAud21mdworIyArRmlsZTog
Y2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGQ5Zi1zcGtpZDAuYmluCisjICtGaWxl
OiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4ZDlmLXNwa2lkMS5iaW4KKyMgK0xp
bms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhkYTctc3BraWQwLmJpbiAtPiBj
czM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhkOWYtc3BraWQwLmJpbgorIyArTGluazogY2lycnVz
L2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGRhNy1zcGtpZDEuYmluIC0+IGNzMzVsNDEtZHNw
MS1zcGstcHJvdC0xMDNjOGQ5Zi1zcGtpZDEuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1k
c3AxLXNway1wcm90LTEwM2M4ZTM2LXNwa2lkMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1wcm90
LTEwM2M4ZDlmLXNwa2lkMC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXBy
b3QtMTAzYzhlMzYtc3BraWQxLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhkOWYt
c3BraWQxLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGRh
MC53bWZ3IC0+IGNzMzVsNDEvdjYuODMuMC9oYWxvX2NzcGxfUkFNX3JldkIyXzI5Ljg1LjAud21m
dworIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGRhMS53bWZ3IC0+
IGNzMzVsNDEvdjYuODMuMC9oYWxvX2NzcGxfUkFNX3JldkIyXzI5Ljg1LjAud21mdworIyArTGlu
azogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGUzNy53bWZ3IC0+IGNzMzVsNDEv
djYuODMuMC9oYWxvX2NzcGxfUkFNX3JldkIyXzI5Ljg1LjAud21mdworIyArTGluazogY2lycnVz
L2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGRhOC53bWZ3IC0+IGNzMzVsNDEvdjYuODMuMC9o
YWxvX2NzcGxfUkFNX3JldkIyXzI5Ljg1LjAud21mdworIyArRmlsZTogY2lycnVzL2NzMzVsNDEt
ZHNwMS1zcGstcHJvdC0xMDNjOGRhMC1zcGtpZDAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0
MS1kc3AxLXNway1wcm90LTEwM2M4ZGEwLXNwa2lkMS5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1
bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhkYTEtc3BraWQwLmJpbiAtPiBjczM1bDQxLWRzcDEtc3Br
LXByb3QtMTAzYzhkYTAtc3BraWQwLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1z
cGstcHJvdC0xMDNjOGRhMS1zcGtpZDEuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNj
OGRhMC1zcGtpZDEuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEw
M2M4ZTM3LXNwa2lkMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4ZGEwLXNwa2lk
MC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhlMzctc3Br
aWQxLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhkYTAtc3BraWQxLmJpbgorIyAr
TGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGRhOC1zcGtpZDAuYmluIC0+
IGNzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGRhMC1zcGtpZDAuYmluCisjICtMaW5rOiBjaXJy
dXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4ZGE4LXNwa2lkMS5iaW4gLT4gY3MzNWw0MS1k
c3AxLXNway1wcm90LTEwM2M4ZGEwLXNwa2lkMS5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQx
LWRzcDEtc3BrLXByb3QtMTAzYzhkOWIud21mdyAtPiBjczM1bDQxL3Y2LjgzLjAvaGFsb19jc3Bs
X1JBTV9yZXZCMl8yOS44NS4wLndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3Br
LXByb3QtMTAzYzhkOWMud21mdyAtPiBjczM1bDQxL3Y2LjgzLjAvaGFsb19jc3BsX1JBTV9yZXZC
Ml8yOS44NS4wLndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTAz
YzhkOWQud21mdyAtPiBjczM1bDQxL3Y2LjgzLjAvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS44NS4w
LndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhkOWUud21m
dyAtPiBjczM1bDQxL3Y2LjgzLjAvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS44NS4wLndtZncKKyMg
K0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhkOWItc3BraWQwLmJpbgor
IyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGQ5Yi1zcGtpZDEuYmlu
CisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4ZDljLXNwa2lkMC5i
aW4gLT4gY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4ZDliLXNwa2lkMC5iaW4KKyMgK0xpbms6
IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhkOWMtc3BraWQxLmJpbiAtPiBjczM1
bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhkOWItc3BraWQxLmJpbgorIyArTGluazogY2lycnVzL2Nz
MzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGQ5ZC1zcGtpZDAuYmluIC0+IGNzMzVsNDEtZHNwMS1z
cGstcHJvdC0xMDNjOGQ5Yi1zcGtpZDAuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3Ax
LXNway1wcm90LTEwM2M4ZDlkLXNwa2lkMS5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1wcm90LTEw
M2M4ZDliLXNwa2lkMS5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3Qt
MTAzYzhkOWUtc3BraWQwLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhkOWItc3Br
aWQwLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGQ5ZS1z
cGtpZDEuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGQ5Yi1zcGtpZDEuYmluCisj
ICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4ZTExLndtZncgLT4gY3Mz
NWw0MS92Ni44My4wL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuODUuMC53bWZ3CisjICtMaW5rOiBj
aXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4ZTEyLndtZncgLT4gY3MzNWw0MS92Ni44
My4wL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuODUuMC53bWZ3CisjICtMaW5rOiBjaXJydXMvY3Mz
NWw0MS1kc3AxLXNway1wcm90LTEwM2M4ZTEzLndtZncgLT4gY3MzNWw0MS92Ni44My4wL2hhbG9f
Y3NwbF9SQU1fcmV2QjJfMjkuODUuMC53bWZ3CisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3Ax
LXNway1wcm90LTEwM2M4ZTYwLndtZncgLT4gY3MzNWw0MS92Ni44My4wL2hhbG9fY3NwbF9SQU1f
cmV2QjJfMjkuODUuMC53bWZ3CisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90
LTEwM2M4ZTYxLndtZncgLT4gY3MzNWw0MS92Ni44My4wL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjku
ODUuMC53bWZ3CisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4ZTYy
LndtZncgLT4gY3MzNWw0MS92Ni44My4wL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuODUuMC53bWZ3
CisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4ZTExLXNwa2lkMC5i
aW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhlMTEtc3BraWQx
LmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGUxMi1zcGtp
ZDAuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGUxMS1zcGtpZDAuYmluCisjICtM
aW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4ZTEyLXNwa2lkMS5iaW4gLT4g
Y3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4ZTExLXNwa2lkMS5iaW4KKyMgK0xpbms6IGNpcnJ1
cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhlMTMtc3BraWQwLmJpbiAtPiBjczM1bDQxLWRz
cDEtc3BrLXByb3QtMTAzYzhlMTEtc3BraWQwLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEt
ZHNwMS1zcGstcHJvdC0xMDNjOGUxMy1zcGtpZDEuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstcHJv
dC0xMDNjOGUxMS1zcGtpZDEuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1w
cm90LTEwM2M4ZTYwLXNwa2lkMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4ZTEx
LXNwa2lkMC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhl
NjAtc3BraWQxLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhlMTEtc3BraWQxLmJp
bgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGU2MS1zcGtpZDAu
YmluIC0+IGNzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGUxMS1zcGtpZDAuYmluCisjICtMaW5r
OiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4ZTYxLXNwa2lkMS5iaW4gLT4gY3Mz
NWw0MS1kc3AxLXNway1wcm90LTEwM2M4ZTExLXNwa2lkMS5iaW4KKyMgK0xpbms6IGNpcnJ1cy9j
czM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhlNjItc3BraWQwLmJpbiAtPiBjczM1bDQxLWRzcDEt
c3BrLXByb3QtMTAzYzhlMTEtc3BraWQwLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNw
MS1zcGstcHJvdC0xMDNjOGU2Mi1zcGtpZDEuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstcHJvdC0x
MDNjOGUxMS1zcGtpZDEuYmluCisjICBMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90
LTEwMjgwY2JkLndtZncgLT4gY3MzNWw0MS92Ni42MS4xL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjku
NjMuMS53bWZ3CisjICBMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwMjgwY2Jl
LndtZncgLT4gY3MzNWw0MS92Ni42MS4xL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuNjMuMS53bWZ3
CisjICBMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwMjgwY2JmLndtZncgLT4g
Y3MzNWw0MS92Ni42MS4xL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuNjMuMS53bWZ3CisjIEBAIC03
ODgyLDEyICs3OTk5LDEyIEBACisjICBMaW5rOiBjaXJydXMvY3MzNWw1NC1iMC1kc3AxLW1pc2Mt
MTAzYzhlMWEud21mdyAtPiBjczM1bDU2L0NTMzVMNTZfUmV2My4xMS4xMS4xLndtZncKKyMgIExp
bms6IGNpcnJ1cy9jczM1bDU0LWIwLWRzcDEtbWlzYy0xMDNjOGUxYS1hbXAxLmJpbiAtPiBjczM1
bDU0LWIwLWRzcDEtbWlzYy0xMDNjOGUxNS1hbXAxLmJpbgorIyAgTGluazogY2lycnVzL2NzMzVs
NTQtYjAtZHNwMS1taXNjLTEwM2M4ZTFhLWFtcDIuYmluIC0+IGNzMzVsNTQtYjAtZHNwMS1taXNj
LTEwM2M4ZTE1LWFtcDIuYmluCisjIC1MaW5rOiBjaXJydXMvY3MzNWw1NC1iMC1kc3AxLW1pc2Mt
MTAzYzhlMWIud21mdyAtPiBjczM1bDU2L0NTMzVMNTZfUmV2My4xMS4xMS4xLndtZncKKyMgLUZp
bGU6IGNpcnJ1cy9jczM1bDU0LWIwLWRzcDEtbWlzYy0xMDNjOGUxYi1hbXAxLmJpbgorIyAtRmls
ZTogY2lycnVzL2NzMzVsNTQtYjAtZHNwMS1taXNjLTEwM2M4ZTFiLWFtcDIuYmluCisjIC1MaW5r
OiBjaXJydXMvY3MzNWw1NC1iMC1kc3AxLW1pc2MtMTAzYzhlMWMud21mdyAtPiBjczM1bDU2L0NT
MzVMNTZfUmV2My4xMS4xMS4xLndtZncKKyMgLUxpbms6IGNpcnJ1cy9jczM1bDU0LWIwLWRzcDEt
bWlzYy0xMDNjOGUxYy1hbXAxLmJpbiAtPiBjczM1bDU0LWIwLWRzcDEtbWlzYy0xMDNjOGUxYi1h
bXAxLmJpbgorIyAtTGluazogY2lycnVzL2NzMzVsNTQtYjAtZHNwMS1taXNjLTEwM2M4ZTFjLWFt
cDIuYmluIC0+IGNzMzVsNTQtYjAtZHNwMS1taXNjLTEwM2M4ZTFiLWFtcDIuYmluCisjICtMaW5r
OiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTAzYzhlMWIud21mdyAtPiBjczM1bDU2L0NT
MzVMNTZfUmV2My4xMS4xMS4xLndtZncKKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEt
bWlzYy0xMDNjOGUxYi1hbXAxLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1t
aXNjLTEwM2M4ZTFiLWFtcDIuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1p
c2MtMTAzYzhlMWMud21mdyAtPiBjczM1bDU2L0NTMzVMNTZfUmV2My4xMS4xMS4xLndtZncKKyMg
K0xpbms6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xMDNjOGUxYy1hbXAxLmJpbiAtPiBj
czM1bDU2LWIwLWRzcDEtbWlzYy0xMDNjOGUxYi1hbXAxLmJpbgorIyArTGluazogY2lycnVzL2Nz
MzVsNTYtYjAtZHNwMS1taXNjLTEwM2M4ZTFjLWFtcDIuYmluIC0+IGNzMzVsNTYtYjAtZHNwMS1t
aXNjLTEwM2M4ZTFiLWFtcDIuYmluCisjICBMaW5rOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1p
c2MtMTAzYzhlMmMud21mdyAtPiBjczM1bDU2L0NTMzVMNTZfUmV2My4xMS4xMS4xLndtZncKKyMg
IExpbms6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xMDNjOGUyYy1hbXAxLmJpbiAtPiBj
czM1bDU2LWIwLWRzcDEtbWlzYy0xMDNjOGQ5MC1hbXAxLmJpbgorIyAgTGluazogY2lycnVzL2Nz
MzVsNTYtYjAtZHNwMS1taXNjLTEwM2M4ZTJjLWFtcDIuYmluIC0+IGNzMzVsNTYtYjAtZHNwMS1t
aXNjLTEwM2M4ZDkwLWFtcDIuYmluCisjIEBAIC03OTA2LDYgKzgwMjMsOCBAQAorIyAgTGluazog
Y2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTEwNDMxMjY0LndtZncgLT4gY3MzNWw1Ni9DUzM1
TDU2X1JldjMuMTEuMTYud21mdworIyAgTGluazogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNj
LTEwNDMxMjY0LWFtcDEuYmluIC0+IGNzMzVsNTYtYjAtZHNwMS1taXNjLTEwNDMxZGYzLWFtcDEu
YmluCisjICBMaW5rOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTA0MzEyNjQtYW1wMi5i
aW4gLT4gY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTA0MzFkZjMtYW1wMi5iaW4KKyMgK0xpbms6IGNp
cnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xMDQzMTI2NC1hbXAzLmJpbiAtPiBjczM1bDU2LWIw
LWRzcDEtbWlzYy0xMDQzMWRmMy1hbXAzLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNTYtYjAt
ZHNwMS1taXNjLTEwNDMxMjY0LWFtcDQuYmluIC0+IGNzMzVsNTYtYjAtZHNwMS1taXNjLTEwNDMx
ZGYzLWFtcDQuYmluCisjICBMaW5rOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTA0MzFi
MTMtc3BraWQwLndtZncgLT4gY3MzNWw1Ni9DUzM1TDU2X1JldjMuMTEuMTYud21mdworIyAgRmls
ZTogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTEwNDMxYjEzLXNwa2lkMC1hbXAxLmJpbgor
IyAgRmlsZTogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTEwNDMxYjEzLXNwa2lkMC1hbXAy
LmJpbgorIyBAQCAtODAzOSw2ICs4MTU4LDE0IEBACisjICBGaWxlOiBtZWRpYXRlay9zb2YtdHBs
Zy9zb2YtbXQ4MTk1LW10NjM1OS1tYXg5ODM5MC1ydDU2ODIudHBsZworIyAgVmVyc2lvbjogdjAu
NC4zCisjICAKKyMgK0ZpbGU6IG1lZGlhdGVrL3NvZi9zb2YtbXQ4MTg4LnJpCisjICtGaWxlOiBt
ZWRpYXRlay9zb2Yvc29mLW10ODE4OC5sZGMKKyMgK0ZpbGU6IG1lZGlhdGVrL3NvZi10cGxnL3Nv
Zi1tdDgxODgudHBsZworIyArVmVyc2lvbjogdjIuOAorIyArCisjICtGaWxlOiBtZWRpYXRlay9z
b2YtdHBsZy9zb2YtbXQ4MTk1LnRwbGcKKyMgK1ZlcnNpb246IHYyLjgKKyMgKworIyAgTGljZW5j
ZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5tZWRpYXRlayBmb3IgZGV0YWlscy4KKyMg
IAorIyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgQEAgLTgxMjgsNiArODI1NSwyMSBAQAorIyAgCisj
ICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisjICtEcml2ZXI6IHFjb20teDFlODAxMDAgLSBRdWFs
Y29tbSBBU29DIHRwbGcgRmlybXdhcmUKKyMgK0ZpbGU6IHFjb20veDFlODAxMDAvTEVOT1ZPLzIx
TjEvWDFFODAxMDAtTEVOT1ZPLVRoaW5rcGFkLVQxNHMtdHBsZy5iaW4KKyMgK0xpbms6IHFjb20v
eDFlODAxMDAvWDFFODAxMDAtTEVOT1ZPLVRoaW5rcGFkLVQxNHMtdHBsZy5iaW4gLT4gTEVOT1ZP
LzIxTjEvWDFFODAxMDAtTEVOT1ZPLVRoaW5rcGFkLVQxNHMtdHBsZy5iaW4KKyMgK1ZlcnNpb246
IHYwLjEuMAorIyArSW5mbzogREFURT0xNy4wMy4yMDI1CisjICsKKyMgK0ZpbGU6IHFjb20veDFl
ODAxMDAvTEVOT1ZPLzgzRUQvWDFFODAxMDAtTEVOT1ZPLVlvZ2EtU2xpbTd4LXRwbGcuYmluCisj
ICtMaW5rOiBxY29tL3gxZTgwMTAwL1gxRTgwMTAwLUxFTk9WTy1Zb2dhLVNsaW03eC10cGxnLmJp
biAtPiBMRU5PVk8vODNFRC9YMUU4MDEwMC1MRU5PVk8tWW9nYS1TbGltN3gtdHBsZy5iaW4KKyMg
K1ZlcnNpb246IHYwLjEuMAorIyArSW5mbzogREFURT0xNy4wMy4yMDI1CisjICsKKyMgK0xpY2Vu
Y2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UubGluYXJvIGZvciBkZXRhaWxzCisjICtP
cmlnaW5hdGVzIGZyb20gaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4LW1zbS9hdWRpb3JlYWNoLXRv
cG9sb2d5LmdpdAorIyArCisjICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgRHJpdmVyOiB0aS10YXMy
NzgxIC0gdGFzMjc4MSBmaXJtd2FyZQorIyAgRmlsZTogdGkvdGFzMjc4MS9UQVMyWFhYMEM5NC5i
aW4KKyMgIEZpbGU6IHRpL3RhczI3ODEvVEFTMlhYWDBDOTUuYmluCisjIEBAIC04MzQzLDExICs4
NDg1LDExIEBACisjICBEcml2ZXI6IGludGVsX3ZwdSAtLSBJbnRlbCBOUFUgZHJpdmVyCisjICAK
KyMgIEZpbGU6IGludGVsL3ZwdS92cHVfMzd4eF92MS5iaW4KKyMgLVZlcnNpb246IGNpX3RhZ191
ZDIwMjUwNF92cHVfcmNfMjAyNTAxMTVfMTkwNQorIyArVmVyc2lvbjogY2lfdGFnX3VkMjAyNTEy
X3ZwdV9yY18yMDI1MDMwNl8xMTMwCisjICBMaW5rOiBpbnRlbC92cHUvdnB1XzM3eHhfdjAuMC5i
aW4gLT4gdnB1XzM3eHhfdjEuYmluCisjICAKKyMgIEZpbGU6IGludGVsL3ZwdS92cHVfNDB4eF92
MS5iaW4KKyMgLVZlcnNpb246IGNpX3RhZ191ZDIwMjUwNF92cHVfcmNfMjAyNTAxMTVfMTkwNQor
IyArVmVyc2lvbjogY2lfdGFnX3VkMjAyNTEyX3ZwdV9yY18yMDI1MDMwNl8xMTMwCisjICBMaW5r
OiBpbnRlbC92cHUvdnB1XzQweHhfdjAuMC5iaW4gLT4gdnB1XzQweHhfdjEuYmluCisjICAKKyMg
IExpY2Vuc2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UuaW50ZWxfdnB1IGZvciBkZXRh
aWxzCisjIAorIworCiBTVU1NQVJZID0gIkZpcm13YXJlIGZpbGVzIGZvciB1c2Ugd2l0aCBMaW51
eCBrZXJuZWwiCiBIT01FUEFHRSA9ICJodHRwczovL3d3dy5rZXJuZWwub3JnLyIKIERFU0NSSVBU
SU9OID0gIkxpbnV4IGZpcm13YXJlIGlzIGEgcGFja2FnZSBkaXN0cmlidXRlZCBhbG9uZ3NpZGUg
dGhlIExpbnV4IGtlcm5lbCBcCkBAIC0xNTYsNyArNTY1LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vTElDRU5DRS5BYmlsaXM7bWQ1PWI1ZWUzZjQxMDc4MGU1NjcxMWFkNDhlYWRjMjJi
OGJjIFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOQ0UueGM1MDAwO21kNT0xZTE3
MGMxMzE3NTMyM2MzMmM3ZjRkMDk5OGQ1M2Y2NiBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6
Ly9MSUNFTkNFLnhjNTAwMGM7bWQ1PTEyYjAyZWZhMzA0OWRiNjVkNTI0YWViNDE4ZGQ4N2NhIFwK
ICAgICAgICAgICAgICAgICAgICAgZmlsZTovL3dmeC9MSUNFTkNFLndmMjAwO21kNT00ZDFiZWZm
MDBkOTAyYzA1YzljN2U5NWE1ZDhlYjUyZCBcCi0gICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9X
SEVOQ0U7bWQ1PSR7V0hFTkNFX0NIS1NVTX0gXAorICAgICAgICAgICAgICAgICAgICBmaWxlOi8v
V0hFTkNFO21kNT03ZGRmYjQ0YzE2ZTM0ZGNkOGJiYWNjNDgzOWFiNzhkYyBcCiAgICAgICAgICAg
ICAgICAgICAgICIKICMgV0hFTkNFIGNoZWNrc3VtIGlzIGRlZmluZWQgc2VwYXJhdGVseSB0byBl
YXNlIG92ZXJyaWRpbmcgaXQgaWYKICMgY2xhc3MtZGV2dXBzdHJlYW0gaXMgc2VsZWN0ZWQuCkBA
IC0yNTAsNyArNjU5LDcgQEAgU1JDX1VSSTpjbGFzcy1kZXZ1cHN0cmVhbSA9ICJnaXQ6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvZmlybXcKICMgUGluIHRoaXMgdG8g
dGhlIDIwMjIwNTA5IHJlbGVhc2UsIG92ZXJyaWRlIHRoaXMgaW4gbG9jYWwuY29uZgogU1JDUkVW
OmNsYXNzLWRldnVwc3RyZWFtID89ICJiMTljYmRjYTc4YWIyYWRmZDIxMGM5MWJlMTVhMjI1Njhl
OGI4Y2FlIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjEwODNhMzZmMTlhZWE0NmY2NjFkY2Zk
NGNkNDYyZDEzOTMzZGNiNGU3ZjBkYzgwOTUyNTU1MmRkNWMzNTQxZCIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICIyYWU2YWFiMmQ4OTMwZmQ1NGJmMzBhZTE1NDk4ZjE2MjU3MjFiYzM2MzBiODk0NjQ0
ZGI1ZDIxZmFkNWEyMGY5IgogCiBpbmhlcml0IGFsbGFyY2gKIAotLSAKMi40Ny4xCgo=

--===============4471392081627547756==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/linux-firmware: SRC_URI changed from "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20250311.tar.xz" to "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20250410.tar.xz"
packages/all-poky-linux/linux-firmware: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-aldebaran: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-aldebaran: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-carrizo: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-carrizo: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-cezanne: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-cezanne: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-fiji: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-fiji: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-hawaii: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-hawaii: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-misc: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-misc: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-misc: PKGSIZE changed from 57776452 to 57781828 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi10: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi10: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi14: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi14: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi21: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi21: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi22: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi22: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi23: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi23: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi24: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi24: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi31: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi31: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi32: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi32: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-oland: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-oland: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-polaris10: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-polaris10: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-polaris11: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-polaris11: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-polaris12: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-polaris12: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-raven: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-raven: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-rembrandt: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-rembrandt: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-renoir: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-renoir: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-stoney: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-stoney: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-tonga: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-tonga: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-topaz: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-topaz: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-vega10: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-vega10: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-vega12: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-vega12: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar5523: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ar5523: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-misc: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-misc: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca4019: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca4019: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca6174: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca6174: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca9377: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca9377: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca9887: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca9887: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca9888: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca9888: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca988x: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca988x: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca9984: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca9984: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca99x0: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca99x0: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-wcn3990: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-wcn3990: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-ipq5018: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-ipq5018: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-ipq6018: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-ipq6018: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-ipq8074: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-ipq8074: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-misc: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-misc: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qca2066: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qca2066: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qca6390: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qca6390: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qca6698aq: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qca6698aq: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qcn9074: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qcn9074: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-wcn6750: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-wcn6750: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-wcn6855: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-wcn6855: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k-misc: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k-misc: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k-qcn9274: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k-qcn9274: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k-wcn7850: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k-wcn7850: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2x: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2x: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cc33xx: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-cc33xx: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: FILELIST: removed "/usr/lib/firmware/cirrus/cs35l54-b0-dsp1-misc-103c8e1c.wmfw /usr/lib/firmware/cirrus/cs35l54-b0-dsp1-misc-103c8e1b.wmfw /usr/lib/firmware/cirrus/cs35l54-b0-dsp1-misc-103c8e1c-amp2.bin /usr/lib/firmware/cirrus/cs35l54-b0-dsp1-misc-103c8e1c-amp1.bin /usr/lib/firmware/cirrus/cs35l54-b0-dsp1-misc-103c8e1b-amp1.bin /usr/lib/firmware/cirrus/cs35l54-b0-dsp1-misc-103c8e1b-amp2.bin", added "/usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-103c8e1b.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-103c8e1c.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e11-spkid0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8da8-spkid1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8da8-spkid0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e11-spkid1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e12-spkid0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e12-spkid1.bin /usr/lib/f
 irmware/cirrus/cs35l41-dsp1-spk-prot-103c8e13-spkid0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e13-spkid1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e36-spkid0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e36-spkid1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8da1.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8da7.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8da8.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8da7-spkid0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8da7-spkid1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e37-spkid0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e37-spkid1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e60-spkid0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e60-spkid1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e61-spkid0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e61-spkid1.bin /usr/lib/firmware/ci
 rrus/cs35l41-dsp1-spk-prot-103c8e62-spkid0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e62-spkid1.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-103c8e1c-amp2.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8d9b-spkid0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8d9b-spkid1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8d9c-spkid0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8d9c-spkid1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8d9d-spkid0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8d9d-spkid1.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10431264-amp4.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-103c8e1b-amp1.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-103c8e1c-amp1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8d9e-spkid0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8d9e-spkid1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8d9f-spkid0.bin /usr/lib/firmware/cirrus
 /cs35l41-dsp1-spk-prot-103c8d9f-spkid1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8da0-spkid0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8da0-spkid1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8da1-spkid0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8da1-spkid1.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10431264-amp3.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8d9b.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8d9c.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8d9d.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8d9e.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8d9f.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e11.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e12.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e13.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e36.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e37.wmfw /usr/lib/fir
 mware/cirrus/cs35l41-dsp1-spk-prot-103c8e60.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e61.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e62.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8da0.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-103c8e1b-amp2.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: PKGSIZE changed from 3645351 to 3685161 (+1%)
packages/all-poky-linux/linux-firmware/linux-firmware-cnm-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-cnm-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cnm: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-cnm: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-18: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-18: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: FILELIST: added "/usr/lib/firmware/intel/ibt-0190-0291-usb.sfi /usr/lib/firmware/intel/ibt-0190-0291-usb.ddc /usr/lib/firmware/intel/ibt-0190-0041-pci.sfi /usr/lib/firmware/intel/ibt-0190-0291-pci.sfi /usr/lib/firmware/intel/ibt-0190-0041-pci.ddc /usr/lib/firmware/intel/ibt-0190-0291-pci.ddc /usr/lib/firmware/intel/ibt-0190-0041-usb.ddc /usr/lib/firmware/intel/ibt-0190-0041-usb.sfi"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGSIZE changed from 25122558 to 28436590 (+13%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9260: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9260: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: FILELIST: added "/usr/lib/firmware/iwlwifi-bz-b0-fm-c0-97.ucode /usr/lib/firmware/iwlwifi-gl-c0-fm-c0-97.ucode /usr/lib/firmware/iwlwifi-bz-b0-gf-a0-97.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PKGSIZE changed from 185648544 to 191259744 (+3%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-license: FILELIST: added "/usr/lib/firmware/LICENSE.aeonsemi"
packages/all-poky-linux/linux-firmware/linux-firmware-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGSIZE changed from 118966 to 119586 (+1%)
packages/all-poky-linux/linux-firmware/linux-firmware-linaro-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-linaro-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mali-csffw-arch108: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-mali-csffw-arch108: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mali-csffw-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-mali-csffw-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek: FILELIST: added "/usr/lib/firmware/mediatek/mt8188/scp.img /usr/lib/firmware/mediatek/sof/sof-mt8188.ri /usr/lib/firmware/mediatek/sof-tplg/sof-mt8188.tplg /usr/lib/firmware/mediatek/sof-tplg/sof-mt8195.tplg /usr/lib/firmware/mediatek/sof/sof-mt8188.ldc"
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek: PKGSIZE changed from 45542913 to 46378231 (+2%)
packages/all-poky-linux/linux-firmware/linux-firmware-mellanox: FILELIST: added "/usr/lib/firmware/mellanox/mlxsw_spectrum3-30.2014.4012.mfa2 /usr/lib/firmware/mellanox/mlxsw_spectrum2-29.2014.4012.mfa2 /usr/lib/firmware/mellanox/mlxsw_spectrum-13.2014.4012.mfa2 /usr/lib/firmware/mellanox/mlxsw_spectrum4-34.2014.4012.mfa2"
packages/all-poky-linux/linux-firmware/linux-firmware-mellanox: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-mellanox: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mellanox: PKGSIZE changed from 85484140 to 98640572 (+15%)
packages/all-poky-linux/linux-firmware/linux-firmware-microchip-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-microchip-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-microchip: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-microchip: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-moxa-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-moxa-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-moxa: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-moxa: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7650: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7650: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x2: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x2: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8987-sdio: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8987-sdio: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-common: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-common: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-pcie: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-pcie: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-sdio: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-sdio: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-common: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-common: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-pcie: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-pcie: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-sdio: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-sdio: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw416-sdio: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw416-sdio: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw612-sdio: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw612-sdio: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-olpc-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-olpc-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-olpc: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-olpc: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-powervr-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-powervr-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-powervr: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-powervr: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-prestera: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-prestera: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-misc: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-misc: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca2066: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca2066: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca61x4-serial: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca61x4-serial: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca61x4-usb: FILELIST: added "/usr/lib/firmware/qca/nvm_usb_00190200_0108.bin /usr/lib/firmware/qca/nvm_usb_00190200_0109.bin /usr/lib/firmware/qca/nvm_usb_00190200_0111.bin /usr/lib/firmware/qca/nvm_usb_00190200_010c.bin /usr/lib/firmware/qca/nvm_usb_00190200_0104.bin /usr/lib/firmware/qca/nvm_usb_00190200_010a.bin /usr/lib/firmware/qca/nvm_usb_00190200_0106.bin /usr/lib/firmware/qca/nvm_usb_00190200_0110.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca61x4-usb: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca61x4-usb: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca61x4-usb: PKGSIZE changed from 1117172 to 1236203 (+11%)
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca6390: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca6390: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca6698: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca6698: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn3950: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn3950: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn3988: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn3988: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn399x: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn399x: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn6750: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn6750: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn7850: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn7850: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-2-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-2-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a623: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a623: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a663: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a663: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a702: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a702: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-g750: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-g750: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-aic100: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-aic100: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-modem: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-modem: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-wifi: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-wifi: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-adreno: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-adreno: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-adreno: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-adreno: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-audio: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-audio: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-modem: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-modem: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-wifi: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-wifi: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-adreno: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-adreno: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-audio: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-audio: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-compute: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-compute: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-ipa: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-ipa: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-wifi: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-wifi: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcs615-adreno: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcs615-adreno: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcs8300-adreno: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcs8300-adreno: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qdu100: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qdu100: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-adreno: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-adreno: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-audio: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-audio: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-compute: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-compute: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-modem: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-modem: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-wifi: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-wifi: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sa8775p-adreno: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sa8775p-adreno: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sa8775p-audio: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sa8775p-audio: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sa8775p-compute: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sa8775p-compute: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sa8775p-generalpurpose: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sa8775p-generalpurpose: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-adreno: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-adreno: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-thundercomm-db845c-sensors: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-thundercomm-db845c-sensors: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-adreno: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-adreno: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-thundercomm-rb5-sensors: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-thundercomm-rb5-sensors: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8550-audio-tplg: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8550-audio-tplg: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8650-audio-tplg: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8650-audio-tplg: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-6.0: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-6.0: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu: PKGSIZE changed from 8608749 to 8619213 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-adreno: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-adreno: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-audio: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-audio: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-t14s-g6-adreno: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-t14s-g6-adreno: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-t14s-g6-audio: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-t14s-g6-audio: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-t14s-g6-compute: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-t14s-g6-compute: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-yamato-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-yamato-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qed: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qed: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-dptx: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-dptx: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-nic: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-nic: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8761: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8761: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8822: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8822: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-src: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-src: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wfx-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-wfx-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wfx: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-wfx: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGSIZE changed from 323764 to 331923 (+3%)
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c-license: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c-license: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: added "/usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/X1E80100-LENOVO-Thinkpad-T14s-tplg.bin /usr/lib/firmware/qcom/x1e80100/LENOVO/83ED/qcadsp8380.mbn /usr/lib/firmware/qcom/x1e80100/LENOVO/83ED/qccdsp8380.mbn /usr/lib/firmware/qcom/qcs8300/adspua.jsn /usr/lib/firmware/qcom/x1e80100/X1E80100-LENOVO-Thinkpad-T14s-tplg.bin /usr/lib/firmware/qcom/x1e80100/LENOVO/83ED/adsps.jsn /usr/lib/firmware/qcom/qcs8300/gpdsp0.mbn /usr/lib/firmware/qcom/qcs8300/cdsp0.mbn /usr/lib/firmware/qcom/x1e80100/LENOVO/83ED/X1E80100-LENOVO-Yoga-Slim7x-tplg.bin /usr/lib/firmware/qcom/qcs8300/adsp.mbn /usr/lib/firmware/qcom/x1e80100/LENOVO/83ED/adspr.jsn /usr/lib/firmware/qcom/x1e80100/LENOVO/83ED/adsp_dtbs.elf /usr/lib/firmware/qcom/x1e80100/LENOVO/83ED/qcdxkmsuc8380.mbn /usr/lib/firmware/qcom/x1e80100/LENOVO/83ED/adspua.jsn /usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/qcvss8380.mbn /usr/lib/firmware/rtw88/rtw8814a_fw.bin /usr/lib/firmware/qcom/x1e8
 0100/LENOVO/83ED/qcvss8380.mbn /usr/lib/firmware/qcom/x1e80100/LENOVO/83ED/battmgr.jsn /usr/lib/firmware/qcom/x1e80100/X1E80100-LENOVO-Yoga-Slim7x-tplg.bin /usr/lib/firmware/aeonsemi/as21x1x_fw.bin /usr/lib/firmware/qcom/qcs8300/adspr.jsn /usr/lib/firmware/qcom/qcs8300/cdspr.jsn /usr/lib/firmware/qcom/x1e80100/LENOVO/83ED/cdspr.jsn /usr/lib/firmware/qcom/x1e80100/LENOVO/83ED/qcav1e8380.mbn"
packages/all-poky-linux/linux-firmware/linux-firmware: PV changed from "20250311" to "20250410"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGV changed from 20250311 [default] to 20250410 [default]
packages/all-poky-linux/linux-firmware/linux-firmware: PKGSIZE changed from 103809981 to 153081209 (+47%)

--===============4471392081627547756==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: FILELIST: removed "/usr/lib/firmware/cirrus/cs35l54-b0-dsp1-misc-103c8e1c.wmfw /usr/lib/firmware/cirrus/cs35l54-b0-dsp1-misc-103c8e1b.wmfw /usr/lib/firmware/cirrus/cs35l54-b0-dsp1-misc-103c8e1c-amp2.bin /usr/lib/firmware/cirrus/cs35l54-b0-dsp1-misc-103c8e1b-amp1.bin /usr/lib/firmware/cirrus/cs35l54-b0-dsp1-misc-103c8e1b-amp2.bin /usr/lib/firmware/cirrus/cs35l54-b0-dsp1-misc-103c8e1c-amp1.bin", added "/usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8da0.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8da1.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8da7.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8da8.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e11.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8da8-spkid1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8da8-spkid0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e11-spkid0.bin /usr/lib/firmware/cirrus/c
 s35l41-dsp1-spk-prot-103c8e11-spkid1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e12-spkid0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e12-spkid1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e13-spkid0.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10431264-amp4.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e13-spkid1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8d9f-spkid0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e12.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e13.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e36.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e37.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e60.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e61.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-103c8e1b-amp2.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-103c8e1c-amp2.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8d9f-spkid1.
 bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8da0-spkid0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8da0-spkid1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8da7-spkid1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8d9e-spkid0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8da1-spkid0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8da1-spkid1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8da7-spkid0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8d9b.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8d9c.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8d9d.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8d9e.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8d9f.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e60-spkid0.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-103c8e1c.wmfw /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-103c8e1b.wmfw /usr/lib/firmware/cirrus/cs35l41
 -dsp1-spk-prot-103c8e60-spkid1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e61-spkid0.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-103c8e1b-amp1.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-103c8e1c-amp1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e62-spkid0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e62.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e61-spkid1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e62-spkid1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8d9b-spkid0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8d9b-spkid1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8d9c-spkid0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8d9c-spkid1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8d9d-spkid0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8d9d-spkid1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e36-spkid0.bin /usr/lib/firmware/cirrus/cs35l41-dsp
 1-spk-prot-103c8e36-spkid1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e37-spkid0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e37-spkid1.bin /usr/lib/firmware/cirrus/cs35l56-b0-dsp1-misc-10431264-amp3.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8d9e-spkid1.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGSIZE changed from 25122558 to 28436590 (+13%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: FILELIST: added "/usr/lib/firmware/intel/ibt-0190-0041-pci.sfi /usr/lib/firmware/intel/ibt-0190-0041-usb.sfi /usr/lib/firmware/intel/ibt-0190-0291-usb.sfi /usr/lib/firmware/intel/ibt-0190-0291-pci.ddc /usr/lib/firmware/intel/ibt-0190-0291-usb.ddc /usr/lib/firmware/intel/ibt-0190-0041-usb.ddc /usr/lib/firmware/intel/ibt-0190-0041-pci.ddc /usr/lib/firmware/intel/ibt-0190-0291-pci.sfi"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: FILELIST: added "/usr/lib/firmware/iwlwifi-bz-b0-fm-c0-97.ucode /usr/lib/firmware/iwlwifi-bz-b0-gf-a0-97.ucode /usr/lib/firmware/iwlwifi-gl-c0-fm-c0-97.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-license: FILELIST: added "/usr/lib/firmware/LICENSE.aeonsemi"
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek: FILELIST: added "/usr/lib/firmware/mediatek/sof/sof-mt8188.ldc /usr/lib/firmware/mediatek/sof-tplg/sof-mt8195.tplg /usr/lib/firmware/mediatek/sof-tplg/sof-mt8188.tplg /usr/lib/firmware/mediatek/mt8188/scp.img /usr/lib/firmware/mediatek/sof/sof-mt8188.ri"
packages/all-poky-linux/linux-firmware/linux-firmware-mellanox: PKGSIZE changed from 85484140 to 98640572 (+15%)
packages/all-poky-linux/linux-firmware/linux-firmware-mellanox: FILELIST: added "/usr/lib/firmware/mellanox/mlxsw_spectrum3-30.2014.4012.mfa2 /usr/lib/firmware/mellanox/mlxsw_spectrum-13.2014.4012.mfa2 /usr/lib/firmware/mellanox/mlxsw_spectrum4-34.2014.4012.mfa2 /usr/lib/firmware/mellanox/mlxsw_spectrum2-29.2014.4012.mfa2"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca61x4-usb: PKGSIZE changed from 1117172 to 1236203 (+11%)
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca61x4-usb: FILELIST: added "/usr/lib/firmware/qca/nvm_usb_00190200_0106.bin /usr/lib/firmware/qca/nvm_usb_00190200_0110.bin /usr/lib/firmware/qca/nvm_usb_00190200_0109.bin /usr/lib/firmware/qca/nvm_usb_00190200_0108.bin /usr/lib/firmware/qca/nvm_usb_00190200_0104.bin /usr/lib/firmware/qca/nvm_usb_00190200_010a.bin /usr/lib/firmware/qca/nvm_usb_00190200_010c.bin /usr/lib/firmware/qca/nvm_usb_00190200_0111.bin"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGSIZE changed from 103809981 to 153081209 (+47%)
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: added "/usr/lib/firmware/qcom/x1e80100/LENOVO/83ED/qcdxkmsuc8380.mbn /usr/lib/firmware/rtw88/rtw8814a_fw.bin /usr/lib/firmware/qcom/x1e80100/LENOVO/83ED/battmgr.jsn /usr/lib/firmware/qcom/qcs8300/adspr.jsn /usr/lib/firmware/qcom/qcs8300/cdspr.jsn /usr/lib/firmware/qcom/x1e80100/LENOVO/83ED/qcav1e8380.mbn /usr/lib/firmware/qcom/x1e80100/LENOVO/83ED/adspua.jsn /usr/lib/firmware/qcom/qcs8300/cdsp0.mbn /usr/lib/firmware/qcom/qcs8300/adspua.jsn /usr/lib/firmware/qcom/x1e80100/LENOVO/83ED/adsp_dtbs.elf /usr/lib/firmware/qcom/x1e80100/LENOVO/83ED/adspr.jsn /usr/lib/firmware/qcom/x1e80100/LENOVO/83ED/cdspr.jsn /usr/lib/firmware/qcom/x1e80100/X1E80100-LENOVO-Yoga-Slim7x-tplg.bin /usr/lib/firmware/aeonsemi/as21x1x_fw.bin /usr/lib/firmware/qcom/qcs8300/gpdsp0.mbn /usr/lib/firmware/qcom/x1e80100/LENOVO/83ED/X1E80100-LENOVO-Yoga-Slim7x-tplg.bin /usr/lib/firmware/qcom/x1e80100/X1E80100-LENOVO-Thinkpad-T14s-tplg.bin /usr/lib/firmware/
 qcom/x1e80100/LENOVO/21N1/X1E80100-LENOVO-Thinkpad-T14s-tplg.bin /usr/lib/firmware/qcom/qcs8300/adsp.mbn /usr/lib/firmware/qcom/x1e80100/LENOVO/83ED/adsps.jsn /usr/lib/firmware/qcom/x1e80100/LENOVO/83ED/qcadsp8380.mbn /usr/lib/firmware/qcom/x1e80100/LENOVO/83ED/qccdsp8380.mbn /usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/qcvss8380.mbn /usr/lib/firmware/qcom/x1e80100/LENOVO/83ED/qcvss8380.mbn"

--===============4471392081627547756==--

