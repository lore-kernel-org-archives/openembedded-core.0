Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AF2FC87FC4
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:56:02 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.12500.1752594953342874318
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:55:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=dyLaNUBB;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=NcgF0v+l;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101980eccb287-f9697e2e-19f1-406c-a8c7-68c278635258-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1752594953;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+bo1Ii2RshM9wCIE3AaOMLCeSr8Q2YP4/FUINz8in6U=;
	b=dyLaNUBB9SQHDw3z3NpB0NG/iitEgtSdyUYX/DbV94Cau6FZ1NpKLz5OneuhDDT8
	V9LIM4jdqVUaSrWdLvnz0rkYzOZDPUUshB+IKMZl0016f91YgpJnPz4EsX+VOXP1z4m
	L3SnzytMB6NOKaJmyiPzKKr0suutYvNcS1K87Vgo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1752594953;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+bo1Ii2RshM9wCIE3AaOMLCeSr8Q2YP4/FUINz8in6U=;
	b=NcgF0v+ljNYUT5QPL/68sgIEsbZr2lXvlGETHVdeL+w2qmdYH3Suyzy9xVyPQyjw
	1pkZyTjefQJ9eL5k7Hh2Fjnzx208z146zrKP1hYKfub06rb5zJhqsgN6M8STluga7mH
	OBxlzLrV5Mxcx+/9fITl/BYqkvrfBYG7Mwgv1ECY=
Content-Type: multipart/mixed; boundary="===============6014278765439474060=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] linux-firmware: upgrading to 20250708 SUCCEEDED
Message-ID: <010101980eccb287-f9697e2e-19f1-406c-a8c7-68c278635258-000000@us-west-2.amazonses.com>
Date: Tue, 15 Jul 2025 15:55:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:56:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220387

--===============6014278765439474060==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *linux-firmware* to *20250708* has Succeeded.

Next steps:
    - apply the patch: git am 0001-linux-firmware-upgrade-20250627-20250708.patch
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
From 72d31baa866ceadd8ba7bc2c6ed53b1203236268 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Jul 2025 14:29:18 +0000
Subject: [PATCH] linux-firmware: upgrade 20250627 -> 20250708

