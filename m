Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA9C8CD13A0
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:30 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.44652.1711994602284417796
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=TAR6AHPq;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=wi7wHaPC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018e9ad47f0a-ecc4ea65-857d-4444-b7f5-456bc30d0c3b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994601;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YW9k4PXjqpDoC2TVmUuJOfNsjEkbIHvQcQdJCtHi+YU=;
	b=TAR6AHPqVqL1hWMLZu8UNlmKn/ZmOAA9UXhLPRzj/BqBC9BvJme1p5uHO8mG9UrC
	Z05bSzB2fyiKBZrzg491UMWXpHi5f5/WzQ7h1bcxgcMJfrYTRO5hodAB+jlF4pIf7Ka
	sJBnB5Rw4vcp0hyyDLaVNYHAXqzX38Ty+oZG3ODU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994601;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YW9k4PXjqpDoC2TVmUuJOfNsjEkbIHvQcQdJCtHi+YU=;
	b=wi7wHaPCSikJ6yC0JmOjQk0BvL0Ux4uoGvX2wNp0wCqK/l1cMiGXNLfpypS+y5Rk
	Ol/vk9gDx9tQOvKpKa0s3DSH9M+ote09/znSPisVYo+5zPUuAtiW+L3CnzwmIcbcCf8
	RKfX9zYvB08vdenNTYWxaTAw6XHDLFY2sZuzqMBw=
Content-Type: multipart/mixed; boundary="===============1408540450156470165=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-markdown: upgrading to 3.6 SUCCEEDED
Message-ID: <0101018e9ad47f0a-ecc4ea65-857d-4444-b7f5-456bc30d0c3b-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:21 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197745

--===============1408540450156470165==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-markdown* to *3.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-markdown-upgrade-3.5.2-3.6.patch
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
From fd7262a3faf8c28b821d42065518710805881023 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 08:20:24 +0000
Subject: [PATCH] python3-markdown: upgrade 3.5.2 -> 3.6

---
 .../python/python3-markdown_3.5.2.bb          | 13 ---
 .../python/python3-markdown_3.6.bb            | 80 +++++++++++++++++++
 2 files changed, 80 insertions(+), 13 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-markdown_3.5.2.bb
 create mode 100644 meta/recipes-devtools/python/python3-markdown_3.6.bb

diff --git a/meta/recipes-devtools/python/python3-markdown_3.5.2.bb b/meta/recipes-devtools/python/python3-markdown_3.5.2.bb
deleted file mode 100644
index 1df7a98183..0000000000
--- a/meta/recipes-devtools/python/python3-markdown_3.5.2.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY = "A Python implementation of John Gruber's Markdown."
-HOMEPAGE = "https://python-markdown.github.io/"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=745aaad0c69c60039e638bff9ffc59ed"
-
-inherit pypi python_setuptools_build_meta
-
-PYPI_PACKAGE = "Markdown"
-SRC_URI[sha256sum] = "e1ac7b3dc550ee80e602e71c1d168002f062e49f1b11e26a36264dafd4df2ef8"
-
-BBCLASSEXTEND = "native nativesdk"
-
-RDEPENDS:${PN} += "python3-logging python3-setuptools"
diff --git a/meta/recipes-devtools/python/python3-markdown_3.6.bb b/meta/recipes-devtools/python/python3-markdown_3.6.bb
new file mode 100644
index 0000000000..86ba4fc9ed
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-markdown_3.6.bb
@@ -0,0 +1,80 @@
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
+# @@ -1,29 +1,30 @@
+# -Copyright 2007, 2008 The Python Markdown Project (v. 1.7 and later)
+# -Copyright 2004, 2005, 2006 Yuri Takhteyev (v. 0.2-1.6b)
+# +BSD 3-Clause License
+# +
+# +Copyright 2007, 2008 The Python Markdown Project (v. 1.7 and later)  
+# +Copyright 2004, 2005, 2006 Yuri Takhteyev (v. 0.2-1.6b)  
+#  Copyright 2004 Manfred Stienstra (the original version)
+# -
+# -All rights reserved.
+#  
+#  Redistribution and use in source and binary forms, with or without
+#  modification, are permitted provided that the following conditions are met:
+#  
+# -* Redistributions of source code must retain the above copyright
+# -  notice, this list of conditions and the following disclaimer.
+# -* Redistributions in binary form must reproduce the above copyright
+# -  notice, this list of conditions and the following disclaimer in the
+# -  documentation and/or other materials provided with the distribution.
+# -* Neither the name of the Python Markdown Project nor the
+# -  names of its contributors may be used to endorse or promote products
+# -  derived from this software without specific prior written permission.
+# +1. Redistributions of source code must retain the above copyright notice, this
+# +   list of conditions and the following disclaimer.
+#  
+# -THIS SOFTWARE IS PROVIDED BY THE PYTHON MARKDOWN PROJECT ''AS IS'' AND ANY
+# -EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
+# -WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
+# -DISCLAIMED. IN NO EVENT SHALL ANY CONTRIBUTORS TO THE PYTHON MARKDOWN PROJECT
+# -BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+# -CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+# -SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+# -INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+# -CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+# -ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
+# -POSSIBILITY OF SUCH DAMAGE.
+# +2. Redistributions in binary form must reproduce the above copyright notice,
+# +   this list of conditions and the following disclaimer in the documentation
+# +   and/or other materials provided with the distribution.
+# +
+# +3. Neither the name of the copyright holder nor the names of its
+# +   contributors may be used to endorse or promote products derived from
+# +   this software without specific prior written permission.
+# +
+# +THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+# +AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+# +IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
+# +DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
+# +FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
+# +DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
+# +SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
+# +CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
+# +OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+# +OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+# 
+#
+
+SUMMARY = "A Python implementation of John Gruber's Markdown."
+HOMEPAGE = "https://python-markdown.github.io/"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=ec58cdf7cfed06a21f7a9362627a5480"
+
+inherit pypi python_setuptools_build_meta
+
+PYPI_PACKAGE = "Markdown"
+SRC_URI[sha256sum] = "ed4f41f6daecbeeb96e576ce414c41d2d876daa9a16cb35fa8ed8c2ddfad0224"
+
+BBCLASSEXTEND = "native nativesdk"
+
+RDEPENDS:${PN} += "python3-logging python3-setuptools"
-- 
2.42.0


