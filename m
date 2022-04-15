Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E84FAC49EA5
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:54 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web12.11583.1650052687477836339
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 12:58:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=k5E1f7gq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 010101802ecdec1c-e89e75c2-8fb5-4442-b13d-6a264c2773f5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1650052689;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=iWlMrZPcjPZMn5lrEWylu0B+T+rRczopi8H7oZ/YPqk=;
	b=k5E1f7gqdZK2FUGwvUdSFPvdEVVcrTb8Kig/bO36LTNXusDJB7nPfY4Kw5emmowC
	pAbMZNaAf7K9x+zCNII8fsR0dqw5UcmBWb+p7mC4XO9gRWYciybwNcwXCLDXCqazZPf
	jrtGOPy75FjCJnbnvXoBuztZraqbvQsyFDkobg34=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1650052689;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=iWlMrZPcjPZMn5lrEWylu0B+T+rRczopi8H7oZ/YPqk=;
	b=kzNuioWsX/aRWc4ZsHulisqL2G1C06ezIY3T0Y6DcxfbpcYehAUh7mpE4mfD62Cw
	b+EtV99gLvw3senTO8dzfr4ve4XccPLejKas+0qfMMgQAvBR3qO05yiFmYRgFqzKpyi
	C37GBTFAHHmUGd6y3QABNamQ7shzCoeNtktaoLqQ=
Content-Type: multipart/mixed; boundary="===============1237857480147002932=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] linux-firmware: upgrading to 20220411 SUCCEEDED
Message-ID: 
 <010101802ecdec1c-e89e75c2-8fb5-4442-b13d-6a264c2773f5-000000@us-west-2.amazonses.com>
Date: Fri, 15 Apr 2022 19:58:08 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164507

--===============1237857480147002932==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *linux-firmware* to *20220411* has Succeeded.

