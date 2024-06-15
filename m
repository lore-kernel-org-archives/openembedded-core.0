Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D2B4C2BA1A
	for <webhook@archiver.kernel.org>; Sat, 15 Jun 2024 18:23:28 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.18625.1718475800567029551
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jun 2024 11:23:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Pnn58DNh;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=YNVkVzTa;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101901d23bd48-f587e30d-6a82-466a-b1c9-9c3b4e01b218-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1718475800;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZpUFcF9QVds7pTMBT80ijXmFk+1pNFzP48OTlZpwUQM=;
	b=Pnn58DNhXUcaFVwy0agTv1JGr+e85MboLE316ML8a5XpLdkMR1upfeURyh5HS8Br
	PBtzqtoiBV2dSgw9cU7zme7aDVcxUKhKnFxKQeG0UjveStNRni4SM25LOUjHRra2hME
	sZoUEcsJBu5prt1wA6y/oQ8067wD2M5O90nFcLHs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1718475800;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZpUFcF9QVds7pTMBT80ijXmFk+1pNFzP48OTlZpwUQM=;
	b=YNVkVzTaM6BqzS03e8ydqYsn5d2yOkRrF/XjdkpXIFzBLGwK1cEgVdoH6rjTAsjt
	Fbg9mttTOufs1rhMJZ4hbpusYRL4MLluMUWS2nHoRdovUzuKmeFU9s5l5GsY3lfiImI
	yQoVFeUPHW9gsTKjNQMdygcRXTiVhTG0JZGuaaxM=
Content-Type: multipart/mixed; boundary="===============7799647458243812640=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] linux-firmware: upgrading to 20240610 SUCCEEDED
Message-ID: <010101901d23bd48-f587e30d-6a82-466a-b1c9-9c3b4e01b218-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jun 2024 18:23:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jun 2024 18:23:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200723

--===============7799647458243812640==
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
From 200d1110ac03e49eea22e78c460a0e3892b5de9c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jun 2024 14:52:26 +0000
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


--===============7799647458243812640==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-linux-firmware-upgrade-20240513-20240610.patch"

