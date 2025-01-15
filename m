Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FBE1C021B2
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 10:26:31 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.17804.1736936774252292817
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 02:26:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=OqOt1S5H;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=l1/2Uvc5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010194697ff43c-4662da0f-8e05-47dc-8297-d6db1e9862a0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1736936780;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XdVwQ6wd+yaDmdfnnCyUh854WVevh2f3AzlOxdSvKU8=;
	b=OqOt1S5H/B37iOkPh18okWAMH8lE5teG8syI4Qhn3rFn+zciwKJJxpftRs8DTP+7
	8LGfR5RAFmrs0UjYXzsBkIXNf39A/NHylUfftrd7tG83y9EGbRbcqJdvDeRWTK52HY7
	Whutfda8G8dqE0Z50RiQwfC/nqA5arQ5GnPnf8lg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1736936780;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XdVwQ6wd+yaDmdfnnCyUh854WVevh2f3AzlOxdSvKU8=;
	b=l1/2Uvc5iTM4pElcYLqFgebfYxqnYHrEV/L4045oebkoSrZoQNEj/U8FoGnsTSx6
	bT7iPJKQGNNtsa0z44yrswD69niZVCyMOuGSv+5gkzu1A9SCGVoH5d0j1AA+P2oUsfO
	QBzk4Hq1oC9CncdRZzMbqAXZ4H7pFcPpt0xgdI9o=
Content-Type: multipart/mixed; boundary="===============7952154022440164642=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] linux-firmware: upgrading to 20250109 FAILED
Message-ID: <01010194697ff43c-4662da0f-8e05-47dc-8297-d6db1e9862a0-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jan 2025 10:26:20 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 10:26:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209881

--===============7952154022440164642==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *linux-firmware* to *20250109* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-linux-firmware-upgrade-20241210-20250109.patch
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
From 908427b2891b1872682e1f646a0a573d03aef371 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jan 2025 09:53:51 +0000
Subject: [PATCH] linux-firmware: upgrade 20241210 -> 20250109