Next steps:
    - apply the patch: git am 0001-linux-firmware-upgrade-20220310-20220411.patch
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
--===============1237857480147002932==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: FILELIST: added "/lib/firmware/brcm/brcmfmac4356-sdio.firefly,firefly-rk3399.txt /lib/firmware/brcm/brcmfmac4356-sdio.AP6356S.txt"
packages/all-poky-linux/linux-firmware/linux-firmware-ice: FILELIST: removed "/lib/firmware/intel/ice/ddp-comms/ice_comms-1.3.20.0.pkg", added "/lib/firmware/intel/ice/ddp-comms/ice_comms-1.3.31.0.pkg /lib/firmware/intel/ice/ddp-wireless_edge/ice_wireless_edge-1.3.7.0.pkg"
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PKGSIZE changed from 1323660 to 2069624 (+56%)
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: FILELIST: added "/lib/firmware/nvidia/ga102/sec2/sig.bin /lib/firmware/nvidia/ga106/sec2/sig.bin /lib/firmware/nvidia/ga106/acr/ucode_asb.bin /lib/firmware/nvidia/ga104/sec2/desc.bin /lib/firmware/nvidia/ga102/gr/NET_img.bin /lib/firmware/nvidia/ga106/acr/ucode_ahesasc.bin /lib/firmware/nvidia/ga103/sec2/desc.bin /lib/firmware/nvidia/ga106/gr/fecs_sig.bin /lib/firmware/nvidia/ga103/sec2/image.bin /lib/firmware/nvidia/ga103/gr/fecs_bl.bin /lib/firmware/nvidia/ga102/gr/gpccs_sig.bin /lib/firmware/nvidia/ga102/gr/fecs_sig.bin /lib/firmware/nvidia/ga104/gr/gpccs_sig.bin /lib/firmware/nvidia/ga107/acr/ucode_asb.bin /lib/firmware/nvidia/ga106/gr/NET_img.bin /lib/firmware/nvidia/ga103/sec2/hs_bl_sig.bin /lib/firmware/nvidia/ga103/gr/gpccs_bl.bin /lib/firmware/nvidia/ga107/gr/gpccs_bl.bin /lib/firmware/nvidia/ga107/gr/fecs_sig.bin /lib/firmware/nvidia/ga103/acr/ucode_asb.bin /lib/firmware/nvidia/ga107/sec2/desc.bin /lib/firmwa
 re/nvidia/ga106/nvdec/scrubber.bin /lib/firmware/nvidia/ga103/sec2/sig.bin /lib/firmware/nvidia/ga106/sec2/desc.bin /lib/firmware/nvidia/ga104/gr/fecs_bl.bin /lib/firmware/nvidia/ga107/sec2/sig.bin /lib/firmware/nvidia/ga106/acr/ucode_unload.bin /lib/firmware/nvidia/ga107/nvdec/scrubber.bin /lib/firmware/nvidia/ga107/gr/NET_img.bin /lib/firmware/nvidia/ga103/gr/NET_img.bin /lib/firmware/nvidia/ga103/nvdec/scrubber.bin /lib/firmware/nvidia/ga104/sec2/image.bin /lib/firmware/nvidia/ga107/sec2/hs_bl_sig.bin /lib/firmware/nvidia/ga103/acr/ucode_ahesasc.bin /lib/firmware/nvidia/ga102/sec2/image.bin /lib/firmware/nvidia/ga102/gr/fecs_bl.bin /lib/firmware/nvidia/ga107/gr/gpccs_sig.bin /lib/firmware/nvidia/ga104/gr/fecs_sig.bin /lib/firmware/nvidia/ga106/sec2/hs_bl_sig.bin /lib/firmware/nvidia/ga102/acr/ucode_unload.bin /lib/firmware/nvidia/ga104/acr/ucode_asb.bin /lib/firmware/nvidia/ga104/sec2/hs_bl_sig.bin /lib/firmware/nvidia/ga103/acr/ucode_unload.bin /lib/firmware/nvidia/ga106/sec2/im
 age.bin /lib/firmware/nvidia/ga104/acr/ucode_ahesasc.bin /lib/firmware/nvidia/ga104/gr/NET_img.bin /lib/firmware/nvidia/ga107/sec2/image.bin /lib/firmware/nvidia/ga106/gr/fecs_bl.bin /lib/firmware/nvidia/ga102/nvdec/scrubber.bin /lib/firmware/nvidia/ga107/acr/ucode_ahesasc.bin /lib/firmware/nvidia/ga103/gr/gpccs_sig.bin /lib/firmware/nvidia/ga104/sec2/sig.bin /lib/firmware/nvidia/ga104/nvdec/scrubber.bin /lib/firmware/nvidia/ga103/gr/fecs_sig.bin /lib/firmware/nvidia/ga107/acr/ucode_unload.bin /lib/firmware/nvidia/ga102/gr/gpccs_bl.bin /lib/firmware/nvidia/ga102/sec2/desc.bin /lib/firmware/nvidia/ga107/gr/fecs_bl.bin /lib/firmware/nvidia/ga102/acr/ucode_ahesasc.bin /lib/firmware/nvidia/ga104/gr/gpccs_bl.bin /lib/firmware/nvidia/ga102/acr/ucode_asb.bin /lib/firmware/nvidia/ga104/acr/ucode_unload.bin /lib/firmware/nvidia/ga106/gr/gpccs_bl.bin /lib/firmware/nvidia/ga106/gr/gpccs_sig.bin /lib/firmware/nvidia/ga102/sec2/hs_bl_sig.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PKGSIZE changed from 1820713 to 2758353 (+51%)
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: added "/lib/firmware/rtl_bt/rtl8852bu_config.bin /lib/firmware/rtl_bt/rtl8852bu_fw.bin"
Changes to packages/all-poky-linux/linux-firmware (sysroot):
  /lib/firmware/brcm/brcmfmac4356-sdio.khadas,vim2.txt changed symlink target from brcmfmac4356-sdio.vamrs,rock960.txt to brcmfmac4356-sdio.AP6356S.txt
  /lib/firmware/brcm/brcmfmac4356-sdio.vamrs,rock960.txt changed type from file to symlink
  /lib/firmware/brcm/brcmfmac4356-sdio.vamrs,rock960.txt changed permissions from rw-r--r-- to rwxrwxrwx
  /lib/firmware/brcm/brcmfmac4356-sdio.vamrs,rock960.txt changed symlink target from None to brcmfmac4356-sdio.AP6356S.txt
  /lib/firmware/intel/ice/ddp-comms/ice_comms-1.3.20.0.pkg moved to /lib/firmware/intel/ice/ddp-comms/ice_comms-1.3.31.0.pkg
  /lib/firmware/brcm/brcmfmac4356-sdio.AP6356S.txt was added
  /lib/firmware/brcm/brcmfmac4356-sdio.firefly,firefly-rk3399.txt was added
  /lib/firmware/intel/ice/ddp-wireless_edge was added
  /lib/firmware/intel/ice/ddp-wireless_edge/ice_wireless_edge-1.3.7.0.pkg was added
  /lib/firmware/nvidia/ga102 was added
  /lib/firmware/nvidia/ga102/acr was added
  /lib/firmware/nvidia/ga102/acr/ucode_ahesasc.bin was added
  /lib/firmware/nvidia/ga102/acr/ucode_asb.bin was added
  /lib/firmware/nvidia/ga102/acr/ucode_unload.bin was added
  /lib/firmware/nvidia/ga102/gr was added
  /lib/firmware/nvidia/ga102/gr/fecs_bl.bin was added
  /lib/firmware/nvidia/ga102/gr/fecs_sig.bin was added
  /lib/firmware/nvidia/ga102/gr/gpccs_bl.bin was added
  /lib/firmware/nvidia/ga102/gr/gpccs_sig.bin was added
  /lib/firmware/nvidia/ga102/gr/NET_img.bin was added
  /lib/firmware/nvidia/ga102/nvdec was added
  /lib/firmware/nvidia/ga102/nvdec/scrubber.bin was added
  /lib/firmware/nvidia/ga102/sec2 was added
  /lib/firmware/nvidia/ga102/sec2/desc.bin was added
  /lib/firmware/nvidia/ga102/sec2/hs_bl_sig.bin was added
  /lib/firmware/nvidia/ga102/sec2/image.bin was added
  /lib/firmware/nvidia/ga102/sec2/sig.bin was added
  /lib/firmware/nvidia/ga103 was added
  /lib/firmware/nvidia/ga103/acr was added
  /lib/firmware/nvidia/ga103/acr/ucode_ahesasc.bin was added
  /lib/firmware/nvidia/ga103/acr/ucode_asb.bin was added
  /lib/firmware/nvidia/ga103/acr/ucode_unload.bin was added
  /lib/firmware/nvidia/ga103/gr was added
  /lib/firmware/nvidia/ga103/gr/fecs_bl.bin was added
  /lib/firmware/nvidia/ga103/gr/fecs_sig.bin was added
  /lib/firmware/nvidia/ga103/gr/gpccs_bl.bin was added
  /lib/firmware/nvidia/ga103/gr/gpccs_sig.bin was added
  /lib/firmware/nvidia/ga103/gr/NET_img.bin was added
  /lib/firmware/nvidia/ga103/nvdec was added
  /lib/firmware/nvidia/ga103/nvdec/scrubber.bin was added
  /lib/firmware/nvidia/ga103/sec2 was added
  /lib/firmware/nvidia/ga103/sec2/desc.bin was added
  /lib/firmware/nvidia/ga103/sec2/hs_bl_sig.bin was added
  /lib/firmware/nvidia/ga103/sec2/image.bin was added
  /lib/firmware/nvidia/ga103/sec2/sig.bin was added
  /lib/firmware/nvidia/ga104 was added
  /lib/firmware/nvidia/ga104/acr was added
  /lib/firmware/nvidia/ga104/acr/ucode_ahesasc.bin was added
  /lib/firmware/nvidia/ga104/acr/ucode_asb.bin was added
  /lib/firmware/nvidia/ga104/acr/ucode_unload.bin was added
  /lib/firmware/nvidia/ga104/gr was added
  /lib/firmware/nvidia/ga104/gr/fecs_bl.bin was added
  /lib/firmware/nvidia/ga104/gr/fecs_sig.bin was added
  /lib/firmware/nvidia/ga104/gr/gpccs_bl.bin was added
  /lib/firmware/nvidia/ga104/gr/gpccs_sig.bin was added
  /lib/firmware/nvidia/ga104/gr/NET_img.bin was added
  /lib/firmware/nvidia/ga104/nvdec was added
  /lib/firmware/nvidia/ga104/nvdec/scrubber.bin was added
  /lib/firmware/nvidia/ga104/sec2 was added
  /lib/firmware/nvidia/ga104/sec2/desc.bin was added
  /lib/firmware/nvidia/ga104/sec2/hs_bl_sig.bin was added
  /lib/firmware/nvidia/ga104/sec2/image.bin was added
  /lib/firmware/nvidia/ga104/sec2/sig.bin was added
  /lib/firmware/nvidia/ga106 was added
  /lib/firmware/nvidia/ga106/acr was added
  /lib/firmware/nvidia/ga106/acr/ucode_ahesasc.bin was added
  /lib/firmware/nvidia/ga106/acr/ucode_asb.bin was added
  /lib/firmware/nvidia/ga106/acr/ucode_unload.bin was added
  /lib/firmware/nvidia/ga106/gr was added
  /lib/firmware/nvidia/ga106/gr/fecs_bl.bin was added
  /lib/firmware/nvidia/ga106/gr/fecs_sig.bin was added
  /lib/firmware/nvidia/ga106/gr/gpccs_bl.bin was added
  /lib/firmware/nvidia/ga106/gr/gpccs_sig.bin was added
  /lib/firmware/nvidia/ga106/gr/NET_img.bin was added
  /lib/firmware/nvidia/ga106/nvdec was added
  /lib/firmware/nvidia/ga106/nvdec/scrubber.bin was added
  /lib/firmware/nvidia/ga106/sec2 was added
  /lib/firmware/nvidia/ga106/sec2/desc.bin was added
  /lib/firmware/nvidia/ga106/sec2/hs_bl_sig.bin was added
  /lib/firmware/nvidia/ga106/sec2/image.bin was added
  /lib/firmware/nvidia/ga106/sec2/sig.bin was added
  /lib/firmware/nvidia/ga107 was added
  /lib/firmware/nvidia/ga107/acr was added
  /lib/firmware/nvidia/ga107/acr/ucode_ahesasc.bin was added
  /lib/firmware/nvidia/ga107/acr/ucode_asb.bin was added
  /lib/firmware/nvidia/ga107/acr/ucode_unload.bin was added
  /lib/firmware/nvidia/ga107/gr was added
  /lib/firmware/nvidia/ga107/gr/fecs_bl.bin was added
  /lib/firmware/nvidia/ga107/gr/fecs_sig.bin was added
  /lib/firmware/nvidia/ga107/gr/gpccs_bl.bin was added
  /lib/firmware/nvidia/ga107/gr/gpccs_sig.bin was added
  /lib/firmware/nvidia/ga107/gr/NET_img.bin was added
  /lib/firmware/nvidia/ga107/nvdec was added
  /lib/firmware/nvidia/ga107/nvdec/scrubber.bin was added
  /lib/firmware/nvidia/ga107/sec2 was added
  /lib/firmware/nvidia/ga107/sec2/desc.bin was added
  /lib/firmware/nvidia/ga107/sec2/hs_bl_sig.bin was added
  /lib/firmware/nvidia/ga107/sec2/image.bin was added
  /lib/firmware/nvidia/ga107/sec2/sig.bin was added
  /lib/firmware/rtl_bt/rtl8852bu_config.bin was added
  /lib/firmware/rtl_bt/rtl8852bu_fw.bin was added