RnJvbSAyMDBkMTExMGFjMDNlNDllZWEyMmU3OGM0NjBhMGUzODkyYjVkZTljIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVuIDIwMjQgMTQ6NTI6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aW51eC1maXJtd2FyZTogdXBncmFkZSAyMDI0MDUxMyAtPiAyMDI0MDYxMAoKLS0tCiAuLi4yMDI0
MDUxMy5iYiA9PiBsaW51eC1maXJtd2FyZV8yMDI0MDYxMC5iYn0gfCAxMDcgKysrKysrKysrKysr
KysrKystCiAxIGZpbGUgY2hhbmdlZCwgMTA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS97bGludXgtZmlybXdh
cmVfMjAyNDA1MTMuYmIgPT4gbGludXgtZmlybXdhcmVfMjAyNDA2MTAuYmJ9ICg5NCUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2Fy
ZV8yMDI0MDUxMy5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgt
ZmlybXdhcmVfMjAyNDA2MTAuYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZV8yMDI0MDUxMy5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJt
d2FyZV8yMDI0MDYxMC5iYgppbmRleCA0YTg3MTA1ZDk4Li4xMjM0M2YxOWI5IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlXzIwMjQw
NTEzLmJiCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgtZmly
bXdhcmVfMjAyNDA2MTAuYmIKQEAgLTEsMyArMSwxMDYgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklM
RVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4K
KyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRo
ZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlm
IG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3Nh
Z2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0
ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0t
LSBXSEVOQ0UKKyMgKysrIFdIRU5DRQorIyBAQCAtMjU3NywxMiArMjU3NywyMCBAQAorIyAgRmls
ZTogYW1kZ3B1L2djXzExXzVfMF9tZXNfMi5iaW4KKyMgIEZpbGU6IGFtZGdwdS9nY18xMV81XzBf
cGZwLmJpbgorIyAgRmlsZTogYW1kZ3B1L2djXzExXzVfMF9ybGMuYmluCisjICtGaWxlOiBhbWRn
cHUvZ2NfMTFfNV8xX2ltdS5iaW4KKyMgK0ZpbGU6IGFtZGdwdS9nY18xMV81XzFfbWUuYmluCisj
ICtGaWxlOiBhbWRncHUvZ2NfMTFfNV8xX21lYy5iaW4KKyMgK0ZpbGU6IGFtZGdwdS9nY18xMV81
XzFfbWVzMS5iaW4KKyMgK0ZpbGU6IGFtZGdwdS9nY18xMV81XzFfbWVzXzIuYmluCisjICtGaWxl
OiBhbWRncHUvZ2NfMTFfNV8xX3BmcC5iaW4KKyMgK0ZpbGU6IGFtZGdwdS9nY18xMV81XzFfcmxj
LmJpbgorIyAgRmlsZTogYW1kZ3B1L2Rjbl8zXzFfNF9kbWN1Yi5iaW4KKyMgIEZpbGU6IGFtZGdw
dS9kY25fM18xXzVfZG1jdWIuYmluCisjICBGaWxlOiBhbWRncHUvZGNuXzNfMV82X2RtY3ViLmJp
bgorIyAgRmlsZTogYW1kZ3B1L2Rjbl8zXzJfMF9kbWN1Yi5iaW4KKyMgIEZpbGU6IGFtZGdwdS9k
Y25fM18yXzFfZG1jdWIuYmluCisjICBGaWxlOiBhbWRncHUvZGNuXzNfNV9kbWN1Yi5iaW4KKyMg
K0ZpbGU6IGFtZGdwdS9kY25fM181XzFfZG1jdWIuYmluCisjICBGaWxlOiBhbWRncHUvcHNwXzEz
XzBfMF9zb3MuYmluCisjICBGaWxlOiBhbWRncHUvcHNwXzEzXzBfMF90YS5iaW4KKyMgIEZpbGU6
IGFtZGdwdS9wc3BfMTNfMF80X3RhLmJpbgorIyBAQCAtMjYwMyw2ICsyNjExLDggQEAKKyMgIEZp
bGU6IGFtZGdwdS9wc3BfMTNfMF8xMV90b2MuYmluCisjICBGaWxlOiBhbWRncHUvcHNwXzE0XzBf
MF90YS5iaW4KKyMgIEZpbGU6IGFtZGdwdS9wc3BfMTRfMF8wX3RvYy5iaW4KKyMgK0ZpbGU6IGFt
ZGdwdS9wc3BfMTRfMF8xX3RhLmJpbgorIyArRmlsZTogYW1kZ3B1L3BzcF8xNF8wXzFfdG9jLmJp
bgorIyAgRmlsZTogYW1kZ3B1L3NkbWFfNF80XzIuYmluCisjICBGaWxlOiBhbWRncHUvc2RtYV81
XzJfNi5iaW4KKyMgIEZpbGU6IGFtZGdwdS9zZG1hXzVfMl83LmJpbgorIyBAQCAtMjYxMSw2ICsy
NjIxLDcgQEAKKyMgIEZpbGU6IGFtZGdwdS9zZG1hXzZfMF8yLmJpbgorIyAgRmlsZTogYW1kZ3B1
L3NkbWFfNl8wXzMuYmluCisjICBGaWxlOiBhbWRncHUvc2RtYV82XzFfMC5iaW4KKyMgK0ZpbGU6
IGFtZGdwdS9zZG1hXzZfMV8xLmJpbgorIyAgRmlsZTogYW1kZ3B1L3NtdV8xM18wXzAuYmluCisj
ICBGaWxlOiBhbWRncHUvc211XzEzXzBfNi5iaW4KKyMgIEZpbGU6IGFtZGdwdS9zbXVfMTNfMF83
LmJpbgorIyBAQCAtMjYyMiw3ICsyNjMzLDEwIEBACisjICBGaWxlOiBhbWRncHUvdmNuXzRfMF8z
LmJpbgorIyAgRmlsZTogYW1kZ3B1L3Zjbl80XzBfNC5iaW4KKyMgIEZpbGU6IGFtZGdwdS92Y25f
NF8wXzUuYmluCisjICtGaWxlOiBhbWRncHUvdmNuXzRfMF82LmJpbgorIyArRmlsZTogYW1kZ3B1
L3Zjbl80XzBfNl8xLmJpbgorIyAgRmlsZTogYW1kZ3B1L3ZwZV82XzFfMC5iaW4KKyMgK0ZpbGU6
IGFtZGdwdS92cGVfNl8xXzEuYmluCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4g
U2VlIExJQ0VOU0UuYW1kZ3B1IGZvciBkZXRhaWxzLgorIyAgCisjIEBAIC0zMjI2LDYgKzMyNDAs
NyBAQAorIyAgRHJpdmVyOiBydHc4OCAtIFJlYWx0ZWsgODAyLjExYWMgV0xBTiBkcml2ZXIgZm9y
IFJUTDg4MjJCRSBhbmQgUlRMODgyMkNFCisjICAKKyMgIEluZm86IFNlbnQgdG8gTGFycnkgRmlu
Z2VyIGJ5IFJlYWx0ZWsgZW5naW5lZXIgWWFuLUhzdWFuIENodWFuZyA8eWhjaHVhbmdAcmVhbHRl
ay5jb20+CisjICtGaWxlOiBydHc4OC9ydHc4ODIxYV9mdy5iaW4KKyMgIEZpbGU6IHJ0dzg4L3J0
dzg4MjJiX2Z3LmJpbgorIyAgRmlsZTogcnR3ODgvcnR3ODgyMmNfZncuYmluCisjICBGaWxlOiBy
dHc4OC9ydHc4ODIyY193b3dfZncuYmluCisjIEBAIC02OTQ4LDYgKzY5NjMsMjIgQEAKKyMgIEZp
bGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTdhYTM4NjUtcjAuYmluCisjICBGaWxl
OiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTE3YWEzODY2LWwwLmJpbgorIyAgRmlsZTog
Y2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xN2FhMzg2Ni1yMC5iaW4KKyMgK0xpbms6IGNp
cnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTdhYTM4Yzcud21mdyAtPiBjczM1bDQxL3Y2Ljgz
LjAvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS44NS4wLndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1
bDQxLWRzcDEtc3BrLXByb3QtMTdhYTM4Yzgud21mdyAtPiBjczM1bDQxL3Y2LjgzLjAvaGFsb19j
c3BsX1JBTV9yZXZCMl8yOS44NS4wLndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEt
c3BrLXByb3QtMTdhYTM4Zjkud21mdyAtPiBjczM1bDQxL3Y2LjYxLjEvaGFsb19jc3BsX1JBTV9y
ZXZCMl8yOS42My4xLndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3Qt
MTdhYTM4ZmEud21mdyAtPiBjczM1bDQxL3Y2LjYxLjEvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS42
My4xLndtZncKKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTdhYTM4Yzct
c3BraWQwLWwwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xN2Fh
MzhjNy1zcGtpZDAtcjAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90
LTE3YWEzOGM3LXNwa2lkMC1sMS5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3Br
LXByb3QtMTdhYTM4Yzctc3BraWQwLXIxLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNw
MS1zcGstcHJvdC0xN2FhMzhjOC1zcGtpZDEtbDAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0
MS1kc3AxLXNway1wcm90LTE3YWEzOGM4LXNwa2lkMS1yMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9j
czM1bDQxLWRzcDEtc3BrLXByb3QtMTdhYTM4Yzgtc3BraWQxLWwxLmJpbgorIyArRmlsZTogY2ly
cnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xN2FhMzhjOC1zcGtpZDEtcjEuYmluCisjICtGaWxl
OiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTE3YWEzOGZhLXNwa2lkMC1sMC5iaW4KKyMg
K0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTdhYTM4ZmEtc3BraWQwLXIwLmJp
bgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xN2FhMzhmOS1zcGtpZDEt
bDAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTE3YWEzOGY5LXNw
a2lkMS1yMC5iaW4KKyMgIExpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhj
MjYud21mdyAtPiBjczM1bDQxL3Y2LjYxLjEvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS42My4xLndt
ZncKKyMgIExpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhiNDIud21mdyAt
PiBjczM1bDQxL3Y2LjYxLjEvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS42My4xLndtZncKKyMgIExp
bms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzhiNDMud21mdyAtPiBjczM1bDQx
L3Y2LjYxLjEvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS42My4xLndtZncKKyMgQEAgLTczMjQsMyAr
NzM1NSw5IEBACisjICBWZXJzaW9uOiBhcmNoMTAuOAorIyAgCisjICBMaWNlbnNlOiBSZWRpc3Ry
aWJ1dGFibGUuIFNlZSBMSUNFTkNFLm1hbGlfY3NmZncgZm9yIGRldGFpbHMKKyMgKworIyArLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KKyMgK0RyaXZlcjogaXNwIC0gSW1hZ2UgU2lnbmFsIFByb2Nlc3NvciAo
SVNQKSBkZXZpY2UKKyMgK0ZpbGU6IGFtZGdwdS9pc3BfNF8xXzEuYmluCisjICsKKyMgK0xpY2Vu
c2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UuYW1kaXNwIGZvciBkZXRhaWxzCisjIAor
IworCiBTVU1NQVJZID0gIkZpcm13YXJlIGZpbGVzIGZvciB1c2Ugd2l0aCBMaW51eCBrZXJuZWwi
CiBIT01FUEFHRSA9ICJodHRwczovL3d3dy5rZXJuZWwub3JnLyIKIERFU0NSSVBUSU9OID0gIkxp
bnV4IGZpcm13YXJlIGlzIGEgcGFja2FnZSBkaXN0cmlidXRlZCBhbG9uZ3NpZGUgdGhlIExpbnV4
IGtlcm5lbCBcCkBAIC0xNTIsNyArMjU1LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8v
TElDRU5DRS5BYmlsaXM7bWQ1PWI1ZWUzZjQxMDc4MGU1NjcxMWFkNDhlYWRjMjJiOGJjIFwKICAg
ICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOQ0UueGM0MDAwO21kNT0wZmY1MWQyZGM0OWZj
ZTA0ODE0YzkxNTUwODEwOTJmMCBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTkNF
LnhjNTAwMDttZDU9MWUxNzBjMTMxNzUzMjNjMzJjN2Y0ZDA5OThkNTNmNjYgXAogICAgICAgICAg
ICAgICAgICAgICBmaWxlOi8vTElDRU5DRS54YzUwMDBjO21kNT0xMmIwMmVmYTMwNDlkYjY1ZDUy
NGFlYjQxOGRkODdjYSBcCi0gICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9XSEVOQ0U7bWQ1PSR7
V0hFTkNFX0NIS1NVTX0gXAorICAgICAgICAgICAgICAgICAgICBmaWxlOi8vV0hFTkNFO21kNT1i
MDM2YzExYTcxNTc0NzYwNWI0OTQxM2M5YTRmMzM4MSBcCiAgICAgICAgICAgICAgICAgICAgICIK
ICMgV0hFTkNFIGNoZWNrc3VtIGlzIGRlZmluZWQgc2VwYXJhdGVseSB0byBlYXNlIG92ZXJyaWRp
bmcgaXQgaWYKICMgY2xhc3MtZGV2dXBzdHJlYW0gaXMgc2VsZWN0ZWQuCkBAIC0yNDQsNyArMzQ3
LDcgQEAgU1JDX1VSSTpjbGFzcy1kZXZ1cHN0cmVhbSA9ICJnaXQ6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvZmlybXcKICMgUGluIHRoaXMgdG8gdGhlIDIwMjIwNTA5
IHJlbGVhc2UsIG92ZXJyaWRlIHRoaXMgaW4gbG9jYWwuY29uZgogU1JDUkVWOmNsYXNzLWRldnVw
c3RyZWFtID89ICJiMTljYmRjYTc4YWIyYWRmZDIxMGM5MWJlMTVhMjI1NjhlOGI4Y2FlIgogCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiOWYwNWVkYjk5NjY4MTM1ZDM3Y2VkYzRmZGQxOGFhYzI4MDJk
YzllNDU2NmUwODZlNmM2YzJlMzIxZjNlY2M0ZSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJlMjZh
NTA2NzBmYjc3Mzk0ZjEwZDc1Zjk2ZWIxZmFhMWQzZDlmYjU3YjhiNzIwNzVmMGFmODU4Y2I0NWQy
YTc3IgogCiBpbmhlcml0IGFsbGFyY2gKIAotLSAKMi40NC4wCgo=

