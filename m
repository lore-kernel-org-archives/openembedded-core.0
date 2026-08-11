Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BA4DC5B575
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 07:24:00 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49085.1786433036840842285
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 00:23:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=dyMaY/TM;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=sQDWMDPb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019fefb4def3-9689f8c8-e85e-4624-a718-b40a59fe81f9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1786433036;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PUrU3EQYadp8EUQZtHFIA0rel2p0nY1xqGu7uqgh2LA=;
	b=dyMaY/TMkWTRL8vNkOPYV3q5CZ1kLWuzpOm4o30ahgVqesHMLU9btNfFd27B5DyV
	t5fIupmISRec3soOXqgVFFOkKI+WZf2zyQOHG5g9wUeqPpi1ft4q/WiwHtdcn/UbBgg
	511zMJ8mOdLoKpm4trJjMGaYxOtS3ROaraJ3q22I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1786433036;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PUrU3EQYadp8EUQZtHFIA0rel2p0nY1xqGu7uqgh2LA=;
	b=sQDWMDPbhCM3tFtb8zIy/v4zJFUPwZgsUwphsLahXOWJ02D/zin597wEmd7JEPyN
	zsa5bRm/2CBipbqUbXGQGP+swnA5WQAb4OgDqjEXIgAKgn+EECqAZQnNmURT712lmPl
	Aip1vw4ljjIFgY+Q9eq4M4DX/foLucyypr0eYLBM=
Content-Type: multipart/mixed; boundary="===============0658433556886074701=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Vivek Puar <vpuar@qti.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] linux-firmware: upgrading to 20260810 FAILED
Message-ID: <0101019fefb4def3-9689f8c8-e85e-4624-a718-b40a59fe81f9-000000@us-west-2.amazonses.com>
Date: Tue, 11 Aug 2026 07:23:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.11-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 07:24:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243168

--===============0658433556886074701==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *linux-firmware* to *20260810* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-linux-firmware-upgrade-20260622-20260810.patch
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
From 6f4d6b0087796259b9f582b64d2dffbe8c1d9f8f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 11 Aug 2026 07:16:02 +0000
Subject: [PATCH] linux-firmware: upgrade 20260622 -> 20260810

