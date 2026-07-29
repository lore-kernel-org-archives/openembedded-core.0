Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F99EC55164
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 07:24:35 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6070.1785309872049092288
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 00:24:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Fj+L+qk2;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=IIFv9SrK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019facc2bc76-6971ef4a-aeea-4bcd-ad6d-d70986ae84f9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785309871;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=u4wE7qBt4fDEW34K/NQIg3KSxKY3Kt5V2FE1g/xfTzs=;
	b=Fj+L+qk2q+yo4j9cAinOwOlKB/8fXg1bVFzdcJQrSOL2jrZDvtbVm6UtTpxGgHGJ
	H8RCTTdjgshNlkeGEBl2T5zKgIBNRs/jTA8r8D19NOt8v2AP9ljbsRRxWO+CqXc/75G
	hUSUQVFCOFcUrGTSCbUHfZ0OborgxnUJfwu6e+mQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785309871;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=u4wE7qBt4fDEW34K/NQIg3KSxKY3Kt5V2FE1g/xfTzs=;
	b=IIFv9SrKJKlBv0p+VPpQsl46rOkp2xlcDHhOVQF8vJa8/iWbLfumH8APZbYxfPvw
	Zh+Qjfp/pdmAdXYpiaPpVui4qqENla1eoyya/kT8uMh44nZsOZjVC62HO+Uv5J0Pufj
	cmPw3gyU/6ee9CKWaqZto/j/593YI61JBnnrT1aQ=
Content-Type: multipart/mixed; boundary="===============4727647752200385686=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-headers: upgrading to 1.4.357.0 SUCCEEDED
Message-ID: <0101019facc2bc76-6971ef4a-aeea-4bcd-ad6d-d70986ae84f9-000000@us-west-2.amazonses.com>
Date: Wed, 29 Jul 2026 07:24:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.29-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 07:24:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242249

--===============4727647752200385686==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-headers* to *1.4.357.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-headers-upgrade-1.4.350.1-1.4.357.0.patch
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
From 3db2fcb87ce3f39ef3b2e6006acbc34488f768c1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 29 Jul 2026 06:21:51 +0000
Subject: [PATCH] vulkan-headers: upgrade 1.4.350.1 -> 1.4.357.0