--===============1237857480147002932==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-linux-firmware-upgrade-20220310-20220411.patch"

From 9d7ef8dd2563a2edb2d7aa79c2ea5b47c6968074 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Apr 2022 17:45:13 +0000
Subject: [PATCH] linux-firmware: upgrade 20220310 -> 20220411

---
 ...20220310.bb => linux-firmware_20220411.bb} | 325 +++++++++++++++++-
 1 file changed, 323 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220310.bb => linux-firmware_20220411.bb} (80%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220310.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb
similarity index 80%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20220310.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb
index fa0f906db0..f06ed6e262 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220310.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb
@@ -1,3 +1,324 @@
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
+# @@ -3012,8 +3012,10 @@
+#  Link: brcm/brcmfmac43455-sdio.Raspberry\ Pi\ Foundation-Raspberry\ Pi\ Compute\ Module\ 4.txt -> brcmfmac43455-sdio.raspberrypi,4-model-b.txt
+#  File: "brcm/brcmfmac43455-sdio.MINIX-NEO Z83-4.txt"
+#  File: "brcm/brcmfmac4356-pcie.gpd-win-pocket.txt"
+# -File: brcm/brcmfmac4356-sdio.vamrs,rock960.txt
+# -Link: brcm/brcmfmac4356-sdio.khadas,vim2.txt -> brcmfmac4356-sdio.vamrs,rock960.txt
+# +File: brcm/brcmfmac4356-sdio.AP6356S.txt
+# +Link: brcm/brcmfmac4356-sdio.firefly,firefly-rk3399.txt -> brcmfmac4356-sdio.AP6356S.txt
+# +Link: brcm/brcmfmac4356-sdio.khadas,vim2.txt -> brcmfmac4356-sdio.AP6356S.txt
+# +Link: brcm/brcmfmac4356-sdio.vamrs,rock960.txt -> brcmfmac4356-sdio.AP6356S.txt
+#  
+#  Licence: GPLv2. See GPL-2 for details.
+#  
+# @@ -3885,13 +3887,13 @@
+#  File: intel/ibt-12-16.sfi
+#  Version: BT_WindStormPeak_REL1299
+#  File: intel/ibt-17-16-1.sfi
+# -Version: BT_JeffersonPeak_B0_B0_REL20142
+# +Version: BT_JeffersonPeak_B0_B0_REL20182
+#  File: intel/ibt-17-16-1.ddc
+# -Version: BT_JeffersonPeak_B0_B0_REL20142
+# +Version: BT_JeffersonPeak_B0_B0_REL20182
+#  File: intel/ibt-17-2.sfi
+# -Version: BT_JeffersonPeak_B0_B0_REL20142
+# +Version: BT_JeffersonPeak_B0_B0_REL20182
+#  File: intel/ibt-17-2.ddc
+# -Version: BT_JeffersonPeak_B0_B0_REL20142
+# +Version: BT_JeffersonPeak_B0_B0_REL20182
+#  File: intel/ibt-17-0-1.sfi
+#  Version: BT_JeffersonPeak_A0_B0_REL0201
+#  File: intel/ibt-17-0-1.ddc
+# @@ -3901,13 +3903,13 @@
+#  File: intel/ibt-17-1.ddc
+#  Version: BT_JeffersonPeak_A0_B0_REL0201
+#  File: intel/ibt-18-16-1.sfi
+# -Version: BT_ThunderPeak_B0_B0_REL20142
+# +Version: BT_ThunderPeak_B0_B0_REL20182
+#  File: intel/ibt-18-16-1.ddc
+# -Version: BT_ThunderPeak_B0_B0_REL20142
+# +Version: BT_ThunderPeak_B0_B0_REL20182
+#  File: intel/ibt-18-2.sfi
+# -Version: BT_ThunderPeak_B0_B0_REL20142
+# +Version: BT_ThunderPeak_B0_B0_REL20182
+#  File: intel/ibt-18-2.ddc
+# -Version: BT_ThunderPeak_B0_B0_REL20142
+# +Version: BT_ThunderPeak_B0_B0_REL20182
+#  File: intel/ibt-18-0-1.sfi
+#  Version: BT_ThunderPeak_A0_B0_REL0201
+#  File: intel/ibt-18-0-1.ddc
+# @@ -3917,92 +3919,92 @@
+#  File: intel/ibt-18-1.ddc
+#  Version: BT_ThunderPeak_A0_B0_REL0201
+#  File:intel/ibt-20-0-3.sfi
+# -Version: BT_CyclonePeak_A0_REL37758
+# +Version: BT_CyclonePeak_A0_REL41522
+#  File:intel/ibt-20-0-3.ddc
+# -Version: BT_CyclonePeak_A0_REL37758
+# +Version: BT_CyclonePeak_A0_REL41522
+#  File:intel/ibt-20-1-3.sfi
+# -Version: BT_CyclonePeak_A0_REL37758
+# +Version: BT_CyclonePeak_A0_REL41522
+#  File:intel/ibt-20-1-3.ddc
+# -Version: BT_CyclonePeak_A0_REL37758
+# +Version: BT_CyclonePeak_A0_REL41522
+#  File:intel/ibt-20-1-4.sfi
+# -Version: BT_CyclonePeak_A0_REL37758
+# +Version: BT_CyclonePeak_A0_REL41522
+#  File:intel/ibt-20-1-4.ddc
+# -Version: BT_CyclonePeak_A0_REL37758
+# +Version: BT_CyclonePeak_A0_REL41522
+#  File:intel/ibt-19-0-0.sfi
+# -Version: BT_Quasar_REL37758
+# +Version: BT_Quasar_REL41522
+#  File:intel/ibt-19-0-0.ddc
+# -Version: BT_Quasar_REL37758
+# +Version: BT_Quasar_REL41522
+#  File:intel/ibt-19-0-1.sfi
+# -Version: BT_Quasar_REL37758
+# +Version: BT_Quasar_REL41522
+#  File:intel/ibt-19-0-1.ddc
+# -Version: BT_Quasar_REL37758
+# +Version: BT_Quasar_REL41522
+#  File:intel/ibt-19-0-4.sfi
+# -Version: BT_HarrisonPeak_REL37758
+# +Version: BT_HarrisonPeak_REL41522
+#  File:intel/ibt-19-0-4.ddc
+# -Version: BT_HarrisonPeak_REL37758
+# +Version: BT_HarrisonPeak_REL41522
+#  File:intel/ibt-19-16-4.sfi
+# -Version: BT_HarrisonPeak_REL37758
+# +Version: BT_HarrisonPeak_REL41522
+#  File:intel/ibt-19-16-4.ddc
+# -Version: BT_HarrisonPeak_REL37758
+# +Version: BT_HarrisonPeak_REL41522
+#  File:intel/ibt-19-32-1.sfi
+# -Version: BT_HarrisonPeak_REL37758
+# +Version: BT_HarrisonPeak_REL41522
+#  File:intel/ibt-19-32-1.ddc
+# -Version: BT_HarrisonPeak_REL37758
+# +Version: BT_HarrisonPeak_REL41522
+#  File:intel/ibt-19-32-0.sfi
+# -Version: BT_HarrisonPeak_REL37758
+# +Version: BT_HarrisonPeak_REL41522
+#  File:intel/ibt-19-32-0.ddc
+# -Version: BT_HarrisonPeak_REL37758
+# +Version: BT_HarrisonPeak_REL41522
+#  File:intel/ibt-19-32-4.sfi
+# -Version: BT_HarrisonPeak_REL37758
+# +Version: BT_HarrisonPeak_REL41522
+#  File:intel/ibt-19-32-4.ddc
+# -Version: BT_HarrisonPeak_REL37758
+# +Version: BT_HarrisonPeak_REL41522
+#  File:intel/ibt-19-240-1.sfi
+# -Version: BT_HarrisonPeak_REL37758
+# +Version: BT_HarrisonPeak_REL41522
+#  File:intel/ibt-19-240-1.ddc
+# -Version: BT_HarrisonPeak_REL37758
+# +Version: BT_HarrisonPeak_REL41522
+#  File:intel/ibt-19-240-4.sfi
+# -Version: BT_HarrisonPeak_REL37758
+# +Version: BT_HarrisonPeak_REL41522
+#  File:intel/ibt-19-240-4.ddc
+# -Version: BT_HarrisonPeak_REL37758
+# +Version: BT_HarrisonPeak_REL41522
+#  File:intel/ibt-0041-0041.sfi
+# -Version: BT_TyphoonPeak_REL38020
+# +Version: BT_TyphoonPeak_REL41819
+#  File:intel/ibt-0041-0041.ddc
+# -Version: BT_TyphoonPeak_REL38020
+# +Version: BT_TyphoonPeak_REL41819
+#  File:intel/ibt-0040-0041.sfi
+# -Version: BT_Solar_GfP2_REL38020
+# +Version: BT_Solar_GfP2_REL41819
+#  File:intel/ibt-0040-0041.ddc
+# -Version: BT_Solar_GfP2_REL38020
+# +Version: BT_Solar_GfP2_REL41819
+#  File:intel/ibt-1040-0041.sfi
+# -Version: BT_SolarF_GfP2_REL38020
+# +Version: BT_SolarF_GfP2_REL41819
+#  File:intel/ibt-1040-0041.ddc
+# -Version: BT_SolarF_GfP2_REL38020
+# +Version: BT_SolarF_GfP2_REL41819
+#  
+#  File:intel/ibt-0040-1020.sfi
+# -Version: BT_Solar_JfP1_REL38020
+# +Version: BT_Solar_JfP1_REL41819
+#  File:intel/ibt-0040-1020.ddc
+# -Version: BT_Solar_JfP1_REL38020
+# +Version: BT_Solar_JfP1_REL41819
+#  File:intel/ibt-1040-1020.sfi
+# -Version: BT_SolarF_JfP1_REL38020
+# +Version: BT_SolarF_JfP1_REL41819
+#  File:intel/ibt-1040-1020.ddc
+# -Version: BT_SolarF_JfP1_REL38020
+# +Version: BT_SolarF_JfP1_REL41819
+#  
+#  File:intel/ibt-0040-2120.sfi
+# -Version: BT_Solar_JfP2_REL38020
+# +Version: BT_Solar_JfP2_REL41819
+#  File:intel/ibt-0040-2120.ddc
+# -Version: BT_Solar_JfP2_REL38020
+# +Version: BT_Solar_JfP2_REL41819
+#  File:intel/ibt-1040-2120.sfi
+# -Version: BT_SolarF_JfP2_REL38020
+# +Version: BT_SolarF_JfP2_REL41819
+#  File:intel/ibt-1040-2120.ddc
+# -Version: BT_SolarF_JfP2_REL38020
+# +Version: BT_SolarF_JfP2_REL41819
+#  
+#  File:intel/ibt-0040-4150.sfi
+# -Version: BT_Solar_HrP2_REL38020
+# +Version: BT_Solar_HrP2_REL41819
+#  File:intel/ibt-0040-4150.ddc
+# -Version: BT_Solar_HrP2_REL38020
+# +Version: BT_Solar_HrP2_REL41819
+#  File:intel/ibt-1040-4150.sfi
+# -Version: BT_SolarF_HrP2_REL38020
+# +Version: BT_SolarF_HrP2_REL41819
+#  File:intel/ibt-1040-4150.ddc
+# -Version: BT_SolarF_HrP2_REL38020
+# +Version: BT_SolarF_HrP2_REL41819
+#  
+#  Licence: Redistributable. See LICENCE.ibt_firmware for details
+#  
+# @@ -4033,6 +4035,8 @@
+#  File: rtl_bt/rtl8822cs_config.bin
+#  File: rtl_bt/rtl8852au_fw.bin
+#  File: rtl_bt/rtl8852au_config.bin
+# +File: rtl_bt/rtl8852bu_fw.bin
+# +File: rtl_bt/rtl8852bu_config.bin
+#  
+#  Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
+#  
+# @@ -4130,9 +4134,9 @@
+#  File: amd-ucode/microcode_amd_fam16h.bin
+#  Version: 2014-10-28
+#  File: amd-ucode/microcode_amd_fam17h.bin
+# -Version: 2019-12-18
+# +Version: 2022-04-08
+#  File: amd-ucode/microcode_amd_fam19h.bin
+# -Version: 2022-02-14
+# +Version: 2022-04-08
+#  
+#  License: Redistributable. See LICENSE.amd-ucode for details
+#  
+# @@ -5178,6 +5182,71 @@
+#  Link: nvidia/tu117/sec2/desc.bin -> ../../tu116/sec2/desc.bin
+#  Link: nvidia/tu117/sec2/image.bin -> ../../tu116/sec2/image.bin
+#  Link: nvidia/tu117/sec2/sig.bin -> ../../tu116/sec2/sig.bin
+# +File: nvidia/ga102/acr/ucode_ahesasc.bin
+# +File: nvidia/ga102/acr/ucode_asb.bin
+# +File: nvidia/ga102/acr/ucode_unload.bin
+# +File: nvidia/ga102/gr/fecs_bl.bin
+# +File: nvidia/ga102/gr/fecs_sig.bin
+# +File: nvidia/ga102/gr/gpccs_bl.bin
+# +File: nvidia/ga102/gr/gpccs_sig.bin
+# +File: nvidia/ga102/gr/NET_img.bin
+# +File: nvidia/ga102/nvdec/scrubber.bin
+# +File: nvidia/ga102/sec2/desc.bin
+# +File: nvidia/ga102/sec2/hs_bl_sig.bin
+# +File: nvidia/ga102/sec2/image.bin
+# +File: nvidia/ga102/sec2/sig.bin
+# +Link: nvidia/ga103/acr/ucode_ahesasc.bin -> ../../ga102/acr/ucode_ahesasc.bin
+# +Link: nvidia/ga103/acr/ucode_asb.bin -> ../../ga102/acr/ucode_asb.bin
+# +Link: nvidia/ga103/acr/ucode_unload.bin -> ../../ga102/acr/ucode_unload.bin
+# +File: nvidia/ga103/gr/fecs_bl.bin
+# +File: nvidia/ga103/gr/fecs_sig.bin
+# +File: nvidia/ga103/gr/gpccs_bl.bin
+# +File: nvidia/ga103/gr/gpccs_sig.bin
+# +File: nvidia/ga103/gr/NET_img.bin
+# +Link: nvidia/ga103/nvdec/scrubber.bin -> ../../ga102/nvdec/scrubber.bin
+# +Link: nvidia/ga103/sec2/desc.bin -> ../../ga102/sec2/desc.bin
+# +Link: nvidia/ga103/sec2/hs_bl_sig.bin -> ../../ga102/sec2/hs_bl_sig.bin
+# +Link: nvidia/ga103/sec2/image.bin -> ../../ga102/sec2/image.bin
+# +Link: nvidia/ga103/sec2/sig.bin -> ../../ga102/sec2/sig.bin
+# +Link: nvidia/ga104/acr/ucode_ahesasc.bin -> ../../ga102/acr/ucode_ahesasc.bin
+# +Link: nvidia/ga104/acr/ucode_asb.bin -> ../../ga102/acr/ucode_asb.bin
+# +Link: nvidia/ga104/acr/ucode_unload.bin -> ../../ga102/acr/ucode_unload.bin
+# +File: nvidia/ga104/gr/fecs_bl.bin
+# +File: nvidia/ga104/gr/fecs_sig.bin
+# +File: nvidia/ga104/gr/gpccs_bl.bin
+# +File: nvidia/ga104/gr/gpccs_sig.bin
+# +File: nvidia/ga104/gr/NET_img.bin
+# +Link: nvidia/ga104/nvdec/scrubber.bin -> ../../ga102/nvdec/scrubber.bin
+# +Link: nvidia/ga104/sec2/desc.bin -> ../../ga102/sec2/desc.bin
+# +Link: nvidia/ga104/sec2/hs_bl_sig.bin -> ../../ga102/sec2/hs_bl_sig.bin
+# +Link: nvidia/ga104/sec2/image.bin -> ../../ga102/sec2/image.bin
+# +Link: nvidia/ga104/sec2/sig.bin -> ../../ga102/sec2/sig.bin
+# +Link: nvidia/ga106/acr/ucode_ahesasc.bin -> ../../ga102/acr/ucode_ahesasc.bin
+# +Link: nvidia/ga106/acr/ucode_asb.bin -> ../../ga102/acr/ucode_asb.bin
+# +Link: nvidia/ga106/acr/ucode_unload.bin -> ../../ga102/acr/ucode_unload.bin
+# +File: nvidia/ga106/gr/fecs_bl.bin
+# +File: nvidia/ga106/gr/fecs_sig.bin
+# +File: nvidia/ga106/gr/gpccs_bl.bin
+# +File: nvidia/ga106/gr/gpccs_sig.bin
+# +File: nvidia/ga106/gr/NET_img.bin
+# +Link: nvidia/ga106/nvdec/scrubber.bin -> ../../ga102/nvdec/scrubber.bin
+# +Link: nvidia/ga106/sec2/desc.bin -> ../../ga102/sec2/desc.bin
+# +Link: nvidia/ga106/sec2/hs_bl_sig.bin -> ../../ga102/sec2/hs_bl_sig.bin
+# +Link: nvidia/ga106/sec2/image.bin -> ../../ga102/sec2/image.bin
+# +Link: nvidia/ga106/sec2/sig.bin -> ../../ga102/sec2/sig.bin
+# +Link: nvidia/ga107/acr/ucode_ahesasc.bin -> ../../ga102/acr/ucode_ahesasc.bin
+# +Link: nvidia/ga107/acr/ucode_asb.bin -> ../../ga102/acr/ucode_asb.bin
+# +Link: nvidia/ga107/acr/ucode_unload.bin -> ../../ga102/acr/ucode_unload.bin
+# +File: nvidia/ga107/gr/fecs_bl.bin
+# +File: nvidia/ga107/gr/fecs_sig.bin
+# +File: nvidia/ga107/gr/gpccs_bl.bin
+# +File: nvidia/ga107/gr/gpccs_sig.bin
+# +File: nvidia/ga107/gr/NET_img.bin
+# +Link: nvidia/ga107/nvdec/scrubber.bin -> ../../ga102/nvdec/scrubber.bin
+# +Link: nvidia/ga107/sec2/desc.bin -> ../../ga102/sec2/desc.bin
+# +Link: nvidia/ga107/sec2/hs_bl_sig.bin -> ../../ga102/sec2/hs_bl_sig.bin
+# +Link: nvidia/ga107/sec2/image.bin -> ../../ga102/sec2/image.bin
+# +Link: nvidia/ga107/sec2/sig.bin -> ../../ga102/sec2/sig.bin
+#  
+#  File: nvidia/tu10x/typec/ccg_primary.cyacd
+#  File: nvidia/tu10x/typec/ccg_secondary.cyacd
+# @@ -5420,9 +5489,9 @@
+#  Driver: mt7921 - MediaTek MT7921 Wireless MACs
+#  
+#  File: mediatek/WIFI_MT7961_patch_mcu_1_2_hdr.bin
+# -Version: 20220209150832a
+# +Version: 20220311230842a
+#  File: mediatek/WIFI_RAM_CODE_MT7961_1.bin
+# -Version: 20220209150915
+# +Version: 20220311230931
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -5431,7 +5500,7 @@
+#  Driver: mt7921 - MediaTek MT7921 bluetooth chipset
+#  
+#  File: mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin
+# -Version: 20220209151054
+# +Version: 20220311231139
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -5880,7 +5949,8 @@
+#  
+#  License: Redistributable. See LICENSE.ice for details
+#  
+# -File: intel/ice/ddp-comms/ice_comms-1.3.20.0.pkg
+# +File: intel/ice/ddp-comms/ice_comms-1.3.31.0.pkg
+# +File: intel/ice/ddp-wireless_edge/ice_wireless_edge-1.3.7.0.pkg
+#  
+#  License: Redistributable. See LICENSE.ice_enhanced for details
+#  
+# 
+#
+
 SUMMARY = "Firmware files for use with Linux kernel"
 HOMEPAGE = "https://www.kernel.org/"
 DESCRIPTION = "Linux firmware is a package distributed alongside the Linux kernel \
@@ -132,7 +453,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=45a9c4a92d152e9495db81e1192f2bdc \
+                    file://WHENCE;md5=4cf67d71a21887c682c3989a4318745e \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -205,7 +526,7 @@ PE = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "5938ee717b2023b48f6bfcf344b40ddc947e3e22c0bc36d4c3418f90fea68182"
+SRC_URI[sha256sum] = "020b11f6412f4956f5a6f98de7d41867d2b30ea0ce81b1e2d206ec9840363849"
 
 inherit allarch
 
-- 
2.27.0


--===============1237857480147002932==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/linux-firmware: SRC_URI changed from "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20220310.tar.xz" to "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20220411.tar.xz"
packages/all-poky-linux/linux-firmware: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: FILELIST: added "/lib/firmware/brcm/brcmfmac4356-sdio.firefly,firefly-rk3399.txt /lib/firmware/brcm/brcmfmac4356-sdio.AP6356S.txt"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PKGSIZE changed from 588718 to 588770 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2-mips: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2-mips: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-gplv2-license: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-gplv2-license: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PKGSIZE changed from 2600222 to 2600382 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PKGSIZE changed from 2396855 to 2412595 (+1%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGSIZE changed from 16417104 to 16480004 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-ice: FILELIST: removed "/lib/firmware/intel/ice/ddp-comms/ice_comms-1.3.20.0.pkg", added "/lib/firmware/intel/ice/ddp-wireless_edge/ice_wireless_edge-1.3.7.0.pkg /lib/firmware/intel/ice/ddp-comms/ice_comms-1.3.31.0.pkg"
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PKGSIZE changed from 1323660 to 2069624 (+56%)
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-license: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u-license: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u-license: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: FILELIST: added "/lib/firmware/nvidia/ga106/sec2/hs_bl_sig.bin /lib/firmware/nvidia/ga104/sec2/desc.bin /lib/firmware/nvidia/ga107/sec2/sig.bin /lib/firmware/nvidia/ga103/gr/gpccs_bl.bin /lib/firmware/nvidia/ga103/acr/ucode_unload.bin /lib/firmware/nvidia/ga104/sec2/sig.bin /lib/firmware/nvidia/ga104/gr/gpccs_bl.bin /lib/firmware/nvidia/ga104/sec2/image.bin /lib/firmware/nvidia/ga102/sec2/desc.bin /lib/firmware/nvidia/ga103/nvdec/scrubber.bin /lib/firmware/nvidia/ga106/gr/NET_img.bin /lib/firmware/nvidia/ga103/gr/fecs_sig.bin /lib/firmware/nvidia/ga107/sec2/hs_bl_sig.bin /lib/firmware/nvidia/ga106/acr/ucode_unload.bin /lib/firmware/nvidia/ga107/sec2/desc.bin /lib/firmware/nvidia/ga104/acr/ucode_ahesasc.bin /lib/firmware/nvidia/ga103/gr/gpccs_sig.bin /lib/firmware/nvidia/ga106/gr/fecs_sig.bin /lib/firmware/nvidia/ga104/gr/NET_img.bin /lib/firmware/nvidia/ga102/acr/ucode_ahesasc.bin /lib/firmware/nvidia/ga102/nvdec/scrub
 ber.bin /lib/firmware/nvidia/ga102/acr/ucode_unload.bin /lib/firmware/nvidia/ga103/gr/fecs_bl.bin /lib/firmware/nvidia/ga107/gr/NET_img.bin /lib/firmware/nvidia/ga103/acr/ucode_asb.bin /lib/firmware/nvidia/ga104/gr/gpccs_sig.bin /lib/firmware/nvidia/ga104/gr/fecs_bl.bin /lib/firmware/nvidia/ga104/acr/ucode_unload.bin /lib/firmware/nvidia/ga106/sec2/image.bin /lib/firmware/nvidia/ga104/sec2/hs_bl_sig.bin /lib/firmware/nvidia/ga103/acr/ucode_ahesasc.bin /lib/firmware/nvidia/ga103/sec2/sig.bin /lib/firmware/nvidia/ga103/sec2/desc.bin /lib/firmware/nvidia/ga107/acr/ucode_ahesasc.bin /lib/firmware/nvidia/ga106/acr/ucode_ahesasc.bin /lib/firmware/nvidia/ga102/sec2/hs_bl_sig.bin /lib/firmware/nvidia/ga102/sec2/image.bin /lib/firmware/nvidia/ga102/acr/ucode_asb.bin /lib/firmware/nvidia/ga104/gr/fecs_sig.bin /lib/firmware/nvidia/ga102/gr/gpccs_sig.bin /lib/firmware/nvidia/ga106/sec2/sig.bin /lib/firmware/nvidia/ga102/gr/fecs_sig.bin /lib/firmware/nvidia/ga107/gr/gpccs_sig.bin /lib/firmware/n
 vidia/ga107/gr/fecs_sig.bin /lib/firmware/nvidia/ga106/nvdec/scrubber.bin /lib/firmware/nvidia/ga107/gr/fecs_bl.bin /lib/firmware/nvidia/ga102/gr/fecs_bl.bin /lib/firmware/nvidia/ga107/gr/gpccs_bl.bin /lib/firmware/nvidia/ga104/acr/ucode_asb.bin /lib/firmware/nvidia/ga102/gr/gpccs_bl.bin /lib/firmware/nvidia/ga104/nvdec/scrubber.bin /lib/firmware/nvidia/ga107/sec2/image.bin /lib/firmware/nvidia/ga106/gr/gpccs_sig.bin /lib/firmware/nvidia/ga107/nvdec/scrubber.bin /lib/firmware/nvidia/ga107/acr/ucode_asb.bin /lib/firmware/nvidia/ga103/sec2/hs_bl_sig.bin /lib/firmware/nvidia/ga106/gr/fecs_bl.bin /lib/firmware/nvidia/ga106/gr/gpccs_bl.bin /lib/firmware/nvidia/ga103/gr/NET_img.bin /lib/firmware/nvidia/ga106/sec2/desc.bin /lib/firmware/nvidia/ga107/acr/ucode_unload.bin /lib/firmware/nvidia/ga102/gr/NET_img.bin /lib/firmware/nvidia/ga106/acr/ucode_asb.bin /lib/firmware/nvidia/ga103/sec2/image.bin /lib/firmware/nvidia/ga102/sec2/sig.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PKGSIZE changed from 1820713 to 2758353 (+51%)
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-src: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-src: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGSIZE changed from 188043 to 191707 (+2%)
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware: PV changed from "20220310" to "20220411"
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: added "/lib/firmware/rtl_bt/rtl8852bu_config.bin /lib/firmware/rtl_bt/rtl8852bu_fw.bin"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGV changed from 20220310 [default] to 20220411 [default]
packages/all-poky-linux/linux-firmware/linux-firmware: PKGSIZE changed from 282387182 to 282449696 (+0%)
Changes to packages/all-poky-linux/linux-firmware (sysroot):
  /lib/firmware/brcm/brcmfmac4356-sdio.khadas,vim2.txt changed symlink target from brcmfmac4356-sdio.vamrs,rock960.txt to brcmfmac4356-sdio.AP6356S.txt
  /lib/firmware/brcm/brcmfmac4356-sdio.vamrs,rock960.txt changed type from file to symlink
  /lib/firmware/brcm/brcmfmac4356-sdio.vamrs,rock960.txt changed permissions from rw-r--r-- to rwxrwxrwx
  /lib/firmware/brcm/brcmfmac4356-sdio.vamrs,rock960.txt changed symlink target from None to brcmfmac4356-sdio.AP6356S.txt
  /lib/firmware/intel/ice/ddp-comms/ice_comms-1.3.20.0.pkg moved to /lib/firmware/intel/ice/ddp-comms/ice_comms-1.3.31.0.pkg
  /lib/firmware/brcm/brcmfmac4356-sdio.AP6356S.txt was added
  /lib/firmware/brcm/brcmfmac4356-sdio.firefly,firefly-rk3399.txt was added
  /lib/firmware/intel/ice/ddp-wireless_edge was added
  /lib/firmware/intel/ice/ddp-wireless_edge/ice_wireless_edge-1.3.7.0.pkg was added
  /lib/firmware/nvidia/ga102 was added
  /lib/firmware/nvidia/ga102/acr was added
  /lib/firmware/nvidia/ga102/acr/ucode_ahesasc.bin was added
  /lib/firmware/nvidia/ga102/acr/ucode_asb.bin was added
  /lib/firmware/nvidia/ga102/acr/ucode_unload.bin was added
  /lib/firmware/nvidia/ga102/gr was added
  /lib/firmware/nvidia/ga102/gr/fecs_bl.bin was added
  /lib/firmware/nvidia/ga102/gr/fecs_sig.bin was added
  /lib/firmware/nvidia/ga102/gr/gpccs_bl.bin was added
  /lib/firmware/nvidia/ga102/gr/gpccs_sig.bin was added
  /lib/firmware/nvidia/ga102/gr/NET_img.bin was added
  /lib/firmware/nvidia/ga102/nvdec was added
  /lib/firmware/nvidia/ga102/nvdec/scrubber.bin was added
  /lib/firmware/nvidia/ga102/sec2 was added
  /lib/firmware/nvidia/ga102/sec2/desc.bin was added
  /lib/firmware/nvidia/ga102/sec2/hs_bl_sig.bin was added
  /lib/firmware/nvidia/ga102/sec2/image.bin was added
  /lib/firmware/nvidia/ga102/sec2/sig.bin was added
  /lib/firmware/nvidia/ga103 was added
  /lib/firmware/nvidia/ga103/acr was added
  /lib/firmware/nvidia/ga103/acr/ucode_ahesasc.bin was added
  /lib/firmware/nvidia/ga103/acr/ucode_asb.bin was added
  /lib/firmware/nvidia/ga103/acr/ucode_unload.bin was added
  /lib/firmware/nvidia/ga103/gr was added
  /lib/firmware/nvidia/ga103/gr/fecs_bl.bin was added
  /lib/firmware/nvidia/ga103/gr/fecs_sig.bin was added
  /lib/firmware/nvidia/ga103/gr/gpccs_bl.bin was added
  /lib/firmware/nvidia/ga103/gr/gpccs_sig.bin was added
  /lib/firmware/nvidia/ga103/gr/NET_img.bin was added
  /lib/firmware/nvidia/ga103/nvdec was added
  /lib/firmware/nvidia/ga103/nvdec/scrubber.bin was added
  /lib/firmware/nvidia/ga103/sec2 was added
  /lib/firmware/nvidia/ga103/sec2/desc.bin was added
  /lib/firmware/nvidia/ga103/sec2/hs_bl_sig.bin was added
  /lib/firmware/nvidia/ga103/sec2/image.bin was added
  /lib/firmware/nvidia/ga103/sec2/sig.bin was added
  /lib/firmware/nvidia/ga104 was added
  /lib/firmware/nvidia/ga104/acr was added
  /lib/firmware/nvidia/ga104/acr/ucode_ahesasc.bin was added
  /lib/firmware/nvidia/ga104/acr/ucode_asb.bin was added
  /lib/firmware/nvidia/ga104/acr/ucode_unload.bin was added
  /lib/firmware/nvidia/ga104/gr was added
  /lib/firmware/nvidia/ga104/gr/fecs_bl.bin was added
  /lib/firmware/nvidia/ga104/gr/fecs_sig.bin was added
  /lib/firmware/nvidia/ga104/gr/gpccs_bl.bin was added
  /lib/firmware/nvidia/ga104/gr/gpccs_sig.bin was added
  /lib/firmware/nvidia/ga104/gr/NET_img.bin was added
  /lib/firmware/nvidia/ga104/nvdec was added
  /lib/firmware/nvidia/ga104/nvdec/scrubber.bin was added
  /lib/firmware/nvidia/ga104/sec2 was added
  /lib/firmware/nvidia/ga104/sec2/desc.bin was added
  /lib/firmware/nvidia/ga104/sec2/hs_bl_sig.bin was added
  /lib/firmware/nvidia/ga104/sec2/image.bin was added
  /lib/firmware/nvidia/ga104/sec2/sig.bin was added
  /lib/firmware/nvidia/ga106 was added
  /lib/firmware/nvidia/ga106/acr was added
  /lib/firmware/nvidia/ga106/acr/ucode_ahesasc.bin was added
  /lib/firmware/nvidia/ga106/acr/ucode_asb.bin was added
  /lib/firmware/nvidia/ga106/acr/ucode_unload.bin was added
  /lib/firmware/nvidia/ga106/gr was added
  /lib/firmware/nvidia/ga106/gr/fecs_bl.bin was added
  /lib/firmware/nvidia/ga106/gr/fecs_sig.bin was added
  /lib/firmware/nvidia/ga106/gr/gpccs_bl.bin was added
  /lib/firmware/nvidia/ga106/gr/gpccs_sig.bin was added
  /lib/firmware/nvidia/ga106/gr/NET_img.bin was added
  /lib/firmware/nvidia/ga106/nvdec was added
  /lib/firmware/nvidia/ga106/nvdec/scrubber.bin was added
  /lib/firmware/nvidia/ga106/sec2 was added
  /lib/firmware/nvidia/ga106/sec2/desc.bin was added
  /lib/firmware/nvidia/ga106/sec2/hs_bl_sig.bin was added
  /lib/firmware/nvidia/ga106/sec2/image.bin was added
  /lib/firmware/nvidia/ga106/sec2/sig.bin was added
  /lib/firmware/nvidia/ga107 was added
  /lib/firmware/nvidia/ga107/acr was added
  /lib/firmware/nvidia/ga107/acr/ucode_ahesasc.bin was added
  /lib/firmware/nvidia/ga107/acr/ucode_asb.bin was added
  /lib/firmware/nvidia/ga107/acr/ucode_unload.bin was added
  /lib/firmware/nvidia/ga107/gr was added
  /lib/firmware/nvidia/ga107/gr/fecs_bl.bin was added
  /lib/firmware/nvidia/ga107/gr/fecs_sig.bin was added
  /lib/firmware/nvidia/ga107/gr/gpccs_bl.bin was added
  /lib/firmware/nvidia/ga107/gr/gpccs_sig.bin was added
  /lib/firmware/nvidia/ga107/gr/NET_img.bin was added
  /lib/firmware/nvidia/ga107/nvdec was added
  /lib/firmware/nvidia/ga107/nvdec/scrubber.bin was added
  /lib/firmware/nvidia/ga107/sec2 was added
  /lib/firmware/nvidia/ga107/sec2/desc.bin was added
  /lib/firmware/nvidia/ga107/sec2/hs_bl_sig.bin was added
  /lib/firmware/nvidia/ga107/sec2/image.bin was added
  /lib/firmware/nvidia/ga107/sec2/sig.bin was added
  /lib/firmware/rtl_bt/rtl8852bu_config.bin was added
  /lib/firmware/rtl_bt/rtl8852bu_fw.bin was added

--===============1237857480147002932==--