---
 ...20250627.bb => linux-firmware_20250708.bb} | 216 +++++++++++++++++-
 1 file changed, 214 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20250627.bb => linux-firmware_20250708.bb} (94%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250627.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250708.bb
similarity index 94%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20250627.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20250708.bb
index 4bdb36ea67..20fa8c73d5 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250627.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250708.bb
@@ -1,3 +1,215 @@
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
+# @@ -2525,6 +2525,13 @@
+#  File: amdgpu/gc_11_5_2_mes_2.bin
+#  File: amdgpu/gc_11_5_2_pfp.bin
+#  File: amdgpu/gc_11_5_2_rlc.bin
+# +File: amdgpu/gc_11_5_3_imu.bin
+# +File: amdgpu/gc_11_5_3_me.bin
+# +File: amdgpu/gc_11_5_3_mec.bin
+# +File: amdgpu/gc_11_5_3_mes1.bin
+# +File: amdgpu/gc_11_5_3_mes_2.bin
+# +File: amdgpu/gc_11_5_3_pfp.bin
+# +File: amdgpu/gc_11_5_3_rlc.bin
+#  File: amdgpu/gc_12_0_0_imu.bin
+#  File: amdgpu/gc_12_0_0_me.bin
+#  File: amdgpu/gc_12_0_0_mec.bin
+# @@ -2550,6 +2557,7 @@
+#  File: amdgpu/dcn_3_2_1_dmcub.bin
+#  File: amdgpu/dcn_3_5_dmcub.bin
+#  File: amdgpu/dcn_3_5_1_dmcub.bin
+# +File: amdgpu/dcn_3_6_dmcub.bin
+#  File: amdgpu/dcn_4_0_1_dmcub.bin
+#  File: amdgpu/psp_13_0_0_sos.bin
+#  File: amdgpu/psp_13_0_0_sos_kicker.bin
+# @@ -2585,6 +2593,8 @@
+#  File: amdgpu/psp_14_0_3_ta.bin
+#  File: amdgpu/psp_14_0_4_ta.bin
+#  File: amdgpu/psp_14_0_4_toc.bin
+# +File: amdgpu/psp_14_0_5_ta.bin
+# +File: amdgpu/psp_14_0_5_toc.bin
+#  File: amdgpu/sdma_4_4_2.bin
+#  File: amdgpu/sdma_4_4_4.bin
+#  File: amdgpu/sdma_4_4_5.bin
+# @@ -2597,6 +2607,7 @@
+#  File: amdgpu/sdma_6_1_0.bin
+#  File: amdgpu/sdma_6_1_1.bin
+#  File: amdgpu/sdma_6_1_2.bin
+# +File: amdgpu/sdma_6_1_3.bin
+#  File: amdgpu/sdma_7_0_0.bin
+#  File: amdgpu/sdma_7_0_1.bin
+#  File: amdgpu/smu_13_0_0.bin
+# @@ -3324,6 +3335,7 @@
+#  File: rtw89/rtw8922a_fw-1.bin
+#  File: rtw89/rtw8922a_fw-2.bin
+#  File: rtw89/rtw8922a_fw-3.bin
+# +File: rtw89/rtw8922a_fw-4.bin
+#  
+#  Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
+#  
+# @@ -4007,7 +4019,7 @@
+#  File: intel/ibt-18-16-1.ddc
+#  File: intel/ibt-18-2.sfi
+#  File: intel/ibt-18-2.ddc
+# -Version: BT_Pulsar_REL20451_22.20.2433.20451
+# +Version: BT_Pulsar_REL20425_22.20.2412.20425
+#  
+#  File: intel/ibt-17-0-1.sfi
+#  Version: BT_JeffersonPeak_A0_B0_REL0201
+# @@ -4282,7 +4294,7 @@
+#  RawFile: amd-ucode/microcode_amd_fam17h.bin
+#  Version: 2024-11-21
+#  RawFile: amd-ucode/microcode_amd_fam19h.bin
+# -Version: 2024-11-21
+# +Version: 2025-07-08
+#  File: amd-ucode/README
+#  
+#  License: Redistributable. See LICENSE.amd-ucode for details
+# @@ -5257,6 +5269,15 @@
+#  
+#  File: xe/bmg_huc.bin
+#  Version: HuC API/APB ver 8.2.10 for Battlemage
+# +
+# +File: xe/fan_control_8086_e20b_8086_1100.bin
+# +Version: fan_control ver 203.0.0.0 for Battlemage
+# +
+# +File: xe/ptl_guc_70.bin
+# +Version: GuC API/APB ver 70.47.0 for Pantherlake
+# +
+# +File: xe/ptl_huc.bin
+# +Version: HuC API/APB ver 10.3.3 for Pantherlake
+#  
+#  License: Redistributable. See LICENSE.xe for details
+#  --------------------------------------------------------------------------
+# @@ -6024,9 +6045,9 @@
+#  Driver: mt7921 - MediaTek MT7921 Wireless MACs
+#  
+#  File: mediatek/WIFI_MT7961_patch_mcu_1_2_hdr.bin
+# -Version: 20250523110946a
+# +Version: 20250625153620a
+#  File: mediatek/WIFI_RAM_CODE_MT7961_1.bin
+# -Version: 20250523110807
+# +Version: 20250625153044
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -6035,7 +6056,7 @@
+#  Driver: mt7921 - MediaTek MT7921 bluetooth chipset
+#  
+#  File: mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin
+# -Version: 20250523111333
+# +Version: 20250625154126
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -6354,6 +6375,8 @@
+#  
+#  Driver: adreno - Qualcomm Adreno GPU firmware
+#  
+# +File: qcom/leia_pfp_470.fw
+# +File: qcom/leia_pm4_470.fw
+#  File: qcom/a225_pfp.fw
+#  File: qcom/a225_pm4.fw
+#  File: qcom/a300_pfp.fw
+# @@ -6365,36 +6388,53 @@
+#  File: qcom/a420_pfp.fw
+#  File: qcom/a420_pm4.fw
+#  File: qcom/a530_pfp.fw
+# +Version: 1.87.01
+#  File: qcom/a530_pm4.fw
+#  File: qcom/a530v3_gpmu.fw2
+#  File: qcom/apq8096/a530_zap.mbn
+#  Link: qcom/a530_zap.mdt -> apq8096/a530_zap.mbn
+# +File: qcom/qrb4210/a610_zap.mbn
+# +File: qcom/qcs615/a612_zap.mbn
+# +File: qcom/a623_gmu.bin
+# +Version: v3.06.00
+# +File: qcom/qcs8300/a623_zap.mbn
+# +Version: v0.12
+#  File: qcom/a630_gmu.bin
+#  File: qcom/a630_sqe.fw
+# +Version: v2.07
+#  File: qcom/sdm845/a630_zap.mbn
+#  File: qcom/a650_gmu.bin
+#  File: qcom/a650_sqe.fw
+# +Version: v1.12
+#  File: qcom/sm8250/a650_zap.mbn
+#  File: qcom/a660_gmu.bin
+# +Version: v3.01.0B
+#  File: qcom/a660_sqe.fw
+# +Version: v1.12
+#  File: qcom/qcm6490/a660_zap.mbn
+# +Version: v0.09
+#  Link: qcom/qcs6490/a660_zap.mbn -> ../qcm6490/a660_zap.mbn
+#  Link: qcom/sm8350/a660_zap.mbn -> ../qcm6490/a660_zap.mbn
+# +File: qcom/a663_gmu.bin
+# +Version: v3.05.01
+# +File: qcom/sa8775p/a663_zap.mbn
+# +Version: v0.09
+# +File: qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn
+#  File: qcom/a702_sqe.fw
+# -File: qcom/leia_pfp_470.fw
+# -File: qcom/leia_pm4_470.fw
+# -File: qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn
+# +Version: v0.47
+# +File: qcom/qcm2290/a702_zap.mbn
+#  File: qcom/gen70500_gmu.bin
+# +Version: v4.03.11
+#  File: qcom/gen70500_sqe.fw
+# +Version: v1.62
+#  File: qcom/x1e80100/gen70500_zap.mbn
+# -File: qcom/a663_gmu.bin
+# -File: qcom/sa8775p/a663_zap.mbn
+# -File: qcom/qcs615/a612_zap.mbn
+# -File: qcom/a623_gmu.bin
+# -File: qcom/qcs8300/a623_zap.mbn
+# +Version: v0.15
+#  File: qcom/gen71500_gmu.bin
+# +Version: v4.06.04
+#  File: qcom/gen71500_sqe.fw
+# +Version: v1.81
+#  File: qcom/x1p42100/gen71500_zap.mbn
+# +Version: v0.13
+#  
+#  Licence: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
+#  
+# @@ -6433,7 +6473,6 @@
+#  File: qcom/apq8096/modem.mbn
+#  Version: MPSS.TH.2.0.1-00481
+#  RawFile: qcom/apq8096/modemr.jsn
+# -File: qcom/qcm2290/a702_zap.mbn
+#  File: qcom/qcm2290/adsp.mbn
+#  Version: ADSP.VT.5.4.1.c4-00013-KAMORTA-1
+#  RawFile: qcom/qcm2290/adspr.jsn
+# @@ -6460,7 +6499,6 @@
+#  Link: qcom/qcs6490/battmgr.jsn -> ../qcm6490/battmgr.jsn
+#  Link: qcom/qcs6490/cdsp.mbn -> ../qcm6490/cdsp.mbn
+#  Link: qcom/qcs6490/cdspr.jsn -> ../qcm6490/cdspr.jsn
+# -File: qcom/qrb4210/a610_zap.mbn
+#  File: qcom/qrb4210/adsp.mbn
+#  Version: ADSP.VT.5.4.1.c4-00013-KAMORTA-1
+#  RawFile: qcom/qrb4210/adspr.jsn
+# @@ -8512,3 +8550,9 @@
+#  File: qcom/qcs8300/qupv3fw.elf
+#  
+#  License: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
+# +---------------------------------------------------------------------------
+# +
+# +Driver: sdx61 - Qualcomm SDX61 firmware image file for Foxconn vendor
+# +File: qcom/sdx61/foxconn/prog_firehose_lite.elf
+# +
+# +License: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
+# 
+#
+
 SUMMARY = "Firmware files for use with Linux kernel"
 HOMEPAGE = "https://www.kernel.org/"
 DESCRIPTION = "Linux firmware is a package distributed alongside the Linux kernel \
@@ -208,7 +420,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
                     file://LICENSE.xe;md5=c674d38774242bc0c528214721488118 \
                     file://wfx/LICENCE.wf200;md5=4d1beff00d902c05c9c7e95a5d8eb52d \
-                    file://WHENCE;md5=${WHENCE_CHKSUM} \
+                    file://WHENCE;md5=ac8541e9e1a952358f245afd478ce317 \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
@@ -328,7 +540,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "edefb1d2a538367abf9558802fee3cd135ebb19a4a5890c8eefb3416a92a6b89"
+SRC_URI[sha256sum] = "6f3efee7f600c201f9b2d675889a4ccdb8cfe56e0d283641796ed10e64c72047"
 
 inherit allarch
 
-- 
2.47.1


--===============6014278765439474060==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/linux-firmware: SRC_URI changed from "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20250627.tar.xz" to "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20250708.tar.xz"
packages/all-poky-linux/linux-firmware: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-aldebaran: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-aldebaran: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-carrizo: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-carrizo: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-cezanne: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-cezanne: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-fiji: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-fiji: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-hawaii: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-hawaii: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-misc: PKGSIZE changed from 59921268 to 62264916 (+4%)
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-misc: FILELIST: added "/usr/lib/firmware/amdgpu/gc_11_5_3_mes1.bin /usr/lib/firmware/amdgpu/gc_11_5_3_pfp.bin /usr/lib/firmware/amdgpu/gc_11_5_3_imu.bin /usr/lib/firmware/amdgpu/gc_11_5_3_rlc.bin /usr/lib/firmware/amdgpu/dcn_3_6_dmcub.bin /usr/lib/firmware/amdgpu/psp_14_0_5_toc.bin /usr/lib/firmware/amdgpu/sdma_6_1_3.bin /usr/lib/firmware/amdgpu/gc_11_5_3_me.bin /usr/lib/firmware/amdgpu/psp_14_0_5_ta.bin /usr/lib/firmware/amdgpu/gc_11_5_3_mec.bin /usr/lib/firmware/amdgpu/gc_11_5_3_mes_2.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-misc: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-misc: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi10: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi10: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi14: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi14: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi21: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi21: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi22: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi22: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi23: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi23: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi24: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi24: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi31: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi31: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi32: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi32: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-oland: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-oland: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-polaris10: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-polaris10: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-polaris11: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-polaris11: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-polaris12: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-polaris12: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-raven: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-raven: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-rembrandt: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-rembrandt: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-renoir: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-renoir: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-stoney: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-stoney: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-tonga: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-tonga: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-topaz: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-topaz: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-vega10: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-vega10: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-vega12: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-vega12: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ar5523: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar5523: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-misc: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-misc: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca4019: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca4019: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca6174: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca6174: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca9377: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca9377: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca9887: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca9887: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca9888: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca9888: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca988x: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca988x: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca9984: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca9984: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca99x0: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca99x0: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-wcn3990: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-wcn3990: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-ipq5018: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-ipq5018: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-ipq6018: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-ipq6018: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-ipq8074: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-ipq8074: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-misc: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-misc: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qca2066: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qca2066: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qca6390: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qca6390: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qca6698aq: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qca6698aq: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qcn9074: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qcn9074: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-wcn6750: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-wcn6750: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-wcn6855: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-wcn6855: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k-misc: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k-misc: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k-qcn9274: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k-qcn9274: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k-wcn7850: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k-wcn7850: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2x: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2x: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-cc33xx: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cc33xx: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-cnm-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cnm-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-cnm: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cnm: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PKGSIZE changed from 2601550 to 2601478 (-0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-18: PKGSIZE changed from 2601622 to 2601478 (-0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-18: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-18: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9260: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9260: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-linaro-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-linaro-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-mali-csffw-arch108: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mali-csffw-arch108: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-mali-csffw-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mali-csffw-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek: PKGSIZE changed from 52282843 to 52283675 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-mellanox: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mellanox: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-microchip-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-microchip-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-microchip: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-microchip: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-moxa-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-moxa-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-moxa: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-moxa: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7650: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7650: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x2: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x2: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8987-sdio: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8987-sdio: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-common: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-common: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-pcie: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-pcie: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-sdio: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-sdio: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-common: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-common: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-pcie: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-pcie: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-sdio: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-sdio: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw416-sdio: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw416-sdio: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw612-sdio: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw612-sdio: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-olpc-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-olpc-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-olpc: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-olpc: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-powervr-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-powervr-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-powervr: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-powervr: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-prestera: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-prestera: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-misc: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-misc: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca2066: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca2066: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca61x4-serial: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca61x4-serial: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca61x4-usb: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca61x4-usb: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca6390: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca6390: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca6698: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca6698: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn3950: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn3950: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn3988: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn3988: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn399x: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn399x: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn6750: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn6750: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn7850: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn7850: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-2-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-2-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a623: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a623: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a663: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a663: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a702: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a702: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-g715: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-g715: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-g750: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-g750: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-aic100: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-aic100: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-modem: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-modem: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-wifi: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-wifi: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-adreno: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-adreno: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-adreno: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-adreno: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-audio: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-audio: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-modem: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-modem: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-wifi: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-wifi: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-adreno: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-adreno: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-audio: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-audio: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-compute: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-compute: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-ipa: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-ipa: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-qupv3fw: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-qupv3fw: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-wifi: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-wifi: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcs615-adreno: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcs615-adreno: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcs8300-adreno: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcs8300-adreno: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcs8300-audio: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcs8300-audio: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcs8300-compute: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcs8300-compute: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcs8300-generalpurpose: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcs8300-generalpurpose: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcs8300-qupv3fw: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcs8300-qupv3fw: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qdu100: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qdu100: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-adreno: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-adreno: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-audio: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-audio: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-compute: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-compute: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-modem: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-modem: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-wifi: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-wifi: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sa8775p-adreno: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sa8775p-adreno: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sa8775p-audio: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sa8775p-audio: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sa8775p-compute: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sa8775p-compute: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sa8775p-generalpurpose: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sa8775p-generalpurpose: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sa8775p-qupv3fw: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sa8775p-qupv3fw: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-vpu: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-vpu: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-adreno: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-adreno: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-thundercomm-db845c-sensors: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-thundercomm-db845c-sensors: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-adreno: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-adreno: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-thundercomm-rb5-sensors: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-thundercomm-rb5-sensors: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8550-audio-tplg: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8550-audio-tplg: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8650-audio-tplg: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8650-audio-tplg: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-6.0: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-6.0: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-adreno: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-adreno: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-audio: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-audio: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-t14s-g6-adreno: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-t14s-g6-adreno: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-t14s-g6-audio: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-t14s-g6-audio: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-t14s-g6-compute: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-t14s-g6-compute: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-t14s-g6-vpu: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-t14s-g6-vpu: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-yoga-slim7x-adreno: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-yoga-slim7x-adreno: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-yoga-slim7x-audio: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-yoga-slim7x-audio: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-yoga-slim7x-compute: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-yoga-slim7x-compute: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-yoga-slim7x-vpu: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-yoga-slim7x-vpu: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1p42100-adreno: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1p42100-adreno: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-yamato-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-yamato-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qed: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qed: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-dptx: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-dptx: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-nic: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-nic: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8761: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8761: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8822: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8822: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-src: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-src: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-wfx-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wfx-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-wfx: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wfx: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGSIZE changed from 332425 to 333579 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c-license: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c-license: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c: PV changed from "20250627" to "20250708"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGSIZE changed from 105708088 to 108626998 (+3%)
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: added "/usr/lib/firmware/qcom/sdx61/foxconn/prog_firehose_lite.elf /usr/lib/firmware/xe/ptl_huc.bin /usr/lib/firmware/rtw89/rtw8922a_fw-4.bin /usr/lib/firmware/xe/ptl_guc_70.bin /usr/lib/firmware/xe/fan_control_8086_e20b_8086_1100.bin"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGV changed from 20250627 [default] to 20250708 [default]
packages/all-poky-linux/linux-firmware/linux-firmware: PV changed from "20250627" to "20250708"

--===============6014278765439474060==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-linux-firmware-upgrade-20250627-20250708.patch"

RnJvbSA3MmQzMWJhYTg2NmNlYWRkOGJhN2JjMmM2ZWQ1M2IxMjAzMjM2MjY4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgSnVsIDIwMjUgMTQ6Mjk6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aW51eC1maXJtd2FyZTogdXBncmFkZSAyMDI1MDYyNyAtPiAyMDI1MDcwOAoKLS0tCiAuLi4yMDI1
MDYyNy5iYiA9PiBsaW51eC1maXJtd2FyZV8yMDI1MDcwOC5iYn0gfCAyMTYgKysrKysrKysrKysr
KysrKystCiAxIGZpbGUgY2hhbmdlZCwgMjE0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS97bGludXgtZmlybXdh
cmVfMjAyNTA2MjcuYmIgPT4gbGludXgtZmlybXdhcmVfMjAyNTA3MDguYmJ9ICg5NCUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2Fy
ZV8yMDI1MDYyNy5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgt
ZmlybXdhcmVfMjAyNTA3MDguYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZV8yMDI1MDYyNy5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJt
d2FyZV8yMDI1MDcwOC5iYgppbmRleCA0YmRiMzZlYTY3Li4yMGZhOGM3M2Q1IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlXzIwMjUw
NjI3LmJiCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgtZmly
bXdhcmVfMjAyNTA3MDguYmIKQEAgLTEsMyArMSwyMTUgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklM
RVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4K
KyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRo
ZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlm
IG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3Nh
Z2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0
ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0t
LSBXSEVOQ0UKKyMgKysrIFdIRU5DRQorIyBAQCAtMjUyNSw2ICsyNTI1LDEzIEBACisjICBGaWxl
OiBhbWRncHUvZ2NfMTFfNV8yX21lc18yLmJpbgorIyAgRmlsZTogYW1kZ3B1L2djXzExXzVfMl9w
ZnAuYmluCisjICBGaWxlOiBhbWRncHUvZ2NfMTFfNV8yX3JsYy5iaW4KKyMgK0ZpbGU6IGFtZGdw
dS9nY18xMV81XzNfaW11LmJpbgorIyArRmlsZTogYW1kZ3B1L2djXzExXzVfM19tZS5iaW4KKyMg
K0ZpbGU6IGFtZGdwdS9nY18xMV81XzNfbWVjLmJpbgorIyArRmlsZTogYW1kZ3B1L2djXzExXzVf
M19tZXMxLmJpbgorIyArRmlsZTogYW1kZ3B1L2djXzExXzVfM19tZXNfMi5iaW4KKyMgK0ZpbGU6
IGFtZGdwdS9nY18xMV81XzNfcGZwLmJpbgorIyArRmlsZTogYW1kZ3B1L2djXzExXzVfM19ybGMu
YmluCisjICBGaWxlOiBhbWRncHUvZ2NfMTJfMF8wX2ltdS5iaW4KKyMgIEZpbGU6IGFtZGdwdS9n
Y18xMl8wXzBfbWUuYmluCisjICBGaWxlOiBhbWRncHUvZ2NfMTJfMF8wX21lYy5iaW4KKyMgQEAg
LTI1NTAsNiArMjU1Nyw3IEBACisjICBGaWxlOiBhbWRncHUvZGNuXzNfMl8xX2RtY3ViLmJpbgor
IyAgRmlsZTogYW1kZ3B1L2Rjbl8zXzVfZG1jdWIuYmluCisjICBGaWxlOiBhbWRncHUvZGNuXzNf
NV8xX2RtY3ViLmJpbgorIyArRmlsZTogYW1kZ3B1L2Rjbl8zXzZfZG1jdWIuYmluCisjICBGaWxl
OiBhbWRncHUvZGNuXzRfMF8xX2RtY3ViLmJpbgorIyAgRmlsZTogYW1kZ3B1L3BzcF8xM18wXzBf
c29zLmJpbgorIyAgRmlsZTogYW1kZ3B1L3BzcF8xM18wXzBfc29zX2tpY2tlci5iaW4KKyMgQEAg
LTI1ODUsNiArMjU5Myw4IEBACisjICBGaWxlOiBhbWRncHUvcHNwXzE0XzBfM190YS5iaW4KKyMg
IEZpbGU6IGFtZGdwdS9wc3BfMTRfMF80X3RhLmJpbgorIyAgRmlsZTogYW1kZ3B1L3BzcF8xNF8w
XzRfdG9jLmJpbgorIyArRmlsZTogYW1kZ3B1L3BzcF8xNF8wXzVfdGEuYmluCisjICtGaWxlOiBh
bWRncHUvcHNwXzE0XzBfNV90b2MuYmluCisjICBGaWxlOiBhbWRncHUvc2RtYV80XzRfMi5iaW4K
KyMgIEZpbGU6IGFtZGdwdS9zZG1hXzRfNF80LmJpbgorIyAgRmlsZTogYW1kZ3B1L3NkbWFfNF80
XzUuYmluCisjIEBAIC0yNTk3LDYgKzI2MDcsNyBAQAorIyAgRmlsZTogYW1kZ3B1L3NkbWFfNl8x
XzAuYmluCisjICBGaWxlOiBhbWRncHUvc2RtYV82XzFfMS5iaW4KKyMgIEZpbGU6IGFtZGdwdS9z
ZG1hXzZfMV8yLmJpbgorIyArRmlsZTogYW1kZ3B1L3NkbWFfNl8xXzMuYmluCisjICBGaWxlOiBh
bWRncHUvc2RtYV83XzBfMC5iaW4KKyMgIEZpbGU6IGFtZGdwdS9zZG1hXzdfMF8xLmJpbgorIyAg
RmlsZTogYW1kZ3B1L3NtdV8xM18wXzAuYmluCisjIEBAIC0zMzI0LDYgKzMzMzUsNyBAQAorIyAg
RmlsZTogcnR3ODkvcnR3ODkyMmFfZnctMS5iaW4KKyMgIEZpbGU6IHJ0dzg5L3J0dzg5MjJhX2Z3
LTIuYmluCisjICBGaWxlOiBydHc4OS9ydHc4OTIyYV9mdy0zLmJpbgorIyArRmlsZTogcnR3ODkv
cnR3ODkyMmFfZnctNC5iaW4KKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUg
TElDRU5DRS5ydGx3aWZpX2Zpcm13YXJlLnR4dCBmb3IgZGV0YWlscy4KKyMgIAorIyBAQCAtNDAw
Nyw3ICs0MDE5LDcgQEAKKyMgIEZpbGU6IGludGVsL2lidC0xOC0xNi0xLmRkYworIyAgRmlsZTog
aW50ZWwvaWJ0LTE4LTIuc2ZpCisjICBGaWxlOiBpbnRlbC9pYnQtMTgtMi5kZGMKKyMgLVZlcnNp
b246IEJUX1B1bHNhcl9SRUwyMDQ1MV8yMi4yMC4yNDMzLjIwNDUxCisjICtWZXJzaW9uOiBCVF9Q
dWxzYXJfUkVMMjA0MjVfMjIuMjAuMjQxMi4yMDQyNQorIyAgCisjICBGaWxlOiBpbnRlbC9pYnQt
MTctMC0xLnNmaQorIyAgVmVyc2lvbjogQlRfSmVmZmVyc29uUGVha19BMF9CMF9SRUwwMjAxCisj
IEBAIC00MjgyLDcgKzQyOTQsNyBAQAorIyAgUmF3RmlsZTogYW1kLXVjb2RlL21pY3JvY29kZV9h
bWRfZmFtMTdoLmJpbgorIyAgVmVyc2lvbjogMjAyNC0xMS0yMQorIyAgUmF3RmlsZTogYW1kLXVj
b2RlL21pY3JvY29kZV9hbWRfZmFtMTloLmJpbgorIyAtVmVyc2lvbjogMjAyNC0xMS0yMQorIyAr
VmVyc2lvbjogMjAyNS0wNy0wOAorIyAgRmlsZTogYW1kLXVjb2RlL1JFQURNRQorIyAgCisjICBM
aWNlbnNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLmFtZC11Y29kZSBmb3IgZGV0YWls
cworIyBAQCAtNTI1Nyw2ICs1MjY5LDE1IEBACisjICAKKyMgIEZpbGU6IHhlL2JtZ19odWMuYmlu
CisjICBWZXJzaW9uOiBIdUMgQVBJL0FQQiB2ZXIgOC4yLjEwIGZvciBCYXR0bGVtYWdlCisjICsK
KyMgK0ZpbGU6IHhlL2Zhbl9jb250cm9sXzgwODZfZTIwYl84MDg2XzExMDAuYmluCisjICtWZXJz
aW9uOiBmYW5fY29udHJvbCB2ZXIgMjAzLjAuMC4wIGZvciBCYXR0bGVtYWdlCisjICsKKyMgK0Zp
bGU6IHhlL3B0bF9ndWNfNzAuYmluCisjICtWZXJzaW9uOiBHdUMgQVBJL0FQQiB2ZXIgNzAuNDcu
MCBmb3IgUGFudGhlcmxha2UKKyMgKworIyArRmlsZTogeGUvcHRsX2h1Yy5iaW4KKyMgK1ZlcnNp
b246IEh1QyBBUEkvQVBCIHZlciAxMC4zLjMgZm9yIFBhbnRoZXJsYWtlCisjICAKKyMgIExpY2Vu
c2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UueGUgZm9yIGRldGFpbHMKKyMgIC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCisjIEBAIC02MDI0LDkgKzYwNDUsOSBAQAorIyAgRHJpdmVyOiBtdDc5MjEg
LSBNZWRpYVRlayBNVDc5MjEgV2lyZWxlc3MgTUFDcworIyAgCisjICBGaWxlOiBtZWRpYXRlay9X
SUZJX01UNzk2MV9wYXRjaF9tY3VfMV8yX2hkci5iaW4KKyMgLVZlcnNpb246IDIwMjUwNTIzMTEw
OTQ2YQorIyArVmVyc2lvbjogMjAyNTA2MjUxNTM2MjBhCisjICBGaWxlOiBtZWRpYXRlay9XSUZJ
X1JBTV9DT0RFX01UNzk2MV8xLmJpbgorIyAtVmVyc2lvbjogMjAyNTA1MjMxMTA4MDcKKyMgK1Zl
cnNpb246IDIwMjUwNjI1MTUzMDQ0CisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4g
U2VlIExJQ0VOQ0UubWVkaWF0ZWsgZm9yIGRldGFpbHMuCisjICAKKyMgQEAgLTYwMzUsNyArNjA1
Niw3IEBACisjICBEcml2ZXI6IG10NzkyMSAtIE1lZGlhVGVrIE1UNzkyMSBibHVldG9vdGggY2hp
cHNldAorIyAgCisjICBGaWxlOiBtZWRpYXRlay9CVF9SQU1fQ09ERV9NVDc5NjFfMV8yX2hkci5i
aW4KKyMgLVZlcnNpb246IDIwMjUwNTIzMTExMzMzCisjICtWZXJzaW9uOiAyMDI1MDYyNTE1NDEy
NgorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLm1lZGlhdGVr
IGZvciBkZXRhaWxzLgorIyAgCisjIEBAIC02MzU0LDYgKzYzNzUsOCBAQAorIyAgCisjICBEcml2
ZXI6IGFkcmVubyAtIFF1YWxjb21tIEFkcmVubyBHUFUgZmlybXdhcmUKKyMgIAorIyArRmlsZTog
cWNvbS9sZWlhX3BmcF80NzAuZncKKyMgK0ZpbGU6IHFjb20vbGVpYV9wbTRfNDcwLmZ3CisjICBG
aWxlOiBxY29tL2EyMjVfcGZwLmZ3CisjICBGaWxlOiBxY29tL2EyMjVfcG00LmZ3CisjICBGaWxl
OiBxY29tL2EzMDBfcGZwLmZ3CisjIEBAIC02MzY1LDM2ICs2Mzg4LDUzIEBACisjICBGaWxlOiBx
Y29tL2E0MjBfcGZwLmZ3CisjICBGaWxlOiBxY29tL2E0MjBfcG00LmZ3CisjICBGaWxlOiBxY29t
L2E1MzBfcGZwLmZ3CisjICtWZXJzaW9uOiAxLjg3LjAxCisjICBGaWxlOiBxY29tL2E1MzBfcG00
LmZ3CisjICBGaWxlOiBxY29tL2E1MzB2M19ncG11LmZ3MgorIyAgRmlsZTogcWNvbS9hcHE4MDk2
L2E1MzBfemFwLm1ibgorIyAgTGluazogcWNvbS9hNTMwX3phcC5tZHQgLT4gYXBxODA5Ni9hNTMw
X3phcC5tYm4KKyMgK0ZpbGU6IHFjb20vcXJiNDIxMC9hNjEwX3phcC5tYm4KKyMgK0ZpbGU6IHFj
b20vcWNzNjE1L2E2MTJfemFwLm1ibgorIyArRmlsZTogcWNvbS9hNjIzX2dtdS5iaW4KKyMgK1Zl
cnNpb246IHYzLjA2LjAwCisjICtGaWxlOiBxY29tL3FjczgzMDAvYTYyM196YXAubWJuCisjICtW
ZXJzaW9uOiB2MC4xMgorIyAgRmlsZTogcWNvbS9hNjMwX2dtdS5iaW4KKyMgIEZpbGU6IHFjb20v
YTYzMF9zcWUuZncKKyMgK1ZlcnNpb246IHYyLjA3CisjICBGaWxlOiBxY29tL3NkbTg0NS9hNjMw
X3phcC5tYm4KKyMgIEZpbGU6IHFjb20vYTY1MF9nbXUuYmluCisjICBGaWxlOiBxY29tL2E2NTBf
c3FlLmZ3CisjICtWZXJzaW9uOiB2MS4xMgorIyAgRmlsZTogcWNvbS9zbTgyNTAvYTY1MF96YXAu
bWJuCisjICBGaWxlOiBxY29tL2E2NjBfZ211LmJpbgorIyArVmVyc2lvbjogdjMuMDEuMEIKKyMg
IEZpbGU6IHFjb20vYTY2MF9zcWUuZncKKyMgK1ZlcnNpb246IHYxLjEyCisjICBGaWxlOiBxY29t
L3FjbTY0OTAvYTY2MF96YXAubWJuCisjICtWZXJzaW9uOiB2MC4wOQorIyAgTGluazogcWNvbS9x
Y3M2NDkwL2E2NjBfemFwLm1ibiAtPiAuLi9xY202NDkwL2E2NjBfemFwLm1ibgorIyAgTGluazog
cWNvbS9zbTgzNTAvYTY2MF96YXAubWJuIC0+IC4uL3FjbTY0OTAvYTY2MF96YXAubWJuCisjICtG
aWxlOiBxY29tL2E2NjNfZ211LmJpbgorIyArVmVyc2lvbjogdjMuMDUuMDEKKyMgK0ZpbGU6IHFj
b20vc2E4Nzc1cC9hNjYzX3phcC5tYm4KKyMgK1ZlcnNpb246IHYwLjA5CisjICtGaWxlOiBxY29t
L3NjODI4MHhwL0xFTk9WTy8yMUJYL3FjZHhrbXN1YzgyODAubWJuCisjICBGaWxlOiBxY29tL2E3
MDJfc3FlLmZ3CisjIC1GaWxlOiBxY29tL2xlaWFfcGZwXzQ3MC5mdworIyAtRmlsZTogcWNvbS9s
ZWlhX3BtNF80NzAuZncKKyMgLUZpbGU6IHFjb20vc2M4MjgweHAvTEVOT1ZPLzIxQlgvcWNkeGtt
c3VjODI4MC5tYm4KKyMgK1ZlcnNpb246IHYwLjQ3CisjICtGaWxlOiBxY29tL3FjbTIyOTAvYTcw
Ml96YXAubWJuCisjICBGaWxlOiBxY29tL2dlbjcwNTAwX2dtdS5iaW4KKyMgK1ZlcnNpb246IHY0
LjAzLjExCisjICBGaWxlOiBxY29tL2dlbjcwNTAwX3NxZS5mdworIyArVmVyc2lvbjogdjEuNjIK
KyMgIEZpbGU6IHFjb20veDFlODAxMDAvZ2VuNzA1MDBfemFwLm1ibgorIyAtRmlsZTogcWNvbS9h
NjYzX2dtdS5iaW4KKyMgLUZpbGU6IHFjb20vc2E4Nzc1cC9hNjYzX3phcC5tYm4KKyMgLUZpbGU6
IHFjb20vcWNzNjE1L2E2MTJfemFwLm1ibgorIyAtRmlsZTogcWNvbS9hNjIzX2dtdS5iaW4KKyMg
LUZpbGU6IHFjb20vcWNzODMwMC9hNjIzX3phcC5tYm4KKyMgK1ZlcnNpb246IHYwLjE1CisjICBG
aWxlOiBxY29tL2dlbjcxNTAwX2dtdS5iaW4KKyMgK1ZlcnNpb246IHY0LjA2LjA0CisjICBGaWxl
OiBxY29tL2dlbjcxNTAwX3NxZS5mdworIyArVmVyc2lvbjogdjEuODEKKyMgIEZpbGU6IHFjb20v
eDFwNDIxMDAvZ2VuNzE1MDBfemFwLm1ibgorIyArVmVyc2lvbjogdjAuMTMKKyMgIAorIyAgTGlj
ZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5xY29tIGFuZCBxY29tL05PVElDRS50
eHQgZm9yIGRldGFpbHMKKyMgIAorIyBAQCAtNjQzMyw3ICs2NDczLDYgQEAKKyMgIEZpbGU6IHFj
b20vYXBxODA5Ni9tb2RlbS5tYm4KKyMgIFZlcnNpb246IE1QU1MuVEguMi4wLjEtMDA0ODEKKyMg
IFJhd0ZpbGU6IHFjb20vYXBxODA5Ni9tb2RlbXIuanNuCisjIC1GaWxlOiBxY29tL3FjbTIyOTAv
YTcwMl96YXAubWJuCisjICBGaWxlOiBxY29tL3FjbTIyOTAvYWRzcC5tYm4KKyMgIFZlcnNpb246
IEFEU1AuVlQuNS40LjEuYzQtMDAwMTMtS0FNT1JUQS0xCisjICBSYXdGaWxlOiBxY29tL3FjbTIy
OTAvYWRzcHIuanNuCisjIEBAIC02NDYwLDcgKzY0OTksNiBAQAorIyAgTGluazogcWNvbS9xY3M2
NDkwL2JhdHRtZ3IuanNuIC0+IC4uL3FjbTY0OTAvYmF0dG1nci5qc24KKyMgIExpbms6IHFjb20v
cWNzNjQ5MC9jZHNwLm1ibiAtPiAuLi9xY202NDkwL2Nkc3AubWJuCisjICBMaW5rOiBxY29tL3Fj
czY0OTAvY2RzcHIuanNuIC0+IC4uL3FjbTY0OTAvY2RzcHIuanNuCisjIC1GaWxlOiBxY29tL3Fy
YjQyMTAvYTYxMF96YXAubWJuCisjICBGaWxlOiBxY29tL3FyYjQyMTAvYWRzcC5tYm4KKyMgIFZl
cnNpb246IEFEU1AuVlQuNS40LjEuYzQtMDAwMTMtS0FNT1JUQS0xCisjICBSYXdGaWxlOiBxY29t
L3FyYjQyMTAvYWRzcHIuanNuCisjIEBAIC04NTEyLDMgKzg1NTAsOSBAQAorIyAgRmlsZTogcWNv
bS9xY3M4MzAwL3F1cHYzZncuZWxmCisjICAKKyMgIExpY2Vuc2U6IFJlZGlzdHJpYnV0YWJsZS4g
U2VlIExJQ0VOU0UucWNvbSBhbmQgcWNvbS9OT1RJQ0UudHh0IGZvciBkZXRhaWxzCisjICstLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KKyMgKworIyArRHJpdmVyOiBzZHg2MSAtIFF1YWxjb21tIFNEWDYxIGZp
cm13YXJlIGltYWdlIGZpbGUgZm9yIEZveGNvbm4gdmVuZG9yCisjICtGaWxlOiBxY29tL3NkeDYx
L2ZveGNvbm4vcHJvZ19maXJlaG9zZV9saXRlLmVsZgorIyArCisjICtMaWNlbnNlOiBSZWRpc3Ry
aWJ1dGFibGUuIFNlZSBMSUNFTlNFLnFjb20gYW5kIHFjb20vTk9USUNFLnR4dCBmb3IgZGV0YWls
cworIyAKKyMKKwogU1VNTUFSWSA9ICJGaXJtd2FyZSBmaWxlcyBmb3IgdXNlIHdpdGggTGludXgg
a2VybmVsIgogSE9NRVBBR0UgPSAiaHR0cHM6Ly93d3cua2VybmVsLm9yZy8iCiBERVNDUklQVElP
TiA9ICJMaW51eCBmaXJtd2FyZSBpcyBhIHBhY2thZ2UgZGlzdHJpYnV0ZWQgYWxvbmdzaWRlIHRo
ZSBMaW51eCBrZXJuZWwgXApAQCAtMjA4LDcgKzQyMCw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0xJQ0VOQ0UuQWJpbGlzO21kNT1iNWVlM2Y0MTA3ODBlNTY3MTFhZDQ4ZWFkYzIyYjhi
YyBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTkNFLnhjNTAwMGM7bWQ1PTEyYjAy
ZWZhMzA0OWRiNjVkNTI0YWViNDE4ZGQ4N2NhIFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTov
L0xJQ0VOU0UueGU7bWQ1PWM2NzRkMzg3NzQyNDJiYzBjNTI4MjE0NzIxNDg4MTE4IFwKICAgICAg
ICAgICAgICAgICAgICAgZmlsZTovL3dmeC9MSUNFTkNFLndmMjAwO21kNT00ZDFiZWZmMDBkOTAy
YzA1YzljN2U5NWE1ZDhlYjUyZCBcCi0gICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9XSEVOQ0U7
bWQ1PSR7V0hFTkNFX0NIS1NVTX0gXAorICAgICAgICAgICAgICAgICAgICBmaWxlOi8vV0hFTkNF
O21kNT1hYzg1NDFlOWUxYTk1MjM1OGYyNDVhZmQ0NzhjZTMxNyBcCiAgICAgICAgICAgICAgICAg
ICAgICIKICMgV0hFTkNFIGNoZWNrc3VtIGlzIGRlZmluZWQgc2VwYXJhdGVseSB0byBlYXNlIG92
ZXJyaWRpbmcgaXQgaWYKICMgY2xhc3MtZGV2dXBzdHJlYW0gaXMgc2VsZWN0ZWQuCkBAIC0zMjgs
NyArNTQwLDcgQEAgU1JDX1VSSTpjbGFzcy1kZXZ1cHN0cmVhbSA9ICJnaXQ6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvZmlybXcKICMgUGluIHRoaXMgdG8gdGhlIDIw
MjIwNTA5IHJlbGVhc2UsIG92ZXJyaWRlIHRoaXMgaW4gbG9jYWwuY29uZgogU1JDUkVWOmNsYXNz
LWRldnVwc3RyZWFtID89ICJiMTljYmRjYTc4YWIyYWRmZDIxMGM5MWJlMTVhMjI1NjhlOGI4Y2Fl
IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZWRlZmIxZDJhNTM4MzY3YWJmOTU1ODgwMmZlZTNj
ZDEzNWViYjE5YTRhNTg5MGM4ZWVmYjM0MTZhOTJhNmI4OSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICI2ZjNlZmVlN2Y2MDBjMjAxZjliMmQ2NzU4ODlhNGNjZGI4Y2ZlNTZlMGQyODM2NDE3OTZlZDEw
ZTY0YzcyMDQ3IgogCiBpbmhlcml0IGFsbGFyY2gKIAotLSAKMi40Ny4xCgo=

--===============6014278765439474060==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-misc: FILELIST: added "/usr/lib/firmware/amdgpu/gc_11_5_3_rlc.bin /usr/lib/firmware/amdgpu/gc_11_5_3_imu.bin /usr/lib/firmware/amdgpu/gc_11_5_3_pfp.bin /usr/lib/firmware/amdgpu/gc_11_5_3_mec.bin /usr/lib/firmware/amdgpu/sdma_6_1_3.bin /usr/lib/firmware/amdgpu/dcn_3_6_dmcub.bin /usr/lib/firmware/amdgpu/gc_11_5_3_mes_2.bin /usr/lib/firmware/amdgpu/psp_14_0_5_toc.bin /usr/lib/firmware/amdgpu/psp_14_0_5_ta.bin /usr/lib/firmware/amdgpu/gc_11_5_3_mes1.bin /usr/lib/firmware/amdgpu/gc_11_5_3_me.bin"
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: added "/usr/lib/firmware/qcom/sdx61/foxconn/prog_firehose_lite.elf /usr/lib/firmware/xe/fan_control_8086_e20b_8086_1100.bin /usr/lib/firmware/rtw89/rtw8922a_fw-4.bin /usr/lib/firmware/xe/ptl_huc.bin /usr/lib/firmware/xe/ptl_guc_70.bin"

--===============6014278765439474060==--