---
 ...20241210.bb => linux-firmware_20250109.bb} | 293 +++++++++++++++++-
 1 file changed, 291 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20241210.bb => linux-firmware_20250109.bb} (85%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20241210.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
similarity index 85%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20241210.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
index d3757b5bbc..7fd0d01eea 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20241210.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
@@ -1,3 +1,292 @@
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
+# @@ -648,8 +648,11 @@
+#  File: mrvl/sd8688_helper.bin
+#  Link: libertas/sd8688_helper.bin -> ../mrvl/sd8688_helper.bin
+#  
+# -Licence: Redistributable. See LICENCE.Marvell for details.  Extracted from
+# -Linux driver tarballs downloaded from Marvell's "Extranet" with permission.
+# +Licence: Redistributable. See LICENCE.Marvell for details.
+# +
+# +Info:
+# +Extracted from Linux driver tarballs downloaded from Marvell's
+# +"Extranet" with permission.
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -684,9 +687,11 @@
+#  File: mwl8k/fmimage_8764_ap-1.fw
+#  Version: 7.4.0.9
+#  
+# -Licence: Redistributable. See LICENCE.Marvell for details.  8687 images
+# -downloaded from Marvell's "Extranet" with permission.  8366 images contributed
+# -directly by Marvell.
+# +Licence: Redistributable. See LICENCE.Marvell for details.
+# +
+# +Info:
+# +8687 images downloaded from Marvell's "Extranet" with permission.
+# +8366 images contributed directly by Marvell.
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -1656,7 +1661,7 @@
+#  
+#  Licence: Redistributable. See LICENCE.ralink-firmware.txt for details
+#  
+# -rt3071.bin is a copy of bytes 4096-8191 of rt2870.bin for compatibility.
+# +Info: rt3071.bin is a copy of bytes 4096-8191 of rt2870.bin for compatibility.
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -3016,6 +3021,8 @@
+#  File: "brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt"
+#  Link: brcm/brcmfmac43455-sdio.raspberrypi,4-compute-module.txt -> brcmfmac43455-sdio.raspberrypi,4-model-b.txt
+#  Link: brcm/brcmfmac43455-sdio.raspberrypi,5-model-b.txt -> brcmfmac43455-sdio.raspberrypi,4-model-b.txt
+# +Link: brcm/brcmfmac43455-sdio.raspberrypi,500.txt -> brcmfmac43455-sdio.raspberrypi,4-model-b.txt
+# +Link: brcm/brcmfmac43455-sdio.raspberrypi,5-compute-module.txt -> brcmfmac43455-sdio.raspberrypi,4-model-b.txt
+#  Link: brcm/brcmfmac43455-sdio.Raspberry\ Pi\ Foundation-Raspberry\ Pi\ 4\ Model\ B.txt -> brcmfmac43455-sdio.raspberrypi,4-model-b.txt
+#  Link: brcm/brcmfmac43455-sdio.Raspberry\ Pi\ Foundation-Raspberry\ Pi\ Compute\ Module\ 4.txt -> brcmfmac43455-sdio.raspberrypi,4-model-b.txt
+#  File: "brcm/brcmfmac43455-sdio.MINIX-NEO Z83-4.txt"
+# @@ -3062,6 +3069,7 @@
+#  
+#  Licence: Redistributable. See LICENCE.wl1251 for details.
+#  
+# +Info:
+#  The published NVS files are for testing only.  Every device needs to
+#  have a unique NVS which is properly calibrated for best results.
+#  
+# @@ -3124,6 +3132,7 @@
+#  
+#  Licence: Redistributable. See LICENCE.ti-connectivity for details.
+#  
+# +Info:
+#  The NVS file includes two parts:
+#  	 - radio calibration
+#  	 - HW configuration parameters (aka. INI values)
+# @@ -3158,6 +3167,7 @@
+#  
+#  Licence: Redistributable. See LICENCE.ti-connectivity for details.
+#  
+# +Info:
+#  The driver expects to find the firmwares under a ti-connectivity
+#  subdirectory.  So if your system looks for firmwares in /lib/firmware,
+#  the firmwares for wl18xx chips must be located in
+# @@ -3199,6 +3209,7 @@
+#  
+#  Licence: Redistributable. See LICENCE.ti-connectivity for details.
+#  
+# +Info:
+#  	TIInit_7.2.31.bts version 7.2.31
+#  
+#  	In order to use that file copy it to /lib/firmware/ti-connectivity.
+# @@ -3374,6 +3385,7 @@
+#  
+#  Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
+#  
+# +Info:
+#      These firmware should be put under /lib/firmware/rtw88/
+#      And note that the rtw88 driver is able to support wake-on-wireless LAN
+#      for RTL8822C devices, after kernel v5.6+. So, make sure the firmware
+# @@ -3556,8 +3568,14 @@
+#  File: rtl_nic/rtl8125d-1.fw
+#  Version: 0.0.7
+#  
+# +File: rtl_nic/rtl8125d-2.fw
+# +Version: 0.0.4
+# +
+#  File: rtl_nic/rtl8126a-2.fw
+#  Version: 0.0.2
+# +
+# +File: rtl_nic/rtl8125bp-2.fw
+# +Version: 0.0.4
+#  
+#  File: rtl_nic/rtl8126a-3.fw
+#  Version: 0.0.5
+# @@ -4016,7 +4034,7 @@
+#  
+#  Licence: Redistributable. See LICENCE.ca0132 for details
+#  
+# -Found also in alsa-firmware package.
+# +Info: Found also in alsa-firmware package.
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -4194,7 +4212,7 @@
+#  Link: rtl_bt/rtl8723bs_config-OBDA8723.bin -> rtl8723bs_config.bin
+#  Link: rtl_bt/rtl8723bs_config-OBDA0623.bin -> rtl8723bs_config.bin
+#  File: rtl_bt/rtl8723cs_xx_fw.bin
+# -Link: rtl_bt/rtl8723cs_xx_config.bin -> rtl8723bs_config.bin
+# +File: rtl_bt/rtl8723cs_xx_config.bin
+#  File: rtl_bt/rtl8761a_fw.bin
+#  File: rtl_bt/rtl8761b_fw.bin
+#  File: rtl_bt/rtl8761b_config.bin
+# @@ -4231,6 +4249,7 @@
+#  
+#  Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
+#  
+# +Info:
+#  Found in vendor driver, linux_bt_usb_2.11.20140423_8723be.rar
+#  From https://github.com/troy-tan/driver_store
+#  Files rtl_bt/rtl8822b_* came directly from Realtek. These files are
+# @@ -6208,9 +6227,8 @@
+#  
+#  File: qcom/venus-5.4/venus.mbn
+#  Link: qcom/venus-5.4/venus.mdt -> venus.mbn
+# -File: qcom/venus-5.4/venus_s6.mbn
+# -
+# -Version: VIDEO.VE.5.4-00058-PROD-4
+# +
+# +Version: VIDEO.VE.5.4-00059-PROD-1
+#  
+#  File: qcom/venus-6.0/venus.mbn
+#  
+# @@ -6309,6 +6327,7 @@
+#  
+#  Licence: Redistributable, BSD-3-Clause licence, See LICENSE.qcom_yamato for details
+#  
+# +Info:
+#  Binary files generated from header files in EfikaMX kernel sources. A prefix of
+#  four zero bytes was prepended to make them work with the DRM MSM driver. See
+#  https://github.com/genesi/linux-legacy/tree/master/drivers/mxc/amd-gpu
+# @@ -6395,6 +6414,7 @@
+#  
+#  Licence: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
+#  
+# +Info:
+#  Binary files supplied originally from
+#  http://releases.linaro.org/96boards/dragonboard410c/qualcomm/firmware/linux-board-support-package-r1036.1.zip
+#  http://releases.linaro.org/96boards/dragonboard845c/qualcomm/firmware/RB3_firmware_20221121000000-v5.zip
+# @@ -6419,6 +6439,7 @@
+#  
+#  Licence: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
+#  
+# +Info:
+#  Binary files supplied originally from
+#  http://releases.linaro.org/96boards/dragonboard845c/qualcomm/firmware/RB3_firmware_20221121000000-v5.zip
+#  
+# @@ -6654,6 +6675,7 @@
+#  
+#  Licence: Redistributable. See wfx/LICENCE.wf200 for details.
+#  
+# +Info:
+#  The firmware itself originates from https://github.com/SiliconLabs/wfx-firmware
+#  
+#  The *.pds files come from https://github.com/SiliconLabs/wfx-pds
+# @@ -7428,6 +7450,8 @@
+#  Link: cirrus/cs35l41-dsp1-spk-prot-103c8cdf-spkid1-r0.bin -> cs35l41-dsp1-spk-prot-103c8cdf-spkid1-l0.bin
+#  Link: cirrus/cs35l41-dsp1-spk-prot-103c8ce0-spkid1-l0.bin -> cs35l41-dsp1-spk-prot-103c8cdf-spkid1-l0.bin
+#  Link: cirrus/cs35l41-dsp1-spk-prot-103c8ce0-spkid1-r0.bin -> cs35l41-dsp1-spk-prot-103c8cdf-spkid1-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-1f660105.wmfw -> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
+# +File: cirrus/cs35l41-dsp1-spk-prot-1f660105.bin
+#  
+#  License: Redistributable. See LICENSE.cirrus for details.
+#  
+# @@ -7447,17 +7471,9 @@
+#  File: cirrus/cs35l56/CS35L56_Rev3.11.18.wmfw
+#  File: cirrus/cs35l56/CS35L56_Rev3.11.20.wmfw
+#  File: cirrus/cs35l56/CS35L56_Rev3.11.25.wmfw
+# +File: cirrus/cs35l56/CS35L56_Rev3.11.26.wmfw
+#  File: cirrus/cs35l56/CS35L56_Rev3.11.27.wmfw
+# -Link: cirrus/cs35l54-b0-dsp1-misc-103c8d01.wmfw -> cs35l56/CS35L56_Rev3.11.18.wmfw
+# -File: cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp1.bin
+# -File: cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp2.bin
+# -File: cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp3.bin
+# -File: cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp4.bin
+# -Link: cirrus/cs35l54-b0-dsp1-misc-103c8d08.wmfw -> cs35l56/CS35L56_Rev3.11.18.wmfw
+# -Link: cirrus/cs35l54-b0-dsp1-misc-103c8d08-amp1.bin -> cs35l54-b0-dsp1-misc-103c8d01-amp1.bin
+# -Link: cirrus/cs35l54-b0-dsp1-misc-103c8d08-amp2.bin -> cs35l54-b0-dsp1-misc-103c8d01-amp2.bin
+# -Link: cirrus/cs35l54-b0-dsp1-misc-103c8d08-amp3.bin -> cs35l54-b0-dsp1-misc-103c8d01-amp3.bin
+# -Link: cirrus/cs35l54-b0-dsp1-misc-103c8d08-amp4.bin -> cs35l54-b0-dsp1-misc-103c8d01-amp4.bin
+# +File: cirrus/cs35l56/CS35L56_Rev3.11.28.wmfw
+#  Link: cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid0.wmfw -> cs35l56/CS35L56_Rev3.11.11.wmfw
+#  File: cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid0-amp1.bin
+#  File: cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid0-amp2.bin
+# @@ -7534,6 +7550,16 @@
+#  File: cirrus/cs35l56-b0-dsp1-misc-103c8c53-amp2.bin
+#  File: cirrus/cs35l56-b0-dsp1-misc-103c8c53-amp3.bin
+#  File: cirrus/cs35l56-b0-dsp1-misc-103c8c53-amp4.bin
+# +Link: cirrus/cs35l54-b0-dsp1-misc-103c8d01.wmfw -> cs35l56/CS35L56_Rev3.11.18.wmfw
+# +File: cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp1.bin
+# +File: cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp2.bin
+# +File: cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp3.bin
+# +File: cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp4.bin
+# +Link: cirrus/cs35l54-b0-dsp1-misc-103c8d08.wmfw -> cs35l56/CS35L56_Rev3.11.18.wmfw
+# +Link: cirrus/cs35l54-b0-dsp1-misc-103c8d08-amp1.bin -> cs35l54-b0-dsp1-misc-103c8d01-amp1.bin
+# +Link: cirrus/cs35l54-b0-dsp1-misc-103c8d08-amp2.bin -> cs35l54-b0-dsp1-misc-103c8d01-amp2.bin
+# +Link: cirrus/cs35l54-b0-dsp1-misc-103c8d08-amp3.bin -> cs35l54-b0-dsp1-misc-103c8d01-amp3.bin
+# +Link: cirrus/cs35l54-b0-dsp1-misc-103c8d08-amp4.bin -> cs35l54-b0-dsp1-misc-103c8d01-amp4.bin
+#  Link: cirrus/cs35l54-b0-dsp1-misc-103c8d85.wmfw -> cs35l56/CS35L56_Rev3.11.11.1.wmfw
+#  File: cirrus/cs35l54-b0-dsp1-misc-103c8d85-amp1.bin
+#  File: cirrus/cs35l54-b0-dsp1-misc-103c8d85-amp2.bin
+# @@ -7598,6 +7624,9 @@
+#  Link: cirrus/cs35l56-b0-dsp1-misc-103c8e2c.wmfw -> cs35l56/CS35L56_Rev3.11.11.1.wmfw
+#  Link: cirrus/cs35l56-b0-dsp1-misc-103c8e2c-amp1.bin -> cs35l56-b0-dsp1-misc-103c8d90-amp1.bin
+#  Link: cirrus/cs35l56-b0-dsp1-misc-103c8e2c-amp2.bin -> cs35l56-b0-dsp1-misc-103c8d90-amp2.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-10431264.wmfw -> cs35l56/CS35L56_Rev3.11.16.wmfw
+# +Link: cirrus/cs35l56-b0-dsp1-misc-10431264-amp1.bin -> cs35l56-b0-dsp1-misc-10431df3-amp1.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-10431264-amp2.bin -> cs35l56-b0-dsp1-misc-10431df3-amp2.bin
+#  Link: cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid0.wmfw -> cs35l56/CS35L56_Rev3.11.16.wmfw
+#  File: cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid0-amp1.bin
+#  File: cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid0-amp2.bin
+# @@ -7620,11 +7649,6 @@
+#  File: cirrus/cs35l56-b0-dsp1-misc-10431e13-amp2.bin
+#  File: cirrus/cs35l56-b0-dsp1-misc-10431e13-amp4.bin
+#  File: cirrus/cs35l56-b0-dsp1-misc-10431e13-amp3.bin
+# -Link: cirrus/cs35l56-b0-dsp1-misc-10431f43.wmfw -> cs35l56/CS35L56_Rev3.11.16.wmfw
+# -File: cirrus/cs35l56-b0-dsp1-misc-10431f43-amp1.bin
+# -File: cirrus/cs35l56-b0-dsp1-misc-10431f43-amp2.bin
+# -File: cirrus/cs35l56-b0-dsp1-misc-10431f43-amp4.bin
+# -File: cirrus/cs35l56-b0-dsp1-misc-10431f43-amp3.bin
+#  Link: cirrus/cs35l56-b0-dsp1-misc-10431e63-spkid0.wmfw -> cs35l56/CS35L56_Rev3.11.16.wmfw
+#  File: cirrus/cs35l56-b0-dsp1-misc-10431e63-spkid0-amp1.bin
+#  File: cirrus/cs35l56-b0-dsp1-misc-10431e63-spkid0-amp2.bin
+# @@ -7637,12 +7661,35 @@
+#  Link: cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid1.wmfw -> cs35l56/CS35L56_Rev3.11.16.wmfw
+#  File: cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid1-amp1.bin
+#  File: cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid1-amp2.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-10431f43.wmfw -> cs35l56/CS35L56_Rev3.11.16.wmfw
+# +File: cirrus/cs35l56-b0-dsp1-misc-10431f43-amp1.bin
+# +File: cirrus/cs35l56-b0-dsp1-misc-10431f43-amp2.bin
+# +File: cirrus/cs35l56-b0-dsp1-misc-10431f43-amp4.bin
+# +File: cirrus/cs35l56-b0-dsp1-misc-10431f43-amp3.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-17aa233b-spkid0.wmfw -> cs35l56/CS35L56_Rev3.11.20.wmfw
+# +File: cirrus/cs35l56-b0-dsp1-misc-17aa233b-spkid0-ampl.bin
+# +File: cirrus/cs35l56-b0-dsp1-misc-17aa233b-spkid0-ampr.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-17aa233b-spkid1.wmfw -> cs35l56/CS35L56_Rev3.11.20.wmfw
+# +File: cirrus/cs35l56-b0-dsp1-misc-17aa233b-spkid1-ampl.bin
+# +File: cirrus/cs35l56-b0-dsp1-misc-17aa233b-spkid1-ampr.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-17aa233c.wmfw -> cs35l56/CS35L56_Rev3.11.28.wmfw
+# +File: cirrus/cs35l56-b0-dsp1-misc-17aa233c-amp1.bin
+# +File: cirrus/cs35l56-b0-dsp1-misc-17aa233c-amp2.bin
+#  Link: cirrus/cs35l56-b0-dsp1-misc-17aa380e-spkid0.wmfw -> cs35l56/CS35L56_Rev3.11.20.wmfw
+#  File: cirrus/cs35l56-b0-dsp1-misc-17aa380e-spkid0-ampl.bin
+#  File: cirrus/cs35l56-b0-dsp1-misc-17aa380e-spkid0-ampr.bin
+#  Link: cirrus/cs35l56-b0-dsp1-misc-17aa380e-spkid1.wmfw -> cs35l56/CS35L56_Rev3.11.20.wmfw
+#  File: cirrus/cs35l56-b0-dsp1-misc-17aa380e-spkid1-ampl.bin
+#  File: cirrus/cs35l56-b0-dsp1-misc-17aa380e-spkid1-ampr.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-17aa3832-spkid0.wmfw -> cs35l56/CS35L56_Rev3.11.26.wmfw
+# +File: cirrus/cs35l56-b0-dsp1-misc-17aa3832-spkid0-ampl.bin
+# +File: cirrus/cs35l56-b0-dsp1-misc-17aa3832-spkid0-ampr.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-17aa3832-spkid1.wmfw -> cs35l56/CS35L56_Rev3.11.26.wmfw
+# +File: cirrus/cs35l56-b0-dsp1-misc-17aa3832-spkid1-ampl.bin
+# +File: cirrus/cs35l56-b0-dsp1-misc-17aa3832-spkid1-ampr.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-17aa3905.wmfw -> cs35l56/CS35L56_Rev3.11.18.wmfw
+# +File: cirrus/cs35l56-b0-dsp1-misc-17aa3905-amp1.bin
+# +File: cirrus/cs35l56-b0-dsp1-misc-17aa3905-amp2.bin
+#  
+#  License: Redistributable. See LICENSE.cirrus for details.
+#  
+# 
+#
+
 SUMMARY = "Firmware files for use with Linux kernel"
 HOMEPAGE = "https://www.kernel.org/"
 DESCRIPTION = "Linux firmware is a package distributed alongside the Linux kernel \
@@ -154,7 +443,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
                     file://wfx/LICENCE.wf200;md5=4d1beff00d902c05c9c7e95a5d8eb52d \
-                    file://WHENCE;md5=${WHENCE_CHKSUM} \
+                    file://WHENCE;md5=c90a25ccbd027eb8d61b2943ab68447c \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
@@ -247,7 +536,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "2bb035708576d076f97d4196a1c22e0a4d33fbb0210d05428d0bf4f243e99af5"
+SRC_URI[sha256sum] = "a12cb38f4793394bf56c6702be29b6e4f09deca0714943bba98a492030651570"
 
 inherit allarch
 
-- 
2.44.1


--===============7952154022440164642==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1874 entries from dependency cache.
Parsing recipes...done.
Parsing of 919 .bb files complete (918 cached, 1 parsed). 1874 targets, 41 skipped, 0 masked, 0 errors.
Removing 1 recipes from the allarch sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:77f8d828d608663c60b92fa4ba2a2179ff706296"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 69 Local 57 Mirrors 0 Missed 12 Current 147 (82% match, 94% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 436 of 704 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb:do_recipe_qa)
NOTE: recipe linux-firmware-1_20250109-r0: task do_recipe_qa: Started
NOTE: recipe linux-firmware-1_20250109-r0: task do_recipe_qa: Succeeded
NOTE: Running task 685 of 704 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb:do_fetch)
NOTE: recipe linux-firmware-1_20250109-r0: task do_fetch: Started
NOTE: recipe linux-firmware-1_20250109-r0: task do_fetch: Succeeded
NOTE: Running task 686 of 704 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb:do_unpack)
NOTE: Running task 687 of 704 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb:do_prepare_recipe_sysroot)
NOTE: recipe linux-firmware-1_20250109-r0: task do_unpack: Started
NOTE: recipe linux-firmware-1_20250109-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-firmware-1_20250109-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe linux-firmware-1_20250109-r0: task do_unpack: Succeeded
NOTE: Running task 688 of 704 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb:do_patch)
NOTE: Running task 689 of 704 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb:do_collect_spdx_deps)
NOTE: recipe linux-firmware-1_20250109-r0: task do_patch: Started
NOTE: recipe linux-firmware-1_20250109-r0: task do_collect_spdx_deps: Started
NOTE: recipe linux-firmware-1_20250109-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe linux-firmware-1_20250109-r0: task do_patch: Succeeded
NOTE: Running task 690 of 704 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb:do_deploy_source_date_epoch)
NOTE: Running task 691 of 704 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb:do_populate_lic)
NOTE: recipe linux-firmware-1_20250109-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe linux-firmware-1_20250109-r0: task do_populate_lic: Started
NOTE: recipe linux-firmware-1_20250109-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe linux-firmware-1_20250109-r0: task do_populate_lic: Succeeded
NOTE: Running task 692 of 704 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb:do_configure)
NOTE: recipe linux-firmware-1_20250109-r0: task do_configure: Started
NOTE: recipe linux-firmware-1_20250109-r0: task do_configure: Succeeded
NOTE: Running task 693 of 704 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb:do_compile)
NOTE: recipe linux-firmware-1_20250109-r0: task do_compile: Started
NOTE: recipe linux-firmware-1_20250109-r0: task do_compile: Succeeded
NOTE: Running task 694 of 704 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb:do_install)
NOTE: recipe linux-firmware-1_20250109-r0: task do_install: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.68.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['gettext-minimal-native', 'libtool-native', 'quilt-native', 'texinfo-dummy-native', 'patch-native', 'pseudo-native', 'xz-native', 'attr-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_install
| NOTE: make -j 16 -l 75 DESTDIR=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20250109/image FIRMWAREDIR=/usr/lib/firmware install
| install -d /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20250109/image/usr/lib/firmware
| ./copy-firmware.sh -j16 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20250109/image/usr/lib/firmware
| ERROR: the GNU parallel command is required to use -j
| make: *** [Makefile:34: install] Error 1
| ERROR: oe_runmake failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20250109/temp/run.do_install.2748457:184 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20250109/temp/run.do_install.2748457, line 184
| 	#2: die, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20250109/temp/run.do_install.2748457, line 168
| 	#3: oe_runmake, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20250109/temp/run.do_install.2748457, line 163
| 	#4: do_install, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20250109/temp/run.do_install.2748457, line 146
| 	#5: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20250109/temp/run.do_install.2748457, line 197
NOTE: recipe linux-firmware-1_20250109-r0: task do_install: Failed
NOTE: Tasks Summary: Attempted 694 tasks of which 683 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250115095335.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250115095335.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb:do_install
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20250109/temp/log.do_install.2748457
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: linux-firmware-1_20250109-r0 do_install: oe_runmake failed
ERROR: linux-firmware-1_20250109-r0 do_install: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20250109/temp/run.do_install.2748457' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20250109/temp/log.do_install.2748457
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb:do_install) failed with exit code '1'

