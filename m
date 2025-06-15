Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C15BC83037
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 13:15:04 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.8903.1749993302315719967
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 06:15:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Gye2LsOM;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Tei6ARGW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019773baa719-05077dc0-3075-4e25-8438-19d0d7642a88-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1749993301;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=caPFt86TzylQ4wjRLOXjrkq2B2Fr4rXyC+OfchHdCxw=;
	b=Gye2LsOMb2qj1pNicj+65yIYF43AzzAf6B3M5Dw10ukxhHyMGqQaG+0m4bjN4Nvy
	XsHEhYXw+WHQRGZitJvuycwZ6skgQTchic2JgNy5hHh1MkcoqNIBL6lkJ921eUYva2X
	u6jpeb1VRsgwu7i7ych7VbmCcuHXt8NcroyohPQA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1749993301;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=caPFt86TzylQ4wjRLOXjrkq2B2Fr4rXyC+OfchHdCxw=;
	b=Tei6ARGW9WuuqNJHTh6g8obCRlUnY/SdtniBV7BxMXaGg1xOVJQdLG2yF72raa+R
	AC+nHsMWoEYB8Kd/Rusx9bIKMWSw7548ltLT3uXrgyFUbcLKIc0lWg4hIhLrUQF4nAT
	6TWROhVoRlR0eCg/4pdPWMXNB3d3TR70iaETVWsc=
Content-Type: multipart/mixed; boundary="===============8773685655116442904=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] linux-firmware: upgrading to 20250613 SUCCEEDED
Message-ID: <0101019773baa719-05077dc0-3075-4e25-8438-19d0d7642a88-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jun 2025 13:15:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 13:15:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218731

--===============8773685655116442904==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *linux-firmware* to *20250613* has Succeeded.

Next steps:
    - apply the patch: git am 0001-linux-firmware-upgrade-20250509-20250613.patch
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
From 05600695054d8817fa2a7ef5427962edaa016707 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Jun 2025 12:07:33 +0000
Subject: [PATCH] linux-firmware: upgrade 20250509 -> 20250613