--===============7799647458243812640==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: FILELIST: added "/usr/lib/firmware/amdgpu/sdma_6_1_1.bin /usr/lib/firmware/amdgpu/gc_11_5_1_mes1.bin /usr/lib/firmware/amdgpu/gc_11_5_1_rlc.bin /usr/lib/firmware/amdgpu/gc_11_5_1_imu.bin /usr/lib/firmware/amdgpu/gc_11_5_1_mec.bin /usr/lib/firmware/amdgpu/gc_11_5_1_pfp.bin /usr/lib/firmware/amdgpu/gc_11_5_1_mes_2.bin /usr/lib/firmware/amdgpu/dcn_3_5_1_dmcub.bin /usr/lib/firmware/amdgpu/vcn_4_0_6_1.bin /usr/lib/firmware/amdgpu/psp_14_0_1_toc.bin /usr/lib/firmware/amdgpu/vpe_6_1_1.bin /usr/lib/firmware/amdgpu/isp_4_1_1.bin /usr/lib/firmware/amdgpu/psp_14_0_1_ta.bin /usr/lib/firmware/amdgpu/gc_11_5_1_me.bin /usr/lib/firmware/amdgpu/vcn_4_0_6.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: FILELIST: added "/usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-l1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-l1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-r1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-r1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38f9-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38f9-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38fa-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c7.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c8.wmfw /usr/lib/firmware/cirrus/cs
 35l41-dsp1-spk-prot-17aa38f9.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38fa.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38fa-spkid0-r0.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-license: FILELIST: added "/usr/lib/firmware/LICENSE.amdisp"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: FILELIST: added "/usr/lib/firmware/rtw88/rtw8821a_fw.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PKGSIZE changed from 216662 to 248560 (+15%)

