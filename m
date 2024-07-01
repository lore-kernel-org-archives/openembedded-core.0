Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7F4CC5320C
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 16:58:02 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.2201.1719853078283291056
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 09:57:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=E9C9Q5mC;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Z4v9sgaI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101906f3b5100-29e9c931-382f-4315-a9cb-66fce9931c46-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1719853076;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TCgpGN0hwouGvNtVfOpt6DL5DQjR5w5cyeN/ymK5izo=;
	b=E9C9Q5mCXriRGrvPYnZAmSavy6exErc1KBrQOjoL8IDJUbWlqAJlJ6DTzgEGjLO7
	tCQ1reTkt9jpR2qjfSby24KMWFXB04dURJlk1UyoEY2cjFnYKoOG1eAihuHoFrcI7vT
	VN6TwS7iWuZUUH9ItV72wns/Xp+Ecm2kH47uZb+Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1719853076;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TCgpGN0hwouGvNtVfOpt6DL5DQjR5w5cyeN/ymK5izo=;
	b=Z4v9sgaInMd9ohagISyY26le6xlh+gCUJlp8ZQ3e+sw1lXcPbMX1yd1HoD/CGKXS
	Fr/rqIIsLwPyYoE7EZmQMHKJDxFz+LYVXE8dvYhZfXvoURXecZKVkaQb/44wYraUAmN
	a/neTf6/0uKQspOr2fA8/Al24/y2iJsbz6YGpcZg=
Content-Type: multipart/mixed; boundary="===============8440407213124119689=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] linux-firmware: upgrading to 20240610 SUCCEEDED
Message-ID: <010101906f3b5100-29e9c931-382f-4315-a9cb-66fce9931c46-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jul 2024 16:57:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 16:58:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201401

--===============8440407213124119689==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *linux-firmware* to *20240610* has Succeeded.

Next steps:
    - apply the patch: git am 0001-linux-firmware-upgrade-20240513-20240610.patch
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
From d2e6093a79e987bb6b505c147ef1bf52f658b48b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jul 2024 14:14:55 +0000
Subject: [PATCH] linux-firmware: upgrade 20240513 -> 20240610