---
 ...20250509.bb => linux-firmware_20250613.bb} | 713 +++++++++++++++++-
 1 file changed, 710 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20250509.bb => linux-firmware_20250613.bb} (79%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250509.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250613.bb
similarity index 79%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20250509.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20250613.bb
index 3883f71781..1261ecb1d1 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250509.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250613.bb
@@ -1,3 +1,710 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENCE.cnm
+# +++ LICENCE.cnm
+# @@ -1,23 +1,43 @@
+#  Copyright (C) 2021 Chips&Media, Inc.
+#  All rights reserved.
+#  
+# -Redistribution and use in binary form is permitted provided that the following
+# +Redistribution and use in binary form are permitted provided that the following
+#  conditions are met:
+#  
+#  1. Redistributions must reproduce the above copyright notice, this list of
+#  conditions and the following disclaimer in the documentation and/or other
+#  materials provided with the distribution.
+#  
+# -2. Redistribution and use shall be used only with Texas Instruments Incorporateds
+# -silicon products. Any other use, reproduction, modification, translation,
+# -or compilation of the Software is prohibited.
+# +2. Use of the following software binaries shall be strictly limited as
+# +specified below:
+# +
+# +  2.1 Solely for use with Texas Instruments Incorporated's silicon products:
+# +    * wave521c_k3_codec_fw.bin
+# +
+# +  2.2 Solely for use with NXP's silicon products:
+# +    * wave633c_imx9_codec_fw.bin
+# +
+# +Any other use, reproduction, modification, translation, or compilation of the
+# +Software is prohibited.
+#  
+#  3. No reverse engineering, decompilation, or disassembly is permitted.
+# +
+# +4. Neither the name of Chips&Media, Inc. nor the names of its suppliers may be
+# +used to endorse or promote products derived from this software without specific
+# +prior written permission.
+#  
+#  TO THE MAXIMUM EXTENT PERMITTED BY APPLICABLE LAW, THIS SOFTWARE IS PROVIDED
+#  "AS IS" WITHOUT WARRANTY OF ANY KIND, INCLUDING, WITHOUT LIMITATION, ANY EXPRESS
+#  OR IMPLIED WARRANTIES OF MERCHANTABILITY, ACCURACY, FITNESS OR SUFFICIENCY FOR A
+#  PARTICULAR PURPOSE, SATISFACTORY QUALITY, CORRESPONDENCE WITH DESCRIPTION, QUIET
+#  ENJOYMENT OR NON-INFRINGEMENT OF THIRD PARTY INTELLECTUAL PROPERTY RIGHTS.
+# -CHIPS&MEDIA, INC., ITS AFFILIATES AND THEIR SUPPLIERS DISCLAIM ANY WARRANTY THAT THE
+# -DELIVERABLES WILL OPERATE WITHOUT INTERRUPTION OR BE ERROR-FREE.
+# +CHIPS&MEDIA, INC., ITS AFFILIATES AND THEIR SUPPLIERS DISCLAIM ANY WARRANTY THAT
+# +THE DELIVERABLES WILL OPERATE WITHOUT INTERRUPTION OR BE ERROR-FREE.
+# +
+# +IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
+# +INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
+# +BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+# +DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
+# +LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
+# +OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
+# +ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+# --- WHENCE
+# +++ WHENCE
+# @@ -805,7 +805,7 @@
+#  Version: 17.bfb58538.0
+#  
+#  File: iwlwifi-7265D-29.ucode
+# -Version: 29.f2390aa8.0
+# +Version: 29.9ef079ed.0
+#  
+#  File: iwlwifi-3168-29.ucode
+#  Version: 29.0bd893f3.0
+# @@ -814,13 +814,13 @@
+#  Version: 34.610288.0
+#  
+#  File: iwlwifi-8000C-36.ucode
+# -Version: 36.ca7b901d.0
+# +Version: 36.c8e8e144.0
+#  
+#  File: iwlwifi-8265-34.ucode
+#  Version: 34.610288.0
+#  
+#  File: iwlwifi-8265-36.ucode
+# -Version: 36.ca7b901d.0
+# +Version: 36.c8e8e144.0
+#  
+#  File: iwlwifi-9000-pu-b0-jf-b0-34.ucode
+#  Version: 34.ba501b11.0
+# @@ -1022,25 +1022,25 @@
+#  Version: 74.a5e9588b.0
+#  
+#  File: iwlwifi-cc-a0-77.ucode
+# -Version: 74.f31a351f.0
+# +Version: 74.864baa2e.0
+#  
+#  File: iwlwifi-Qu-b0-hr-b0-77.ucode
+# -Version: 74.f31a351f.0
+# +Version: 74.864baa2e.0
+#  
+#  File: iwlwifi-Qu-b0-jf-b0-77.ucode
+# -Version: 74.f31a351f.0
+# +Version: 74.864baa2e.0
+#  
+#  File: iwlwifi-Qu-c0-hr-b0-77.ucode
+# -Version: 74.f31a351f.0
+# +Version: 74.864baa2e.0
+#  
+#  File: iwlwifi-Qu-c0-jf-b0-77.ucode
+# -Version: 74.f31a351f.0
+# +Version: 74.864baa2e.0
+#  
+#  File: iwlwifi-QuZ-a0-hr-b0-77.ucode
+# -Version: 74.f31a351f.0
+# +Version: 74.864baa2e.0
+#  
+#  File: iwlwifi-QuZ-a0-jf-b0-77.ucode
+# -Version: 74.f31a351f.0
+# +Version: 74.864baa2e.0
+#  
+#  File: iwlwifi-ty-a0-gf-a0-77.ucode
+#  Version: 74.f92b5fed.0
+# @@ -1064,7 +1064,7 @@
+#  Version: 83.fb5c9aeb.0
+#  
+#  File: iwlwifi-ty-a0-gf-a0-89.ucode
+# -Version: 86.7f71c7f4.0
+# +Version: 86.af655058.0
+#  
+#  File: iwlwifi-so-a0-gf4-a0-77.ucode
+#  Version: 74.f92b5fed.0
+# @@ -1088,7 +1088,7 @@
+#  Version: 83.fb5c9aeb.0
+#  
+#  File: iwlwifi-so-a0-gf4-a0-89.ucode
+# -Version: 86.7f71c7f4.0
+# +Version: 86.af655058.0
+#  
+#  File: iwlwifi-so-a0-gf-a0-77.ucode
+#  Version: 74.f92b5fed.0
+# @@ -1112,7 +1112,7 @@
+#  Version: 83.fb5c9aeb.0
+#  
+#  File: iwlwifi-so-a0-gf-a0-89.ucode
+# -Version: 86.7f71c7f4.0
+# +Version: 86.af655058.0
+#  
+#  File: iwlwifi-so-a0-hr-b0-77.ucode
+#  Version: 74.f92b5fed.0
+# @@ -1133,7 +1133,7 @@
+#  Version: 83.fb5c9aeb.0
+#  
+#  File: iwlwifi-so-a0-hr-b0-89.ucode
+# -Version: 86.7f71c7f4.0
+# +Version: 86.af655058.0
+#  
+#  File: iwlwifi-so-a0-jf-b0-77.ucode
+#  Version: 74.f92b5fed.0
+# @@ -1218,7 +1218,7 @@
+#  Version: 83.fb5c9aeb.0
+#  
+#  File: iwlwifi-ma-b0-gf-a0-89.ucode
+# -Version: 86.7f71c7f4.0
+# +Version: 86.af655058.0
+#  
+#  File: iwlwifi-ma-b0-gf-a0.pnvm
+#  
+# @@ -1229,7 +1229,7 @@
+#  Version: 83.fb5c9aeb.0
+#  
+#  File: iwlwifi-ma-b0-gf4-a0-89.ucode
+# -Version: 86.7f71c7f4.0
+# +Version: 86.af655058.0
+#  
+#  File: iwlwifi-ma-b0-gf4-a0.pnvm
+#  
+# @@ -1240,7 +1240,7 @@
+#  Version: 83.fb5c9aeb.0
+#  
+#  File: iwlwifi-ma-b0-hr-b0-89.ucode
+# -Version: 86.7f71c7f4.0
+# +Version: 86.af655058.0
+#  
+#  Licence: Redistributable. See LICENCE.iwlwifi_firmware for details
+#  
+# @@ -1287,6 +1287,17 @@
+#  
+#  --------------------------------------------------------------------------
+#  
+# +Driver: intel-ipu7-isys - Intel IPU7 (Image Processing Unit 7) driver
+# +
+# +File: intel/ipu/ipu7_fw.bin
+# +Version: master_release_20240628_1854
+# +
+# +File: intel/ipu/ipu7ptl_fw.bin
+# +Version: master_release_20250515_1232
+# +
+# +Licence: Redistributable. See LICENSE.intel for details
+# +
+# +--------------------------------------------------------------------------
+#  Driver: mei-vsc-hw - Intel Visual Sensing Controller
+#  
+#  File: intel/vsc/ivsc_fw.bin
+# @@ -3053,6 +3064,7 @@
+#  Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m2-ultra.txt -> brcmfmac43430-sdio.AP6212.txt
+#  Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m3.txt -> brcmfmac43430-sdio.AP6212.txt
+#  Link: brcm/brcmfmac43430-sdio.sinovoip,bananapi-m64.txt -> brcmfmac43430-sdio.AP6212.txt
+# +Link: brcm/brcmfmac43430-sdio.friendlyarm,nanopi-neo4.txt -> brcmfmac43430-sdio.AP6212.txt
+#  Link: brcm/brcmfmac43430-sdio.friendlyarm,nanopi-r1.txt -> brcmfmac43430-sdio.AP6212.txt
+#  Link: brcm/brcmfmac43430-sdio.starfive,visionfive-v1.txt -> brcmfmac43430-sdio.AP6212.txt
+#  Link: brcm/brcmfmac43430-sdio.beagle,beaglev-starlight-jh7100-a1.txt -> brcmfmac43430-sdio.AP6212.txt
+# @@ -3081,10 +3093,12 @@
+#  File: brcm/brcmfmac4356-sdio.AP6356S.txt
+#  Link: brcm/brcmfmac4356-sdio.firefly,firefly-rk3399.txt -> brcmfmac4356-sdio.AP6356S.txt
+#  Link: brcm/brcmfmac4356-sdio.friendlyarm,nanopi-m4.txt -> brcmfmac4356-sdio.AP6356S.txt
+# +Link: brcm/brcmfmac4356-sdio.friendlyarm,nanopc-t4.txt -> brcmfmac4356-sdio.AP6356S.txt
+#  Link: brcm/brcmfmac4356-sdio.khadas,vim2.txt -> brcmfmac4356-sdio.AP6356S.txt
+#  Link: brcm/brcmfmac4356-sdio.vamrs,rock960.txt -> brcmfmac4356-sdio.AP6356S.txt
+#  File: brcm/brcmfmac43455-sdio.AW-CM256SM.txt
+#  Link: brcm/brcmfmac43455-sdio.beagle,am5729-beagleboneai.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
+# +Link: brcm/brcmfmac43455-sdio.brcmfmac43455-sdio.khadas,vim.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
+#  Link: brcm/brcmfmac43455-sdio.pine64,pinebook-pro.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
+#  Link: brcm/brcmfmac43455-sdio.pine64,pinenote-v1.1.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
+#  Link: brcm/brcmfmac43455-sdio.pine64,pinenote-v1.2.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
+# @@ -3630,6 +3644,9 @@
+#  Version: 0.0.4
+#  
+#  File: rtl_nic/rtl8126a-3.fw
+# +Version: 0.0.5
+# +
+# +File: rtl_nic/rtl8127a-1.fw
+#  Version: 0.0.5
+#  
+#  Licence:
+# @@ -3958,7 +3975,7 @@
+#  File: ath12k/WCN7850/hw2.0/board-2.bin
+#  File: ath12k/WCN7850/hw2.0/amss.bin
+#  File: ath12k/WCN7850/hw2.0/m3.bin
+# -Version: WLAN.HMT.1.1.c5-00284-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
+# +Version: WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
+#  File: ath12k/WCN7850/hw2.0/Notice.txt
+#  File: ath12k/QCN9274/hw2.0/board-2.bin
+#  File: ath12k/QCN9274/hw2.0/firmware-2.bin
+# @@ -4140,7 +4157,7 @@
+#  File: intel/ibt-18-16-1.ddc
+#  File: intel/ibt-18-2.sfi
+#  File: intel/ibt-18-2.ddc
+# -Version: BT_Pulsar_REL20425_22.20.2412.20425
+# +Version: BT_Pulsar_REL20451_22.20.2433.20451
+#  
+#  File: intel/ibt-17-0-1.sfi
+#  Version: BT_JeffersonPeak_A0_B0_REL0201
+# @@ -4172,45 +4189,45 @@
+#  File: intel/ibt-20-1-4.ddc
+#  Version: BT_CyclonePeak_A0_REL53636
+#  File: intel/ibt-19-0-0.sfi
+# -Version: BT_Quasar_REL53497
+# +Version: BT_Quasar_REL53697
+#  File: intel/ibt-19-0-0.ddc
+# -Version: BT_Quasar_REL53497
+# +Version: BT_Quasar_REL53697
+#  File: intel/ibt-19-0-1.sfi
+# -Version: BT_Quasar_REL53497
+# +Version: BT_Quasar_REL53697
+#  File: intel/ibt-19-0-1.ddc
+# -Version: BT_Quasar_REL53497
+# +Version: BT_Quasar_REL53697
+#  File: intel/ibt-19-0-3.sfi
+# -Version: BT_Quasar_REL53263
+# +Version: BT_Quasar_REL53697
+#  File: intel/ibt-19-0-3.ddc
+# -Version: BT_Quasar_REL53263
+# +Version: BT_Quasar_REL53697
+#  File: intel/ibt-19-0-4.sfi
+# -Version: BT_HarrisonPeak_REL53636
+# +Version: BT_HarrisonPeak_REL53697
+#  File: intel/ibt-19-0-4.ddc
+# -Version: BT_HarrisonPeak_REL53636
+# +Version: BT_HarrisonPeak_REL53697
+#  File: intel/ibt-19-16-4.sfi
+# -Version: BT_HarrisonPeak_REL53636
+# +Version: BT_HarrisonPeak_REL53697
+#  File: intel/ibt-19-16-4.ddc
+# -Version: BT_HarrisonPeak_REL53636
+# +Version: BT_HarrisonPeak_REL53697
+#  File: intel/ibt-19-32-1.sfi
+# -Version: BT_HarrisonPeak_REL53636
+# +Version: BT_HarrisonPeak_REL53697
+#  File: intel/ibt-19-32-1.ddc
+# -Version: BT_HarrisonPeak_REL53636
+# +Version: BT_HarrisonPeak_REL53697
+#  File: intel/ibt-19-32-0.sfi
+# -Version: BT_HarrisonPeak_REL53636
+# +Version: BT_HarrisonPeak_REL53697
+#  File: intel/ibt-19-32-0.ddc
+# -Version: BT_HarrisonPeak_REL53636
+# +Version: BT_HarrisonPeak_REL53697
+#  File: intel/ibt-19-32-4.sfi
+# -Version: BT_HarrisonPeak_REL53636
+# +Version: BT_HarrisonPeak_REL53697
+#  File: intel/ibt-19-32-4.ddc
+# -Version: BT_HarrisonPeak_REL53636
+# +Version: BT_HarrisonPeak_REL53697
+#  File: intel/ibt-19-240-1.sfi
+# -Version: BT_HarrisonPeak_REL53636
+# +Version: BT_HarrisonPeak_REL53697
+#  File: intel/ibt-19-240-1.ddc
+# -Version: BT_HarrisonPeak_REL53636
+# +Version: BT_HarrisonPeak_REL53697
+#  File: intel/ibt-19-240-4.sfi
+# -Version: BT_HarrisonPeak_REL53636
+# +Version: BT_HarrisonPeak_REL53697
+#  File: intel/ibt-19-240-4.ddc
+# -Version: BT_HarrisonPeak_REL53636
+# +Version: BT_HarrisonPeak_REL53697
+#  
+#  File: intel/ibt-0041-0041.sfi
+#  File: intel/ibt-0041-0041.ddc
+# @@ -4226,7 +4243,7 @@
+#  File: intel/ibt-0040-1050.ddc
+#  File: intel/ibt-1040-1050.sfi
+#  File: intel/ibt-1040-1050.ddc
+# -Version: BT_Solar_REL81864_23.50.24483.81864
+# +Version: BT_Solar_REL82008_23.50.25133.82008
+#  
+#  File: intel/ibt-0040-1020.sfi
+#  File: intel/ibt-0040-1020.ddc
+# @@ -4248,7 +4265,7 @@
+#  File: intel/ibt-0093-4150.ddc
+#  File: intel/ibt-0093-1050.sfi
+#  File: intel/ibt-0093-1050.ddc
+# -Version: BT_BlazarU_S_REL76693_23.120.25071.76693
+# +Version: BT_BlazarU_S_REL82313_23.140.25182.82313
+#  
+#  File: intel/ibt-0180-0041.sfi
+#  File: intel/ibt-0180-0041.ddc
+# @@ -4256,7 +4273,7 @@
+#  File: intel/ibt-0180-4150.ddc
+#  File: intel/ibt-0180-1050.sfi
+#  File: intel/ibt-0180-1050.ddc
+# -Version: BT_Magnetar_REL103604_23.50.24483.103604
+# +Version: BT_Magnetar_REL103831_23.50.25133.103831
+#  
+#  File: intel/ibt-0190-0291.sfi
+#  File: intel/ibt-0190-0291-iml.sfi
+# @@ -4272,7 +4289,7 @@
+#  File: intel/ibt-0190-0291-pci.sfi
+#  File: intel/ibt-0190-0291-usb.ddc
+#  File: intel/ibt-0190-0291-usb.sfi
+# -Version: BT_BlazarI_S_REL82746_23.120.25071.82746
+# +Version: BT_BlazarI_S_REL90142_23.140.25182.90142
+#  
+#  Licence: Redistributable. See LICENCE.ibt_firmware for details
+#  
+# @@ -4810,7 +4827,7 @@
+#  Version: BTFW.HSP.2.1.0-00653-VER_PATCHZ-3
+#  File: qca/QCA2066/nvm_usb_00130201_030a.bin
+#  File: qca/QCA2066/nvm_usb_00130201_gf_030a.bin
+# -Version: BTFW.HAMILTON.2.0.0-00790-USB_PATCHZ-3
+# +Version: BTFW.HAMILTON.2.0.0-00799-USB_PATCHZ-5
+#  File: qca/nvm_usb_00190200.bin
+#  File: qca/nvm_usb_00190200_0104.bin
+#  File: qca/nvm_usb_00190200_0106.bin
+# @@ -5345,7 +5362,7 @@
+#  Version: GuC API/APB ver 70.4.1 for DG2
+#  
+#  File: i915/dg2_guc_70.bin
+# -Version: GuC API/APB ver 70.44.1 for DG2
+# +Version: GuC API/APB ver 70.45.2 for DG2
+#  
+#  File: i915/dg2_huc_gsc.bin
+#  Version: HuC API/APB ver 7.10.16 for DG2
+# @@ -5389,16 +5406,16 @@
+#  Driver: xe -- Intel Graphics driver
+#  
+#  File: xe/lnl_gsc_1.bin
+# -Version: GSC API/APB v1.0, release 104.0.0.1263, SVN 1 for Lunarlake
+# +Version: GSC API/APB v1.0, release 104.0.5.1429, SVN 1 for Lunarlake
+#  
+#  File: xe/lnl_guc_70.bin
+# -Version: GuC API/APB ver 70.44.1 for Lunarlake
+# +Version: GuC API/APB ver 70.45.2 for Lunarlake
+#  
+#  File: xe/lnl_huc.bin
+#  Version: HuC API/APB ver 9.4.13 for Lunarlake
+#  
+#  File: xe/bmg_guc_70.bin
+# -Version: GuC API/APB ver 70.44.1 for Battlemage
+# +Version: GuC API/APB ver 70.45.2 for Battlemage
+#  
+#  File: xe/bmg_huc.bin
+#  Version: HuC API/APB ver 8.2.10 for Battlemage
+# @@ -5825,34 +5842,64 @@
+#  File: nvidia/tu102/gsp/bootloader-535.113.01.bin
+#  File: nvidia/tu102/gsp/booter_load-535.113.01.bin
+#  File: nvidia/tu102/gsp/booter_unload-535.113.01.bin
+# +File: nvidia/tu102/gsp/bootloader-570.144.bin
+# +File: nvidia/tu102/gsp/booter_load-570.144.bin
+# +File: nvidia/tu102/gsp/booter_unload-570.144.bin
+#  Link: nvidia/tu104/gsp -> ../tu102/gsp
+#  Link: nvidia/tu106/gsp -> ../tu102/gsp
+#  
+#  File: nvidia/tu116/gsp/booter_load-535.113.01.bin
+#  File: nvidia/tu116/gsp/booter_unload-535.113.01.bin
+#  Link: nvidia/tu116/gsp/bootloader-535.113.01.bin -> ../../tu102/gsp/bootloader-535.113.01.bin
+# +File: nvidia/tu116/gsp/booter_load-570.144.bin
+# +File: nvidia/tu116/gsp/booter_unload-570.144.bin
+# +Link: nvidia/tu116/gsp/bootloader-570.144.bin -> ../../tu102/gsp/bootloader-570.144.bin
+#  Link: nvidia/tu117/gsp -> ../tu116/gsp
+#  
+#  File: nvidia/ga100/gsp/bootloader-535.113.01.bin
+#  File: nvidia/ga100/gsp/booter_load-535.113.01.bin
+#  File: nvidia/ga100/gsp/booter_unload-535.113.01.bin
+# -
+# -File: nvidia/ad102/gsp/bootloader-535.113.01.bin
+# -File: nvidia/ad102/gsp/booter_load-535.113.01.bin
+# -File: nvidia/ad102/gsp/booter_unload-535.113.01.bin
+# -Link: nvidia/ad103/gsp -> ../ad102/gsp
+# -Link: nvidia/ad104/gsp -> ../ad102/gsp
+# -Link: nvidia/ad106/gsp -> ../ad102/gsp
+# -Link: nvidia/ad107/gsp -> ../ad102/gsp
+# +File: nvidia/ga100/gsp/bootloader-570.144.bin
+# +File: nvidia/ga100/gsp/booter_load-570.144.bin
+# +File: nvidia/ga100/gsp/booter_unload-570.144.bin
+#  
+#  File: nvidia/ga102/gsp/bootloader-535.113.01.bin
+#  File: nvidia/ga102/gsp/booter_load-535.113.01.bin
+#  File: nvidia/ga102/gsp/booter_unload-535.113.01.bin
+# +File: nvidia/ga102/gsp/bootloader-570.144.bin
+# +File: nvidia/ga102/gsp/booter_load-570.144.bin
+# +File: nvidia/ga102/gsp/booter_unload-570.144.bin
+#  Link: nvidia/ga103/gsp -> ../ga102/gsp
+#  Link: nvidia/ga104/gsp -> ../ga102/gsp
+#  Link: nvidia/ga106/gsp -> ../ga102/gsp
+#  Link: nvidia/ga107/gsp -> ../ga102/gsp
+#  
+# +File: nvidia/ad102/gsp/bootloader-535.113.01.bin
+# +File: nvidia/ad102/gsp/booter_load-535.113.01.bin
+# +File: nvidia/ad102/gsp/booter_unload-535.113.01.bin
+# +File: nvidia/ad102/gsp/bootloader-570.144.bin
+# +File: nvidia/ad102/gsp/booter_load-570.144.bin
+# +File: nvidia/ad102/gsp/booter_unload-570.144.bin
+# +File: nvidia/ad102/gsp/scrubber-570.144.bin
+# +Link: nvidia/ad103 -> ad102
+# +Link: nvidia/ad104 -> ad102
+# +Link: nvidia/ad106 -> ad102
+# +Link: nvidia/ad107 -> ad102
+# +
+# +File: nvidia/gh100/gsp/bootloader-570.144.bin
+# +File: nvidia/gh100/gsp/fmc-570.144.bin
+# +
+# +File: nvidia/gb100/gsp/bootloader-570.144.bin
+# +File: nvidia/gb100/gsp/fmc-570.144.bin
+# +Link: nvidia/gb102 -> gb100
+# +
+# +File: nvidia/gb202/gsp/bootloader-570.144.bin
+# +File: nvidia/gb202/gsp/fmc-570.144.bin
+# +Link: nvidia/gb203 -> gb202
+# +Link: nvidia/gb205 -> gb202
+# +Link: nvidia/gb206 -> gb202
+# +Link: nvidia/gb207 -> gb202
+# +
+#  File: nvidia/tu102/gsp/gsp-535.113.01.bin
+#  Origin: gsp_tu10x.bin from NVIDIA-Linux-x86_64-535.113.01.run
+#  Link: nvidia/tu116/gsp/gsp-535.113.01.bin -> ../../tu102/gsp/gsp-535.113.01.bin
+# @@ -5862,6 +5909,17 @@
+#  Origin: gsp_ga10x.bin from NVIDIA-Linux-x86_64-535.113.01.run
+#  Link: nvidia/ad102/gsp/gsp-535.113.01.bin -> ../../ga102/gsp/gsp-535.113.01.bin
+#  
+# +File: nvidia/tu102/gsp/gsp-570.144.bin
+# +Origin: gsp_tu10x.bin from NVIDIA-Linux-x86_64-570.144.run
+# +Link: nvidia/tu116/gsp/gsp-570.144.bin -> ../../tu102/gsp/gsp-570.144.bin
+# +Link: nvidia/ga100/gsp/gsp-570.144.bin -> ../../tu102/gsp/gsp-570.144.bin
+# +
+# +File: nvidia/ga102/gsp/gsp-570.144.bin
+# +Origin: gsp_ga10x.bin from NVIDIA-Linux-x86_64-570.144.run
+# +Link: nvidia/ad102/gsp/gsp-570.144.bin -> ../../ga102/gsp/gsp-570.144.bin
+# +Link: nvidia/gh100/gsp/gsp-570.144.bin -> ../../ga102/gsp/gsp-570.144.bin
+# +Link: nvidia/gb100/gsp/gsp-570.144.bin -> ../../ga102/gsp/gsp-570.144.bin
+# +Link: nvidia/gb202/gsp/gsp-570.144.bin -> ../../ga102/gsp/gsp-570.144.bin
+#  Licence: Redistributable. See LICENCE.nvidia for details
+#  
+#  --------------------------------------------------------------------------
+# @@ -5921,6 +5979,15 @@
+#  File: mediatek/mt8173/vpu_p.bin
+#  Link: vpu_d.bin -> mediatek/mt8173/vpu_d.bin
+#  Link: vpu_p.bin -> mediatek/mt8173/vpu_p.bin
+# +
+# +Licence: Redistributable. See LICENCE.mediatek for details.
+# +
+# +--------------------------------------------------------------------------
+# +
+# +Driver: mt8196 - MediaTek MT8196 Video Controller Processor
+# +
+# +File: mediatek/mt8196/vcp.img
+# +Version: v1.0.0
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -6119,9 +6186,9 @@
+#  Driver: mt7921 - MediaTek MT7921 Wireless MACs
+#  
+#  File: mediatek/WIFI_MT7961_patch_mcu_1_2_hdr.bin
+# -Version: 20241106151007a
+# +Version: 20250523110946a
+#  File: mediatek/WIFI_RAM_CODE_MT7961_1.bin
+# -Version: 20241106150855
+# +Version: 20250523110807
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -6130,7 +6197,7 @@
+#  Driver: mt7921 - MediaTek MT7921 bluetooth chipset
+#  
+#  File: mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin
+# -Version: 20241106151414
+# +Version: 20250523111333
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -6139,9 +6206,9 @@
+#  Driver: mt7922 - MediaTek MT7922 Wireless MACs
+#  
+#  File: mediatek/WIFI_MT7922_patch_mcu_1_1_hdr.bin
+# -Version: 20241106163228a
+# +Version: 20250523103150a
+#  File: mediatek/WIFI_RAM_CODE_MT7922_1.bin
+# -Version: 20241106163156
+# +Version: 20250523103106
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -6150,7 +6217,7 @@
+#  Driver: mt7922 - MediaTek MT7922 bluetooth chipset
+#  
+#  File: mediatek/BT_RAM_CODE_MT7922_1_1_hdr.bin
+# -Version: 20241106163512
+# +Version: 20250523103438
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -6159,9 +6226,9 @@
+#  Driver: mt7925 - MediaTek MT7925 Wireless MACs
+#  
+#  File: mediatek/mt7925/WIFI_MT7925_PATCH_MCU_1_1_hdr.bin
+# -Version: 20250425072955a
+# +Version: 20250526152947a
+#  File: mediatek/mt7925/WIFI_RAM_CODE_MT7925_1_1.bin
+# -Version: 20250425072801
+# +Version: 20250526152808
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -6170,7 +6237,7 @@
+#  Driver: mt7925 - MediaTek MT7925 bluetooth chipset
+#  
+#  File: mediatek/mt7925/BT_RAM_CODE_MT7925_1_1_hdr.bin
+# -Version: 20250425073330
+# +Version: 20250526153203
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -6588,11 +6655,13 @@
+#  RawFile: qcom/sc8280xp/LENOVO/21BX/battmgr.jsn
+#  RawFile: qcom/sc8280xp/LENOVO/21BX/cdspr.jsn
+#  File: qcom/sc8280xp/LENOVO/21BX/qcadsp8280.mbn
+# -Version: ADSP.HT.5.6-00729-MAKENA-1
+# +Version: ADSP.HT.5.6.c2-00013-MAKENA-1.75542.4
+#  File: qcom/sc8280xp/LENOVO/21BX/qccdsp8280.mbn
+# -Version: CDSP.HT.2.6-00698-MAKENA-1
+# +Version: CDSP.HT.2.6-00735.4-MAKENA-1
+#  File: qcom/sc8280xp/LENOVO/21BX/qcslpi8280.mbn
+# -Version: SLPI.HY.4.1-00048-MAKENA-1
+# +Version: SLPI.HY.4.1-00061-MAKENA-1
+# +File: qcom/sc8280xp/LENOVO/21BX/qcvss8280.mbn
+# +Version: video-firmware.1.1-b158087140355883dc40b004032856a8feb5d565
+#  File: qcom/x1e80100/LENOVO/21N1/qcvss8380.mbn
+#  Version: vfw-3.1:rel0085-070fa3311d9ef968015fee7fea07198d7eb208a1
+#  File: qcom/x1e80100/adsp.mbn
+# @@ -6865,14 +6934,14 @@
+#  
+#  Driver: ice - Intel(R) Ethernet Connection E800 Series
+#  
+# -File: intel/ice/ddp/ice-1.3.41.0.pkg
+# -Link: intel/ice/ddp/ice.pkg -> ice-1.3.41.0.pkg
+# +File: intel/ice/ddp/ice-1.3.43.0.pkg
+# +Link: intel/ice/ddp/ice.pkg -> ice-1.3.43.0.pkg
+#  File: intel/ice/ddp-lag/ice_lag-1.3.1.0.pkg
+#  
+#  License: Redistributable. See LICENSE.ice for details
+#  
+# -File: intel/ice/ddp-comms/ice_comms-1.3.52.0.pkg
+# -File: intel/ice/ddp-wireless_edge/ice_wireless_edge-1.3.20.0.pkg
+# +File: intel/ice/ddp-comms/ice_comms-1.3.55.0.pkg
+# +File: intel/ice/ddp-wireless_edge/ice_wireless_edge-1.3.23.0.pkg
+#  
+#  License: Redistributable. See LICENSE.ice_enhanced for details
+#  
+# @@ -6934,9 +7003,17 @@
+#  
+#  --------------------------------------------------------------------------
+#  
+# -Driver: wave5 - Chips&Media, Inc. video codec driver
+# +Driver: wave5 - Chips&Media, Inc. Wave5 video codec driver
+#  
+#  File: cnm/wave521c_k3_codec_fw.bin
+# +
+# +Licence: Redistributable. See LICENCE.cnm for details.
+# +
+# +--------------------------------------------------------------------------
+# +
+# +Driver: wave6 - Chips&Media, Inc. Wave6 video codec driver
+# +
+# +File: cnm/wave633c_imx9_codec_fw.bin
+#  
+#  Licence: Redistributable. See LICENCE.cnm for details.
+#  
+# @@ -7458,11 +7535,11 @@
+#  Link: cirrus/cs35l41-dsp1-spk-prot-10431d1f-spkid1-l0.bin -> cs35l41-dsp1-spk-prot-10431503-spkid1-l0.bin
+#  Link: cirrus/cs35l41-dsp1-spk-prot-10431d1f-spkid1-r0.bin -> cs35l41-dsp1-spk-prot-10431503-spkid1-r0.bin
+#  Link: cirrus/cs35l41-dsp1-spk-prot-10431b93.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# -Link: cirrus/cs35l41-dsp1-spk-prot-10431a20.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# -Link: cirrus/cs35l41-dsp1-spk-prot-10431a30.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# -Link: cirrus/cs35l41-dsp1-spk-prot-10431a40.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# -Link: cirrus/cs35l41-dsp1-spk-prot-10431a50.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# -Link: cirrus/cs35l41-dsp1-spk-prot-10431a60.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433a20.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433a30.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433a40.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433a50.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10433a60.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+#  File: cirrus/cs35l41-dsp1-spk-prot-10431b93-spkid0-l0.bin
+#  File: cirrus/cs35l41-dsp1-spk-prot-10431b93-spkid0-r0.bin
+#  File: cirrus/cs35l41-dsp1-spk-prot-10431b93-spkid1-l0.bin
+# @@ -7667,6 +7744,9 @@
+#  Link: cirrus/cs35l41-dsp1-spk-prot-10433d88-spkid0-r0.bincfg -> cs35l41/bincfgs/cs35l41-dsp1-14_5dB.bincfg
+#  Link: cirrus/cs35l41-dsp1-spk-prot-10433d88-spkid1-l0.bincfg -> cs35l41/bincfgs/cs35l41-dsp1-14_5dB.bincfg
+#  Link: cirrus/cs35l41-dsp1-spk-prot-10433d88-spkid1-r0.bincfg -> cs35l41/bincfgs/cs35l41-dsp1-14_5dB.bincfg
+# +Link: cirrus/cs35l41-dsp1-spk-prot-104388f4.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +File: cirrus/cs35l41-dsp1-spk-prot-104388f4-spkid0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-104388f4-spkid1.bin
+#  Link: cirrus/cs35l41-dsp1-spk-prot-17aa2316.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+#  Link: cirrus/cs35l41-dsp1-spk-prot-17aa2317.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+#  File: cirrus/cs35l41-dsp1-spk-prot-17aa2316-spkid0-l0.bin
+# @@ -7861,11 +7941,26 @@
+#  Link: cirrus/cs35l41-dsp1-spk-prot-103c8cdf-spkid1-r0.bin -> cs35l41-dsp1-spk-prot-103c8cdf-spkid1-l0.bin
+#  Link: cirrus/cs35l41-dsp1-spk-prot-103c8ce0-spkid1-l0.bin -> cs35l41-dsp1-spk-prot-103c8cdf-spkid1-l0.bin
+#  Link: cirrus/cs35l41-dsp1-spk-prot-103c8ce0-spkid1-r0.bin -> cs35l41-dsp1-spk-prot-103c8cdf-spkid1-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8e3a.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8e3b.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +File: cirrus/cs35l41-dsp1-spk-prot-103c8e3a-spkid0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-103c8e3a-spkid1.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8e3b-spkid0.bin -> cs35l41-dsp1-spk-prot-103c8e3a-spkid0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8e3b-spkid1.bin -> cs35l41-dsp1-spk-prot-103c8e3a-spkid1.bin
+#  Link: cirrus/cs35l41-dsp1-spk-prot-1f660105.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+#  File: cirrus/cs35l41-dsp1-spk-prot-1f660105.bin
+#  File: cirrus/cs35l41/v6.51.0/halo_cspl_RAM_revB2_29.53.0.wmfw
+#  Link: cirrus/cs35l41-dsp1-spk-prot-vlv1776.wmfw -> cs35l41/v6.51.0/halo_cspl_RAM_revB2_29.53.0.wmfw
+#  File: cirrus/cs35l41-dsp1-spk-prot-vlv1776.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-1025182c.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10251826.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10251844.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +File: cirrus/cs35l41-dsp1-spk-prot-1025182c-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-1025182c-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10251826-l0.bin -> cs35l41-dsp1-spk-prot-1025182c-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-10251826-r0.bin -> cs35l41-dsp1-spk-prot-1025182c-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10251844-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-10251844-r0.bin
+#  
+#  License: Redistributable. See LICENSE.cirrus for details.
+#  
+# @@ -8289,6 +8384,9 @@
+#  File: powervr/rogue_33.15.11.3_v1.fw
+#  Version: 1.0.OS@6503725
+#  
+# +File: powervr/rogue_36.53.104.796_v1.fw
+# +Version: 1.0.OS@6734358
+# +
+#  License: Redistributable. See LICENSE.powervr for details
+#  
+#  --------------------------------------------------------------------------
+# @@ -8543,11 +8641,11 @@
+#  Driver: intel_vpu -- Intel NPU driver
+#  
+#  File: intel/vpu/vpu_37xx_v1.bin
+# -Version: ci_tag_ud202512_vpu_rc_20250306_1130
+# +Version: ci_tag_ud202518_vpu_rc_20250415_1900
+#  Link: intel/vpu/vpu_37xx_v0.0.bin -> vpu_37xx_v1.bin
+#  
+#  File: intel/vpu/vpu_40xx_v1.bin
+# -Version: ci_tag_ud202512_vpu_rc_20250306_1130
+# +Version: ci_tag_ud202518_vpu_rc_20250415_1900
+#  Link: intel/vpu/vpu_40xx_v0.0.bin -> vpu_40xx_v1.bin
+#  
+#  License: Redistributable. See LICENSE.intel_vpu for details
+# @@ -8563,7 +8661,9 @@
+#  
+#  ---------------------------------------------------------------------------
+#  
+# -Driver: qcs9100 - Qualcomm QUPv3 firmware image file
+# +Driver: qcom-geni-se - Qualcomm QUPv3 firmware image file
+#  File: qcom/sa8775p/qupv3fw.elf
+# +File: qcom/qcm6490/qupv3fw.elf
+# +File: qcom/qcs8300/qupv3fw.elf
+#  
+#  License: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
+# 
+#
+
 SUMMARY = "Firmware files for use with Linux kernel"
 HOMEPAGE = "https://www.kernel.org/"
 DESCRIPTION = "Linux firmware is a package distributed alongside the Linux kernel \
@@ -97,7 +804,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.cavium;md5=c37aaffb1ebe5939b2580d073a95daea \
                     file://LICENCE.chelsio_firmware;md5=819aa8c3fa453f1b258ed8d168a9d903 \
                     file://LICENSE.cirrus;md5=662ea2c1a8888f7d79ed7f27c27472e1 \
-                    file://LICENCE.cnm;md5=93b67e6bac7f8fec22b96b8ad0a1a9d0 \
+                    file://LICENCE.cnm;md5=df3992006621b797e36de43f36336e36 \
                     file://LICENCE.cw1200;md5=f0f770864e7a8444a5c5aa9d12a3a7ed \
                     file://LICENCE.cypress;md5=48cd9436c763bf873961f9ed7b5c147b \
                     file://LICENSE.dib0700;md5=f7411825c8a555a1a3e5eab9ca773431 \
@@ -156,7 +863,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
                     file://wfx/LICENCE.wf200;md5=4d1beff00d902c05c9c7e95a5d8eb52d \
-                    file://WHENCE;md5=${WHENCE_CHKSUM} \
+                    file://WHENCE;md5=131efa2b2bab317f52b081719225dd64 \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
@@ -250,7 +957,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "f2c60d66f226a28130cb5643e6e544d3229673460e127c91ba03f1080cbd703e"
+SRC_URI[sha256sum] = "d40743337ca8bf9d2587e220ab30dec6a07b52cc5cb4a4ff8d92be14391a7fde"
 
 inherit allarch
 
-- 
2.47.1


--===============8773685655116442904==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-linux-firmware-upgrade-20250509-20250613.patch"

RnJvbSAwNTYwMDY5NTA1NGQ4ODE3ZmEyYTdlZjU0Mjc5NjJlZGFhMDE2NzA3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSnVuIDIwMjUgMTI6MDc6MzMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aW51eC1maXJtd2FyZTogdXBncmFkZSAyMDI1MDUwOSAtPiAyMDI1MDYxMwoKLS0tCiAuLi4yMDI1
MDUwOS5iYiA9PiBsaW51eC1maXJtd2FyZV8yMDI1MDYxMy5iYn0gfCA3MTMgKysrKysrKysrKysr
KysrKystCiAxIGZpbGUgY2hhbmdlZCwgNzEwIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS97bGludXgtZmlybXdh
cmVfMjAyNTA1MDkuYmIgPT4gbGludXgtZmlybXdhcmVfMjAyNTA2MTMuYmJ9ICg3OSUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2Fy
ZV8yMDI1MDUwOS5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgt
ZmlybXdhcmVfMjAyNTA2MTMuYmIKc2ltaWxhcml0eSBpbmRleCA3OSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZV8yMDI1MDUwOS5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJt
d2FyZV8yMDI1MDYxMy5iYgppbmRleCAzODgzZjcxNzgxLi4xMjYxZWNiMWQxIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlXzIwMjUw
NTA5LmJiCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgtZmly
bXdhcmVfMjAyNTA2MTMuYmIKQEAgLTEsMyArMSw3MTAgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklM
RVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4K
KyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRo
ZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlm
IG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3Nh
Z2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0
ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0t
LSBMSUNFTkNFLmNubQorIyArKysgTElDRU5DRS5jbm0KKyMgQEAgLTEsMjMgKzEsNDMgQEAKKyMg
IENvcHlyaWdodCAoQykgMjAyMSBDaGlwcyZNZWRpYSwgSW5jLgorIyAgQWxsIHJpZ2h0cyByZXNl
cnZlZC4KKyMgIAorIyAtUmVkaXN0cmlidXRpb24gYW5kIHVzZSBpbiBiaW5hcnkgZm9ybSBpcyBw
ZXJtaXR0ZWQgcHJvdmlkZWQgdGhhdCB0aGUgZm9sbG93aW5nCisjICtSZWRpc3RyaWJ1dGlvbiBh
bmQgdXNlIGluIGJpbmFyeSBmb3JtIGFyZSBwZXJtaXR0ZWQgcHJvdmlkZWQgdGhhdCB0aGUgZm9s
bG93aW5nCisjICBjb25kaXRpb25zIGFyZSBtZXQ6CisjICAKKyMgIDEuIFJlZGlzdHJpYnV0aW9u
cyBtdXN0IHJlcHJvZHVjZSB0aGUgYWJvdmUgY29weXJpZ2h0IG5vdGljZSwgdGhpcyBsaXN0IG9m
CisjICBjb25kaXRpb25zIGFuZCB0aGUgZm9sbG93aW5nIGRpc2NsYWltZXIgaW4gdGhlIGRvY3Vt
ZW50YXRpb24gYW5kL29yIG90aGVyCisjICBtYXRlcmlhbHMgcHJvdmlkZWQgd2l0aCB0aGUgZGlz
dHJpYnV0aW9uLgorIyAgCisjIC0yLiBSZWRpc3RyaWJ1dGlvbiBhbmQgdXNlIHNoYWxsIGJlIHVz
ZWQgb25seSB3aXRoIFRleGFzIEluc3RydW1lbnRzIEluY29ycG9yYXRlZHMKKyMgLXNpbGljb24g
cHJvZHVjdHMuIEFueSBvdGhlciB1c2UsIHJlcHJvZHVjdGlvbiwgbW9kaWZpY2F0aW9uLCB0cmFu
c2xhdGlvbiwKKyMgLW9yIGNvbXBpbGF0aW9uIG9mIHRoZSBTb2Z0d2FyZSBpcyBwcm9oaWJpdGVk
LgorIyArMi4gVXNlIG9mIHRoZSBmb2xsb3dpbmcgc29mdHdhcmUgYmluYXJpZXMgc2hhbGwgYmUg
c3RyaWN0bHkgbGltaXRlZCBhcworIyArc3BlY2lmaWVkIGJlbG93OgorIyArCisjICsgIDIuMSBT
b2xlbHkgZm9yIHVzZSB3aXRoIFRleGFzIEluc3RydW1lbnRzIEluY29ycG9yYXRlZCdzIHNpbGlj
b24gcHJvZHVjdHM6CisjICsgICAgKiB3YXZlNTIxY19rM19jb2RlY19mdy5iaW4KKyMgKworIyAr
ICAyLjIgU29sZWx5IGZvciB1c2Ugd2l0aCBOWFAncyBzaWxpY29uIHByb2R1Y3RzOgorIyArICAg
ICogd2F2ZTYzM2NfaW14OV9jb2RlY19mdy5iaW4KKyMgKworIyArQW55IG90aGVyIHVzZSwgcmVw
cm9kdWN0aW9uLCBtb2RpZmljYXRpb24sIHRyYW5zbGF0aW9uLCBvciBjb21waWxhdGlvbiBvZiB0
aGUKKyMgK1NvZnR3YXJlIGlzIHByb2hpYml0ZWQuCisjICAKKyMgIDMuIE5vIHJldmVyc2UgZW5n
aW5lZXJpbmcsIGRlY29tcGlsYXRpb24sIG9yIGRpc2Fzc2VtYmx5IGlzIHBlcm1pdHRlZC4KKyMg
KworIyArNC4gTmVpdGhlciB0aGUgbmFtZSBvZiBDaGlwcyZNZWRpYSwgSW5jLiBub3IgdGhlIG5h
bWVzIG9mIGl0cyBzdXBwbGllcnMgbWF5IGJlCisjICt1c2VkIHRvIGVuZG9yc2Ugb3IgcHJvbW90
ZSBwcm9kdWN0cyBkZXJpdmVkIGZyb20gdGhpcyBzb2Z0d2FyZSB3aXRob3V0IHNwZWNpZmljCisj
ICtwcmlvciB3cml0dGVuIHBlcm1pc3Npb24uCisjICAKKyMgIFRPIFRIRSBNQVhJTVVNIEVYVEVO
VCBQRVJNSVRURUQgQlkgQVBQTElDQUJMRSBMQVcsIFRISVMgU09GVFdBUkUgSVMgUFJPVklERUQK
KyMgICJBUyBJUyIgV0lUSE9VVCBXQVJSQU5UWSBPRiBBTlkgS0lORCwgSU5DTFVESU5HLCBXSVRI
T1VUIExJTUlUQVRJT04sIEFOWSBFWFBSRVNTCisjICBPUiBJTVBMSUVEIFdBUlJBTlRJRVMgT0Yg
TUVSQ0hBTlRBQklMSVRZLCBBQ0NVUkFDWSwgRklUTkVTUyBPUiBTVUZGSUNJRU5DWSBGT1IgQQor
IyAgUEFSVElDVUxBUiBQVVJQT1NFLCBTQVRJU0ZBQ1RPUlkgUVVBTElUWSwgQ09SUkVTUE9OREVO
Q0UgV0lUSCBERVNDUklQVElPTiwgUVVJRVQKKyMgIEVOSk9ZTUVOVCBPUiBOT04tSU5GUklOR0VN
RU5UIE9GIFRISVJEIFBBUlRZIElOVEVMTEVDVFVBTCBQUk9QRVJUWSBSSUdIVFMuCisjIC1DSElQ
UyZNRURJQSwgSU5DLiwgSVRTIEFGRklMSUFURVMgQU5EIFRIRUlSIFNVUFBMSUVSUyBESVNDTEFJ
TSBBTlkgV0FSUkFOVFkgVEhBVCBUSEUKKyMgLURFTElWRVJBQkxFUyBXSUxMIE9QRVJBVEUgV0lU
SE9VVCBJTlRFUlJVUFRJT04gT1IgQkUgRVJST1ItRlJFRS4KKyMgK0NISVBTJk1FRElBLCBJTkMu
LCBJVFMgQUZGSUxJQVRFUyBBTkQgVEhFSVIgU1VQUExJRVJTIERJU0NMQUlNIEFOWSBXQVJSQU5U
WSBUSEFUCisjICtUSEUgREVMSVZFUkFCTEVTIFdJTEwgT1BFUkFURSBXSVRIT1VUIElOVEVSUlVQ
VElPTiBPUiBCRSBFUlJPUi1GUkVFLgorIyArCisjICtJTiBOTyBFVkVOVCBTSEFMTCBUSEUgQ09Q
WVJJR0hUIE9XTkVSIE9SIENPTlRSSUJVVE9SUyBCRSBMSUFCTEUgRk9SIEFOWSBESVJFQ1QsCisj
ICtJTkRJUkVDVCwgSU5DSURFTlRBTCwgU1BFQ0lBTCwgRVhFTVBMQVJZLCBPUiBDT05TRVFVRU5U
SUFMIERBTUFHRVMgKElOQ0xVRElORywKKyMgK0JVVCBOT1QgTElNSVRFRCBUTywgUFJPQ1VSRU1F
TlQgT0YgU1VCU1RJVFVURSBHT09EUyBPUiBTRVJWSUNFUzsgTE9TUyBPRiBVU0UsCisjICtEQVRB
LCBPUiBQUk9GSVRTOyBPUiBCVVNJTkVTUyBJTlRFUlJVUFRJT04pIEhPV0VWRVIgQ0FVU0VEIEFO
RCBPTiBBTlkgVEhFT1JZIE9GCisjICtMSUFCSUxJVFksIFdIRVRIRVIgSU4gQ09OVFJBQ1QsIFNU
UklDVCBMSUFCSUxJVFksIE9SIFRPUlQgKElOQ0xVRElORyBORUdMSUdFTkNFCisjICtPUiBPVEhF
UldJU0UpIEFSSVNJTkcgSU4gQU5ZIFdBWSBPVVQgT0YgVEhFIFVTRSBPRiBUSElTIFNPRlRXQVJF
LCBFVkVOIElGCisjICtBRFZJU0VEIE9GIFRIRSBQT1NTSUJJTElUWSBPRiBTVUNIIERBTUFHRS4K
KyMgLS0tIFdIRU5DRQorIyArKysgV0hFTkNFCisjIEBAIC04MDUsNyArODA1LDcgQEAKKyMgIFZl
cnNpb246IDE3LmJmYjU4NTM4LjAKKyMgIAorIyAgRmlsZTogaXdsd2lmaS03MjY1RC0yOS51Y29k
ZQorIyAtVmVyc2lvbjogMjkuZjIzOTBhYTguMAorIyArVmVyc2lvbjogMjkuOWVmMDc5ZWQuMAor
IyAgCisjICBGaWxlOiBpd2x3aWZpLTMxNjgtMjkudWNvZGUKKyMgIFZlcnNpb246IDI5LjBiZDg5
M2YzLjAKKyMgQEAgLTgxNCwxMyArODE0LDEzIEBACisjICBWZXJzaW9uOiAzNC42MTAyODguMAor
IyAgCisjICBGaWxlOiBpd2x3aWZpLTgwMDBDLTM2LnVjb2RlCisjIC1WZXJzaW9uOiAzNi5jYTdi
OTAxZC4wCisjICtWZXJzaW9uOiAzNi5jOGU4ZTE0NC4wCisjICAKKyMgIEZpbGU6IGl3bHdpZmkt
ODI2NS0zNC51Y29kZQorIyAgVmVyc2lvbjogMzQuNjEwMjg4LjAKKyMgIAorIyAgRmlsZTogaXds
d2lmaS04MjY1LTM2LnVjb2RlCisjIC1WZXJzaW9uOiAzNi5jYTdiOTAxZC4wCisjICtWZXJzaW9u
OiAzNi5jOGU4ZTE0NC4wCisjICAKKyMgIEZpbGU6IGl3bHdpZmktOTAwMC1wdS1iMC1qZi1iMC0z
NC51Y29kZQorIyAgVmVyc2lvbjogMzQuYmE1MDFiMTEuMAorIyBAQCAtMTAyMiwyNSArMTAyMiwy
NSBAQAorIyAgVmVyc2lvbjogNzQuYTVlOTU4OGIuMAorIyAgCisjICBGaWxlOiBpd2x3aWZpLWNj
LWEwLTc3LnVjb2RlCisjIC1WZXJzaW9uOiA3NC5mMzFhMzUxZi4wCisjICtWZXJzaW9uOiA3NC44
NjRiYWEyZS4wCisjICAKKyMgIEZpbGU6IGl3bHdpZmktUXUtYjAtaHItYjAtNzcudWNvZGUKKyMg
LVZlcnNpb246IDc0LmYzMWEzNTFmLjAKKyMgK1ZlcnNpb246IDc0Ljg2NGJhYTJlLjAKKyMgIAor
IyAgRmlsZTogaXdsd2lmaS1RdS1iMC1qZi1iMC03Ny51Y29kZQorIyAtVmVyc2lvbjogNzQuZjMx
YTM1MWYuMAorIyArVmVyc2lvbjogNzQuODY0YmFhMmUuMAorIyAgCisjICBGaWxlOiBpd2x3aWZp
LVF1LWMwLWhyLWIwLTc3LnVjb2RlCisjIC1WZXJzaW9uOiA3NC5mMzFhMzUxZi4wCisjICtWZXJz
aW9uOiA3NC44NjRiYWEyZS4wCisjICAKKyMgIEZpbGU6IGl3bHdpZmktUXUtYzAtamYtYjAtNzcu
dWNvZGUKKyMgLVZlcnNpb246IDc0LmYzMWEzNTFmLjAKKyMgK1ZlcnNpb246IDc0Ljg2NGJhYTJl
LjAKKyMgIAorIyAgRmlsZTogaXdsd2lmaS1RdVotYTAtaHItYjAtNzcudWNvZGUKKyMgLVZlcnNp
b246IDc0LmYzMWEzNTFmLjAKKyMgK1ZlcnNpb246IDc0Ljg2NGJhYTJlLjAKKyMgIAorIyAgRmls
ZTogaXdsd2lmaS1RdVotYTAtamYtYjAtNzcudWNvZGUKKyMgLVZlcnNpb246IDc0LmYzMWEzNTFm
LjAKKyMgK1ZlcnNpb246IDc0Ljg2NGJhYTJlLjAKKyMgIAorIyAgRmlsZTogaXdsd2lmaS10eS1h
MC1nZi1hMC03Ny51Y29kZQorIyAgVmVyc2lvbjogNzQuZjkyYjVmZWQuMAorIyBAQCAtMTA2NCw3
ICsxMDY0LDcgQEAKKyMgIFZlcnNpb246IDgzLmZiNWM5YWViLjAKKyMgIAorIyAgRmlsZTogaXds
d2lmaS10eS1hMC1nZi1hMC04OS51Y29kZQorIyAtVmVyc2lvbjogODYuN2Y3MWM3ZjQuMAorIyAr
VmVyc2lvbjogODYuYWY2NTUwNTguMAorIyAgCisjICBGaWxlOiBpd2x3aWZpLXNvLWEwLWdmNC1h
MC03Ny51Y29kZQorIyAgVmVyc2lvbjogNzQuZjkyYjVmZWQuMAorIyBAQCAtMTA4OCw3ICsxMDg4
LDcgQEAKKyMgIFZlcnNpb246IDgzLmZiNWM5YWViLjAKKyMgIAorIyAgRmlsZTogaXdsd2lmaS1z
by1hMC1nZjQtYTAtODkudWNvZGUKKyMgLVZlcnNpb246IDg2LjdmNzFjN2Y0LjAKKyMgK1ZlcnNp
b246IDg2LmFmNjU1MDU4LjAKKyMgIAorIyAgRmlsZTogaXdsd2lmaS1zby1hMC1nZi1hMC03Ny51
Y29kZQorIyAgVmVyc2lvbjogNzQuZjkyYjVmZWQuMAorIyBAQCAtMTExMiw3ICsxMTEyLDcgQEAK
KyMgIFZlcnNpb246IDgzLmZiNWM5YWViLjAKKyMgIAorIyAgRmlsZTogaXdsd2lmaS1zby1hMC1n
Zi1hMC04OS51Y29kZQorIyAtVmVyc2lvbjogODYuN2Y3MWM3ZjQuMAorIyArVmVyc2lvbjogODYu
YWY2NTUwNTguMAorIyAgCisjICBGaWxlOiBpd2x3aWZpLXNvLWEwLWhyLWIwLTc3LnVjb2RlCisj
ICBWZXJzaW9uOiA3NC5mOTJiNWZlZC4wCisjIEBAIC0xMTMzLDcgKzExMzMsNyBAQAorIyAgVmVy
c2lvbjogODMuZmI1YzlhZWIuMAorIyAgCisjICBGaWxlOiBpd2x3aWZpLXNvLWEwLWhyLWIwLTg5
LnVjb2RlCisjIC1WZXJzaW9uOiA4Ni43ZjcxYzdmNC4wCisjICtWZXJzaW9uOiA4Ni5hZjY1NTA1
OC4wCisjICAKKyMgIEZpbGU6IGl3bHdpZmktc28tYTAtamYtYjAtNzcudWNvZGUKKyMgIFZlcnNp
b246IDc0LmY5MmI1ZmVkLjAKKyMgQEAgLTEyMTgsNyArMTIxOCw3IEBACisjICBWZXJzaW9uOiA4
My5mYjVjOWFlYi4wCisjICAKKyMgIEZpbGU6IGl3bHdpZmktbWEtYjAtZ2YtYTAtODkudWNvZGUK
KyMgLVZlcnNpb246IDg2LjdmNzFjN2Y0LjAKKyMgK1ZlcnNpb246IDg2LmFmNjU1MDU4LjAKKyMg
IAorIyAgRmlsZTogaXdsd2lmaS1tYS1iMC1nZi1hMC5wbnZtCisjICAKKyMgQEAgLTEyMjksNyAr
MTIyOSw3IEBACisjICBWZXJzaW9uOiA4My5mYjVjOWFlYi4wCisjICAKKyMgIEZpbGU6IGl3bHdp
ZmktbWEtYjAtZ2Y0LWEwLTg5LnVjb2RlCisjIC1WZXJzaW9uOiA4Ni43ZjcxYzdmNC4wCisjICtW
ZXJzaW9uOiA4Ni5hZjY1NTA1OC4wCisjICAKKyMgIEZpbGU6IGl3bHdpZmktbWEtYjAtZ2Y0LWEw
LnBudm0KKyMgIAorIyBAQCAtMTI0MCw3ICsxMjQwLDcgQEAKKyMgIFZlcnNpb246IDgzLmZiNWM5
YWViLjAKKyMgIAorIyAgRmlsZTogaXdsd2lmaS1tYS1iMC1oci1iMC04OS51Y29kZQorIyAtVmVy
c2lvbjogODYuN2Y3MWM3ZjQuMAorIyArVmVyc2lvbjogODYuYWY2NTUwNTguMAorIyAgCisjICBM
aWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLml3bHdpZmlfZmlybXdhcmUgZm9y
IGRldGFpbHMKKyMgIAorIyBAQCAtMTI4Nyw2ICsxMjg3LDE3IEBACisjICAKKyMgIC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCisjICAKKyMgK0RyaXZlcjogaW50ZWwtaXB1Ny1pc3lzIC0gSW50ZWwgSVBVNyAo
SW1hZ2UgUHJvY2Vzc2luZyBVbml0IDcpIGRyaXZlcgorIyArCisjICtGaWxlOiBpbnRlbC9pcHUv
aXB1N19mdy5iaW4KKyMgK1ZlcnNpb246IG1hc3Rlcl9yZWxlYXNlXzIwMjQwNjI4XzE4NTQKKyMg
KworIyArRmlsZTogaW50ZWwvaXB1L2lwdTdwdGxfZncuYmluCisjICtWZXJzaW9uOiBtYXN0ZXJf
cmVsZWFzZV8yMDI1MDUxNV8xMjMyCisjICsKKyMgK0xpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4g
U2VlIExJQ0VOU0UuaW50ZWwgZm9yIGRldGFpbHMKKyMgKworIyArLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
KyMgIERyaXZlcjogbWVpLXZzYy1odyAtIEludGVsIFZpc3VhbCBTZW5zaW5nIENvbnRyb2xsZXIK
KyMgIAorIyAgRmlsZTogaW50ZWwvdnNjL2l2c2NfZncuYmluCisjIEBAIC0zMDUzLDYgKzMwNjQs
NyBAQAorIyAgTGluazogYnJjbS9icmNtZm1hYzQzNDMwLXNkaW8uc2lub3ZvaXAsYnBpLW0yLXVs
dHJhLnR4dCAtPiBicmNtZm1hYzQzNDMwLXNkaW8uQVA2MjEyLnR4dAorIyAgTGluazogYnJjbS9i
cmNtZm1hYzQzNDMwLXNkaW8uc2lub3ZvaXAsYnBpLW0zLnR4dCAtPiBicmNtZm1hYzQzNDMwLXNk
aW8uQVA2MjEyLnR4dAorIyAgTGluazogYnJjbS9icmNtZm1hYzQzNDMwLXNkaW8uc2lub3ZvaXAs
YmFuYW5hcGktbTY0LnR4dCAtPiBicmNtZm1hYzQzNDMwLXNkaW8uQVA2MjEyLnR4dAorIyArTGlu
azogYnJjbS9icmNtZm1hYzQzNDMwLXNkaW8uZnJpZW5kbHlhcm0sbmFub3BpLW5lbzQudHh0IC0+
IGJyY21mbWFjNDM0MzAtc2Rpby5BUDYyMTIudHh0CisjICBMaW5rOiBicmNtL2JyY21mbWFjNDM0
MzAtc2Rpby5mcmllbmRseWFybSxuYW5vcGktcjEudHh0IC0+IGJyY21mbWFjNDM0MzAtc2Rpby5B
UDYyMTIudHh0CisjICBMaW5rOiBicmNtL2JyY21mbWFjNDM0MzAtc2Rpby5zdGFyZml2ZSx2aXNp
b25maXZlLXYxLnR4dCAtPiBicmNtZm1hYzQzNDMwLXNkaW8uQVA2MjEyLnR4dAorIyAgTGluazog
YnJjbS9icmNtZm1hYzQzNDMwLXNkaW8uYmVhZ2xlLGJlYWdsZXYtc3RhcmxpZ2h0LWpoNzEwMC1h
MS50eHQgLT4gYnJjbWZtYWM0MzQzMC1zZGlvLkFQNjIxMi50eHQKKyMgQEAgLTMwODEsMTAgKzMw
OTMsMTIgQEAKKyMgIEZpbGU6IGJyY20vYnJjbWZtYWM0MzU2LXNkaW8uQVA2MzU2Uy50eHQKKyMg
IExpbms6IGJyY20vYnJjbWZtYWM0MzU2LXNkaW8uZmlyZWZseSxmaXJlZmx5LXJrMzM5OS50eHQg
LT4gYnJjbWZtYWM0MzU2LXNkaW8uQVA2MzU2Uy50eHQKKyMgIExpbms6IGJyY20vYnJjbWZtYWM0
MzU2LXNkaW8uZnJpZW5kbHlhcm0sbmFub3BpLW00LnR4dCAtPiBicmNtZm1hYzQzNTYtc2Rpby5B
UDYzNTZTLnR4dAorIyArTGluazogYnJjbS9icmNtZm1hYzQzNTYtc2Rpby5mcmllbmRseWFybSxu
YW5vcGMtdDQudHh0IC0+IGJyY21mbWFjNDM1Ni1zZGlvLkFQNjM1NlMudHh0CisjICBMaW5rOiBi
cmNtL2JyY21mbWFjNDM1Ni1zZGlvLmtoYWRhcyx2aW0yLnR4dCAtPiBicmNtZm1hYzQzNTYtc2Rp
by5BUDYzNTZTLnR4dAorIyAgTGluazogYnJjbS9icmNtZm1hYzQzNTYtc2Rpby52YW1ycyxyb2Nr
OTYwLnR4dCAtPiBicmNtZm1hYzQzNTYtc2Rpby5BUDYzNTZTLnR4dAorIyAgRmlsZTogYnJjbS9i
cmNtZm1hYzQzNDU1LXNkaW8uQVctQ00yNTZTTS50eHQKKyMgIExpbms6IGJyY20vYnJjbWZtYWM0
MzQ1NS1zZGlvLmJlYWdsZSxhbTU3MjktYmVhZ2xlYm9uZWFpLnR4dCAtPiBicmNtZm1hYzQzNDU1
LXNkaW8uQVctQ00yNTZTTS50eHQKKyMgK0xpbms6IGJyY20vYnJjbWZtYWM0MzQ1NS1zZGlvLmJy
Y21mbWFjNDM0NTUtc2Rpby5raGFkYXMsdmltLnR4dCAtPiBicmNtZm1hYzQzNDU1LXNkaW8uQVct
Q00yNTZTTS50eHQKKyMgIExpbms6IGJyY20vYnJjbWZtYWM0MzQ1NS1zZGlvLnBpbmU2NCxwaW5l
Ym9vay1wcm8udHh0IC0+IGJyY21mbWFjNDM0NTUtc2Rpby5BVy1DTTI1NlNNLnR4dAorIyAgTGlu
azogYnJjbS9icmNtZm1hYzQzNDU1LXNkaW8ucGluZTY0LHBpbmVub3RlLXYxLjEudHh0IC0+IGJy
Y21mbWFjNDM0NTUtc2Rpby5BVy1DTTI1NlNNLnR4dAorIyAgTGluazogYnJjbS9icmNtZm1hYzQz
NDU1LXNkaW8ucGluZTY0LHBpbmVub3RlLXYxLjIudHh0IC0+IGJyY21mbWFjNDM0NTUtc2Rpby5B
Vy1DTTI1NlNNLnR4dAorIyBAQCAtMzYzMCw2ICszNjQ0LDkgQEAKKyMgIFZlcnNpb246IDAuMC40
CisjICAKKyMgIEZpbGU6IHJ0bF9uaWMvcnRsODEyNmEtMy5mdworIyArVmVyc2lvbjogMC4wLjUK
KyMgKworIyArRmlsZTogcnRsX25pYy9ydGw4MTI3YS0xLmZ3CisjICBWZXJzaW9uOiAwLjAuNQor
IyAgCisjICBMaWNlbmNlOgorIyBAQCAtMzk1OCw3ICszOTc1LDcgQEAKKyMgIEZpbGU6IGF0aDEy
ay9XQ043ODUwL2h3Mi4wL2JvYXJkLTIuYmluCisjICBGaWxlOiBhdGgxMmsvV0NONzg1MC9odzIu
MC9hbXNzLmJpbgorIyAgRmlsZTogYXRoMTJrL1dDTjc4NTAvaHcyLjAvbTMuYmluCisjIC1WZXJz
aW9uOiBXTEFOLkhNVC4xLjEuYzUtMDAyODQtUUNBSE1UU1dQTF9WMS4wX1YyLjBfU0lMSUNPTlot
MworIyArVmVyc2lvbjogV0xBTi5ITVQuMS4xLmM1LTAwMjg0LjEtUUNBSE1UU1dQTF9WMS4wX1Yy
LjBfU0lMSUNPTlotMworIyAgRmlsZTogYXRoMTJrL1dDTjc4NTAvaHcyLjAvTm90aWNlLnR4dAor
IyAgRmlsZTogYXRoMTJrL1FDTjkyNzQvaHcyLjAvYm9hcmQtMi5iaW4KKyMgIEZpbGU6IGF0aDEy
ay9RQ045Mjc0L2h3Mi4wL2Zpcm13YXJlLTIuYmluCisjIEBAIC00MTQwLDcgKzQxNTcsNyBAQAor
IyAgRmlsZTogaW50ZWwvaWJ0LTE4LTE2LTEuZGRjCisjICBGaWxlOiBpbnRlbC9pYnQtMTgtMi5z
ZmkKKyMgIEZpbGU6IGludGVsL2lidC0xOC0yLmRkYworIyAtVmVyc2lvbjogQlRfUHVsc2FyX1JF
TDIwNDI1XzIyLjIwLjI0MTIuMjA0MjUKKyMgK1ZlcnNpb246IEJUX1B1bHNhcl9SRUwyMDQ1MV8y
Mi4yMC4yNDMzLjIwNDUxCisjICAKKyMgIEZpbGU6IGludGVsL2lidC0xNy0wLTEuc2ZpCisjICBW
ZXJzaW9uOiBCVF9KZWZmZXJzb25QZWFrX0EwX0IwX1JFTDAyMDEKKyMgQEAgLTQxNzIsNDUgKzQx
ODksNDUgQEAKKyMgIEZpbGU6IGludGVsL2lidC0yMC0xLTQuZGRjCisjICBWZXJzaW9uOiBCVF9D
eWNsb25lUGVha19BMF9SRUw1MzYzNgorIyAgRmlsZTogaW50ZWwvaWJ0LTE5LTAtMC5zZmkKKyMg
LVZlcnNpb246IEJUX1F1YXNhcl9SRUw1MzQ5NworIyArVmVyc2lvbjogQlRfUXVhc2FyX1JFTDUz
Njk3CisjICBGaWxlOiBpbnRlbC9pYnQtMTktMC0wLmRkYworIyAtVmVyc2lvbjogQlRfUXVhc2Fy
X1JFTDUzNDk3CisjICtWZXJzaW9uOiBCVF9RdWFzYXJfUkVMNTM2OTcKKyMgIEZpbGU6IGludGVs
L2lidC0xOS0wLTEuc2ZpCisjIC1WZXJzaW9uOiBCVF9RdWFzYXJfUkVMNTM0OTcKKyMgK1ZlcnNp
b246IEJUX1F1YXNhcl9SRUw1MzY5NworIyAgRmlsZTogaW50ZWwvaWJ0LTE5LTAtMS5kZGMKKyMg
LVZlcnNpb246IEJUX1F1YXNhcl9SRUw1MzQ5NworIyArVmVyc2lvbjogQlRfUXVhc2FyX1JFTDUz
Njk3CisjICBGaWxlOiBpbnRlbC9pYnQtMTktMC0zLnNmaQorIyAtVmVyc2lvbjogQlRfUXVhc2Fy
X1JFTDUzMjYzCisjICtWZXJzaW9uOiBCVF9RdWFzYXJfUkVMNTM2OTcKKyMgIEZpbGU6IGludGVs
L2lidC0xOS0wLTMuZGRjCisjIC1WZXJzaW9uOiBCVF9RdWFzYXJfUkVMNTMyNjMKKyMgK1ZlcnNp
b246IEJUX1F1YXNhcl9SRUw1MzY5NworIyAgRmlsZTogaW50ZWwvaWJ0LTE5LTAtNC5zZmkKKyMg
LVZlcnNpb246IEJUX0hhcnJpc29uUGVha19SRUw1MzYzNgorIyArVmVyc2lvbjogQlRfSGFycmlz
b25QZWFrX1JFTDUzNjk3CisjICBGaWxlOiBpbnRlbC9pYnQtMTktMC00LmRkYworIyAtVmVyc2lv
bjogQlRfSGFycmlzb25QZWFrX1JFTDUzNjM2CisjICtWZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtf
UkVMNTM2OTcKKyMgIEZpbGU6IGludGVsL2lidC0xOS0xNi00LnNmaQorIyAtVmVyc2lvbjogQlRf
SGFycmlzb25QZWFrX1JFTDUzNjM2CisjICtWZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMNTM2
OTcKKyMgIEZpbGU6IGludGVsL2lidC0xOS0xNi00LmRkYworIyAtVmVyc2lvbjogQlRfSGFycmlz
b25QZWFrX1JFTDUzNjM2CisjICtWZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMNTM2OTcKKyMg
IEZpbGU6IGludGVsL2lidC0xOS0zMi0xLnNmaQorIyAtVmVyc2lvbjogQlRfSGFycmlzb25QZWFr
X1JFTDUzNjM2CisjICtWZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMNTM2OTcKKyMgIEZpbGU6
IGludGVsL2lidC0xOS0zMi0xLmRkYworIyAtVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDUz
NjM2CisjICtWZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMNTM2OTcKKyMgIEZpbGU6IGludGVs
L2lidC0xOS0zMi0wLnNmaQorIyAtVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDUzNjM2Cisj
ICtWZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMNTM2OTcKKyMgIEZpbGU6IGludGVsL2lidC0x
OS0zMi0wLmRkYworIyAtVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDUzNjM2CisjICtWZXJz
aW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMNTM2OTcKKyMgIEZpbGU6IGludGVsL2lidC0xOS0zMi00
LnNmaQorIyAtVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDUzNjM2CisjICtWZXJzaW9uOiBC
VF9IYXJyaXNvblBlYWtfUkVMNTM2OTcKKyMgIEZpbGU6IGludGVsL2lidC0xOS0zMi00LmRkYwor
IyAtVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDUzNjM2CisjICtWZXJzaW9uOiBCVF9IYXJy
aXNvblBlYWtfUkVMNTM2OTcKKyMgIEZpbGU6IGludGVsL2lidC0xOS0yNDAtMS5zZmkKKyMgLVZl
cnNpb246IEJUX0hhcnJpc29uUGVha19SRUw1MzYzNgorIyArVmVyc2lvbjogQlRfSGFycmlzb25Q
ZWFrX1JFTDUzNjk3CisjICBGaWxlOiBpbnRlbC9pYnQtMTktMjQwLTEuZGRjCisjIC1WZXJzaW9u
OiBCVF9IYXJyaXNvblBlYWtfUkVMNTM2MzYKKyMgK1ZlcnNpb246IEJUX0hhcnJpc29uUGVha19S
RUw1MzY5NworIyAgRmlsZTogaW50ZWwvaWJ0LTE5LTI0MC00LnNmaQorIyAtVmVyc2lvbjogQlRf
SGFycmlzb25QZWFrX1JFTDUzNjM2CisjICtWZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMNTM2
OTcKKyMgIEZpbGU6IGludGVsL2lidC0xOS0yNDAtNC5kZGMKKyMgLVZlcnNpb246IEJUX0hhcnJp
c29uUGVha19SRUw1MzYzNgorIyArVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDUzNjk3Cisj
ICAKKyMgIEZpbGU6IGludGVsL2lidC0wMDQxLTAwNDEuc2ZpCisjICBGaWxlOiBpbnRlbC9pYnQt
MDA0MS0wMDQxLmRkYworIyBAQCAtNDIyNiw3ICs0MjQzLDcgQEAKKyMgIEZpbGU6IGludGVsL2li
dC0wMDQwLTEwNTAuZGRjCisjICBGaWxlOiBpbnRlbC9pYnQtMTA0MC0xMDUwLnNmaQorIyAgRmls
ZTogaW50ZWwvaWJ0LTEwNDAtMTA1MC5kZGMKKyMgLVZlcnNpb246IEJUX1NvbGFyX1JFTDgxODY0
XzIzLjUwLjI0NDgzLjgxODY0CisjICtWZXJzaW9uOiBCVF9Tb2xhcl9SRUw4MjAwOF8yMy41MC4y
NTEzMy44MjAwOAorIyAgCisjICBGaWxlOiBpbnRlbC9pYnQtMDA0MC0xMDIwLnNmaQorIyAgRmls
ZTogaW50ZWwvaWJ0LTAwNDAtMTAyMC5kZGMKKyMgQEAgLTQyNDgsNyArNDI2NSw3IEBACisjICBG
aWxlOiBpbnRlbC9pYnQtMDA5My00MTUwLmRkYworIyAgRmlsZTogaW50ZWwvaWJ0LTAwOTMtMTA1
MC5zZmkKKyMgIEZpbGU6IGludGVsL2lidC0wMDkzLTEwNTAuZGRjCisjIC1WZXJzaW9uOiBCVF9C
bGF6YXJVX1NfUkVMNzY2OTNfMjMuMTIwLjI1MDcxLjc2NjkzCisjICtWZXJzaW9uOiBCVF9CbGF6
YXJVX1NfUkVMODIzMTNfMjMuMTQwLjI1MTgyLjgyMzEzCisjICAKKyMgIEZpbGU6IGludGVsL2li
dC0wMTgwLTAwNDEuc2ZpCisjICBGaWxlOiBpbnRlbC9pYnQtMDE4MC0wMDQxLmRkYworIyBAQCAt
NDI1Niw3ICs0MjczLDcgQEAKKyMgIEZpbGU6IGludGVsL2lidC0wMTgwLTQxNTAuZGRjCisjICBG
aWxlOiBpbnRlbC9pYnQtMDE4MC0xMDUwLnNmaQorIyAgRmlsZTogaW50ZWwvaWJ0LTAxODAtMTA1
MC5kZGMKKyMgLVZlcnNpb246IEJUX01hZ25ldGFyX1JFTDEwMzYwNF8yMy41MC4yNDQ4My4xMDM2
MDQKKyMgK1ZlcnNpb246IEJUX01hZ25ldGFyX1JFTDEwMzgzMV8yMy41MC4yNTEzMy4xMDM4MzEK
KyMgIAorIyAgRmlsZTogaW50ZWwvaWJ0LTAxOTAtMDI5MS5zZmkKKyMgIEZpbGU6IGludGVsL2li
dC0wMTkwLTAyOTEtaW1sLnNmaQorIyBAQCAtNDI3Miw3ICs0Mjg5LDcgQEAKKyMgIEZpbGU6IGlu
dGVsL2lidC0wMTkwLTAyOTEtcGNpLnNmaQorIyAgRmlsZTogaW50ZWwvaWJ0LTAxOTAtMDI5MS11
c2IuZGRjCisjICBGaWxlOiBpbnRlbC9pYnQtMDE5MC0wMjkxLXVzYi5zZmkKKyMgLVZlcnNpb246
IEJUX0JsYXphcklfU19SRUw4Mjc0Nl8yMy4xMjAuMjUwNzEuODI3NDYKKyMgK1ZlcnNpb246IEJU
X0JsYXphcklfU19SRUw5MDE0Ml8yMy4xNDAuMjUxODIuOTAxNDIKKyMgIAorIyAgTGljZW5jZTog
UmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5pYnRfZmlybXdhcmUgZm9yIGRldGFpbHMKKyMg
IAorIyBAQCAtNDgxMCw3ICs0ODI3LDcgQEAKKyMgIFZlcnNpb246IEJURlcuSFNQLjIuMS4wLTAw
NjUzLVZFUl9QQVRDSFotMworIyAgRmlsZTogcWNhL1FDQTIwNjYvbnZtX3VzYl8wMDEzMDIwMV8w
MzBhLmJpbgorIyAgRmlsZTogcWNhL1FDQTIwNjYvbnZtX3VzYl8wMDEzMDIwMV9nZl8wMzBhLmJp
bgorIyAtVmVyc2lvbjogQlRGVy5IQU1JTFRPTi4yLjAuMC0wMDc5MC1VU0JfUEFUQ0haLTMKKyMg
K1ZlcnNpb246IEJURlcuSEFNSUxUT04uMi4wLjAtMDA3OTktVVNCX1BBVENIWi01CisjICBGaWxl
OiBxY2EvbnZtX3VzYl8wMDE5MDIwMC5iaW4KKyMgIEZpbGU6IHFjYS9udm1fdXNiXzAwMTkwMjAw
XzAxMDQuYmluCisjICBGaWxlOiBxY2EvbnZtX3VzYl8wMDE5MDIwMF8wMTA2LmJpbgorIyBAQCAt
NTM0NSw3ICs1MzYyLDcgQEAKKyMgIFZlcnNpb246IEd1QyBBUEkvQVBCIHZlciA3MC40LjEgZm9y
IERHMgorIyAgCisjICBGaWxlOiBpOTE1L2RnMl9ndWNfNzAuYmluCisjIC1WZXJzaW9uOiBHdUMg
QVBJL0FQQiB2ZXIgNzAuNDQuMSBmb3IgREcyCisjICtWZXJzaW9uOiBHdUMgQVBJL0FQQiB2ZXIg
NzAuNDUuMiBmb3IgREcyCisjICAKKyMgIEZpbGU6IGk5MTUvZGcyX2h1Y19nc2MuYmluCisjICBW
ZXJzaW9uOiBIdUMgQVBJL0FQQiB2ZXIgNy4xMC4xNiBmb3IgREcyCisjIEBAIC01Mzg5LDE2ICs1
NDA2LDE2IEBACisjICBEcml2ZXI6IHhlIC0tIEludGVsIEdyYXBoaWNzIGRyaXZlcgorIyAgCisj
ICBGaWxlOiB4ZS9sbmxfZ3NjXzEuYmluCisjIC1WZXJzaW9uOiBHU0MgQVBJL0FQQiB2MS4wLCBy
ZWxlYXNlIDEwNC4wLjAuMTI2MywgU1ZOIDEgZm9yIEx1bmFybGFrZQorIyArVmVyc2lvbjogR1ND
IEFQSS9BUEIgdjEuMCwgcmVsZWFzZSAxMDQuMC41LjE0MjksIFNWTiAxIGZvciBMdW5hcmxha2UK
KyMgIAorIyAgRmlsZTogeGUvbG5sX2d1Y183MC5iaW4KKyMgLVZlcnNpb246IEd1QyBBUEkvQVBC
IHZlciA3MC40NC4xIGZvciBMdW5hcmxha2UKKyMgK1ZlcnNpb246IEd1QyBBUEkvQVBCIHZlciA3
MC40NS4yIGZvciBMdW5hcmxha2UKKyMgIAorIyAgRmlsZTogeGUvbG5sX2h1Yy5iaW4KKyMgIFZl
cnNpb246IEh1QyBBUEkvQVBCIHZlciA5LjQuMTMgZm9yIEx1bmFybGFrZQorIyAgCisjICBGaWxl
OiB4ZS9ibWdfZ3VjXzcwLmJpbgorIyAtVmVyc2lvbjogR3VDIEFQSS9BUEIgdmVyIDcwLjQ0LjEg
Zm9yIEJhdHRsZW1hZ2UKKyMgK1ZlcnNpb246IEd1QyBBUEkvQVBCIHZlciA3MC40NS4yIGZvciBC
YXR0bGVtYWdlCisjICAKKyMgIEZpbGU6IHhlL2JtZ19odWMuYmluCisjICBWZXJzaW9uOiBIdUMg
QVBJL0FQQiB2ZXIgOC4yLjEwIGZvciBCYXR0bGVtYWdlCisjIEBAIC01ODI1LDM0ICs1ODQyLDY0
IEBACisjICBGaWxlOiBudmlkaWEvdHUxMDIvZ3NwL2Jvb3Rsb2FkZXItNTM1LjExMy4wMS5iaW4K
KyMgIEZpbGU6IG52aWRpYS90dTEwMi9nc3AvYm9vdGVyX2xvYWQtNTM1LjExMy4wMS5iaW4KKyMg
IEZpbGU6IG52aWRpYS90dTEwMi9nc3AvYm9vdGVyX3VubG9hZC01MzUuMTEzLjAxLmJpbgorIyAr
RmlsZTogbnZpZGlhL3R1MTAyL2dzcC9ib290bG9hZGVyLTU3MC4xNDQuYmluCisjICtGaWxlOiBu
dmlkaWEvdHUxMDIvZ3NwL2Jvb3Rlcl9sb2FkLTU3MC4xNDQuYmluCisjICtGaWxlOiBudmlkaWEv
dHUxMDIvZ3NwL2Jvb3Rlcl91bmxvYWQtNTcwLjE0NC5iaW4KKyMgIExpbms6IG52aWRpYS90dTEw
NC9nc3AgLT4gLi4vdHUxMDIvZ3NwCisjICBMaW5rOiBudmlkaWEvdHUxMDYvZ3NwIC0+IC4uL3R1
MTAyL2dzcAorIyAgCisjICBGaWxlOiBudmlkaWEvdHUxMTYvZ3NwL2Jvb3Rlcl9sb2FkLTUzNS4x
MTMuMDEuYmluCisjICBGaWxlOiBudmlkaWEvdHUxMTYvZ3NwL2Jvb3Rlcl91bmxvYWQtNTM1LjEx
My4wMS5iaW4KKyMgIExpbms6IG52aWRpYS90dTExNi9nc3AvYm9vdGxvYWRlci01MzUuMTEzLjAx
LmJpbiAtPiAuLi8uLi90dTEwMi9nc3AvYm9vdGxvYWRlci01MzUuMTEzLjAxLmJpbgorIyArRmls
ZTogbnZpZGlhL3R1MTE2L2dzcC9ib290ZXJfbG9hZC01NzAuMTQ0LmJpbgorIyArRmlsZTogbnZp
ZGlhL3R1MTE2L2dzcC9ib290ZXJfdW5sb2FkLTU3MC4xNDQuYmluCisjICtMaW5rOiBudmlkaWEv
dHUxMTYvZ3NwL2Jvb3Rsb2FkZXItNTcwLjE0NC5iaW4gLT4gLi4vLi4vdHUxMDIvZ3NwL2Jvb3Rs
b2FkZXItNTcwLjE0NC5iaW4KKyMgIExpbms6IG52aWRpYS90dTExNy9nc3AgLT4gLi4vdHUxMTYv
Z3NwCisjICAKKyMgIEZpbGU6IG52aWRpYS9nYTEwMC9nc3AvYm9vdGxvYWRlci01MzUuMTEzLjAx
LmJpbgorIyAgRmlsZTogbnZpZGlhL2dhMTAwL2dzcC9ib290ZXJfbG9hZC01MzUuMTEzLjAxLmJp
bgorIyAgRmlsZTogbnZpZGlhL2dhMTAwL2dzcC9ib290ZXJfdW5sb2FkLTUzNS4xMTMuMDEuYmlu
CisjIC0KKyMgLUZpbGU6IG52aWRpYS9hZDEwMi9nc3AvYm9vdGxvYWRlci01MzUuMTEzLjAxLmJp
bgorIyAtRmlsZTogbnZpZGlhL2FkMTAyL2dzcC9ib290ZXJfbG9hZC01MzUuMTEzLjAxLmJpbgor
IyAtRmlsZTogbnZpZGlhL2FkMTAyL2dzcC9ib290ZXJfdW5sb2FkLTUzNS4xMTMuMDEuYmluCisj
IC1MaW5rOiBudmlkaWEvYWQxMDMvZ3NwIC0+IC4uL2FkMTAyL2dzcAorIyAtTGluazogbnZpZGlh
L2FkMTA0L2dzcCAtPiAuLi9hZDEwMi9nc3AKKyMgLUxpbms6IG52aWRpYS9hZDEwNi9nc3AgLT4g
Li4vYWQxMDIvZ3NwCisjIC1MaW5rOiBudmlkaWEvYWQxMDcvZ3NwIC0+IC4uL2FkMTAyL2dzcAor
IyArRmlsZTogbnZpZGlhL2dhMTAwL2dzcC9ib290bG9hZGVyLTU3MC4xNDQuYmluCisjICtGaWxl
OiBudmlkaWEvZ2ExMDAvZ3NwL2Jvb3Rlcl9sb2FkLTU3MC4xNDQuYmluCisjICtGaWxlOiBudmlk
aWEvZ2ExMDAvZ3NwL2Jvb3Rlcl91bmxvYWQtNTcwLjE0NC5iaW4KKyMgIAorIyAgRmlsZTogbnZp
ZGlhL2dhMTAyL2dzcC9ib290bG9hZGVyLTUzNS4xMTMuMDEuYmluCisjICBGaWxlOiBudmlkaWEv
Z2ExMDIvZ3NwL2Jvb3Rlcl9sb2FkLTUzNS4xMTMuMDEuYmluCisjICBGaWxlOiBudmlkaWEvZ2Ex
MDIvZ3NwL2Jvb3Rlcl91bmxvYWQtNTM1LjExMy4wMS5iaW4KKyMgK0ZpbGU6IG52aWRpYS9nYTEw
Mi9nc3AvYm9vdGxvYWRlci01NzAuMTQ0LmJpbgorIyArRmlsZTogbnZpZGlhL2dhMTAyL2dzcC9i
b290ZXJfbG9hZC01NzAuMTQ0LmJpbgorIyArRmlsZTogbnZpZGlhL2dhMTAyL2dzcC9ib290ZXJf
dW5sb2FkLTU3MC4xNDQuYmluCisjICBMaW5rOiBudmlkaWEvZ2ExMDMvZ3NwIC0+IC4uL2dhMTAy
L2dzcAorIyAgTGluazogbnZpZGlhL2dhMTA0L2dzcCAtPiAuLi9nYTEwMi9nc3AKKyMgIExpbms6
IG52aWRpYS9nYTEwNi9nc3AgLT4gLi4vZ2ExMDIvZ3NwCisjICBMaW5rOiBudmlkaWEvZ2ExMDcv
Z3NwIC0+IC4uL2dhMTAyL2dzcAorIyAgCisjICtGaWxlOiBudmlkaWEvYWQxMDIvZ3NwL2Jvb3Rs
b2FkZXItNTM1LjExMy4wMS5iaW4KKyMgK0ZpbGU6IG52aWRpYS9hZDEwMi9nc3AvYm9vdGVyX2xv
YWQtNTM1LjExMy4wMS5iaW4KKyMgK0ZpbGU6IG52aWRpYS9hZDEwMi9nc3AvYm9vdGVyX3VubG9h
ZC01MzUuMTEzLjAxLmJpbgorIyArRmlsZTogbnZpZGlhL2FkMTAyL2dzcC9ib290bG9hZGVyLTU3
MC4xNDQuYmluCisjICtGaWxlOiBudmlkaWEvYWQxMDIvZ3NwL2Jvb3Rlcl9sb2FkLTU3MC4xNDQu
YmluCisjICtGaWxlOiBudmlkaWEvYWQxMDIvZ3NwL2Jvb3Rlcl91bmxvYWQtNTcwLjE0NC5iaW4K
KyMgK0ZpbGU6IG52aWRpYS9hZDEwMi9nc3Avc2NydWJiZXItNTcwLjE0NC5iaW4KKyMgK0xpbms6
IG52aWRpYS9hZDEwMyAtPiBhZDEwMgorIyArTGluazogbnZpZGlhL2FkMTA0IC0+IGFkMTAyCisj
ICtMaW5rOiBudmlkaWEvYWQxMDYgLT4gYWQxMDIKKyMgK0xpbms6IG52aWRpYS9hZDEwNyAtPiBh
ZDEwMgorIyArCisjICtGaWxlOiBudmlkaWEvZ2gxMDAvZ3NwL2Jvb3Rsb2FkZXItNTcwLjE0NC5i
aW4KKyMgK0ZpbGU6IG52aWRpYS9naDEwMC9nc3AvZm1jLTU3MC4xNDQuYmluCisjICsKKyMgK0Zp
bGU6IG52aWRpYS9nYjEwMC9nc3AvYm9vdGxvYWRlci01NzAuMTQ0LmJpbgorIyArRmlsZTogbnZp
ZGlhL2diMTAwL2dzcC9mbWMtNTcwLjE0NC5iaW4KKyMgK0xpbms6IG52aWRpYS9nYjEwMiAtPiBn
YjEwMAorIyArCisjICtGaWxlOiBudmlkaWEvZ2IyMDIvZ3NwL2Jvb3Rsb2FkZXItNTcwLjE0NC5i
aW4KKyMgK0ZpbGU6IG52aWRpYS9nYjIwMi9nc3AvZm1jLTU3MC4xNDQuYmluCisjICtMaW5rOiBu
dmlkaWEvZ2IyMDMgLT4gZ2IyMDIKKyMgK0xpbms6IG52aWRpYS9nYjIwNSAtPiBnYjIwMgorIyAr
TGluazogbnZpZGlhL2diMjA2IC0+IGdiMjAyCisjICtMaW5rOiBudmlkaWEvZ2IyMDcgLT4gZ2Iy
MDIKKyMgKworIyAgRmlsZTogbnZpZGlhL3R1MTAyL2dzcC9nc3AtNTM1LjExMy4wMS5iaW4KKyMg
IE9yaWdpbjogZ3NwX3R1MTB4LmJpbiBmcm9tIE5WSURJQS1MaW51eC14ODZfNjQtNTM1LjExMy4w
MS5ydW4KKyMgIExpbms6IG52aWRpYS90dTExNi9nc3AvZ3NwLTUzNS4xMTMuMDEuYmluIC0+IC4u
Ly4uL3R1MTAyL2dzcC9nc3AtNTM1LjExMy4wMS5iaW4KKyMgQEAgLTU4NjIsNiArNTkwOSwxNyBA
QAorIyAgT3JpZ2luOiBnc3BfZ2ExMHguYmluIGZyb20gTlZJRElBLUxpbnV4LXg4Nl82NC01MzUu
MTEzLjAxLnJ1bgorIyAgTGluazogbnZpZGlhL2FkMTAyL2dzcC9nc3AtNTM1LjExMy4wMS5iaW4g
LT4gLi4vLi4vZ2ExMDIvZ3NwL2dzcC01MzUuMTEzLjAxLmJpbgorIyAgCisjICtGaWxlOiBudmlk
aWEvdHUxMDIvZ3NwL2dzcC01NzAuMTQ0LmJpbgorIyArT3JpZ2luOiBnc3BfdHUxMHguYmluIGZy
b20gTlZJRElBLUxpbnV4LXg4Nl82NC01NzAuMTQ0LnJ1bgorIyArTGluazogbnZpZGlhL3R1MTE2
L2dzcC9nc3AtNTcwLjE0NC5iaW4gLT4gLi4vLi4vdHUxMDIvZ3NwL2dzcC01NzAuMTQ0LmJpbgor
IyArTGluazogbnZpZGlhL2dhMTAwL2dzcC9nc3AtNTcwLjE0NC5iaW4gLT4gLi4vLi4vdHUxMDIv
Z3NwL2dzcC01NzAuMTQ0LmJpbgorIyArCisjICtGaWxlOiBudmlkaWEvZ2ExMDIvZ3NwL2dzcC01
NzAuMTQ0LmJpbgorIyArT3JpZ2luOiBnc3BfZ2ExMHguYmluIGZyb20gTlZJRElBLUxpbnV4LXg4
Nl82NC01NzAuMTQ0LnJ1bgorIyArTGluazogbnZpZGlhL2FkMTAyL2dzcC9nc3AtNTcwLjE0NC5i
aW4gLT4gLi4vLi4vZ2ExMDIvZ3NwL2dzcC01NzAuMTQ0LmJpbgorIyArTGluazogbnZpZGlhL2do
MTAwL2dzcC9nc3AtNTcwLjE0NC5iaW4gLT4gLi4vLi4vZ2ExMDIvZ3NwL2dzcC01NzAuMTQ0LmJp
bgorIyArTGluazogbnZpZGlhL2diMTAwL2dzcC9nc3AtNTcwLjE0NC5iaW4gLT4gLi4vLi4vZ2Ex
MDIvZ3NwL2dzcC01NzAuMTQ0LmJpbgorIyArTGluazogbnZpZGlhL2diMjAyL2dzcC9nc3AtNTcw
LjE0NC5iaW4gLT4gLi4vLi4vZ2ExMDIvZ3NwL2dzcC01NzAuMTQ0LmJpbgorIyAgTGljZW5jZTog
UmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5udmlkaWEgZm9yIGRldGFpbHMKKyMgIAorIyAg
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KKyMgQEAgLTU5MjEsNiArNTk3OSwxNSBAQAorIyAgRmlsZTogbWVk
aWF0ZWsvbXQ4MTczL3ZwdV9wLmJpbgorIyAgTGluazogdnB1X2QuYmluIC0+IG1lZGlhdGVrL210
ODE3My92cHVfZC5iaW4KKyMgIExpbms6IHZwdV9wLmJpbiAtPiBtZWRpYXRlay9tdDgxNzMvdnB1
X3AuYmluCisjICsKKyMgK0xpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UubWVk
aWF0ZWsgZm9yIGRldGFpbHMuCisjICsKKyMgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICsKKyMgK0Ry
aXZlcjogbXQ4MTk2IC0gTWVkaWFUZWsgTVQ4MTk2IFZpZGVvIENvbnRyb2xsZXIgUHJvY2Vzc29y
CisjICsKKyMgK0ZpbGU6IG1lZGlhdGVrL210ODE5Ni92Y3AuaW1nCisjICtWZXJzaW9uOiB2MS4w
LjAKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5tZWRpYXRl
ayBmb3IgZGV0YWlscy4KKyMgIAorIyBAQCAtNjExOSw5ICs2MTg2LDkgQEAKKyMgIERyaXZlcjog
bXQ3OTIxIC0gTWVkaWFUZWsgTVQ3OTIxIFdpcmVsZXNzIE1BQ3MKKyMgIAorIyAgRmlsZTogbWVk
aWF0ZWsvV0lGSV9NVDc5NjFfcGF0Y2hfbWN1XzFfMl9oZHIuYmluCisjIC1WZXJzaW9uOiAyMDI0
MTEwNjE1MTAwN2EKKyMgK1ZlcnNpb246IDIwMjUwNTIzMTEwOTQ2YQorIyAgRmlsZTogbWVkaWF0
ZWsvV0lGSV9SQU1fQ09ERV9NVDc5NjFfMS5iaW4KKyMgLVZlcnNpb246IDIwMjQxMTA2MTUwODU1
CisjICtWZXJzaW9uOiAyMDI1MDUyMzExMDgwNworIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1
dGFibGUuIFNlZSBMSUNFTkNFLm1lZGlhdGVrIGZvciBkZXRhaWxzLgorIyAgCisjIEBAIC02MTMw
LDcgKzYxOTcsNyBAQAorIyAgRHJpdmVyOiBtdDc5MjEgLSBNZWRpYVRlayBNVDc5MjEgYmx1ZXRv
b3RoIGNoaXBzZXQKKyMgIAorIyAgRmlsZTogbWVkaWF0ZWsvQlRfUkFNX0NPREVfTVQ3OTYxXzFf
Ml9oZHIuYmluCisjIC1WZXJzaW9uOiAyMDI0MTEwNjE1MTQxNAorIyArVmVyc2lvbjogMjAyNTA1
MjMxMTEzMzMKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5t
ZWRpYXRlayBmb3IgZGV0YWlscy4KKyMgIAorIyBAQCAtNjEzOSw5ICs2MjA2LDkgQEAKKyMgIERy
aXZlcjogbXQ3OTIyIC0gTWVkaWFUZWsgTVQ3OTIyIFdpcmVsZXNzIE1BQ3MKKyMgIAorIyAgRmls
ZTogbWVkaWF0ZWsvV0lGSV9NVDc5MjJfcGF0Y2hfbWN1XzFfMV9oZHIuYmluCisjIC1WZXJzaW9u
OiAyMDI0MTEwNjE2MzIyOGEKKyMgK1ZlcnNpb246IDIwMjUwNTIzMTAzMTUwYQorIyAgRmlsZTog
bWVkaWF0ZWsvV0lGSV9SQU1fQ09ERV9NVDc5MjJfMS5iaW4KKyMgLVZlcnNpb246IDIwMjQxMTA2
MTYzMTU2CisjICtWZXJzaW9uOiAyMDI1MDUyMzEwMzEwNgorIyAgCisjICBMaWNlbmNlOiBSZWRp
c3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLm1lZGlhdGVrIGZvciBkZXRhaWxzLgorIyAgCisjIEBA
IC02MTUwLDcgKzYyMTcsNyBAQAorIyAgRHJpdmVyOiBtdDc5MjIgLSBNZWRpYVRlayBNVDc5MjIg
Ymx1ZXRvb3RoIGNoaXBzZXQKKyMgIAorIyAgRmlsZTogbWVkaWF0ZWsvQlRfUkFNX0NPREVfTVQ3
OTIyXzFfMV9oZHIuYmluCisjIC1WZXJzaW9uOiAyMDI0MTEwNjE2MzUxMgorIyArVmVyc2lvbjog
MjAyNTA1MjMxMDM0MzgKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElD
RU5DRS5tZWRpYXRlayBmb3IgZGV0YWlscy4KKyMgIAorIyBAQCAtNjE1OSw5ICs2MjI2LDkgQEAK
KyMgIERyaXZlcjogbXQ3OTI1IC0gTWVkaWFUZWsgTVQ3OTI1IFdpcmVsZXNzIE1BQ3MKKyMgIAor
IyAgRmlsZTogbWVkaWF0ZWsvbXQ3OTI1L1dJRklfTVQ3OTI1X1BBVENIX01DVV8xXzFfaGRyLmJp
bgorIyAtVmVyc2lvbjogMjAyNTA0MjUwNzI5NTVhCisjICtWZXJzaW9uOiAyMDI1MDUyNjE1Mjk0
N2EKKyMgIEZpbGU6IG1lZGlhdGVrL210NzkyNS9XSUZJX1JBTV9DT0RFX01UNzkyNV8xXzEuYmlu
CisjIC1WZXJzaW9uOiAyMDI1MDQyNTA3MjgwMQorIyArVmVyc2lvbjogMjAyNTA1MjYxNTI4MDgK
KyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5tZWRpYXRlayBm
b3IgZGV0YWlscy4KKyMgIAorIyBAQCAtNjE3MCw3ICs2MjM3LDcgQEAKKyMgIERyaXZlcjogbXQ3
OTI1IC0gTWVkaWFUZWsgTVQ3OTI1IGJsdWV0b290aCBjaGlwc2V0CisjICAKKyMgIEZpbGU6IG1l
ZGlhdGVrL210NzkyNS9CVF9SQU1fQ09ERV9NVDc5MjVfMV8xX2hkci5iaW4KKyMgLVZlcnNpb246
IDIwMjUwNDI1MDczMzMwCisjICtWZXJzaW9uOiAyMDI1MDUyNjE1MzIwMworIyAgCisjICBMaWNl
bmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLm1lZGlhdGVrIGZvciBkZXRhaWxzLgor
IyAgCisjIEBAIC02NTg4LDExICs2NjU1LDEzIEBACisjICBSYXdGaWxlOiBxY29tL3NjODI4MHhw
L0xFTk9WTy8yMUJYL2JhdHRtZ3IuanNuCisjICBSYXdGaWxlOiBxY29tL3NjODI4MHhwL0xFTk9W
Ty8yMUJYL2Nkc3ByLmpzbgorIyAgRmlsZTogcWNvbS9zYzgyODB4cC9MRU5PVk8vMjFCWC9xY2Fk
c3A4MjgwLm1ibgorIyAtVmVyc2lvbjogQURTUC5IVC41LjYtMDA3MjktTUFLRU5BLTEKKyMgK1Zl
cnNpb246IEFEU1AuSFQuNS42LmMyLTAwMDEzLU1BS0VOQS0xLjc1NTQyLjQKKyMgIEZpbGU6IHFj
b20vc2M4MjgweHAvTEVOT1ZPLzIxQlgvcWNjZHNwODI4MC5tYm4KKyMgLVZlcnNpb246IENEU1Au
SFQuMi42LTAwNjk4LU1BS0VOQS0xCisjICtWZXJzaW9uOiBDRFNQLkhULjIuNi0wMDczNS40LU1B
S0VOQS0xCisjICBGaWxlOiBxY29tL3NjODI4MHhwL0xFTk9WTy8yMUJYL3Fjc2xwaTgyODAubWJu
CisjIC1WZXJzaW9uOiBTTFBJLkhZLjQuMS0wMDA0OC1NQUtFTkEtMQorIyArVmVyc2lvbjogU0xQ
SS5IWS40LjEtMDAwNjEtTUFLRU5BLTEKKyMgK0ZpbGU6IHFjb20vc2M4MjgweHAvTEVOT1ZPLzIx
QlgvcWN2c3M4MjgwLm1ibgorIyArVmVyc2lvbjogdmlkZW8tZmlybXdhcmUuMS4xLWIxNTgwODcx
NDAzNTU4ODNkYzQwYjAwNDAzMjg1NmE4ZmViNWQ1NjUKKyMgIEZpbGU6IHFjb20veDFlODAxMDAv
TEVOT1ZPLzIxTjEvcWN2c3M4MzgwLm1ibgorIyAgVmVyc2lvbjogdmZ3LTMuMTpyZWwwMDg1LTA3
MGZhMzMxMWQ5ZWY5NjgwMTVmZWU3ZmVhMDcxOThkN2ViMjA4YTEKKyMgIEZpbGU6IHFjb20veDFl
ODAxMDAvYWRzcC5tYm4KKyMgQEAgLTY4NjUsMTQgKzY5MzQsMTQgQEAKKyMgIAorIyAgRHJpdmVy
OiBpY2UgLSBJbnRlbChSKSBFdGhlcm5ldCBDb25uZWN0aW9uIEU4MDAgU2VyaWVzCisjICAKKyMg
LUZpbGU6IGludGVsL2ljZS9kZHAvaWNlLTEuMy40MS4wLnBrZworIyAtTGluazogaW50ZWwvaWNl
L2RkcC9pY2UucGtnIC0+IGljZS0xLjMuNDEuMC5wa2cKKyMgK0ZpbGU6IGludGVsL2ljZS9kZHAv
aWNlLTEuMy40My4wLnBrZworIyArTGluazogaW50ZWwvaWNlL2RkcC9pY2UucGtnIC0+IGljZS0x
LjMuNDMuMC5wa2cKKyMgIEZpbGU6IGludGVsL2ljZS9kZHAtbGFnL2ljZV9sYWctMS4zLjEuMC5w
a2cKKyMgIAorIyAgTGljZW5zZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5pY2UgZm9y
IGRldGFpbHMKKyMgIAorIyAtRmlsZTogaW50ZWwvaWNlL2RkcC1jb21tcy9pY2VfY29tbXMtMS4z
LjUyLjAucGtnCisjIC1GaWxlOiBpbnRlbC9pY2UvZGRwLXdpcmVsZXNzX2VkZ2UvaWNlX3dpcmVs
ZXNzX2VkZ2UtMS4zLjIwLjAucGtnCisjICtGaWxlOiBpbnRlbC9pY2UvZGRwLWNvbW1zL2ljZV9j
b21tcy0xLjMuNTUuMC5wa2cKKyMgK0ZpbGU6IGludGVsL2ljZS9kZHAtd2lyZWxlc3NfZWRnZS9p
Y2Vfd2lyZWxlc3NfZWRnZS0xLjMuMjMuMC5wa2cKKyMgIAorIyAgTGljZW5zZTogUmVkaXN0cmli
dXRhYmxlLiBTZWUgTElDRU5TRS5pY2VfZW5oYW5jZWQgZm9yIGRldGFpbHMKKyMgIAorIyBAQCAt
NjkzNCw5ICs3MDAzLDE3IEBACisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAKKyMgLURy
aXZlcjogd2F2ZTUgLSBDaGlwcyZNZWRpYSwgSW5jLiB2aWRlbyBjb2RlYyBkcml2ZXIKKyMgK0Ry
aXZlcjogd2F2ZTUgLSBDaGlwcyZNZWRpYSwgSW5jLiBXYXZlNSB2aWRlbyBjb2RlYyBkcml2ZXIK
KyMgIAorIyAgRmlsZTogY25tL3dhdmU1MjFjX2szX2NvZGVjX2Z3LmJpbgorIyArCisjICtMaWNl
bmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLmNubSBmb3IgZGV0YWlscy4KKyMgKwor
IyArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgKworIyArRHJpdmVyOiB3YXZlNiAtIENoaXBzJk1lZGlh
LCBJbmMuIFdhdmU2IHZpZGVvIGNvZGVjIGRyaXZlcgorIyArCisjICtGaWxlOiBjbm0vd2F2ZTYz
M2NfaW14OV9jb2RlY19mdy5iaW4KKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBT
ZWUgTElDRU5DRS5jbm0gZm9yIGRldGFpbHMuCisjICAKKyMgQEAgLTc0NTgsMTEgKzc1MzUsMTEg
QEAKKyMgIExpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzFkMWYtc3BraWQx
LWwwLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzE1MDMtc3BraWQxLWwwLmJpbgor
IyAgTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMWQxZi1zcGtpZDEtcjAu
YmluIC0+IGNzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMTUwMy1zcGtpZDEtcjAuYmluCisjICBM
aW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMxYjkzLndtZncgLT4gY3MzNWw0
MS92Ni42MS4xL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuNjMuMS53bWZ3CisjIC1MaW5rOiBjaXJy
dXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMxYTIwLndtZncgLT4gY3MzNWw0MS92Ni42MS4x
L2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuNjMuMS53bWZ3CisjIC1MaW5rOiBjaXJydXMvY3MzNWw0
MS1kc3AxLXNway1wcm90LTEwNDMxYTMwLndtZncgLT4gY3MzNWw0MS92Ni42MS4xL2hhbG9fY3Nw
bF9SQU1fcmV2QjJfMjkuNjMuMS53bWZ3CisjIC1MaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNw
ay1wcm90LTEwNDMxYTQwLndtZncgLT4gY3MzNWw0MS92Ni42MS4xL2hhbG9fY3NwbF9SQU1fcmV2
QjJfMjkuNjMuMS53bWZ3CisjIC1MaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEw
NDMxYTUwLndtZncgLT4gY3MzNWw0MS92Ni42MS4xL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuNjMu
MS53bWZ3CisjIC1MaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMxYTYwLndt
ZncgLT4gY3MzNWw0MS92Ni42MS4xL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuNjMuMS53bWZ3Cisj
ICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMzYTIwLndtZncgLT4gY3Mz
NWw0MS92Ni42MS4xL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuNjMuMS53bWZ3CisjICtMaW5rOiBj
aXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMzYTMwLndtZncgLT4gY3MzNWw0MS92Ni42
MS4xL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuNjMuMS53bWZ3CisjICtMaW5rOiBjaXJydXMvY3Mz
NWw0MS1kc3AxLXNway1wcm90LTEwNDMzYTQwLndtZncgLT4gY3MzNWw0MS92Ni42MS4xL2hhbG9f
Y3NwbF9SQU1fcmV2QjJfMjkuNjMuMS53bWZ3CisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3Ax
LXNway1wcm90LTEwNDMzYTUwLndtZncgLT4gY3MzNWw0MS92Ni42MS4xL2hhbG9fY3NwbF9SQU1f
cmV2QjJfMjkuNjMuMS53bWZ3CisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90
LTEwNDMzYTYwLndtZncgLT4gY3MzNWw0MS92Ni42MS4xL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjku
NjMuMS53bWZ3CisjICBGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMxYjkz
LXNwa2lkMC1sMC5iaW4KKyMgIEZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0
MzFiOTMtc3BraWQwLXIwLmJpbgorIyAgRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJv
dC0xMDQzMWI5My1zcGtpZDEtbDAuYmluCisjIEBAIC03NjY3LDYgKzc3NDQsOSBAQAorIyAgTGlu
azogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzM2Q4OC1zcGtpZDAtcjAuYmluY2Zn
IC0+IGNzMzVsNDEvYmluY2Zncy9jczM1bDQxLWRzcDEtMTRfNWRCLmJpbmNmZworIyAgTGluazog
Y2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzM2Q4OC1zcGtpZDEtbDAuYmluY2ZnIC0+
IGNzMzVsNDEvYmluY2Zncy9jczM1bDQxLWRzcDEtMTRfNWRCLmJpbmNmZworIyAgTGluazogY2ly
cnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzM2Q4OC1zcGtpZDEtcjAuYmluY2ZnIC0+IGNz
MzVsNDEvYmluY2Zncy9jczM1bDQxLWRzcDEtMTRfNWRCLmJpbmNmZworIyArTGluazogY2lycnVz
L2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzODhmNC53bWZ3IC0+IGNzMzVsNDEvdjYuODMuMC9o
YWxvX2NzcGxfUkFNX3JldkIyXzI5Ljg1LjAud21mdworIyArRmlsZTogY2lycnVzL2NzMzVsNDEt
ZHNwMS1zcGstcHJvdC0xMDQzODhmNC1zcGtpZDAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0
MS1kc3AxLXNway1wcm90LTEwNDM4OGY0LXNwa2lkMS5iaW4KKyMgIExpbms6IGNpcnJ1cy9jczM1
bDQxLWRzcDEtc3BrLXByb3QtMTdhYTIzMTYud21mdyAtPiBjczM1bDQxL3Y2LjYxLjEvaGFsb19j
c3BsX1JBTV9yZXZCMl8yOS42My4xLndtZncKKyMgIExpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEt
c3BrLXByb3QtMTdhYTIzMTcud21mdyAtPiBjczM1bDQxL3Y2LjYxLjEvaGFsb19jc3BsX1JBTV9y
ZXZCMl8yOS42My4xLndtZncKKyMgIEZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3Qt
MTdhYTIzMTYtc3BraWQwLWwwLmJpbgorIyBAQCAtNzg2MSwxMSArNzk0MSwyNiBAQAorIyAgTGlu
azogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGNkZi1zcGtpZDEtcjAuYmluIC0+
IGNzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGNkZi1zcGtpZDEtbDAuYmluCisjICBMaW5rOiBj
aXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4Y2UwLXNwa2lkMS1sMC5iaW4gLT4gY3Mz
NWw0MS1kc3AxLXNway1wcm90LTEwM2M4Y2RmLXNwa2lkMS1sMC5iaW4KKyMgIExpbms6IGNpcnJ1
cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhjZTAtc3BraWQxLXIwLmJpbiAtPiBjczM1bDQx
LWRzcDEtc3BrLXByb3QtMTAzYzhjZGYtc3BraWQxLWwwLmJpbgorIyArTGluazogY2lycnVzL2Nz
MzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGUzYS53bWZ3IC0+IGNzMzVsNDEvdjYuODMuMC9oYWxv
X2NzcGxfUkFNX3JldkIyXzI5Ljg1LjAud21mdworIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNw
MS1zcGstcHJvdC0xMDNjOGUzYi53bWZ3IC0+IGNzMzVsNDEvdjYuODMuMC9oYWxvX2NzcGxfUkFN
X3JldkIyXzI5Ljg1LjAud21mdworIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJv
dC0xMDNjOGUzYS1zcGtpZDAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1w
cm90LTEwM2M4ZTNhLXNwa2lkMS5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3Br
LXByb3QtMTAzYzhlM2Itc3BraWQwLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhl
M2Etc3BraWQwLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNj
OGUzYi1zcGtpZDEuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGUzYS1zcGtpZDEu
YmluCisjICBMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTFmNjYwMTA1LndtZncg
LT4gY3MzNWw0MS92Ni44My4wL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuODUuMC53bWZ3CisjICBG
aWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTFmNjYwMTA1LmJpbgorIyAgRmlsZTog
Y2lycnVzL2NzMzVsNDEvdjYuNTEuMC9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjUzLjAud21mdwor
IyAgTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC12bHYxNzc2LndtZncgLT4gY3Mz
NWw0MS92Ni41MS4wL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuNTMuMC53bWZ3CisjICBGaWxlOiBj
aXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LXZsdjE3NzYuYmluCisjICtMaW5rOiBjaXJydXMv
Y3MzNWw0MS1kc3AxLXNway1wcm90LTEwMjUxODJjLndtZncgLT4gY3MzNWw0MS92Ni44My4wL2hh
bG9fY3NwbF9SQU1fcmV2QjJfMjkuODUuMC53bWZ3CisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1k
c3AxLXNway1wcm90LTEwMjUxODI2LndtZncgLT4gY3MzNWw0MS92Ni44My4wL2hhbG9fY3NwbF9S
QU1fcmV2QjJfMjkuODUuMC53bWZ3CisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1w
cm90LTEwMjUxODQ0LndtZncgLT4gY3MzNWw0MS92Ni44My4wL2hhbG9fY3NwbF9SQU1fcmV2QjJf
MjkuODUuMC53bWZ3CisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwMjUx
ODJjLWwwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDI1MTgy
Yy1yMC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTAyNTE4MjYt
bDAuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDI1MTgyYy1sMC5iaW4KKyMgK0xpbms6
IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTAyNTE4MjYtcjAuYmluIC0+IGNzMzVsNDEt
ZHNwMS1zcGstcHJvdC0xMDI1MTgyYy1yMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRz
cDEtc3BrLXByb3QtMTAyNTE4NDQtbDAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3Ax
LXNway1wcm90LTEwMjUxODQ0LXIwLmJpbgorIyAgCisjICBMaWNlbnNlOiBSZWRpc3RyaWJ1dGFi
bGUuIFNlZSBMSUNFTlNFLmNpcnJ1cyBmb3IgZGV0YWlscy4KKyMgIAorIyBAQCAtODI4OSw2ICs4
Mzg0LDkgQEAKKyMgIEZpbGU6IHBvd2VydnIvcm9ndWVfMzMuMTUuMTEuM192MS5mdworIyAgVmVy
c2lvbjogMS4wLk9TQDY1MDM3MjUKKyMgIAorIyArRmlsZTogcG93ZXJ2ci9yb2d1ZV8zNi41My4x
MDQuNzk2X3YxLmZ3CisjICtWZXJzaW9uOiAxLjAuT1NANjczNDM1OAorIyArCisjICBMaWNlbnNl
OiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLnBvd2VydnIgZm9yIGRldGFpbHMKKyMgIAor
IyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgQEAgLTg1NDMsMTEgKzg2NDEsMTEgQEAKKyMgIERyaXZl
cjogaW50ZWxfdnB1IC0tIEludGVsIE5QVSBkcml2ZXIKKyMgIAorIyAgRmlsZTogaW50ZWwvdnB1
L3ZwdV8zN3h4X3YxLmJpbgorIyAtVmVyc2lvbjogY2lfdGFnX3VkMjAyNTEyX3ZwdV9yY18yMDI1
MDMwNl8xMTMwCisjICtWZXJzaW9uOiBjaV90YWdfdWQyMDI1MThfdnB1X3JjXzIwMjUwNDE1XzE5
MDAKKyMgIExpbms6IGludGVsL3ZwdS92cHVfMzd4eF92MC4wLmJpbiAtPiB2cHVfMzd4eF92MS5i
aW4KKyMgIAorIyAgRmlsZTogaW50ZWwvdnB1L3ZwdV80MHh4X3YxLmJpbgorIyAtVmVyc2lvbjog
Y2lfdGFnX3VkMjAyNTEyX3ZwdV9yY18yMDI1MDMwNl8xMTMwCisjICtWZXJzaW9uOiBjaV90YWdf
dWQyMDI1MThfdnB1X3JjXzIwMjUwNDE1XzE5MDAKKyMgIExpbms6IGludGVsL3ZwdS92cHVfNDB4
eF92MC4wLmJpbiAtPiB2cHVfNDB4eF92MS5iaW4KKyMgIAorIyAgTGljZW5zZTogUmVkaXN0cmli
dXRhYmxlLiBTZWUgTElDRU5TRS5pbnRlbF92cHUgZm9yIGRldGFpbHMKKyMgQEAgLTg1NjMsNyAr
ODY2MSw5IEBACisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisjIC1Ecml2ZXI6IHFj
czkxMDAgLSBRdWFsY29tbSBRVVB2MyBmaXJtd2FyZSBpbWFnZSBmaWxlCisjICtEcml2ZXI6IHFj
b20tZ2VuaS1zZSAtIFF1YWxjb21tIFFVUHYzIGZpcm13YXJlIGltYWdlIGZpbGUKKyMgIEZpbGU6
IHFjb20vc2E4Nzc1cC9xdXB2M2Z3LmVsZgorIyArRmlsZTogcWNvbS9xY202NDkwL3F1cHYzZncu
ZWxmCisjICtGaWxlOiBxY29tL3FjczgzMDAvcXVwdjNmdy5lbGYKKyMgIAorIyAgTGljZW5zZTog
UmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5xY29tIGFuZCBxY29tL05PVElDRS50eHQgZm9y
IGRldGFpbHMKKyMgCisjCisKIFNVTU1BUlkgPSAiRmlybXdhcmUgZmlsZXMgZm9yIHVzZSB3aXRo
IExpbnV4IGtlcm5lbCIKIEhPTUVQQUdFID0gImh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvIgogREVT
Q1JJUFRJT04gPSAiTGludXggZmlybXdhcmUgaXMgYSBwYWNrYWdlIGRpc3RyaWJ1dGVkIGFsb25n
c2lkZSB0aGUgTGludXgga2VybmVsIFwKQEAgLTk3LDcgKzgwNCw3IEBAIExJQ19GSUxFU19DSEtT
VU0gPSAiZmlsZTovL0xJQ0VOQ0UuQWJpbGlzO21kNT1iNWVlM2Y0MTA3ODBlNTY3MTFhZDQ4ZWFk
YzIyYjhiYyBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTkNFLmNhdml1bTttZDU9
YzM3YWFmZmIxZWJlNTkzOWIyNTgwZDA3M2E5NWRhZWEgXAogICAgICAgICAgICAgICAgICAgICBm
aWxlOi8vTElDRU5DRS5jaGVsc2lvX2Zpcm13YXJlO21kNT04MTlhYThjM2ZhNDUzZjFiMjU4ZWQ4
ZDE2OGE5ZDkwMyBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTlNFLmNpcnJ1cztt
ZDU9NjYyZWEyYzFhODg4OGY3ZDc5ZWQ3ZjI3YzI3NDcyZTEgXAotICAgICAgICAgICAgICAgICAg
ICBmaWxlOi8vTElDRU5DRS5jbm07bWQ1PTkzYjY3ZTZiYWM3ZjhmZWMyMmI5NmI4YWQwYTFhOWQw
IFwKKyAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOQ0UuY25tO21kNT1kZjM5OTIwMDY2
MjFiNzk3ZTM2ZGU0M2YzNjMzNmUzNiBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNF
TkNFLmN3MTIwMDttZDU9ZjBmNzcwODY0ZTdhODQ0NGE1YzVhYTlkMTJhM2E3ZWQgXAogICAgICAg
ICAgICAgICAgICAgICBmaWxlOi8vTElDRU5DRS5jeXByZXNzO21kNT00OGNkOTQzNmM3NjNiZjg3
Mzk2MWY5ZWQ3YjVjMTQ3YiBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTlNFLmRp
YjA3MDA7bWQ1PWY3NDExODI1YzhhNTU1YTFhM2U1ZWFiOWNhNzczNDMxIFwKQEAgLTE1Niw3ICs4
NjMsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTkNFLkFiaWxpczttZDU9YjVl
ZTNmNDEwNzgwZTU2NzExYWQ0OGVhZGMyMmI4YmMgXAogICAgICAgICAgICAgICAgICAgICBmaWxl
Oi8vTElDRU5DRS54YzUwMDA7bWQ1PTFlMTcwYzEzMTc1MzIzYzMyYzdmNGQwOTk4ZDUzZjY2IFwK
ICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOQ0UueGM1MDAwYzttZDU9MTJiMDJlZmEz
MDQ5ZGI2NWQ1MjRhZWI0MThkZDg3Y2EgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vd2Z4
L0xJQ0VOQ0Uud2YyMDA7bWQ1PTRkMWJlZmYwMGQ5MDJjMDVjOWM3ZTk1YTVkOGViNTJkIFwKLSAg
ICAgICAgICAgICAgICAgICAgZmlsZTovL1dIRU5DRTttZDU9JHtXSEVOQ0VfQ0hLU1VNfSBcCisg
ICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9XSEVOQ0U7bWQ1PTEzMWVmYTJiMmJhYjMxN2Y1MmIw
ODE3MTkyMjVkZDY0IFwKICAgICAgICAgICAgICAgICAgICAgIgogIyBXSEVOQ0UgY2hlY2tzdW0g
aXMgZGVmaW5lZCBzZXBhcmF0ZWx5IHRvIGVhc2Ugb3ZlcnJpZGluZyBpdCBpZgogIyBjbGFzcy1k
ZXZ1cHN0cmVhbSBpcyBzZWxlY3RlZC4KQEAgLTI1MCw3ICs5NTcsNyBAQCBTUkNfVVJJOmNsYXNz
LWRldnVwc3RyZWFtID0gImdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC9maXJtdwogIyBQaW4gdGhpcyB0byB0aGUgMjAyMjA1MDkgcmVsZWFzZSwgb3ZlcnJpZGUg
dGhpcyBpbiBsb2NhbC5jb25mCiBTUkNSRVY6Y2xhc3MtZGV2dXBzdHJlYW0gPz0gImIxOWNiZGNh
NzhhYjJhZGZkMjEwYzkxYmUxNWEyMjU2OGU4YjhjYWUiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9
ICJmMmM2MGQ2NmYyMjZhMjgxMzBjYjU2NDNlNmU1NDRkMzIyOTY3MzQ2MGUxMjdjOTFiYTAzZjEw
ODBjYmQ3MDNlIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImQ0MDc0MzMzN2NhOGJmOWQyNTg3ZTIy
MGFiMzBkZWM2YTA3YjUyY2M1Y2I0YTRmZjhkOTJiZTE0MzkxYTdmZGUiCiAKIGluaGVyaXQgYWxs
YXJjaAogCi0tIAoyLjQ3LjEKCg==

--===============8773685655116442904==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/linux-firmware: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware: SRC_URI changed from "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20250509.tar.xz" to "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20250613.tar.xz"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-aldebaran: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-aldebaran: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-carrizo: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-carrizo: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-cezanne: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-cezanne: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-fiji: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-fiji: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-hawaii: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-hawaii: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-misc: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-misc: PKGSIZE changed from 57809476 to 57824324 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-misc: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi10: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi10: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi14: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi14: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi21: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi21: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi22: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi22: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi23: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi23: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi24: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi24: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi31: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi31: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi32: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-navi32: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-oland: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-oland: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-polaris10: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-polaris10: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-polaris11: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-polaris11: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-polaris12: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-polaris12: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-raven: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-raven: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-rembrandt: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-rembrandt: PKGSIZE changed from 2749584 to 2749712 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-rembrandt: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-renoir: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-renoir: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-stoney: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-stoney: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-tonga: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-tonga: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-topaz: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-topaz: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-vega10: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-vega10: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-vega12: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-vega12: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ar5523: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar5523: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-misc: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-misc: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca4019: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca4019: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca6174: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca6174: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca9377: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca9377: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca9887: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca9887: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca9888: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca9888: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca988x: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca988x: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca9984: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca9984: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca99x0: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-qca99x0: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-wcn3990: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-wcn3990: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-ipq5018: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-ipq5018: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-ipq6018: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-ipq6018: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-ipq8074: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-ipq8074: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-misc: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-misc: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qca2066: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qca2066: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qca6390: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qca6390: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qca6698aq: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qca6698aq: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qcn9074: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-qcn9074: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-wcn6750: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-wcn6750: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-wcn6855: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k-wcn6855: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k-misc: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k-misc: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k-qcn9274: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k-qcn9274: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k-wcn7850: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k-wcn7850: PKGSIZE changed from 8512227 to 8508131 (-0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k-wcn7850: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PKGSIZE changed from 429406 to 429435 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: FILELIST: added "/usr/lib/firmware/brcm/brcmfmac43430-sdio.friendlyarm,nanopi-neo4.txt"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PKGSIZE changed from 660546 to 660579 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: FILELIST: added "/usr/lib/firmware/brcm/brcmfmac43455-sdio.brcmfmac43455-sdio.khadas,vim.txt"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PKGSIZE changed from 588799 to 588828 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: FILELIST: added "/usr/lib/firmware/brcm/brcmfmac4356-sdio.friendlyarm,nanopc-t4.txt"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2x: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2x: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-cc33xx: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cc33xx: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: PKGSIZE changed from 3793993 to 3834861 (+1%)
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: FILELIST: removed "/usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431a30.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431a20.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431a40.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431a60.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431a50.wmfw", added "/usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104388f4-spkid0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104388f4-spkid1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e3a-spkid0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e3a-spkid1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e3b-spkid0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e3b-spkid1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-1025182c.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104388f4.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e3a.wmfw /usr/lib/firmware/
 cirrus/cs35l41-dsp1-spk-prot-103c8e3b.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a60.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a20.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a30.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a40.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a50.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10251826.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10251826-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-1025182c-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10251844-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10251826-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10251844-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-1025182c-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10251844.wmfw"
packages/all-poky-linux/linux-firmware/linux-firmware-cnm-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cnm-license: PKGSIZE changed from 1171 to 2055 (+75%)
packages/all-poky-linux/linux-firmware/linux-firmware-cnm-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-cnm: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cnm: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PKGSIZE changed from 2601478 to 2601550 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-18: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-18: PKGSIZE changed from 2601478 to 2601622 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-18: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PKGSIZE changed from 2400947 to 2401699 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGSIZE changed from 28436590 to 28274042 (-1%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced: FILELIST: removed "/usr/lib/firmware/intel/ice/ddp-comms/ice_comms-1.3.52.0.pkg /usr/lib/firmware/intel/ice/ddp-wireless_edge/ice_wireless_edge-1.3.20.0.pkg", added "/usr/lib/firmware/intel/ice/ddp-comms/ice_comms-1.3.55.0.pkg /usr/lib/firmware/intel/ice/ddp-wireless_edge/ice_wireless_edge-1.3.23.0.pkg"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ice: FILELIST: removed "/usr/lib/firmware/intel/ice/ddp/ice-1.3.41.0.pkg", added "/usr/lib/firmware/intel/ice/ddp/ice-1.3.43.0.pkg"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PKGSIZE changed from 1036772 to 1036312 (-0%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PKGSIZE changed from 4876980 to 4874060 (-0%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PKGSIZE changed from 4877412 to 4873308 (-0%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9260: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9260: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PKGSIZE changed from 200009536 to 200014220 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-linaro-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-linaro-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-mali-csffw-arch108: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mali-csffw-arch108: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-mali-csffw-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mali-csffw-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek: PKGSIZE changed from 46379319 to 52282983 (+13%)
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek: FILELIST: added "/usr/lib/firmware/mediatek/mt8196/vcp.img"
packages/all-poky-linux/linux-firmware/linux-firmware-mellanox: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mellanox: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-microchip-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-microchip-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-microchip: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-microchip: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-moxa-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-moxa-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-moxa: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-moxa: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7650: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7650: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x2: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x2: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PKGSIZE changed from 65118512 to 158944388 (+144%)
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: FILELIST: added "/usr/lib/firmware/nvidia/tu102/gsp/gsp-570.144.bin /usr/lib/firmware/nvidia/tu116/gsp/gsp-570.144.bin /usr/lib/firmware/nvidia/ad102/gsp/gsp-570.144.bin /usr/lib/firmware/nvidia/ga100/gsp/gsp-570.144.bin /usr/lib/firmware/nvidia/ga102/gsp/gsp-570.144.bin /usr/lib/firmware/nvidia/gb100/gsp/fmc-570.144.bin /usr/lib/firmware/nvidia/gb100/gsp/gsp-570.144.bin /usr/lib/firmware/nvidia/gb202/gsp/fmc-570.144.bin /usr/lib/firmware/nvidia/gb202/gsp/gsp-570.144.bin /usr/lib/firmware/nvidia/gh100/gsp/fmc-570.144.bin /usr/lib/firmware/nvidia/gh100/gsp/gsp-570.144.bin /usr/lib/firmware/nvidia/ad102/gsp/scrubber-570.144.bin /usr/lib/firmware/nvidia/ad102/gsp/bootloader-570.144.bin /usr/lib/firmware/nvidia/gh100/gsp/bootloader-570.144.bin /usr/lib/firmware/nvidia/gb202/gsp/bootloader-570.144.bin /usr/lib/firmware/nvidia/ga102/gsp/bootloader-570.144.bin /usr/lib/firmware/nvidia/ga100/gsp/bootloader-570.144.bin /usr/lib
 /firmware/nvidia/tu116/gsp/bootloader-570.144.bin /usr/lib/firmware/nvidia/tu102/gsp/bootloader-570.144.bin /usr/lib/firmware/nvidia/gb100/gsp/bootloader-570.144.bin /usr/lib/firmware/nvidia/ad102/gsp/booter_unload-570.144.bin /usr/lib/firmware/nvidia/ga100/gsp/booter_unload-570.144.bin /usr/lib/firmware/nvidia/ga102/gsp/booter_unload-570.144.bin /usr/lib/firmware/nvidia/tu102/gsp/booter_unload-570.144.bin /usr/lib/firmware/nvidia/tu116/gsp/booter_unload-570.144.bin /usr/lib/firmware/nvidia/tu102/gsp/booter_load-570.144.bin /usr/lib/firmware/nvidia/tu116/gsp/booter_load-570.144.bin /usr/lib/firmware/nvidia/ad102/gsp/booter_load-570.144.bin /usr/lib/firmware/nvidia/ga100/gsp/booter_load-570.144.bin /usr/lib/firmware/nvidia/ga102/gsp/booter_load-570.144.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8987-sdio: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8987-sdio: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-common: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-common: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-pcie: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-pcie: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-sdio: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-sdio: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-common: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-common: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-pcie: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-pcie: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-sdio: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-sdio: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw416-sdio: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw416-sdio: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw612-sdio: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw612-sdio: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-olpc-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-olpc-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-olpc: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-olpc: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-powervr-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-powervr-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-powervr: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-powervr: PKGSIZE changed from 114688 to 270336 (+136%)
packages/all-poky-linux/linux-firmware/linux-firmware-powervr: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-powervr: FILELIST: added "/usr/lib/firmware/powervr/rogue_36.53.104.796_v1.fw"
packages/all-poky-linux/linux-firmware/linux-firmware-prestera: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-prestera: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-misc: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-misc: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca2066: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca2066: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca61x4-serial: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca61x4-serial: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca61x4-usb: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca61x4-usb: PKGSIZE changed from 1236203 to 1237938 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca61x4-usb: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca6390: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca6390: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca6698: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-qca6698: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn3950: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn3950: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn3988: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn3988: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn399x: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn399x: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn6750: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn6750: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn7850: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca-wcn7850: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-2-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-2-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a623: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a623: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a663: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a663: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a702: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a702: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-g750: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-g750: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-aic100: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-aic100: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-modem: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-modem: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-wifi: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-wifi: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-adreno: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-adreno: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-adreno: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-adreno: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-audio: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-audio: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-modem: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-modem: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-wifi: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-wifi: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-adreno: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-adreno: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-audio: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-audio: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-compute: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-compute: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-ipa: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-ipa: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-wifi: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm6490-wifi: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcs615-adreno: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcs615-adreno: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcs8300-adreno: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcs8300-adreno: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcs8300-audio: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcs8300-audio: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcs8300-compute: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcs8300-compute: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcs8300-generalpurpose: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcs8300-generalpurpose: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qdu100: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qdu100: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-adreno: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-adreno: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-audio: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-audio: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-compute: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-compute: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-modem: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-modem: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-wifi: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-wifi: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sa8775p-adreno: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sa8775p-adreno: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sa8775p-audio: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sa8775p-audio: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sa8775p-compute: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sa8775p-compute: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sa8775p-generalpurpose: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sa8775p-generalpurpose: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sa8775p-qupv3fw: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sa8775p-qupv3fw: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PKGSIZE changed from 14394076 to 14591956 (+1%)
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PKGSIZE changed from 3576321 to 3572225 (-0%)
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PKGSIZE changed from 6213632 to 6234112 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-adreno: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-adreno: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-thundercomm-db845c-sensors: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-thundercomm-db845c-sensors: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-adreno: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-adreno: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-thundercomm-rb5-sensors: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-thundercomm-rb5-sensors: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8550-audio-tplg: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8550-audio-tplg: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8650-audio-tplg: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8650-audio-tplg: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-6.0: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-6.0: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-adreno: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-adreno: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-audio: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-audio: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-t14s-g6-adreno: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-t14s-g6-adreno: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-t14s-g6-audio: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-t14s-g6-audio: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-t14s-g6-compute: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-t14s-g6-compute: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-t14s-g6-vpu: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-t14s-g6-vpu: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-yoga-slim7x-adreno: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-yoga-slim7x-adreno: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-yoga-slim7x-audio: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-yoga-slim7x-audio: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-yoga-slim7x-compute: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-yoga-slim7x-compute: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-yoga-slim7x-vpu: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-x1e80100-lenovo-yoga-slim7x-vpu: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-yamato-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-yamato-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qed: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qed: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-dptx: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-dptx: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-nic: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-nic: PKGSIZE changed from 112252 to 122356 (+9%)
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-nic: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-nic: FILELIST: added "/usr/lib/firmware/rtl_nic/rtl8127a-1.fw"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8761: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8761: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8822: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8822: PKGSIZE changed from 802703 to 801515 (-0%)
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8822: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-src: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-src: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-wfx-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wfx-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-wfx: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wfx: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGSIZE changed from 335426 to 340038 (+1%)
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c-license: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c-license: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGV changed from 20250509 [default] to 20250613 [default]
packages/all-poky-linux/linux-firmware/linux-firmware: PKGSIZE changed from 104620980 to 107856710 (+3%)
packages/all-poky-linux/linux-firmware/linux-firmware: PV changed from "20250509" to "20250613"
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: added "/usr/lib/firmware/intel/ipu/ipu7ptl_fw.bin /usr/lib/firmware/cnm/wave633c_imx9_codec_fw.bin /usr/lib/firmware/qcom/sc8280xp/LENOVO/21BX/qcvss8280.mbn /usr/lib/firmware/qcom/qcm6490/qupv3fw.elf /usr/lib/firmware/qcom/qcs8300/qupv3fw.elf /usr/lib/firmware/intel/ipu/ipu7_fw.bin"

--===============8773685655116442904==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: FILELIST: added "/usr/lib/firmware/brcm/brcmfmac43430-sdio.friendlyarm,nanopi-neo4.txt"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: FILELIST: added "/usr/lib/firmware/brcm/brcmfmac43455-sdio.brcmfmac43455-sdio.khadas,vim.txt"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: FILELIST: added "/usr/lib/firmware/brcm/brcmfmac4356-sdio.friendlyarm,nanopc-t4.txt"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: FILELIST: removed "/usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431a50.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431a60.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431a40.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431a30.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431a20.wmfw", added "/usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e3b-spkid0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e3a-spkid1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104388f4-spkid0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104388f4-spkid1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e3a-spkid0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e3b-spkid1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a50.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a60.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-1025182c-l0.bin /usr/lib/firmwar
 e/cirrus/cs35l41-dsp1-spk-prot-10251844-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10251826-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10251844.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10251826.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e3b.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8e3a.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-1025182c.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-1025182c-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10251826-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10251844-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-104388f4.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a20.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a30.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10433a40.wmfw"
packages/all-poky-linux/linux-firmware/linux-firmware-cnm-license: PKGSIZE changed from 1171 to 2055 (+75%)
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced: FILELIST: removed "/usr/lib/firmware/intel/ice/ddp-comms/ice_comms-1.3.52.0.pkg /usr/lib/firmware/intel/ice/ddp-wireless_edge/ice_wireless_edge-1.3.20.0.pkg", added "/usr/lib/firmware/intel/ice/ddp-comms/ice_comms-1.3.55.0.pkg /usr/lib/firmware/intel/ice/ddp-wireless_edge/ice_wireless_edge-1.3.23.0.pkg"
packages/all-poky-linux/linux-firmware/linux-firmware-ice: FILELIST: removed "/usr/lib/firmware/intel/ice/ddp/ice-1.3.41.0.pkg", added "/usr/lib/firmware/intel/ice/ddp/ice-1.3.43.0.pkg"
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek: PKGSIZE changed from 46379319 to 52282983 (+13%)
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek: FILELIST: added "/usr/lib/firmware/mediatek/mt8196/vcp.img"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PKGSIZE changed from 65118512 to 158944388 (+144%)
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: FILELIST: added "/usr/lib/firmware/nvidia/gb202/gsp/fmc-570.144.bin /usr/lib/firmware/nvidia/gb202/gsp/gsp-570.144.bin /usr/lib/firmware/nvidia/gh100/gsp/fmc-570.144.bin /usr/lib/firmware/nvidia/gh100/gsp/gsp-570.144.bin /usr/lib/firmware/nvidia/tu102/gsp/gsp-570.144.bin /usr/lib/firmware/nvidia/tu116/gsp/gsp-570.144.bin /usr/lib/firmware/nvidia/ga100/gsp/gsp-570.144.bin /usr/lib/firmware/nvidia/ga102/gsp/gsp-570.144.bin /usr/lib/firmware/nvidia/gb100/gsp/fmc-570.144.bin /usr/lib/firmware/nvidia/gb100/gsp/gsp-570.144.bin /usr/lib/firmware/nvidia/ad102/gsp/scrubber-570.144.bin /usr/lib/firmware/nvidia/ad102/gsp/gsp-570.144.bin /usr/lib/firmware/nvidia/ga102/gsp/booter_unload-570.144.bin /usr/lib/firmware/nvidia/ad102/gsp/booter_unload-570.144.bin /usr/lib/firmware/nvidia/ga100/gsp/booter_unload-570.144.bin /usr/lib/firmware/nvidia/tu102/gsp/booter_unload-570.144.bin /usr/lib/firmware/nvidia/tu116/gsp/booter_unload-570.1
 44.bin /usr/lib/firmware/nvidia/tu102/gsp/bootloader-570.144.bin /usr/lib/firmware/nvidia/tu116/gsp/bootloader-570.144.bin /usr/lib/firmware/nvidia/ad102/gsp/bootloader-570.144.bin /usr/lib/firmware/nvidia/ga100/gsp/bootloader-570.144.bin /usr/lib/firmware/nvidia/ad102/gsp/booter_load-570.144.bin /usr/lib/firmware/nvidia/tu102/gsp/booter_load-570.144.bin /usr/lib/firmware/nvidia/tu116/gsp/booter_load-570.144.bin /usr/lib/firmware/nvidia/ga102/gsp/bootloader-570.144.bin /usr/lib/firmware/nvidia/gb100/gsp/bootloader-570.144.bin /usr/lib/firmware/nvidia/gb202/gsp/bootloader-570.144.bin /usr/lib/firmware/nvidia/ga100/gsp/booter_load-570.144.bin /usr/lib/firmware/nvidia/ga102/gsp/booter_load-570.144.bin /usr/lib/firmware/nvidia/gh100/gsp/bootloader-570.144.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-powervr: PKGSIZE changed from 114688 to 270336 (+136%)
packages/all-poky-linux/linux-firmware/linux-firmware-powervr: FILELIST: added "/usr/lib/firmware/powervr/rogue_36.53.104.796_v1.fw"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-nic: FILELIST: added "/usr/lib/firmware/rtl_nic/rtl8127a-1.fw"
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: added "/usr/lib/firmware/intel/ipu/ipu7ptl_fw.bin /usr/lib/firmware/qcom/sc8280xp/LENOVO/21BX/qcvss8280.mbn /usr/lib/firmware/cnm/wave633c_imx9_codec_fw.bin /usr/lib/firmware/qcom/qcs8300/qupv3fw.elf /usr/lib/firmware/qcom/qcm6490/qupv3fw.elf /usr/lib/firmware/intel/ipu/ipu7_fw.bin"

--===============8773685655116442904==--