--===============7799647458243812640==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/linux-firmware: SRC_URI changed from "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20240513.tar.xz" to "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20240610.tar.xz"
packages/all-poky-linux/linux-firmware: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PKGSIZE changed from 85527210 to 92649114 (+8%)
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: FILELIST: added "/usr/lib/firmware/amdgpu/sdma_6_1_1.bin /usr/lib/firmware/amdgpu/isp_4_1_1.bin /usr/lib/firmware/amdgpu/vpe_6_1_1.bin /usr/lib/firmware/amdgpu/gc_11_5_1_mes1.bin /usr/lib/firmware/amdgpu/gc_11_5_1_mes_2.bin /usr/lib/firmware/amdgpu/gc_11_5_1_imu.bin /usr/lib/firmware/amdgpu/gc_11_5_1_mec.bin /usr/lib/firmware/amdgpu/vcn_4_0_6_1.bin /usr/lib/firmware/amdgpu/psp_14_0_1_ta.bin /usr/lib/firmware/amdgpu/gc_11_5_1_pfp.bin /usr/lib/firmware/amdgpu/gc_11_5_1_rlc.bin /usr/lib/firmware/amdgpu/dcn_3_5_1_dmcub.bin /usr/lib/firmware/amdgpu/vcn_4_0_6.bin /usr/lib/firmware/amdgpu/psp_14_0_1_toc.bin /usr/lib/firmware/amdgpu/gc_11_5_1_me.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amphion-vpu: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ar5523: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar5523: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath12k: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2x: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2x: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: PKGSIZE changed from 2260402 to 2321538 (+3%)
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: FILELIST: added "/usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-l1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-r1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38f9-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38f9-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38fa-spkid0-l0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38fa-spkid0-r0.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c7.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c8.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38f9.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp
 1-spk-prot-17aa38c7-spkid0-l1.bin /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38fa.wmfw /usr/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-r1.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-cirrus: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-cnm-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cnm-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-cnm: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cnm: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cw1200: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-18: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-18: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-enhanced: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9260: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9260: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGSIZE changed from 98464 to 106926 (+9%)
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-license: FILELIST: added "/usr/lib/firmware/LICENSE.amdisp"
packages/all-poky-linux/linux-firmware/linux-firmware-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-mali-csffw-arch108: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mali-csffw-arch108: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-mali-csffw-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mali-csffw-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mediatek: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-mellanox: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mellanox: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-microchip-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-microchip-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-microchip: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-microchip: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-moxa-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-moxa-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-moxa: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-moxa: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7650: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7650: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x2: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt76x2: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp-mc: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8987-sdio: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8987-sdio: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-common: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-common: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-pcie: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-pcie: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-sdio: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp8997-sdio: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-common: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-common: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-pcie: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-pcie: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-sdio: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxp9098-sdio: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw416-sdio: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw416-sdio: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw612-sdio: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nxpiw612-sdio: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-olpc-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-olpc-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-olpc: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-olpc: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-phanfw: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-powervr-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-powervr-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-powervr: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-powervr: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-prestera: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-prestera: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PKGSIZE changed from 2444995 to 2445819 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a702: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a702: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-modem: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-modem: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-wifi: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8016-wifi: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-adreno: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-adreno: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-adreno: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-adreno: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-audio: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-audio: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-modem: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-modem: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-wifi: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qcm2290-wifi: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-adreno: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-adreno: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-audio: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-audio: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-compute: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-compute: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-modem: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-modem: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-wifi: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-qrb4210-wifi: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-adreno: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-adreno: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-thundercomm-db845c-sensors: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-thundercomm-db845c-sensors: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-adreno: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-adreno: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-thundercomm-rb5-sensors: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-thundercomm-rb5-sensors: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-6.0: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-6.0: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-yamato-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-yamato-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qed: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qed: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qla2xxx: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-dptx: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-dptx: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rockchip-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-nic: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-nic: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8761: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8761: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PKGSIZE changed from 216662 to 248560 (+15%)
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: FILELIST: added "/usr/lib/firmware/rtw88/rtw8821a_fw.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8822: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8822: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-src: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-src: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-keystone: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGSIZE changed from 274394 to 276159 (+1%)
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl1251: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc4000: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c-license: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c-license: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-xc5000c: PV changed from "20240513" to "20240610"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGSIZE changed from 83811421 to 83811452 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware: PKGV changed from 20240513 [default] to 20240610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware: PV changed from "20240513" to "20240610"

--===============7799647458243812640==--