--===============1408540450156470165==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-markdown-upgrade-3.5.2-3.6.patch"

RnJvbSBmZDcyNjJhM2ZhZjhjMjhiODIxZDQyMDY1NTE4NzEwODA1ODgxMDIzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAwODoyMDoyNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbWFya2Rvd246IHVwZ3JhZGUgMy41LjIgLT4gMy42CgotLS0KIC4uLi9weXRob24vcHl0
aG9uMy1tYXJrZG93bl8zLjUuMi5iYiAgICAgICAgICB8IDEzIC0tLQogLi4uL3B5dGhvbi9weXRo
b24zLW1hcmtkb3duXzMuNi5iYiAgICAgICAgICAgIHwgODAgKysrKysrKysrKysrKysrKysrKwog
MiBmaWxlcyBjaGFuZ2VkLCA4MCBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKIGRlbGV0
ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFya2Rv
d25fMy41LjIuYmIKIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtbWFya2Rvd25fMy42LmJiCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLW1hcmtkb3duXzMuNS4yLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLW1hcmtkb3duXzMuNS4yLmJiCmRlbGV0ZWQgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCAxZGY3YTk4MTgzLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXJrZG93bl8zLjUuMi5iYgorKysgL2Rldi9udWxsCkBA
IC0xLDEzICswLDAgQEAKLVNVTU1BUlkgPSAiQSBQeXRob24gaW1wbGVtZW50YXRpb24gb2YgSm9o
biBHcnViZXIncyBNYXJrZG93bi4iCi1IT01FUEFHRSA9ICJodHRwczovL3B5dGhvbi1tYXJrZG93
bi5naXRodWIuaW8vIgotTElDRU5TRSA9ICJCU0QtMy1DbGF1c2UiCi1MSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFLm1kO21kNT03NDVhYWFkMGM2OWM2MDAzOWU2MzhiZmY5ZmZjNTll
ZCIKLQotaW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEKLQotUFlQSV9Q
QUNLQUdFID0gIk1hcmtkb3duIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImUxYWM3YjNkYzU1MGVl
ODBlNjAyZTcxYzFkMTY4MDAyZjA2MmU0OWYxYjExZTI2YTM2MjY0ZGFmZDRkZjJlZjgiCi0KLUJC
Q0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayIKLQotUkRFUEVORFM6JHtQTn0gKz0gInB5
dGhvbjMtbG9nZ2luZyBweXRob24zLXNldHVwdG9vbHMiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFya2Rvd25fMy42LmJiIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1hcmtkb3duXzMuNi5iYgpuZXcgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCAwMDAwMDAwMDAwLi44NmJhNGZjOWVkCi0tLSAvZGV2L251bGwKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1hcmtkb3duXzMuNi5iYgpAQCAtMCww
ICsxLDgwIEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVu
IHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRp
ZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxl
YXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhl
IGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0
YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVk
LicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gTElDRU5TRS5tZAorIyArKysgTElDRU5T
RS5tZAorIyBAQCAtMSwyOSArMSwzMCBAQAorIyAtQ29weXJpZ2h0IDIwMDcsIDIwMDggVGhlIFB5
dGhvbiBNYXJrZG93biBQcm9qZWN0ICh2LiAxLjcgYW5kIGxhdGVyKQorIyAtQ29weXJpZ2h0IDIw
MDQsIDIwMDUsIDIwMDYgWXVyaSBUYWtodGV5ZXYgKHYuIDAuMi0xLjZiKQorIyArQlNEIDMtQ2xh
dXNlIExpY2Vuc2UKKyMgKworIyArQ29weXJpZ2h0IDIwMDcsIDIwMDggVGhlIFB5dGhvbiBNYXJr
ZG93biBQcm9qZWN0ICh2LiAxLjcgYW5kIGxhdGVyKSAgCisjICtDb3B5cmlnaHQgMjAwNCwgMjAw
NSwgMjAwNiBZdXJpIFRha2h0ZXlldiAodi4gMC4yLTEuNmIpICAKKyMgIENvcHlyaWdodCAyMDA0
IE1hbmZyZWQgU3RpZW5zdHJhICh0aGUgb3JpZ2luYWwgdmVyc2lvbikKKyMgLQorIyAtQWxsIHJp
Z2h0cyByZXNlcnZlZC4KKyMgIAorIyAgUmVkaXN0cmlidXRpb24gYW5kIHVzZSBpbiBzb3VyY2Ug
YW5kIGJpbmFyeSBmb3Jtcywgd2l0aCBvciB3aXRob3V0CisjICBtb2RpZmljYXRpb24sIGFyZSBw
ZXJtaXR0ZWQgcHJvdmlkZWQgdGhhdCB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnMgYXJlIG1ldDoK
KyMgIAorIyAtKiBSZWRpc3RyaWJ1dGlvbnMgb2Ygc291cmNlIGNvZGUgbXVzdCByZXRhaW4gdGhl
IGFib3ZlIGNvcHlyaWdodAorIyAtICBub3RpY2UsIHRoaXMgbGlzdCBvZiBjb25kaXRpb25zIGFu
ZCB0aGUgZm9sbG93aW5nIGRpc2NsYWltZXIuCisjIC0qIFJlZGlzdHJpYnV0aW9ucyBpbiBiaW5h
cnkgZm9ybSBtdXN0IHJlcHJvZHVjZSB0aGUgYWJvdmUgY29weXJpZ2h0CisjIC0gIG5vdGljZSwg
dGhpcyBsaXN0IG9mIGNvbmRpdGlvbnMgYW5kIHRoZSBmb2xsb3dpbmcgZGlzY2xhaW1lciBpbiB0
aGUKKyMgLSAgZG9jdW1lbnRhdGlvbiBhbmQvb3Igb3RoZXIgbWF0ZXJpYWxzIHByb3ZpZGVkIHdp
dGggdGhlIGRpc3RyaWJ1dGlvbi4KKyMgLSogTmVpdGhlciB0aGUgbmFtZSBvZiB0aGUgUHl0aG9u
IE1hcmtkb3duIFByb2plY3Qgbm9yIHRoZQorIyAtICBuYW1lcyBvZiBpdHMgY29udHJpYnV0b3Jz
IG1heSBiZSB1c2VkIHRvIGVuZG9yc2Ugb3IgcHJvbW90ZSBwcm9kdWN0cworIyAtICBkZXJpdmVk
IGZyb20gdGhpcyBzb2Z0d2FyZSB3aXRob3V0IHNwZWNpZmljIHByaW9yIHdyaXR0ZW4gcGVybWlz
c2lvbi4KKyMgKzEuIFJlZGlzdHJpYnV0aW9ucyBvZiBzb3VyY2UgY29kZSBtdXN0IHJldGFpbiB0
aGUgYWJvdmUgY29weXJpZ2h0IG5vdGljZSwgdGhpcworIyArICAgbGlzdCBvZiBjb25kaXRpb25z
IGFuZCB0aGUgZm9sbG93aW5nIGRpc2NsYWltZXIuCisjICAKKyMgLVRISVMgU09GVFdBUkUgSVMg
UFJPVklERUQgQlkgVEhFIFBZVEhPTiBNQVJLRE9XTiBQUk9KRUNUICcnQVMgSVMnJyBBTkQgQU5Z
CisjIC1FWFBSRVNTIE9SIElNUExJRUQgV0FSUkFOVElFUywgSU5DTFVESU5HLCBCVVQgTk9UIExJ
TUlURUQgVE8sIFRIRSBJTVBMSUVECisjIC1XQVJSQU5USUVTIE9GIE1FUkNIQU5UQUJJTElUWSBB
TkQgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UgQVJFCisjIC1ESVNDTEFJTUVELiBJ
TiBOTyBFVkVOVCBTSEFMTCBBTlkgQ09OVFJJQlVUT1JTIFRPIFRIRSBQWVRIT04gTUFSS0RPV04g
UFJPSkVDVAorIyAtQkUgTElBQkxFIEZPUiBBTlkgRElSRUNULCBJTkRJUkVDVCwgSU5DSURFTlRB
TCwgU1BFQ0lBTCwgRVhFTVBMQVJZLCBPUgorIyAtQ09OU0VRVUVOVElBTCBEQU1BR0VTIChJTkNM
VURJTkcsIEJVVCBOT1QgTElNSVRFRCBUTywgUFJPQ1VSRU1FTlQgT0YKKyMgLVNVQlNUSVRVVEUg
R09PRFMgT1IgU0VSVklDRVM7IExPU1MgT0YgVVNFLCBEQVRBLCBPUiBQUk9GSVRTOyBPUiBCVVNJ
TkVTUworIyAtSU5URVJSVVBUSU9OKSBIT1dFVkVSIENBVVNFRCBBTkQgT04gQU5ZIFRIRU9SWSBP
RiBMSUFCSUxJVFksIFdIRVRIRVIgSU4KKyMgLUNPTlRSQUNULCBTVFJJQ1QgTElBQklMSVRZLCBP
UiBUT1JUIChJTkNMVURJTkcgTkVHTElHRU5DRSBPUiBPVEhFUldJU0UpCisjIC1BUklTSU5HIElO
IEFOWSBXQVkgT1VUIE9GIFRIRSBVU0UgT0YgVEhJUyBTT0ZUV0FSRSwgRVZFTiBJRiBBRFZJU0VE
IE9GIFRIRQorIyAtUE9TU0lCSUxJVFkgT0YgU1VDSCBEQU1BR0UuCisjICsyLiBSZWRpc3RyaWJ1
dGlvbnMgaW4gYmluYXJ5IGZvcm0gbXVzdCByZXByb2R1Y2UgdGhlIGFib3ZlIGNvcHlyaWdodCBu
b3RpY2UsCisjICsgICB0aGlzIGxpc3Qgb2YgY29uZGl0aW9ucyBhbmQgdGhlIGZvbGxvd2luZyBk
aXNjbGFpbWVyIGluIHRoZSBkb2N1bWVudGF0aW9uCisjICsgICBhbmQvb3Igb3RoZXIgbWF0ZXJp
YWxzIHByb3ZpZGVkIHdpdGggdGhlIGRpc3RyaWJ1dGlvbi4KKyMgKworIyArMy4gTmVpdGhlciB0
aGUgbmFtZSBvZiB0aGUgY29weXJpZ2h0IGhvbGRlciBub3IgdGhlIG5hbWVzIG9mIGl0cworIyAr
ICAgY29udHJpYnV0b3JzIG1heSBiZSB1c2VkIHRvIGVuZG9yc2Ugb3IgcHJvbW90ZSBwcm9kdWN0
cyBkZXJpdmVkIGZyb20KKyMgKyAgIHRoaXMgc29mdHdhcmUgd2l0aG91dCBzcGVjaWZpYyBwcmlv
ciB3cml0dGVuIHBlcm1pc3Npb24uCisjICsKKyMgK1RISVMgU09GVFdBUkUgSVMgUFJPVklERUQg
QlkgVEhFIENPUFlSSUdIVCBIT0xERVJTIEFORCBDT05UUklCVVRPUlMgIkFTIElTIgorIyArQU5E
IEFOWSBFWFBSRVNTIE9SIElNUExJRUQgV0FSUkFOVElFUywgSU5DTFVESU5HLCBCVVQgTk9UIExJ
TUlURUQgVE8sIFRIRQorIyArSU1QTElFRCBXQVJSQU5USUVTIE9GIE1FUkNIQU5UQUJJTElUWSBB
TkQgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UgQVJFCisjICtESVNDTEFJTUVELiBJ
TiBOTyBFVkVOVCBTSEFMTCBUSEUgQ09QWVJJR0hUIEhPTERFUiBPUiBDT05UUklCVVRPUlMgQkUg
TElBQkxFCisjICtGT1IgQU5ZIERJUkVDVCwgSU5ESVJFQ1QsIElOQ0lERU5UQUwsIFNQRUNJQUws
IEVYRU1QTEFSWSwgT1IgQ09OU0VRVUVOVElBTAorIyArREFNQUdFUyAoSU5DTFVESU5HLCBCVVQg
Tk9UIExJTUlURUQgVE8sIFBST0NVUkVNRU5UIE9GIFNVQlNUSVRVVEUgR09PRFMgT1IKKyMgK1NF
UlZJQ0VTOyBMT1NTIE9GIFVTRSwgREFUQSwgT1IgUFJPRklUUzsgT1IgQlVTSU5FU1MgSU5URVJS
VVBUSU9OKSBIT1dFVkVSCisjICtDQVVTRUQgQU5EIE9OIEFOWSBUSEVPUlkgT0YgTElBQklMSVRZ
LCBXSEVUSEVSIElOIENPTlRSQUNULCBTVFJJQ1QgTElBQklMSVRZLAorIyArT1IgVE9SVCAoSU5D
TFVESU5HIE5FR0xJR0VOQ0UgT1IgT1RIRVJXSVNFKSBBUklTSU5HIElOIEFOWSBXQVkgT1VUIE9G
IFRIRSBVU0UKKyMgK09GIFRISVMgU09GVFdBUkUsIEVWRU4gSUYgQURWSVNFRCBPRiBUSEUgUE9T
U0lCSUxJVFkgT0YgU1VDSCBEQU1BR0UuCisjIAorIworCitTVU1NQVJZID0gIkEgUHl0aG9uIGlt
cGxlbWVudGF0aW9uIG9mIEpvaG4gR3J1YmVyJ3MgTWFya2Rvd24uIgorSE9NRVBBR0UgPSAiaHR0
cHM6Ly9weXRob24tbWFya2Rvd24uZ2l0aHViLmlvLyIKK0xJQ0VOU0UgPSAiQlNELTMtQ2xhdXNl
IgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS5tZDttZDU9ZWM1OGNkZjdjZmVk
MDZhMjFmN2E5MzYyNjI3YTU0ODAiCisKK2luaGVyaXQgcHlwaSBweXRob25fc2V0dXB0b29sc19i
dWlsZF9tZXRhCisKK1BZUElfUEFDS0FHRSA9ICJNYXJrZG93biIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICJlZDRmNDFmNmRhZWNiZWViOTZlNTc2Y2U0MTRjNDFkMmQ4NzZkYWE5YTE2Y2IzNWZhOGVk
OGMyZGRmYWQwMjI0IgorCitCQkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiCisKK1JE
RVBFTkRTOiR7UE59ICs9ICJweXRob24zLWxvZ2dpbmcgcHl0aG9uMy1zZXR1cHRvb2xzIgotLSAK
Mi40Mi4wCgo=

