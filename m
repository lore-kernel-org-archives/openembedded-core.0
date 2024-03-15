Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E427C54F4F
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 17:00:17 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.1256.1710522016191194179
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 10:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=CV7Y8Dqs;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=1BujePyh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018e430e9f81-4da62234-7368-4669-9b15-83fc775cf2a7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1710522015;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=554nM+0rC92E4pn3JQOJPrpWGASMcU9RqllGMJR0FUU=;
	b=CV7Y8DqsdOnd6OU8CYUckGDZFfOkESxO5G8nO+0hG6h6GdnnN1OSjdoW2SomGgzK
	/5COiqiOtb+6i8waqVENppignAUbJbrihO9KZyqtBT2Wi1nWSI8ltVl0Odawi755DpI
	iBh5X0yi61kG7IwA8kPn33FRVgyNsN23RGm8750E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1710522015;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=554nM+0rC92E4pn3JQOJPrpWGASMcU9RqllGMJR0FUU=;
	b=1BujePyhrv7ASTLIkNzru3i48eTBNj+Jkqhd4KoUWswWmFK7dFn7q8reiJS1LJ2/
	v0kuZ29b2nlOcWP/0lbOfr2xsuZ9y8Y9jTtzmDq+IhkgCPtiq/xqjqNDJzmVqm7pYcV
	V1d0zymd2pbjMvD0xY3eiqVjlDZ12fAW3YeyCM/o=
Content-Type: multipart/mixed; boundary="===============7906585662209000711=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] linux-firmware: upgrading to 20240312 SUCCEEDED
Message-ID: <0101018e430e9f81-4da62234-7368-4669-9b15-83fc775cf2a7-000000@us-west-2.amazonses.com>
Date: Fri, 15 Mar 2024 17:00:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 17:00:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197235

--===============7906585662209000711==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *linux-firmware* to *20240312* has Succeeded.

Next steps:
    - apply the patch: git am 0001-linux-firmware-upgrade-20240220-20240312.patch
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
From 1f6097f7e0ec864c119bf0d3ba0afc37f33cd626 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Mar 2024 14:19:48 +0000
Subject: [PATCH] linux-firmware: upgrade 20240220 -> 20240312

