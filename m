Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F296FC54E79
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 17:00:12 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.1265.1710522010890772432
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 10:00:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=A3/qQKmm;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=KDz+TUn5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018e430e8ebc-b991a04c-727e-4d7c-8a30-ae92bd30b4e4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1710522011;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gaa2eY1SG3+9whDH3C1aVEjEkZlADC0vObF4wXpLEbo=;
	b=A3/qQKmmBbszcNOUKLngt9REOLFAmiond3t7LkzLeGBzUUvl10A5J3BmlVHtfisJ
	j+MYpGGzM7FkhqMrz2TSYFeF+H4XZWpm1g215jdZW8/OVY2ZgnMkbXAexpDazVwui84
	PqS2fW87BnNa/2giCawjTO/khQfin8dH1xMy0vYQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1710522011;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gaa2eY1SG3+9whDH3C1aVEjEkZlADC0vObF4wXpLEbo=;
	b=KDz+TUn5cyKH8FBmFbqYCBo8RAiXlMLkaogX+aVCERe0OOtK60eUJaRYzwvxplE6
	VYcYJ5QFVN2HGGd18AJ87lhAtffPSYemzvusntOj/nsIuIIQr7CG9Ds/WfwvovcVriE
	jmhBegR8lu5xAdndNXTJs39VASNH8Co961vk64ug=
Content-Type: multipart/mixed; boundary="===============6537412017674481797=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-markdown: upgrading to 3.6 SUCCEEDED
Message-ID: <0101018e430e8ebc-b991a04c-727e-4d7c-8a30-ae92bd30b4e4-000000@us-west-2.amazonses.com>
Date: Fri, 15 Mar 2024 17:00:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 17:00:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197166

--===============6537412017674481797==
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
From c61a138ae26929a1aaccb9bbec4799197ad43c4e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Mar 2024 08:14:47 +0000
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


--===============6537412017674481797==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-markdown: SRC_URI changed from "https://files.pythonhosted.org/packages/source/M/Markdown/Markdown-3.5.2.tar.gz;downloadfilename=Markdown-3.5.2.tar.gz" to "https://files.pythonhosted.org/packages/source/M/Markdown/Markdown-3.6.tar.gz;downloadfilename=Markdown-3.6.tar.gz"
packages/core2-64-poky-linux/python3-markdown: PKGV changed from 3.5.2 [default] to 3.6 [default]
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

--===============6537412017674481797==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-markdown-upgrade-3.5.2-3.6.patch"