e3b1eec Update for Vulkan-Docs 1.4.357
8d6039a Update for Vulkan-Docs 1.4.356
8c26833 Change to dual license on static Vulkan headers
d2d8ded Add new C header
6433e5c Update for Vulkan-Docs 1.4.355
0307c70 build(deps): bump actions/checkout from 6 to 7
01393c3 Update for Vulkan-Docs 1.4.354
45834b7 Update for Vulkan-Docs 1.4.353
015e25c Update for Vulkan-Docs 1.4.352
8cfaaa1 chore: Upgrade reuse to 3.3
0e9de56 Update for Vulkan-Docs 1.4.351
7f233bc Fix incorrect header on AI-Assisted Contributions
bc927f3 Add AI-Assisted Contributions and CLA section
---
 ...4.350.1.bb => vulkan-headers_1.4.357.0.bb} | 34 +++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.4.350.1.bb => vulkan-headers_1.4.357.0.bb} (49%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.1.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb
similarity index 49%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.1.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb
index f6d797cae7..2f15a943a4 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb
@@ -1,3 +1,33 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE.md
+# +++ LICENSE.md
+# @@ -1,12 +1,13 @@
+# -Copyright 2015-2023 The Khronos Group Inc.
+# +Copyright 2015-2026 The Khronos Group Inc.
+#  
+#  Files in this repository fall under one of these licenses:
+#  
+#  - `Apache-2.0`
+#  - `MIT`
+#  
+# -Note: With the exception of `parse_dependency.py` the files using `MIT` license
+# -also fall under `Apache-2.0`. Example:
+# +Note: With the exception of `parse_dependency.py`, which is based on an
+# +external file, files using the `MIT` license also fall under `Apache-2.0`.
+# +Example:
+#  
+#  ```
+#  SPDX-License-Identifier: Apache-2.0 OR MIT
+# 
+#
+
 SUMMARY = "Vulkan Header files and API registry"
 DESCRIPTION = "Vulkan is a 3D graphics and compute API providing cross-platform access \
 to modern GPUs with low overhead and targeting realtime graphics applications such as \
@@ -8,10 +38,10 @@ BUGTRACKER = "https://github.com/KhronosGroup/Vulkan-Headers"
 SECTION = "libs"
 
 LICENSE = "Apache-2.0 AND MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=1bc355d8c4196f774c8b87ed1a8dd625"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=adc9da32fdd898219b3db5529f2185c0"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https;tag=vulkan-sdk-${PV}"
 
-SRCREV = "8864cdc896bbc2a9b6eb36b3218fc9ef57908d77"
+SRCREV = "e3b1eec08173d6b825cd3ac88c885a63b621504a"
 
 inherit cmake
 
-- 
2.47.1


--===============4727647752200385686==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/vulkan-headers (sysroot):
  /usr/include/vulkan/vulkan_ubm.h was added
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-dev: FILELIST: added "/usr/include/vulkan/vulkan_ubm.h"

--===============4727647752200385686==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/vulkan-headers: PKGV changed from 1.4.350.1 [default] to 1.4.357.0 [default]
packages/x86-64-v3-poky-linux/vulkan-headers: PV changed from "1.4.350.1" to "1.4.357.0"
packages/x86-64-v3-poky-linux/vulkan-headers: SRC_URI changed from "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https;tag=vulkan-sdk-1.4.350.1" to "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https;tag=vulkan-sdk-1.4.357.0"
Changes to packages/x86-64-v3-poky-linux/vulkan-headers (sysroot):
  /usr/include/vulkan/vulkan_ubm.h was added
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-dbg: PKGV changed from 1.4.350.1 [default] to 1.4.357.0 [default]
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-dbg: PV changed from "1.4.350.1" to "1.4.357.0"
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-dev: PKGV changed from 1.4.350.1 [default] to 1.4.357.0 [default]
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-dev: FILELIST: added "/usr/include/vulkan/vulkan_ubm.h"
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-dev: PV changed from "1.4.350.1" to "1.4.357.0"
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-dev: PKGSIZE changed from 21577077 to 22050691 (+2%)
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-doc: PKGV changed from 1.4.350.1 [default] to 1.4.357.0 [default]
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-doc: PV changed from "1.4.350.1" to "1.4.357.0"
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-locale: PKGV changed from 1.4.350.1 [default] to 1.4.357.0 [default]
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-locale: PV changed from "1.4.350.1" to "1.4.357.0"
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-src: PKGV changed from 1.4.350.1 [default] to 1.4.357.0 [default]
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-src: PV changed from "1.4.350.1" to "1.4.357.0"
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-staticdev: PKGV changed from 1.4.350.1 [default] to 1.4.357.0 [default]
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-staticdev: PV changed from "1.4.350.1" to "1.4.357.0"
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers: PKGV changed from 1.4.350.1 [default] to 1.4.357.0 [default]
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers: PV changed from "1.4.350.1" to "1.4.357.0"
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers: PKGSIZE changed from 19134140 to 19565208 (+2%)

--===============4727647752200385686==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="vulkan-headers-changelog.txt"

Changelog for vulkan-headers: 1.4.350.1 -> 1.4.357.0

e3b1eec Update for Vulkan-Docs 1.4.357
8d6039a Update for Vulkan-Docs 1.4.356
8c26833 Change to dual license on static Vulkan headers
d2d8ded Add new C header
6433e5c Update for Vulkan-Docs 1.4.355
0307c70 build(deps): bump actions/checkout from 6 to 7
01393c3 Update for Vulkan-Docs 1.4.354
45834b7 Update for Vulkan-Docs 1.4.353
015e25c Update for Vulkan-Docs 1.4.352
8cfaaa1 chore: Upgrade reuse to 3.3
0e9de56 Update for Vulkan-Docs 1.4.351
7f233bc Fix incorrect header on AI-Assisted Contributions
bc927f3 Add AI-Assisted Contributions and CLA section

--===============4727647752200385686==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-headers-upgrade-1.4.350.1-1.4.357.0.patch"

RnJvbSAzZGIyZmNiODdjZTNmMzllZjNiMmU2MDA2YWNiYzM0NDg4Zjc2OGMxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjkgSnVsIDIwMjYgMDY6MjE6NTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4taGVhZGVyczogdXBncmFkZSAxLjQuMzUwLjEgLT4gMS40LjM1Ny4wCgplM2IxZWVjIFVw
ZGF0ZSBmb3IgVnVsa2FuLURvY3MgMS40LjM1Nwo4ZDYwMzlhIFVwZGF0ZSBmb3IgVnVsa2FuLURv
Y3MgMS40LjM1Ngo4YzI2ODMzIENoYW5nZSB0byBkdWFsIGxpY2Vuc2Ugb24gc3RhdGljIFZ1bGth
biBoZWFkZXJzCmQyZDhkZWQgQWRkIG5ldyBDIGhlYWRlcgo2NDMzZTVjIFVwZGF0ZSBmb3IgVnVs
a2FuLURvY3MgMS40LjM1NQowMzA3YzcwIGJ1aWxkKGRlcHMpOiBidW1wIGFjdGlvbnMvY2hlY2tv
dXQgZnJvbSA2IHRvIDcKMDEzOTNjMyBVcGRhdGUgZm9yIFZ1bGthbi1Eb2NzIDEuNC4zNTQKNDU4
MzRiNyBVcGRhdGUgZm9yIFZ1bGthbi1Eb2NzIDEuNC4zNTMKMDE1ZTI1YyBVcGRhdGUgZm9yIFZ1
bGthbi1Eb2NzIDEuNC4zNTIKOGNmYWFhMSBjaG9yZTogVXBncmFkZSByZXVzZSB0byAzLjMKMGU5
ZGU1NiBVcGRhdGUgZm9yIFZ1bGthbi1Eb2NzIDEuNC4zNTEKN2YyMzNiYyBGaXggaW5jb3JyZWN0
IGhlYWRlciBvbiBBSS1Bc3Npc3RlZCBDb250cmlidXRpb25zCmJjOTI3ZjMgQWRkIEFJLUFzc2lz
dGVkIENvbnRyaWJ1dGlvbnMgYW5kIENMQSBzZWN0aW9uCi0tLQogLi4uNC4zNTAuMS5iYiA9PiB2
dWxrYW4taGVhZGVyc18xLjQuMzU3LjAuYmJ9IHwgMzQgKysrKysrKysrKysrKysrKystLQogMSBm
aWxlIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi97dnVsa2FuLWhlYWRlcnNfMS40LjM1MC4xLmJiID0+
IHZ1bGthbi1oZWFkZXJzXzEuNC4zNTcuMC5iYn0gKDQ5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuNC4zNTAuMS5iYiBiL21ldGEv
cmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLWhlYWRlcnNfMS40LjM1Ny4wLmJiCnNpbWls
YXJpdHkgaW5kZXggNDklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4v
dnVsa2FuLWhlYWRlcnNfMS40LjM1MC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuNC4zNTcuMC5iYgppbmRleCBmNmQ3OTdjYWU3Li4y
ZjE1YTk0M2E0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGth
bi1oZWFkZXJzXzEuNC4zNTAuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2Fu
L3Z1bGthbi1oZWFkZXJzXzEuNC4zNTcuMC5iYgpAQCAtMSwzICsxLDMzIEBACisjIEZJWE1FOiB0
aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wg
dXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUg
b2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5T
RSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNv
bW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGlj
ZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2Vz
OgorIworIyAtLS0gTElDRU5TRS5tZAorIyArKysgTElDRU5TRS5tZAorIyBAQCAtMSwxMiArMSwx
MyBAQAorIyAtQ29weXJpZ2h0IDIwMTUtMjAyMyBUaGUgS2hyb25vcyBHcm91cCBJbmMuCisjICtD
b3B5cmlnaHQgMjAxNS0yMDI2IFRoZSBLaHJvbm9zIEdyb3VwIEluYy4KKyMgIAorIyAgRmlsZXMg
aW4gdGhpcyByZXBvc2l0b3J5IGZhbGwgdW5kZXIgb25lIG9mIHRoZXNlIGxpY2Vuc2VzOgorIyAg
CisjICAtIGBBcGFjaGUtMi4wYAorIyAgLSBgTUlUYAorIyAgCisjIC1Ob3RlOiBXaXRoIHRoZSBl
eGNlcHRpb24gb2YgYHBhcnNlX2RlcGVuZGVuY3kucHlgIHRoZSBmaWxlcyB1c2luZyBgTUlUYCBs
aWNlbnNlCisjIC1hbHNvIGZhbGwgdW5kZXIgYEFwYWNoZS0yLjBgLiBFeGFtcGxlOgorIyArTm90
ZTogV2l0aCB0aGUgZXhjZXB0aW9uIG9mIGBwYXJzZV9kZXBlbmRlbmN5LnB5YCwgd2hpY2ggaXMg
YmFzZWQgb24gYW4KKyMgK2V4dGVybmFsIGZpbGUsIGZpbGVzIHVzaW5nIHRoZSBgTUlUYCBsaWNl
bnNlIGFsc28gZmFsbCB1bmRlciBgQXBhY2hlLTIuMGAuCisjICtFeGFtcGxlOgorIyAgCisjICBg
YGAKKyMgIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBBcGFjaGUtMi4wIE9SIE1JVAorIyAKKyMK
KwogU1VNTUFSWSA9ICJWdWxrYW4gSGVhZGVyIGZpbGVzIGFuZCBBUEkgcmVnaXN0cnkiCiBERVND
UklQVElPTiA9ICJWdWxrYW4gaXMgYSAzRCBncmFwaGljcyBhbmQgY29tcHV0ZSBBUEkgcHJvdmlk
aW5nIGNyb3NzLXBsYXRmb3JtIGFjY2VzcyBcCiB0byBtb2Rlcm4gR1BVcyB3aXRoIGxvdyBvdmVy
aGVhZCBhbmQgdGFyZ2V0aW5nIHJlYWx0aW1lIGdyYXBoaWNzIGFwcGxpY2F0aW9ucyBzdWNoIGFz
IFwKQEAgLTgsMTAgKzM4LDEwIEBAIEJVR1RSQUNLRVIgPSAiaHR0cHM6Ly9naXRodWIuY29tL0to
cm9ub3NHcm91cC9WdWxrYW4tSGVhZGVycyIKIFNFQ1RJT04gPSAibGlicyIKIAogTElDRU5TRSA9
ICJBcGFjaGUtMi4wIEFORCBNSVQiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNF
Lm1kO21kNT0xYmMzNTVkOGM0MTk2Zjc3NGM4Yjg3ZWQxYThkZDYyNSIKK0xJQ19GSUxFU19DSEtT
VU0gPSAiZmlsZTovL0xJQ0VOU0UubWQ7bWQ1PWFkYzlkYTMyZmRkODk4MjE5YjNkYjU1MjlmMjE4
NWMwIgogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL0tocm9ub3NHcm91cC9WdWxrYW4tSGVh
ZGVycy5naXQ7YnJhbmNoPW1haW47cHJvdG9jb2w9aHR0cHM7dGFnPXZ1bGthbi1zZGstJHtQVn0i
CiAKLVNSQ1JFViA9ICI4ODY0Y2RjODk2YmJjMmE5YjZlYjM2YjMyMThmYzllZjU3OTA4ZDc3Igor
U1JDUkVWID0gImUzYjFlZWMwODE3M2Q2YjgyNWNkM2FjODhjODg1YTYzYjYyMTUwNGEiCiAKIGlu
aGVyaXQgY21ha2UKIAotLSAKMi40Ny4xCgo=

--===============4727647752200385686==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 954 .bb files complete (0 cached, 954 parsed). 1983 targets, 63 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-9f1525925a2d7d6ad9b0f4e4d9f43e8291f7f61d"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:9f1525925a2d7d6ad9b0f4e4d9f43e8291f7f61d"
meta-yocto-bsp       
meta-poky            = "master:e4690557fb0fffcb5e9a86d1c1ebc550bb0da090"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 449 Local 434 Mirrors 0 Missed 15 Current 263 (96% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 269 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 272 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 273 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 278 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 290 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_package_qa_setscene)
NOTE: Running setscene task 354 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-3.14.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.14.6-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.14.6-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.14.6-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.14.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running task 984 of 1863 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_recipe_qa)
NOTE: recipe python3-3.14.6-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-3.14.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 400 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-3.14.6-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.6-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.14.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 406 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 407 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 408 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 409 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 410 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 411 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 412 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 413 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 414 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.46.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 985 of 1863 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_fetch)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 416 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 417 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.46.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_fetch: Started
NOTE: recipe python3-3.14.6-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 419 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 423 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 430 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 439 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 445 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe binutils-2.46.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 449 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1014 of 1863 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_unpack)
NOTE: Running setscene task 453 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1065 of 1863 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_create_recipe_spdx)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.195-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_unpack: Started
NOTE: recipe python3-3.14.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 476 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 477 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 478 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 479 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 480 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 485 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1068 of 1863 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 490 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe elfutils-0.195-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 498 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.6.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 501 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 506 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 507 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 509 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 511 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running setscene task 512 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 514 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 519 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1099 of 1863 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe expat-2.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.6-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 1111 of 1863 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libarchive-3.8.8-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 545 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_packagedata_setscene)
NOTE: Running setscene task 546 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 553 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.19-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libarchive/3.8.8/temp/log.do_packagedata_setscene.3936284
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.8.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 561 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.8.bb:do_package_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.48-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.13-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1170 of 1863 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe file-5.48-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 571 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.12.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 574 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_packagedata_setscene)
NOTE: Running setscene task 578 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_packagedata_setscene)
NOTE: recipe curl-8.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 582 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 585 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running setscene task 589 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 593 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 594 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.23.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1192 of 1863 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe openssl-3.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_unpack: Succeeded
NOTE: Running task 1193 of 1863 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_patch)
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_patch: Started
NOTE: Running setscene task 601 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata_setscene)
NOTE: recipe libpsl-0.23.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 607 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe openssl-3.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1215 of 1863 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libgpg-error-1.61-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 622 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1236 of 1863 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1237 of 1863 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_generate_toolchain_file)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1239 of 1863 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libarchive-3.8.8-r0: task do_package_setscene: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 627 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1262 of 1863 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libarchive-3.8.8-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 640 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 642 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 647 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 648 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 649 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 651 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.8.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.8.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 662 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 672 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 680 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 681 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 683 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 684 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 685 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 688 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: Running task 1308 of 1863 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 690 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 691 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 692 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 693 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 695 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 01601c830bf0505dffefe38b59daca3ab016e10d573425e9e20abf8724f20aa7
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 700 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 701 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 703 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 704 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 708 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 710 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 712 of 712 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1715 of 1863 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1790 of 1863 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.8.bb:do_packagedata)
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libarchive-3.8.8-r0: task do_packagedata: Started
NOTE: recipe libarchive-3.8.8-r0: task do_packagedata: Succeeded
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1851 of 1863 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_configure)
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_configure: Succeeded
NOTE: Running task 1852 of 1863 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_compile)
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_compile: Succeeded
NOTE: Running task 1853 of 1863 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_install)
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_install: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_install: Succeeded
NOTE: Running task 1854 of 1863 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_package)
NOTE: Running task 1855 of 1863 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_populate_sysroot)
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_package: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_package: Succeeded
NOTE: Running task 1856 of 1863 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_packagedata)
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1857 of 1863 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_create_spdx)
NOTE: Running task 1858 of 1863 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_package_write_ipk)
NOTE: Running task 1859 of 1863 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_package_write_deb)
NOTE: Running task 1860 of 1863 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_package_write_rpm)
NOTE: Running task 1861 of 1863 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_package_qa)
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_create_spdx: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_package_write_ipk: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_package_write_deb: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_package_write_rpm: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_package_qa: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1862 of 1863 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_create_package_spdx)
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_create_package_spdx: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_package_qa: Succeeded
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_create_package_spdx: Succeeded
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 1863 of 1863 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1863 tasks of which 1832 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 11 ERROR messages, returning a non-zero exit code.
ERROR: libarchive-3.8.8-r0 do_packagedata_setscene: QA Issue: Package version for package libarchive-src went backwards which would break package feeds (from 0:3.8.9-r0 to 0:3.8.8-r0) [version-going-backwards]
ERROR: libarchive-3.8.8-r0 do_packagedata_setscene: QA Issue: Package version for package libarchive-dbg went backwards which would break package feeds (from 0:3.8.9-r0 to 0:3.8.8-r0) [version-going-backwards]
ERROR: libarchive-3.8.8-r0 do_packagedata_setscene: QA Issue: Package version for package bsdcpio went backwards which would break package feeds (from 0:3.8.9-r0 to 0:3.8.8-r0) [version-going-backwards]
ERROR: libarchive-3.8.8-r0 do_packagedata_setscene: QA Issue: Package version for package bsdtar went backwards which would break package feeds (from 0:3.8.9-r0 to 0:3.8.8-r0) [version-going-backwards]
ERROR: libarchive-3.8.8-r0 do_packagedata_setscene: QA Issue: Package version for package libarchive-ptest went backwards which would break package feeds (from 0:3.8.9-r0 to 0:3.8.8-r0) [version-going-backwards]
ERROR: libarchive-3.8.8-r0 do_packagedata_setscene: QA Issue: Package version for package libarchive-staticdev went backwards which would break package feeds (from 0:3.8.9-r0 to 0:3.8.8-r0) [version-going-backwards]
ERROR: libarchive-3.8.8-r0 do_packagedata_setscene: QA Issue: Package version for package libarchive-dev went backwards which would break package feeds (from 0:3.8.9-r0 to 0:3.8.8-r0) [version-going-backwards]
ERROR: libarchive-3.8.8-r0 do_packagedata_setscene: QA Issue: Package version for package libarchive-doc went backwards which would break package feeds (from 0:3.8.9-r0 to 0:3.8.8-r0) [version-going-backwards]
ERROR: libarchive-3.8.8-r0 do_packagedata_setscene: QA Issue: Package version for package libarchive-locale went backwards which would break package feeds (from 0:3.8.9-r0 to 0:3.8.8-r0) [version-going-backwards]
ERROR: libarchive-3.8.8-r0 do_packagedata_setscene: QA Issue: Package version for package libarchive went backwards which would break package feeds (from 0:3.8.9-r0 to 0:3.8.8-r0) [version-going-backwards]
ERROR: libarchive-3.8.8-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4727647752200385686==--