---
 ...20260622.bb => linux-firmware_20260810.bb} | 831 +++++++++++++++++-
 1 file changed, 829 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20260622.bb => linux-firmware_20260810.bb} (83%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20260622.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20260810.bb
similarity index 83%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20260622.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20260810.bb
index 6ccfa16259..9dae5ef477 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20260622.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20260810.bb
@@ -1,3 +1,830 @@
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
+# @@ -259,6 +259,8 @@
+#  Version: 8.07.00 MID
+#  File: ql2500_fw.bin
+#  Version: 8.08.207 MIDQ
+# +File: ql2900_fw.bin
+# +Version: 10.34.03
+#  
+#  Licence: Redistributable. See LICENCE.qla2xxx for details
+#  
+# @@ -920,31 +922,31 @@
+#  
+#  File: intel/iwlwifi/iwlwifi-cc-a0-77.ucode
+#  Link: iwlwifi-cc-a0-77.ucode -> intel/iwlwifi/iwlwifi-cc-a0-77.ucode
+# -Version: 74.f39cc7f9.0
+# +Version: 74.aa2dd297.0
+#  
+#  File: intel/iwlwifi/iwlwifi-Qu-b0-hr-b0-77.ucode
+#  Link: iwlwifi-Qu-b0-hr-b0-77.ucode -> intel/iwlwifi/iwlwifi-Qu-b0-hr-b0-77.ucode
+# -Version: 74.f39cc7f9.0
+# +Version: 74.aa2dd297.0
+#  
+#  File: intel/iwlwifi/iwlwifi-Qu-b0-jf-b0-77.ucode
+#  Link: iwlwifi-Qu-b0-jf-b0-77.ucode -> intel/iwlwifi/iwlwifi-Qu-b0-jf-b0-77.ucode
+# -Version: 74.f39cc7f9.0
+# +Version: 74.aa2dd297.0
+#  
+#  File: intel/iwlwifi/iwlwifi-Qu-c0-hr-b0-77.ucode
+#  Link: iwlwifi-Qu-c0-hr-b0-77.ucode -> intel/iwlwifi/iwlwifi-Qu-c0-hr-b0-77.ucode
+# -Version: 74.f39cc7f9.0
+# +Version: 74.aa2dd297.0
+#  
+#  File: intel/iwlwifi/iwlwifi-Qu-c0-jf-b0-77.ucode
+#  Link: iwlwifi-Qu-c0-jf-b0-77.ucode -> intel/iwlwifi/iwlwifi-Qu-c0-jf-b0-77.ucode
+# -Version: 74.f39cc7f9.0
+# +Version: 74.aa2dd297.0
+#  
+#  File: intel/iwlwifi/iwlwifi-QuZ-a0-hr-b0-77.ucode
+#  Link: iwlwifi-QuZ-a0-hr-b0-77.ucode -> intel/iwlwifi/iwlwifi-QuZ-a0-hr-b0-77.ucode
+# -Version: 74.f39cc7f9.0
+# +Version: 74.aa2dd297.0
+#  
+#  File: intel/iwlwifi/iwlwifi-QuZ-a0-jf-b0-77.ucode
+#  Link: iwlwifi-QuZ-a0-jf-b0-77.ucode -> intel/iwlwifi/iwlwifi-QuZ-a0-jf-b0-77.ucode
+# -Version: 74.f39cc7f9.0
+# +Version: 74.aa2dd297.0
+#  
+#  File: intel/iwlwifi/iwlwifi-ty-a0-gf-a0-77.ucode
+#  Link: iwlwifi-ty-a0-gf-a0-77.ucode -> intel/iwlwifi/iwlwifi-ty-a0-gf-a0-77.ucode
+# @@ -976,7 +978,7 @@
+#  
+#  File: intel/iwlwifi/iwlwifi-ty-a0-gf-a0-89.ucode
+#  Link: iwlwifi-ty-a0-gf-a0-89.ucode -> intel/iwlwifi/iwlwifi-ty-a0-gf-a0-89.ucode
+# -Version: 86.735b75a4.0
+# +Version: 86.f7dcb3ee.0
+#  
+#  File: intel/iwlwifi/iwlwifi-so-a0-gf4-a0-77.ucode
+#  Link: iwlwifi-so-a0-gf4-a0-77.ucode -> intel/iwlwifi/iwlwifi-so-a0-gf4-a0-77.ucode
+# @@ -1008,7 +1010,7 @@
+#  
+#  File: intel/iwlwifi/iwlwifi-so-a0-gf4-a0-89.ucode
+#  Link: iwlwifi-so-a0-gf4-a0-89.ucode -> intel/iwlwifi/iwlwifi-so-a0-gf4-a0-89.ucode
+# -Version: 86.735b75a4.0
+# +Version: 86.f7dcb3ee.0
+#  
+#  File: intel/iwlwifi/iwlwifi-so-a0-gf-a0-77.ucode
+#  Link: iwlwifi-so-a0-gf-a0-77.ucode -> intel/iwlwifi/iwlwifi-so-a0-gf-a0-77.ucode
+# @@ -1040,7 +1042,7 @@
+#  
+#  File: intel/iwlwifi/iwlwifi-so-a0-gf-a0-89.ucode
+#  Link: iwlwifi-so-a0-gf-a0-89.ucode -> intel/iwlwifi/iwlwifi-so-a0-gf-a0-89.ucode
+# -Version: 86.735b75a4.0
+# +Version: 86.f7dcb3ee.0
+#  
+#  File: intel/iwlwifi/iwlwifi-so-a0-hr-b0-77.ucode
+#  Link: iwlwifi-so-a0-hr-b0-77.ucode -> intel/iwlwifi/iwlwifi-so-a0-hr-b0-77.ucode
+# @@ -1068,7 +1070,7 @@
+#  
+#  File: intel/iwlwifi/iwlwifi-so-a0-hr-b0-89.ucode
+#  Link: iwlwifi-so-a0-hr-b0-89.ucode -> intel/iwlwifi/iwlwifi-so-a0-hr-b0-89.ucode
+# -Version: 86.735b75a4.0
+# +Version: 86.f7dcb3ee.0
+#  
+#  File: intel/iwlwifi/iwlwifi-so-a0-jf-b0-77.ucode
+#  Link: iwlwifi-so-a0-jf-b0-77.ucode -> intel/iwlwifi/iwlwifi-so-a0-jf-b0-77.ucode
+# @@ -1091,7 +1093,7 @@
+#  
+#  File: intel/iwlwifi/iwlwifi-bz-b0-hr-b0-100.ucode
+#  Link: iwlwifi-bz-b0-hr-b0-100.ucode -> intel/iwlwifi/iwlwifi-bz-b0-hr-b0-100.ucode
+# -Version: 97.de068435d.0
+# +Version: 97.a03b104c.0
+#  
+#  File: intel/iwlwifi/iwlwifi-bz-b0-hr-b0.pnvm
+#  Link: iwlwifi-bz-b0-hr-b0.pnvm -> intel/iwlwifi/iwlwifi-bz-b0-hr-b0.pnvm
+# @@ -1118,7 +1120,7 @@
+#  
+#  File: intel/iwlwifi/iwlwifi-bz-b0-gf-a0-100.ucode
+#  Link: iwlwifi-bz-b0-gf-a0-100.ucode -> intel/iwlwifi/iwlwifi-bz-b0-gf-a0-100.ucode
+# -Version: 97.de068435d.0
+# +Version: 97.a03b104c.0
+#  
+#  File: intel/iwlwifi/iwlwifi-bz-b0-gf-a0.pnvm
+#  Link: iwlwifi-bz-b0-gf-a0.pnvm -> intel/iwlwifi/iwlwifi-bz-b0-gf-a0.pnvm
+# @@ -1167,6 +1169,10 @@
+#  Link: iwlwifi-gl-c0-fm-c0-c103.ucode -> intel/iwlwifi/iwlwifi-gl-c0-fm-c0-c103.ucode
+#  Version: 103.1a5cc88d.0
+#  
+# +File: intel/iwlwifi/iwlwifi-gl-c0-fm-c0-c106.ucode
+# +Link: iwlwifi-gl-c0-fm-c0-c106.ucode -> intel/iwlwifi/iwlwifi-gl-c0-fm-c0-c106.ucode
+# +Version: 106.c88d33af.0
+# +
+#  File: intel/iwlwifi/iwlwifi-gl-c0-fm-c0-c101.ucode
+#  Link: iwlwifi-gl-c0-fm-c0-c101.ucode -> intel/iwlwifi/iwlwifi-gl-c0-fm-c0-c101.ucode
+#  Version: 101.6e695a70.0
+# @@ -1210,17 +1216,21 @@
+#  Link: iwlwifi-bz-b0-fm-c0-101.ucode -> intel/iwlwifi/iwlwifi-bz-b0-fm-c0-101.ucode
+#  Version: 98.6ef20b19.0
+#  
+# +File: intel/iwlwifi/iwlwifi-bz-b0-fm-c0-c101.ucode
+# +Link: iwlwifi-bz-b0-fm-c0-c101.ucode -> intel/iwlwifi/iwlwifi-bz-b0-fm-c0-c101.ucode
+# +Version: 101.6e695a70.0
+# +
+# +File: intel/iwlwifi/iwlwifi-bz-b0-fm-c0-c102.ucode
+# +Link: iwlwifi-bz-b0-fm-c0-c102.ucode -> intel/iwlwifi/iwlwifi-bz-b0-fm-c0-c102.ucode
+# +Version: 102.07fca168.0
+# +
+#  File: intel/iwlwifi/iwlwifi-bz-b0-fm-c0-c103.ucode
+#  Link: iwlwifi-bz-b0-fm-c0-c103.ucode -> intel/iwlwifi/iwlwifi-bz-b0-fm-c0-c103.ucode
+#  Version: 103.1a5cc88d.0
+#  
+# -File: intel/iwlwifi/iwlwifi-bz-b0-fm-c0-c101.ucode
+# -Link: iwlwifi-bz-b0-fm-c0-c101.ucode -> intel/iwlwifi/iwlwifi-bz-b0-fm-c0-c101.ucode
+# -Version: 101.6e695a70.0
+# -
+# -File: intel/iwlwifi/iwlwifi-bz-b0-fm-c0-c102.ucode
+# -Link: iwlwifi-bz-b0-fm-c0-c102.ucode -> intel/iwlwifi/iwlwifi-bz-b0-fm-c0-c102.ucode
+# -Version: 102.07fca168.0
+# +File: intel/iwlwifi/iwlwifi-bz-b0-fm-c0-c106.ucode
+# +Link: iwlwifi-bz-b0-fm-c0-c106.ucode -> intel/iwlwifi/iwlwifi-bz-b0-fm-c0-c106.ucode
+# +Version: 106.c88d33af.0
+#  
+#  File: intel/iwlwifi/iwlwifi-bz-b0-fm-c0.pnvm
+#  Link: iwlwifi-bz-b0-fm-c0.pnvm -> intel/iwlwifi/iwlwifi-bz-b0-fm-c0.pnvm
+# @@ -1235,7 +1245,7 @@
+#  
+#  File: intel/iwlwifi/iwlwifi-ma-b0-gf-a0-89.ucode
+#  Link: iwlwifi-ma-b0-gf-a0-89.ucode -> intel/iwlwifi/iwlwifi-ma-b0-gf-a0-89.ucode
+# -Version: 86.735b75a4.0
+# +Version: 86.f7dcb3ee.0
+#  
+#  File: intel/iwlwifi/iwlwifi-ma-b0-gf-a0.pnvm
+#  Link: iwlwifi-ma-b0-gf-a0.pnvm -> intel/iwlwifi/iwlwifi-ma-b0-gf-a0.pnvm
+# @@ -1250,7 +1260,7 @@
+#  
+#  File: intel/iwlwifi/iwlwifi-ma-b0-gf4-a0-89.ucode
+#  Link: iwlwifi-ma-b0-gf4-a0-89.ucode -> intel/iwlwifi/iwlwifi-ma-b0-gf4-a0-89.ucode
+# -Version: 86.735b75a4.0
+# +Version: 86.f7dcb3ee.0
+#  
+#  File: intel/iwlwifi/iwlwifi-ma-b0-gf4-a0.pnvm
+#  Link: iwlwifi-ma-b0-gf4-a0.pnvm -> intel/iwlwifi/iwlwifi-ma-b0-gf4-a0.pnvm
+# @@ -1265,7 +1275,7 @@
+#  
+#  File: intel/iwlwifi/iwlwifi-ma-b0-hr-b0-89.ucode
+#  Link: iwlwifi-ma-b0-hr-b0-89.ucode -> intel/iwlwifi/iwlwifi-ma-b0-hr-b0-89.ucode
+# -Version: 86.735b75a4.0
+# +Version: 86.f7dcb3ee.0
+#  
+#  File: intel/iwlwifi/iwlwifi-sc-a0-wh-b0-101.ucode
+#  Link: iwlwifi-sc-a0-wh-b0-101.ucode -> intel/iwlwifi/iwlwifi-sc-a0-wh-b0-101.ucode
+# @@ -1275,6 +1285,10 @@
+#  Link: iwlwifi-sc-a0-wh-b0-c103.ucode -> intel/iwlwifi/iwlwifi-sc-a0-wh-b0-c103.ucode
+#  Version: 103.1a5cc88d.0
+#  
+# +File: intel/iwlwifi/iwlwifi-sc-a0-wh-b0-c106.ucode
+# +Link: iwlwifi-sc-a0-wh-b0-c106.ucode -> intel/iwlwifi/iwlwifi-sc-a0-wh-b0-c106.ucode
+# +Version: 106.c88d33af.0
+# +
+#  File: intel/iwlwifi/iwlwifi-sc-a0-wh-b0-c101.ucode
+#  Link: iwlwifi-sc-a0-wh-b0-c101.ucode -> intel/iwlwifi/iwlwifi-sc-a0-wh-b0-c101.ucode
+#  Version: 101.6e695a70.0
+# @@ -1285,7 +1299,7 @@
+#  
+#  File: intel/iwlwifi/iwlwifi-sc-a0-gf-a0-100.ucode
+#  Link: iwlwifi-sc-a0-gf-a0-100.ucode -> intel/iwlwifi/iwlwifi-sc-a0-gf-a0-100.ucode
+# -Version: 97.de068435d.0
+# +Version: 97.a03b104c.0
+#  
+#  File: intel/iwlwifi/iwlwifi-sc-a0-fm-c0-c101.ucode
+#  Link: iwlwifi-sc-a0-fm-c0-c101.ucode -> intel/iwlwifi/iwlwifi-sc-a0-fm-c0-c101.ucode
+# @@ -1303,9 +1317,17 @@
+#  Link: iwlwifi-sc-a0-fm-c0-c103.ucode -> intel/iwlwifi/iwlwifi-sc-a0-fm-c0-c103.ucode
+#  Version: 103.1a5cc88d.0
+#  
+# +File: intel/iwlwifi/iwlwifi-sc-a0-fm-c0-c106.ucode
+# +Link: iwlwifi-sc-a0-fm-c0-c106.ucode -> intel/iwlwifi/iwlwifi-sc-a0-fm-c0-c106.ucode
+# +Version: 106.c88d33af.0
+# +
+#  File: intel/iwlwifi/iwlwifi-bz-b0-wh-b0-c103.ucode
+#  Link: iwlwifi-bz-b0-wh-b0-c103.ucode -> intel/iwlwifi/iwlwifi-bz-b0-wh-b0-c103.ucode
+#  Version: 103.1a5cc88d.0
+# +
+# +File: intel/iwlwifi/iwlwifi-bz-b0-wh-b0-c106.ucode
+# +Link: iwlwifi-bz-b0-wh-b0-c106.ucode -> intel/iwlwifi/iwlwifi-bz-b0-wh-b0-c106.ucode
+# +Version: 106.c88d33af.0
+#  
+#  Licence: Redistributable. See LICENCE.iwlwifi_firmware for details
+#  
+# @@ -2045,7 +2067,7 @@
+#  
+#  File: airoha/an8811hb/EthMD32_CRC.DM.bin
+#  File: airoha/an8811hb/EthMD32_CRC.DSP.bin
+# -Version: 25110702
+# +Version: 26071602
+#  
+#  Licence: Redistributable. See LICENSE.airoha for details.
+#  
+# @@ -2073,7 +2095,9 @@
+#  Driver: airoha-npu-7583 - Airoha Network Processor Unit driver for AN7583 SoC
+#  
+#  File: airoha/an7583_npu_data.bin
+# +Version: 0.5
+#  File: airoha/an7583_npu_rv32.bin
+# +Version: 0.5
+#  
+#  Licence: Redistributable. See LICENSE.airoha for details.
+#  
+# @@ -2702,6 +2726,8 @@
+#  File: amdgpu/psp_13_0_12_ta.bin
+#  File: amdgpu/psp_13_0_14_sos.bin
+#  File: amdgpu/psp_13_0_14_ta.bin
+# +File: amdgpu/psp_13_0_15_sos.bin
+# +File: amdgpu/psp_13_0_15_ta.bin
+#  File: amdgpu/psp_14_0_0_ta.bin
+#  File: amdgpu/psp_14_0_0_toc.bin
+#  File: amdgpu/psp_14_0_1_ta.bin
+# @@ -2844,35 +2870,6 @@
+#  Version: 1.0
+#  
+#  Licence: Redistributable. See LICENCE.ueagle-atm4-firmware for details
+# -
+# ---------------------------------------------------------------------------
+# -
+# -Driver: ueagle-atm - Driver for USB ADSL Modems based on Eagle I,II,III
+# -
+# -File: ueagle-atm/930-fpga.bin
+# -File: ueagle-atm/CMVeiWO.bin
+# -File: ueagle-atm/CMVepFR10.bin
+# -File: ueagle-atm/DSP9p.bin
+# -File: ueagle-atm/eagleIII.fw
+# -File: ueagle-atm/adi930.fw
+# -File: ueagle-atm/CMVep.bin
+# -File: ueagle-atm/CMVepFR.bin
+# -File: ueagle-atm/DSPei.bin
+# -File: ueagle-atm/CMV9i.bin
+# -File: ueagle-atm/CMVepES03.bin
+# -File: ueagle-atm/CMVepIT.bin
+# -File: ueagle-atm/DSPep.bin
+# -File: ueagle-atm/CMV9p.bin
+# -File: ueagle-atm/CMVepES.bin
+# -File: ueagle-atm/CMVepWO.bin
+# -File: ueagle-atm/eagleI.fw
+# -File: ueagle-atm/CMVei.bin
+# -File: ueagle-atm/CMVepFR04.bin
+# -File: ueagle-atm/DSP9i.bin
+# -File: ueagle-atm/eagleII.fw
+# -Version: 1.1
+# -
+# -Licence: Redistributable. See LICENCE.ueagle for details
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -3360,6 +3357,7 @@
+#  File: rtw88/rtw8822c_fw.bin
+#  File: rtw88/rtw8822c_wow_fw.bin
+#  File: rtw88/README
+# +File: rtw88/rtw8723b_fw.bin
+#  File: rtw88/rtw8723d_fw.bin
+#  File: rtw88/rtw8821c_fw.bin
+#  File: rtw88/rtw8703b_fw.bin
+# @@ -3399,6 +3397,8 @@
+#  File: rtw89/rtw8922a_fw-2.bin
+#  File: rtw89/rtw8922a_fw-3.bin
+#  File: rtw89/rtw8922a_fw-4.bin
+# +File: rtw89/rtw8922d_fw.bin
+# +File: rtw89/rtw8922ds_fw.bin
+#  
+#  Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
+#  
+# @@ -4178,7 +4178,7 @@
+#  File: intel/ibt-0291-0291.ddc
+#  File: intel/ibt-0093-0291.sfi
+#  File: intel/ibt-0093-0291.ddc
+# -Version: BT_BlazarU_S_REL112962_24.50.26182.112962
+# +Version: BT_BlazarU_S_REL117936_24.60.26262.117936
+#  
+#  File: intel/ibt-0180-0041.sfi
+#  File: intel/ibt-0180-0041.ddc
+# @@ -4210,12 +4210,12 @@
+#  File: intel/ibt-0190-0291-usb.sfi
+#  File: intel/ibt-0190-0291-pci.ddc
+#  File: intel/ibt-0190-0291-pci.sfi
+# -Version: BT_BlazarI_S_REL120290_24.50.26182.120290
+# +Version: BT_BlazarI_S_REL125325_24.60.26262.125325
+#  
+#  File: intel/ibt-1190-01a1-iml.sfi
+#  File: intel/ibt-1190-01a1-pci.ddc
+#  File: intel/ibt-1190-01a1-pci.sfi
+# -Version: BT_BlazarI_S_REL120290_24.50.26182.120290
+# +Version: BT_BlazarI_S_REL125325_24.60.26262.125325
+#  
+#  File: intel/ibt-00a0-01a1-iml.sfi
+#  File: intel/ibt-00a0-01a1-pci.ddc
+# @@ -4227,7 +4227,7 @@
+#  File: intel/ibt-00a0-0291-pci.sfi
+#  File: intel/ibt-00a0-0291-usb.ddc
+#  File: intel/ibt-00a0-0291-usb.sfi
+# -Version: BT_Scorpius_S_REL88847_24.50.26182.88847
+# +Version: BT_Scorpius_S_REL94250_24.60.26262.94250
+#  
+#  File: intel/ibt-00a0-0041-iml.sfi
+#  File: intel/ibt-00a0-0041-pci.ddc
+# @@ -4345,6 +4345,7 @@
+#  Version: 2025-2-20
+#  File: amd/amd_sev_fam1ah_model0xh.sbin
+#  Version: 2025-2-20
+# +File: amd/README.md
+#  
+#  License: Redistributable. See LICENSE.amd-sev for details
+#  
+# @@ -4888,6 +4889,10 @@
+#  File: qca/wcnhpnv21g.bb8
+#  File: qca/wcnhpnv21g.b10c
+#  File: qca/wcnhpnv21g.b111
+# +File: qca/wcnhpbtfw10.tlv
+# +Version: BTFM.HSP.1.0.0-00978-QCAHSPROMZ-2
+# +File: qca/wcnhpnv10.bin
+# +File: qca/wcnhpnv10.b06
+#  
+#  Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k and NOTICE.qca for details
+#  
+# @@ -4960,7 +4965,7 @@
+#  Driver: qca - Qualcomm Atheros Bluetooth support for QCA6698AQ chips
+#  
+#  File: qca/QCA6698/hpbtfw21.tlv
+# -Version: BTFW.HSP.2.1.2-00035-PATCHZ-1
+# +Version: BTFW.HSP.2.1.2-00072-PATCHZ-2
+#  File: qca/QCA6698/hpnv21.b206
+#  File: qca/QCA6698/hpnv21.b207
+#  File: qca/QCA6698/hpnv21.bin
+# @@ -5388,13 +5393,13 @@
+#  Version: GSC API/APB v1.0, release 104.0.5.1429, SVN 1 for Lunarlake
+#  
+#  File: xe/lnl_guc_70.bin
+# -Version: GuC API/APB ver 70.65.0 for Lunarlake
+# +Version: GuC API/APB ver 70.72.1 for Lunarlake
+#  
+#  File: xe/lnl_huc.bin
+#  Version: HuC API/APB ver 9.4.13 for Lunarlake
+#  
+#  File: xe/bmg_guc_70.bin
+# -Version: GuC API/APB ver 70.65.0 for Battlemage
+# +Version: GuC API/APB ver 70.72.1 for Battlemage
+#  
+#  File: xe/bmg_huc.bin
+#  Version: HuC API/APB ver 8.2.10 for Battlemage
+# @@ -5406,10 +5411,13 @@
+#  Version: GSC API/APB v1.0, release 105.0.2.1397, SVN 1 for Pantherlake
+#  
+#  File: xe/ptl_guc_70.bin
+# -Version: GuC API/APB ver 70.65.0 for Pantherlake
+# +Version: GuC API/APB ver 70.72.1 for Pantherlake
+#  
+#  File: xe/ptl_huc.bin
+#  Version: HuC API/APB ver 10.3.3 for Pantherlake
+# +
+# +File: xe/nvl_guc_70.bin
+# +Version: GuC API/APB ver 70.72.1 for Novalake S
+#  
+#  License: Redistributable. See LICENSE.xe for details
+#  --------------------------------------------------------------------------
+# @@ -6220,9 +6228,9 @@
+#  Driver: mt7922 - MediaTek MT7922 Wireless MACs
+#  
+#  File: mediatek/WIFI_MT7922_patch_mcu_1_1_hdr.bin
+# -Version: 20260605203307a
+# +Version: 20260724143257a
+#  File: mediatek/WIFI_RAM_CODE_MT7922_1.bin
+# -Version: 20260605203411
+# +Version: 20260724143402
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -6231,7 +6239,7 @@
+#  Driver: mt7922 - MediaTek MT7922 bluetooth chipset
+#  
+#  File: mediatek/BT_RAM_CODE_MT7922_1_1_hdr.bin
+# -Version: 20260605203811
+# +Version: 20260724143815
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -6499,7 +6507,7 @@
+#  File: qcom/venus-5.4/venus.mbn
+#  Link: qcom/venus-5.4/venus.mdt -> venus.mbn
+#  
+# -Version: VIDEO.VE.5.4-00063-PROD-1
+# +Version: VIDEO.VE.5.4-00064-PROD-1
+#  
+#  File: qcom/venus-6.0/venus.mbn
+#  
+# @@ -6524,6 +6532,10 @@
+#  --------------------------------------------------------------------------
+#  
+#  Driver: iris - Qualcomm Iris video codec accelerator
+# +
+# +File: qcom/vpu/vpu30_p1_s7.mbn
+# +
+# +Version: VIDEO.VPU.3.1-0100
+#  
+#  File: qcom/vpu/ar50lt_p1_gen2_s6.mbn
+#  
+# @@ -6677,6 +6689,12 @@
+#  Version: v1.81
+#  File: qcom/x1p42100/gen71500_zap.mbn
+#  Version: v0.13
+# +File: qcom/gen71700_gmu.bin
+# +Version: v4.09.00
+# +File: qcom/gen71700_sqe.fw
+# +Version: v1.82
+# +File: qcom/eliza/gen71700_zap.mbn
+# +Version: v0.15
+#  File: qcom/gen80000_aqe.fw
+#  Version: v0.14
+#  File: qcom/gen80000_gmu.bin
+# @@ -6891,6 +6909,13 @@
+#  File: qcom/glymur/cdsp_dtb.mbn
+#  Version: CDSP.HT.3.3-00315-GLYMUR-1
+#  RawFile: qcom/glymur/cdspr.jsn
+# +File: qcom/hawi/adsp.mbn
+# +File: qcom/hawi/adsp_dtb.mbn
+# +Version: LPAIDSP.HT.1.6-00701.4-HAWI-2
+# +RawFile: qcom/hawi/adspr.jsn
+# +RawFile: qcom/hawi/adsps.jsn
+# +RawFile: qcom/hawi/adspua.jsn
+# +RawFile: qcom/hawi/adspuo.jsn
+#  File: qcom/kaanapali/adsp.mbn
+#  File: qcom/kaanapali/adsp_dtb.mbn
+#  Version: LPAIDSP.HT.1.6.1-00035-KAANAPALI-1
+# @@ -6907,29 +6932,29 @@
+#  Version: SOCCP.FW.2.1-00204-KAANAPALI_SOCCP_PACK-1
+#  RawFile: qcom/kaanapali/soccpr.jsn
+#  File: qcom/qcs8300/adsp.mbn
+# -Version: DSP.AT.1.0.1-00201-LEMANS-2
+# +Version: DSP.AT.1.0.1-00204-LEMANS-1
+#  RawFile: qcom/qcs8300/adspr.jsn
+#  RawFile: qcom/qcs8300/adspua.jsn
+#  File: qcom/qcs8300/cdsp0.mbn
+# -Version: DSP.AT.1.0.1-00201-LEMANS-2
+# +Version: DSP.AT.1.0.1-00204-LEMANS-1
+#  RawFile: qcom/qcs8300/cdspr.jsn
+#  File: qcom/qcs8300/gpdsp0.mbn
+# -Version: DSP.AT.1.0.1-00201-LEMANS-2
+# +Version: DSP.AT.1.0.1-00204-LEMANS-1
+#  RawFile: qcom/qcs8300/gpdspr.jsn
+#  File: qcom/sa8775p/adsp.mbn
+# -Version: DSP.AT.1.0.1-00201-LEMANS-2
+# +Version: DSP.AT.1.0.1-00204-LEMANS-1
+#  RawFile: qcom/sa8775p/adspr.jsn
+#  RawFile: qcom/sa8775p/adspua.jsn
+#  File: qcom/sa8775p/cdsp0.mbn
+# -Version: DSP.AT.1.0.1-00201-LEMANS-2
+# +Version: DSP.AT.1.0.1-00204-LEMANS-1
+#  File: qcom/sa8775p/cdsp1.mbn
+# -Version: DSP.AT.1.0.1-00201-LEMANS-2
+# +Version: DSP.AT.1.0.1-00204-LEMANS-1
+#  RawFile: qcom/sa8775p/cdspr.jsn
+#  RawFile: qcom/sa8775p/cdsp1r.jsn
+#  File: qcom/sa8775p/gpdsp0.mbn
+# -Version: DSP.AT.1.0.1-00201-LEMANS-2
+# +Version: DSP.AT.1.0.1-00204-LEMANS-1
+#  File: qcom/sa8775p/gpdsp1.mbn
+# -Version: DSP.AT.1.0.1-00201-LEMANS-2
+# +Version: DSP.AT.1.0.1-00204-LEMANS-1
+#  RawFile: qcom/sa8775p/gpdsp1r.jsn
+#  RawFile: qcom/sa8775p/gpdspr.jsn
+#  File: qcom/sm8750/adsp.mbn
+# @@ -6958,7 +6983,7 @@
+#  Version: LPAICP.FW.1.2-00135-SHIKRA_LPAICP_PACK-1
+#  RawFile: qcom/shikra/lpaicpr.jsn
+#  File: qcom/shikra/cqs/qdsp6sw.mbn
+# -Version: MPSS.JO.4.0-00194-SHIKRA_LWG_PACK-1
+# +Version: MPSS.JO.4.0-00194.2-SHIKRA_LWG_PACK-1
+#  
+#  Licence: Redistributable. See LICENSE.qcom-2 and NOTICE.qcom for details
+#  
+# @@ -8320,6 +8345,7 @@
+#  File: cirrus/cs35l56/CS35L56_Rev3.13.4.wmfw
+#  File: cirrus/cs35l56/CS35L56_Rev4.5.3.wmfw
+#  File: cirrus/cs35l56/CS35L56_Rev4.5.9.wmfw
+# +File: cirrus/cs35l56/CS35L56_Rev4.7.0.wmfw
+#  File: cirrus/cs35l56/CS35L56_Rev4.7.2.wmfw
+#  File: cirrus/cs35l63/CS35L63_Rev2.5.4.wmfw
+#  File: cirrus/cs35l63/CS35L63_Rev2.5.7.wmfw
+# @@ -8491,6 +8517,18 @@
+#  Link: cirrus/cs35l56-b2-dsp1-misc-10280dd6-03.wmfw -> cs35l56/CS35L56_Rev4.5.9.wmfw
+#  File: cirrus/cs35l56-b2-dsp1-misc-10280dd6-03-ampl.bin
+#  File: cirrus/cs35l56-b2-dsp1-misc-10280dd6-03-ampr.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280e13-spkid0.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280e13-spkid0-00-l3u1.bin -> cs35l63-a1-dsp1-misc-10280e2b-spkid0-00-l1u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280e13-spkid0-00-l3u3.bin -> cs35l63-a1-dsp1-misc-10280e2b-spkid0-00-l1u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280e13-spkid1.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280e13-spkid1-00-l3u1.bin -> cs35l63-a1-dsp1-misc-10280e2b-spkid1-00-l1u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280e13-spkid1-00-l3u3.bin -> cs35l63-a1-dsp1-misc-10280e2b-spkid1-00-l1u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280e14-spkid0.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280e14-spkid0-00-l3u1.bin -> cs35l63-a1-dsp1-misc-10280e2c-spkid0-00-l1u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280e14-spkid0-00-l3u3.bin -> cs35l63-a1-dsp1-misc-10280e2c-spkid0-00-l1u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280e14-spkid1.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280e14-spkid1-00-l3u1.bin -> cs35l63-a1-dsp1-misc-10280e2c-spkid1-00-l1u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280e14-spkid1-00-l3u3.bin -> cs35l63-a1-dsp1-misc-10280e2c-spkid1-00-l1u3.bin
+#  Link: cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid0.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+#  File: cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid0-02-l3u1.bin
+#  File: cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid0-02-l3u3.bin
+# @@ -9042,6 +9080,28 @@
+#  File: cirrus/cs35l56-b0-dsp1-misc-10433451-l1u1.bin
+#  File: cirrus/cs35l56-b0-dsp1-misc-10433451-l1u2.bin
+#  File: cirrus/cs35l56-b0-dsp1-misc-10433451-l1u3.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-144dc1dc.wmfw -> cs35l56/CS35L56_Rev4.7.0.wmfw
+# +File: cirrus/cs35l57-b2-dsp1-misc-144dc1dc-l1u0.bin
+# +File: cirrus/cs35l57-b2-dsp1-misc-144dc1dc-l1u1.bin
+# +File: cirrus/cs35l57-b2-dsp1-misc-144dc1dc-l1u2.bin
+# +File: cirrus/cs35l57-b2-dsp1-misc-144dc1dc-l2u3.bin
+# +File: cirrus/cs35l57-b2-dsp1-misc-144dc1dc-l2u4.bin
+# +File: cirrus/cs35l57-b2-dsp1-misc-144dc1dc-l2u5.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-144dc1de.wmfw -> cs35l56/CS35L56_Rev4.7.0.wmfw
+# +File: cirrus/cs35l57-b2-dsp1-misc-144dc1de-l1u0.bin
+# +File: cirrus/cs35l57-b2-dsp1-misc-144dc1de-l1u1.bin
+# +File: cirrus/cs35l57-b2-dsp1-misc-144dc1de-l2u2.bin
+# +File: cirrus/cs35l57-b2-dsp1-misc-144dc1de-l2u3.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-144dc910.wmfw -> cs35l56/CS35L56_Rev4.7.0.wmfw
+# +File: cirrus/cs35l57-b2-dsp1-misc-144dc910-l1u0.bin
+# +File: cirrus/cs35l57-b2-dsp1-misc-144dc910-l2u1.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-144dca0a.wmfw -> cs35l56/CS35L56_Rev4.7.0.wmfw
+# +Link: cirrus/cs35l57-b2-dsp1-misc-144dca0a-l1u0.bin -> cs35l57-b2-dsp1-misc-144dc1dc-l1u0.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-144dca0a-l1u1.bin -> cs35l57-b2-dsp1-misc-144dc1dc-l1u1.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-144dca0a-l1u2.bin -> cs35l57-b2-dsp1-misc-144dc1dc-l1u2.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-144dca0a-l2u3.bin -> cs35l57-b2-dsp1-misc-144dc1dc-l2u3.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-144dca0a-l2u4.bin -> cs35l57-b2-dsp1-misc-144dc1dc-l2u4.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-144dca0a-l2u5.bin -> cs35l57-b2-dsp1-misc-144dc1dc-l2u5.bin
+#  Link: cirrus/cs35l56-b0-dsp1-misc-17aa233b-spkid0.wmfw -> cs35l56/CS35L56_Rev3.11.20.wmfw
+#  File: cirrus/cs35l56-b0-dsp1-misc-17aa233b-spkid0-ampl.bin
+#  File: cirrus/cs35l56-b0-dsp1-misc-17aa233b-spkid0-ampr.bin
+# @@ -9248,6 +9308,16 @@
+#  Link: sdca/1fa/1028/dba/3.bin -> ../db3/3.bin
+#  Link: sdca/1fa/1028/dba/4.bin -> ../db3/4.bin
+#  Link: sdca/1fa/1028/dba/42450005.bin -> ../db3/42450005.bin
+# +Link: sdca/1fa/1028/e13/1.bin -> ../db3/1.bin
+# +Link: sdca/1fa/1028/e13/2.bin -> ../db3/2.bin
+# +Link: sdca/1fa/1028/e13/3.bin -> ../db3/3.bin
+# +Link: sdca/1fa/1028/e13/4.bin -> ../db3/4.bin
+# +Link: sdca/1fa/1028/e13/42450005.bin -> ../db3/42450005.bin
+# +Link: sdca/1fa/1028/e14/1.bin -> ../db3/1.bin
+# +Link: sdca/1fa/1028/e14/2.bin -> ../db3/2.bin
+# +Link: sdca/1fa/1028/e14/3.bin -> ../db3/3.bin
+# +Link: sdca/1fa/1028/e14/4.bin -> ../db3/4.bin
+# +Link: sdca/1fa/1028/e14/42450005.bin -> ../db3/42450005.bin
+#  File: sdca/1fa/1028/e1a/1.bin
+#  File: sdca/1fa/1028/e1a/2.bin
+#  File: sdca/1fa/1028/e1a/3.bin
+# @@ -9507,6 +9577,7 @@
+#  Driver: powervr - Imagination Technologies PowerVR graphics driver
+#  
+#  File: powervr/rogue_33.15.11.3_v1.fw
+# +File: powervr/rogue_36.52.104.182_v1.fw
+#  File: powervr/rogue_36.53.104.796_v1.fw
+#  Version: 1.1.OS@6976702
+#  
+# @@ -9523,6 +9594,7 @@
+#  Link: qcom/qcs6490/QCS6490-Radxa-Dragon-Q6A-tplg.bin -> radxa/dragon-q6a/QCS6490-Radxa-Dragon-Q6A-tplg.bin
+#  File: qcom/qcs6490/Thundercomm/RubikPi3/QCS6490-Thundercomm-RubikPi3-tplg.bin
+#  Link: qcom/qcs6490/QCS6490-Thundercomm-RubikPi3-tplg.bin -> Thundercomm/RubikPi3/QCS6490-Thundercomm-RubikPi3-tplg.bin
+# +File: qcom/qcs6490/QCS6490-RB3Gen2-Industrial-Mezz-tplg.bin
+#  File: qcom/qcs6490/QCS6490-RB3Gen2-tplg.bin
+#  File: qcom/qcs8300/MONACO-EVK-tplg.bin
+#  File: qcom/qcs8300/arduino-monza-tplg.bin
+# @@ -9533,6 +9605,8 @@
+#  File: qcom/sm8450/SM8450-HDK-tplg.bin
+#  File: qcom/sm8550/SM8550-HDK-tplg.bin
+#  File: qcom/sm8550/SM8550-QRD-tplg.bin
+# +File: qcom/sm8650/ayaneo/ps2/SM8650-APS2-tplg.bin
+# +File: qcom/sm8650/SM8650-HDK-tplg.bin
+#  File: qcom/sm8650/SM8650-QRD-tplg.bin
+#  File: qcom/sm8650/SM8650-MTP-tplg.bin
+#  File: qcom/sm8750/SM8750-MTP-tplg.bin
+# @@ -9560,9 +9634,10 @@
+#  Link: qcom/x1e80100/X1E80100-Dell-XPS-13-9345-tplg.bin -> dell/xps13-9345/X1E80100-Dell-XPS-13-9345-tplg.bin
+#  File: qcom/x1e80100/hp/omnibook-x14/X1E80100-HP-OMNIBOOK-X14-tplg.bin
+#  Link: qcom/x1e80100/X1E80100-HP-OMNIBOOK-X14-tplg.bin -> hp/omnibook-x14/X1E80100-HP-OMNIBOOK-X14-tplg.bin
+# -
+# -Version: v1.0.3
+# -Info: DATE=07.04.2026
+# +File: qcom/x1e80100/X1P42100-Microsoft-Surface-Pro-12in-tplg.bin
+# +
+# +Version: v1.0.4
+# +Info: DATE=05.06.2026
+#  
+#  Licence: Redistributable. See LICENCE.linaro for details
+#  Originates from https://github.com/linux-msm/audioreach-topology.git
+# @@ -9660,6 +9735,9 @@
+#  File: ti/audio/tas2781/TAS2XXX8F41.bin
+#  File: ti/audio/tas2781/TAS2XXX8F42.bin
+#  File: ti/audio/tas2781/TAS2XXX8F62.bin
+# +File: ti/audio/tas2781/TAS2XXX8F7E.bin
+# +File: ti/audio/tas2781/TAS2XXX8F94.bin
+# +File: ti/audio/tas2781/TAS2XXX8F95.bin
+#  File: ti/audio/tas2781/TXNW2781RCA0.bin
+#  File: ti/audio/tas2781/TXNW2781RCA1.bin
+#  File: ti/audio/tas2781/TIAS2781RCA2.bin
+# @@ -9784,6 +9862,9 @@
+#  Link: TAS2XXX8F41.bin -> ti/audio/tas2781/TAS2XXX8F41.bin
+#  Link: TAS2XXX8F42.bin -> ti/audio/tas2781/TAS2XXX8F42.bin
+#  Link: TAS2XXX8F62.bin -> ti/audio/tas2781/TAS2XXX8F62.bin
+# +Link: TAS2XXX8F7E.bin -> ti/audio/tas2781/TAS2XXX8F7E.bin
+# +Link: TAS2XXX8F94.bin -> ti/audio/tas2781/TAS2XXX8F94.bin
+# +Link: TAS2XXX8F95.bin -> ti/audio/tas2781/TAS2XXX8F95.bin
+#  Link: TIAS2781RCA2.bin -> ti/audio/tas2781/TIAS2781RCA2.bin
+#  Link: TIAS2781RCA4.bin -> ti/audio/tas2781/TIAS2781RCA4.bin
+#  Link: TXNW2781RCA1.bin -> ti/audio/tas2781/TXNW2781RCA0.bin
+# @@ -9806,6 +9887,22 @@
+#  File: ti/audio/tas2783/8EF6-X-C.bin
+#  File: ti/audio/tas2783/1534-2-0x8.bin
+#  File: ti/audio/tas2783/1534-2-0xB.bin
+# +File: ti/audio/tas2783/15E2-0-0x8.bin
+# +File: ti/audio/tas2783/15E2-0-0x9.bin
+# +File: ti/audio/tas2783/15E2-0-0xA.bin
+# +File: ti/audio/tas2783/15E2-0-0xB.bin
+# +File: ti/audio/tas2783/15E2-0-0xC.bin
+# +File: ti/audio/tas2783/15E2-0-0xD.bin
+# +File: ti/audio/tas2783/15E2-0-0xE.bin
+# +File: ti/audio/tas2783/15E2-0-0xF.bin
+# +File: ti/audio/tas2783/15E2-1-0x8.bin
+# +File: ti/audio/tas2783/15E2-1-0x9.bin
+# +File: ti/audio/tas2783/15E2-1-0xA.bin
+# +File: ti/audio/tas2783/15E2-1-0xB.bin
+# +File: ti/audio/tas2783/15E2-1-0xC.bin
+# +File: ti/audio/tas2783/15E2-1-0xD.bin
+# +File: ti/audio/tas2783/15E2-1-0xE.bin
+# +File: ti/audio/tas2783/15E2-1-0xF.bin
+#  File: ti/audio/tas2783/16F4-1-0x9.bin
+#  File: ti/audio/tas2783/16F4-1-0xC.bin
+#  File: ti/audio/tas2783/1714-1-0x8.bin
+# @@ -9854,6 +9951,10 @@
+#  File: ti/audio/tas2783/1B94-2-0-0xC.bin
+#  File: ti/audio/tas2783/1B94-3-0-0xB.bin
+#  File: ti/audio/tas2783/1B94-3-0-0xC.bin
+# +File: ti/audio/tas2783/1C64-0-0-0x8.bin
+# +File: ti/audio/tas2783/1C64-0-0-0xB.bin
+# +File: ti/audio/tas2783/1C64-1-0-0x8.bin
+# +File: ti/audio/tas2783/1C64-1-0-0xB.bin
+#  File: ti/audio/tas2783/3431-2-0x8.bin
+#  File: ti/audio/tas2783/3431-2-0xB.bin
+#  File: ti/audio/tas2783/35C1-1-0x9.bin
+# @@ -9942,9 +10043,61 @@
+#  File: ti/audio/tas2783/8FA5-0-0xA.bin
+#  File: ti/audio/tas2783/8FA5-0-0xC.bin
+#  File: ti/audio/tas2783/8FA5-0-0xD.bin
+# +File: ti/audio/tas2783/8FF4-1-0xC.bin
+# +File: ti/audio/tas2783/8FF4-1-0xD.bin
+# +File: ti/audio/tas2783/8FF4-2-0x9.bin
+# +File: ti/audio/tas2783/8FF4-2-0xA.bin
+# +File: ti/audio/tas2783/8FF5-1-0xC.bin
+# +File: ti/audio/tas2783/8FF5-1-0xD.bin
+# +File: ti/audio/tas2783/8FF5-2-0x9.bin
+# +File: ti/audio/tas2783/8FF5-2-0xA.bin
+# +File: ti/audio/tas2783/8FF7-1-0xC.bin
+# +File: ti/audio/tas2783/8FF7-2-0x9.bin
+# +File: ti/audio/tas2783/9001-1-0xA.bin
+# +File: ti/audio/tas2783/9001-1-0xD.bin
+# +File: ti/audio/tas2783/9001-2-0x9.bin
+# +File: ti/audio/tas2783/9001-2-0xC.bin
+# +File: ti/audio/tas2783/9013-0-2-0x9.bin
+# +File: ti/audio/tas2783/9013-0-2-0xC.bin
+# +File: ti/audio/tas2783/9013-1-2-0x9.bin
+# +File: ti/audio/tas2783/9013-1-2-0xC.bin
+# +File: ti/audio/tas2783/9014-0-2-0x9.bin
+# +File: ti/audio/tas2783/9014-0-2-0xC.bin
+# +File: ti/audio/tas2783/9014-1-2-0x9.bin
+# +File: ti/audio/tas2783/9014-1-2-0xC.bin
+# +File: ti/audio/tas2783/9015-0-2-0x9.bin
+# +File: ti/audio/tas2783/9015-0-2-0xC.bin
+# +File: ti/audio/tas2783/9015-1-2-0x9.bin
+# +File: ti/audio/tas2783/9015-1-2-0xC.bin
+# +File: ti/audio/tas2783/9026-0-2-0x9.bin
+# +File: ti/audio/tas2783/9026-0-2-0xC.bin
+# +File: ti/audio/tas2783/9026-1-2-0x9.bin
+# +File: ti/audio/tas2783/9026-1-2-0xC.bin
+# +File: ti/audio/tas2783/9028-2-0xC.bin
+# +File: ti/audio/tas2783/9028-2-0xD.bin
+# +File: ti/audio/tas2783/9028-3-0x9.bin
+# +File: ti/audio/tas2783/9028-3-0xA.bin
+# +File: ti/audio/tas2783/9029-2-0xC.bin
+# +File: ti/audio/tas2783/9029-3-0x9.bin
+#  
+#  Link: 1534-2-0x8.bin -> ti/audio/tas2783/1534-2-0x8.bin
+#  Link: 1534-2-0xB.bin -> ti/audio/tas2783/1534-2-0xB.bin
+# +Link: 15E2-0-0x8.bin -> ti/audio/tas2783/15E2-0-0x8.bin
+# +Link: 15E2-0-0x9.bin -> ti/audio/tas2783/15E2-0-0x9.bin
+# +Link: 15E2-0-0xA.bin -> ti/audio/tas2783/15E2-0-0xA.bin
+# +Link: 15E2-0-0xB.bin -> ti/audio/tas2783/15E2-0-0xB.bin
+# +Link: 15E2-0-0xC.bin -> ti/audio/tas2783/15E2-0-0xC.bin
+# +Link: 15E2-0-0xD.bin -> ti/audio/tas2783/15E2-0-0xD.bin
+# +Link: 15E2-0-0xE.bin -> ti/audio/tas2783/15E2-0-0xE.bin
+# +Link: 15E2-0-0xF.bin -> ti/audio/tas2783/15E2-0-0xF.bin
+# +Link: 15E2-1-0x8.bin -> ti/audio/tas2783/15E2-1-0x8.bin
+# +Link: 15E2-1-0x9.bin -> ti/audio/tas2783/15E2-1-0x9.bin
+# +Link: 15E2-1-0xA.bin -> ti/audio/tas2783/15E2-1-0xA.bin
+# +Link: 15E2-1-0xB.bin -> ti/audio/tas2783/15E2-1-0xB.bin
+# +Link: 15E2-1-0xC.bin -> ti/audio/tas2783/15E2-1-0xC.bin
+# +Link: 15E2-1-0xD.bin -> ti/audio/tas2783/15E2-1-0xD.bin
+# +Link: 15E2-1-0xE.bin -> ti/audio/tas2783/15E2-1-0xE.bin
+# +Link: 15E2-1-0xF.bin -> ti/audio/tas2783/15E2-1-0xF.bin
+#  Link: 16F4-1-0x9.bin -> ti/audio/tas2783/16F4-1-0x9.bin
+#  Link: 16F4-1-0xC.bin -> ti/audio/tas2783/16F4-1-0xC.bin
+#  Link: 1714-1-0x8.bin -> ti/audio/tas2783/1714-1-0x8.bin
+# @@ -9993,6 +10146,10 @@
+#  Link: 1B94-2-0-0xC.bin -> ti/audio/tas2783/1B94-2-0-0xC.bin
+#  Link: 1B94-3-0-0xB.bin -> ti/audio/tas2783/1B94-3-0-0xB.bin
+#  Link: 1B94-3-0-0xC.bin -> ti/audio/tas2783/1B94-3-0-0xC.bin
+# +Link: 1C64-0-0-0x8.bin -> ti/audio/tas2783/1C64-0-0-0x8.bin
+# +Link: 1C64-0-0-0xB.bin -> ti/audio/tas2783/1C64-0-0-0xB.bin
+# +Link: 1C64-1-0-0x8.bin -> ti/audio/tas2783/1C64-1-0-0x8.bin
+# +Link: 1C64-1-0-0xB.bin -> ti/audio/tas2783/1C64-1-0-0xB.bin
+#  Link: 3431-2-0x8.bin -> ti/audio/tas2783/3431-2-0x8.bin
+#  Link: 3431-2-0xB.bin -> ti/audio/tas2783/3431-2-0xB.bin
+#  Link: 35C1-1-0x9.bin -> ti/audio/tas2783/35C1-1-0x9.bin
+# @@ -10081,6 +10238,42 @@
+#  Link: 8FA5-0-0xA.bin -> ti/audio/tas2783/8FA5-0-0xA.bin
+#  Link: 8FA5-0-0xC.bin -> ti/audio/tas2783/8FA5-0-0xC.bin
+#  Link: 8FA5-0-0xD.bin -> ti/audio/tas2783/8FA5-0-0xD.bin
+# +Link: 8FF4-1-0xC.bin -> ti/audio/tas2783/8FF4-1-0xC.bin
+# +Link: 8FF4-1-0xD.bin -> ti/audio/tas2783/8FF4-1-0xD.bin
+# +Link: 8FF4-2-0x9.bin -> ti/audio/tas2783/8FF4-2-0x9.bin
+# +Link: 8FF4-2-0xA.bin -> ti/audio/tas2783/8FF4-2-0xA.bin
+# +Link: 8FF5-1-0xC.bin -> ti/audio/tas2783/8FF5-1-0xC.bin
+# +Link: 8FF5-1-0xD.bin -> ti/audio/tas2783/8FF5-1-0xD.bin
+# +Link: 8FF5-2-0x9.bin -> ti/audio/tas2783/8FF5-2-0x9.bin
+# +Link: 8FF5-2-0xA.bin -> ti/audio/tas2783/8FF5-2-0xA.bin
+# +Link: 8FF7-1-0xC.bin -> ti/audio/tas2783/8FF7-1-0xC.bin
+# +Link: 8FF7-2-0x9.bin -> ti/audio/tas2783/8FF7-2-0x9.bin
+# +Link: 9001-1-0xA.bin -> ti/audio/tas2783/9001-1-0xA.bin
+# +Link: 9001-1-0xD.bin -> ti/audio/tas2783/9001-1-0xD.bin
+# +Link: 9001-2-0x9.bin -> ti/audio/tas2783/9001-2-0x9.bin
+# +Link: 9001-2-0xC.bin -> ti/audio/tas2783/9001-2-0xC.bin
+# +Link: 9013-0-2-0x9.bin -> ti/audio/tas2783/9013-0-2-0x9.bin
+# +Link: 9013-0-2-0xC.bin -> ti/audio/tas2783/9013-0-2-0xC.bin
+# +Link: 9013-1-2-0x9.bin -> ti/audio/tas2783/9013-1-2-0x9.bin
+# +Link: 9013-1-2-0xC.bin -> ti/audio/tas2783/9013-1-2-0xC.bin
+# +Link: 9014-0-2-0x9.bin -> ti/audio/tas2783/9014-0-2-0x9.bin
+# +Link: 9014-0-2-0xC.bin -> ti/audio/tas2783/9014-0-2-0xC.bin
+# +Link: 9014-1-2-0x9.bin -> ti/audio/tas2783/9014-1-2-0x9.bin
+# +Link: 9014-1-2-0xC.bin -> ti/audio/tas2783/9014-1-2-0xC.bin
+# +Link: 9015-0-2-0x9.bin -> ti/audio/tas2783/9015-0-2-0x9.bin
+# +Link: 9015-0-2-0xC.bin -> ti/audio/tas2783/9015-0-2-0xC.bin
+# +Link: 9015-1-2-0x9.bin -> ti/audio/tas2783/9015-1-2-0x9.bin
+# +Link: 9015-1-2-0xC.bin -> ti/audio/tas2783/9015-1-2-0xC.bin
+# +Link: 9026-0-2-0x9.bin -> ti/audio/tas2783/9026-0-2-0x9.bin
+# +Link: 9026-0-2-0xC.bin -> ti/audio/tas2783/9026-0-2-0xC.bin
+# +Link: 9026-1-2-0x9.bin -> ti/audio/tas2783/9026-1-2-0x9.bin
+# +Link: 9026-1-2-0xC.bin -> ti/audio/tas2783/9026-1-2-0xC.bin
+# +Link: 9028-2-0xC.bin -> ti/audio/tas2783/9028-2-0xC.bin
+# +Link: 9028-2-0xD.bin -> ti/audio/tas2783/9028-2-0xD.bin
+# +Link: 9028-3-0x9.bin -> ti/audio/tas2783/9028-3-0x9.bin
+# +Link: 9028-3-0xA.bin -> ti/audio/tas2783/9028-3-0xA.bin
+# +Link: 9029-2-0xC.bin -> ti/audio/tas2783/9029-2-0xC.bin
+# +Link: 9029-3-0x9.bin -> ti/audio/tas2783/9029-3-0x9.bin
+#  Licence: Redistributable. LICENCE.ti-tspa for details. Marked:
+#  	 Copyright (C) 2026 Texas Instruments
+#  
+# @@ -10228,15 +10421,15 @@
+#  Driver: intel_vpu - Intel NPU driver
+#  
+#  File: intel/vpu/vpu_37xx_v1.bin
+# -Version: 20260505*MTL_CLIENT_SILICON-NVR+NN-deployment*3b1e1e826d34b0aeea5cc6d75b017eb4cbf5b735*3b1e1e826d34b0aeea5cc6d75b017eb4cbf5b735*3b1e1e826d3
+# +Version: 20260630*MTL_CLIENT_SILICON-NVR+NN-deployment*3b431d96211eb618edf1f7c444daa8185f1e686c*3b431d96211eb618edf1f7c444daa8185f1e686c*3b431d96211
+#  Link: intel/vpu/vpu_37xx_v0.0.bin -> vpu_37xx_v1.bin
+#  
+#  File: intel/vpu/vpu_40xx_v1.bin
+# -Version: May  5 2026*NPU40xx*build/ci/npu-fw-ci-ci_branch_UD202620_npu_release_26ww17-20260422_094127-fc285c23e1bf595d6430660503e8616549c01a34-8-g3b1e1e826d3*3b1e1e826d34b0aeea5cc6d75b017eb4cbf5b735
+# +Version: Jun 30 2026*NPU40xx*build/ci/npu-fw-ci-ci_branch_UD202628_npu_release_26ww25-20260626_085052-f9a611865dbf3e6b37a17a0b01a7e81e7fc812e7-1-g3b431d96211*3b431d96211eb618edf1f7c444daa8185f1e686c
+#  Link: intel/vpu/vpu_40xx_v0.0.bin -> vpu_40xx_v1.bin
+#  
+#  File: intel/vpu/vpu_50xx_v1.bin
+# -Version: May  5 2026*NPU50xx*build/ci/npu-fw-ci-ci_branch_UD202620_npu_release_26ww17-20260422_094127-fc285c23e1bf595d6430660503e8616549c01a34-8-g3b1e1e826d3*3b1e1e826d34b0aeea5cc6d75b017eb4cbf5b735
+# +Version: Jun 30 2026*NPU50xx*build/ci/npu-fw-ci-ci_branch_UD202628_npu_release_26ww25-20260626_085052-f9a611865dbf3e6b37a17a0b01a7e81e7fc812e7-1-g3b431d96211*3b431d96211eb618edf1f7c444daa8185f1e686c
+#  Link: intel/vpu/vpu_50xx_v0.0.bin -> vpu_50xx_v1.bin
+#  
+#  License: Redistributable. See LICENSE.intel_vpu for details
+# @@ -10293,3 +10486,17 @@
+#  
+#  Info:
+#  Firmware file generated via https://git.ti.com/cgit/lpaa-android-drivers/tasdevice-linux-driver/tree/json/tool/Non_Integrated_Bin_Tool_v1.4.1 and branch-master.
+# +---------------------------------------------------------------------------
+# +
+# +Driver: mm81x - Morse Micro mm81x Wi-Fi HaLow driver.
+# +
+# +File: morsemicro/mm81x/v56/mm8108.bin
+# +File: morsemicro/mm81x/v56/bcf_mm8108_mf15457.bin
+# +File: morsemicro/mm81x/v56/bcf_aw_hm677.bin
+# +Link: morsemicro/mm81x/v56/bcf_boardtype_0804.bin -> bcf_mm8108_mf15457.bin
+# +Link: morsemicro/mm81x/v56/bcf_boardtype_0807.bin -> bcf_mm8108_mf15457.bin
+# +Link: morsemicro/mm81x/v56/bcf_boardtype_0a02.bin -> bcf_aw_hm677.bin
+# +
+# +Version: 56
+# +
+# +License: Redistributable. See LICENCE.morsemicro for details.
+# 
+#
+
 SUMMARY = "Firmware files for use with Linux kernel"
 HOMEPAGE = "https://www.kernel.org/"
 DESCRIPTION = "Linux firmware is a package distributed alongside the Linux kernel \
@@ -274,7 +1101,7 @@ LIC_FILES_CHKSUM = "file://LICENSES/LICENCE.Abilis;md5=b5ee3f410780e56711ad48ead
                     file://LICENSES/LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
                     file://LICENSES/LICENSE.xe;md5=c674d38774242bc0c528214721488118 \
                     file://LICENSES/LICENCE.wf200;md5=4d1beff00d902c05c9c7e95a5d8eb52d \
-                    file://WHENCE;md5=${WHENCE_CHKSUM} \
+                    file://WHENCE;md5=de47d58e10797eae2ccc753ab8d69bd7 \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
@@ -416,7 +1243,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "2b9d8a358e76eb766588609135e53fa548b902c551daae33ee32f26f25e60dbb"
+SRC_URI[sha256sum] = "ac17c34fe73756926a961fbafadf8d8f07a3bd2dd2f4ea31a0fb5d50c714a49a"
 
 inherit allarch
 
-- 
2.47.1


--===============0658433556886074701==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 956 .bb files complete (0 cached, 956 parsed). 1987 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the allarch sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-7c4c8c6b837a4aead7d45d5ee0b8400c4d87f303"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:7c4c8c6b837a4aead7d45d5ee0b8400c4d87f303"
meta-yocto-bsp       
meta-poky            = "master:0afedb9b1195525861f9140d6f33e9cd4118b199"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 71 Local 58 Mirrors 0 Missed 13 Current 176 (81% match, 94% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 519 of 806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20260810.bb:do_recipe_qa)
NOTE: Running task 769 of 806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20260810.bb:do_create_recipe_spdx)
NOTE: recipe linux-firmware-1_20260810-r0: task do_recipe_qa: Started
NOTE: recipe linux-firmware-1_20260810-r0: task do_create_recipe_spdx: Started
NOTE: recipe linux-firmware-1_20260810-r0: task do_recipe_qa: Succeeded
NOTE: Running task 788 of 806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20260810.bb:do_fetch)
NOTE: recipe linux-firmware-1_20260810-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe linux-firmware-1_20260810-r0: task do_fetch: Started
NOTE: recipe linux-firmware-1_20260810-r0: task do_fetch: Succeeded
NOTE: Running task 789 of 806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20260810.bb:do_unpack)
NOTE: Running task 790 of 806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20260810.bb:do_prepare_recipe_sysroot)
NOTE: recipe linux-firmware-1_20260810-r0: task do_unpack: Started
NOTE: recipe linux-firmware-1_20260810-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-firmware-1_20260810-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe linux-firmware-1_20260810-r0: task do_unpack: Succeeded
NOTE: Running task 791 of 806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20260810.bb:do_patch)
NOTE: recipe linux-firmware-1_20260810-r0: task do_patch: Started
NOTE: recipe linux-firmware-1_20260810-r0: task do_patch: Succeeded
NOTE: Running task 792 of 806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20260810.bb:do_deploy_source_date_epoch)
NOTE: Running task 793 of 806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20260810.bb:do_populate_lic)
NOTE: recipe linux-firmware-1_20260810-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe linux-firmware-1_20260810-r0: task do_populate_lic: Started
NOTE: recipe linux-firmware-1_20260810-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 794 of 806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20260810.bb:do_configure)
NOTE: recipe linux-firmware-1_20260810-r0: task do_populate_lic: Succeeded
NOTE: recipe linux-firmware-1_20260810-r0: task do_configure: Started
NOTE: recipe linux-firmware-1_20260810-r0: task do_configure: Succeeded
NOTE: Running task 795 of 806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20260810.bb:do_compile)
NOTE: recipe linux-firmware-1_20260810-r0: task do_compile: Started
NOTE: recipe linux-firmware-1_20260810-r0: task do_compile: Succeeded
NOTE: Running task 796 of 806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20260810.bb:do_install)
NOTE: recipe linux-firmware-1_20260810-r0: task do_install: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patch/patch_2.8.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['gettext-minimal-native', 'libtool-native', 'quilt-native', 'texinfo-dummy-native', 'patch-native', 'pseudo-native', 'attr-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_install
| NOTE: make DESTDIR=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20260810/image FIRMWAREDIR=/usr/lib/firmware install
| install -d /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20260810/image/usr/lib/firmware
| ./copy-firmware.sh -j1 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20260810/image/usr/lib/firmware
| Now run "make dedup" to de-duplicate any firmware files
| Remove unlicensed firmware: f2255usb.bin
| Remove unlicensed firmware: mts_cdma.fw
| Remove unlicensed firmware: mts_gsm.fw
| Remove unlicensed firmware: mts_edge.fw
| Remove unlicensed firmware: ueagle-atm/930-fpga.bin
| rm: cannot remove '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20260810/image/usr/lib/firmware/ueagle-atm/930-fpga.bin': No such file or directory
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20260810/temp/run.do_install.3121707:148 exit 1 from 'rm /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20260810/image/usr/lib/firmware/$file'
| WARNING: Backtrace (BB generated script):
| 	#1: do_install, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20260810/temp/run.do_install.3121707, line 148
| 	#2: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20260810/temp/run.do_install.3121707, line 208
NOTE: recipe linux-firmware-1_20260810-r0: task do_install: Failed
NOTE: Tasks Summary: Attempted 796 tasks of which 785 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260811071432.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260811071432.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20260810.bb:do_install
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20260810/temp/log.do_install.3121707
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: linux-firmware-1_20260810-r0 do_install: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20260810/temp/run.do_install.3121707' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20260810/temp/log.do_install.3121707
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20260810.bb:do_install) failed with exit code '1'