--===============1408540450156470165==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-markdown (sysroot):
  /usr/lib/python3.12/site-packages/Markdown-3.6.dist-info was added
  /usr/lib/python3.12/site-packages/Markdown-3.6.dist-info/entry_points.txt was added
  /usr/lib/python3.12/site-packages/Markdown-3.6.dist-info/LICENSE.md was added
  /usr/lib/python3.12/site-packages/Markdown-3.6.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/Markdown-3.6.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/Markdown-3.6.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/Markdown-3.6.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/Markdown-3.5.2.dist-info was removed
  /usr/lib/python3.12/site-packages/Markdown-3.5.2.dist-info/entry_points.txt was removed
  /usr/lib/python3.12/site-packages/Markdown-3.5.2.dist-info/LICENSE.md was removed
  /usr/lib/python3.12/site-packages/Markdown-3.5.2.dist-info/METADATA was removed
  /usr/lib/python3.12/site-packages/Markdown-3.5.2.dist-info/RECORD was removed
  /usr/lib/python3.12/site-packages/Markdown-3.5.2.dist-info/top_level.txt was removed
  /usr/lib/python3.12/site-packages/Markdown-3.5.2.dist-info/WHEEL was removed

--===============1408540450156470165==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-markdown: PKGV changed from 3.5.2 [default] to 3.6 [default]
packages/core2-64-poky-linux/python3-markdown: SRC_URI changed from "https://files.pythonhosted.org/packages/source/M/Markdown/Markdown-3.5.2.tar.gz;downloadfilename=Markdown-3.5.2.tar.gz" to "https://files.pythonhosted.org/packages/source/M/Markdown/Markdown-3.6.tar.gz;downloadfilename=Markdown-3.6.tar.gz"
packages/core2-64-poky-linux/python3-markdown: PV changed from "3.5.2" to "3.6"
packages/core2-64-poky-linux/python3-markdown/python3-markdown-dbg: PKGV changed from 3.5.2 [default] to 3.6 [default]
packages/core2-64-poky-linux/python3-markdown/python3-markdown-dbg: PV changed from "3.5.2" to "3.6"
packages/core2-64-poky-linux/python3-markdown/python3-markdown-dev: PKGV changed from 3.5.2 [default] to 3.6 [default]
packages/core2-64-poky-linux/python3-markdown/python3-markdown-dev: PV changed from "3.5.2" to "3.6"
packages/core2-64-poky-linux/python3-markdown/python3-markdown-doc: PKGV changed from 3.5.2 [default] to 3.6 [default]
packages/core2-64-poky-linux/python3-markdown/python3-markdown-doc: PV changed from "3.5.2" to "3.6"
packages/core2-64-poky-linux/python3-markdown/python3-markdown-locale: PKGV changed from 3.5.2 [default] to 3.6 [default]
packages/core2-64-poky-linux/python3-markdown/python3-markdown-locale: PV changed from "3.5.2" to "3.6"
packages/core2-64-poky-linux/python3-markdown/python3-markdown-src: PKGV changed from 3.5.2 [default] to 3.6 [default]
packages/core2-64-poky-linux/python3-markdown/python3-markdown-src: PV changed from "3.5.2" to "3.6"
packages/core2-64-poky-linux/python3-markdown/python3-markdown-staticdev: PKGV changed from 3.5.2 [default] to 3.6 [default]
packages/core2-64-poky-linux/python3-markdown/python3-markdown-staticdev: PV changed from "3.5.2" to "3.6"
packages/core2-64-poky-linux/python3-markdown/python3-markdown: PKGV changed from 3.5.2 [default] to 3.6 [default]
packages/core2-64-poky-linux/python3-markdown/python3-markdown: PKGSIZE changed from 660911 to 670573 (+1%)
packages/core2-64-poky-linux/python3-markdown/python3-markdown: PV changed from "3.5.2" to "3.6"
Changes to packages/core2-64-poky-linux/python3-markdown (sysroot):
  /usr/lib/python3.12/site-packages/Markdown-3.6.dist-info was added
  /usr/lib/python3.12/site-packages/Markdown-3.6.dist-info/entry_points.txt was added
  /usr/lib/python3.12/site-packages/Markdown-3.6.dist-info/LICENSE.md was added
  /usr/lib/python3.12/site-packages/Markdown-3.6.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/Markdown-3.6.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/Markdown-3.6.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/Markdown-3.6.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/Markdown-3.5.2.dist-info was removed
  /usr/lib/python3.12/site-packages/Markdown-3.5.2.dist-info/entry_points.txt was removed
  /usr/lib/python3.12/site-packages/Markdown-3.5.2.dist-info/LICENSE.md was removed
  /usr/lib/python3.12/site-packages/Markdown-3.5.2.dist-info/METADATA was removed
  /usr/lib/python3.12/site-packages/Markdown-3.5.2.dist-info/RECORD was removed
  /usr/lib/python3.12/site-packages/Markdown-3.5.2.dist-info/top_level.txt was removed
  /usr/lib/python3.12/site-packages/Markdown-3.5.2.dist-info/WHEEL was removed

--===============1408540450156470165==--