--===============7952154022440164642==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-linux-firmware-upgrade-20241210-20250109.patch"

RnJvbSA5MDg0MjdiMjg5MWIxODcyNjgyZTFmNjQ2YTBhNTczZDAzYWVmMzcxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgSmFuIDIwMjUgMDk6NTM6NTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aW51eC1maXJtd2FyZTogdXBncmFkZSAyMDI0MTIxMCAtPiAyMDI1MDEwOQoKLS0tCiAuLi4yMDI0
MTIxMC5iYiA9PiBsaW51eC1maXJtd2FyZV8yMDI1MDEwOS5iYn0gfCAyOTMgKysrKysrKysrKysr
KysrKystCiAxIGZpbGUgY2hhbmdlZCwgMjkxIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS97bGludXgtZmlybXdh
cmVfMjAyNDEyMTAuYmIgPT4gbGludXgtZmlybXdhcmVfMjAyNTAxMDkuYmJ9ICg4NSUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2Fy
ZV8yMDI0MTIxMC5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgt
ZmlybXdhcmVfMjAyNTAxMDkuYmIKc2ltaWxhcml0eSBpbmRleCA4NSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZV8yMDI0MTIxMC5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJt
d2FyZV8yMDI1MDEwOS5iYgppbmRleCBkMzc1N2I1YmJjLi43ZmQwZDAxZWVhIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlXzIwMjQx
MjEwLmJiCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgtZmly
bXdhcmVfMjAyNTAxMDkuYmIKQEAgLTEsMyArMSwyOTIgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklM
RVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4K
KyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRo
ZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlm
IG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3Nh
Z2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0
ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0t
LSBXSEVOQ0UKKyMgKysrIFdIRU5DRQorIyBAQCAtNjQ4LDggKzY0OCwxMSBAQAorIyAgRmlsZTog
bXJ2bC9zZDg2ODhfaGVscGVyLmJpbgorIyAgTGluazogbGliZXJ0YXMvc2Q4Njg4X2hlbHBlci5i
aW4gLT4gLi4vbXJ2bC9zZDg2ODhfaGVscGVyLmJpbgorIyAgCisjIC1MaWNlbmNlOiBSZWRpc3Ry
aWJ1dGFibGUuIFNlZSBMSUNFTkNFLk1hcnZlbGwgZm9yIGRldGFpbHMuICBFeHRyYWN0ZWQgZnJv
bQorIyAtTGludXggZHJpdmVyIHRhcmJhbGxzIGRvd25sb2FkZWQgZnJvbSBNYXJ2ZWxsJ3MgIkV4
dHJhbmV0IiB3aXRoIHBlcm1pc3Npb24uCisjICtMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNl
ZSBMSUNFTkNFLk1hcnZlbGwgZm9yIGRldGFpbHMuCisjICsKKyMgK0luZm86CisjICtFeHRyYWN0
ZWQgZnJvbSBMaW51eCBkcml2ZXIgdGFyYmFsbHMgZG93bmxvYWRlZCBmcm9tIE1hcnZlbGwncwor
IyArIkV4dHJhbmV0IiB3aXRoIHBlcm1pc3Npb24uCisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CisjICAKKyMgQEAgLTY4NCw5ICs2ODcsMTEgQEAKKyMgIEZpbGU6IG13bDhrL2ZtaW1hZ2VfODc2
NF9hcC0xLmZ3CisjICBWZXJzaW9uOiA3LjQuMC45CisjICAKKyMgLUxpY2VuY2U6IFJlZGlzdHJp
YnV0YWJsZS4gU2VlIExJQ0VOQ0UuTWFydmVsbCBmb3IgZGV0YWlscy4gIDg2ODcgaW1hZ2VzCisj
IC1kb3dubG9hZGVkIGZyb20gTWFydmVsbCdzICJFeHRyYW5ldCIgd2l0aCBwZXJtaXNzaW9uLiAg
ODM2NiBpbWFnZXMgY29udHJpYnV0ZWQKKyMgLWRpcmVjdGx5IGJ5IE1hcnZlbGwuCisjICtMaWNl
bmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLk1hcnZlbGwgZm9yIGRldGFpbHMuCisj
ICsKKyMgK0luZm86CisjICs4Njg3IGltYWdlcyBkb3dubG9hZGVkIGZyb20gTWFydmVsbCdzICJF
eHRyYW5ldCIgd2l0aCBwZXJtaXNzaW9uLgorIyArODM2NiBpbWFnZXMgY29udHJpYnV0ZWQgZGly
ZWN0bHkgYnkgTWFydmVsbC4KKyMgIAorIyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgIAorIyBAQCAt
MTY1Niw3ICsxNjYxLDcgQEAKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUg
TElDRU5DRS5yYWxpbmstZmlybXdhcmUudHh0IGZvciBkZXRhaWxzCisjICAKKyMgLXJ0MzA3MS5i
aW4gaXMgYSBjb3B5IG9mIGJ5dGVzIDQwOTYtODE5MSBvZiBydDI4NzAuYmluIGZvciBjb21wYXRp
YmlsaXR5LgorIyArSW5mbzogcnQzMDcxLmJpbiBpcyBhIGNvcHkgb2YgYnl0ZXMgNDA5Ni04MTkx
IG9mIHJ0Mjg3MC5iaW4gZm9yIGNvbXBhdGliaWxpdHkuCisjICAKKyMgIC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCisjICAKKyMgQEAgLTMwMTYsNiArMzAyMSw4IEBACisjICBGaWxlOiAiYnJjbS9icmNtZm1h
YzQzNDU1LXNkaW8ucmFzcGJlcnJ5cGksNC1tb2RlbC1iLnR4dCIKKyMgIExpbms6IGJyY20vYnJj
bWZtYWM0MzQ1NS1zZGlvLnJhc3BiZXJyeXBpLDQtY29tcHV0ZS1tb2R1bGUudHh0IC0+IGJyY21m
bWFjNDM0NTUtc2Rpby5yYXNwYmVycnlwaSw0LW1vZGVsLWIudHh0CisjICBMaW5rOiBicmNtL2Jy
Y21mbWFjNDM0NTUtc2Rpby5yYXNwYmVycnlwaSw1LW1vZGVsLWIudHh0IC0+IGJyY21mbWFjNDM0
NTUtc2Rpby5yYXNwYmVycnlwaSw0LW1vZGVsLWIudHh0CisjICtMaW5rOiBicmNtL2JyY21mbWFj
NDM0NTUtc2Rpby5yYXNwYmVycnlwaSw1MDAudHh0IC0+IGJyY21mbWFjNDM0NTUtc2Rpby5yYXNw
YmVycnlwaSw0LW1vZGVsLWIudHh0CisjICtMaW5rOiBicmNtL2JyY21mbWFjNDM0NTUtc2Rpby5y
YXNwYmVycnlwaSw1LWNvbXB1dGUtbW9kdWxlLnR4dCAtPiBicmNtZm1hYzQzNDU1LXNkaW8ucmFz
cGJlcnJ5cGksNC1tb2RlbC1iLnR4dAorIyAgTGluazogYnJjbS9icmNtZm1hYzQzNDU1LXNkaW8u
UmFzcGJlcnJ5XCBQaVwgRm91bmRhdGlvbi1SYXNwYmVycnlcIFBpXCA0XCBNb2RlbFwgQi50eHQg
LT4gYnJjbWZtYWM0MzQ1NS1zZGlvLnJhc3BiZXJyeXBpLDQtbW9kZWwtYi50eHQKKyMgIExpbms6
IGJyY20vYnJjbWZtYWM0MzQ1NS1zZGlvLlJhc3BiZXJyeVwgUGlcIEZvdW5kYXRpb24tUmFzcGJl
cnJ5XCBQaVwgQ29tcHV0ZVwgTW9kdWxlXCA0LnR4dCAtPiBicmNtZm1hYzQzNDU1LXNkaW8ucmFz
cGJlcnJ5cGksNC1tb2RlbC1iLnR4dAorIyAgRmlsZTogImJyY20vYnJjbWZtYWM0MzQ1NS1zZGlv
Lk1JTklYLU5FTyBaODMtNC50eHQiCisjIEBAIC0zMDYyLDYgKzMwNjksNyBAQAorIyAgCisjICBM
aWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLndsMTI1MSBmb3IgZGV0YWlscy4K
KyMgIAorIyArSW5mbzoKKyMgIFRoZSBwdWJsaXNoZWQgTlZTIGZpbGVzIGFyZSBmb3IgdGVzdGlu
ZyBvbmx5LiAgRXZlcnkgZGV2aWNlIG5lZWRzIHRvCisjICBoYXZlIGEgdW5pcXVlIE5WUyB3aGlj
aCBpcyBwcm9wZXJseSBjYWxpYnJhdGVkIGZvciBiZXN0IHJlc3VsdHMuCisjICAKKyMgQEAgLTMx
MjQsNiArMzEzMiw3IEBACisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJ
Q0VOQ0UudGktY29ubmVjdGl2aXR5IGZvciBkZXRhaWxzLgorIyAgCisjICtJbmZvOgorIyAgVGhl
IE5WUyBmaWxlIGluY2x1ZGVzIHR3byBwYXJ0czoKKyMgIAkgLSByYWRpbyBjYWxpYnJhdGlvbgor
IyAgCSAtIEhXIGNvbmZpZ3VyYXRpb24gcGFyYW1ldGVycyAoYWthLiBJTkkgdmFsdWVzKQorIyBA
QCAtMzE1OCw2ICszMTY3LDcgQEAKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBT
ZWUgTElDRU5DRS50aS1jb25uZWN0aXZpdHkgZm9yIGRldGFpbHMuCisjICAKKyMgK0luZm86Cisj
ICBUaGUgZHJpdmVyIGV4cGVjdHMgdG8gZmluZCB0aGUgZmlybXdhcmVzIHVuZGVyIGEgdGktY29u
bmVjdGl2aXR5CisjICBzdWJkaXJlY3RvcnkuICBTbyBpZiB5b3VyIHN5c3RlbSBsb29rcyBmb3Ig
ZmlybXdhcmVzIGluIC9saWIvZmlybXdhcmUsCisjICB0aGUgZmlybXdhcmVzIGZvciB3bDE4eHgg
Y2hpcHMgbXVzdCBiZSBsb2NhdGVkIGluCisjIEBAIC0zMTk5LDYgKzMyMDksNyBAQAorIyAgCisj
ICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLnRpLWNvbm5lY3Rpdml0eSBm
b3IgZGV0YWlscy4KKyMgIAorIyArSW5mbzoKKyMgIAlUSUluaXRfNy4yLjMxLmJ0cyB2ZXJzaW9u
IDcuMi4zMQorIyAgCisjICAJSW4gb3JkZXIgdG8gdXNlIHRoYXQgZmlsZSBjb3B5IGl0IHRvIC9s
aWIvZmlybXdhcmUvdGktY29ubmVjdGl2aXR5LgorIyBAQCAtMzM3NCw2ICszMzg1LDcgQEAKKyMg
IAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5ydGx3aWZpX2Zpcm13
YXJlLnR4dCBmb3IgZGV0YWlscy4KKyMgIAorIyArSW5mbzoKKyMgICAgICBUaGVzZSBmaXJtd2Fy
ZSBzaG91bGQgYmUgcHV0IHVuZGVyIC9saWIvZmlybXdhcmUvcnR3ODgvCisjICAgICAgQW5kIG5v
dGUgdGhhdCB0aGUgcnR3ODggZHJpdmVyIGlzIGFibGUgdG8gc3VwcG9ydCB3YWtlLW9uLXdpcmVs
ZXNzIExBTgorIyAgICAgIGZvciBSVEw4ODIyQyBkZXZpY2VzLCBhZnRlciBrZXJuZWwgdjUuNisu
IFNvLCBtYWtlIHN1cmUgdGhlIGZpcm13YXJlCisjIEBAIC0zNTU2LDggKzM1NjgsMTQgQEAKKyMg
IEZpbGU6IHJ0bF9uaWMvcnRsODEyNWQtMS5mdworIyAgVmVyc2lvbjogMC4wLjcKKyMgIAorIyAr
RmlsZTogcnRsX25pYy9ydGw4MTI1ZC0yLmZ3CisjICtWZXJzaW9uOiAwLjAuNAorIyArCisjICBG
aWxlOiBydGxfbmljL3J0bDgxMjZhLTIuZncKKyMgIFZlcnNpb246IDAuMC4yCisjICsKKyMgK0Zp
bGU6IHJ0bF9uaWMvcnRsODEyNWJwLTIuZncKKyMgK1ZlcnNpb246IDAuMC40CisjICAKKyMgIEZp
bGU6IHJ0bF9uaWMvcnRsODEyNmEtMy5mdworIyAgVmVyc2lvbjogMC4wLjUKKyMgQEAgLTQwMTYs
NyArNDAzNCw3IEBACisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VO
Q0UuY2EwMTMyIGZvciBkZXRhaWxzCisjICAKKyMgLUZvdW5kIGFsc28gaW4gYWxzYS1maXJtd2Fy
ZSBwYWNrYWdlLgorIyArSW5mbzogRm91bmQgYWxzbyBpbiBhbHNhLWZpcm13YXJlIHBhY2thZ2Uu
CisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAKKyMgQEAgLTQxOTQsNyArNDIxMiw3IEBA
CisjICBMaW5rOiBydGxfYnQvcnRsODcyM2JzX2NvbmZpZy1PQkRBODcyMy5iaW4gLT4gcnRsODcy
M2JzX2NvbmZpZy5iaW4KKyMgIExpbms6IHJ0bF9idC9ydGw4NzIzYnNfY29uZmlnLU9CREEwNjIz
LmJpbiAtPiBydGw4NzIzYnNfY29uZmlnLmJpbgorIyAgRmlsZTogcnRsX2J0L3J0bDg3MjNjc194
eF9mdy5iaW4KKyMgLUxpbms6IHJ0bF9idC9ydGw4NzIzY3NfeHhfY29uZmlnLmJpbiAtPiBydGw4
NzIzYnNfY29uZmlnLmJpbgorIyArRmlsZTogcnRsX2J0L3J0bDg3MjNjc194eF9jb25maWcuYmlu
CisjICBGaWxlOiBydGxfYnQvcnRsODc2MWFfZncuYmluCisjICBGaWxlOiBydGxfYnQvcnRsODc2
MWJfZncuYmluCisjICBGaWxlOiBydGxfYnQvcnRsODc2MWJfY29uZmlnLmJpbgorIyBAQCAtNDIz
MSw2ICs0MjQ5LDcgQEAKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElD
RU5DRS5ydGx3aWZpX2Zpcm13YXJlLnR4dCBmb3IgZGV0YWlscy4KKyMgIAorIyArSW5mbzoKKyMg
IEZvdW5kIGluIHZlbmRvciBkcml2ZXIsIGxpbnV4X2J0X3VzYl8yLjExLjIwMTQwNDIzXzg3MjNi
ZS5yYXIKKyMgIEZyb20gaHR0cHM6Ly9naXRodWIuY29tL3Ryb3ktdGFuL2RyaXZlcl9zdG9yZQor
IyAgRmlsZXMgcnRsX2J0L3J0bDg4MjJiXyogY2FtZSBkaXJlY3RseSBmcm9tIFJlYWx0ZWsuIFRo
ZXNlIGZpbGVzIGFyZQorIyBAQCAtNjIwOCw5ICs2MjI3LDggQEAKKyMgIAorIyAgRmlsZTogcWNv
bS92ZW51cy01LjQvdmVudXMubWJuCisjICBMaW5rOiBxY29tL3ZlbnVzLTUuNC92ZW51cy5tZHQg
LT4gdmVudXMubWJuCisjIC1GaWxlOiBxY29tL3ZlbnVzLTUuNC92ZW51c19zNi5tYm4KKyMgLQor
IyAtVmVyc2lvbjogVklERU8uVkUuNS40LTAwMDU4LVBST0QtNAorIyArCisjICtWZXJzaW9uOiBW
SURFTy5WRS41LjQtMDAwNTktUFJPRC0xCisjICAKKyMgIEZpbGU6IHFjb20vdmVudXMtNi4wL3Zl
bnVzLm1ibgorIyAgCisjIEBAIC02MzA5LDYgKzYzMjcsNyBAQAorIyAgCisjICBMaWNlbmNlOiBS
ZWRpc3RyaWJ1dGFibGUsIEJTRC0zLUNsYXVzZSBsaWNlbmNlLCBTZWUgTElDRU5TRS5xY29tX3lh
bWF0byBmb3IgZGV0YWlscworIyAgCisjICtJbmZvOgorIyAgQmluYXJ5IGZpbGVzIGdlbmVyYXRl
ZCBmcm9tIGhlYWRlciBmaWxlcyBpbiBFZmlrYU1YIGtlcm5lbCBzb3VyY2VzLiBBIHByZWZpeCBv
ZgorIyAgZm91ciB6ZXJvIGJ5dGVzIHdhcyBwcmVwZW5kZWQgdG8gbWFrZSB0aGVtIHdvcmsgd2l0
aCB0aGUgRFJNIE1TTSBkcml2ZXIuIFNlZQorIyAgaHR0cHM6Ly9naXRodWIuY29tL2dlbmVzaS9s
aW51eC1sZWdhY3kvdHJlZS9tYXN0ZXIvZHJpdmVycy9teGMvYW1kLWdwdQorIyBAQCAtNjM5NSw2
ICs2NDE0LDcgQEAKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5T
RS5xY29tIGFuZCBxY29tL05PVElDRS50eHQgZm9yIGRldGFpbHMKKyMgIAorIyArSW5mbzoKKyMg
IEJpbmFyeSBmaWxlcyBzdXBwbGllZCBvcmlnaW5hbGx5IGZyb20KKyMgIGh0dHA6Ly9yZWxlYXNl
cy5saW5hcm8ub3JnLzk2Ym9hcmRzL2RyYWdvbmJvYXJkNDEwYy9xdWFsY29tbS9maXJtd2FyZS9s
aW51eC1ib2FyZC1zdXBwb3J0LXBhY2thZ2UtcjEwMzYuMS56aXAKKyMgIGh0dHA6Ly9yZWxlYXNl
cy5saW5hcm8ub3JnLzk2Ym9hcmRzL2RyYWdvbmJvYXJkODQ1Yy9xdWFsY29tbS9maXJtd2FyZS9S
QjNfZmlybXdhcmVfMjAyMjExMjEwMDAwMDAtdjUuemlwCisjIEBAIC02NDE5LDYgKzY0MzksNyBA
QAorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLnFjb20gYW5k
IHFjb20vTk9USUNFLnR4dCBmb3IgZGV0YWlscworIyAgCisjICtJbmZvOgorIyAgQmluYXJ5IGZp
bGVzIHN1cHBsaWVkIG9yaWdpbmFsbHkgZnJvbQorIyAgaHR0cDovL3JlbGVhc2VzLmxpbmFyby5v
cmcvOTZib2FyZHMvZHJhZ29uYm9hcmQ4NDVjL3F1YWxjb21tL2Zpcm13YXJlL1JCM19maXJtd2Fy
ZV8yMDIyMTEyMTAwMDAwMC12NS56aXAKKyMgIAorIyBAQCAtNjY1NCw2ICs2Njc1LDcgQEAKKyMg
IAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgd2Z4L0xJQ0VOQ0Uud2YyMDAgZm9y
IGRldGFpbHMuCisjICAKKyMgK0luZm86CisjICBUaGUgZmlybXdhcmUgaXRzZWxmIG9yaWdpbmF0
ZXMgZnJvbSBodHRwczovL2dpdGh1Yi5jb20vU2lsaWNvbkxhYnMvd2Z4LWZpcm13YXJlCisjICAK
KyMgIFRoZSAqLnBkcyBmaWxlcyBjb21lIGZyb20gaHR0cHM6Ly9naXRodWIuY29tL1NpbGljb25M
YWJzL3dmeC1wZHMKKyMgQEAgLTc0MjgsNiArNzQ1MCw4IEBACisjICBMaW5rOiBjaXJydXMvY3Mz
NWw0MS1kc3AxLXNway1wcm90LTEwM2M4Y2RmLXNwa2lkMS1yMC5iaW4gLT4gY3MzNWw0MS1kc3Ax
LXNway1wcm90LTEwM2M4Y2RmLXNwa2lkMS1sMC5iaW4KKyMgIExpbms6IGNpcnJ1cy9jczM1bDQx
LWRzcDEtc3BrLXByb3QtMTAzYzhjZTAtc3BraWQxLWwwLmJpbiAtPiBjczM1bDQxLWRzcDEtc3Br
LXByb3QtMTAzYzhjZGYtc3BraWQxLWwwLmJpbgorIyAgTGluazogY2lycnVzL2NzMzVsNDEtZHNw
MS1zcGstcHJvdC0xMDNjOGNlMC1zcGtpZDEtcjAuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstcHJv
dC0xMDNjOGNkZi1zcGtpZDEtbDAuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNw
ay1wcm90LTFmNjYwMTA1LndtZncgLT4gY3MzNWw0MS92Ni44My4wL2hhbG9fY3NwbF9SQU1fcmV2
QjJfMjkuODUuMC53bWZ3CisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTFm
NjYwMTA1LmJpbgorIyAgCisjICBMaWNlbnNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNF
LmNpcnJ1cyBmb3IgZGV0YWlscy4KKyMgIAorIyBAQCAtNzQ0NywxNyArNzQ3MSw5IEBACisjICBG
aWxlOiBjaXJydXMvY3MzNWw1Ni9DUzM1TDU2X1JldjMuMTEuMTgud21mdworIyAgRmlsZTogY2ly
cnVzL2NzMzVsNTYvQ1MzNUw1Nl9SZXYzLjExLjIwLndtZncKKyMgIEZpbGU6IGNpcnJ1cy9jczM1
bDU2L0NTMzVMNTZfUmV2My4xMS4yNS53bWZ3CisjICtGaWxlOiBjaXJydXMvY3MzNWw1Ni9DUzM1
TDU2X1JldjMuMTEuMjYud21mdworIyAgRmlsZTogY2lycnVzL2NzMzVsNTYvQ1MzNUw1Nl9SZXYz
LjExLjI3LndtZncKKyMgLUxpbms6IGNpcnJ1cy9jczM1bDU0LWIwLWRzcDEtbWlzYy0xMDNjOGQw
MS53bWZ3IC0+IGNzMzVsNTYvQ1MzNUw1Nl9SZXYzLjExLjE4LndtZncKKyMgLUZpbGU6IGNpcnJ1
cy9jczM1bDU0LWIwLWRzcDEtbWlzYy0xMDNjOGQwMS1hbXAxLmJpbgorIyAtRmlsZTogY2lycnVz
L2NzMzVsNTQtYjAtZHNwMS1taXNjLTEwM2M4ZDAxLWFtcDIuYmluCisjIC1GaWxlOiBjaXJydXMv
Y3MzNWw1NC1iMC1kc3AxLW1pc2MtMTAzYzhkMDEtYW1wMy5iaW4KKyMgLUZpbGU6IGNpcnJ1cy9j
czM1bDU0LWIwLWRzcDEtbWlzYy0xMDNjOGQwMS1hbXA0LmJpbgorIyAtTGluazogY2lycnVzL2Nz
MzVsNTQtYjAtZHNwMS1taXNjLTEwM2M4ZDA4LndtZncgLT4gY3MzNWw1Ni9DUzM1TDU2X1JldjMu
MTEuMTgud21mdworIyAtTGluazogY2lycnVzL2NzMzVsNTQtYjAtZHNwMS1taXNjLTEwM2M4ZDA4
LWFtcDEuYmluIC0+IGNzMzVsNTQtYjAtZHNwMS1taXNjLTEwM2M4ZDAxLWFtcDEuYmluCisjIC1M
aW5rOiBjaXJydXMvY3MzNWw1NC1iMC1kc3AxLW1pc2MtMTAzYzhkMDgtYW1wMi5iaW4gLT4gY3Mz
NWw1NC1iMC1kc3AxLW1pc2MtMTAzYzhkMDEtYW1wMi5iaW4KKyMgLUxpbms6IGNpcnJ1cy9jczM1
bDU0LWIwLWRzcDEtbWlzYy0xMDNjOGQwOC1hbXAzLmJpbiAtPiBjczM1bDU0LWIwLWRzcDEtbWlz
Yy0xMDNjOGQwMS1hbXAzLmJpbgorIyAtTGluazogY2lycnVzL2NzMzVsNTQtYjAtZHNwMS1taXNj
LTEwM2M4ZDA4LWFtcDQuYmluIC0+IGNzMzVsNTQtYjAtZHNwMS1taXNjLTEwM2M4ZDAxLWFtcDQu
YmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw1Ni9DUzM1TDU2X1JldjMuMTEuMjgud21mdworIyAg
TGluazogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTEwMjgwYzYyLXNwa2lkMC53bWZ3IC0+
IGNzMzVsNTYvQ1MzNUw1Nl9SZXYzLjExLjExLndtZncKKyMgIEZpbGU6IGNpcnJ1cy9jczM1bDU2
LWIwLWRzcDEtbWlzYy0xMDI4MGM2Mi1zcGtpZDAtYW1wMS5iaW4KKyMgIEZpbGU6IGNpcnJ1cy9j
czM1bDU2LWIwLWRzcDEtbWlzYy0xMDI4MGM2Mi1zcGtpZDAtYW1wMi5iaW4KKyMgQEAgLTc1MzQs
NiArNzU1MCwxNiBAQAorIyAgRmlsZTogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTEwM2M4
YzUzLWFtcDIuYmluCisjICBGaWxlOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTAzYzhj
NTMtYW1wMy5iaW4KKyMgIEZpbGU6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xMDNjOGM1
My1hbXA0LmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNTQtYjAtZHNwMS1taXNjLTEwM2M4ZDAx
LndtZncgLT4gY3MzNWw1Ni9DUzM1TDU2X1JldjMuMTEuMTgud21mdworIyArRmlsZTogY2lycnVz
L2NzMzVsNTQtYjAtZHNwMS1taXNjLTEwM2M4ZDAxLWFtcDEuYmluCisjICtGaWxlOiBjaXJydXMv
Y3MzNWw1NC1iMC1kc3AxLW1pc2MtMTAzYzhkMDEtYW1wMi5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9j
czM1bDU0LWIwLWRzcDEtbWlzYy0xMDNjOGQwMS1hbXAzLmJpbgorIyArRmlsZTogY2lycnVzL2Nz
MzVsNTQtYjAtZHNwMS1taXNjLTEwM2M4ZDAxLWFtcDQuYmluCisjICtMaW5rOiBjaXJydXMvY3Mz
NWw1NC1iMC1kc3AxLW1pc2MtMTAzYzhkMDgud21mdyAtPiBjczM1bDU2L0NTMzVMNTZfUmV2My4x
MS4xOC53bWZ3CisjICtMaW5rOiBjaXJydXMvY3MzNWw1NC1iMC1kc3AxLW1pc2MtMTAzYzhkMDgt
YW1wMS5iaW4gLT4gY3MzNWw1NC1iMC1kc3AxLW1pc2MtMTAzYzhkMDEtYW1wMS5iaW4KKyMgK0xp
bms6IGNpcnJ1cy9jczM1bDU0LWIwLWRzcDEtbWlzYy0xMDNjOGQwOC1hbXAyLmJpbiAtPiBjczM1
bDU0LWIwLWRzcDEtbWlzYy0xMDNjOGQwMS1hbXAyLmJpbgorIyArTGluazogY2lycnVzL2NzMzVs
NTQtYjAtZHNwMS1taXNjLTEwM2M4ZDA4LWFtcDMuYmluIC0+IGNzMzVsNTQtYjAtZHNwMS1taXNj
LTEwM2M4ZDAxLWFtcDMuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw1NC1iMC1kc3AxLW1pc2Mt
MTAzYzhkMDgtYW1wNC5iaW4gLT4gY3MzNWw1NC1iMC1kc3AxLW1pc2MtMTAzYzhkMDEtYW1wNC5i
aW4KKyMgIExpbms6IGNpcnJ1cy9jczM1bDU0LWIwLWRzcDEtbWlzYy0xMDNjOGQ4NS53bWZ3IC0+
IGNzMzVsNTYvQ1MzNUw1Nl9SZXYzLjExLjExLjEud21mdworIyAgRmlsZTogY2lycnVzL2NzMzVs
NTQtYjAtZHNwMS1taXNjLTEwM2M4ZDg1LWFtcDEuYmluCisjICBGaWxlOiBjaXJydXMvY3MzNWw1
NC1iMC1kc3AxLW1pc2MtMTAzYzhkODUtYW1wMi5iaW4KKyMgQEAgLTc1OTgsNiArNzYyNCw5IEBA
CisjICBMaW5rOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTAzYzhlMmMud21mdyAtPiBj
czM1bDU2L0NTMzVMNTZfUmV2My4xMS4xMS4xLndtZncKKyMgIExpbms6IGNpcnJ1cy9jczM1bDU2
LWIwLWRzcDEtbWlzYy0xMDNjOGUyYy1hbXAxLmJpbiAtPiBjczM1bDU2LWIwLWRzcDEtbWlzYy0x
MDNjOGQ5MC1hbXAxLmJpbgorIyAgTGluazogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTEw
M2M4ZTJjLWFtcDIuYmluIC0+IGNzMzVsNTYtYjAtZHNwMS1taXNjLTEwM2M4ZDkwLWFtcDIuYmlu
CisjICtMaW5rOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTA0MzEyNjQud21mdyAtPiBj
czM1bDU2L0NTMzVMNTZfUmV2My4xMS4xNi53bWZ3CisjICtMaW5rOiBjaXJydXMvY3MzNWw1Ni1i
MC1kc3AxLW1pc2MtMTA0MzEyNjQtYW1wMS5iaW4gLT4gY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTA0
MzFkZjMtYW1wMS5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xMDQz
MTI2NC1hbXAyLmJpbiAtPiBjczM1bDU2LWIwLWRzcDEtbWlzYy0xMDQzMWRmMy1hbXAyLmJpbgor
IyAgTGluazogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTEwNDMxYjEzLXNwa2lkMC53bWZ3
IC0+IGNzMzVsNTYvQ1MzNUw1Nl9SZXYzLjExLjE2LndtZncKKyMgIEZpbGU6IGNpcnJ1cy9jczM1
bDU2LWIwLWRzcDEtbWlzYy0xMDQzMWIxMy1zcGtpZDAtYW1wMS5iaW4KKyMgIEZpbGU6IGNpcnJ1
cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xMDQzMWIxMy1zcGtpZDAtYW1wMi5iaW4KKyMgQEAgLTc2
MjAsMTEgKzc2NDksNiBAQAorIyAgRmlsZTogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTEw
NDMxZTEzLWFtcDIuYmluCisjICBGaWxlOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTA0
MzFlMTMtYW1wNC5iaW4KKyMgIEZpbGU6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xMDQz
MWUxMy1hbXAzLmJpbgorIyAtTGluazogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTEwNDMx
ZjQzLndtZncgLT4gY3MzNWw1Ni9DUzM1TDU2X1JldjMuMTEuMTYud21mdworIyAtRmlsZTogY2ly
cnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTEwNDMxZjQzLWFtcDEuYmluCisjIC1GaWxlOiBjaXJy
dXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTA0MzFmNDMtYW1wMi5iaW4KKyMgLUZpbGU6IGNpcnJ1
cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xMDQzMWY0My1hbXA0LmJpbgorIyAtRmlsZTogY2lycnVz
L2NzMzVsNTYtYjAtZHNwMS1taXNjLTEwNDMxZjQzLWFtcDMuYmluCisjICBMaW5rOiBjaXJydXMv
Y3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTA0MzFlNjMtc3BraWQwLndtZncgLT4gY3MzNWw1Ni9DUzM1
TDU2X1JldjMuMTEuMTYud21mdworIyAgRmlsZTogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNj
LTEwNDMxZTYzLXNwa2lkMC1hbXAxLmJpbgorIyAgRmlsZTogY2lycnVzL2NzMzVsNTYtYjAtZHNw
MS1taXNjLTEwNDMxZTYzLXNwa2lkMC1hbXAyLmJpbgorIyBAQCAtNzYzNywxMiArNzY2MSwzNSBA
QAorIyAgTGluazogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTEwNDMxZTgzLXNwa2lkMS53
bWZ3IC0+IGNzMzVsNTYvQ1MzNUw1Nl9SZXYzLjExLjE2LndtZncKKyMgIEZpbGU6IGNpcnJ1cy9j
czM1bDU2LWIwLWRzcDEtbWlzYy0xMDQzMWU4My1zcGtpZDEtYW1wMS5iaW4KKyMgIEZpbGU6IGNp
cnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xMDQzMWU4My1zcGtpZDEtYW1wMi5iaW4KKyMgK0xp
bms6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xMDQzMWY0My53bWZ3IC0+IGNzMzVsNTYv
Q1MzNUw1Nl9SZXYzLjExLjE2LndtZncKKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEt
bWlzYy0xMDQzMWY0My1hbXAxLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1t
aXNjLTEwNDMxZjQzLWFtcDIuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1p
c2MtMTA0MzFmNDMtYW1wNC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlz
Yy0xMDQzMWY0My1hbXAzLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNj
LTE3YWEyMzNiLXNwa2lkMC53bWZ3IC0+IGNzMzVsNTYvQ1MzNUw1Nl9SZXYzLjExLjIwLndtZncK
KyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xN2FhMjMzYi1zcGtpZDAtYW1w
bC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xN2FhMjMzYi1zcGtp
ZDAtYW1wci5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xN2FhMjMz
Yi1zcGtpZDEud21mdyAtPiBjczM1bDU2L0NTMzVMNTZfUmV2My4xMS4yMC53bWZ3CisjICtGaWxl
OiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTdhYTIzM2Itc3BraWQxLWFtcGwuYmluCisj
ICtGaWxlOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTdhYTIzM2Itc3BraWQxLWFtcHIu
YmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTdhYTIzM2Mud21mdyAt
PiBjczM1bDU2L0NTMzVMNTZfUmV2My4xMS4yOC53bWZ3CisjICtGaWxlOiBjaXJydXMvY3MzNWw1
Ni1iMC1kc3AxLW1pc2MtMTdhYTIzM2MtYW1wMS5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDU2
LWIwLWRzcDEtbWlzYy0xN2FhMjMzYy1hbXAyLmJpbgorIyAgTGluazogY2lycnVzL2NzMzVsNTYt
YjAtZHNwMS1taXNjLTE3YWEzODBlLXNwa2lkMC53bWZ3IC0+IGNzMzVsNTYvQ1MzNUw1Nl9SZXYz
LjExLjIwLndtZncKKyMgIEZpbGU6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xN2FhMzgw
ZS1zcGtpZDAtYW1wbC5iaW4KKyMgIEZpbGU6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0x
N2FhMzgwZS1zcGtpZDAtYW1wci5iaW4KKyMgIExpbms6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEt
bWlzYy0xN2FhMzgwZS1zcGtpZDEud21mdyAtPiBjczM1bDU2L0NTMzVMNTZfUmV2My4xMS4yMC53
bWZ3CisjICBGaWxlOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTdhYTM4MGUtc3BraWQx
LWFtcGwuYmluCisjICBGaWxlOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTdhYTM4MGUt
c3BraWQxLWFtcHIuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTdh
YTM4MzItc3BraWQwLndtZncgLT4gY3MzNWw1Ni9DUzM1TDU2X1JldjMuMTEuMjYud21mdworIyAr
RmlsZTogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTE3YWEzODMyLXNwa2lkMC1hbXBsLmJp
bgorIyArRmlsZTogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTE3YWEzODMyLXNwa2lkMC1h
bXByLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTE3YWEzODMyLXNw
a2lkMS53bWZ3IC0+IGNzMzVsNTYvQ1MzNUw1Nl9SZXYzLjExLjI2LndtZncKKyMgK0ZpbGU6IGNp
cnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xN2FhMzgzMi1zcGtpZDEtYW1wbC5iaW4KKyMgK0Zp
bGU6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xN2FhMzgzMi1zcGtpZDEtYW1wci5iaW4K
KyMgK0xpbms6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xN2FhMzkwNS53bWZ3IC0+IGNz
MzVsNTYvQ1MzNUw1Nl9SZXYzLjExLjE4LndtZncKKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDU2LWIw
LWRzcDEtbWlzYy0xN2FhMzkwNS1hbXAxLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNTYtYjAt
ZHNwMS1taXNjLTE3YWEzOTA1LWFtcDIuYmluCisjICAKKyMgIExpY2Vuc2U6IFJlZGlzdHJpYnV0
YWJsZS4gU2VlIExJQ0VOU0UuY2lycnVzIGZvciBkZXRhaWxzLgorIyAgCisjIAorIworCiBTVU1N
QVJZID0gIkZpcm13YXJlIGZpbGVzIGZvciB1c2Ugd2l0aCBMaW51eCBrZXJuZWwiCiBIT01FUEFH
RSA9ICJodHRwczovL3d3dy5rZXJuZWwub3JnLyIKIERFU0NSSVBUSU9OID0gIkxpbnV4IGZpcm13
YXJlIGlzIGEgcGFja2FnZSBkaXN0cmlidXRlZCBhbG9uZ3NpZGUgdGhlIExpbnV4IGtlcm5lbCBc
CkBAIC0xNTQsNyArNDQzLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5DRS5B
YmlsaXM7bWQ1PWI1ZWUzZjQxMDc4MGU1NjcxMWFkNDhlYWRjMjJiOGJjIFwKICAgICAgICAgICAg
ICAgICAgICAgZmlsZTovL0xJQ0VOQ0UueGM1MDAwO21kNT0xZTE3MGMxMzE3NTMyM2MzMmM3ZjRk
MDk5OGQ1M2Y2NiBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTkNFLnhjNTAwMGM7
bWQ1PTEyYjAyZWZhMzA0OWRiNjVkNTI0YWViNDE4ZGQ4N2NhIFwKICAgICAgICAgICAgICAgICAg
ICAgZmlsZTovL3dmeC9MSUNFTkNFLndmMjAwO21kNT00ZDFiZWZmMDBkOTAyYzA1YzljN2U5NWE1
ZDhlYjUyZCBcCi0gICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9XSEVOQ0U7bWQ1PSR7V0hFTkNF
X0NIS1NVTX0gXAorICAgICAgICAgICAgICAgICAgICBmaWxlOi8vV0hFTkNFO21kNT1jOTBhMjVj
Y2JkMDI3ZWI4ZDYxYjI5NDNhYjY4NDQ3YyBcCiAgICAgICAgICAgICAgICAgICAgICIKICMgV0hF
TkNFIGNoZWNrc3VtIGlzIGRlZmluZWQgc2VwYXJhdGVseSB0byBlYXNlIG92ZXJyaWRpbmcgaXQg
aWYKICMgY2xhc3MtZGV2dXBzdHJlYW0gaXMgc2VsZWN0ZWQuCkBAIC0yNDcsNyArNTM2LDcgQEAg
U1JDX1VSSTpjbGFzcy1kZXZ1cHN0cmVhbSA9ICJnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2Nt
L2xpbnV4L2tlcm5lbC9naXQvZmlybXcKICMgUGluIHRoaXMgdG8gdGhlIDIwMjIwNTA5IHJlbGVh
c2UsIG92ZXJyaWRlIHRoaXMgaW4gbG9jYWwuY29uZgogU1JDUkVWOmNsYXNzLWRldnVwc3RyZWFt
ID89ICJiMTljYmRjYTc4YWIyYWRmZDIxMGM5MWJlMTVhMjI1NjhlOGI4Y2FlIgogCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiMmJiMDM1NzA4NTc2ZDA3NmY5N2Q0MTk2YTFjMjJlMGE0ZDMzZmJiMDIx
MGQwNTQyOGQwYmY0ZjI0M2U5OWFmNSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJhMTJjYjM4ZjQ3
OTMzOTRiZjU2YzY3MDJiZTI5YjZlNGYwOWRlY2EwNzE0OTQzYmJhOThhNDkyMDMwNjUxNTcwIgog
CiBpbmhlcml0IGFsbGFyY2gKIAotLSAKMi40NC4xCgo=

--===============7952154022440164642==--

