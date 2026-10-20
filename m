Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1928.1792480407592777977
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 00:13:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DT08oe39;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=nGOTly2e;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a158286bc4-e88a59b9-5a67-4723-82a3-ee16a6f4a621-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792480406;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WJH/KhbSuVuUZN3U8RkAdw5r3/GDxwXJe/MHz1dYkgs=;
	b=DT08oe39KnnASZGkpTYTQMDFO+QZTgZperJB0XjCaJ0KETtQ9g+lIhEMMKmxKMx1
	kvEIbWlUTXXtQiaGXyEfOQexSerkKi3XH1l64GjCE+e8y62/WdMz9cMJzM+/QM2h+YL
	gBWhnthdUFpYvU0fCKCPgQ2/LWbzPiu4CtJ1nzmg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792480406;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WJH/KhbSuVuUZN3U8RkAdw5r3/GDxwXJe/MHz1dYkgs=;
	b=nGOTly2evZ6x1K3AJouyWUAbKMFF+fncTYfzZlYw+jz7Nixg5q4fT5v5MQ/0QZaS
	+NnKg0ZEooWdBeb/MDNUJVIAgD2WmcjNZRsCXtT2Pu7UeEZTA1dCoglwMldss/06n0x
	wd/dJ7y7ia3FVhzlu0PHYAFutO/ljYc0AkoEPt9g=
Content-Type: multipart/mixed; boundary="===============1555530698266862855=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Vivek Puar <vpuar@qti.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] linux-firmware: upgrading to 20261019 FAILED
Message-ID: <010101a158286bc4-e88a59b9-5a67-4723-82a3-ee16a6f4a621-000000@us-west-2.amazonses.com>
Date: Tue, 20 Oct 2026 07:13:26 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.20-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 07:13:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248237

--===============1555530698266862855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *linux-firmware* to *20261019* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-linux-firmware-upgrade-20260916-20261019.patch
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
From dd293805d7e17f87efca1df64b4c9367656360ec Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 20 Oct 2026 07:13:15 +0000
Subject: [PATCH] linux-firmware: upgrade 20260916 -> 20261019

---
 ...-WiFi-firmware-from-the-ath10k-subdi.patch |   28 -
 ...20260916.bb => linux-firmware_20261019.bb} | 3233 ++++++++++++++++-
 2 files changed, 3227 insertions(+), 34 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux-firmware/linux-firmware/0001-qcom-shikra-link-WiFi-firmware-from-the-ath10k-subdi.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20260916.bb => linux-firmware_20261019.bb} (59%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware/0001-qcom-shikra-link-WiFi-firmware-from-the-ath10k-subdi.patch b/meta/recipes-kernel/linux-firmware/linux-firmware/0001-qcom-shikra-link-WiFi-firmware-from-the-ath10k-subdi.patch
deleted file mode 100644
index 010121da6b..0000000000
--- a/meta/recipes-kernel/linux-firmware/linux-firmware/0001-qcom-shikra-link-WiFi-firmware-from-the-ath10k-subdi.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 837ae0e5beccc2f1e974afba56c22c3cf981fc4e Mon Sep 17 00:00:00 2001
-From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-Date: Fri, 18 Sep 2026 17:52:15 +0300
-Subject: [PATCH] qcom/shikra: link WiFi firmware from the ath10k subdir
-
-On Qualcomm Shikra platform the WiFi firmware is loaded by the tqftpserv
-from the same location as the rest of the DSP firmware. Add symlink,
-pointing from the expected location to the actual WiFi firmware file.
-
-Fixes: f64d7db7d264 ("ath10k: WCN3990: hw1.0: add shikra firmware files")
-Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-Upstream-Status: Backport [https://gitlab.com/kernel-firmware/linux-firmware/-/commit/837ae0e5beccc2f1e974afba56c22c3cf981fc4e]
----
- WHENCE | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/WHENCE b/WHENCE
-index a712978b..053640a0 100644
---- a/WHENCE
-+++ b/WHENCE
-@@ -3825,6 +3825,7 @@ Version: WLAN.HL.2.0-01387-QCAHLSWMTPLZ-1
- File: ath10k/WCN3990/hw1.0/notice.txt_wlanmdsp
- File: ath10k/WCN3990/hw1.0/shikra/firmware-5.bin
- File: ath10k/WCN3990/hw1.0/shikra/wlanmdsp.mbn
-+Link: qcom/shikra/wlanmdsp.mbn -> ../../ath10k/WCN3990/hw1.0/shikra/wlanmdsp.mbn
- Version: WLAN.HL.3.3.7.c5-00093.2-QCAHLSWMTPL-1
- File: ath10k/WCN3990/hw1.0/shikra/notice.txt_wlanmdsp
- 
diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20260916.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20261019.bb
similarity index 59%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20260916.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20261019.bb
index d549c3d2d5..211687396c 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20260916.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20261019.bb
@@ -1,3 +1,3227 @@
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
+# @@ -14,6 +14,7 @@
+#  Link: brcm/BCM-0a5c-6410.hcd -> BCM-0bb4-0306.hcd
+#  
+#  Licence: Redistributable. See LICENCE.cypress for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.cypress
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -25,6 +26,7 @@
+#  File: advansys/38C1600.bin
+#  
+#  Licence: Redistributable. See LICENCE.advansys for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.advansys
+#  
+#  Found in hex form in kernel source.
+#  
+# @@ -37,6 +39,7 @@
+#  File: qlogic/12160.bin
+#  
+#  Licence: Redistributable. See LICENCE.qla1280 for details
+# +SPDX-License-Identifier: BSD-3-Clause
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -48,6 +51,7 @@
+#  File: kaweth/trigger_code_fix.bin
+#  
+#  Licence: Redistributable. See LICENCE.kaweth for details
+# +SPDX-License-Identifier: BSD-4-Clause
+#  
+#  Found in hex form in the kernel source.
+#  
+# @@ -71,6 +75,7 @@
+#  Converted from Intel HEX files, used in our binary representation of ihex.
+#  
+#  Licence: Redistributable. See LICENCE.keyspan for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.keyspan
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -85,6 +90,7 @@
+#  Source: keyspan_pda/Makefile
+#  
+#  Licence: GPLv2 or later. See GPL-2.0 for details.
+# +SPDX-License-Identifier: GPL-2.0-or-later
+#  
+#  Compiled from original 8051 source into Intel HEX, used in our binary ihex form.
+#  
+# @@ -105,6 +111,7 @@
+#  Converted from Intel HEX files, used in our binary representation of ihex.
+#  
+#  Licence: Redistributable. See LICENCE.emi26 for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.emi26
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -118,6 +125,7 @@
+#  
+#  Licence: Allegedly GPLv2+, but no source visible. Marked:
+#  	 Copyright (C) 2004 Texas Instruments
+# +SPDX-License-Identifier: GPL-2.0-or-later
+#  
+#  Found in hex form in kernel source.
+#  
+# @@ -130,6 +138,7 @@
+#  File: mts_edge.fw
+#  
+#  Licence: Redistributable. See LICENCE.multitech for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.multitech
+#  
+#  Copyright (C) 2005 Multi-Tech Systems, Inc.
+#  
+# @@ -146,6 +155,7 @@
+#  
+#  Licence: Allegedly GPLv2, but no source visible. Marked:
+#  	 Copyright (C) 2000-2002  ConnectTech Inc
+# +SPDX-License-Identifier: GPL-2.0-only
+#  
+#  Debug loader claims the following behaviour:
+#  	Port 1 LED flashes when the vend_ax program is running
+# @@ -165,6 +175,7 @@
+#  	Copyright (C) 2001 STMicroelectronics, Inc.
+#  	Contact:  steve.miller@st.com
+#  	Description: This file contains patch data for the CPiA2 (stv0672) VP4.
+# +SPDX-License-Identifier: GPL-2.0-or-later
+#  
+#  Found in hex form in kernel source.
+#  
+# @@ -176,6 +187,7 @@
+#  File: dabusb/bitstream.bin
+#  
+#  Licence: Redistributable. See LICENCE.dabusb for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.dabusb
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -192,6 +204,7 @@
+#  //* Generated by HEX2C v1.06
+#  //* Copyright (C) 1998 Inside Out Networks, All rights reserved.
+#  //**************************************************************
+# +SPDX-License-Identifier: GPL-2.0-or-later
+#  
+#  Found in hex form in kernel source.
+#  
+# @@ -208,6 +221,7 @@
+#  //* Generated by TIBin2C v2.00 (watchport)
+#  //* Copyright (C) 2001 Inside Out Networks, All rights reserved.
+#  //**************************************************************
+# +SPDX-License-Identifier: GPL-2.0-or-later
+#  
+#  Found in hex form in kernel source.
+#  
+# @@ -221,6 +235,7 @@
+#  Source: dsp56k/concat-bootstrap.pl
+#  
+#  Licence: GPLv2 or later. See GPL-2.0 for details.
+# +SPDX-License-Identifier: GPL-2.0-or-later
+#  
+#  DSP56001 assembler, buildable with a56 from
+#  http://www.zdomain.com/a56.html
+# @@ -242,6 +257,7 @@
+#   */
+#  
+#  Found in hex form in kernel source.
+# +SPDX-License-Identifier: GPL-2.0-or-later
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -263,6 +279,7 @@
+#  Version: 10.34.03
+#  
+#  Licence: Redistributable. See LICENCE.qla2xxx for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.qla2xxx
+#  
+#  Available from http://ldriver.qlogic.com/firmware/
+#  
+# @@ -276,6 +293,7 @@
+#  Version: 9.48 Hermes I
+#  
+#  Licence: Redistributable. See LICENCE.agere for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.agere
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -285,6 +303,7 @@
+#  File: ar9170-2.fw
+#  
+#  Licence: Redistributable. See LICENCE.atheros_firmware for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.atheros_firmware
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -299,6 +318,7 @@
+#  Version: 1.3.1
+#  
+#  Licence: Redistributable. See LICENCE.atheros_firmware for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.atheros_firmware
+#  
+#  File: ath9k_htc/htc_7010-1.4.0.fw
+#  Version: 1.4.0
+# @@ -306,6 +326,7 @@
+#  Version: 1.4.0
+#  
+#  Licence: Free software. See LICENCE.open-ath9k-htc-firmware for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.open-ath9k-htc-firmware
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -318,6 +339,7 @@
+#  File: slicoss/oasisrcvucode.sys
+#  
+#  Licence: Redistributable. See LICENCE.alacritech for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.alacritech
+#  
+#  Found in hex form in kernel source.
+#  
+# @@ -329,6 +351,7 @@
+#  File: sxg/saharadbgdownloadB.sys
+#  
+#  Licence: Redistributable. See LICENCE.alacritech for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.alacritech
+#  
+#  Found in hex form in kernel source.
+#  
+# @@ -345,6 +368,7 @@
+#  File: cxgb3/t3fw-7.12.0.bin
+#  
+#  Licence: GPLv2 or OpenIB.org BSD license, no source visible
+# +SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -355,6 +379,7 @@
+#  File: cxgb3/ael2020_twx_edc.bin
+#  
+#  Licence: Redistributable. See LICENCE.cxgb3 for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.cxgb3
+#  
+#  Found in hex form in kernel source.
+#  
+# @@ -384,6 +409,7 @@
+#  Link: cxgb4/t6-config.txt -> configs/t6-config-default.txt
+#  
+#  Licence: Redistributable. See LICENCE.chelsio_firmware for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.chelsio_firmware
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -394,6 +420,7 @@
+#  File: e100/d102e_ucode.bin
+#  
+#  Licence: Redistributable. See LICENCE.e100 for details
+# +SPDX-License-Identifier: BSD-3-Clause
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -405,6 +432,7 @@
+#  File: tigon/tg357766.bin
+#  
+#  Licence: Redistributable. See LICENCE.tigon for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.tigon
+#  
+#  Found in hex form in kernel source.
+#  
+# @@ -416,6 +444,7 @@
+#  File: adaptec/starfire_tx.bin
+#  
+#  Licence: Allegedly GPLv2, but no source visible.
+# +SPDX-License-Identifier: GPL-2.0-only
+#  
+#  Found in hex form in kernel source, with the following notice:
+#  
+# @@ -458,6 +487,7 @@
+#  Link: libertas/sd8688_helper.bin -> ../mrvl/sd8688_helper.bin
+#  
+#  Licence: Redistributable. See LICENCE.Marvell for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.Marvell
+#  
+#  Info:
+#  Extracted from Linux driver tarballs downloaded from Marvell's
+# @@ -477,6 +507,7 @@
+#  Version: 5.110.22.p23
+#  
+#  Licence: Redistributable. See LICENCE.OLPC for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.OLPC
+#  
+#  Available from http://dev.laptop.org/pub/firmware/libertas/
+#  
+# @@ -497,6 +528,7 @@
+#  Version: 7.4.0.9
+#  
+#  Licence: Redistributable. See LICENCE.Marvell for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.Marvell
+#  
+#  Info:
+#  8687 images downloaded from Marvell's "Extranet" with permission.
+# @@ -554,7 +586,12 @@
+#  File: mrvl/sdsd8977_combo_v2.bin
+#  Version: W16.68.1.p195
+#  
+# +File: mrvl/sdiouartiw416_combo_v0.bin
+# +Version: W16.92.21.p151.4
+# +
+#  Licence: Redistributable. See LICENCE.NXP for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.NXP
+# +
+#  Originates from https://github.com/NXP/mwifiex-firmware.git
+#  
+#  --------------------------------------------------------------------------
+# @@ -922,31 +959,31 @@
+#  
+#  File: intel/iwlwifi/iwlwifi-cc-a0-77.ucode
+#  Link: iwlwifi-cc-a0-77.ucode -> intel/iwlwifi/iwlwifi-cc-a0-77.ucode
+# -Version: 74.8dbafb52.0
+# +Version: 74.563a6e92.0
+#  
+#  File: intel/iwlwifi/iwlwifi-Qu-b0-hr-b0-77.ucode
+#  Link: iwlwifi-Qu-b0-hr-b0-77.ucode -> intel/iwlwifi/iwlwifi-Qu-b0-hr-b0-77.ucode
+# -Version: 74.8dbafb52.0
+# +Version: 74.563a6e92.0
+#  
+#  File: intel/iwlwifi/iwlwifi-Qu-b0-jf-b0-77.ucode
+#  Link: iwlwifi-Qu-b0-jf-b0-77.ucode -> intel/iwlwifi/iwlwifi-Qu-b0-jf-b0-77.ucode
+# -Version: 74.8dbafb52.0
+# +Version: 74.563a6e92.0
+#  
+#  File: intel/iwlwifi/iwlwifi-Qu-c0-hr-b0-77.ucode
+#  Link: iwlwifi-Qu-c0-hr-b0-77.ucode -> intel/iwlwifi/iwlwifi-Qu-c0-hr-b0-77.ucode
+# -Version: 74.8dbafb52.0
+# +Version: 74.563a6e92.0
+#  
+#  File: intel/iwlwifi/iwlwifi-Qu-c0-jf-b0-77.ucode
+#  Link: iwlwifi-Qu-c0-jf-b0-77.ucode -> intel/iwlwifi/iwlwifi-Qu-c0-jf-b0-77.ucode
+# -Version: 74.8dbafb52.0
+# +Version: 74.563a6e92.0
+#  
+#  File: intel/iwlwifi/iwlwifi-QuZ-a0-hr-b0-77.ucode
+#  Link: iwlwifi-QuZ-a0-hr-b0-77.ucode -> intel/iwlwifi/iwlwifi-QuZ-a0-hr-b0-77.ucode
+# -Version: 74.8dbafb52.0
+# +Version: 74.563a6e92.0
+#  
+#  File: intel/iwlwifi/iwlwifi-QuZ-a0-jf-b0-77.ucode
+#  Link: iwlwifi-QuZ-a0-jf-b0-77.ucode -> intel/iwlwifi/iwlwifi-QuZ-a0-jf-b0-77.ucode
+# -Version: 74.8dbafb52.0
+# +Version: 74.563a6e92.0
+#  
+#  File: intel/iwlwifi/iwlwifi-ty-a0-gf-a0-77.ucode
+#  Link: iwlwifi-ty-a0-gf-a0-77.ucode -> intel/iwlwifi/iwlwifi-ty-a0-gf-a0-77.ucode
+# @@ -978,7 +1015,7 @@
+#  
+#  File: intel/iwlwifi/iwlwifi-ty-a0-gf-a0-89.ucode
+#  Link: iwlwifi-ty-a0-gf-a0-89.ucode -> intel/iwlwifi/iwlwifi-ty-a0-gf-a0-89.ucode
+# -Version: 86.d2579d43.0
+# +Version: 86.b20dcd1f.0
+#  
+#  File: intel/iwlwifi/iwlwifi-so-a0-gf4-a0-77.ucode
+#  Link: iwlwifi-so-a0-gf4-a0-77.ucode -> intel/iwlwifi/iwlwifi-so-a0-gf4-a0-77.ucode
+# @@ -1010,7 +1047,7 @@
+#  
+#  File: intel/iwlwifi/iwlwifi-so-a0-gf4-a0-89.ucode
+#  Link: iwlwifi-so-a0-gf4-a0-89.ucode -> intel/iwlwifi/iwlwifi-so-a0-gf4-a0-89.ucode
+# -Version: 86.d2579d43.0
+# +Version: 86.b20dcd1f.0
+#  
+#  File: intel/iwlwifi/iwlwifi-so-a0-gf-a0-77.ucode
+#  Link: iwlwifi-so-a0-gf-a0-77.ucode -> intel/iwlwifi/iwlwifi-so-a0-gf-a0-77.ucode
+# @@ -1042,7 +1079,7 @@
+#  
+#  File: intel/iwlwifi/iwlwifi-so-a0-gf-a0-89.ucode
+#  Link: iwlwifi-so-a0-gf-a0-89.ucode -> intel/iwlwifi/iwlwifi-so-a0-gf-a0-89.ucode
+# -Version: 86.d2579d43.0
+# +Version: 86.b20dcd1f.0
+#  
+#  File: intel/iwlwifi/iwlwifi-so-a0-hr-b0-77.ucode
+#  Link: iwlwifi-so-a0-hr-b0-77.ucode -> intel/iwlwifi/iwlwifi-so-a0-hr-b0-77.ucode
+# @@ -1070,7 +1107,7 @@
+#  
+#  File: intel/iwlwifi/iwlwifi-so-a0-hr-b0-89.ucode
+#  Link: iwlwifi-so-a0-hr-b0-89.ucode -> intel/iwlwifi/iwlwifi-so-a0-hr-b0-89.ucode
+# -Version: 86.d2579d43.0
+# +Version: 86.b20dcd1f.0
+#  
+#  File: intel/iwlwifi/iwlwifi-so-a0-jf-b0-77.ucode
+#  Link: iwlwifi-so-a0-jf-b0-77.ucode -> intel/iwlwifi/iwlwifi-so-a0-jf-b0-77.ucode
+# @@ -1093,7 +1130,7 @@
+#  
+#  File: intel/iwlwifi/iwlwifi-bz-b0-hr-b0-100.ucode
+#  Link: iwlwifi-bz-b0-hr-b0-100.ucode -> intel/iwlwifi/iwlwifi-bz-b0-hr-b0-100.ucode
+# -Version: 97.dc7aa42e.0
+# +Version: 97.5850a0c2.0
+#  
+#  File: intel/iwlwifi/iwlwifi-bz-b0-hr-b0.pnvm
+#  Link: iwlwifi-bz-b0-hr-b0.pnvm -> intel/iwlwifi/iwlwifi-bz-b0-hr-b0.pnvm
+# @@ -1120,7 +1157,7 @@
+#  
+#  File: intel/iwlwifi/iwlwifi-bz-b0-gf-a0-100.ucode
+#  Link: iwlwifi-bz-b0-gf-a0-100.ucode -> intel/iwlwifi/iwlwifi-bz-b0-gf-a0-100.ucode
+# -Version: 97.dc7aa42e.0
+# +Version: 97.5850a0c2.0
+#  
+#  File: intel/iwlwifi/iwlwifi-bz-b0-gf-a0.pnvm
+#  Link: iwlwifi-bz-b0-gf-a0.pnvm -> intel/iwlwifi/iwlwifi-bz-b0-gf-a0.pnvm
+# @@ -1177,6 +1214,10 @@
+#  Link: iwlwifi-gl-c0-fm-c0-c107.ucode -> intel/iwlwifi/iwlwifi-gl-c0-fm-c0-c107.ucode
+#  Version: 107.1b444747.0
+#  
+# +File: intel/iwlwifi/iwlwifi-gl-c0-fm-c0-c108.ucode
+# +Link: iwlwifi-gl-c0-fm-c0-c108.ucode -> intel/iwlwifi/iwlwifi-gl-c0-fm-c0-c108.ucode
+# +Version: 108.45105872.0
+# +
+#  File: intel/iwlwifi/iwlwifi-gl-c0-fm-c0-c101.ucode
+#  Link: iwlwifi-gl-c0-fm-c0-c101.ucode -> intel/iwlwifi/iwlwifi-gl-c0-fm-c0-c101.ucode
+#  Version: 101.6e695a70.0
+# @@ -1238,7 +1279,7 @@
+#  
+#  File: intel/iwlwifi/iwlwifi-bz-b0-fm-c0-c107.ucode
+#  Link: iwlwifi-bz-b0-fm-c0-c107.ucode -> intel/iwlwifi/iwlwifi-bz-b0-fm-c0-c107.ucode
+# -Version: 107.1b444747.0
+# +Version: 107.b2a0d4b2k.0
+#  
+#  File: intel/iwlwifi/iwlwifi-bz-b0-fm-c0.pnvm
+#  Link: iwlwifi-bz-b0-fm-c0.pnvm -> intel/iwlwifi/iwlwifi-bz-b0-fm-c0.pnvm
+# @@ -1253,7 +1294,7 @@
+#  
+#  File: intel/iwlwifi/iwlwifi-ma-b0-gf-a0-89.ucode
+#  Link: iwlwifi-ma-b0-gf-a0-89.ucode -> intel/iwlwifi/iwlwifi-ma-b0-gf-a0-89.ucode
+# -Version: 86.d2579d43.0
+# +Version: 86.b20dcd1f.0
+#  
+#  File: intel/iwlwifi/iwlwifi-ma-b0-gf-a0.pnvm
+#  Link: iwlwifi-ma-b0-gf-a0.pnvm -> intel/iwlwifi/iwlwifi-ma-b0-gf-a0.pnvm
+# @@ -1268,7 +1309,7 @@
+#  
+#  File: intel/iwlwifi/iwlwifi-ma-b0-gf4-a0-89.ucode
+#  Link: iwlwifi-ma-b0-gf4-a0-89.ucode -> intel/iwlwifi/iwlwifi-ma-b0-gf4-a0-89.ucode
+# -Version: 86.d2579d43.0
+# +Version: 86.b20dcd1f.0
+#  
+#  File: intel/iwlwifi/iwlwifi-ma-b0-gf4-a0.pnvm
+#  Link: iwlwifi-ma-b0-gf4-a0.pnvm -> intel/iwlwifi/iwlwifi-ma-b0-gf4-a0.pnvm
+# @@ -1283,7 +1324,7 @@
+#  
+#  File: intel/iwlwifi/iwlwifi-ma-b0-hr-b0-89.ucode
+#  Link: iwlwifi-ma-b0-hr-b0-89.ucode -> intel/iwlwifi/iwlwifi-ma-b0-hr-b0-89.ucode
+# -Version: 86.d2579d43.0
+# +Version: 86.b20dcd1f.0
+#  
+#  File: intel/iwlwifi/iwlwifi-sc-a0-wh-b0-101.ucode
+#  Link: iwlwifi-sc-a0-wh-b0-101.ucode -> intel/iwlwifi/iwlwifi-sc-a0-wh-b0-101.ucode
+# @@ -1301,6 +1342,10 @@
+#  Link: iwlwifi-sc-a0-wh-b0-c107.ucode -> intel/iwlwifi/iwlwifi-sc-a0-wh-b0-c107.ucode
+#  Version: 107.1b444747.0
+#  
+# +File: intel/iwlwifi/iwlwifi-sc-a0-wh-b0-c108.ucode
+# +Link: iwlwifi-sc-a0-wh-b0-c108.ucode -> intel/iwlwifi/iwlwifi-sc-a0-wh-b0-c108.ucode
+# +Version: 108.45105872.0
+# +
+#  File: intel/iwlwifi/iwlwifi-sc-a0-wh-b0-c101.ucode
+#  Link: iwlwifi-sc-a0-wh-b0-c101.ucode -> intel/iwlwifi/iwlwifi-sc-a0-wh-b0-c101.ucode
+#  Version: 101.6e695a70.0
+# @@ -1311,7 +1356,7 @@
+#  
+#  File: intel/iwlwifi/iwlwifi-sc-a0-gf-a0-100.ucode
+#  Link: iwlwifi-sc-a0-gf-a0-100.ucode -> intel/iwlwifi/iwlwifi-sc-a0-gf-a0-100.ucode
+# -Version: 97.dc7aa42e.0
+# +Version: 97.5850a0c2.0
+#  
+#  File: intel/iwlwifi/iwlwifi-sc-a0-fm-c0-c101.ucode
+#  Link: iwlwifi-sc-a0-fm-c0-c101.ucode -> intel/iwlwifi/iwlwifi-sc-a0-fm-c0-c101.ucode
+# @@ -1321,22 +1366,26 @@
+#  Link: iwlwifi-sc-a0-fm-c0-c102.ucode -> intel/iwlwifi/iwlwifi-sc-a0-fm-c0-c102.ucode
+#  Version: 102.07fca168.0
+#  
+# +File: intel/iwlwifi/iwlwifi-sc-a0-fm-c0-c103.ucode
+# +Link: iwlwifi-sc-a0-fm-c0-c103.ucode -> intel/iwlwifi/iwlwifi-sc-a0-fm-c0-c103.ucode
+# +Version: 103.1a5cc88d.0
+# +
+# +File: intel/iwlwifi/iwlwifi-sc-a0-fm-c0-c106.ucode
+# +Link: iwlwifi-sc-a0-fm-c0-c106.ucode -> intel/iwlwifi/iwlwifi-sc-a0-fm-c0-c106.ucode
+# +Version: 106.c88d33af.0
+# +
+# +File: intel/iwlwifi/iwlwifi-sc-a0-fm-c0-c107.ucode
+# +Link: iwlwifi-sc-a0-fm-c0-c107.ucode -> intel/iwlwifi/iwlwifi-sc-a0-fm-c0-c107.ucode
+# +Version: 107.1b444747.0
+# +
+# +File: intel/iwlwifi/iwlwifi-sc-a0-fm-c0-c108.ucode
+# +Link: iwlwifi-sc-a0-fm-c0-c108.ucode -> intel/iwlwifi/iwlwifi-sc-a0-fm-c0-c108.ucode
+# +Version: 108.45105872.0
+# +
+#  File: intel/iwlwifi/iwlwifi-bz-b0-wh-b0-c102.ucode
+#  Link: iwlwifi-bz-b0-wh-b0-c102.ucode -> intel/iwlwifi/iwlwifi-bz-b0-wh-b0-c102.ucode
+#  Version: 102.07fca168.0
+#  
+# -File: intel/iwlwifi/iwlwifi-sc-a0-fm-c0-c103.ucode
+# -Link: iwlwifi-sc-a0-fm-c0-c103.ucode -> intel/iwlwifi/iwlwifi-sc-a0-fm-c0-c103.ucode
+# -Version: 103.1a5cc88d.0
+# -
+# -File: intel/iwlwifi/iwlwifi-sc-a0-fm-c0-c106.ucode
+# -Link: iwlwifi-sc-a0-fm-c0-c106.ucode -> intel/iwlwifi/iwlwifi-sc-a0-fm-c0-c106.ucode
+# -Version: 106.c88d33af.0
+# -
+# -File: intel/iwlwifi/iwlwifi-sc-a0-fm-c0-c107.ucode
+# -Link: iwlwifi-sc-a0-fm-c0-c107.ucode -> intel/iwlwifi/iwlwifi-sc-a0-fm-c0-c107.ucode
+# -Version: 107.1b444747.0
+# -
+#  File: intel/iwlwifi/iwlwifi-bz-b0-wh-b0-c103.ucode
+#  Link: iwlwifi-bz-b0-wh-b0-c103.ucode -> intel/iwlwifi/iwlwifi-bz-b0-wh-b0-c103.ucode
+#  Version: 103.1a5cc88d.0
+# @@ -1349,7 +1398,12 @@
+#  Link: iwlwifi-bz-b0-wh-b0-c107.ucode -> intel/iwlwifi/iwlwifi-bz-b0-wh-b0-c107.ucode
+#  Version: 107.1b444747.0
+#  
+# +File: intel/iwlwifi/iwlwifi-bz-b0-wh-b0-c108.ucode
+# +Link: iwlwifi-bz-b0-wh-b0-c108.ucode -> intel/iwlwifi/iwlwifi-bz-b0-wh-b0-c108.ucode
+# +Version: 108.45105872.0
+# +
+#  Licence: Redistributable. See LICENCE.iwlwifi_firmware for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.iwlwifi_firmware
+#  
+#  Also available from http://wireless.kernel.org/en/users/Drivers/iwlwifi#Firmware
+#  
+# @@ -1364,6 +1418,7 @@
+#  Version: irci_stable_candrpv_0415_20150521_0458
+#  
+#  License: Redistributable. See LICENSE.ivsc for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.ivsc
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -1376,6 +1431,7 @@
+#  Link: intel/irci_irci_ecr-master_20161208_0213_20170112_1500.bin -> ipu/irci_irci_ecr-master_20161208_0213_20170112_1500.bin
+#  
+#  Licence: Redistributable. See LICENSE.ipu3_firmware for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.ipu3_firmware
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -1391,6 +1447,7 @@
+#  Version: scci_master_20210502_1459
+#  
+#  Licence: Redistributable. See LICENSE.ivsc for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.ivsc
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -1403,6 +1460,7 @@
+#  Version: 1.2.1.20251215_224531
+#  
+#  Licence: Redistributable. See LICENSE.intel for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.intel
+#  
+#  --------------------------------------------------------------------------
+#  Driver: mei-vsc-hw - Intel Visual Sensing Controller
+# @@ -1438,6 +1496,7 @@
+#  File: intel/vsc/ivsc_skucfg_ovti9738_0_1.bin
+#  
+#  Licence: Redistributable. See LICENSE.ivsc for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.ivsc
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -1448,6 +1507,7 @@
+#  File: ixp4xx/NPE-C
+#  Version: date = February 26, 2007
+#  License: Redistributable. See LICENSE.ixp4xx for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.ixp4xx
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -1456,6 +1516,7 @@
+#  File: tehuti/bdx.bin
+#  
+#  Licence: Redistributable. See LICENSE.tehuti for details.
+# +SPDX-License-Identifier: LicenseRef-LICENSE.tehuti
+#  
+#  Found in hex form in kernel source.
+#  
+# @@ -1466,6 +1527,7 @@
+#  File: 3com/typhoon.bin
+#  
+#  Licence: Redistributable. See LICENCE.typhoon for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.typhoon
+#  
+#  Found in hex form in kernel source.
+#  
+# @@ -1483,6 +1545,7 @@
+#  Source: cis/
+#  
+#  Licence: Dual GPLv2/MPL
+# +SPDX-License-Identifier: GPL-2.0-only OR MPL-1.1
+#  
+#  Originally developed by the pcmcia-cs project
+#  Copyright (C) 1998, 1999, 2000 David A. Hinds
+# @@ -1495,6 +1558,7 @@
+#  Source: cis/src/3CXEM556.cis
+#  
+#  Licence: Dual GPLv2/MPL
+# +SPDX-License-Identifier: GPL-2.0-only OR MPL-1.1
+#  
+#  Originally developed by the pcmcia-cs project
+#  Copyright (C) 1998, 1999, 2000 David A. Hinds
+# @@ -1507,6 +1571,7 @@
+#  Source: cis/src/3CCFEM556.cis
+#  
+#  Licence: Dual GPLv2/MPL
+# +SPDX-License-Identifier: GPL-2.0-only OR MPL-1.1
+#  
+#  Originally developed by the pcmcia-cs project
+#  Copyright (C) 1998, 1999, 2000 David A. Hinds
+# @@ -1525,6 +1590,7 @@
+#  Source: cis/src/COMpad4.cis
+#  
+#  Licence: Dual GPLv2/MPL
+# +SPDX-License-Identifier: GPL-2.0-only OR MPL-1.1
+#  
+#  Originally developed by the pcmcia-cs project
+#  Copyright (C) 1998, 1999, 2000 David A. Hinds
+# @@ -1538,6 +1604,7 @@
+#  File: cis/SW_8xx_SER.cis
+#  
+#  Licence: GPLv3. See GPL-3.0-only for details.
+# +SPDX-License-Identifier: GPL-3.0-only
+#  
+#  Copyright Sierra Wireless
+#  
+# @@ -1550,6 +1617,7 @@
+#  Licence: Allegedly GPL, but no source visible. Marked:
+#      This file contains the firmware of Seven of Diamonds from OSITECH.
+#      (Special thanks to Kevin MacPherson of OSITECH)
+# +SPDX-License-Identifier: GPL-2.0-or-later
+#  
+#  Found in hex form in kernel source.
+#  
+# @@ -1574,6 +1642,7 @@
+#  File: v4l-cx25840.fw
+#  
+#  Licence: Redistributable. See LICENSE.conexant for details.
+# +SPDX-License-Identifier: LicenseRef-LICENSE.conexant
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -1593,6 +1662,7 @@
+#  File: bnx2x/bnx2x-e2-7.13.21.0.fw
+#  
+#  License: Redistributable. See LICENCE.bnx2x for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.bnx2x
+#  
+#  Found in hex form in kernel source.
+#  
+# @@ -1607,6 +1677,7 @@
+#  File: bnx2/bnx2-rv2p-09ax-6.0.17.fw
+#  
+#  License: Redistributable. See LICENCE.bnx2 for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.bnx2
+#  
+#  Found in hex form in kernel source.
+#  
+# @@ -1618,6 +1689,7 @@
+#  Version: 4.0.590
+#  
+#  Licence: Redistributable. See LICENCE.phanfw for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.phanfw
+#  
+#  Available from http://ldriver.qlogic.com/firmware/netxen_nic/new/
+#  
+# @@ -1630,6 +1702,7 @@
+#  Source: av7110/Makefile
+#  
+#  Licence: GPLv2 or later. See GPL-2.0 for details.
+# +SPDX-License-Identifier: GPL-2.0-or-later
+#  
+#  ARM assembly source code from https://linuxtv.org/downloads/firmware/Boot.S
+#  
+# @@ -1640,6 +1713,7 @@
+#  File: yamaha/yss225_registers.bin
+#  
+#  Licence: Allegedly GPLv2+, but no source visible.
+# +SPDX-License-Identifier: GPL-2.0-or-later
+#  
+#  Found in hex form in kernel source, with the following comment:
+#     Copyright (c) 1998-2002 by Paul Davis <pbd@op.net>
+# @@ -1653,6 +1727,7 @@
+#  File: rt2661.bin
+#  
+#  Licence: Redistributable. See LICENCE.ralink-firmware.txt for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.ralink-firmware.txt
+#  
+#  Downloaded from http://www.ralinktech.com/ralink/Home/Support/Linux.html
+#  
+# @@ -1663,6 +1738,7 @@
+#  File: rt73.bin
+#  
+#  Licence: Redistributable. See LICENCE.ralink-firmware.txt for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.ralink-firmware.txt
+#  
+#  Downloaded from http://www.ralinktech.com/ralink/Home/Support/Linux.html
+#  
+# @@ -1675,6 +1751,7 @@
+#  Link: mt7601u.bin -> mediatek/mt7601u.bin
+#  
+#  Licence: Redistributable. See LICENCE.ralink_a_mediatek_company_firmware for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.ralink_a_mediatek_company_firmware
+#  
+#  Downloaded from http://www.mediatek.com/en/downloads/
+#  
+# @@ -1689,6 +1766,7 @@
+#  Version: 37
+#  
+#  Licence: Redistributable. See LICENCE.ralink-firmware.txt for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.ralink-firmware.txt
+#  
+#  Binary file supplied originally by Shiang Tu <shiang_tu@ralinktech.com>, latest
+#  from http://www.mediatek.com/en/downloads1/downloads/
+# @@ -1700,6 +1778,7 @@
+#  Link: rt3090.bin -> rt2860.bin
+#  
+#  Licence: Redistributable. See LICENCE.ralink-firmware.txt for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.ralink-firmware.txt
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -1709,6 +1788,7 @@
+#  Version: 36
+#  
+#  Licence: Redistributable. See LICENCE.ralink-firmware.txt for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.ralink-firmware.txt
+#  
+#  Binary file supplied originally by Shiang Tu <shiang_tu@ralinktech.com>, latest
+#  from http://www.mediatek.com/en/downloads1/downloads/
+# @@ -1721,6 +1801,7 @@
+#  File: rt3071.bin
+#  
+#  Licence: Redistributable. See LICENCE.ralink-firmware.txt for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.ralink-firmware.txt
+#  
+#  Info: rt3071.bin is a copy of bytes 4096-8191 of rt2870.bin for compatibility.
+#  
+# @@ -1734,6 +1815,8 @@
+#  Source: usbdux/
+#  
+#  Licence: GPLv2 or later. See GPL-2.0 for details.
+# +SPDX-License-Identifier: GPL-2.0-or-later
+# +
+#  Provided from the author, Bernd Porr <BerndPorr@f2s.com>
+#  
+#  --------------------------------------------------------------------------
+# @@ -1744,6 +1827,7 @@
+#  Version: 1.4.1
+#  
+#  Licence: Redistributable. See LICENCE.xc4000 for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.xc4000
+#  
+#  --------------------------------------------------------------------------
+#  Driver: xc5000 - Xceive 5000 Tuner driver
+# @@ -1755,6 +1839,7 @@
+#  Version: 4.1.30.7
+#  
+#  Licence: Redistributable. See LICENCE.xc5000 and LICENCE.xc5000c for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.xc5000
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -1764,6 +1849,7 @@
+#  Version: 1.20
+#  
+#  Licence: Redistributable. See LICENSE.dib0700 for details
+# +SPDX-License-Identifier: ISC
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -1775,6 +1861,7 @@
+#  Fix EEPROM radio table issue and change PID to 3005
+#  
+#  Licence: Redistributable. See LICENCE.atheros_firmware for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.atheros_firmware
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -1784,6 +1871,7 @@
+#  File: matrox/g400_warp.fw
+#  
+#  Licence: Redistributable. See LICENSE.mga for details.
+# +SPDX-License-Identifier: MIT
+#  
+#  Found in hex form in kernel source.
+#  
+# @@ -1794,6 +1882,7 @@
+#  File: r128/r128_cce.bin
+#  
+#  Licence: MIT
+# +SPDX-License-Identifier: MIT
+#  
+#  Copyright 2000 Advanced Micro Devices, Inc.
+#  
+# @@ -1832,6 +1921,7 @@
+#  File: radeon/RV710_me.bin
+#  
+#  Licence: MIT
+# +SPDX-License-Identifier: MIT
+#  
+#  Copyright 2007-2009 Advanced Micro Devices, Inc.
+#  
+# @@ -2063,6 +2153,7 @@
+#  File: radeon/si58_mc.bin
+#  
+#  Licence: Redistributable. See LICENSE.radeon for details.
+# +SPDX-License-Identifier: LicenseRef-LICENSE.radeon
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -2071,6 +2162,7 @@
+#  File: aeonsemi/as21x1x_fw.bin
+#  
+#  Licence: Redistributable. See LICENSE.aeonsemi for details.
+# +SPDX-License-Identifier: LicenseRef-LICENSE.aeonsemi
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -2080,6 +2172,7 @@
+#  File: airoha/EthMD32.DSP.bin
+#  
+#  Licence: Redistributable. See LICENSE.airoha for details.
+# +SPDX-License-Identifier: LicenseRef-LICENSE.airoha
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -2090,6 +2183,7 @@
+#  Version: 26071602
+#  
+#  Licence: Redistributable. See LICENSE.airoha for details.
+# +SPDX-License-Identifier: LicenseRef-LICENSE.airoha
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -2099,6 +2193,7 @@
+#  File: airoha/en7581_npu_rv32.bin
+#  
+#  Licence: Redistributable. See LICENSE.airoha for details.
+# +SPDX-License-Identifier: LicenseRef-LICENSE.airoha
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -2109,6 +2204,7 @@
+#  File: airoha/en7581_MT7996_npu_rv32.bin
+#  
+#  Licence: Redistributable. See LICENSE.airoha for details.
+# +SPDX-License-Identifier: LicenseRef-LICENSE.airoha
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -2120,6 +2216,7 @@
+#  Version: 0.5
+#  
+#  Licence: Redistributable. See LICENSE.airoha for details.
+# +SPDX-License-Identifier: LicenseRef-LICENSE.airoha
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -2825,6 +2922,7 @@
+#  File: amdgpu/vpe_6_1_3.bin
+#  
+#  Licence: Redistributable. See LICENSE.amdgpu for details.
+# +SPDX-License-Identifier: LicenseRef-LICENSE.amdgpu
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -2844,6 +2942,7 @@
+#  Link: amdnpu/17f0_11/npu_7.sbin -> npu.sbin.1.1.2.65
+#  
+#  Licence: Redistributable. See LICENSE.amdnpu for details.
+# +SPDX-License-Identifier: LicenseRef-LICENSE.amdnpu
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -2855,6 +2954,7 @@
+#  Link: amdtee/amd_pmf_v3_1.bin -> f29bb3d9-bd66-5441-afb88acc2b2b60d6.bin
+#  
+#  Licence: Redistributable. See LICENSE.amd_pmf for details.
+# +SPDX-License-Identifier: LicenseRef-LICENSE.amd_pmf
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -2864,6 +2964,7 @@
+#  Version: 1.2.8
+#  
+#  Licence: Redistributable. See LICENCE.sensoray for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.sensoray
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -2872,6 +2973,9 @@
+#  File: qlogic/sd7220.fw
+#  
+#  Licence: Redistributable. See LICENSE.ib_qib for details.
+# +SPDX-License-Identifier: LicenseRef-LICENSE.ib_qib
+# +
+# +SPDX-License-Identifier: GPL-2.0-only OR Linux-OpenIB
+#  
+#  Found in hex form in kernel source.
+#  
+# @@ -2901,6 +3005,7 @@
+#  File: qed/qed_init_values_zipped-8.59.1.0.bin
+#  
+#  Licence: Redistributable. See LICENSE.qed for details.
+# +SPDX-License-Identifier: LicenseRef-LICENSE.qed
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -2912,6 +3017,7 @@
+#  Version: 1.0
+#  
+#  Licence: Redistributable. See LICENCE.ueagle-atm4-firmware for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.ueagle-atm4-firmware
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -2922,6 +3028,7 @@
+#  Version: 1.8.1
+#  
+#  Licence: Redistributable. See LICENSE.vxge for details.
+# +SPDX-License-Identifier: LicenseRef-LICENSE.vxge
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -2932,6 +3039,7 @@
+#  Version: 610.812
+#  
+#  Licence: Redistributable. See LICENCE.broadcom_bcm43xx for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.broadcom_bcm43xx
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -2961,6 +3069,7 @@
+#  File: brcm/brcmfmac4371-pcie.bin
+#  
+#  Licence: Redistributable. See LICENCE.broadcom_bcm43xx for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.broadcom_bcm43xx
+#  
+#  File: brcm/brcmfmac4373.bin
+#  File: cypress/cyfmac43012-sdio.bin
+# @@ -3008,6 +3117,7 @@
+#  Link: brcm/brcmfmac54591-pcie.clm_blob -> ../cypress/cyfmac54591-pcie.clm_blob
+#  
+#  Licence: Redistributable. See LICENCE.cypress for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.cypress
+#  
+#  File: "brcm/brcmfmac43241b4-sdio.Advantech-MICA-071.txt"
+#  File: "brcm/brcmfmac43241b4-sdio.Intel Corp.-VALLEYVIEW C0 PLATFORM.txt"
+# @@ -3081,6 +3191,7 @@
+#  Link: brcm/brcmfmac43455-sdio.pine64,soquartz-blade.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
+#  
+#  Licence: GPLv2. See GPL-2.0 for details.
+# +SPDX-License-Identifier: GPL-2.0-only
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -3089,6 +3200,7 @@
+#  File: ti/vpdma-1b8.bin
+#  
+#  Licence: Redistributable. See LICENCE.ti-tspa for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.ti-tspa
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -3100,6 +3212,7 @@
+#  File: ti-connectivity/wl1251-nvs.bin
+#  
+#  Licence: Redistributable. See LICENCE.wl1251 for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.wl1251
+#  
+#  Info:
+#  The published NVS files are for testing only.  Every device needs to
+# @@ -3163,6 +3276,7 @@
+#  Link: ti-connectivity/wl1271-nvs.bin -> wl127x-nvs.bin
+#  
+#  Licence: Redistributable. See LICENCE.ti-connectivity for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.ti-connectivity
+#  
+#  Info:
+#  The NVS file includes two parts:
+# @@ -3198,6 +3312,7 @@
+#  Version: 8.9.0.0.79
+#  
+#  Licence: Redistributable. See LICENCE.ti-connectivity for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.ti-connectivity
+#  
+#  Info:
+#  The driver expects to find the firmwares under a ti-connectivity
+# @@ -3217,6 +3332,7 @@
+#  Version: 1.7.0.120
+#  
+#  Licence: Redistributable. See LICENCE.ti-connectivity for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.ti-connectivity
+#  
+#  The cc33xx-conf.bin is a binary containing two parts: radio calibration
+#  and hardware configuration. The binary can be modified using the tool
+# @@ -3240,6 +3356,7 @@
+#  File: ti-connectivity/TIInit_7.2.31.bts
+#  
+#  Licence: Redistributable. See LICENCE.ti-connectivity for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.ti-connectivity
+#  
+#  Info:
+#  	TIInit_7.2.31.bts version 7.2.31
+# @@ -3253,6 +3370,7 @@
+#  File: tlg2300_firmware.bin
+#  
+#  Licence: Redistributable. See LICENSE.tlg2300 for details.
+# +SPDX-License-Identifier: LicenseRef-LICENSE.tlg2300
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -3263,6 +3381,7 @@
+#        Reverted rtl8188C_8192C_8192D_usb_linux_v3.4.2_3727.20120404
+#  
+#  Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.rtlwifi_firmware.txt
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -3274,6 +3393,7 @@
+#  Info: From Vendor's realtek/rtlwifi_linux_mac80211_0019.0320.2014V628 driver
+#  
+#  Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.rtlwifi_firmware.txt
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -3291,6 +3411,7 @@
+#          - rtlwifi/rtl8192cufw_TMSC.bin: Rtl8192CUFwTSMCImgArray
+#  
+#  Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.rtlwifi_firmware.txt
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -3300,6 +3421,7 @@
+#  File: rtlwifi/rtl8192sefw.bin
+#  
+#  Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.rtlwifi_firmware.txt
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -3309,6 +3431,7 @@
+#  File: rtlwifi/rtl8192defw.bin
+#  
+#  Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.rtlwifi_firmware.txt
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -3319,6 +3442,7 @@
+#  Version: 39.0
+#  
+#  Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.rtlwifi_firmware.txt
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -3329,6 +3453,7 @@
+#  File: rtlwifi/rtl8723fw_B.bin
+#  
+#  Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.rtlwifi_firmware.txt
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -3340,6 +3465,7 @@
+#  File: rtlwifi/rtl8723befw_36.bin
+#  
+#  Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.rtlwifi_firmware.txt
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -3349,6 +3475,7 @@
+#  File: rtlwifi/rtl8723defw.bin
+#  
+#  Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.rtlwifi_firmware.txt
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -3358,6 +3485,7 @@
+#  File: rtlwifi/rtl8188efw.bin
+#  
+#  Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.rtlwifi_firmware.txt
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -3368,6 +3496,7 @@
+#  File: rtlwifi/rtl8812aefw_wowlan.bin
+#  
+#  Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.rtlwifi_firmware.txt
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -3380,6 +3509,7 @@
+#  File: rtlwifi/rtl8821aefw_29.bin
+#  
+#  Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.rtlwifi_firmware.txt
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -3389,6 +3519,7 @@
+#  File: rtlwifi/rtl8822befw.bin
+#  
+#  Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.rtlwifi_firmware.txt
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -3409,6 +3540,7 @@
+#  File: rtw88/rtw8814a_fw.bin
+#  
+#  Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.rtlwifi_firmware.txt
+#  
+#  Info:
+#      These firmware should be put under /lib/firmware/rtw88/
+# @@ -3441,9 +3573,13 @@
+#  File: rtw89/rtw8922a_fw-3.bin
+#  File: rtw89/rtw8922a_fw-4.bin
+#  File: rtw89/rtw8922d_fw.bin
+# +File: rtw89/rtw8922d_fw-1.bin
+#  File: rtw89/rtw8922ds_fw.bin
+# +File: rtw89/rtw8922ds_fw-1.bin
+# +File: rtw89/board_elm.bin
+#  
+#  Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.rtlwifi_firmware.txt
+#  
+#     These firmware support 802.11ax chips including RTL8851B, RTL8852A,
+#     RTL8852B, RTL8852BT and RTL8852C and 802.11be chip including RTL8922A.
+# @@ -3460,6 +3596,7 @@
+#  Link: rtlwifi/rtl8192eefw.bin -> rtl8192eu_nic.bin
+#  
+#  Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.rtlwifi_firmware.txt
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -3473,6 +3610,7 @@
+#  Link: rtlwifi/rtl8723bs_wowlan.bin -> rtl8723bu_wowlan.bin
+#  
+#  Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.rtlwifi_firmware.txt
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -3531,6 +3669,7 @@
+#  Version: 7.3
+#  
+#  Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.rtlwifi_firmware.txt
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -3633,6 +3772,7 @@
+#  Version: 0.0.1
+#  
+#  Licence: Redistributable. See LICENSE.r8169 for details.
+# +SPDX-License-Identifier: LicenseRef-LICENSE.r8169
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -3647,6 +3787,7 @@
+#  File: rtl_nic/rtl8156b-2.fw
+#  
+#  Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.rtlwifi_firmware.txt
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -3662,6 +3803,7 @@
+#  Version: 1.10.0
+#  
+#  Licence: Redistributable. See LICENSE.rt1320 for details.
+# +SPDX-License-Identifier: LicenseRef-LICENSE.rt1320
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -3670,6 +3812,7 @@
+#  File: vntwusb.fw
+#  
+#  Licence: Redistributable. See LICENCE.via_vt6656 for details.
+# +SPDX-License-Identifier: MIT
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -3694,6 +3837,7 @@
+#  File: ar3k/ramps_0x31010100_40.dfu
+#  
+#  Licence: Redistributable. See LICENCE.atheros_firmware for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.atheros_firmware
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -3703,6 +3847,7 @@
+#  File: ar3k/1020201coex/ramps_0x01020201_26_HighPriority.dfu
+#  
+#  Licence: Redistributable. See LICENSE.QualcommAtheros_ar3k for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.QualcommAtheros_ar3k
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -3721,6 +3866,7 @@
+#  File: ar3k/30000/RamPatch.txt
+#  
+#  Licence: Redistributable. See LICENCE.atheros_firmware for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.atheros_firmware
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -3757,6 +3903,7 @@
+#  File: ath6k/AR6002/data.patch.hw2_0.bin
+#  
+#  Licence: Redistributable. See LICENCE.atheros_firmware for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.atheros_firmware
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -3830,6 +3977,7 @@
+#  File: ath10k/WCN3990/hw1.0/shikra/notice.txt_wlanmdsp
+#  
+#  Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.QualcommAtheros_ath10k
+#  
+#  File: ath10k/WCN3990/hw1.0/qcm2290/wlanmdsp.mbn
+#  Version: WLAN.HL.3.3.7.c2-00931-QCAHLSWMTPLZ-1
+# @@ -3840,6 +3988,7 @@
+#  Link: ath10k/WCN3990/hw1.0/qrb4210/firmware-5.bin -> ../qcm2290/firmware-5.bin
+#  
+#  Licence: Redistributable. See LICENSE.qcom and NOTICE.qcom for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.qcom
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -3948,6 +4097,7 @@
+#  File: ath11k/QCA6698AQ/hw2.1/Notice.txt
+#  
+#  Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.QualcommAtheros_ath10k
+#  
+#  File: ath11k/WCN6750/hw1.0/qcm6490/wpss.mbn
+#  Version: WLAN.MSL.2.0.c2-00204-QCAMSLSWPLZ-1
+# @@ -3955,6 +4105,7 @@
+#  Link: qcom/qcs6490/wpss.mbn -> ../../ath11k/WCN6750/hw1.0/qcm6490/wpss.mbn
+#  
+#  Licence: Redistributable. See LICENSE.qcom and NOTICE.qcom for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.qcom
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -3986,6 +4137,7 @@
+#  File: ath12k/QCC2072/hw1.0/Notice.txt
+#  
+#  Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.QualcommAtheros_ath10k
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -4002,6 +4154,7 @@
+#  Version: 1.4.57
+#  
+#  License: Redistributable.  See LICENCE.myri10ge_firmware for details.
+# +SPDX-License-Identifier: BSD-2-Clause
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -4016,6 +4169,7 @@
+#  File: ath6k/AR6003.1/hw2.1.1/otp.bin
+#  
+#  License: Redistributable. See LICENCE.atheros_firmware for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.atheros_firmware
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -4028,6 +4182,7 @@
+#  File: ar3k/30101coex/RamPatch.txt
+#  
+#  License: Redistributable. See LICENCE.atheros_firmware for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.atheros_firmware
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -4036,6 +4191,7 @@
+#  File: dvb-usb-terratec-h5-drxk.fw
+#  
+#  Licence: Redistributable. See LICENSE.drxk for details.
+# +SPDX-License-Identifier: LicenseRef-LICENSE.drxk
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -4049,6 +4205,7 @@
+#  File: ene-ub6250/ms_rdwr.bin
+#  
+#  Licence: Redistributable. See LICENCE.ene_firmware for details.
+# +SPDX-License-Identifier: ISC
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -4058,6 +4215,7 @@
+#  Source: isci/
+#  
+#  Licence: GPLv2. See GPL-2.0 for details.
+# +SPDX-License-Identifier: GPL-2.0-only
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -4066,6 +4224,7 @@
+#  File: ar5523.bin
+#  
+#  Licence: Redistributable. See LICENCE.atheros_firmware for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.atheros_firmware
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -4079,6 +4238,7 @@
+#  File: s5p-mfc-v12.fw
+#  
+#  Licence: Redistributable. See LICENSE.s5p-mfc for details.
+# +SPDX-License-Identifier: LicenseRef-LICENSE.s5p-mfc
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -4091,6 +4251,7 @@
+#  Downloaded from http://linuxwireless.org/en/users/Drivers/carl9170
+#  
+#  Licence: GPLv2 or later. Some build scripts use the New BSD (3-clause) licence. See GPL-2.0 for details.
+# +SPDX-License-Identifier: GPL-2.0-or-later
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -4100,6 +4261,7 @@
+#  File: ctspeq.bin
+#  
+#  Licence: Redistributable. See LICENCE.ca0132 for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.ca0132
+#  
+#  Info: Found also in alsa-firmware package.
+#  
+# @@ -4206,7 +4368,7 @@
+#  Link: intel/ibt-0040-1050.ddc -> ibt-0040-0041.ddc
+#  Link: intel/ibt-1040-1050.sfi -> ibt-1040-0041.sfi
+#  Link: intel/ibt-1040-1050.ddc -> ibt-1040-0041.ddc
+# -Version: BT_Solar_REL82122_23.50.26053.82122
+# +Version: BT_Solar_REL82200_23.50.26292.82200
+#  
+#  File: intel/ibt-0040-1020.sfi
+#  File: intel/ibt-0040-1020.ddc
+# @@ -4224,13 +4386,15 @@
+#  File: intel/ibt-0093-4150.ddc
+#  File: intel/ibt-0093-1050.sfi
+#  File: intel/ibt-0093-1050.ddc
+# -Version: BT_BlazaruHrpGfp_S_REL308_24.00.26134.308
+# +Version: BT_BlazaruHrpGfp_S_REL405_24.00.26304.405
+#  
+#  File: intel/ibt-0291-0291.sfi
+#  File: intel/ibt-0291-0291.ddc
+# +Version: BT_BlazarU_S_REL125585_24.80.26362.125585
+# +
+#  File: intel/ibt-0093-0291.sfi
+#  File: intel/ibt-0093-0291.ddc
+# -Version: BT_BlazarU_S_REL120611_24.70.26293.120611
+# +Version: BT_BlazaruFmpArl_S_REL58_24.70.26333.58
+#  
+#  File: intel/ibt-0180-0041.sfi
+#  File: intel/ibt-0180-0041.ddc
+# @@ -4238,7 +4402,7 @@
+#  File: intel/ibt-0180-4150.ddc
+#  File: intel/ibt-0180-1050.sfi
+#  File: intel/ibt-0180-1050.ddc
+# -Version: BT_Magnetar_REL103882_23.50.25205.103882
+# +Version: BT_Magnetar_REL104027_23.50.26292.104027
+#  
+#  File: intel/ibt-0190-0291.sfi
+#  File: intel/ibt-0190-0291.ddc
+# @@ -4255,19 +4419,19 @@
+#  File: intel/ibt-1190-0041-pci.sfi
+#  File: intel/ibt-1190-0041-usb.sfi
+#  File: intel/ibt-1190-0041-usb.ddc
+# -Version: BT_BlazariGfp_S_REL244_24.00.26134.244
+# +Version: BT_BlazariGfp_S_REL349_24.00.26304.349
+#  
+#  File: intel/ibt-0190-0291-iml.sfi
+#  File: intel/ibt-0190-0291-usb.ddc
+#  File: intel/ibt-0190-0291-usb.sfi
+#  File: intel/ibt-0190-0291-pci.ddc
+#  File: intel/ibt-0190-0291-pci.sfi
+# -Version: BT_BlazarI_S_REL125325_24.60.26262.125325
+# +Version: BT_BlazariFmp_S_REL62_24.70.26333.62
+#  
+#  File: intel/ibt-1190-01a1-iml.sfi
+#  File: intel/ibt-1190-01a1-pci.ddc
+#  File: intel/ibt-1190-01a1-pci.sfi
+# -Version: BT_BlazarI_S_REL127988_24.70.26293.127988
+# +Version: BT_BlazarI_S_REL132931_24.80.26362.132931
+#  
+#  File: intel/ibt-00a0-01a1-iml.sfi
+#  File: intel/ibt-00a0-01a1-pci.ddc
+# @@ -4275,14 +4439,15 @@
+#  File: intel/ibt-00a0-0291-iml.sfi
+#  File: intel/ibt-00a0-0291-pci.ddc
+#  File: intel/ibt-00a0-0291-pci.sfi
+# -Version: BT_Scorpius_S_REL96982_24.70.26293.96982
+# +Version: BT_Scorpius_S_REL102163_24.80.26362.102163
+#  
+#  File: intel/ibt-00a0-0041-iml.sfi
+#  File: intel/ibt-00a0-0041-pci.ddc
+#  File: intel/ibt-00a0-0041-pci.sfi
+# -Version: BT_ScorpiusGfp_S_REL291_24.00.26134.291
+# +Version: BT_ScorpiusGfp_S_REL384_24.00.26304.384
+#  
+#  Licence: Redistributable. See LICENCE.ibt_firmware for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.ibt_firmware
+#  
+#  File: rtl_bt/rtl8192ee_fw.bin
+#  File: rtl_bt/rtl8192eu_fw.bin
+# @@ -4333,6 +4498,7 @@
+#  File: rtl_bt/rtl8922au_config.bin
+#  
+#  Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.rtlwifi_firmware.txt
+#  
+#  Info:
+#  Found in vendor driver, linux_bt_usb_2.11.20140423_8723be.rar
+# @@ -4348,6 +4514,7 @@
+#  Link: mt7650.bin -> mediatek/mt7650.bin
+#  
+#  Licence: Redistributable. See LICENCE.ralink_a_mediatek_company_firmware for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.ralink_a_mediatek_company_firmware
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -4356,6 +4523,7 @@
+#  File: rp2.fw
+#  
+#  Licence: Redistributable. See LICENSE.rp2 for details.
+# +SPDX-License-Identifier: LicenseRef-LICENSE.rp2
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -4367,6 +4535,7 @@
+#  Link: s2250_loader.fw -> go7007/s2250-1.fw
+#  
+#  Licence: Redistributable. See LICENCE.sensoray for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.sensoray
+#  
+#  File: go7007/go7007fw.bin
+#  File: go7007/go7007tv.bin
+# @@ -4376,6 +4545,7 @@
+#  File: go7007/wis-startrek.fw
+#  
+#  Licence: Redistributable. See LICENCE.go7007 for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.go7007
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -4396,6 +4566,7 @@
+#  File: amd/README.md
+#  
+#  License: Redistributable. See LICENSE.amd-sev for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.amd-sev
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -4416,6 +4587,7 @@
+#  File: amd-ucode/README
+#  
+#  License: Redistributable. See LICENSE.amd-ucode for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.amd-ucode
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -4428,6 +4600,7 @@
+#  File: moxa/moxa-1151.fw
+#  
+#  License: Redistributable. See LICENCE.moxa for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.moxa
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -4448,6 +4621,7 @@
+#  Version: v2.0.3
+#  
+#  License: Redistributable. See LICENCE.moxa for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.moxa
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -4456,10 +4630,12 @@
+#  File: wsm_22.bin
+#  Version: WSM395
+#  Licence: Redistributable. See LICENCE.cw1200 for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.cw1200
+#  
+#  File: sdd_sagrad_1091_1098.bin
+#  
+#  License: Redistributable. See LICENCE.cw1200-sdd for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.cw1200-sdd
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -4470,6 +4646,7 @@
+#  File: ct2fw-3.2.5.1.bin
+#  
+#  Licence: Redistributable. See LICENSE.bfa for details.
+# +SPDX-License-Identifier: LicenseRef-LICENSE.bfa
+#  
+#  --------------------------------------------------------------------------
+#  Driver: qat - Intel(R) QAT crypto accelerator
+# @@ -4505,6 +4682,7 @@
+#  Link: qat_420xx_mmp.bin -> intel/qat/qat_420xx_mmp.bin
+#  
+#  Licence: Redistributable. See LICENCE.qat_firmware for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.qat_firmware
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -4528,6 +4706,7 @@
+#  Version: 1.0.5b
+#  
+#  Licence: Redistributable. See LICENSE.rsi for details.
+# +SPDX-License-Identifier: LicenseRef-LICENSE.rsi
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -4538,6 +4717,7 @@
+#  File: r8a779x_usb3_v3.dlmem
+#  
+#  Licence: Redistributable. See LICENCE.r8a779x_usb3 for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.r8a779x_usb3
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -4546,6 +4726,7 @@
+#  File: intel/fw_sst_0f28.bin-48kHz_i2s_master
+#  
+#  License: Redistributable. See LICENCE.fw_sst_0f28 for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.fw_sst_0f28
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -4555,6 +4736,7 @@
+#  File: as102_data2_st.hex
+#  
+#  License: Redistributable. See LICENCE.Abilis for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.Abilis
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -4564,6 +4746,7 @@
+#  File: dvb-usb-it9135-02.fw
+#  
+#  Licence: Redistributable. See LICENCE.it913x for details
+# +SPDX-License-Identifier: ISC
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -4574,6 +4757,7 @@
+#  Link: intel/IntcSST2.bin -> catpt/bdw/dsp_basefw.bin
+#  
+#  License: Redistributable. See LICENCE.IntcSST2 for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.IntcSST2
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -4595,6 +4779,7 @@
+#  Version: 10.28.00.12823
+#  
+#  License: Redistributable. See LICENCE.adsp_sst for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.adsp_sst
+#  
+#  File: intel/avs/da7219-tplg.bin
+#  File: intel/avs/dmic-tplg.bin
+# @@ -4615,6 +4800,7 @@
+#  File: intel/avs/ssm4567-tplg.bin
+#  
+#  License: Apache-2.0. See Apache-2.0 for details.
+# +SPDX-License-Identifier: Apache-2.0
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -4624,6 +4810,7 @@
+#  File: intel/fw_sst_0f28_ssp0.bin
+#  
+#  License: Redistributable. See LICENCE.fw_sst_0f28 for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.fw_sst_0f28
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -4633,6 +4820,7 @@
+#  Version: 01.0B.02.02
+#  
+#  License: Redistributable. See LICENCE.fw_sst_0f28 for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.fw_sst_0f28
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -4644,6 +4832,7 @@
+#  Version: 9.21.00.3402_161
+#  
+#  License: Redistributable. See LICENCE.adsp_sst for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.adsp_sst
+#  
+#  File: intel/dsp_fw_bxtn_v2219.bin
+#  Version: 9.22.01.2219_64
+# @@ -4651,6 +4840,7 @@
+#  Version: 9.22.01.3366_157
+#  
+#  License: Redistributable. See LICENCE.adsp_sst for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.adsp_sst
+#  
+#  File: intel/dsp_fw_kbl_v701.bin
+#  Version: 9.21.00.701
+# @@ -4668,6 +4858,7 @@
+#  Version: 9.21.00.3402_161
+#  
+#  License: Redistributable. See LICENCE.adsp_sst for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.adsp_sst
+#  
+#  File: intel/dsp_fw_glk_v1814.bin
+#  Version: 9.92.01.1814
+# @@ -4684,6 +4875,7 @@
+#  Version: 10.23.00.1858
+#  
+#  License: Redistributable. See LICENCE.adsp_sst for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.adsp_sst
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -4704,6 +4896,7 @@
+#  File: tdmb_nova_12mhz.inp
+#  
+#  Licence: Redistributable. See LICENCE.siano for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.siano
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -4719,26 +4912,106 @@
+#  Version: v55.15
+#  
+#  File: nvidia/tegra194/xusb.bin
+# -Version: v60.06
+# +Version: l4t-r35.6.5
+#  
+#  Licence: Redistributable. See LICENCE.nvidia for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.nvidia
+#  
+#  --------------------------------------------------------------------------
+#  
+#  Driver: tegra-vic - NVIDIA Tegra VIC driver
+#  
+#  File: nvidia/tegra124/vic03_ucode.bin
+# +Version: l4t-r21.8.0
+#  Link: nvidia/tegra124/vic.bin -> vic03_ucode.bin
+#  
+#  File: nvidia/tegra210/vic04_ucode.bin
+# +Version: l4t-r32.7.6
+#  Link: nvidia/tegra210/vic.bin -> vic04_ucode.bin
+#  
+#  File: nvidia/tegra186/vic04_ucode.bin
+# +Version: l4t-r32.7.6
+#  Link: nvidia/tegra186/vic.bin -> vic04_ucode.bin
+#  
+#  File: nvidia/tegra194/vic.bin
+# +Version: l4t-r35.6.5
+# +
+# +File: nvidia/tegra234/vic.bin
+# +Version: l4t-r39.2.1
+# +
+# +File: nvidia/tegra264/vic.bin
+# +File: nvidia/tegra264/vic.bin.desc
+# +Version: l4t-r39.2.1
+#  
+#  Licence: Redistributable. See LICENCE.nvidia for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.nvidia
+# +
+# +--------------------------------------------------------------------------
+# +
+# +Driver: tegra-nvenc - NVIDIA Tegra NVENC driver
+# +
+# +File: nvidia/tegra124/nvenc.bin
+# +Version: l4t-r21.8.0
+# +
+# +File: nvidia/tegra210/nvenc.bin
+# +Version: l4t-r32.7.6
+# +
+# +File: nvidia/tegra186/nvenc.bin
+# +Version: l4t-r32.7.6
+# +
+# +File: nvidia/tegra194/nvenc.bin
+# +Version: l4t-r35.6.5
+# +
+# +File: nvidia/tegra234/nvenc.bin
+# +Version: l4t-r39.2.1
+# +
+# +Licence: Redistributable. See LICENCE.nvidia for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.nvidia
+# +
+# +--------------------------------------------------------------------------
+# +
+# +Driver: tegra-nvdec - NVIDIA Tegra NVDEC driver
+# +
+# +File: nvidia/tegra210/nvdec.bin
+# +Version: l4t-r32.7.6
+# +
+# +File: nvidia/tegra186/nvdec.bin
+# +Version: l4t-r32.7.6
+# +
+# +File: nvidia/tegra194/nvdec.bin
+# +Version: l4t-r35.6.5
+# +
+# +Licence: Redistributable. See LICENCE.nvidia for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.nvidia
+# +
+# +--------------------------------------------------------------------------
+# +
+# +Driver: tegra-nvjpg - NVIDIA Tegra NVJPG driver
+# +
+# +File: nvidia/tegra210/nvjpg.bin
+# +Version: l4t-r32.7.6
+# +
+# +File: nvidia/tegra186/nvjpg.bin
+# +Version: l4t-r32.7.6
+# +
+# +File: nvidia/tegra194/nvjpg.bin
+# +Version: l4t-r35.6.5
+# +
+# +File: nvidia/tegra234/nvjpg.bin
+# +Version: l4t-r39.2.1
+# +
+# +Licence: Redistributable. See LICENCE.nvidia for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.nvidia
+# +
+# +--------------------------------------------------------------------------
+# +
+# +Driver: tegra-ofa - NVIDIA Tegra OFA driver
+# +
+# +File: nvidia/tegra234/ofa.bin
+# +Version: l4t-r39.2.1
+# +
+# +Licence: Redistributable. See LICENCE.nvidia for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.nvidia
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -4753,22 +5026,27 @@
+#  Info: atusb/ChangeLog
+#  
+#  Licence: GPLv2 or later. See GPL-2.0 for details.
+# +SPDX-License-Identifier: GPL-2.0-or-later
+#  
+#  --------------------------------------------------------------------------
+#  
+#  Driver: btqca - Qualcomm Atheros Bluetooth support for QCA61x4 USB chips
+#  
+# +File: qca/rampatch_usb_00000200.bin
+# +File: qca/nvm_usb_00000200.bin
+# +
+# +File: qca/rampatch_usb_00000201.bin
+#  File: qca/nvm_usb_00000201.bin
+# -File: qca/nvm_usb_00000200.bin
+# -File: qca/nvm_usb_00000300.bin
+# -File: qca/nvm_usb_00000302.bin
+# -File: qca/rampatch_usb_00000200.bin
+# -File: qca/rampatch_usb_00000201.bin
+# +
+#  File: qca/rampatch_usb_00000300.bin
+#  Version: BTFM.RM.2.2.c3-00031-QCABTFMSWP-1
+# +File: qca/nvm_usb_00000300.bin
+# +
+#  File: qca/rampatch_usb_00000302.bin
+#  Version: BTFM.RM.4.4.1-00028-QCABTFMSWP-1
+# +File: qca/nvm_usb_00000302.bin
+#  File: qca/nvm_usb_00000302_eu.bin
+# +
+#  File: qca/rampatch_usb_00130200.bin
+#  Version: BTFW.HSP.2.0.0-00609-USB_PATCHZ-1
+#  File: qca/nvm_usb_00130200.bin
+# @@ -4778,29 +5056,24 @@
+#  File: qca/nvm_usb_00130200_0107.bin
+#  File: qca/nvm_usb_00130200_0109.bin
+#  File: qca/nvm_usb_00130200_0110.bin
+# +
+#  File: qca/rampatch_usb_00130201.bin
+#  Version: BTFW.HSP.2.1.0-00669-USB_UART_PATCHZ-1
+#  File: qca/nvm_usb_00130201.bin
+# -Version: BTFW.HSP.2.1.0-00669-USB_UART_PATCHZ-1
+#  File: qca/nvm_usb_00130201_010a.bin
+# -Version: BTFW.HSP.2.1.0-00669-USB_UART_PATCHZ-1
+#  File: qca/nvm_usb_00130201_010b.bin
+# -Version: BTFW.HSP.2.1.0-00669-USB_UART_PATCHZ-1
+#  File: qca/nvm_usb_00130201_0303.bin
+# -Version: BTFW.HSP.2.1.0-00669-USB_UART_PATCHZ-1
+#  File: qca/nvm_usb_00130201_gf.bin
+# -Version: BTFW.HSP.2.1.0-00669-USB_UART_PATCHZ-1
+#  File: qca/nvm_usb_00130201_gf_010a.bin
+# -Version: BTFW.HSP.2.1.0-00669-USB_UART_PATCHZ-1
+#  File: qca/nvm_usb_00130201_gf_010b.bin
+# -Version: BTFW.HSP.2.1.0-00669-USB_UART_PATCHZ-1
+#  File: qca/nvm_usb_00130201_gf_0303.bin
+# -Version: BTFW.HSP.2.1.0-00669-USB_UART_PATCHZ-1
+# -File: qca/rampatch_usb_00190200.bin
+# +
+#  File: qca/QCA2066/rampatch_usb_00130201.bin
+# -Version: BTFW.HSP.2.1.0-00653-VER_PATCHZ-3
+# +Version: BTFW.HSP.2.1.0-00680-VER_PATCHZ-1
+#  File: qca/QCA2066/nvm_usb_00130201_030a.bin
+#  File: qca/QCA2066/nvm_usb_00130201_gf_030a.bin
+# +
+# +File: qca/rampatch_usb_00190200.bin
+#  Version: BTFW.HAMILTON.2.0.0-00799-USB_PATCHZ-5
+#  File: qca/nvm_usb_00190200.bin
+#  File: qca/nvm_usb_00190200_0104.bin
+# @@ -4815,6 +5088,7 @@
+#  File: qca/nvm_usb_00190200_0112.bin
+#  
+#  Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k and NOTICE.qca for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.QualcommAtheros_ath10k
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -4836,6 +5110,7 @@
+#  File: qca/nvm_00440302_i2s_eu.bin
+#  
+#  Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k and NOTICE.qca for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.QualcommAtheros_ath10k
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -4849,19 +5124,21 @@
+#  Version: BTFW.ORNE.1.0.1-00155-PATCH-1
+#  
+#  Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k and NOTICE.qca for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.QualcommAtheros_ath10k
+#  
+#  --------------------------------------------------------------------------
+#  
+#  Driver: btqca - Qualcomm Atheros Bluetooth support for QCA_QCC2072 chip
+#  
+#  File: qca/ornbtfw11.tlv
+# -Version: BTFW.ORNE.1.1.0-00340-PATCH-1
+# +Version: BTFW.ORNE.1.1.0-00355-PATCH-1
+#  File: qca/ornnv11.bin
+# -Version: BTFW.ORNE.1.1.0-00340-PATCH-1
+# +Version: BTFW.ORNE.1.1.0-00355-PATCH-1
+#  File: qca/ornbcscal11.bin
+# -Version: BTFW.ORNE.1.1.0-00340-PATCH-1
+# +Version: BTFW.ORNE.1.1.0-00355-PATCH-1
+#  
+#  Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k and NOTICE.qca for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.QualcommAtheros_ath10k
+#  
+#  -------------------------------------------------------------------------
+#  
+# @@ -4877,6 +5154,7 @@
+#  File: qca/cmnv13t.bin
+#  
+#  Licence: Redistributable. See LICENSE.qcom and NOTICE.qca for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.qcom
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -4890,6 +5168,7 @@
+#  File: qca/apnv11.bin
+#  
+#  Licence: Redistributable. See LICENSE.qcom and NOTICE.qca for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.qcom
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -4904,6 +5183,7 @@
+#  File: qca/crnv32u.bin
+#  
+#  Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k and NOTICE.qca for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.QualcommAtheros_ath10k
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -4921,6 +5201,7 @@
+#  Version: BTFW.MOSELLE.1.1.3-00106-MSL_PATCHZ-1
+#  
+#  Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k and NOTICE.qca for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.QualcommAtheros_ath10k
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -4952,12 +5233,14 @@
+#  File: qca/wcnhpnv21g.bb8
+#  File: qca/wcnhpnv21g.b10c
+#  File: qca/wcnhpnv21g.b111
+# +
+#  File: qca/wcnhpbtfw10.tlv
+#  Version: BTFM.HSP.1.0.0-00978-QCAHSPROMZ-2
+#  File: qca/wcnhpnv10.bin
+#  File: qca/wcnhpnv10.b06
+#  
+#  Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k and NOTICE.qca for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.QualcommAtheros_ath10k
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -4975,7 +5258,7 @@
+#  File: qca/hpnv21g.309
+#  File: qca/hpnv21.30a
+#  File: qca/hpnv21g.30a
+# -Link: qca/hpnv21g.30c -> hpnv21g.b111
+# +File: qca/hpnv21g.30c
+#  File: qca/hpnv21.b8c
+#  File: qca/hpnv21.b9f
+#  File: qca/hpnv21.ba0
+# @@ -5000,6 +5283,7 @@
+#  File: qca/hpnv21g.b111
+#  
+#  Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k and NOTICE.qca for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.QualcommAtheros_ath10k
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -5010,6 +5294,7 @@
+#  File: qca/htnv20.bin
+#  
+#  Licence: Redistributable. See LICENSE.qcom and NOTICE.qca for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.qcom
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -5024,18 +5309,20 @@
+#  File: qca/hmtnv20.bin
+#  
+#  Licence: Redistributable. See LICENSE.qcom and NOTICE.qca for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.qcom
+#  
+#  ---------------------------------------------------------------------------
+#  
+#  Driver: qca - Qualcomm Atheros Bluetooth support for QCA6698AQ chips
+#  
+#  File: qca/QCA6698/hpbtfw21.tlv
+# -Version: BTFW.HSP.2.1.2-00072-PATCHZ-2
+# +Version: BTFW.HSP.2.1.2-00079-PATCH-1
+#  File: qca/QCA6698/hpnv21.b206
+#  File: qca/QCA6698/hpnv21.b207
+#  File: qca/QCA6698/hpnv21.bin
+#  
+#  Licence: Redistributable. See LICENSE.qcom and NOTICE.qca for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.qcom
+#  
+#  -------------------------------------------------------------------------
+#  
+# @@ -5054,6 +5341,7 @@
+#  Version: v1.7.2
+#  
+#  Licence: Redistributable. See LICENCE.cavium_liquidio for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.cavium_liquidio
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -5066,6 +5354,7 @@
+#  Version: v10
+#  
+#  Licence: Redistributable. See LICENCE.cavium for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.cavium
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -5450,6 +5739,7 @@
+#  Version: DMC API/APB ver 2 release 37 for Xe3p_LPD
+#  
+#  License: Redistributable. See LICENSE.i915 for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.i915
+#  --------------------------------------------------------------------------
+#  
+#  Driver: xe - Intel Graphics driver
+# @@ -5485,6 +5775,7 @@
+#  Version: GuC API/APB ver 70.72.1 for Novalake S
+#  
+#  License: Redistributable. See LICENSE.xe for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.xe
+#  --------------------------------------------------------------------------
+#  
+#  Driver: nouveau - NVIDIA GPU driver
+# @@ -5985,6 +6276,7 @@
+#  Link: nvidia/gb207 -> gb202
+#  
+#  Licence: Redistributable. See LICENCE.nvidia for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.nvidia
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -5999,6 +6291,7 @@
+#  Version: 16.1.2
+#  
+#  License: Redistributable. See LICENSE.atmel for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.atmel
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -6014,6 +6307,7 @@
+#  Version: 0x10130001
+#  
+#  Licence: Redistributable. See LICENSE.hfi1_firmware for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.hfi1_firmware
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -6022,6 +6316,7 @@
+#  File: ti-keystone/ks2_qmss_pdsp_acc48_k2_le_1_0_0_9.bin
+#  
+#  Licence: Redistributable. See LICENCE.ti-keystone for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.ti-keystone
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -6034,6 +6329,7 @@
+#  Version: 8.2.0.10
+#  
+#  Licence: Redistributable. See LICENCE.Marvell for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.Marvell
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -6043,6 +6339,7 @@
+#  File: mediatek/mt8173/vpu_p.bin
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.mediatek
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -6052,6 +6349,7 @@
+#  Version: v1.0.0
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.mediatek
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -6072,6 +6370,7 @@
+#  Version: v1.0.0
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.mediatek
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -6086,6 +6385,7 @@
+#  # Version: 7663e2ccn04-2006030247
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.mediatek
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -6095,6 +6395,17 @@
+#  Version: 3.1
+#  
+#  Licence: Redistributable. See LICENCE.rockchip for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.rockchip
+# +
+# +--------------------------------------------------------------------------
+# +
+# +Driver: phy-rockchip-snps-pcie3 - ROCKCHIP PCIe3 PHY firmware
+# +
+# +File: rockchip/pcie3-t22-c8g2-1.6.3-202a-p7.fw
+# +Version: 1.6.3
+# +
+# +Licence: Redistributable. See LICENCE.rockchip for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.rockchip
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -6107,6 +6418,7 @@
+#  Version: 1.0.07-b370
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.mediatek
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -6121,6 +6433,7 @@
+#  Link: mt7662_rom_patch.bin -> mediatek/mt7662_rom_patch.bin
+#  
+#  Licence: Redistributable. See LICENCE.ralink_a_mediatek_company_firmware for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.ralink_a_mediatek_company_firmware
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -6133,6 +6446,7 @@
+#  Version: 0.0.2_P48
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.mediatek
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -6146,6 +6460,7 @@
+#  Version: 20190114
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.mediatek
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -6157,6 +6472,7 @@
+#  Version: 20190114
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.mediatek
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -6173,6 +6489,7 @@
+#  Version: 7663mp1827-20190914043434
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.mediatek
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -6227,6 +6544,7 @@
+#  Version: 20260515
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.mediatek
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -6238,6 +6556,7 @@
+#  Version: 20251212032127
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.mediatek
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -6247,6 +6566,7 @@
+#  Version: 20250826211444
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.mediatek
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -6258,6 +6578,7 @@
+#  Version: 20260224110939
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.mediatek
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -6267,6 +6588,7 @@
+#  Version: 20260224111231
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.mediatek
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -6278,6 +6600,7 @@
+#  Version: 20260224110949
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.mediatek
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -6287,6 +6610,7 @@
+#  Version: 20260224111243
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.mediatek
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -6298,6 +6622,7 @@
+#  Version: 20260724143402
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.mediatek
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -6307,6 +6632,7 @@
+#  Version: 20260724143815
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.mediatek
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -6318,6 +6644,7 @@
+#  Version: 20260813113118
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.mediatek
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -6327,6 +6654,7 @@
+#  Version: 20260813113236
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.mediatek
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -6338,6 +6666,7 @@
+#  Version: 20260414134255
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.mediatek
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -6351,6 +6680,7 @@
+#  Version: 20250822
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.mediatek
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -6426,6 +6756,7 @@
+#  Version: 20240906
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.mediatek
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -6446,6 +6777,7 @@
+#  Version: 20230218204316
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.mediatek
+#  
+#  --------------------------------------------------------------------------
+#  Driver: nfp - Netronome Flow Processor
+# @@ -6539,6 +6871,7 @@
+#  
+#  
+#  Licence: Redistributable. See LICENCE.Netronome for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.Netronome
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -6549,6 +6882,7 @@
+#  Version: 5.2.0.18
+#  
+#  Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.QualcommAtheros_ath10k
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -6590,6 +6924,7 @@
+#  Version: VIDEO.VPU.1.0-00119
+#  
+#  Licence: Redistributable. See LICENSE.qcom and NOTICE.qcom for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.qcom
+#  
+#  Binary files supplied originally from
+#  https://developer.qualcomm.com/hardware/dragonboard-410c/tools
+# @@ -6654,7 +6989,16 @@
+#  
+#  Version: VIDEO.VPU.4.0-0045
+#  
+# +File: qcom/vpu/vpu40_p1_s8.mbn
+# +
+# +Version: VIDEO.VPU.5.0-0039
+# +
+# +File: qcom/vpu/vpu50_p2_s8.mbn
+# +
+# +Version: VIDEO.VPU.5.0-0039
+# +
+#  Licence: Redistributable. See LICENSE.qcom and NOTICE.qcom for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.qcom
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -6666,6 +7010,7 @@
+#  Version: 4.2
+#  
+#  Licence: Redistributable. See LICENSE.sdma_firmware for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.sdma_firmware
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -6689,10 +7034,12 @@
+#  File: qcom/a530v3_gpmu.fw2
+#  Version v2.04 (2015-08-31)
+#  File: qcom/apq8096/a530_zap.mbn
+# +Version: v0.09
+#  Link: qcom/a530_zap.mdt -> apq8096/a530_zap.mbn
+#  File: qcom/qrb4210/a610_zap.mbn
+# +Version: v0.20
+#  File: qcom/qcs615/a612_zap.mbn
+# -Version: v0.19
+# +Version: v0.21
+#  File: qcom/a612_rgmu.bin
+#  Version: v2.11
+#  File: qcom/a623_gmu.bin
+# @@ -6703,6 +7050,7 @@
+#  File: qcom/a630_sqe.fw
+#  Version: v2.07
+#  File: qcom/sdm845/a630_zap.mbn
+# +Version: v0.19
+#  File: qcom/a640_gmu.bin
+#  Version: v1.05
+#  File: qcom/sm8150/a640_zap.mbn
+# @@ -6712,8 +7060,9 @@
+#  File: qcom/a650_sqe.fw
+#  Version: v1.12
+#  File: qcom/sm8250/a650_zap.mbn
+# +Version: v0.10
+#  File: qcom/a660_gmu.bin
+# -Version: v3.01.0B
+# +Version: v3.01.0A
+#  File: qcom/a660_sqe.fw
+#  Version: v1.12
+#  File: qcom/qcm6490/a660_zap.mbn
+# @@ -6727,6 +7076,7 @@
+#  File: qcom/a702_sqe.fw
+#  Version: v0.49
+#  File: qcom/qcm2290/a702_zap.mbn
+# +Version: v0.05
+#  File: qcom/shikra/a704_zap.mbn
+#  Version: v0.05
+#  File: qcom/a730_sqe.fw
+# @@ -6764,7 +7114,7 @@
+#  File: qcom/gen71700_gmu.bin
+#  Version: v4.09.00
+#  File: qcom/gen71700_sqe.fw
+# -Version: v1.82
+# +Version: v1.79
+#  File: qcom/eliza/gen71700_zap.mbn
+#  Version: v0.15
+#  File: qcom/gen80000_aqe.fw
+# @@ -6791,8 +7141,19 @@
+#  Version: v1.00
+#  File: qcom/glymur/gen80100_zap.mbn
+#  Version: v0.03
+# +File: qcom/gen81100_aqe.fw
+# +Version: v0.36
+# +File: qcom/gen81100_gmu.bin
+# +Version: v5.06.17
+# +File: qcom/gen81100_sqe.fw
+# +Version: v1.09
+# +File: qcom/hawi/gen81100_zap.mbn
+# +Version: v0.05
+# +Link: qcom/gen81400_gmu.bin -> gen81100_gmu.bin
+# +Link: qcom/maili/gen81400_zap.mbn -> ../hawi/gen81100_zap.mbn
+#  
+#  Licence: Redistributable. See LICENSE.qcom and NOTICE.qcom for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.qcom
+#  
+#  Binary files supplied originally from
+#  https://developer.qualcomm.com/hardware/dragonboard-410c/tools
+# @@ -6817,6 +7178,7 @@
+#  File: qcom/yamato_pm4.fw
+#  
+#  Licence: Redistributable, BSD-3-Clause licence, See LICENSE.qcom_yamato for details
+# +SPDX-License-Identifier: BSD-3-Clause
+#  
+#  Info:
+#  Binary files generated from header files in EfikaMX kernel sources. A prefix of
+# @@ -6884,14 +7246,14 @@
+#  Version: CDSP.HT.2.5.c4-00004-KODIAK-1
+#  RawFile: qcom/qcs6490/radxa/dragon-q6a/cdspr.jsn
+#  File: qcom/qcs6490/Thundercomm/RubikPi3/adsp.mbn
+# -Version: ADSP.HT.5.5.c8-00217-KODIAK-1
+# +Version: ADSP.HT.5.5.c8-00249.1-KODIAK-1
+#  RawFile: qcom/qcs6490/Thundercomm/RubikPi3/adspr.jsn
+#  RawFile: qcom/qcs6490/Thundercomm/RubikPi3/adsps.jsn
+#  RawFile: qcom/qcs6490/Thundercomm/RubikPi3/adspua.jsn
+#  
+#  # qcom/qcs615
+#  File: qcom/qcs615/adsp.mbn
+# -Version: ADSP.VT.5.2.c6-00084.1-SM6150-1
+# +Version: ADSP.VT.5.2.c6-00095-SM6150-8
+#  RawFile: qcom/qcs615/adspr.jsn
+#  RawFile: qcom/qcs615/adsps.jsn
+#  RawFile: qcom/qcs615/adspua.jsn
+# @@ -6926,6 +7288,7 @@
+#  RawFile: qcom/sdm845/Thundercomm/db845c/slpir.jsn
+#  RawFile: qcom/sdm845/Thundercomm/db845c/slpius.jsn
+#  File: qcom/sdm845/SHIFT/axolotl/a630_zap.mbn
+# +Version: v0.20
+#  Info: Extracted from the SHIFT6mq's vendor partition
+#  
+#  # qcom/sm8250
+# @@ -6961,14 +7324,14 @@
+#  
+#  # Lenovo T14s
+#  File: qcom/x1e80100/LENOVO/21N1/qcvss8380.mbn
+# -Version: vfw-3.1:rel0085-070fa3311d9ef968015fee7fea07198d7eb208a1
+# +Version: VIDEO.VPU.3.1-0085
+#  RawFile: qcom/x1e80100/LENOVO/21N1/adspua.jsn
+#  File: qcom/x1e80100/cdsp.mbn
+#  File: qcom/x1e80100/cdsp_dtb.mbn
+#  Version: CDSP.HT.2.9.c1-00094-HAMOA-1
+#  RawFile: qcom/x1e80100/cdspr.jsn
+#  File: qcom/x1e80100/LENOVO/21N1/qcadsp8380.mbn
+# -Version: ADSP.HT.5.9-00787.2-HAMOA-1
+# +Version: ADSP.HT.5.9.c7-00004-HAMOA-1
+#  File: qcom/x1e80100/LENOVO/21N1/adsp_dtbs.elf
+#  RawFile: qcom/x1e80100/LENOVO/21N1/adspr.jsn
+#  File: qcom/x1e80100/LENOVO/21N1/cdsp_dtbs.elf
+# @@ -6995,6 +7358,7 @@
+#  Version: video-firmware.3.1-e5aea20c64cb6df9a1c9be99e206053b36424939
+#  
+#  Licence: Redistributable. See LICENSE.qcom and NOTICE.qcom for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.qcom
+#  
+#  Info:
+#  Binary files supplied originally from
+# @@ -7013,7 +7377,7 @@
+#  # qcom/glymur
+#  File: qcom/glymur/adsp.mbn
+#  File: qcom/glymur/adsp_dtb.mbn
+# -Version: LPAIDSP.HT.1.6.2-00020-GLYMUR-2
+# +Version: LPAIDSP.HT.1.6.2-00064-GLYMUR-1
+#  RawFile: qcom/glymur/adspr.jsn
+#  RawFile: qcom/glymur/adsps.jsn
+#  RawFile: qcom/glymur/adspua.jsn
+# @@ -7025,11 +7389,15 @@
+#  # qcom/hawi
+#  File: qcom/hawi/adsp.mbn
+#  File: qcom/hawi/adsp_dtb.mbn
+# -Version: LPAIDSP.HT.1.6-00701.4-HAWI-2
+# +Version: LPAIDSP.HT.1.6-00701.4-HAWI-3
+#  RawFile: qcom/hawi/adspr.jsn
+#  RawFile: qcom/hawi/adsps.jsn
+#  RawFile: qcom/hawi/adspua.jsn
+#  RawFile: qcom/hawi/adspuo.jsn
+# +File: qcom/hawi/cdsp.mbn
+# +File: qcom/hawi/cdsp_dtb.mbn
+# +Version: CDSP.HT.3.6-00501.6-HAWI-1
+# +RawFile: qcom/hawi/cdspr.jsn
+#  
+#  # qcom/kaanapali
+#  File: qcom/kaanapali/adsp.mbn
+# @@ -7065,7 +7433,7 @@
+#  Version: DSP.AT.1.0.1-00204-LEMANS-1
+#  RawFile: qcom/qcs8300/cdspr.jsn
+#  Link: qcom/qcs8300/gpdsp0.mbn -> ../sa8775p/gpdsp0.mbn
+# -Link: qcom/qcs8300/gpdspr.jsn -> ../sa8775p/gpdsp0.mbn
+# +Link: qcom/qcs8300/gpdspr.jsn -> ../sa8775p/gpdspr.jsn
+#  
+#  # qcom/sa8775p
+#  File: qcom/sa8775p/adsp.mbn
+# @@ -7090,7 +7458,7 @@
+#  File: qcom/nord/adsp1.mbn
+#  File: qcom/nord/adsp_dtb.mbn
+#  File: qcom/nord/adsp1_dtb.mbn
+# -Version: HPASS.AT.1.0.1-00003-NORD-1
+# +Version: HPASS.AT.1.0.1-00003-NORD-6
+#  RawFile: qcom/nord/adspr.jsn
+#  RawFile: qcom/nord/adspua.jsn
+#  RawFile: qcom/nord/adsp1r.jsn
+# @@ -7117,6 +7485,12 @@
+#  File: qcom/eliza/cdsp_dtb.mbn
+#  Version: CDSP.HT.3.1-00889-PAKALA-1
+#  RawFile: qcom/eliza/cdspr.jsn
+# +File: qcom/eliza/adsp.mbn
+# +File: qcom/eliza/adsp_dtb.mbn
+# +Version: LPAIDSP.HT.1.2.c2-00064-PAKALA-3
+# +RawFile: qcom/eliza/adspr.jsn
+# +RawFile: qcom/eliza/adsps.jsn
+# +RawFile: qcom/eliza/adspua.jsn
+#  
+#  # qcom/x1e80100
+#  File: qcom/x1e80100/adsp.mbn
+# @@ -7133,12 +7507,13 @@
+#  RawFile: qcom/shikra/cdspr.jsn
+#  File: qcom/shikra/lpaicp.mbn
+#  File: qcom/shikra/lpaicp_dtb.mbn
+# -Version: LPAICP.FW.1.2-00135-SHIKRA_LPAICP_PACK-1
+# +Version: LPAICP.FW.1.2-00155-SHIKRA_LPAICP_PACK-1
+#  RawFile: qcom/shikra/lpaicpr.jsn
+#  File: qcom/shikra/cqs/qdsp6sw.mbn
+# -Version: MPSS.JO.4.0-00194.2-SHIKRA_LWG_PACK-1
+# +Version: MPSS.JO.4.0-00272-SHIKRA_LWG_PACK-2
+#  
+#  Licence: Redistributable. See LICENSE.qcom-2 and NOTICE.qcom for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.qcom-2
+#  
+#  # Dell XPS13
+#  File: qcom/x1e80100/dell/xps13-9345/adsp_dtbs.elf
+# @@ -7149,9 +7524,12 @@
+#  File: qcom/x1e80100/dell/xps13-9345/cdsp_dtbs.elf
+#  RawFile: qcom/x1e80100/dell/xps13-9345/cdspr.jsn
+#  File: qcom/x1e80100/dell/xps13-9345/qcadsp8380.mbn
+# +Version: ADSP.HT.5.9-00810-HAMOA-1
+#  File: qcom/x1e80100/dell/xps13-9345/qccdsp8380.mbn
+# +Version: CDSP.HT.2.9.c1-00046-HAMOA-1
+#  
+#  Licence: Redistributable. See LICENSE.dell and NOTICE.qcom for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.dell
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -7160,10 +7538,12 @@
+#  File: qcom/sdm845/mba.mbn
+#  Link: qcom/sdm845/SHIFT/axolotl/mba.mbn -> ../../mba.mbn
+#  File: qcom/sdm845/modem_nm.mbn
+# +Version: MPSS.AT.4.0.c2-01365-SDM845_GEN_PACK-1
+#  RawFile: qcom/sdm845/modemuw.jsn
+#  Link: qcom/sdm845/modem.mbn -> modem_nm.mbn
+#  
+#  Licence: Redistributable. See LICENSE.qcom and NOTICE.qcom for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.qcom
+#  
+#  Info:
+#  Binary files supplied originally from
+# @@ -7254,8 +7634,11 @@
+#  File: mellanox/mlxsw_spectrum4-34.2016.3900.mfa2
+#  
+#  Licence: Redistributable. See LICENSE.mellanox for details.
+# +SPDX-License-Identifier: LicenseRef-LICENSE.mellanox
+#  
+#  Copyright (c) 2017-2020 Mellanox Technologies, Ltd. All rights reserved.
+# +
+# +SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -7265,6 +7648,7 @@
+#  Version: 2.1.0
+#  
+#  Licence: Redistributable. See LICENCE.cadence for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.cadence
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -7287,6 +7671,7 @@
+#  File: dpaa2/mc/mc_10.28.1_lx2160a.itb
+#  
+#  Licence: Redistributable. See LICENSE.nxp_mc_firmware for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.nxp_mc_firmware
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -7296,6 +7681,7 @@
+#  File: microchip/mscc_vsc8584_revb_int8051_fb48.bin
+#  
+#  Licence: Redistributable. See LICENCE.microchip for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.microchip
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -7318,6 +7704,7 @@
+#  File: meson/vdec/sm1_vp9_mmu.bin
+#  
+#  Licence: Redistributable. See LICENSE.amlogic_vdec for details.
+# +SPDX-License-Identifier: LicenseRef-LICENSE.amlogic_vdec
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -7328,11 +7715,13 @@
+#  File: intel/ice/ddp-lag/ice_lag-1.3.2.0.pkg
+#  
+#  License: Redistributable. See LICENSE.ice for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.ice
+#  
+#  File: intel/ice/ddp-comms/ice_comms-1.3.55.0.pkg
+#  File: intel/ice/ddp-wireless_edge/ice_wireless_edge-1.3.23.0.pkg
+#  
+#  License: Redistributable. See LICENSE.ice_enhanced for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.ice_enhanced
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -7342,6 +7731,7 @@
+#  File: inside-secure/eip197_minifw/ifpp.bin
+#  
+#  Licence: Redistributable. See LICENCE.inside-secure for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.inside-secure
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -7354,6 +7744,7 @@
+#  File: mrvl/prestera/mvsw_prestera_fw_arm64-v4.1.img
+#  
+#  Licence: Redistributable. See LICENCE.Marvell for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.Marvell
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -7362,6 +7753,7 @@
+#  File: Lontium/lt7911exc_fw.bin
+#  
+#  License: Redistributable. See LICENSE.Lontium for details.
+# +SPDX-License-Identifier: LicenseRef-LICENSE.Lontium
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -7371,6 +7763,7 @@
+#  Link: lt8713sx_fw.bin -> Lontium/lt8713sx_fw.bin
+#  
+#  License: Redistributable. See LICENSE.Lontium for details.
+# +SPDX-License-Identifier: LicenseRef-LICENSE.Lontium
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -7379,6 +7772,7 @@
+#  File: Lontium/lt9611c_fw.bin
+#  
+#  License: Redistributable. See LICENSE.Lontium for details.
+# +SPDX-License-Identifier: LicenseRef-LICENSE.Lontium
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -7388,19 +7782,21 @@
+#  Link: lt9611uxc_fw.bin -> Lontium/lt9611uxc_fw.bin
+#  
+#  License: Redistributable. See LICENSE.Lontium for details.
+# +SPDX-License-Identifier: LicenseRef-LICENSE.Lontium
+#  
+#  --------------------------------------------------------------------------
+#  
+#  Driver: wfx - Silicon Labs Wi-Fi Transceiver
+#  
+#  File: wfx/wfm_wf200_C0.sec
+# -Version: 3.17
+# +Version: 3.18
+#  
+#  File: wfx/brd4001a.pds
+#  File: wfx/brd8022a.pds
+#  File: wfx/brd8023a.pds
+#  
+#  Licence: Redistributable. See LICENCE.wf200 for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.wf200
+#  
+#  Info:
+#  The firmware itself originates from https://github.com/SiliconLabs/wfx-firmware
+# @@ -7417,6 +7813,7 @@
+#  File: cnm/wave521c_k3_codec_fw.bin
+#  
+#  Licence: Redistributable. See LICENCE.cnm for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.cnm
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -7425,6 +7822,7 @@
+#  File: cnm/wave633c_imx9_codec_fw.bin
+#  
+#  Licence: Redistributable. See LICENCE.cnm for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.cnm
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -7445,6 +7843,7 @@
+#  Version: v1.21
+#  
+#  Licence: Redistributable. See LICENCE.Marvell for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.Marvell
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -7456,6 +7855,7 @@
+#  Version: 1.3.4
+#  
+#  Licence: Redistributable. See LICENSE.amphion_vpu for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.amphion_vpu
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -7807,6 +8207,15 @@
+#  File: cirrus/cs35l41-dsp1-spk-prot-17aa386e-spkid0-r0.bin
+#  File: cirrus/cs35l41-dsp1-spk-prot-17aa386e-spkid1-l0.bin
+#  File: cirrus/cs35l41-dsp1-spk-prot-17aa386e-spkid1-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-17aa3856.wmfw -> cs35l41/v6.47.0/halo_cspl_RAM_revB2_29.49.0.wmfw
+# +File: cirrus/cs35l41-dsp1-spk-prot-17aa3856-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-17aa3856-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-17aa3845.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-17aa3846.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +File: cirrus/cs35l41-dsp1-spk-prot-17aa3845-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-17aa3845-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-17aa3846-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-17aa3846-r0.bin
+#  File: cirrus/cs35l41/v6.63.0/halo_cspl_RAM_revB2_29.65.0.wmfw
+#  Link: cirrus/cs35l41-dsp1-spk-prot-104312af.wmfw -> cs35l41/v6.63.0/halo_cspl_RAM_revB2_29.65.0.wmfw
+#  File: cirrus/cs35l41-dsp1-spk-prot-104312af-spkid0-l0.bin
+# @@ -8476,6 +8885,7 @@
+#  File: cirrus/cs35l41-dsp1-spk-prot-10251844-r0.bin
+#  
+#  License: Redistributable. See LICENSE.cirrus for details.
+# +SPDX-License-Identifier: LicenseRef-LICENSE.cirrus
+#  
+#  Use of Cirrus Logic drivers, firmware and other materials is permitted
+#  only in connection with Cirrus Logic hardware products.
+# @@ -8506,9 +8916,11 @@
+#  File: cirrus/cs35l56/CS35L56_Rev4.5.9.wmfw
+#  File: cirrus/cs35l56/CS35L56_Rev4.7.0.wmfw
+#  File: cirrus/cs35l56/CS35L56_Rev4.7.2.wmfw
+# +File: cirrus/cs35l56/CS35L56_Rev4.7.9.wmfw
+#  File: cirrus/cs35l56/CS35L56_Rev4.7.12.wmfw
+#  File: cirrus/cs35l63/CS35L63_Rev2.5.4.wmfw
+#  File: cirrus/cs35l63/CS35L63_Rev2.5.7.wmfw
+# +File: cirrus/cs35l63/CS35L63_Rev2.5.11.wmfw
+#  Link: cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid0.wmfw -> cs35l56/CS35L56_Rev3.11.11.wmfw
+#  File: cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid0-amp1.bin
+#  File: cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid0-amp2.bin
+# @@ -9067,6 +9479,116 @@
+#  Link: cirrus/cs35l56-b0-dsp1-misc-10280e87-spkid1.wmfw -> cs35l56/CS35L56_Rev3.11.28.wmfw
+#  Link: cirrus/cs35l56-b0-dsp1-misc-10280e87-spkid1-l2u3.bin -> cs35l56-b0-dsp1-misc-10280d13-spkid1-amp2.bin
+#  Link: cirrus/cs35l56-b0-dsp1-misc-10280e87-spkid1-l3u1.bin -> cs35l56-b0-dsp1-misc-10280d13-spkid1-amp1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280edc-spkid0.wmfw -> cs35l63/CS35L63_Rev2.5.11.wmfw
+# +File: cirrus/cs35l63-a1-dsp1-misc-10280edc-spkid0-00-l3u1.bin
+# +File: cirrus/cs35l63-a1-dsp1-misc-10280edc-spkid0-00-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280edc-spkid0-01-l3u1.bin -> cs35l63-a1-dsp1-misc-10280edc-spkid0-00-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280edc-spkid0-01-l3u3.bin -> cs35l63-a1-dsp1-misc-10280edc-spkid0-00-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280edc-spkid1.wmfw -> cs35l63/CS35L63_Rev2.5.11.wmfw
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280edc-spkid1-00-l3u1.bin -> cs35l63-a1-dsp1-misc-10280edc-spkid0-00-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280edc-spkid1-00-l3u3.bin -> cs35l63-a1-dsp1-misc-10280edc-spkid0-00-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280edc-spkid1-01-l3u1.bin -> cs35l63-a1-dsp1-misc-10280edc-spkid0-00-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280edc-spkid1-01-l3u3.bin -> cs35l63-a1-dsp1-misc-10280edc-spkid0-00-l3u3.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-10280ee2-spkid1.wmfw -> cs35l56/CS35L56_Rev4.7.9.wmfw
+# +File: cirrus/cs35l57-b2-dsp1-misc-10280ee2-spkid1-l2u1.bin
+# +File: cirrus/cs35l57-b2-dsp1-misc-10280ee2-spkid1-l2u3.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-10280ee2-spkid2.wmfw -> cs35l56/CS35L56_Rev4.7.9.wmfw
+# +File: cirrus/cs35l57-b2-dsp1-misc-10280ee2-spkid2-l2u1.bin
+# +File: cirrus/cs35l57-b2-dsp1-misc-10280ee2-spkid2-l2u3.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-10280ee2-spkid3.wmfw -> cs35l56/CS35L56_Rev4.7.9.wmfw
+# +File: cirrus/cs35l57-b2-dsp1-misc-10280ee2-spkid3-l2u1.bin
+# +File: cirrus/cs35l57-b2-dsp1-misc-10280ee2-spkid3-l2u3.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-10280ee3-spkid1.wmfw -> cs35l56/CS35L56_Rev4.7.9.wmfw
+# +Link: cirrus/cs35l57-b2-dsp1-misc-10280ee3-spkid1-l2u1.bin -> cs35l57-b2-dsp1-misc-10280ee2-spkid1-l2u1.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-10280ee3-spkid1-l2u3.bin -> cs35l57-b2-dsp1-misc-10280ee2-spkid1-l2u3.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-10280ee3-spkid2.wmfw -> cs35l56/CS35L56_Rev4.7.9.wmfw
+# +Link: cirrus/cs35l57-b2-dsp1-misc-10280ee3-spkid2-l2u1.bin -> cs35l57-b2-dsp1-misc-10280ee2-spkid2-l2u1.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-10280ee3-spkid2-l2u3.bin -> cs35l57-b2-dsp1-misc-10280ee2-spkid2-l2u3.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-10280ee3-spkid3.wmfw -> cs35l56/CS35L56_Rev4.7.9.wmfw
+# +Link: cirrus/cs35l57-b2-dsp1-misc-10280ee3-spkid3-l2u1.bin -> cs35l57-b2-dsp1-misc-10280ee2-spkid3-l2u1.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-10280ee3-spkid3-l2u3.bin -> cs35l57-b2-dsp1-misc-10280ee2-spkid3-l2u3.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-10280ee4-spkid1.wmfw -> cs35l56/CS35L56_Rev4.7.9.wmfw
+# +File: cirrus/cs35l57-b2-dsp1-misc-10280ee4-spkid1-l2u1.bin
+# +File: cirrus/cs35l57-b2-dsp1-misc-10280ee4-spkid1-l2u3.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-10280ee4-spkid2.wmfw -> cs35l56/CS35L56_Rev4.7.9.wmfw
+# +File: cirrus/cs35l57-b2-dsp1-misc-10280ee4-spkid2-l2u1.bin
+# +File: cirrus/cs35l57-b2-dsp1-misc-10280ee4-spkid2-l2u3.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-10280ee4-spkid3.wmfw -> cs35l56/CS35L56_Rev4.7.9.wmfw
+# +File: cirrus/cs35l57-b2-dsp1-misc-10280ee4-spkid3-l2u1.bin
+# +File: cirrus/cs35l57-b2-dsp1-misc-10280ee4-spkid3-l2u3.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-10280ee5-spkid1.wmfw -> cs35l56/CS35L56_Rev4.7.9.wmfw
+# +Link: cirrus/cs35l57-b2-dsp1-misc-10280ee5-spkid1-l2u1.bin -> cs35l57-b2-dsp1-misc-10280ee4-spkid1-l2u1.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-10280ee5-spkid1-l2u3.bin -> cs35l57-b2-dsp1-misc-10280ee4-spkid1-l2u3.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-10280ee5-spkid2.wmfw -> cs35l56/CS35L56_Rev4.7.9.wmfw
+# +Link: cirrus/cs35l57-b2-dsp1-misc-10280ee5-spkid2-l2u1.bin -> cs35l57-b2-dsp1-misc-10280ee4-spkid2-l2u1.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-10280ee5-spkid2-l2u3.bin -> cs35l57-b2-dsp1-misc-10280ee4-spkid2-l2u3.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-10280ee5-spkid3.wmfw -> cs35l56/CS35L56_Rev4.7.9.wmfw
+# +Link: cirrus/cs35l57-b2-dsp1-misc-10280ee5-spkid3-l2u1.bin -> cs35l57-b2-dsp1-misc-10280ee4-spkid3-l2u1.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-10280ee5-spkid3-l2u3.bin -> cs35l57-b2-dsp1-misc-10280ee4-spkid3-l2u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eec-spkid0.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eec-spkid0-01-l3u1.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid0-01-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eec-spkid0-01-l3u3.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid0-01-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eec-spkid0-02-l3u1.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid0-01-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eec-spkid0-02-l3u3.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid0-01-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eec-spkid1.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eec-spkid1-01-l3u1.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid1-01-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eec-spkid1-01-l3u3.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid1-01-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eec-spkid1-02-l3u1.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid1-01-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eec-spkid1-02-l3u3.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid1-01-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eec-spkid2.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eec-spkid2-01-l3u1.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid2-01-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eec-spkid2-01-l3u3.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid2-01-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eec-spkid2-02-l3u1.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid2-01-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eec-spkid2-02-l3u3.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid2-01-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eec-spkid3.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eec-spkid3-01-l3u1.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid3-01-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eec-spkid3-01-l3u3.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid3-01-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eec-spkid3-02-l3u1.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid3-01-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eec-spkid3-02-l3u3.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid3-01-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eed-spkid0.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eed-spkid0-06-l3u1.bin -> cs35l63-a1-dsp1-misc-10280e1e-spkid0-06-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eed-spkid0-06-l3u3.bin -> cs35l63-a1-dsp1-misc-10280e1e-spkid0-06-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eed-spkid0-07-l3u1.bin -> cs35l63-a1-dsp1-misc-10280e1e-spkid0-06-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eed-spkid0-07-l3u3.bin -> cs35l63-a1-dsp1-misc-10280e1e-spkid0-06-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eed-spkid1.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eed-spkid1-06-l3u1.bin -> cs35l63-a1-dsp1-misc-10280e1e-spkid1-06-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eed-spkid1-06-l3u3.bin -> cs35l63-a1-dsp1-misc-10280e1e-spkid1-06-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eed-spkid1-07-l3u1.bin -> cs35l63-a1-dsp1-misc-10280e1e-spkid1-06-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eed-spkid1-07-l3u3.bin -> cs35l63-a1-dsp1-misc-10280e1e-spkid1-06-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eed-spkid2.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eed-spkid2-06-l3u1.bin -> cs35l63-a1-dsp1-misc-10280e1e-spkid2-06-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eed-spkid2-06-l3u3.bin -> cs35l63-a1-dsp1-misc-10280e1e-spkid2-06-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eed-spkid2-07-l3u1.bin -> cs35l63-a1-dsp1-misc-10280e1e-spkid2-06-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eed-spkid2-07-l3u3.bin -> cs35l63-a1-dsp1-misc-10280e1e-spkid2-06-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eed-spkid3.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eed-spkid3-06-l3u1.bin -> cs35l63-a1-dsp1-misc-10280e1e-spkid3-06-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eed-spkid3-06-l3u3.bin -> cs35l63-a1-dsp1-misc-10280e1e-spkid3-06-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eed-spkid3-07-l3u1.bin -> cs35l63-a1-dsp1-misc-10280e1e-spkid3-06-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eed-spkid3-07-l3u3.bin -> cs35l63-a1-dsp1-misc-10280e1e-spkid3-06-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eee-spkid0.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eee-spkid0-02-l3u1.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid0-01-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eee-spkid0-02-l3u3.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid0-01-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eee-spkid1.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eee-spkid1-02-l3u1.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid1-01-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eee-spkid1-02-l3u3.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid1-01-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eee-spkid2.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eee-spkid2-02-l3u1.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid2-01-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eee-spkid2-02-l3u3.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid2-01-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eee-spkid3.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eee-spkid3-02-l3u1.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid3-01-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eee-spkid3-02-l3u3.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid3-01-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eef-spkid0.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eef-spkid0-05-l3u1.bin -> cs35l63-a1-dsp1-misc-10280e1e-spkid0-06-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eef-spkid0-05-l3u3.bin -> cs35l63-a1-dsp1-misc-10280e1e-spkid0-06-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eef-spkid1.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eef-spkid1-05-l3u1.bin -> cs35l63-a1-dsp1-misc-10280e1e-spkid1-06-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eef-spkid1-05-l3u3.bin -> cs35l63-a1-dsp1-misc-10280e1e-spkid1-06-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eef-spkid2.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eef-spkid2-05-l3u1.bin -> cs35l63-a1-dsp1-misc-10280e1e-spkid2-06-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eef-spkid2-05-l3u3.bin -> cs35l63-a1-dsp1-misc-10280e1e-spkid2-06-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eef-spkid3.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eef-spkid3-05-l3u1.bin -> cs35l63-a1-dsp1-misc-10280e1e-spkid3-06-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280eef-spkid3-05-l3u3.bin -> cs35l63-a1-dsp1-misc-10280e1e-spkid3-06-l3u3.bin
+#  Link: cirrus/cs35l63-a1-dsp1-misc-10280efb-spkid0.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+#  Link: cirrus/cs35l63-a1-dsp1-misc-10280efb-spkid0-02-l1u1.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid0-01-l3u1.bin
+#  Link: cirrus/cs35l63-a1-dsp1-misc-10280efb-spkid0-02-l1u3.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid0-01-l3u3.bin
+# @@ -9091,6 +9613,42 @@
+#  Link: cirrus/cs35l63-a1-dsp1-misc-10280efc-spkid3.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+#  Link: cirrus/cs35l63-a1-dsp1-misc-10280efc-spkid3-05-l1u1.bin -> cs35l63-a1-dsp1-misc-10280e1e-spkid3-06-l3u1.bin
+#  Link: cirrus/cs35l63-a1-dsp1-misc-10280efc-spkid3-05-l1u3.bin -> cs35l63-a1-dsp1-misc-10280e1e-spkid3-06-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f01-spkid0.wmfw -> cs35l63/CS35L63_Rev2.5.11.wmfw
+# +File: cirrus/cs35l63-a1-dsp1-misc-10280f01-spkid0-00-l0u3.bin
+# +File: cirrus/cs35l63-a1-dsp1-misc-10280f01-spkid0-00-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f01-spkid1.wmfw -> cs35l63/CS35L63_Rev2.5.11.wmfw
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f01-spkid1-00-l0u3.bin -> cs35l63-a1-dsp1-misc-10280f01-spkid0-00-l0u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f01-spkid1-00-l3u1.bin -> cs35l63-a1-dsp1-misc-10280f01-spkid0-00-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f04-spkid0.wmfw -> cs35l63/CS35L63_Rev2.5.11.wmfw
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f04-spkid0-00-l0u3.bin -> cs35l63-a1-dsp1-misc-10280f01-spkid0-00-l0u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f04-spkid0-00-l3u1.bin -> cs35l63-a1-dsp1-misc-10280f01-spkid0-00-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f04-spkid1.wmfw -> cs35l63/CS35L63_Rev2.5.11.wmfw
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f04-spkid1-00-l0u3.bin -> cs35l63-a1-dsp1-misc-10280f01-spkid0-00-l0u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f04-spkid1-00-l3u1.bin -> cs35l63-a1-dsp1-misc-10280f01-spkid0-00-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f07-spkid0.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f07-spkid0-02-l3u1.bin -> cs35l63-a1-dsp1-misc-10280e1a-spkid0-02-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f07-spkid0-02-l3u3.bin -> cs35l63-a1-dsp1-misc-10280e1a-spkid0-02-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f07-spkid2.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f07-spkid2-01-l3u1.bin -> cs35l63-a1-dsp1-misc-10280e1a-spkid2-01-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f07-spkid2-01-l3u3.bin -> cs35l63-a1-dsp1-misc-10280e1a-spkid2-01-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f07-spkid3.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f07-spkid3-01-l3u1.bin -> cs35l63-a1-dsp1-misc-10280e1a-spkid3-01-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f07-spkid3-01-l3u3.bin -> cs35l63-a1-dsp1-misc-10280e1a-spkid3-01-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f07-spkid3-02-l3u1.bin -> cs35l63-a1-dsp1-misc-10280e1a-spkid3-02-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f07-spkid3-02-l3u3.bin -> cs35l63-a1-dsp1-misc-10280e1a-spkid3-02-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f08-spkid0.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f08-spkid0-03-l3u1.bin -> cs35l63-a1-dsp1-misc-10280e23-spkid0-03-l1u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f08-spkid0-03-l3u3.bin -> cs35l63-a1-dsp1-misc-10280e23-spkid0-03-l1u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f08-spkid0-04-l3u1.bin -> cs35l63-a1-dsp1-misc-10280e23-spkid0-04-l1u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f08-spkid0-04-l3u3.bin -> cs35l63-a1-dsp1-misc-10280e23-spkid0-04-l1u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f08-spkid2.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f08-spkid2-03-l3u1.bin -> cs35l63-a1-dsp1-misc-10280e23-spkid2-03-l1u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f08-spkid2-03-l3u3.bin -> cs35l63-a1-dsp1-misc-10280e23-spkid2-03-l1u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f08-spkid2-04-l3u1.bin -> cs35l63-a1-dsp1-misc-10280e23-spkid2-04-l1u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f08-spkid2-04-l3u3.bin -> cs35l63-a1-dsp1-misc-10280e23-spkid2-04-l1u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f08-spkid3.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f08-spkid3-04-l3u1.bin -> cs35l63-a1-dsp1-misc-10280e23-spkid3-04-l1u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f08-spkid3-04-l3u3.bin -> cs35l63-a1-dsp1-misc-10280e23-spkid3-04-l1u3.bin
+#  Link: cirrus/cs35l56-b0-dsp1-misc-103c8c52.wmfw -> cs35l56/CS35L56_Rev3.11.18.wmfw
+#  File: cirrus/cs35l56-b0-dsp1-misc-103c8c52-amp1.bin
+#  File: cirrus/cs35l56-b0-dsp1-misc-103c8c52-amp2.bin
+# @@ -9472,6 +10030,7 @@
+#  Link: cirrus/cs35l57-b2-dsp1-misc-17aa5159-spkid1-l2u4.bin -> cs35l57-b2-dsp1-misc-17aa5158-spkid1-l2u4.bin
+#  
+#  License: Redistributable. See LICENSE.cirrus for details.
+# +SPDX-License-Identifier: LicenseRef-LICENSE.cirrus
+#  
+#  Use of Cirrus Logic drivers, firmware and other materials is permitted
+#  only in connection with Cirrus Logic hardware products.
+# @@ -9486,6 +10045,7 @@
+#  File: cs42l43.bin
+#  
+#  License: Redistributable. See LICENSE.cirrus for details.
+# +SPDX-License-Identifier: LicenseRef-LICENSE.cirrus
+#  
+#  Use of Cirrus Logic drivers, firmware and other materials is permitted
+#  only in connection with Cirrus Logic hardware products.
+# @@ -9495,7 +10055,7 @@
+#  
+#  ---------------------------------------------------------------------------
+#  
+# -Driver: cs42l45 - CS42L45 SDCA audio driver
+# +Driver: cs42l45 - CS42L45 SDCA audio driver family (includes cs42l49)
+#  
+#  File: sdca/1fa/cs42l45_primer1.bin
+#  File: sdca/1fa/cs42l45_primer2.bin
+# @@ -9688,6 +10248,57 @@
+#  Link: sdca/1fa/1028/efc/4.bin -> ../../cs42l45_primer4.bin
+#  Link: sdca/1fa/1028/efc/42450005.bin -> ../cs42l45_v20260615.bin
+#  
+# +File: sdca/1fa/1028/cs42l45_v20260917.bin
+# +Link: sdca/1fa/1028/eec/1.bin -> ../../cs42l45_primer1.bin
+# +Link: sdca/1fa/1028/eec/2.bin -> ../../cs42l45_primer2.bin
+# +Link: sdca/1fa/1028/eec/3.bin -> ../../cs42l45_primer3.bin
+# +Link: sdca/1fa/1028/eec/4.bin -> ../../cs42l45_primer4.bin
+# +Link: sdca/1fa/1028/eec/42450005.bin -> ../cs42l45_v20260917.bin
+# +Link: sdca/1fa/1028/eed/1.bin -> ../../cs42l45_primer1.bin
+# +Link: sdca/1fa/1028/eed/2.bin -> ../../cs42l45_primer2.bin
+# +Link: sdca/1fa/1028/eed/3.bin -> ../../cs42l45_primer3.bin
+# +Link: sdca/1fa/1028/eed/4.bin -> ../../cs42l45_primer4.bin
+# +Link: sdca/1fa/1028/eed/42450005.bin -> ../cs42l45_v20260917.bin
+# +Link: sdca/1fa/1028/eee/1.bin -> ../../cs42l45_primer1.bin
+# +Link: sdca/1fa/1028/eee/2.bin -> ../../cs42l45_primer2.bin
+# +Link: sdca/1fa/1028/eee/3.bin -> ../../cs42l45_primer3.bin
+# +Link: sdca/1fa/1028/eee/4.bin -> ../../cs42l45_primer4.bin
+# +Link: sdca/1fa/1028/eee/42450005.bin -> ../cs42l45_v20260917.bin
+# +Link: sdca/1fa/1028/eef/1.bin -> ../../cs42l45_primer1.bin
+# +Link: sdca/1fa/1028/eef/2.bin -> ../../cs42l45_primer2.bin
+# +Link: sdca/1fa/1028/eef/3.bin -> ../../cs42l45_primer3.bin
+# +Link: sdca/1fa/1028/eef/4.bin -> ../../cs42l45_primer4.bin
+# +Link: sdca/1fa/1028/eef/42450005.bin -> ../cs42l45_v20260917.bin
+# +Link: sdca/1fa/1028/f07/1.bin -> ../../cs42l45_primer1.bin
+# +Link: sdca/1fa/1028/f07/2.bin -> ../../cs42l45_primer2.bin
+# +Link: sdca/1fa/1028/f07/3.bin -> ../../cs42l45_primer3.bin
+# +Link: sdca/1fa/1028/f07/4.bin -> ../../cs42l45_primer4.bin
+# +Link: sdca/1fa/1028/f07/42450005.bin -> ../cs42l45_v20260917.bin
+# +Link: sdca/1fa/1028/f08/1.bin -> ../../cs42l45_primer1.bin
+# +Link: sdca/1fa/1028/f08/2.bin -> ../../cs42l45_primer2.bin
+# +Link: sdca/1fa/1028/f08/3.bin -> ../../cs42l45_primer3.bin
+# +Link: sdca/1fa/1028/f08/4.bin -> ../../cs42l45_primer4.bin
+# +Link: sdca/1fa/1028/f08/42450005.bin -> ../cs42l45_v20260917.bin
+# +
+# +File: sdca/1fa/1028/cs42l45_v20260930.bin
+# +Link: sdca/1fa/1028/edc/1.bin -> ../../cs42l45_primer1.bin
+# +Link: sdca/1fa/1028/edc/2.bin -> ../../cs42l45_primer2.bin
+# +Link: sdca/1fa/1028/edc/3.bin -> ../../cs42l45_primer3.bin
+# +Link: sdca/1fa/1028/edc/4.bin -> ../../cs42l45_primer4.bin
+# +Link: sdca/1fa/1028/edc/42450005.bin -> ../cs42l45_v20260930.bin
+# +
+# +File: sdca/1fa/1028/cs42l49_v20260921.bin
+# +Link: sdca/1fa/1028/f01/1.bin -> ../../cs42l45_primer1.bin
+# +Link: sdca/1fa/1028/f01/2.bin -> ../../cs42l45_primer2.bin
+# +Link: sdca/1fa/1028/f01/3.bin -> ../../cs42l45_primer3.bin
+# +Link: sdca/1fa/1028/f01/4.bin -> ../../cs42l45_primer4.bin
+# +Link: sdca/1fa/1028/f01/42450005.bin -> ../cs42l49_v20260921.bin
+# +Link: sdca/1fa/1028/f04/1.bin -> ../../cs42l45_primer1.bin
+# +Link: sdca/1fa/1028/f04/2.bin -> ../../cs42l45_primer2.bin
+# +Link: sdca/1fa/1028/f04/3.bin -> ../../cs42l45_primer3.bin
+# +Link: sdca/1fa/1028/f04/4.bin -> ../../cs42l45_primer4.bin
+# +Link: sdca/1fa/1028/f04/42450005.bin -> ../cs42l49_v20260921.bin
+# +
+#  File: sdca/1fa/17aa/cs42l45_v20260522.bin
+#  Link: sdca/1fa/17aa/2352/1.bin -> ../../cs42l45_primer1.bin
+#  Link: sdca/1fa/17aa/2352/2.bin -> ../../cs42l45_primer2.bin
+# @@ -9733,6 +10344,7 @@
+#  Link: sdca/1fa/144d/ca0a/42450005.bin -> ../cs42l45_v20260820.bin
+#  
+#  License: Redistributable. See LICENSE.cirrus for details.
+# +SPDX-License-Identifier: LicenseRef-LICENSE.cirrus
+#  
+#  Use of Cirrus Logic drivers, firmware and other materials is permitted
+#  only in connection with Cirrus Logic hardware products.
+# @@ -9766,6 +10378,7 @@
+#  Version: v2.8
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.mediatek
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -9774,6 +10387,7 @@
+#  Version: 44.00.02
+#  
+#  Licence: Redistributable. See LICENSE.nxp for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.nxp
+#  Originates from https://github.com/NXP/uwb-NXPUWB-FW.git
+#  --------------------------------------------------------------------------
+#  
+# @@ -9783,6 +10397,7 @@
+#  Version: 18.99.3.p26.7
+#  
+#  Licence: Redistributable. See LICENSE.nxp for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.nxp
+#  
+#  Originates from https://github.com/nxp-imx/imx-firmware/tree/lf-6.12.34_2.1.0
+#  
+# @@ -9805,6 +10420,7 @@
+#  Version: 18.99.1.p154.40
+#  
+#  Licence: Redistributable. See LICENSE.nxp for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.nxp
+#  
+#  Originates from https://github.com/nxp-imx/imx-firmware/tree/lf-6.1.22_2.0.0/nxp
+#  
+# @@ -9824,6 +10440,7 @@
+#  Info: 0xe863
+#  
+#  Licence: Redistributable. See LICENSE.amlogic for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.amlogic
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -9835,6 +10452,7 @@
+#  Version: 1.1.OS@6976702
+#  
+#  License: Redistributable. See LICENSE.powervr for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.powervr
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -9893,6 +10511,8 @@
+#  Info: DATE=05.06.2026
+#  
+#  Licence: Redistributable. See LICENCE.linaro for details
+# +SPDX-License-Identifier: BSD-3-Clause
+# +
+#  Originates from https://github.com/linux-msm/audioreach-topology.git
+#  
+#  --------------------------------------------------------------------------
+# @@ -9915,6 +10535,7 @@
+#  
+#  Licence: Redistributable. See LICENCE.ti-tspa for details. Marked:
+#  	 Copyright (C) 2023 - 2026 Texas Instruments
+# +SPDX-License-Identifier: LicenseRef-LICENCE.ti-tspa
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -10140,6 +10761,7 @@
+#  Link: TXNW2781RCA4.bin -> ti/audio/tas2781/TIAS2781RCA4.bin
+#  
+#  Licence: Redistributable. See LICENCE.ti-tspa for details. Marked:
+# +SPDX-License-Identifier: LicenseRef-LICENCE.ti-tspa
+#  	 Copyright (C) 2023 - 2026 Texas Instruments
+#  
+#  --------------------------------------------------------------------------
+# @@ -10543,6 +11165,7 @@
+#  Link: 9029-3-0x9.bin -> ti/audio/tas2783/9029-3-0x9.bin
+#  
+#  Licence: Redistributable. LICENCE.ti-tspa for details. Marked:
+# +SPDX-License-Identifier: LicenseRef-LICENCE.ti-tspa
+#  	 Copyright (C) 2026 Texas Instruments
+#  
+#  --------------------------------------------------------------------------
+# @@ -10556,6 +11179,7 @@
+#  Link: INT8866RCA2.bin -> ti/audio/tas2563/INT8866RCA2.bin
+#  
+#  Licence: Redistributable. LICENCE.ti-tspa for details. Marked:
+# +SPDX-License-Identifier: LicenseRef-LICENCE.ti-tspa
+#  	 Copyright (C) 2023 - 2025 Texas Instruments
+#  
+#  --------------------------------------------------------------------------
+# @@ -10565,6 +11189,7 @@
+#  Version: 1.0.2
+#  
+#  Licence: Redistributable. See LICENSE.montage for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.montage
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -10581,14 +11206,18 @@
+#  Version: arch12.8
+#  File: arm/mali/arch13.8/mali_csffw.bin
+#  Version: arch13.8
+# +File: arm/mali/arch14.8/mali_csffw.bin
+# +Version: arch14.8
+#  
+#  License: Redistributable. See LICENCE.mali_csffw for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.mali_csffw
+#  
+#  --------------------------------------------------------------------------
+#  Driver: isp - Image Signal Processor (ISP) device
+#  File: amdgpu/isp_4_1_1.bin
+#  
+#  License: Redistributable. See LICENSE.amdisp for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.amdisp
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -10596,11 +11225,15 @@
+#  File: qcom/aic100/fw1.bin
+#  File: qcom/aic100/fw10.bin
+#  File: qcom/aic100/fw2.bin
+# +Version: NSP.AIC.1.20.2.0
+#  File: qcom/aic100/fw5.bin
+#  File: qcom/aic100/fw9.bin
+# +Version: NSP.AIC.1.20.2.0
+#  File: qcom/aic100/sbl.bin
+# +Version: SBL.AIC.1.20.2.1
+#  
+#  License: Redistributable. See LICENSE.qcom and NOTICE.qcom for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.qcom
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -10611,8 +11244,13 @@
+#  Version: 5.8.1.7778
+#  File: intel/ish/ish_wcl.bin
+#  Version: 5.8.4.7784
+# +File: intel/ish/ish_nvlh.bin
+# +Version: 5.8.2.7822
+# +File: intel/ish/ish_nvls.bin
+# +Version: 5.8.3.7819
+#  
+#  License: Redistributable. See LICENSE.intel for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.intel
+#  
+#  File: LENOVO/ish/ish_lnlm_lenovo_X9-14_2025_5.8.36.09092.bin
+#  Link: intel/ish/ish_lnlm_53c4ffad_a672a235.bin -> ../../LENOVO/ish/ish_lnlm_lenovo_X9-14_2025_5.8.36.09092.bin
+# @@ -10639,6 +11277,7 @@
+#  Version: 5.8.4.7720
+#  
+#  License: Redistributable. See LICENCE.lenovo for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.lenovo
+#  
+#  File: HP/ish/ish_lnlm_12128606_f9751b71.bin
+#  Link: intel/ish/ish_lnlm_12128606_f9751b71.bin -> ../../HP/ish/ish_lnlm_12128606_f9751b71.bin
+# @@ -10648,6 +11287,7 @@
+#  Version: 5.8.1.7779
+#  
+#  License: Redistributable. See LICENCE.HP for details
+# +SPDX-License-Identifier: LicenseRef-LICENCE.HP
+#  
+#  File: dell/ish/ish_lnlm_39ceeaf8_58.7727.0.bin
+#  Link: intel/ish/ish_lnlm_39ceeaf8.bin -> ../../dell/ish/ish_lnlm_39ceeaf8_58.7727.0.bin
+# @@ -10657,20 +11297,24 @@
+#  Link: intel/ish/ish_ptl_39ceeaf8.bin -> ../../dell/ish/ish_ptl_39ceeaf8_581.7783.0.bin
+#  
+#  License: Redistributable. See LICENSE.dell for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.dell
+#  
+#  --------------------------------------------------------------------------
+#  
+#  Driver: qdu100 - Qualcomm DU firmware image files
+#  File: qcom/qdu100/xbl_s.melf
+# +Version: BOOT.MXF.2.3.3-00044.1-LASSEN-1
+#  File: qcom/qdu100/abl_userdebug.elf
+#  File: qcom/qdu100/aop_devcfg.mbn
+#  File: qcom/qdu100/aop.mbn
+# +Version: AOP.CSM.1.0-00105-LASSEN_E-2
+#  File: qcom/qdu100/cpucp.elf
+#  File: qcom/qdu100/efs1.bin
+#  File: qcom/qdu100/efs2.bin
+#  File: qcom/qdu100/efs3.bin
+#  File: qcom/qdu100/fw_csm_gsi_3.0.elf
+#  File: qcom/qdu100/hypvm.mbn
+# +Version: TZ.XF.5.26-00043-LASSENAAAAANAZT-4
+#  File: qcom/qdu100/mdmddr.mbn
+#  File: qcom/qdu100/multi_image.mbn
+#  File: qcom/qdu100/multi_image_qti.mbn
+# @@ -10678,13 +11322,17 @@
+#  File: qcom/qdu100/qupv3fw.elf
+#  File: qcom/qdu100/shrm.elf
+#  File: qcom/qdu100/tz.mbn
+# +Version: TZ.XF.5.26-00043-LASSENAAAAANAZT-4
+#  File: qcom/qdu100/uefi.elf
+# +Version: BOOT.MXF.2.3.3-00044.1-LASSEN-1
+#  File: qcom/qdu100/xbl_config.elf
+#  File: qcom/qdu100/xbl_ramdump.elf
+# +Version: BOOT.MXF.2.3.3-00044.1-LASSEN-1
+#  File: qcom/qdu100/zeros_1sector.bin
+#  File: qcom/qdu100/qdsp6sw.mbn.xz
+#  
+#  License: Redistributable. See LICENSE.qcom and NOTICE.qcom for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.qcom
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -10703,6 +11351,7 @@
+#  Link: intel/vpu/vpu_50xx_v0.0.bin -> vpu_50xx_v1.bin
+#  
+#  License: Redistributable. See LICENSE.intel_vpu for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.intel_vpu
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -10710,6 +11359,7 @@
+#  File: bmi260-init-data.fw
+#  
+#  License: Redistributable. See LICENSE.bmi260 for details
+# +SPDX-License-Identifier: BSD-3-Clause
+#  
+#  Originates from https://source.chromium.org/chromiumos/chromiumos/codesearch/+/main:src/platform/ec/third_party/bmi260/accelgyro_bmi260_config_tbin.h
+#  
+# @@ -10726,18 +11376,23 @@
+#  File: qcom/shikra/qupv3fw.elf
+#  
+#  License: Redistributable. See LICENSE.qcom and NOTICE.qcom for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.qcom
+#  ---------------------------------------------------------------------------
+#  
+#  Driver: sdx61 - Qualcomm SDX61 firmware image file for Foxconn vendor
+#  File: qcom/sdx61/foxconn/prog_firehose_lite.elf
+# +Version: BOOT.MXF.1.1.1-00277-Olympic-1
+#  
+#  License: Redistributable. See LICENSE.qcom and NOTICE.qcom for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.qcom
+#  ---------------------------------------------------------------------------
+#  
+#  Driver: sdx35 - Qualcomm SDX35 firmware image file for Foxconn vendor
+#  File: qcom/sdx35/foxconn/xbl_s_devprg_ns.melf
+# +Version: BOOT.MXF.2.3-00430-KUNO_E-1
+#  
+#  License: Redistributable. See LICENSE.qcom and NOTICE.qcom for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.qcom
+#  --------------------------------------------------------------------------
+#  
+#  Driver: pcie-rcar-gen4 - Renesas R-Car Gen4 PCIe controller
+# @@ -10745,6 +11400,7 @@
+#  File: rcar_gen4_pcie.bin
+#  
+#  Licence: Redistributable. See LICENCE.r8a779g_pcie_phy for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.r8a779g_pcie_phy
+#  --------------------------------------------------------------------------
+#  
+#  Driver: PCM6240 - Texas Instruments PCM6240 Family Audio ADC/DAC Device
+# @@ -10754,6 +11410,7 @@
+#  Version: 1.0
+#  
+#  Licence: Redistributable. See LICENCE.ti-tspa for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.ti-tspa
+#  
+#  Info:
+#  Firmware file generated via https://git.ti.com/cgit/lpaa-android-drivers/tasdevice-linux-driver/tree/json/tool/Non_Integrated_Bin_Tool_v1.4.1 and branch-master.
+# @@ -10771,3 +11428,28 @@
+#  Version: 56
+#  
+#  License: Redistributable. See LICENCE.morsemicro for details.
+# +SPDX-License-Identifier: LicenseRef-LICENCE.morsemicro
+# +
+# +--------------------------------------------------------------------------
+# +
+# +Driver: btaic - AIC8800D80 Bluetooth support
+# +
+# +File: aic/aic8800d80/fw_adid_8800d80_u02.bin
+# +Version: v6.9.1.1
+# +File: aic/aic8800d80/fw_patch_8800d80_u02.bin
+# +Version: v6.9.1.1
+# +File: aic/aic8800d80/fw_patch_table_8800d80_u02.bin
+# +Version: v6.9.1.1
+# +
+# +Licence: Redistributable. See LICENSE.aic for details.
+# +SPDX-License-Identifier: LicenseRef-LICENSE.aic
+# +
+# +--------------------------------------------------------------------------
+# +
+# +Driver: aic - AIC8800D80 U02 SDIO Wi-Fi support
+# +
+# +File: aic/aic8800d80/fmacfw_8800d80_u02.bin
+# +Version: v6.9.1.1
+# +
+# +Licence: Redistributable. See LICENSE.aic for details.
+# +SPDX-License-Identifier: LicenseRef-LICENSE.aic
+# 
+#
+
 SUMMARY = "Firmware files for use with Linux kernel"
 HOMEPAGE = "https://www.kernel.org/"
 DESCRIPTION = "Linux firmware is a package distributed alongside the Linux kernel \
@@ -273,7 +3497,7 @@ LIC_FILES_CHKSUM = "file://LICENSES/LICENCE.Abilis;md5=b5ee3f410780e56711ad48ead
                     file://LICENSES/LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
                     file://LICENSES/LICENSE.xe;md5=c674d38774242bc0c528214721488118 \
                     file://LICENSES/LICENCE.wf200;md5=4d1beff00d902c05c9c7e95a5d8eb52d \
-                    file://WHENCE;md5=${WHENCE_CHKSUM} \
+                    file://WHENCE;md5=d1b892bc13f2bc5148ce27c732ec8339 \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
@@ -407,17 +3631,14 @@ NO_GENERIC_LICENSE[Firmware-WHENCE] = "WHENCE"
 
 PE = "1"
 
-SRC_URI = "\
-  ${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz \
-  file://0001-qcom-shikra-link-WiFi-firmware-from-the-ath10k-subdi.patch \
-"
+SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
 BBCLASSEXTEND = "devupstream:target"
 SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git;protocol=https;branch=main"
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "f80dcb757a623deda62200c08e0e1a88c76fb6b54964f31b35fa74da1c90ccc5"
+SRC_URI[sha256sum] = "a10d1ab5baf2c74ba92e8c7cf313e691696c26bddfa6df00db795e48d70cd4ca"
 
 inherit allarch
 
-- 
2.47.1


--===============1555530698266862855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 958 .bb files complete (0 cached, 958 parsed). 1993 targets, 43 skipped, 0 masked, 0 errors.
Removing 1 recipes from the allarch sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-93535a73e6f990eb3c4eefc3a44b72886a71e3c0"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:93535a73e6f990eb3c4eefc3a44b72886a71e3c0"
meta-yocto-bsp       
meta-poky            = "master:82013b83db7ba41da07694e201a7c43f561a9e00"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 82 Local 69 Mirrors 0 Missed 13 Current 162 (84% match, 94% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 497 of 796 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20261019.bb:do_recipe_qa)
NOTE: Running task 759 of 796 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20261019.bb:do_create_recipe_spdx)
NOTE: recipe linux-firmware-1_20261019-r0: task do_recipe_qa: Started
NOTE: recipe linux-firmware-1_20261019-r0: task do_create_recipe_spdx: Started
NOTE: recipe linux-firmware-1_20261019-r0: task do_recipe_qa: Succeeded
NOTE: Running task 778 of 796 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20261019.bb:do_fetch)
NOTE: recipe linux-firmware-1_20261019-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe linux-firmware-1_20261019-r0: task do_fetch: Started
NOTE: recipe linux-firmware-1_20261019-r0: task do_fetch: Succeeded
NOTE: Running task 779 of 796 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20261019.bb:do_unpack)
NOTE: Running task 780 of 796 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20261019.bb:do_prepare_recipe_sysroot)
NOTE: recipe linux-firmware-1_20261019-r0: task do_unpack: Started
NOTE: recipe linux-firmware-1_20261019-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-firmware-1_20261019-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe linux-firmware-1_20261019-r0: task do_unpack: Succeeded
NOTE: Running task 781 of 796 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20261019.bb:do_patch)
NOTE: recipe linux-firmware-1_20261019-r0: task do_patch: Started
NOTE: recipe linux-firmware-1_20261019-r0: task do_patch: Succeeded
NOTE: Running task 782 of 796 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20261019.bb:do_deploy_source_date_epoch)
NOTE: Running task 783 of 796 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20261019.bb:do_populate_lic)
NOTE: recipe linux-firmware-1_20261019-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe linux-firmware-1_20261019-r0: task do_populate_lic: Started
NOTE: recipe linux-firmware-1_20261019-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 784 of 796 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20261019.bb:do_configure)
NOTE: recipe linux-firmware-1_20261019-r0: task do_populate_lic: Succeeded
NOTE: recipe linux-firmware-1_20261019-r0: task do_configure: Started
NOTE: recipe linux-firmware-1_20261019-r0: task do_configure: Succeeded
NOTE: Running task 785 of 796 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20261019.bb:do_compile)
NOTE: recipe linux-firmware-1_20261019-r0: task do_compile: Started
NOTE: recipe linux-firmware-1_20261019-r0: task do_compile: Succeeded
NOTE: Running task 786 of 796 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20261019.bb:do_install)
NOTE: recipe linux-firmware-1_20261019-r0: task do_install: Started
NOTE: recipe linux-firmware-1_20261019-r0: task do_install: Succeeded
NOTE: Running task 787 of 796 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20261019.bb:do_package)
NOTE: Running task 788 of 796 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20261019.bb:do_populate_sysroot)
NOTE: recipe linux-firmware-1_20261019-r0: task do_populate_sysroot: Started
NOTE: recipe linux-firmware-1_20261019-r0: task do_package: Started
NOTE: recipe linux-firmware-1_20261019-r0: task do_populate_sysroot: Succeeded
NOTE: recipe linux-firmware-1_20261019-r0: task do_package: Failed
NOTE: Tasks Summary: Attempted 788 tasks of which 775 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261020071118.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261020071118.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20261019.bb:do_package
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20261019/temp/log.do_package.3402068
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: linux-firmware-1_20261019-r0 do_package: QA Issue: linux-firmware: Files/directories were installed but not shipped in any package:
  /usr/lib/firmware/aic
  /usr/lib/firmware/aic/aic8800d80
  /usr/lib/firmware/aic/aic8800d80/fw_adid_8800d80_u02.bin
  /usr/lib/firmware/aic/aic8800d80/fw_patch_8800d80_u02.bin
  /usr/lib/firmware/aic/aic8800d80/fmacfw_8800d80_u02.bin
  /usr/lib/firmware/aic/aic8800d80/fw_patch_table_8800d80_u02.bin
  /usr/lib/firmware/intel/ish/ish_nvls.bin
  /usr/lib/firmware/intel/ish/ish_nvlh.bin
  /usr/lib/firmware/arm/mali/arch14.8
  /usr/lib/firmware/arm/mali/arch14.8/mali_csffw.bin
  /usr/lib/firmware/mrvl/sdiouartiw416_combo_v0.bin
  /usr/lib/firmware/rtw89/board_elm.bin
  /usr/lib/firmware/rockchip/pcie3-t22-c8g2-1.6.3-202a-p7.fw
  /usr/lib/firmware/qcom/gen81100_gmu.bin
  /usr/lib/firmware/qcom/gen81100_sqe.fw
  /usr/lib/firmware/qcom/gen81100_aqe.fw
  /usr/lib/firmware/qcom/gen81400_gmu.bin
  /usr/lib/firmware/qcom/maili/gen81400_zap.mbn
  /usr/lib/firmware/qcom/hawi/cdsp_dtb.mbn
  /usr/lib/firmware/qcom/hawi/cdsp.mbn
  /usr/lib/firmware/qcom/hawi/gen81100_zap.mbn
  /usr/lib/firmware/qcom/hawi/cdspr.jsn
  /usr/lib/firmware/qcom/eliza/adspua.jsn
  /usr/lib/firmware/qcom/eliza/adsp.mbn
  /usr/lib/firmware/qcom/eliza/adspr.jsn
  /usr/lib/firmware/qcom/eliza/adsps.jsn
  /usr/lib/firmware/qcom/eliza/adsp_dtb.mbn
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
linux-firmware: 27 installed and not shipped files. [installed-vs-shipped]
ERROR: linux-firmware-1_20261019-r0 do_package: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20261019/temp/log.do_package.3402068
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20261019.bb:do_package) failed with exit code '1'

--===============1555530698266862855==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-linux-firmware-upgrade-20260916-20261019.patch"

RnJvbSBkZDI5MzgwNWQ3ZTE3Zjg3ZWZjYTFkZjY0YjRjOTM2NzY1NjM2MGVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMjAgT2N0IDIwMjYgMDc6MTM6MTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aW51eC1maXJtd2FyZTogdXBncmFkZSAyMDI2MDkxNiAtPiAyMDI2MTAxOQoKLS0tCiAuLi4tV2lG
aS1maXJtd2FyZS1mcm9tLXRoZS1hdGgxMGstc3ViZGkucGF0Y2ggfCAgIDI4IC0KIC4uLjIwMjYw
OTE2LmJiID0+IGxpbnV4LWZpcm13YXJlXzIwMjYxMDE5LmJifSB8IDMyMzMgKysrKysrKysrKysr
KysrKy0KIDIgZmlsZXMgY2hhbmdlZCwgMzIyNyBpbnNlcnRpb25zKCspLCAzNCBkZWxldGlvbnMo
LSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJl
L2xpbnV4LWZpcm13YXJlLzAwMDEtcWNvbS1zaGlrcmEtbGluay1XaUZpLWZpcm13YXJlLWZyb20t
dGhlLWF0aDEway1zdWJkaS5wYXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgt
ZmlybXdhcmUve2xpbnV4LWZpcm13YXJlXzIwMjYwOTE2LmJiID0+IGxpbnV4LWZpcm13YXJlXzIw
MjYxMDE5LmJifSAoNTklKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgt
ZmlybXdhcmUvbGludXgtZmlybXdhcmUvMDAwMS1xY29tLXNoaWtyYS1saW5rLVdpRmktZmlybXdh
cmUtZnJvbS10aGUtYXRoMTBrLXN1YmRpLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51
eC1maXJtd2FyZS9saW51eC1maXJtd2FyZS8wMDAxLXFjb20tc2hpa3JhLWxpbmstV2lGaS1maXJt
d2FyZS1mcm9tLXRoZS1hdGgxMGstc3ViZGkucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0
CmluZGV4IDAxMDEyMWRhNmIuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9s
aW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZS8wMDAxLXFjb20tc2hpa3JhLWxpbmstV2lGaS1m
aXJtd2FyZS1mcm9tLXRoZS1hdGgxMGstc3ViZGkucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwy
OCArMCwwIEBACi1Gcm9tIDgzN2FlMGU1YmVjY2MyZjFlOTc0YWZiYTU2YzIyYzNjZjk4MWZjNGUg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBEbWl0cnkgQmFyeXNoa292IDxkbWl0cnku
YmFyeXNoa292QG9zcy5xdWFsY29tbS5jb20+Ci1EYXRlOiBGcmksIDE4IFNlcCAyMDI2IDE3OjUy
OjE1ICswMzAwCi1TdWJqZWN0OiBbUEFUQ0hdIHFjb20vc2hpa3JhOiBsaW5rIFdpRmkgZmlybXdh
cmUgZnJvbSB0aGUgYXRoMTBrIHN1YmRpcgotCi1PbiBRdWFsY29tbSBTaGlrcmEgcGxhdGZvcm0g
dGhlIFdpRmkgZmlybXdhcmUgaXMgbG9hZGVkIGJ5IHRoZSB0cWZ0cHNlcnYKLWZyb20gdGhlIHNh
bWUgbG9jYXRpb24gYXMgdGhlIHJlc3Qgb2YgdGhlIERTUCBmaXJtd2FyZS4gQWRkIHN5bWxpbmss
Ci1wb2ludGluZyBmcm9tIHRoZSBleHBlY3RlZCBsb2NhdGlvbiB0byB0aGUgYWN0dWFsIFdpRmkg
ZmlybXdhcmUgZmlsZS4KLQotRml4ZXM6IGY2NGQ3ZGI3ZDI2NCAoImF0aDEwazogV0NOMzk5MDog
aHcxLjA6IGFkZCBzaGlrcmEgZmlybXdhcmUgZmlsZXMiKQotU2lnbmVkLW9mZi1ieTogRG1pdHJ5
IEJhcnlzaGtvdiA8ZG1pdHJ5LmJhcnlzaGtvdkBvc3MucXVhbGNvbW0uY29tPgotVXBzdHJlYW0t
U3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9naXRsYWIuY29tL2tlcm5lbC1maXJtd2FyZS9saW51
eC1maXJtd2FyZS8tL2NvbW1pdC84MzdhZTBlNWJlY2NjMmYxZTk3NGFmYmE1NmMyMmMzY2Y5ODFm
YzRlXQotLS0tCi0gV0hFTkNFIHwgMSArCi0gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
Ci0KLWRpZmYgLS1naXQgYS9XSEVOQ0UgYi9XSEVOQ0UKLWluZGV4IGE3MTI5NzhiLi4wNTM2NDBh
MCAxMDA2NDQKLS0tLSBhL1dIRU5DRQotKysrIGIvV0hFTkNFCi1AQCAtMzgyNSw2ICszODI1LDcg
QEAgVmVyc2lvbjogV0xBTi5ITC4yLjAtMDEzODctUUNBSExTV01UUExaLTEKLSBGaWxlOiBhdGgx
MGsvV0NOMzk5MC9odzEuMC9ub3RpY2UudHh0X3dsYW5tZHNwCi0gRmlsZTogYXRoMTBrL1dDTjM5
OTAvaHcxLjAvc2hpa3JhL2Zpcm13YXJlLTUuYmluCi0gRmlsZTogYXRoMTBrL1dDTjM5OTAvaHcx
LjAvc2hpa3JhL3dsYW5tZHNwLm1ibgotK0xpbms6IHFjb20vc2hpa3JhL3dsYW5tZHNwLm1ibiAt
PiAuLi8uLi9hdGgxMGsvV0NOMzk5MC9odzEuMC9zaGlrcmEvd2xhbm1kc3AubWJuCi0gVmVyc2lv
bjogV0xBTi5ITC4zLjMuNy5jNS0wMDA5My4yLVFDQUhMU1dNVFBMLTEKLSBGaWxlOiBhdGgxMGsv
V0NOMzk5MC9odzEuMC9zaGlrcmEvbm90aWNlLnR4dF93bGFubWRzcAotIApkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZV8yMDI2MDkx
Ni5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgtZmlybXdhcmVf
MjAyNjEwMTkuYmIKc2ltaWxhcml0eSBpbmRleCA1OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZV8yMDI2MDkxNi5iYgpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZV8yMDI2
MTAxOS5iYgppbmRleCBkNTQ5YzNkMmQ1Li4yMTE2ODczOTZjIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlXzIwMjYwOTE2LmJiCisr
KyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgtZmlybXdhcmVfMjAy
NjEwMTkuYmIKQEAgLTEsMyArMSwzMjI3IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NV
TSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBm
b2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxp
Y2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQs
IGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAn
TGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHly
aWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gV0hFTkNF
CisjICsrKyBXSEVOQ0UKKyMgQEAgLTE0LDYgKzE0LDcgQEAKKyMgIExpbms6IGJyY20vQkNNLTBh
NWMtNjQxMC5oY2QgLT4gQkNNLTBiYjQtMDMwNi5oY2QKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0
cmlidXRhYmxlLiBTZWUgTElDRU5DRS5jeXByZXNzIGZvciBkZXRhaWxzLgorIyArU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5DRS5jeXByZXNzCisjICAKKyMgIC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCisjICAKKyMgQEAgLTI1LDYgKzI2LDcgQEAKKyMgIEZpbGU6IGFkdmFuc3lz
LzM4QzE2MDAuYmluCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VO
Q0UuYWR2YW5zeXMgZm9yIGRldGFpbHMKKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNl
bnNlUmVmLUxJQ0VOQ0UuYWR2YW5zeXMKKyMgIAorIyAgRm91bmQgaW4gaGV4IGZvcm0gaW4ga2Vy
bmVsIHNvdXJjZS4KKyMgIAorIyBAQCAtMzcsNiArMzksNyBAQAorIyAgRmlsZTogcWxvZ2ljLzEy
MTYwLmJpbgorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLnFs
YTEyODAgZm9yIGRldGFpbHMKKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBCU0QtMy1DbGF1
c2UKKyMgIAorIyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgIAorIyBAQCAtNDgsNiArNTEsNyBAQAor
IyAgRmlsZToga2F3ZXRoL3RyaWdnZXJfY29kZV9maXguYmluCisjICAKKyMgIExpY2VuY2U6IFJl
ZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0Uua2F3ZXRoIGZvciBkZXRhaWxzCisjICtTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogQlNELTQtQ2xhdXNlCisjICAKKyMgIEZvdW5kIGluIGhleCBmb3Jt
IGluIHRoZSBrZXJuZWwgc291cmNlLgorIyAgCisjIEBAIC03MSw2ICs3NSw3IEBACisjICBDb252
ZXJ0ZWQgZnJvbSBJbnRlbCBIRVggZmlsZXMsIHVzZWQgaW4gb3VyIGJpbmFyeSByZXByZXNlbnRh
dGlvbiBvZiBpaGV4LgorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNF
TkNFLmtleXNwYW4gZm9yIGRldGFpbHMKKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNl
bnNlUmVmLUxJQ0VOQ0Uua2V5c3BhbgorIyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisj
IEBAIC04NSw2ICs5MCw3IEBACisjICBTb3VyY2U6IGtleXNwYW5fcGRhL01ha2VmaWxlCisjICAK
KyMgIExpY2VuY2U6IEdQTHYyIG9yIGxhdGVyLiBTZWUgR1BMLTIuMCBmb3IgZGV0YWlscy4KKyMg
K1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisjICAKKyMgIENvbXBp
bGVkIGZyb20gb3JpZ2luYWwgODA1MSBzb3VyY2UgaW50byBJbnRlbCBIRVgsIHVzZWQgaW4gb3Vy
IGJpbmFyeSBpaGV4IGZvcm0uCisjICAKKyMgQEAgLTEwNSw2ICsxMTEsNyBAQAorIyAgQ29udmVy
dGVkIGZyb20gSW50ZWwgSEVYIGZpbGVzLCB1c2VkIGluIG91ciBiaW5hcnkgcmVwcmVzZW50YXRp
b24gb2YgaWhleC4KKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5D
RS5lbWkyNiBmb3IgZGV0YWlscworIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VS
ZWYtTElDRU5DRS5lbWkyNgorIyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisjIEBAIC0x
MTgsNiArMTI1LDcgQEAKKyMgIAorIyAgTGljZW5jZTogQWxsZWdlZGx5IEdQTHYyKywgYnV0IG5v
IHNvdXJjZSB2aXNpYmxlLiBNYXJrZWQ6CisjICAJIENvcHlyaWdodCAoQykgMjAwNCBUZXhhcyBJ
bnN0cnVtZW50cworIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIK
KyMgIAorIyAgRm91bmQgaW4gaGV4IGZvcm0gaW4ga2VybmVsIHNvdXJjZS4KKyMgIAorIyBAQCAt
MTMwLDYgKzEzOCw3IEBACisjICBGaWxlOiBtdHNfZWRnZS5mdworIyAgCisjICBMaWNlbmNlOiBS
ZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLm11bHRpdGVjaCBmb3IgZGV0YWlscworIyArU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5DRS5tdWx0aXRlY2gKKyMgIAor
IyAgQ29weXJpZ2h0IChDKSAyMDA1IE11bHRpLVRlY2ggU3lzdGVtcywgSW5jLgorIyAgCisjIEBA
IC0xNDYsNiArMTU1LDcgQEAKKyMgIAorIyAgTGljZW5jZTogQWxsZWdlZGx5IEdQTHYyLCBidXQg
bm8gc291cmNlIHZpc2libGUuIE1hcmtlZDoKKyMgIAkgQ29weXJpZ2h0IChDKSAyMDAwLTIwMDIg
IENvbm5lY3RUZWNoIEluYworIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25s
eQorIyAgCisjICBEZWJ1ZyBsb2FkZXIgY2xhaW1zIHRoZSBmb2xsb3dpbmcgYmVoYXZpb3VyOgor
IyAgCVBvcnQgMSBMRUQgZmxhc2hlcyB3aGVuIHRoZSB2ZW5kX2F4IHByb2dyYW0gaXMgcnVubmlu
ZworIyBAQCAtMTY1LDYgKzE3NSw3IEBACisjICAJQ29weXJpZ2h0IChDKSAyMDAxIFNUTWljcm9l
bGVjdHJvbmljcywgSW5jLgorIyAgCUNvbnRhY3Q6ICBzdGV2ZS5taWxsZXJAc3QuY29tCisjICAJ
RGVzY3JpcHRpb246IFRoaXMgZmlsZSBjb250YWlucyBwYXRjaCBkYXRhIGZvciB0aGUgQ1BpQTIg
KHN0djA2NzIpIFZQNC4KKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxh
dGVyCisjICAKKyMgIEZvdW5kIGluIGhleCBmb3JtIGluIGtlcm5lbCBzb3VyY2UuCisjICAKKyMg
QEAgLTE3Niw2ICsxODcsNyBAQAorIyAgRmlsZTogZGFidXNiL2JpdHN0cmVhbS5iaW4KKyMgIAor
IyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5kYWJ1c2IgZm9yIGRldGFp
bHMKKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOQ0UuZGFidXNi
CisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAKKyMgQEAgLTE5Miw2ICsyMDQsNyBAQAor
IyAgLy8qIEdlbmVyYXRlZCBieSBIRVgyQyB2MS4wNgorIyAgLy8qIENvcHlyaWdodCAoQykgMTk5
OCBJbnNpZGUgT3V0IE5ldHdvcmtzLCBBbGwgcmlnaHRzIHJlc2VydmVkLgorIyAgLy8qKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKgor
IyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKyMgIAorIyAgRm91
bmQgaW4gaGV4IGZvcm0gaW4ga2VybmVsIHNvdXJjZS4KKyMgIAorIyBAQCAtMjA4LDYgKzIyMSw3
IEBACisjICAvLyogR2VuZXJhdGVkIGJ5IFRJQmluMkMgdjIuMDAgKHdhdGNocG9ydCkKKyMgIC8v
KiBDb3B5cmlnaHQgKEMpIDIwMDEgSW5zaWRlIE91dCBOZXR3b3JrcywgQWxsIHJpZ2h0cyByZXNl
cnZlZC4KKyMgIC8vKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioKKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9y
LWxhdGVyCisjICAKKyMgIEZvdW5kIGluIGhleCBmb3JtIGluIGtlcm5lbCBzb3VyY2UuCisjICAK
KyMgQEAgLTIyMSw2ICsyMzUsNyBAQAorIyAgU291cmNlOiBkc3A1NmsvY29uY2F0LWJvb3RzdHJh
cC5wbAorIyAgCisjICBMaWNlbmNlOiBHUEx2MiBvciBsYXRlci4gU2VlIEdQTC0yLjAgZm9yIGRl
dGFpbHMuCisjICtTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgorIyAg
CisjICBEU1A1NjAwMSBhc3NlbWJsZXIsIGJ1aWxkYWJsZSB3aXRoIGE1NiBmcm9tCisjICBodHRw
Oi8vd3d3Lnpkb21haW4uY29tL2E1Ni5odG1sCisjIEBAIC0yNDIsNiArMjU3LDcgQEAKKyMgICAq
LworIyAgCisjICBGb3VuZCBpbiBoZXggZm9ybSBpbiBrZXJuZWwgc291cmNlLgorIyArU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKyMgIAorIyAgLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KKyMgIAorIyBAQCAtMjYzLDYgKzI3OSw3IEBACisjICBWZXJzaW9uOiAxMC4zNC4wMwor
IyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLnFsYTJ4eHggZm9y
IGRldGFpbHMKKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOQ0Uu
cWxhMnh4eAorIyAgCisjICBBdmFpbGFibGUgZnJvbSBodHRwOi8vbGRyaXZlci5xbG9naWMuY29t
L2Zpcm13YXJlLworIyAgCisjIEBAIC0yNzYsNiArMjkzLDcgQEAKKyMgIFZlcnNpb246IDkuNDgg
SGVybWVzIEkKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5h
Z2VyZSBmb3IgZGV0YWlscworIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYt
TElDRU5DRS5hZ2VyZQorIyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisjIEBAIC0yODUs
NiArMzAzLDcgQEAKKyMgIEZpbGU6IGFyOTE3MC0yLmZ3CisjICAKKyMgIExpY2VuY2U6IFJlZGlz
dHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UuYXRoZXJvc19maXJtd2FyZSBmb3IgZGV0YWlscworIyAr
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5DRS5hdGhlcm9zX2Zpcm13
YXJlCisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAKKyMgQEAgLTI5OSw2ICszMTgsNyBA
QAorIyAgVmVyc2lvbjogMS4zLjEKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBT
ZWUgTElDRU5DRS5hdGhlcm9zX2Zpcm13YXJlIGZvciBkZXRhaWxzCisjICtTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogTGljZW5zZVJlZi1MSUNFTkNFLmF0aGVyb3NfZmlybXdhcmUKKyMgIAorIyAg
RmlsZTogYXRoOWtfaHRjL2h0Y183MDEwLTEuNC4wLmZ3CisjICBWZXJzaW9uOiAxLjQuMAorIyBA
QCAtMzA2LDYgKzMyNiw3IEBACisjICBWZXJzaW9uOiAxLjQuMAorIyAgCisjICBMaWNlbmNlOiBG
cmVlIHNvZnR3YXJlLiBTZWUgTElDRU5DRS5vcGVuLWF0aDlrLWh0Yy1maXJtd2FyZSBmb3IgZGV0
YWlscworIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5DRS5vcGVu
LWF0aDlrLWh0Yy1maXJtd2FyZQorIyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisjIEBA
IC0zMTgsNiArMzM5LDcgQEAKKyMgIEZpbGU6IHNsaWNvc3Mvb2FzaXNyY3Z1Y29kZS5zeXMKKyMg
IAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5hbGFjcml0ZWNoIGZv
ciBkZXRhaWxzCisjICtTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTGljZW5zZVJlZi1MSUNFTkNF
LmFsYWNyaXRlY2gKKyMgIAorIyAgRm91bmQgaW4gaGV4IGZvcm0gaW4ga2VybmVsIHNvdXJjZS4K
KyMgIAorIyBAQCAtMzI5LDYgKzM1MSw3IEBACisjICBGaWxlOiBzeGcvc2FoYXJhZGJnZG93bmxv
YWRCLnN5cworIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLmFs
YWNyaXRlY2ggZm9yIGRldGFpbHMKKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNl
UmVmLUxJQ0VOQ0UuYWxhY3JpdGVjaAorIyAgCisjICBGb3VuZCBpbiBoZXggZm9ybSBpbiBrZXJu
ZWwgc291cmNlLgorIyAgCisjIEBAIC0zNDUsNiArMzY4LDcgQEAKKyMgIEZpbGU6IGN4Z2IzL3Qz
ZnctNy4xMi4wLmJpbgorIyAgCisjICBMaWNlbmNlOiBHUEx2MiBvciBPcGVuSUIub3JnIEJTRCBs
aWNlbnNlLCBubyBzb3VyY2UgdmlzaWJsZQorIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UKKyMgIAorIyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMg
IAorIyBAQCAtMzU1LDYgKzM3OSw3IEBACisjICBGaWxlOiBjeGdiMy9hZWwyMDIwX3R3eF9lZGMu
YmluCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UuY3hnYjMg
Zm9yIGRldGFpbHMKKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VO
Q0UuY3hnYjMKKyMgIAorIyAgRm91bmQgaW4gaGV4IGZvcm0gaW4ga2VybmVsIHNvdXJjZS4KKyMg
IAorIyBAQCAtMzg0LDYgKzQwOSw3IEBACisjICBMaW5rOiBjeGdiNC90Ni1jb25maWcudHh0IC0+
IGNvbmZpZ3MvdDYtY29uZmlnLWRlZmF1bHQudHh0CisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJp
YnV0YWJsZS4gU2VlIExJQ0VOQ0UuY2hlbHNpb19maXJtd2FyZSBmb3IgZGV0YWlscworIyArU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5DRS5jaGVsc2lvX2Zpcm13YXJl
CisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAKKyMgQEAgLTM5NCw2ICs0MjAsNyBAQAor
IyAgRmlsZTogZTEwMC9kMTAyZV91Y29kZS5iaW4KKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmli
dXRhYmxlLiBTZWUgTElDRU5DRS5lMTAwIGZvciBkZXRhaWxzCisjICtTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogQlNELTMtQ2xhdXNlCisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAKKyMg
QEAgLTQwNSw2ICs0MzIsNyBAQAorIyAgRmlsZTogdGlnb24vdGczNTc3NjYuYmluCisjICAKKyMg
IExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UudGlnb24gZm9yIGRldGFpbHMK
KyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOQ0UudGlnb24KKyMg
IAorIyAgRm91bmQgaW4gaGV4IGZvcm0gaW4ga2VybmVsIHNvdXJjZS4KKyMgIAorIyBAQCAtNDE2
LDYgKzQ0NCw3IEBACisjICBGaWxlOiBhZGFwdGVjL3N0YXJmaXJlX3R4LmJpbgorIyAgCisjICBM
aWNlbmNlOiBBbGxlZ2VkbHkgR1BMdjIsIGJ1dCBubyBzb3VyY2UgdmlzaWJsZS4KKyMgK1NQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKKyMgIAorIyAgRm91bmQgaW4gaGV4IGZv
cm0gaW4ga2VybmVsIHNvdXJjZSwgd2l0aCB0aGUgZm9sbG93aW5nIG5vdGljZToKKyMgIAorIyBA
QCAtNDU4LDYgKzQ4Nyw3IEBACisjICBMaW5rOiBsaWJlcnRhcy9zZDg2ODhfaGVscGVyLmJpbiAt
PiAuLi9tcnZsL3NkODY4OF9oZWxwZXIuYmluCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0
YWJsZS4gU2VlIExJQ0VOQ0UuTWFydmVsbCBmb3IgZGV0YWlscy4KKyMgK1NQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOQ0UuTWFydmVsbAorIyAgCisjICBJbmZvOgorIyAg
RXh0cmFjdGVkIGZyb20gTGludXggZHJpdmVyIHRhcmJhbGxzIGRvd25sb2FkZWQgZnJvbSBNYXJ2
ZWxsJ3MKKyMgQEAgLTQ3Nyw2ICs1MDcsNyBAQAorIyAgVmVyc2lvbjogNS4xMTAuMjIucDIzCisj
ICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UuT0xQQyBmb3IgZGV0
YWlscy4KKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOQ0UuT0xQ
QworIyAgCisjICBBdmFpbGFibGUgZnJvbSBodHRwOi8vZGV2LmxhcHRvcC5vcmcvcHViL2Zpcm13
YXJlL2xpYmVydGFzLworIyAgCisjIEBAIC00OTcsNiArNTI4LDcgQEAKKyMgIFZlcnNpb246IDcu
NC4wLjkKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5NYXJ2
ZWxsIGZvciBkZXRhaWxzLgorIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYt
TElDRU5DRS5NYXJ2ZWxsCisjICAKKyMgIEluZm86CisjICA4Njg3IGltYWdlcyBkb3dubG9hZGVk
IGZyb20gTWFydmVsbCdzICJFeHRyYW5ldCIgd2l0aCBwZXJtaXNzaW9uLgorIyBAQCAtNTU0LDcg
KzU4NiwxMiBAQAorIyAgRmlsZTogbXJ2bC9zZHNkODk3N19jb21ib192Mi5iaW4KKyMgIFZlcnNp
b246IFcxNi42OC4xLnAxOTUKKyMgIAorIyArRmlsZTogbXJ2bC9zZGlvdWFydGl3NDE2X2NvbWJv
X3YwLmJpbgorIyArVmVyc2lvbjogVzE2LjkyLjIxLnAxNTEuNAorIyArCisjICBMaWNlbmNlOiBS
ZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLk5YUCBmb3IgZGV0YWlscy4KKyMgK1NQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOQ0UuTlhQCisjICsKKyMgIE9yaWdpbmF0
ZXMgZnJvbSBodHRwczovL2dpdGh1Yi5jb20vTlhQL213aWZpZXgtZmlybXdhcmUuZ2l0CisjICAK
KyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjIEBAIC05MjIsMzEgKzk1OSwzMSBAQAorIyAgCisjICBG
aWxlOiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktY2MtYTAtNzcudWNvZGUKKyMgIExpbms6IGl3bHdp
ZmktY2MtYTAtNzcudWNvZGUgLT4gaW50ZWwvaXdsd2lmaS9pd2x3aWZpLWNjLWEwLTc3LnVjb2Rl
CisjIC1WZXJzaW9uOiA3NC44ZGJhZmI1Mi4wCisjICtWZXJzaW9uOiA3NC41NjNhNmU5Mi4wCisj
ICAKKyMgIEZpbGU6IGludGVsL2l3bHdpZmkvaXdsd2lmaS1RdS1iMC1oci1iMC03Ny51Y29kZQor
IyAgTGluazogaXdsd2lmaS1RdS1iMC1oci1iMC03Ny51Y29kZSAtPiBpbnRlbC9pd2x3aWZpL2l3
bHdpZmktUXUtYjAtaHItYjAtNzcudWNvZGUKKyMgLVZlcnNpb246IDc0LjhkYmFmYjUyLjAKKyMg
K1ZlcnNpb246IDc0LjU2M2E2ZTkyLjAKKyMgIAorIyAgRmlsZTogaW50ZWwvaXdsd2lmaS9pd2x3
aWZpLVF1LWIwLWpmLWIwLTc3LnVjb2RlCisjICBMaW5rOiBpd2x3aWZpLVF1LWIwLWpmLWIwLTc3
LnVjb2RlIC0+IGludGVsL2l3bHdpZmkvaXdsd2lmaS1RdS1iMC1qZi1iMC03Ny51Y29kZQorIyAt
VmVyc2lvbjogNzQuOGRiYWZiNTIuMAorIyArVmVyc2lvbjogNzQuNTYzYTZlOTIuMAorIyAgCisj
ICBGaWxlOiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktUXUtYzAtaHItYjAtNzcudWNvZGUKKyMgIExp
bms6IGl3bHdpZmktUXUtYzAtaHItYjAtNzcudWNvZGUgLT4gaW50ZWwvaXdsd2lmaS9pd2x3aWZp
LVF1LWMwLWhyLWIwLTc3LnVjb2RlCisjIC1WZXJzaW9uOiA3NC44ZGJhZmI1Mi4wCisjICtWZXJz
aW9uOiA3NC41NjNhNmU5Mi4wCisjICAKKyMgIEZpbGU6IGludGVsL2l3bHdpZmkvaXdsd2lmaS1R
dS1jMC1qZi1iMC03Ny51Y29kZQorIyAgTGluazogaXdsd2lmaS1RdS1jMC1qZi1iMC03Ny51Y29k
ZSAtPiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktUXUtYzAtamYtYjAtNzcudWNvZGUKKyMgLVZlcnNp
b246IDc0LjhkYmFmYjUyLjAKKyMgK1ZlcnNpb246IDc0LjU2M2E2ZTkyLjAKKyMgIAorIyAgRmls
ZTogaW50ZWwvaXdsd2lmaS9pd2x3aWZpLVF1Wi1hMC1oci1iMC03Ny51Y29kZQorIyAgTGluazog
aXdsd2lmaS1RdVotYTAtaHItYjAtNzcudWNvZGUgLT4gaW50ZWwvaXdsd2lmaS9pd2x3aWZpLVF1
Wi1hMC1oci1iMC03Ny51Y29kZQorIyAtVmVyc2lvbjogNzQuOGRiYWZiNTIuMAorIyArVmVyc2lv
bjogNzQuNTYzYTZlOTIuMAorIyAgCisjICBGaWxlOiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktUXVa
LWEwLWpmLWIwLTc3LnVjb2RlCisjICBMaW5rOiBpd2x3aWZpLVF1Wi1hMC1qZi1iMC03Ny51Y29k
ZSAtPiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktUXVaLWEwLWpmLWIwLTc3LnVjb2RlCisjIC1WZXJz
aW9uOiA3NC44ZGJhZmI1Mi4wCisjICtWZXJzaW9uOiA3NC41NjNhNmU5Mi4wCisjICAKKyMgIEZp
bGU6IGludGVsL2l3bHdpZmkvaXdsd2lmaS10eS1hMC1nZi1hMC03Ny51Y29kZQorIyAgTGluazog
aXdsd2lmaS10eS1hMC1nZi1hMC03Ny51Y29kZSAtPiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktdHkt
YTAtZ2YtYTAtNzcudWNvZGUKKyMgQEAgLTk3OCw3ICsxMDE1LDcgQEAKKyMgIAorIyAgRmlsZTog
aW50ZWwvaXdsd2lmaS9pd2x3aWZpLXR5LWEwLWdmLWEwLTg5LnVjb2RlCisjICBMaW5rOiBpd2x3
aWZpLXR5LWEwLWdmLWEwLTg5LnVjb2RlIC0+IGludGVsL2l3bHdpZmkvaXdsd2lmaS10eS1hMC1n
Zi1hMC04OS51Y29kZQorIyAtVmVyc2lvbjogODYuZDI1NzlkNDMuMAorIyArVmVyc2lvbjogODYu
YjIwZGNkMWYuMAorIyAgCisjICBGaWxlOiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktc28tYTAtZ2Y0
LWEwLTc3LnVjb2RlCisjICBMaW5rOiBpd2x3aWZpLXNvLWEwLWdmNC1hMC03Ny51Y29kZSAtPiBp
bnRlbC9pd2x3aWZpL2l3bHdpZmktc28tYTAtZ2Y0LWEwLTc3LnVjb2RlCisjIEBAIC0xMDEwLDcg
KzEwNDcsNyBAQAorIyAgCisjICBGaWxlOiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktc28tYTAtZ2Y0
LWEwLTg5LnVjb2RlCisjICBMaW5rOiBpd2x3aWZpLXNvLWEwLWdmNC1hMC04OS51Y29kZSAtPiBp
bnRlbC9pd2x3aWZpL2l3bHdpZmktc28tYTAtZ2Y0LWEwLTg5LnVjb2RlCisjIC1WZXJzaW9uOiA4
Ni5kMjU3OWQ0My4wCisjICtWZXJzaW9uOiA4Ni5iMjBkY2QxZi4wCisjICAKKyMgIEZpbGU6IGlu
dGVsL2l3bHdpZmkvaXdsd2lmaS1zby1hMC1nZi1hMC03Ny51Y29kZQorIyAgTGluazogaXdsd2lm
aS1zby1hMC1nZi1hMC03Ny51Y29kZSAtPiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktc28tYTAtZ2Yt
YTAtNzcudWNvZGUKKyMgQEAgLTEwNDIsNyArMTA3OSw3IEBACisjICAKKyMgIEZpbGU6IGludGVs
L2l3bHdpZmkvaXdsd2lmaS1zby1hMC1nZi1hMC04OS51Y29kZQorIyAgTGluazogaXdsd2lmaS1z
by1hMC1nZi1hMC04OS51Y29kZSAtPiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktc28tYTAtZ2YtYTAt
ODkudWNvZGUKKyMgLVZlcnNpb246IDg2LmQyNTc5ZDQzLjAKKyMgK1ZlcnNpb246IDg2LmIyMGRj
ZDFmLjAKKyMgIAorIyAgRmlsZTogaW50ZWwvaXdsd2lmaS9pd2x3aWZpLXNvLWEwLWhyLWIwLTc3
LnVjb2RlCisjICBMaW5rOiBpd2x3aWZpLXNvLWEwLWhyLWIwLTc3LnVjb2RlIC0+IGludGVsL2l3
bHdpZmkvaXdsd2lmaS1zby1hMC1oci1iMC03Ny51Y29kZQorIyBAQCAtMTA3MCw3ICsxMTA3LDcg
QEAKKyMgIAorIyAgRmlsZTogaW50ZWwvaXdsd2lmaS9pd2x3aWZpLXNvLWEwLWhyLWIwLTg5LnVj
b2RlCisjICBMaW5rOiBpd2x3aWZpLXNvLWEwLWhyLWIwLTg5LnVjb2RlIC0+IGludGVsL2l3bHdp
ZmkvaXdsd2lmaS1zby1hMC1oci1iMC04OS51Y29kZQorIyAtVmVyc2lvbjogODYuZDI1NzlkNDMu
MAorIyArVmVyc2lvbjogODYuYjIwZGNkMWYuMAorIyAgCisjICBGaWxlOiBpbnRlbC9pd2x3aWZp
L2l3bHdpZmktc28tYTAtamYtYjAtNzcudWNvZGUKKyMgIExpbms6IGl3bHdpZmktc28tYTAtamYt
YjAtNzcudWNvZGUgLT4gaW50ZWwvaXdsd2lmaS9pd2x3aWZpLXNvLWEwLWpmLWIwLTc3LnVjb2Rl
CisjIEBAIC0xMDkzLDcgKzExMzAsNyBAQAorIyAgCisjICBGaWxlOiBpbnRlbC9pd2x3aWZpL2l3
bHdpZmktYnotYjAtaHItYjAtMTAwLnVjb2RlCisjICBMaW5rOiBpd2x3aWZpLWJ6LWIwLWhyLWIw
LTEwMC51Y29kZSAtPiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktYnotYjAtaHItYjAtMTAwLnVjb2Rl
CisjIC1WZXJzaW9uOiA5Ny5kYzdhYTQyZS4wCisjICtWZXJzaW9uOiA5Ny41ODUwYTBjMi4wCisj
ICAKKyMgIEZpbGU6IGludGVsL2l3bHdpZmkvaXdsd2lmaS1iei1iMC1oci1iMC5wbnZtCisjICBM
aW5rOiBpd2x3aWZpLWJ6LWIwLWhyLWIwLnBudm0gLT4gaW50ZWwvaXdsd2lmaS9pd2x3aWZpLWJ6
LWIwLWhyLWIwLnBudm0KKyMgQEAgLTExMjAsNyArMTE1Nyw3IEBACisjICAKKyMgIEZpbGU6IGlu
dGVsL2l3bHdpZmkvaXdsd2lmaS1iei1iMC1nZi1hMC0xMDAudWNvZGUKKyMgIExpbms6IGl3bHdp
ZmktYnotYjAtZ2YtYTAtMTAwLnVjb2RlIC0+IGludGVsL2l3bHdpZmkvaXdsd2lmaS1iei1iMC1n
Zi1hMC0xMDAudWNvZGUKKyMgLVZlcnNpb246IDk3LmRjN2FhNDJlLjAKKyMgK1ZlcnNpb246IDk3
LjU4NTBhMGMyLjAKKyMgIAorIyAgRmlsZTogaW50ZWwvaXdsd2lmaS9pd2x3aWZpLWJ6LWIwLWdm
LWEwLnBudm0KKyMgIExpbms6IGl3bHdpZmktYnotYjAtZ2YtYTAucG52bSAtPiBpbnRlbC9pd2x3
aWZpL2l3bHdpZmktYnotYjAtZ2YtYTAucG52bQorIyBAQCAtMTE3Nyw2ICsxMjE0LDEwIEBACisj
ICBMaW5rOiBpd2x3aWZpLWdsLWMwLWZtLWMwLWMxMDcudWNvZGUgLT4gaW50ZWwvaXdsd2lmaS9p
d2x3aWZpLWdsLWMwLWZtLWMwLWMxMDcudWNvZGUKKyMgIFZlcnNpb246IDEwNy4xYjQ0NDc0Ny4w
CisjICAKKyMgK0ZpbGU6IGludGVsL2l3bHdpZmkvaXdsd2lmaS1nbC1jMC1mbS1jMC1jMTA4LnVj
b2RlCisjICtMaW5rOiBpd2x3aWZpLWdsLWMwLWZtLWMwLWMxMDgudWNvZGUgLT4gaW50ZWwvaXds
d2lmaS9pd2x3aWZpLWdsLWMwLWZtLWMwLWMxMDgudWNvZGUKKyMgK1ZlcnNpb246IDEwOC40NTEw
NTg3Mi4wCisjICsKKyMgIEZpbGU6IGludGVsL2l3bHdpZmkvaXdsd2lmaS1nbC1jMC1mbS1jMC1j
MTAxLnVjb2RlCisjICBMaW5rOiBpd2x3aWZpLWdsLWMwLWZtLWMwLWMxMDEudWNvZGUgLT4gaW50
ZWwvaXdsd2lmaS9pd2x3aWZpLWdsLWMwLWZtLWMwLWMxMDEudWNvZGUKKyMgIFZlcnNpb246IDEw
MS42ZTY5NWE3MC4wCisjIEBAIC0xMjM4LDcgKzEyNzksNyBAQAorIyAgCisjICBGaWxlOiBpbnRl
bC9pd2x3aWZpL2l3bHdpZmktYnotYjAtZm0tYzAtYzEwNy51Y29kZQorIyAgTGluazogaXdsd2lm
aS1iei1iMC1mbS1jMC1jMTA3LnVjb2RlIC0+IGludGVsL2l3bHdpZmkvaXdsd2lmaS1iei1iMC1m
bS1jMC1jMTA3LnVjb2RlCisjIC1WZXJzaW9uOiAxMDcuMWI0NDQ3NDcuMAorIyArVmVyc2lvbjog
MTA3LmIyYTBkNGIyay4wCisjICAKKyMgIEZpbGU6IGludGVsL2l3bHdpZmkvaXdsd2lmaS1iei1i
MC1mbS1jMC5wbnZtCisjICBMaW5rOiBpd2x3aWZpLWJ6LWIwLWZtLWMwLnBudm0gLT4gaW50ZWwv
aXdsd2lmaS9pd2x3aWZpLWJ6LWIwLWZtLWMwLnBudm0KKyMgQEAgLTEyNTMsNyArMTI5NCw3IEBA
CisjICAKKyMgIEZpbGU6IGludGVsL2l3bHdpZmkvaXdsd2lmaS1tYS1iMC1nZi1hMC04OS51Y29k
ZQorIyAgTGluazogaXdsd2lmaS1tYS1iMC1nZi1hMC04OS51Y29kZSAtPiBpbnRlbC9pd2x3aWZp
L2l3bHdpZmktbWEtYjAtZ2YtYTAtODkudWNvZGUKKyMgLVZlcnNpb246IDg2LmQyNTc5ZDQzLjAK
KyMgK1ZlcnNpb246IDg2LmIyMGRjZDFmLjAKKyMgIAorIyAgRmlsZTogaW50ZWwvaXdsd2lmaS9p
d2x3aWZpLW1hLWIwLWdmLWEwLnBudm0KKyMgIExpbms6IGl3bHdpZmktbWEtYjAtZ2YtYTAucG52
bSAtPiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktbWEtYjAtZ2YtYTAucG52bQorIyBAQCAtMTI2OCw3
ICsxMzA5LDcgQEAKKyMgIAorIyAgRmlsZTogaW50ZWwvaXdsd2lmaS9pd2x3aWZpLW1hLWIwLWdm
NC1hMC04OS51Y29kZQorIyAgTGluazogaXdsd2lmaS1tYS1iMC1nZjQtYTAtODkudWNvZGUgLT4g
aW50ZWwvaXdsd2lmaS9pd2x3aWZpLW1hLWIwLWdmNC1hMC04OS51Y29kZQorIyAtVmVyc2lvbjog
ODYuZDI1NzlkNDMuMAorIyArVmVyc2lvbjogODYuYjIwZGNkMWYuMAorIyAgCisjICBGaWxlOiBp
bnRlbC9pd2x3aWZpL2l3bHdpZmktbWEtYjAtZ2Y0LWEwLnBudm0KKyMgIExpbms6IGl3bHdpZmkt
bWEtYjAtZ2Y0LWEwLnBudm0gLT4gaW50ZWwvaXdsd2lmaS9pd2x3aWZpLW1hLWIwLWdmNC1hMC5w
bnZtCisjIEBAIC0xMjgzLDcgKzEzMjQsNyBAQAorIyAgCisjICBGaWxlOiBpbnRlbC9pd2x3aWZp
L2l3bHdpZmktbWEtYjAtaHItYjAtODkudWNvZGUKKyMgIExpbms6IGl3bHdpZmktbWEtYjAtaHIt
YjAtODkudWNvZGUgLT4gaW50ZWwvaXdsd2lmaS9pd2x3aWZpLW1hLWIwLWhyLWIwLTg5LnVjb2Rl
CisjIC1WZXJzaW9uOiA4Ni5kMjU3OWQ0My4wCisjICtWZXJzaW9uOiA4Ni5iMjBkY2QxZi4wCisj
ICAKKyMgIEZpbGU6IGludGVsL2l3bHdpZmkvaXdsd2lmaS1zYy1hMC13aC1iMC0xMDEudWNvZGUK
KyMgIExpbms6IGl3bHdpZmktc2MtYTAtd2gtYjAtMTAxLnVjb2RlIC0+IGludGVsL2l3bHdpZmkv
aXdsd2lmaS1zYy1hMC13aC1iMC0xMDEudWNvZGUKKyMgQEAgLTEzMDEsNiArMTM0MiwxMCBAQAor
IyAgTGluazogaXdsd2lmaS1zYy1hMC13aC1iMC1jMTA3LnVjb2RlIC0+IGludGVsL2l3bHdpZmkv
aXdsd2lmaS1zYy1hMC13aC1iMC1jMTA3LnVjb2RlCisjICBWZXJzaW9uOiAxMDcuMWI0NDQ3NDcu
MAorIyAgCisjICtGaWxlOiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktc2MtYTAtd2gtYjAtYzEwOC51
Y29kZQorIyArTGluazogaXdsd2lmaS1zYy1hMC13aC1iMC1jMTA4LnVjb2RlIC0+IGludGVsL2l3
bHdpZmkvaXdsd2lmaS1zYy1hMC13aC1iMC1jMTA4LnVjb2RlCisjICtWZXJzaW9uOiAxMDguNDUx
MDU4NzIuMAorIyArCisjICBGaWxlOiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktc2MtYTAtd2gtYjAt
YzEwMS51Y29kZQorIyAgTGluazogaXdsd2lmaS1zYy1hMC13aC1iMC1jMTAxLnVjb2RlIC0+IGlu
dGVsL2l3bHdpZmkvaXdsd2lmaS1zYy1hMC13aC1iMC1jMTAxLnVjb2RlCisjICBWZXJzaW9uOiAx
MDEuNmU2OTVhNzAuMAorIyBAQCAtMTMxMSw3ICsxMzU2LDcgQEAKKyMgIAorIyAgRmlsZTogaW50
ZWwvaXdsd2lmaS9pd2x3aWZpLXNjLWEwLWdmLWEwLTEwMC51Y29kZQorIyAgTGluazogaXdsd2lm
aS1zYy1hMC1nZi1hMC0xMDAudWNvZGUgLT4gaW50ZWwvaXdsd2lmaS9pd2x3aWZpLXNjLWEwLWdm
LWEwLTEwMC51Y29kZQorIyAtVmVyc2lvbjogOTcuZGM3YWE0MmUuMAorIyArVmVyc2lvbjogOTcu
NTg1MGEwYzIuMAorIyAgCisjICBGaWxlOiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktc2MtYTAtZm0t
YzAtYzEwMS51Y29kZQorIyAgTGluazogaXdsd2lmaS1zYy1hMC1mbS1jMC1jMTAxLnVjb2RlIC0+
IGludGVsL2l3bHdpZmkvaXdsd2lmaS1zYy1hMC1mbS1jMC1jMTAxLnVjb2RlCisjIEBAIC0xMzIx
LDIyICsxMzY2LDI2IEBACisjICBMaW5rOiBpd2x3aWZpLXNjLWEwLWZtLWMwLWMxMDIudWNvZGUg
LT4gaW50ZWwvaXdsd2lmaS9pd2x3aWZpLXNjLWEwLWZtLWMwLWMxMDIudWNvZGUKKyMgIFZlcnNp
b246IDEwMi4wN2ZjYTE2OC4wCisjICAKKyMgK0ZpbGU6IGludGVsL2l3bHdpZmkvaXdsd2lmaS1z
Yy1hMC1mbS1jMC1jMTAzLnVjb2RlCisjICtMaW5rOiBpd2x3aWZpLXNjLWEwLWZtLWMwLWMxMDMu
dWNvZGUgLT4gaW50ZWwvaXdsd2lmaS9pd2x3aWZpLXNjLWEwLWZtLWMwLWMxMDMudWNvZGUKKyMg
K1ZlcnNpb246IDEwMy4xYTVjYzg4ZC4wCisjICsKKyMgK0ZpbGU6IGludGVsL2l3bHdpZmkvaXds
d2lmaS1zYy1hMC1mbS1jMC1jMTA2LnVjb2RlCisjICtMaW5rOiBpd2x3aWZpLXNjLWEwLWZtLWMw
LWMxMDYudWNvZGUgLT4gaW50ZWwvaXdsd2lmaS9pd2x3aWZpLXNjLWEwLWZtLWMwLWMxMDYudWNv
ZGUKKyMgK1ZlcnNpb246IDEwNi5jODhkMzNhZi4wCisjICsKKyMgK0ZpbGU6IGludGVsL2l3bHdp
ZmkvaXdsd2lmaS1zYy1hMC1mbS1jMC1jMTA3LnVjb2RlCisjICtMaW5rOiBpd2x3aWZpLXNjLWEw
LWZtLWMwLWMxMDcudWNvZGUgLT4gaW50ZWwvaXdsd2lmaS9pd2x3aWZpLXNjLWEwLWZtLWMwLWMx
MDcudWNvZGUKKyMgK1ZlcnNpb246IDEwNy4xYjQ0NDc0Ny4wCisjICsKKyMgK0ZpbGU6IGludGVs
L2l3bHdpZmkvaXdsd2lmaS1zYy1hMC1mbS1jMC1jMTA4LnVjb2RlCisjICtMaW5rOiBpd2x3aWZp
LXNjLWEwLWZtLWMwLWMxMDgudWNvZGUgLT4gaW50ZWwvaXdsd2lmaS9pd2x3aWZpLXNjLWEwLWZt
LWMwLWMxMDgudWNvZGUKKyMgK1ZlcnNpb246IDEwOC40NTEwNTg3Mi4wCisjICsKKyMgIEZpbGU6
IGludGVsL2l3bHdpZmkvaXdsd2lmaS1iei1iMC13aC1iMC1jMTAyLnVjb2RlCisjICBMaW5rOiBp
d2x3aWZpLWJ6LWIwLXdoLWIwLWMxMDIudWNvZGUgLT4gaW50ZWwvaXdsd2lmaS9pd2x3aWZpLWJ6
LWIwLXdoLWIwLWMxMDIudWNvZGUKKyMgIFZlcnNpb246IDEwMi4wN2ZjYTE2OC4wCisjICAKKyMg
LUZpbGU6IGludGVsL2l3bHdpZmkvaXdsd2lmaS1zYy1hMC1mbS1jMC1jMTAzLnVjb2RlCisjIC1M
aW5rOiBpd2x3aWZpLXNjLWEwLWZtLWMwLWMxMDMudWNvZGUgLT4gaW50ZWwvaXdsd2lmaS9pd2x3
aWZpLXNjLWEwLWZtLWMwLWMxMDMudWNvZGUKKyMgLVZlcnNpb246IDEwMy4xYTVjYzg4ZC4wCisj
IC0KKyMgLUZpbGU6IGludGVsL2l3bHdpZmkvaXdsd2lmaS1zYy1hMC1mbS1jMC1jMTA2LnVjb2Rl
CisjIC1MaW5rOiBpd2x3aWZpLXNjLWEwLWZtLWMwLWMxMDYudWNvZGUgLT4gaW50ZWwvaXdsd2lm
aS9pd2x3aWZpLXNjLWEwLWZtLWMwLWMxMDYudWNvZGUKKyMgLVZlcnNpb246IDEwNi5jODhkMzNh
Zi4wCisjIC0KKyMgLUZpbGU6IGludGVsL2l3bHdpZmkvaXdsd2lmaS1zYy1hMC1mbS1jMC1jMTA3
LnVjb2RlCisjIC1MaW5rOiBpd2x3aWZpLXNjLWEwLWZtLWMwLWMxMDcudWNvZGUgLT4gaW50ZWwv
aXdsd2lmaS9pd2x3aWZpLXNjLWEwLWZtLWMwLWMxMDcudWNvZGUKKyMgLVZlcnNpb246IDEwNy4x
YjQ0NDc0Ny4wCisjIC0KKyMgIEZpbGU6IGludGVsL2l3bHdpZmkvaXdsd2lmaS1iei1iMC13aC1i
MC1jMTAzLnVjb2RlCisjICBMaW5rOiBpd2x3aWZpLWJ6LWIwLXdoLWIwLWMxMDMudWNvZGUgLT4g
aW50ZWwvaXdsd2lmaS9pd2x3aWZpLWJ6LWIwLXdoLWIwLWMxMDMudWNvZGUKKyMgIFZlcnNpb246
IDEwMy4xYTVjYzg4ZC4wCisjIEBAIC0xMzQ5LDcgKzEzOTgsMTIgQEAKKyMgIExpbms6IGl3bHdp
ZmktYnotYjAtd2gtYjAtYzEwNy51Y29kZSAtPiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktYnotYjAt
d2gtYjAtYzEwNy51Y29kZQorIyAgVmVyc2lvbjogMTA3LjFiNDQ0NzQ3LjAKKyMgIAorIyArRmls
ZTogaW50ZWwvaXdsd2lmaS9pd2x3aWZpLWJ6LWIwLXdoLWIwLWMxMDgudWNvZGUKKyMgK0xpbms6
IGl3bHdpZmktYnotYjAtd2gtYjAtYzEwOC51Y29kZSAtPiBpbnRlbC9pd2x3aWZpL2l3bHdpZmkt
YnotYjAtd2gtYjAtYzEwOC51Y29kZQorIyArVmVyc2lvbjogMTA4LjQ1MTA1ODcyLjAKKyMgKwor
IyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5pd2x3aWZpX2Zpcm13YXJl
IGZvciBkZXRhaWxzCisjICtTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTGljZW5zZVJlZi1MSUNF
TkNFLml3bHdpZmlfZmlybXdhcmUKKyMgIAorIyAgQWxzbyBhdmFpbGFibGUgZnJvbSBodHRwOi8v
d2lyZWxlc3Mua2VybmVsLm9yZy9lbi91c2Vycy9Ecml2ZXJzL2l3bHdpZmkjRmlybXdhcmUKKyMg
IAorIyBAQCAtMTM2NCw2ICsxNDE4LDcgQEAKKyMgIFZlcnNpb246IGlyY2lfc3RhYmxlX2NhbmRy
cHZfMDQxNV8yMDE1MDUyMV8wNDU4CisjICAKKyMgIExpY2Vuc2U6IFJlZGlzdHJpYnV0YWJsZS4g
U2VlIExJQ0VOU0UuaXZzYyBmb3IgZGV0YWlscworIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IExpY2Vuc2VSZWYtTElDRU5TRS5pdnNjCisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAK
KyMgQEAgLTEzNzYsNiArMTQzMSw3IEBACisjICBMaW5rOiBpbnRlbC9pcmNpX2lyY2lfZWNyLW1h
c3Rlcl8yMDE2MTIwOF8wMjEzXzIwMTcwMTEyXzE1MDAuYmluIC0+IGlwdS9pcmNpX2lyY2lfZWNy
LW1hc3Rlcl8yMDE2MTIwOF8wMjEzXzIwMTcwMTEyXzE1MDAuYmluCisjICAKKyMgIExpY2VuY2U6
IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UuaXB1M19maXJtd2FyZSBmb3IgZGV0YWlscwor
IyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5TRS5pcHUzX2Zpcm13
YXJlCisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAKKyMgQEAgLTEzOTEsNiArMTQ0Nyw3
IEBACisjICBWZXJzaW9uOiBzY2NpX21hc3Rlcl8yMDIxMDUwMl8xNDU5CisjICAKKyMgIExpY2Vu
Y2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UuaXZzYyBmb3IgZGV0YWlscworIyArU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5TRS5pdnNjCisjICAKKyMgIC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCisjICAKKyMgQEAgLTE0MDMsNiArMTQ2MCw3IEBACisjICBWZXJzaW9u
OiAxLjIuMS4yMDI1MTIxNV8yMjQ1MzEKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxl
LiBTZWUgTElDRU5TRS5pbnRlbCBmb3IgZGV0YWlscworIyArU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IExpY2Vuc2VSZWYtTElDRU5TRS5pbnRlbAorIyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQor
IyAgRHJpdmVyOiBtZWktdnNjLWh3IC0gSW50ZWwgVmlzdWFsIFNlbnNpbmcgQ29udHJvbGxlcgor
IyBAQCAtMTQzOCw2ICsxNDk2LDcgQEAKKyMgIEZpbGU6IGludGVsL3ZzYy9pdnNjX3NrdWNmZ19v
dnRpOTczOF8wXzEuYmluCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJ
Q0VOU0UuaXZzYyBmb3IgZGV0YWlscworIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vu
c2VSZWYtTElDRU5TRS5pdnNjCisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAKKyMgQEAg
LTE0NDgsNiArMTUwNyw3IEBACisjICBGaWxlOiBpeHA0eHgvTlBFLUMKKyMgIFZlcnNpb246IGRh
dGUgPSBGZWJydWFyeSAyNiwgMjAwNworIyAgTGljZW5zZTogUmVkaXN0cmlidXRhYmxlLiBTZWUg
TElDRU5TRS5peHA0eHggZm9yIGRldGFpbHMKKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBM
aWNlbnNlUmVmLUxJQ0VOU0UuaXhwNHh4CisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAK
KyMgQEAgLTE0NTYsNiArMTUxNiw3IEBACisjICBGaWxlOiB0ZWh1dGkvYmR4LmJpbgorIyAgCisj
ICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLnRlaHV0aSBmb3IgZGV0YWls
cy4KKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOU0UudGVodXRp
CisjICAKKyMgIEZvdW5kIGluIGhleCBmb3JtIGluIGtlcm5lbCBzb3VyY2UuCisjICAKKyMgQEAg
LTE0NjYsNiArMTUyNyw3IEBACisjICBGaWxlOiAzY29tL3R5cGhvb24uYmluCisjICAKKyMgIExp
Y2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UudHlwaG9vbiBmb3IgZGV0YWlscwor
IyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5DRS50eXBob29uCisj
ICAKKyMgIEZvdW5kIGluIGhleCBmb3JtIGluIGtlcm5lbCBzb3VyY2UuCisjICAKKyMgQEAgLTE0
ODMsNiArMTU0NSw3IEBACisjICBTb3VyY2U6IGNpcy8KKyMgIAorIyAgTGljZW5jZTogRHVhbCBH
UEx2Mi9NUEwKKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgT1IgTVBM
LTEuMQorIyAgCisjICBPcmlnaW5hbGx5IGRldmVsb3BlZCBieSB0aGUgcGNtY2lhLWNzIHByb2pl
Y3QKKyMgIENvcHlyaWdodCAoQykgMTk5OCwgMTk5OSwgMjAwMCBEYXZpZCBBLiBIaW5kcworIyBA
QCAtMTQ5NSw2ICsxNTU4LDcgQEAKKyMgIFNvdXJjZTogY2lzL3NyYy8zQ1hFTTU1Ni5jaXMKKyMg
IAorIyAgTGljZW5jZTogRHVhbCBHUEx2Mi9NUEwKKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBHUEwtMi4wLW9ubHkgT1IgTVBMLTEuMQorIyAgCisjICBPcmlnaW5hbGx5IGRldmVsb3BlZCBi
eSB0aGUgcGNtY2lhLWNzIHByb2plY3QKKyMgIENvcHlyaWdodCAoQykgMTk5OCwgMTk5OSwgMjAw
MCBEYXZpZCBBLiBIaW5kcworIyBAQCAtMTUwNyw2ICsxNTcxLDcgQEAKKyMgIFNvdXJjZTogY2lz
L3NyYy8zQ0NGRU01NTYuY2lzCisjICAKKyMgIExpY2VuY2U6IER1YWwgR1BMdjIvTVBMCisjICtT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5IE9SIE1QTC0xLjEKKyMgIAorIyAg
T3JpZ2luYWxseSBkZXZlbG9wZWQgYnkgdGhlIHBjbWNpYS1jcyBwcm9qZWN0CisjICBDb3B5cmln
aHQgKEMpIDE5OTgsIDE5OTksIDIwMDAgRGF2aWQgQS4gSGluZHMKKyMgQEAgLTE1MjUsNiArMTU5
MCw3IEBACisjICBTb3VyY2U6IGNpcy9zcmMvQ09NcGFkNC5jaXMKKyMgIAorIyAgTGljZW5jZTog
RHVhbCBHUEx2Mi9NUEwKKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkg
T1IgTVBMLTEuMQorIyAgCisjICBPcmlnaW5hbGx5IGRldmVsb3BlZCBieSB0aGUgcGNtY2lhLWNz
IHByb2plY3QKKyMgIENvcHlyaWdodCAoQykgMTk5OCwgMTk5OSwgMjAwMCBEYXZpZCBBLiBIaW5k
cworIyBAQCAtMTUzOCw2ICsxNjA0LDcgQEAKKyMgIEZpbGU6IGNpcy9TV184eHhfU0VSLmNpcwor
IyAgCisjICBMaWNlbmNlOiBHUEx2My4gU2VlIEdQTC0zLjAtb25seSBmb3IgZGV0YWlscy4KKyMg
K1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMy4wLW9ubHkKKyMgIAorIyAgQ29weXJpZ2h0
IFNpZXJyYSBXaXJlbGVzcworIyAgCisjIEBAIC0xNTUwLDYgKzE2MTcsNyBAQAorIyAgTGljZW5j
ZTogQWxsZWdlZGx5IEdQTCwgYnV0IG5vIHNvdXJjZSB2aXNpYmxlLiBNYXJrZWQ6CisjICAgICAg
VGhpcyBmaWxlIGNvbnRhaW5zIHRoZSBmaXJtd2FyZSBvZiBTZXZlbiBvZiBEaWFtb25kcyBmcm9t
IE9TSVRFQ0guCisjICAgICAgKFNwZWNpYWwgdGhhbmtzIHRvIEtldmluIE1hY1BoZXJzb24gb2Yg
T1NJVEVDSCkKKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisj
ICAKKyMgIEZvdW5kIGluIGhleCBmb3JtIGluIGtlcm5lbCBzb3VyY2UuCisjICAKKyMgQEAgLTE1
NzQsNiArMTY0Miw3IEBACisjICBGaWxlOiB2NGwtY3gyNTg0MC5mdworIyAgCisjICBMaWNlbmNl
OiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLmNvbmV4YW50IGZvciBkZXRhaWxzLgorIyAr
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5TRS5jb25leGFudAorIyAg
CisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisjIEBAIC0xNTkzLDYgKzE2NjIsNyBAQAorIyAg
RmlsZTogYm54MngvYm54MngtZTItNy4xMy4yMS4wLmZ3CisjICAKKyMgIExpY2Vuc2U6IFJlZGlz
dHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UuYm54MnggZm9yIGRldGFpbHMuCisjICtTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogTGljZW5zZVJlZi1MSUNFTkNFLmJueDJ4CisjICAKKyMgIEZvdW5kIGlu
IGhleCBmb3JtIGluIGtlcm5lbCBzb3VyY2UuCisjICAKKyMgQEAgLTE2MDcsNiArMTY3Nyw3IEBA
CisjICBGaWxlOiBibngyL2JueDItcnYycC0wOWF4LTYuMC4xNy5mdworIyAgCisjICBMaWNlbnNl
OiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLmJueDIgZm9yIGRldGFpbHMuCisjICtTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogTGljZW5zZVJlZi1MSUNFTkNFLmJueDIKKyMgIAorIyAgRm91
bmQgaW4gaGV4IGZvcm0gaW4ga2VybmVsIHNvdXJjZS4KKyMgIAorIyBAQCAtMTYxOCw2ICsxNjg5
LDcgQEAKKyMgIFZlcnNpb246IDQuMC41OTAKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRh
YmxlLiBTZWUgTElDRU5DRS5waGFuZncgZm9yIGRldGFpbHMuCisjICtTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogTGljZW5zZVJlZi1MSUNFTkNFLnBoYW5mdworIyAgCisjICBBdmFpbGFibGUgZnJv
bSBodHRwOi8vbGRyaXZlci5xbG9naWMuY29tL2Zpcm13YXJlL25ldHhlbl9uaWMvbmV3LworIyAg
CisjIEBAIC0xNjMwLDYgKzE3MDIsNyBAQAorIyAgU291cmNlOiBhdjcxMTAvTWFrZWZpbGUKKyMg
IAorIyAgTGljZW5jZTogR1BMdjIgb3IgbGF0ZXIuIFNlZSBHUEwtMi4wIGZvciBkZXRhaWxzLgor
IyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKyMgIAorIyAgQVJN
IGFzc2VtYmx5IHNvdXJjZSBjb2RlIGZyb20gaHR0cHM6Ly9saW51eHR2Lm9yZy9kb3dubG9hZHMv
ZmlybXdhcmUvQm9vdC5TCisjICAKKyMgQEAgLTE2NDAsNiArMTcxMyw3IEBACisjICBGaWxlOiB5
YW1haGEveXNzMjI1X3JlZ2lzdGVycy5iaW4KKyMgIAorIyAgTGljZW5jZTogQWxsZWdlZGx5IEdQ
THYyKywgYnV0IG5vIHNvdXJjZSB2aXNpYmxlLgorIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjAtb3ItbGF0ZXIKKyMgIAorIyAgRm91bmQgaW4gaGV4IGZvcm0gaW4ga2VybmVsIHNv
dXJjZSwgd2l0aCB0aGUgZm9sbG93aW5nIGNvbW1lbnQ6CisjICAgICBDb3B5cmlnaHQgKGMpIDE5
OTgtMjAwMiBieSBQYXVsIERhdmlzIDxwYmRAb3AubmV0PgorIyBAQCAtMTY1Myw2ICsxNzI3LDcg
QEAKKyMgIEZpbGU6IHJ0MjY2MS5iaW4KKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxl
LiBTZWUgTElDRU5DRS5yYWxpbmstZmlybXdhcmUudHh0IGZvciBkZXRhaWxzCisjICtTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogTGljZW5zZVJlZi1MSUNFTkNFLnJhbGluay1maXJtd2FyZS50eHQK
KyMgIAorIyAgRG93bmxvYWRlZCBmcm9tIGh0dHA6Ly93d3cucmFsaW5rdGVjaC5jb20vcmFsaW5r
L0hvbWUvU3VwcG9ydC9MaW51eC5odG1sCisjICAKKyMgQEAgLTE2NjMsNiArMTczOCw3IEBACisj
ICBGaWxlOiBydDczLmJpbgorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBM
SUNFTkNFLnJhbGluay1maXJtd2FyZS50eHQgZm9yIGRldGFpbHMKKyMgK1NQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOQ0UucmFsaW5rLWZpcm13YXJlLnR4dAorIyAgCisj
ICBEb3dubG9hZGVkIGZyb20gaHR0cDovL3d3dy5yYWxpbmt0ZWNoLmNvbS9yYWxpbmsvSG9tZS9T
dXBwb3J0L0xpbnV4Lmh0bWwKKyMgIAorIyBAQCAtMTY3NSw2ICsxNzUxLDcgQEAKKyMgIExpbms6
IG10NzYwMXUuYmluIC0+IG1lZGlhdGVrL210NzYwMXUuYmluCisjICAKKyMgIExpY2VuY2U6IFJl
ZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UucmFsaW5rX2FfbWVkaWF0ZWtfY29tcGFueV9maXJt
d2FyZSBmb3IgZGV0YWlscworIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYt
TElDRU5DRS5yYWxpbmtfYV9tZWRpYXRla19jb21wYW55X2Zpcm13YXJlCisjICAKKyMgIERvd25s
b2FkZWQgZnJvbSBodHRwOi8vd3d3Lm1lZGlhdGVrLmNvbS9lbi9kb3dubG9hZHMvCisjICAKKyMg
QEAgLTE2ODksNiArMTc2Niw3IEBACisjICBWZXJzaW9uOiAzNworIyAgCisjICBMaWNlbmNlOiBS
ZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLnJhbGluay1maXJtd2FyZS50eHQgZm9yIGRldGFp
bHMKKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOQ0UucmFsaW5r
LWZpcm13YXJlLnR4dAorIyAgCisjICBCaW5hcnkgZmlsZSBzdXBwbGllZCBvcmlnaW5hbGx5IGJ5
IFNoaWFuZyBUdSA8c2hpYW5nX3R1QHJhbGlua3RlY2guY29tPiwgbGF0ZXN0CisjICBmcm9tIGh0
dHA6Ly93d3cubWVkaWF0ZWsuY29tL2VuL2Rvd25sb2FkczEvZG93bmxvYWRzLworIyBAQCAtMTcw
MCw2ICsxNzc4LDcgQEAKKyMgIExpbms6IHJ0MzA5MC5iaW4gLT4gcnQyODYwLmJpbgorIyAgCisj
ICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLnJhbGluay1maXJtd2FyZS50
eHQgZm9yIGRldGFpbHMKKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJ
Q0VOQ0UucmFsaW5rLWZpcm13YXJlLnR4dAorIyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAg
CisjIEBAIC0xNzA5LDYgKzE3ODgsNyBAQAorIyAgVmVyc2lvbjogMzYKKyMgIAorIyAgTGljZW5j
ZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5yYWxpbmstZmlybXdhcmUudHh0IGZvciBk
ZXRhaWxzCisjICtTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTGljZW5zZVJlZi1MSUNFTkNFLnJh
bGluay1maXJtd2FyZS50eHQKKyMgIAorIyAgQmluYXJ5IGZpbGUgc3VwcGxpZWQgb3JpZ2luYWxs
eSBieSBTaGlhbmcgVHUgPHNoaWFuZ190dUByYWxpbmt0ZWNoLmNvbT4sIGxhdGVzdAorIyAgZnJv
bSBodHRwOi8vd3d3Lm1lZGlhdGVrLmNvbS9lbi9kb3dubG9hZHMxL2Rvd25sb2Fkcy8KKyMgQEAg
LTE3MjEsNiArMTgwMSw3IEBACisjICBGaWxlOiBydDMwNzEuYmluCisjICAKKyMgIExpY2VuY2U6
IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UucmFsaW5rLWZpcm13YXJlLnR4dCBmb3IgZGV0
YWlscworIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5DRS5yYWxp
bmstZmlybXdhcmUudHh0CisjICAKKyMgIEluZm86IHJ0MzA3MS5iaW4gaXMgYSBjb3B5IG9mIGJ5
dGVzIDQwOTYtODE5MSBvZiBydDI4NzAuYmluIGZvciBjb21wYXRpYmlsaXR5LgorIyAgCisjIEBA
IC0xNzM0LDYgKzE4MTUsOCBAQAorIyAgU291cmNlOiB1c2JkdXgvCisjICAKKyMgIExpY2VuY2U6
IEdQTHYyIG9yIGxhdGVyLiBTZWUgR1BMLTIuMCBmb3IgZGV0YWlscy4KKyMgK1NQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisjICsKKyMgIFByb3ZpZGVkIGZyb20gdGhl
IGF1dGhvciwgQmVybmQgUG9yciA8QmVybmRQb3JyQGYycy5jb20+CisjICAKKyMgIC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCisjIEBAIC0xNzQ0LDYgKzE4MjcsNyBAQAorIyAgVmVyc2lvbjogMS40LjEKKyMg
IAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS54YzQwMDAgZm9yIGRl
dGFpbHMKKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOQ0UueGM0
MDAwCisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICBEcml2ZXI6IHhjNTAwMCAtIFhjZWl2
ZSA1MDAwIFR1bmVyIGRyaXZlcgorIyBAQCAtMTc1NSw2ICsxODM5LDcgQEAKKyMgIFZlcnNpb246
IDQuMS4zMC43CisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0Uu
eGM1MDAwIGFuZCBMSUNFTkNFLnhjNTAwMGMgZm9yIGRldGFpbHMKKyMgK1NQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOQ0UueGM1MDAwCisjICAKKyMgIC0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCisjICAKKyMgQEAgLTE3NjQsNiArMTg0OSw3IEBACisjICBWZXJzaW9uOiAxLjIwCisj
ICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UuZGliMDcwMCBmb3Ig
ZGV0YWlscworIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IElTQworIyAgCisjICAtLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQorIyAgCisjIEBAIC0xNzc1LDYgKzE4NjEsNyBAQAorIyAgRml4IEVFUFJPTSBy
YWRpbyB0YWJsZSBpc3N1ZSBhbmQgY2hhbmdlIFBJRCB0byAzMDA1CisjICAKKyMgIExpY2VuY2U6
IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UuYXRoZXJvc19maXJtd2FyZSBmb3IgZGV0YWls
cworIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5DRS5hdGhlcm9z
X2Zpcm13YXJlCisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAKKyMgQEAgLTE3ODQsNiAr
MTg3MSw3IEBACisjICBGaWxlOiBtYXRyb3gvZzQwMF93YXJwLmZ3CisjICAKKyMgIExpY2VuY2U6
IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UubWdhIGZvciBkZXRhaWxzLgorIyArU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IE1JVAorIyAgCisjICBGb3VuZCBpbiBoZXggZm9ybSBpbiBrZXJu
ZWwgc291cmNlLgorIyAgCisjIEBAIC0xNzk0LDYgKzE4ODIsNyBAQAorIyAgRmlsZTogcjEyOC9y
MTI4X2NjZS5iaW4KKyMgIAorIyAgTGljZW5jZTogTUlUCisjICtTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogTUlUCisjICAKKyMgIENvcHlyaWdodCAyMDAwIEFkdmFuY2VkIE1pY3JvIERldmljZXMs
IEluYy4KKyMgIAorIyBAQCAtMTgzMiw2ICsxOTIxLDcgQEAKKyMgIEZpbGU6IHJhZGVvbi9SVjcx
MF9tZS5iaW4KKyMgIAorIyAgTGljZW5jZTogTUlUCisjICtTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogTUlUCisjICAKKyMgIENvcHlyaWdodCAyMDA3LTIwMDkgQWR2YW5jZWQgTWljcm8gRGV2aWNl
cywgSW5jLgorIyAgCisjIEBAIC0yMDYzLDYgKzIxNTMsNyBAQAorIyAgRmlsZTogcmFkZW9uL3Np
NThfbWMuYmluCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0Uu
cmFkZW9uIGZvciBkZXRhaWxzLgorIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VS
ZWYtTElDRU5TRS5yYWRlb24KKyMgIAorIyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgIAorIyBAQCAt
MjA3MSw2ICsyMTYyLDcgQEAKKyMgIEZpbGU6IGFlb25zZW1pL2FzMjF4MXhfZncuYmluCisjICAK
KyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UuYWVvbnNlbWkgZm9yIGRl
dGFpbHMuCisjICtTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTGljZW5zZVJlZi1MSUNFTlNFLmFl
b25zZW1pCisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAKKyMgQEAgLTIwODAsNiArMjE3
Miw3IEBACisjICBGaWxlOiBhaXJvaGEvRXRoTUQzMi5EU1AuYmluCisjICAKKyMgIExpY2VuY2U6
IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UuYWlyb2hhIGZvciBkZXRhaWxzLgorIyArU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5TRS5haXJvaGEKKyMgIAorIyAg
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KKyMgIAorIyBAQCAtMjA5MCw2ICsyMTgzLDcgQEAKKyMgIFZlcnNp
b246IDI2MDcxNjAyCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VO
U0UuYWlyb2hhIGZvciBkZXRhaWxzLgorIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vu
c2VSZWYtTElDRU5TRS5haXJvaGEKKyMgIAorIyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgIAorIyBA
QCAtMjA5OSw2ICsyMTkzLDcgQEAKKyMgIEZpbGU6IGFpcm9oYS9lbjc1ODFfbnB1X3J2MzIuYmlu
CisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UuYWlyb2hhIGZv
ciBkZXRhaWxzLgorIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5T
RS5haXJvaGEKKyMgIAorIyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgIAorIyBAQCAtMjEwOSw2ICsy
MjA0LDcgQEAKKyMgIEZpbGU6IGFpcm9oYS9lbjc1ODFfTVQ3OTk2X25wdV9ydjMyLmJpbgorIyAg
CisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLmFpcm9oYSBmb3IgZGV0
YWlscy4KKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOU0UuYWly
b2hhCisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAKKyMgQEAgLTIxMjAsNiArMjIxNiw3
IEBACisjICBWZXJzaW9uOiAwLjUKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBT
ZWUgTElDRU5TRS5haXJvaGEgZm9yIGRldGFpbHMuCisjICtTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogTGljZW5zZVJlZi1MSUNFTlNFLmFpcm9oYQorIyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQor
IyAgCisjIEBAIC0yODI1LDYgKzI5MjIsNyBAQAorIyAgRmlsZTogYW1kZ3B1L3ZwZV82XzFfMy5i
aW4KKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5hbWRncHUg
Zm9yIGRldGFpbHMuCisjICtTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTGljZW5zZVJlZi1MSUNF
TlNFLmFtZGdwdQorIyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisjIEBAIC0yODQ0LDYg
KzI5NDIsNyBAQAorIyAgTGluazogYW1kbnB1LzE3ZjBfMTEvbnB1Xzcuc2JpbiAtPiBucHUuc2Jp
bi4xLjEuMi42NQorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNF
LmFtZG5wdSBmb3IgZGV0YWlscy4KKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNl
UmVmLUxJQ0VOU0UuYW1kbnB1CisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAKKyMgQEAg
LTI4NTUsNiArMjk1NCw3IEBACisjICBMaW5rOiBhbWR0ZWUvYW1kX3BtZl92M18xLmJpbiAtPiBm
MjliYjNkOS1iZDY2LTU0NDEtYWZiODhhY2MyYjJiNjBkNi5iaW4KKyMgIAorIyAgTGljZW5jZTog
UmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5hbWRfcG1mIGZvciBkZXRhaWxzLgorIyArU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5TRS5hbWRfcG1mCisjICAKKyMg
IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCisjICAKKyMgQEAgLTI4NjQsNiArMjk2NCw3IEBACisjICBWZXJz
aW9uOiAxLjIuOAorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNF
LnNlbnNvcmF5IGZvciBkZXRhaWxzLgorIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vu
c2VSZWYtTElDRU5DRS5zZW5zb3JheQorIyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisj
IEBAIC0yODcyLDYgKzI5NzMsOSBAQAorIyAgRmlsZTogcWxvZ2ljL3NkNzIyMC5mdworIyAgCisj
ICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLmliX3FpYiBmb3IgZGV0YWls
cy4KKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOU0UuaWJfcWli
CisjICsKKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgT1IgTGludXgt
T3BlbklCCisjICAKKyMgIEZvdW5kIGluIGhleCBmb3JtIGluIGtlcm5lbCBzb3VyY2UuCisjICAK
KyMgQEAgLTI5MDEsNiArMzAwNSw3IEBACisjICBGaWxlOiBxZWQvcWVkX2luaXRfdmFsdWVzX3pp
cHBlZC04LjU5LjEuMC5iaW4KKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUg
TElDRU5TRS5xZWQgZm9yIGRldGFpbHMuCisjICtTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTGlj
ZW5zZVJlZi1MSUNFTlNFLnFlZAorIyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisjIEBA
IC0yOTEyLDYgKzMwMTcsNyBAQAorIyAgVmVyc2lvbjogMS4wCisjICAKKyMgIExpY2VuY2U6IFJl
ZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UudWVhZ2xlLWF0bTQtZmlybXdhcmUgZm9yIGRldGFp
bHMKKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOQ0UudWVhZ2xl
LWF0bTQtZmlybXdhcmUKKyMgIAorIyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgIAorIyBAQCAtMjky
Miw2ICszMDI4LDcgQEAKKyMgIFZlcnNpb246IDEuOC4xCisjICAKKyMgIExpY2VuY2U6IFJlZGlz
dHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UudnhnZSBmb3IgZGV0YWlscy4KKyMgK1NQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOU0UudnhnZQorIyAgCisjICAtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQorIyAgCisjIEBAIC0yOTMyLDYgKzMwMzksNyBAQAorIyAgVmVyc2lvbjogNjEwLjgx
MgorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLmJyb2FkY29t
X2JjbTQzeHggZm9yIGRldGFpbHMuCisjICtTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTGljZW5z
ZVJlZi1MSUNFTkNFLmJyb2FkY29tX2JjbTQzeHgKKyMgIAorIyAgLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
KyMgIAorIyBAQCAtMjk2MSw2ICszMDY5LDcgQEAKKyMgIEZpbGU6IGJyY20vYnJjbWZtYWM0Mzcx
LXBjaWUuYmluCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0Uu
YnJvYWRjb21fYmNtNDN4eCBmb3IgZGV0YWlscy4KKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBMaWNlbnNlUmVmLUxJQ0VOQ0UuYnJvYWRjb21fYmNtNDN4eAorIyAgCisjICBGaWxlOiBicmNt
L2JyY21mbWFjNDM3My5iaW4KKyMgIEZpbGU6IGN5cHJlc3MvY3lmbWFjNDMwMTItc2Rpby5iaW4K
KyMgQEAgLTMwMDgsNiArMzExNyw3IEBACisjICBMaW5rOiBicmNtL2JyY21mbWFjNTQ1OTEtcGNp
ZS5jbG1fYmxvYiAtPiAuLi9jeXByZXNzL2N5Zm1hYzU0NTkxLXBjaWUuY2xtX2Jsb2IKKyMgIAor
IyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5jeXByZXNzIGZvciBkZXRh
aWxzLgorIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5DRS5jeXBy
ZXNzCisjICAKKyMgIEZpbGU6ICJicmNtL2JyY21mbWFjNDMyNDFiNC1zZGlvLkFkdmFudGVjaC1N
SUNBLTA3MS50eHQiCisjICBGaWxlOiAiYnJjbS9icmNtZm1hYzQzMjQxYjQtc2Rpby5JbnRlbCBD
b3JwLi1WQUxMRVlWSUVXIEMwIFBMQVRGT1JNLnR4dCIKKyMgQEAgLTMwODEsNiArMzE5MSw3IEBA
CisjICBMaW5rOiBicmNtL2JyY21mbWFjNDM0NTUtc2Rpby5waW5lNjQsc29xdWFydHotYmxhZGUu
dHh0IC0+IGJyY21mbWFjNDM0NTUtc2Rpby5BVy1DTTI1NlNNLnR4dAorIyAgCisjICBMaWNlbmNl
OiBHUEx2Mi4gU2VlIEdQTC0yLjAgZm9yIGRldGFpbHMuCisjICtTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogR1BMLTIuMC1vbmx5CisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAKKyMgQEAg
LTMwODksNiArMzIwMCw3IEBACisjICBGaWxlOiB0aS92cGRtYS0xYjguYmluCisjICAKKyMgIExp
Y2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UudGktdHNwYSBmb3IgZGV0YWlscy4K
KyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOQ0UudGktdHNwYQor
IyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisjIEBAIC0zMTAwLDYgKzMyMTIsNyBAQAor
IyAgRmlsZTogdGktY29ubmVjdGl2aXR5L3dsMTI1MS1udnMuYmluCisjICAKKyMgIExpY2VuY2U6
IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0Uud2wxMjUxIGZvciBkZXRhaWxzLgorIyArU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5DRS53bDEyNTEKKyMgIAorIyAg
SW5mbzoKKyMgIFRoZSBwdWJsaXNoZWQgTlZTIGZpbGVzIGFyZSBmb3IgdGVzdGluZyBvbmx5LiAg
RXZlcnkgZGV2aWNlIG5lZWRzIHRvCisjIEBAIC0zMTYzLDYgKzMyNzYsNyBAQAorIyAgTGluazog
dGktY29ubmVjdGl2aXR5L3dsMTI3MS1udnMuYmluIC0+IHdsMTI3eC1udnMuYmluCisjICAKKyMg
IExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UudGktY29ubmVjdGl2aXR5IGZv
ciBkZXRhaWxzLgorIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5D
RS50aS1jb25uZWN0aXZpdHkKKyMgIAorIyAgSW5mbzoKKyMgIFRoZSBOVlMgZmlsZSBpbmNsdWRl
cyB0d28gcGFydHM6CisjIEBAIC0zMTk4LDYgKzMzMTIsNyBAQAorIyAgVmVyc2lvbjogOC45LjAu
MC43OQorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLnRpLWNv
bm5lY3Rpdml0eSBmb3IgZGV0YWlscy4KKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNl
bnNlUmVmLUxJQ0VOQ0UudGktY29ubmVjdGl2aXR5CisjICAKKyMgIEluZm86CisjICBUaGUgZHJp
dmVyIGV4cGVjdHMgdG8gZmluZCB0aGUgZmlybXdhcmVzIHVuZGVyIGEgdGktY29ubmVjdGl2aXR5
CisjIEBAIC0zMjE3LDYgKzMzMzIsNyBAQAorIyAgVmVyc2lvbjogMS43LjAuMTIwCisjICAKKyMg
IExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UudGktY29ubmVjdGl2aXR5IGZv
ciBkZXRhaWxzLgorIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5D
RS50aS1jb25uZWN0aXZpdHkKKyMgIAorIyAgVGhlIGNjMzN4eC1jb25mLmJpbiBpcyBhIGJpbmFy
eSBjb250YWluaW5nIHR3byBwYXJ0czogcmFkaW8gY2FsaWJyYXRpb24KKyMgIGFuZCBoYXJkd2Fy
ZSBjb25maWd1cmF0aW9uLiBUaGUgYmluYXJ5IGNhbiBiZSBtb2RpZmllZCB1c2luZyB0aGUgdG9v
bAorIyBAQCAtMzI0MCw2ICszMzU2LDcgQEAKKyMgIEZpbGU6IHRpLWNvbm5lY3Rpdml0eS9USUlu
aXRfNy4yLjMxLmJ0cworIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNF
TkNFLnRpLWNvbm5lY3Rpdml0eSBmb3IgZGV0YWlscy4KKyMgK1NQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiBMaWNlbnNlUmVmLUxJQ0VOQ0UudGktY29ubmVjdGl2aXR5CisjICAKKyMgIEluZm86Cisj
ICAJVElJbml0XzcuMi4zMS5idHMgdmVyc2lvbiA3LjIuMzEKKyMgQEAgLTMyNTMsNiArMzM3MCw3
IEBACisjICBGaWxlOiB0bGcyMzAwX2Zpcm13YXJlLmJpbgorIyAgCisjICBMaWNlbmNlOiBSZWRp
c3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLnRsZzIzMDAgZm9yIGRldGFpbHMuCisjICtTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogTGljZW5zZVJlZi1MSUNFTlNFLnRsZzIzMDAKKyMgIAorIyAgLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KKyMgIAorIyBAQCAtMzI2Myw2ICszMzgxLDcgQEAKKyMgICAgICAgIFJl
dmVydGVkIHJ0bDgxODhDXzgxOTJDXzgxOTJEX3VzYl9saW51eF92My40LjJfMzcyNy4yMDEyMDQw
NAorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLnJ0bHdpZmlf
ZmlybXdhcmUudHh0IGZvciBkZXRhaWxzLgorIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExp
Y2Vuc2VSZWYtTElDRU5DRS5ydGx3aWZpX2Zpcm13YXJlLnR4dAorIyAgCisjICAtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQorIyAgCisjIEBAIC0zMjc0LDYgKzMzOTMsNyBAQAorIyAgSW5mbzogRnJvbSBWZW5k
b3IncyByZWFsdGVrL3J0bHdpZmlfbGludXhfbWFjODAyMTFfMDAxOS4wMzIwLjIwMTRWNjI4IGRy
aXZlcgorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLnJ0bHdp
ZmlfZmlybXdhcmUudHh0IGZvciBkZXRhaWxzLgorIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IExpY2Vuc2VSZWYtTElDRU5DRS5ydGx3aWZpX2Zpcm13YXJlLnR4dAorIyAgCisjICAtLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQorIyAgCisjIEBAIC0zMjkxLDYgKzM0MTEsNyBAQAorIyAgICAgICAgICAtIHJ0
bHdpZmkvcnRsODE5MmN1ZndfVE1TQy5iaW46IFJ0bDgxOTJDVUZ3VFNNQ0ltZ0FycmF5CisjICAK
KyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UucnRsd2lmaV9maXJtd2Fy
ZS50eHQgZm9yIGRldGFpbHMuCisjICtTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTGljZW5zZVJl
Zi1MSUNFTkNFLnJ0bHdpZmlfZmlybXdhcmUudHh0CisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CisjICAKKyMgQEAgLTMzMDAsNiArMzQyMSw3IEBACisjICBGaWxlOiBydGx3aWZpL3J0bDgxOTJz
ZWZ3LmJpbgorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLnJ0
bHdpZmlfZmlybXdhcmUudHh0IGZvciBkZXRhaWxzLgorIyArU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IExpY2Vuc2VSZWYtTElDRU5DRS5ydGx3aWZpX2Zpcm13YXJlLnR4dAorIyAgCisjICAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQorIyAgCisjIEBAIC0zMzA5LDYgKzM0MzEsNyBAQAorIyAgRmlsZTogcnRs
d2lmaS9ydGw4MTkyZGVmdy5iaW4KKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBT
ZWUgTElDRU5DRS5ydGx3aWZpX2Zpcm13YXJlLnR4dCBmb3IgZGV0YWlscy4KKyMgK1NQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOQ0UucnRsd2lmaV9maXJtd2FyZS50eHQK
KyMgIAorIyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgIAorIyBAQCAtMzMxOSw2ICszNDQyLDcgQEAK
KyMgIFZlcnNpb246IDM5LjAKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUg
TElDRU5DRS5ydGx3aWZpX2Zpcm13YXJlLnR4dCBmb3IgZGV0YWlscy4KKyMgK1NQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOQ0UucnRsd2lmaV9maXJtd2FyZS50eHQKKyMg
IAorIyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgIAorIyBAQCAtMzMyOSw2ICszNDUzLDcgQEAKKyMg
IEZpbGU6IHJ0bHdpZmkvcnRsODcyM2Z3X0IuYmluCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJp
YnV0YWJsZS4gU2VlIExJQ0VOQ0UucnRsd2lmaV9maXJtd2FyZS50eHQgZm9yIGRldGFpbHMuCisj
ICtTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTGljZW5zZVJlZi1MSUNFTkNFLnJ0bHdpZmlfZmly
bXdhcmUudHh0CisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAKKyMgQEAgLTMzNDAsNiAr
MzQ2NSw3IEBACisjICBGaWxlOiBydGx3aWZpL3J0bDg3MjNiZWZ3XzM2LmJpbgorIyAgCisjICBM
aWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLnJ0bHdpZmlfZmlybXdhcmUudHh0
IGZvciBkZXRhaWxzLgorIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElD
RU5DRS5ydGx3aWZpX2Zpcm13YXJlLnR4dAorIyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAg
CisjIEBAIC0zMzQ5LDYgKzM0NzUsNyBAQAorIyAgRmlsZTogcnRsd2lmaS9ydGw4NzIzZGVmdy5i
aW4KKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5ydGx3aWZp
X2Zpcm13YXJlLnR4dCBmb3IgZGV0YWlscy4KKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBM
aWNlbnNlUmVmLUxJQ0VOQ0UucnRsd2lmaV9maXJtd2FyZS50eHQKKyMgIAorIyAgLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KKyMgIAorIyBAQCAtMzM1OCw2ICszNDg1LDcgQEAKKyMgIEZpbGU6IHJ0bHdpZmkv
cnRsODE4OGVmdy5iaW4KKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElD
RU5DRS5ydGx3aWZpX2Zpcm13YXJlLnR4dCBmb3IgZGV0YWlscy4KKyMgK1NQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOQ0UucnRsd2lmaV9maXJtd2FyZS50eHQKKyMgIAor
IyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgIAorIyBAQCAtMzM2OCw2ICszNDk2LDcgQEAKKyMgIEZp
bGU6IHJ0bHdpZmkvcnRsODgxMmFlZndfd293bGFuLmJpbgorIyAgCisjICBMaWNlbmNlOiBSZWRp
c3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLnJ0bHdpZmlfZmlybXdhcmUudHh0IGZvciBkZXRhaWxz
LgorIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5DRS5ydGx3aWZp
X2Zpcm13YXJlLnR4dAorIyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisjIEBAIC0zMzgw
LDYgKzM1MDksNyBAQAorIyAgRmlsZTogcnRsd2lmaS9ydGw4ODIxYWVmd18yOS5iaW4KKyMgIAor
IyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5ydGx3aWZpX2Zpcm13YXJl
LnR4dCBmb3IgZGV0YWlscy4KKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVm
LUxJQ0VOQ0UucnRsd2lmaV9maXJtd2FyZS50eHQKKyMgIAorIyAgLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
KyMgIAorIyBAQCAtMzM4OSw2ICszNTE5LDcgQEAKKyMgIEZpbGU6IHJ0bHdpZmkvcnRsODgyMmJl
ZncuYmluCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UucnRs
d2lmaV9maXJtd2FyZS50eHQgZm9yIGRldGFpbHMuCisjICtTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogTGljZW5zZVJlZi1MSUNFTkNFLnJ0bHdpZmlfZmlybXdhcmUudHh0CisjICAKKyMgIC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCisjICAKKyMgQEAgLTM0MDksNiArMzU0MCw3IEBACisjICBGaWxlOiBydHc4
OC9ydHc4ODE0YV9mdy5iaW4KKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUg
TElDRU5DRS5ydGx3aWZpX2Zpcm13YXJlLnR4dCBmb3IgZGV0YWlscy4KKyMgK1NQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOQ0UucnRsd2lmaV9maXJtd2FyZS50eHQKKyMg
IAorIyAgSW5mbzoKKyMgICAgICBUaGVzZSBmaXJtd2FyZSBzaG91bGQgYmUgcHV0IHVuZGVyIC9s
aWIvZmlybXdhcmUvcnR3ODgvCisjIEBAIC0zNDQxLDkgKzM1NzMsMTMgQEAKKyMgIEZpbGU6IHJ0
dzg5L3J0dzg5MjJhX2Z3LTMuYmluCisjICBGaWxlOiBydHc4OS9ydHc4OTIyYV9mdy00LmJpbgor
IyAgRmlsZTogcnR3ODkvcnR3ODkyMmRfZncuYmluCisjICtGaWxlOiBydHc4OS9ydHc4OTIyZF9m
dy0xLmJpbgorIyAgRmlsZTogcnR3ODkvcnR3ODkyMmRzX2Z3LmJpbgorIyArRmlsZTogcnR3ODkv
cnR3ODkyMmRzX2Z3LTEuYmluCisjICtGaWxlOiBydHc4OS9ib2FyZF9lbG0uYmluCisjICAKKyMg
IExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UucnRsd2lmaV9maXJtd2FyZS50
eHQgZm9yIGRldGFpbHMuCisjICtTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTGljZW5zZVJlZi1M
SUNFTkNFLnJ0bHdpZmlfZmlybXdhcmUudHh0CisjICAKKyMgICAgIFRoZXNlIGZpcm13YXJlIHN1
cHBvcnQgODAyLjExYXggY2hpcHMgaW5jbHVkaW5nIFJUTDg4NTFCLCBSVEw4ODUyQSwKKyMgICAg
IFJUTDg4NTJCLCBSVEw4ODUyQlQgYW5kIFJUTDg4NTJDIGFuZCA4MDIuMTFiZSBjaGlwIGluY2x1
ZGluZyBSVEw4OTIyQS4KKyMgQEAgLTM0NjAsNiArMzU5Niw3IEBACisjICBMaW5rOiBydGx3aWZp
L3J0bDgxOTJlZWZ3LmJpbiAtPiBydGw4MTkyZXVfbmljLmJpbgorIyAgCisjICBMaWNlbmNlOiBS
ZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLnJ0bHdpZmlfZmlybXdhcmUudHh0IGZvciBkZXRh
aWxzLgorIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5DRS5ydGx3
aWZpX2Zpcm13YXJlLnR4dAorIyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisjIEBAIC0z
NDczLDYgKzM2MTAsNyBAQAorIyAgTGluazogcnRsd2lmaS9ydGw4NzIzYnNfd293bGFuLmJpbiAt
PiBydGw4NzIzYnVfd293bGFuLmJpbgorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUu
IFNlZSBMSUNFTkNFLnJ0bHdpZmlfZmlybXdhcmUudHh0IGZvciBkZXRhaWxzLgorIyArU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5DRS5ydGx3aWZpX2Zpcm13YXJlLnR4
dAorIyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisjIEBAIC0zNTMxLDYgKzM2NjksNyBA
QAorIyAgVmVyc2lvbjogNy4zCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2Vl
IExJQ0VOQ0UucnRsd2lmaV9maXJtd2FyZS50eHQgZm9yIGRldGFpbHMuCisjICtTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogTGljZW5zZVJlZi1MSUNFTkNFLnJ0bHdpZmlfZmlybXdhcmUudHh0Cisj
ICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAKKyMgQEAgLTM2MzMsNiArMzc3Miw3IEBACisj
ICBWZXJzaW9uOiAwLjAuMQorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBM
SUNFTlNFLnI4MTY5IGZvciBkZXRhaWxzLgorIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExp
Y2Vuc2VSZWYtTElDRU5TRS5yODE2OQorIyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisj
IEBAIC0zNjQ3LDYgKzM3ODcsNyBAQAorIyAgRmlsZTogcnRsX25pYy9ydGw4MTU2Yi0yLmZ3Cisj
ICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UucnRsd2lmaV9maXJt
d2FyZS50eHQgZm9yIGRldGFpbHMuCisjICtTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTGljZW5z
ZVJlZi1MSUNFTkNFLnJ0bHdpZmlfZmlybXdhcmUudHh0CisjICAKKyMgIC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCisjICAKKyMgQEAgLTM2NjIsNiArMzgwMyw3IEBACisjICBWZXJzaW9uOiAxLjEwLjAKKyMg
IAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5ydDEzMjAgZm9yIGRl
dGFpbHMuCisjICtTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTGljZW5zZVJlZi1MSUNFTlNFLnJ0
MTMyMAorIyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisjIEBAIC0zNjcwLDYgKzM4MTIs
NyBAQAorIyAgRmlsZTogdm50d3VzYi5mdworIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFi
bGUuIFNlZSBMSUNFTkNFLnZpYV92dDY2NTYgZm9yIGRldGFpbHMuCisjICtTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogTUlUCisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAKKyMgQEAgLTM2
OTQsNiArMzgzNyw3IEBACisjICBGaWxlOiBhcjNrL3JhbXBzXzB4MzEwMTAxMDBfNDAuZGZ1Cisj
ICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UuYXRoZXJvc19maXJt
d2FyZSBmb3IgZGV0YWlscworIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYt
TElDRU5DRS5hdGhlcm9zX2Zpcm13YXJlCisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAK
KyMgQEAgLTM3MDMsNiArMzg0Nyw3IEBACisjICBGaWxlOiBhcjNrLzEwMjAyMDFjb2V4L3JhbXBz
XzB4MDEwMjAyMDFfMjZfSGlnaFByaW9yaXR5LmRmdQorIyAgCisjICBMaWNlbmNlOiBSZWRpc3Ry
aWJ1dGFibGUuIFNlZSBMSUNFTlNFLlF1YWxjb21tQXRoZXJvc19hcjNrIGZvciBkZXRhaWxzCisj
ICtTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTGljZW5zZVJlZi1MSUNFTlNFLlF1YWxjb21tQXRo
ZXJvc19hcjNrCisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAKKyMgQEAgLTM3MjEsNiAr
Mzg2Niw3IEBACisjICBGaWxlOiBhcjNrLzMwMDAwL1JhbVBhdGNoLnR4dAorIyAgCisjICBMaWNl
bmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLmF0aGVyb3NfZmlybXdhcmUgZm9yIGRl
dGFpbHMKKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOQ0UuYXRo
ZXJvc19maXJtd2FyZQorIyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisjIEBAIC0zNzU3
LDYgKzM5MDMsNyBAQAorIyAgRmlsZTogYXRoNmsvQVI2MDAyL2RhdGEucGF0Y2guaHcyXzAuYmlu
CisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UuYXRoZXJvc19m
aXJtd2FyZSBmb3IgZGV0YWlscworIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VS
ZWYtTElDRU5DRS5hdGhlcm9zX2Zpcm13YXJlCisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisj
ICAKKyMgQEAgLTM4MzAsNiArMzk3Nyw3IEBACisjICBGaWxlOiBhdGgxMGsvV0NOMzk5MC9odzEu
MC9zaGlrcmEvbm90aWNlLnR4dF93bGFubWRzcAorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1
dGFibGUuIFNlZSBMSUNFTlNFLlF1YWxjb21tQXRoZXJvc19hdGgxMGsgZm9yIGRldGFpbHMKKyMg
K1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOU0UuUXVhbGNvbW1BdGhl
cm9zX2F0aDEwaworIyAgCisjICBGaWxlOiBhdGgxMGsvV0NOMzk5MC9odzEuMC9xY20yMjkwL3ds
YW5tZHNwLm1ibgorIyAgVmVyc2lvbjogV0xBTi5ITC4zLjMuNy5jMi0wMDkzMS1RQ0FITFNXTVRQ
TFotMQorIyBAQCAtMzg0MCw2ICszOTg4LDcgQEAKKyMgIExpbms6IGF0aDEway9XQ04zOTkwL2h3
MS4wL3FyYjQyMTAvZmlybXdhcmUtNS5iaW4gLT4gLi4vcWNtMjI5MC9maXJtd2FyZS01LmJpbgor
IyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLnFjb20gYW5kIE5P
VElDRS5xY29tIGZvciBkZXRhaWxzCisjICtTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTGljZW5z
ZVJlZi1MSUNFTlNFLnFjb20KKyMgIAorIyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgIAorIyBAQCAt
Mzk0OCw2ICs0MDk3LDcgQEAKKyMgIEZpbGU6IGF0aDExay9RQ0E2Njk4QVEvaHcyLjEvTm90aWNl
LnR4dAorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLlF1YWxj
b21tQXRoZXJvc19hdGgxMGsgZm9yIGRldGFpbHMKKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBMaWNlbnNlUmVmLUxJQ0VOU0UuUXVhbGNvbW1BdGhlcm9zX2F0aDEwaworIyAgCisjICBGaWxl
OiBhdGgxMWsvV0NONjc1MC9odzEuMC9xY202NDkwL3dwc3MubWJuCisjICBWZXJzaW9uOiBXTEFO
Lk1TTC4yLjAuYzItMDAyMDQtUUNBTVNMU1dQTFotMQorIyBAQCAtMzk1NSw2ICs0MTA1LDcgQEAK
KyMgIExpbms6IHFjb20vcWNzNjQ5MC93cHNzLm1ibiAtPiAuLi8uLi9hdGgxMWsvV0NONjc1MC9o
dzEuMC9xY202NDkwL3dwc3MubWJuCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4g
U2VlIExJQ0VOU0UucWNvbSBhbmQgTk9USUNFLnFjb20gZm9yIGRldGFpbHMKKyMgK1NQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOU0UucWNvbQorIyAgCisjICAtLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQorIyAgCisjIEBAIC0zOTg2LDYgKzQxMzcsNyBAQAorIyAgRmlsZTogYXRoMTJr
L1FDQzIwNzIvaHcxLjAvTm90aWNlLnR4dAorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFi
bGUuIFNlZSBMSUNFTlNFLlF1YWxjb21tQXRoZXJvc19hdGgxMGsgZm9yIGRldGFpbHMKKyMgK1NQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOU0UuUXVhbGNvbW1BdGhlcm9z
X2F0aDEwaworIyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisjIEBAIC00MDAyLDYgKzQx
NTQsNyBAQAorIyAgVmVyc2lvbjogMS40LjU3CisjICAKKyMgIExpY2Vuc2U6IFJlZGlzdHJpYnV0
YWJsZS4gIFNlZSBMSUNFTkNFLm15cmkxMGdlX2Zpcm13YXJlIGZvciBkZXRhaWxzLgorIyArU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IEJTRC0yLUNsYXVzZQorIyAgCisjICAtLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQorIyAgCisjIEBAIC00MDE2LDYgKzQxNjksNyBAQAorIyAgRmlsZTogYXRoNmsvQVI2MDAz
LjEvaHcyLjEuMS9vdHAuYmluCisjICAKKyMgIExpY2Vuc2U6IFJlZGlzdHJpYnV0YWJsZS4gU2Vl
IExJQ0VOQ0UuYXRoZXJvc19maXJtd2FyZSBmb3IgZGV0YWlscworIyArU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5DRS5hdGhlcm9zX2Zpcm13YXJlCisjICAKKyMgIC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCisjICAKKyMgQEAgLTQwMjgsNiArNDE4Miw3IEBACisjICBGaWxlOiBh
cjNrLzMwMTAxY29leC9SYW1QYXRjaC50eHQKKyMgIAorIyAgTGljZW5zZTogUmVkaXN0cmlidXRh
YmxlLiBTZWUgTElDRU5DRS5hdGhlcm9zX2Zpcm13YXJlIGZvciBkZXRhaWxzCisjICtTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogTGljZW5zZVJlZi1MSUNFTkNFLmF0aGVyb3NfZmlybXdhcmUKKyMg
IAorIyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgIAorIyBAQCAtNDAzNiw2ICs0MTkxLDcgQEAKKyMg
IEZpbGU6IGR2Yi11c2ItdGVycmF0ZWMtaDUtZHJ4ay5mdworIyAgCisjICBMaWNlbmNlOiBSZWRp
c3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLmRyeGsgZm9yIGRldGFpbHMuCisjICtTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogTGljZW5zZVJlZi1MSUNFTlNFLmRyeGsKKyMgIAorIyAgLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KKyMgIAorIyBAQCAtNDA0OSw2ICs0MjA1LDcgQEAKKyMgIEZpbGU6IGVuZS11YjYy
NTAvbXNfcmR3ci5iaW4KKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElD
RU5DRS5lbmVfZmlybXdhcmUgZm9yIGRldGFpbHMuCisjICtTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogSVNDCisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAKKyMgQEAgLTQwNTgsNiArNDIx
NSw3IEBACisjICBTb3VyY2U6IGlzY2kvCisjICAKKyMgIExpY2VuY2U6IEdQTHYyLiBTZWUgR1BM
LTIuMCBmb3IgZGV0YWlscy4KKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9u
bHkKKyMgIAorIyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgIAorIyBAQCAtNDA2Niw2ICs0MjI0LDcg
QEAKKyMgIEZpbGU6IGFyNTUyMy5iaW4KKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxl
LiBTZWUgTElDRU5DRS5hdGhlcm9zX2Zpcm13YXJlIGZvciBkZXRhaWxzCisjICtTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogTGljZW5zZVJlZi1MSUNFTkNFLmF0aGVyb3NfZmlybXdhcmUKKyMgIAor
IyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgIAorIyBAQCAtNDA3OSw2ICs0MjM4LDcgQEAKKyMgIEZp
bGU6IHM1cC1tZmMtdjEyLmZ3CisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2Vl
IExJQ0VOU0UuczVwLW1mYyBmb3IgZGV0YWlscy4KKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBMaWNlbnNlUmVmLUxJQ0VOU0UuczVwLW1mYworIyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQor
IyAgCisjIEBAIC00MDkxLDYgKzQyNTEsNyBAQAorIyAgRG93bmxvYWRlZCBmcm9tIGh0dHA6Ly9s
aW51eHdpcmVsZXNzLm9yZy9lbi91c2Vycy9Ecml2ZXJzL2Nhcmw5MTcwCisjICAKKyMgIExpY2Vu
Y2U6IEdQTHYyIG9yIGxhdGVyLiBTb21lIGJ1aWxkIHNjcmlwdHMgdXNlIHRoZSBOZXcgQlNEICgz
LWNsYXVzZSkgbGljZW5jZS4gU2VlIEdQTC0yLjAgZm9yIGRldGFpbHMuCisjICtTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgorIyAgCisjICAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQorIyAgCisjIEBAIC00MTAwLDYgKzQyNjEsNyBAQAorIyAgRmlsZTogY3RzcGVxLmJpbgorIyAg
CisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLmNhMDEzMiBmb3IgZGV0
YWlscworIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5DRS5jYTAx
MzIKKyMgIAorIyAgSW5mbzogRm91bmQgYWxzbyBpbiBhbHNhLWZpcm13YXJlIHBhY2thZ2UuCisj
ICAKKyMgQEAgLTQyMDYsNyArNDM2OCw3IEBACisjICBMaW5rOiBpbnRlbC9pYnQtMDA0MC0xMDUw
LmRkYyAtPiBpYnQtMDA0MC0wMDQxLmRkYworIyAgTGluazogaW50ZWwvaWJ0LTEwNDAtMTA1MC5z
ZmkgLT4gaWJ0LTEwNDAtMDA0MS5zZmkKKyMgIExpbms6IGludGVsL2lidC0xMDQwLTEwNTAuZGRj
IC0+IGlidC0xMDQwLTAwNDEuZGRjCisjIC1WZXJzaW9uOiBCVF9Tb2xhcl9SRUw4MjEyMl8yMy41
MC4yNjA1My44MjEyMgorIyArVmVyc2lvbjogQlRfU29sYXJfUkVMODIyMDBfMjMuNTAuMjYyOTIu
ODIyMDAKKyMgIAorIyAgRmlsZTogaW50ZWwvaWJ0LTAwNDAtMTAyMC5zZmkKKyMgIEZpbGU6IGlu
dGVsL2lidC0wMDQwLTEwMjAuZGRjCisjIEBAIC00MjI0LDEzICs0Mzg2LDE1IEBACisjICBGaWxl
OiBpbnRlbC9pYnQtMDA5My00MTUwLmRkYworIyAgRmlsZTogaW50ZWwvaWJ0LTAwOTMtMTA1MC5z
ZmkKKyMgIEZpbGU6IGludGVsL2lidC0wMDkzLTEwNTAuZGRjCisjIC1WZXJzaW9uOiBCVF9CbGF6
YXJ1SHJwR2ZwX1NfUkVMMzA4XzI0LjAwLjI2MTM0LjMwOAorIyArVmVyc2lvbjogQlRfQmxhemFy
dUhycEdmcF9TX1JFTDQwNV8yNC4wMC4yNjMwNC40MDUKKyMgIAorIyAgRmlsZTogaW50ZWwvaWJ0
LTAyOTEtMDI5MS5zZmkKKyMgIEZpbGU6IGludGVsL2lidC0wMjkxLTAyOTEuZGRjCisjICtWZXJz
aW9uOiBCVF9CbGF6YXJVX1NfUkVMMTI1NTg1XzI0LjgwLjI2MzYyLjEyNTU4NQorIyArCisjICBG
aWxlOiBpbnRlbC9pYnQtMDA5My0wMjkxLnNmaQorIyAgRmlsZTogaW50ZWwvaWJ0LTAwOTMtMDI5
MS5kZGMKKyMgLVZlcnNpb246IEJUX0JsYXphclVfU19SRUwxMjA2MTFfMjQuNzAuMjYyOTMuMTIw
NjExCisjICtWZXJzaW9uOiBCVF9CbGF6YXJ1Rm1wQXJsX1NfUkVMNThfMjQuNzAuMjYzMzMuNTgK
KyMgIAorIyAgRmlsZTogaW50ZWwvaWJ0LTAxODAtMDA0MS5zZmkKKyMgIEZpbGU6IGludGVsL2li
dC0wMTgwLTAwNDEuZGRjCisjIEBAIC00MjM4LDcgKzQ0MDIsNyBAQAorIyAgRmlsZTogaW50ZWwv
aWJ0LTAxODAtNDE1MC5kZGMKKyMgIEZpbGU6IGludGVsL2lidC0wMTgwLTEwNTAuc2ZpCisjICBG
aWxlOiBpbnRlbC9pYnQtMDE4MC0xMDUwLmRkYworIyAtVmVyc2lvbjogQlRfTWFnbmV0YXJfUkVM
MTAzODgyXzIzLjUwLjI1MjA1LjEwMzg4MgorIyArVmVyc2lvbjogQlRfTWFnbmV0YXJfUkVMMTA0
MDI3XzIzLjUwLjI2MjkyLjEwNDAyNworIyAgCisjICBGaWxlOiBpbnRlbC9pYnQtMDE5MC0wMjkx
LnNmaQorIyAgRmlsZTogaW50ZWwvaWJ0LTAxOTAtMDI5MS5kZGMKKyMgQEAgLTQyNTUsMTkgKzQ0
MTksMTkgQEAKKyMgIEZpbGU6IGludGVsL2lidC0xMTkwLTAwNDEtcGNpLnNmaQorIyAgRmlsZTog
aW50ZWwvaWJ0LTExOTAtMDA0MS11c2Iuc2ZpCisjICBGaWxlOiBpbnRlbC9pYnQtMTE5MC0wMDQx
LXVzYi5kZGMKKyMgLVZlcnNpb246IEJUX0JsYXphcmlHZnBfU19SRUwyNDRfMjQuMDAuMjYxMzQu
MjQ0CisjICtWZXJzaW9uOiBCVF9CbGF6YXJpR2ZwX1NfUkVMMzQ5XzI0LjAwLjI2MzA0LjM0OQor
IyAgCisjICBGaWxlOiBpbnRlbC9pYnQtMDE5MC0wMjkxLWltbC5zZmkKKyMgIEZpbGU6IGludGVs
L2lidC0wMTkwLTAyOTEtdXNiLmRkYworIyAgRmlsZTogaW50ZWwvaWJ0LTAxOTAtMDI5MS11c2Iu
c2ZpCisjICBGaWxlOiBpbnRlbC9pYnQtMDE5MC0wMjkxLXBjaS5kZGMKKyMgIEZpbGU6IGludGVs
L2lidC0wMTkwLTAyOTEtcGNpLnNmaQorIyAtVmVyc2lvbjogQlRfQmxhemFySV9TX1JFTDEyNTMy
NV8yNC42MC4yNjI2Mi4xMjUzMjUKKyMgK1ZlcnNpb246IEJUX0JsYXphcmlGbXBfU19SRUw2Ml8y
NC43MC4yNjMzMy42MgorIyAgCisjICBGaWxlOiBpbnRlbC9pYnQtMTE5MC0wMWExLWltbC5zZmkK
KyMgIEZpbGU6IGludGVsL2lidC0xMTkwLTAxYTEtcGNpLmRkYworIyAgRmlsZTogaW50ZWwvaWJ0
LTExOTAtMDFhMS1wY2kuc2ZpCisjIC1WZXJzaW9uOiBCVF9CbGF6YXJJX1NfUkVMMTI3OTg4XzI0
LjcwLjI2MjkzLjEyNzk4OAorIyArVmVyc2lvbjogQlRfQmxhemFySV9TX1JFTDEzMjkzMV8yNC44
MC4yNjM2Mi4xMzI5MzEKKyMgIAorIyAgRmlsZTogaW50ZWwvaWJ0LTAwYTAtMDFhMS1pbWwuc2Zp
CisjICBGaWxlOiBpbnRlbC9pYnQtMDBhMC0wMWExLXBjaS5kZGMKKyMgQEAgLTQyNzUsMTQgKzQ0
MzksMTUgQEAKKyMgIEZpbGU6IGludGVsL2lidC0wMGEwLTAyOTEtaW1sLnNmaQorIyAgRmlsZTog
aW50ZWwvaWJ0LTAwYTAtMDI5MS1wY2kuZGRjCisjICBGaWxlOiBpbnRlbC9pYnQtMDBhMC0wMjkx
LXBjaS5zZmkKKyMgLVZlcnNpb246IEJUX1Njb3JwaXVzX1NfUkVMOTY5ODJfMjQuNzAuMjYyOTMu
OTY5ODIKKyMgK1ZlcnNpb246IEJUX1Njb3JwaXVzX1NfUkVMMTAyMTYzXzI0LjgwLjI2MzYyLjEw
MjE2MworIyAgCisjICBGaWxlOiBpbnRlbC9pYnQtMDBhMC0wMDQxLWltbC5zZmkKKyMgIEZpbGU6
IGludGVsL2lidC0wMGEwLTAwNDEtcGNpLmRkYworIyAgRmlsZTogaW50ZWwvaWJ0LTAwYTAtMDA0
MS1wY2kuc2ZpCisjIC1WZXJzaW9uOiBCVF9TY29ycGl1c0dmcF9TX1JFTDI5MV8yNC4wMC4yNjEz
NC4yOTEKKyMgK1ZlcnNpb246IEJUX1Njb3JwaXVzR2ZwX1NfUkVMMzg0XzI0LjAwLjI2MzA0LjM4
NAorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLmlidF9maXJt
d2FyZSBmb3IgZGV0YWlscworIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYt
TElDRU5DRS5pYnRfZmlybXdhcmUKKyMgIAorIyAgRmlsZTogcnRsX2J0L3J0bDgxOTJlZV9mdy5i
aW4KKyMgIEZpbGU6IHJ0bF9idC9ydGw4MTkyZXVfZncuYmluCisjIEBAIC00MzMzLDYgKzQ0OTgs
NyBAQAorIyAgRmlsZTogcnRsX2J0L3J0bDg5MjJhdV9jb25maWcuYmluCisjICAKKyMgIExpY2Vu
Y2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UucnRsd2lmaV9maXJtd2FyZS50eHQgZm9y
IGRldGFpbHMuCisjICtTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTGljZW5zZVJlZi1MSUNFTkNF
LnJ0bHdpZmlfZmlybXdhcmUudHh0CisjICAKKyMgIEluZm86CisjICBGb3VuZCBpbiB2ZW5kb3Ig
ZHJpdmVyLCBsaW51eF9idF91c2JfMi4xMS4yMDE0MDQyM184NzIzYmUucmFyCisjIEBAIC00MzQ4
LDYgKzQ1MTQsNyBAQAorIyAgTGluazogbXQ3NjUwLmJpbiAtPiBtZWRpYXRlay9tdDc2NTAuYmlu
CisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UucmFsaW5rX2Ff
bWVkaWF0ZWtfY29tcGFueV9maXJtd2FyZSBmb3IgZGV0YWlscworIyArU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5DRS5yYWxpbmtfYV9tZWRpYXRla19jb21wYW55X2Zp
cm13YXJlCisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAKKyMgQEAgLTQzNTYsNiArNDUy
Myw3IEBACisjICBGaWxlOiBycDIuZncKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxl
LiBTZWUgTElDRU5TRS5ycDIgZm9yIGRldGFpbHMuCisjICtTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogTGljZW5zZVJlZi1MSUNFTlNFLnJwMgorIyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAg
CisjIEBAIC00MzY3LDYgKzQ1MzUsNyBAQAorIyAgTGluazogczIyNTBfbG9hZGVyLmZ3IC0+IGdv
NzAwNy9zMjI1MC0xLmZ3CisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJ
Q0VOQ0Uuc2Vuc29yYXkgZm9yIGRldGFpbHMKKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBM
aWNlbnNlUmVmLUxJQ0VOQ0Uuc2Vuc29yYXkKKyMgIAorIyAgRmlsZTogZ283MDA3L2dvNzAwN2Z3
LmJpbgorIyAgRmlsZTogZ283MDA3L2dvNzAwN3R2LmJpbgorIyBAQCAtNDM3Niw2ICs0NTQ1LDcg
QEAKKyMgIEZpbGU6IGdvNzAwNy93aXMtc3RhcnRyZWsuZncKKyMgIAorIyAgTGljZW5jZTogUmVk
aXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5nbzcwMDcgZm9yIGRldGFpbHMKKyMgK1NQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOQ0UuZ283MDA3CisjICAKKyMgIC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCisjICAKKyMgQEAgLTQzOTYsNiArNDU2Niw3IEBACisjICBGaWxlOiBhbWQv
UkVBRE1FLm1kCisjICAKKyMgIExpY2Vuc2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0Uu
YW1kLXNldiBmb3IgZGV0YWlscworIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VS
ZWYtTElDRU5TRS5hbWQtc2V2CisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAKKyMgQEAg
LTQ0MTYsNiArNDU4Nyw3IEBACisjICBGaWxlOiBhbWQtdWNvZGUvUkVBRE1FCisjICAKKyMgIExp
Y2Vuc2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UuYW1kLXVjb2RlIGZvciBkZXRhaWxz
CisjICtTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTGljZW5zZVJlZi1MSUNFTlNFLmFtZC11Y29k
ZQorIyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisjIEBAIC00NDI4LDYgKzQ2MDAsNyBA
QAorIyAgRmlsZTogbW94YS9tb3hhLTExNTEuZncKKyMgIAorIyAgTGljZW5zZTogUmVkaXN0cmli
dXRhYmxlLiBTZWUgTElDRU5DRS5tb3hhIGZvciBkZXRhaWxzCisjICtTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogTGljZW5zZVJlZi1MSUNFTkNFLm1veGEKKyMgIAorIyAgLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KKyMgIAorIyBAQCAtNDQ0OCw2ICs0NjIxLDcgQEAKKyMgIFZlcnNpb246IHYyLjAuMworIyAg
CisjICBMaWNlbnNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLm1veGEgZm9yIGRldGFp
bHMKKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOQ0UubW94YQor
IyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisjIEBAIC00NDU2LDEwICs0NjMwLDEyIEBA
CisjICBGaWxlOiB3c21fMjIuYmluCisjICBWZXJzaW9uOiBXU00zOTUKKyMgIExpY2VuY2U6IFJl
ZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UuY3cxMjAwIGZvciBkZXRhaWxzLgorIyArU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5DRS5jdzEyMDAKKyMgIAorIyAgRmls
ZTogc2RkX3NhZ3JhZF8xMDkxXzEwOTguYmluCisjICAKKyMgIExpY2Vuc2U6IFJlZGlzdHJpYnV0
YWJsZS4gU2VlIExJQ0VOQ0UuY3cxMjAwLXNkZCBmb3IgZGV0YWlscworIyArU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5DRS5jdzEyMDAtc2RkCisjICAKKyMgIC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCisjICAKKyMgQEAgLTQ0NzAsNiArNDY0Niw3IEBACisjICBGaWxlOiBjdDJm
dy0zLjIuNS4xLmJpbgorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNF
TlNFLmJmYSBmb3IgZGV0YWlscy4KKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNl
UmVmLUxJQ0VOU0UuYmZhCisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICBEcml2ZXI6IHFh
dCAtIEludGVsKFIpIFFBVCBjcnlwdG8gYWNjZWxlcmF0b3IKKyMgQEAgLTQ1MDUsNiArNDY4Miw3
IEBACisjICBMaW5rOiBxYXRfNDIweHhfbW1wLmJpbiAtPiBpbnRlbC9xYXQvcWF0XzQyMHh4X21t
cC5iaW4KKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5xYXRf
ZmlybXdhcmUgZm9yIGRldGFpbHMKKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNl
UmVmLUxJQ0VOQ0UucWF0X2Zpcm13YXJlCisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAK
KyMgQEAgLTQ1MjgsNiArNDcwNiw3IEBACisjICBWZXJzaW9uOiAxLjAuNWIKKyMgIAorIyAgTGlj
ZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5yc2kgZm9yIGRldGFpbHMuCisjICtT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTGljZW5zZVJlZi1MSUNFTlNFLnJzaQorIyAgCisjICAt
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQorIyAgCisjIEBAIC00NTM4LDYgKzQ3MTcsNyBAQAorIyAgRmlsZTog
cjhhNzc5eF91c2IzX3YzLmRsbWVtCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4g
U2VlIExJQ0VOQ0UucjhhNzc5eF91c2IzIGZvciBkZXRhaWxzLgorIyArU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5DRS5yOGE3Nzl4X3VzYjMKKyMgIAorIyAgLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KKyMgIAorIyBAQCAtNDU0Niw2ICs0NzI2LDcgQEAKKyMgIEZpbGU6IGludGVs
L2Z3X3NzdF8wZjI4LmJpbi00OGtIel9pMnNfbWFzdGVyCisjICAKKyMgIExpY2Vuc2U6IFJlZGlz
dHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UuZndfc3N0XzBmMjggZm9yIGRldGFpbHMKKyMgK1NQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOQ0UuZndfc3N0XzBmMjgKKyMgIAor
IyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgIAorIyBAQCAtNDU1NSw2ICs0NzM2LDcgQEAKKyMgIEZp
bGU6IGFzMTAyX2RhdGEyX3N0LmhleAorIyAgCisjICBMaWNlbnNlOiBSZWRpc3RyaWJ1dGFibGUu
IFNlZSBMSUNFTkNFLkFiaWxpcyBmb3IgZGV0YWlscworIyArU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IExpY2Vuc2VSZWYtTElDRU5DRS5BYmlsaXMKKyMgIAorIyAgLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
KyMgIAorIyBAQCAtNDU2NCw2ICs0NzQ2LDcgQEAKKyMgIEZpbGU6IGR2Yi11c2ItaXQ5MTM1LTAy
LmZ3CisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UuaXQ5MTN4
IGZvciBkZXRhaWxzCisjICtTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogSVNDCisjICAKKyMgIC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCisjICAKKyMgQEAgLTQ1NzQsNiArNDc1Nyw3IEBACisjICBMaW5rOiBp
bnRlbC9JbnRjU1NUMi5iaW4gLT4gY2F0cHQvYmR3L2RzcF9iYXNlZncuYmluCisjICAKKyMgIExp
Y2Vuc2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UuSW50Y1NTVDIgZm9yIGRldGFpbHMK
KyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOQ0UuSW50Y1NTVDIK
KyMgIAorIyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgIAorIyBAQCAtNDU5NSw2ICs0Nzc5LDcgQEAK
KyMgIFZlcnNpb246IDEwLjI4LjAwLjEyODIzCisjICAKKyMgIExpY2Vuc2U6IFJlZGlzdHJpYnV0
YWJsZS4gU2VlIExJQ0VOQ0UuYWRzcF9zc3QgZm9yIGRldGFpbHMKKyMgK1NQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOQ0UuYWRzcF9zc3QKKyMgIAorIyAgRmlsZTogaW50
ZWwvYXZzL2RhNzIxOS10cGxnLmJpbgorIyAgRmlsZTogaW50ZWwvYXZzL2RtaWMtdHBsZy5iaW4K
KyMgQEAgLTQ2MTUsNiArNDgwMCw3IEBACisjICBGaWxlOiBpbnRlbC9hdnMvc3NtNDU2Ny10cGxn
LmJpbgorIyAgCisjICBMaWNlbnNlOiBBcGFjaGUtMi4wLiBTZWUgQXBhY2hlLTIuMCBmb3IgZGV0
YWlscy4KKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBBcGFjaGUtMi4wCisjICAKKyMgIC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCisjICAKKyMgQEAgLTQ2MjQsNiArNDgxMCw3IEBACisjICBGaWxlOiBp
bnRlbC9md19zc3RfMGYyOF9zc3AwLmJpbgorIyAgCisjICBMaWNlbnNlOiBSZWRpc3RyaWJ1dGFi
bGUuIFNlZSBMSUNFTkNFLmZ3X3NzdF8wZjI4IGZvciBkZXRhaWxzCisjICtTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogTGljZW5zZVJlZi1MSUNFTkNFLmZ3X3NzdF8wZjI4CisjICAKKyMgIC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCisjICAKKyMgQEAgLTQ2MzMsNiArNDgyMCw3IEBACisjICBWZXJzaW9uOiAw
MS4wQi4wMi4wMgorIyAgCisjICBMaWNlbnNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNF
LmZ3X3NzdF8wZjI4IGZvciBkZXRhaWxzCisjICtTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTGlj
ZW5zZVJlZi1MSUNFTkNFLmZ3X3NzdF8wZjI4CisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisj
ICAKKyMgQEAgLTQ2NDQsNiArNDgzMiw3IEBACisjICBWZXJzaW9uOiA5LjIxLjAwLjM0MDJfMTYx
CisjICAKKyMgIExpY2Vuc2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UuYWRzcF9zc3Qg
Zm9yIGRldGFpbHMKKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VO
Q0UuYWRzcF9zc3QKKyMgIAorIyAgRmlsZTogaW50ZWwvZHNwX2Z3X2J4dG5fdjIyMTkuYmluCisj
ICBWZXJzaW9uOiA5LjIyLjAxLjIyMTlfNjQKKyMgQEAgLTQ2NTEsNiArNDg0MCw3IEBACisjICBW
ZXJzaW9uOiA5LjIyLjAxLjMzNjZfMTU3CisjICAKKyMgIExpY2Vuc2U6IFJlZGlzdHJpYnV0YWJs
ZS4gU2VlIExJQ0VOQ0UuYWRzcF9zc3QgZm9yIGRldGFpbHMKKyMgK1NQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOQ0UuYWRzcF9zc3QKKyMgIAorIyAgRmlsZTogaW50ZWwv
ZHNwX2Z3X2tibF92NzAxLmJpbgorIyAgVmVyc2lvbjogOS4yMS4wMC43MDEKKyMgQEAgLTQ2Njgs
NiArNDg1OCw3IEBACisjICBWZXJzaW9uOiA5LjIxLjAwLjM0MDJfMTYxCisjICAKKyMgIExpY2Vu
c2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UuYWRzcF9zc3QgZm9yIGRldGFpbHMKKyMg
K1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOQ0UuYWRzcF9zc3QKKyMg
IAorIyAgRmlsZTogaW50ZWwvZHNwX2Z3X2dsa192MTgxNC5iaW4KKyMgIFZlcnNpb246IDkuOTIu
MDEuMTgxNAorIyBAQCAtNDY4NCw2ICs0ODc1LDcgQEAKKyMgIFZlcnNpb246IDEwLjIzLjAwLjE4
NTgKKyMgIAorIyAgTGljZW5zZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5hZHNwX3Nz
dCBmb3IgZGV0YWlscworIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElD
RU5DRS5hZHNwX3NzdAorIyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisjIEBAIC00NzA0
LDYgKzQ4OTYsNyBAQAorIyAgRmlsZTogdGRtYl9ub3ZhXzEybWh6LmlucAorIyAgCisjICBMaWNl
bmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLnNpYW5vIGZvciBkZXRhaWxzCisjICtT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTGljZW5zZVJlZi1MSUNFTkNFLnNpYW5vCisjICAKKyMg
IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCisjICAKKyMgQEAgLTQ3MTksMjYgKzQ5MTIsMTA2IEBACisjICBW
ZXJzaW9uOiB2NTUuMTUKKyMgIAorIyAgRmlsZTogbnZpZGlhL3RlZ3JhMTk0L3h1c2IuYmluCisj
IC1WZXJzaW9uOiB2NjAuMDYKKyMgK1ZlcnNpb246IGw0dC1yMzUuNi41CisjICAKKyMgIExpY2Vu
Y2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UubnZpZGlhIGZvciBkZXRhaWxzCisjICtT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTGljZW5zZVJlZi1MSUNFTkNFLm52aWRpYQorIyAgCisj
ICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisjICBEcml2ZXI6IHRlZ3JhLXZpYyAtIE5WSURJQSBU
ZWdyYSBWSUMgZHJpdmVyCisjICAKKyMgIEZpbGU6IG52aWRpYS90ZWdyYTEyNC92aWMwM191Y29k
ZS5iaW4KKyMgK1ZlcnNpb246IGw0dC1yMjEuOC4wCisjICBMaW5rOiBudmlkaWEvdGVncmExMjQv
dmljLmJpbiAtPiB2aWMwM191Y29kZS5iaW4KKyMgIAorIyAgRmlsZTogbnZpZGlhL3RlZ3JhMjEw
L3ZpYzA0X3Vjb2RlLmJpbgorIyArVmVyc2lvbjogbDR0LXIzMi43LjYKKyMgIExpbms6IG52aWRp
YS90ZWdyYTIxMC92aWMuYmluIC0+IHZpYzA0X3Vjb2RlLmJpbgorIyAgCisjICBGaWxlOiBudmlk
aWEvdGVncmExODYvdmljMDRfdWNvZGUuYmluCisjICtWZXJzaW9uOiBsNHQtcjMyLjcuNgorIyAg
TGluazogbnZpZGlhL3RlZ3JhMTg2L3ZpYy5iaW4gLT4gdmljMDRfdWNvZGUuYmluCisjICAKKyMg
IEZpbGU6IG52aWRpYS90ZWdyYTE5NC92aWMuYmluCisjICtWZXJzaW9uOiBsNHQtcjM1LjYuNQor
IyArCisjICtGaWxlOiBudmlkaWEvdGVncmEyMzQvdmljLmJpbgorIyArVmVyc2lvbjogbDR0LXIz
OS4yLjEKKyMgKworIyArRmlsZTogbnZpZGlhL3RlZ3JhMjY0L3ZpYy5iaW4KKyMgK0ZpbGU6IG52
aWRpYS90ZWdyYTI2NC92aWMuYmluLmRlc2MKKyMgK1ZlcnNpb246IGw0dC1yMzkuMi4xCisjICAK
KyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UubnZpZGlhIGZvciBkZXRh
aWxzCisjICtTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTGljZW5zZVJlZi1MSUNFTkNFLm52aWRp
YQorIyArCisjICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyArCisjICtEcml2ZXI6IHRlZ3JhLW52ZW5j
IC0gTlZJRElBIFRlZ3JhIE5WRU5DIGRyaXZlcgorIyArCisjICtGaWxlOiBudmlkaWEvdGVncmEx
MjQvbnZlbmMuYmluCisjICtWZXJzaW9uOiBsNHQtcjIxLjguMAorIyArCisjICtGaWxlOiBudmlk
aWEvdGVncmEyMTAvbnZlbmMuYmluCisjICtWZXJzaW9uOiBsNHQtcjMyLjcuNgorIyArCisjICtG
aWxlOiBudmlkaWEvdGVncmExODYvbnZlbmMuYmluCisjICtWZXJzaW9uOiBsNHQtcjMyLjcuNgor
IyArCisjICtGaWxlOiBudmlkaWEvdGVncmExOTQvbnZlbmMuYmluCisjICtWZXJzaW9uOiBsNHQt
cjM1LjYuNQorIyArCisjICtGaWxlOiBudmlkaWEvdGVncmEyMzQvbnZlbmMuYmluCisjICtWZXJz
aW9uOiBsNHQtcjM5LjIuMQorIyArCisjICtMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBM
SUNFTkNFLm52aWRpYSBmb3IgZGV0YWlscworIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExp
Y2Vuc2VSZWYtTElDRU5DRS5udmlkaWEKKyMgKworIyArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgKwor
IyArRHJpdmVyOiB0ZWdyYS1udmRlYyAtIE5WSURJQSBUZWdyYSBOVkRFQyBkcml2ZXIKKyMgKwor
IyArRmlsZTogbnZpZGlhL3RlZ3JhMjEwL252ZGVjLmJpbgorIyArVmVyc2lvbjogbDR0LXIzMi43
LjYKKyMgKworIyArRmlsZTogbnZpZGlhL3RlZ3JhMTg2L252ZGVjLmJpbgorIyArVmVyc2lvbjog
bDR0LXIzMi43LjYKKyMgKworIyArRmlsZTogbnZpZGlhL3RlZ3JhMTk0L252ZGVjLmJpbgorIyAr
VmVyc2lvbjogbDR0LXIzNS42LjUKKyMgKworIyArTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBT
ZWUgTElDRU5DRS5udmlkaWEgZm9yIGRldGFpbHMKKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBMaWNlbnNlUmVmLUxJQ0VOQ0UubnZpZGlhCisjICsKKyMgKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisj
ICsKKyMgK0RyaXZlcjogdGVncmEtbnZqcGcgLSBOVklESUEgVGVncmEgTlZKUEcgZHJpdmVyCisj
ICsKKyMgK0ZpbGU6IG52aWRpYS90ZWdyYTIxMC9udmpwZy5iaW4KKyMgK1ZlcnNpb246IGw0dC1y
MzIuNy42CisjICsKKyMgK0ZpbGU6IG52aWRpYS90ZWdyYTE4Ni9udmpwZy5iaW4KKyMgK1ZlcnNp
b246IGw0dC1yMzIuNy42CisjICsKKyMgK0ZpbGU6IG52aWRpYS90ZWdyYTE5NC9udmpwZy5iaW4K
KyMgK1ZlcnNpb246IGw0dC1yMzUuNi41CisjICsKKyMgK0ZpbGU6IG52aWRpYS90ZWdyYTIzNC9u
dmpwZy5iaW4KKyMgK1ZlcnNpb246IGw0dC1yMzkuMi4xCisjICsKKyMgK0xpY2VuY2U6IFJlZGlz
dHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UubnZpZGlhIGZvciBkZXRhaWxzCisjICtTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogTGljZW5zZVJlZi1MSUNFTkNFLm52aWRpYQorIyArCisjICstLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQorIyArCisjICtEcml2ZXI6IHRlZ3JhLW9mYSAtIE5WSURJQSBUZWdyYSBPRkEg
ZHJpdmVyCisjICsKKyMgK0ZpbGU6IG52aWRpYS90ZWdyYTIzNC9vZmEuYmluCisjICtWZXJzaW9u
OiBsNHQtcjM5LjIuMQorIyArCisjICtMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNF
TkNFLm52aWRpYSBmb3IgZGV0YWlscworIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vu
c2VSZWYtTElDRU5DRS5udmlkaWEKKyMgIAorIyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgIAorIyBA
QCAtNDc1MywyMiArNTAyNiwyNyBAQAorIyAgSW5mbzogYXR1c2IvQ2hhbmdlTG9nCisjICAKKyMg
IExpY2VuY2U6IEdQTHYyIG9yIGxhdGVyLiBTZWUgR1BMLTIuMCBmb3IgZGV0YWlscy4KKyMgK1NQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisjICAKKyMgIC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCisjICAKKyMgIERyaXZlcjogYnRxY2EgLSBRdWFsY29tbSBBdGhlcm9zIEJsdWV0
b290aCBzdXBwb3J0IGZvciBRQ0E2MXg0IFVTQiBjaGlwcworIyAgCisjICtGaWxlOiBxY2EvcmFt
cGF0Y2hfdXNiXzAwMDAwMjAwLmJpbgorIyArRmlsZTogcWNhL252bV91c2JfMDAwMDAyMDAuYmlu
CisjICsKKyMgK0ZpbGU6IHFjYS9yYW1wYXRjaF91c2JfMDAwMDAyMDEuYmluCisjICBGaWxlOiBx
Y2EvbnZtX3VzYl8wMDAwMDIwMS5iaW4KKyMgLUZpbGU6IHFjYS9udm1fdXNiXzAwMDAwMjAwLmJp
bgorIyAtRmlsZTogcWNhL252bV91c2JfMDAwMDAzMDAuYmluCisjIC1GaWxlOiBxY2EvbnZtX3Vz
Yl8wMDAwMDMwMi5iaW4KKyMgLUZpbGU6IHFjYS9yYW1wYXRjaF91c2JfMDAwMDAyMDAuYmluCisj
IC1GaWxlOiBxY2EvcmFtcGF0Y2hfdXNiXzAwMDAwMjAxLmJpbgorIyArCisjICBGaWxlOiBxY2Ev
cmFtcGF0Y2hfdXNiXzAwMDAwMzAwLmJpbgorIyAgVmVyc2lvbjogQlRGTS5STS4yLjIuYzMtMDAw
MzEtUUNBQlRGTVNXUC0xCisjICtGaWxlOiBxY2EvbnZtX3VzYl8wMDAwMDMwMC5iaW4KKyMgKwor
IyAgRmlsZTogcWNhL3JhbXBhdGNoX3VzYl8wMDAwMDMwMi5iaW4KKyMgIFZlcnNpb246IEJURk0u
Uk0uNC40LjEtMDAwMjgtUUNBQlRGTVNXUC0xCisjICtGaWxlOiBxY2EvbnZtX3VzYl8wMDAwMDMw
Mi5iaW4KKyMgIEZpbGU6IHFjYS9udm1fdXNiXzAwMDAwMzAyX2V1LmJpbgorIyArCisjICBGaWxl
OiBxY2EvcmFtcGF0Y2hfdXNiXzAwMTMwMjAwLmJpbgorIyAgVmVyc2lvbjogQlRGVy5IU1AuMi4w
LjAtMDA2MDktVVNCX1BBVENIWi0xCisjICBGaWxlOiBxY2EvbnZtX3VzYl8wMDEzMDIwMC5iaW4K
KyMgQEAgLTQ3NzgsMjkgKzUwNTYsMjQgQEAKKyMgIEZpbGU6IHFjYS9udm1fdXNiXzAwMTMwMjAw
XzAxMDcuYmluCisjICBGaWxlOiBxY2EvbnZtX3VzYl8wMDEzMDIwMF8wMTA5LmJpbgorIyAgRmls
ZTogcWNhL252bV91c2JfMDAxMzAyMDBfMDExMC5iaW4KKyMgKworIyAgRmlsZTogcWNhL3JhbXBh
dGNoX3VzYl8wMDEzMDIwMS5iaW4KKyMgIFZlcnNpb246IEJURlcuSFNQLjIuMS4wLTAwNjY5LVVT
Ql9VQVJUX1BBVENIWi0xCisjICBGaWxlOiBxY2EvbnZtX3VzYl8wMDEzMDIwMS5iaW4KKyMgLVZl
cnNpb246IEJURlcuSFNQLjIuMS4wLTAwNjY5LVVTQl9VQVJUX1BBVENIWi0xCisjICBGaWxlOiBx
Y2EvbnZtX3VzYl8wMDEzMDIwMV8wMTBhLmJpbgorIyAtVmVyc2lvbjogQlRGVy5IU1AuMi4xLjAt
MDA2NjktVVNCX1VBUlRfUEFUQ0haLTEKKyMgIEZpbGU6IHFjYS9udm1fdXNiXzAwMTMwMjAxXzAx
MGIuYmluCisjIC1WZXJzaW9uOiBCVEZXLkhTUC4yLjEuMC0wMDY2OS1VU0JfVUFSVF9QQVRDSFot
MQorIyAgRmlsZTogcWNhL252bV91c2JfMDAxMzAyMDFfMDMwMy5iaW4KKyMgLVZlcnNpb246IEJU
RlcuSFNQLjIuMS4wLTAwNjY5LVVTQl9VQVJUX1BBVENIWi0xCisjICBGaWxlOiBxY2EvbnZtX3Vz
Yl8wMDEzMDIwMV9nZi5iaW4KKyMgLVZlcnNpb246IEJURlcuSFNQLjIuMS4wLTAwNjY5LVVTQl9V
QVJUX1BBVENIWi0xCisjICBGaWxlOiBxY2EvbnZtX3VzYl8wMDEzMDIwMV9nZl8wMTBhLmJpbgor
IyAtVmVyc2lvbjogQlRGVy5IU1AuMi4xLjAtMDA2NjktVVNCX1VBUlRfUEFUQ0haLTEKKyMgIEZp
bGU6IHFjYS9udm1fdXNiXzAwMTMwMjAxX2dmXzAxMGIuYmluCisjIC1WZXJzaW9uOiBCVEZXLkhT
UC4yLjEuMC0wMDY2OS1VU0JfVUFSVF9QQVRDSFotMQorIyAgRmlsZTogcWNhL252bV91c2JfMDAx
MzAyMDFfZ2ZfMDMwMy5iaW4KKyMgLVZlcnNpb246IEJURlcuSFNQLjIuMS4wLTAwNjY5LVVTQl9V
QVJUX1BBVENIWi0xCisjIC1GaWxlOiBxY2EvcmFtcGF0Y2hfdXNiXzAwMTkwMjAwLmJpbgorIyAr
CisjICBGaWxlOiBxY2EvUUNBMjA2Ni9yYW1wYXRjaF91c2JfMDAxMzAyMDEuYmluCisjIC1WZXJz
aW9uOiBCVEZXLkhTUC4yLjEuMC0wMDY1My1WRVJfUEFUQ0haLTMKKyMgK1ZlcnNpb246IEJURlcu
SFNQLjIuMS4wLTAwNjgwLVZFUl9QQVRDSFotMQorIyAgRmlsZTogcWNhL1FDQTIwNjYvbnZtX3Vz
Yl8wMDEzMDIwMV8wMzBhLmJpbgorIyAgRmlsZTogcWNhL1FDQTIwNjYvbnZtX3VzYl8wMDEzMDIw
MV9nZl8wMzBhLmJpbgorIyArCisjICtGaWxlOiBxY2EvcmFtcGF0Y2hfdXNiXzAwMTkwMjAwLmJp
bgorIyAgVmVyc2lvbjogQlRGVy5IQU1JTFRPTi4yLjAuMC0wMDc5OS1VU0JfUEFUQ0haLTUKKyMg
IEZpbGU6IHFjYS9udm1fdXNiXzAwMTkwMjAwLmJpbgorIyAgRmlsZTogcWNhL252bV91c2JfMDAx
OTAyMDBfMDEwNC5iaW4KKyMgQEAgLTQ4MTUsNiArNTA4OCw3IEBACisjICBGaWxlOiBxY2EvbnZt
X3VzYl8wMDE5MDIwMF8wMTEyLmJpbgorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUu
IFNlZSBMSUNFTlNFLlF1YWxjb21tQXRoZXJvc19hdGgxMGsgYW5kIE5PVElDRS5xY2EgZm9yIGRl
dGFpbHMKKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOU0UuUXVh
bGNvbW1BdGhlcm9zX2F0aDEwaworIyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisjIEBA
IC00ODM2LDYgKzUxMTAsNyBAQAorIyAgRmlsZTogcWNhL252bV8wMDQ0MDMwMl9pMnNfZXUuYmlu
CisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UuUXVhbGNvbW1B
dGhlcm9zX2F0aDEwayBhbmQgTk9USUNFLnFjYSBmb3IgZGV0YWlscworIyArU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5TRS5RdWFsY29tbUF0aGVyb3NfYXRoMTBrCisj
ICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAKKyMgQEAgLTQ4NDksMTkgKzUxMjQsMjEgQEAK
KyMgIFZlcnNpb246IEJURlcuT1JORS4xLjAuMS0wMDE1NS1QQVRDSC0xCisjICAKKyMgIExpY2Vu
Y2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UuUXVhbGNvbW1BdGhlcm9zX2F0aDEwayBh
bmQgTk9USUNFLnFjYSBmb3IgZGV0YWlscworIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExp
Y2Vuc2VSZWYtTElDRU5TRS5RdWFsY29tbUF0aGVyb3NfYXRoMTBrCisjICAKKyMgIC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCisjICAKKyMgIERyaXZlcjogYnRxY2EgLSBRdWFsY29tbSBBdGhlcm9zIEJsdWV0
b290aCBzdXBwb3J0IGZvciBRQ0FfUUNDMjA3MiBjaGlwCisjICAKKyMgIEZpbGU6IHFjYS9vcm5i
dGZ3MTEudGx2CisjIC1WZXJzaW9uOiBCVEZXLk9STkUuMS4xLjAtMDAzNDAtUEFUQ0gtMQorIyAr
VmVyc2lvbjogQlRGVy5PUk5FLjEuMS4wLTAwMzU1LVBBVENILTEKKyMgIEZpbGU6IHFjYS9vcm5u
djExLmJpbgorIyAtVmVyc2lvbjogQlRGVy5PUk5FLjEuMS4wLTAwMzQwLVBBVENILTEKKyMgK1Zl
cnNpb246IEJURlcuT1JORS4xLjEuMC0wMDM1NS1QQVRDSC0xCisjICBGaWxlOiBxY2Evb3JuYmNz
Y2FsMTEuYmluCisjIC1WZXJzaW9uOiBCVEZXLk9STkUuMS4xLjAtMDAzNDAtUEFUQ0gtMQorIyAr
VmVyc2lvbjogQlRGVy5PUk5FLjEuMS4wLTAwMzU1LVBBVENILTEKKyMgIAorIyAgTGljZW5jZTog
UmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5RdWFsY29tbUF0aGVyb3NfYXRoMTBrIGFuZCBO
T1RJQ0UucWNhIGZvciBkZXRhaWxzCisjICtTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTGljZW5z
ZVJlZi1MSUNFTlNFLlF1YWxjb21tQXRoZXJvc19hdGgxMGsKKyMgIAorIyAgLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQorIyAgCisjIEBAIC00ODc3LDYgKzUxNTQsNyBAQAorIyAgRmlsZTogcWNhL2NtbnYxM3Qu
YmluCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UucWNvbSBh
bmQgTk9USUNFLnFjYSBmb3IgZGV0YWlscworIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExp
Y2Vuc2VSZWYtTElDRU5TRS5xY29tCisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAKKyMg
QEAgLTQ4OTAsNiArNTE2OCw3IEBACisjICBGaWxlOiBxY2EvYXBudjExLmJpbgorIyAgCisjICBM
aWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLnFjb20gYW5kIE5PVElDRS5xY2Eg
Zm9yIGRldGFpbHMKKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VO
U0UucWNvbQorIyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisjIEBAIC00OTA0LDYgKzUx
ODMsNyBAQAorIyAgRmlsZTogcWNhL2NybnYzMnUuYmluCisjICAKKyMgIExpY2VuY2U6IFJlZGlz
dHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UuUXVhbGNvbW1BdGhlcm9zX2F0aDEwayBhbmQgTk9USUNF
LnFjYSBmb3IgZGV0YWlscworIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYt
TElDRU5TRS5RdWFsY29tbUF0aGVyb3NfYXRoMTBrCisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CisjICAKKyMgQEAgLTQ5MjEsNiArNTIwMSw3IEBACisjICBWZXJzaW9uOiBCVEZXLk1PU0VMTEUu
MS4xLjMtMDAxMDYtTVNMX1BBVENIWi0xCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJs
ZS4gU2VlIExJQ0VOU0UuUXVhbGNvbW1BdGhlcm9zX2F0aDEwayBhbmQgTk9USUNFLnFjYSBmb3Ig
ZGV0YWlscworIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5TRS5R
dWFsY29tbUF0aGVyb3NfYXRoMTBrCisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAKKyMg
QEAgLTQ5NTIsMTIgKzUyMzMsMTQgQEAKKyMgIEZpbGU6IHFjYS93Y25ocG52MjFnLmJiOAorIyAg
RmlsZTogcWNhL3djbmhwbnYyMWcuYjEwYworIyAgRmlsZTogcWNhL3djbmhwbnYyMWcuYjExMQor
IyArCisjICBGaWxlOiBxY2Evd2NuaHBidGZ3MTAudGx2CisjICBWZXJzaW9uOiBCVEZNLkhTUC4x
LjAuMC0wMDk3OC1RQ0FIU1BST01aLTIKKyMgIEZpbGU6IHFjYS93Y25ocG52MTAuYmluCisjICBG
aWxlOiBxY2Evd2NuaHBudjEwLmIwNgorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUu
IFNlZSBMSUNFTlNFLlF1YWxjb21tQXRoZXJvc19hdGgxMGsgYW5kIE5PVElDRS5xY2EgZm9yIGRl
dGFpbHMKKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOU0UuUXVh
bGNvbW1BdGhlcm9zX2F0aDEwaworIyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisjIEBA
IC00OTc1LDcgKzUyNTgsNyBAQAorIyAgRmlsZTogcWNhL2hwbnYyMWcuMzA5CisjICBGaWxlOiBx
Y2EvaHBudjIxLjMwYQorIyAgRmlsZTogcWNhL2hwbnYyMWcuMzBhCisjIC1MaW5rOiBxY2EvaHBu
djIxZy4zMGMgLT4gaHBudjIxZy5iMTExCisjICtGaWxlOiBxY2EvaHBudjIxZy4zMGMKKyMgIEZp
bGU6IHFjYS9ocG52MjEuYjhjCisjICBGaWxlOiBxY2EvaHBudjIxLmI5ZgorIyAgRmlsZTogcWNh
L2hwbnYyMS5iYTAKKyMgQEAgLTUwMDAsNiArNTI4Myw3IEBACisjICBGaWxlOiBxY2EvaHBudjIx
Zy5iMTExCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UuUXVh
bGNvbW1BdGhlcm9zX2F0aDEwayBhbmQgTk9USUNFLnFjYSBmb3IgZGV0YWlscworIyArU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5TRS5RdWFsY29tbUF0aGVyb3NfYXRo
MTBrCisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAKKyMgQEAgLTUwMTAsNiArNTI5NCw3
IEBACisjICBGaWxlOiBxY2EvaHRudjIwLmJpbgorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1
dGFibGUuIFNlZSBMSUNFTlNFLnFjb20gYW5kIE5PVElDRS5xY2EgZm9yIGRldGFpbHMKKyMgK1NQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOU0UucWNvbQorIyAgCisjICAt
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQorIyAgCisjIEBAIC01MDI0LDE4ICs1MzA5LDIwIEBACisjICBGaWxl
OiBxY2EvaG10bnYyMC5iaW4KKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUg
TElDRU5TRS5xY29tIGFuZCBOT1RJQ0UucWNhIGZvciBkZXRhaWxzCisjICtTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogTGljZW5zZVJlZi1MSUNFTlNFLnFjb20KKyMgIAorIyAgLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCisjICAKKyMgIERyaXZlcjogcWNhIC0gUXVhbGNvbW0gQXRoZXJvcyBCbHVldG9vdGgg
c3VwcG9ydCBmb3IgUUNBNjY5OEFRIGNoaXBzCisjICAKKyMgIEZpbGU6IHFjYS9RQ0E2Njk4L2hw
YnRmdzIxLnRsdgorIyAtVmVyc2lvbjogQlRGVy5IU1AuMi4xLjItMDAwNzItUEFUQ0haLTIKKyMg
K1ZlcnNpb246IEJURlcuSFNQLjIuMS4yLTAwMDc5LVBBVENILTEKKyMgIEZpbGU6IHFjYS9RQ0E2
Njk4L2hwbnYyMS5iMjA2CisjICBGaWxlOiBxY2EvUUNBNjY5OC9ocG52MjEuYjIwNworIyAgRmls
ZTogcWNhL1FDQTY2OTgvaHBudjIxLmJpbgorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFi
bGUuIFNlZSBMSUNFTlNFLnFjb20gYW5kIE5PVElDRS5xY2EgZm9yIGRldGFpbHMKKyMgK1NQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOU0UucWNvbQorIyAgCisjICAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCisjICAKKyMgQEAgLTUwNTQsNiArNTM0MSw3IEBACisjICBWZXJzaW9uOiB2
MS43LjIKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5jYXZp
dW1fbGlxdWlkaW8gZm9yIGRldGFpbHMKKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNl
bnNlUmVmLUxJQ0VOQ0UuY2F2aXVtX2xpcXVpZGlvCisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CisjICAKKyMgQEAgLTUwNjYsNiArNTM1NCw3IEBACisjICBWZXJzaW9uOiB2MTAKKyMgIAorIyAg
TGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5jYXZpdW0gZm9yIGRldGFpbHMK
KyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOQ0UuY2F2aXVtCisj
ICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAKKyMgQEAgLTU0NTAsNiArNTczOSw3IEBACisj
ICBWZXJzaW9uOiBETUMgQVBJL0FQQiB2ZXIgMiByZWxlYXNlIDM3IGZvciBYZTNwX0xQRAorIyAg
CisjICBMaWNlbnNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLmk5MTUgZm9yIGRldGFp
bHMKKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOU0UuaTkxNQor
IyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgIAorIyAgRHJpdmVyOiB4ZSAtIEludGVsIEdyYXBoaWNz
IGRyaXZlcgorIyBAQCAtNTQ4NSw2ICs1Nzc1LDcgQEAKKyMgIFZlcnNpb246IEd1QyBBUEkvQVBC
IHZlciA3MC43Mi4xIGZvciBOb3ZhbGFrZSBTCisjICAKKyMgIExpY2Vuc2U6IFJlZGlzdHJpYnV0
YWJsZS4gU2VlIExJQ0VOU0UueGUgZm9yIGRldGFpbHMKKyMgK1NQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiBMaWNlbnNlUmVmLUxJQ0VOU0UueGUKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAKKyMg
IERyaXZlcjogbm91dmVhdSAtIE5WSURJQSBHUFUgZHJpdmVyCisjIEBAIC01OTg1LDYgKzYyNzYs
NyBAQAorIyAgTGluazogbnZpZGlhL2diMjA3IC0+IGdiMjAyCisjICAKKyMgIExpY2VuY2U6IFJl
ZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UubnZpZGlhIGZvciBkZXRhaWxzCisjICtTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogTGljZW5zZVJlZi1MSUNFTkNFLm52aWRpYQorIyAgCisjICAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQorIyAgCisjIEBAIC01OTk5LDYgKzYyOTEsNyBAQAorIyAgVmVyc2lvbjog
MTYuMS4yCisjICAKKyMgIExpY2Vuc2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UuYXRt
ZWwgZm9yIGRldGFpbHMKKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJ
Q0VOU0UuYXRtZWwKKyMgIAorIyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgIAorIyBAQCAtNjAxNCw2
ICs2MzA3LDcgQEAKKyMgIFZlcnNpb246IDB4MTAxMzAwMDEKKyMgIAorIyAgTGljZW5jZTogUmVk
aXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5oZmkxX2Zpcm13YXJlIGZvciBkZXRhaWxzCisjICtT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTGljZW5zZVJlZi1MSUNFTlNFLmhmaTFfZmlybXdhcmUK
KyMgIAorIyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgIAorIyBAQCAtNjAyMiw2ICs2MzE2LDcgQEAK
KyMgIEZpbGU6IHRpLWtleXN0b25lL2tzMl9xbXNzX3Bkc3BfYWNjNDhfazJfbGVfMV8wXzBfOS5i
aW4KKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS50aS1rZXlz
dG9uZSBmb3IgZGV0YWlscy4KKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVm
LUxJQ0VOQ0UudGkta2V5c3RvbmUKKyMgIAorIyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgIAorIyBA
QCAtNjAzNCw2ICs2MzI5LDcgQEAKKyMgIFZlcnNpb246IDguMi4wLjEwCisjICAKKyMgIExpY2Vu
Y2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UuTWFydmVsbCBmb3IgZGV0YWlscy4KKyMg
K1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOQ0UuTWFydmVsbAorIyAg
CisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisjIEBAIC02MDQzLDYgKzYzMzksNyBAQAorIyAg
RmlsZTogbWVkaWF0ZWsvbXQ4MTczL3ZwdV9wLmJpbgorIyAgCisjICBMaWNlbmNlOiBSZWRpc3Ry
aWJ1dGFibGUuIFNlZSBMSUNFTkNFLm1lZGlhdGVrIGZvciBkZXRhaWxzLgorIyArU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5DRS5tZWRpYXRlaworIyAgCisjICAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQorIyAgCisjIEBAIC02MDUyLDYgKzYzNDksNyBAQAorIyAgVmVyc2lvbjog
djEuMC4wCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UubWVk
aWF0ZWsgZm9yIGRldGFpbHMuCisjICtTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTGljZW5zZVJl
Zi1MSUNFTkNFLm1lZGlhdGVrCisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAKKyMgQEAg
LTYwNzIsNiArNjM3MCw3IEBACisjICBWZXJzaW9uOiB2MS4wLjAKKyMgIAorIyAgTGljZW5jZTog
UmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5tZWRpYXRlayBmb3IgZGV0YWlscy4KKyMgK1NQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOQ0UubWVkaWF0ZWsKKyMgIAor
IyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgIAorIyBAQCAtNjA4Niw2ICs2Mzg1LDcgQEAKKyMgICMg
VmVyc2lvbjogNzY2M2UyY2NuMDQtMjAwNjAzMDI0NworIyAgCisjICBMaWNlbmNlOiBSZWRpc3Ry
aWJ1dGFibGUuIFNlZSBMSUNFTkNFLm1lZGlhdGVrIGZvciBkZXRhaWxzLgorIyArU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5DRS5tZWRpYXRlaworIyAgCisjICAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQorIyAgCisjIEBAIC02MDk1LDYgKzYzOTUsMTcgQEAKKyMgIFZlcnNpb246
IDMuMQorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLnJvY2tj
aGlwIGZvciBkZXRhaWxzLgorIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYt
TElDRU5DRS5yb2NrY2hpcAorIyArCisjICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyArCisjICtEcml2
ZXI6IHBoeS1yb2NrY2hpcC1zbnBzLXBjaWUzIC0gUk9DS0NISVAgUENJZTMgUEhZIGZpcm13YXJl
CisjICsKKyMgK0ZpbGU6IHJvY2tjaGlwL3BjaWUzLXQyMi1jOGcyLTEuNi4zLTIwMmEtcDcuZncK
KyMgK1ZlcnNpb246IDEuNi4zCisjICsKKyMgK0xpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2Vl
IExJQ0VOQ0Uucm9ja2NoaXAgZm9yIGRldGFpbHMuCisjICtTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogTGljZW5zZVJlZi1MSUNFTkNFLnJvY2tjaGlwCisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CisjICAKKyMgQEAgLTYxMDcsNiArNjQxOCw3IEBACisjICBWZXJzaW9uOiAxLjAuMDctYjM3MAor
IyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLm1lZGlhdGVrIGZv
ciBkZXRhaWxzLgorIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5D
RS5tZWRpYXRlaworIyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisjIEBAIC02MTIxLDYg
KzY0MzMsNyBAQAorIyAgTGluazogbXQ3NjYyX3JvbV9wYXRjaC5iaW4gLT4gbWVkaWF0ZWsvbXQ3
NjYyX3JvbV9wYXRjaC5iaW4KKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUg
TElDRU5DRS5yYWxpbmtfYV9tZWRpYXRla19jb21wYW55X2Zpcm13YXJlIGZvciBkZXRhaWxzCisj
ICtTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTGljZW5zZVJlZi1MSUNFTkNFLnJhbGlua19hX21l
ZGlhdGVrX2NvbXBhbnlfZmlybXdhcmUKKyMgIAorIyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgIAor
IyBAQCAtNjEzMyw2ICs2NDQ2LDcgQEAKKyMgIFZlcnNpb246IDAuMC4yX1A0OAorIyAgCisjICBM
aWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLm1lZGlhdGVrIGZvciBkZXRhaWxz
LgorIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5DRS5tZWRpYXRl
aworIyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisjIEBAIC02MTQ2LDYgKzY0NjAsNyBA
QAorIyAgVmVyc2lvbjogMjAxOTAxMTQKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxl
LiBTZWUgTElDRU5DRS5tZWRpYXRlayBmb3IgZGV0YWlscy4KKyMgK1NQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOQ0UubWVkaWF0ZWsKKyMgIAorIyAgLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KKyMgIAorIyBAQCAtNjE1Nyw2ICs2NDcyLDcgQEAKKyMgIFZlcnNpb246IDIwMTkwMTE0
CisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UubWVkaWF0ZWsg
Zm9yIGRldGFpbHMuCisjICtTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTGljZW5zZVJlZi1MSUNF
TkNFLm1lZGlhdGVrCisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAKKyMgQEAgLTYxNzMs
NiArNjQ4OSw3IEBACisjICBWZXJzaW9uOiA3NjYzbXAxODI3LTIwMTkwOTE0MDQzNDM0CisjICAK
KyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UubWVkaWF0ZWsgZm9yIGRl
dGFpbHMuCisjICtTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTGljZW5zZVJlZi1MSUNFTkNFLm1l
ZGlhdGVrCisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAKKyMgQEAgLTYyMjcsNiArNjU0
NCw3IEBACisjICBWZXJzaW9uOiAyMDI2MDUxNQorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1
dGFibGUuIFNlZSBMSUNFTkNFLm1lZGlhdGVrIGZvciBkZXRhaWxzLgorIyArU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5DRS5tZWRpYXRlaworIyAgCisjICAtLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQorIyAgCisjIEBAIC02MjM4LDYgKzY1NTYsNyBAQAorIyAgVmVyc2lvbjogMjAy
NTEyMTIwMzIxMjcKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5D
RS5tZWRpYXRlayBmb3IgZGV0YWlscy4KKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNl
bnNlUmVmLUxJQ0VOQ0UubWVkaWF0ZWsKKyMgIAorIyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgIAor
IyBAQCAtNjI0Nyw2ICs2NTY2LDcgQEAKKyMgIFZlcnNpb246IDIwMjUwODI2MjExNDQ0CisjICAK
KyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UubWVkaWF0ZWsgZm9yIGRl
dGFpbHMuCisjICtTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTGljZW5zZVJlZi1MSUNFTkNFLm1l
ZGlhdGVrCisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAKKyMgQEAgLTYyNTgsNiArNjU3
OCw3IEBACisjICBWZXJzaW9uOiAyMDI2MDIyNDExMDkzOQorIyAgCisjICBMaWNlbmNlOiBSZWRp
c3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLm1lZGlhdGVrIGZvciBkZXRhaWxzLgorIyArU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5DRS5tZWRpYXRlaworIyAgCisjICAt
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQorIyAgCisjIEBAIC02MjY3LDYgKzY1ODgsNyBAQAorIyAgVmVyc2lv
bjogMjAyNjAyMjQxMTEyMzEKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUg
TElDRU5DRS5tZWRpYXRlayBmb3IgZGV0YWlscy4KKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBMaWNlbnNlUmVmLUxJQ0VOQ0UubWVkaWF0ZWsKKyMgIAorIyAgLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
KyMgIAorIyBAQCAtNjI3OCw2ICs2NjAwLDcgQEAKKyMgIFZlcnNpb246IDIwMjYwMjI0MTEwOTQ5
CisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UubWVkaWF0ZWsg
Zm9yIGRldGFpbHMuCisjICtTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTGljZW5zZVJlZi1MSUNF
TkNFLm1lZGlhdGVrCisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAKKyMgQEAgLTYyODcs
NiArNjYxMCw3IEBACisjICBWZXJzaW9uOiAyMDI2MDIyNDExMTI0MworIyAgCisjICBMaWNlbmNl
OiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLm1lZGlhdGVrIGZvciBkZXRhaWxzLgorIyAr
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5DRS5tZWRpYXRlaworIyAg
CisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisjIEBAIC02Mjk4LDYgKzY2MjIsNyBAQAorIyAg
VmVyc2lvbjogMjAyNjA3MjQxNDM0MDIKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxl
LiBTZWUgTElDRU5DRS5tZWRpYXRlayBmb3IgZGV0YWlscy4KKyMgK1NQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOQ0UubWVkaWF0ZWsKKyMgIAorIyAgLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KKyMgIAorIyBAQCAtNjMwNyw2ICs2NjMyLDcgQEAKKyMgIFZlcnNpb246IDIwMjYwNzI0
MTQzODE1CisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UubWVk
aWF0ZWsgZm9yIGRldGFpbHMuCisjICtTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTGljZW5zZVJl
Zi1MSUNFTkNFLm1lZGlhdGVrCisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAKKyMgQEAg
LTYzMTgsNiArNjY0NCw3IEBACisjICBWZXJzaW9uOiAyMDI2MDgxMzExMzExOAorIyAgCisjICBM
aWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLm1lZGlhdGVrIGZvciBkZXRhaWxz
LgorIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5DRS5tZWRpYXRl
aworIyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisjIEBAIC02MzI3LDYgKzY2NTQsNyBA
QAorIyAgVmVyc2lvbjogMjAyNjA4MTMxMTMyMzYKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmli
dXRhYmxlLiBTZWUgTElDRU5DRS5tZWRpYXRlayBmb3IgZGV0YWlscy4KKyMgK1NQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOQ0UubWVkaWF0ZWsKKyMgIAorIyAgLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KKyMgIAorIyBAQCAtNjMzOCw2ICs2NjY2LDcgQEAKKyMgIFZlcnNpb246IDIw
MjYwNDE0MTM0MjU1CisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VO
Q0UubWVkaWF0ZWsgZm9yIGRldGFpbHMuCisjICtTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTGlj
ZW5zZVJlZi1MSUNFTkNFLm1lZGlhdGVrCisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAK
KyMgQEAgLTYzNTEsNiArNjY4MCw3IEBACisjICBWZXJzaW9uOiAyMDI1MDgyMgorIyAgCisjICBM
aWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLm1lZGlhdGVrIGZvciBkZXRhaWxz
LgorIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5DRS5tZWRpYXRl
aworIyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisjIEBAIC02NDI2LDYgKzY3NTYsNyBA
QAorIyAgVmVyc2lvbjogMjAyNDA5MDYKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxl
LiBTZWUgTElDRU5DRS5tZWRpYXRlayBmb3IgZGV0YWlscy4KKyMgK1NQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOQ0UubWVkaWF0ZWsKKyMgIAorIyAgLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KKyMgIAorIyBAQCAtNjQ0Niw2ICs2Nzc3LDcgQEAKKyMgIFZlcnNpb246IDIwMjMwMjE4
MjA0MzE2CisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UubWVk
aWF0ZWsgZm9yIGRldGFpbHMuCisjICtTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTGljZW5zZVJl
Zi1MSUNFTkNFLm1lZGlhdGVrCisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICBEcml2ZXI6
IG5mcCAtIE5ldHJvbm9tZSBGbG93IFByb2Nlc3NvcgorIyBAQCAtNjUzOSw2ICs2ODcxLDcgQEAK
KyMgIAorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLk5ldHJv
bm9tZSBmb3IgZGV0YWlscworIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYt
TElDRU5DRS5OZXRyb25vbWUKKyMgIAorIyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgIAorIyBAQCAt
NjU0OSw2ICs2ODgyLDcgQEAKKyMgIFZlcnNpb246IDUuMi4wLjE4CisjICAKKyMgIExpY2VuY2U6
IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UuUXVhbGNvbW1BdGhlcm9zX2F0aDEwayBmb3Ig
ZGV0YWlscworIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5TRS5R
dWFsY29tbUF0aGVyb3NfYXRoMTBrCisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAKKyMg
QEAgLTY1OTAsNiArNjkyNCw3IEBACisjICBWZXJzaW9uOiBWSURFTy5WUFUuMS4wLTAwMTE5Cisj
ICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UucWNvbSBhbmQgTk9U
SUNFLnFjb20gZm9yIGRldGFpbHMKKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNl
UmVmLUxJQ0VOU0UucWNvbQorIyAgCisjICBCaW5hcnkgZmlsZXMgc3VwcGxpZWQgb3JpZ2luYWxs
eSBmcm9tCisjICBodHRwczovL2RldmVsb3Blci5xdWFsY29tbS5jb20vaGFyZHdhcmUvZHJhZ29u
Ym9hcmQtNDEwYy90b29scworIyBAQCAtNjY1NCw3ICs2OTg5LDE2IEBACisjICAKKyMgIFZlcnNp
b246IFZJREVPLlZQVS40LjAtMDA0NQorIyAgCisjICtGaWxlOiBxY29tL3ZwdS92cHU0MF9wMV9z
OC5tYm4KKyMgKworIyArVmVyc2lvbjogVklERU8uVlBVLjUuMC0wMDM5CisjICsKKyMgK0ZpbGU6
IHFjb20vdnB1L3ZwdTUwX3AyX3M4Lm1ibgorIyArCisjICtWZXJzaW9uOiBWSURFTy5WUFUuNS4w
LTAwMzkKKyMgKworIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5xY29t
IGFuZCBOT1RJQ0UucWNvbSBmb3IgZGV0YWlscworIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IExpY2Vuc2VSZWYtTElDRU5TRS5xY29tCisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAK
KyMgQEAgLTY2NjYsNiArNzAxMCw3IEBACisjICBWZXJzaW9uOiA0LjIKKyMgIAorIyAgTGljZW5j
ZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5zZG1hX2Zpcm13YXJlIGZvciBkZXRhaWxz
CisjICtTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTGljZW5zZVJlZi1MSUNFTlNFLnNkbWFfZmly
bXdhcmUKKyMgIAorIyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgIAorIyBAQCAtNjY4OSwxMCArNzAz
NCwxMiBAQAorIyAgRmlsZTogcWNvbS9hNTMwdjNfZ3BtdS5mdzIKKyMgIFZlcnNpb24gdjIuMDQg
KDIwMTUtMDgtMzEpCisjICBGaWxlOiBxY29tL2FwcTgwOTYvYTUzMF96YXAubWJuCisjICtWZXJz
aW9uOiB2MC4wOQorIyAgTGluazogcWNvbS9hNTMwX3phcC5tZHQgLT4gYXBxODA5Ni9hNTMwX3ph
cC5tYm4KKyMgIEZpbGU6IHFjb20vcXJiNDIxMC9hNjEwX3phcC5tYm4KKyMgK1ZlcnNpb246IHYw
LjIwCisjICBGaWxlOiBxY29tL3FjczYxNS9hNjEyX3phcC5tYm4KKyMgLVZlcnNpb246IHYwLjE5
CisjICtWZXJzaW9uOiB2MC4yMQorIyAgRmlsZTogcWNvbS9hNjEyX3JnbXUuYmluCisjICBWZXJz
aW9uOiB2Mi4xMQorIyAgRmlsZTogcWNvbS9hNjIzX2dtdS5iaW4KKyMgQEAgLTY3MDMsNiArNzA1
MCw3IEBACisjICBGaWxlOiBxY29tL2E2MzBfc3FlLmZ3CisjICBWZXJzaW9uOiB2Mi4wNworIyAg
RmlsZTogcWNvbS9zZG04NDUvYTYzMF96YXAubWJuCisjICtWZXJzaW9uOiB2MC4xOQorIyAgRmls
ZTogcWNvbS9hNjQwX2dtdS5iaW4KKyMgIFZlcnNpb246IHYxLjA1CisjICBGaWxlOiBxY29tL3Nt
ODE1MC9hNjQwX3phcC5tYm4KKyMgQEAgLTY3MTIsOCArNzA2MCw5IEBACisjICBGaWxlOiBxY29t
L2E2NTBfc3FlLmZ3CisjICBWZXJzaW9uOiB2MS4xMgorIyAgRmlsZTogcWNvbS9zbTgyNTAvYTY1
MF96YXAubWJuCisjICtWZXJzaW9uOiB2MC4xMAorIyAgRmlsZTogcWNvbS9hNjYwX2dtdS5iaW4K
KyMgLVZlcnNpb246IHYzLjAxLjBCCisjICtWZXJzaW9uOiB2My4wMS4wQQorIyAgRmlsZTogcWNv
bS9hNjYwX3NxZS5mdworIyAgVmVyc2lvbjogdjEuMTIKKyMgIEZpbGU6IHFjb20vcWNtNjQ5MC9h
NjYwX3phcC5tYm4KKyMgQEAgLTY3MjcsNiArNzA3Niw3IEBACisjICBGaWxlOiBxY29tL2E3MDJf
c3FlLmZ3CisjICBWZXJzaW9uOiB2MC40OQorIyAgRmlsZTogcWNvbS9xY20yMjkwL2E3MDJfemFw
Lm1ibgorIyArVmVyc2lvbjogdjAuMDUKKyMgIEZpbGU6IHFjb20vc2hpa3JhL2E3MDRfemFwLm1i
bgorIyAgVmVyc2lvbjogdjAuMDUKKyMgIEZpbGU6IHFjb20vYTczMF9zcWUuZncKKyMgQEAgLTY3
NjQsNyArNzExNCw3IEBACisjICBGaWxlOiBxY29tL2dlbjcxNzAwX2dtdS5iaW4KKyMgIFZlcnNp
b246IHY0LjA5LjAwCisjICBGaWxlOiBxY29tL2dlbjcxNzAwX3NxZS5mdworIyAtVmVyc2lvbjog
djEuODIKKyMgK1ZlcnNpb246IHYxLjc5CisjICBGaWxlOiBxY29tL2VsaXphL2dlbjcxNzAwX3ph
cC5tYm4KKyMgIFZlcnNpb246IHYwLjE1CisjICBGaWxlOiBxY29tL2dlbjgwMDAwX2FxZS5mdwor
IyBAQCAtNjc5MSw4ICs3MTQxLDE5IEBACisjICBWZXJzaW9uOiB2MS4wMAorIyAgRmlsZTogcWNv
bS9nbHltdXIvZ2VuODAxMDBfemFwLm1ibgorIyAgVmVyc2lvbjogdjAuMDMKKyMgK0ZpbGU6IHFj
b20vZ2VuODExMDBfYXFlLmZ3CisjICtWZXJzaW9uOiB2MC4zNgorIyArRmlsZTogcWNvbS9nZW44
MTEwMF9nbXUuYmluCisjICtWZXJzaW9uOiB2NS4wNi4xNworIyArRmlsZTogcWNvbS9nZW44MTEw
MF9zcWUuZncKKyMgK1ZlcnNpb246IHYxLjA5CisjICtGaWxlOiBxY29tL2hhd2kvZ2VuODExMDBf
emFwLm1ibgorIyArVmVyc2lvbjogdjAuMDUKKyMgK0xpbms6IHFjb20vZ2VuODE0MDBfZ211LmJp
biAtPiBnZW44MTEwMF9nbXUuYmluCisjICtMaW5rOiBxY29tL21haWxpL2dlbjgxNDAwX3phcC5t
Ym4gLT4gLi4vaGF3aS9nZW44MTEwMF96YXAubWJuCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJp
YnV0YWJsZS4gU2VlIExJQ0VOU0UucWNvbSBhbmQgTk9USUNFLnFjb20gZm9yIGRldGFpbHMKKyMg
K1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOU0UucWNvbQorIyAgCisj
ICBCaW5hcnkgZmlsZXMgc3VwcGxpZWQgb3JpZ2luYWxseSBmcm9tCisjICBodHRwczovL2RldmVs
b3Blci5xdWFsY29tbS5jb20vaGFyZHdhcmUvZHJhZ29uYm9hcmQtNDEwYy90b29scworIyBAQCAt
NjgxNyw2ICs3MTc4LDcgQEAKKyMgIEZpbGU6IHFjb20veWFtYXRvX3BtNC5mdworIyAgCisjICBM
aWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUsIEJTRC0zLUNsYXVzZSBsaWNlbmNlLCBTZWUgTElDRU5T
RS5xY29tX3lhbWF0byBmb3IgZGV0YWlscworIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEJT
RC0zLUNsYXVzZQorIyAgCisjICBJbmZvOgorIyAgQmluYXJ5IGZpbGVzIGdlbmVyYXRlZCBmcm9t
IGhlYWRlciBmaWxlcyBpbiBFZmlrYU1YIGtlcm5lbCBzb3VyY2VzLiBBIHByZWZpeCBvZgorIyBA
QCAtNjg4NCwxNCArNzI0NiwxNCBAQAorIyAgVmVyc2lvbjogQ0RTUC5IVC4yLjUuYzQtMDAwMDQt
S09ESUFLLTEKKyMgIFJhd0ZpbGU6IHFjb20vcWNzNjQ5MC9yYWR4YS9kcmFnb24tcTZhL2Nkc3By
LmpzbgorIyAgRmlsZTogcWNvbS9xY3M2NDkwL1RodW5kZXJjb21tL1J1YmlrUGkzL2Fkc3AubWJu
CisjIC1WZXJzaW9uOiBBRFNQLkhULjUuNS5jOC0wMDIxNy1LT0RJQUstMQorIyArVmVyc2lvbjog
QURTUC5IVC41LjUuYzgtMDAyNDkuMS1LT0RJQUstMQorIyAgUmF3RmlsZTogcWNvbS9xY3M2NDkw
L1RodW5kZXJjb21tL1J1YmlrUGkzL2Fkc3ByLmpzbgorIyAgUmF3RmlsZTogcWNvbS9xY3M2NDkw
L1RodW5kZXJjb21tL1J1YmlrUGkzL2Fkc3BzLmpzbgorIyAgUmF3RmlsZTogcWNvbS9xY3M2NDkw
L1RodW5kZXJjb21tL1J1YmlrUGkzL2Fkc3B1YS5qc24KKyMgIAorIyAgIyBxY29tL3FjczYxNQor
IyAgRmlsZTogcWNvbS9xY3M2MTUvYWRzcC5tYm4KKyMgLVZlcnNpb246IEFEU1AuVlQuNS4yLmM2
LTAwMDg0LjEtU002MTUwLTEKKyMgK1ZlcnNpb246IEFEU1AuVlQuNS4yLmM2LTAwMDk1LVNNNjE1
MC04CisjICBSYXdGaWxlOiBxY29tL3FjczYxNS9hZHNwci5qc24KKyMgIFJhd0ZpbGU6IHFjb20v
cWNzNjE1L2Fkc3BzLmpzbgorIyAgUmF3RmlsZTogcWNvbS9xY3M2MTUvYWRzcHVhLmpzbgorIyBA
QCAtNjkyNiw2ICs3Mjg4LDcgQEAKKyMgIFJhd0ZpbGU6IHFjb20vc2RtODQ1L1RodW5kZXJjb21t
L2RiODQ1Yy9zbHBpci5qc24KKyMgIFJhd0ZpbGU6IHFjb20vc2RtODQ1L1RodW5kZXJjb21tL2Ri
ODQ1Yy9zbHBpdXMuanNuCisjICBGaWxlOiBxY29tL3NkbTg0NS9TSElGVC9heG9sb3RsL2E2MzBf
emFwLm1ibgorIyArVmVyc2lvbjogdjAuMjAKKyMgIEluZm86IEV4dHJhY3RlZCBmcm9tIHRoZSBT
SElGVDZtcSdzIHZlbmRvciBwYXJ0aXRpb24KKyMgIAorIyAgIyBxY29tL3NtODI1MAorIyBAQCAt
Njk2MSwxNCArNzMyNCwxNCBAQAorIyAgCisjICAjIExlbm92byBUMTRzCisjICBGaWxlOiBxY29t
L3gxZTgwMTAwL0xFTk9WTy8yMU4xL3FjdnNzODM4MC5tYm4KKyMgLVZlcnNpb246IHZmdy0zLjE6
cmVsMDA4NS0wNzBmYTMzMTFkOWVmOTY4MDE1ZmVlN2ZlYTA3MTk4ZDdlYjIwOGExCisjICtWZXJz
aW9uOiBWSURFTy5WUFUuMy4xLTAwODUKKyMgIFJhd0ZpbGU6IHFjb20veDFlODAxMDAvTEVOT1ZP
LzIxTjEvYWRzcHVhLmpzbgorIyAgRmlsZTogcWNvbS94MWU4MDEwMC9jZHNwLm1ibgorIyAgRmls
ZTogcWNvbS94MWU4MDEwMC9jZHNwX2R0Yi5tYm4KKyMgIFZlcnNpb246IENEU1AuSFQuMi45LmMx
LTAwMDk0LUhBTU9BLTEKKyMgIFJhd0ZpbGU6IHFjb20veDFlODAxMDAvY2RzcHIuanNuCisjICBG
aWxlOiBxY29tL3gxZTgwMTAwL0xFTk9WTy8yMU4xL3FjYWRzcDgzODAubWJuCisjIC1WZXJzaW9u
OiBBRFNQLkhULjUuOS0wMDc4Ny4yLUhBTU9BLTEKKyMgK1ZlcnNpb246IEFEU1AuSFQuNS45LmM3
LTAwMDA0LUhBTU9BLTEKKyMgIEZpbGU6IHFjb20veDFlODAxMDAvTEVOT1ZPLzIxTjEvYWRzcF9k
dGJzLmVsZgorIyAgUmF3RmlsZTogcWNvbS94MWU4MDEwMC9MRU5PVk8vMjFOMS9hZHNwci5qc24K
KyMgIEZpbGU6IHFjb20veDFlODAxMDAvTEVOT1ZPLzIxTjEvY2RzcF9kdGJzLmVsZgorIyBAQCAt
Njk5NSw2ICs3MzU4LDcgQEAKKyMgIFZlcnNpb246IHZpZGVvLWZpcm13YXJlLjMuMS1lNWFlYTIw
YzY0Y2I2ZGY5YTFjOWJlOTllMjA2MDUzYjM2NDI0OTM5CisjICAKKyMgIExpY2VuY2U6IFJlZGlz
dHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UucWNvbSBhbmQgTk9USUNFLnFjb20gZm9yIGRldGFpbHMK
KyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOU0UucWNvbQorIyAg
CisjICBJbmZvOgorIyAgQmluYXJ5IGZpbGVzIHN1cHBsaWVkIG9yaWdpbmFsbHkgZnJvbQorIyBA
QCAtNzAxMyw3ICs3Mzc3LDcgQEAKKyMgICMgcWNvbS9nbHltdXIKKyMgIEZpbGU6IHFjb20vZ2x5
bXVyL2Fkc3AubWJuCisjICBGaWxlOiBxY29tL2dseW11ci9hZHNwX2R0Yi5tYm4KKyMgLVZlcnNp
b246IExQQUlEU1AuSFQuMS42LjItMDAwMjAtR0xZTVVSLTIKKyMgK1ZlcnNpb246IExQQUlEU1Au
SFQuMS42LjItMDAwNjQtR0xZTVVSLTEKKyMgIFJhd0ZpbGU6IHFjb20vZ2x5bXVyL2Fkc3ByLmpz
bgorIyAgUmF3RmlsZTogcWNvbS9nbHltdXIvYWRzcHMuanNuCisjICBSYXdGaWxlOiBxY29tL2ds
eW11ci9hZHNwdWEuanNuCisjIEBAIC03MDI1LDExICs3Mzg5LDE1IEBACisjICAjIHFjb20vaGF3
aQorIyAgRmlsZTogcWNvbS9oYXdpL2Fkc3AubWJuCisjICBGaWxlOiBxY29tL2hhd2kvYWRzcF9k
dGIubWJuCisjIC1WZXJzaW9uOiBMUEFJRFNQLkhULjEuNi0wMDcwMS40LUhBV0ktMgorIyArVmVy
c2lvbjogTFBBSURTUC5IVC4xLjYtMDA3MDEuNC1IQVdJLTMKKyMgIFJhd0ZpbGU6IHFjb20vaGF3
aS9hZHNwci5qc24KKyMgIFJhd0ZpbGU6IHFjb20vaGF3aS9hZHNwcy5qc24KKyMgIFJhd0ZpbGU6
IHFjb20vaGF3aS9hZHNwdWEuanNuCisjICBSYXdGaWxlOiBxY29tL2hhd2kvYWRzcHVvLmpzbgor
IyArRmlsZTogcWNvbS9oYXdpL2Nkc3AubWJuCisjICtGaWxlOiBxY29tL2hhd2kvY2RzcF9kdGIu
bWJuCisjICtWZXJzaW9uOiBDRFNQLkhULjMuNi0wMDUwMS42LUhBV0ktMQorIyArUmF3RmlsZTog
cWNvbS9oYXdpL2Nkc3ByLmpzbgorIyAgCisjICAjIHFjb20va2FhbmFwYWxpCisjICBGaWxlOiBx
Y29tL2thYW5hcGFsaS9hZHNwLm1ibgorIyBAQCAtNzA2NSw3ICs3NDMzLDcgQEAKKyMgIFZlcnNp
b246IERTUC5BVC4xLjAuMS0wMDIwNC1MRU1BTlMtMQorIyAgUmF3RmlsZTogcWNvbS9xY3M4MzAw
L2Nkc3ByLmpzbgorIyAgTGluazogcWNvbS9xY3M4MzAwL2dwZHNwMC5tYm4gLT4gLi4vc2E4Nzc1
cC9ncGRzcDAubWJuCisjIC1MaW5rOiBxY29tL3FjczgzMDAvZ3Bkc3ByLmpzbiAtPiAuLi9zYTg3
NzVwL2dwZHNwMC5tYm4KKyMgK0xpbms6IHFjb20vcWNzODMwMC9ncGRzcHIuanNuIC0+IC4uL3Nh
ODc3NXAvZ3Bkc3ByLmpzbgorIyAgCisjICAjIHFjb20vc2E4Nzc1cAorIyAgRmlsZTogcWNvbS9z
YTg3NzVwL2Fkc3AubWJuCisjIEBAIC03MDkwLDcgKzc0NTgsNyBAQAorIyAgRmlsZTogcWNvbS9u
b3JkL2Fkc3AxLm1ibgorIyAgRmlsZTogcWNvbS9ub3JkL2Fkc3BfZHRiLm1ibgorIyAgRmlsZTog
cWNvbS9ub3JkL2Fkc3AxX2R0Yi5tYm4KKyMgLVZlcnNpb246IEhQQVNTLkFULjEuMC4xLTAwMDAz
LU5PUkQtMQorIyArVmVyc2lvbjogSFBBU1MuQVQuMS4wLjEtMDAwMDMtTk9SRC02CisjICBSYXdG
aWxlOiBxY29tL25vcmQvYWRzcHIuanNuCisjICBSYXdGaWxlOiBxY29tL25vcmQvYWRzcHVhLmpz
bgorIyAgUmF3RmlsZTogcWNvbS9ub3JkL2Fkc3Axci5qc24KKyMgQEAgLTcxMTcsNiArNzQ4NSwx
MiBAQAorIyAgRmlsZTogcWNvbS9lbGl6YS9jZHNwX2R0Yi5tYm4KKyMgIFZlcnNpb246IENEU1Au
SFQuMy4xLTAwODg5LVBBS0FMQS0xCisjICBSYXdGaWxlOiBxY29tL2VsaXphL2Nkc3ByLmpzbgor
IyArRmlsZTogcWNvbS9lbGl6YS9hZHNwLm1ibgorIyArRmlsZTogcWNvbS9lbGl6YS9hZHNwX2R0
Yi5tYm4KKyMgK1ZlcnNpb246IExQQUlEU1AuSFQuMS4yLmMyLTAwMDY0LVBBS0FMQS0zCisjICtS
YXdGaWxlOiBxY29tL2VsaXphL2Fkc3ByLmpzbgorIyArUmF3RmlsZTogcWNvbS9lbGl6YS9hZHNw
cy5qc24KKyMgK1Jhd0ZpbGU6IHFjb20vZWxpemEvYWRzcHVhLmpzbgorIyAgCisjICAjIHFjb20v
eDFlODAxMDAKKyMgIEZpbGU6IHFjb20veDFlODAxMDAvYWRzcC5tYm4KKyMgQEAgLTcxMzMsMTIg
Kzc1MDcsMTMgQEAKKyMgIFJhd0ZpbGU6IHFjb20vc2hpa3JhL2Nkc3ByLmpzbgorIyAgRmlsZTog
cWNvbS9zaGlrcmEvbHBhaWNwLm1ibgorIyAgRmlsZTogcWNvbS9zaGlrcmEvbHBhaWNwX2R0Yi5t
Ym4KKyMgLVZlcnNpb246IExQQUlDUC5GVy4xLjItMDAxMzUtU0hJS1JBX0xQQUlDUF9QQUNLLTEK
KyMgK1ZlcnNpb246IExQQUlDUC5GVy4xLjItMDAxNTUtU0hJS1JBX0xQQUlDUF9QQUNLLTEKKyMg
IFJhd0ZpbGU6IHFjb20vc2hpa3JhL2xwYWljcHIuanNuCisjICBGaWxlOiBxY29tL3NoaWtyYS9j
cXMvcWRzcDZzdy5tYm4KKyMgLVZlcnNpb246IE1QU1MuSk8uNC4wLTAwMTk0LjItU0hJS1JBX0xX
R19QQUNLLTEKKyMgK1ZlcnNpb246IE1QU1MuSk8uNC4wLTAwMjcyLVNISUtSQV9MV0dfUEFDSy0y
CisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UucWNvbS0yIGFu
ZCBOT1RJQ0UucWNvbSBmb3IgZGV0YWlscworIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExp
Y2Vuc2VSZWYtTElDRU5TRS5xY29tLTIKKyMgIAorIyAgIyBEZWxsIFhQUzEzCisjICBGaWxlOiBx
Y29tL3gxZTgwMTAwL2RlbGwveHBzMTMtOTM0NS9hZHNwX2R0YnMuZWxmCisjIEBAIC03MTQ5LDkg
Kzc1MjQsMTIgQEAKKyMgIEZpbGU6IHFjb20veDFlODAxMDAvZGVsbC94cHMxMy05MzQ1L2Nkc3Bf
ZHRicy5lbGYKKyMgIFJhd0ZpbGU6IHFjb20veDFlODAxMDAvZGVsbC94cHMxMy05MzQ1L2Nkc3By
LmpzbgorIyAgRmlsZTogcWNvbS94MWU4MDEwMC9kZWxsL3hwczEzLTkzNDUvcWNhZHNwODM4MC5t
Ym4KKyMgK1ZlcnNpb246IEFEU1AuSFQuNS45LTAwODEwLUhBTU9BLTEKKyMgIEZpbGU6IHFjb20v
eDFlODAxMDAvZGVsbC94cHMxMy05MzQ1L3FjY2RzcDgzODAubWJuCisjICtWZXJzaW9uOiBDRFNQ
LkhULjIuOS5jMS0wMDA0Ni1IQU1PQS0xCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJs
ZS4gU2VlIExJQ0VOU0UuZGVsbCBhbmQgTk9USUNFLnFjb20gZm9yIGRldGFpbHMKKyMgK1NQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOU0UuZGVsbAorIyAgCisjICAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQorIyAgCisjIEBAIC03MTYwLDEwICs3NTM4LDEyIEBACisjICBGaWxlOiBx
Y29tL3NkbTg0NS9tYmEubWJuCisjICBMaW5rOiBxY29tL3NkbTg0NS9TSElGVC9heG9sb3RsL21i
YS5tYm4gLT4gLi4vLi4vbWJhLm1ibgorIyAgRmlsZTogcWNvbS9zZG04NDUvbW9kZW1fbm0ubWJu
CisjICtWZXJzaW9uOiBNUFNTLkFULjQuMC5jMi0wMTM2NS1TRE04NDVfR0VOX1BBQ0stMQorIyAg
UmF3RmlsZTogcWNvbS9zZG04NDUvbW9kZW11dy5qc24KKyMgIExpbms6IHFjb20vc2RtODQ1L21v
ZGVtLm1ibiAtPiBtb2RlbV9ubS5tYm4KKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxl
LiBTZWUgTElDRU5TRS5xY29tIGFuZCBOT1RJQ0UucWNvbSBmb3IgZGV0YWlscworIyArU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5TRS5xY29tCisjICAKKyMgIEluZm86
CisjICBCaW5hcnkgZmlsZXMgc3VwcGxpZWQgb3JpZ2luYWxseSBmcm9tCisjIEBAIC03MjU0LDgg
Kzc2MzQsMTEgQEAKKyMgIEZpbGU6IG1lbGxhbm94L21seHN3X3NwZWN0cnVtNC0zNC4yMDE2LjM5
MDAubWZhMgorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLm1l
bGxhbm94IGZvciBkZXRhaWxzLgorIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VS
ZWYtTElDRU5TRS5tZWxsYW5veAorIyAgCisjICBDb3B5cmlnaHQgKGMpIDIwMTctMjAyMCBNZWxs
YW5veCBUZWNobm9sb2dpZXMsIEx0ZC4gQWxsIHJpZ2h0cyByZXNlcnZlZC4KKyMgKworIyArU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSBPUiBCU0QtMy1DbGF1c2UKKyMgIAor
IyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgIAorIyBAQCAtNzI2NSw2ICs3NjQ4LDcgQEAKKyMgIFZl
cnNpb246IDIuMS4wCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VO
Q0UuY2FkZW5jZSBmb3IgZGV0YWlscworIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vu
c2VSZWYtTElDRU5DRS5jYWRlbmNlCisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAKKyMg
QEAgLTcyODcsNiArNzY3MSw3IEBACisjICBGaWxlOiBkcGFhMi9tYy9tY18xMC4yOC4xX2x4MjE2
MGEuaXRiCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0Uubnhw
X21jX2Zpcm13YXJlIGZvciBkZXRhaWxzCisjICtTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTGlj
ZW5zZVJlZi1MSUNFTlNFLm54cF9tY19maXJtd2FyZQorIyAgCisjICAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQorIyAgCisjIEBAIC03Mjk2LDYgKzc2ODEsNyBAQAorIyAgRmlsZTogbWljcm9jaGlwL21zY2Nf
dnNjODU4NF9yZXZiX2ludDgwNTFfZmI0OC5iaW4KKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmli
dXRhYmxlLiBTZWUgTElDRU5DRS5taWNyb2NoaXAgZm9yIGRldGFpbHMKKyMgK1NQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOQ0UubWljcm9jaGlwCisjICAKKyMgIC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCisjICAKKyMgQEAgLTczMTgsNiArNzcwNCw3IEBACisjICBGaWxlOiBtZXNv
bi92ZGVjL3NtMV92cDlfbW11LmJpbgorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUu
IFNlZSBMSUNFTlNFLmFtbG9naWNfdmRlYyBmb3IgZGV0YWlscy4KKyMgK1NQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOU0UuYW1sb2dpY192ZGVjCisjICAKKyMgIC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCisjICAKKyMgQEAgLTczMjgsMTEgKzc3MTUsMTMgQEAKKyMgIEZpbGU6IGlu
dGVsL2ljZS9kZHAtbGFnL2ljZV9sYWctMS4zLjIuMC5wa2cKKyMgIAorIyAgTGljZW5zZTogUmVk
aXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5pY2UgZm9yIGRldGFpbHMKKyMgK1NQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOU0UuaWNlCisjICAKKyMgIEZpbGU6IGludGVs
L2ljZS9kZHAtY29tbXMvaWNlX2NvbW1zLTEuMy41NS4wLnBrZworIyAgRmlsZTogaW50ZWwvaWNl
L2RkcC13aXJlbGVzc19lZGdlL2ljZV93aXJlbGVzc19lZGdlLTEuMy4yMy4wLnBrZworIyAgCisj
ICBMaWNlbnNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLmljZV9lbmhhbmNlZCBmb3Ig
ZGV0YWlscworIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5TRS5p
Y2VfZW5oYW5jZWQKKyMgIAorIyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgIAorIyBAQCAtNzM0Miw2
ICs3NzMxLDcgQEAKKyMgIEZpbGU6IGluc2lkZS1zZWN1cmUvZWlwMTk3X21pbmlmdy9pZnBwLmJp
bgorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLmluc2lkZS1z
ZWN1cmUgZm9yIGRldGFpbHMuCisjICtTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTGljZW5zZVJl
Zi1MSUNFTkNFLmluc2lkZS1zZWN1cmUKKyMgIAorIyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgIAor
IyBAQCAtNzM1NCw2ICs3NzQ0LDcgQEAKKyMgIEZpbGU6IG1ydmwvcHJlc3RlcmEvbXZzd19wcmVz
dGVyYV9md19hcm02NC12NC4xLmltZworIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUu
IFNlZSBMSUNFTkNFLk1hcnZlbGwgZm9yIGRldGFpbHMuCisjICtTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogTGljZW5zZVJlZi1MSUNFTkNFLk1hcnZlbGwKKyMgIAorIyAgLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KKyMgIAorIyBAQCAtNzM2Miw2ICs3NzUzLDcgQEAKKyMgIEZpbGU6IExvbnRpdW0vbHQ3OTEx
ZXhjX2Z3LmJpbgorIyAgCisjICBMaWNlbnNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNF
LkxvbnRpdW0gZm9yIGRldGFpbHMuCisjICtTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTGljZW5z
ZVJlZi1MSUNFTlNFLkxvbnRpdW0KKyMgIAorIyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgIAorIyBA
QCAtNzM3MSw2ICs3NzYzLDcgQEAKKyMgIExpbms6IGx0ODcxM3N4X2Z3LmJpbiAtPiBMb250aXVt
L2x0ODcxM3N4X2Z3LmJpbgorIyAgCisjICBMaWNlbnNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBM
SUNFTlNFLkxvbnRpdW0gZm9yIGRldGFpbHMuCisjICtTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
TGljZW5zZVJlZi1MSUNFTlNFLkxvbnRpdW0KKyMgIAorIyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMg
IAorIyBAQCAtNzM3OSw2ICs3NzcyLDcgQEAKKyMgIEZpbGU6IExvbnRpdW0vbHQ5NjExY19mdy5i
aW4KKyMgIAorIyAgTGljZW5zZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5Mb250aXVt
IGZvciBkZXRhaWxzLgorIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElD
RU5TRS5Mb250aXVtCisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAKKyMgQEAgLTczODgs
MTkgKzc3ODIsMjEgQEAKKyMgIExpbms6IGx0OTYxMXV4Y19mdy5iaW4gLT4gTG9udGl1bS9sdDk2
MTF1eGNfZncuYmluCisjICAKKyMgIExpY2Vuc2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VO
U0UuTG9udGl1bSBmb3IgZGV0YWlscy4KKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNl
bnNlUmVmLUxJQ0VOU0UuTG9udGl1bQorIyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisj
ICBEcml2ZXI6IHdmeCAtIFNpbGljb24gTGFicyBXaS1GaSBUcmFuc2NlaXZlcgorIyAgCisjICBG
aWxlOiB3Zngvd2ZtX3dmMjAwX0MwLnNlYworIyAtVmVyc2lvbjogMy4xNworIyArVmVyc2lvbjog
My4xOAorIyAgCisjICBGaWxlOiB3ZngvYnJkNDAwMWEucGRzCisjICBGaWxlOiB3ZngvYnJkODAy
MmEucGRzCisjICBGaWxlOiB3ZngvYnJkODAyM2EucGRzCisjICAKKyMgIExpY2VuY2U6IFJlZGlz
dHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0Uud2YyMDAgZm9yIGRldGFpbHMuCisjICtTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogTGljZW5zZVJlZi1MSUNFTkNFLndmMjAwCisjICAKKyMgIEluZm86Cisj
ICBUaGUgZmlybXdhcmUgaXRzZWxmIG9yaWdpbmF0ZXMgZnJvbSBodHRwczovL2dpdGh1Yi5jb20v
U2lsaWNvbkxhYnMvd2Z4LWZpcm13YXJlCisjIEBAIC03NDE3LDYgKzc4MTMsNyBAQAorIyAgRmls
ZTogY25tL3dhdmU1MjFjX2szX2NvZGVjX2Z3LmJpbgorIyAgCisjICBMaWNlbmNlOiBSZWRpc3Ry
aWJ1dGFibGUuIFNlZSBMSUNFTkNFLmNubSBmb3IgZGV0YWlscy4KKyMgK1NQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOQ0UuY25tCisjICAKKyMgIC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCisjICAKKyMgQEAgLTc0MjUsNiArNzgyMiw3IEBACisjICBGaWxlOiBjbm0vd2F2ZTYzM2Nf
aW14OV9jb2RlY19mdy5iaW4KKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUg
TElDRU5DRS5jbm0gZm9yIGRldGFpbHMuCisjICtTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTGlj
ZW5zZVJlZi1MSUNFTkNFLmNubQorIyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisjIEBA
IC03NDQ1LDYgKzc4NDMsNyBAQAorIyAgVmVyc2lvbjogdjEuMjEKKyMgIAorIyAgTGljZW5jZTog
UmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5NYXJ2ZWxsIGZvciBkZXRhaWxzLgorIyArU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5DRS5NYXJ2ZWxsCisjICAKKyMg
IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCisjICAKKyMgQEAgLTc0NTYsNiArNzg1NSw3IEBACisjICBWZXJz
aW9uOiAxLjMuNAorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNF
LmFtcGhpb25fdnB1IGZvciBkZXRhaWxzCisjICtTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTGlj
ZW5zZVJlZi1MSUNFTlNFLmFtcGhpb25fdnB1CisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisj
ICAKKyMgQEAgLTc4MDcsNiArODIwNywxNSBAQAorIyAgRmlsZTogY2lycnVzL2NzMzVsNDEtZHNw
MS1zcGstcHJvdC0xN2FhMzg2ZS1zcGtpZDAtcjAuYmluCisjICBGaWxlOiBjaXJydXMvY3MzNWw0
MS1kc3AxLXNway1wcm90LTE3YWEzODZlLXNwa2lkMS1sMC5iaW4KKyMgIEZpbGU6IGNpcnJ1cy9j
czM1bDQxLWRzcDEtc3BrLXByb3QtMTdhYTM4NmUtc3BraWQxLXIwLmJpbgorIyArTGluazogY2ly
cnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xN2FhMzg1Ni53bWZ3IC0+IGNzMzVsNDEvdjYuNDcu
MC9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjQ5LjAud21mdworIyArRmlsZTogY2lycnVzL2NzMzVs
NDEtZHNwMS1zcGstcHJvdC0xN2FhMzg1Ni1sMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQx
LWRzcDEtc3BrLXByb3QtMTdhYTM4NTYtcjAuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1k
c3AxLXNway1wcm90LTE3YWEzODQ1LndtZncgLT4gY3MzNWw0MS92Ni42MS4xL2hhbG9fY3NwbF9S
QU1fcmV2QjJfMjkuNjMuMS53bWZ3CisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1w
cm90LTE3YWEzODQ2LndtZncgLT4gY3MzNWw0MS92Ni42MS4xL2hhbG9fY3NwbF9SQU1fcmV2QjJf
MjkuNjMuMS53bWZ3CisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTE3YWEz
ODQ1LWwwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xN2FhMzg0
NS1yMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTdhYTM4NDYt
bDAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTE3YWEzODQ2LXIw
LmJpbgorIyAgRmlsZTogY2lycnVzL2NzMzVsNDEvdjYuNjMuMC9oYWxvX2NzcGxfUkFNX3JldkIy
XzI5LjY1LjAud21mdworIyAgTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQz
MTJhZi53bWZ3IC0+IGNzMzVsNDEvdjYuNjMuMC9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjY1LjAu
d21mdworIyAgRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMTJhZi1zcGtp
ZDAtbDAuYmluCisjIEBAIC04NDc2LDYgKzg4ODUsNyBAQAorIyAgRmlsZTogY2lycnVzL2NzMzVs
NDEtZHNwMS1zcGstcHJvdC0xMDI1MTg0NC1yMC5iaW4KKyMgIAorIyAgTGljZW5zZTogUmVkaXN0
cmlidXRhYmxlLiBTZWUgTElDRU5TRS5jaXJydXMgZm9yIGRldGFpbHMuCisjICtTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogTGljZW5zZVJlZi1MSUNFTlNFLmNpcnJ1cworIyAgCisjICBVc2Ugb2Yg
Q2lycnVzIExvZ2ljIGRyaXZlcnMsIGZpcm13YXJlIGFuZCBvdGhlciBtYXRlcmlhbHMgaXMgcGVy
bWl0dGVkCisjICBvbmx5IGluIGNvbm5lY3Rpb24gd2l0aCBDaXJydXMgTG9naWMgaGFyZHdhcmUg
cHJvZHVjdHMuCisjIEBAIC04NTA2LDkgKzg5MTYsMTEgQEAKKyMgIEZpbGU6IGNpcnJ1cy9jczM1
bDU2L0NTMzVMNTZfUmV2NC41Ljkud21mdworIyAgRmlsZTogY2lycnVzL2NzMzVsNTYvQ1MzNUw1
Nl9SZXY0LjcuMC53bWZ3CisjICBGaWxlOiBjaXJydXMvY3MzNWw1Ni9DUzM1TDU2X1JldjQuNy4y
LndtZncKKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDU2L0NTMzVMNTZfUmV2NC43Ljkud21mdworIyAg
RmlsZTogY2lycnVzL2NzMzVsNTYvQ1MzNUw1Nl9SZXY0LjcuMTIud21mdworIyAgRmlsZTogY2ly
cnVzL2NzMzVsNjMvQ1MzNUw2M19SZXYyLjUuNC53bWZ3CisjICBGaWxlOiBjaXJydXMvY3MzNWw2
My9DUzM1TDYzX1JldjIuNS43LndtZncKKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDYzL0NTMzVMNjNf
UmV2Mi41LjExLndtZncKKyMgIExpbms6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xMDI4
MGM2Mi1zcGtpZDAud21mdyAtPiBjczM1bDU2L0NTMzVMNTZfUmV2My4xMS4xMS53bWZ3CisjICBG
aWxlOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTAyODBjNjItc3BraWQwLWFtcDEuYmlu
CisjICBGaWxlOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTAyODBjNjItc3BraWQwLWFt
cDIuYmluCisjIEBAIC05MDY3LDYgKzk0NzksMTE2IEBACisjICBMaW5rOiBjaXJydXMvY3MzNWw1
Ni1iMC1kc3AxLW1pc2MtMTAyODBlODctc3BraWQxLndtZncgLT4gY3MzNWw1Ni9DUzM1TDU2X1Jl
djMuMTEuMjgud21mdworIyAgTGluazogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTEwMjgw
ZTg3LXNwa2lkMS1sMnUzLmJpbiAtPiBjczM1bDU2LWIwLWRzcDEtbWlzYy0xMDI4MGQxMy1zcGtp
ZDEtYW1wMi5iaW4KKyMgIExpbms6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xMDI4MGU4
Ny1zcGtpZDEtbDN1MS5iaW4gLT4gY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTAyODBkMTMtc3BraWQx
LWFtcDEuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlZGMt
c3BraWQwLndtZncgLT4gY3MzNWw2My9DUzM1TDYzX1JldjIuNS4xMS53bWZ3CisjICtGaWxlOiBj
aXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlZGMtc3BraWQwLTAwLWwzdTEuYmluCisj
ICtGaWxlOiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlZGMtc3BraWQwLTAwLWwz
dTMuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlZGMtc3Br
aWQwLTAxLWwzdTEuYmluIC0+IGNzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZWRjLXNwa2lkMC0w
MC1sM3UxLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZWRj
LXNwa2lkMC0wMS1sM3UzLmJpbiAtPiBjczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGVkYy1zcGtp
ZDAtMDAtbDN1My5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4
MGVkYy1zcGtpZDEud21mdyAtPiBjczM1bDYzL0NTMzVMNjNfUmV2Mi41LjExLndtZncKKyMgK0xp
bms6IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGVkYy1zcGtpZDEtMDAtbDN1MS5i
aW4gLT4gY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlZGMtc3BraWQwLTAwLWwzdTEuYmluCisj
ICtMaW5rOiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlZGMtc3BraWQxLTAwLWwz
dTMuYmluIC0+IGNzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZWRjLXNwa2lkMC0wMC1sM3UzLmJp
bgorIyArTGluazogY2lycnVzL2NzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZWRjLXNwa2lkMS0w
MS1sM3UxLmJpbiAtPiBjczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGVkYy1zcGtpZDAtMDAtbDN1
MS5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGVkYy1zcGtp
ZDEtMDEtbDN1My5iaW4gLT4gY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlZGMtc3BraWQwLTAw
LWwzdTMuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw1Ny1iMi1kc3AxLW1pc2MtMTAyODBlZTIt
c3BraWQxLndtZncgLT4gY3MzNWw1Ni9DUzM1TDU2X1JldjQuNy45LndtZncKKyMgK0ZpbGU6IGNp
cnJ1cy9jczM1bDU3LWIyLWRzcDEtbWlzYy0xMDI4MGVlMi1zcGtpZDEtbDJ1MS5iaW4KKyMgK0Zp
bGU6IGNpcnJ1cy9jczM1bDU3LWIyLWRzcDEtbWlzYy0xMDI4MGVlMi1zcGtpZDEtbDJ1My5iaW4K
KyMgK0xpbms6IGNpcnJ1cy9jczM1bDU3LWIyLWRzcDEtbWlzYy0xMDI4MGVlMi1zcGtpZDIud21m
dyAtPiBjczM1bDU2L0NTMzVMNTZfUmV2NC43Ljkud21mdworIyArRmlsZTogY2lycnVzL2NzMzVs
NTctYjItZHNwMS1taXNjLTEwMjgwZWUyLXNwa2lkMi1sMnUxLmJpbgorIyArRmlsZTogY2lycnVz
L2NzMzVsNTctYjItZHNwMS1taXNjLTEwMjgwZWUyLXNwa2lkMi1sMnUzLmJpbgorIyArTGluazog
Y2lycnVzL2NzMzVsNTctYjItZHNwMS1taXNjLTEwMjgwZWUyLXNwa2lkMy53bWZ3IC0+IGNzMzVs
NTYvQ1MzNUw1Nl9SZXY0LjcuOS53bWZ3CisjICtGaWxlOiBjaXJydXMvY3MzNWw1Ny1iMi1kc3Ax
LW1pc2MtMTAyODBlZTItc3BraWQzLWwydTEuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw1Ny1i
Mi1kc3AxLW1pc2MtMTAyODBlZTItc3BraWQzLWwydTMuYmluCisjICtMaW5rOiBjaXJydXMvY3Mz
NWw1Ny1iMi1kc3AxLW1pc2MtMTAyODBlZTMtc3BraWQxLndtZncgLT4gY3MzNWw1Ni9DUzM1TDU2
X1JldjQuNy45LndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDU3LWIyLWRzcDEtbWlzYy0xMDI4
MGVlMy1zcGtpZDEtbDJ1MS5iaW4gLT4gY3MzNWw1Ny1iMi1kc3AxLW1pc2MtMTAyODBlZTItc3Br
aWQxLWwydTEuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw1Ny1iMi1kc3AxLW1pc2MtMTAyODBl
ZTMtc3BraWQxLWwydTMuYmluIC0+IGNzMzVsNTctYjItZHNwMS1taXNjLTEwMjgwZWUyLXNwa2lk
MS1sMnUzLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNTctYjItZHNwMS1taXNjLTEwMjgwZWUz
LXNwa2lkMi53bWZ3IC0+IGNzMzVsNTYvQ1MzNUw1Nl9SZXY0LjcuOS53bWZ3CisjICtMaW5rOiBj
aXJydXMvY3MzNWw1Ny1iMi1kc3AxLW1pc2MtMTAyODBlZTMtc3BraWQyLWwydTEuYmluIC0+IGNz
MzVsNTctYjItZHNwMS1taXNjLTEwMjgwZWUyLXNwa2lkMi1sMnUxLmJpbgorIyArTGluazogY2ly
cnVzL2NzMzVsNTctYjItZHNwMS1taXNjLTEwMjgwZWUzLXNwa2lkMi1sMnUzLmJpbiAtPiBjczM1
bDU3LWIyLWRzcDEtbWlzYy0xMDI4MGVlMi1zcGtpZDItbDJ1My5iaW4KKyMgK0xpbms6IGNpcnJ1
cy9jczM1bDU3LWIyLWRzcDEtbWlzYy0xMDI4MGVlMy1zcGtpZDMud21mdyAtPiBjczM1bDU2L0NT
MzVMNTZfUmV2NC43Ljkud21mdworIyArTGluazogY2lycnVzL2NzMzVsNTctYjItZHNwMS1taXNj
LTEwMjgwZWUzLXNwa2lkMy1sMnUxLmJpbiAtPiBjczM1bDU3LWIyLWRzcDEtbWlzYy0xMDI4MGVl
Mi1zcGtpZDMtbDJ1MS5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDU3LWIyLWRzcDEtbWlzYy0x
MDI4MGVlMy1zcGtpZDMtbDJ1My5iaW4gLT4gY3MzNWw1Ny1iMi1kc3AxLW1pc2MtMTAyODBlZTIt
c3BraWQzLWwydTMuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw1Ny1iMi1kc3AxLW1pc2MtMTAy
ODBlZTQtc3BraWQxLndtZncgLT4gY3MzNWw1Ni9DUzM1TDU2X1JldjQuNy45LndtZncKKyMgK0Zp
bGU6IGNpcnJ1cy9jczM1bDU3LWIyLWRzcDEtbWlzYy0xMDI4MGVlNC1zcGtpZDEtbDJ1MS5iaW4K
KyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDU3LWIyLWRzcDEtbWlzYy0xMDI4MGVlNC1zcGtpZDEtbDJ1
My5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDU3LWIyLWRzcDEtbWlzYy0xMDI4MGVlNC1zcGtp
ZDIud21mdyAtPiBjczM1bDU2L0NTMzVMNTZfUmV2NC43Ljkud21mdworIyArRmlsZTogY2lycnVz
L2NzMzVsNTctYjItZHNwMS1taXNjLTEwMjgwZWU0LXNwa2lkMi1sMnUxLmJpbgorIyArRmlsZTog
Y2lycnVzL2NzMzVsNTctYjItZHNwMS1taXNjLTEwMjgwZWU0LXNwa2lkMi1sMnUzLmJpbgorIyAr
TGluazogY2lycnVzL2NzMzVsNTctYjItZHNwMS1taXNjLTEwMjgwZWU0LXNwa2lkMy53bWZ3IC0+
IGNzMzVsNTYvQ1MzNUw1Nl9SZXY0LjcuOS53bWZ3CisjICtGaWxlOiBjaXJydXMvY3MzNWw1Ny1i
Mi1kc3AxLW1pc2MtMTAyODBlZTQtc3BraWQzLWwydTEuYmluCisjICtGaWxlOiBjaXJydXMvY3Mz
NWw1Ny1iMi1kc3AxLW1pc2MtMTAyODBlZTQtc3BraWQzLWwydTMuYmluCisjICtMaW5rOiBjaXJy
dXMvY3MzNWw1Ny1iMi1kc3AxLW1pc2MtMTAyODBlZTUtc3BraWQxLndtZncgLT4gY3MzNWw1Ni9D
UzM1TDU2X1JldjQuNy45LndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDU3LWIyLWRzcDEtbWlz
Yy0xMDI4MGVlNS1zcGtpZDEtbDJ1MS5iaW4gLT4gY3MzNWw1Ny1iMi1kc3AxLW1pc2MtMTAyODBl
ZTQtc3BraWQxLWwydTEuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw1Ny1iMi1kc3AxLW1pc2Mt
MTAyODBlZTUtc3BraWQxLWwydTMuYmluIC0+IGNzMzVsNTctYjItZHNwMS1taXNjLTEwMjgwZWU0
LXNwa2lkMS1sMnUzLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNTctYjItZHNwMS1taXNjLTEw
MjgwZWU1LXNwa2lkMi53bWZ3IC0+IGNzMzVsNTYvQ1MzNUw1Nl9SZXY0LjcuOS53bWZ3CisjICtM
aW5rOiBjaXJydXMvY3MzNWw1Ny1iMi1kc3AxLW1pc2MtMTAyODBlZTUtc3BraWQyLWwydTEuYmlu
IC0+IGNzMzVsNTctYjItZHNwMS1taXNjLTEwMjgwZWU0LXNwa2lkMi1sMnUxLmJpbgorIyArTGlu
azogY2lycnVzL2NzMzVsNTctYjItZHNwMS1taXNjLTEwMjgwZWU1LXNwa2lkMi1sMnUzLmJpbiAt
PiBjczM1bDU3LWIyLWRzcDEtbWlzYy0xMDI4MGVlNC1zcGtpZDItbDJ1My5iaW4KKyMgK0xpbms6
IGNpcnJ1cy9jczM1bDU3LWIyLWRzcDEtbWlzYy0xMDI4MGVlNS1zcGtpZDMud21mdyAtPiBjczM1
bDU2L0NTMzVMNTZfUmV2NC43Ljkud21mdworIyArTGluazogY2lycnVzL2NzMzVsNTctYjItZHNw
MS1taXNjLTEwMjgwZWU1LXNwa2lkMy1sMnUxLmJpbiAtPiBjczM1bDU3LWIyLWRzcDEtbWlzYy0x
MDI4MGVlNC1zcGtpZDMtbDJ1MS5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDU3LWIyLWRzcDEt
bWlzYy0xMDI4MGVlNS1zcGtpZDMtbDJ1My5iaW4gLT4gY3MzNWw1Ny1iMi1kc3AxLW1pc2MtMTAy
ODBlZTQtc3BraWQzLWwydTMuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1p
c2MtMTAyODBlZWMtc3BraWQwLndtZncgLT4gY3MzNWw2My9DUzM1TDYzX1JldjIuNS43LndtZncK
KyMgK0xpbms6IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGVlYy1zcGtpZDAtMDEt
bDN1MS5iaW4gLT4gY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlMWMtc3BraWQwLTAxLWwzdTEu
YmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlZWMtc3BraWQw
LTAxLWwzdTMuYmluIC0+IGNzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZTFjLXNwa2lkMC0wMS1s
M3UzLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZWVjLXNw
a2lkMC0wMi1sM3UxLmJpbiAtPiBjczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGUxYy1zcGtpZDAt
MDEtbDN1MS5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGVl
Yy1zcGtpZDAtMDItbDN1My5iaW4gLT4gY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlMWMtc3Br
aWQwLTAxLWwzdTMuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAy
ODBlZWMtc3BraWQxLndtZncgLT4gY3MzNWw2My9DUzM1TDYzX1JldjIuNS43LndtZncKKyMgK0xp
bms6IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGVlYy1zcGtpZDEtMDEtbDN1MS5i
aW4gLT4gY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlMWMtc3BraWQxLTAxLWwzdTEuYmluCisj
ICtMaW5rOiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlZWMtc3BraWQxLTAxLWwz
dTMuYmluIC0+IGNzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZTFjLXNwa2lkMS0wMS1sM3UzLmJp
bgorIyArTGluazogY2lycnVzL2NzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZWVjLXNwa2lkMS0w
Mi1sM3UxLmJpbiAtPiBjczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGUxYy1zcGtpZDEtMDEtbDN1
MS5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGVlYy1zcGtp
ZDEtMDItbDN1My5iaW4gLT4gY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlMWMtc3BraWQxLTAx
LWwzdTMuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlZWMt
c3BraWQyLndtZncgLT4gY3MzNWw2My9DUzM1TDYzX1JldjIuNS43LndtZncKKyMgK0xpbms6IGNp
cnJ1cy9jczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGVlYy1zcGtpZDItMDEtbDN1MS5iaW4gLT4g
Y3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlMWMtc3BraWQyLTAxLWwzdTEuYmluCisjICtMaW5r
OiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlZWMtc3BraWQyLTAxLWwzdTMuYmlu
IC0+IGNzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZTFjLXNwa2lkMi0wMS1sM3UzLmJpbgorIyAr
TGluazogY2lycnVzL2NzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZWVjLXNwa2lkMi0wMi1sM3Ux
LmJpbiAtPiBjczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGUxYy1zcGtpZDItMDEtbDN1MS5iaW4K
KyMgK0xpbms6IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGVlYy1zcGtpZDItMDIt
bDN1My5iaW4gLT4gY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlMWMtc3BraWQyLTAxLWwzdTMu
YmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlZWMtc3BraWQz
LndtZncgLT4gY3MzNWw2My9DUzM1TDYzX1JldjIuNS43LndtZncKKyMgK0xpbms6IGNpcnJ1cy9j
czM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGVlYy1zcGtpZDMtMDEtbDN1MS5iaW4gLT4gY3MzNWw2
My1hMS1kc3AxLW1pc2MtMTAyODBlMWMtc3BraWQzLTAxLWwzdTEuYmluCisjICtMaW5rOiBjaXJy
dXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlZWMtc3BraWQzLTAxLWwzdTMuYmluIC0+IGNz
MzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZTFjLXNwa2lkMy0wMS1sM3UzLmJpbgorIyArTGluazog
Y2lycnVzL2NzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZWVjLXNwa2lkMy0wMi1sM3UxLmJpbiAt
PiBjczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGUxYy1zcGtpZDMtMDEtbDN1MS5iaW4KKyMgK0xp
bms6IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGVlYy1zcGtpZDMtMDItbDN1My5i
aW4gLT4gY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlMWMtc3BraWQzLTAxLWwzdTMuYmluCisj
ICtMaW5rOiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlZWQtc3BraWQwLndtZncg
LT4gY3MzNWw2My9DUzM1TDYzX1JldjIuNS43LndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDYz
LWExLWRzcDEtbWlzYy0xMDI4MGVlZC1zcGtpZDAtMDYtbDN1MS5iaW4gLT4gY3MzNWw2My1hMS1k
c3AxLW1pc2MtMTAyODBlMWUtc3BraWQwLTA2LWwzdTEuYmluCisjICtMaW5rOiBjaXJydXMvY3Mz
NWw2My1hMS1kc3AxLW1pc2MtMTAyODBlZWQtc3BraWQwLTA2LWwzdTMuYmluIC0+IGNzMzVsNjMt
YTEtZHNwMS1taXNjLTEwMjgwZTFlLXNwa2lkMC0wNi1sM3UzLmJpbgorIyArTGluazogY2lycnVz
L2NzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZWVkLXNwa2lkMC0wNy1sM3UxLmJpbiAtPiBjczM1
bDYzLWExLWRzcDEtbWlzYy0xMDI4MGUxZS1zcGtpZDAtMDYtbDN1MS5iaW4KKyMgK0xpbms6IGNp
cnJ1cy9jczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGVlZC1zcGtpZDAtMDctbDN1My5iaW4gLT4g
Y3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlMWUtc3BraWQwLTA2LWwzdTMuYmluCisjICtMaW5r
OiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlZWQtc3BraWQxLndtZncgLT4gY3Mz
NWw2My9DUzM1TDYzX1JldjIuNS43LndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDYzLWExLWRz
cDEtbWlzYy0xMDI4MGVlZC1zcGtpZDEtMDYtbDN1MS5iaW4gLT4gY3MzNWw2My1hMS1kc3AxLW1p
c2MtMTAyODBlMWUtc3BraWQxLTA2LWwzdTEuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw2My1h
MS1kc3AxLW1pc2MtMTAyODBlZWQtc3BraWQxLTA2LWwzdTMuYmluIC0+IGNzMzVsNjMtYTEtZHNw
MS1taXNjLTEwMjgwZTFlLXNwa2lkMS0wNi1sM3UzLmJpbgorIyArTGluazogY2lycnVzL2NzMzVs
NjMtYTEtZHNwMS1taXNjLTEwMjgwZWVkLXNwa2lkMS0wNy1sM3UxLmJpbiAtPiBjczM1bDYzLWEx
LWRzcDEtbWlzYy0xMDI4MGUxZS1zcGtpZDEtMDYtbDN1MS5iaW4KKyMgK0xpbms6IGNpcnJ1cy9j
czM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGVlZC1zcGtpZDEtMDctbDN1My5iaW4gLT4gY3MzNWw2
My1hMS1kc3AxLW1pc2MtMTAyODBlMWUtc3BraWQxLTA2LWwzdTMuYmluCisjICtMaW5rOiBjaXJy
dXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlZWQtc3BraWQyLndtZncgLT4gY3MzNWw2My9D
UzM1TDYzX1JldjIuNS43LndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEtbWlz
Yy0xMDI4MGVlZC1zcGtpZDItMDYtbDN1MS5iaW4gLT4gY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAy
ODBlMWUtc3BraWQyLTA2LWwzdTEuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw2My1hMS1kc3Ax
LW1pc2MtMTAyODBlZWQtc3BraWQyLTA2LWwzdTMuYmluIC0+IGNzMzVsNjMtYTEtZHNwMS1taXNj
LTEwMjgwZTFlLXNwa2lkMi0wNi1sM3UzLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNjMtYTEt
ZHNwMS1taXNjLTEwMjgwZWVkLXNwa2lkMi0wNy1sM3UxLmJpbiAtPiBjczM1bDYzLWExLWRzcDEt
bWlzYy0xMDI4MGUxZS1zcGtpZDItMDYtbDN1MS5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDYz
LWExLWRzcDEtbWlzYy0xMDI4MGVlZC1zcGtpZDItMDctbDN1My5iaW4gLT4gY3MzNWw2My1hMS1k
c3AxLW1pc2MtMTAyODBlMWUtc3BraWQyLTA2LWwzdTMuYmluCisjICtMaW5rOiBjaXJydXMvY3Mz
NWw2My1hMS1kc3AxLW1pc2MtMTAyODBlZWQtc3BraWQzLndtZncgLT4gY3MzNWw2My9DUzM1TDYz
X1JldjIuNS43LndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4
MGVlZC1zcGtpZDMtMDYtbDN1MS5iaW4gLT4gY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlMWUt
c3BraWQzLTA2LWwzdTEuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2Mt
MTAyODBlZWQtc3BraWQzLTA2LWwzdTMuYmluIC0+IGNzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgw
ZTFlLXNwa2lkMy0wNi1sM3UzLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNjMtYTEtZHNwMS1t
aXNjLTEwMjgwZWVkLXNwa2lkMy0wNy1sM3UxLmJpbiAtPiBjczM1bDYzLWExLWRzcDEtbWlzYy0x
MDI4MGUxZS1zcGtpZDMtMDYtbDN1MS5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDYzLWExLWRz
cDEtbWlzYy0xMDI4MGVlZC1zcGtpZDMtMDctbDN1My5iaW4gLT4gY3MzNWw2My1hMS1kc3AxLW1p
c2MtMTAyODBlMWUtc3BraWQzLTA2LWwzdTMuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw2My1h
MS1kc3AxLW1pc2MtMTAyODBlZWUtc3BraWQwLndtZncgLT4gY3MzNWw2My9DUzM1TDYzX1JldjIu
NS43LndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGVlZS1z
cGtpZDAtMDItbDN1MS5iaW4gLT4gY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlMWMtc3BraWQw
LTAxLWwzdTEuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBl
ZWUtc3BraWQwLTAyLWwzdTMuYmluIC0+IGNzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZTFjLXNw
a2lkMC0wMS1sM3UzLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNjMtYTEtZHNwMS1taXNjLTEw
MjgwZWVlLXNwa2lkMS53bWZ3IC0+IGNzMzVsNjMvQ1MzNUw2M19SZXYyLjUuNy53bWZ3CisjICtM
aW5rOiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlZWUtc3BraWQxLTAyLWwzdTEu
YmluIC0+IGNzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZTFjLXNwa2lkMS0wMS1sM3UxLmJpbgor
IyArTGluazogY2lycnVzL2NzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZWVlLXNwa2lkMS0wMi1s
M3UzLmJpbiAtPiBjczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGUxYy1zcGtpZDEtMDEtbDN1My5i
aW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGVlZS1zcGtpZDIu
d21mdyAtPiBjczM1bDYzL0NTMzVMNjNfUmV2Mi41Ljcud21mdworIyArTGluazogY2lycnVzL2Nz
MzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZWVlLXNwa2lkMi0wMi1sM3UxLmJpbiAtPiBjczM1bDYz
LWExLWRzcDEtbWlzYy0xMDI4MGUxYy1zcGtpZDItMDEtbDN1MS5iaW4KKyMgK0xpbms6IGNpcnJ1
cy9jczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGVlZS1zcGtpZDItMDItbDN1My5iaW4gLT4gY3Mz
NWw2My1hMS1kc3AxLW1pc2MtMTAyODBlMWMtc3BraWQyLTAxLWwzdTMuYmluCisjICtMaW5rOiBj
aXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlZWUtc3BraWQzLndtZncgLT4gY3MzNWw2
My9DUzM1TDYzX1JldjIuNS43LndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEt
bWlzYy0xMDI4MGVlZS1zcGtpZDMtMDItbDN1MS5iaW4gLT4gY3MzNWw2My1hMS1kc3AxLW1pc2Mt
MTAyODBlMWMtc3BraWQzLTAxLWwzdTEuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw2My1hMS1k
c3AxLW1pc2MtMTAyODBlZWUtc3BraWQzLTAyLWwzdTMuYmluIC0+IGNzMzVsNjMtYTEtZHNwMS1t
aXNjLTEwMjgwZTFjLXNwa2lkMy0wMS1sM3UzLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNjMt
YTEtZHNwMS1taXNjLTEwMjgwZWVmLXNwa2lkMC53bWZ3IC0+IGNzMzVsNjMvQ1MzNUw2M19SZXYy
LjUuNy53bWZ3CisjICtMaW5rOiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlZWYt
c3BraWQwLTA1LWwzdTEuYmluIC0+IGNzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZTFlLXNwa2lk
MC0wNi1sM3UxLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgw
ZWVmLXNwa2lkMC0wNS1sM3UzLmJpbiAtPiBjczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGUxZS1z
cGtpZDAtMDYtbDN1My5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEtbWlzYy0x
MDI4MGVlZi1zcGtpZDEud21mdyAtPiBjczM1bDYzL0NTMzVMNjNfUmV2Mi41Ljcud21mdworIyAr
TGluazogY2lycnVzL2NzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZWVmLXNwa2lkMS0wNS1sM3Ux
LmJpbiAtPiBjczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGUxZS1zcGtpZDEtMDYtbDN1MS5iaW4K
KyMgK0xpbms6IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGVlZi1zcGtpZDEtMDUt
bDN1My5iaW4gLT4gY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlMWUtc3BraWQxLTA2LWwzdTMu
YmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlZWYtc3BraWQy
LndtZncgLT4gY3MzNWw2My9DUzM1TDYzX1JldjIuNS43LndtZncKKyMgK0xpbms6IGNpcnJ1cy9j
czM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGVlZi1zcGtpZDItMDUtbDN1MS5iaW4gLT4gY3MzNWw2
My1hMS1kc3AxLW1pc2MtMTAyODBlMWUtc3BraWQyLTA2LWwzdTEuYmluCisjICtMaW5rOiBjaXJy
dXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlZWYtc3BraWQyLTA1LWwzdTMuYmluIC0+IGNz
MzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZTFlLXNwa2lkMi0wNi1sM3UzLmJpbgorIyArTGluazog
Y2lycnVzL2NzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZWVmLXNwa2lkMy53bWZ3IC0+IGNzMzVs
NjMvQ1MzNUw2M19SZXYyLjUuNy53bWZ3CisjICtMaW5rOiBjaXJydXMvY3MzNWw2My1hMS1kc3Ax
LW1pc2MtMTAyODBlZWYtc3BraWQzLTA1LWwzdTEuYmluIC0+IGNzMzVsNjMtYTEtZHNwMS1taXNj
LTEwMjgwZTFlLXNwa2lkMy0wNi1sM3UxLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNjMtYTEt
ZHNwMS1taXNjLTEwMjgwZWVmLXNwa2lkMy0wNS1sM3UzLmJpbiAtPiBjczM1bDYzLWExLWRzcDEt
bWlzYy0xMDI4MGUxZS1zcGtpZDMtMDYtbDN1My5iaW4KKyMgIExpbms6IGNpcnJ1cy9jczM1bDYz
LWExLWRzcDEtbWlzYy0xMDI4MGVmYi1zcGtpZDAud21mdyAtPiBjczM1bDYzL0NTMzVMNjNfUmV2
Mi41Ljcud21mdworIyAgTGluazogY2lycnVzL2NzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZWZi
LXNwa2lkMC0wMi1sMXUxLmJpbiAtPiBjczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGUxYy1zcGtp
ZDAtMDEtbDN1MS5iaW4KKyMgIExpbms6IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4
MGVmYi1zcGtpZDAtMDItbDF1My5iaW4gLT4gY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlMWMt
c3BraWQwLTAxLWwzdTMuYmluCisjIEBAIC05MDkxLDYgKzk2MTMsNDIgQEAKKyMgIExpbms6IGNp
cnJ1cy9jczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGVmYy1zcGtpZDMud21mdyAtPiBjczM1bDYz
L0NTMzVMNjNfUmV2Mi41Ljcud21mdworIyAgTGluazogY2lycnVzL2NzMzVsNjMtYTEtZHNwMS1t
aXNjLTEwMjgwZWZjLXNwa2lkMy0wNS1sMXUxLmJpbiAtPiBjczM1bDYzLWExLWRzcDEtbWlzYy0x
MDI4MGUxZS1zcGtpZDMtMDYtbDN1MS5iaW4KKyMgIExpbms6IGNpcnJ1cy9jczM1bDYzLWExLWRz
cDEtbWlzYy0xMDI4MGVmYy1zcGtpZDMtMDUtbDF1My5iaW4gLT4gY3MzNWw2My1hMS1kc3AxLW1p
c2MtMTAyODBlMWUtc3BraWQzLTA2LWwzdTMuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw2My1h
MS1kc3AxLW1pc2MtMTAyODBmMDEtc3BraWQwLndtZncgLT4gY3MzNWw2My9DUzM1TDYzX1JldjIu
NS4xMS53bWZ3CisjICtGaWxlOiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBmMDEt
c3BraWQwLTAwLWwwdTMuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2Mt
MTAyODBmMDEtc3BraWQwLTAwLWwzdTEuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw2My1hMS1k
c3AxLW1pc2MtMTAyODBmMDEtc3BraWQxLndtZncgLT4gY3MzNWw2My9DUzM1TDYzX1JldjIuNS4x
MS53bWZ3CisjICtMaW5rOiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBmMDEtc3Br
aWQxLTAwLWwwdTMuYmluIC0+IGNzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZjAxLXNwa2lkMC0w
MC1sMHUzLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZjAx
LXNwa2lkMS0wMC1sM3UxLmJpbiAtPiBjczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGYwMS1zcGtp
ZDAtMDAtbDN1MS5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4
MGYwNC1zcGtpZDAud21mdyAtPiBjczM1bDYzL0NTMzVMNjNfUmV2Mi41LjExLndtZncKKyMgK0xp
bms6IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGYwNC1zcGtpZDAtMDAtbDB1My5i
aW4gLT4gY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBmMDEtc3BraWQwLTAwLWwwdTMuYmluCisj
ICtMaW5rOiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBmMDQtc3BraWQwLTAwLWwz
dTEuYmluIC0+IGNzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZjAxLXNwa2lkMC0wMC1sM3UxLmJp
bgorIyArTGluazogY2lycnVzL2NzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZjA0LXNwa2lkMS53
bWZ3IC0+IGNzMzVsNjMvQ1MzNUw2M19SZXYyLjUuMTEud21mdworIyArTGluazogY2lycnVzL2Nz
MzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZjA0LXNwa2lkMS0wMC1sMHUzLmJpbiAtPiBjczM1bDYz
LWExLWRzcDEtbWlzYy0xMDI4MGYwMS1zcGtpZDAtMDAtbDB1My5iaW4KKyMgK0xpbms6IGNpcnJ1
cy9jczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGYwNC1zcGtpZDEtMDAtbDN1MS5iaW4gLT4gY3Mz
NWw2My1hMS1kc3AxLW1pc2MtMTAyODBmMDEtc3BraWQwLTAwLWwzdTEuYmluCisjICtMaW5rOiBj
aXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBmMDctc3BraWQwLndtZncgLT4gY3MzNWw2
My9DUzM1TDYzX1JldjIuNS43LndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEt
bWlzYy0xMDI4MGYwNy1zcGtpZDAtMDItbDN1MS5iaW4gLT4gY3MzNWw2My1hMS1kc3AxLW1pc2Mt
MTAyODBlMWEtc3BraWQwLTAyLWwzdTEuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw2My1hMS1k
c3AxLW1pc2MtMTAyODBmMDctc3BraWQwLTAyLWwzdTMuYmluIC0+IGNzMzVsNjMtYTEtZHNwMS1t
aXNjLTEwMjgwZTFhLXNwa2lkMC0wMi1sM3UzLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNjMt
YTEtZHNwMS1taXNjLTEwMjgwZjA3LXNwa2lkMi53bWZ3IC0+IGNzMzVsNjMvQ1MzNUw2M19SZXYy
LjUuNy53bWZ3CisjICtMaW5rOiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBmMDct
c3BraWQyLTAxLWwzdTEuYmluIC0+IGNzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZTFhLXNwa2lk
Mi0wMS1sM3UxLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgw
ZjA3LXNwa2lkMi0wMS1sM3UzLmJpbiAtPiBjczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGUxYS1z
cGtpZDItMDEtbDN1My5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEtbWlzYy0x
MDI4MGYwNy1zcGtpZDMud21mdyAtPiBjczM1bDYzL0NTMzVMNjNfUmV2Mi41Ljcud21mdworIyAr
TGluazogY2lycnVzL2NzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZjA3LXNwa2lkMy0wMS1sM3Ux
LmJpbiAtPiBjczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGUxYS1zcGtpZDMtMDEtbDN1MS5iaW4K
KyMgK0xpbms6IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGYwNy1zcGtpZDMtMDEt
bDN1My5iaW4gLT4gY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlMWEtc3BraWQzLTAxLWwzdTMu
YmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBmMDctc3BraWQz
LTAyLWwzdTEuYmluIC0+IGNzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZTFhLXNwa2lkMy0wMi1s
M3UxLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZjA3LXNw
a2lkMy0wMi1sM3UzLmJpbiAtPiBjczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGUxYS1zcGtpZDMt
MDItbDN1My5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGYw
OC1zcGtpZDAud21mdyAtPiBjczM1bDYzL0NTMzVMNjNfUmV2Mi41Ljcud21mdworIyArTGluazog
Y2lycnVzL2NzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZjA4LXNwa2lkMC0wMy1sM3UxLmJpbiAt
PiBjczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGUyMy1zcGtpZDAtMDMtbDF1MS5iaW4KKyMgK0xp
bms6IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGYwOC1zcGtpZDAtMDMtbDN1My5i
aW4gLT4gY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlMjMtc3BraWQwLTAzLWwxdTMuYmluCisj
ICtMaW5rOiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBmMDgtc3BraWQwLTA0LWwz
dTEuYmluIC0+IGNzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZTIzLXNwa2lkMC0wNC1sMXUxLmJp
bgorIyArTGluazogY2lycnVzL2NzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZjA4LXNwa2lkMC0w
NC1sM3UzLmJpbiAtPiBjczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGUyMy1zcGtpZDAtMDQtbDF1
My5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGYwOC1zcGtp
ZDIud21mdyAtPiBjczM1bDYzL0NTMzVMNjNfUmV2Mi41Ljcud21mdworIyArTGluazogY2lycnVz
L2NzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZjA4LXNwa2lkMi0wMy1sM3UxLmJpbiAtPiBjczM1
bDYzLWExLWRzcDEtbWlzYy0xMDI4MGUyMy1zcGtpZDItMDMtbDF1MS5iaW4KKyMgK0xpbms6IGNp
cnJ1cy9jczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGYwOC1zcGtpZDItMDMtbDN1My5iaW4gLT4g
Y3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlMjMtc3BraWQyLTAzLWwxdTMuYmluCisjICtMaW5r
OiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBmMDgtc3BraWQyLTA0LWwzdTEuYmlu
IC0+IGNzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZTIzLXNwa2lkMi0wNC1sMXUxLmJpbgorIyAr
TGluazogY2lycnVzL2NzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZjA4LXNwa2lkMi0wNC1sM3Uz
LmJpbiAtPiBjczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGUyMy1zcGtpZDItMDQtbDF1My5iaW4K
KyMgK0xpbms6IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGYwOC1zcGtpZDMud21m
dyAtPiBjczM1bDYzL0NTMzVMNjNfUmV2Mi41Ljcud21mdworIyArTGluazogY2lycnVzL2NzMzVs
NjMtYTEtZHNwMS1taXNjLTEwMjgwZjA4LXNwa2lkMy0wNC1sM3UxLmJpbiAtPiBjczM1bDYzLWEx
LWRzcDEtbWlzYy0xMDI4MGUyMy1zcGtpZDMtMDQtbDF1MS5iaW4KKyMgK0xpbms6IGNpcnJ1cy9j
czM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGYwOC1zcGtpZDMtMDQtbDN1My5iaW4gLT4gY3MzNWw2
My1hMS1kc3AxLW1pc2MtMTAyODBlMjMtc3BraWQzLTA0LWwxdTMuYmluCisjICBMaW5rOiBjaXJy
dXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTAzYzhjNTIud21mdyAtPiBjczM1bDU2L0NTMzVMNTZf
UmV2My4xMS4xOC53bWZ3CisjICBGaWxlOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTAz
YzhjNTItYW1wMS5iaW4KKyMgIEZpbGU6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xMDNj
OGM1Mi1hbXAyLmJpbgorIyBAQCAtOTQ3Miw2ICsxMDAzMCw3IEBACisjICBMaW5rOiBjaXJydXMv
Y3MzNWw1Ny1iMi1kc3AxLW1pc2MtMTdhYTUxNTktc3BraWQxLWwydTQuYmluIC0+IGNzMzVsNTct
YjItZHNwMS1taXNjLTE3YWE1MTU4LXNwa2lkMS1sMnU0LmJpbgorIyAgCisjICBMaWNlbnNlOiBS
ZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLmNpcnJ1cyBmb3IgZGV0YWlscy4KKyMgK1NQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOU0UuY2lycnVzCisjICAKKyMgIFVz
ZSBvZiBDaXJydXMgTG9naWMgZHJpdmVycywgZmlybXdhcmUgYW5kIG90aGVyIG1hdGVyaWFscyBp
cyBwZXJtaXR0ZWQKKyMgIG9ubHkgaW4gY29ubmVjdGlvbiB3aXRoIENpcnJ1cyBMb2dpYyBoYXJk
d2FyZSBwcm9kdWN0cy4KKyMgQEAgLTk0ODYsNiArMTAwNDUsNyBAQAorIyAgRmlsZTogY3M0Mmw0
My5iaW4KKyMgIAorIyAgTGljZW5zZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5jaXJy
dXMgZm9yIGRldGFpbHMuCisjICtTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTGljZW5zZVJlZi1M
SUNFTlNFLmNpcnJ1cworIyAgCisjICBVc2Ugb2YgQ2lycnVzIExvZ2ljIGRyaXZlcnMsIGZpcm13
YXJlIGFuZCBvdGhlciBtYXRlcmlhbHMgaXMgcGVybWl0dGVkCisjICBvbmx5IGluIGNvbm5lY3Rp
b24gd2l0aCBDaXJydXMgTG9naWMgaGFyZHdhcmUgcHJvZHVjdHMuCisjIEBAIC05NDk1LDcgKzEw
MDU1LDcgQEAKKyMgIAorIyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAKKyMgLURyaXZlcjogY3M0
Mmw0NSAtIENTNDJMNDUgU0RDQSBhdWRpbyBkcml2ZXIKKyMgK0RyaXZlcjogY3M0Mmw0NSAtIENT
NDJMNDUgU0RDQSBhdWRpbyBkcml2ZXIgZmFtaWx5IChpbmNsdWRlcyBjczQybDQ5KQorIyAgCisj
ICBGaWxlOiBzZGNhLzFmYS9jczQybDQ1X3ByaW1lcjEuYmluCisjICBGaWxlOiBzZGNhLzFmYS9j
czQybDQ1X3ByaW1lcjIuYmluCisjIEBAIC05Njg4LDYgKzEwMjQ4LDU3IEBACisjICBMaW5rOiBz
ZGNhLzFmYS8xMDI4L2VmYy80LmJpbiAtPiAuLi8uLi9jczQybDQ1X3ByaW1lcjQuYmluCisjICBM
aW5rOiBzZGNhLzFmYS8xMDI4L2VmYy80MjQ1MDAwNS5iaW4gLT4gLi4vY3M0Mmw0NV92MjAyNjA2
MTUuYmluCisjICAKKyMgK0ZpbGU6IHNkY2EvMWZhLzEwMjgvY3M0Mmw0NV92MjAyNjA5MTcuYmlu
CisjICtMaW5rOiBzZGNhLzFmYS8xMDI4L2VlYy8xLmJpbiAtPiAuLi8uLi9jczQybDQ1X3ByaW1l
cjEuYmluCisjICtMaW5rOiBzZGNhLzFmYS8xMDI4L2VlYy8yLmJpbiAtPiAuLi8uLi9jczQybDQ1
X3ByaW1lcjIuYmluCisjICtMaW5rOiBzZGNhLzFmYS8xMDI4L2VlYy8zLmJpbiAtPiAuLi8uLi9j
czQybDQ1X3ByaW1lcjMuYmluCisjICtMaW5rOiBzZGNhLzFmYS8xMDI4L2VlYy80LmJpbiAtPiAu
Li8uLi9jczQybDQ1X3ByaW1lcjQuYmluCisjICtMaW5rOiBzZGNhLzFmYS8xMDI4L2VlYy80MjQ1
MDAwNS5iaW4gLT4gLi4vY3M0Mmw0NV92MjAyNjA5MTcuYmluCisjICtMaW5rOiBzZGNhLzFmYS8x
MDI4L2VlZC8xLmJpbiAtPiAuLi8uLi9jczQybDQ1X3ByaW1lcjEuYmluCisjICtMaW5rOiBzZGNh
LzFmYS8xMDI4L2VlZC8yLmJpbiAtPiAuLi8uLi9jczQybDQ1X3ByaW1lcjIuYmluCisjICtMaW5r
OiBzZGNhLzFmYS8xMDI4L2VlZC8zLmJpbiAtPiAuLi8uLi9jczQybDQ1X3ByaW1lcjMuYmluCisj
ICtMaW5rOiBzZGNhLzFmYS8xMDI4L2VlZC80LmJpbiAtPiAuLi8uLi9jczQybDQ1X3ByaW1lcjQu
YmluCisjICtMaW5rOiBzZGNhLzFmYS8xMDI4L2VlZC80MjQ1MDAwNS5iaW4gLT4gLi4vY3M0Mmw0
NV92MjAyNjA5MTcuYmluCisjICtMaW5rOiBzZGNhLzFmYS8xMDI4L2VlZS8xLmJpbiAtPiAuLi8u
Li9jczQybDQ1X3ByaW1lcjEuYmluCisjICtMaW5rOiBzZGNhLzFmYS8xMDI4L2VlZS8yLmJpbiAt
PiAuLi8uLi9jczQybDQ1X3ByaW1lcjIuYmluCisjICtMaW5rOiBzZGNhLzFmYS8xMDI4L2VlZS8z
LmJpbiAtPiAuLi8uLi9jczQybDQ1X3ByaW1lcjMuYmluCisjICtMaW5rOiBzZGNhLzFmYS8xMDI4
L2VlZS80LmJpbiAtPiAuLi8uLi9jczQybDQ1X3ByaW1lcjQuYmluCisjICtMaW5rOiBzZGNhLzFm
YS8xMDI4L2VlZS80MjQ1MDAwNS5iaW4gLT4gLi4vY3M0Mmw0NV92MjAyNjA5MTcuYmluCisjICtM
aW5rOiBzZGNhLzFmYS8xMDI4L2VlZi8xLmJpbiAtPiAuLi8uLi9jczQybDQ1X3ByaW1lcjEuYmlu
CisjICtMaW5rOiBzZGNhLzFmYS8xMDI4L2VlZi8yLmJpbiAtPiAuLi8uLi9jczQybDQ1X3ByaW1l
cjIuYmluCisjICtMaW5rOiBzZGNhLzFmYS8xMDI4L2VlZi8zLmJpbiAtPiAuLi8uLi9jczQybDQ1
X3ByaW1lcjMuYmluCisjICtMaW5rOiBzZGNhLzFmYS8xMDI4L2VlZi80LmJpbiAtPiAuLi8uLi9j
czQybDQ1X3ByaW1lcjQuYmluCisjICtMaW5rOiBzZGNhLzFmYS8xMDI4L2VlZi80MjQ1MDAwNS5i
aW4gLT4gLi4vY3M0Mmw0NV92MjAyNjA5MTcuYmluCisjICtMaW5rOiBzZGNhLzFmYS8xMDI4L2Yw
Ny8xLmJpbiAtPiAuLi8uLi9jczQybDQ1X3ByaW1lcjEuYmluCisjICtMaW5rOiBzZGNhLzFmYS8x
MDI4L2YwNy8yLmJpbiAtPiAuLi8uLi9jczQybDQ1X3ByaW1lcjIuYmluCisjICtMaW5rOiBzZGNh
LzFmYS8xMDI4L2YwNy8zLmJpbiAtPiAuLi8uLi9jczQybDQ1X3ByaW1lcjMuYmluCisjICtMaW5r
OiBzZGNhLzFmYS8xMDI4L2YwNy80LmJpbiAtPiAuLi8uLi9jczQybDQ1X3ByaW1lcjQuYmluCisj
ICtMaW5rOiBzZGNhLzFmYS8xMDI4L2YwNy80MjQ1MDAwNS5iaW4gLT4gLi4vY3M0Mmw0NV92MjAy
NjA5MTcuYmluCisjICtMaW5rOiBzZGNhLzFmYS8xMDI4L2YwOC8xLmJpbiAtPiAuLi8uLi9jczQy
bDQ1X3ByaW1lcjEuYmluCisjICtMaW5rOiBzZGNhLzFmYS8xMDI4L2YwOC8yLmJpbiAtPiAuLi8u
Li9jczQybDQ1X3ByaW1lcjIuYmluCisjICtMaW5rOiBzZGNhLzFmYS8xMDI4L2YwOC8zLmJpbiAt
PiAuLi8uLi9jczQybDQ1X3ByaW1lcjMuYmluCisjICtMaW5rOiBzZGNhLzFmYS8xMDI4L2YwOC80
LmJpbiAtPiAuLi8uLi9jczQybDQ1X3ByaW1lcjQuYmluCisjICtMaW5rOiBzZGNhLzFmYS8xMDI4
L2YwOC80MjQ1MDAwNS5iaW4gLT4gLi4vY3M0Mmw0NV92MjAyNjA5MTcuYmluCisjICsKKyMgK0Zp
bGU6IHNkY2EvMWZhLzEwMjgvY3M0Mmw0NV92MjAyNjA5MzAuYmluCisjICtMaW5rOiBzZGNhLzFm
YS8xMDI4L2VkYy8xLmJpbiAtPiAuLi8uLi9jczQybDQ1X3ByaW1lcjEuYmluCisjICtMaW5rOiBz
ZGNhLzFmYS8xMDI4L2VkYy8yLmJpbiAtPiAuLi8uLi9jczQybDQ1X3ByaW1lcjIuYmluCisjICtM
aW5rOiBzZGNhLzFmYS8xMDI4L2VkYy8zLmJpbiAtPiAuLi8uLi9jczQybDQ1X3ByaW1lcjMuYmlu
CisjICtMaW5rOiBzZGNhLzFmYS8xMDI4L2VkYy80LmJpbiAtPiAuLi8uLi9jczQybDQ1X3ByaW1l
cjQuYmluCisjICtMaW5rOiBzZGNhLzFmYS8xMDI4L2VkYy80MjQ1MDAwNS5iaW4gLT4gLi4vY3M0
Mmw0NV92MjAyNjA5MzAuYmluCisjICsKKyMgK0ZpbGU6IHNkY2EvMWZhLzEwMjgvY3M0Mmw0OV92
MjAyNjA5MjEuYmluCisjICtMaW5rOiBzZGNhLzFmYS8xMDI4L2YwMS8xLmJpbiAtPiAuLi8uLi9j
czQybDQ1X3ByaW1lcjEuYmluCisjICtMaW5rOiBzZGNhLzFmYS8xMDI4L2YwMS8yLmJpbiAtPiAu
Li8uLi9jczQybDQ1X3ByaW1lcjIuYmluCisjICtMaW5rOiBzZGNhLzFmYS8xMDI4L2YwMS8zLmJp
biAtPiAuLi8uLi9jczQybDQ1X3ByaW1lcjMuYmluCisjICtMaW5rOiBzZGNhLzFmYS8xMDI4L2Yw
MS80LmJpbiAtPiAuLi8uLi9jczQybDQ1X3ByaW1lcjQuYmluCisjICtMaW5rOiBzZGNhLzFmYS8x
MDI4L2YwMS80MjQ1MDAwNS5iaW4gLT4gLi4vY3M0Mmw0OV92MjAyNjA5MjEuYmluCisjICtMaW5r
OiBzZGNhLzFmYS8xMDI4L2YwNC8xLmJpbiAtPiAuLi8uLi9jczQybDQ1X3ByaW1lcjEuYmluCisj
ICtMaW5rOiBzZGNhLzFmYS8xMDI4L2YwNC8yLmJpbiAtPiAuLi8uLi9jczQybDQ1X3ByaW1lcjIu
YmluCisjICtMaW5rOiBzZGNhLzFmYS8xMDI4L2YwNC8zLmJpbiAtPiAuLi8uLi9jczQybDQ1X3By
aW1lcjMuYmluCisjICtMaW5rOiBzZGNhLzFmYS8xMDI4L2YwNC80LmJpbiAtPiAuLi8uLi9jczQy
bDQ1X3ByaW1lcjQuYmluCisjICtMaW5rOiBzZGNhLzFmYS8xMDI4L2YwNC80MjQ1MDAwNS5iaW4g
LT4gLi4vY3M0Mmw0OV92MjAyNjA5MjEuYmluCisjICsKKyMgIEZpbGU6IHNkY2EvMWZhLzE3YWEv
Y3M0Mmw0NV92MjAyNjA1MjIuYmluCisjICBMaW5rOiBzZGNhLzFmYS8xN2FhLzIzNTIvMS5iaW4g
LT4gLi4vLi4vY3M0Mmw0NV9wcmltZXIxLmJpbgorIyAgTGluazogc2RjYS8xZmEvMTdhYS8yMzUy
LzIuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVyMi5iaW4KKyMgQEAgLTk3MzMsNiArMTAzNDQs
NyBAQAorIyAgTGluazogc2RjYS8xZmEvMTQ0ZC9jYTBhLzQyNDUwMDA1LmJpbiAtPiAuLi9jczQy
bDQ1X3YyMDI2MDgyMC5iaW4KKyMgIAorIyAgTGljZW5zZTogUmVkaXN0cmlidXRhYmxlLiBTZWUg
TElDRU5TRS5jaXJydXMgZm9yIGRldGFpbHMuCisjICtTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
TGljZW5zZVJlZi1MSUNFTlNFLmNpcnJ1cworIyAgCisjICBVc2Ugb2YgQ2lycnVzIExvZ2ljIGRy
aXZlcnMsIGZpcm13YXJlIGFuZCBvdGhlciBtYXRlcmlhbHMgaXMgcGVybWl0dGVkCisjICBvbmx5
IGluIGNvbm5lY3Rpb24gd2l0aCBDaXJydXMgTG9naWMgaGFyZHdhcmUgcHJvZHVjdHMuCisjIEBA
IC05NzY2LDYgKzEwMzc4LDcgQEAKKyMgIFZlcnNpb246IHYyLjgKKyMgIAorIyAgTGljZW5jZTog
UmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5tZWRpYXRlayBmb3IgZGV0YWlscy4KKyMgK1NQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOQ0UubWVkaWF0ZWsKKyMgIAor
IyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgIAorIyBAQCAtOTc3NCw2ICsxMDM4Nyw3IEBACisjICBW
ZXJzaW9uOiA0NC4wMC4wMgorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBM
SUNFTlNFLm54cCBmb3IgZGV0YWlscworIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vu
c2VSZWYtTElDRU5TRS5ueHAKKyMgIE9yaWdpbmF0ZXMgZnJvbSBodHRwczovL2dpdGh1Yi5jb20v
TlhQL3V3Yi1OWFBVV0ItRlcuZ2l0CisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisjIEBAIC05
NzgzLDYgKzEwMzk3LDcgQEAKKyMgIFZlcnNpb246IDE4Ljk5LjMucDI2LjcKKyMgIAorIyAgTGlj
ZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5ueHAgZm9yIGRldGFpbHMKKyMgK1NQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOU0UubnhwCisjICAKKyMgIE9y
aWdpbmF0ZXMgZnJvbSBodHRwczovL2dpdGh1Yi5jb20vbnhwLWlteC9pbXgtZmlybXdhcmUvdHJl
ZS9sZi02LjEyLjM0XzIuMS4wCisjICAKKyMgQEAgLTk4MDUsNiArMTA0MjAsNyBAQAorIyAgVmVy
c2lvbjogMTguOTkuMS5wMTU0LjQwCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4g
U2VlIExJQ0VOU0UubnhwIGZvciBkZXRhaWxzCisjICtTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
TGljZW5zZVJlZi1MSUNFTlNFLm54cAorIyAgCisjICBPcmlnaW5hdGVzIGZyb20gaHR0cHM6Ly9n
aXRodWIuY29tL254cC1pbXgvaW14LWZpcm13YXJlL3RyZWUvbGYtNi4xLjIyXzIuMC4wL254cAor
IyAgCisjIEBAIC05ODI0LDYgKzEwNDQwLDcgQEAKKyMgIEluZm86IDB4ZTg2MworIyAgCisjICBM
aWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLmFtbG9naWMgZm9yIGRldGFpbHMK
KyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOU0UuYW1sb2dpYwor
IyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisjIEBAIC05ODM1LDYgKzEwNDUyLDcgQEAK
KyMgIFZlcnNpb246IDEuMS5PU0A2OTc2NzAyCisjICAKKyMgIExpY2Vuc2U6IFJlZGlzdHJpYnV0
YWJsZS4gU2VlIExJQ0VOU0UucG93ZXJ2ciBmb3IgZGV0YWlscworIyArU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5TRS5wb3dlcnZyCisjICAKKyMgIC0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCisjICAKKyMgQEAgLTk4OTMsNiArMTA1MTEsOCBAQAorIyAgSW5mbzogREFURT0wNS4w
Ni4yMDI2CisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UubGlu
YXJvIGZvciBkZXRhaWxzCisjICtTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogQlNELTMtQ2xhdXNl
CisjICsKKyMgIE9yaWdpbmF0ZXMgZnJvbSBodHRwczovL2dpdGh1Yi5jb20vbGludXgtbXNtL2F1
ZGlvcmVhY2gtdG9wb2xvZ3kuZ2l0CisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjIEBAIC05
OTE1LDYgKzEwNTM1LDcgQEAKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUg
TElDRU5DRS50aS10c3BhIGZvciBkZXRhaWxzLiBNYXJrZWQ6CisjICAJIENvcHlyaWdodCAoQykg
MjAyMyAtIDIwMjYgVGV4YXMgSW5zdHJ1bWVudHMKKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBMaWNlbnNlUmVmLUxJQ0VOQ0UudGktdHNwYQorIyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQor
IyAgCisjIEBAIC0xMDE0MCw2ICsxMDc2MSw3IEBACisjICBMaW5rOiBUWE5XMjc4MVJDQTQuYmlu
IC0+IHRpL2F1ZGlvL3RhczI3ODEvVElBUzI3ODFSQ0E0LmJpbgorIyAgCisjICBMaWNlbmNlOiBS
ZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLnRpLXRzcGEgZm9yIGRldGFpbHMuIE1hcmtlZDoK
KyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOQ0UudGktdHNwYQor
IyAgCSBDb3B5cmlnaHQgKEMpIDIwMjMgLSAyMDI2IFRleGFzIEluc3RydW1lbnRzCisjICAKKyMg
IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCisjIEBAIC0xMDU0Myw2ICsxMTE2NSw3IEBACisjICBMaW5rOiA5
MDI5LTMtMHg5LmJpbiAtPiB0aS9hdWRpby90YXMyNzgzLzkwMjktMy0weDkuYmluCisjICAKKyMg
IExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gTElDRU5DRS50aS10c3BhIGZvciBkZXRhaWxzLiBN
YXJrZWQ6CisjICtTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTGljZW5zZVJlZi1MSUNFTkNFLnRp
LXRzcGEKKyMgIAkgQ29weXJpZ2h0IChDKSAyMDI2IFRleGFzIEluc3RydW1lbnRzCisjICAKKyMg
IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCisjIEBAIC0xMDU1Niw2ICsxMTE3OSw3IEBACisjICBMaW5rOiBJ
TlQ4ODY2UkNBMi5iaW4gLT4gdGkvYXVkaW8vdGFzMjU2My9JTlQ4ODY2UkNBMi5iaW4KKyMgIAor
IyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBMSUNFTkNFLnRpLXRzcGEgZm9yIGRldGFpbHMu
IE1hcmtlZDoKKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOQ0Uu
dGktdHNwYQorIyAgCSBDb3B5cmlnaHQgKEMpIDIwMjMgLSAyMDI1IFRleGFzIEluc3RydW1lbnRz
CisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjIEBAIC0xMDU2NSw2ICsxMTE4OSw3IEBACisj
ICBWZXJzaW9uOiAxLjAuMgorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBM
SUNFTlNFLm1vbnRhZ2UgZm9yIGRldGFpbHMKKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBM
aWNlbnNlUmVmLUxJQ0VOU0UubW9udGFnZQorIyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAg
CisjIEBAIC0xMDU4MSwxNCArMTEyMDYsMTggQEAKKyMgIFZlcnNpb246IGFyY2gxMi44CisjICBG
aWxlOiBhcm0vbWFsaS9hcmNoMTMuOC9tYWxpX2NzZmZ3LmJpbgorIyAgVmVyc2lvbjogYXJjaDEz
LjgKKyMgK0ZpbGU6IGFybS9tYWxpL2FyY2gxNC44L21hbGlfY3NmZncuYmluCisjICtWZXJzaW9u
OiBhcmNoMTQuOAorIyAgCisjICBMaWNlbnNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNF
Lm1hbGlfY3NmZncgZm9yIGRldGFpbHMKKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNl
bnNlUmVmLUxJQ0VOQ0UubWFsaV9jc2ZmdworIyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAg
RHJpdmVyOiBpc3AgLSBJbWFnZSBTaWduYWwgUHJvY2Vzc29yIChJU1ApIGRldmljZQorIyAgRmls
ZTogYW1kZ3B1L2lzcF80XzFfMS5iaW4KKyMgIAorIyAgTGljZW5zZTogUmVkaXN0cmlidXRhYmxl
LiBTZWUgTElDRU5TRS5hbWRpc3AgZm9yIGRldGFpbHMKKyMgK1NQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiBMaWNlbnNlUmVmLUxJQ0VOU0UuYW1kaXNwCisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CisjICAKKyMgQEAgLTEwNTk2LDExICsxMTIyNSwxNSBAQAorIyAgRmlsZTogcWNvbS9haWMxMDAv
ZncxLmJpbgorIyAgRmlsZTogcWNvbS9haWMxMDAvZncxMC5iaW4KKyMgIEZpbGU6IHFjb20vYWlj
MTAwL2Z3Mi5iaW4KKyMgK1ZlcnNpb246IE5TUC5BSUMuMS4yMC4yLjAKKyMgIEZpbGU6IHFjb20v
YWljMTAwL2Z3NS5iaW4KKyMgIEZpbGU6IHFjb20vYWljMTAwL2Z3OS5iaW4KKyMgK1ZlcnNpb246
IE5TUC5BSUMuMS4yMC4yLjAKKyMgIEZpbGU6IHFjb20vYWljMTAwL3NibC5iaW4KKyMgK1ZlcnNp
b246IFNCTC5BSUMuMS4yMC4yLjEKKyMgIAorIyAgTGljZW5zZTogUmVkaXN0cmlidXRhYmxlLiBT
ZWUgTElDRU5TRS5xY29tIGFuZCBOT1RJQ0UucWNvbSBmb3IgZGV0YWlscworIyArU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5TRS5xY29tCisjICAKKyMgIC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCisjICAKKyMgQEAgLTEwNjExLDggKzExMjQ0LDEzIEBACisjICBWZXJzaW9uOiA1
LjguMS43Nzc4CisjICBGaWxlOiBpbnRlbC9pc2gvaXNoX3djbC5iaW4KKyMgIFZlcnNpb246IDUu
OC40Ljc3ODQKKyMgK0ZpbGU6IGludGVsL2lzaC9pc2hfbnZsaC5iaW4KKyMgK1ZlcnNpb246IDUu
OC4yLjc4MjIKKyMgK0ZpbGU6IGludGVsL2lzaC9pc2hfbnZscy5iaW4KKyMgK1ZlcnNpb246IDUu
OC4zLjc4MTkKKyMgIAorIyAgTGljZW5zZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5p
bnRlbCBmb3IgZGV0YWlscworIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYt
TElDRU5TRS5pbnRlbAorIyAgCisjICBGaWxlOiBMRU5PVk8vaXNoL2lzaF9sbmxtX2xlbm92b19Y
OS0xNF8yMDI1XzUuOC4zNi4wOTA5Mi5iaW4KKyMgIExpbms6IGludGVsL2lzaC9pc2hfbG5sbV81
M2M0ZmZhZF9hNjcyYTIzNS5iaW4gLT4gLi4vLi4vTEVOT1ZPL2lzaC9pc2hfbG5sbV9sZW5vdm9f
WDktMTRfMjAyNV81LjguMzYuMDkwOTIuYmluCisjIEBAIC0xMDYzOSw2ICsxMTI3Nyw3IEBACisj
ICBWZXJzaW9uOiA1LjguNC43NzIwCisjICAKKyMgIExpY2Vuc2U6IFJlZGlzdHJpYnV0YWJsZS4g
U2VlIExJQ0VOQ0UubGVub3ZvIGZvciBkZXRhaWxzCisjICtTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogTGljZW5zZVJlZi1MSUNFTkNFLmxlbm92bworIyAgCisjICBGaWxlOiBIUC9pc2gvaXNoX2xu
bG1fMTIxMjg2MDZfZjk3NTFiNzEuYmluCisjICBMaW5rOiBpbnRlbC9pc2gvaXNoX2xubG1fMTIx
Mjg2MDZfZjk3NTFiNzEuYmluIC0+IC4uLy4uL0hQL2lzaC9pc2hfbG5sbV8xMjEyODYwNl9mOTc1
MWI3MS5iaW4KKyMgQEAgLTEwNjQ4LDYgKzExMjg3LDcgQEAKKyMgIFZlcnNpb246IDUuOC4xLjc3
NzkKKyMgIAorIyAgTGljZW5zZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5IUCBmb3Ig
ZGV0YWlscworIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5DRS5I
UAorIyAgCisjICBGaWxlOiBkZWxsL2lzaC9pc2hfbG5sbV8zOWNlZWFmOF81OC43NzI3LjAuYmlu
CisjICBMaW5rOiBpbnRlbC9pc2gvaXNoX2xubG1fMzljZWVhZjguYmluIC0+IC4uLy4uL2RlbGwv
aXNoL2lzaF9sbmxtXzM5Y2VlYWY4XzU4Ljc3MjcuMC5iaW4KKyMgQEAgLTEwNjU3LDIwICsxMTI5
NywyNCBAQAorIyAgTGluazogaW50ZWwvaXNoL2lzaF9wdGxfMzljZWVhZjguYmluIC0+IC4uLy4u
L2RlbGwvaXNoL2lzaF9wdGxfMzljZWVhZjhfNTgxLjc3ODMuMC5iaW4KKyMgIAorIyAgTGljZW5z
ZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5kZWxsIGZvciBkZXRhaWxzCisjICtTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogTGljZW5zZVJlZi1MSUNFTlNFLmRlbGwKKyMgIAorIyAgLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KKyMgIAorIyAgRHJpdmVyOiBxZHUxMDAgLSBRdWFsY29tbSBEVSBmaXJt
d2FyZSBpbWFnZSBmaWxlcworIyAgRmlsZTogcWNvbS9xZHUxMDAveGJsX3MubWVsZgorIyArVmVy
c2lvbjogQk9PVC5NWEYuMi4zLjMtMDAwNDQuMS1MQVNTRU4tMQorIyAgRmlsZTogcWNvbS9xZHUx
MDAvYWJsX3VzZXJkZWJ1Zy5lbGYKKyMgIEZpbGU6IHFjb20vcWR1MTAwL2FvcF9kZXZjZmcubWJu
CisjICBGaWxlOiBxY29tL3FkdTEwMC9hb3AubWJuCisjICtWZXJzaW9uOiBBT1AuQ1NNLjEuMC0w
MDEwNS1MQVNTRU5fRS0yCisjICBGaWxlOiBxY29tL3FkdTEwMC9jcHVjcC5lbGYKKyMgIEZpbGU6
IHFjb20vcWR1MTAwL2VmczEuYmluCisjICBGaWxlOiBxY29tL3FkdTEwMC9lZnMyLmJpbgorIyAg
RmlsZTogcWNvbS9xZHUxMDAvZWZzMy5iaW4KKyMgIEZpbGU6IHFjb20vcWR1MTAwL2Z3X2NzbV9n
c2lfMy4wLmVsZgorIyAgRmlsZTogcWNvbS9xZHUxMDAvaHlwdm0ubWJuCisjICtWZXJzaW9uOiBU
Wi5YRi41LjI2LTAwMDQzLUxBU1NFTkFBQUFBTkFaVC00CisjICBGaWxlOiBxY29tL3FkdTEwMC9t
ZG1kZHIubWJuCisjICBGaWxlOiBxY29tL3FkdTEwMC9tdWx0aV9pbWFnZS5tYm4KKyMgIEZpbGU6
IHFjb20vcWR1MTAwL211bHRpX2ltYWdlX3F0aS5tYm4KKyMgQEAgLTEwNjc4LDEzICsxMTMyMiwx
NyBAQAorIyAgRmlsZTogcWNvbS9xZHUxMDAvcXVwdjNmdy5lbGYKKyMgIEZpbGU6IHFjb20vcWR1
MTAwL3Nocm0uZWxmCisjICBGaWxlOiBxY29tL3FkdTEwMC90ei5tYm4KKyMgK1ZlcnNpb246IFRa
LlhGLjUuMjYtMDAwNDMtTEFTU0VOQUFBQUFOQVpULTQKKyMgIEZpbGU6IHFjb20vcWR1MTAwL3Vl
ZmkuZWxmCisjICtWZXJzaW9uOiBCT09ULk1YRi4yLjMuMy0wMDA0NC4xLUxBU1NFTi0xCisjICBG
aWxlOiBxY29tL3FkdTEwMC94YmxfY29uZmlnLmVsZgorIyAgRmlsZTogcWNvbS9xZHUxMDAveGJs
X3JhbWR1bXAuZWxmCisjICtWZXJzaW9uOiBCT09ULk1YRi4yLjMuMy0wMDA0NC4xLUxBU1NFTi0x
CisjICBGaWxlOiBxY29tL3FkdTEwMC96ZXJvc18xc2VjdG9yLmJpbgorIyAgRmlsZTogcWNvbS9x
ZHUxMDAvcWRzcDZzdy5tYm4ueHoKKyMgIAorIyAgTGljZW5zZTogUmVkaXN0cmlidXRhYmxlLiBT
ZWUgTElDRU5TRS5xY29tIGFuZCBOT1RJQ0UucWNvbSBmb3IgZGV0YWlscworIyArU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5TRS5xY29tCisjICAKKyMgIC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCisjICAKKyMgQEAgLTEwNzAzLDYgKzExMzUxLDcgQEAKKyMgIExpbms6IGludGVs
L3ZwdS92cHVfNTB4eF92MC4wLmJpbiAtPiB2cHVfNTB4eF92MS5iaW4KKyMgIAorIyAgTGljZW5z
ZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5pbnRlbF92cHUgZm9yIGRldGFpbHMKKyMg
K1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOU0UuaW50ZWxfdnB1Cisj
ICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAKKyMgQEAgLTEwNzEwLDYgKzExMzU5LDcgQEAK
KyMgIEZpbGU6IGJtaTI2MC1pbml0LWRhdGEuZncKKyMgIAorIyAgTGljZW5zZTogUmVkaXN0cmli
dXRhYmxlLiBTZWUgTElDRU5TRS5ibWkyNjAgZm9yIGRldGFpbHMKKyMgK1NQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBCU0QtMy1DbGF1c2UKKyMgIAorIyAgT3JpZ2luYXRlcyBmcm9tIGh0dHBzOi8v
c291cmNlLmNocm9taXVtLm9yZy9jaHJvbWl1bW9zL2Nocm9taXVtb3MvY29kZXNlYXJjaC8rL21h
aW46c3JjL3BsYXRmb3JtL2VjL3RoaXJkX3BhcnR5L2JtaTI2MC9hY2NlbGd5cm9fYm1pMjYwX2Nv
bmZpZ190YmluLmgKKyMgIAorIyBAQCAtMTA3MjYsMTggKzExMzc2LDIzIEBACisjICBGaWxlOiBx
Y29tL3NoaWtyYS9xdXB2M2Z3LmVsZgorIyAgCisjICBMaWNlbnNlOiBSZWRpc3RyaWJ1dGFibGUu
IFNlZSBMSUNFTlNFLnFjb20gYW5kIE5PVElDRS5xY29tIGZvciBkZXRhaWxzCisjICtTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogTGljZW5zZVJlZi1MSUNFTlNFLnFjb20KKyMgIC0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQorIyAgCisjICBEcml2ZXI6IHNkeDYxIC0gUXVhbGNvbW0gU0RYNjEgZmlybXdhcmUg
aW1hZ2UgZmlsZSBmb3IgRm94Y29ubiB2ZW5kb3IKKyMgIEZpbGU6IHFjb20vc2R4NjEvZm94Y29u
bi9wcm9nX2ZpcmVob3NlX2xpdGUuZWxmCisjICtWZXJzaW9uOiBCT09ULk1YRi4xLjEuMS0wMDI3
Ny1PbHltcGljLTEKKyMgIAorIyAgTGljZW5zZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5T
RS5xY29tIGFuZCBOT1RJQ0UucWNvbSBmb3IgZGV0YWlscworIyArU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5TRS5xY29tCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMg
IAorIyAgRHJpdmVyOiBzZHgzNSAtIFF1YWxjb21tIFNEWDM1IGZpcm13YXJlIGltYWdlIGZpbGUg
Zm9yIEZveGNvbm4gdmVuZG9yCisjICBGaWxlOiBxY29tL3NkeDM1L2ZveGNvbm4veGJsX3NfZGV2
cHJnX25zLm1lbGYKKyMgK1ZlcnNpb246IEJPT1QuTVhGLjIuMy0wMDQzMC1LVU5PX0UtMQorIyAg
CisjICBMaWNlbnNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLnFjb20gYW5kIE5PVElD
RS5xY29tIGZvciBkZXRhaWxzCisjICtTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTGljZW5zZVJl
Zi1MSUNFTlNFLnFjb20KKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAKKyMgIERyaXZlcjogcGNp
ZS1yY2FyLWdlbjQgLSBSZW5lc2FzIFItQ2FyIEdlbjQgUENJZSBjb250cm9sbGVyCisjIEBAIC0x
MDc0NSw2ICsxMTQwMCw3IEBACisjICBGaWxlOiByY2FyX2dlbjRfcGNpZS5iaW4KKyMgIAorIyAg
TGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5yOGE3NzlnX3BjaWVfcGh5IGZv
ciBkZXRhaWxzLgorIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5D
RS5yOGE3NzlnX3BjaWVfcGh5CisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisjICBEcml2ZXI6
IFBDTTYyNDAgLSBUZXhhcyBJbnN0cnVtZW50cyBQQ002MjQwIEZhbWlseSBBdWRpbyBBREMvREFD
IERldmljZQorIyBAQCAtMTA3NTQsNiArMTE0MTAsNyBAQAorIyAgVmVyc2lvbjogMS4wCisjICAK
KyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UudGktdHNwYSBmb3IgZGV0
YWlscy4KKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOQ0UudGkt
dHNwYQorIyAgCisjICBJbmZvOgorIyAgRmlybXdhcmUgZmlsZSBnZW5lcmF0ZWQgdmlhIGh0dHBz
Oi8vZ2l0LnRpLmNvbS9jZ2l0L2xwYWEtYW5kcm9pZC1kcml2ZXJzL3Rhc2RldmljZS1saW51eC1k
cml2ZXIvdHJlZS9qc29uL3Rvb2wvTm9uX0ludGVncmF0ZWRfQmluX1Rvb2xfdjEuNC4xIGFuZCBi
cmFuY2gtbWFzdGVyLgorIyBAQCAtMTA3NzEsMyArMTE0MjgsMjggQEAKKyMgIFZlcnNpb246IDU2
CisjICAKKyMgIExpY2Vuc2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UubW9yc2VtaWNy
byBmb3IgZGV0YWlscy4KKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJ
Q0VOQ0UubW9yc2VtaWNybworIyArCisjICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyArCisjICtEcml2
ZXI6IGJ0YWljIC0gQUlDODgwMEQ4MCBCbHVldG9vdGggc3VwcG9ydAorIyArCisjICtGaWxlOiBh
aWMvYWljODgwMGQ4MC9md19hZGlkXzg4MDBkODBfdTAyLmJpbgorIyArVmVyc2lvbjogdjYuOS4x
LjEKKyMgK0ZpbGU6IGFpYy9haWM4ODAwZDgwL2Z3X3BhdGNoXzg4MDBkODBfdTAyLmJpbgorIyAr
VmVyc2lvbjogdjYuOS4xLjEKKyMgK0ZpbGU6IGFpYy9haWM4ODAwZDgwL2Z3X3BhdGNoX3RhYmxl
Xzg4MDBkODBfdTAyLmJpbgorIyArVmVyc2lvbjogdjYuOS4xLjEKKyMgKworIyArTGljZW5jZTog
UmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5haWMgZm9yIGRldGFpbHMuCisjICtTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogTGljZW5zZVJlZi1MSUNFTlNFLmFpYworIyArCisjICstLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQorIyArCisjICtEcml2ZXI6IGFpYyAtIEFJQzg4MDBEODAgVTAyIFNESU8gV2kt
Rmkgc3VwcG9ydAorIyArCisjICtGaWxlOiBhaWMvYWljODgwMGQ4MC9mbWFjZndfODgwMGQ4MF91
MDIuYmluCisjICtWZXJzaW9uOiB2Ni45LjEuMQorIyArCisjICtMaWNlbmNlOiBSZWRpc3RyaWJ1
dGFibGUuIFNlZSBMSUNFTlNFLmFpYyBmb3IgZGV0YWlscy4KKyMgK1NQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOU0UuYWljCisjIAorIworCiBTVU1NQVJZID0gIkZpcm13
YXJlIGZpbGVzIGZvciB1c2Ugd2l0aCBMaW51eCBrZXJuZWwiCiBIT01FUEFHRSA9ICJodHRwczov
L3d3dy5rZXJuZWwub3JnLyIKIERFU0NSSVBUSU9OID0gIkxpbnV4IGZpcm13YXJlIGlzIGEgcGFj
a2FnZSBkaXN0cmlidXRlZCBhbG9uZ3NpZGUgdGhlIExpbnV4IGtlcm5lbCBcCkBAIC0yNzMsNyAr
MzQ5Nyw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0VTL0xJQ0VOQ0UuQWJp
bGlzO21kNT1iNWVlM2Y0MTA3ODBlNTY3MTFhZDQ4ZWFkCiAgICAgICAgICAgICAgICAgICAgIGZp
bGU6Ly9MSUNFTlNFUy9MSUNFTkNFLnhjNTAwMGM7bWQ1PTEyYjAyZWZhMzA0OWRiNjVkNTI0YWVi
NDE4ZGQ4N2NhIFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOU0VTL0xJQ0VOU0Uu
eGU7bWQ1PWM2NzRkMzg3NzQyNDJiYzBjNTI4MjE0NzIxNDg4MTE4IFwKICAgICAgICAgICAgICAg
ICAgICAgZmlsZTovL0xJQ0VOU0VTL0xJQ0VOQ0Uud2YyMDA7bWQ1PTRkMWJlZmYwMGQ5MDJjMDVj
OWM3ZTk1YTVkOGViNTJkIFwKLSAgICAgICAgICAgICAgICAgICAgZmlsZTovL1dIRU5DRTttZDU9
JHtXSEVOQ0VfQ0hLU1VNfSBcCisgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9XSEVOQ0U7bWQ1
PWQxYjg5MmJjMTNmMmJjNTE0OGNlMjdjNzMyZWM4MzM5IFwKICAgICAgICAgICAgICAgICAgICAg
IgogIyBXSEVOQ0UgY2hlY2tzdW0gaXMgZGVmaW5lZCBzZXBhcmF0ZWx5IHRvIGVhc2Ugb3ZlcnJp
ZGluZyBpdCBpZgogIyBjbGFzcy1kZXZ1cHN0cmVhbSBpcyBzZWxlY3RlZC4KQEAgLTQwNywxNyAr
MzYzMSwxNCBAQCBOT19HRU5FUklDX0xJQ0VOU0VbRmlybXdhcmUtV0hFTkNFXSA9ICJXSEVOQ0Ui
CiAKIFBFID0gIjEiCiAKLVNSQ19VUkkgPSAiXAotICAke0tFUk5FTE9SR19NSVJST1J9L2xpbnV4
L2tlcm5lbC9maXJtd2FyZS8ke0JQTn0tJHtQVn0udGFyLnh6IFwKLSAgZmlsZTovLzAwMDEtcWNv
bS1zaGlrcmEtbGluay1XaUZpLWZpcm13YXJlLWZyb20tdGhlLWF0aDEway1zdWJkaS5wYXRjaCBc
Ci0iCitTUkNfVVJJID0gIiR7S0VSTkVMT1JHX01JUlJPUn0vbGludXgva2VybmVsL2Zpcm13YXJl
LyR7QlBOfS0ke1BWfS50YXIueHoiCiAKIEJCQ0xBU1NFWFRFTkQgPSAiZGV2dXBzdHJlYW06dGFy
Z2V0IgogU1JDX1VSSTpjbGFzcy1kZXZ1cHN0cmVhbSA9ICJnaXQ6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvZmlybXdhcmUvbGludXgtZmlybXdhcmUuZ2l0O3Byb3Rv
Y29sPWh0dHBzO2JyYW5jaD1tYWluIgogIyBQaW4gdGhpcyB0byB0aGUgMjAyMjA1MDkgcmVsZWFz
ZSwgb3ZlcnJpZGUgdGhpcyBpbiBsb2NhbC5jb25mCiBTUkNSRVY6Y2xhc3MtZGV2dXBzdHJlYW0g
Pz0gImIxOWNiZGNhNzhhYjJhZGZkMjEwYzkxYmUxNWEyMjU2OGU4YjhjYWUiCiAKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICJmODBkY2I3NTdhNjIzZGVkYTYyMjAwYzA4ZTBlMWE4OGM3NmZiNmI1NDk2
NGYzMWIzNWZhNzRkYTFjOTBjY2M1IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImExMGQxYWI1YmFm
MmM3NGJhOTJlOGM3Y2YzMTNlNjkxNjk2YzI2YmRkZmE2ZGYwMGRiNzk1ZTQ4ZDcwY2Q0Y2EiCiAK
IGluaGVyaXQgYWxsYXJjaAogCi0tIAoyLjQ3LjEKCg==

--===============1555530698266862855==--
