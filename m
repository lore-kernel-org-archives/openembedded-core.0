Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF721C54FBF
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:37:14 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.14638.1700059033036629592
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:37:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=LOPXCOsG;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=pwKOw7Xt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018bd36a2b26-f84f13ca-f075-4ec7-ad1a-525a3fd741d8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700059032;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PpuH1/HZtdyLzoU5yMHz8azzt/MypvFwQpJlcwqAh5g=;
	b=LOPXCOsGjifT85MsD+MWhdEpVOkAfQ8jD6y999gYnk8nHGRTrtU2XftDpV8QCXJ6
	iCIrW5EgszZHn+A01NvQ3o9FApZZxWIp0fDmu26vzgGqyrpfWpBEgkmGYWaDFFIKU+v
	XD32wdBJ1ge7vfy4pJMDjMQtCIzMJmE2r8X0mUJo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700059032;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PpuH1/HZtdyLzoU5yMHz8azzt/MypvFwQpJlcwqAh5g=;
	b=pwKOw7Xtgby3+iwuOcXIj7iaVCiRsUvdjZqKqiBD6BHhY2Tk1OG03YeVVS/W99L1
	GQ2lzDQLQ9k2lDkxHHjuPJG0aT4Tuhr9yiMNe0rxPh7hmKjTLAaz+cqI1QM+++bjibT
	8MdL2W/4bLqJtb/tHUhvnRVKg/NUKJtmTsgMCsXI=
Content-Type: multipart/mixed; boundary="===============2999280182640616258=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] linux-firmware: upgrading to 20231111 FAILED
Message-ID: <0101018bd36a2b26-f84f13ca-f075-4ec7-ad1a-525a3fd741d8-000000@us-west-2.amazonses.com>
Date: Wed, 15 Nov 2023 14:37:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:37:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190703

--===============2999280182640616258==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *linux-firmware* to *20231111* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-linux-firmware-upgrade-20231030-20231111.patch
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
From 029ac6cc1e92a8e793b15f0aa3d520116a6686e8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Nov 2023 12:26:09 +0000
Subject: [PATCH] linux-firmware: upgrade 20231030 -> 20231111

