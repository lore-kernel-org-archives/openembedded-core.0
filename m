Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCE46CD129A
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:26 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.2025.1711994603678772339
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=JCcjK6pq;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=QSOrlaWP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018e9ad48695-ca2cba6b-d5bf-4aea-97a7-be64a670dfb9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994603;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fY3vGM7xYtgjBDvVCd9Pe2q9Vum3/OsvL36Pj6m6TWI=;
	b=JCcjK6pqdXddoHv0ksPjSEl7uyu2s3nhh9VI4QdGOm1EWzWwv7HYTKBPCyEFRj+Q
	7FV6EoflMClSfoi46/JyTO4zPUpWDMhstjAgcGtL14g6tFQ6FaX6xFFyQs8TYBYYGpX
	EPh3miuxZM6u9h1s+1ftO4L1oX2z/o+fYKfOFghI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994603;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fY3vGM7xYtgjBDvVCd9Pe2q9Vum3/OsvL36Pj6m6TWI=;
	b=QSOrlaWPsh/HfxL00jnZKvnX5IetHUDatSM5hCWjBQQnRo7EIjLCgfYW6ooWpRWi
	mzqnC/Sd+jhPGvrenlVIuCHjxp95KIjON9WhMpNInn8HqdbRXnhd7c56dDHjX8lhWoa
	HISFX5/p+nnvAu80Cotfs1edmolwenUoXfKKT0+Y=
Content-Type: multipart/mixed; boundary="===============1625745252636682598=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] linux-firmware: upgrading to 20240312 SUCCEEDED
Message-ID: <0101018e9ad48695-ca2cba6b-d5bf-4aea-97a7-be64a670dfb9-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:23 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197812

--===============1625745252636682598==
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
From 01ea30fdb026283bf3021d1c42636db03d822430 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 15:19:56 +0000
Subject: [PATCH] linux-firmware: upgrade 20240220 -> 20240312