---
 ...20240220.bb => linux-firmware_20240312.bb} | 150 +++++++++++++++++-
 1 file changed, 148 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20240220.bb => linux-firmware_20240312.bb} (92%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20240220.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20240312.bb
similarity index 92%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20240220.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20240312.bb
index 1fd44f4d53..5c3f3b64ee 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20240220.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20240312.bb
@@ -1,3 +1,149 @@
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
+# @@ -824,7 +824,7 @@
+#  Version: 38.755cfdd8.0
+#  
+#  File: iwlwifi-9000-pu-b0-jf-b0-46.ucode
+# -Version: 46.ff18e32a.0
+# +Version: 46.7e3e4b69.0
+#  
+#  File: iwlwifi-9260-th-b0-jf-b0-34.ucode
+#  Version: 34.ba501b11.0
+# @@ -833,7 +833,7 @@
+#  Version: 38.755cfdd8.0
+#  
+#  File: iwlwifi-9260-th-b0-jf-b0-46.ucode
+# -Version: 46.ff18e32a.0
+# +Version: 46.7e3e4b69.0
+#  
+#  File: iwlwifi-cc-a0-50.ucode
+#  Version: 50.3e391d3e.0
+# @@ -1156,6 +1156,18 @@
+#  Licence: Redistributable. See LICENCE.iwlwifi_firmware for details
+#  
+#  Also available from http://wireless.kernel.org/en/users/Drivers/iwlwifi#Firmware
+# +
+# +--------------------------------------------------------------------------
+# +
+# +Driver: atomisp - Intel IPU2 (Image Processing Unit 2) driver
+# +
+# +File: intel/ipu/shisp_2400b0_v21.bin
+# +Version: irci_stable_candrpv_0415_20150423_1753
+# +
+# +File: intel/ipu/shisp_2401a0_v21.bin
+# +Version: irci_stable_candrpv_0415_20150521_0458
+# +
+# +License: Redistributable. See LICENSE.ivsc for details
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -2833,6 +2845,7 @@
+#  File: "brcm/brcmfmac43241b4-sdio.Advantech-MICA-071.txt"
+#  File: "brcm/brcmfmac43241b4-sdio.Intel Corp.-VALLEYVIEW C0 PLATFORM.txt"
+#  File: "brcm/brcmfmac4330-sdio.Prowise-PT301.txt"
+# +File: "brcm/brcmfmac43340-sdio.Insyde-VESPA2.txt"
+#  File: "brcm/brcmfmac43340-sdio.ASUSTeK COMPUTER INC.-TF103CE.txt"
+#  File: "brcm/brcmfmac43340-sdio.meegopad-t08.txt"
+#  File: "brcm/brcmfmac43340-sdio.pov-tab-p1006w-data.txt"
+# @@ -4916,7 +4929,7 @@
+#  Version: DMC API/APB ver 2 release 10 for Meteorlake
+#  
+#  File: i915/mtl_dmc.bin
+# -Version: DMC API/APB ver 2 release 19 for Meteorlake
+# +Version: DMC API/APB ver 2 release 21 for Meteorlake
+#  
+#  File: i915/mtl_guc_70.bin
+#  Version: GuC API/APB ver 70.20.0 for Meteorlake
+# @@ -4926,6 +4939,9 @@
+#  
+#  File: i915/mtl_gsc_1.bin
+#  Version: GSC API/APB v1.0, release 102.0.0.1655, SVN 1 for Meteorlake
+# +
+# +File: i915/xe2lpd_dmc.bin
+# +Version: DMC API/APB ver 2 release 18 for Xe2LPD
+#  
+#  License: Redistributable. See LICENSE.i915 for details
+#  --------------------------------------------------------------------------
+# @@ -5634,9 +5650,9 @@
+#  Driver: mt7921 - MediaTek MT7921 Wireless MACs
+#  
+#  File: mediatek/WIFI_MT7961_patch_mcu_1_2_hdr.bin
+# -Version: 20231109190918a
+# +Version: 20240219110958a
+#  File: mediatek/WIFI_RAM_CODE_MT7961_1.bin
+# -Version: 20231109190959
+# +Version: 20240219111038
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -5645,7 +5661,7 @@
+#  Driver: mt7921 - MediaTek MT7921 bluetooth chipset
+#  
+#  File: mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin
+# -Version: 20231109191416
+# +Version: 20240219111427
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -5654,9 +5670,9 @@
+#  Driver: mt7922 - MediaTek MT7922 Wireless MACs
+#  
+#  File: mediatek/WIFI_MT7922_patch_mcu_1_1_hdr.bin
+# -Version: 20231120183400a
+# +Version: 20240219103244a
+#  File: mediatek/WIFI_RAM_CODE_MT7922_1.bin
+# -Version: 20231120183441
+# +Version: 20240219103337
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -5665,7 +5681,7 @@
+#  Driver: mt7922 - MediaTek MT7922 bluetooth chipset
+#  
+#  File: mediatek/BT_RAM_CODE_MT7922_1_1_hdr.bin
+# -Version: 20231120183620
+# +Version: 20240219103618
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  
+# @@ -7349,6 +7365,26 @@
+#  Link: cirrus/cs35l41-dsp1-spk-prot-17aa231a-r0.bin -> cs35l41-dsp1-spk-prot-17aa22f2-r0.bin
+#  Link: cirrus/cs35l41-dsp1-spk-cali-17aa231a-l0.bin -> cs35l41-dsp1-spk-cali-17aa22f2-l0.bin
+#  Link: cirrus/cs35l41-dsp1-spk-cali-17aa231a-r0.bin -> cs35l41-dsp1-spk-cali-17aa22f2-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-17aa38a9.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-17aa38a9.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-prot-17aa38ab.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +Link: cirrus/cs35l41-dsp1-spk-cali-17aa38ab.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# +File: cirrus/cs35l41-dsp1-spk-prot-17aa38a9-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-17aa38a9-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-17aa38a9-spkid0-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-17aa38a9-spkid0-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-17aa38a9-spkid1-l0.bin -> cs35l41-dsp1-spk-prot-17aa38a9-spkid0-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-17aa38a9-spkid1-l0.bin -> cs35l41-dsp1-spk-cali-17aa38a9-spkid0-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-17aa38a9-spkid1-r0.bin -> cs35l41-dsp1-spk-prot-17aa38a9-spkid0-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-17aa38a9-spkid1-r0.bin -> cs35l41-dsp1-spk-cali-17aa38a9-spkid0-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-17aa38ab-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-17aa38ab-spkid0-l0.bin
+# +File: cirrus/cs35l41-dsp1-spk-prot-17aa38ab-spkid0-r0.bin
+# +File: cirrus/cs35l41-dsp1-spk-cali-17aa38ab-spkid0-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-17aa38ab-spkid1-l0.bin -> cs35l41-dsp1-spk-prot-17aa38ab-spkid0-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-17aa38ab-spkid1-l0.bin -> cs35l41-dsp1-spk-cali-17aa38ab-spkid0-l0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-prot-17aa38ab-spkid1-r0.bin -> cs35l41-dsp1-spk-prot-17aa38ab-spkid0-r0.bin
+# +Link: cirrus/cs35l41-dsp1-spk-cali-17aa38ab-spkid1-r0.bin -> cs35l41-dsp1-spk-cali-17aa38ab-spkid0-r0.bin
+#  Link: cirrus/cs35l41-dsp1-spk-prot-103c8c26.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+#  Link: cirrus/cs35l41-dsp1-spk-cali-103c8c26.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+#  Link: cirrus/cs35l41-dsp1-spk-prot-103c8b42.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+# 
+#
+
 SUMMARY = "Firmware files for use with Linux kernel"
 HOMEPAGE = "https://www.kernel.org/"
 DESCRIPTION = "Linux firmware is a package distributed alongside the Linux kernel \
@@ -151,7 +297,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=${WHENCE_CHKSUM} \
+                    file://WHENCE;md5=514da1cd8b363373030f0c16749feb8d \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
@@ -243,7 +389,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "bf0f239dc0801e9d6bf5d5fb3e2f549575632cf4688f4348184199cb02c2bcd7"
+SRC_URI[sha256sum] = "b2327a54ad1897c828008caf63af5ee15469ba723a5016be58f2b44f07bd4b94"
 
 inherit allarch
 
-- 
2.42.0


--===============7906585662209000711==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/linux-firmware: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware: SRC_URI changed from "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20240220.tar.xz" to "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20240312.tar.xz"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PKGSIZE changed from 82445402 to 82455642 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar5523: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-ar5523: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PKGSIZE changed from 416655 to 418342 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: FILELIST: added "/usr/lib/firmware/brcm/brcmfmac43340-sdio.Insyde-VESPA2.txt"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2x: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2x: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: PKGSIZE changed from 2080918 to 2109778 (+1%)
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: FILELIST: added "/usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38ab.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa38a9-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa38ab-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa38ab-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa38ab-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa38ab-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa38a9.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38ab-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38a9-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38ab-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38a9-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa38a9-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa38a9-spkid0-r0.bin /usr/lib/firmware/cirrus/cs
 35l41-dsp1-spk-prot-17aa38ab-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38ab-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa38a9-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38a9-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38a9-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38a9.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa38ab.wmfw"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cnm-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-cnm-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cnm: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-cnm: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-gplv2-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-gplv2-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGSIZE changed from 27962115 to 28023323 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-i915: FILELIST: added "/usr/lib/firmware/i915/xe2lpd_dmc.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PKGSIZE changed from 6717624 to 6718420 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PKGSIZE changed from 159862680 to 159863536 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek: PKGSIZE changed from 35987488 to 35983904 (-0%)
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mellanox: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-mellanox: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-microchip-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-microchip-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-microchip: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-microchip: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-moxa-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-moxa-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-moxa: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-moxa: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7650: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7650: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x2: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x2: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8987-sdio: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8987-sdio: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-common: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-common: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-pcie: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-pcie: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-sdio: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-sdio: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-common: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-common: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-pcie: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-pcie: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-sdio: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-sdio: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw416-sdio: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw416-sdio: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw612-sdio: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw612-sdio: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-olpc-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-olpc-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-olpc: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-olpc: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-powervr-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-powervr-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-powervr: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-powervr: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-prestera: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-prestera: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a702: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a702: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-modem: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-modem: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-wifi: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-wifi: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-adreno: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-adreno: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-adreno: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-adreno: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-audio: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-audio: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-modem: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-modem: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-wifi: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-wifi: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-adreno: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-adreno: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-audio: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-audio: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-compute: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-compute: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-modem: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-modem: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-wifi: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-wifi: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-adreno: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-adreno: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-thundercomm-db845c-sensors: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-thundercomm-db845c-sensors: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-adreno: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-adreno: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-thundercomm-rb5-sensors: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-thundercomm-rb5-sensors: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-6.0: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-6.0: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-yamato-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-yamato-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qed: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-qed: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-dptx: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-dptx: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-nic: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-nic: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8761: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8761: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8822: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8822: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-src: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-src: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGSIZE changed from 309723 to 311932 (+1%)
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware: PKGSIZE changed from 66167853 to 89233509 (+35%)
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: added "/usr/lib/firmware/intel/ipu/shisp_2400b0_v21.bin /usr/lib/firmware/intel/ipu/shisp_2401a0_v21.bin"
packages/all-poky-linux/linux-firmware/linux-firmware: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGV changed from 20240220 [default] to 20240312 [default]

--===============7906585662209000711==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-linux-firmware-upgrade-20240220-20240312.patch"

RnJvbSAxZjYwOTdmN2UwZWM4NjRjMTE5YmYwZDNiYTBhZmMzN2YzM2NkNjI2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWFyIDIwMjQgMTQ6MTk6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aW51eC1maXJtd2FyZTogdXBncmFkZSAyMDI0MDIyMCAtPiAyMDI0MDMxMgoKLS0tCiAuLi4yMDI0
MDIyMC5iYiA9PiBsaW51eC1maXJtd2FyZV8yMDI0MDMxMi5iYn0gfCAxNTAgKysrKysrKysrKysr
KysrKystCiAxIGZpbGUgY2hhbmdlZCwgMTQ4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS97bGludXgtZmlybXdh
cmVfMjAyNDAyMjAuYmIgPT4gbGludXgtZmlybXdhcmVfMjAyNDAzMTIuYmJ9ICg5MiUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2Fy
ZV8yMDI0MDIyMC5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgt
ZmlybXdhcmVfMjAyNDAzMTIuYmIKc2ltaWxhcml0eSBpbmRleCA5MiUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZV8yMDI0MDIyMC5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJt
d2FyZV8yMDI0MDMxMi5iYgppbmRleCAxZmQ0NGY0ZDUzLi41YzNmM2I2NGVlIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlXzIwMjQw
MjIwLmJiCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgtZmly
bXdhcmVfMjAyNDAzMTIuYmIKQEAgLTEsMyArMSwxNDkgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklM
RVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4K
KyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRo
ZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlm
IG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3Nh
Z2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0
ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0t
LSBXSEVOQ0UKKyMgKysrIFdIRU5DRQorIyBAQCAtODI0LDcgKzgyNCw3IEBACisjICBWZXJzaW9u
OiAzOC43NTVjZmRkOC4wCisjICAKKyMgIEZpbGU6IGl3bHdpZmktOTAwMC1wdS1iMC1qZi1iMC00
Ni51Y29kZQorIyAtVmVyc2lvbjogNDYuZmYxOGUzMmEuMAorIyArVmVyc2lvbjogNDYuN2UzZTRi
NjkuMAorIyAgCisjICBGaWxlOiBpd2x3aWZpLTkyNjAtdGgtYjAtamYtYjAtMzQudWNvZGUKKyMg
IFZlcnNpb246IDM0LmJhNTAxYjExLjAKKyMgQEAgLTgzMyw3ICs4MzMsNyBAQAorIyAgVmVyc2lv
bjogMzguNzU1Y2ZkZDguMAorIyAgCisjICBGaWxlOiBpd2x3aWZpLTkyNjAtdGgtYjAtamYtYjAt
NDYudWNvZGUKKyMgLVZlcnNpb246IDQ2LmZmMThlMzJhLjAKKyMgK1ZlcnNpb246IDQ2LjdlM2U0
YjY5LjAKKyMgIAorIyAgRmlsZTogaXdsd2lmaS1jYy1hMC01MC51Y29kZQorIyAgVmVyc2lvbjog
NTAuM2UzOTFkM2UuMAorIyBAQCAtMTE1Niw2ICsxMTU2LDE4IEBACisjICBMaWNlbmNlOiBSZWRp
c3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLml3bHdpZmlfZmlybXdhcmUgZm9yIGRldGFpbHMKKyMg
IAorIyAgQWxzbyBhdmFpbGFibGUgZnJvbSBodHRwOi8vd2lyZWxlc3Mua2VybmVsLm9yZy9lbi91
c2Vycy9Ecml2ZXJzL2l3bHdpZmkjRmlybXdhcmUKKyMgKworIyArLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
KyMgKworIyArRHJpdmVyOiBhdG9taXNwIC0gSW50ZWwgSVBVMiAoSW1hZ2UgUHJvY2Vzc2luZyBV
bml0IDIpIGRyaXZlcgorIyArCisjICtGaWxlOiBpbnRlbC9pcHUvc2hpc3BfMjQwMGIwX3YyMS5i
aW4KKyMgK1ZlcnNpb246IGlyY2lfc3RhYmxlX2NhbmRycHZfMDQxNV8yMDE1MDQyM18xNzUzCisj
ICsKKyMgK0ZpbGU6IGludGVsL2lwdS9zaGlzcF8yNDAxYTBfdjIxLmJpbgorIyArVmVyc2lvbjog
aXJjaV9zdGFibGVfY2FuZHJwdl8wNDE1XzIwMTUwNTIxXzA0NTgKKyMgKworIyArTGljZW5zZTog
UmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5pdnNjIGZvciBkZXRhaWxzCisjICAKKyMgIC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCisjICAKKyMgQEAgLTI4MzMsNiArMjg0NSw3IEBACisjICBGaWxlOiAi
YnJjbS9icmNtZm1hYzQzMjQxYjQtc2Rpby5BZHZhbnRlY2gtTUlDQS0wNzEudHh0IgorIyAgRmls
ZTogImJyY20vYnJjbWZtYWM0MzI0MWI0LXNkaW8uSW50ZWwgQ29ycC4tVkFMTEVZVklFVyBDMCBQ
TEFURk9STS50eHQiCisjICBGaWxlOiAiYnJjbS9icmNtZm1hYzQzMzAtc2Rpby5Qcm93aXNlLVBU
MzAxLnR4dCIKKyMgK0ZpbGU6ICJicmNtL2JyY21mbWFjNDMzNDAtc2Rpby5JbnN5ZGUtVkVTUEEy
LnR4dCIKKyMgIEZpbGU6ICJicmNtL2JyY21mbWFjNDMzNDAtc2Rpby5BU1VTVGVLIENPTVBVVEVS
IElOQy4tVEYxMDNDRS50eHQiCisjICBGaWxlOiAiYnJjbS9icmNtZm1hYzQzMzQwLXNkaW8ubWVl
Z29wYWQtdDA4LnR4dCIKKyMgIEZpbGU6ICJicmNtL2JyY21mbWFjNDMzNDAtc2Rpby5wb3YtdGFi
LXAxMDA2dy1kYXRhLnR4dCIKKyMgQEAgLTQ5MTYsNyArNDkyOSw3IEBACisjICBWZXJzaW9uOiBE
TUMgQVBJL0FQQiB2ZXIgMiByZWxlYXNlIDEwIGZvciBNZXRlb3JsYWtlCisjICAKKyMgIEZpbGU6
IGk5MTUvbXRsX2RtYy5iaW4KKyMgLVZlcnNpb246IERNQyBBUEkvQVBCIHZlciAyIHJlbGVhc2Ug
MTkgZm9yIE1ldGVvcmxha2UKKyMgK1ZlcnNpb246IERNQyBBUEkvQVBCIHZlciAyIHJlbGVhc2Ug
MjEgZm9yIE1ldGVvcmxha2UKKyMgIAorIyAgRmlsZTogaTkxNS9tdGxfZ3VjXzcwLmJpbgorIyAg
VmVyc2lvbjogR3VDIEFQSS9BUEIgdmVyIDcwLjIwLjAgZm9yIE1ldGVvcmxha2UKKyMgQEAgLTQ5
MjYsNiArNDkzOSw5IEBACisjICAKKyMgIEZpbGU6IGk5MTUvbXRsX2dzY18xLmJpbgorIyAgVmVy
c2lvbjogR1NDIEFQSS9BUEIgdjEuMCwgcmVsZWFzZSAxMDIuMC4wLjE2NTUsIFNWTiAxIGZvciBN
ZXRlb3JsYWtlCisjICsKKyMgK0ZpbGU6IGk5MTUveGUybHBkX2RtYy5iaW4KKyMgK1ZlcnNpb246
IERNQyBBUEkvQVBCIHZlciAyIHJlbGVhc2UgMTggZm9yIFhlMkxQRAorIyAgCisjICBMaWNlbnNl
OiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLmk5MTUgZm9yIGRldGFpbHMKKyMgIC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCisjIEBAIC01NjM0LDkgKzU2NTAsOSBAQAorIyAgRHJpdmVyOiBtdDc5MjEg
LSBNZWRpYVRlayBNVDc5MjEgV2lyZWxlc3MgTUFDcworIyAgCisjICBGaWxlOiBtZWRpYXRlay9X
SUZJX01UNzk2MV9wYXRjaF9tY3VfMV8yX2hkci5iaW4KKyMgLVZlcnNpb246IDIwMjMxMTA5MTkw
OTE4YQorIyArVmVyc2lvbjogMjAyNDAyMTkxMTA5NThhCisjICBGaWxlOiBtZWRpYXRlay9XSUZJ
X1JBTV9DT0RFX01UNzk2MV8xLmJpbgorIyAtVmVyc2lvbjogMjAyMzExMDkxOTA5NTkKKyMgK1Zl
cnNpb246IDIwMjQwMjE5MTExMDM4CisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4g
U2VlIExJQ0VOQ0UubWVkaWF0ZWsgZm9yIGRldGFpbHMuCisjICAKKyMgQEAgLTU2NDUsNyArNTY2
MSw3IEBACisjICBEcml2ZXI6IG10NzkyMSAtIE1lZGlhVGVrIE1UNzkyMSBibHVldG9vdGggY2hp
cHNldAorIyAgCisjICBGaWxlOiBtZWRpYXRlay9CVF9SQU1fQ09ERV9NVDc5NjFfMV8yX2hkci5i
aW4KKyMgLVZlcnNpb246IDIwMjMxMTA5MTkxNDE2CisjICtWZXJzaW9uOiAyMDI0MDIxOTExMTQy
NworIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLm1lZGlhdGVr
IGZvciBkZXRhaWxzLgorIyAgCisjIEBAIC01NjU0LDkgKzU2NzAsOSBAQAorIyAgRHJpdmVyOiBt
dDc5MjIgLSBNZWRpYVRlayBNVDc5MjIgV2lyZWxlc3MgTUFDcworIyAgCisjICBGaWxlOiBtZWRp
YXRlay9XSUZJX01UNzkyMl9wYXRjaF9tY3VfMV8xX2hkci5iaW4KKyMgLVZlcnNpb246IDIwMjMx
MTIwMTgzNDAwYQorIyArVmVyc2lvbjogMjAyNDAyMTkxMDMyNDRhCisjICBGaWxlOiBtZWRpYXRl
ay9XSUZJX1JBTV9DT0RFX01UNzkyMl8xLmJpbgorIyAtVmVyc2lvbjogMjAyMzExMjAxODM0NDEK
KyMgK1ZlcnNpb246IDIwMjQwMjE5MTAzMzM3CisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0
YWJsZS4gU2VlIExJQ0VOQ0UubWVkaWF0ZWsgZm9yIGRldGFpbHMuCisjICAKKyMgQEAgLTU2NjUs
NyArNTY4MSw3IEBACisjICBEcml2ZXI6IG10NzkyMiAtIE1lZGlhVGVrIE1UNzkyMiBibHVldG9v
dGggY2hpcHNldAorIyAgCisjICBGaWxlOiBtZWRpYXRlay9CVF9SQU1fQ09ERV9NVDc5MjJfMV8x
X2hkci5iaW4KKyMgLVZlcnNpb246IDIwMjMxMTIwMTgzNjIwCisjICtWZXJzaW9uOiAyMDI0MDIx
OTEwMzYxOAorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLm1l
ZGlhdGVrIGZvciBkZXRhaWxzLgorIyAgCisjIEBAIC03MzQ5LDYgKzczNjUsMjYgQEAKKyMgIExp
bms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTdhYTIzMWEtcjAuYmluIC0+IGNzMzVs
NDEtZHNwMS1zcGstcHJvdC0xN2FhMjJmMi1yMC5iaW4KKyMgIExpbms6IGNpcnJ1cy9jczM1bDQx
LWRzcDEtc3BrLWNhbGktMTdhYTIzMWEtbDAuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstY2FsaS0x
N2FhMjJmMi1sMC5iaW4KKyMgIExpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTdh
YTIzMWEtcjAuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstY2FsaS0xN2FhMjJmMi1yMC5iaW4KKyMg
K0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTdhYTM4YTkud21mdyAtPiBjczM1
bDQxL3Y2LjYxLjEvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS42My4xLndtZncKKyMgK0xpbms6IGNp
cnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTdhYTM4YTkud21mdyAtPiBjczM1bDQxL3Y2LjYx
LjEvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS42My4xLndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1
bDQxLWRzcDEtc3BrLXByb3QtMTdhYTM4YWIud21mdyAtPiBjczM1bDQxL3Y2LjYxLjEvaGFsb19j
c3BsX1JBTV9yZXZCMl8yOS42My4xLndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEt
c3BrLWNhbGktMTdhYTM4YWIud21mdyAtPiBjczM1bDQxL3Y2LjYxLjEvaGFsb19jc3BsX1JBTV9y
ZXZCMl8yOS42My4xLndtZncKKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3Qt
MTdhYTM4YTktc3BraWQwLWwwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGst
Y2FsaS0xN2FhMzhhOS1zcGtpZDAtbDAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3Ax
LXNway1wcm90LTE3YWEzOGE5LXNwa2lkMC1yMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQx
LWRzcDEtc3BrLWNhbGktMTdhYTM4YTktc3BraWQwLXIwLmJpbgorIyArTGluazogY2lycnVzL2Nz
MzVsNDEtZHNwMS1zcGstcHJvdC0xN2FhMzhhOS1zcGtpZDEtbDAuYmluIC0+IGNzMzVsNDEtZHNw
MS1zcGstcHJvdC0xN2FhMzhhOS1zcGtpZDAtbDAuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0
MS1kc3AxLXNway1jYWxpLTE3YWEzOGE5LXNwa2lkMS1sMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNw
ay1jYWxpLTE3YWEzOGE5LXNwa2lkMC1sMC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRz
cDEtc3BrLXByb3QtMTdhYTM4YTktc3BraWQxLXIwLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLXBy
b3QtMTdhYTM4YTktc3BraWQwLXIwLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1z
cGstY2FsaS0xN2FhMzhhOS1zcGtpZDEtcjAuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstY2FsaS0x
N2FhMzhhOS1zcGtpZDAtcjAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1w
cm90LTE3YWEzOGFiLXNwa2lkMC1sMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEt
c3BrLWNhbGktMTdhYTM4YWItc3BraWQwLWwwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEt
ZHNwMS1zcGstcHJvdC0xN2FhMzhhYi1zcGtpZDAtcjAuYmluCisjICtGaWxlOiBjaXJydXMvY3Mz
NWw0MS1kc3AxLXNway1jYWxpLTE3YWEzOGFiLXNwa2lkMC1yMC5iaW4KKyMgK0xpbms6IGNpcnJ1
cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTdhYTM4YWItc3BraWQxLWwwLmJpbiAtPiBjczM1bDQx
LWRzcDEtc3BrLXByb3QtMTdhYTM4YWItc3BraWQwLWwwLmJpbgorIyArTGluazogY2lycnVzL2Nz
MzVsNDEtZHNwMS1zcGstY2FsaS0xN2FhMzhhYi1zcGtpZDEtbDAuYmluIC0+IGNzMzVsNDEtZHNw
MS1zcGstY2FsaS0xN2FhMzhhYi1zcGtpZDAtbDAuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0
MS1kc3AxLXNway1wcm90LTE3YWEzOGFiLXNwa2lkMS1yMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNw
ay1wcm90LTE3YWEzOGFiLXNwa2lkMC1yMC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRz
cDEtc3BrLWNhbGktMTdhYTM4YWItc3BraWQxLXIwLmJpbiAtPiBjczM1bDQxLWRzcDEtc3BrLWNh
bGktMTdhYTM4YWItc3BraWQwLXIwLmJpbgorIyAgTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1z
cGstcHJvdC0xMDNjOGMyNi53bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFNX3Jl
dkIyXzI5LjYzLjEud21mdworIyAgTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0x
MDNjOGMyNi53bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjYz
LjEud21mdworIyAgTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGI0Mi53
bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjYzLjEud21mdwor
IyAKKyMKKwogU1VNTUFSWSA9ICJGaXJtd2FyZSBmaWxlcyBmb3IgdXNlIHdpdGggTGludXgga2Vy
bmVsIgogSE9NRVBBR0UgPSAiaHR0cHM6Ly93d3cua2VybmVsLm9yZy8iCiBERVNDUklQVElPTiA9
ICJMaW51eCBmaXJtd2FyZSBpcyBhIHBhY2thZ2UgZGlzdHJpYnV0ZWQgYWxvbmdzaWRlIHRoZSBM
aW51eCBrZXJuZWwgXApAQCAtMTUxLDcgKzI5Nyw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmls
ZTovL0xJQ0VOQ0UuQWJpbGlzO21kNT1iNWVlM2Y0MTA3ODBlNTY3MTFhZDQ4ZWFkYzIyYjhiYyBc
CiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTkNFLnhjNDAwMDttZDU9MGZmNTFkMmRj
NDlmY2UwNDgxNGM5MTU1MDgxMDkyZjAgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElD
RU5DRS54YzUwMDA7bWQ1PTFlMTcwYzEzMTc1MzIzYzMyYzdmNGQwOTk4ZDUzZjY2IFwKICAgICAg
ICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOQ0UueGM1MDAwYzttZDU9MTJiMDJlZmEzMDQ5ZGI2
NWQ1MjRhZWI0MThkZDg3Y2EgXAotICAgICAgICAgICAgICAgICAgICBmaWxlOi8vV0hFTkNFO21k
NT0ke1dIRU5DRV9DSEtTVU19IFwKKyAgICAgICAgICAgICAgICAgICAgZmlsZTovL1dIRU5DRTtt
ZDU9NTE0ZGExY2Q4YjM2MzM3MzAzMGYwYzE2NzQ5ZmViOGQgXAogICAgICAgICAgICAgICAgICAg
ICAiCiAjIFdIRU5DRSBjaGVja3N1bSBpcyBkZWZpbmVkIHNlcGFyYXRlbHkgdG8gZWFzZSBvdmVy
cmlkaW5nIGl0IGlmCiAjIGNsYXNzLWRldnVwc3RyZWFtIGlzIHNlbGVjdGVkLgpAQCAtMjQzLDcg
KzM4OSw3IEBAIFNSQ19VUkk6Y2xhc3MtZGV2dXBzdHJlYW0gPSAiZ2l0Oi8vZ2l0Lmtlcm5lbC5v
cmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2Zpcm13CiAjIFBpbiB0aGlzIHRvIHRoZSAyMDIy
MDUwOSByZWxlYXNlLCBvdmVycmlkZSB0aGlzIGluIGxvY2FsLmNvbmYKIFNSQ1JFVjpjbGFzcy1k
ZXZ1cHN0cmVhbSA/PSAiYjE5Y2JkY2E3OGFiMmFkZmQyMTBjOTFiZTE1YTIyNTY4ZThiOGNhZSIK
IAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImJmMGYyMzlkYzA4MDFlOWQ2YmY1ZDVmYjNlMmY1NDk1
NzU2MzJjZjQ2ODhmNDM0ODE4NDE5OWNiMDJjMmJjZDciCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAi
YjIzMjdhNTRhZDE4OTdjODI4MDA4Y2FmNjNhZjVlZTE1NDY5YmE3MjNhNTAxNmJlNThmMmI0NGYw
N2JkNGI5NCIKIAogaW5oZXJpdCBhbGxhcmNoCiAKLS0gCjIuNDIuMAoK

--===============7906585662209000711==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: FILELIST: added "/usr/lib/firmware/brcm/brcmfmac43340-sdio.Insyde-VESPA2.txt"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: FILELIST: added "/usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38a9-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38a9-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38a9-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa38ab-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38ab-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38ab-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38ab-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38ab-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa38a9-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa38a9-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa38ab-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa38ab-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa38ab-spkid1-l0.bin /usr/lib/
 firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38a9-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa38ab.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa38a9.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38ab.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38a9.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa38a9-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa38a9-spkid0-r0.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: FILELIST: added "/usr/lib/firmware/i915/xe2lpd_dmc.bin"
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: added "/usr/lib/firmware/intel/ipu/shisp_2401a0_v21.bin /usr/lib/firmware/intel/ipu/shisp_2400b0_v21.bin"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGSIZE changed from 66167853 to 89233509 (+35%)

--===============7906585662209000711==--