---
 ...20231030.bb => linux-firmware_20231111.bb} | 171 +++++++++++++++++-
 1 file changed, 169 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20231030.bb => linux-firmware_20231111.bb} (92%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20231111.bb
similarity index 92%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20231111.bb
index c0394b9b3b..e015dde93e 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20231111.bb
@@ -1,3 +1,170 @@
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
+# @@ -1143,6 +1143,16 @@
+#  Link: intel/ipu3-fw.bin -> irci_irci_ecr-master_20161208_0213_20170112_1500.bin
+#  
+#  Licence: Redistributable. See LICENSE.ipu3_firmware for details
+# +
+# +--------------------------------------------------------------------------
+# +
+# +Driver: ixp4xx-npe - Intel IXP4xx XScale Network Processing Engine (NPE) Firmware
+# +File: ixp4xx/NPE-A
+# +File: ixp4xx/NPE-A-HSS
+# +File: ixp4xx/NPE-B
+# +File: ixp4xx/NPE-C
+# +Version: date = February 26, 2007
+# +License: Redistributable. See LICENSE.ixp4xx for details
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -3794,17 +3804,17 @@
+#  File:intel/ibt-19-240-4.ddc
+#  Version: BT_HarrisonPeak_REL53497
+#  File:intel/ibt-0041-0041.sfi
+# -Version: BT_TyphoonPeak_REL66410
+# +Version: BT_TyphoonPeak_REL70976
+#  File:intel/ibt-0041-0041.ddc
+# -Version: BT_TyphoonPeak_REL66410
+# +Version: BT_TyphoonPeak_REL70976
+#  File:intel/ibt-0040-0041.sfi
+# -Version: BT_Solar_GfP2_REL66410
+# +Version: BT_Solar_GfP2_REL70976
+#  File:intel/ibt-0040-0041.ddc
+# -Version: BT_Solar_GfP2_REL66410
+# +Version: BT_Solar_GfP2_REL70976
+#  File:intel/ibt-1040-0041.sfi
+# -Version: BT_SolarF_GfP2_REL66410
+# +Version: BT_SolarF_GfP2_REL70976
+#  File:intel/ibt-1040-0041.ddc
+# -Version: BT_SolarF_GfP2_REL66410
+# +Version: BT_SolarF_GfP2_REL70976
+#  
+#  File:intel/ibt-0040-1020.sfi
+#  Version: BT_Solar_JfP1_REL59564
+# @@ -3825,33 +3835,33 @@
+#  Version: BT_SolarF_JfP2_REL59564
+#  
+#  File:intel/ibt-0040-4150.sfi
+# -Version: BT_Solar_JnP2_REL66410
+# +Version: BT_Solar_JnP2_REL70976
+#  File:intel/ibt-0040-4150.ddc
+# -Version: BT_Solar_JnP2_REL66410
+# +Version: BT_Solar_JnP2_REL70976
+#  File:intel/ibt-1040-4150.sfi
+# -Version: BT_SolarF_JnP2_REL66410
+# +Version: BT_SolarF_JnP2_REL70976
+#  File:intel/ibt-1040-4150.ddc
+# -Version: BT_SolarF_JnP2_REL66410
+# +Version: BT_SolarF_JnP2_REL70976
+#  
+#  File:intel/ibt-0291-0291.sfi
+# -Version: BT_GalePeak_REL39025
+# +Version: BT_GalePeak_REL43914
+#  File:intel/ibt-0291-0291.ddc
+# -Version: BT_GalePeak_REL39025
+# +Version: BT_GalePeak_REL43914
+#  
+#  File:intel/ibt-0180-0041.sfi
+# -Version: BT_Magnetar_GfP2_REL82221
+# +Version: BT_Magnetar_GfP2_REL90033
+#  File:intel/ibt-0180-0041.ddc
+# -Version: BT_Magnetar_GfP2_REL82221
+# +Version: BT_Magnetar_GfP2_REL90033
+#  
+#  File:intel/ibt-0180-4150.sfi
+# -Version: BT_Magnetar_HrP2_REL82221
+# +Version: BT_Magnetar_JnP2_REL90033
+#  File:intel/ibt-0180-4150.ddc
+# -Version: BT_Magnetar_HrP2_REL82221
+# +Version: BT_Magnetar_JnP2_REL90033
+#  
+#  File:intel/ibt-0180-1050.sfi
+# -Version: BT_Magnetar_HrP1_REL82221
+# +Version: BT_Magnetar_HrP1_REL90033
+#  File:intel/ibt-0180-1050.ddc
+# -Version: BT_Magnetar_HrP1_REL82221
+# +Version: BT_Magnetar_HrP1_REL90033
+#  
+#  Licence: Redistributable. See LICENCE.ibt_firmware for details
+#  
+# @@ -4364,6 +4374,17 @@
+#  File: qca/nvm_usb_00190200.bin
+#  
+#  Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k and qca/NOTICE.txt for details
+# +
+# +--------------------------------------------------------------------------
+# +
+# +Driver: qca - Qualcomm Atheros Bluetooth support for WCN3988 chips
+# +
+# +File: qca/apbtfw10.tlv
+# +File: qca/apbtfw11.tlv
+# +File: qca/apnv10.bin
+# +File: qca/apnv11.bin
+# +
+# +Licence: Redistributable. See LICENSE.qcom and qca/NOTICE.txt for details
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -5211,6 +5232,48 @@
+#  File: nvidia/tu10x/typec/ccg_primary.cyacd
+#  File: nvidia/tu10x/typec/ccg_secondary.cyacd
+#  File: nvidia/tu10x/typec/ccg_boot.cyacd
+# +
+# +Firmware images needed for GSP-RM:
+# +
+# +File: nvidia/tu102/gsp/bootloader-535.113.01.bin
+# +File: nvidia/tu102/gsp/booter_load-535.113.01.bin
+# +File: nvidia/tu102/gsp/booter_unload-535.113.01.bin
+# +Link: nvidia/tu104/gsp -> ../tu102/gsp
+# +Link: nvidia/tu106/gsp -> ../tu102/gsp
+# +
+# +File: nvidia/tu116/gsp/booter_load-535.113.01.bin
+# +File: nvidia/tu116/gsp/booter_unload-535.113.01.bin
+# +Link: nvidia/tu116/gsp/bootloader-535.113.01.bin -> ../../tu102/gsp/bootloader-535.113.01.bin
+# +Link: nvidia/tu117/gsp -> ../tu116/gsp
+# +
+# +File: nvidia/ga100/gsp/bootloader-535.113.01.bin
+# +File: nvidia/ga100/gsp/booter_load-535.113.01.bin
+# +File: nvidia/ga100/gsp/booter_unload-535.113.01.bin
+# +
+# +File: nvidia/ad102/gsp/bootloader-535.113.01.bin
+# +File: nvidia/ad102/gsp/booter_load-535.113.01.bin
+# +File: nvidia/ad102/gsp/booter_unload-535.113.01.bin
+# +Link: nvidia/ad103/gsp -> ../ad102/gsp
+# +Link: nvidia/ad104/gsp -> ../ad102/gsp
+# +Link: nvidia/ad106/gsp -> ../ad102/gsp
+# +Link: nvidia/ad107/gsp -> ../ad102/gsp
+# +
+# +File: nvidia/ga102/gsp/bootloader-535.113.01.bin
+# +File: nvidia/ga102/gsp/booter_load-535.113.01.bin
+# +File: nvidia/ga102/gsp/booter_unload-535.113.01.bin
+# +Link: nvidia/ga103/gsp -> ../ga102/gsp
+# +Link: nvidia/ga104/gsp -> ../ga102/gsp
+# +Link: nvidia/ga106/gsp -> ../ga102/gsp
+# +Link: nvidia/ga107/gsp -> ../ga102/gsp
+# +
+# +File: nvidia/tu102/gsp/gsp-535.113.01.bin
+# +Origin: gsp_tu10x.bin from NVIDIA-Linux-x86_64-535.113.01.run
+# +Link: nvidia/tu116/gsp/gsp-535.113.01.bin -> ../../tu102/gsp/gsp-535.113.01.bin
+# +Link: nvidia/ga100/gsp/gsp-535.113.01.bin -> ../../tu102/gsp/gsp-535.113.01.bin
+# +
+# +File: nvidia/ga102/gsp/gsp-535.113.01.bin
+# +Origin: gsp_ga10x.bin from NVIDIA-Linux-x86_64-535.113.01.run
+# +Link: nvidia/ad102/gsp/gsp-535.113.01.bin -> ../../ga102/gsp/gsp-535.113.01.bin
+#  
+#  Licence: Redistributable. See LICENCE.nvidia for details
+#  
+# 
+#
+
 SUMMARY = "Firmware files for use with Linux kernel"
 HOMEPAGE = "https://www.kernel.org/"
 DESCRIPTION = "Linux firmware is a package distributed alongside the Linux kernel \
@@ -147,7 +314,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=${WHENCE_CHKSUM} \
+                    file://WHENCE;md5=4b94007ebc35009d5e657ddd4b63005e \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
@@ -237,7 +404,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "c98d200fc4a3120de1a594713ce34e135819dff23e883a4ed387863ba25679c7"
+SRC_URI[sha256sum] = "8d4959c1293ff8a6e40ac3d265205297a3e93e4fe5e8e25a7d16cfed78cbb098"
 
 inherit allarch
 
-- 
2.39.2


--===============2999280182640616258==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-linux-firmware-upgrade-20231030-20231111.patch"

RnJvbSAwMjlhYzZjYzFlOTJhOGU3OTNiMTVmMGFhM2Q1MjAxMTZhNjY4NmU4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTm92IDIwMjMgMTI6MjY6MDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aW51eC1maXJtd2FyZTogdXBncmFkZSAyMDIzMTAzMCAtPiAyMDIzMTExMQoKLS0tCiAuLi4yMDIz
MTAzMC5iYiA9PiBsaW51eC1maXJtd2FyZV8yMDIzMTExMS5iYn0gfCAxNzEgKysrKysrKysrKysr
KysrKystCiAxIGZpbGUgY2hhbmdlZCwgMTY5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS97bGludXgtZmlybXdh
cmVfMjAyMzEwMzAuYmIgPT4gbGludXgtZmlybXdhcmVfMjAyMzExMTEuYmJ9ICg5MiUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2Fy
ZV8yMDIzMTAzMC5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgt
ZmlybXdhcmVfMjAyMzExMTEuYmIKc2ltaWxhcml0eSBpbmRleCA5MiUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZV8yMDIzMTAzMC5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJt
d2FyZV8yMDIzMTExMS5iYgppbmRleCBjMDM5NGI5YjNiLi5lMDE1ZGRlOTNlIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlXzIwMjMx
MDMwLmJiCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgtZmly
bXdhcmVfMjAyMzExMTEuYmIKQEAgLTEsMyArMSwxNzAgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklM
RVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4K
KyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRo
ZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlm
IG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3Nh
Z2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0
ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0t
LSBXSEVOQ0UKKyMgKysrIFdIRU5DRQorIyBAQCAtMTE0Myw2ICsxMTQzLDE2IEBACisjICBMaW5r
OiBpbnRlbC9pcHUzLWZ3LmJpbiAtPiBpcmNpX2lyY2lfZWNyLW1hc3Rlcl8yMDE2MTIwOF8wMjEz
XzIwMTcwMTEyXzE1MDAuYmluCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2Vl
IExJQ0VOU0UuaXB1M19maXJtd2FyZSBmb3IgZGV0YWlscworIyArCisjICstLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQorIyArCisjICtEcml2ZXI6IGl4cDR4eC1ucGUgLSBJbnRlbCBJWFA0eHggWFNjYWxlIE5l
dHdvcmsgUHJvY2Vzc2luZyBFbmdpbmUgKE5QRSkgRmlybXdhcmUKKyMgK0ZpbGU6IGl4cDR4eC9O
UEUtQQorIyArRmlsZTogaXhwNHh4L05QRS1BLUhTUworIyArRmlsZTogaXhwNHh4L05QRS1CCisj
ICtGaWxlOiBpeHA0eHgvTlBFLUMKKyMgK1ZlcnNpb246IGRhdGUgPSBGZWJydWFyeSAyNiwgMjAw
NworIyArTGljZW5zZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5peHA0eHggZm9yIGRl
dGFpbHMKKyMgIAorIyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgIAorIyBAQCAtMzc5NCwxNyArMzgw
NCwxNyBAQAorIyAgRmlsZTppbnRlbC9pYnQtMTktMjQwLTQuZGRjCisjICBWZXJzaW9uOiBCVF9I
YXJyaXNvblBlYWtfUkVMNTM0OTcKKyMgIEZpbGU6aW50ZWwvaWJ0LTAwNDEtMDA0MS5zZmkKKyMg
LVZlcnNpb246IEJUX1R5cGhvb25QZWFrX1JFTDY2NDEwCisjICtWZXJzaW9uOiBCVF9UeXBob29u
UGVha19SRUw3MDk3NgorIyAgRmlsZTppbnRlbC9pYnQtMDA0MS0wMDQxLmRkYworIyAtVmVyc2lv
bjogQlRfVHlwaG9vblBlYWtfUkVMNjY0MTAKKyMgK1ZlcnNpb246IEJUX1R5cGhvb25QZWFrX1JF
TDcwOTc2CisjICBGaWxlOmludGVsL2lidC0wMDQwLTAwNDEuc2ZpCisjIC1WZXJzaW9uOiBCVF9T
b2xhcl9HZlAyX1JFTDY2NDEwCisjICtWZXJzaW9uOiBCVF9Tb2xhcl9HZlAyX1JFTDcwOTc2Cisj
ICBGaWxlOmludGVsL2lidC0wMDQwLTAwNDEuZGRjCisjIC1WZXJzaW9uOiBCVF9Tb2xhcl9HZlAy
X1JFTDY2NDEwCisjICtWZXJzaW9uOiBCVF9Tb2xhcl9HZlAyX1JFTDcwOTc2CisjICBGaWxlOmlu
dGVsL2lidC0xMDQwLTAwNDEuc2ZpCisjIC1WZXJzaW9uOiBCVF9Tb2xhckZfR2ZQMl9SRUw2NjQx
MAorIyArVmVyc2lvbjogQlRfU29sYXJGX0dmUDJfUkVMNzA5NzYKKyMgIEZpbGU6aW50ZWwvaWJ0
LTEwNDAtMDA0MS5kZGMKKyMgLVZlcnNpb246IEJUX1NvbGFyRl9HZlAyX1JFTDY2NDEwCisjICtW
ZXJzaW9uOiBCVF9Tb2xhckZfR2ZQMl9SRUw3MDk3NgorIyAgCisjICBGaWxlOmludGVsL2lidC0w
MDQwLTEwMjAuc2ZpCisjICBWZXJzaW9uOiBCVF9Tb2xhcl9KZlAxX1JFTDU5NTY0CisjIEBAIC0z
ODI1LDMzICszODM1LDMzIEBACisjICBWZXJzaW9uOiBCVF9Tb2xhckZfSmZQMl9SRUw1OTU2NAor
IyAgCisjICBGaWxlOmludGVsL2lidC0wMDQwLTQxNTAuc2ZpCisjIC1WZXJzaW9uOiBCVF9Tb2xh
cl9KblAyX1JFTDY2NDEwCisjICtWZXJzaW9uOiBCVF9Tb2xhcl9KblAyX1JFTDcwOTc2CisjICBG
aWxlOmludGVsL2lidC0wMDQwLTQxNTAuZGRjCisjIC1WZXJzaW9uOiBCVF9Tb2xhcl9KblAyX1JF
TDY2NDEwCisjICtWZXJzaW9uOiBCVF9Tb2xhcl9KblAyX1JFTDcwOTc2CisjICBGaWxlOmludGVs
L2lidC0xMDQwLTQxNTAuc2ZpCisjIC1WZXJzaW9uOiBCVF9Tb2xhckZfSm5QMl9SRUw2NjQxMAor
IyArVmVyc2lvbjogQlRfU29sYXJGX0puUDJfUkVMNzA5NzYKKyMgIEZpbGU6aW50ZWwvaWJ0LTEw
NDAtNDE1MC5kZGMKKyMgLVZlcnNpb246IEJUX1NvbGFyRl9KblAyX1JFTDY2NDEwCisjICtWZXJz
aW9uOiBCVF9Tb2xhckZfSm5QMl9SRUw3MDk3NgorIyAgCisjICBGaWxlOmludGVsL2lidC0wMjkx
LTAyOTEuc2ZpCisjIC1WZXJzaW9uOiBCVF9HYWxlUGVha19SRUwzOTAyNQorIyArVmVyc2lvbjog
QlRfR2FsZVBlYWtfUkVMNDM5MTQKKyMgIEZpbGU6aW50ZWwvaWJ0LTAyOTEtMDI5MS5kZGMKKyMg
LVZlcnNpb246IEJUX0dhbGVQZWFrX1JFTDM5MDI1CisjICtWZXJzaW9uOiBCVF9HYWxlUGVha19S
RUw0MzkxNAorIyAgCisjICBGaWxlOmludGVsL2lidC0wMTgwLTAwNDEuc2ZpCisjIC1WZXJzaW9u
OiBCVF9NYWduZXRhcl9HZlAyX1JFTDgyMjIxCisjICtWZXJzaW9uOiBCVF9NYWduZXRhcl9HZlAy
X1JFTDkwMDMzCisjICBGaWxlOmludGVsL2lidC0wMTgwLTAwNDEuZGRjCisjIC1WZXJzaW9uOiBC
VF9NYWduZXRhcl9HZlAyX1JFTDgyMjIxCisjICtWZXJzaW9uOiBCVF9NYWduZXRhcl9HZlAyX1JF
TDkwMDMzCisjICAKKyMgIEZpbGU6aW50ZWwvaWJ0LTAxODAtNDE1MC5zZmkKKyMgLVZlcnNpb246
IEJUX01hZ25ldGFyX0hyUDJfUkVMODIyMjEKKyMgK1ZlcnNpb246IEJUX01hZ25ldGFyX0puUDJf
UkVMOTAwMzMKKyMgIEZpbGU6aW50ZWwvaWJ0LTAxODAtNDE1MC5kZGMKKyMgLVZlcnNpb246IEJU
X01hZ25ldGFyX0hyUDJfUkVMODIyMjEKKyMgK1ZlcnNpb246IEJUX01hZ25ldGFyX0puUDJfUkVM
OTAwMzMKKyMgIAorIyAgRmlsZTppbnRlbC9pYnQtMDE4MC0xMDUwLnNmaQorIyAtVmVyc2lvbjog
QlRfTWFnbmV0YXJfSHJQMV9SRUw4MjIyMQorIyArVmVyc2lvbjogQlRfTWFnbmV0YXJfSHJQMV9S
RUw5MDAzMworIyAgRmlsZTppbnRlbC9pYnQtMDE4MC0xMDUwLmRkYworIyAtVmVyc2lvbjogQlRf
TWFnbmV0YXJfSHJQMV9SRUw4MjIyMQorIyArVmVyc2lvbjogQlRfTWFnbmV0YXJfSHJQMV9SRUw5
MDAzMworIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLmlidF9m
aXJtd2FyZSBmb3IgZGV0YWlscworIyAgCisjIEBAIC00MzY0LDYgKzQzNzQsMTcgQEAKKyMgIEZp
bGU6IHFjYS9udm1fdXNiXzAwMTkwMjAwLmJpbgorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1
dGFibGUuIFNlZSBMSUNFTlNFLlF1YWxjb21tQXRoZXJvc19hdGgxMGsgYW5kIHFjYS9OT1RJQ0Uu
dHh0IGZvciBkZXRhaWxzCisjICsKKyMgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICsKKyMgK0RyaXZl
cjogcWNhIC0gUXVhbGNvbW0gQXRoZXJvcyBCbHVldG9vdGggc3VwcG9ydCBmb3IgV0NOMzk4OCBj
aGlwcworIyArCisjICtGaWxlOiBxY2EvYXBidGZ3MTAudGx2CisjICtGaWxlOiBxY2EvYXBidGZ3
MTEudGx2CisjICtGaWxlOiBxY2EvYXBudjEwLmJpbgorIyArRmlsZTogcWNhL2FwbnYxMS5iaW4K
KyMgKworIyArTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5xY29tIGFuZCBx
Y2EvTk9USUNFLnR4dCBmb3IgZGV0YWlscworIyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAg
CisjIEBAIC01MjExLDYgKzUyMzIsNDggQEAKKyMgIEZpbGU6IG52aWRpYS90dTEweC90eXBlYy9j
Y2dfcHJpbWFyeS5jeWFjZAorIyAgRmlsZTogbnZpZGlhL3R1MTB4L3R5cGVjL2NjZ19zZWNvbmRh
cnkuY3lhY2QKKyMgIEZpbGU6IG52aWRpYS90dTEweC90eXBlYy9jY2dfYm9vdC5jeWFjZAorIyAr
CisjICtGaXJtd2FyZSBpbWFnZXMgbmVlZGVkIGZvciBHU1AtUk06CisjICsKKyMgK0ZpbGU6IG52
aWRpYS90dTEwMi9nc3AvYm9vdGxvYWRlci01MzUuMTEzLjAxLmJpbgorIyArRmlsZTogbnZpZGlh
L3R1MTAyL2dzcC9ib290ZXJfbG9hZC01MzUuMTEzLjAxLmJpbgorIyArRmlsZTogbnZpZGlhL3R1
MTAyL2dzcC9ib290ZXJfdW5sb2FkLTUzNS4xMTMuMDEuYmluCisjICtMaW5rOiBudmlkaWEvdHUx
MDQvZ3NwIC0+IC4uL3R1MTAyL2dzcAorIyArTGluazogbnZpZGlhL3R1MTA2L2dzcCAtPiAuLi90
dTEwMi9nc3AKKyMgKworIyArRmlsZTogbnZpZGlhL3R1MTE2L2dzcC9ib290ZXJfbG9hZC01MzUu
MTEzLjAxLmJpbgorIyArRmlsZTogbnZpZGlhL3R1MTE2L2dzcC9ib290ZXJfdW5sb2FkLTUzNS4x
MTMuMDEuYmluCisjICtMaW5rOiBudmlkaWEvdHUxMTYvZ3NwL2Jvb3Rsb2FkZXItNTM1LjExMy4w
MS5iaW4gLT4gLi4vLi4vdHUxMDIvZ3NwL2Jvb3Rsb2FkZXItNTM1LjExMy4wMS5iaW4KKyMgK0xp
bms6IG52aWRpYS90dTExNy9nc3AgLT4gLi4vdHUxMTYvZ3NwCisjICsKKyMgK0ZpbGU6IG52aWRp
YS9nYTEwMC9nc3AvYm9vdGxvYWRlci01MzUuMTEzLjAxLmJpbgorIyArRmlsZTogbnZpZGlhL2dh
MTAwL2dzcC9ib290ZXJfbG9hZC01MzUuMTEzLjAxLmJpbgorIyArRmlsZTogbnZpZGlhL2dhMTAw
L2dzcC9ib290ZXJfdW5sb2FkLTUzNS4xMTMuMDEuYmluCisjICsKKyMgK0ZpbGU6IG52aWRpYS9h
ZDEwMi9nc3AvYm9vdGxvYWRlci01MzUuMTEzLjAxLmJpbgorIyArRmlsZTogbnZpZGlhL2FkMTAy
L2dzcC9ib290ZXJfbG9hZC01MzUuMTEzLjAxLmJpbgorIyArRmlsZTogbnZpZGlhL2FkMTAyL2dz
cC9ib290ZXJfdW5sb2FkLTUzNS4xMTMuMDEuYmluCisjICtMaW5rOiBudmlkaWEvYWQxMDMvZ3Nw
IC0+IC4uL2FkMTAyL2dzcAorIyArTGluazogbnZpZGlhL2FkMTA0L2dzcCAtPiAuLi9hZDEwMi9n
c3AKKyMgK0xpbms6IG52aWRpYS9hZDEwNi9nc3AgLT4gLi4vYWQxMDIvZ3NwCisjICtMaW5rOiBu
dmlkaWEvYWQxMDcvZ3NwIC0+IC4uL2FkMTAyL2dzcAorIyArCisjICtGaWxlOiBudmlkaWEvZ2Ex
MDIvZ3NwL2Jvb3Rsb2FkZXItNTM1LjExMy4wMS5iaW4KKyMgK0ZpbGU6IG52aWRpYS9nYTEwMi9n
c3AvYm9vdGVyX2xvYWQtNTM1LjExMy4wMS5iaW4KKyMgK0ZpbGU6IG52aWRpYS9nYTEwMi9nc3Av
Ym9vdGVyX3VubG9hZC01MzUuMTEzLjAxLmJpbgorIyArTGluazogbnZpZGlhL2dhMTAzL2dzcCAt
PiAuLi9nYTEwMi9nc3AKKyMgK0xpbms6IG52aWRpYS9nYTEwNC9nc3AgLT4gLi4vZ2ExMDIvZ3Nw
CisjICtMaW5rOiBudmlkaWEvZ2ExMDYvZ3NwIC0+IC4uL2dhMTAyL2dzcAorIyArTGluazogbnZp
ZGlhL2dhMTA3L2dzcCAtPiAuLi9nYTEwMi9nc3AKKyMgKworIyArRmlsZTogbnZpZGlhL3R1MTAy
L2dzcC9nc3AtNTM1LjExMy4wMS5iaW4KKyMgK09yaWdpbjogZ3NwX3R1MTB4LmJpbiBmcm9tIE5W
SURJQS1MaW51eC14ODZfNjQtNTM1LjExMy4wMS5ydW4KKyMgK0xpbms6IG52aWRpYS90dTExNi9n
c3AvZ3NwLTUzNS4xMTMuMDEuYmluIC0+IC4uLy4uL3R1MTAyL2dzcC9nc3AtNTM1LjExMy4wMS5i
aW4KKyMgK0xpbms6IG52aWRpYS9nYTEwMC9nc3AvZ3NwLTUzNS4xMTMuMDEuYmluIC0+IC4uLy4u
L3R1MTAyL2dzcC9nc3AtNTM1LjExMy4wMS5iaW4KKyMgKworIyArRmlsZTogbnZpZGlhL2dhMTAy
L2dzcC9nc3AtNTM1LjExMy4wMS5iaW4KKyMgK09yaWdpbjogZ3NwX2dhMTB4LmJpbiBmcm9tIE5W
SURJQS1MaW51eC14ODZfNjQtNTM1LjExMy4wMS5ydW4KKyMgK0xpbms6IG52aWRpYS9hZDEwMi9n
c3AvZ3NwLTUzNS4xMTMuMDEuYmluIC0+IC4uLy4uL2dhMTAyL2dzcC9nc3AtNTM1LjExMy4wMS5i
aW4KKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5udmlkaWEg
Zm9yIGRldGFpbHMKKyMgIAorIyAKKyMKKwogU1VNTUFSWSA9ICJGaXJtd2FyZSBmaWxlcyBmb3Ig
dXNlIHdpdGggTGludXgga2VybmVsIgogSE9NRVBBR0UgPSAiaHR0cHM6Ly93d3cua2VybmVsLm9y
Zy8iCiBERVNDUklQVElPTiA9ICJMaW51eCBmaXJtd2FyZSBpcyBhIHBhY2thZ2UgZGlzdHJpYnV0
ZWQgYWxvbmdzaWRlIHRoZSBMaW51eCBrZXJuZWwgXApAQCAtMTQ3LDcgKzMxNCw3IEBAIExJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOQ0UuQWJpbGlzO21kNT1iNWVlM2Y0MTA3ODBlNTY3
MTFhZDQ4ZWFkYzIyYjhiYyBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTkNFLnhj
NDAwMDttZDU9MGZmNTFkMmRjNDlmY2UwNDgxNGM5MTU1MDgxMDkyZjAgXAogICAgICAgICAgICAg
ICAgICAgICBmaWxlOi8vTElDRU5DRS54YzUwMDA7bWQ1PTFlMTcwYzEzMTc1MzIzYzMyYzdmNGQw
OTk4ZDUzZjY2IFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOQ0UueGM1MDAwYztt
ZDU9MTJiMDJlZmEzMDQ5ZGI2NWQ1MjRhZWI0MThkZDg3Y2EgXAotICAgICAgICAgICAgICAgICAg
ICBmaWxlOi8vV0hFTkNFO21kNT0ke1dIRU5DRV9DSEtTVU19IFwKKyAgICAgICAgICAgICAgICAg
ICAgZmlsZTovL1dIRU5DRTttZDU9NGI5NDAwN2ViYzM1MDA5ZDVlNjU3ZGRkNGI2MzAwNWUgXAog
ICAgICAgICAgICAgICAgICAgICAiCiAjIFdIRU5DRSBjaGVja3N1bSBpcyBkZWZpbmVkIHNlcGFy
YXRlbHkgdG8gZWFzZSBvdmVycmlkaW5nIGl0IGlmCiAjIGNsYXNzLWRldnVwc3RyZWFtIGlzIHNl
bGVjdGVkLgpAQCAtMjM3LDcgKzQwNCw3IEBAIFNSQ19VUkk6Y2xhc3MtZGV2dXBzdHJlYW0gPSAi
Z2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2Zpcm13CiAjIFBp
biB0aGlzIHRvIHRoZSAyMDIyMDUwOSByZWxlYXNlLCBvdmVycmlkZSB0aGlzIGluIGxvY2FsLmNv
bmYKIFNSQ1JFVjpjbGFzcy1kZXZ1cHN0cmVhbSA/PSAiYjE5Y2JkY2E3OGFiMmFkZmQyMTBjOTFi
ZTE1YTIyNTY4ZThiOGNhZSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImM5OGQyMDBmYzRhMzEy
MGRlMWE1OTQ3MTNjZTM0ZTEzNTgxOWRmZjIzZTg4M2E0ZWQzODc4NjNiYTI1Njc5YzciCitTUkNf
VVJJW3NoYTI1NnN1bV0gPSAiOGQ0OTU5YzEyOTNmZjhhNmU0MGFjM2QyNjUyMDUyOTdhM2U5M2U0
ZmU1ZThlMjVhN2QxNmNmZWQ3OGNiYjA5OCIKIAogaW5oZXJpdCBhbGxhcmNoCiAKLS0gCjIuMzku
MgoK

--===============2999280182640616258==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1844 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (910 cached, 1 parsed). 1843 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the allarch sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-d52e2ee4cbc168e1b243e22c1ec40fa1cb1525fe"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:d52e2ee4cbc168e1b243e22c1ec40fa1cb1525fe"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 36 Local 24 Mirrors 0 Missed 12 Current 174 (66% match, 94% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 448 of 682 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20231111.bb:do_recipe_qa)
NOTE: recipe linux-firmware-1_20231111-r0: task do_recipe_qa: Started
NOTE: recipe linux-firmware-1_20231111-r0: task do_recipe_qa: Succeeded
NOTE: Running task 663 of 682 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20231111.bb:do_fetch)
NOTE: recipe linux-firmware-1_20231111-r0: task do_fetch: Started
NOTE: recipe linux-firmware-1_20231111-r0: task do_fetch: Succeeded
NOTE: Running task 664 of 682 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20231111.bb:do_unpack)
NOTE: Running task 665 of 682 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20231111.bb:do_prepare_recipe_sysroot)
NOTE: recipe linux-firmware-1_20231111-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-firmware-1_20231111-r0: task do_unpack: Started
NOTE: recipe linux-firmware-1_20231111-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe linux-firmware-1_20231111-r0: task do_unpack: Succeeded
NOTE: Running task 666 of 682 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20231111.bb:do_patch)
NOTE: Running task 667 of 682 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20231111.bb:do_collect_spdx_deps)
NOTE: recipe linux-firmware-1_20231111-r0: task do_collect_spdx_deps: Started
NOTE: recipe linux-firmware-1_20231111-r0: task do_patch: Started
NOTE: recipe linux-firmware-1_20231111-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe linux-firmware-1_20231111-r0: task do_patch: Succeeded
NOTE: Running task 668 of 682 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20231111.bb:do_deploy_source_date_epoch)
NOTE: Running task 669 of 682 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20231111.bb:do_populate_lic)
NOTE: recipe linux-firmware-1_20231111-r0: task do_populate_lic: Started
NOTE: recipe linux-firmware-1_20231111-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe linux-firmware-1_20231111-r0: task do_populate_lic: Succeeded
NOTE: recipe linux-firmware-1_20231111-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 670 of 682 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20231111.bb:do_configure)
NOTE: recipe linux-firmware-1_20231111-r0: task do_configure: Started
NOTE: recipe linux-firmware-1_20231111-r0: task do_configure: Succeeded
NOTE: Running task 671 of 682 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20231111.bb:do_compile)
NOTE: recipe linux-firmware-1_20231111-r0: task do_compile: Started
NOTE: recipe linux-firmware-1_20231111-r0: task do_compile: Succeeded
NOTE: Running task 672 of 682 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20231111.bb:do_install)
NOTE: recipe linux-firmware-1_20231111-r0: task do_install: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['quilt-native', 'patch-native', 'pseudo-native', 'xz-native', 'gettext-minimal-native', 'libtool-native', 'attr-native', 'texinfo-dummy-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_install
| NOTE: make -j 16 -l 52 DESTDIR=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20231111/image FIRMWAREDIR=/usr/lib/firmware install
| install -d /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20231111/image/usr/lib/firmware
| ./copy-firmware.sh /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20231111/image/usr/lib/firmware
| ERROR: rdfind is not installed
| make: *** [Makefile:31: install] Error 1
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20231111/temp/run.do_install.1453823:175 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20231111/temp/run.do_install.1453823, line 175
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20231111/temp/run.do_install.1453823, line 159
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20231111/temp/run.do_install.1453823, line 154
| 	#4: do_install, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20231111/temp/run.do_install.1453823, line 145
| 	#5: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20231111/temp/run.do_install.1453823, line 188
NOTE: recipe linux-firmware-1_20231111-r0: task do_install: Failed
NOTE: Tasks Summary: Attempted 672 tasks of which 661 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231115122531.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231115122531.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20231111.bb:do_install
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: linux-firmware-1_20231111-r0 do_install: oe_runmake failed
ERROR: linux-firmware-1_20231111-r0 do_install: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20231111/temp/run.do_install.1453823', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20231111/temp/log.do_install.1453823
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20231111.bb:do_install) failed with exit code '1'

--===============2999280182640616258==--

