Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F0C3C54734
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:03 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.131421.1723748334046502431
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Jpbkt3BX;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=v5wG7pvV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019157683e5f-b88f40f3-7b5d-4338-a800-8607b69042fc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748335;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=a65bdPCODvKcra+tRXXfAEXR9vXNYjAdspgqeZfKTuM=;
	b=Jpbkt3BXUuKY84fv8XfzwwoiL7urrICOXDUzgG20wxE9Q+s7lY/4wbRgHyqwa7FB
	Q7NWcpVv50fxoZv4lgE7fYAHfdDK9sqqWffZSoOseo4pv555iEl6WH5edHhj4pGM2E8
	LxhU+Yie11G5fd+QX1yML74riXZWSKu3DjrCvF7c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748335;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=a65bdPCODvKcra+tRXXfAEXR9vXNYjAdspgqeZfKTuM=;
	b=v5wG7pvVgdSX2RJVce4HPX5RZ/bzb66K3BhIuKYr8Gyz98AuvqMhz9bob5xgiXhC
	uaiG8mcqA7lbFnjgUrTHJhpd5WmnwoitBW+b9Tq33vY2YNtOL4jZe1S0ynfaiGkPwt3
	ERogrzQajxK/82jQtS4amcffEEzeSXAq5q97S0IE=
Content-Type: multipart/mixed; boundary="===============7298731789381323888=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] linux-firmware: upgrading to 20240811 SUCCEEDED
Message-ID: <0101019157683e5f-b88f40f3-7b5d-4338-a800-8607b69042fc-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203432

--===============7298731789381323888==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *linux-firmware* to *20240811* has Succeeded.

Next steps:
    - apply the patch: git am 0001-linux-firmware-upgrade-20240513-20240811.patch
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
From 21e506365c0f35c153af06a7975e0c6211f836a6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Aug 2024 16:05:33 +0000
Subject: [PATCH] linux-firmware: upgrade 20240513 -> 20240811

