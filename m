Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69A0FD489BD
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 01:26:04 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1434.1768526747487332367
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 17:25:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=dBEa19pa;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=gshFzgtt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019bc468b4ba-80b93088-7437-4ce4-bd10-42cb379af5d9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768526755;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=SGVvMMf6WVepjso/FHLbv+s7N7VJ0dgQeXMOSMmLHCU=;
	b=dBEa19pa7cs2FTlLEWGbXQRdcC1sN6XImsqNga+EbjHj7dOhjkzCp6gVgaPfCjTi
	WKMIO5dpF0lSKzSNJ3xq2MDQOM0qlZ91Dn7xxyyrDylMoXqlbkwyu7F3us0uNmqaf0D
	gMF/4NtOXdGjnCkQJ/jUfEmrAUtw7QY8vuqc5lLY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768526755;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=SGVvMMf6WVepjso/FHLbv+s7N7VJ0dgQeXMOSMmLHCU=;
	b=gshFzgttia3O7fc8Gdp4nVy40aAFaDKrCZC5m2j62lbMAwHsohRqr6XPOIBe2cWI
	uyVZulxOu9Xd6DLnLixQNm4WZfoefIVtbo6IWuP6hEwuqcpLu5l8zdtILvWmN9AcuVv
	tTk6X49NImTVm5Lbz6JtmddVBJISaSAh59oPOETY=
Content-Type: multipart/mixed; boundary="===============0232090818807117082=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] linux-firmware: upgrading to 20260110 FAILED
Message-ID: <0101019bc468b4ba-80b93088-7437-4ce4-bd10-42cb379af5d9-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jan 2026 01:25:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.16-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229496

--===============0232090818807117082==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *linux-firmware* to *20260110* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-linux-firmware-upgrade-20251125-20260110.patch
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
From cea50f47456ef150a8e31eaa72aee0d8d244248b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 16 Jan 2026 00:13:27 +0000
Subject: [PATCH] linux-firmware: upgrade 20251125 -> 20260110