RnJvbSBjNjFhMTM4YWUyNjkyOWExYWFjY2I5YmJlYzQ3OTkxOTdhZDQzYzRlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWFyIDIwMjQgMDg6MTQ6NDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW1hcmtkb3duOiB1cGdyYWRlIDMuNS4yIC0+IDMuNgoKLS0tCiAuLi4vcHl0aG9uL3B5
dGhvbjMtbWFya2Rvd25fMy41LjIuYmIgICAgICAgICAgfCAxMyAtLS0KIC4uLi9weXRob24vcHl0
aG9uMy1tYXJrZG93bl8zLjYuYmIgICAgICAgICAgICB8IDgwICsrKysrKysrKysrKysrKysrKysK
IDIgZmlsZXMgY2hhbmdlZCwgODAgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCiBkZWxl
dGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1hcmtk
b3duXzMuNS4yLmJiCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLW1hcmtkb3duXzMuNi5iYgoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXJrZG93bl8zLjUuMi5iYiBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXJrZG93bl8zLjUuMi5iYgpkZWxldGVkIGZpbGUgbW9k
ZSAxMDA2NDQKaW5kZXggMWRmN2E5ODE4My4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFya2Rvd25fMy41LjIuYmIKKysrIC9kZXYvbnVsbApA
QCAtMSwxMyArMCwwIEBACi1TVU1NQVJZID0gIkEgUHl0aG9uIGltcGxlbWVudGF0aW9uIG9mIEpv
aG4gR3J1YmVyJ3MgTWFya2Rvd24uIgotSE9NRVBBR0UgPSAiaHR0cHM6Ly9weXRob24tbWFya2Rv
d24uZ2l0aHViLmlvLyIKLUxJQ0VOU0UgPSAiQlNELTMtQ2xhdXNlIgotTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vTElDRU5TRS5tZDttZDU9NzQ1YWFhZDBjNjljNjAwMzllNjM4YmZmOWZmYzU5
ZWQiCi0KLWluaGVyaXQgcHlwaSBweXRob25fc2V0dXB0b29sc19idWlsZF9tZXRhCi0KLVBZUElf
UEFDS0FHRSA9ICJNYXJrZG93biIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJlMWFjN2IzZGM1NTBl
ZTgwZTYwMmU3MWMxZDE2ODAwMmYwNjJlNDlmMWIxMWUyNmEzNjI2NGRhZmQ0ZGYyZWY4IgotCi1C
QkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiCi0KLVJERVBFTkRTOiR7UE59ICs9ICJw
eXRob24zLWxvZ2dpbmcgcHl0aG9uMy1zZXR1cHRvb2xzIgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1hcmtkb3duXzMuNi5iYiBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXJrZG93bl8zLjYuYmIKbmV3IGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uODZiYTRmYzllZAotLS0gL2Rldi9udWxsCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXJrZG93bl8zLjYuYmIKQEAgLTAs
MCArMSw4MCBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVl
biB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBk
aWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBs
ZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRo
ZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicg
dGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRl
ZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIExJQ0VOU0UubWQKKyMgKysrIExJQ0VO
U0UubWQKKyMgQEAgLTEsMjkgKzEsMzAgQEAKKyMgLUNvcHlyaWdodCAyMDA3LCAyMDA4IFRoZSBQ
eXRob24gTWFya2Rvd24gUHJvamVjdCAodi4gMS43IGFuZCBsYXRlcikKKyMgLUNvcHlyaWdodCAy
MDA0LCAyMDA1LCAyMDA2IFl1cmkgVGFraHRleWV2ICh2LiAwLjItMS42YikKKyMgK0JTRCAzLUNs
YXVzZSBMaWNlbnNlCisjICsKKyMgK0NvcHlyaWdodCAyMDA3LCAyMDA4IFRoZSBQeXRob24gTWFy
a2Rvd24gUHJvamVjdCAodi4gMS43IGFuZCBsYXRlcikgIAorIyArQ29weXJpZ2h0IDIwMDQsIDIw
MDUsIDIwMDYgWXVyaSBUYWtodGV5ZXYgKHYuIDAuMi0xLjZiKSAgCisjICBDb3B5cmlnaHQgMjAw
NCBNYW5mcmVkIFN0aWVuc3RyYSAodGhlIG9yaWdpbmFsIHZlcnNpb24pCisjIC0KKyMgLUFsbCBy
aWdodHMgcmVzZXJ2ZWQuCisjICAKKyMgIFJlZGlzdHJpYnV0aW9uIGFuZCB1c2UgaW4gc291cmNl
IGFuZCBiaW5hcnkgZm9ybXMsIHdpdGggb3Igd2l0aG91dAorIyAgbW9kaWZpY2F0aW9uLCBhcmUg
cGVybWl0dGVkIHByb3ZpZGVkIHRoYXQgdGhlIGZvbGxvd2luZyBjb25kaXRpb25zIGFyZSBtZXQ6
CisjICAKKyMgLSogUmVkaXN0cmlidXRpb25zIG9mIHNvdXJjZSBjb2RlIG11c3QgcmV0YWluIHRo
ZSBhYm92ZSBjb3B5cmlnaHQKKyMgLSAgbm90aWNlLCB0aGlzIGxpc3Qgb2YgY29uZGl0aW9ucyBh
bmQgdGhlIGZvbGxvd2luZyBkaXNjbGFpbWVyLgorIyAtKiBSZWRpc3RyaWJ1dGlvbnMgaW4gYmlu
YXJ5IGZvcm0gbXVzdCByZXByb2R1Y2UgdGhlIGFib3ZlIGNvcHlyaWdodAorIyAtICBub3RpY2Us
IHRoaXMgbGlzdCBvZiBjb25kaXRpb25zIGFuZCB0aGUgZm9sbG93aW5nIGRpc2NsYWltZXIgaW4g
dGhlCisjIC0gIGRvY3VtZW50YXRpb24gYW5kL29yIG90aGVyIG1hdGVyaWFscyBwcm92aWRlZCB3
aXRoIHRoZSBkaXN0cmlidXRpb24uCisjIC0qIE5laXRoZXIgdGhlIG5hbWUgb2YgdGhlIFB5dGhv
biBNYXJrZG93biBQcm9qZWN0IG5vciB0aGUKKyMgLSAgbmFtZXMgb2YgaXRzIGNvbnRyaWJ1dG9y
cyBtYXkgYmUgdXNlZCB0byBlbmRvcnNlIG9yIHByb21vdGUgcHJvZHVjdHMKKyMgLSAgZGVyaXZl
ZCBmcm9tIHRoaXMgc29mdHdhcmUgd2l0aG91dCBzcGVjaWZpYyBwcmlvciB3cml0dGVuIHBlcm1p
c3Npb24uCisjICsxLiBSZWRpc3RyaWJ1dGlvbnMgb2Ygc291cmNlIGNvZGUgbXVzdCByZXRhaW4g
dGhlIGFib3ZlIGNvcHlyaWdodCBub3RpY2UsIHRoaXMKKyMgKyAgIGxpc3Qgb2YgY29uZGl0aW9u
cyBhbmQgdGhlIGZvbGxvd2luZyBkaXNjbGFpbWVyLgorIyAgCisjIC1USElTIFNPRlRXQVJFIElT
IFBST1ZJREVEIEJZIFRIRSBQWVRIT04gTUFSS0RPV04gUFJPSkVDVCAnJ0FTIElTJycgQU5EIEFO
WQorIyAtRVhQUkVTUyBPUiBJTVBMSUVEIFdBUlJBTlRJRVMsIElOQ0xVRElORywgQlVUIE5PVCBM
SU1JVEVEIFRPLCBUSEUgSU1QTElFRAorIyAtV0FSUkFOVElFUyBPRiBNRVJDSEFOVEFCSUxJVFkg
QU5EIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFIEFSRQorIyAtRElTQ0xBSU1FRC4g
SU4gTk8gRVZFTlQgU0hBTEwgQU5ZIENPTlRSSUJVVE9SUyBUTyBUSEUgUFlUSE9OIE1BUktET1dO
IFBST0pFQ1QKKyMgLUJFIExJQUJMRSBGT1IgQU5ZIERJUkVDVCwgSU5ESVJFQ1QsIElOQ0lERU5U
QUwsIFNQRUNJQUwsIEVYRU1QTEFSWSwgT1IKKyMgLUNPTlNFUVVFTlRJQUwgREFNQUdFUyAoSU5D
TFVESU5HLCBCVVQgTk9UIExJTUlURUQgVE8sIFBST0NVUkVNRU5UIE9GCisjIC1TVUJTVElUVVRF
IEdPT0RTIE9SIFNFUlZJQ0VTOyBMT1NTIE9GIFVTRSwgREFUQSwgT1IgUFJPRklUUzsgT1IgQlVT
SU5FU1MKKyMgLUlOVEVSUlVQVElPTikgSE9XRVZFUiBDQVVTRUQgQU5EIE9OIEFOWSBUSEVPUlkg
T0YgTElBQklMSVRZLCBXSEVUSEVSIElOCisjIC1DT05UUkFDVCwgU1RSSUNUIExJQUJJTElUWSwg
T1IgVE9SVCAoSU5DTFVESU5HIE5FR0xJR0VOQ0UgT1IgT1RIRVJXSVNFKQorIyAtQVJJU0lORyBJ
TiBBTlkgV0FZIE9VVCBPRiBUSEUgVVNFIE9GIFRISVMgU09GVFdBUkUsIEVWRU4gSUYgQURWSVNF
RCBPRiBUSEUKKyMgLVBPU1NJQklMSVRZIE9GIFNVQ0ggREFNQUdFLgorIyArMi4gUmVkaXN0cmli
dXRpb25zIGluIGJpbmFyeSBmb3JtIG11c3QgcmVwcm9kdWNlIHRoZSBhYm92ZSBjb3B5cmlnaHQg
bm90aWNlLAorIyArICAgdGhpcyBsaXN0IG9mIGNvbmRpdGlvbnMgYW5kIHRoZSBmb2xsb3dpbmcg
ZGlzY2xhaW1lciBpbiB0aGUgZG9jdW1lbnRhdGlvbgorIyArICAgYW5kL29yIG90aGVyIG1hdGVy
aWFscyBwcm92aWRlZCB3aXRoIHRoZSBkaXN0cmlidXRpb24uCisjICsKKyMgKzMuIE5laXRoZXIg
dGhlIG5hbWUgb2YgdGhlIGNvcHlyaWdodCBob2xkZXIgbm9yIHRoZSBuYW1lcyBvZiBpdHMKKyMg
KyAgIGNvbnRyaWJ1dG9ycyBtYXkgYmUgdXNlZCB0byBlbmRvcnNlIG9yIHByb21vdGUgcHJvZHVj
dHMgZGVyaXZlZCBmcm9tCisjICsgICB0aGlzIHNvZnR3YXJlIHdpdGhvdXQgc3BlY2lmaWMgcHJp
b3Igd3JpdHRlbiBwZXJtaXNzaW9uLgorIyArCisjICtUSElTIFNPRlRXQVJFIElTIFBST1ZJREVE
IEJZIFRIRSBDT1BZUklHSFQgSE9MREVSUyBBTkQgQ09OVFJJQlVUT1JTICJBUyBJUyIKKyMgK0FO
RCBBTlkgRVhQUkVTUyBPUiBJTVBMSUVEIFdBUlJBTlRJRVMsIElOQ0xVRElORywgQlVUIE5PVCBM
SU1JVEVEIFRPLCBUSEUKKyMgK0lNUExJRUQgV0FSUkFOVElFUyBPRiBNRVJDSEFOVEFCSUxJVFkg
QU5EIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFIEFSRQorIyArRElTQ0xBSU1FRC4g
SU4gTk8gRVZFTlQgU0hBTEwgVEhFIENPUFlSSUdIVCBIT0xERVIgT1IgQ09OVFJJQlVUT1JTIEJF
IExJQUJMRQorIyArRk9SIEFOWSBESVJFQ1QsIElORElSRUNULCBJTkNJREVOVEFMLCBTUEVDSUFM
LCBFWEVNUExBUlksIE9SIENPTlNFUVVFTlRJQUwKKyMgK0RBTUFHRVMgKElOQ0xVRElORywgQlVU
IE5PVCBMSU1JVEVEIFRPLCBQUk9DVVJFTUVOVCBPRiBTVUJTVElUVVRFIEdPT0RTIE9SCisjICtT
RVJWSUNFUzsgTE9TUyBPRiBVU0UsIERBVEEsIE9SIFBST0ZJVFM7IE9SIEJVU0lORVNTIElOVEVS
UlVQVElPTikgSE9XRVZFUgorIyArQ0FVU0VEIEFORCBPTiBBTlkgVEhFT1JZIE9GIExJQUJJTElU
WSwgV0hFVEhFUiBJTiBDT05UUkFDVCwgU1RSSUNUIExJQUJJTElUWSwKKyMgK09SIFRPUlQgKElO
Q0xVRElORyBORUdMSUdFTkNFIE9SIE9USEVSV0lTRSkgQVJJU0lORyBJTiBBTlkgV0FZIE9VVCBP
RiBUSEUgVVNFCisjICtPRiBUSElTIFNPRlRXQVJFLCBFVkVOIElGIEFEVklTRUQgT0YgVEhFIFBP
U1NJQklMSVRZIE9GIFNVQ0ggREFNQUdFLgorIyAKKyMKKworU1VNTUFSWSA9ICJBIFB5dGhvbiBp
bXBsZW1lbnRhdGlvbiBvZiBKb2huIEdydWJlcidzIE1hcmtkb3duLiIKK0hPTUVQQUdFID0gImh0
dHBzOi8vcHl0aG9uLW1hcmtkb3duLmdpdGh1Yi5pby8iCitMSUNFTlNFID0gIkJTRC0zLUNsYXVz
ZSIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UubWQ7bWQ1PWVjNThjZGY3Y2Zl
ZDA2YTIxZjdhOTM2MjYyN2E1NDgwIgorCitpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9vbHNf
YnVpbGRfbWV0YQorCitQWVBJX1BBQ0tBR0UgPSAiTWFya2Rvd24iCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiZWQ0ZjQxZjZkYWVjYmVlYjk2ZTU3NmNlNDE0YzQxZDJkODc2ZGFhOWExNmNiMzVmYThl
ZDhjMmRkZmFkMDIyNCIKKworQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIgorCitS
REVQRU5EUzoke1BOfSArPSAicHl0aG9uMy1sb2dnaW5nIHB5dGhvbjMtc2V0dXB0b29scyIKLS0g
CjIuNDIuMAoK

--===============6537412017674481797==
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

--===============6537412017674481797==--