---
 ...20240220.bb => linux-firmware_20240312.bb} | 150 +++++++++++++++++-
 1 file changed, 148 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20240220.bb => linux-firmware_20240312.bb} (92%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20240220.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20240312.bb
similarity index 92%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20240220.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20240312.bb
index b35802d1dc..c06fa1a78c 100644
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
@@ -150,7 +296,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=${WHENCE_CHKSUM} \
+                    file://WHENCE;md5=514da1cd8b363373030f0c16749feb8d \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
@@ -241,7 +387,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "bf0f239dc0801e9d6bf5d5fb3e2f549575632cf4688f4348184199cb02c2bcd7"
+SRC_URI[sha256sum] = "b2327a54ad1897c828008caf63af5ee15469ba723a5016be58f2b44f07bd4b94"
 
 inherit allarch
 
-- 
2.42.0


--===============1625745252636682598==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-linux-firmware-upgrade-20240220-20240312.patch"

RnJvbSAwMWVhMzBmZGIwMjYyODNiZjMwMjFkMWM0MjYzNmRiMDNkODIyNDMwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAxNToxOTo1NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
bnV4LWZpcm13YXJlOiB1cGdyYWRlIDIwMjQwMjIwIC0+IDIwMjQwMzEyCgotLS0KIC4uLjIwMjQw
MjIwLmJiID0+IGxpbnV4LWZpcm13YXJlXzIwMjQwMzEyLmJifSB8IDE1MCArKysrKysrKysrKysr
KysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAxNDggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL3tsaW51eC1maXJtd2Fy
ZV8yMDI0MDIyMC5iYiA9PiBsaW51eC1maXJtd2FyZV8yMDI0MDMxMi5iYn0gKDkyJSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJl
XzIwMjQwMjIwLmJiIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1m
aXJtd2FyZV8yMDI0MDMxMi5iYgpzaW1pbGFyaXR5IGluZGV4IDkyJQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlXzIwMjQwMjIwLmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13
YXJlXzIwMjQwMzEyLmJiCmluZGV4IGIzNTgwMmQxZGMuLmMwNmZhMWE3OGMgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgtZmlybXdhcmVfMjAyNDAy
MjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJt
d2FyZV8yMDI0MDMxMi5iYgpAQCAtMSwzICsxLDE0OSBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxF
U19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgor
IyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhl
IG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYg
bmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2Fn
ZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRl
OiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0t
IFdIRU5DRQorIyArKysgV0hFTkNFCisjIEBAIC04MjQsNyArODI0LDcgQEAKKyMgIFZlcnNpb246
IDM4Ljc1NWNmZGQ4LjAKKyMgIAorIyAgRmlsZTogaXdsd2lmaS05MDAwLXB1LWIwLWpmLWIwLTQ2
LnVjb2RlCisjIC1WZXJzaW9uOiA0Ni5mZjE4ZTMyYS4wCisjICtWZXJzaW9uOiA0Ni43ZTNlNGI2
OS4wCisjICAKKyMgIEZpbGU6IGl3bHdpZmktOTI2MC10aC1iMC1qZi1iMC0zNC51Y29kZQorIyAg
VmVyc2lvbjogMzQuYmE1MDFiMTEuMAorIyBAQCAtODMzLDcgKzgzMyw3IEBACisjICBWZXJzaW9u
OiAzOC43NTVjZmRkOC4wCisjICAKKyMgIEZpbGU6IGl3bHdpZmktOTI2MC10aC1iMC1qZi1iMC00
Ni51Y29kZQorIyAtVmVyc2lvbjogNDYuZmYxOGUzMmEuMAorIyArVmVyc2lvbjogNDYuN2UzZTRi
NjkuMAorIyAgCisjICBGaWxlOiBpd2x3aWZpLWNjLWEwLTUwLnVjb2RlCisjICBWZXJzaW9uOiA1
MC4zZTM5MWQzZS4wCisjIEBAIC0xMTU2LDYgKzExNTYsMTggQEAKKyMgIExpY2VuY2U6IFJlZGlz
dHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UuaXdsd2lmaV9maXJtd2FyZSBmb3IgZGV0YWlscworIyAg
CisjICBBbHNvIGF2YWlsYWJsZSBmcm9tIGh0dHA6Ly93aXJlbGVzcy5rZXJuZWwub3JnL2VuL3Vz
ZXJzL0RyaXZlcnMvaXdsd2lmaSNGaXJtd2FyZQorIyArCisjICstLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQor
IyArCisjICtEcml2ZXI6IGF0b21pc3AgLSBJbnRlbCBJUFUyIChJbWFnZSBQcm9jZXNzaW5nIFVu
aXQgMikgZHJpdmVyCisjICsKKyMgK0ZpbGU6IGludGVsL2lwdS9zaGlzcF8yNDAwYjBfdjIxLmJp
bgorIyArVmVyc2lvbjogaXJjaV9zdGFibGVfY2FuZHJwdl8wNDE1XzIwMTUwNDIzXzE3NTMKKyMg
KworIyArRmlsZTogaW50ZWwvaXB1L3NoaXNwXzI0MDFhMF92MjEuYmluCisjICtWZXJzaW9uOiBp
cmNpX3N0YWJsZV9jYW5kcnB2XzA0MTVfMjAxNTA1MjFfMDQ1OAorIyArCisjICtMaWNlbnNlOiBS
ZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLml2c2MgZm9yIGRldGFpbHMKKyMgIAorIyAgLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KKyMgIAorIyBAQCAtMjgzMyw2ICsyODQ1LDcgQEAKKyMgIEZpbGU6ICJi
cmNtL2JyY21mbWFjNDMyNDFiNC1zZGlvLkFkdmFudGVjaC1NSUNBLTA3MS50eHQiCisjICBGaWxl
OiAiYnJjbS9icmNtZm1hYzQzMjQxYjQtc2Rpby5JbnRlbCBDb3JwLi1WQUxMRVlWSUVXIEMwIFBM
QVRGT1JNLnR4dCIKKyMgIEZpbGU6ICJicmNtL2JyY21mbWFjNDMzMC1zZGlvLlByb3dpc2UtUFQz
MDEudHh0IgorIyArRmlsZTogImJyY20vYnJjbWZtYWM0MzM0MC1zZGlvLkluc3lkZS1WRVNQQTIu
dHh0IgorIyAgRmlsZTogImJyY20vYnJjbWZtYWM0MzM0MC1zZGlvLkFTVVNUZUsgQ09NUFVURVIg
SU5DLi1URjEwM0NFLnR4dCIKKyMgIEZpbGU6ICJicmNtL2JyY21mbWFjNDMzNDAtc2Rpby5tZWVn
b3BhZC10MDgudHh0IgorIyAgRmlsZTogImJyY20vYnJjbWZtYWM0MzM0MC1zZGlvLnBvdi10YWIt
cDEwMDZ3LWRhdGEudHh0IgorIyBAQCAtNDkxNiw3ICs0OTI5LDcgQEAKKyMgIFZlcnNpb246IERN
QyBBUEkvQVBCIHZlciAyIHJlbGVhc2UgMTAgZm9yIE1ldGVvcmxha2UKKyMgIAorIyAgRmlsZTog
aTkxNS9tdGxfZG1jLmJpbgorIyAtVmVyc2lvbjogRE1DIEFQSS9BUEIgdmVyIDIgcmVsZWFzZSAx
OSBmb3IgTWV0ZW9ybGFrZQorIyArVmVyc2lvbjogRE1DIEFQSS9BUEIgdmVyIDIgcmVsZWFzZSAy
MSBmb3IgTWV0ZW9ybGFrZQorIyAgCisjICBGaWxlOiBpOTE1L210bF9ndWNfNzAuYmluCisjICBW
ZXJzaW9uOiBHdUMgQVBJL0FQQiB2ZXIgNzAuMjAuMCBmb3IgTWV0ZW9ybGFrZQorIyBAQCAtNDky
Niw2ICs0OTM5LDkgQEAKKyMgIAorIyAgRmlsZTogaTkxNS9tdGxfZ3NjXzEuYmluCisjICBWZXJz
aW9uOiBHU0MgQVBJL0FQQiB2MS4wLCByZWxlYXNlIDEwMi4wLjAuMTY1NSwgU1ZOIDEgZm9yIE1l
dGVvcmxha2UKKyMgKworIyArRmlsZTogaTkxNS94ZTJscGRfZG1jLmJpbgorIyArVmVyc2lvbjog
RE1DIEFQSS9BUEIgdmVyIDIgcmVsZWFzZSAxOCBmb3IgWGUyTFBECisjICAKKyMgIExpY2Vuc2U6
IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UuaTkxNSBmb3IgZGV0YWlscworIyAgLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KKyMgQEAgLTU2MzQsOSArNTY1MCw5IEBACisjICBEcml2ZXI6IG10NzkyMSAt
IE1lZGlhVGVrIE1UNzkyMSBXaXJlbGVzcyBNQUNzCisjICAKKyMgIEZpbGU6IG1lZGlhdGVrL1dJ
RklfTVQ3OTYxX3BhdGNoX21jdV8xXzJfaGRyLmJpbgorIyAtVmVyc2lvbjogMjAyMzExMDkxOTA5
MThhCisjICtWZXJzaW9uOiAyMDI0MDIxOTExMDk1OGEKKyMgIEZpbGU6IG1lZGlhdGVrL1dJRklf
UkFNX0NPREVfTVQ3OTYxXzEuYmluCisjIC1WZXJzaW9uOiAyMDIzMTEwOTE5MDk1OQorIyArVmVy
c2lvbjogMjAyNDAyMTkxMTEwMzgKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBT
ZWUgTElDRU5DRS5tZWRpYXRlayBmb3IgZGV0YWlscy4KKyMgIAorIyBAQCAtNTY0NSw3ICs1NjYx
LDcgQEAKKyMgIERyaXZlcjogbXQ3OTIxIC0gTWVkaWFUZWsgTVQ3OTIxIGJsdWV0b290aCBjaGlw
c2V0CisjICAKKyMgIEZpbGU6IG1lZGlhdGVrL0JUX1JBTV9DT0RFX01UNzk2MV8xXzJfaGRyLmJp
bgorIyAtVmVyc2lvbjogMjAyMzExMDkxOTE0MTYKKyMgK1ZlcnNpb246IDIwMjQwMjE5MTExNDI3
CisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UubWVkaWF0ZWsg
Zm9yIGRldGFpbHMuCisjICAKKyMgQEAgLTU2NTQsOSArNTY3MCw5IEBACisjICBEcml2ZXI6IG10
NzkyMiAtIE1lZGlhVGVrIE1UNzkyMiBXaXJlbGVzcyBNQUNzCisjICAKKyMgIEZpbGU6IG1lZGlh
dGVrL1dJRklfTVQ3OTIyX3BhdGNoX21jdV8xXzFfaGRyLmJpbgorIyAtVmVyc2lvbjogMjAyMzEx
MjAxODM0MDBhCisjICtWZXJzaW9uOiAyMDI0MDIxOTEwMzI0NGEKKyMgIEZpbGU6IG1lZGlhdGVr
L1dJRklfUkFNX0NPREVfTVQ3OTIyXzEuYmluCisjIC1WZXJzaW9uOiAyMDIzMTEyMDE4MzQ0MQor
IyArVmVyc2lvbjogMjAyNDAyMTkxMDMzMzcKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRh
YmxlLiBTZWUgTElDRU5DRS5tZWRpYXRlayBmb3IgZGV0YWlscy4KKyMgIAorIyBAQCAtNTY2NSw3
ICs1NjgxLDcgQEAKKyMgIERyaXZlcjogbXQ3OTIyIC0gTWVkaWFUZWsgTVQ3OTIyIGJsdWV0b290
aCBjaGlwc2V0CisjICAKKyMgIEZpbGU6IG1lZGlhdGVrL0JUX1JBTV9DT0RFX01UNzkyMl8xXzFf
aGRyLmJpbgorIyAtVmVyc2lvbjogMjAyMzExMjAxODM2MjAKKyMgK1ZlcnNpb246IDIwMjQwMjE5
MTAzNjE4CisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UubWVk
aWF0ZWsgZm9yIGRldGFpbHMuCisjICAKKyMgQEAgLTczNDksNiArNzM2NSwyNiBAQAorIyAgTGlu
azogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xN2FhMjMxYS1yMC5iaW4gLT4gY3MzNWw0
MS1kc3AxLXNway1wcm90LTE3YWEyMmYyLXIwLmJpbgorIyAgTGluazogY2lycnVzL2NzMzVsNDEt
ZHNwMS1zcGstY2FsaS0xN2FhMjMxYS1sMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1jYWxpLTE3
YWEyMmYyLWwwLmJpbgorIyAgTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xN2Fh
MjMxYS1yMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1jYWxpLTE3YWEyMmYyLXIwLmJpbgorIyAr
TGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xN2FhMzhhOS53bWZ3IC0+IGNzMzVs
NDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjYzLjEud21mdworIyArTGluazogY2ly
cnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xN2FhMzhhOS53bWZ3IC0+IGNzMzVsNDEvdjYuNjEu
MS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjYzLjEud21mdworIyArTGluazogY2lycnVzL2NzMzVs
NDEtZHNwMS1zcGstcHJvdC0xN2FhMzhhYi53bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2Nz
cGxfUkFNX3JldkIyXzI5LjYzLjEud21mdworIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1z
cGstY2FsaS0xN2FhMzhhYi53bWZ3IC0+IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFNX3Jl
dkIyXzI5LjYzLjEud21mdworIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0x
N2FhMzhhOS1zcGtpZDAtbDAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1j
YWxpLTE3YWEzOGE5LXNwa2lkMC1sMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEt
c3BrLXByb3QtMTdhYTM4YTktc3BraWQwLXIwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEt
ZHNwMS1zcGstY2FsaS0xN2FhMzhhOS1zcGtpZDAtcjAuYmluCisjICtMaW5rOiBjaXJydXMvY3Mz
NWw0MS1kc3AxLXNway1wcm90LTE3YWEzOGE5LXNwa2lkMS1sMC5iaW4gLT4gY3MzNWw0MS1kc3Ax
LXNway1wcm90LTE3YWEzOGE5LXNwa2lkMC1sMC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQx
LWRzcDEtc3BrLWNhbGktMTdhYTM4YTktc3BraWQxLWwwLmJpbiAtPiBjczM1bDQxLWRzcDEtc3Br
LWNhbGktMTdhYTM4YTktc3BraWQwLWwwLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNw
MS1zcGstcHJvdC0xN2FhMzhhOS1zcGtpZDEtcjAuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstcHJv
dC0xN2FhMzhhOS1zcGtpZDAtcjAuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNw
ay1jYWxpLTE3YWEzOGE5LXNwa2lkMS1yMC5iaW4gLT4gY3MzNWw0MS1kc3AxLXNway1jYWxpLTE3
YWEzOGE5LXNwa2lkMC1yMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXBy
b3QtMTdhYTM4YWItc3BraWQwLWwwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1z
cGstY2FsaS0xN2FhMzhhYi1zcGtpZDAtbDAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1k
c3AxLXNway1wcm90LTE3YWEzOGFiLXNwa2lkMC1yMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1
bDQxLWRzcDEtc3BrLWNhbGktMTdhYTM4YWItc3BraWQwLXIwLmJpbgorIyArTGluazogY2lycnVz
L2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xN2FhMzhhYi1zcGtpZDEtbDAuYmluIC0+IGNzMzVsNDEt
ZHNwMS1zcGstcHJvdC0xN2FhMzhhYi1zcGtpZDAtbDAuYmluCisjICtMaW5rOiBjaXJydXMvY3Mz
NWw0MS1kc3AxLXNway1jYWxpLTE3YWEzOGFiLXNwa2lkMS1sMC5iaW4gLT4gY3MzNWw0MS1kc3Ax
LXNway1jYWxpLTE3YWEzOGFiLXNwa2lkMC1sMC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQx
LWRzcDEtc3BrLXByb3QtMTdhYTM4YWItc3BraWQxLXIwLmJpbiAtPiBjczM1bDQxLWRzcDEtc3Br
LXByb3QtMTdhYTM4YWItc3BraWQwLXIwLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNw
MS1zcGstY2FsaS0xN2FhMzhhYi1zcGtpZDEtcjAuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstY2Fs
aS0xN2FhMzhhYi1zcGtpZDAtcjAuYmluCisjICBMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNw
ay1wcm90LTEwM2M4YzI2LndtZncgLT4gY3MzNWw0MS92Ni42MS4xL2hhbG9fY3NwbF9SQU1fcmV2
QjJfMjkuNjMuMS53bWZ3CisjICBMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEw
M2M4YzI2LndtZncgLT4gY3MzNWw0MS92Ni42MS4xL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuNjMu
MS53bWZ3CisjICBMaW5rOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4YjQyLndt
ZncgLT4gY3MzNWw0MS92Ni42MS4xL2hhbG9fY3NwbF9SQU1fcmV2QjJfMjkuNjMuMS53bWZ3Cisj
IAorIworCiBTVU1NQVJZID0gIkZpcm13YXJlIGZpbGVzIGZvciB1c2Ugd2l0aCBMaW51eCBrZXJu
ZWwiCiBIT01FUEFHRSA9ICJodHRwczovL3d3dy5rZXJuZWwub3JnLyIKIERFU0NSSVBUSU9OID0g
IkxpbnV4IGZpcm13YXJlIGlzIGEgcGFja2FnZSBkaXN0cmlidXRlZCBhbG9uZ3NpZGUgdGhlIExp
bnV4IGtlcm5lbCBcCkBAIC0xNTAsNyArMjk2LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxl
Oi8vTElDRU5DRS5BYmlsaXM7bWQ1PWI1ZWUzZjQxMDc4MGU1NjcxMWFkNDhlYWRjMjJiOGJjIFwK
ICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOQ0UueGM0MDAwO21kNT0wZmY1MWQyZGM0
OWZjZTA0ODE0YzkxNTUwODEwOTJmMCBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNF
TkNFLnhjNTAwMDttZDU9MWUxNzBjMTMxNzUzMjNjMzJjN2Y0ZDA5OThkNTNmNjYgXAogICAgICAg
ICAgICAgICAgICAgICBmaWxlOi8vTElDRU5DRS54YzUwMDBjO21kNT0xMmIwMmVmYTMwNDlkYjY1
ZDUyNGFlYjQxOGRkODdjYSBcCi0gICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9XSEVOQ0U7bWQ1
PSR7V0hFTkNFX0NIS1NVTX0gXAorICAgICAgICAgICAgICAgICAgICBmaWxlOi8vV0hFTkNFO21k
NT01MTRkYTFjZDhiMzYzMzczMDMwZjBjMTY3NDlmZWI4ZCBcCiAgICAgICAgICAgICAgICAgICAg
ICIKICMgV0hFTkNFIGNoZWNrc3VtIGlzIGRlZmluZWQgc2VwYXJhdGVseSB0byBlYXNlIG92ZXJy
aWRpbmcgaXQgaWYKICMgY2xhc3MtZGV2dXBzdHJlYW0gaXMgc2VsZWN0ZWQuCkBAIC0yNDEsNyAr
Mzg3LDcgQEAgU1JDX1VSSTpjbGFzcy1kZXZ1cHN0cmVhbSA9ICJnaXQ6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvZmlybXcKICMgUGluIHRoaXMgdG8gdGhlIDIwMjIw
NTA5IHJlbGVhc2UsIG92ZXJyaWRlIHRoaXMgaW4gbG9jYWwuY29uZgogU1JDUkVWOmNsYXNzLWRl
dnVwc3RyZWFtID89ICJiMTljYmRjYTc4YWIyYWRmZDIxMGM5MWJlMTVhMjI1NjhlOGI4Y2FlIgog
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYmYwZjIzOWRjMDgwMWU5ZDZiZjVkNWZiM2UyZjU0OTU3
NTYzMmNmNDY4OGY0MzQ4MTg0MTk5Y2IwMmMyYmNkNyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJi
MjMyN2E1NGFkMTg5N2M4MjgwMDhjYWY2M2FmNWVlMTU0NjliYTcyM2E1MDE2YmU1OGYyYjQ0ZjA3
YmQ0Yjk0IgogCiBpbmhlcml0IGFsbGFyY2gKIAotLSAKMi40Mi4wCgo=

--===============1625745252636682598==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: FILELIST: added "/usr/lib/firmware/brcm/brcmfmac43340-sdio.Insyde-VESPA2.txt"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: FILELIST: added "/usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38ab-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa38a9-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa38a9-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa38a9-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa38a9-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38ab-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa38a9.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa38ab.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38a9.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38ab.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa38ab-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa38ab-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa38ab-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cal
 i-17aa38ab-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38ab-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38a9-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38a9-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38a9-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38a9-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38ab-spkid1-l0.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: FILELIST: added "/usr/lib/firmware/i915/xe2lpd_dmc.bin"
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: added "/usr/lib/firmware/intel/ipu/shisp_2401a0_v21.bin /usr/lib/firmware/intel/ipu/shisp_2400b0_v21.bin"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGSIZE changed from 66167853 to 89233509 (+35%)

--===============1625745252636682598==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/linux-firmware: SRC_URI changed from "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20240220.tar.xz" to "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20240312.tar.xz"
packages/all-poky-linux/linux-firmware: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PKGSIZE changed from 82445402 to 82455642 (+0%)
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
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: FILELIST: added "/usr/lib/firmware/brcm/brcmfmac43340-sdio.Insyde-VESPA2.txt"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PKGSIZE changed from 416655 to 418342 (+0%)
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
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: FILELIST: added "/usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38ab-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38ab-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38ab-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38a9-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa38a9-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa38a9-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa38a9-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa38a9-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa38ab-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa38ab-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38a9-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38a9-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38a9-spkid1-r0.bin /usr/lib/
 firmware/cirrus/cs35l41-dsp1-spk-cali-17aa38ab-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa38ab-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38ab-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa38ab.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-cali-17aa38a9.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38a9.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38ab.wmfw"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: PKGSIZE changed from 2080918 to 2109778 (+1%)
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
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915: FILELIST: added "/usr/lib/firmware/i915/xe2lpd_dmc.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGSIZE changed from 27962115 to 28023323 (+0%)
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
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PKGSIZE changed from 6717624 to 6718420 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9260: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9260: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9260: PKGSIZE changed from 6689156 to 6690012 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PKGV changed from 20240220 [default] to 20240312 [default]
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
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek: PKGSIZE changed from 35987488 to 35983904 (-0%)
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
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGSIZE changed from 309723 to 311932 (+1%)
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
packages/all-poky-linux/linux-firmware/linux-firmware: PV changed from "20240220" to "20240312"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGV changed from 20240220 [default] to 20240312 [default]
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: added "/usr/lib/firmware/intel/ipu/shisp_2401a0_v21.bin /usr/lib/firmware/intel/ipu/shisp_2400b0_v21.bin"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGSIZE changed from 66167853 to 89233509 (+35%)

--===============1625745252636682598==--