---
 ...20240513.bb => linux-firmware_20240610.bb} | 107 +++++++++++++++++-
 1 file changed, 105 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20240513.bb => linux-firmware_20240610.bb} (94%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20240513.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20240610.bb
similarity index 94%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20240513.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20240610.bb
index 4a87105d98..12343f19b9 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20240513.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20240610.bb
@@ -1,3 +1,106 @@
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
+# @@ -2577,12 +2577,20 @@
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
+# @@ -2603,6 +2611,8 @@
+#  File: amdgpu/psp_13_0_11_toc.bin
+#  File: amdgpu/psp_14_0_0_ta.bin
+#  File: amdgpu/psp_14_0_0_toc.bin
+# +File: amdgpu/psp_14_0_1_ta.bin
+# +File: amdgpu/psp_14_0_1_toc.bin
+#  File: amdgpu/sdma_4_4_2.bin
+#  File: amdgpu/sdma_5_2_6.bin
+#  File: amdgpu/sdma_5_2_7.bin
+# @@ -2611,6 +2621,7 @@
+#  File: amdgpu/sdma_6_0_2.bin
+#  File: amdgpu/sdma_6_0_3.bin
+#  File: amdgpu/sdma_6_1_0.bin
+# +File: amdgpu/sdma_6_1_1.bin
+#  File: amdgpu/smu_13_0_0.bin
+#  File: amdgpu/smu_13_0_6.bin
+#  File: amdgpu/smu_13_0_7.bin
+# @@ -2622,7 +2633,10 @@
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
+# @@ -3226,6 +3240,7 @@
+#  Driver: rtw88 - Realtek 802.11ac WLAN driver for RTL8822BE and RTL8822CE
+#  
+#  Info: Sent to Larry Finger by Realtek engineer Yan-Hsuan Chuang <yhchuang@realtek.com>
+# +File: rtw88/rtw8821a_fw.bin
+#  File: rtw88/rtw8822b_fw.bin
+#  File: rtw88/rtw8822c_fw.bin
+#  File: rtw88/rtw8822c_wow_fw.bin
+# @@ -6948,6 +6963,22 @@
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
+# @@ -7324,3 +7355,9 @@
+#  Version: arch10.8
+#  
+#  License: Redistributable. See LICENCE.mali_csffw for details
+# +
+# +--------------------------------------------------------------------------
+# +Driver: isp - Image Signal Processor (ISP) device
+# +File: amdgpu/isp_4_1_1.bin
+# +
+# +License: Redistributable. See LICENSE.amdisp for details
+# 
+#
+
 SUMMARY = "Firmware files for use with Linux kernel"
 HOMEPAGE = "https://www.kernel.org/"
 DESCRIPTION = "Linux firmware is a package distributed alongside the Linux kernel \
@@ -152,7 +255,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=${WHENCE_CHKSUM} \
+                    file://WHENCE;md5=b036c11a715747605b49413c9a4f3381 \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
@@ -244,7 +347,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "9f05edb99668135d37cedc4fdd18aac2802dc9e4566e086e6c6c2e321f3ecc4e"
+SRC_URI[sha256sum] = "e26a50670fb77394f10d75f96eb1faa1d3d9fb57b8b72075f0af858cb45d2a77"
 
 inherit allarch
 
-- 
2.44.0


--===============8440407213124119689==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/linux-firmware: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware: SRC_URI changed from "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20240513.tar.xz" to "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20240610.tar.xz"
packages/all-poky-linux/linux-firmware: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: FILELIST: added "/usr/lib/firmware/amdgpu/gc_11_5_1_imu.bin /usr/lib/firmware/amdgpu/gc_11_5_1_mes1.bin /usr/lib/firmware/amdgpu/gc_11_5_1_mec.bin /usr/lib/firmware/amdgpu/sdma_6_1_1.bin /usr/lib/firmware/amdgpu/gc_11_5_1_pfp.bin /usr/lib/firmware/amdgpu/gc_11_5_1_rlc.bin /usr/lib/firmware/amdgpu/psp_14_0_1_ta.bin /usr/lib/firmware/amdgpu/gc_11_5_1_mes_2.bin /usr/lib/firmware/amdgpu/dcn_3_5_1_dmcub.bin /usr/lib/firmware/amdgpu/psp_14_0_1_toc.bin /usr/lib/firmware/amdgpu/vcn_4_0_6_1.bin /usr/lib/firmware/amdgpu/vpe_6_1_1.bin /usr/lib/firmware/amdgpu/isp_4_1_1.bin /usr/lib/firmware/amdgpu/vcn_4_0_6.bin /usr/lib/firmware/amdgpu/gc_11_5_1_me.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PKGSIZE changed from 85527210 to 92649114 (+8%)
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar5523: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ar5523: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2x: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2x: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: FILELIST: added "/usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-l1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38f9-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-r1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38f9-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38fa-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38fa-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-l1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-r1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c7.wmfw /usr/lib/firmware/
 cirrus/cs35l41-dsp1-spk-prot-17aa38c8.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38f9.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38fa.wmfw"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: PKGSIZE changed from 2260402 to 2321538 (+3%)
packages/all-poky-linux/linux-firmware/linux-firmware-cnm-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-cnm-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cnm: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-cnm: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-18: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-18: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9260: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9260: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-license: FILELIST: added "/usr/lib/firmware/LICENSE.amdisp"
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGSIZE changed from 98464 to 106926 (+9%)
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mali-csffw-arch108: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-mali-csffw-arch108: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mali-csffw-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-mali-csffw-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mellanox: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-mellanox: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-microchip-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-microchip-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-microchip: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-microchip: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-moxa-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-moxa-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-moxa: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-moxa: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7650: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7650: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x2: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x2: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8987-sdio: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8987-sdio: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-common: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-common: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-pcie: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-pcie: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-sdio: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-sdio: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-common: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-common: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-pcie: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-pcie: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-sdio: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-sdio: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw416-sdio: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw416-sdio: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw612-sdio: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw612-sdio: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-olpc-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-olpc-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-olpc: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-olpc: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-powervr-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-powervr-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-powervr: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-powervr: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-prestera: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-prestera: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PKGSIZE changed from 2444995 to 2445819 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a702: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a702: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-modem: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-modem: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-wifi: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-wifi: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-adreno: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-adreno: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-adreno: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-adreno: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-audio: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-audio: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-modem: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-modem: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-wifi: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-wifi: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-adreno: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-adreno: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-audio: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-audio: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-compute: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-compute: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-modem: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-modem: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-wifi: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-wifi: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-adreno: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-adreno: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-thundercomm-db845c-sensors: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-thundercomm-db845c-sensors: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-adreno: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-adreno: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-thundercomm-rb5-sensors: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-thundercomm-rb5-sensors: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-6.0: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-6.0: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-yamato-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-yamato-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qed: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qed: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-dptx: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-dptx: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-nic: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-nic: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8761: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8761: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: FILELIST: added "/usr/lib/firmware/rtw88/rtw8821a_fw.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PKGSIZE changed from 216662 to 248560 (+15%)
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8822: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8822: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-src: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-src: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGSIZE changed from 274394 to 276159 (+1%)
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware: PKGSIZE changed from 83811421 to 83811452 (+0%)

--===============8440407213124119689==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: FILELIST: added "/usr/lib/firmware/amdgpu/gc_11_5_1_mes_2.bin /usr/lib/firmware/amdgpu/dcn_3_5_1_dmcub.bin /usr/lib/firmware/amdgpu/gc_11_5_1_me.bin /usr/lib/firmware/amdgpu/psp_14_0_1_ta.bin /usr/lib/firmware/amdgpu/gc_11_5_1_mes1.bin /usr/lib/firmware/amdgpu/gc_11_5_1_pfp.bin /usr/lib/firmware/amdgpu/isp_4_1_1.bin /usr/lib/firmware/amdgpu/gc_11_5_1_rlc.bin /usr/lib/firmware/amdgpu/sdma_6_1_1.bin /usr/lib/firmware/amdgpu/psp_14_0_1_toc.bin /usr/lib/firmware/amdgpu/vpe_6_1_1.bin /usr/lib/firmware/amdgpu/vcn_4_0_6.bin /usr/lib/firmware/amdgpu/vcn_4_0_6_1.bin /usr/lib/firmware/amdgpu/gc_11_5_1_mec.bin /usr/lib/firmware/amdgpu/gc_11_5_1_imu.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: FILELIST: added "/usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-l1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-r1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-l1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-r1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38f9-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38fa-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38fa-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c8.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c7.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38f9.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38f9-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp
 1-spk-prot-17aa38c7-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38fa.wmfw"
packages/all-poky-linux/linux-firmware/linux-firmware-license: FILELIST: added "/usr/lib/firmware/LICENSE.amdisp"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PKGSIZE changed from 216662 to 248560 (+15%)
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: FILELIST: added "/usr/lib/firmware/rtw88/rtw8821a_fw.bin"

--===============8440407213124119689==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-linux-firmware-upgrade-20240513-20240610.patch"

RnJvbSBkMmU2MDkzYTc5ZTk4N2JiNmI1MDVjMTQ3ZWYxYmY1MmY2NThiNDhiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdWwgMjAyNCAxNDoxNDo1NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
bnV4LWZpcm13YXJlOiB1cGdyYWRlIDIwMjQwNTEzIC0+IDIwMjQwNjEwCgotLS0KIC4uLjIwMjQw
NTEzLmJiID0+IGxpbnV4LWZpcm13YXJlXzIwMjQwNjEwLmJifSB8IDEwNyArKysrKysrKysrKysr
KysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAxMDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL3tsaW51eC1maXJtd2Fy
ZV8yMDI0MDUxMy5iYiA9PiBsaW51eC1maXJtd2FyZV8yMDI0MDYxMC5iYn0gKDk0JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJl
XzIwMjQwNTEzLmJiIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1m
aXJtd2FyZV8yMDI0MDYxMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlXzIwMjQwNTEzLmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13
YXJlXzIwMjQwNjEwLmJiCmluZGV4IDRhODcxMDVkOTguLjEyMzQzZjE5YjkgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgtZmlybXdhcmVfMjAyNDA1
MTMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJt
d2FyZV8yMDI0MDYxMC5iYgpAQCAtMSwzICsxLDEwNiBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxF
U19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgor
IyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhl
IG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYg
bmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2Fn
ZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRl
OiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0t
IFdIRU5DRQorIyArKysgV0hFTkNFCisjIEBAIC0yNTc3LDEyICsyNTc3LDIwIEBACisjICBGaWxl
OiBhbWRncHUvZ2NfMTFfNV8wX21lc18yLmJpbgorIyAgRmlsZTogYW1kZ3B1L2djXzExXzVfMF9w
ZnAuYmluCisjICBGaWxlOiBhbWRncHUvZ2NfMTFfNV8wX3JsYy5iaW4KKyMgK0ZpbGU6IGFtZGdw
dS9nY18xMV81XzFfaW11LmJpbgorIyArRmlsZTogYW1kZ3B1L2djXzExXzVfMV9tZS5iaW4KKyMg
K0ZpbGU6IGFtZGdwdS9nY18xMV81XzFfbWVjLmJpbgorIyArRmlsZTogYW1kZ3B1L2djXzExXzVf
MV9tZXMxLmJpbgorIyArRmlsZTogYW1kZ3B1L2djXzExXzVfMV9tZXNfMi5iaW4KKyMgK0ZpbGU6
IGFtZGdwdS9nY18xMV81XzFfcGZwLmJpbgorIyArRmlsZTogYW1kZ3B1L2djXzExXzVfMV9ybGMu
YmluCisjICBGaWxlOiBhbWRncHUvZGNuXzNfMV80X2RtY3ViLmJpbgorIyAgRmlsZTogYW1kZ3B1
L2Rjbl8zXzFfNV9kbWN1Yi5iaW4KKyMgIEZpbGU6IGFtZGdwdS9kY25fM18xXzZfZG1jdWIuYmlu
CisjICBGaWxlOiBhbWRncHUvZGNuXzNfMl8wX2RtY3ViLmJpbgorIyAgRmlsZTogYW1kZ3B1L2Rj
bl8zXzJfMV9kbWN1Yi5iaW4KKyMgIEZpbGU6IGFtZGdwdS9kY25fM181X2RtY3ViLmJpbgorIyAr
RmlsZTogYW1kZ3B1L2Rjbl8zXzVfMV9kbWN1Yi5iaW4KKyMgIEZpbGU6IGFtZGdwdS9wc3BfMTNf
MF8wX3Nvcy5iaW4KKyMgIEZpbGU6IGFtZGdwdS9wc3BfMTNfMF8wX3RhLmJpbgorIyAgRmlsZTog
YW1kZ3B1L3BzcF8xM18wXzRfdGEuYmluCisjIEBAIC0yNjAzLDYgKzI2MTEsOCBAQAorIyAgRmls
ZTogYW1kZ3B1L3BzcF8xM18wXzExX3RvYy5iaW4KKyMgIEZpbGU6IGFtZGdwdS9wc3BfMTRfMF8w
X3RhLmJpbgorIyAgRmlsZTogYW1kZ3B1L3BzcF8xNF8wXzBfdG9jLmJpbgorIyArRmlsZTogYW1k
Z3B1L3BzcF8xNF8wXzFfdGEuYmluCisjICtGaWxlOiBhbWRncHUvcHNwXzE0XzBfMV90b2MuYmlu
CisjICBGaWxlOiBhbWRncHUvc2RtYV80XzRfMi5iaW4KKyMgIEZpbGU6IGFtZGdwdS9zZG1hXzVf
Ml82LmJpbgorIyAgRmlsZTogYW1kZ3B1L3NkbWFfNV8yXzcuYmluCisjIEBAIC0yNjExLDYgKzI2
MjEsNyBAQAorIyAgRmlsZTogYW1kZ3B1L3NkbWFfNl8wXzIuYmluCisjICBGaWxlOiBhbWRncHUv
c2RtYV82XzBfMy5iaW4KKyMgIEZpbGU6IGFtZGdwdS9zZG1hXzZfMV8wLmJpbgorIyArRmlsZTog
YW1kZ3B1L3NkbWFfNl8xXzEuYmluCisjICBGaWxlOiBhbWRncHUvc211XzEzXzBfMC5iaW4KKyMg
IEZpbGU6IGFtZGdwdS9zbXVfMTNfMF82LmJpbgorIyAgRmlsZTogYW1kZ3B1L3NtdV8xM18wXzcu
YmluCisjIEBAIC0yNjIyLDcgKzI2MzMsMTAgQEAKKyMgIEZpbGU6IGFtZGdwdS92Y25fNF8wXzMu
YmluCisjICBGaWxlOiBhbWRncHUvdmNuXzRfMF80LmJpbgorIyAgRmlsZTogYW1kZ3B1L3Zjbl80
XzBfNS5iaW4KKyMgK0ZpbGU6IGFtZGdwdS92Y25fNF8wXzYuYmluCisjICtGaWxlOiBhbWRncHUv
dmNuXzRfMF82XzEuYmluCisjICBGaWxlOiBhbWRncHUvdnBlXzZfMV8wLmJpbgorIyArRmlsZTog
YW1kZ3B1L3ZwZV82XzFfMS5iaW4KKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBT
ZWUgTElDRU5TRS5hbWRncHUgZm9yIGRldGFpbHMuCisjICAKKyMgQEAgLTMyMjYsNiArMzI0MCw3
IEBACisjICBEcml2ZXI6IHJ0dzg4IC0gUmVhbHRlayA4MDIuMTFhYyBXTEFOIGRyaXZlciBmb3Ig
UlRMODgyMkJFIGFuZCBSVEw4ODIyQ0UKKyMgIAorIyAgSW5mbzogU2VudCB0byBMYXJyeSBGaW5n
ZXIgYnkgUmVhbHRlayBlbmdpbmVlciBZYW4tSHN1YW4gQ2h1YW5nIDx5aGNodWFuZ0ByZWFsdGVr
LmNvbT4KKyMgK0ZpbGU6IHJ0dzg4L3J0dzg4MjFhX2Z3LmJpbgorIyAgRmlsZTogcnR3ODgvcnR3
ODgyMmJfZncuYmluCisjICBGaWxlOiBydHc4OC9ydHc4ODIyY19mdy5iaW4KKyMgIEZpbGU6IHJ0
dzg4L3J0dzg4MjJjX3dvd19mdy5iaW4KKyMgQEAgLTY5NDgsNiArNjk2MywyMiBAQAorIyAgRmls
ZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xN2FhMzg2NS1yMC5iaW4KKyMgIEZpbGU6
IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTdhYTM4NjYtbDAuYmluCisjICBGaWxlOiBj
aXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTE3YWEzODY2LXIwLmJpbgorIyArTGluazogY2ly
cnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xN2FhMzhjNy53bWZ3IC0+IGNzMzVsNDEvdjYuODMu
MC9oYWxvX2NzcGxfUkFNX3JldkIyXzI5Ljg1LjAud21mdworIyArTGluazogY2lycnVzL2NzMzVs
NDEtZHNwMS1zcGstcHJvdC0xN2FhMzhjOC53bWZ3IC0+IGNzMzVsNDEvdjYuODMuMC9oYWxvX2Nz
cGxfUkFNX3JldkIyXzI5Ljg1LjAud21mdworIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1z
cGstcHJvdC0xN2FhMzhmOS53bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFNX3Jl
dkIyXzI5LjYzLjEud21mdworIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0x
N2FhMzhmYS53bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjYz
LjEud21mdworIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xN2FhMzhjNy1z
cGtpZDAtbDAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTE3YWEz
OGM3LXNwa2lkMC1yMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3Qt
MTdhYTM4Yzctc3BraWQwLWwxLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGst
cHJvdC0xN2FhMzhjNy1zcGtpZDAtcjEuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3Ax
LXNway1wcm90LTE3YWEzOGM4LXNwa2lkMS1sMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQx
LWRzcDEtc3BrLXByb3QtMTdhYTM4Yzgtc3BraWQxLXIwLmJpbgorIyArRmlsZTogY2lycnVzL2Nz
MzVsNDEtZHNwMS1zcGstcHJvdC0xN2FhMzhjOC1zcGtpZDEtbDEuYmluCisjICtGaWxlOiBjaXJy
dXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTE3YWEzOGM4LXNwa2lkMS1yMS5iaW4KKyMgK0ZpbGU6
IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTdhYTM4ZmEtc3BraWQwLWwwLmJpbgorIyAr
RmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xN2FhMzhmYS1zcGtpZDAtcjAuYmlu
CisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTE3YWEzOGY5LXNwa2lkMS1s
MC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTdhYTM4Zjktc3Br
aWQxLXIwLmJpbgorIyAgTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGMy
Ni53bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjYzLjEud21m
dworIyAgTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGI0Mi53bWZ3IC0+
IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjYzLjEud21mdworIyAgTGlu
azogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjOGI0My53bWZ3IC0+IGNzMzVsNDEv
djYuNjEuMS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjYzLjEud21mdworIyBAQCAtNzMyNCwzICs3
MzU1LDkgQEAKKyMgIFZlcnNpb246IGFyY2gxMC44CisjICAKKyMgIExpY2Vuc2U6IFJlZGlzdHJp
YnV0YWJsZS4gU2VlIExJQ0VOQ0UubWFsaV9jc2ZmdyBmb3IgZGV0YWlscworIyArCisjICstLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQorIyArRHJpdmVyOiBpc3AgLSBJbWFnZSBTaWduYWwgUHJvY2Vzc29yIChJ
U1ApIGRldmljZQorIyArRmlsZTogYW1kZ3B1L2lzcF80XzFfMS5iaW4KKyMgKworIyArTGljZW5z
ZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5hbWRpc3AgZm9yIGRldGFpbHMKKyMgCisj
CisKIFNVTU1BUlkgPSAiRmlybXdhcmUgZmlsZXMgZm9yIHVzZSB3aXRoIExpbnV4IGtlcm5lbCIK
IEhPTUVQQUdFID0gImh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvIgogREVTQ1JJUFRJT04gPSAiTGlu
dXggZmlybXdhcmUgaXMgYSBwYWNrYWdlIGRpc3RyaWJ1dGVkIGFsb25nc2lkZSB0aGUgTGludXgg
a2VybmVsIFwKQEAgLTE1Miw3ICsyNTUsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9M
SUNFTkNFLkFiaWxpczttZDU9YjVlZTNmNDEwNzgwZTU2NzExYWQ0OGVhZGMyMmI4YmMgXAogICAg
ICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5DRS54YzQwMDA7bWQ1PTBmZjUxZDJkYzQ5ZmNl
MDQ4MTRjOTE1NTA4MTA5MmYwIFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOQ0Uu
eGM1MDAwO21kNT0xZTE3MGMxMzE3NTMyM2MzMmM3ZjRkMDk5OGQ1M2Y2NiBcCiAgICAgICAgICAg
ICAgICAgICAgIGZpbGU6Ly9MSUNFTkNFLnhjNTAwMGM7bWQ1PTEyYjAyZWZhMzA0OWRiNjVkNTI0
YWViNDE4ZGQ4N2NhIFwKLSAgICAgICAgICAgICAgICAgICAgZmlsZTovL1dIRU5DRTttZDU9JHtX
SEVOQ0VfQ0hLU1VNfSBcCisgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9XSEVOQ0U7bWQ1PWIw
MzZjMTFhNzE1NzQ3NjA1YjQ5NDEzYzlhNGYzMzgxIFwKICAgICAgICAgICAgICAgICAgICAgIgog
IyBXSEVOQ0UgY2hlY2tzdW0gaXMgZGVmaW5lZCBzZXBhcmF0ZWx5IHRvIGVhc2Ugb3ZlcnJpZGlu
ZyBpdCBpZgogIyBjbGFzcy1kZXZ1cHN0cmVhbSBpcyBzZWxlY3RlZC4KQEAgLTI0NCw3ICszNDcs
NyBAQCBTUkNfVVJJOmNsYXNzLWRldnVwc3RyZWFtID0gImdpdDovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC9maXJtdwogIyBQaW4gdGhpcyB0byB0aGUgMjAyMjA1MDkg
cmVsZWFzZSwgb3ZlcnJpZGUgdGhpcyBpbiBsb2NhbC5jb25mCiBTUkNSRVY6Y2xhc3MtZGV2dXBz
dHJlYW0gPz0gImIxOWNiZGNhNzhhYjJhZGZkMjEwYzkxYmUxNWEyMjU2OGU4YjhjYWUiCiAKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICI5ZjA1ZWRiOTk2NjgxMzVkMzdjZWRjNGZkZDE4YWFjMjgwMmRj
OWU0NTY2ZTA4NmU2YzZjMmUzMjFmM2VjYzRlIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImUyNmE1
MDY3MGZiNzczOTRmMTBkNzVmOTZlYjFmYWExZDNkOWZiNTdiOGI3MjA3NWYwYWY4NThjYjQ1ZDJh
NzciCiAKIGluaGVyaXQgYWxsYXJjaAogCi0tIAoyLjQ0LjAKCg==

--===============8440407213124119689==--