---
 ...20251125.bb => linux-firmware_20260110.bb} | 682 +++++++++++++++++-
 1 file changed, 679 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20251125.bb => linux-firmware_20260110.bb} (86%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20251125.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20260110.bb
similarity index 86%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20251125.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20260110.bb
index ff84a3c464..a2fccd9f36 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20251125.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20260110.bb
@@ -1,3 +1,679 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE.amd-ucode
+# +++ LICENSE.amd-ucode
+# @@ -1,4 +1,4 @@
+# -Copyright (C) 2010-2022 Advanced Micro Devices, Inc., All rights reserved.
+# +Copyright (C) 2010-2025 Advanced Micro Devices, Inc., All rights reserved.
+#  
+#  Permission is hereby granted by Advanced Micro Devices, Inc. ("AMD"),
+#  free of any license fees, to any person obtaining a copy of this
+# --- WHENCE
+# +++ WHENCE
+# @@ -1032,31 +1032,31 @@
+#  
+#  File: intel/iwlwifi/iwlwifi-cc-a0-77.ucode
+#  Link: iwlwifi-cc-a0-77.ucode -> intel/iwlwifi/iwlwifi-cc-a0-77.ucode
+# -Version: 74.30b1cbd8.0
+# +Version: 74.f39cc7f9.0
+#  
+#  File: intel/iwlwifi/iwlwifi-Qu-b0-hr-b0-77.ucode
+#  Link: iwlwifi-Qu-b0-hr-b0-77.ucode -> intel/iwlwifi/iwlwifi-Qu-b0-hr-b0-77.ucode
+# -Version: 74.30b1cbd8.0
+# +Version: 74.f39cc7f9.0
+#  
+#  File: intel/iwlwifi/iwlwifi-Qu-b0-jf-b0-77.ucode
+#  Link: iwlwifi-Qu-b0-jf-b0-77.ucode -> intel/iwlwifi/iwlwifi-Qu-b0-jf-b0-77.ucode
+# -Version: 74.30b1cbd8.0
+# +Version: 74.f39cc7f9.0
+#  
+#  File: intel/iwlwifi/iwlwifi-Qu-c0-hr-b0-77.ucode
+#  Link: iwlwifi-Qu-c0-hr-b0-77.ucode -> intel/iwlwifi/iwlwifi-Qu-c0-hr-b0-77.ucode
+# -Version: 74.30b1cbd8.0
+# +Version: 74.f39cc7f9.0
+#  
+#  File: intel/iwlwifi/iwlwifi-Qu-c0-jf-b0-77.ucode
+#  Link: iwlwifi-Qu-c0-jf-b0-77.ucode -> intel/iwlwifi/iwlwifi-Qu-c0-jf-b0-77.ucode
+# -Version: 74.30b1cbd8.0
+# +Version: 74.f39cc7f9.0
+#  
+#  File: intel/iwlwifi/iwlwifi-QuZ-a0-hr-b0-77.ucode
+#  Link: iwlwifi-QuZ-a0-hr-b0-77.ucode -> intel/iwlwifi/iwlwifi-QuZ-a0-hr-b0-77.ucode
+# -Version: 74.30b1cbd8.0
+# +Version: 74.f39cc7f9.0
+#  
+#  File: intel/iwlwifi/iwlwifi-QuZ-a0-jf-b0-77.ucode
+#  Link: iwlwifi-QuZ-a0-jf-b0-77.ucode -> intel/iwlwifi/iwlwifi-QuZ-a0-jf-b0-77.ucode
+# -Version: 74.30b1cbd8.0
+# +Version: 74.f39cc7f9.0
+#  
+#  File: intel/iwlwifi/iwlwifi-ty-a0-gf-a0-77.ucode
+#  Link: iwlwifi-ty-a0-gf-a0-77.ucode -> intel/iwlwifi/iwlwifi-ty-a0-gf-a0-77.ucode
+# @@ -1088,7 +1088,7 @@
+#  
+#  File: intel/iwlwifi/iwlwifi-ty-a0-gf-a0-89.ucode
+#  Link: iwlwifi-ty-a0-gf-a0-89.ucode -> intel/iwlwifi/iwlwifi-ty-a0-gf-a0-89.ucode
+# -Version: 86.7207fc64.0
+# +Version: 86.df9556fc.0
+#  
+#  File: intel/iwlwifi/iwlwifi-so-a0-gf4-a0-77.ucode
+#  Link: iwlwifi-so-a0-gf4-a0-77.ucode -> intel/iwlwifi/iwlwifi-so-a0-gf4-a0-77.ucode
+# @@ -1120,7 +1120,7 @@
+#  
+#  File: intel/iwlwifi/iwlwifi-so-a0-gf4-a0-89.ucode
+#  Link: iwlwifi-so-a0-gf4-a0-89.ucode -> intel/iwlwifi/iwlwifi-so-a0-gf4-a0-89.ucode
+# -Version: 86.7207fc64.0
+# +Version: 86.df9556fc.0
+#  
+#  File: intel/iwlwifi/iwlwifi-so-a0-gf-a0-77.ucode
+#  Link: iwlwifi-so-a0-gf-a0-77.ucode -> intel/iwlwifi/iwlwifi-so-a0-gf-a0-77.ucode
+# @@ -1152,7 +1152,7 @@
+#  
+#  File: intel/iwlwifi/iwlwifi-so-a0-gf-a0-89.ucode
+#  Link: iwlwifi-so-a0-gf-a0-89.ucode -> intel/iwlwifi/iwlwifi-so-a0-gf-a0-89.ucode
+# -Version: 86.7207fc64.0
+# +Version: 86.df9556fc.0
+#  
+#  File: intel/iwlwifi/iwlwifi-so-a0-hr-b0-77.ucode
+#  Link: iwlwifi-so-a0-hr-b0-77.ucode -> intel/iwlwifi/iwlwifi-so-a0-hr-b0-77.ucode
+# @@ -1180,7 +1180,7 @@
+#  
+#  File: intel/iwlwifi/iwlwifi-so-a0-hr-b0-89.ucode
+#  Link: iwlwifi-so-a0-hr-b0-89.ucode -> intel/iwlwifi/iwlwifi-so-a0-hr-b0-89.ucode
+# -Version: 86.7207fc64.0
+# +Version: 86.df9556fc.0
+#  
+#  File: intel/iwlwifi/iwlwifi-so-a0-jf-b0-77.ucode
+#  Link: iwlwifi-so-a0-jf-b0-77.ucode -> intel/iwlwifi/iwlwifi-so-a0-jf-b0-77.ucode
+# @@ -1275,6 +1275,10 @@
+#  Link: iwlwifi-gl-c0-fm-c0-101.ucode -> intel/iwlwifi/iwlwifi-gl-c0-fm-c0-101.ucode
+#  Version: 98.6ef20b19.0
+#  
+# +File: intel/iwlwifi/iwlwifi-gl-c0-fm-c0-c101.ucode
+# +Link: iwlwifi-gl-c0-fm-c0-c101.ucode -> intel/iwlwifi/iwlwifi-gl-c0-fm-c0-c101.ucode
+# +Version: 101.6e695a70.0
+# +
+#  File: intel/iwlwifi/iwlwifi-gl-c0-fm-c0.pnvm
+#  Link: iwlwifi-gl-c0-fm-c0.pnvm -> intel/iwlwifi/iwlwifi-gl-c0-fm-c0.pnvm
+#  
+# @@ -1310,6 +1314,10 @@
+#  Link: iwlwifi-bz-b0-fm-c0-101.ucode -> intel/iwlwifi/iwlwifi-bz-b0-fm-c0-101.ucode
+#  Version: 98.6ef20b19.0
+#  
+# +File: intel/iwlwifi/iwlwifi-bz-b0-fm-c0-c101.ucode
+# +Link: iwlwifi-bz-b0-fm-c0-c101.ucode -> intel/iwlwifi/iwlwifi-bz-b0-fm-c0-c101.ucode
+# +Version: 101.6e695a70.0
+# +
+#  File: intel/iwlwifi/iwlwifi-bz-b0-fm-c0.pnvm
+#  Link: iwlwifi-bz-b0-fm-c0.pnvm -> intel/iwlwifi/iwlwifi-bz-b0-fm-c0.pnvm
+#  
+# @@ -1323,7 +1331,7 @@
+#  
+#  File: intel/iwlwifi/iwlwifi-ma-b0-gf-a0-89.ucode
+#  Link: iwlwifi-ma-b0-gf-a0-89.ucode -> intel/iwlwifi/iwlwifi-ma-b0-gf-a0-89.ucode
+# -Version: 86.7207fc64.0
+# +Version: 86.df9556fc.0
+#  
+#  File: intel/iwlwifi/iwlwifi-ma-b0-gf-a0.pnvm
+#  Link: iwlwifi-ma-b0-gf-a0.pnvm -> intel/iwlwifi/iwlwifi-ma-b0-gf-a0.pnvm
+# @@ -1338,7 +1346,7 @@
+#  
+#  File: intel/iwlwifi/iwlwifi-ma-b0-gf4-a0-89.ucode
+#  Link: iwlwifi-ma-b0-gf4-a0-89.ucode -> intel/iwlwifi/iwlwifi-ma-b0-gf4-a0-89.ucode
+# -Version: 86.7207fc64.0
+# +Version: 86.df9556fc.0
+#  
+#  File: intel/iwlwifi/iwlwifi-ma-b0-gf4-a0.pnvm
+#  Link: iwlwifi-ma-b0-gf4-a0.pnvm -> intel/iwlwifi/iwlwifi-ma-b0-gf4-a0.pnvm
+# @@ -1353,11 +1361,23 @@
+#  
+#  File: intel/iwlwifi/iwlwifi-ma-b0-hr-b0-89.ucode
+#  Link: iwlwifi-ma-b0-hr-b0-89.ucode -> intel/iwlwifi/iwlwifi-ma-b0-hr-b0-89.ucode
+# -Version: 86.7207fc64.0
+# +Version: 86.df9556fc.0
+#  
+#  File: intel/iwlwifi/iwlwifi-sc-a0-wh-b0-101.ucode
+#  Link: iwlwifi-sc-a0-wh-b0-101.ucode -> intel/iwlwifi/iwlwifi-sc-a0-wh-b0-101.ucode
+#  Version: 98.80584591.0
+# +
+# +File: intel/iwlwifi/iwlwifi-sc-a0-wh-b0-c101.ucode
+# +Link: iwlwifi-sc-a0-wh-b0-c101.ucode -> intel/iwlwifi/iwlwifi-sc-a0-wh-b0-c101.ucode
+# +Version: 101.6e695a70.0
+# +
+# +File: intel/iwlwifi/iwlwifi-sc-a0-gf-a0-100.ucode
+# +Link: iwlwifi-sc-a0-gf-a0-100.ucode -> intel/iwlwifi/iwlwifi-sc-a0-gf-a0-100.ucode
+# +Version: 97.de068435d.0
+# +
+# +File: intel/iwlwifi/iwlwifi-sc-a0-fm-c0-c101.ucode
+# +Link: iwlwifi-sc-a0-fm-c0-c101.ucode -> intel/iwlwifi/iwlwifi-sc-a0-fm-c0-c101.ucode
+# +Version: 101.6e695a70.0
+#  
+#  Licence: Redistributable. See LICENCE.iwlwifi_firmware for details
+#  
+# @@ -2120,6 +2140,16 @@
+#  
+#  File: airoha/EthMD32.dm.bin
+#  File: airoha/EthMD32.DSP.bin
+# +
+# +Licence: Redistributable. See LICENSE.airoha for details.
+# +
+# +--------------------------------------------------------------------------
+# +
+# +Driver: an8811hb - Airoha 2.5G Ethernet Phy
+# +
+# +File: airoha/an8811hb/EthMD32_CRC.DM.bin
+# +File: airoha/an8811hb/EthMD32_CRC.DSP.bin
+# +Version: 25110702
+#  
+#  Licence: Redistributable. See LICENSE.airoha for details.
+#  
+# @@ -3941,7 +3971,7 @@
+#  File: ath11k/QCA6698AQ/hw2.1/board-2.bin
+#  File: ath11k/QCA6698AQ/hw2.1/amss.bin
+#  File: ath11k/QCA6698AQ/hw2.1/m3.bin
+# -Version: WLAN.HSP.1.1-04650-QCAHSPSWPL_V1_V2_SILICONZ_IOE-2
+# +Version: WLAN.HSP.1.1-04866-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
+#  File: ath11k/QCA6698AQ/hw2.1/Notice.txt
+#  
+#  Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k for details
+# @@ -4226,17 +4256,19 @@
+#  File: intel/ibt-1040-2120.ddc
+#  Version: BT_SolarJfp_REL151_22.180.2405.151
+#  
+# -File: intel/ibt-0093-0291.sfi
+# -File: intel/ibt-0093-0291.ddc
+#  File: intel/ibt-0093-0041.sfi
+#  File: intel/ibt-0093-0041.ddc
+# -File: intel/ibt-0291-0291.sfi
+# -File: intel/ibt-0291-0291.ddc
+#  File: intel/ibt-0093-4150.sfi
+#  File: intel/ibt-0093-4150.ddc
+#  File: intel/ibt-0093-1050.sfi
+#  File: intel/ibt-0093-1050.ddc
+# -Version: BT_BlazarU_S_REL93327_23.170.25375.93327
+# +Version: BT_BlazaruHrpGfp_S_REL191_24.00.25461.191
+# +
+# +File: intel/ibt-0291-0291.sfi
+# +File: intel/ibt-0291-0291.ddc
+# +File: intel/ibt-0093-0291.sfi
+# +File: intel/ibt-0093-0291.ddc
+# +Version: BT_BlazarU_S_REL97345_24.10.25461.97345
+#  
+#  File: intel/ibt-0180-0041.sfi
+#  File: intel/ibt-0180-0041.ddc
+# @@ -4247,7 +4279,6 @@
+#  Version: BT_Magnetar_REL103882_23.50.25205.103882
+#  
+#  File: intel/ibt-0190-0291.sfi
+# -File: intel/ibt-0190-0291-iml.sfi
+#  File: intel/ibt-0190-0291.ddc
+#  File: intel/ibt-0190-0041.sfi
+#  File: intel/ibt-0190-0041-iml.sfi
+# @@ -4256,11 +4287,31 @@
+#  File: intel/ibt-0190-0041-pci.sfi
+#  File: intel/ibt-0190-0041-usb.ddc
+#  File: intel/ibt-0190-0041-usb.sfi
+# +Version: BT_BlazariGfp_S_REL145_24.00.25461.145
+# +
+# +File: intel/ibt-0190-0291-iml.sfi
+# +File: intel/ibt-0190-0291-usb.ddc
+# +File: intel/ibt-0190-0291-usb.sfi
+#  File: intel/ibt-0190-0291-pci.ddc
+#  File: intel/ibt-0190-0291-pci.sfi
+# -File: intel/ibt-0190-0291-usb.ddc
+# -File: intel/ibt-0190-0291-usb.sfi
+# -Version: BT_BlazarI_S_REL100876_23.170.25375.100876
+# +Version: BT_BlazarI_S_REL104829_24.10.25461.104829
+# +
+# +File: intel/ibt-00a0-01a1-iml.sfi
+# +File: intel/ibt-00a0-01a1-pci.ddc
+# +File: intel/ibt-00a0-01a1-pci.sfi
+# +File: intel/ibt-00a0-01a1-usb.ddc
+# +File: intel/ibt-00a0-01a1-usb.sfi
+# +File: intel/ibt-00a0-0291-iml.sfi
+# +File: intel/ibt-00a0-0291-pci.ddc
+# +File: intel/ibt-00a0-0291-pci.sfi
+# +File: intel/ibt-00a0-0291-usb.ddc
+# +File: intel/ibt-00a0-0291-usb.sfi
+# +Version: BT_Scorpius_S_REL68935_24.10.25461.68935
+# +
+# +File: intel/ibt-00a0-0041-iml.sfi
+# +File: intel/ibt-00a0-0041-pci.ddc
+# +File: intel/ibt-00a0-0041-pci.sfi
+# +Version: BT_Scorpius_S_REL63418_24.00.25374.63418
+#  
+#  Licence: Redistributable. See LICENCE.ibt_firmware for details
+#  
+# @@ -4390,7 +4441,7 @@
+#  RawFile: amd-ucode/microcode_amd_fam19h.bin
+#  Version: 2025-10-27
+#  RawFile: amd-ucode/microcode_amd_fam1ah.bin
+# -Version: 2025-11-13
+# +Version: 2025-12-02
+#  File: amd-ucode/README
+#  
+#  License: Redistributable. See LICENSE.amd-ucode for details
+# @@ -4808,6 +4859,16 @@
+#  
+#  --------------------------------------------------------------------------
+#  
+# +Driver: btqca - Qualcomm Atheros Bluetooth support for QCA_QCC2072 chip
+# +
+# +File: qca/ornbtfw11.tlv
+# +Version: BTFW.ORNE.1.1.0-00202-PATCH-2_DEF
+# +File: qca/ornnv11.bin
+# +
+# +Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k and qca/NOTICE.txt for details
+# +
+# +-------------------------------------------------------------------------
+# +
+#  Driver: qca - Qualcomm Atheros Bluetooth support for WCN3950 chips
+#  
+#  File: qca/cmbtfw12.tlv
+# @@ -4853,15 +4914,15 @@
+#  Driver: qca - Qualcomm Atheros Bluetooth support for WCN6750 chips
+#  
+#  File: qca/msbtfw11.mbn
+# -Version: BTFW.MOSELLE.1.1.3-00100-MSL_PATCHZ-1
+# +Version: BTFW.MOSELLE.1.1.3-00105-MSL_PATCHZ-1
+#  File: qca/msbtfw11.tlv
+# -Version: BTFW.MOSELLE.1.1.3-00100-MSL_PATCHZ-1
+# +Version: BTFW.MOSELLE.1.1.3-00105-MSL_PATCHZ-1
+#  File: qca/msnv11.bin
+# -Version: BTFW.MOSELLE.1.1.3-00100-MSL_PATCHZ-1
+# +Version: BTFW.MOSELLE.1.1.3-00105-MSL_PATCHZ-1
+#  File: qca/msnv11.b0a
+# -Version: BTFW.MOSELLE.1.1.3-00100-MSL_PATCHZ-1
+# +Version: BTFW.MOSELLE.1.1.3-00105-MSL_PATCHZ-1
+#  File: qca/msnv11.b09
+# -Version: BTFW.MOSELLE.1.1.3-00100-MSL_PATCHZ-1
+# +Version: BTFW.MOSELLE.1.1.3-00105-MSL_PATCHZ-1
+#  
+#  Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k and qca/NOTICE.txt for details
+#  
+# @@ -5377,10 +5438,13 @@
+#  Version: DMC API/APB ver 2 release 29 for Xe2LPD
+#  
+#  File: i915/xe3lpd_dmc.bin
+# -Version: DMC API/APB ver 2 release 32 for Xe3LPD
+# +Version: DMC API/APB ver 2 release 33 for Xe3LPD
+#  
+#  File: i915/xe3lpd_3002_dmc.bin
+# -Version: DMC API/APB ver 2 release 27 for Xe3LPD_3002
+# +Version: DMC API/APB ver 2 release 28 for Xe3LPD_3002
+# +
+# +File: i915/xe3p_lpd_dmc.bin
+# +Version: DMC API/APB ver 2 release 33 for Xe3p_LPD
+#  
+#  License: Redistributable. See LICENSE.i915 for details
+#  --------------------------------------------------------------------------
+# @@ -5397,7 +5461,7 @@
+#  Version: HuC API/APB ver 9.4.13 for Lunarlake
+#  
+#  File: xe/bmg_guc_70.bin
+# -Version: GuC API/APB ver 70.53.0 for Battlemage
+# +Version: GuC API/APB ver 70.55.3 for Battlemage
+#  
+#  File: xe/bmg_huc.bin
+#  Version: HuC API/APB ver 8.2.10 for Battlemage
+# @@ -5406,7 +5470,7 @@
+#  Version: fan_control ver 203.0.0.0 for Battlemage
+#  
+#  File: xe/ptl_guc_70.bin
+# -Version: GuC API/APB ver 70.53.0 for Pantherlake
+# +Version: GuC API/APB ver 70.55.3 for Pantherlake
+#  
+#  File: xe/ptl_huc.bin
+#  Version: HuC API/APB ver 10.3.3 for Pantherlake
+# @@ -6158,9 +6222,9 @@
+#  Driver: mt7920 - MediaTek MT7920 Wireless MACs
+#  
+#  File: mediatek/WIFI_MT7961_patch_mcu_1a_2_hdr.bin
+# -Version: 20251020150843a
+# +Version: 20260105151012a
+#  File: mediatek/WIFI_RAM_CODE_MT7961_1a.bin
+# -Version: 20251020151401
+# +Version: 20260105151805
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -6169,7 +6233,7 @@
+#  Driver: mt7920 - MediaTek MT7920 bluetooth chipset
+#  
+#  File: mediatek/BT_RAM_CODE_MT7961_1a_2_hdr.bin
+# -Version: 20251020151255
+# +Version: 20260105151350
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -6198,9 +6262,9 @@
+#  Driver: mt7922 - MediaTek MT7922 Wireless MACs
+#  
+#  File: mediatek/WIFI_MT7922_patch_mcu_1_1_hdr.bin
+# -Version: 20251118163143a
+# +Version: 20260106153416a
+#  File: mediatek/WIFI_RAM_CODE_MT7922_1.bin
+# -Version: 20251118163139
+# +Version: 20260106153428
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -6209,7 +6273,7 @@
+#  Driver: mt7922 - MediaTek MT7922 bluetooth chipset
+#  
+#  File: mediatek/BT_RAM_CODE_MT7922_1_1_hdr.bin
+# -Version: 20251118163447
+# +Version: 20260106153735
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -6218,9 +6282,9 @@
+#  Driver: mt7925 - MediaTek MT7925 Wireless MACs
+#  
+#  File: mediatek/mt7925/WIFI_MT7925_PATCH_MCU_1_1_hdr.bin
+# -Version: 20251015212927a
+# +Version: 20260106153007a
+#  File: mediatek/mt7925/WIFI_RAM_CODE_MT7925_1_1.bin
+# -Version: 20251015212814
+# +Version: 20260106152802
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -6229,7 +6293,7 @@
+#  Driver: mt7925 - MediaTek MT7925 bluetooth chipset
+#  
+#  File: mediatek/mt7925/BT_RAM_CODE_MT7925_1_1_hdr.bin
+# -Version: 20251015213201
+# +Version: 20260106153314
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -6456,7 +6520,7 @@
+#  File: qcom/venus-5.4/venus.mbn
+#  Link: qcom/venus-5.4/venus.mdt -> venus.mbn
+#  
+# -Version: VIDEO.VE.5.4-00062-PROD-1
+# +Version: VIDEO.VE.5.4-00063-PROD-1
+#  
+#  File: qcom/venus-6.0/venus.mbn
+#  
+# @@ -6471,7 +6535,7 @@
+#  Link: qcom/vpu-1.0/venus.mbn -> ../vpu/vpu20_p4.mbn
+#  Link: qcom/vpu-1.0/venus.mdt -> ../vpu/vpu20_p4.mbn
+#  
+# -Version: VIDEO.VPU.1.0-00119-PROD-1
+# +Version: VIDEO.VPU.1.0-00119
+#  
+#  Licence: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
+#  
+# @@ -6489,7 +6553,7 @@
+#  File: qcom/vpu/vpu30_p4_s7.mbn
+#  Link: qcom/vpu/vpu30_p4.mbn -> vpu30_p4_s7.mbn
+#  
+# -Version: VIDEO.VPU.3.1-0096
+# +Version: VIDEO.VPU.3.1-0095
+#  
+#  File: qcom/vpu/vpu30_p4_s6.mbn
+#  
+# @@ -6546,6 +6610,7 @@
+#  Version: 1.87.01
+#  File: qcom/a530_pm4.fw
+#  File: qcom/a530v3_gpmu.fw2
+# +Version v2.04 (2015-08-31)
+#  File: qcom/apq8096/a530_zap.mbn
+#  Link: qcom/a530_zap.mdt -> apq8096/a530_zap.mbn
+#  File: qcom/qrb4210/a610_zap.mbn
+# @@ -6561,6 +6626,10 @@
+#  File: qcom/a630_sqe.fw
+#  Version: v2.07
+#  File: qcom/sdm845/a630_zap.mbn
+# +File: qcom/a640_gmu.bin
+# +Version: v1.05
+# +File: qcom/sm8150/a640_zap.mbn
+# +Version: v0.20
+#  File: qcom/a650_gmu.bin
+#  Version: v2.1.8
+#  File: qcom/a650_sqe.fw
+# @@ -6582,18 +6651,46 @@
+#  File: qcom/a702_sqe.fw
+#  Version: v0.47
+#  File: qcom/qcm2290/a702_zap.mbn
+# +File: qcom/a730_sqe.fw
+# +Version: v1.81
+# +File: qcom/gmu_gen70000.bin
+# +Version: v4.00.07
+# +File: qcom/sm8450/a730_zap.mbn
+# +Version: v0.14
+# +File: qcom/a740_sqe.fw
+# +Version: v1.81
+# +File: qcom/gmu_gen70200.bin
+# +Version: v4.01.09
+# +File: qcom/sm8550/a740_zap.mbn
+# +Version: v0.11
+#  File: qcom/gen70500_gmu.bin
+#  Version: v4.03.11
+#  File: qcom/gen70500_sqe.fw
+#  Version: v1.62
+#  File: qcom/x1e80100/gen70500_zap.mbn
+#  Version: v0.15
+# +File: qcom/gen70900_aqe.fw
+# +Version: v0.23
+# +File: qcom/gen70900_sqe.fw
+# +Version: v1.81
+# +File: qcom/gmu_gen70900.bin
+# +Version: v4.02.14
+# +File: qcom/sm8650/gen70900_zap.mbn
+# +Version: v0.13
+#  File: qcom/gen71500_gmu.bin
+#  Version: v4.06.04
+#  File: qcom/gen71500_sqe.fw
+#  Version: v1.81
+#  File: qcom/x1p42100/gen71500_zap.mbn
+#  Version: v0.13
+# +File: qcom/gen80000_aqe.fw
+# +Version: v0.14
+# +File: qcom/gen80000_gmu.bin
+# +Version: v5.01.19
+# +File: qcom/gen80000_sqe.fw
+# +Version: v0.77
+# +File: qcom/sm8750/gen80000_zap.mbn
+# +Version: v0.02
+#  File: qcom/gen80200_aqe.fw
+#  Version: v0.25
+#  File: qcom/gen80200_gmu.bin
+# @@ -6656,7 +6753,7 @@
+#  RawFile: qcom/qcm6490/adspua.jsn
+#  RawFile: qcom/qcm6490/battmgr.jsn
+#  File: qcom/qcm6490/cdsp.mbn
+# -Version: CDSP.HT.2.5.c3-00103-KODIAK-1
+# +Version: CDSP.HT.2.5.c3-00130-KODIAK-1
+#  RawFile: qcom/qcm6490/cdspr.jsn
+#  File: qcom/qcm6490/ipa_fws.mbn
+#  Link: qcom/qcs6490/adsp.mbn -> ../qcm6490/adsp.mbn
+# @@ -6732,13 +6829,6 @@
+#  Version: video-firmware.1.1-b158087140355883dc40b004032856a8feb5d565
+#  File: qcom/x1e80100/LENOVO/21N1/qcvss8380.mbn
+#  Version: vfw-3.1:rel0085-070fa3311d9ef968015fee7fea07198d7eb208a1
+# -File: qcom/x1e80100/adsp.mbn
+# -File: qcom/x1e80100/adsp_dtb.mbn
+# -Version: ADSP.HT.5.9-00796-HAMOA-1
+# -RawFile: qcom/x1e80100/adspr.jsn
+# -RawFile: qcom/x1e80100/adsps.jsn
+# -RawFile: qcom/x1e80100/adspua.jsn
+# -RawFile: qcom/x1e80100/battmgr.jsn
+#  RawFile: qcom/x1e80100/LENOVO/21N1/adspua.jsn
+#  File: qcom/x1e80100/cdsp.mbn
+#  File: qcom/x1e80100/cdsp_dtb.mbn
+# @@ -6802,31 +6892,30 @@
+#  File: qcom/kaanapali/soccp_dtb.mbn
+#  Version: SOCCP.FW.2.1-00204-KAANAPALI_SOCCP_PACK-1
+#  RawFile: qcom/kaanapali/soccpr.jsn
+# +File: qcom/qcs8300/adsp.mbn
+# +Version: DSP.AT.1.0.1-00170-LEMANS-1
+# +RawFile: qcom/qcs8300/adspr.jsn
+# +RawFile: qcom/qcs8300/adspua.jsn
+# +File: qcom/qcs8300/cdsp0.mbn
+# +Version: DSP.AT.1.0.1-00170-LEMANS-1
+# +RawFile: qcom/qcs8300/cdspr.jsn
+# +File: qcom/qcs8300/gpdsp0.mbn
+# +Version: DSP.AT.1.0.1-00170-LEMANS-1
+#  File: qcom/sa8775p/adsp.mbn
+# -Version: DSP.AT.1.0.1-00163-LEMANS-1
+# +Version: DSP.AT.1.0.1-00190-LEMANS-1
+#  RawFile: qcom/sa8775p/adspr.jsn
+#  RawFile: qcom/sa8775p/adspua.jsn
+#  File: qcom/sa8775p/cdsp0.mbn
+# -Version: DSP.AT.1.0.1-00163-LEMANS-1
+# +Version: DSP.AT.1.0.1-00190-LEMANS-1
+#  File: qcom/sa8775p/cdsp1.mbn
+# -Version: DSP.AT.1.0.1-00163-LEMANS-1
+# +Version: DSP.AT.1.0.1-00190-LEMANS-1
+#  RawFile: qcom/sa8775p/cdspr.jsn
+#  File: qcom/sa8775p/gpdsp0.mbn
+# -Version: DSP.AT.1.0.1-00163-LEMANS-1
+# +Version: DSP.AT.1.0.1-00190-LEMANS-1
+#  File: qcom/sa8775p/gpdsp1.mbn
+# -Version: DSP.AT.1.0.1-00163-LEMANS-1
+# +Version: DSP.AT.1.0.1-00190-LEMANS-1
+#  RawFile: qcom/sa8775p/gpdsp1r.jsn
+#  RawFile: qcom/sa8775p/gpdspr.jsn
+# -File: qcom/qcs8300/adsp.mbn
+# -Version: DSP.AT.1.0.1-00163-LEMANS-1
+# -RawFile: qcom/qcs8300/adspr.jsn
+# -RawFile: qcom/qcs8300/adspua.jsn
+# -File: qcom/qcs8300/cdsp0.mbn
+# -Version: DSP.AT.1.0.1-00163-LEMANS-1
+# -RawFile: qcom/qcs8300/cdspr.jsn
+# -File: qcom/qcs8300/gpdsp0.mbn
+# -Version: DSP.AT.1.0.1-00163-LEMANS-1
+# -
+#  File: qcom/sm8750/adsp.mbn
+#  File: qcom/sm8750/adsp_dtb.mbn
+#  Version: LPAIDSP.HT.1.2.c1-00379-PAKALA-1
+# @@ -6838,6 +6927,13 @@
+#  File: qcom/sm8750/cdsp_dtb.mbn
+#  Version: CDSP.HT.3.1-00883-PAKALA-1
+#  RawFile: qcom/sm8750/cdspr.jsn
+# +File: qcom/x1e80100/adsp.mbn
+# +File: qcom/x1e80100/adsp_dtb.mbn
+# +Version: ADSP.HT.5.9-00828-HAMOA-1
+# +RawFile: qcom/x1e80100/adspr.jsn
+# +RawFile: qcom/x1e80100/adsps.jsn
+# +RawFile: qcom/x1e80100/adspua.jsn
+# +RawFile: qcom/x1e80100/battmgr.jsn
+#  
+#  Licence: Redistributable. See LICENSE.qcom-2 and qcom/NOTICE.txt for details
+#  
+# @@ -6935,6 +7031,10 @@
+#  File: mellanox/mlxsw_spectrum2-29.2014.4012.mfa2
+#  File: mellanox/mlxsw_spectrum3-30.2014.4012.mfa2
+#  File: mellanox/mlxsw_spectrum4-34.2014.4012.mfa2
+# +File: mellanox/mlxsw_spectrum-13.2016.3900.mfa2
+# +File: mellanox/mlxsw_spectrum2-29.2016.3900.mfa2
+# +File: mellanox/mlxsw_spectrum3-30.2016.3900.mfa2
+# +File: mellanox/mlxsw_spectrum4-34.2016.3900.mfa2
+#  
+#  Licence: Redistributable. See LICENSE.mellanox for details.
+#  
+# @@ -7907,12 +8007,15 @@
+#  Link: cirrus/cs35l41-dsp1-spk-prot-103c8d9f.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+#  Link: cirrus/cs35l41-dsp1-spk-prot-103c8da7.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+#  Link: cirrus/cs35l41-dsp1-spk-prot-103c8e36.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8e9c.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+#  File: cirrus/cs35l41-dsp1-spk-prot-103c8d9f-spkid0.bin
+#  File: cirrus/cs35l41-dsp1-spk-prot-103c8d9f-spkid1.bin
+#  Link: cirrus/cs35l41-dsp1-spk-prot-103c8da7-spkid0.bin -> cs35l41-dsp1-spk-prot-103c8d9f-spkid0.bin
+#  Link: cirrus/cs35l41-dsp1-spk-prot-103c8da7-spkid1.bin -> cs35l41-dsp1-spk-prot-103c8d9f-spkid1.bin
+#  Link: cirrus/cs35l41-dsp1-spk-prot-103c8e36-spkid0.bin -> cs35l41-dsp1-spk-prot-103c8d9f-spkid0.bin
+#  Link: cirrus/cs35l41-dsp1-spk-prot-103c8e36-spkid1.bin -> cs35l41-dsp1-spk-prot-103c8d9f-spkid1.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8e9c-spkid0.bin -> cs35l41-dsp1-spk-prot-103c8d9f-spkid0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8e9c-spkid1.bin -> cs35l41-dsp1-spk-prot-103c8d9f-spkid1.bin
+#  Link: cirrus/cs35l41-dsp1-spk-prot-103c8da0.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+#  Link: cirrus/cs35l41-dsp1-spk-prot-103c8da1.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+#  Link: cirrus/cs35l41-dsp1-spk-prot-103c8e37.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# @@ -7929,6 +8032,8 @@
+#  Link: cirrus/cs35l41-dsp1-spk-prot-103c8d9c.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+#  Link: cirrus/cs35l41-dsp1-spk-prot-103c8d9d.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+#  Link: cirrus/cs35l41-dsp1-spk-prot-103c8d9e.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8e9d.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8e9e.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+#  File: cirrus/cs35l41-dsp1-spk-prot-103c8d9b-spkid0.bin
+#  File: cirrus/cs35l41-dsp1-spk-prot-103c8d9b-spkid1.bin
+#  Link: cirrus/cs35l41-dsp1-spk-prot-103c8d9c-spkid0.bin -> cs35l41-dsp1-spk-prot-103c8d9b-spkid0.bin
+# @@ -7937,12 +8042,17 @@
+#  Link: cirrus/cs35l41-dsp1-spk-prot-103c8d9d-spkid1.bin -> cs35l41-dsp1-spk-prot-103c8d9b-spkid1.bin
+#  Link: cirrus/cs35l41-dsp1-spk-prot-103c8d9e-spkid0.bin -> cs35l41-dsp1-spk-prot-103c8d9b-spkid0.bin
+#  Link: cirrus/cs35l41-dsp1-spk-prot-103c8d9e-spkid1.bin -> cs35l41-dsp1-spk-prot-103c8d9b-spkid1.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8e9d-spkid0.bin -> cs35l41-dsp1-spk-prot-103c8d9b-spkid0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8e9d-spkid1.bin -> cs35l41-dsp1-spk-prot-103c8d9b-spkid1.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8e9e-spkid0.bin -> cs35l41-dsp1-spk-prot-103c8d9b-spkid0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8e9e-spkid1.bin -> cs35l41-dsp1-spk-prot-103c8d9b-spkid1.bin
+#  Link: cirrus/cs35l41-dsp1-spk-prot-103c8e11.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+#  Link: cirrus/cs35l41-dsp1-spk-prot-103c8e12.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+#  Link: cirrus/cs35l41-dsp1-spk-prot-103c8e13.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+#  Link: cirrus/cs35l41-dsp1-spk-prot-103c8e60.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+#  Link: cirrus/cs35l41-dsp1-spk-prot-103c8e61.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+#  Link: cirrus/cs35l41-dsp1-spk-prot-103c8e62.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8f57.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+#  File: cirrus/cs35l41-dsp1-spk-prot-103c8e11-spkid0.bin
+#  File: cirrus/cs35l41-dsp1-spk-prot-103c8e11-spkid1.bin
+#  Link: cirrus/cs35l41-dsp1-spk-prot-103c8e12-spkid0.bin -> cs35l41-dsp1-spk-prot-103c8e11-spkid0.bin
+# @@ -7955,6 +8065,8 @@
+#  Link: cirrus/cs35l41-dsp1-spk-prot-103c8e61-spkid1.bin -> cs35l41-dsp1-spk-prot-103c8e11-spkid1.bin
+#  Link: cirrus/cs35l41-dsp1-spk-prot-103c8e62-spkid0.bin -> cs35l41-dsp1-spk-prot-103c8e11-spkid0.bin
+#  Link: cirrus/cs35l41-dsp1-spk-prot-103c8e62-spkid1.bin -> cs35l41-dsp1-spk-prot-103c8e11-spkid1.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8f57-spkid0.bin -> cs35l41-dsp1-spk-prot-103c8e11-spkid0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-103c8f57-spkid1.bin -> cs35l41-dsp1-spk-prot-103c8e11-spkid1.bin
+#  Link: cirrus/cs35l41-dsp1-spk-prot-10280cbd.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+#  Link: cirrus/cs35l41-dsp1-spk-prot-10280cbe.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+#  Link: cirrus/cs35l41-dsp1-spk-prot-10280cbf.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# @@ -9000,7 +9112,6 @@
+#  File: qcom/qdu100/efs3.bin
+#  File: qcom/qdu100/fw_csm_gsi_3.0.elf
+#  File: qcom/qdu100/hypvm.mbn
+# -File: qcom/qdu100/kernel_boot.elf
+#  File: qcom/qdu100/mdmddr.mbn
+#  File: qcom/qdu100/multi_image.mbn
+#  File: qcom/qdu100/multi_image_qti.mbn
+# @@ -9021,12 +9132,16 @@
+#  Driver: intel_vpu - Intel NPU driver
+#  
+#  File: intel/vpu/vpu_37xx_v1.bin
+# -Version: 20250723*MTL_CLIENT_SILICON-NVR+NN-deployment*52e7ebee50a93a07d14a1f162226cd55ad3999f0*52e7ebee50a93a07d14a1f162226cd55ad3999f0*52e7ebee50a
+# +Version: 20251113*MTL_CLIENT_SILICON-NVR+NN-deployment*72f907ffc780df5579a2fed65afc4944da8b0e44*72f907ffc780df5579a2fed65afc4944da8b0e44*72f907ffc78
+#  Link: intel/vpu/vpu_37xx_v0.0.bin -> vpu_37xx_v1.bin
+#  
+#  File: intel/vpu/vpu_40xx_v1.bin
+# -Version: Jul 23 2025*NPU40xx*build/ci/npu-fw-ci-main-20250721_233537-27032-2-g52e7ebee50a*52e7ebee50a93a07d14a1f162226cd55ad3999f0
+# +Version: Nov 13 2025*NPU40xx*ci_tag_ud202548_vpu_rc_20251112_1901-1-g72f907ffc78*72f907ffc780df5579a2fed65afc4944da8b0e44
+#  Link: intel/vpu/vpu_40xx_v0.0.bin -> vpu_40xx_v1.bin
+# +
+# +File: intel/vpu/vpu_50xx_v1.bin
+# +Version: Nov 13 2025*NPU50xx*ci_tag_ud202548_vpu_rc_20251112_1901-1-g72f907ffc78*72f907ffc780df5579a2fed65afc4944da8b0e44
+# +Link: intel/vpu/vpu_50xx_v0.0.bin -> vpu_50xx_v1.bin
+#  
+#  License: Redistributable. See LICENSE.intel_vpu for details
+#  
+# @@ -9060,3 +9175,10 @@
+#  File: qcom/sdx35/foxconn/xbl_s_devprg_ns.melf
+#  
+#  License: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
+# +--------------------------------------------------------------------------
+# +
+# +Driver: pcie-rcar-gen4 - Renesas R-Car Gen4 PCIe controller
+# +
+# +File: rcar_gen4_pcie.bin
+# +
+# +Licence: Redistributable. See LICENCE.r8a779g_pcie_phy for details.
+# 
+#
+
 SUMMARY = "Firmware files for use with Linux kernel"
 HOMEPAGE = "https://www.kernel.org/"
 DESCRIPTION = "Linux firmware is a package distributed alongside the Linux kernel \
@@ -199,7 +875,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENSE.amdnpu;md5=ea42c0f38f2d42aad08bd50c822460dc \
                     file://LICENSE.amd_pmf;md5=a2589a05ea5b6bd2b7f4f623c7e7a649 \
                     file://LICENSE.amd-sev;md5=e750538791a8be0b7249c579edefb035 \
-                    file://LICENSE.amd-ucode;md5=6ca90c57f7b248de1e25c7f68ffc4698 \
+                    file://LICENSE.amd-ucode;md5=450f217aadc787514165e9568652d700 \
                     file://LICENSE.amlogic;md5=80e4e3f27def8bc4b232009c3a587c07 \
                     file://LICENSE.amlogic_vdec;md5=dc44f59bf64a81643e500ad3f39a468a \
                     file://LICENSE.amphion_vpu;md5=2bcdc00527b2d0542bd92b52aaec2b60 \
@@ -308,7 +984,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
                     file://LICENSE.xe;md5=c674d38774242bc0c528214721488118 \
                     file://wfx/LICENCE.wf200;md5=4d1beff00d902c05c9c7e95a5d8eb52d \
-                    file://WHENCE;md5=${WHENCE_CHKSUM} \
+                    file://WHENCE;md5=dec69e98d9a03fca5a9793e8d24c0b8d \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
@@ -449,7 +1125,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "eb807a01c52882ac97ef5b678d4a246b209e6165ac1287d62a5f93a09ee93cd2"
+SRC_URI[sha256sum] = "48e05166db539f4ee8d29ac9d236a94442c5b1b1a160a966f6fe6b42bd714331"
 
 inherit allarch
 
-- 
2.47.1


--===============0232090818807117082==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1955 targets, 47 skipped, 0 masked, 0 errors.
Removing 1 recipes from the allarch sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-a62ccd3a462e9a744958f281d6ae7fba3a3ccf5b"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:a62ccd3a462e9a744958f281d6ae7fba3a3ccf5b"
meta-yocto-bsp       
meta-poky            = "master:c23c19e0b300812bad314f1d0a901965315271ae"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 60 Local 52 Mirrors 0 Missed 8 Current 150 (86% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 168 of 210 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20260110.bb:do_populate_lic_setscene)
NOTE: Running setscene task 206 of 210 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20260110.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-firmware-1_20260110-r0: task do_populate_lic_setscene: Started
NOTE: recipe linux-firmware-1_20260110-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-firmware-1_20260110-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe linux-firmware-1_20260110-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 209 of 210 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20260110.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-firmware-1_20260110-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-firmware-1_20260110-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 210 of 210 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20260110.bb:do_recipe_qa_setscene)
NOTE: recipe linux-firmware-1_20260110-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-firmware-1_20260110-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 665 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20260110.bb:do_fetch)
NOTE: recipe linux-firmware-1_20260110-r0: task do_fetch: Started
NOTE: recipe linux-firmware-1_20260110-r0: task do_fetch: Succeeded
NOTE: Running task 666 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20260110.bb:do_unpack)
NOTE: Running task 667 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20260110.bb:do_prepare_recipe_sysroot)
NOTE: recipe linux-firmware-1_20260110-r0: task do_unpack: Started
NOTE: recipe linux-firmware-1_20260110-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-firmware-1_20260110-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe linux-firmware-1_20260110-r0: task do_unpack: Succeeded
NOTE: Running task 668 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20260110.bb:do_patch)
NOTE: Running task 669 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20260110.bb:do_collect_spdx_deps)
NOTE: recipe linux-firmware-1_20260110-r0: task do_patch: Started
NOTE: recipe linux-firmware-1_20260110-r0: task do_collect_spdx_deps: Started
NOTE: recipe linux-firmware-1_20260110-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe linux-firmware-1_20260110-r0: task do_patch: Succeeded
NOTE: Running task 671 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20260110.bb:do_configure)
NOTE: recipe linux-firmware-1_20260110-r0: task do_configure: Started
NOTE: recipe linux-firmware-1_20260110-r0: task do_configure: Succeeded
NOTE: Running task 673 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20260110.bb:do_compile)
NOTE: recipe linux-firmware-1_20260110-r0: task do_compile: Started
NOTE: recipe linux-firmware-1_20260110-r0: task do_compile: Succeeded
NOTE: Running task 674 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20260110.bb:do_install)
NOTE: recipe linux-firmware-1_20260110-r0: task do_install: Started
NOTE: recipe linux-firmware-1_20260110-r0: task do_install: Succeeded
NOTE: Running task 675 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20260110.bb:do_package)
NOTE: recipe linux-firmware-1_20260110-r0: task do_package: Started
NOTE: recipe linux-firmware-1_20260110-r0: task do_package: Failed
NOTE: Tasks Summary: Attempted 676 tasks of which 667 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260116001210.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260116001210.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20260110.bb:do_package
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20260110/temp/log.do_package.2700675
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: linux-firmware-1_20260110-r0 do_package: QA Issue: linux-firmware: Files/directories were installed but not shipped in any package:
  /usr/lib/firmware/rcar_gen4_pcie.bin
  /usr/lib/firmware/qcom/gen80000_aqe.fw
  /usr/lib/firmware/qcom/gmu_gen70900.bin
  /usr/lib/firmware/qcom/a730_sqe.fw
  /usr/lib/firmware/qcom/a740_sqe.fw
  /usr/lib/firmware/qcom/gmu_gen70200.bin
  /usr/lib/firmware/qcom/a640_gmu.bin
  /usr/lib/firmware/qcom/gen70900_sqe.fw
  /usr/lib/firmware/qcom/gen80000_gmu.bin
  /usr/lib/firmware/qcom/gmu_gen70000.bin
  /usr/lib/firmware/qcom/gen80000_sqe.fw
  /usr/lib/firmware/qcom/gen70900_aqe.fw
  /usr/lib/firmware/qcom/sm8150
  /usr/lib/firmware/qcom/sm8450
  /usr/lib/firmware/qcom/sm8550/a740_zap.mbn
  /usr/lib/firmware/qcom/sm8650/gen70900_zap.mbn
  /usr/lib/firmware/qcom/sm8150/a640_zap.mbn
  /usr/lib/firmware/qcom/sm8750/gen80000_zap.mbn
  /usr/lib/firmware/qcom/sm8450/a730_zap.mbn
  /usr/lib/firmware/qca/ornbtfw11.tlv
  /usr/lib/firmware/qca/ornnv11.bin
  /usr/lib/firmware/airoha/an8811hb
  /usr/lib/firmware/airoha/an8811hb/EthMD32_CRC.DSP.bin
  /usr/lib/firmware/airoha/an8811hb/EthMD32_CRC.DM.bin
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
linux-firmware: 24 installed and not shipped files. [installed-vs-shipped]
ERROR: linux-firmware-1_20260110-r0 do_package: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20260110/temp/log.do_package.2700675
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20260110.bb:do_package) failed with exit code '1'