---
 ...20240513.bb => linux-firmware_20240811.bb} | 649 +++++++++++++++++-
 1 file changed, 646 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20240513.bb => linux-firmware_20240811.bb} (78%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20240513.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb
similarity index 78%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20240513.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb
index 4a87105d98..58bb222ebd 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20240513.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb
@@ -1,3 +1,646 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENCE.ti-connectivity
+# +++ LICENCE.ti-connectivity
+# @@ -1,4 +1,4 @@
+# -Copyright (c) 2016 Texas Instruments Incorporated
+# +Copyright (c) 2016-2024 Texas Instruments Incorporated
+#  
+#  All rights reserved not granted herein.
+#  
+# --- WHENCE
+# +++ WHENCE
+# @@ -1017,25 +1017,25 @@
+#  Version: 74.a5e9588b.0
+#  
+#  File: iwlwifi-cc-a0-77.ucode
+# -Version: 74.a20fb07d.0
+# +Version: 74.85be44d3.0
+#  
+#  File: iwlwifi-Qu-b0-hr-b0-77.ucode
+# -Version: 74.a20fb07d.0
+# +Version: 74.85be44d3.0
+#  
+#  File: iwlwifi-Qu-b0-jf-b0-77.ucode
+# -Version: 74.a20fb07d.0
+# +Version: 74.85be44d3.0
+#  
+#  File: iwlwifi-Qu-c0-hr-b0-77.ucode
+# -Version: 74.a20fb07d.0
+# +Version: 74.85be44d3.0
+#  
+#  File: iwlwifi-Qu-c0-jf-b0-77.ucode
+# -Version: 74.a20fb07d.0
+# +Version: 74.85be44d3.0
+#  
+#  File: iwlwifi-QuZ-a0-hr-b0-77.ucode
+# -Version: 74.a20fb07d.0
+# +Version: 74.85be44d3.0
+#  
+#  File: iwlwifi-QuZ-a0-jf-b0-77.ucode
+# -Version: 74.206b0184.0
+# +Version: 74.85be44d3.0
+#  
+#  File: iwlwifi-ty-a0-gf-a0-77.ucode
+#  Version: 74.f92b5fed.0
+# @@ -1059,7 +1059,7 @@
+#  Version: 83.fb5c9aeb.0
+#  
+#  File: iwlwifi-ty-a0-gf-a0-89.ucode
+# -Version: 87.e9cec78e.0
+# +Version: 87.202a2f7b.0
+#  
+#  File: iwlwifi-so-a0-gf4-a0-77.ucode
+#  Version: 74.f92b5fed.0
+# @@ -1083,7 +1083,7 @@
+#  Version: 83.fb5c9aeb.0
+#  
+#  File: iwlwifi-so-a0-gf4-a0-89.ucode
+# -Version: 87.e9cec78e.0
+# +Version: 87.202a2f7b.0
+#  
+#  File: iwlwifi-so-a0-gf-a0-77.ucode
+#  Version: 74.f92b5fed.0
+# @@ -1107,7 +1107,7 @@
+#  Version: 83.fb5c9aeb.0
+#  
+#  File: iwlwifi-so-a0-gf-a0-89.ucode
+# -Version: 87.e9cec78e.0
+# +Version: 87.202a2f7b.0
+#  
+#  File: iwlwifi-so-a0-hr-b0-77.ucode
+#  Version: 74.f92b5fed.0
+# @@ -1128,7 +1128,7 @@
+#  Version: 83.fb5c9aeb.0
+#  
+#  File: iwlwifi-so-a0-hr-b0-89.ucode
+# -Version: 87.e9cec78e.0
+# +Version: 87.202a2f7b.0
+#  
+#  File: iwlwifi-so-a0-jf-b0-77.ucode
+#  Version: 74.f92b5fed.0
+# @@ -1144,6 +1144,9 @@
+#  File: iwlwifi-gl-c0-fm-c0-90.ucode
+#  Version: 87.38c93dbc.0
+#  
+# +File: iwlwifi-gl-c0-fm-c0-92.ucode
+# +Version: 89.67ce4588.0
+# +
+#  File: iwlwifi-gl-c0-fm-c0.pnvm
+#  
+#  File: iwlwifi-ma-b0-gf-a0-83.ucode
+# @@ -1153,7 +1156,7 @@
+#  Version: 83.fb5c9aeb.0
+#  
+#  File: iwlwifi-ma-b0-gf-a0-89.ucode
+# -Version: 87.e9cec78e.0
+# +Version: 87.202a2f7b.0
+#  
+#  File: iwlwifi-ma-b0-gf-a0.pnvm
+#  
+# @@ -1164,7 +1167,7 @@
+#  Version: 83.fb5c9aeb.0
+#  
+#  File: iwlwifi-ma-b0-gf4-a0-89.ucode
+# -Version: 87.e9cec78e.0
+# +Version: 87.202a2f7b.0
+#  
+#  File: iwlwifi-ma-b0-gf4-a0.pnvm
+#  
+# @@ -1173,6 +1176,9 @@
+#  
+#  File: iwlwifi-ma-b0-hr-b0-86.ucode
+#  Version: 83.fb5c9aeb.0
+# +
+# +File: iwlwifi-ma-b0-hr-b0-89.ucode
+# +Version: 83.202a2f7b.0
+#  
+#  Licence: Redistributable. See LICENCE.iwlwifi_firmware for details
+#  
+# @@ -2577,12 +2583,20 @@
+#  File: amdgpu/gc_11_5_0_mes_2.bin
+#  File: amdgpu/gc_11_5_0_pfp.bin
+#  File: amdgpu/gc_11_5_0_rlc.bin
+# +File: amdgpu/gc_11_5_1_imu.bin
+# +File: amdgpu/gc_11_5_1_me.bin
+# +File: amdgpu/gc_11_5_1_mec.bin
+# +File: amdgpu/gc_11_5_1_mes1.bin
+# +File: amdgpu/gc_11_5_1_mes_2.bin
+# +File: amdgpu/gc_11_5_1_pfp.bin
+# +File: amdgpu/gc_11_5_1_rlc.bin
+#  File: amdgpu/dcn_3_1_4_dmcub.bin
+#  File: amdgpu/dcn_3_1_5_dmcub.bin
+#  File: amdgpu/dcn_3_1_6_dmcub.bin
+#  File: amdgpu/dcn_3_2_0_dmcub.bin
+#  File: amdgpu/dcn_3_2_1_dmcub.bin
+#  File: amdgpu/dcn_3_5_dmcub.bin
+# +File: amdgpu/dcn_3_5_1_dmcub.bin
+#  File: amdgpu/psp_13_0_0_sos.bin
+#  File: amdgpu/psp_13_0_0_ta.bin
+#  File: amdgpu/psp_13_0_4_ta.bin
+# @@ -2603,6 +2617,8 @@
+#  File: amdgpu/psp_13_0_11_toc.bin
+#  File: amdgpu/psp_14_0_0_ta.bin
+#  File: amdgpu/psp_14_0_0_toc.bin
+# +File: amdgpu/psp_14_0_1_ta.bin
+# +File: amdgpu/psp_14_0_1_toc.bin
+#  File: amdgpu/sdma_4_4_2.bin
+#  File: amdgpu/sdma_5_2_6.bin
+#  File: amdgpu/sdma_5_2_7.bin
+# @@ -2611,6 +2627,7 @@
+#  File: amdgpu/sdma_6_0_2.bin
+#  File: amdgpu/sdma_6_0_3.bin
+#  File: amdgpu/sdma_6_1_0.bin
+# +File: amdgpu/sdma_6_1_1.bin
+#  File: amdgpu/smu_13_0_0.bin
+#  File: amdgpu/smu_13_0_6.bin
+#  File: amdgpu/smu_13_0_7.bin
+# @@ -2622,7 +2639,10 @@
+#  File: amdgpu/vcn_4_0_3.bin
+#  File: amdgpu/vcn_4_0_4.bin
+#  File: amdgpu/vcn_4_0_5.bin
+# +File: amdgpu/vcn_4_0_6.bin
+# +File: amdgpu/vcn_4_0_6_1.bin
+#  File: amdgpu/vpe_6_1_0.bin
+# +File: amdgpu/vpe_6_1_1.bin
+#  
+#  Licence: Redistributable. See LICENSE.amdgpu for details.
+#  
+# @@ -3064,6 +3084,30 @@
+#  
+#  --------------------------------------------------------------------------
+#  
+# +Driver: cc33xx - Texas Instruments 802.11 WLAN driver for CC33xx chips
+# +
+# +File: ti-connectivity/cc33xx_2nd_loader.bin
+# +Version: 1.0.0.23
+# +File: ti-connectivity/cc33xx_fw.bin
+# +Version: 1.7.0.120
+# +File: ti-connectivity/cc33xx-conf.bin
+# +Version: 1.7.0.120
+# +
+# +Licence: Redistributable. See LICENCE.ti-connectivity for details.
+# +
+# +The cc33xx-conf.bin is a binary containing two parts: radio calibration
+# +and hardware configuration. The binary can be modified using the tool
+# +cc33conf which can be found in the CC33XX Linux SDK here: 
+# +
+# +https://www.ti.com/tool/CC33XX-SOFTWARE 
+# +
+# +The driver expects to find the firmwares under a ti-connectivity
+# +subdirectory.  So if your system looks for firmwares in /lib/firmware,
+# +the firmwares for cc33xx chips must be located in
+# +/lib/firmware/ti-connectivity/.
+# +
+# +--------------------------------------------------------------------------
+# +
+#  Driver: TI_ST - Texas Instruments bluetooth driver
+#  
+#  File: ti-connectivity/TIInit_6.2.31.bts
+# @@ -3226,6 +3270,7 @@
+#  Driver: rtw88 - Realtek 802.11ac WLAN driver for RTL8822BE and RTL8822CE
+#  
+#  Info: Sent to Larry Finger by Realtek engineer Yan-Hsuan Chuang <yhchuang@realtek.com>
+# +File: rtw88/rtw8821a_fw.bin
+#  File: rtw88/rtw8822b_fw.bin
+#  File: rtw88/rtw8822c_fw.bin
+#  File: rtw88/rtw8822c_wow_fw.bin
+# @@ -3253,13 +3298,15 @@
+#  File: rtw89/rtw8852a_fw.bin
+#  File: rtw89/rtw8852b_fw.bin
+#  File: rtw89/rtw8852b_fw-1.bin
+# +File: rtw89/rtw8852bt_fw.bin
+#  File: rtw89/rtw8852c_fw.bin
+# +File: rtw89/rtw8852c_fw-1.bin
+#  File: rtw89/rtw8922a_fw.bin
+#  
+#  Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
+#  
+#     These firmware support 802.11ax chips including RTL8851B, RTL8852A,
+# -   RTL8852B and RTL8852C and 802.11be chip including RTL8922A.
+# +   RTL8852B, RTL8852BT and RTL8852C and 802.11be chip including RTL8922A.
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -3883,14 +3930,17 @@
+#  Version: BT_WindStormPeak_REL1299
+#  File: intel/ibt-12-16.sfi
+#  Version: BT_WindStormPeak_REL1299
+# +
+#  File: intel/ibt-17-16-1.sfi
+# -Version: BT_JeffersonPeak_B0_B0_REL20397
+#  File: intel/ibt-17-16-1.ddc
+# -Version: BT_JeffersonPeak_B0_B0_REL20397
+#  File: intel/ibt-17-2.sfi
+# -Version: BT_JeffersonPeak_B0_B0_REL20397
+#  File: intel/ibt-17-2.ddc
+# -Version: BT_JeffersonPeak_B0_B0_REL20397
+# +File: intel/ibt-18-16-1.sfi
+# +File: intel/ibt-18-16-1.ddc
+# +File: intel/ibt-18-2.sfi
+# +File: intel/ibt-18-2.ddc
+# +Version: BT_Pulsar_REL20425_22.20.2412.20425
+# +
+#  File: intel/ibt-17-0-1.sfi
+#  Version: BT_JeffersonPeak_A0_B0_REL0201
+#  File: intel/ibt-17-0-1.ddc
+# @@ -3899,14 +3949,7 @@
+#  Version: BT_JeffersonPeak_A0_B0_REL0201
+#  File: intel/ibt-17-1.ddc
+#  Version: BT_JeffersonPeak_A0_B0_REL0201
+# -File: intel/ibt-18-16-1.sfi
+# -Version: BT_ThunderPeak_B0_B0_REL20397
+# -File: intel/ibt-18-16-1.ddc
+# -Version: BT_ThunderPeak_B0_B0_REL20397
+# -File: intel/ibt-18-2.sfi
+# -Version: BT_ThunderPeak_B0_B0_REL20397
+# -File: intel/ibt-18-2.ddc
+# -Version: BT_ThunderPeak_B0_B0_REL20397
+# +
+#  File: intel/ibt-18-0-1.sfi
+#  Version: BT_ThunderPeak_A0_B0_REL0201
+#  File: intel/ibt-18-0-1.ddc
+# @@ -3982,7 +4025,7 @@
+#  File: intel/ibt-0040-1050.ddc
+#  File: intel/ibt-1040-1050.sfi
+#  File: intel/ibt-1040-1050.ddc
+# -Version: BT_Solar_REL81454_23.50.24144.81454
+# +Version: BT_Solar_REL81528_23.50.24183.81528
+#  
+#  File: intel/ibt-0040-1020.sfi
+#  File: intel/ibt-0040-1020.ddc
+# @@ -3996,7 +4039,7 @@
+#  
+#  File: intel/ibt-0291-0291.sfi
+#  File: intel/ibt-0291-0291.ddc
+# -Version: BT_BlazarU_S_REL56888_23.50.24144.56888
+# +Version: BT_BlazarU_S_REL58211_23.60.24183.58211
+#  
+#  File: intel/ibt-0180-0041.sfi
+#  File: intel/ibt-0180-0041.ddc
+# @@ -4004,7 +4047,7 @@
+#  File: intel/ibt-0180-4150.ddc
+#  File: intel/ibt-0180-1050.sfi
+#  File: intel/ibt-0180-1050.ddc
+# -Version: BT_Magnetar_REL103171_23.50.24144.103171
+# +Version: BT_Magnetar_REL103243_23.50.24183.103243
+#  
+#  Licence: Redistributable. See LICENCE.ibt_firmware for details
+#  
+# @@ -4139,9 +4182,9 @@
+#  RawFile: amd-ucode/microcode_amd_fam16h.bin
+#  Version: 2014-10-28
+#  RawFile: amd-ucode/microcode_amd_fam17h.bin
+# -Version: 2023-12-05
+# +Version: 2024-07-10
+#  RawFile: amd-ucode/microcode_amd_fam19h.bin
+# -Version: 2024-01-16
+# +Version: 2024-07-10
+#  File: amd-ucode/README
+#  
+#  License: Redistributable. See LICENSE.amd-ucode for details
+# @@ -4237,6 +4280,8 @@
+#  Link: qat_mmp.bin -> qat_895xcc_mmp.bin
+#  File: qat_4xxx.bin
+#  File: qat_4xxx_mmp.bin
+# +File: qat_402xx.bin
+# +File: qat_402xx_mmp.bin
+#  
+#  Licence: Redistributable. See LICENCE.qat_firmware for details
+#  
+# @@ -4326,7 +4371,7 @@
+#  Link: intel/dsp_fw_release.bin -> avs/skl/dsp_basefw.bin
+#  Link: intel/dsp_fw_kbl.bin -> avs/skl/dsp_basefw.bin
+#  File: intel/avs/apl/dsp_basefw.bin
+# -Version: 9.22.01.4908
+# +Version: 9.22.01.4917
+#  Link: intel/dsp_fw_bxtn.bin -> avs/apl/dsp_basefw.bin
+#  Link: intel/dsp_fw_glk.bin -> avs/apl/dsp_basefw.bin
+#  File: intel/avs/cnl/dsp_basefw.bin
+# @@ -4334,6 +4379,26 @@
+#  Link: intel/dsp_fw_cnl.bin -> avs/cnl/dsp_basefw.bin
+#  
+#  License: Redistributable. See LICENCE.adsp_sst for details
+# +
+# +File: intel/avs/da7219-tplg.bin
+# +File: intel/avs/dmic-tplg.bin
+# +File: intel/avs/hda-808628xx-3ep-tplg.bin
+# +Link: intel/avs/hda-8086-generic-tplg.bin -> hda-808628xx-3ep-tplg.bin
+# +File: intel/avs/hda-generic-1ep-tplg.bin
+# +Link: intel/avs/hda-generic-tplg.bin -> hda-generic-1ep-tplg.bin
+# +File: intel/avs/max98357a-tplg.bin
+# +File: intel/avs/max98373-tplg.bin
+# +File: intel/avs/max98927-tplg.bin
+# +File: intel/avs/nau8825-tplg.bin
+# +File: intel/avs/rt274-tplg.bin
+# +File: intel/avs/rt286-tplg.bin
+# +File: intel/avs/rt298-tplg.bin
+# +File: intel/avs/rt5514-tplg.bin
+# +File: intel/avs/rt5640-tplg.bin
+# +File: intel/avs/rt5663-tplg.bin
+# +File: intel/avs/ssm4567-tplg.bin
+# +
+# +License: Apache-2.0. See Apache-2 for details.
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -4844,7 +4909,7 @@
+#  Version: GuC API/APB ver 70.1.1 for Tigerlake
+#  
+#  File: i915/tgl_guc_70.bin
+# -Version: GuC API/APB ver 70.20.0 for Tigerlake
+# +Version: GuC API/APB ver 70.29.2 for Tigerlake
+#  
+#  File: i915/tgl_huc_7.0.3.bin
+#  Version: Huc API/APB ver 7 release 0 for Tigerlake
+# @@ -4883,7 +4948,7 @@
+#  Version: GuC API/APB ver 70.1.1 for DG1
+#  
+#  File: i915/dg1_guc_70.bin
+# -Version: GuC API/APB ver 70.20.0 for DG1
+# +Version: GuC API/APB ver 70.29.2 for DG1
+#  
+#  File: i915/dg1_huc_7.7.1.bin
+#  Version: Huc API/APB ver 7 release 1 for DG1
+# @@ -4925,7 +4990,7 @@
+#  Version: GuC API/APB ver 70.1.1 for Alderlake P
+#  
+#  File: i915/adlp_guc_70.bin
+# -Version: GuC API/APB ver 70.20.0 for Alderlake P
+# +Version: GuC API/APB ver 70.29.2 for Alderlake P
+#  
+#  File: i915/dg2_guc_70.1.2.bin
+#  Version: GuC API/APB ver 70.1.2 for DG2
+# @@ -4934,10 +4999,10 @@
+#  Version: GuC API/APB ver 70.4.1 for DG2
+#  
+#  File: i915/dg2_guc_70.bin
+# -Version: GuC API/APB ver 70.20.0 for DG2
+# +Version: GuC API/APB ver 70.29.2 for DG2
+#  
+#  File: i915/dg2_huc_gsc.bin
+# -Version: HuC API/APB ver 7.10.15 for DG2
+# +Version: HuC API/APB ver 7.10.16 for DG2
+#  
+#  File: i915/dg2_dmc_ver2_06.bin
+#  Version: DMC API/APB ver 2 release 6 for DG2
+# @@ -4952,30 +5017,42 @@
+#  Version: DMC API/APB ver 2 release 10 for Meteorlake
+#  
+#  File: i915/mtl_dmc.bin
+# -Version: DMC API/APB ver 2 release 21 for Meteorlake
+# +Version: DMC API/APB ver 2 release 22 for Meteorlake
+#  
+#  File: i915/mtl_guc_70.bin
+# -Version: GuC API/APB ver 70.20.0 for Meteorlake
+# +Version: GuC API/APB ver 70.29.2 for Meteorlake
+#  
+#  File: i915/mtl_huc_gsc.bin
+#  Version: HuC API/APB ver 8.5.4 for Meteorlake
+#  
+#  File: i915/mtl_gsc_1.bin
+# -Version: GSC API/APB v1.0, release 102.0.0.1655, SVN 1 for Meteorlake
+# +Version: GSC API/APB v1.0, release 102.0.10.1878, SVN 1 for Meteorlake
+#  
+#  File: i915/bmg_dmc.bin
+#  Version: DMC API/APB ver 2 release 6 for Battlemage
+#  
+#  File: i915/xe2lpd_dmc.bin
+# -Version: DMC API/APB ver 2 release 20 for Xe2LPD
+# +Version: DMC API/APB ver 2 release 21 for Xe2LPD
+#  
+#  License: Redistributable. See LICENSE.i915 for details
+#  --------------------------------------------------------------------------
+#  
+#  Driver: xe -- Intel Graphics driver
+#  
+# +File: xe/lnl_gsc_1.bin
+# +Version: GSC API/APB v1.0, release 104.0.0.1161, SVN 1 for Lunarlake
+# +
+#  File: xe/lnl_guc_70.bin
+# -Version: GuC API/APB ver 70.20.0 for Lunarlake
+# +Version: GuC API/APB ver 70.29.2 for Lunarlake
+# +
+# +File: xe/lnl_huc.bin
+# +Version: HuC API/APB ver 9.4.13 for Lunarlake
+# +
+# +File: xe/bmg_guc_70.bin
+# +Version: GuC API/APB ver 70.29.2 for Battlemage
+# +
+# +File: xe/bmg_huc.bin
+# +Version: HuC API/APB ver 8.2.10 for Battlemage
+#  
+#  License: Redistributable. See LICENSE.xe for details
+#  --------------------------------------------------------------------------
+# @@ -5676,9 +5753,9 @@
+#  Driver: mt7921 - MediaTek MT7921 Wireless MACs
+#  
+#  File: mediatek/WIFI_MT7961_patch_mcu_1_2_hdr.bin
+# -Version: 20240219110958a
+# +Version: 20240716150944a
+#  File: mediatek/WIFI_RAM_CODE_MT7961_1.bin
+# -Version: 20240219111038
+# +Version: 20240716151027
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -5687,7 +5764,7 @@
+#  Driver: mt7921 - MediaTek MT7921 bluetooth chipset
+#  
+#  File: mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin
+# -Version: 20240219111427
+# +Version: 20240716150858
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -5696,9 +5773,9 @@
+#  Driver: mt7922 - MediaTek MT7922 Wireless MACs
+#  
+#  File: mediatek/WIFI_MT7922_patch_mcu_1_1_hdr.bin
+# -Version: 20240409163301a
+# +Version: 20240716163242a
+#  File: mediatek/WIFI_RAM_CODE_MT7922_1.bin
+# -Version: 20240409163347
+# +Version: 20240716163327
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -5707,7 +5784,7 @@
+#  Driver: mt7922 - MediaTek MT7922 bluetooth chipset
+#  
+#  File: mediatek/BT_RAM_CODE_MT7922_1_1_hdr.bin
+# -Version: 20240409163648
+# +Version: 20240716163157
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -5886,12 +5963,13 @@
+#  
+#  Version: VIDEO.VE.6.0-00049-PROD-1
+#  
+# -File: qcom/vpu-1.0/venus.mbn
+# -Link: qcom/vpu-1.0/venus.mdt -> venus.mbn
+# +File: qcom/vpu/vpu20_p4.mbn
+# +Link: qcom/vpu-1.0/venus.mbn -> ../vpu/vpu20_p4.mbn
+#  
+#  Version: VIDEO.VPU.1.0-00087-PROD-1
+#  
+# -File: qcom/vpu-2.0/venus.mbn
+# +File: qcom/vpu/vpu20_p1.mbn
+# +Link: qcom/vpu-2.0/venus.mbn -> ../vpu/vpu20_p1.mbn
+#  
+#  Version: VIDEO.VPU.2.0-00049-PROD-1
+#  
+# @@ -5899,6 +5977,16 @@
+#  
+#  Binary files supplied originally from
+#  https://developer.qualcomm.com/hardware/dragonboard-410c/tools
+# +
+# +--------------------------------------------------------------------------
+# +
+# +Driver: iris - Qualcomm Iris video codec accelerator
+# +
+# +File: qcom/vpu/vpu30_p4.mbn
+# +
+# +Version: VIDEO.VPU.3.1-0076
+# +
+# +Licence: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -5940,6 +6028,9 @@
+#  File: qcom/leia_pfp_470.fw
+#  File: qcom/leia_pm4_470.fw
+#  File: qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn
+# +File: qcom/gen70500_gmu.bin
+# +File: qcom/gen70500_sqe.fw
+# +File: qcom/x1e80100/gen70500_zap.mbn
+#  
+#  Licence: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
+#  
+# @@ -6948,6 +7039,22 @@
+#  File: cirrus/cs35l41-dsp1-spk-prot-17aa3865-r0.bin
+#  File: cirrus/cs35l41-dsp1-spk-prot-17aa3866-l0.bin
+#  File: cirrus/cs35l41-dsp1-spk-prot-17aa3866-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-17aa38c7.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-17aa38c8.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-17aa38f9.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-17aa38fa.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +File: cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-l1.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-r1.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-l1.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-r1.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-17aa38fa-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-17aa38fa-spkid0-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-17aa38f9-spkid1-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-17aa38f9-spkid1-r0.bin
+#  Link: cirrus/cs35l41-dsp1-spk-prot-103c8c26.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+#  Link: cirrus/cs35l41-dsp1-spk-prot-103c8b42.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+#  Link: cirrus/cs35l41-dsp1-spk-prot-103c8b43.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# @@ -7143,8 +7250,7 @@
+#  File: mediatek/sof/sof-mt8195.ri
+#  File: mediatek/sof/sof-mt8195.ldc
+#  File: mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682.tplg
+# -File: mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682-dts.tplg
+# -Version: v0.4.1
+# +Version: v0.4.2
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -7190,13 +7296,17 @@
+#  --------------------------------------------------------------------------
+#  
+#  Driver: amlogic - Amlogic SoC Firmware
+# -File: amlogic/bluetooth/w2_bt_fw_uart.bin
+# -Version: 38.01
+# -Info: 0xa914
+# -
+# -File: amlogic/bluetooth/w1u_bt_fw_uart.bin
+# -Version: 41.05
+# -Info: 0xb024
+# +File: amlogic/aml_w155s2_bt_uart.bin
+# +Version: 42.23
+# +Info: 0x2de8
+# +
+# +File: amlogic/aml_w265s1_bt_uart.bin
+# +Version: 43.13
+# +Info: 0xc1c2
+# +
+# +File: amlogic/aml_w265s2_bt_uart.bin
+# +Version: 42.28
+# +Info: 0xb2fd
+#  
+#  Licence: Redistributable. See LICENSE.amlogic for details
+#  
+# @@ -7291,10 +7401,8 @@
+#  Link: TIAS2781RCA2.bin -> ti/tas2781/TIAS2781RCA2.bin
+#  Link: TIAS2781RCA4.bin -> ti/tas2781/TIAS2781RCA4.bin
+#  
+# -Licence: Allegedly GPLv2+, but no source visible. Marked:
+# -	 Copyright (C) 2023 Texas Instruments
+# -
+# -Found in hex form in kernel source.
+# +Licence: Redistributable. See LICENCE.ti-tspa for details. Marked:
+# +	 Copyright (C) 2023 - 2024 Texas Instruments
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -7304,10 +7412,8 @@
+#  Link: TAS2XXX3870.bin -> ti/tas2563/TAS2XXX3870.bin
+#  Link: INT8866RCA2.bin -> ti/tas2563/INT8866RCA2.bin
+#  
+# -Licence: Allegedly GPLv2+, but no source visible. Marked:
+# -	 Copyright (C) 2023 Texas Instruments
+# -
+# -Found in hex form in kernel source.
+# +Licence: Redistributable. LICENCE.ti-tspa for details. Marked:
+# +	 Copyright (C) 2023 - 2024 Texas Instruments
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -7324,3 +7430,29 @@
+#  Version: arch10.8
+#  
+#  License: Redistributable. See LICENCE.mali_csffw for details
+# +
+# +--------------------------------------------------------------------------
+# +Driver: isp - Image Signal Processor (ISP) device
+# +File: amdgpu/isp_4_1_1.bin
+# +
+# +License: Redistributable. See LICENSE.amdisp for details
+# +
+# +--------------------------------------------------------------------------
+# +
+# +Driver: qaic - Qualcomm Cloud AI accelerators
+# +File: qcom/aic100/fw1.bin
+# +File: qcom/aic100/fw10.bin
+# +File: qcom/aic100/fw2.bin
+# +File: qcom/aic100/fw5.bin
+# +File: qcom/aic100/fw9.bin
+# +File: qcom/aic100/sbl.bin
+# +
+# +License: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
+# +
+# +--------------------------------------------------------------------------
+# +
+# +Driver: ish - Intel Integrated Sensor Hub
+# +File: intel/ish/ish_lnlm.bin
+# +Version: 5.8.0.7716
+# +
+# +License: Redistributable. See LICENCE.ish for details
+# 
+#
+
 SUMMARY = "Firmware files for use with Linux kernel"
 HOMEPAGE = "https://www.kernel.org/"
 DESCRIPTION = "Linux firmware is a package distributed alongside the Linux kernel \
@@ -144,7 +787,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.rtlwifi_firmware.txt;md5=00d06cfd3eddd5a2698948ead2ad54a5 \
                     file://LICENSE.sdma_firmware;md5=51e8c19ecc2270f4b8ea30341ad63ce9 \
                     file://LICENCE.siano;md5=4556c1bf830067f12ca151ad953ec2a5 \
-                    file://LICENCE.ti-connectivity;md5=c5e02be633f1499c109d1652514d85ec \
+                    file://LICENCE.ti-connectivity;md5=3b1e9cf54aba8146dad4b735777d406f \
                     file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c \
                     file://LICENCE.ueagle-atm4-firmware;md5=4ed7ea6b507ccc583b9d594417714118 \
                     file://LICENCE.via_vt6656;md5=e4159694cba42d4377a912e78a6e850f \
@@ -152,7 +795,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=${WHENCE_CHKSUM} \
+                    file://WHENCE;md5=60b5abcc986d1660637e913a87e1413c \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
@@ -244,7 +887,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "9f05edb99668135d37cedc4fdd18aac2802dc9e4566e086e6c6c2e321f3ecc4e"
+SRC_URI[sha256sum] = "58f1a14b800e3d1967986197d83c81f1ad14b7898a557133c58df0c02c538082"
 
 inherit allarch
 
-- 
2.44.0


--===============7298731789381323888==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: FILELIST: added "/usr/lib/firmware/amdgpu/isp_4_1_1.bin /usr/lib/firmware/amdgpu/dcn_3_5_1_dmcub.bin /usr/lib/firmware/amdgpu/vpe_6_1_1.bin /usr/lib/firmware/amdgpu/sdma_6_1_1.bin /usr/lib/firmware/amdgpu/gc_11_5_1_mes1.bin /usr/lib/firmware/amdgpu/vcn_4_0_6.bin /usr/lib/firmware/amdgpu/psp_14_0_1_toc.bin /usr/lib/firmware/amdgpu/vcn_4_0_6_1.bin /usr/lib/firmware/amdgpu/psp_14_0_1_ta.bin /usr/lib/firmware/amdgpu/gc_11_5_1_imu.bin /usr/lib/firmware/amdgpu/gc_11_5_1_mec.bin /usr/lib/firmware/amdgpu/gc_11_5_1_pfp.bin /usr/lib/firmware/amdgpu/gc_11_5_1_rlc.bin /usr/lib/firmware/amdgpu/gc_11_5_1_me.bin /usr/lib/firmware/amdgpu/gc_11_5_1_mes_2.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: FILELIST: added "/usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38fa-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38fa-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38f9-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38f9.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38fa.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38f9-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-r1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-l1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-r1.bin /usr/lib/firmware/cirrus/cs
 35l41-dsp1-spk-prot-17aa38c7.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c8.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-l1.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: FILELIST: added "/usr/lib/firmware/iwlwifi-ma-b0-hr-b0-89.ucode /usr/lib/firmware/iwlwifi-gl-c0-fm-c0-92.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGSIZE changed from 98464 to 117348 (+19%)
packages/all-poky-linux/linux-firmware/linux-firmware-license: FILELIST: added "/usr/lib/firmware/LICENCE.ish /usr/lib/firmware/LICENSE.amdisp"
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek: FILELIST: removed "/usr/lib/firmware/mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682-dts.tplg"
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PKGSIZE changed from 2196522 to 3011966 (+37%)
packages/all-poky-linux/linux-firmware/linux-firmware-qat: FILELIST: added "/usr/lib/firmware/qat_402xx.bin /usr/lib/firmware/qat_402xx_mmp.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PKGSIZE changed from 1974893 to 19 (-100%)
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: RDEPENDS: added "linux-firmware"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: FILELIST: removed "/usr/lib/firmware/qcom/vpu-1.0/venus.mdt"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: PKGSIZE changed from 2031620 to 19 (-100%)
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: RDEPENDS: added "linux-firmware"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PKGSIZE changed from 216662 to 248560 (+15%)
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: FILELIST: added "/usr/lib/firmware/rtw88/rtw8821a_fw.bin"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGSIZE changed from 83811421 to 102749786 (+23%)
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: removed "/usr/lib/firmware/amlogic/bluetooth/w2_bt_fw_uart.bin /usr/lib/firmware/amlogic/bluetooth/w1u_bt_fw_uart.bin", added "/usr/lib/firmware/intel/avs/max98927-tplg.bin /usr/lib/firmware/intel/avs/max98373-tplg.bin /usr/lib/firmware/intel/avs/nau8825-tplg.bin /usr/lib/firmware/intel/avs/rt5663-tplg.bin /usr/lib/firmware/qcom/aic100/fw2.bin /usr/lib/firmware/rtw89/rtw8852c_fw-1.bin /usr/lib/firmware/qcom/aic100/fw10.bin /usr/lib/firmware/qcom/gen70500_gmu.bin /usr/lib/firmware/amlogic/aml_w155s2_bt_uart.bin /usr/lib/firmware/amlogic/aml_w265s1_bt_uart.bin /usr/lib/firmware/amlogic/aml_w265s2_bt_uart.bin /usr/lib/firmware/intel/avs/da7219-tplg.bin /usr/lib/firmware/intel/avs/ssm4567-tplg.bin /usr/lib/firmware/xe/bmg_huc.bin /usr/lib/firmware/xe/lnl_huc.bin /usr/lib/firmware/qcom/x1e80100/gen70500_zap.mbn /usr/lib/firmware/qcom/gen70500_sqe.fw /usr/lib/firmware/qcom/aic100/fw1.bin /usr/lib/firmware/rtw89/rtw8852bt_fw.b
 in /usr/lib/firmware/xe/lnl_gsc_1.bin /usr/lib/firmware/intel/avs/rt274-tplg.bin /usr/lib/firmware/qcom/aic100/fw9.bin /usr/lib/firmware/qcom/vpu/vpu20_p1.mbn /usr/lib/firmware/intel/ish/ish_lnlm.bin /usr/lib/firmware/intel/avs/dmic-tplg.bin /usr/lib/firmware/ti-connectivity/cc33xx-conf.bin /usr/lib/firmware/ti-connectivity/cc33xx_2nd_loader.bin /usr/lib/firmware/intel/avs/rt298-tplg.bin /usr/lib/firmware/qcom/aic100/sbl.bin /usr/lib/firmware/intel/avs/rt286-tplg.bin /usr/lib/firmware/intel/avs/hda-8086-generic-tplg.bin /usr/lib/firmware/qcom/aic100/fw5.bin /usr/lib/firmware/ti-connectivity/cc33xx_fw.bin /usr/lib/firmware/qcom/vpu/vpu20_p4.mbn /usr/lib/firmware/qcom/vpu/vpu30_p4.mbn /usr/lib/firmware/xe/bmg_guc_70.bin /usr/lib/firmware/intel/avs/rt5640-tplg.bin /usr/lib/firmware/intel/avs/hda-808628xx-3ep-tplg.bin /usr/lib/firmware/intel/avs/hda-generic-tplg.bin /usr/lib/firmware/intel/avs/hda-generic-1ep-tplg.bin /usr/lib/firmware/intel/avs/rt5514-tplg.bin /usr/lib/firmware/intel/a
 vs/max98357a-tplg.bin"

--===============7298731789381323888==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/linux-firmware: SRC_URI changed from "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20240513.tar.xz" to "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20240811.tar.xz"
packages/all-poky-linux/linux-firmware: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PKGSIZE changed from 85527210 to 92908858 (+9%)
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: FILELIST: added "/usr/lib/firmware/amdgpu/gc_11_5_1_mes_2.bin /usr/lib/firmware/amdgpu/sdma_6_1_1.bin /usr/lib/firmware/amdgpu/gc_11_5_1_mes1.bin /usr/lib/firmware/amdgpu/psp_14_0_1_toc.bin /usr/lib/firmware/amdgpu/psp_14_0_1_ta.bin /usr/lib/firmware/amdgpu/gc_11_5_1_imu.bin /usr/lib/firmware/amdgpu/gc_11_5_1_mec.bin /usr/lib/firmware/amdgpu/vcn_4_0_6_1.bin /usr/lib/firmware/amdgpu/gc_11_5_1_pfp.bin /usr/lib/firmware/amdgpu/gc_11_5_1_me.bin /usr/lib/firmware/amdgpu/vpe_6_1_1.bin /usr/lib/firmware/amdgpu/isp_4_1_1.bin /usr/lib/firmware/amdgpu/vcn_4_0_6.bin /usr/lib/firmware/amdgpu/dcn_3_5_1_dmcub.bin /usr/lib/firmware/amdgpu/gc_11_5_1_rlc.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu-license: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu-license: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-ar5523: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar5523: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2x: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2x: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus-license: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus-license: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: PKGSIZE changed from 2260402 to 2325794 (+3%)
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: FILELIST: added "/usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-r1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-l1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38fa-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38fa-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38f9.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38fa.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38f9-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38f9-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c7.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c8.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-r1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-pro
 t-17aa38c7-spkid0-l1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-l0.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-cnm-license: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cnm-license: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-cnm: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cnm: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200-license: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200-license: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGSIZE changed from 28075555 to 27942095 (-0%)
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PKGSIZE changed from 2601318 to 2601478 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-18: PKGSIZE changed from 2601318 to 2601478 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-18: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-18: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGSIZE changed from 19551369 to 19551697 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced-license: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced-license: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9260: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9260: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PKGSIZE changed from 164887640 to 168451144 (+2%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: FILELIST: added "/usr/lib/firmware/iwlwifi-gl-c0-fm-c0-92.ucode /usr/lib/firmware/iwlwifi-ma-b0-hr-b0-89.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGSIZE changed from 98464 to 117348 (+19%)
packages/all-poky-linux/linux-firmware/linux-firmware-license: FILELIST: added "/usr/lib/firmware/LICENSE.amdisp /usr/lib/firmware/LICENCE.ish"
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-license: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-mali-csffw-arch108: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mali-csffw-arch108: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-mali-csffw-license: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mali-csffw-license: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek-license: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek-license: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek: PKGSIZE changed from 35982776 to 35883237 (-0%)
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek: FILELIST: removed "/usr/lib/firmware/mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682-dts.tplg"
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-mellanox: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mellanox: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-microchip-license: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-microchip-license: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-microchip: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-microchip: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-moxa-license: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-moxa-license: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-moxa: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-moxa: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7650: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7650: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x-license: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x-license: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x2: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x2: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-license: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-license: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc-license: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc-license: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8987-sdio: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8987-sdio: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-common: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-common: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-pcie: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-pcie: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-sdio: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-sdio: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-common: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-common: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-pcie: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-pcie: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-sdio: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-sdio: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw416-sdio: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw416-sdio: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw612-sdio: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw612-sdio: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-olpc-license: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-olpc-license: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-olpc: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-olpc: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw-license: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw-license: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-powervr-license: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-powervr-license: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-powervr: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-powervr: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-prestera: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-prestera: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PKGSIZE changed from 2196522 to 3011966 (+37%)
packages/all-poky-linux/linux-firmware/linux-firmware-qat: FILELIST: added "/usr/lib/firmware/qat_402xx.bin /usr/lib/firmware/qat_402xx_mmp.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PKGSIZE changed from 2444995 to 2447943 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a702: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a702: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-modem: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-modem: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-wifi: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-wifi: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-adreno: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-adreno: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-adreno: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-adreno: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-audio: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-audio: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-modem: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-modem: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-wifi: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-wifi: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-adreno: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-adreno: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-audio: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-audio: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-compute: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-compute: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-modem: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-modem: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-wifi: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-wifi: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-adreno: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-adreno: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-thundercomm-db845c-sensors: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-thundercomm-db845c-sensors: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-adreno: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-adreno: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-thundercomm-rb5-sensors: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-thundercomm-rb5-sensors: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-6.0: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-6.0: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PKGSIZE changed from 1974893 to 19 (-100%)
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: FILELIST: removed "/usr/lib/firmware/qcom/vpu-1.0/venus.mdt"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: RDEPENDS: added "linux-firmware"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: PKGSIZE changed from 2031620 to 19 (-100%)
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: RDEPENDS: added "linux-firmware"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-yamato-license: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-yamato-license: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-qed: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qed: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx-license: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx-license: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-dptx: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-dptx: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-license: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-license: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-nic: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-nic: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8761: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8761: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PKGSIZE changed from 216662 to 248560 (+15%)
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: FILELIST: added "/usr/lib/firmware/rtw88/rtw8821a_fw.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8822: PKGSIZE changed from 802041 to 802689 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8822: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8822: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-src: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-src: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PKGSIZE changed from 2913 to 2918 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone-license: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone-license: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGSIZE changed from 274394 to 278904 (+2%)
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251-license: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251-license: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000-license: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000-license: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000-license: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000-license: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c-license: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c-license: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c: PV changed from "20240513" to "20240811"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGSIZE changed from 83811421 to 102749786 (+23%)
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: removed "/usr/lib/firmware/amlogic/bluetooth/w1u_bt_fw_uart.bin /usr/lib/firmware/amlogic/bluetooth/w2_bt_fw_uart.bin", added "/usr/lib/firmware/qcom/aic100/fw1.bin /usr/lib/firmware/intel/avs/ssm4567-tplg.bin /usr/lib/firmware/ti-connectivity/cc33xx_fw.bin /usr/lib/firmware/qcom/aic100/fw9.bin /usr/lib/firmware/qcom/vpu/vpu30_p4.mbn /usr/lib/firmware/qcom/vpu/vpu20_p4.mbn /usr/lib/firmware/rtw89/rtw8852bt_fw.bin /usr/lib/firmware/qcom/gen70500_gmu.bin /usr/lib/firmware/ti-connectivity/cc33xx_2nd_loader.bin /usr/lib/firmware/qcom/x1e80100/gen70500_zap.mbn /usr/lib/firmware/intel/avs/rt5663-tplg.bin /usr/lib/firmware/intel/avs/hda-808628xx-3ep-tplg.bin /usr/lib/firmware/intel/avs/max98927-tplg.bin /usr/lib/firmware/intel/avs/max98373-tplg.bin /usr/lib/firmware/intel/avs/rt274-tplg.bin /usr/lib/firmware/amlogic/aml_w155s2_bt_uart.bin /usr/lib/firmware/qcom/vpu/vpu20_p1.mbn /usr/lib/firmware/xe/lnl_gsc_1.bin /usr/lib/firmw
 are/qcom/aic100/sbl.bin /usr/lib/firmware/intel/avs/rt298-tplg.bin /usr/lib/firmware/intel/avs/rt5514-tplg.bin /usr/lib/firmware/intel/avs/da7219-tplg.bin /usr/lib/firmware/intel/avs/nau8825-tplg.bin /usr/lib/firmware/rtw89/rtw8852c_fw-1.bin /usr/lib/firmware/intel/avs/hda-generic-tplg.bin /usr/lib/firmware/qcom/aic100/fw5.bin /usr/lib/firmware/intel/avs/rt5640-tplg.bin /usr/lib/firmware/ti-connectivity/cc33xx-conf.bin /usr/lib/firmware/qcom/gen70500_sqe.fw /usr/lib/firmware/intel/avs/max98357a-tplg.bin /usr/lib/firmware/intel/avs/rt286-tplg.bin /usr/lib/firmware/xe/bmg_guc_70.bin /usr/lib/firmware/intel/avs/hda-8086-generic-tplg.bin /usr/lib/firmware/intel/ish/ish_lnlm.bin /usr/lib/firmware/qcom/aic100/fw10.bin /usr/lib/firmware/xe/bmg_huc.bin /usr/lib/firmware/xe/lnl_huc.bin /usr/lib/firmware/intel/avs/dmic-tplg.bin /usr/lib/firmware/amlogic/aml_w265s1_bt_uart.bin /usr/lib/firmware/amlogic/aml_w265s2_bt_uart.bin /usr/lib/firmware/intel/avs/hda-generic-1ep-tplg.bin /usr/lib/firmwar
 e/qcom/aic100/fw2.bin"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGV changed from 20240513 [default] to 20240811 [default]
packages/all-poky-linux/linux-firmware/linux-firmware: PV changed from "20240513" to "20240811"

--===============7298731789381323888==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-linux-firmware-upgrade-20240513-20240811.patch"

RnJvbSAyMWU1MDYzNjVjMGYzNWMxNTNhZjA2YTc5NzVlMGM2MjExZjgzNmE2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgQXVnIDIwMjQgMTY6MDU6MzMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aW51eC1maXJtd2FyZTogdXBncmFkZSAyMDI0MDUxMyAtPiAyMDI0MDgxMQoKLS0tCiAuLi4yMDI0
MDUxMy5iYiA9PiBsaW51eC1maXJtd2FyZV8yMDI0MDgxMS5iYn0gfCA2NDkgKysrKysrKysrKysr
KysrKystCiAxIGZpbGUgY2hhbmdlZCwgNjQ2IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS97bGludXgtZmlybXdh
cmVfMjAyNDA1MTMuYmIgPT4gbGludXgtZmlybXdhcmVfMjAyNDA4MTEuYmJ9ICg3OCUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2Fy
ZV8yMDI0MDUxMy5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgt
ZmlybXdhcmVfMjAyNDA4MTEuYmIKc2ltaWxhcml0eSBpbmRleCA3OCUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZV8yMDI0MDUxMy5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJt
d2FyZV8yMDI0MDgxMS5iYgppbmRleCA0YTg3MTA1ZDk4Li41OGJiMjIyZWJkIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlXzIwMjQw
NTEzLmJiCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgtZmly
bXdhcmVfMjAyNDA4MTEuYmIKQEAgLTEsMyArMSw2NDYgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklM
RVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4K
KyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRo
ZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlm
IG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3Nh
Z2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0
ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0t
LSBMSUNFTkNFLnRpLWNvbm5lY3Rpdml0eQorIyArKysgTElDRU5DRS50aS1jb25uZWN0aXZpdHkK
KyMgQEAgLTEsNCArMSw0IEBACisjIC1Db3B5cmlnaHQgKGMpIDIwMTYgVGV4YXMgSW5zdHJ1bWVu
dHMgSW5jb3Jwb3JhdGVkCisjICtDb3B5cmlnaHQgKGMpIDIwMTYtMjAyNCBUZXhhcyBJbnN0cnVt
ZW50cyBJbmNvcnBvcmF0ZWQKKyMgIAorIyAgQWxsIHJpZ2h0cyByZXNlcnZlZCBub3QgZ3JhbnRl
ZCBoZXJlaW4uCisjICAKKyMgLS0tIFdIRU5DRQorIyArKysgV0hFTkNFCisjIEBAIC0xMDE3LDI1
ICsxMDE3LDI1IEBACisjICBWZXJzaW9uOiA3NC5hNWU5NTg4Yi4wCisjICAKKyMgIEZpbGU6IGl3
bHdpZmktY2MtYTAtNzcudWNvZGUKKyMgLVZlcnNpb246IDc0LmEyMGZiMDdkLjAKKyMgK1ZlcnNp
b246IDc0Ljg1YmU0NGQzLjAKKyMgIAorIyAgRmlsZTogaXdsd2lmaS1RdS1iMC1oci1iMC03Ny51
Y29kZQorIyAtVmVyc2lvbjogNzQuYTIwZmIwN2QuMAorIyArVmVyc2lvbjogNzQuODViZTQ0ZDMu
MAorIyAgCisjICBGaWxlOiBpd2x3aWZpLVF1LWIwLWpmLWIwLTc3LnVjb2RlCisjIC1WZXJzaW9u
OiA3NC5hMjBmYjA3ZC4wCisjICtWZXJzaW9uOiA3NC44NWJlNDRkMy4wCisjICAKKyMgIEZpbGU6
IGl3bHdpZmktUXUtYzAtaHItYjAtNzcudWNvZGUKKyMgLVZlcnNpb246IDc0LmEyMGZiMDdkLjAK
KyMgK1ZlcnNpb246IDc0Ljg1YmU0NGQzLjAKKyMgIAorIyAgRmlsZTogaXdsd2lmaS1RdS1jMC1q
Zi1iMC03Ny51Y29kZQorIyAtVmVyc2lvbjogNzQuYTIwZmIwN2QuMAorIyArVmVyc2lvbjogNzQu
ODViZTQ0ZDMuMAorIyAgCisjICBGaWxlOiBpd2x3aWZpLVF1Wi1hMC1oci1iMC03Ny51Y29kZQor
IyAtVmVyc2lvbjogNzQuYTIwZmIwN2QuMAorIyArVmVyc2lvbjogNzQuODViZTQ0ZDMuMAorIyAg
CisjICBGaWxlOiBpd2x3aWZpLVF1Wi1hMC1qZi1iMC03Ny51Y29kZQorIyAtVmVyc2lvbjogNzQu
MjA2YjAxODQuMAorIyArVmVyc2lvbjogNzQuODViZTQ0ZDMuMAorIyAgCisjICBGaWxlOiBpd2x3
aWZpLXR5LWEwLWdmLWEwLTc3LnVjb2RlCisjICBWZXJzaW9uOiA3NC5mOTJiNWZlZC4wCisjIEBA
IC0xMDU5LDcgKzEwNTksNyBAQAorIyAgVmVyc2lvbjogODMuZmI1YzlhZWIuMAorIyAgCisjICBG
aWxlOiBpd2x3aWZpLXR5LWEwLWdmLWEwLTg5LnVjb2RlCisjIC1WZXJzaW9uOiA4Ny5lOWNlYzc4
ZS4wCisjICtWZXJzaW9uOiA4Ny4yMDJhMmY3Yi4wCisjICAKKyMgIEZpbGU6IGl3bHdpZmktc28t
YTAtZ2Y0LWEwLTc3LnVjb2RlCisjICBWZXJzaW9uOiA3NC5mOTJiNWZlZC4wCisjIEBAIC0xMDgz
LDcgKzEwODMsNyBAQAorIyAgVmVyc2lvbjogODMuZmI1YzlhZWIuMAorIyAgCisjICBGaWxlOiBp
d2x3aWZpLXNvLWEwLWdmNC1hMC04OS51Y29kZQorIyAtVmVyc2lvbjogODcuZTljZWM3OGUuMAor
IyArVmVyc2lvbjogODcuMjAyYTJmN2IuMAorIyAgCisjICBGaWxlOiBpd2x3aWZpLXNvLWEwLWdm
LWEwLTc3LnVjb2RlCisjICBWZXJzaW9uOiA3NC5mOTJiNWZlZC4wCisjIEBAIC0xMTA3LDcgKzEx
MDcsNyBAQAorIyAgVmVyc2lvbjogODMuZmI1YzlhZWIuMAorIyAgCisjICBGaWxlOiBpd2x3aWZp
LXNvLWEwLWdmLWEwLTg5LnVjb2RlCisjIC1WZXJzaW9uOiA4Ny5lOWNlYzc4ZS4wCisjICtWZXJz
aW9uOiA4Ny4yMDJhMmY3Yi4wCisjICAKKyMgIEZpbGU6IGl3bHdpZmktc28tYTAtaHItYjAtNzcu
dWNvZGUKKyMgIFZlcnNpb246IDc0LmY5MmI1ZmVkLjAKKyMgQEAgLTExMjgsNyArMTEyOCw3IEBA
CisjICBWZXJzaW9uOiA4My5mYjVjOWFlYi4wCisjICAKKyMgIEZpbGU6IGl3bHdpZmktc28tYTAt
aHItYjAtODkudWNvZGUKKyMgLVZlcnNpb246IDg3LmU5Y2VjNzhlLjAKKyMgK1ZlcnNpb246IDg3
LjIwMmEyZjdiLjAKKyMgIAorIyAgRmlsZTogaXdsd2lmaS1zby1hMC1qZi1iMC03Ny51Y29kZQor
IyAgVmVyc2lvbjogNzQuZjkyYjVmZWQuMAorIyBAQCAtMTE0NCw2ICsxMTQ0LDkgQEAKKyMgIEZp
bGU6IGl3bHdpZmktZ2wtYzAtZm0tYzAtOTAudWNvZGUKKyMgIFZlcnNpb246IDg3LjM4YzkzZGJj
LjAKKyMgIAorIyArRmlsZTogaXdsd2lmaS1nbC1jMC1mbS1jMC05Mi51Y29kZQorIyArVmVyc2lv
bjogODkuNjdjZTQ1ODguMAorIyArCisjICBGaWxlOiBpd2x3aWZpLWdsLWMwLWZtLWMwLnBudm0K
KyMgIAorIyAgRmlsZTogaXdsd2lmaS1tYS1iMC1nZi1hMC04My51Y29kZQorIyBAQCAtMTE1Myw3
ICsxMTU2LDcgQEAKKyMgIFZlcnNpb246IDgzLmZiNWM5YWViLjAKKyMgIAorIyAgRmlsZTogaXds
d2lmaS1tYS1iMC1nZi1hMC04OS51Y29kZQorIyAtVmVyc2lvbjogODcuZTljZWM3OGUuMAorIyAr
VmVyc2lvbjogODcuMjAyYTJmN2IuMAorIyAgCisjICBGaWxlOiBpd2x3aWZpLW1hLWIwLWdmLWEw
LnBudm0KKyMgIAorIyBAQCAtMTE2NCw3ICsxMTY3LDcgQEAKKyMgIFZlcnNpb246IDgzLmZiNWM5
YWViLjAKKyMgIAorIyAgRmlsZTogaXdsd2lmaS1tYS1iMC1nZjQtYTAtODkudWNvZGUKKyMgLVZl
cnNpb246IDg3LmU5Y2VjNzhlLjAKKyMgK1ZlcnNpb246IDg3LjIwMmEyZjdiLjAKKyMgIAorIyAg
RmlsZTogaXdsd2lmaS1tYS1iMC1nZjQtYTAucG52bQorIyAgCisjIEBAIC0xMTczLDYgKzExNzYs
OSBAQAorIyAgCisjICBGaWxlOiBpd2x3aWZpLW1hLWIwLWhyLWIwLTg2LnVjb2RlCisjICBWZXJz
aW9uOiA4My5mYjVjOWFlYi4wCisjICsKKyMgK0ZpbGU6IGl3bHdpZmktbWEtYjAtaHItYjAtODku
dWNvZGUKKyMgK1ZlcnNpb246IDgzLjIwMmEyZjdiLjAKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0
cmlidXRhYmxlLiBTZWUgTElDRU5DRS5pd2x3aWZpX2Zpcm13YXJlIGZvciBkZXRhaWxzCisjICAK
KyMgQEAgLTI1NzcsMTIgKzI1ODMsMjAgQEAKKyMgIEZpbGU6IGFtZGdwdS9nY18xMV81XzBfbWVz
XzIuYmluCisjICBGaWxlOiBhbWRncHUvZ2NfMTFfNV8wX3BmcC5iaW4KKyMgIEZpbGU6IGFtZGdw
dS9nY18xMV81XzBfcmxjLmJpbgorIyArRmlsZTogYW1kZ3B1L2djXzExXzVfMV9pbXUuYmluCisj
ICtGaWxlOiBhbWRncHUvZ2NfMTFfNV8xX21lLmJpbgorIyArRmlsZTogYW1kZ3B1L2djXzExXzVf
MV9tZWMuYmluCisjICtGaWxlOiBhbWRncHUvZ2NfMTFfNV8xX21lczEuYmluCisjICtGaWxlOiBh
bWRncHUvZ2NfMTFfNV8xX21lc18yLmJpbgorIyArRmlsZTogYW1kZ3B1L2djXzExXzVfMV9wZnAu
YmluCisjICtGaWxlOiBhbWRncHUvZ2NfMTFfNV8xX3JsYy5iaW4KKyMgIEZpbGU6IGFtZGdwdS9k
Y25fM18xXzRfZG1jdWIuYmluCisjICBGaWxlOiBhbWRncHUvZGNuXzNfMV81X2RtY3ViLmJpbgor
IyAgRmlsZTogYW1kZ3B1L2Rjbl8zXzFfNl9kbWN1Yi5iaW4KKyMgIEZpbGU6IGFtZGdwdS9kY25f
M18yXzBfZG1jdWIuYmluCisjICBGaWxlOiBhbWRncHUvZGNuXzNfMl8xX2RtY3ViLmJpbgorIyAg
RmlsZTogYW1kZ3B1L2Rjbl8zXzVfZG1jdWIuYmluCisjICtGaWxlOiBhbWRncHUvZGNuXzNfNV8x
X2RtY3ViLmJpbgorIyAgRmlsZTogYW1kZ3B1L3BzcF8xM18wXzBfc29zLmJpbgorIyAgRmlsZTog
YW1kZ3B1L3BzcF8xM18wXzBfdGEuYmluCisjICBGaWxlOiBhbWRncHUvcHNwXzEzXzBfNF90YS5i
aW4KKyMgQEAgLTI2MDMsNiArMjYxNyw4IEBACisjICBGaWxlOiBhbWRncHUvcHNwXzEzXzBfMTFf
dG9jLmJpbgorIyAgRmlsZTogYW1kZ3B1L3BzcF8xNF8wXzBfdGEuYmluCisjICBGaWxlOiBhbWRn
cHUvcHNwXzE0XzBfMF90b2MuYmluCisjICtGaWxlOiBhbWRncHUvcHNwXzE0XzBfMV90YS5iaW4K
KyMgK0ZpbGU6IGFtZGdwdS9wc3BfMTRfMF8xX3RvYy5iaW4KKyMgIEZpbGU6IGFtZGdwdS9zZG1h
XzRfNF8yLmJpbgorIyAgRmlsZTogYW1kZ3B1L3NkbWFfNV8yXzYuYmluCisjICBGaWxlOiBhbWRn
cHUvc2RtYV81XzJfNy5iaW4KKyMgQEAgLTI2MTEsNiArMjYyNyw3IEBACisjICBGaWxlOiBhbWRn
cHUvc2RtYV82XzBfMi5iaW4KKyMgIEZpbGU6IGFtZGdwdS9zZG1hXzZfMF8zLmJpbgorIyAgRmls
ZTogYW1kZ3B1L3NkbWFfNl8xXzAuYmluCisjICtGaWxlOiBhbWRncHUvc2RtYV82XzFfMS5iaW4K
KyMgIEZpbGU6IGFtZGdwdS9zbXVfMTNfMF8wLmJpbgorIyAgRmlsZTogYW1kZ3B1L3NtdV8xM18w
XzYuYmluCisjICBGaWxlOiBhbWRncHUvc211XzEzXzBfNy5iaW4KKyMgQEAgLTI2MjIsNyArMjYz
OSwxMCBAQAorIyAgRmlsZTogYW1kZ3B1L3Zjbl80XzBfMy5iaW4KKyMgIEZpbGU6IGFtZGdwdS92
Y25fNF8wXzQuYmluCisjICBGaWxlOiBhbWRncHUvdmNuXzRfMF81LmJpbgorIyArRmlsZTogYW1k
Z3B1L3Zjbl80XzBfNi5iaW4KKyMgK0ZpbGU6IGFtZGdwdS92Y25fNF8wXzZfMS5iaW4KKyMgIEZp
bGU6IGFtZGdwdS92cGVfNl8xXzAuYmluCisjICtGaWxlOiBhbWRncHUvdnBlXzZfMV8xLmJpbgor
IyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLmFtZGdwdSBmb3Ig
ZGV0YWlscy4KKyMgIAorIyBAQCAtMzA2NCw2ICszMDg0LDMwIEBACisjICAKKyMgIC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCisjICAKKyMgK0RyaXZlcjogY2MzM3h4IC0gVGV4YXMgSW5zdHJ1bWVudHMgODAy
LjExIFdMQU4gZHJpdmVyIGZvciBDQzMzeHggY2hpcHMKKyMgKworIyArRmlsZTogdGktY29ubmVj
dGl2aXR5L2NjMzN4eF8ybmRfbG9hZGVyLmJpbgorIyArVmVyc2lvbjogMS4wLjAuMjMKKyMgK0Zp
bGU6IHRpLWNvbm5lY3Rpdml0eS9jYzMzeHhfZncuYmluCisjICtWZXJzaW9uOiAxLjcuMC4xMjAK
KyMgK0ZpbGU6IHRpLWNvbm5lY3Rpdml0eS9jYzMzeHgtY29uZi5iaW4KKyMgK1ZlcnNpb246IDEu
Ny4wLjEyMAorIyArCisjICtMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLnRp
LWNvbm5lY3Rpdml0eSBmb3IgZGV0YWlscy4KKyMgKworIyArVGhlIGNjMzN4eC1jb25mLmJpbiBp
cyBhIGJpbmFyeSBjb250YWluaW5nIHR3byBwYXJ0czogcmFkaW8gY2FsaWJyYXRpb24KKyMgK2Fu
ZCBoYXJkd2FyZSBjb25maWd1cmF0aW9uLiBUaGUgYmluYXJ5IGNhbiBiZSBtb2RpZmllZCB1c2lu
ZyB0aGUgdG9vbAorIyArY2MzM2NvbmYgd2hpY2ggY2FuIGJlIGZvdW5kIGluIHRoZSBDQzMzWFgg
TGludXggU0RLIGhlcmU6IAorIyArCisjICtodHRwczovL3d3dy50aS5jb20vdG9vbC9DQzMzWFgt
U09GVFdBUkUgCisjICsKKyMgK1RoZSBkcml2ZXIgZXhwZWN0cyB0byBmaW5kIHRoZSBmaXJtd2Fy
ZXMgdW5kZXIgYSB0aS1jb25uZWN0aXZpdHkKKyMgK3N1YmRpcmVjdG9yeS4gIFNvIGlmIHlvdXIg
c3lzdGVtIGxvb2tzIGZvciBmaXJtd2FyZXMgaW4gL2xpYi9maXJtd2FyZSwKKyMgK3RoZSBmaXJt
d2FyZXMgZm9yIGNjMzN4eCBjaGlwcyBtdXN0IGJlIGxvY2F0ZWQgaW4KKyMgKy9saWIvZmlybXdh
cmUvdGktY29ubmVjdGl2aXR5Ly4KKyMgKworIyArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgKworIyAg
RHJpdmVyOiBUSV9TVCAtIFRleGFzIEluc3RydW1lbnRzIGJsdWV0b290aCBkcml2ZXIKKyMgIAor
IyAgRmlsZTogdGktY29ubmVjdGl2aXR5L1RJSW5pdF82LjIuMzEuYnRzCisjIEBAIC0zMjI2LDYg
KzMyNzAsNyBAQAorIyAgRHJpdmVyOiBydHc4OCAtIFJlYWx0ZWsgODAyLjExYWMgV0xBTiBkcml2
ZXIgZm9yIFJUTDg4MjJCRSBhbmQgUlRMODgyMkNFCisjICAKKyMgIEluZm86IFNlbnQgdG8gTGFy
cnkgRmluZ2VyIGJ5IFJlYWx0ZWsgZW5naW5lZXIgWWFuLUhzdWFuIENodWFuZyA8eWhjaHVhbmdA
cmVhbHRlay5jb20+CisjICtGaWxlOiBydHc4OC9ydHc4ODIxYV9mdy5iaW4KKyMgIEZpbGU6IHJ0
dzg4L3J0dzg4MjJiX2Z3LmJpbgorIyAgRmlsZTogcnR3ODgvcnR3ODgyMmNfZncuYmluCisjICBG
aWxlOiBydHc4OC9ydHc4ODIyY193b3dfZncuYmluCisjIEBAIC0zMjUzLDEzICszMjk4LDE1IEBA
CisjICBGaWxlOiBydHc4OS9ydHc4ODUyYV9mdy5iaW4KKyMgIEZpbGU6IHJ0dzg5L3J0dzg4NTJi
X2Z3LmJpbgorIyAgRmlsZTogcnR3ODkvcnR3ODg1MmJfZnctMS5iaW4KKyMgK0ZpbGU6IHJ0dzg5
L3J0dzg4NTJidF9mdy5iaW4KKyMgIEZpbGU6IHJ0dzg5L3J0dzg4NTJjX2Z3LmJpbgorIyArRmls
ZTogcnR3ODkvcnR3ODg1MmNfZnctMS5iaW4KKyMgIEZpbGU6IHJ0dzg5L3J0dzg5MjJhX2Z3LmJp
bgorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLnJ0bHdpZmlf
ZmlybXdhcmUudHh0IGZvciBkZXRhaWxzLgorIyAgCisjICAgICBUaGVzZSBmaXJtd2FyZSBzdXBw
b3J0IDgwMi4xMWF4IGNoaXBzIGluY2x1ZGluZyBSVEw4ODUxQiwgUlRMODg1MkEsCisjIC0gICBS
VEw4ODUyQiBhbmQgUlRMODg1MkMgYW5kIDgwMi4xMWJlIGNoaXAgaW5jbHVkaW5nIFJUTDg5MjJB
LgorIyArICAgUlRMODg1MkIsIFJUTDg4NTJCVCBhbmQgUlRMODg1MkMgYW5kIDgwMi4xMWJlIGNo
aXAgaW5jbHVkaW5nIFJUTDg5MjJBLgorIyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisj
IEBAIC0zODgzLDE0ICszOTMwLDE3IEBACisjICBWZXJzaW9uOiBCVF9XaW5kU3Rvcm1QZWFrX1JF
TDEyOTkKKyMgIEZpbGU6IGludGVsL2lidC0xMi0xNi5zZmkKKyMgIFZlcnNpb246IEJUX1dpbmRT
dG9ybVBlYWtfUkVMMTI5OQorIyArCisjICBGaWxlOiBpbnRlbC9pYnQtMTctMTYtMS5zZmkKKyMg
LVZlcnNpb246IEJUX0plZmZlcnNvblBlYWtfQjBfQjBfUkVMMjAzOTcKKyMgIEZpbGU6IGludGVs
L2lidC0xNy0xNi0xLmRkYworIyAtVmVyc2lvbjogQlRfSmVmZmVyc29uUGVha19CMF9CMF9SRUwy
MDM5NworIyAgRmlsZTogaW50ZWwvaWJ0LTE3LTIuc2ZpCisjIC1WZXJzaW9uOiBCVF9KZWZmZXJz
b25QZWFrX0IwX0IwX1JFTDIwMzk3CisjICBGaWxlOiBpbnRlbC9pYnQtMTctMi5kZGMKKyMgLVZl
cnNpb246IEJUX0plZmZlcnNvblBlYWtfQjBfQjBfUkVMMjAzOTcKKyMgK0ZpbGU6IGludGVsL2li
dC0xOC0xNi0xLnNmaQorIyArRmlsZTogaW50ZWwvaWJ0LTE4LTE2LTEuZGRjCisjICtGaWxlOiBp
bnRlbC9pYnQtMTgtMi5zZmkKKyMgK0ZpbGU6IGludGVsL2lidC0xOC0yLmRkYworIyArVmVyc2lv
bjogQlRfUHVsc2FyX1JFTDIwNDI1XzIyLjIwLjI0MTIuMjA0MjUKKyMgKworIyAgRmlsZTogaW50
ZWwvaWJ0LTE3LTAtMS5zZmkKKyMgIFZlcnNpb246IEJUX0plZmZlcnNvblBlYWtfQTBfQjBfUkVM
MDIwMQorIyAgRmlsZTogaW50ZWwvaWJ0LTE3LTAtMS5kZGMKKyMgQEAgLTM4OTksMTQgKzM5NDks
NyBAQAorIyAgVmVyc2lvbjogQlRfSmVmZmVyc29uUGVha19BMF9CMF9SRUwwMjAxCisjICBGaWxl
OiBpbnRlbC9pYnQtMTctMS5kZGMKKyMgIFZlcnNpb246IEJUX0plZmZlcnNvblBlYWtfQTBfQjBf
UkVMMDIwMQorIyAtRmlsZTogaW50ZWwvaWJ0LTE4LTE2LTEuc2ZpCisjIC1WZXJzaW9uOiBCVF9U
aHVuZGVyUGVha19CMF9CMF9SRUwyMDM5NworIyAtRmlsZTogaW50ZWwvaWJ0LTE4LTE2LTEuZGRj
CisjIC1WZXJzaW9uOiBCVF9UaHVuZGVyUGVha19CMF9CMF9SRUwyMDM5NworIyAtRmlsZTogaW50
ZWwvaWJ0LTE4LTIuc2ZpCisjIC1WZXJzaW9uOiBCVF9UaHVuZGVyUGVha19CMF9CMF9SRUwyMDM5
NworIyAtRmlsZTogaW50ZWwvaWJ0LTE4LTIuZGRjCisjIC1WZXJzaW9uOiBCVF9UaHVuZGVyUGVh
a19CMF9CMF9SRUwyMDM5NworIyArCisjICBGaWxlOiBpbnRlbC9pYnQtMTgtMC0xLnNmaQorIyAg
VmVyc2lvbjogQlRfVGh1bmRlclBlYWtfQTBfQjBfUkVMMDIwMQorIyAgRmlsZTogaW50ZWwvaWJ0
LTE4LTAtMS5kZGMKKyMgQEAgLTM5ODIsNyArNDAyNSw3IEBACisjICBGaWxlOiBpbnRlbC9pYnQt
MDA0MC0xMDUwLmRkYworIyAgRmlsZTogaW50ZWwvaWJ0LTEwNDAtMTA1MC5zZmkKKyMgIEZpbGU6
IGludGVsL2lidC0xMDQwLTEwNTAuZGRjCisjIC1WZXJzaW9uOiBCVF9Tb2xhcl9SRUw4MTQ1NF8y
My41MC4yNDE0NC44MTQ1NAorIyArVmVyc2lvbjogQlRfU29sYXJfUkVMODE1MjhfMjMuNTAuMjQx
ODMuODE1MjgKKyMgIAorIyAgRmlsZTogaW50ZWwvaWJ0LTAwNDAtMTAyMC5zZmkKKyMgIEZpbGU6
IGludGVsL2lidC0wMDQwLTEwMjAuZGRjCisjIEBAIC0zOTk2LDcgKzQwMzksNyBAQAorIyAgCisj
ICBGaWxlOiBpbnRlbC9pYnQtMDI5MS0wMjkxLnNmaQorIyAgRmlsZTogaW50ZWwvaWJ0LTAyOTEt
MDI5MS5kZGMKKyMgLVZlcnNpb246IEJUX0JsYXphclVfU19SRUw1Njg4OF8yMy41MC4yNDE0NC41
Njg4OAorIyArVmVyc2lvbjogQlRfQmxhemFyVV9TX1JFTDU4MjExXzIzLjYwLjI0MTgzLjU4MjEx
CisjICAKKyMgIEZpbGU6IGludGVsL2lidC0wMTgwLTAwNDEuc2ZpCisjICBGaWxlOiBpbnRlbC9p
YnQtMDE4MC0wMDQxLmRkYworIyBAQCAtNDAwNCw3ICs0MDQ3LDcgQEAKKyMgIEZpbGU6IGludGVs
L2lidC0wMTgwLTQxNTAuZGRjCisjICBGaWxlOiBpbnRlbC9pYnQtMDE4MC0xMDUwLnNmaQorIyAg
RmlsZTogaW50ZWwvaWJ0LTAxODAtMTA1MC5kZGMKKyMgLVZlcnNpb246IEJUX01hZ25ldGFyX1JF
TDEwMzE3MV8yMy41MC4yNDE0NC4xMDMxNzEKKyMgK1ZlcnNpb246IEJUX01hZ25ldGFyX1JFTDEw
MzI0M18yMy41MC4yNDE4My4xMDMyNDMKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxl
LiBTZWUgTElDRU5DRS5pYnRfZmlybXdhcmUgZm9yIGRldGFpbHMKKyMgIAorIyBAQCAtNDEzOSw5
ICs0MTgyLDkgQEAKKyMgIFJhd0ZpbGU6IGFtZC11Y29kZS9taWNyb2NvZGVfYW1kX2ZhbTE2aC5i
aW4KKyMgIFZlcnNpb246IDIwMTQtMTAtMjgKKyMgIFJhd0ZpbGU6IGFtZC11Y29kZS9taWNyb2Nv
ZGVfYW1kX2ZhbTE3aC5iaW4KKyMgLVZlcnNpb246IDIwMjMtMTItMDUKKyMgK1ZlcnNpb246IDIw
MjQtMDctMTAKKyMgIFJhd0ZpbGU6IGFtZC11Y29kZS9taWNyb2NvZGVfYW1kX2ZhbTE5aC5iaW4K
KyMgLVZlcnNpb246IDIwMjQtMDEtMTYKKyMgK1ZlcnNpb246IDIwMjQtMDctMTAKKyMgIEZpbGU6
IGFtZC11Y29kZS9SRUFETUUKKyMgIAorIyAgTGljZW5zZTogUmVkaXN0cmlidXRhYmxlLiBTZWUg
TElDRU5TRS5hbWQtdWNvZGUgZm9yIGRldGFpbHMKKyMgQEAgLTQyMzcsNiArNDI4MCw4IEBACisj
ICBMaW5rOiBxYXRfbW1wLmJpbiAtPiBxYXRfODk1eGNjX21tcC5iaW4KKyMgIEZpbGU6IHFhdF80
eHh4LmJpbgorIyAgRmlsZTogcWF0XzR4eHhfbW1wLmJpbgorIyArRmlsZTogcWF0XzQwMnh4LmJp
bgorIyArRmlsZTogcWF0XzQwMnh4X21tcC5iaW4KKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmli
dXRhYmxlLiBTZWUgTElDRU5DRS5xYXRfZmlybXdhcmUgZm9yIGRldGFpbHMKKyMgIAorIyBAQCAt
NDMyNiw3ICs0MzcxLDcgQEAKKyMgIExpbms6IGludGVsL2RzcF9md19yZWxlYXNlLmJpbiAtPiBh
dnMvc2tsL2RzcF9iYXNlZncuYmluCisjICBMaW5rOiBpbnRlbC9kc3BfZndfa2JsLmJpbiAtPiBh
dnMvc2tsL2RzcF9iYXNlZncuYmluCisjICBGaWxlOiBpbnRlbC9hdnMvYXBsL2RzcF9iYXNlZncu
YmluCisjIC1WZXJzaW9uOiA5LjIyLjAxLjQ5MDgKKyMgK1ZlcnNpb246IDkuMjIuMDEuNDkxNwor
IyAgTGluazogaW50ZWwvZHNwX2Z3X2J4dG4uYmluIC0+IGF2cy9hcGwvZHNwX2Jhc2Vmdy5iaW4K
KyMgIExpbms6IGludGVsL2RzcF9md19nbGsuYmluIC0+IGF2cy9hcGwvZHNwX2Jhc2Vmdy5iaW4K
KyMgIEZpbGU6IGludGVsL2F2cy9jbmwvZHNwX2Jhc2Vmdy5iaW4KKyMgQEAgLTQzMzQsNiArNDM3
OSwyNiBAQAorIyAgTGluazogaW50ZWwvZHNwX2Z3X2NubC5iaW4gLT4gYXZzL2NubC9kc3BfYmFz
ZWZ3LmJpbgorIyAgCisjICBMaWNlbnNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLmFk
c3Bfc3N0IGZvciBkZXRhaWxzCisjICsKKyMgK0ZpbGU6IGludGVsL2F2cy9kYTcyMTktdHBsZy5i
aW4KKyMgK0ZpbGU6IGludGVsL2F2cy9kbWljLXRwbGcuYmluCisjICtGaWxlOiBpbnRlbC9hdnMv
aGRhLTgwODYyOHh4LTNlcC10cGxnLmJpbgorIyArTGluazogaW50ZWwvYXZzL2hkYS04MDg2LWdl
bmVyaWMtdHBsZy5iaW4gLT4gaGRhLTgwODYyOHh4LTNlcC10cGxnLmJpbgorIyArRmlsZTogaW50
ZWwvYXZzL2hkYS1nZW5lcmljLTFlcC10cGxnLmJpbgorIyArTGluazogaW50ZWwvYXZzL2hkYS1n
ZW5lcmljLXRwbGcuYmluIC0+IGhkYS1nZW5lcmljLTFlcC10cGxnLmJpbgorIyArRmlsZTogaW50
ZWwvYXZzL21heDk4MzU3YS10cGxnLmJpbgorIyArRmlsZTogaW50ZWwvYXZzL21heDk4MzczLXRw
bGcuYmluCisjICtGaWxlOiBpbnRlbC9hdnMvbWF4OTg5MjctdHBsZy5iaW4KKyMgK0ZpbGU6IGlu
dGVsL2F2cy9uYXU4ODI1LXRwbGcuYmluCisjICtGaWxlOiBpbnRlbC9hdnMvcnQyNzQtdHBsZy5i
aW4KKyMgK0ZpbGU6IGludGVsL2F2cy9ydDI4Ni10cGxnLmJpbgorIyArRmlsZTogaW50ZWwvYXZz
L3J0Mjk4LXRwbGcuYmluCisjICtGaWxlOiBpbnRlbC9hdnMvcnQ1NTE0LXRwbGcuYmluCisjICtG
aWxlOiBpbnRlbC9hdnMvcnQ1NjQwLXRwbGcuYmluCisjICtGaWxlOiBpbnRlbC9hdnMvcnQ1NjYz
LXRwbGcuYmluCisjICtGaWxlOiBpbnRlbC9hdnMvc3NtNDU2Ny10cGxnLmJpbgorIyArCisjICtM
aWNlbnNlOiBBcGFjaGUtMi4wLiBTZWUgQXBhY2hlLTIgZm9yIGRldGFpbHMuCisjICAKKyMgIC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCisjICAKKyMgQEAgLTQ4NDQsNyArNDkwOSw3IEBACisjICBWZXJzaW9u
OiBHdUMgQVBJL0FQQiB2ZXIgNzAuMS4xIGZvciBUaWdlcmxha2UKKyMgIAorIyAgRmlsZTogaTkx
NS90Z2xfZ3VjXzcwLmJpbgorIyAtVmVyc2lvbjogR3VDIEFQSS9BUEIgdmVyIDcwLjIwLjAgZm9y
IFRpZ2VybGFrZQorIyArVmVyc2lvbjogR3VDIEFQSS9BUEIgdmVyIDcwLjI5LjIgZm9yIFRpZ2Vy
bGFrZQorIyAgCisjICBGaWxlOiBpOTE1L3RnbF9odWNfNy4wLjMuYmluCisjICBWZXJzaW9uOiBI
dWMgQVBJL0FQQiB2ZXIgNyByZWxlYXNlIDAgZm9yIFRpZ2VybGFrZQorIyBAQCAtNDg4Myw3ICs0
OTQ4LDcgQEAKKyMgIFZlcnNpb246IEd1QyBBUEkvQVBCIHZlciA3MC4xLjEgZm9yIERHMQorIyAg
CisjICBGaWxlOiBpOTE1L2RnMV9ndWNfNzAuYmluCisjIC1WZXJzaW9uOiBHdUMgQVBJL0FQQiB2
ZXIgNzAuMjAuMCBmb3IgREcxCisjICtWZXJzaW9uOiBHdUMgQVBJL0FQQiB2ZXIgNzAuMjkuMiBm
b3IgREcxCisjICAKKyMgIEZpbGU6IGk5MTUvZGcxX2h1Y183LjcuMS5iaW4KKyMgIFZlcnNpb246
IEh1YyBBUEkvQVBCIHZlciA3IHJlbGVhc2UgMSBmb3IgREcxCisjIEBAIC00OTI1LDcgKzQ5OTAs
NyBAQAorIyAgVmVyc2lvbjogR3VDIEFQSS9BUEIgdmVyIDcwLjEuMSBmb3IgQWxkZXJsYWtlIFAK
KyMgIAorIyAgRmlsZTogaTkxNS9hZGxwX2d1Y183MC5iaW4KKyMgLVZlcnNpb246IEd1QyBBUEkv
QVBCIHZlciA3MC4yMC4wIGZvciBBbGRlcmxha2UgUAorIyArVmVyc2lvbjogR3VDIEFQSS9BUEIg
dmVyIDcwLjI5LjIgZm9yIEFsZGVybGFrZSBQCisjICAKKyMgIEZpbGU6IGk5MTUvZGcyX2d1Y183
MC4xLjIuYmluCisjICBWZXJzaW9uOiBHdUMgQVBJL0FQQiB2ZXIgNzAuMS4yIGZvciBERzIKKyMg
QEAgLTQ5MzQsMTAgKzQ5OTksMTAgQEAKKyMgIFZlcnNpb246IEd1QyBBUEkvQVBCIHZlciA3MC40
LjEgZm9yIERHMgorIyAgCisjICBGaWxlOiBpOTE1L2RnMl9ndWNfNzAuYmluCisjIC1WZXJzaW9u
OiBHdUMgQVBJL0FQQiB2ZXIgNzAuMjAuMCBmb3IgREcyCisjICtWZXJzaW9uOiBHdUMgQVBJL0FQ
QiB2ZXIgNzAuMjkuMiBmb3IgREcyCisjICAKKyMgIEZpbGU6IGk5MTUvZGcyX2h1Y19nc2MuYmlu
CisjIC1WZXJzaW9uOiBIdUMgQVBJL0FQQiB2ZXIgNy4xMC4xNSBmb3IgREcyCisjICtWZXJzaW9u
OiBIdUMgQVBJL0FQQiB2ZXIgNy4xMC4xNiBmb3IgREcyCisjICAKKyMgIEZpbGU6IGk5MTUvZGcy
X2RtY192ZXIyXzA2LmJpbgorIyAgVmVyc2lvbjogRE1DIEFQSS9BUEIgdmVyIDIgcmVsZWFzZSA2
IGZvciBERzIKKyMgQEAgLTQ5NTIsMzAgKzUwMTcsNDIgQEAKKyMgIFZlcnNpb246IERNQyBBUEkv
QVBCIHZlciAyIHJlbGVhc2UgMTAgZm9yIE1ldGVvcmxha2UKKyMgIAorIyAgRmlsZTogaTkxNS9t
dGxfZG1jLmJpbgorIyAtVmVyc2lvbjogRE1DIEFQSS9BUEIgdmVyIDIgcmVsZWFzZSAyMSBmb3Ig
TWV0ZW9ybGFrZQorIyArVmVyc2lvbjogRE1DIEFQSS9BUEIgdmVyIDIgcmVsZWFzZSAyMiBmb3Ig
TWV0ZW9ybGFrZQorIyAgCisjICBGaWxlOiBpOTE1L210bF9ndWNfNzAuYmluCisjIC1WZXJzaW9u
OiBHdUMgQVBJL0FQQiB2ZXIgNzAuMjAuMCBmb3IgTWV0ZW9ybGFrZQorIyArVmVyc2lvbjogR3VD
IEFQSS9BUEIgdmVyIDcwLjI5LjIgZm9yIE1ldGVvcmxha2UKKyMgIAorIyAgRmlsZTogaTkxNS9t
dGxfaHVjX2dzYy5iaW4KKyMgIFZlcnNpb246IEh1QyBBUEkvQVBCIHZlciA4LjUuNCBmb3IgTWV0
ZW9ybGFrZQorIyAgCisjICBGaWxlOiBpOTE1L210bF9nc2NfMS5iaW4KKyMgLVZlcnNpb246IEdT
QyBBUEkvQVBCIHYxLjAsIHJlbGVhc2UgMTAyLjAuMC4xNjU1LCBTVk4gMSBmb3IgTWV0ZW9ybGFr
ZQorIyArVmVyc2lvbjogR1NDIEFQSS9BUEIgdjEuMCwgcmVsZWFzZSAxMDIuMC4xMC4xODc4LCBT
Vk4gMSBmb3IgTWV0ZW9ybGFrZQorIyAgCisjICBGaWxlOiBpOTE1L2JtZ19kbWMuYmluCisjICBW
ZXJzaW9uOiBETUMgQVBJL0FQQiB2ZXIgMiByZWxlYXNlIDYgZm9yIEJhdHRsZW1hZ2UKKyMgIAor
IyAgRmlsZTogaTkxNS94ZTJscGRfZG1jLmJpbgorIyAtVmVyc2lvbjogRE1DIEFQSS9BUEIgdmVy
IDIgcmVsZWFzZSAyMCBmb3IgWGUyTFBECisjICtWZXJzaW9uOiBETUMgQVBJL0FQQiB2ZXIgMiBy
ZWxlYXNlIDIxIGZvciBYZTJMUEQKKyMgIAorIyAgTGljZW5zZTogUmVkaXN0cmlidXRhYmxlLiBT
ZWUgTElDRU5TRS5pOTE1IGZvciBkZXRhaWxzCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisj
ICBEcml2ZXI6IHhlIC0tIEludGVsIEdyYXBoaWNzIGRyaXZlcgorIyAgCisjICtGaWxlOiB4ZS9s
bmxfZ3NjXzEuYmluCisjICtWZXJzaW9uOiBHU0MgQVBJL0FQQiB2MS4wLCByZWxlYXNlIDEwNC4w
LjAuMTE2MSwgU1ZOIDEgZm9yIEx1bmFybGFrZQorIyArCisjICBGaWxlOiB4ZS9sbmxfZ3VjXzcw
LmJpbgorIyAtVmVyc2lvbjogR3VDIEFQSS9BUEIgdmVyIDcwLjIwLjAgZm9yIEx1bmFybGFrZQor
IyArVmVyc2lvbjogR3VDIEFQSS9BUEIgdmVyIDcwLjI5LjIgZm9yIEx1bmFybGFrZQorIyArCisj
ICtGaWxlOiB4ZS9sbmxfaHVjLmJpbgorIyArVmVyc2lvbjogSHVDIEFQSS9BUEIgdmVyIDkuNC4x
MyBmb3IgTHVuYXJsYWtlCisjICsKKyMgK0ZpbGU6IHhlL2JtZ19ndWNfNzAuYmluCisjICtWZXJz
aW9uOiBHdUMgQVBJL0FQQiB2ZXIgNzAuMjkuMiBmb3IgQmF0dGxlbWFnZQorIyArCisjICtGaWxl
OiB4ZS9ibWdfaHVjLmJpbgorIyArVmVyc2lvbjogSHVDIEFQSS9BUEIgdmVyIDguMi4xMCBmb3Ig
QmF0dGxlbWFnZQorIyAgCisjICBMaWNlbnNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNF
LnhlIGZvciBkZXRhaWxzCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyBAQCAtNTY3Niw5ICs1NzUz
LDkgQEAKKyMgIERyaXZlcjogbXQ3OTIxIC0gTWVkaWFUZWsgTVQ3OTIxIFdpcmVsZXNzIE1BQ3MK
KyMgIAorIyAgRmlsZTogbWVkaWF0ZWsvV0lGSV9NVDc5NjFfcGF0Y2hfbWN1XzFfMl9oZHIuYmlu
CisjIC1WZXJzaW9uOiAyMDI0MDIxOTExMDk1OGEKKyMgK1ZlcnNpb246IDIwMjQwNzE2MTUwOTQ0
YQorIyAgRmlsZTogbWVkaWF0ZWsvV0lGSV9SQU1fQ09ERV9NVDc5NjFfMS5iaW4KKyMgLVZlcnNp
b246IDIwMjQwMjE5MTExMDM4CisjICtWZXJzaW9uOiAyMDI0MDcxNjE1MTAyNworIyAgCisjICBM
aWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLm1lZGlhdGVrIGZvciBkZXRhaWxz
LgorIyAgCisjIEBAIC01Njg3LDcgKzU3NjQsNyBAQAorIyAgRHJpdmVyOiBtdDc5MjEgLSBNZWRp
YVRlayBNVDc5MjEgYmx1ZXRvb3RoIGNoaXBzZXQKKyMgIAorIyAgRmlsZTogbWVkaWF0ZWsvQlRf
UkFNX0NPREVfTVQ3OTYxXzFfMl9oZHIuYmluCisjIC1WZXJzaW9uOiAyMDI0MDIxOTExMTQyNwor
IyArVmVyc2lvbjogMjAyNDA3MTYxNTA4NTgKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRh
YmxlLiBTZWUgTElDRU5DRS5tZWRpYXRlayBmb3IgZGV0YWlscy4KKyMgIAorIyBAQCAtNTY5Niw5
ICs1NzczLDkgQEAKKyMgIERyaXZlcjogbXQ3OTIyIC0gTWVkaWFUZWsgTVQ3OTIyIFdpcmVsZXNz
IE1BQ3MKKyMgIAorIyAgRmlsZTogbWVkaWF0ZWsvV0lGSV9NVDc5MjJfcGF0Y2hfbWN1XzFfMV9o
ZHIuYmluCisjIC1WZXJzaW9uOiAyMDI0MDQwOTE2MzMwMWEKKyMgK1ZlcnNpb246IDIwMjQwNzE2
MTYzMjQyYQorIyAgRmlsZTogbWVkaWF0ZWsvV0lGSV9SQU1fQ09ERV9NVDc5MjJfMS5iaW4KKyMg
LVZlcnNpb246IDIwMjQwNDA5MTYzMzQ3CisjICtWZXJzaW9uOiAyMDI0MDcxNjE2MzMyNworIyAg
CisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLm1lZGlhdGVrIGZvciBk
ZXRhaWxzLgorIyAgCisjIEBAIC01NzA3LDcgKzU3ODQsNyBAQAorIyAgRHJpdmVyOiBtdDc5MjIg
LSBNZWRpYVRlayBNVDc5MjIgYmx1ZXRvb3RoIGNoaXBzZXQKKyMgIAorIyAgRmlsZTogbWVkaWF0
ZWsvQlRfUkFNX0NPREVfTVQ3OTIyXzFfMV9oZHIuYmluCisjIC1WZXJzaW9uOiAyMDI0MDQwOTE2
MzY0OAorIyArVmVyc2lvbjogMjAyNDA3MTYxNjMxNTcKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0
cmlidXRhYmxlLiBTZWUgTElDRU5DRS5tZWRpYXRlayBmb3IgZGV0YWlscy4KKyMgIAorIyBAQCAt
NTg4NiwxMiArNTk2MywxMyBAQAorIyAgCisjICBWZXJzaW9uOiBWSURFTy5WRS42LjAtMDAwNDkt
UFJPRC0xCisjICAKKyMgLUZpbGU6IHFjb20vdnB1LTEuMC92ZW51cy5tYm4KKyMgLUxpbms6IHFj
b20vdnB1LTEuMC92ZW51cy5tZHQgLT4gdmVudXMubWJuCisjICtGaWxlOiBxY29tL3ZwdS92cHUy
MF9wNC5tYm4KKyMgK0xpbms6IHFjb20vdnB1LTEuMC92ZW51cy5tYm4gLT4gLi4vdnB1L3ZwdTIw
X3A0Lm1ibgorIyAgCisjICBWZXJzaW9uOiBWSURFTy5WUFUuMS4wLTAwMDg3LVBST0QtMQorIyAg
CisjIC1GaWxlOiBxY29tL3ZwdS0yLjAvdmVudXMubWJuCisjICtGaWxlOiBxY29tL3ZwdS92cHUy
MF9wMS5tYm4KKyMgK0xpbms6IHFjb20vdnB1LTIuMC92ZW51cy5tYm4gLT4gLi4vdnB1L3ZwdTIw
X3AxLm1ibgorIyAgCisjICBWZXJzaW9uOiBWSURFTy5WUFUuMi4wLTAwMDQ5LVBST0QtMQorIyAg
CisjIEBAIC01ODk5LDYgKzU5NzcsMTYgQEAKKyMgIAorIyAgQmluYXJ5IGZpbGVzIHN1cHBsaWVk
IG9yaWdpbmFsbHkgZnJvbQorIyAgaHR0cHM6Ly9kZXZlbG9wZXIucXVhbGNvbW0uY29tL2hhcmR3
YXJlL2RyYWdvbmJvYXJkLTQxMGMvdG9vbHMKKyMgKworIyArLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMg
KworIyArRHJpdmVyOiBpcmlzIC0gUXVhbGNvbW0gSXJpcyB2aWRlbyBjb2RlYyBhY2NlbGVyYXRv
cgorIyArCisjICtGaWxlOiBxY29tL3ZwdS92cHUzMF9wNC5tYm4KKyMgKworIyArVmVyc2lvbjog
VklERU8uVlBVLjMuMS0wMDc2CisjICsKKyMgK0xpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2Vl
IExJQ0VOU0UucWNvbSBhbmQgcWNvbS9OT1RJQ0UudHh0IGZvciBkZXRhaWxzCisjICAKKyMgIC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCisjICAKKyMgQEAgLTU5NDAsNiArNjAyOCw5IEBACisjICBGaWxlOiBx
Y29tL2xlaWFfcGZwXzQ3MC5mdworIyAgRmlsZTogcWNvbS9sZWlhX3BtNF80NzAuZncKKyMgIEZp
bGU6IHFjb20vc2M4MjgweHAvTEVOT1ZPLzIxQlgvcWNkeGttc3VjODI4MC5tYm4KKyMgK0ZpbGU6
IHFjb20vZ2VuNzA1MDBfZ211LmJpbgorIyArRmlsZTogcWNvbS9nZW43MDUwMF9zcWUuZncKKyMg
K0ZpbGU6IHFjb20veDFlODAxMDAvZ2VuNzA1MDBfemFwLm1ibgorIyAgCisjICBMaWNlbmNlOiBS
ZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLnFjb20gYW5kIHFjb20vTk9USUNFLnR4dCBmb3Ig
ZGV0YWlscworIyAgCisjIEBAIC02OTQ4LDYgKzcwMzksMjIgQEAKKyMgIEZpbGU6IGNpcnJ1cy9j
czM1bDQxLWRzcDEtc3BrLXByb3QtMTdhYTM4NjUtcjAuYmluCisjICBGaWxlOiBjaXJydXMvY3Mz
NWw0MS1kc3AxLXNway1wcm90LTE3YWEzODY2LWwwLmJpbgorIyAgRmlsZTogY2lycnVzL2NzMzVs
NDEtZHNwMS1zcGstcHJvdC0xN2FhMzg2Ni1yMC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQx
LWRzcDEtc3BrLXByb3QtMTdhYTM4Yzcud21mdyAtPiBjczM1bDQxL3Y2LjgzLjAvaGFsb19jc3Bs
X1JBTV9yZXZCMl8yOS44NS4wLndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3Br
LXByb3QtMTdhYTM4Yzgud21mdyAtPiBjczM1bDQxL3Y2LjgzLjAvaGFsb19jc3BsX1JBTV9yZXZC
Ml8yOS44NS4wLndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTdh
YTM4Zjkud21mdyAtPiBjczM1bDQxL3Y2LjYxLjEvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS42My4x
LndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTdhYTM4ZmEud21m
dyAtPiBjczM1bDQxL3Y2LjYxLjEvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS42My4xLndtZncKKyMg
K0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTdhYTM4Yzctc3BraWQwLWwwLmJp
bgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xN2FhMzhjNy1zcGtpZDAt
cjAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTE3YWEzOGM3LXNw
a2lkMC1sMS5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTdhYTM4
Yzctc3BraWQwLXIxLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0x
N2FhMzhjOC1zcGtpZDEtbDAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1w
cm90LTE3YWEzOGM4LXNwa2lkMS1yMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEt
c3BrLXByb3QtMTdhYTM4Yzgtc3BraWQxLWwxLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEt
ZHNwMS1zcGstcHJvdC0xN2FhMzhjOC1zcGtpZDEtcjEuYmluCisjICtGaWxlOiBjaXJydXMvY3Mz
NWw0MS1kc3AxLXNway1wcm90LTE3YWEzOGZhLXNwa2lkMC1sMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1
cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTdhYTM4ZmEtc3BraWQwLXIwLmJpbgorIyArRmlsZTog
Y2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xN2FhMzhmOS1zcGtpZDEtbDAuYmluCisjICtG
aWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTE3YWEzOGY5LXNwa2lkMS1yMC5iaW4K
KyMgIExpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhjMjYud21mdyAtPiBj
czM1bDQxL3Y2LjYxLjEvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS42My4xLndtZncKKyMgIExpbms6
IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhiNDIud21mdyAtPiBjczM1bDQxL3Y2
LjYxLjEvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS42My4xLndtZncKKyMgIExpbms6IGNpcnJ1cy9j
czM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhiNDMud21mdyAtPiBjczM1bDQxL3Y2LjYxLjEvaGFs
b19jc3BsX1JBTV9yZXZCMl8yOS42My4xLndtZncKKyMgQEAgLTcxNDMsOCArNzI1MCw3IEBACisj
ICBGaWxlOiBtZWRpYXRlay9zb2Yvc29mLW10ODE5NS5yaQorIyAgRmlsZTogbWVkaWF0ZWsvc29m
L3NvZi1tdDgxOTUubGRjCisjICBGaWxlOiBtZWRpYXRlay9zb2YtdHBsZy9zb2YtbXQ4MTk1LW10
NjM1OS1ydDEwMTktcnQ1NjgyLnRwbGcKKyMgLUZpbGU6IG1lZGlhdGVrL3NvZi10cGxnL3NvZi1t
dDgxOTUtbXQ2MzU5LXJ0MTAxOS1ydDU2ODItZHRzLnRwbGcKKyMgLVZlcnNpb246IHYwLjQuMQor
IyArVmVyc2lvbjogdjAuNC4yCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2Vl
IExJQ0VOQ0UubWVkaWF0ZWsgZm9yIGRldGFpbHMuCisjICAKKyMgQEAgLTcxOTAsMTMgKzcyOTYs
MTcgQEAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAKKyMgIERyaXZlcjogYW1sb2dpYyAtIEFt
bG9naWMgU29DIEZpcm13YXJlCisjIC1GaWxlOiBhbWxvZ2ljL2JsdWV0b290aC93Ml9idF9md191
YXJ0LmJpbgorIyAtVmVyc2lvbjogMzguMDEKKyMgLUluZm86IDB4YTkxNAorIyAtCisjIC1GaWxl
OiBhbWxvZ2ljL2JsdWV0b290aC93MXVfYnRfZndfdWFydC5iaW4KKyMgLVZlcnNpb246IDQxLjA1
CisjIC1JbmZvOiAweGIwMjQKKyMgK0ZpbGU6IGFtbG9naWMvYW1sX3cxNTVzMl9idF91YXJ0LmJp
bgorIyArVmVyc2lvbjogNDIuMjMKKyMgK0luZm86IDB4MmRlOAorIyArCisjICtGaWxlOiBhbWxv
Z2ljL2FtbF93MjY1czFfYnRfdWFydC5iaW4KKyMgK1ZlcnNpb246IDQzLjEzCisjICtJbmZvOiAw
eGMxYzIKKyMgKworIyArRmlsZTogYW1sb2dpYy9hbWxfdzI2NXMyX2J0X3VhcnQuYmluCisjICtW
ZXJzaW9uOiA0Mi4yOAorIyArSW5mbzogMHhiMmZkCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJp
YnV0YWJsZS4gU2VlIExJQ0VOU0UuYW1sb2dpYyBmb3IgZGV0YWlscworIyAgCisjIEBAIC03Mjkx
LDEwICs3NDAxLDggQEAKKyMgIExpbms6IFRJQVMyNzgxUkNBMi5iaW4gLT4gdGkvdGFzMjc4MS9U
SUFTMjc4MVJDQTIuYmluCisjICBMaW5rOiBUSUFTMjc4MVJDQTQuYmluIC0+IHRpL3RhczI3ODEv
VElBUzI3ODFSQ0E0LmJpbgorIyAgCisjIC1MaWNlbmNlOiBBbGxlZ2VkbHkgR1BMdjIrLCBidXQg
bm8gc291cmNlIHZpc2libGUuIE1hcmtlZDoKKyMgLQkgQ29weXJpZ2h0IChDKSAyMDIzIFRleGFz
IEluc3RydW1lbnRzCisjIC0KKyMgLUZvdW5kIGluIGhleCBmb3JtIGluIGtlcm5lbCBzb3VyY2Uu
CisjICtMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLnRpLXRzcGEgZm9yIGRl
dGFpbHMuIE1hcmtlZDoKKyMgKwkgQ29weXJpZ2h0IChDKSAyMDIzIC0gMjAyNCBUZXhhcyBJbnN0
cnVtZW50cworIyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisjIEBAIC03MzA0LDEwICs3
NDEyLDggQEAKKyMgIExpbms6IFRBUzJYWFgzODcwLmJpbiAtPiB0aS90YXMyNTYzL1RBUzJYWFgz
ODcwLmJpbgorIyAgTGluazogSU5UODg2NlJDQTIuYmluIC0+IHRpL3RhczI1NjMvSU5UODg2NlJD
QTIuYmluCisjICAKKyMgLUxpY2VuY2U6IEFsbGVnZWRseSBHUEx2MissIGJ1dCBubyBzb3VyY2Ug
dmlzaWJsZS4gTWFya2VkOgorIyAtCSBDb3B5cmlnaHQgKEMpIDIwMjMgVGV4YXMgSW5zdHJ1bWVu
dHMKKyMgLQorIyAtRm91bmQgaW4gaGV4IGZvcm0gaW4ga2VybmVsIHNvdXJjZS4KKyMgK0xpY2Vu
Y2U6IFJlZGlzdHJpYnV0YWJsZS4gTElDRU5DRS50aS10c3BhIGZvciBkZXRhaWxzLiBNYXJrZWQ6
CisjICsJIENvcHlyaWdodCAoQykgMjAyMyAtIDIwMjQgVGV4YXMgSW5zdHJ1bWVudHMKKyMgIAor
IyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgIAorIyBAQCAtNzMyNCwzICs3NDMwLDI5IEBACisjICBW
ZXJzaW9uOiBhcmNoMTAuOAorIyAgCisjICBMaWNlbnNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBM
SUNFTkNFLm1hbGlfY3NmZncgZm9yIGRldGFpbHMKKyMgKworIyArLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
KyMgK0RyaXZlcjogaXNwIC0gSW1hZ2UgU2lnbmFsIFByb2Nlc3NvciAoSVNQKSBkZXZpY2UKKyMg
K0ZpbGU6IGFtZGdwdS9pc3BfNF8xXzEuYmluCisjICsKKyMgK0xpY2Vuc2U6IFJlZGlzdHJpYnV0
YWJsZS4gU2VlIExJQ0VOU0UuYW1kaXNwIGZvciBkZXRhaWxzCisjICsKKyMgKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCisjICsKKyMgK0RyaXZlcjogcWFpYyAtIFF1YWxjb21tIENsb3VkIEFJIGFjY2VsZXJh
dG9ycworIyArRmlsZTogcWNvbS9haWMxMDAvZncxLmJpbgorIyArRmlsZTogcWNvbS9haWMxMDAv
ZncxMC5iaW4KKyMgK0ZpbGU6IHFjb20vYWljMTAwL2Z3Mi5iaW4KKyMgK0ZpbGU6IHFjb20vYWlj
MTAwL2Z3NS5iaW4KKyMgK0ZpbGU6IHFjb20vYWljMTAwL2Z3OS5iaW4KKyMgK0ZpbGU6IHFjb20v
YWljMTAwL3NibC5iaW4KKyMgKworIyArTGljZW5zZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElD
RU5TRS5xY29tIGFuZCBxY29tL05PVElDRS50eHQgZm9yIGRldGFpbHMKKyMgKworIyArLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KKyMgKworIyArRHJpdmVyOiBpc2ggLSBJbnRlbCBJbnRlZ3JhdGVkIFNlbnNv
ciBIdWIKKyMgK0ZpbGU6IGludGVsL2lzaC9pc2hfbG5sbS5iaW4KKyMgK1ZlcnNpb246IDUuOC4w
Ljc3MTYKKyMgKworIyArTGljZW5zZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5pc2gg
Zm9yIGRldGFpbHMKKyMgCisjCisKIFNVTU1BUlkgPSAiRmlybXdhcmUgZmlsZXMgZm9yIHVzZSB3
aXRoIExpbnV4IGtlcm5lbCIKIEhPTUVQQUdFID0gImh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvIgog
REVTQ1JJUFRJT04gPSAiTGludXggZmlybXdhcmUgaXMgYSBwYWNrYWdlIGRpc3RyaWJ1dGVkIGFs
b25nc2lkZSB0aGUgTGludXgga2VybmVsIFwKQEAgLTE0NCw3ICs3ODcsNyBAQCBMSUNfRklMRVNf
Q0hLU1VNID0gImZpbGU6Ly9MSUNFTkNFLkFiaWxpczttZDU9YjVlZTNmNDEwNzgwZTU2NzExYWQ0
OGVhZGMyMmI4YmMgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5DRS5ydGx3aWZp
X2Zpcm13YXJlLnR4dDttZDU9MDBkMDZjZmQzZWRkZDVhMjY5ODk0OGVhZDJhZDU0YTUgXAogICAg
ICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5TRS5zZG1hX2Zpcm13YXJlO21kNT01MWU4YzE5
ZWNjMjI3MGY0YjhlYTMwMzQxYWQ2M2NlOSBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9M
SUNFTkNFLnNpYW5vO21kNT00NTU2YzFiZjgzMDA2N2YxMmNhMTUxYWQ5NTNlYzJhNSBcCi0gICAg
ICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTkNFLnRpLWNvbm5lY3Rpdml0eTttZDU9YzVlMDJi
ZTYzM2YxNDk5YzEwOWQxNjUyNTE0ZDg1ZWMgXAorICAgICAgICAgICAgICAgICAgICBmaWxlOi8v
TElDRU5DRS50aS1jb25uZWN0aXZpdHk7bWQ1PTNiMWU5Y2Y1NGFiYTgxNDZkYWQ0YjczNTc3N2Q0
MDZmIFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOQ0UudGkta2V5c3RvbmU7bWQ1
PTNhODYzMzVkMzI4NjRiMGJlZjk5NmJlZTI2Y2MwZjJjIFwKICAgICAgICAgICAgICAgICAgICAg
ZmlsZTovL0xJQ0VOQ0UudWVhZ2xlLWF0bTQtZmlybXdhcmU7bWQ1PTRlZDdlYTZiNTA3Y2NjNTgz
YjlkNTk0NDE3NzE0MTE4IFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOQ0Uudmlh
X3Z0NjY1NjttZDU9ZTQxNTk2OTRjYmE0MmQ0Mzc3YTkxMmU3OGE2ZTg1MGYgXApAQCAtMTUyLDcg
Kzc5NSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOQ0UuQWJpbGlzO21kNT1i
NWVlM2Y0MTA3ODBlNTY3MTFhZDQ4ZWFkYzIyYjhiYyBcCiAgICAgICAgICAgICAgICAgICAgIGZp
bGU6Ly9MSUNFTkNFLnhjNDAwMDttZDU9MGZmNTFkMmRjNDlmY2UwNDgxNGM5MTU1MDgxMDkyZjAg
XAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5DRS54YzUwMDA7bWQ1PTFlMTcwYzEz
MTc1MzIzYzMyYzdmNGQwOTk4ZDUzZjY2IFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJ
Q0VOQ0UueGM1MDAwYzttZDU9MTJiMDJlZmEzMDQ5ZGI2NWQ1MjRhZWI0MThkZDg3Y2EgXAotICAg
ICAgICAgICAgICAgICAgICBmaWxlOi8vV0hFTkNFO21kNT0ke1dIRU5DRV9DSEtTVU19IFwKKyAg
ICAgICAgICAgICAgICAgICAgZmlsZTovL1dIRU5DRTttZDU9NjBiNWFiY2M5ODZkMTY2MDYzN2U5
MTNhODdlMTQxM2MgXAogICAgICAgICAgICAgICAgICAgICAiCiAjIFdIRU5DRSBjaGVja3N1bSBp
cyBkZWZpbmVkIHNlcGFyYXRlbHkgdG8gZWFzZSBvdmVycmlkaW5nIGl0IGlmCiAjIGNsYXNzLWRl
dnVwc3RyZWFtIGlzIHNlbGVjdGVkLgpAQCAtMjQ0LDcgKzg4Nyw3IEBAIFNSQ19VUkk6Y2xhc3Mt
ZGV2dXBzdHJlYW0gPSAiZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L2Zpcm13CiAjIFBpbiB0aGlzIHRvIHRoZSAyMDIyMDUwOSByZWxlYXNlLCBvdmVycmlkZSB0
aGlzIGluIGxvY2FsLmNvbmYKIFNSQ1JFVjpjbGFzcy1kZXZ1cHN0cmVhbSA/PSAiYjE5Y2JkY2E3
OGFiMmFkZmQyMTBjOTFiZTE1YTIyNTY4ZThiOGNhZSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjlmMDVlZGI5OTY2ODEzNWQzN2NlZGM0ZmRkMThhYWMyODAyZGM5ZTQ1NjZlMDg2ZTZjNmMyZTMy
MWYzZWNjNGUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNThmMWExNGI4MDBlM2QxOTY3OTg2MTk3
ZDgzYzgxZjFhZDE0Yjc4OThhNTU3MTMzYzU4ZGYwYzAyYzUzODA4MiIKIAogaW5oZXJpdCBhbGxh
cmNoCiAKLS0gCjIuNDQuMAoK

--===============7298731789381323888==--