--===============0658433556886074701==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-linux-firmware-upgrade-20260622-20260810.patch"

RnJvbSA2ZjRkNmIwMDg3Nzk2MjU5YjlmNTgyYjY0ZDJkZmZiZThjMWQ5ZjhmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTEgQXVnIDIwMjYgMDc6MTY6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aW51eC1maXJtd2FyZTogdXBncmFkZSAyMDI2MDYyMiAtPiAyMDI2MDgxMAoKLS0tCiAuLi4yMDI2
MDYyMi5iYiA9PiBsaW51eC1maXJtd2FyZV8yMDI2MDgxMC5iYn0gfCA4MzEgKysrKysrKysrKysr
KysrKystCiAxIGZpbGUgY2hhbmdlZCwgODI5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS97bGludXgtZmlybXdh
cmVfMjAyNjA2MjIuYmIgPT4gbGludXgtZmlybXdhcmVfMjAyNjA4MTAuYmJ9ICg4MyUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2Fy
ZV8yMDI2MDYyMi5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgt
ZmlybXdhcmVfMjAyNjA4MTAuYmIKc2ltaWxhcml0eSBpbmRleCA4MyUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZV8yMDI2MDYyMi5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJt
d2FyZV8yMDI2MDgxMC5iYgppbmRleCA2Y2NmYTE2MjU5Li45ZGFlNWVmNDc3IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlXzIwMjYw
NjIyLmJiCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgtZmly
bXdhcmVfMjAyNjA4MTAuYmIKQEAgLTEsMyArMSw4MzAgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklM
RVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4K
KyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRo
ZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlm
IG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3Nh
Z2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0
ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0t
LSBXSEVOQ0UKKyMgKysrIFdIRU5DRQorIyBAQCAtMjU5LDYgKzI1OSw4IEBACisjICBWZXJzaW9u
OiA4LjA3LjAwIE1JRAorIyAgRmlsZTogcWwyNTAwX2Z3LmJpbgorIyAgVmVyc2lvbjogOC4wOC4y
MDcgTUlEUQorIyArRmlsZTogcWwyOTAwX2Z3LmJpbgorIyArVmVyc2lvbjogMTAuMzQuMDMKKyMg
IAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5xbGEyeHh4IGZvciBk
ZXRhaWxzCisjICAKKyMgQEAgLTkyMCwzMSArOTIyLDMxIEBACisjICAKKyMgIEZpbGU6IGludGVs
L2l3bHdpZmkvaXdsd2lmaS1jYy1hMC03Ny51Y29kZQorIyAgTGluazogaXdsd2lmaS1jYy1hMC03
Ny51Y29kZSAtPiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktY2MtYTAtNzcudWNvZGUKKyMgLVZlcnNp
b246IDc0LmYzOWNjN2Y5LjAKKyMgK1ZlcnNpb246IDc0LmFhMmRkMjk3LjAKKyMgIAorIyAgRmls
ZTogaW50ZWwvaXdsd2lmaS9pd2x3aWZpLVF1LWIwLWhyLWIwLTc3LnVjb2RlCisjICBMaW5rOiBp
d2x3aWZpLVF1LWIwLWhyLWIwLTc3LnVjb2RlIC0+IGludGVsL2l3bHdpZmkvaXdsd2lmaS1RdS1i
MC1oci1iMC03Ny51Y29kZQorIyAtVmVyc2lvbjogNzQuZjM5Y2M3ZjkuMAorIyArVmVyc2lvbjog
NzQuYWEyZGQyOTcuMAorIyAgCisjICBGaWxlOiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktUXUtYjAt
amYtYjAtNzcudWNvZGUKKyMgIExpbms6IGl3bHdpZmktUXUtYjAtamYtYjAtNzcudWNvZGUgLT4g
aW50ZWwvaXdsd2lmaS9pd2x3aWZpLVF1LWIwLWpmLWIwLTc3LnVjb2RlCisjIC1WZXJzaW9uOiA3
NC5mMzljYzdmOS4wCisjICtWZXJzaW9uOiA3NC5hYTJkZDI5Ny4wCisjICAKKyMgIEZpbGU6IGlu
dGVsL2l3bHdpZmkvaXdsd2lmaS1RdS1jMC1oci1iMC03Ny51Y29kZQorIyAgTGluazogaXdsd2lm
aS1RdS1jMC1oci1iMC03Ny51Y29kZSAtPiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktUXUtYzAtaHIt
YjAtNzcudWNvZGUKKyMgLVZlcnNpb246IDc0LmYzOWNjN2Y5LjAKKyMgK1ZlcnNpb246IDc0LmFh
MmRkMjk3LjAKKyMgIAorIyAgRmlsZTogaW50ZWwvaXdsd2lmaS9pd2x3aWZpLVF1LWMwLWpmLWIw
LTc3LnVjb2RlCisjICBMaW5rOiBpd2x3aWZpLVF1LWMwLWpmLWIwLTc3LnVjb2RlIC0+IGludGVs
L2l3bHdpZmkvaXdsd2lmaS1RdS1jMC1qZi1iMC03Ny51Y29kZQorIyAtVmVyc2lvbjogNzQuZjM5
Y2M3ZjkuMAorIyArVmVyc2lvbjogNzQuYWEyZGQyOTcuMAorIyAgCisjICBGaWxlOiBpbnRlbC9p
d2x3aWZpL2l3bHdpZmktUXVaLWEwLWhyLWIwLTc3LnVjb2RlCisjICBMaW5rOiBpd2x3aWZpLVF1
Wi1hMC1oci1iMC03Ny51Y29kZSAtPiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktUXVaLWEwLWhyLWIw
LTc3LnVjb2RlCisjIC1WZXJzaW9uOiA3NC5mMzljYzdmOS4wCisjICtWZXJzaW9uOiA3NC5hYTJk
ZDI5Ny4wCisjICAKKyMgIEZpbGU6IGludGVsL2l3bHdpZmkvaXdsd2lmaS1RdVotYTAtamYtYjAt
NzcudWNvZGUKKyMgIExpbms6IGl3bHdpZmktUXVaLWEwLWpmLWIwLTc3LnVjb2RlIC0+IGludGVs
L2l3bHdpZmkvaXdsd2lmaS1RdVotYTAtamYtYjAtNzcudWNvZGUKKyMgLVZlcnNpb246IDc0LmYz
OWNjN2Y5LjAKKyMgK1ZlcnNpb246IDc0LmFhMmRkMjk3LjAKKyMgIAorIyAgRmlsZTogaW50ZWwv
aXdsd2lmaS9pd2x3aWZpLXR5LWEwLWdmLWEwLTc3LnVjb2RlCisjICBMaW5rOiBpd2x3aWZpLXR5
LWEwLWdmLWEwLTc3LnVjb2RlIC0+IGludGVsL2l3bHdpZmkvaXdsd2lmaS10eS1hMC1nZi1hMC03
Ny51Y29kZQorIyBAQCAtOTc2LDcgKzk3OCw3IEBACisjICAKKyMgIEZpbGU6IGludGVsL2l3bHdp
ZmkvaXdsd2lmaS10eS1hMC1nZi1hMC04OS51Y29kZQorIyAgTGluazogaXdsd2lmaS10eS1hMC1n
Zi1hMC04OS51Y29kZSAtPiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktdHktYTAtZ2YtYTAtODkudWNv
ZGUKKyMgLVZlcnNpb246IDg2LjczNWI3NWE0LjAKKyMgK1ZlcnNpb246IDg2LmY3ZGNiM2VlLjAK
KyMgIAorIyAgRmlsZTogaW50ZWwvaXdsd2lmaS9pd2x3aWZpLXNvLWEwLWdmNC1hMC03Ny51Y29k
ZQorIyAgTGluazogaXdsd2lmaS1zby1hMC1nZjQtYTAtNzcudWNvZGUgLT4gaW50ZWwvaXdsd2lm
aS9pd2x3aWZpLXNvLWEwLWdmNC1hMC03Ny51Y29kZQorIyBAQCAtMTAwOCw3ICsxMDEwLDcgQEAK
KyMgIAorIyAgRmlsZTogaW50ZWwvaXdsd2lmaS9pd2x3aWZpLXNvLWEwLWdmNC1hMC04OS51Y29k
ZQorIyAgTGluazogaXdsd2lmaS1zby1hMC1nZjQtYTAtODkudWNvZGUgLT4gaW50ZWwvaXdsd2lm
aS9pd2x3aWZpLXNvLWEwLWdmNC1hMC04OS51Y29kZQorIyAtVmVyc2lvbjogODYuNzM1Yjc1YTQu
MAorIyArVmVyc2lvbjogODYuZjdkY2IzZWUuMAorIyAgCisjICBGaWxlOiBpbnRlbC9pd2x3aWZp
L2l3bHdpZmktc28tYTAtZ2YtYTAtNzcudWNvZGUKKyMgIExpbms6IGl3bHdpZmktc28tYTAtZ2Yt
YTAtNzcudWNvZGUgLT4gaW50ZWwvaXdsd2lmaS9pd2x3aWZpLXNvLWEwLWdmLWEwLTc3LnVjb2Rl
CisjIEBAIC0xMDQwLDcgKzEwNDIsNyBAQAorIyAgCisjICBGaWxlOiBpbnRlbC9pd2x3aWZpL2l3
bHdpZmktc28tYTAtZ2YtYTAtODkudWNvZGUKKyMgIExpbms6IGl3bHdpZmktc28tYTAtZ2YtYTAt
ODkudWNvZGUgLT4gaW50ZWwvaXdsd2lmaS9pd2x3aWZpLXNvLWEwLWdmLWEwLTg5LnVjb2RlCisj
IC1WZXJzaW9uOiA4Ni43MzViNzVhNC4wCisjICtWZXJzaW9uOiA4Ni5mN2RjYjNlZS4wCisjICAK
KyMgIEZpbGU6IGludGVsL2l3bHdpZmkvaXdsd2lmaS1zby1hMC1oci1iMC03Ny51Y29kZQorIyAg
TGluazogaXdsd2lmaS1zby1hMC1oci1iMC03Ny51Y29kZSAtPiBpbnRlbC9pd2x3aWZpL2l3bHdp
Zmktc28tYTAtaHItYjAtNzcudWNvZGUKKyMgQEAgLTEwNjgsNyArMTA3MCw3IEBACisjICAKKyMg
IEZpbGU6IGludGVsL2l3bHdpZmkvaXdsd2lmaS1zby1hMC1oci1iMC04OS51Y29kZQorIyAgTGlu
azogaXdsd2lmaS1zby1hMC1oci1iMC04OS51Y29kZSAtPiBpbnRlbC9pd2x3aWZpL2l3bHdpZmkt
c28tYTAtaHItYjAtODkudWNvZGUKKyMgLVZlcnNpb246IDg2LjczNWI3NWE0LjAKKyMgK1ZlcnNp
b246IDg2LmY3ZGNiM2VlLjAKKyMgIAorIyAgRmlsZTogaW50ZWwvaXdsd2lmaS9pd2x3aWZpLXNv
LWEwLWpmLWIwLTc3LnVjb2RlCisjICBMaW5rOiBpd2x3aWZpLXNvLWEwLWpmLWIwLTc3LnVjb2Rl
IC0+IGludGVsL2l3bHdpZmkvaXdsd2lmaS1zby1hMC1qZi1iMC03Ny51Y29kZQorIyBAQCAtMTA5
MSw3ICsxMDkzLDcgQEAKKyMgIAorIyAgRmlsZTogaW50ZWwvaXdsd2lmaS9pd2x3aWZpLWJ6LWIw
LWhyLWIwLTEwMC51Y29kZQorIyAgTGluazogaXdsd2lmaS1iei1iMC1oci1iMC0xMDAudWNvZGUg
LT4gaW50ZWwvaXdsd2lmaS9pd2x3aWZpLWJ6LWIwLWhyLWIwLTEwMC51Y29kZQorIyAtVmVyc2lv
bjogOTcuZGUwNjg0MzVkLjAKKyMgK1ZlcnNpb246IDk3LmEwM2IxMDRjLjAKKyMgIAorIyAgRmls
ZTogaW50ZWwvaXdsd2lmaS9pd2x3aWZpLWJ6LWIwLWhyLWIwLnBudm0KKyMgIExpbms6IGl3bHdp
ZmktYnotYjAtaHItYjAucG52bSAtPiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktYnotYjAtaHItYjAu
cG52bQorIyBAQCAtMTExOCw3ICsxMTIwLDcgQEAKKyMgIAorIyAgRmlsZTogaW50ZWwvaXdsd2lm
aS9pd2x3aWZpLWJ6LWIwLWdmLWEwLTEwMC51Y29kZQorIyAgTGluazogaXdsd2lmaS1iei1iMC1n
Zi1hMC0xMDAudWNvZGUgLT4gaW50ZWwvaXdsd2lmaS9pd2x3aWZpLWJ6LWIwLWdmLWEwLTEwMC51
Y29kZQorIyAtVmVyc2lvbjogOTcuZGUwNjg0MzVkLjAKKyMgK1ZlcnNpb246IDk3LmEwM2IxMDRj
LjAKKyMgIAorIyAgRmlsZTogaW50ZWwvaXdsd2lmaS9pd2x3aWZpLWJ6LWIwLWdmLWEwLnBudm0K
KyMgIExpbms6IGl3bHdpZmktYnotYjAtZ2YtYTAucG52bSAtPiBpbnRlbC9pd2x3aWZpL2l3bHdp
ZmktYnotYjAtZ2YtYTAucG52bQorIyBAQCAtMTE2Nyw2ICsxMTY5LDEwIEBACisjICBMaW5rOiBp
d2x3aWZpLWdsLWMwLWZtLWMwLWMxMDMudWNvZGUgLT4gaW50ZWwvaXdsd2lmaS9pd2x3aWZpLWds
LWMwLWZtLWMwLWMxMDMudWNvZGUKKyMgIFZlcnNpb246IDEwMy4xYTVjYzg4ZC4wCisjICAKKyMg
K0ZpbGU6IGludGVsL2l3bHdpZmkvaXdsd2lmaS1nbC1jMC1mbS1jMC1jMTA2LnVjb2RlCisjICtM
aW5rOiBpd2x3aWZpLWdsLWMwLWZtLWMwLWMxMDYudWNvZGUgLT4gaW50ZWwvaXdsd2lmaS9pd2x3
aWZpLWdsLWMwLWZtLWMwLWMxMDYudWNvZGUKKyMgK1ZlcnNpb246IDEwNi5jODhkMzNhZi4wCisj
ICsKKyMgIEZpbGU6IGludGVsL2l3bHdpZmkvaXdsd2lmaS1nbC1jMC1mbS1jMC1jMTAxLnVjb2Rl
CisjICBMaW5rOiBpd2x3aWZpLWdsLWMwLWZtLWMwLWMxMDEudWNvZGUgLT4gaW50ZWwvaXdsd2lm
aS9pd2x3aWZpLWdsLWMwLWZtLWMwLWMxMDEudWNvZGUKKyMgIFZlcnNpb246IDEwMS42ZTY5NWE3
MC4wCisjIEBAIC0xMjEwLDE3ICsxMjE2LDIxIEBACisjICBMaW5rOiBpd2x3aWZpLWJ6LWIwLWZt
LWMwLTEwMS51Y29kZSAtPiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktYnotYjAtZm0tYzAtMTAxLnVj
b2RlCisjICBWZXJzaW9uOiA5OC42ZWYyMGIxOS4wCisjICAKKyMgK0ZpbGU6IGludGVsL2l3bHdp
ZmkvaXdsd2lmaS1iei1iMC1mbS1jMC1jMTAxLnVjb2RlCisjICtMaW5rOiBpd2x3aWZpLWJ6LWIw
LWZtLWMwLWMxMDEudWNvZGUgLT4gaW50ZWwvaXdsd2lmaS9pd2x3aWZpLWJ6LWIwLWZtLWMwLWMx
MDEudWNvZGUKKyMgK1ZlcnNpb246IDEwMS42ZTY5NWE3MC4wCisjICsKKyMgK0ZpbGU6IGludGVs
L2l3bHdpZmkvaXdsd2lmaS1iei1iMC1mbS1jMC1jMTAyLnVjb2RlCisjICtMaW5rOiBpd2x3aWZp
LWJ6LWIwLWZtLWMwLWMxMDIudWNvZGUgLT4gaW50ZWwvaXdsd2lmaS9pd2x3aWZpLWJ6LWIwLWZt
LWMwLWMxMDIudWNvZGUKKyMgK1ZlcnNpb246IDEwMi4wN2ZjYTE2OC4wCisjICsKKyMgIEZpbGU6
IGludGVsL2l3bHdpZmkvaXdsd2lmaS1iei1iMC1mbS1jMC1jMTAzLnVjb2RlCisjICBMaW5rOiBp
d2x3aWZpLWJ6LWIwLWZtLWMwLWMxMDMudWNvZGUgLT4gaW50ZWwvaXdsd2lmaS9pd2x3aWZpLWJ6
LWIwLWZtLWMwLWMxMDMudWNvZGUKKyMgIFZlcnNpb246IDEwMy4xYTVjYzg4ZC4wCisjICAKKyMg
LUZpbGU6IGludGVsL2l3bHdpZmkvaXdsd2lmaS1iei1iMC1mbS1jMC1jMTAxLnVjb2RlCisjIC1M
aW5rOiBpd2x3aWZpLWJ6LWIwLWZtLWMwLWMxMDEudWNvZGUgLT4gaW50ZWwvaXdsd2lmaS9pd2x3
aWZpLWJ6LWIwLWZtLWMwLWMxMDEudWNvZGUKKyMgLVZlcnNpb246IDEwMS42ZTY5NWE3MC4wCisj
IC0KKyMgLUZpbGU6IGludGVsL2l3bHdpZmkvaXdsd2lmaS1iei1iMC1mbS1jMC1jMTAyLnVjb2Rl
CisjIC1MaW5rOiBpd2x3aWZpLWJ6LWIwLWZtLWMwLWMxMDIudWNvZGUgLT4gaW50ZWwvaXdsd2lm
aS9pd2x3aWZpLWJ6LWIwLWZtLWMwLWMxMDIudWNvZGUKKyMgLVZlcnNpb246IDEwMi4wN2ZjYTE2
OC4wCisjICtGaWxlOiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktYnotYjAtZm0tYzAtYzEwNi51Y29k
ZQorIyArTGluazogaXdsd2lmaS1iei1iMC1mbS1jMC1jMTA2LnVjb2RlIC0+IGludGVsL2l3bHdp
ZmkvaXdsd2lmaS1iei1iMC1mbS1jMC1jMTA2LnVjb2RlCisjICtWZXJzaW9uOiAxMDYuYzg4ZDMz
YWYuMAorIyAgCisjICBGaWxlOiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktYnotYjAtZm0tYzAucG52
bQorIyAgTGluazogaXdsd2lmaS1iei1iMC1mbS1jMC5wbnZtIC0+IGludGVsL2l3bHdpZmkvaXds
d2lmaS1iei1iMC1mbS1jMC5wbnZtCisjIEBAIC0xMjM1LDcgKzEyNDUsNyBAQAorIyAgCisjICBG
aWxlOiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktbWEtYjAtZ2YtYTAtODkudWNvZGUKKyMgIExpbms6
IGl3bHdpZmktbWEtYjAtZ2YtYTAtODkudWNvZGUgLT4gaW50ZWwvaXdsd2lmaS9pd2x3aWZpLW1h
LWIwLWdmLWEwLTg5LnVjb2RlCisjIC1WZXJzaW9uOiA4Ni43MzViNzVhNC4wCisjICtWZXJzaW9u
OiA4Ni5mN2RjYjNlZS4wCisjICAKKyMgIEZpbGU6IGludGVsL2l3bHdpZmkvaXdsd2lmaS1tYS1i
MC1nZi1hMC5wbnZtCisjICBMaW5rOiBpd2x3aWZpLW1hLWIwLWdmLWEwLnBudm0gLT4gaW50ZWwv
aXdsd2lmaS9pd2x3aWZpLW1hLWIwLWdmLWEwLnBudm0KKyMgQEAgLTEyNTAsNyArMTI2MCw3IEBA
CisjICAKKyMgIEZpbGU6IGludGVsL2l3bHdpZmkvaXdsd2lmaS1tYS1iMC1nZjQtYTAtODkudWNv
ZGUKKyMgIExpbms6IGl3bHdpZmktbWEtYjAtZ2Y0LWEwLTg5LnVjb2RlIC0+IGludGVsL2l3bHdp
ZmkvaXdsd2lmaS1tYS1iMC1nZjQtYTAtODkudWNvZGUKKyMgLVZlcnNpb246IDg2LjczNWI3NWE0
LjAKKyMgK1ZlcnNpb246IDg2LmY3ZGNiM2VlLjAKKyMgIAorIyAgRmlsZTogaW50ZWwvaXdsd2lm
aS9pd2x3aWZpLW1hLWIwLWdmNC1hMC5wbnZtCisjICBMaW5rOiBpd2x3aWZpLW1hLWIwLWdmNC1h
MC5wbnZtIC0+IGludGVsL2l3bHdpZmkvaXdsd2lmaS1tYS1iMC1nZjQtYTAucG52bQorIyBAQCAt
MTI2NSw3ICsxMjc1LDcgQEAKKyMgIAorIyAgRmlsZTogaW50ZWwvaXdsd2lmaS9pd2x3aWZpLW1h
LWIwLWhyLWIwLTg5LnVjb2RlCisjICBMaW5rOiBpd2x3aWZpLW1hLWIwLWhyLWIwLTg5LnVjb2Rl
IC0+IGludGVsL2l3bHdpZmkvaXdsd2lmaS1tYS1iMC1oci1iMC04OS51Y29kZQorIyAtVmVyc2lv
bjogODYuNzM1Yjc1YTQuMAorIyArVmVyc2lvbjogODYuZjdkY2IzZWUuMAorIyAgCisjICBGaWxl
OiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktc2MtYTAtd2gtYjAtMTAxLnVjb2RlCisjICBMaW5rOiBp
d2x3aWZpLXNjLWEwLXdoLWIwLTEwMS51Y29kZSAtPiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktc2Mt
YTAtd2gtYjAtMTAxLnVjb2RlCisjIEBAIC0xMjc1LDYgKzEyODUsMTAgQEAKKyMgIExpbms6IGl3
bHdpZmktc2MtYTAtd2gtYjAtYzEwMy51Y29kZSAtPiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktc2Mt
YTAtd2gtYjAtYzEwMy51Y29kZQorIyAgVmVyc2lvbjogMTAzLjFhNWNjODhkLjAKKyMgIAorIyAr
RmlsZTogaW50ZWwvaXdsd2lmaS9pd2x3aWZpLXNjLWEwLXdoLWIwLWMxMDYudWNvZGUKKyMgK0xp
bms6IGl3bHdpZmktc2MtYTAtd2gtYjAtYzEwNi51Y29kZSAtPiBpbnRlbC9pd2x3aWZpL2l3bHdp
Zmktc2MtYTAtd2gtYjAtYzEwNi51Y29kZQorIyArVmVyc2lvbjogMTA2LmM4OGQzM2FmLjAKKyMg
KworIyAgRmlsZTogaW50ZWwvaXdsd2lmaS9pd2x3aWZpLXNjLWEwLXdoLWIwLWMxMDEudWNvZGUK
KyMgIExpbms6IGl3bHdpZmktc2MtYTAtd2gtYjAtYzEwMS51Y29kZSAtPiBpbnRlbC9pd2x3aWZp
L2l3bHdpZmktc2MtYTAtd2gtYjAtYzEwMS51Y29kZQorIyAgVmVyc2lvbjogMTAxLjZlNjk1YTcw
LjAKKyMgQEAgLTEyODUsNyArMTI5OSw3IEBACisjICAKKyMgIEZpbGU6IGludGVsL2l3bHdpZmkv
aXdsd2lmaS1zYy1hMC1nZi1hMC0xMDAudWNvZGUKKyMgIExpbms6IGl3bHdpZmktc2MtYTAtZ2Yt
YTAtMTAwLnVjb2RlIC0+IGludGVsL2l3bHdpZmkvaXdsd2lmaS1zYy1hMC1nZi1hMC0xMDAudWNv
ZGUKKyMgLVZlcnNpb246IDk3LmRlMDY4NDM1ZC4wCisjICtWZXJzaW9uOiA5Ny5hMDNiMTA0Yy4w
CisjICAKKyMgIEZpbGU6IGludGVsL2l3bHdpZmkvaXdsd2lmaS1zYy1hMC1mbS1jMC1jMTAxLnVj
b2RlCisjICBMaW5rOiBpd2x3aWZpLXNjLWEwLWZtLWMwLWMxMDEudWNvZGUgLT4gaW50ZWwvaXds
d2lmaS9pd2x3aWZpLXNjLWEwLWZtLWMwLWMxMDEudWNvZGUKKyMgQEAgLTEzMDMsOSArMTMxNywx
NyBAQAorIyAgTGluazogaXdsd2lmaS1zYy1hMC1mbS1jMC1jMTAzLnVjb2RlIC0+IGludGVsL2l3
bHdpZmkvaXdsd2lmaS1zYy1hMC1mbS1jMC1jMTAzLnVjb2RlCisjICBWZXJzaW9uOiAxMDMuMWE1
Y2M4OGQuMAorIyAgCisjICtGaWxlOiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktc2MtYTAtZm0tYzAt
YzEwNi51Y29kZQorIyArTGluazogaXdsd2lmaS1zYy1hMC1mbS1jMC1jMTA2LnVjb2RlIC0+IGlu
dGVsL2l3bHdpZmkvaXdsd2lmaS1zYy1hMC1mbS1jMC1jMTA2LnVjb2RlCisjICtWZXJzaW9uOiAx
MDYuYzg4ZDMzYWYuMAorIyArCisjICBGaWxlOiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktYnotYjAt
d2gtYjAtYzEwMy51Y29kZQorIyAgTGluazogaXdsd2lmaS1iei1iMC13aC1iMC1jMTAzLnVjb2Rl
IC0+IGludGVsL2l3bHdpZmkvaXdsd2lmaS1iei1iMC13aC1iMC1jMTAzLnVjb2RlCisjICBWZXJz
aW9uOiAxMDMuMWE1Y2M4OGQuMAorIyArCisjICtGaWxlOiBpbnRlbC9pd2x3aWZpL2l3bHdpZmkt
YnotYjAtd2gtYjAtYzEwNi51Y29kZQorIyArTGluazogaXdsd2lmaS1iei1iMC13aC1iMC1jMTA2
LnVjb2RlIC0+IGludGVsL2l3bHdpZmkvaXdsd2lmaS1iei1iMC13aC1iMC1jMTA2LnVjb2RlCisj
ICtWZXJzaW9uOiAxMDYuYzg4ZDMzYWYuMAorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFi
bGUuIFNlZSBMSUNFTkNFLml3bHdpZmlfZmlybXdhcmUgZm9yIGRldGFpbHMKKyMgIAorIyBAQCAt
MjA0NSw3ICsyMDY3LDcgQEAKKyMgIAorIyAgRmlsZTogYWlyb2hhL2FuODgxMWhiL0V0aE1EMzJf
Q1JDLkRNLmJpbgorIyAgRmlsZTogYWlyb2hhL2FuODgxMWhiL0V0aE1EMzJfQ1JDLkRTUC5iaW4K
KyMgLVZlcnNpb246IDI1MTEwNzAyCisjICtWZXJzaW9uOiAyNjA3MTYwMgorIyAgCisjICBMaWNl
bmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLmFpcm9oYSBmb3IgZGV0YWlscy4KKyMg
IAorIyBAQCAtMjA3Myw3ICsyMDk1LDkgQEAKKyMgIERyaXZlcjogYWlyb2hhLW5wdS03NTgzIC0g
QWlyb2hhIE5ldHdvcmsgUHJvY2Vzc29yIFVuaXQgZHJpdmVyIGZvciBBTjc1ODMgU29DCisjICAK
KyMgIEZpbGU6IGFpcm9oYS9hbjc1ODNfbnB1X2RhdGEuYmluCisjICtWZXJzaW9uOiAwLjUKKyMg
IEZpbGU6IGFpcm9oYS9hbjc1ODNfbnB1X3J2MzIuYmluCisjICtWZXJzaW9uOiAwLjUKKyMgIAor
IyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5haXJvaGEgZm9yIGRldGFp
bHMuCisjICAKKyMgQEAgLTI3MDIsNiArMjcyNiw4IEBACisjICBGaWxlOiBhbWRncHUvcHNwXzEz
XzBfMTJfdGEuYmluCisjICBGaWxlOiBhbWRncHUvcHNwXzEzXzBfMTRfc29zLmJpbgorIyAgRmls
ZTogYW1kZ3B1L3BzcF8xM18wXzE0X3RhLmJpbgorIyArRmlsZTogYW1kZ3B1L3BzcF8xM18wXzE1
X3Nvcy5iaW4KKyMgK0ZpbGU6IGFtZGdwdS9wc3BfMTNfMF8xNV90YS5iaW4KKyMgIEZpbGU6IGFt
ZGdwdS9wc3BfMTRfMF8wX3RhLmJpbgorIyAgRmlsZTogYW1kZ3B1L3BzcF8xNF8wXzBfdG9jLmJp
bgorIyAgRmlsZTogYW1kZ3B1L3BzcF8xNF8wXzFfdGEuYmluCisjIEBAIC0yODQ0LDM1ICsyODcw
LDYgQEAKKyMgIFZlcnNpb246IDEuMAorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUu
IFNlZSBMSUNFTkNFLnVlYWdsZS1hdG00LWZpcm13YXJlIGZvciBkZXRhaWxzCisjIC0KKyMgLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCisjIC0KKyMgLURyaXZlcjogdWVhZ2xlLWF0bSAtIERyaXZlciBmb3Ig
VVNCIEFEU0wgTW9kZW1zIGJhc2VkIG9uIEVhZ2xlIEksSUksSUlJCisjIC0KKyMgLUZpbGU6IHVl
YWdsZS1hdG0vOTMwLWZwZ2EuYmluCisjIC1GaWxlOiB1ZWFnbGUtYXRtL0NNVmVpV08uYmluCisj
IC1GaWxlOiB1ZWFnbGUtYXRtL0NNVmVwRlIxMC5iaW4KKyMgLUZpbGU6IHVlYWdsZS1hdG0vRFNQ
OXAuYmluCisjIC1GaWxlOiB1ZWFnbGUtYXRtL2VhZ2xlSUlJLmZ3CisjIC1GaWxlOiB1ZWFnbGUt
YXRtL2FkaTkzMC5mdworIyAtRmlsZTogdWVhZ2xlLWF0bS9DTVZlcC5iaW4KKyMgLUZpbGU6IHVl
YWdsZS1hdG0vQ01WZXBGUi5iaW4KKyMgLUZpbGU6IHVlYWdsZS1hdG0vRFNQZWkuYmluCisjIC1G
aWxlOiB1ZWFnbGUtYXRtL0NNVjlpLmJpbgorIyAtRmlsZTogdWVhZ2xlLWF0bS9DTVZlcEVTMDMu
YmluCisjIC1GaWxlOiB1ZWFnbGUtYXRtL0NNVmVwSVQuYmluCisjIC1GaWxlOiB1ZWFnbGUtYXRt
L0RTUGVwLmJpbgorIyAtRmlsZTogdWVhZ2xlLWF0bS9DTVY5cC5iaW4KKyMgLUZpbGU6IHVlYWds
ZS1hdG0vQ01WZXBFUy5iaW4KKyMgLUZpbGU6IHVlYWdsZS1hdG0vQ01WZXBXTy5iaW4KKyMgLUZp
bGU6IHVlYWdsZS1hdG0vZWFnbGVJLmZ3CisjIC1GaWxlOiB1ZWFnbGUtYXRtL0NNVmVpLmJpbgor
IyAtRmlsZTogdWVhZ2xlLWF0bS9DTVZlcEZSMDQuYmluCisjIC1GaWxlOiB1ZWFnbGUtYXRtL0RT
UDlpLmJpbgorIyAtRmlsZTogdWVhZ2xlLWF0bS9lYWdsZUlJLmZ3CisjIC1WZXJzaW9uOiAxLjEK
KyMgLQorIyAtTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS51ZWFnbGUgZm9y
IGRldGFpbHMKKyMgIAorIyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgIAorIyBAQCAtMzM2MCw2ICsz
MzU3LDcgQEAKKyMgIEZpbGU6IHJ0dzg4L3J0dzg4MjJjX2Z3LmJpbgorIyAgRmlsZTogcnR3ODgv
cnR3ODgyMmNfd293X2Z3LmJpbgorIyAgRmlsZTogcnR3ODgvUkVBRE1FCisjICtGaWxlOiBydHc4
OC9ydHc4NzIzYl9mdy5iaW4KKyMgIEZpbGU6IHJ0dzg4L3J0dzg3MjNkX2Z3LmJpbgorIyAgRmls
ZTogcnR3ODgvcnR3ODgyMWNfZncuYmluCisjICBGaWxlOiBydHc4OC9ydHc4NzAzYl9mdy5iaW4K
KyMgQEAgLTMzOTksNiArMzM5Nyw4IEBACisjICBGaWxlOiBydHc4OS9ydHc4OTIyYV9mdy0yLmJp
bgorIyAgRmlsZTogcnR3ODkvcnR3ODkyMmFfZnctMy5iaW4KKyMgIEZpbGU6IHJ0dzg5L3J0dzg5
MjJhX2Z3LTQuYmluCisjICtGaWxlOiBydHc4OS9ydHc4OTIyZF9mdy5iaW4KKyMgK0ZpbGU6IHJ0
dzg5L3J0dzg5MjJkc19mdy5iaW4KKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBT
ZWUgTElDRU5DRS5ydGx3aWZpX2Zpcm13YXJlLnR4dCBmb3IgZGV0YWlscy4KKyMgIAorIyBAQCAt
NDE3OCw3ICs0MTc4LDcgQEAKKyMgIEZpbGU6IGludGVsL2lidC0wMjkxLTAyOTEuZGRjCisjICBG
aWxlOiBpbnRlbC9pYnQtMDA5My0wMjkxLnNmaQorIyAgRmlsZTogaW50ZWwvaWJ0LTAwOTMtMDI5
MS5kZGMKKyMgLVZlcnNpb246IEJUX0JsYXphclVfU19SRUwxMTI5NjJfMjQuNTAuMjYxODIuMTEy
OTYyCisjICtWZXJzaW9uOiBCVF9CbGF6YXJVX1NfUkVMMTE3OTM2XzI0LjYwLjI2MjYyLjExNzkz
NgorIyAgCisjICBGaWxlOiBpbnRlbC9pYnQtMDE4MC0wMDQxLnNmaQorIyAgRmlsZTogaW50ZWwv
aWJ0LTAxODAtMDA0MS5kZGMKKyMgQEAgLTQyMTAsMTIgKzQyMTAsMTIgQEAKKyMgIEZpbGU6IGlu
dGVsL2lidC0wMTkwLTAyOTEtdXNiLnNmaQorIyAgRmlsZTogaW50ZWwvaWJ0LTAxOTAtMDI5MS1w
Y2kuZGRjCisjICBGaWxlOiBpbnRlbC9pYnQtMDE5MC0wMjkxLXBjaS5zZmkKKyMgLVZlcnNpb246
IEJUX0JsYXphcklfU19SRUwxMjAyOTBfMjQuNTAuMjYxODIuMTIwMjkwCisjICtWZXJzaW9uOiBC
VF9CbGF6YXJJX1NfUkVMMTI1MzI1XzI0LjYwLjI2MjYyLjEyNTMyNQorIyAgCisjICBGaWxlOiBp
bnRlbC9pYnQtMTE5MC0wMWExLWltbC5zZmkKKyMgIEZpbGU6IGludGVsL2lidC0xMTkwLTAxYTEt
cGNpLmRkYworIyAgRmlsZTogaW50ZWwvaWJ0LTExOTAtMDFhMS1wY2kuc2ZpCisjIC1WZXJzaW9u
OiBCVF9CbGF6YXJJX1NfUkVMMTIwMjkwXzI0LjUwLjI2MTgyLjEyMDI5MAorIyArVmVyc2lvbjog
QlRfQmxhemFySV9TX1JFTDEyNTMyNV8yNC42MC4yNjI2Mi4xMjUzMjUKKyMgIAorIyAgRmlsZTog
aW50ZWwvaWJ0LTAwYTAtMDFhMS1pbWwuc2ZpCisjICBGaWxlOiBpbnRlbC9pYnQtMDBhMC0wMWEx
LXBjaS5kZGMKKyMgQEAgLTQyMjcsNyArNDIyNyw3IEBACisjICBGaWxlOiBpbnRlbC9pYnQtMDBh
MC0wMjkxLXBjaS5zZmkKKyMgIEZpbGU6IGludGVsL2lidC0wMGEwLTAyOTEtdXNiLmRkYworIyAg
RmlsZTogaW50ZWwvaWJ0LTAwYTAtMDI5MS11c2Iuc2ZpCisjIC1WZXJzaW9uOiBCVF9TY29ycGl1
c19TX1JFTDg4ODQ3XzI0LjUwLjI2MTgyLjg4ODQ3CisjICtWZXJzaW9uOiBCVF9TY29ycGl1c19T
X1JFTDk0MjUwXzI0LjYwLjI2MjYyLjk0MjUwCisjICAKKyMgIEZpbGU6IGludGVsL2lidC0wMGEw
LTAwNDEtaW1sLnNmaQorIyAgRmlsZTogaW50ZWwvaWJ0LTAwYTAtMDA0MS1wY2kuZGRjCisjIEBA
IC00MzQ1LDYgKzQzNDUsNyBAQAorIyAgVmVyc2lvbjogMjAyNS0yLTIwCisjICBGaWxlOiBhbWQv
YW1kX3Nldl9mYW0xYWhfbW9kZWwweGguc2JpbgorIyAgVmVyc2lvbjogMjAyNS0yLTIwCisjICtG
aWxlOiBhbWQvUkVBRE1FLm1kCisjICAKKyMgIExpY2Vuc2U6IFJlZGlzdHJpYnV0YWJsZS4gU2Vl
IExJQ0VOU0UuYW1kLXNldiBmb3IgZGV0YWlscworIyAgCisjIEBAIC00ODg4LDYgKzQ4ODksMTAg
QEAKKyMgIEZpbGU6IHFjYS93Y25ocG52MjFnLmJiOAorIyAgRmlsZTogcWNhL3djbmhwbnYyMWcu
YjEwYworIyAgRmlsZTogcWNhL3djbmhwbnYyMWcuYjExMQorIyArRmlsZTogcWNhL3djbmhwYnRm
dzEwLnRsdgorIyArVmVyc2lvbjogQlRGTS5IU1AuMS4wLjAtMDA5NzgtUUNBSFNQUk9NWi0yCisj
ICtGaWxlOiBxY2Evd2NuaHBudjEwLmJpbgorIyArRmlsZTogcWNhL3djbmhwbnYxMC5iMDYKKyMg
IAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5RdWFsY29tbUF0aGVy
b3NfYXRoMTBrIGFuZCBOT1RJQ0UucWNhIGZvciBkZXRhaWxzCisjICAKKyMgQEAgLTQ5NjAsNyAr
NDk2NSw3IEBACisjICBEcml2ZXI6IHFjYSAtIFF1YWxjb21tIEF0aGVyb3MgQmx1ZXRvb3RoIHN1
cHBvcnQgZm9yIFFDQTY2OThBUSBjaGlwcworIyAgCisjICBGaWxlOiBxY2EvUUNBNjY5OC9ocGJ0
ZncyMS50bHYKKyMgLVZlcnNpb246IEJURlcuSFNQLjIuMS4yLTAwMDM1LVBBVENIWi0xCisjICtW
ZXJzaW9uOiBCVEZXLkhTUC4yLjEuMi0wMDA3Mi1QQVRDSFotMgorIyAgRmlsZTogcWNhL1FDQTY2
OTgvaHBudjIxLmIyMDYKKyMgIEZpbGU6IHFjYS9RQ0E2Njk4L2hwbnYyMS5iMjA3CisjICBGaWxl
OiBxY2EvUUNBNjY5OC9ocG52MjEuYmluCisjIEBAIC01Mzg4LDEzICs1MzkzLDEzIEBACisjICBW
ZXJzaW9uOiBHU0MgQVBJL0FQQiB2MS4wLCByZWxlYXNlIDEwNC4wLjUuMTQyOSwgU1ZOIDEgZm9y
IEx1bmFybGFrZQorIyAgCisjICBGaWxlOiB4ZS9sbmxfZ3VjXzcwLmJpbgorIyAtVmVyc2lvbjog
R3VDIEFQSS9BUEIgdmVyIDcwLjY1LjAgZm9yIEx1bmFybGFrZQorIyArVmVyc2lvbjogR3VDIEFQ
SS9BUEIgdmVyIDcwLjcyLjEgZm9yIEx1bmFybGFrZQorIyAgCisjICBGaWxlOiB4ZS9sbmxfaHVj
LmJpbgorIyAgVmVyc2lvbjogSHVDIEFQSS9BUEIgdmVyIDkuNC4xMyBmb3IgTHVuYXJsYWtlCisj
ICAKKyMgIEZpbGU6IHhlL2JtZ19ndWNfNzAuYmluCisjIC1WZXJzaW9uOiBHdUMgQVBJL0FQQiB2
ZXIgNzAuNjUuMCBmb3IgQmF0dGxlbWFnZQorIyArVmVyc2lvbjogR3VDIEFQSS9BUEIgdmVyIDcw
LjcyLjEgZm9yIEJhdHRsZW1hZ2UKKyMgIAorIyAgRmlsZTogeGUvYm1nX2h1Yy5iaW4KKyMgIFZl
cnNpb246IEh1QyBBUEkvQVBCIHZlciA4LjIuMTAgZm9yIEJhdHRsZW1hZ2UKKyMgQEAgLTU0MDYs
MTAgKzU0MTEsMTMgQEAKKyMgIFZlcnNpb246IEdTQyBBUEkvQVBCIHYxLjAsIHJlbGVhc2UgMTA1
LjAuMi4xMzk3LCBTVk4gMSBmb3IgUGFudGhlcmxha2UKKyMgIAorIyAgRmlsZTogeGUvcHRsX2d1
Y183MC5iaW4KKyMgLVZlcnNpb246IEd1QyBBUEkvQVBCIHZlciA3MC42NS4wIGZvciBQYW50aGVy
bGFrZQorIyArVmVyc2lvbjogR3VDIEFQSS9BUEIgdmVyIDcwLjcyLjEgZm9yIFBhbnRoZXJsYWtl
CisjICAKKyMgIEZpbGU6IHhlL3B0bF9odWMuYmluCisjICBWZXJzaW9uOiBIdUMgQVBJL0FQQiB2
ZXIgMTAuMy4zIGZvciBQYW50aGVybGFrZQorIyArCisjICtGaWxlOiB4ZS9udmxfZ3VjXzcwLmJp
bgorIyArVmVyc2lvbjogR3VDIEFQSS9BUEIgdmVyIDcwLjcyLjEgZm9yIE5vdmFsYWtlIFMKKyMg
IAorIyAgTGljZW5zZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS54ZSBmb3IgZGV0YWls
cworIyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgQEAgLTYyMjAsOSArNjIyOCw5IEBACisjICBEcml2
ZXI6IG10NzkyMiAtIE1lZGlhVGVrIE1UNzkyMiBXaXJlbGVzcyBNQUNzCisjICAKKyMgIEZpbGU6
IG1lZGlhdGVrL1dJRklfTVQ3OTIyX3BhdGNoX21jdV8xXzFfaGRyLmJpbgorIyAtVmVyc2lvbjog
MjAyNjA2MDUyMDMzMDdhCisjICtWZXJzaW9uOiAyMDI2MDcyNDE0MzI1N2EKKyMgIEZpbGU6IG1l
ZGlhdGVrL1dJRklfUkFNX0NPREVfTVQ3OTIyXzEuYmluCisjIC1WZXJzaW9uOiAyMDI2MDYwNTIw
MzQxMQorIyArVmVyc2lvbjogMjAyNjA3MjQxNDM0MDIKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0
cmlidXRhYmxlLiBTZWUgTElDRU5DRS5tZWRpYXRlayBmb3IgZGV0YWlscy4KKyMgIAorIyBAQCAt
NjIzMSw3ICs2MjM5LDcgQEAKKyMgIERyaXZlcjogbXQ3OTIyIC0gTWVkaWFUZWsgTVQ3OTIyIGJs
dWV0b290aCBjaGlwc2V0CisjICAKKyMgIEZpbGU6IG1lZGlhdGVrL0JUX1JBTV9DT0RFX01UNzky
Ml8xXzFfaGRyLmJpbgorIyAtVmVyc2lvbjogMjAyNjA2MDUyMDM4MTEKKyMgK1ZlcnNpb246IDIw
MjYwNzI0MTQzODE1CisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VO
Q0UubWVkaWF0ZWsgZm9yIGRldGFpbHMuCisjICAKKyMgQEAgLTY0OTksNyArNjUwNyw3IEBACisj
ICBGaWxlOiBxY29tL3ZlbnVzLTUuNC92ZW51cy5tYm4KKyMgIExpbms6IHFjb20vdmVudXMtNS40
L3ZlbnVzLm1kdCAtPiB2ZW51cy5tYm4KKyMgIAorIyAtVmVyc2lvbjogVklERU8uVkUuNS40LTAw
MDYzLVBST0QtMQorIyArVmVyc2lvbjogVklERU8uVkUuNS40LTAwMDY0LVBST0QtMQorIyAgCisj
ICBGaWxlOiBxY29tL3ZlbnVzLTYuMC92ZW51cy5tYm4KKyMgIAorIyBAQCAtNjUyNCw2ICs2NTMy
LDEwIEBACisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisjICBEcml2ZXI6IGlyaXMgLSBRdWFs
Y29tbSBJcmlzIHZpZGVvIGNvZGVjIGFjY2VsZXJhdG9yCisjICsKKyMgK0ZpbGU6IHFjb20vdnB1
L3ZwdTMwX3AxX3M3Lm1ibgorIyArCisjICtWZXJzaW9uOiBWSURFTy5WUFUuMy4xLTAxMDAKKyMg
IAorIyAgRmlsZTogcWNvbS92cHUvYXI1MGx0X3AxX2dlbjJfczYubWJuCisjICAKKyMgQEAgLTY2
NzcsNiArNjY4OSwxMiBAQAorIyAgVmVyc2lvbjogdjEuODEKKyMgIEZpbGU6IHFjb20veDFwNDIx
MDAvZ2VuNzE1MDBfemFwLm1ibgorIyAgVmVyc2lvbjogdjAuMTMKKyMgK0ZpbGU6IHFjb20vZ2Vu
NzE3MDBfZ211LmJpbgorIyArVmVyc2lvbjogdjQuMDkuMDAKKyMgK0ZpbGU6IHFjb20vZ2VuNzE3
MDBfc3FlLmZ3CisjICtWZXJzaW9uOiB2MS44MgorIyArRmlsZTogcWNvbS9lbGl6YS9nZW43MTcw
MF96YXAubWJuCisjICtWZXJzaW9uOiB2MC4xNQorIyAgRmlsZTogcWNvbS9nZW44MDAwMF9hcWUu
ZncKKyMgIFZlcnNpb246IHYwLjE0CisjICBGaWxlOiBxY29tL2dlbjgwMDAwX2dtdS5iaW4KKyMg
QEAgLTY4OTEsNiArNjkwOSwxMyBAQAorIyAgRmlsZTogcWNvbS9nbHltdXIvY2RzcF9kdGIubWJu
CisjICBWZXJzaW9uOiBDRFNQLkhULjMuMy0wMDMxNS1HTFlNVVItMQorIyAgUmF3RmlsZTogcWNv
bS9nbHltdXIvY2RzcHIuanNuCisjICtGaWxlOiBxY29tL2hhd2kvYWRzcC5tYm4KKyMgK0ZpbGU6
IHFjb20vaGF3aS9hZHNwX2R0Yi5tYm4KKyMgK1ZlcnNpb246IExQQUlEU1AuSFQuMS42LTAwNzAx
LjQtSEFXSS0yCisjICtSYXdGaWxlOiBxY29tL2hhd2kvYWRzcHIuanNuCisjICtSYXdGaWxlOiBx
Y29tL2hhd2kvYWRzcHMuanNuCisjICtSYXdGaWxlOiBxY29tL2hhd2kvYWRzcHVhLmpzbgorIyAr
UmF3RmlsZTogcWNvbS9oYXdpL2Fkc3B1by5qc24KKyMgIEZpbGU6IHFjb20va2FhbmFwYWxpL2Fk
c3AubWJuCisjICBGaWxlOiBxY29tL2thYW5hcGFsaS9hZHNwX2R0Yi5tYm4KKyMgIFZlcnNpb246
IExQQUlEU1AuSFQuMS42LjEtMDAwMzUtS0FBTkFQQUxJLTEKKyMgQEAgLTY5MDcsMjkgKzY5MzIs
MjkgQEAKKyMgIFZlcnNpb246IFNPQ0NQLkZXLjIuMS0wMDIwNC1LQUFOQVBBTElfU09DQ1BfUEFD
Sy0xCisjICBSYXdGaWxlOiBxY29tL2thYW5hcGFsaS9zb2NjcHIuanNuCisjICBGaWxlOiBxY29t
L3FjczgzMDAvYWRzcC5tYm4KKyMgLVZlcnNpb246IERTUC5BVC4xLjAuMS0wMDIwMS1MRU1BTlMt
MgorIyArVmVyc2lvbjogRFNQLkFULjEuMC4xLTAwMjA0LUxFTUFOUy0xCisjICBSYXdGaWxlOiBx
Y29tL3FjczgzMDAvYWRzcHIuanNuCisjICBSYXdGaWxlOiBxY29tL3FjczgzMDAvYWRzcHVhLmpz
bgorIyAgRmlsZTogcWNvbS9xY3M4MzAwL2Nkc3AwLm1ibgorIyAtVmVyc2lvbjogRFNQLkFULjEu
MC4xLTAwMjAxLUxFTUFOUy0yCisjICtWZXJzaW9uOiBEU1AuQVQuMS4wLjEtMDAyMDQtTEVNQU5T
LTEKKyMgIFJhd0ZpbGU6IHFjb20vcWNzODMwMC9jZHNwci5qc24KKyMgIEZpbGU6IHFjb20vcWNz
ODMwMC9ncGRzcDAubWJuCisjIC1WZXJzaW9uOiBEU1AuQVQuMS4wLjEtMDAyMDEtTEVNQU5TLTIK
KyMgK1ZlcnNpb246IERTUC5BVC4xLjAuMS0wMDIwNC1MRU1BTlMtMQorIyAgUmF3RmlsZTogcWNv
bS9xY3M4MzAwL2dwZHNwci5qc24KKyMgIEZpbGU6IHFjb20vc2E4Nzc1cC9hZHNwLm1ibgorIyAt
VmVyc2lvbjogRFNQLkFULjEuMC4xLTAwMjAxLUxFTUFOUy0yCisjICtWZXJzaW9uOiBEU1AuQVQu
MS4wLjEtMDAyMDQtTEVNQU5TLTEKKyMgIFJhd0ZpbGU6IHFjb20vc2E4Nzc1cC9hZHNwci5qc24K
KyMgIFJhd0ZpbGU6IHFjb20vc2E4Nzc1cC9hZHNwdWEuanNuCisjICBGaWxlOiBxY29tL3NhODc3
NXAvY2RzcDAubWJuCisjIC1WZXJzaW9uOiBEU1AuQVQuMS4wLjEtMDAyMDEtTEVNQU5TLTIKKyMg
K1ZlcnNpb246IERTUC5BVC4xLjAuMS0wMDIwNC1MRU1BTlMtMQorIyAgRmlsZTogcWNvbS9zYTg3
NzVwL2Nkc3AxLm1ibgorIyAtVmVyc2lvbjogRFNQLkFULjEuMC4xLTAwMjAxLUxFTUFOUy0yCisj
ICtWZXJzaW9uOiBEU1AuQVQuMS4wLjEtMDAyMDQtTEVNQU5TLTEKKyMgIFJhd0ZpbGU6IHFjb20v
c2E4Nzc1cC9jZHNwci5qc24KKyMgIFJhd0ZpbGU6IHFjb20vc2E4Nzc1cC9jZHNwMXIuanNuCisj
ICBGaWxlOiBxY29tL3NhODc3NXAvZ3Bkc3AwLm1ibgorIyAtVmVyc2lvbjogRFNQLkFULjEuMC4x
LTAwMjAxLUxFTUFOUy0yCisjICtWZXJzaW9uOiBEU1AuQVQuMS4wLjEtMDAyMDQtTEVNQU5TLTEK
KyMgIEZpbGU6IHFjb20vc2E4Nzc1cC9ncGRzcDEubWJuCisjIC1WZXJzaW9uOiBEU1AuQVQuMS4w
LjEtMDAyMDEtTEVNQU5TLTIKKyMgK1ZlcnNpb246IERTUC5BVC4xLjAuMS0wMDIwNC1MRU1BTlMt
MQorIyAgUmF3RmlsZTogcWNvbS9zYTg3NzVwL2dwZHNwMXIuanNuCisjICBSYXdGaWxlOiBxY29t
L3NhODc3NXAvZ3Bkc3ByLmpzbgorIyAgRmlsZTogcWNvbS9zbTg3NTAvYWRzcC5tYm4KKyMgQEAg
LTY5NTgsNyArNjk4Myw3IEBACisjICBWZXJzaW9uOiBMUEFJQ1AuRlcuMS4yLTAwMTM1LVNISUtS
QV9MUEFJQ1BfUEFDSy0xCisjICBSYXdGaWxlOiBxY29tL3NoaWtyYS9scGFpY3ByLmpzbgorIyAg
RmlsZTogcWNvbS9zaGlrcmEvY3FzL3Fkc3A2c3cubWJuCisjIC1WZXJzaW9uOiBNUFNTLkpPLjQu
MC0wMDE5NC1TSElLUkFfTFdHX1BBQ0stMQorIyArVmVyc2lvbjogTVBTUy5KTy40LjAtMDAxOTQu
Mi1TSElLUkFfTFdHX1BBQ0stMQorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNl
ZSBMSUNFTlNFLnFjb20tMiBhbmQgTk9USUNFLnFjb20gZm9yIGRldGFpbHMKKyMgIAorIyBAQCAt
ODMyMCw2ICs4MzQ1LDcgQEAKKyMgIEZpbGU6IGNpcnJ1cy9jczM1bDU2L0NTMzVMNTZfUmV2My4x
My40LndtZncKKyMgIEZpbGU6IGNpcnJ1cy9jczM1bDU2L0NTMzVMNTZfUmV2NC41LjMud21mdwor
IyAgRmlsZTogY2lycnVzL2NzMzVsNTYvQ1MzNUw1Nl9SZXY0LjUuOS53bWZ3CisjICtGaWxlOiBj
aXJydXMvY3MzNWw1Ni9DUzM1TDU2X1JldjQuNy4wLndtZncKKyMgIEZpbGU6IGNpcnJ1cy9jczM1
bDU2L0NTMzVMNTZfUmV2NC43LjIud21mdworIyAgRmlsZTogY2lycnVzL2NzMzVsNjMvQ1MzNUw2
M19SZXYyLjUuNC53bWZ3CisjICBGaWxlOiBjaXJydXMvY3MzNWw2My9DUzM1TDYzX1JldjIuNS43
LndtZncKKyMgQEAgLTg0OTEsNiArODUxNywxOCBAQAorIyAgTGluazogY2lycnVzL2NzMzVsNTYt
YjItZHNwMS1taXNjLTEwMjgwZGQ2LTAzLndtZncgLT4gY3MzNWw1Ni9DUzM1TDU2X1JldjQuNS45
LndtZncKKyMgIEZpbGU6IGNpcnJ1cy9jczM1bDU2LWIyLWRzcDEtbWlzYy0xMDI4MGRkNi0wMy1h
bXBsLmJpbgorIyAgRmlsZTogY2lycnVzL2NzMzVsNTYtYjItZHNwMS1taXNjLTEwMjgwZGQ2LTAz
LWFtcHIuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlMTMt
c3BraWQwLndtZncgLT4gY3MzNWw2My9DUzM1TDYzX1JldjIuNS43LndtZncKKyMgK0xpbms6IGNp
cnJ1cy9jczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGUxMy1zcGtpZDAtMDAtbDN1MS5iaW4gLT4g
Y3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlMmItc3BraWQwLTAwLWwxdTEuYmluCisjICtMaW5r
OiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlMTMtc3BraWQwLTAwLWwzdTMuYmlu
IC0+IGNzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZTJiLXNwa2lkMC0wMC1sMXUzLmJpbgorIyAr
TGluazogY2lycnVzL2NzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZTEzLXNwa2lkMS53bWZ3IC0+
IGNzMzVsNjMvQ1MzNUw2M19SZXYyLjUuNy53bWZ3CisjICtMaW5rOiBjaXJydXMvY3MzNWw2My1h
MS1kc3AxLW1pc2MtMTAyODBlMTMtc3BraWQxLTAwLWwzdTEuYmluIC0+IGNzMzVsNjMtYTEtZHNw
MS1taXNjLTEwMjgwZTJiLXNwa2lkMS0wMC1sMXUxLmJpbgorIyArTGluazogY2lycnVzL2NzMzVs
NjMtYTEtZHNwMS1taXNjLTEwMjgwZTEzLXNwa2lkMS0wMC1sM3UzLmJpbiAtPiBjczM1bDYzLWEx
LWRzcDEtbWlzYy0xMDI4MGUyYi1zcGtpZDEtMDAtbDF1My5iaW4KKyMgK0xpbms6IGNpcnJ1cy9j
czM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGUxNC1zcGtpZDAud21mdyAtPiBjczM1bDYzL0NTMzVM
NjNfUmV2Mi41Ljcud21mdworIyArTGluazogY2lycnVzL2NzMzVsNjMtYTEtZHNwMS1taXNjLTEw
MjgwZTE0LXNwa2lkMC0wMC1sM3UxLmJpbiAtPiBjczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGUy
Yy1zcGtpZDAtMDAtbDF1MS5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEtbWlz
Yy0xMDI4MGUxNC1zcGtpZDAtMDAtbDN1My5iaW4gLT4gY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAy
ODBlMmMtc3BraWQwLTAwLWwxdTMuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw2My1hMS1kc3Ax
LW1pc2MtMTAyODBlMTQtc3BraWQxLndtZncgLT4gY3MzNWw2My9DUzM1TDYzX1JldjIuNS43Lndt
ZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGUxNC1zcGtpZDEt
MDAtbDN1MS5iaW4gLT4gY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlMmMtc3BraWQxLTAwLWwx
dTEuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlMTQtc3Br
aWQxLTAwLWwzdTMuYmluIC0+IGNzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZTJjLXNwa2lkMS0w
MC1sMXUzLmJpbgorIyAgTGluazogY2lycnVzL2NzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZTFh
LXNwa2lkMC53bWZ3IC0+IGNzMzVsNjMvQ1MzNUw2M19SZXYyLjUuNy53bWZ3CisjICBGaWxlOiBj
aXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlMWEtc3BraWQwLTAyLWwzdTEuYmluCisj
ICBGaWxlOiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlMWEtc3BraWQwLTAyLWwz
dTMuYmluCisjIEBAIC05MDQyLDYgKzkwODAsMjggQEAKKyMgIEZpbGU6IGNpcnJ1cy9jczM1bDU2
LWIwLWRzcDEtbWlzYy0xMDQzMzQ1MS1sMXUxLmJpbgorIyAgRmlsZTogY2lycnVzL2NzMzVsNTYt
YjAtZHNwMS1taXNjLTEwNDMzNDUxLWwxdTIuYmluCisjICBGaWxlOiBjaXJydXMvY3MzNWw1Ni1i
MC1kc3AxLW1pc2MtMTA0MzM0NTEtbDF1My5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDU3LWIy
LWRzcDEtbWlzYy0xNDRkYzFkYy53bWZ3IC0+IGNzMzVsNTYvQ1MzNUw1Nl9SZXY0LjcuMC53bWZ3
CisjICtGaWxlOiBjaXJydXMvY3MzNWw1Ny1iMi1kc3AxLW1pc2MtMTQ0ZGMxZGMtbDF1MC5iaW4K
KyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDU3LWIyLWRzcDEtbWlzYy0xNDRkYzFkYy1sMXUxLmJpbgor
IyArRmlsZTogY2lycnVzL2NzMzVsNTctYjItZHNwMS1taXNjLTE0NGRjMWRjLWwxdTIuYmluCisj
ICtGaWxlOiBjaXJydXMvY3MzNWw1Ny1iMi1kc3AxLW1pc2MtMTQ0ZGMxZGMtbDJ1My5iaW4KKyMg
K0ZpbGU6IGNpcnJ1cy9jczM1bDU3LWIyLWRzcDEtbWlzYy0xNDRkYzFkYy1sMnU0LmJpbgorIyAr
RmlsZTogY2lycnVzL2NzMzVsNTctYjItZHNwMS1taXNjLTE0NGRjMWRjLWwydTUuYmluCisjICtM
aW5rOiBjaXJydXMvY3MzNWw1Ny1iMi1kc3AxLW1pc2MtMTQ0ZGMxZGUud21mdyAtPiBjczM1bDU2
L0NTMzVMNTZfUmV2NC43LjAud21mdworIyArRmlsZTogY2lycnVzL2NzMzVsNTctYjItZHNwMS1t
aXNjLTE0NGRjMWRlLWwxdTAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw1Ny1iMi1kc3AxLW1p
c2MtMTQ0ZGMxZGUtbDF1MS5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDU3LWIyLWRzcDEtbWlz
Yy0xNDRkYzFkZS1sMnUyLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNTctYjItZHNwMS1taXNj
LTE0NGRjMWRlLWwydTMuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw1Ny1iMi1kc3AxLW1pc2Mt
MTQ0ZGM5MTAud21mdyAtPiBjczM1bDU2L0NTMzVMNTZfUmV2NC43LjAud21mdworIyArRmlsZTog
Y2lycnVzL2NzMzVsNTctYjItZHNwMS1taXNjLTE0NGRjOTEwLWwxdTAuYmluCisjICtGaWxlOiBj
aXJydXMvY3MzNWw1Ny1iMi1kc3AxLW1pc2MtMTQ0ZGM5MTAtbDJ1MS5iaW4KKyMgK0xpbms6IGNp
cnJ1cy9jczM1bDU3LWIyLWRzcDEtbWlzYy0xNDRkY2EwYS53bWZ3IC0+IGNzMzVsNTYvQ1MzNUw1
Nl9SZXY0LjcuMC53bWZ3CisjICtMaW5rOiBjaXJydXMvY3MzNWw1Ny1iMi1kc3AxLW1pc2MtMTQ0
ZGNhMGEtbDF1MC5iaW4gLT4gY3MzNWw1Ny1iMi1kc3AxLW1pc2MtMTQ0ZGMxZGMtbDF1MC5iaW4K
KyMgK0xpbms6IGNpcnJ1cy9jczM1bDU3LWIyLWRzcDEtbWlzYy0xNDRkY2EwYS1sMXUxLmJpbiAt
PiBjczM1bDU3LWIyLWRzcDEtbWlzYy0xNDRkYzFkYy1sMXUxLmJpbgorIyArTGluazogY2lycnVz
L2NzMzVsNTctYjItZHNwMS1taXNjLTE0NGRjYTBhLWwxdTIuYmluIC0+IGNzMzVsNTctYjItZHNw
MS1taXNjLTE0NGRjMWRjLWwxdTIuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw1Ny1iMi1kc3Ax
LW1pc2MtMTQ0ZGNhMGEtbDJ1My5iaW4gLT4gY3MzNWw1Ny1iMi1kc3AxLW1pc2MtMTQ0ZGMxZGMt
bDJ1My5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDU3LWIyLWRzcDEtbWlzYy0xNDRkY2EwYS1s
MnU0LmJpbiAtPiBjczM1bDU3LWIyLWRzcDEtbWlzYy0xNDRkYzFkYy1sMnU0LmJpbgorIyArTGlu
azogY2lycnVzL2NzMzVsNTctYjItZHNwMS1taXNjLTE0NGRjYTBhLWwydTUuYmluIC0+IGNzMzVs
NTctYjItZHNwMS1taXNjLTE0NGRjMWRjLWwydTUuYmluCisjICBMaW5rOiBjaXJydXMvY3MzNWw1
Ni1iMC1kc3AxLW1pc2MtMTdhYTIzM2Itc3BraWQwLndtZncgLT4gY3MzNWw1Ni9DUzM1TDU2X1Jl
djMuMTEuMjAud21mdworIyAgRmlsZTogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTE3YWEy
MzNiLXNwa2lkMC1hbXBsLmJpbgorIyAgRmlsZTogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNj
LTE3YWEyMzNiLXNwa2lkMC1hbXByLmJpbgorIyBAQCAtOTI0OCw2ICs5MzA4LDE2IEBACisjICBM
aW5rOiBzZGNhLzFmYS8xMDI4L2RiYS8zLmJpbiAtPiAuLi9kYjMvMy5iaW4KKyMgIExpbms6IHNk
Y2EvMWZhLzEwMjgvZGJhLzQuYmluIC0+IC4uL2RiMy80LmJpbgorIyAgTGluazogc2RjYS8xZmEv
MTAyOC9kYmEvNDI0NTAwMDUuYmluIC0+IC4uL2RiMy80MjQ1MDAwNS5iaW4KKyMgK0xpbms6IHNk
Y2EvMWZhLzEwMjgvZTEzLzEuYmluIC0+IC4uL2RiMy8xLmJpbgorIyArTGluazogc2RjYS8xZmEv
MTAyOC9lMTMvMi5iaW4gLT4gLi4vZGIzLzIuYmluCisjICtMaW5rOiBzZGNhLzFmYS8xMDI4L2Ux
My8zLmJpbiAtPiAuLi9kYjMvMy5iaW4KKyMgK0xpbms6IHNkY2EvMWZhLzEwMjgvZTEzLzQuYmlu
IC0+IC4uL2RiMy80LmJpbgorIyArTGluazogc2RjYS8xZmEvMTAyOC9lMTMvNDI0NTAwMDUuYmlu
IC0+IC4uL2RiMy80MjQ1MDAwNS5iaW4KKyMgK0xpbms6IHNkY2EvMWZhLzEwMjgvZTE0LzEuYmlu
IC0+IC4uL2RiMy8xLmJpbgorIyArTGluazogc2RjYS8xZmEvMTAyOC9lMTQvMi5iaW4gLT4gLi4v
ZGIzLzIuYmluCisjICtMaW5rOiBzZGNhLzFmYS8xMDI4L2UxNC8zLmJpbiAtPiAuLi9kYjMvMy5i
aW4KKyMgK0xpbms6IHNkY2EvMWZhLzEwMjgvZTE0LzQuYmluIC0+IC4uL2RiMy80LmJpbgorIyAr
TGluazogc2RjYS8xZmEvMTAyOC9lMTQvNDI0NTAwMDUuYmluIC0+IC4uL2RiMy80MjQ1MDAwNS5i
aW4KKyMgIEZpbGU6IHNkY2EvMWZhLzEwMjgvZTFhLzEuYmluCisjICBGaWxlOiBzZGNhLzFmYS8x
MDI4L2UxYS8yLmJpbgorIyAgRmlsZTogc2RjYS8xZmEvMTAyOC9lMWEvMy5iaW4KKyMgQEAgLTk1
MDcsNiArOTU3Nyw3IEBACisjICBEcml2ZXI6IHBvd2VydnIgLSBJbWFnaW5hdGlvbiBUZWNobm9s
b2dpZXMgUG93ZXJWUiBncmFwaGljcyBkcml2ZXIKKyMgIAorIyAgRmlsZTogcG93ZXJ2ci9yb2d1
ZV8zMy4xNS4xMS4zX3YxLmZ3CisjICtGaWxlOiBwb3dlcnZyL3JvZ3VlXzM2LjUyLjEwNC4xODJf
djEuZncKKyMgIEZpbGU6IHBvd2VydnIvcm9ndWVfMzYuNTMuMTA0Ljc5Nl92MS5mdworIyAgVmVy
c2lvbjogMS4xLk9TQDY5NzY3MDIKKyMgIAorIyBAQCAtOTUyMyw2ICs5NTk0LDcgQEAKKyMgIExp
bms6IHFjb20vcWNzNjQ5MC9RQ1M2NDkwLVJhZHhhLURyYWdvbi1RNkEtdHBsZy5iaW4gLT4gcmFk
eGEvZHJhZ29uLXE2YS9RQ1M2NDkwLVJhZHhhLURyYWdvbi1RNkEtdHBsZy5iaW4KKyMgIEZpbGU6
IHFjb20vcWNzNjQ5MC9UaHVuZGVyY29tbS9SdWJpa1BpMy9RQ1M2NDkwLVRodW5kZXJjb21tLVJ1
YmlrUGkzLXRwbGcuYmluCisjICBMaW5rOiBxY29tL3FjczY0OTAvUUNTNjQ5MC1UaHVuZGVyY29t
bS1SdWJpa1BpMy10cGxnLmJpbiAtPiBUaHVuZGVyY29tbS9SdWJpa1BpMy9RQ1M2NDkwLVRodW5k
ZXJjb21tLVJ1YmlrUGkzLXRwbGcuYmluCisjICtGaWxlOiBxY29tL3FjczY0OTAvUUNTNjQ5MC1S
QjNHZW4yLUluZHVzdHJpYWwtTWV6ei10cGxnLmJpbgorIyAgRmlsZTogcWNvbS9xY3M2NDkwL1FD
UzY0OTAtUkIzR2VuMi10cGxnLmJpbgorIyAgRmlsZTogcWNvbS9xY3M4MzAwL01PTkFDTy1FVkst
dHBsZy5iaW4KKyMgIEZpbGU6IHFjb20vcWNzODMwMC9hcmR1aW5vLW1vbnphLXRwbGcuYmluCisj
IEBAIC05NTMzLDYgKzk2MDUsOCBAQAorIyAgRmlsZTogcWNvbS9zbTg0NTAvU004NDUwLUhESy10
cGxnLmJpbgorIyAgRmlsZTogcWNvbS9zbTg1NTAvU004NTUwLUhESy10cGxnLmJpbgorIyAgRmls
ZTogcWNvbS9zbTg1NTAvU004NTUwLVFSRC10cGxnLmJpbgorIyArRmlsZTogcWNvbS9zbTg2NTAv
YXlhbmVvL3BzMi9TTTg2NTAtQVBTMi10cGxnLmJpbgorIyArRmlsZTogcWNvbS9zbTg2NTAvU004
NjUwLUhESy10cGxnLmJpbgorIyAgRmlsZTogcWNvbS9zbTg2NTAvU004NjUwLVFSRC10cGxnLmJp
bgorIyAgRmlsZTogcWNvbS9zbTg2NTAvU004NjUwLU1UUC10cGxnLmJpbgorIyAgRmlsZTogcWNv
bS9zbTg3NTAvU004NzUwLU1UUC10cGxnLmJpbgorIyBAQCAtOTU2MCw5ICs5NjM0LDEwIEBACisj
ICBMaW5rOiBxY29tL3gxZTgwMTAwL1gxRTgwMTAwLURlbGwtWFBTLTEzLTkzNDUtdHBsZy5iaW4g
LT4gZGVsbC94cHMxMy05MzQ1L1gxRTgwMTAwLURlbGwtWFBTLTEzLTkzNDUtdHBsZy5iaW4KKyMg
IEZpbGU6IHFjb20veDFlODAxMDAvaHAvb21uaWJvb2steDE0L1gxRTgwMTAwLUhQLU9NTklCT09L
LVgxNC10cGxnLmJpbgorIyAgTGluazogcWNvbS94MWU4MDEwMC9YMUU4MDEwMC1IUC1PTU5JQk9P
Sy1YMTQtdHBsZy5iaW4gLT4gaHAvb21uaWJvb2steDE0L1gxRTgwMTAwLUhQLU9NTklCT09LLVgx
NC10cGxnLmJpbgorIyAtCisjIC1WZXJzaW9uOiB2MS4wLjMKKyMgLUluZm86IERBVEU9MDcuMDQu
MjAyNgorIyArRmlsZTogcWNvbS94MWU4MDEwMC9YMVA0MjEwMC1NaWNyb3NvZnQtU3VyZmFjZS1Q
cm8tMTJpbi10cGxnLmJpbgorIyArCisjICtWZXJzaW9uOiB2MS4wLjQKKyMgK0luZm86IERBVEU9
MDUuMDYuMjAyNgorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNF
LmxpbmFybyBmb3IgZGV0YWlscworIyAgT3JpZ2luYXRlcyBmcm9tIGh0dHBzOi8vZ2l0aHViLmNv
bS9saW51eC1tc20vYXVkaW9yZWFjaC10b3BvbG9neS5naXQKKyMgQEAgLTk2NjAsNiArOTczNSw5
IEBACisjICBGaWxlOiB0aS9hdWRpby90YXMyNzgxL1RBUzJYWFg4RjQxLmJpbgorIyAgRmlsZTog
dGkvYXVkaW8vdGFzMjc4MS9UQVMyWFhYOEY0Mi5iaW4KKyMgIEZpbGU6IHRpL2F1ZGlvL3RhczI3
ODEvVEFTMlhYWDhGNjIuYmluCisjICtGaWxlOiB0aS9hdWRpby90YXMyNzgxL1RBUzJYWFg4RjdF
LmJpbgorIyArRmlsZTogdGkvYXVkaW8vdGFzMjc4MS9UQVMyWFhYOEY5NC5iaW4KKyMgK0ZpbGU6
IHRpL2F1ZGlvL3RhczI3ODEvVEFTMlhYWDhGOTUuYmluCisjICBGaWxlOiB0aS9hdWRpby90YXMy
NzgxL1RYTlcyNzgxUkNBMC5iaW4KKyMgIEZpbGU6IHRpL2F1ZGlvL3RhczI3ODEvVFhOVzI3ODFS
Q0ExLmJpbgorIyAgRmlsZTogdGkvYXVkaW8vdGFzMjc4MS9USUFTMjc4MVJDQTIuYmluCisjIEBA
IC05Nzg0LDYgKzk4NjIsOSBAQAorIyAgTGluazogVEFTMlhYWDhGNDEuYmluIC0+IHRpL2F1ZGlv
L3RhczI3ODEvVEFTMlhYWDhGNDEuYmluCisjICBMaW5rOiBUQVMyWFhYOEY0Mi5iaW4gLT4gdGkv
YXVkaW8vdGFzMjc4MS9UQVMyWFhYOEY0Mi5iaW4KKyMgIExpbms6IFRBUzJYWFg4RjYyLmJpbiAt
PiB0aS9hdWRpby90YXMyNzgxL1RBUzJYWFg4RjYyLmJpbgorIyArTGluazogVEFTMlhYWDhGN0Uu
YmluIC0+IHRpL2F1ZGlvL3RhczI3ODEvVEFTMlhYWDhGN0UuYmluCisjICtMaW5rOiBUQVMyWFhY
OEY5NC5iaW4gLT4gdGkvYXVkaW8vdGFzMjc4MS9UQVMyWFhYOEY5NC5iaW4KKyMgK0xpbms6IFRB
UzJYWFg4Rjk1LmJpbiAtPiB0aS9hdWRpby90YXMyNzgxL1RBUzJYWFg4Rjk1LmJpbgorIyAgTGlu
azogVElBUzI3ODFSQ0EyLmJpbiAtPiB0aS9hdWRpby90YXMyNzgxL1RJQVMyNzgxUkNBMi5iaW4K
KyMgIExpbms6IFRJQVMyNzgxUkNBNC5iaW4gLT4gdGkvYXVkaW8vdGFzMjc4MS9USUFTMjc4MVJD
QTQuYmluCisjICBMaW5rOiBUWE5XMjc4MVJDQTEuYmluIC0+IHRpL2F1ZGlvL3RhczI3ODEvVFhO
VzI3ODFSQ0EwLmJpbgorIyBAQCAtOTgwNiw2ICs5ODg3LDIyIEBACisjICBGaWxlOiB0aS9hdWRp
by90YXMyNzgzLzhFRjYtWC1DLmJpbgorIyAgRmlsZTogdGkvYXVkaW8vdGFzMjc4My8xNTM0LTIt
MHg4LmJpbgorIyAgRmlsZTogdGkvYXVkaW8vdGFzMjc4My8xNTM0LTItMHhCLmJpbgorIyArRmls
ZTogdGkvYXVkaW8vdGFzMjc4My8xNUUyLTAtMHg4LmJpbgorIyArRmlsZTogdGkvYXVkaW8vdGFz
Mjc4My8xNUUyLTAtMHg5LmJpbgorIyArRmlsZTogdGkvYXVkaW8vdGFzMjc4My8xNUUyLTAtMHhB
LmJpbgorIyArRmlsZTogdGkvYXVkaW8vdGFzMjc4My8xNUUyLTAtMHhCLmJpbgorIyArRmlsZTog
dGkvYXVkaW8vdGFzMjc4My8xNUUyLTAtMHhDLmJpbgorIyArRmlsZTogdGkvYXVkaW8vdGFzMjc4
My8xNUUyLTAtMHhELmJpbgorIyArRmlsZTogdGkvYXVkaW8vdGFzMjc4My8xNUUyLTAtMHhFLmJp
bgorIyArRmlsZTogdGkvYXVkaW8vdGFzMjc4My8xNUUyLTAtMHhGLmJpbgorIyArRmlsZTogdGkv
YXVkaW8vdGFzMjc4My8xNUUyLTEtMHg4LmJpbgorIyArRmlsZTogdGkvYXVkaW8vdGFzMjc4My8x
NUUyLTEtMHg5LmJpbgorIyArRmlsZTogdGkvYXVkaW8vdGFzMjc4My8xNUUyLTEtMHhBLmJpbgor
IyArRmlsZTogdGkvYXVkaW8vdGFzMjc4My8xNUUyLTEtMHhCLmJpbgorIyArRmlsZTogdGkvYXVk
aW8vdGFzMjc4My8xNUUyLTEtMHhDLmJpbgorIyArRmlsZTogdGkvYXVkaW8vdGFzMjc4My8xNUUy
LTEtMHhELmJpbgorIyArRmlsZTogdGkvYXVkaW8vdGFzMjc4My8xNUUyLTEtMHhFLmJpbgorIyAr
RmlsZTogdGkvYXVkaW8vdGFzMjc4My8xNUUyLTEtMHhGLmJpbgorIyAgRmlsZTogdGkvYXVkaW8v
dGFzMjc4My8xNkY0LTEtMHg5LmJpbgorIyAgRmlsZTogdGkvYXVkaW8vdGFzMjc4My8xNkY0LTEt
MHhDLmJpbgorIyAgRmlsZTogdGkvYXVkaW8vdGFzMjc4My8xNzE0LTEtMHg4LmJpbgorIyBAQCAt
OTg1NCw2ICs5OTUxLDEwIEBACisjICBGaWxlOiB0aS9hdWRpby90YXMyNzgzLzFCOTQtMi0wLTB4
Qy5iaW4KKyMgIEZpbGU6IHRpL2F1ZGlvL3RhczI3ODMvMUI5NC0zLTAtMHhCLmJpbgorIyAgRmls
ZTogdGkvYXVkaW8vdGFzMjc4My8xQjk0LTMtMC0weEMuYmluCisjICtGaWxlOiB0aS9hdWRpby90
YXMyNzgzLzFDNjQtMC0wLTB4OC5iaW4KKyMgK0ZpbGU6IHRpL2F1ZGlvL3RhczI3ODMvMUM2NC0w
LTAtMHhCLmJpbgorIyArRmlsZTogdGkvYXVkaW8vdGFzMjc4My8xQzY0LTEtMC0weDguYmluCisj
ICtGaWxlOiB0aS9hdWRpby90YXMyNzgzLzFDNjQtMS0wLTB4Qi5iaW4KKyMgIEZpbGU6IHRpL2F1
ZGlvL3RhczI3ODMvMzQzMS0yLTB4OC5iaW4KKyMgIEZpbGU6IHRpL2F1ZGlvL3RhczI3ODMvMzQz
MS0yLTB4Qi5iaW4KKyMgIEZpbGU6IHRpL2F1ZGlvL3RhczI3ODMvMzVDMS0xLTB4OS5iaW4KKyMg
QEAgLTk5NDIsOSArMTAwNDMsNjEgQEAKKyMgIEZpbGU6IHRpL2F1ZGlvL3RhczI3ODMvOEZBNS0w
LTB4QS5iaW4KKyMgIEZpbGU6IHRpL2F1ZGlvL3RhczI3ODMvOEZBNS0wLTB4Qy5iaW4KKyMgIEZp
bGU6IHRpL2F1ZGlvL3RhczI3ODMvOEZBNS0wLTB4RC5iaW4KKyMgK0ZpbGU6IHRpL2F1ZGlvL3Rh
czI3ODMvOEZGNC0xLTB4Qy5iaW4KKyMgK0ZpbGU6IHRpL2F1ZGlvL3RhczI3ODMvOEZGNC0xLTB4
RC5iaW4KKyMgK0ZpbGU6IHRpL2F1ZGlvL3RhczI3ODMvOEZGNC0yLTB4OS5iaW4KKyMgK0ZpbGU6
IHRpL2F1ZGlvL3RhczI3ODMvOEZGNC0yLTB4QS5iaW4KKyMgK0ZpbGU6IHRpL2F1ZGlvL3RhczI3
ODMvOEZGNS0xLTB4Qy5iaW4KKyMgK0ZpbGU6IHRpL2F1ZGlvL3RhczI3ODMvOEZGNS0xLTB4RC5i
aW4KKyMgK0ZpbGU6IHRpL2F1ZGlvL3RhczI3ODMvOEZGNS0yLTB4OS5iaW4KKyMgK0ZpbGU6IHRp
L2F1ZGlvL3RhczI3ODMvOEZGNS0yLTB4QS5iaW4KKyMgK0ZpbGU6IHRpL2F1ZGlvL3RhczI3ODMv
OEZGNy0xLTB4Qy5iaW4KKyMgK0ZpbGU6IHRpL2F1ZGlvL3RhczI3ODMvOEZGNy0yLTB4OS5iaW4K
KyMgK0ZpbGU6IHRpL2F1ZGlvL3RhczI3ODMvOTAwMS0xLTB4QS5iaW4KKyMgK0ZpbGU6IHRpL2F1
ZGlvL3RhczI3ODMvOTAwMS0xLTB4RC5iaW4KKyMgK0ZpbGU6IHRpL2F1ZGlvL3RhczI3ODMvOTAw
MS0yLTB4OS5iaW4KKyMgK0ZpbGU6IHRpL2F1ZGlvL3RhczI3ODMvOTAwMS0yLTB4Qy5iaW4KKyMg
K0ZpbGU6IHRpL2F1ZGlvL3RhczI3ODMvOTAxMy0wLTItMHg5LmJpbgorIyArRmlsZTogdGkvYXVk
aW8vdGFzMjc4My85MDEzLTAtMi0weEMuYmluCisjICtGaWxlOiB0aS9hdWRpby90YXMyNzgzLzkw
MTMtMS0yLTB4OS5iaW4KKyMgK0ZpbGU6IHRpL2F1ZGlvL3RhczI3ODMvOTAxMy0xLTItMHhDLmJp
bgorIyArRmlsZTogdGkvYXVkaW8vdGFzMjc4My85MDE0LTAtMi0weDkuYmluCisjICtGaWxlOiB0
aS9hdWRpby90YXMyNzgzLzkwMTQtMC0yLTB4Qy5iaW4KKyMgK0ZpbGU6IHRpL2F1ZGlvL3RhczI3
ODMvOTAxNC0xLTItMHg5LmJpbgorIyArRmlsZTogdGkvYXVkaW8vdGFzMjc4My85MDE0LTEtMi0w
eEMuYmluCisjICtGaWxlOiB0aS9hdWRpby90YXMyNzgzLzkwMTUtMC0yLTB4OS5iaW4KKyMgK0Zp
bGU6IHRpL2F1ZGlvL3RhczI3ODMvOTAxNS0wLTItMHhDLmJpbgorIyArRmlsZTogdGkvYXVkaW8v
dGFzMjc4My85MDE1LTEtMi0weDkuYmluCisjICtGaWxlOiB0aS9hdWRpby90YXMyNzgzLzkwMTUt
MS0yLTB4Qy5iaW4KKyMgK0ZpbGU6IHRpL2F1ZGlvL3RhczI3ODMvOTAyNi0wLTItMHg5LmJpbgor
IyArRmlsZTogdGkvYXVkaW8vdGFzMjc4My85MDI2LTAtMi0weEMuYmluCisjICtGaWxlOiB0aS9h
dWRpby90YXMyNzgzLzkwMjYtMS0yLTB4OS5iaW4KKyMgK0ZpbGU6IHRpL2F1ZGlvL3RhczI3ODMv
OTAyNi0xLTItMHhDLmJpbgorIyArRmlsZTogdGkvYXVkaW8vdGFzMjc4My85MDI4LTItMHhDLmJp
bgorIyArRmlsZTogdGkvYXVkaW8vdGFzMjc4My85MDI4LTItMHhELmJpbgorIyArRmlsZTogdGkv
YXVkaW8vdGFzMjc4My85MDI4LTMtMHg5LmJpbgorIyArRmlsZTogdGkvYXVkaW8vdGFzMjc4My85
MDI4LTMtMHhBLmJpbgorIyArRmlsZTogdGkvYXVkaW8vdGFzMjc4My85MDI5LTItMHhDLmJpbgor
IyArRmlsZTogdGkvYXVkaW8vdGFzMjc4My85MDI5LTMtMHg5LmJpbgorIyAgCisjICBMaW5rOiAx
NTM0LTItMHg4LmJpbiAtPiB0aS9hdWRpby90YXMyNzgzLzE1MzQtMi0weDguYmluCisjICBMaW5r
OiAxNTM0LTItMHhCLmJpbiAtPiB0aS9hdWRpby90YXMyNzgzLzE1MzQtMi0weEIuYmluCisjICtM
aW5rOiAxNUUyLTAtMHg4LmJpbiAtPiB0aS9hdWRpby90YXMyNzgzLzE1RTItMC0weDguYmluCisj
ICtMaW5rOiAxNUUyLTAtMHg5LmJpbiAtPiB0aS9hdWRpby90YXMyNzgzLzE1RTItMC0weDkuYmlu
CisjICtMaW5rOiAxNUUyLTAtMHhBLmJpbiAtPiB0aS9hdWRpby90YXMyNzgzLzE1RTItMC0weEEu
YmluCisjICtMaW5rOiAxNUUyLTAtMHhCLmJpbiAtPiB0aS9hdWRpby90YXMyNzgzLzE1RTItMC0w
eEIuYmluCisjICtMaW5rOiAxNUUyLTAtMHhDLmJpbiAtPiB0aS9hdWRpby90YXMyNzgzLzE1RTIt
MC0weEMuYmluCisjICtMaW5rOiAxNUUyLTAtMHhELmJpbiAtPiB0aS9hdWRpby90YXMyNzgzLzE1
RTItMC0weEQuYmluCisjICtMaW5rOiAxNUUyLTAtMHhFLmJpbiAtPiB0aS9hdWRpby90YXMyNzgz
LzE1RTItMC0weEUuYmluCisjICtMaW5rOiAxNUUyLTAtMHhGLmJpbiAtPiB0aS9hdWRpby90YXMy
NzgzLzE1RTItMC0weEYuYmluCisjICtMaW5rOiAxNUUyLTEtMHg4LmJpbiAtPiB0aS9hdWRpby90
YXMyNzgzLzE1RTItMS0weDguYmluCisjICtMaW5rOiAxNUUyLTEtMHg5LmJpbiAtPiB0aS9hdWRp
by90YXMyNzgzLzE1RTItMS0weDkuYmluCisjICtMaW5rOiAxNUUyLTEtMHhBLmJpbiAtPiB0aS9h
dWRpby90YXMyNzgzLzE1RTItMS0weEEuYmluCisjICtMaW5rOiAxNUUyLTEtMHhCLmJpbiAtPiB0
aS9hdWRpby90YXMyNzgzLzE1RTItMS0weEIuYmluCisjICtMaW5rOiAxNUUyLTEtMHhDLmJpbiAt
PiB0aS9hdWRpby90YXMyNzgzLzE1RTItMS0weEMuYmluCisjICtMaW5rOiAxNUUyLTEtMHhELmJp
biAtPiB0aS9hdWRpby90YXMyNzgzLzE1RTItMS0weEQuYmluCisjICtMaW5rOiAxNUUyLTEtMHhF
LmJpbiAtPiB0aS9hdWRpby90YXMyNzgzLzE1RTItMS0weEUuYmluCisjICtMaW5rOiAxNUUyLTEt
MHhGLmJpbiAtPiB0aS9hdWRpby90YXMyNzgzLzE1RTItMS0weEYuYmluCisjICBMaW5rOiAxNkY0
LTEtMHg5LmJpbiAtPiB0aS9hdWRpby90YXMyNzgzLzE2RjQtMS0weDkuYmluCisjICBMaW5rOiAx
NkY0LTEtMHhDLmJpbiAtPiB0aS9hdWRpby90YXMyNzgzLzE2RjQtMS0weEMuYmluCisjICBMaW5r
OiAxNzE0LTEtMHg4LmJpbiAtPiB0aS9hdWRpby90YXMyNzgzLzE3MTQtMS0weDguYmluCisjIEBA
IC05OTkzLDYgKzEwMTQ2LDEwIEBACisjICBMaW5rOiAxQjk0LTItMC0weEMuYmluIC0+IHRpL2F1
ZGlvL3RhczI3ODMvMUI5NC0yLTAtMHhDLmJpbgorIyAgTGluazogMUI5NC0zLTAtMHhCLmJpbiAt
PiB0aS9hdWRpby90YXMyNzgzLzFCOTQtMy0wLTB4Qi5iaW4KKyMgIExpbms6IDFCOTQtMy0wLTB4
Qy5iaW4gLT4gdGkvYXVkaW8vdGFzMjc4My8xQjk0LTMtMC0weEMuYmluCisjICtMaW5rOiAxQzY0
LTAtMC0weDguYmluIC0+IHRpL2F1ZGlvL3RhczI3ODMvMUM2NC0wLTAtMHg4LmJpbgorIyArTGlu
azogMUM2NC0wLTAtMHhCLmJpbiAtPiB0aS9hdWRpby90YXMyNzgzLzFDNjQtMC0wLTB4Qi5iaW4K
KyMgK0xpbms6IDFDNjQtMS0wLTB4OC5iaW4gLT4gdGkvYXVkaW8vdGFzMjc4My8xQzY0LTEtMC0w
eDguYmluCisjICtMaW5rOiAxQzY0LTEtMC0weEIuYmluIC0+IHRpL2F1ZGlvL3RhczI3ODMvMUM2
NC0xLTAtMHhCLmJpbgorIyAgTGluazogMzQzMS0yLTB4OC5iaW4gLT4gdGkvYXVkaW8vdGFzMjc4
My8zNDMxLTItMHg4LmJpbgorIyAgTGluazogMzQzMS0yLTB4Qi5iaW4gLT4gdGkvYXVkaW8vdGFz
Mjc4My8zNDMxLTItMHhCLmJpbgorIyAgTGluazogMzVDMS0xLTB4OS5iaW4gLT4gdGkvYXVkaW8v
dGFzMjc4My8zNUMxLTEtMHg5LmJpbgorIyBAQCAtMTAwODEsNiArMTAyMzgsNDIgQEAKKyMgIExp
bms6IDhGQTUtMC0weEEuYmluIC0+IHRpL2F1ZGlvL3RhczI3ODMvOEZBNS0wLTB4QS5iaW4KKyMg
IExpbms6IDhGQTUtMC0weEMuYmluIC0+IHRpL2F1ZGlvL3RhczI3ODMvOEZBNS0wLTB4Qy5iaW4K
KyMgIExpbms6IDhGQTUtMC0weEQuYmluIC0+IHRpL2F1ZGlvL3RhczI3ODMvOEZBNS0wLTB4RC5i
aW4KKyMgK0xpbms6IDhGRjQtMS0weEMuYmluIC0+IHRpL2F1ZGlvL3RhczI3ODMvOEZGNC0xLTB4
Qy5iaW4KKyMgK0xpbms6IDhGRjQtMS0weEQuYmluIC0+IHRpL2F1ZGlvL3RhczI3ODMvOEZGNC0x
LTB4RC5iaW4KKyMgK0xpbms6IDhGRjQtMi0weDkuYmluIC0+IHRpL2F1ZGlvL3RhczI3ODMvOEZG
NC0yLTB4OS5iaW4KKyMgK0xpbms6IDhGRjQtMi0weEEuYmluIC0+IHRpL2F1ZGlvL3RhczI3ODMv
OEZGNC0yLTB4QS5iaW4KKyMgK0xpbms6IDhGRjUtMS0weEMuYmluIC0+IHRpL2F1ZGlvL3RhczI3
ODMvOEZGNS0xLTB4Qy5iaW4KKyMgK0xpbms6IDhGRjUtMS0weEQuYmluIC0+IHRpL2F1ZGlvL3Rh
czI3ODMvOEZGNS0xLTB4RC5iaW4KKyMgK0xpbms6IDhGRjUtMi0weDkuYmluIC0+IHRpL2F1ZGlv
L3RhczI3ODMvOEZGNS0yLTB4OS5iaW4KKyMgK0xpbms6IDhGRjUtMi0weEEuYmluIC0+IHRpL2F1
ZGlvL3RhczI3ODMvOEZGNS0yLTB4QS5iaW4KKyMgK0xpbms6IDhGRjctMS0weEMuYmluIC0+IHRp
L2F1ZGlvL3RhczI3ODMvOEZGNy0xLTB4Qy5iaW4KKyMgK0xpbms6IDhGRjctMi0weDkuYmluIC0+
IHRpL2F1ZGlvL3RhczI3ODMvOEZGNy0yLTB4OS5iaW4KKyMgK0xpbms6IDkwMDEtMS0weEEuYmlu
IC0+IHRpL2F1ZGlvL3RhczI3ODMvOTAwMS0xLTB4QS5iaW4KKyMgK0xpbms6IDkwMDEtMS0weEQu
YmluIC0+IHRpL2F1ZGlvL3RhczI3ODMvOTAwMS0xLTB4RC5iaW4KKyMgK0xpbms6IDkwMDEtMi0w
eDkuYmluIC0+IHRpL2F1ZGlvL3RhczI3ODMvOTAwMS0yLTB4OS5iaW4KKyMgK0xpbms6IDkwMDEt
Mi0weEMuYmluIC0+IHRpL2F1ZGlvL3RhczI3ODMvOTAwMS0yLTB4Qy5iaW4KKyMgK0xpbms6IDkw
MTMtMC0yLTB4OS5iaW4gLT4gdGkvYXVkaW8vdGFzMjc4My85MDEzLTAtMi0weDkuYmluCisjICtM
aW5rOiA5MDEzLTAtMi0weEMuYmluIC0+IHRpL2F1ZGlvL3RhczI3ODMvOTAxMy0wLTItMHhDLmJp
bgorIyArTGluazogOTAxMy0xLTItMHg5LmJpbiAtPiB0aS9hdWRpby90YXMyNzgzLzkwMTMtMS0y
LTB4OS5iaW4KKyMgK0xpbms6IDkwMTMtMS0yLTB4Qy5iaW4gLT4gdGkvYXVkaW8vdGFzMjc4My85
MDEzLTEtMi0weEMuYmluCisjICtMaW5rOiA5MDE0LTAtMi0weDkuYmluIC0+IHRpL2F1ZGlvL3Rh
czI3ODMvOTAxNC0wLTItMHg5LmJpbgorIyArTGluazogOTAxNC0wLTItMHhDLmJpbiAtPiB0aS9h
dWRpby90YXMyNzgzLzkwMTQtMC0yLTB4Qy5iaW4KKyMgK0xpbms6IDkwMTQtMS0yLTB4OS5iaW4g
LT4gdGkvYXVkaW8vdGFzMjc4My85MDE0LTEtMi0weDkuYmluCisjICtMaW5rOiA5MDE0LTEtMi0w
eEMuYmluIC0+IHRpL2F1ZGlvL3RhczI3ODMvOTAxNC0xLTItMHhDLmJpbgorIyArTGluazogOTAx
NS0wLTItMHg5LmJpbiAtPiB0aS9hdWRpby90YXMyNzgzLzkwMTUtMC0yLTB4OS5iaW4KKyMgK0xp
bms6IDkwMTUtMC0yLTB4Qy5iaW4gLT4gdGkvYXVkaW8vdGFzMjc4My85MDE1LTAtMi0weEMuYmlu
CisjICtMaW5rOiA5MDE1LTEtMi0weDkuYmluIC0+IHRpL2F1ZGlvL3RhczI3ODMvOTAxNS0xLTIt
MHg5LmJpbgorIyArTGluazogOTAxNS0xLTItMHhDLmJpbiAtPiB0aS9hdWRpby90YXMyNzgzLzkw
MTUtMS0yLTB4Qy5iaW4KKyMgK0xpbms6IDkwMjYtMC0yLTB4OS5iaW4gLT4gdGkvYXVkaW8vdGFz
Mjc4My85MDI2LTAtMi0weDkuYmluCisjICtMaW5rOiA5MDI2LTAtMi0weEMuYmluIC0+IHRpL2F1
ZGlvL3RhczI3ODMvOTAyNi0wLTItMHhDLmJpbgorIyArTGluazogOTAyNi0xLTItMHg5LmJpbiAt
PiB0aS9hdWRpby90YXMyNzgzLzkwMjYtMS0yLTB4OS5iaW4KKyMgK0xpbms6IDkwMjYtMS0yLTB4
Qy5iaW4gLT4gdGkvYXVkaW8vdGFzMjc4My85MDI2LTEtMi0weEMuYmluCisjICtMaW5rOiA5MDI4
LTItMHhDLmJpbiAtPiB0aS9hdWRpby90YXMyNzgzLzkwMjgtMi0weEMuYmluCisjICtMaW5rOiA5
MDI4LTItMHhELmJpbiAtPiB0aS9hdWRpby90YXMyNzgzLzkwMjgtMi0weEQuYmluCisjICtMaW5r
OiA5MDI4LTMtMHg5LmJpbiAtPiB0aS9hdWRpby90YXMyNzgzLzkwMjgtMy0weDkuYmluCisjICtM
aW5rOiA5MDI4LTMtMHhBLmJpbiAtPiB0aS9hdWRpby90YXMyNzgzLzkwMjgtMy0weEEuYmluCisj
ICtMaW5rOiA5MDI5LTItMHhDLmJpbiAtPiB0aS9hdWRpby90YXMyNzgzLzkwMjktMi0weEMuYmlu
CisjICtMaW5rOiA5MDI5LTMtMHg5LmJpbiAtPiB0aS9hdWRpby90YXMyNzgzLzkwMjktMy0weDku
YmluCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIExJQ0VOQ0UudGktdHNwYSBmb3IgZGV0
YWlscy4gTWFya2VkOgorIyAgCSBDb3B5cmlnaHQgKEMpIDIwMjYgVGV4YXMgSW5zdHJ1bWVudHMK
KyMgIAorIyBAQCAtMTAyMjgsMTUgKzEwNDIxLDE1IEBACisjICBEcml2ZXI6IGludGVsX3ZwdSAt
IEludGVsIE5QVSBkcml2ZXIKKyMgIAorIyAgRmlsZTogaW50ZWwvdnB1L3ZwdV8zN3h4X3YxLmJp
bgorIyAtVmVyc2lvbjogMjAyNjA1MDUqTVRMX0NMSUVOVF9TSUxJQ09OLU5WUitOTi1kZXBsb3lt
ZW50KjNiMWUxZTgyNmQzNGIwYWVlYTVjYzZkNzViMDE3ZWI0Y2JmNWI3MzUqM2IxZTFlODI2ZDM0
YjBhZWVhNWNjNmQ3NWIwMTdlYjRjYmY1YjczNSozYjFlMWU4MjZkMworIyArVmVyc2lvbjogMjAy
NjA2MzAqTVRMX0NMSUVOVF9TSUxJQ09OLU5WUitOTi1kZXBsb3ltZW50KjNiNDMxZDk2MjExZWI2
MThlZGYxZjdjNDQ0ZGFhODE4NWYxZTY4NmMqM2I0MzFkOTYyMTFlYjYxOGVkZjFmN2M0NDRkYWE4
MTg1ZjFlNjg2YyozYjQzMWQ5NjIxMQorIyAgTGluazogaW50ZWwvdnB1L3ZwdV8zN3h4X3YwLjAu
YmluIC0+IHZwdV8zN3h4X3YxLmJpbgorIyAgCisjICBGaWxlOiBpbnRlbC92cHUvdnB1XzQweHhf
djEuYmluCisjIC1WZXJzaW9uOiBNYXkgIDUgMjAyNipOUFU0MHh4KmJ1aWxkL2NpL25wdS1mdy1j
aS1jaV9icmFuY2hfVUQyMDI2MjBfbnB1X3JlbGVhc2VfMjZ3dzE3LTIwMjYwNDIyXzA5NDEyNy1m
YzI4NWMyM2UxYmY1OTVkNjQzMDY2MDUwM2U4NjE2NTQ5YzAxYTM0LTgtZzNiMWUxZTgyNmQzKjNi
MWUxZTgyNmQzNGIwYWVlYTVjYzZkNzViMDE3ZWI0Y2JmNWI3MzUKKyMgK1ZlcnNpb246IEp1biAz
MCAyMDI2Kk5QVTQweHgqYnVpbGQvY2kvbnB1LWZ3LWNpLWNpX2JyYW5jaF9VRDIwMjYyOF9ucHVf
cmVsZWFzZV8yNnd3MjUtMjAyNjA2MjZfMDg1MDUyLWY5YTYxMTg2NWRiZjNlNmIzN2ExN2EwYjAx
YTdlODFlN2ZjODEyZTctMS1nM2I0MzFkOTYyMTEqM2I0MzFkOTYyMTFlYjYxOGVkZjFmN2M0NDRk
YWE4MTg1ZjFlNjg2YworIyAgTGluazogaW50ZWwvdnB1L3ZwdV80MHh4X3YwLjAuYmluIC0+IHZw
dV80MHh4X3YxLmJpbgorIyAgCisjICBGaWxlOiBpbnRlbC92cHUvdnB1XzUweHhfdjEuYmluCisj
IC1WZXJzaW9uOiBNYXkgIDUgMjAyNipOUFU1MHh4KmJ1aWxkL2NpL25wdS1mdy1jaS1jaV9icmFu
Y2hfVUQyMDI2MjBfbnB1X3JlbGVhc2VfMjZ3dzE3LTIwMjYwNDIyXzA5NDEyNy1mYzI4NWMyM2Ux
YmY1OTVkNjQzMDY2MDUwM2U4NjE2NTQ5YzAxYTM0LTgtZzNiMWUxZTgyNmQzKjNiMWUxZTgyNmQz
NGIwYWVlYTVjYzZkNzViMDE3ZWI0Y2JmNWI3MzUKKyMgK1ZlcnNpb246IEp1biAzMCAyMDI2Kk5Q
VTUweHgqYnVpbGQvY2kvbnB1LWZ3LWNpLWNpX2JyYW5jaF9VRDIwMjYyOF9ucHVfcmVsZWFzZV8y
Nnd3MjUtMjAyNjA2MjZfMDg1MDUyLWY5YTYxMTg2NWRiZjNlNmIzN2ExN2EwYjAxYTdlODFlN2Zj
ODEyZTctMS1nM2I0MzFkOTYyMTEqM2I0MzFkOTYyMTFlYjYxOGVkZjFmN2M0NDRkYWE4MTg1ZjFl
Njg2YworIyAgTGluazogaW50ZWwvdnB1L3ZwdV81MHh4X3YwLjAuYmluIC0+IHZwdV81MHh4X3Yx
LmJpbgorIyAgCisjICBMaWNlbnNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLmludGVs
X3ZwdSBmb3IgZGV0YWlscworIyBAQCAtMTAyOTMsMyArMTA0ODYsMTcgQEAKKyMgIAorIyAgSW5m
bzoKKyMgIEZpcm13YXJlIGZpbGUgZ2VuZXJhdGVkIHZpYSBodHRwczovL2dpdC50aS5jb20vY2dp
dC9scGFhLWFuZHJvaWQtZHJpdmVycy90YXNkZXZpY2UtbGludXgtZHJpdmVyL3RyZWUvanNvbi90
b29sL05vbl9JbnRlZ3JhdGVkX0Jpbl9Ub29sX3YxLjQuMSBhbmQgYnJhbmNoLW1hc3Rlci4KKyMg
Ky0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQorIyArCisjICtEcml2ZXI6IG1tODF4IC0gTW9yc2UgTWljcm8g
bW04MXggV2ktRmkgSGFMb3cgZHJpdmVyLgorIyArCisjICtGaWxlOiBtb3JzZW1pY3JvL21tODF4
L3Y1Ni9tbTgxMDguYmluCisjICtGaWxlOiBtb3JzZW1pY3JvL21tODF4L3Y1Ni9iY2ZfbW04MTA4
X21mMTU0NTcuYmluCisjICtGaWxlOiBtb3JzZW1pY3JvL21tODF4L3Y1Ni9iY2ZfYXdfaG02Nzcu
YmluCisjICtMaW5rOiBtb3JzZW1pY3JvL21tODF4L3Y1Ni9iY2ZfYm9hcmR0eXBlXzA4MDQuYmlu
IC0+IGJjZl9tbTgxMDhfbWYxNTQ1Ny5iaW4KKyMgK0xpbms6IG1vcnNlbWljcm8vbW04MXgvdjU2
L2JjZl9ib2FyZHR5cGVfMDgwNy5iaW4gLT4gYmNmX21tODEwOF9tZjE1NDU3LmJpbgorIyArTGlu
azogbW9yc2VtaWNyby9tbTgxeC92NTYvYmNmX2JvYXJkdHlwZV8wYTAyLmJpbiAtPiBiY2ZfYXdf
aG02NzcuYmluCisjICsKKyMgK1ZlcnNpb246IDU2CisjICsKKyMgK0xpY2Vuc2U6IFJlZGlzdHJp
YnV0YWJsZS4gU2VlIExJQ0VOQ0UubW9yc2VtaWNybyBmb3IgZGV0YWlscy4KKyMgCisjCisKIFNV
TU1BUlkgPSAiRmlybXdhcmUgZmlsZXMgZm9yIHVzZSB3aXRoIExpbnV4IGtlcm5lbCIKIEhPTUVQ
QUdFID0gImh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvIgogREVTQ1JJUFRJT04gPSAiTGludXggZmly
bXdhcmUgaXMgYSBwYWNrYWdlIGRpc3RyaWJ1dGVkIGFsb25nc2lkZSB0aGUgTGludXgga2VybmVs
IFwKQEAgLTI3NCw3ICsxMTAxLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5T
RVMvTElDRU5DRS5BYmlsaXM7bWQ1PWI1ZWUzZjQxMDc4MGU1NjcxMWFkNDhlYWQKICAgICAgICAg
ICAgICAgICAgICAgZmlsZTovL0xJQ0VOU0VTL0xJQ0VOQ0UueGM1MDAwYzttZDU9MTJiMDJlZmEz
MDQ5ZGI2NWQ1MjRhZWI0MThkZDg3Y2EgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElD
RU5TRVMvTElDRU5TRS54ZTttZDU9YzY3NGQzODc3NDI0MmJjMGM1MjgyMTQ3MjE0ODgxMTggXAog
ICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5TRVMvTElDRU5DRS53ZjIwMDttZDU9NGQx
YmVmZjAwZDkwMmMwNWM5YzdlOTVhNWQ4ZWI1MmQgXAotICAgICAgICAgICAgICAgICAgICBmaWxl
Oi8vV0hFTkNFO21kNT0ke1dIRU5DRV9DSEtTVU19IFwKKyAgICAgICAgICAgICAgICAgICAgZmls
ZTovL1dIRU5DRTttZDU9ZGU0N2Q1OGUxMDc5N2VhZTJjY2M3NTNhYjhkNjliZDcgXAogICAgICAg
ICAgICAgICAgICAgICAiCiAjIFdIRU5DRSBjaGVja3N1bSBpcyBkZWZpbmVkIHNlcGFyYXRlbHkg
dG8gZWFzZSBvdmVycmlkaW5nIGl0IGlmCiAjIGNsYXNzLWRldnVwc3RyZWFtIGlzIHNlbGVjdGVk
LgpAQCAtNDE2LDcgKzEyNDMsNyBAQCBTUkNfVVJJOmNsYXNzLWRldnVwc3RyZWFtID0gImdpdDov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9maXJtdwogIyBQaW4gdGhp
cyB0byB0aGUgMjAyMjA1MDkgcmVsZWFzZSwgb3ZlcnJpZGUgdGhpcyBpbiBsb2NhbC5jb25mCiBT
UkNSRVY6Y2xhc3MtZGV2dXBzdHJlYW0gPz0gImIxOWNiZGNhNzhhYjJhZGZkMjEwYzkxYmUxNWEy
MjU2OGU4YjhjYWUiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyYjlkOGEzNThlNzZlYjc2NjU4
ODYwOTEzNWU1M2ZhNTQ4YjkwMmM1NTFkYWFlMzNlZTMyZjI2ZjI1ZTYwZGJiIgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gImFjMTdjMzRmZTczNzU2OTI2YTk2MWZiYWZhZGY4ZDhmMDdhM2JkMmRkMmY0
ZWEzMWEwZmI1ZDUwYzcxNGE0OWEiCiAKIGluaGVyaXQgYWxsYXJjaAogCi0tIAoyLjQ3LjEKCg==

--===============0658433556886074701==--