--===============0232090818807117082==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-linux-firmware-upgrade-20251125-20260110.patch"

RnJvbSBjZWE1MGY0NzQ1NmVmMTUwYThlMzFlYWE3MmFlZTBkOGQyNDQyNDhiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTYgSmFuIDIwMjYgMDA6MTM6MjcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aW51eC1maXJtd2FyZTogdXBncmFkZSAyMDI1MTEyNSAtPiAyMDI2MDExMAoKLS0tCiAuLi4yMDI1
MTEyNS5iYiA9PiBsaW51eC1maXJtd2FyZV8yMDI2MDExMC5iYn0gfCA2ODIgKysrKysrKysrKysr
KysrKystCiAxIGZpbGUgY2hhbmdlZCwgNjc5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS97bGludXgtZmlybXdh
cmVfMjAyNTExMjUuYmIgPT4gbGludXgtZmlybXdhcmVfMjAyNjAxMTAuYmJ9ICg4NiUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2Fy
ZV8yMDI1MTEyNS5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgt
ZmlybXdhcmVfMjAyNjAxMTAuYmIKc2ltaWxhcml0eSBpbmRleCA4NiUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZV8yMDI1MTEyNS5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJt
d2FyZV8yMDI2MDExMC5iYgppbmRleCBmZjg0YTNjNDY0Li5hMmZjY2Q5ZjM2IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlXzIwMjUx
MTI1LmJiCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgtZmly
bXdhcmVfMjAyNjAxMTAuYmIKQEAgLTEsMyArMSw2NzkgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklM
RVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4K
KyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRo
ZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlm
IG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3Nh
Z2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0
ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0t
LSBMSUNFTlNFLmFtZC11Y29kZQorIyArKysgTElDRU5TRS5hbWQtdWNvZGUKKyMgQEAgLTEsNCAr
MSw0IEBACisjIC1Db3B5cmlnaHQgKEMpIDIwMTAtMjAyMiBBZHZhbmNlZCBNaWNybyBEZXZpY2Vz
LCBJbmMuLCBBbGwgcmlnaHRzIHJlc2VydmVkLgorIyArQ29weXJpZ2h0IChDKSAyMDEwLTIwMjUg
QWR2YW5jZWQgTWljcm8gRGV2aWNlcywgSW5jLiwgQWxsIHJpZ2h0cyByZXNlcnZlZC4KKyMgIAor
IyAgUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCBieSBBZHZhbmNlZCBNaWNybyBEZXZpY2Vz
LCBJbmMuICgiQU1EIiksCisjICBmcmVlIG9mIGFueSBsaWNlbnNlIGZlZXMsIHRvIGFueSBwZXJz
b24gb2J0YWluaW5nIGEgY29weSBvZiB0aGlzCisjIC0tLSBXSEVOQ0UKKyMgKysrIFdIRU5DRQor
IyBAQCAtMTAzMiwzMSArMTAzMiwzMSBAQAorIyAgCisjICBGaWxlOiBpbnRlbC9pd2x3aWZpL2l3
bHdpZmktY2MtYTAtNzcudWNvZGUKKyMgIExpbms6IGl3bHdpZmktY2MtYTAtNzcudWNvZGUgLT4g
aW50ZWwvaXdsd2lmaS9pd2x3aWZpLWNjLWEwLTc3LnVjb2RlCisjIC1WZXJzaW9uOiA3NC4zMGIx
Y2JkOC4wCisjICtWZXJzaW9uOiA3NC5mMzljYzdmOS4wCisjICAKKyMgIEZpbGU6IGludGVsL2l3
bHdpZmkvaXdsd2lmaS1RdS1iMC1oci1iMC03Ny51Y29kZQorIyAgTGluazogaXdsd2lmaS1RdS1i
MC1oci1iMC03Ny51Y29kZSAtPiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktUXUtYjAtaHItYjAtNzcu
dWNvZGUKKyMgLVZlcnNpb246IDc0LjMwYjFjYmQ4LjAKKyMgK1ZlcnNpb246IDc0LmYzOWNjN2Y5
LjAKKyMgIAorIyAgRmlsZTogaW50ZWwvaXdsd2lmaS9pd2x3aWZpLVF1LWIwLWpmLWIwLTc3LnVj
b2RlCisjICBMaW5rOiBpd2x3aWZpLVF1LWIwLWpmLWIwLTc3LnVjb2RlIC0+IGludGVsL2l3bHdp
ZmkvaXdsd2lmaS1RdS1iMC1qZi1iMC03Ny51Y29kZQorIyAtVmVyc2lvbjogNzQuMzBiMWNiZDgu
MAorIyArVmVyc2lvbjogNzQuZjM5Y2M3ZjkuMAorIyAgCisjICBGaWxlOiBpbnRlbC9pd2x3aWZp
L2l3bHdpZmktUXUtYzAtaHItYjAtNzcudWNvZGUKKyMgIExpbms6IGl3bHdpZmktUXUtYzAtaHIt
YjAtNzcudWNvZGUgLT4gaW50ZWwvaXdsd2lmaS9pd2x3aWZpLVF1LWMwLWhyLWIwLTc3LnVjb2Rl
CisjIC1WZXJzaW9uOiA3NC4zMGIxY2JkOC4wCisjICtWZXJzaW9uOiA3NC5mMzljYzdmOS4wCisj
ICAKKyMgIEZpbGU6IGludGVsL2l3bHdpZmkvaXdsd2lmaS1RdS1jMC1qZi1iMC03Ny51Y29kZQor
IyAgTGluazogaXdsd2lmaS1RdS1jMC1qZi1iMC03Ny51Y29kZSAtPiBpbnRlbC9pd2x3aWZpL2l3
bHdpZmktUXUtYzAtamYtYjAtNzcudWNvZGUKKyMgLVZlcnNpb246IDc0LjMwYjFjYmQ4LjAKKyMg
K1ZlcnNpb246IDc0LmYzOWNjN2Y5LjAKKyMgIAorIyAgRmlsZTogaW50ZWwvaXdsd2lmaS9pd2x3
aWZpLVF1Wi1hMC1oci1iMC03Ny51Y29kZQorIyAgTGluazogaXdsd2lmaS1RdVotYTAtaHItYjAt
NzcudWNvZGUgLT4gaW50ZWwvaXdsd2lmaS9pd2x3aWZpLVF1Wi1hMC1oci1iMC03Ny51Y29kZQor
IyAtVmVyc2lvbjogNzQuMzBiMWNiZDguMAorIyArVmVyc2lvbjogNzQuZjM5Y2M3ZjkuMAorIyAg
CisjICBGaWxlOiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktUXVaLWEwLWpmLWIwLTc3LnVjb2RlCisj
ICBMaW5rOiBpd2x3aWZpLVF1Wi1hMC1qZi1iMC03Ny51Y29kZSAtPiBpbnRlbC9pd2x3aWZpL2l3
bHdpZmktUXVaLWEwLWpmLWIwLTc3LnVjb2RlCisjIC1WZXJzaW9uOiA3NC4zMGIxY2JkOC4wCisj
ICtWZXJzaW9uOiA3NC5mMzljYzdmOS4wCisjICAKKyMgIEZpbGU6IGludGVsL2l3bHdpZmkvaXds
d2lmaS10eS1hMC1nZi1hMC03Ny51Y29kZQorIyAgTGluazogaXdsd2lmaS10eS1hMC1nZi1hMC03
Ny51Y29kZSAtPiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktdHktYTAtZ2YtYTAtNzcudWNvZGUKKyMg
QEAgLTEwODgsNyArMTA4OCw3IEBACisjICAKKyMgIEZpbGU6IGludGVsL2l3bHdpZmkvaXdsd2lm
aS10eS1hMC1nZi1hMC04OS51Y29kZQorIyAgTGluazogaXdsd2lmaS10eS1hMC1nZi1hMC04OS51
Y29kZSAtPiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktdHktYTAtZ2YtYTAtODkudWNvZGUKKyMgLVZl
cnNpb246IDg2LjcyMDdmYzY0LjAKKyMgK1ZlcnNpb246IDg2LmRmOTU1NmZjLjAKKyMgIAorIyAg
RmlsZTogaW50ZWwvaXdsd2lmaS9pd2x3aWZpLXNvLWEwLWdmNC1hMC03Ny51Y29kZQorIyAgTGlu
azogaXdsd2lmaS1zby1hMC1nZjQtYTAtNzcudWNvZGUgLT4gaW50ZWwvaXdsd2lmaS9pd2x3aWZp
LXNvLWEwLWdmNC1hMC03Ny51Y29kZQorIyBAQCAtMTEyMCw3ICsxMTIwLDcgQEAKKyMgIAorIyAg
RmlsZTogaW50ZWwvaXdsd2lmaS9pd2x3aWZpLXNvLWEwLWdmNC1hMC04OS51Y29kZQorIyAgTGlu
azogaXdsd2lmaS1zby1hMC1nZjQtYTAtODkudWNvZGUgLT4gaW50ZWwvaXdsd2lmaS9pd2x3aWZp
LXNvLWEwLWdmNC1hMC04OS51Y29kZQorIyAtVmVyc2lvbjogODYuNzIwN2ZjNjQuMAorIyArVmVy
c2lvbjogODYuZGY5NTU2ZmMuMAorIyAgCisjICBGaWxlOiBpbnRlbC9pd2x3aWZpL2l3bHdpZmkt
c28tYTAtZ2YtYTAtNzcudWNvZGUKKyMgIExpbms6IGl3bHdpZmktc28tYTAtZ2YtYTAtNzcudWNv
ZGUgLT4gaW50ZWwvaXdsd2lmaS9pd2x3aWZpLXNvLWEwLWdmLWEwLTc3LnVjb2RlCisjIEBAIC0x
MTUyLDcgKzExNTIsNyBAQAorIyAgCisjICBGaWxlOiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktc28t
YTAtZ2YtYTAtODkudWNvZGUKKyMgIExpbms6IGl3bHdpZmktc28tYTAtZ2YtYTAtODkudWNvZGUg
LT4gaW50ZWwvaXdsd2lmaS9pd2x3aWZpLXNvLWEwLWdmLWEwLTg5LnVjb2RlCisjIC1WZXJzaW9u
OiA4Ni43MjA3ZmM2NC4wCisjICtWZXJzaW9uOiA4Ni5kZjk1NTZmYy4wCisjICAKKyMgIEZpbGU6
IGludGVsL2l3bHdpZmkvaXdsd2lmaS1zby1hMC1oci1iMC03Ny51Y29kZQorIyAgTGluazogaXds
d2lmaS1zby1hMC1oci1iMC03Ny51Y29kZSAtPiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktc28tYTAt
aHItYjAtNzcudWNvZGUKKyMgQEAgLTExODAsNyArMTE4MCw3IEBACisjICAKKyMgIEZpbGU6IGlu
dGVsL2l3bHdpZmkvaXdsd2lmaS1zby1hMC1oci1iMC04OS51Y29kZQorIyAgTGluazogaXdsd2lm
aS1zby1hMC1oci1iMC04OS51Y29kZSAtPiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktc28tYTAtaHIt
YjAtODkudWNvZGUKKyMgLVZlcnNpb246IDg2LjcyMDdmYzY0LjAKKyMgK1ZlcnNpb246IDg2LmRm
OTU1NmZjLjAKKyMgIAorIyAgRmlsZTogaW50ZWwvaXdsd2lmaS9pd2x3aWZpLXNvLWEwLWpmLWIw
LTc3LnVjb2RlCisjICBMaW5rOiBpd2x3aWZpLXNvLWEwLWpmLWIwLTc3LnVjb2RlIC0+IGludGVs
L2l3bHdpZmkvaXdsd2lmaS1zby1hMC1qZi1iMC03Ny51Y29kZQorIyBAQCAtMTI3NSw2ICsxMjc1
LDEwIEBACisjICBMaW5rOiBpd2x3aWZpLWdsLWMwLWZtLWMwLTEwMS51Y29kZSAtPiBpbnRlbC9p
d2x3aWZpL2l3bHdpZmktZ2wtYzAtZm0tYzAtMTAxLnVjb2RlCisjICBWZXJzaW9uOiA5OC42ZWYy
MGIxOS4wCisjICAKKyMgK0ZpbGU6IGludGVsL2l3bHdpZmkvaXdsd2lmaS1nbC1jMC1mbS1jMC1j
MTAxLnVjb2RlCisjICtMaW5rOiBpd2x3aWZpLWdsLWMwLWZtLWMwLWMxMDEudWNvZGUgLT4gaW50
ZWwvaXdsd2lmaS9pd2x3aWZpLWdsLWMwLWZtLWMwLWMxMDEudWNvZGUKKyMgK1ZlcnNpb246IDEw
MS42ZTY5NWE3MC4wCisjICsKKyMgIEZpbGU6IGludGVsL2l3bHdpZmkvaXdsd2lmaS1nbC1jMC1m
bS1jMC5wbnZtCisjICBMaW5rOiBpd2x3aWZpLWdsLWMwLWZtLWMwLnBudm0gLT4gaW50ZWwvaXds
d2lmaS9pd2x3aWZpLWdsLWMwLWZtLWMwLnBudm0KKyMgIAorIyBAQCAtMTMxMCw2ICsxMzE0LDEw
IEBACisjICBMaW5rOiBpd2x3aWZpLWJ6LWIwLWZtLWMwLTEwMS51Y29kZSAtPiBpbnRlbC9pd2x3
aWZpL2l3bHdpZmktYnotYjAtZm0tYzAtMTAxLnVjb2RlCisjICBWZXJzaW9uOiA5OC42ZWYyMGIx
OS4wCisjICAKKyMgK0ZpbGU6IGludGVsL2l3bHdpZmkvaXdsd2lmaS1iei1iMC1mbS1jMC1jMTAx
LnVjb2RlCisjICtMaW5rOiBpd2x3aWZpLWJ6LWIwLWZtLWMwLWMxMDEudWNvZGUgLT4gaW50ZWwv
aXdsd2lmaS9pd2x3aWZpLWJ6LWIwLWZtLWMwLWMxMDEudWNvZGUKKyMgK1ZlcnNpb246IDEwMS42
ZTY5NWE3MC4wCisjICsKKyMgIEZpbGU6IGludGVsL2l3bHdpZmkvaXdsd2lmaS1iei1iMC1mbS1j
MC5wbnZtCisjICBMaW5rOiBpd2x3aWZpLWJ6LWIwLWZtLWMwLnBudm0gLT4gaW50ZWwvaXdsd2lm
aS9pd2x3aWZpLWJ6LWIwLWZtLWMwLnBudm0KKyMgIAorIyBAQCAtMTMyMyw3ICsxMzMxLDcgQEAK
KyMgIAorIyAgRmlsZTogaW50ZWwvaXdsd2lmaS9pd2x3aWZpLW1hLWIwLWdmLWEwLTg5LnVjb2Rl
CisjICBMaW5rOiBpd2x3aWZpLW1hLWIwLWdmLWEwLTg5LnVjb2RlIC0+IGludGVsL2l3bHdpZmkv
aXdsd2lmaS1tYS1iMC1nZi1hMC04OS51Y29kZQorIyAtVmVyc2lvbjogODYuNzIwN2ZjNjQuMAor
IyArVmVyc2lvbjogODYuZGY5NTU2ZmMuMAorIyAgCisjICBGaWxlOiBpbnRlbC9pd2x3aWZpL2l3
bHdpZmktbWEtYjAtZ2YtYTAucG52bQorIyAgTGluazogaXdsd2lmaS1tYS1iMC1nZi1hMC5wbnZt
IC0+IGludGVsL2l3bHdpZmkvaXdsd2lmaS1tYS1iMC1nZi1hMC5wbnZtCisjIEBAIC0xMzM4LDcg
KzEzNDYsNyBAQAorIyAgCisjICBGaWxlOiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktbWEtYjAtZ2Y0
LWEwLTg5LnVjb2RlCisjICBMaW5rOiBpd2x3aWZpLW1hLWIwLWdmNC1hMC04OS51Y29kZSAtPiBp
bnRlbC9pd2x3aWZpL2l3bHdpZmktbWEtYjAtZ2Y0LWEwLTg5LnVjb2RlCisjIC1WZXJzaW9uOiA4
Ni43MjA3ZmM2NC4wCisjICtWZXJzaW9uOiA4Ni5kZjk1NTZmYy4wCisjICAKKyMgIEZpbGU6IGlu
dGVsL2l3bHdpZmkvaXdsd2lmaS1tYS1iMC1nZjQtYTAucG52bQorIyAgTGluazogaXdsd2lmaS1t
YS1iMC1nZjQtYTAucG52bSAtPiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktbWEtYjAtZ2Y0LWEwLnBu
dm0KKyMgQEAgLTEzNTMsMTEgKzEzNjEsMjMgQEAKKyMgIAorIyAgRmlsZTogaW50ZWwvaXdsd2lm
aS9pd2x3aWZpLW1hLWIwLWhyLWIwLTg5LnVjb2RlCisjICBMaW5rOiBpd2x3aWZpLW1hLWIwLWhy
LWIwLTg5LnVjb2RlIC0+IGludGVsL2l3bHdpZmkvaXdsd2lmaS1tYS1iMC1oci1iMC04OS51Y29k
ZQorIyAtVmVyc2lvbjogODYuNzIwN2ZjNjQuMAorIyArVmVyc2lvbjogODYuZGY5NTU2ZmMuMAor
IyAgCisjICBGaWxlOiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktc2MtYTAtd2gtYjAtMTAxLnVjb2Rl
CisjICBMaW5rOiBpd2x3aWZpLXNjLWEwLXdoLWIwLTEwMS51Y29kZSAtPiBpbnRlbC9pd2x3aWZp
L2l3bHdpZmktc2MtYTAtd2gtYjAtMTAxLnVjb2RlCisjICBWZXJzaW9uOiA5OC44MDU4NDU5MS4w
CisjICsKKyMgK0ZpbGU6IGludGVsL2l3bHdpZmkvaXdsd2lmaS1zYy1hMC13aC1iMC1jMTAxLnVj
b2RlCisjICtMaW5rOiBpd2x3aWZpLXNjLWEwLXdoLWIwLWMxMDEudWNvZGUgLT4gaW50ZWwvaXds
d2lmaS9pd2x3aWZpLXNjLWEwLXdoLWIwLWMxMDEudWNvZGUKKyMgK1ZlcnNpb246IDEwMS42ZTY5
NWE3MC4wCisjICsKKyMgK0ZpbGU6IGludGVsL2l3bHdpZmkvaXdsd2lmaS1zYy1hMC1nZi1hMC0x
MDAudWNvZGUKKyMgK0xpbms6IGl3bHdpZmktc2MtYTAtZ2YtYTAtMTAwLnVjb2RlIC0+IGludGVs
L2l3bHdpZmkvaXdsd2lmaS1zYy1hMC1nZi1hMC0xMDAudWNvZGUKKyMgK1ZlcnNpb246IDk3LmRl
MDY4NDM1ZC4wCisjICsKKyMgK0ZpbGU6IGludGVsL2l3bHdpZmkvaXdsd2lmaS1zYy1hMC1mbS1j
MC1jMTAxLnVjb2RlCisjICtMaW5rOiBpd2x3aWZpLXNjLWEwLWZtLWMwLWMxMDEudWNvZGUgLT4g
aW50ZWwvaXdsd2lmaS9pd2x3aWZpLXNjLWEwLWZtLWMwLWMxMDEudWNvZGUKKyMgK1ZlcnNpb246
IDEwMS42ZTY5NWE3MC4wCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJ
Q0VOQ0UuaXdsd2lmaV9maXJtd2FyZSBmb3IgZGV0YWlscworIyAgCisjIEBAIC0yMTIwLDYgKzIx
NDAsMTYgQEAKKyMgIAorIyAgRmlsZTogYWlyb2hhL0V0aE1EMzIuZG0uYmluCisjICBGaWxlOiBh
aXJvaGEvRXRoTUQzMi5EU1AuYmluCisjICsKKyMgK0xpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4g
U2VlIExJQ0VOU0UuYWlyb2hhIGZvciBkZXRhaWxzLgorIyArCisjICstLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQorIyArCisjICtEcml2ZXI6IGFuODgxMWhiIC0gQWlyb2hhIDIuNUcgRXRoZXJuZXQgUGh5Cisj
ICsKKyMgK0ZpbGU6IGFpcm9oYS9hbjg4MTFoYi9FdGhNRDMyX0NSQy5ETS5iaW4KKyMgK0ZpbGU6
IGFpcm9oYS9hbjg4MTFoYi9FdGhNRDMyX0NSQy5EU1AuYmluCisjICtWZXJzaW9uOiAyNTExMDcw
MgorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLmFpcm9oYSBm
b3IgZGV0YWlscy4KKyMgIAorIyBAQCAtMzk0MSw3ICszOTcxLDcgQEAKKyMgIEZpbGU6IGF0aDEx
ay9RQ0E2Njk4QVEvaHcyLjEvYm9hcmQtMi5iaW4KKyMgIEZpbGU6IGF0aDExay9RQ0E2Njk4QVEv
aHcyLjEvYW1zcy5iaW4KKyMgIEZpbGU6IGF0aDExay9RQ0E2Njk4QVEvaHcyLjEvbTMuYmluCisj
IC1WZXJzaW9uOiBXTEFOLkhTUC4xLjEtMDQ2NTAtUUNBSFNQU1dQTF9WMV9WMl9TSUxJQ09OWl9J
T0UtMgorIyArVmVyc2lvbjogV0xBTi5IU1AuMS4xLTA0ODY2LVFDQUhTUFNXUExfVjFfVjJfU0lM
SUNPTlpfSU9FLTEKKyMgIEZpbGU6IGF0aDExay9RQ0E2Njk4QVEvaHcyLjEvTm90aWNlLnR4dAor
IyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLlF1YWxjb21tQXRo
ZXJvc19hdGgxMGsgZm9yIGRldGFpbHMKKyMgQEAgLTQyMjYsMTcgKzQyNTYsMTkgQEAKKyMgIEZp
bGU6IGludGVsL2lidC0xMDQwLTIxMjAuZGRjCisjICBWZXJzaW9uOiBCVF9Tb2xhckpmcF9SRUwx
NTFfMjIuMTgwLjI0MDUuMTUxCisjICAKKyMgLUZpbGU6IGludGVsL2lidC0wMDkzLTAyOTEuc2Zp
CisjIC1GaWxlOiBpbnRlbC9pYnQtMDA5My0wMjkxLmRkYworIyAgRmlsZTogaW50ZWwvaWJ0LTAw
OTMtMDA0MS5zZmkKKyMgIEZpbGU6IGludGVsL2lidC0wMDkzLTAwNDEuZGRjCisjIC1GaWxlOiBp
bnRlbC9pYnQtMDI5MS0wMjkxLnNmaQorIyAtRmlsZTogaW50ZWwvaWJ0LTAyOTEtMDI5MS5kZGMK
KyMgIEZpbGU6IGludGVsL2lidC0wMDkzLTQxNTAuc2ZpCisjICBGaWxlOiBpbnRlbC9pYnQtMDA5
My00MTUwLmRkYworIyAgRmlsZTogaW50ZWwvaWJ0LTAwOTMtMTA1MC5zZmkKKyMgIEZpbGU6IGlu
dGVsL2lidC0wMDkzLTEwNTAuZGRjCisjIC1WZXJzaW9uOiBCVF9CbGF6YXJVX1NfUkVMOTMzMjdf
MjMuMTcwLjI1Mzc1LjkzMzI3CisjICtWZXJzaW9uOiBCVF9CbGF6YXJ1SHJwR2ZwX1NfUkVMMTkx
XzI0LjAwLjI1NDYxLjE5MQorIyArCisjICtGaWxlOiBpbnRlbC9pYnQtMDI5MS0wMjkxLnNmaQor
IyArRmlsZTogaW50ZWwvaWJ0LTAyOTEtMDI5MS5kZGMKKyMgK0ZpbGU6IGludGVsL2lidC0wMDkz
LTAyOTEuc2ZpCisjICtGaWxlOiBpbnRlbC9pYnQtMDA5My0wMjkxLmRkYworIyArVmVyc2lvbjog
QlRfQmxhemFyVV9TX1JFTDk3MzQ1XzI0LjEwLjI1NDYxLjk3MzQ1CisjICAKKyMgIEZpbGU6IGlu
dGVsL2lidC0wMTgwLTAwNDEuc2ZpCisjICBGaWxlOiBpbnRlbC9pYnQtMDE4MC0wMDQxLmRkYwor
IyBAQCAtNDI0Nyw3ICs0Mjc5LDYgQEAKKyMgIFZlcnNpb246IEJUX01hZ25ldGFyX1JFTDEwMzg4
Ml8yMy41MC4yNTIwNS4xMDM4ODIKKyMgIAorIyAgRmlsZTogaW50ZWwvaWJ0LTAxOTAtMDI5MS5z
ZmkKKyMgLUZpbGU6IGludGVsL2lidC0wMTkwLTAyOTEtaW1sLnNmaQorIyAgRmlsZTogaW50ZWwv
aWJ0LTAxOTAtMDI5MS5kZGMKKyMgIEZpbGU6IGludGVsL2lidC0wMTkwLTAwNDEuc2ZpCisjICBG
aWxlOiBpbnRlbC9pYnQtMDE5MC0wMDQxLWltbC5zZmkKKyMgQEAgLTQyNTYsMTEgKzQyODcsMzEg
QEAKKyMgIEZpbGU6IGludGVsL2lidC0wMTkwLTAwNDEtcGNpLnNmaQorIyAgRmlsZTogaW50ZWwv
aWJ0LTAxOTAtMDA0MS11c2IuZGRjCisjICBGaWxlOiBpbnRlbC9pYnQtMDE5MC0wMDQxLXVzYi5z
ZmkKKyMgK1ZlcnNpb246IEJUX0JsYXphcmlHZnBfU19SRUwxNDVfMjQuMDAuMjU0NjEuMTQ1Cisj
ICsKKyMgK0ZpbGU6IGludGVsL2lidC0wMTkwLTAyOTEtaW1sLnNmaQorIyArRmlsZTogaW50ZWwv
aWJ0LTAxOTAtMDI5MS11c2IuZGRjCisjICtGaWxlOiBpbnRlbC9pYnQtMDE5MC0wMjkxLXVzYi5z
ZmkKKyMgIEZpbGU6IGludGVsL2lidC0wMTkwLTAyOTEtcGNpLmRkYworIyAgRmlsZTogaW50ZWwv
aWJ0LTAxOTAtMDI5MS1wY2kuc2ZpCisjIC1GaWxlOiBpbnRlbC9pYnQtMDE5MC0wMjkxLXVzYi5k
ZGMKKyMgLUZpbGU6IGludGVsL2lidC0wMTkwLTAyOTEtdXNiLnNmaQorIyAtVmVyc2lvbjogQlRf
QmxhemFySV9TX1JFTDEwMDg3Nl8yMy4xNzAuMjUzNzUuMTAwODc2CisjICtWZXJzaW9uOiBCVF9C
bGF6YXJJX1NfUkVMMTA0ODI5XzI0LjEwLjI1NDYxLjEwNDgyOQorIyArCisjICtGaWxlOiBpbnRl
bC9pYnQtMDBhMC0wMWExLWltbC5zZmkKKyMgK0ZpbGU6IGludGVsL2lidC0wMGEwLTAxYTEtcGNp
LmRkYworIyArRmlsZTogaW50ZWwvaWJ0LTAwYTAtMDFhMS1wY2kuc2ZpCisjICtGaWxlOiBpbnRl
bC9pYnQtMDBhMC0wMWExLXVzYi5kZGMKKyMgK0ZpbGU6IGludGVsL2lidC0wMGEwLTAxYTEtdXNi
LnNmaQorIyArRmlsZTogaW50ZWwvaWJ0LTAwYTAtMDI5MS1pbWwuc2ZpCisjICtGaWxlOiBpbnRl
bC9pYnQtMDBhMC0wMjkxLXBjaS5kZGMKKyMgK0ZpbGU6IGludGVsL2lidC0wMGEwLTAyOTEtcGNp
LnNmaQorIyArRmlsZTogaW50ZWwvaWJ0LTAwYTAtMDI5MS11c2IuZGRjCisjICtGaWxlOiBpbnRl
bC9pYnQtMDBhMC0wMjkxLXVzYi5zZmkKKyMgK1ZlcnNpb246IEJUX1Njb3JwaXVzX1NfUkVMNjg5
MzVfMjQuMTAuMjU0NjEuNjg5MzUKKyMgKworIyArRmlsZTogaW50ZWwvaWJ0LTAwYTAtMDA0MS1p
bWwuc2ZpCisjICtGaWxlOiBpbnRlbC9pYnQtMDBhMC0wMDQxLXBjaS5kZGMKKyMgK0ZpbGU6IGlu
dGVsL2lidC0wMGEwLTAwNDEtcGNpLnNmaQorIyArVmVyc2lvbjogQlRfU2NvcnBpdXNfU19SRUw2
MzQxOF8yNC4wMC4yNTM3NC42MzQxOAorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUu
IFNlZSBMSUNFTkNFLmlidF9maXJtd2FyZSBmb3IgZGV0YWlscworIyAgCisjIEBAIC00MzkwLDcg
KzQ0NDEsNyBAQAorIyAgUmF3RmlsZTogYW1kLXVjb2RlL21pY3JvY29kZV9hbWRfZmFtMTloLmJp
bgorIyAgVmVyc2lvbjogMjAyNS0xMC0yNworIyAgUmF3RmlsZTogYW1kLXVjb2RlL21pY3JvY29k
ZV9hbWRfZmFtMWFoLmJpbgorIyAtVmVyc2lvbjogMjAyNS0xMS0xMworIyArVmVyc2lvbjogMjAy
NS0xMi0wMgorIyAgRmlsZTogYW1kLXVjb2RlL1JFQURNRQorIyAgCisjICBMaWNlbnNlOiBSZWRp
c3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLmFtZC11Y29kZSBmb3IgZGV0YWlscworIyBAQCAtNDgw
OCw2ICs0ODU5LDE2IEBACisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAKKyMgK0RyaXZl
cjogYnRxY2EgLSBRdWFsY29tbSBBdGhlcm9zIEJsdWV0b290aCBzdXBwb3J0IGZvciBRQ0FfUUND
MjA3MiBjaGlwCisjICsKKyMgK0ZpbGU6IHFjYS9vcm5idGZ3MTEudGx2CisjICtWZXJzaW9uOiBC
VEZXLk9STkUuMS4xLjAtMDAyMDItUEFUQ0gtMl9ERUYKKyMgK0ZpbGU6IHFjYS9vcm5udjExLmJp
bgorIyArCisjICtMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLlF1YWxjb21t
QXRoZXJvc19hdGgxMGsgYW5kIHFjYS9OT1RJQ0UudHh0IGZvciBkZXRhaWxzCisjICsKKyMgKy0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KKyMgKworIyAgRHJpdmVyOiBxY2EgLSBRdWFsY29tbSBBdGhlcm9zIEJs
dWV0b290aCBzdXBwb3J0IGZvciBXQ04zOTUwIGNoaXBzCisjICAKKyMgIEZpbGU6IHFjYS9jbWJ0
ZncxMi50bHYKKyMgQEAgLTQ4NTMsMTUgKzQ5MTQsMTUgQEAKKyMgIERyaXZlcjogcWNhIC0gUXVh
bGNvbW0gQXRoZXJvcyBCbHVldG9vdGggc3VwcG9ydCBmb3IgV0NONjc1MCBjaGlwcworIyAgCisj
ICBGaWxlOiBxY2EvbXNidGZ3MTEubWJuCisjIC1WZXJzaW9uOiBCVEZXLk1PU0VMTEUuMS4xLjMt
MDAxMDAtTVNMX1BBVENIWi0xCisjICtWZXJzaW9uOiBCVEZXLk1PU0VMTEUuMS4xLjMtMDAxMDUt
TVNMX1BBVENIWi0xCisjICBGaWxlOiBxY2EvbXNidGZ3MTEudGx2CisjIC1WZXJzaW9uOiBCVEZX
Lk1PU0VMTEUuMS4xLjMtMDAxMDAtTVNMX1BBVENIWi0xCisjICtWZXJzaW9uOiBCVEZXLk1PU0VM
TEUuMS4xLjMtMDAxMDUtTVNMX1BBVENIWi0xCisjICBGaWxlOiBxY2EvbXNudjExLmJpbgorIyAt
VmVyc2lvbjogQlRGVy5NT1NFTExFLjEuMS4zLTAwMTAwLU1TTF9QQVRDSFotMQorIyArVmVyc2lv
bjogQlRGVy5NT1NFTExFLjEuMS4zLTAwMTA1LU1TTF9QQVRDSFotMQorIyAgRmlsZTogcWNhL21z
bnYxMS5iMGEKKyMgLVZlcnNpb246IEJURlcuTU9TRUxMRS4xLjEuMy0wMDEwMC1NU0xfUEFUQ0ha
LTEKKyMgK1ZlcnNpb246IEJURlcuTU9TRUxMRS4xLjEuMy0wMDEwNS1NU0xfUEFUQ0haLTEKKyMg
IEZpbGU6IHFjYS9tc252MTEuYjA5CisjIC1WZXJzaW9uOiBCVEZXLk1PU0VMTEUuMS4xLjMtMDAx
MDAtTVNMX1BBVENIWi0xCisjICtWZXJzaW9uOiBCVEZXLk1PU0VMTEUuMS4xLjMtMDAxMDUtTVNM
X1BBVENIWi0xCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0Uu
UXVhbGNvbW1BdGhlcm9zX2F0aDEwayBhbmQgcWNhL05PVElDRS50eHQgZm9yIGRldGFpbHMKKyMg
IAorIyBAQCAtNTM3NywxMCArNTQzOCwxMyBAQAorIyAgVmVyc2lvbjogRE1DIEFQSS9BUEIgdmVy
IDIgcmVsZWFzZSAyOSBmb3IgWGUyTFBECisjICAKKyMgIEZpbGU6IGk5MTUveGUzbHBkX2RtYy5i
aW4KKyMgLVZlcnNpb246IERNQyBBUEkvQVBCIHZlciAyIHJlbGVhc2UgMzIgZm9yIFhlM0xQRAor
IyArVmVyc2lvbjogRE1DIEFQSS9BUEIgdmVyIDIgcmVsZWFzZSAzMyBmb3IgWGUzTFBECisjICAK
KyMgIEZpbGU6IGk5MTUveGUzbHBkXzMwMDJfZG1jLmJpbgorIyAtVmVyc2lvbjogRE1DIEFQSS9B
UEIgdmVyIDIgcmVsZWFzZSAyNyBmb3IgWGUzTFBEXzMwMDIKKyMgK1ZlcnNpb246IERNQyBBUEkv
QVBCIHZlciAyIHJlbGVhc2UgMjggZm9yIFhlM0xQRF8zMDAyCisjICsKKyMgK0ZpbGU6IGk5MTUv
eGUzcF9scGRfZG1jLmJpbgorIyArVmVyc2lvbjogRE1DIEFQSS9BUEIgdmVyIDIgcmVsZWFzZSAz
MyBmb3IgWGUzcF9MUEQKKyMgIAorIyAgTGljZW5zZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElD
RU5TRS5pOTE1IGZvciBkZXRhaWxzCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyBAQCAtNTM5Nyw3
ICs1NDYxLDcgQEAKKyMgIFZlcnNpb246IEh1QyBBUEkvQVBCIHZlciA5LjQuMTMgZm9yIEx1bmFy
bGFrZQorIyAgCisjICBGaWxlOiB4ZS9ibWdfZ3VjXzcwLmJpbgorIyAtVmVyc2lvbjogR3VDIEFQ
SS9BUEIgdmVyIDcwLjUzLjAgZm9yIEJhdHRsZW1hZ2UKKyMgK1ZlcnNpb246IEd1QyBBUEkvQVBC
IHZlciA3MC41NS4zIGZvciBCYXR0bGVtYWdlCisjICAKKyMgIEZpbGU6IHhlL2JtZ19odWMuYmlu
CisjICBWZXJzaW9uOiBIdUMgQVBJL0FQQiB2ZXIgOC4yLjEwIGZvciBCYXR0bGVtYWdlCisjIEBA
IC01NDA2LDcgKzU0NzAsNyBAQAorIyAgVmVyc2lvbjogZmFuX2NvbnRyb2wgdmVyIDIwMy4wLjAu
MCBmb3IgQmF0dGxlbWFnZQorIyAgCisjICBGaWxlOiB4ZS9wdGxfZ3VjXzcwLmJpbgorIyAtVmVy
c2lvbjogR3VDIEFQSS9BUEIgdmVyIDcwLjUzLjAgZm9yIFBhbnRoZXJsYWtlCisjICtWZXJzaW9u
OiBHdUMgQVBJL0FQQiB2ZXIgNzAuNTUuMyBmb3IgUGFudGhlcmxha2UKKyMgIAorIyAgRmlsZTog
eGUvcHRsX2h1Yy5iaW4KKyMgIFZlcnNpb246IEh1QyBBUEkvQVBCIHZlciAxMC4zLjMgZm9yIFBh
bnRoZXJsYWtlCisjIEBAIC02MTU4LDkgKzYyMjIsOSBAQAorIyAgRHJpdmVyOiBtdDc5MjAgLSBN
ZWRpYVRlayBNVDc5MjAgV2lyZWxlc3MgTUFDcworIyAgCisjICBGaWxlOiBtZWRpYXRlay9XSUZJ
X01UNzk2MV9wYXRjaF9tY3VfMWFfMl9oZHIuYmluCisjIC1WZXJzaW9uOiAyMDI1MTAyMDE1MDg0
M2EKKyMgK1ZlcnNpb246IDIwMjYwMTA1MTUxMDEyYQorIyAgRmlsZTogbWVkaWF0ZWsvV0lGSV9S
QU1fQ09ERV9NVDc5NjFfMWEuYmluCisjIC1WZXJzaW9uOiAyMDI1MTAyMDE1MTQwMQorIyArVmVy
c2lvbjogMjAyNjAxMDUxNTE4MDUKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBT
ZWUgTElDRU5DRS5tZWRpYXRlayBmb3IgZGV0YWlscy4KKyMgIAorIyBAQCAtNjE2OSw3ICs2MjMz
LDcgQEAKKyMgIERyaXZlcjogbXQ3OTIwIC0gTWVkaWFUZWsgTVQ3OTIwIGJsdWV0b290aCBjaGlw
c2V0CisjICAKKyMgIEZpbGU6IG1lZGlhdGVrL0JUX1JBTV9DT0RFX01UNzk2MV8xYV8yX2hkci5i
aW4KKyMgLVZlcnNpb246IDIwMjUxMDIwMTUxMjU1CisjICtWZXJzaW9uOiAyMDI2MDEwNTE1MTM1
MAorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLm1lZGlhdGVr
IGZvciBkZXRhaWxzLgorIyAgCisjIEBAIC02MTk4LDkgKzYyNjIsOSBAQAorIyAgRHJpdmVyOiBt
dDc5MjIgLSBNZWRpYVRlayBNVDc5MjIgV2lyZWxlc3MgTUFDcworIyAgCisjICBGaWxlOiBtZWRp
YXRlay9XSUZJX01UNzkyMl9wYXRjaF9tY3VfMV8xX2hkci5iaW4KKyMgLVZlcnNpb246IDIwMjUx
MTE4MTYzMTQzYQorIyArVmVyc2lvbjogMjAyNjAxMDYxNTM0MTZhCisjICBGaWxlOiBtZWRpYXRl
ay9XSUZJX1JBTV9DT0RFX01UNzkyMl8xLmJpbgorIyAtVmVyc2lvbjogMjAyNTExMTgxNjMxMzkK
KyMgK1ZlcnNpb246IDIwMjYwMTA2MTUzNDI4CisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0
YWJsZS4gU2VlIExJQ0VOQ0UubWVkaWF0ZWsgZm9yIGRldGFpbHMuCisjICAKKyMgQEAgLTYyMDks
NyArNjI3Myw3IEBACisjICBEcml2ZXI6IG10NzkyMiAtIE1lZGlhVGVrIE1UNzkyMiBibHVldG9v
dGggY2hpcHNldAorIyAgCisjICBGaWxlOiBtZWRpYXRlay9CVF9SQU1fQ09ERV9NVDc5MjJfMV8x
X2hkci5iaW4KKyMgLVZlcnNpb246IDIwMjUxMTE4MTYzNDQ3CisjICtWZXJzaW9uOiAyMDI2MDEw
NjE1MzczNQorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLm1l
ZGlhdGVrIGZvciBkZXRhaWxzLgorIyAgCisjIEBAIC02MjE4LDkgKzYyODIsOSBAQAorIyAgRHJp
dmVyOiBtdDc5MjUgLSBNZWRpYVRlayBNVDc5MjUgV2lyZWxlc3MgTUFDcworIyAgCisjICBGaWxl
OiBtZWRpYXRlay9tdDc5MjUvV0lGSV9NVDc5MjVfUEFUQ0hfTUNVXzFfMV9oZHIuYmluCisjIC1W
ZXJzaW9uOiAyMDI1MTAxNTIxMjkyN2EKKyMgK1ZlcnNpb246IDIwMjYwMTA2MTUzMDA3YQorIyAg
RmlsZTogbWVkaWF0ZWsvbXQ3OTI1L1dJRklfUkFNX0NPREVfTVQ3OTI1XzFfMS5iaW4KKyMgLVZl
cnNpb246IDIwMjUxMDE1MjEyODE0CisjICtWZXJzaW9uOiAyMDI2MDEwNjE1MjgwMgorIyAgCisj
ICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLm1lZGlhdGVrIGZvciBkZXRh
aWxzLgorIyAgCisjIEBAIC02MjI5LDcgKzYyOTMsNyBAQAorIyAgRHJpdmVyOiBtdDc5MjUgLSBN
ZWRpYVRlayBNVDc5MjUgYmx1ZXRvb3RoIGNoaXBzZXQKKyMgIAorIyAgRmlsZTogbWVkaWF0ZWsv
bXQ3OTI1L0JUX1JBTV9DT0RFX01UNzkyNV8xXzFfaGRyLmJpbgorIyAtVmVyc2lvbjogMjAyNTEw
MTUyMTMyMDEKKyMgK1ZlcnNpb246IDIwMjYwMTA2MTUzMzE0CisjICAKKyMgIExpY2VuY2U6IFJl
ZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UubWVkaWF0ZWsgZm9yIGRldGFpbHMuCisjICAKKyMg
QEAgLTY0NTYsNyArNjUyMCw3IEBACisjICBGaWxlOiBxY29tL3ZlbnVzLTUuNC92ZW51cy5tYm4K
KyMgIExpbms6IHFjb20vdmVudXMtNS40L3ZlbnVzLm1kdCAtPiB2ZW51cy5tYm4KKyMgIAorIyAt
VmVyc2lvbjogVklERU8uVkUuNS40LTAwMDYyLVBST0QtMQorIyArVmVyc2lvbjogVklERU8uVkUu
NS40LTAwMDYzLVBST0QtMQorIyAgCisjICBGaWxlOiBxY29tL3ZlbnVzLTYuMC92ZW51cy5tYm4K
KyMgIAorIyBAQCAtNjQ3MSw3ICs2NTM1LDcgQEAKKyMgIExpbms6IHFjb20vdnB1LTEuMC92ZW51
cy5tYm4gLT4gLi4vdnB1L3ZwdTIwX3A0Lm1ibgorIyAgTGluazogcWNvbS92cHUtMS4wL3ZlbnVz
Lm1kdCAtPiAuLi92cHUvdnB1MjBfcDQubWJuCisjICAKKyMgLVZlcnNpb246IFZJREVPLlZQVS4x
LjAtMDAxMTktUFJPRC0xCisjICtWZXJzaW9uOiBWSURFTy5WUFUuMS4wLTAwMTE5CisjICAKKyMg
IExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UucWNvbSBhbmQgcWNvbS9OT1RJ
Q0UudHh0IGZvciBkZXRhaWxzCisjICAKKyMgQEAgLTY0ODksNyArNjU1Myw3IEBACisjICBGaWxl
OiBxY29tL3ZwdS92cHUzMF9wNF9zNy5tYm4KKyMgIExpbms6IHFjb20vdnB1L3ZwdTMwX3A0Lm1i
biAtPiB2cHUzMF9wNF9zNy5tYm4KKyMgIAorIyAtVmVyc2lvbjogVklERU8uVlBVLjMuMS0wMDk2
CisjICtWZXJzaW9uOiBWSURFTy5WUFUuMy4xLTAwOTUKKyMgIAorIyAgRmlsZTogcWNvbS92cHUv
dnB1MzBfcDRfczYubWJuCisjICAKKyMgQEAgLTY1NDYsNiArNjYxMCw3IEBACisjICBWZXJzaW9u
OiAxLjg3LjAxCisjICBGaWxlOiBxY29tL2E1MzBfcG00LmZ3CisjICBGaWxlOiBxY29tL2E1MzB2
M19ncG11LmZ3MgorIyArVmVyc2lvbiB2Mi4wNCAoMjAxNS0wOC0zMSkKKyMgIEZpbGU6IHFjb20v
YXBxODA5Ni9hNTMwX3phcC5tYm4KKyMgIExpbms6IHFjb20vYTUzMF96YXAubWR0IC0+IGFwcTgw
OTYvYTUzMF96YXAubWJuCisjICBGaWxlOiBxY29tL3FyYjQyMTAvYTYxMF96YXAubWJuCisjIEBA
IC02NTYxLDYgKzY2MjYsMTAgQEAKKyMgIEZpbGU6IHFjb20vYTYzMF9zcWUuZncKKyMgIFZlcnNp
b246IHYyLjA3CisjICBGaWxlOiBxY29tL3NkbTg0NS9hNjMwX3phcC5tYm4KKyMgK0ZpbGU6IHFj
b20vYTY0MF9nbXUuYmluCisjICtWZXJzaW9uOiB2MS4wNQorIyArRmlsZTogcWNvbS9zbTgxNTAv
YTY0MF96YXAubWJuCisjICtWZXJzaW9uOiB2MC4yMAorIyAgRmlsZTogcWNvbS9hNjUwX2dtdS5i
aW4KKyMgIFZlcnNpb246IHYyLjEuOAorIyAgRmlsZTogcWNvbS9hNjUwX3NxZS5mdworIyBAQCAt
NjU4MiwxOCArNjY1MSw0NiBAQAorIyAgRmlsZTogcWNvbS9hNzAyX3NxZS5mdworIyAgVmVyc2lv
bjogdjAuNDcKKyMgIEZpbGU6IHFjb20vcWNtMjI5MC9hNzAyX3phcC5tYm4KKyMgK0ZpbGU6IHFj
b20vYTczMF9zcWUuZncKKyMgK1ZlcnNpb246IHYxLjgxCisjICtGaWxlOiBxY29tL2dtdV9nZW43
MDAwMC5iaW4KKyMgK1ZlcnNpb246IHY0LjAwLjA3CisjICtGaWxlOiBxY29tL3NtODQ1MC9hNzMw
X3phcC5tYm4KKyMgK1ZlcnNpb246IHYwLjE0CisjICtGaWxlOiBxY29tL2E3NDBfc3FlLmZ3Cisj
ICtWZXJzaW9uOiB2MS44MQorIyArRmlsZTogcWNvbS9nbXVfZ2VuNzAyMDAuYmluCisjICtWZXJz
aW9uOiB2NC4wMS4wOQorIyArRmlsZTogcWNvbS9zbTg1NTAvYTc0MF96YXAubWJuCisjICtWZXJz
aW9uOiB2MC4xMQorIyAgRmlsZTogcWNvbS9nZW43MDUwMF9nbXUuYmluCisjICBWZXJzaW9uOiB2
NC4wMy4xMQorIyAgRmlsZTogcWNvbS9nZW43MDUwMF9zcWUuZncKKyMgIFZlcnNpb246IHYxLjYy
CisjICBGaWxlOiBxY29tL3gxZTgwMTAwL2dlbjcwNTAwX3phcC5tYm4KKyMgIFZlcnNpb246IHYw
LjE1CisjICtGaWxlOiBxY29tL2dlbjcwOTAwX2FxZS5mdworIyArVmVyc2lvbjogdjAuMjMKKyMg
K0ZpbGU6IHFjb20vZ2VuNzA5MDBfc3FlLmZ3CisjICtWZXJzaW9uOiB2MS44MQorIyArRmlsZTog
cWNvbS9nbXVfZ2VuNzA5MDAuYmluCisjICtWZXJzaW9uOiB2NC4wMi4xNAorIyArRmlsZTogcWNv
bS9zbTg2NTAvZ2VuNzA5MDBfemFwLm1ibgorIyArVmVyc2lvbjogdjAuMTMKKyMgIEZpbGU6IHFj
b20vZ2VuNzE1MDBfZ211LmJpbgorIyAgVmVyc2lvbjogdjQuMDYuMDQKKyMgIEZpbGU6IHFjb20v
Z2VuNzE1MDBfc3FlLmZ3CisjICBWZXJzaW9uOiB2MS44MQorIyAgRmlsZTogcWNvbS94MXA0MjEw
MC9nZW43MTUwMF96YXAubWJuCisjICBWZXJzaW9uOiB2MC4xMworIyArRmlsZTogcWNvbS9nZW44
MDAwMF9hcWUuZncKKyMgK1ZlcnNpb246IHYwLjE0CisjICtGaWxlOiBxY29tL2dlbjgwMDAwX2dt
dS5iaW4KKyMgK1ZlcnNpb246IHY1LjAxLjE5CisjICtGaWxlOiBxY29tL2dlbjgwMDAwX3NxZS5m
dworIyArVmVyc2lvbjogdjAuNzcKKyMgK0ZpbGU6IHFjb20vc204NzUwL2dlbjgwMDAwX3phcC5t
Ym4KKyMgK1ZlcnNpb246IHYwLjAyCisjICBGaWxlOiBxY29tL2dlbjgwMjAwX2FxZS5mdworIyAg
VmVyc2lvbjogdjAuMjUKKyMgIEZpbGU6IHFjb20vZ2VuODAyMDBfZ211LmJpbgorIyBAQCAtNjY1
Niw3ICs2NzUzLDcgQEAKKyMgIFJhd0ZpbGU6IHFjb20vcWNtNjQ5MC9hZHNwdWEuanNuCisjICBS
YXdGaWxlOiBxY29tL3FjbTY0OTAvYmF0dG1nci5qc24KKyMgIEZpbGU6IHFjb20vcWNtNjQ5MC9j
ZHNwLm1ibgorIyAtVmVyc2lvbjogQ0RTUC5IVC4yLjUuYzMtMDAxMDMtS09ESUFLLTEKKyMgK1Zl
cnNpb246IENEU1AuSFQuMi41LmMzLTAwMTMwLUtPRElBSy0xCisjICBSYXdGaWxlOiBxY29tL3Fj
bTY0OTAvY2RzcHIuanNuCisjICBGaWxlOiBxY29tL3FjbTY0OTAvaXBhX2Z3cy5tYm4KKyMgIExp
bms6IHFjb20vcWNzNjQ5MC9hZHNwLm1ibiAtPiAuLi9xY202NDkwL2Fkc3AubWJuCisjIEBAIC02
NzMyLDEzICs2ODI5LDYgQEAKKyMgIFZlcnNpb246IHZpZGVvLWZpcm13YXJlLjEuMS1iMTU4MDg3
MTQwMzU1ODgzZGM0MGIwMDQwMzI4NTZhOGZlYjVkNTY1CisjICBGaWxlOiBxY29tL3gxZTgwMTAw
L0xFTk9WTy8yMU4xL3FjdnNzODM4MC5tYm4KKyMgIFZlcnNpb246IHZmdy0zLjE6cmVsMDA4NS0w
NzBmYTMzMTFkOWVmOTY4MDE1ZmVlN2ZlYTA3MTk4ZDdlYjIwOGExCisjIC1GaWxlOiBxY29tL3gx
ZTgwMTAwL2Fkc3AubWJuCisjIC1GaWxlOiBxY29tL3gxZTgwMTAwL2Fkc3BfZHRiLm1ibgorIyAt
VmVyc2lvbjogQURTUC5IVC41LjktMDA3OTYtSEFNT0EtMQorIyAtUmF3RmlsZTogcWNvbS94MWU4
MDEwMC9hZHNwci5qc24KKyMgLVJhd0ZpbGU6IHFjb20veDFlODAxMDAvYWRzcHMuanNuCisjIC1S
YXdGaWxlOiBxY29tL3gxZTgwMTAwL2Fkc3B1YS5qc24KKyMgLVJhd0ZpbGU6IHFjb20veDFlODAx
MDAvYmF0dG1nci5qc24KKyMgIFJhd0ZpbGU6IHFjb20veDFlODAxMDAvTEVOT1ZPLzIxTjEvYWRz
cHVhLmpzbgorIyAgRmlsZTogcWNvbS94MWU4MDEwMC9jZHNwLm1ibgorIyAgRmlsZTogcWNvbS94
MWU4MDEwMC9jZHNwX2R0Yi5tYm4KKyMgQEAgLTY4MDIsMzEgKzY4OTIsMzAgQEAKKyMgIEZpbGU6
IHFjb20va2FhbmFwYWxpL3NvY2NwX2R0Yi5tYm4KKyMgIFZlcnNpb246IFNPQ0NQLkZXLjIuMS0w
MDIwNC1LQUFOQVBBTElfU09DQ1BfUEFDSy0xCisjICBSYXdGaWxlOiBxY29tL2thYW5hcGFsaS9z
b2NjcHIuanNuCisjICtGaWxlOiBxY29tL3FjczgzMDAvYWRzcC5tYm4KKyMgK1ZlcnNpb246IERT
UC5BVC4xLjAuMS0wMDE3MC1MRU1BTlMtMQorIyArUmF3RmlsZTogcWNvbS9xY3M4MzAwL2Fkc3By
LmpzbgorIyArUmF3RmlsZTogcWNvbS9xY3M4MzAwL2Fkc3B1YS5qc24KKyMgK0ZpbGU6IHFjb20v
cWNzODMwMC9jZHNwMC5tYm4KKyMgK1ZlcnNpb246IERTUC5BVC4xLjAuMS0wMDE3MC1MRU1BTlMt
MQorIyArUmF3RmlsZTogcWNvbS9xY3M4MzAwL2Nkc3ByLmpzbgorIyArRmlsZTogcWNvbS9xY3M4
MzAwL2dwZHNwMC5tYm4KKyMgK1ZlcnNpb246IERTUC5BVC4xLjAuMS0wMDE3MC1MRU1BTlMtMQor
IyAgRmlsZTogcWNvbS9zYTg3NzVwL2Fkc3AubWJuCisjIC1WZXJzaW9uOiBEU1AuQVQuMS4wLjEt
MDAxNjMtTEVNQU5TLTEKKyMgK1ZlcnNpb246IERTUC5BVC4xLjAuMS0wMDE5MC1MRU1BTlMtMQor
IyAgUmF3RmlsZTogcWNvbS9zYTg3NzVwL2Fkc3ByLmpzbgorIyAgUmF3RmlsZTogcWNvbS9zYTg3
NzVwL2Fkc3B1YS5qc24KKyMgIEZpbGU6IHFjb20vc2E4Nzc1cC9jZHNwMC5tYm4KKyMgLVZlcnNp
b246IERTUC5BVC4xLjAuMS0wMDE2My1MRU1BTlMtMQorIyArVmVyc2lvbjogRFNQLkFULjEuMC4x
LTAwMTkwLUxFTUFOUy0xCisjICBGaWxlOiBxY29tL3NhODc3NXAvY2RzcDEubWJuCisjIC1WZXJz
aW9uOiBEU1AuQVQuMS4wLjEtMDAxNjMtTEVNQU5TLTEKKyMgK1ZlcnNpb246IERTUC5BVC4xLjAu
MS0wMDE5MC1MRU1BTlMtMQorIyAgUmF3RmlsZTogcWNvbS9zYTg3NzVwL2Nkc3ByLmpzbgorIyAg
RmlsZTogcWNvbS9zYTg3NzVwL2dwZHNwMC5tYm4KKyMgLVZlcnNpb246IERTUC5BVC4xLjAuMS0w
MDE2My1MRU1BTlMtMQorIyArVmVyc2lvbjogRFNQLkFULjEuMC4xLTAwMTkwLUxFTUFOUy0xCisj
ICBGaWxlOiBxY29tL3NhODc3NXAvZ3Bkc3AxLm1ibgorIyAtVmVyc2lvbjogRFNQLkFULjEuMC4x
LTAwMTYzLUxFTUFOUy0xCisjICtWZXJzaW9uOiBEU1AuQVQuMS4wLjEtMDAxOTAtTEVNQU5TLTEK
KyMgIFJhd0ZpbGU6IHFjb20vc2E4Nzc1cC9ncGRzcDFyLmpzbgorIyAgUmF3RmlsZTogcWNvbS9z
YTg3NzVwL2dwZHNwci5qc24KKyMgLUZpbGU6IHFjb20vcWNzODMwMC9hZHNwLm1ibgorIyAtVmVy
c2lvbjogRFNQLkFULjEuMC4xLTAwMTYzLUxFTUFOUy0xCisjIC1SYXdGaWxlOiBxY29tL3Fjczgz
MDAvYWRzcHIuanNuCisjIC1SYXdGaWxlOiBxY29tL3FjczgzMDAvYWRzcHVhLmpzbgorIyAtRmls
ZTogcWNvbS9xY3M4MzAwL2Nkc3AwLm1ibgorIyAtVmVyc2lvbjogRFNQLkFULjEuMC4xLTAwMTYz
LUxFTUFOUy0xCisjIC1SYXdGaWxlOiBxY29tL3FjczgzMDAvY2RzcHIuanNuCisjIC1GaWxlOiBx
Y29tL3FjczgzMDAvZ3Bkc3AwLm1ibgorIyAtVmVyc2lvbjogRFNQLkFULjEuMC4xLTAwMTYzLUxF
TUFOUy0xCisjIC0KKyMgIEZpbGU6IHFjb20vc204NzUwL2Fkc3AubWJuCisjICBGaWxlOiBxY29t
L3NtODc1MC9hZHNwX2R0Yi5tYm4KKyMgIFZlcnNpb246IExQQUlEU1AuSFQuMS4yLmMxLTAwMzc5
LVBBS0FMQS0xCisjIEBAIC02ODM4LDYgKzY5MjcsMTMgQEAKKyMgIEZpbGU6IHFjb20vc204NzUw
L2Nkc3BfZHRiLm1ibgorIyAgVmVyc2lvbjogQ0RTUC5IVC4zLjEtMDA4ODMtUEFLQUxBLTEKKyMg
IFJhd0ZpbGU6IHFjb20vc204NzUwL2Nkc3ByLmpzbgorIyArRmlsZTogcWNvbS94MWU4MDEwMC9h
ZHNwLm1ibgorIyArRmlsZTogcWNvbS94MWU4MDEwMC9hZHNwX2R0Yi5tYm4KKyMgK1ZlcnNpb246
IEFEU1AuSFQuNS45LTAwODI4LUhBTU9BLTEKKyMgK1Jhd0ZpbGU6IHFjb20veDFlODAxMDAvYWRz
cHIuanNuCisjICtSYXdGaWxlOiBxY29tL3gxZTgwMTAwL2Fkc3BzLmpzbgorIyArUmF3RmlsZTog
cWNvbS94MWU4MDEwMC9hZHNwdWEuanNuCisjICtSYXdGaWxlOiBxY29tL3gxZTgwMTAwL2JhdHRt
Z3IuanNuCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UucWNv
bS0yIGFuZCBxY29tL05PVElDRS50eHQgZm9yIGRldGFpbHMKKyMgIAorIyBAQCAtNjkzNSw2ICs3
MDMxLDEwIEBACisjICBGaWxlOiBtZWxsYW5veC9tbHhzd19zcGVjdHJ1bTItMjkuMjAxNC40MDEy
Lm1mYTIKKyMgIEZpbGU6IG1lbGxhbm94L21seHN3X3NwZWN0cnVtMy0zMC4yMDE0LjQwMTIubWZh
MgorIyAgRmlsZTogbWVsbGFub3gvbWx4c3dfc3BlY3RydW00LTM0LjIwMTQuNDAxMi5tZmEyCisj
ICtGaWxlOiBtZWxsYW5veC9tbHhzd19zcGVjdHJ1bS0xMy4yMDE2LjM5MDAubWZhMgorIyArRmls
ZTogbWVsbGFub3gvbWx4c3dfc3BlY3RydW0yLTI5LjIwMTYuMzkwMC5tZmEyCisjICtGaWxlOiBt
ZWxsYW5veC9tbHhzd19zcGVjdHJ1bTMtMzAuMjAxNi4zOTAwLm1mYTIKKyMgK0ZpbGU6IG1lbGxh
bm94L21seHN3X3NwZWN0cnVtNC0zNC4yMDE2LjM5MDAubWZhMgorIyAgCisjICBMaWNlbmNlOiBS
ZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLm1lbGxhbm94IGZvciBkZXRhaWxzLgorIyAgCisj
IEBAIC03OTA3LDEyICs4MDA3LDE1IEBACisjICBMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNw
ay1wcm90LTEwM2M4ZDlmLndtZncgLT4gY3MzNWw0MS92Ni44My4wL2hhbG9fY3NwbF9SQU1fcmV2
QjJfMjkuODUuMC53bWZ3CisjICBMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEw
M2M4ZGE3LndtZncgLT4gY3MzNWw0MS92Ni44My4wL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuODUu
MC53bWZ3CisjICBMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4ZTM2Lndt
ZncgLT4gY3MzNWw0MS92Ni44My4wL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuODUuMC53bWZ3Cisj
ICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4ZTljLndtZncgLT4gY3Mz
NWw0MS92Ni44My4wL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuODUuMC53bWZ3CisjICBGaWxlOiBj
aXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4ZDlmLXNwa2lkMC5iaW4KKyMgIEZpbGU6
IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhkOWYtc3BraWQxLmJpbgorIyAgTGlu
azogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGRhNy1zcGtpZDAuYmluIC0+IGNz
MzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGQ5Zi1zcGtpZDAuYmluCisjICBMaW5rOiBjaXJydXMv
Y3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4ZGE3LXNwa2lkMS5iaW4gLT4gY3MzNWw0MS1kc3Ax
LXNway1wcm90LTEwM2M4ZDlmLXNwa2lkMS5iaW4KKyMgIExpbms6IGNpcnJ1cy9jczM1bDQxLWRz
cDEtc3BrLXByb3QtMTAzYzhlMzYtc3BraWQwLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLXByb3Qt
MTAzYzhkOWYtc3BraWQwLmJpbgorIyAgTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJv
dC0xMDNjOGUzNi1zcGtpZDEuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGQ5Zi1z
cGtpZDEuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4ZTlj
LXNwa2lkMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4ZDlmLXNwa2lkMC5iaW4K
KyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhlOWMtc3BraWQxLmJp
biAtPiBjczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhkOWYtc3BraWQxLmJpbgorIyAgTGluazog
Y2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGRhMC53bWZ3IC0+IGNzMzVsNDEvdjYu
ODMuMC9oYWxvX2NzcGxfUkFNX3JldkIyXzI5Ljg1LjAud21mdworIyAgTGluazogY2lycnVzL2Nz
MzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGRhMS53bWZ3IC0+IGNzMzVsNDEvdjYuODMuMC9oYWxv
X2NzcGxfUkFNX3JldkIyXzI5Ljg1LjAud21mdworIyAgTGluazogY2lycnVzL2NzMzVsNDEtZHNw
MS1zcGstcHJvdC0xMDNjOGUzNy53bWZ3IC0+IGNzMzVsNDEvdjYuODMuMC9oYWxvX2NzcGxfUkFN
X3JldkIyXzI5Ljg1LjAud21mdworIyBAQCAtNzkyOSw2ICs4MDMyLDggQEAKKyMgIExpbms6IGNp
cnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhkOWMud21mdyAtPiBjczM1bDQxL3Y2Ljgz
LjAvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS44NS4wLndtZncKKyMgIExpbms6IGNpcnJ1cy9jczM1
bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhkOWQud21mdyAtPiBjczM1bDQxL3Y2LjgzLjAvaGFsb19j
c3BsX1JBTV9yZXZCMl8yOS44NS4wLndtZncKKyMgIExpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEt
c3BrLXByb3QtMTAzYzhkOWUud21mdyAtPiBjczM1bDQxL3Y2LjgzLjAvaGFsb19jc3BsX1JBTV9y
ZXZCMl8yOS44NS4wLndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3Qt
MTAzYzhlOWQud21mdyAtPiBjczM1bDQxL3Y2LjgzLjAvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS44
NS4wLndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhlOWUu
d21mdyAtPiBjczM1bDQxL3Y2LjgzLjAvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS44NS4wLndtZncK
KyMgIEZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhkOWItc3BraWQwLmJp
bgorIyAgRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGQ5Yi1zcGtpZDEu
YmluCisjICBMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4ZDljLXNwa2lk
MC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4ZDliLXNwa2lkMC5iaW4KKyMgQEAg
LTc5MzcsMTIgKzgwNDIsMTcgQEAKKyMgIExpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXBy
b3QtMTAzYzhkOWQtc3BraWQxLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhkOWIt
c3BraWQxLmJpbgorIyAgTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGQ5
ZS1zcGtpZDAuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGQ5Yi1zcGtpZDAuYmlu
CisjICBMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4ZDllLXNwa2lkMS5i
aW4gLT4gY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4ZDliLXNwa2lkMS5iaW4KKyMgK0xpbms6
IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhlOWQtc3BraWQwLmJpbiAtPiBjczM1
bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhkOWItc3BraWQwLmJpbgorIyArTGluazogY2lycnVzL2Nz
MzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGU5ZC1zcGtpZDEuYmluIC0+IGNzMzVsNDEtZHNwMS1z
cGstcHJvdC0xMDNjOGQ5Yi1zcGtpZDEuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3Ax
LXNway1wcm90LTEwM2M4ZTllLXNwa2lkMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1wcm90LTEw
M2M4ZDliLXNwa2lkMC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3Qt
MTAzYzhlOWUtc3BraWQxLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhkOWItc3Br
aWQxLmJpbgorIyAgTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGUxMS53
bWZ3IC0+IGNzMzVsNDEvdjYuODMuMC9oYWxvX2NzcGxfUkFNX3JldkIyXzI5Ljg1LjAud21mdwor
IyAgTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGUxMi53bWZ3IC0+IGNz
MzVsNDEvdjYuODMuMC9oYWxvX2NzcGxfUkFNX3JldkIyXzI5Ljg1LjAud21mdworIyAgTGluazog
Y2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGUxMy53bWZ3IC0+IGNzMzVsNDEvdjYu
ODMuMC9oYWxvX2NzcGxfUkFNX3JldkIyXzI5Ljg1LjAud21mdworIyAgTGluazogY2lycnVzL2Nz
MzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGU2MC53bWZ3IC0+IGNzMzVsNDEvdjYuODMuMC9oYWxv
X2NzcGxfUkFNX3JldkIyXzI5Ljg1LjAud21mdworIyAgTGluazogY2lycnVzL2NzMzVsNDEtZHNw
MS1zcGstcHJvdC0xMDNjOGU2MS53bWZ3IC0+IGNzMzVsNDEvdjYuODMuMC9oYWxvX2NzcGxfUkFN
X3JldkIyXzI5Ljg1LjAud21mdworIyAgTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJv
dC0xMDNjOGU2Mi53bWZ3IC0+IGNzMzVsNDEvdjYuODMuMC9oYWxvX2NzcGxfUkFNX3JldkIyXzI5
Ljg1LjAud21mdworIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGY1
Ny53bWZ3IC0+IGNzMzVsNDEvdjYuODMuMC9oYWxvX2NzcGxfUkFNX3JldkIyXzI5Ljg1LjAud21m
dworIyAgRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGUxMS1zcGtpZDAu
YmluCisjICBGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4ZTExLXNwa2lk
MS5iaW4KKyMgIExpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhlMTItc3Br
aWQwLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhlMTEtc3BraWQwLmJpbgorIyBA
QCAtNzk1NSw2ICs4MDY1LDggQEAKKyMgIExpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXBy
b3QtMTAzYzhlNjEtc3BraWQxLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhlMTEt
c3BraWQxLmJpbgorIyAgTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGU2
Mi1zcGtpZDAuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGUxMS1zcGtpZDAuYmlu
CisjICBMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4ZTYyLXNwa2lkMS5i
aW4gLT4gY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4ZTExLXNwa2lkMS5iaW4KKyMgK0xpbms6
IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhmNTctc3BraWQwLmJpbiAtPiBjczM1
bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhlMTEtc3BraWQwLmJpbgorIyArTGluazogY2lycnVzL2Nz
MzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGY1Ny1zcGtpZDEuYmluIC0+IGNzMzVsNDEtZHNwMS1z
cGstcHJvdC0xMDNjOGUxMS1zcGtpZDEuYmluCisjICBMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3Ax
LXNway1wcm90LTEwMjgwY2JkLndtZncgLT4gY3MzNWw0MS92Ni44My4wL2hhbG9fY3NwbF9SQU1f
cmV2QjJfMjkuODUuMC53bWZ3CisjICBMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90
LTEwMjgwY2JlLndtZncgLT4gY3MzNWw0MS92Ni44My4wL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjku
ODUuMC53bWZ3CisjICBMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwMjgwY2Jm
LndtZncgLT4gY3MzNWw0MS92Ni44My4wL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuODUuMC53bWZ3
CisjIEBAIC05MDAwLDcgKzkxMTIsNiBAQAorIyAgRmlsZTogcWNvbS9xZHUxMDAvZWZzMy5iaW4K
KyMgIEZpbGU6IHFjb20vcWR1MTAwL2Z3X2NzbV9nc2lfMy4wLmVsZgorIyAgRmlsZTogcWNvbS9x
ZHUxMDAvaHlwdm0ubWJuCisjIC1GaWxlOiBxY29tL3FkdTEwMC9rZXJuZWxfYm9vdC5lbGYKKyMg
IEZpbGU6IHFjb20vcWR1MTAwL21kbWRkci5tYm4KKyMgIEZpbGU6IHFjb20vcWR1MTAwL211bHRp
X2ltYWdlLm1ibgorIyAgRmlsZTogcWNvbS9xZHUxMDAvbXVsdGlfaW1hZ2VfcXRpLm1ibgorIyBA
QCAtOTAyMSwxMiArOTEzMiwxNiBAQAorIyAgRHJpdmVyOiBpbnRlbF92cHUgLSBJbnRlbCBOUFUg
ZHJpdmVyCisjICAKKyMgIEZpbGU6IGludGVsL3ZwdS92cHVfMzd4eF92MS5iaW4KKyMgLVZlcnNp
b246IDIwMjUwNzIzKk1UTF9DTElFTlRfU0lMSUNPTi1OVlIrTk4tZGVwbG95bWVudCo1MmU3ZWJl
ZTUwYTkzYTA3ZDE0YTFmMTYyMjI2Y2Q1NWFkMzk5OWYwKjUyZTdlYmVlNTBhOTNhMDdkMTRhMWYx
NjIyMjZjZDU1YWQzOTk5ZjAqNTJlN2ViZWU1MGEKKyMgK1ZlcnNpb246IDIwMjUxMTEzKk1UTF9D
TElFTlRfU0lMSUNPTi1OVlIrTk4tZGVwbG95bWVudCo3MmY5MDdmZmM3ODBkZjU1NzlhMmZlZDY1
YWZjNDk0NGRhOGIwZTQ0KjcyZjkwN2ZmYzc4MGRmNTU3OWEyZmVkNjVhZmM0OTQ0ZGE4YjBlNDQq
NzJmOTA3ZmZjNzgKKyMgIExpbms6IGludGVsL3ZwdS92cHVfMzd4eF92MC4wLmJpbiAtPiB2cHVf
Mzd4eF92MS5iaW4KKyMgIAorIyAgRmlsZTogaW50ZWwvdnB1L3ZwdV80MHh4X3YxLmJpbgorIyAt
VmVyc2lvbjogSnVsIDIzIDIwMjUqTlBVNDB4eCpidWlsZC9jaS9ucHUtZnctY2ktbWFpbi0yMDI1
MDcyMV8yMzM1MzctMjcwMzItMi1nNTJlN2ViZWU1MGEqNTJlN2ViZWU1MGE5M2EwN2QxNGExZjE2
MjIyNmNkNTVhZDM5OTlmMAorIyArVmVyc2lvbjogTm92IDEzIDIwMjUqTlBVNDB4eCpjaV90YWdf
dWQyMDI1NDhfdnB1X3JjXzIwMjUxMTEyXzE5MDEtMS1nNzJmOTA3ZmZjNzgqNzJmOTA3ZmZjNzgw
ZGY1NTc5YTJmZWQ2NWFmYzQ5NDRkYThiMGU0NAorIyAgTGluazogaW50ZWwvdnB1L3ZwdV80MHh4
X3YwLjAuYmluIC0+IHZwdV80MHh4X3YxLmJpbgorIyArCisjICtGaWxlOiBpbnRlbC92cHUvdnB1
XzUweHhfdjEuYmluCisjICtWZXJzaW9uOiBOb3YgMTMgMjAyNSpOUFU1MHh4KmNpX3RhZ191ZDIw
MjU0OF92cHVfcmNfMjAyNTExMTJfMTkwMS0xLWc3MmY5MDdmZmM3OCo3MmY5MDdmZmM3ODBkZjU1
NzlhMmZlZDY1YWZjNDk0NGRhOGIwZTQ0CisjICtMaW5rOiBpbnRlbC92cHUvdnB1XzUweHhfdjAu
MC5iaW4gLT4gdnB1XzUweHhfdjEuYmluCisjICAKKyMgIExpY2Vuc2U6IFJlZGlzdHJpYnV0YWJs
ZS4gU2VlIExJQ0VOU0UuaW50ZWxfdnB1IGZvciBkZXRhaWxzCisjICAKKyMgQEAgLTkwNjAsMyAr
OTE3NSwxMCBAQAorIyAgRmlsZTogcWNvbS9zZHgzNS9mb3hjb25uL3hibF9zX2RldnByZ19ucy5t
ZWxmCisjICAKKyMgIExpY2Vuc2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UucWNvbSBh
bmQgcWNvbS9OT1RJQ0UudHh0IGZvciBkZXRhaWxzCisjICstLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAr
CisjICtEcml2ZXI6IHBjaWUtcmNhci1nZW40IC0gUmVuZXNhcyBSLUNhciBHZW40IFBDSWUgY29u
dHJvbGxlcgorIyArCisjICtGaWxlOiByY2FyX2dlbjRfcGNpZS5iaW4KKyMgKworIyArTGljZW5j
ZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5yOGE3NzlnX3BjaWVfcGh5IGZvciBkZXRh
aWxzLgorIyAKKyMKKwogU1VNTUFSWSA9ICJGaXJtd2FyZSBmaWxlcyBmb3IgdXNlIHdpdGggTGlu
dXgga2VybmVsIgogSE9NRVBBR0UgPSAiaHR0cHM6Ly93d3cua2VybmVsLm9yZy8iCiBERVNDUklQ
VElPTiA9ICJMaW51eCBmaXJtd2FyZSBpcyBhIHBhY2thZ2UgZGlzdHJpYnV0ZWQgYWxvbmdzaWRl
IHRoZSBMaW51eCBrZXJuZWwgXApAQCAtMTk5LDcgKzg3NSw3IEBAIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0xJQ0VOQ0UuQWJpbGlzO21kNT1iNWVlM2Y0MTA3ODBlNTY3MTFhZDQ4ZWFkYzIy
YjhiYyBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTlNFLmFtZG5wdTttZDU9ZWE0
MmMwZjM4ZjJkNDJhYWQwOGJkNTBjODIyNDYwZGMgXAogICAgICAgICAgICAgICAgICAgICBmaWxl
Oi8vTElDRU5TRS5hbWRfcG1mO21kNT1hMjU4OWEwNWVhNWI2YmQyYjdmNGY2MjNjN2U3YTY0OSBc
CiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTlNFLmFtZC1zZXY7bWQ1PWU3NTA1Mzg3
OTFhOGJlMGI3MjQ5YzU3OWVkZWZiMDM1IFwKLSAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJ
Q0VOU0UuYW1kLXVjb2RlO21kNT02Y2E5MGM1N2Y3YjI0OGRlMWUyNWM3ZjY4ZmZjNDY5OCBcCisg
ICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTlNFLmFtZC11Y29kZTttZDU9NDUwZjIxN2Fh
ZGM3ODc1MTQxNjVlOTU2ODY1MmQ3MDAgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElD
RU5TRS5hbWxvZ2ljO21kNT04MGU0ZTNmMjdkZWY4YmM0YjIzMjAwOWMzYTU4N2MwNyBcCiAgICAg
ICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTlNFLmFtbG9naWNfdmRlYzttZDU9ZGM0NGY1OWJm
NjRhODE2NDNlNTAwYWQzZjM5YTQ2OGEgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElD
RU5TRS5hbXBoaW9uX3ZwdTttZDU9MmJjZGMwMDUyN2IyZDA1NDJiZDkyYjUyYWFlYzJiNjAgXApA
QCAtMzA4LDcgKzk4NCw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOQ0UuQWJp
bGlzO21kNT1iNWVlM2Y0MTA3ODBlNTY3MTFhZDQ4ZWFkYzIyYjhiYyBcCiAgICAgICAgICAgICAg
ICAgICAgIGZpbGU6Ly9MSUNFTkNFLnhjNTAwMGM7bWQ1PTEyYjAyZWZhMzA0OWRiNjVkNTI0YWVi
NDE4ZGQ4N2NhIFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOU0UueGU7bWQ1PWM2
NzRkMzg3NzQyNDJiYzBjNTI4MjE0NzIxNDg4MTE4IFwKICAgICAgICAgICAgICAgICAgICAgZmls
ZTovL3dmeC9MSUNFTkNFLndmMjAwO21kNT00ZDFiZWZmMDBkOTAyYzA1YzljN2U5NWE1ZDhlYjUy
ZCBcCi0gICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9XSEVOQ0U7bWQ1PSR7V0hFTkNFX0NIS1NV
TX0gXAorICAgICAgICAgICAgICAgICAgICBmaWxlOi8vV0hFTkNFO21kNT1kZWM2OWU5OGQ5YTAz
ZmNhNWE5NzkzZThkMjRjMGI4ZCBcCiAgICAgICAgICAgICAgICAgICAgICIKICMgV0hFTkNFIGNo
ZWNrc3VtIGlzIGRlZmluZWQgc2VwYXJhdGVseSB0byBlYXNlIG92ZXJyaWRpbmcgaXQgaWYKICMg
Y2xhc3MtZGV2dXBzdHJlYW0gaXMgc2VsZWN0ZWQuCkBAIC00NDksNyArMTEyNSw3IEBAIFNSQ19V
Ukk6Y2xhc3MtZGV2dXBzdHJlYW0gPSAiZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51
eC9rZXJuZWwvZ2l0L2Zpcm13CiAjIFBpbiB0aGlzIHRvIHRoZSAyMDIyMDUwOSByZWxlYXNlLCBv
dmVycmlkZSB0aGlzIGluIGxvY2FsLmNvbmYKIFNSQ1JFVjpjbGFzcy1kZXZ1cHN0cmVhbSA/PSAi
YjE5Y2JkY2E3OGFiMmFkZmQyMTBjOTFiZTE1YTIyNTY4ZThiOGNhZSIKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gImViODA3YTAxYzUyODgyYWM5N2VmNWI2NzhkNGEyNDZiMjA5ZTYxNjVhYzEyODdk
NjJhNWY5M2EwOWVlOTNjZDIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNDhlMDUxNjZkYjUzOWY0
ZWU4ZDI5YWM5ZDIzNmE5NDQ0MmM1YjFiMWExNjBhOTY2ZjZmZTZiNDJiZDcxNDMzMSIKIAogaW5o
ZXJpdCBhbGxhcmNoCiAKLS0gCjIuNDcuMQoK

--===============0232090818807117082==--

