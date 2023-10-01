Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9CEDE776DB
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 18:13:18 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.65026.1696183991467493129
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 11:13:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=YHa2LxUX;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=KUfx8OMT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018aec71b7c6-828ab692-bba8-4b75-99ac-5b0a36ed3ca0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1696183990;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9gIOzJDa/4ZWxeDgpAHnhHAgztQWxQLIMWOFnSa3AeI=;
	b=YHa2LxUXeugeu5Ot/5fdt0M+FgtwHTWrGGrONNg5ScgoFgWZqY/14fnYKjv2Etbq
	R4U8SfqTGrjSzXT5RmXn8GZ8ekiixlVhkbB/QypS8unkeX1wofLaLISUl8bpoOF/KN5
	97Cng1tPkQgdyXqYKJRuGEEc01enoTJHkNQa4jJY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1696183990;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9gIOzJDa/4ZWxeDgpAHnhHAgztQWxQLIMWOFnSa3AeI=;
	b=KUfx8OMTs37wRT53x2c3TplobOgfQjyvqfjPRXB77eNwUlYU445CmMndw1ar9SSD
	gS0glUKsN4xlfoTuXGE0jJze49AQoDX6idJ0gvW6wlCuD4EGffBc6Haa1Cm+TvQ/gRh
	zmD+Pd9tDQxmy7vMS4T5HQKOl8tN9ktK7lng8h1I=
Content-Type: multipart/mixed; boundary="===============5702114327714563435=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-git: upgrading to 3.1.37 SUCCEEDED
Message-ID: <0101018aec71b7c6-828ab692-bba8-4b75-99ac-5b0a36ed3ca0-000000@us-west-2.amazonses.com>
Date: Sun, 1 Oct 2023 18:13:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 18:13:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188548

--===============5702114327714563435==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-git* to *3.1.37* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-git-upgrade-3.1.36-3.1.37.patch
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
From bab57192a7f82cb751c14a50c89a349b1fb06906 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Oct 2023 09:47:59 +0000
Subject: [PATCH] python3-git: upgrade 3.1.36 -> 3.1.37

---
 ...n3-git_3.1.36.bb => python3-git_3.1.37.bb} | 65 ++++++++++++++++++-
 1 file changed, 63 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-git_3.1.36.bb => python3-git_3.1.37.bb} (22%)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.36.bb b/meta/recipes-devtools/python/python3-git_3.1.37.bb
similarity index 22%
rename from meta/recipes-devtools/python/python3-git_3.1.36.bb
rename to meta/recipes-devtools/python/python3-git_3.1.37.bb
index ab1b0f2353..7860c9bbdd 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.36.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.37.bb
@@ -1,3 +1,64 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE
+# +++ LICENSE
+# @@ -1,30 +1,29 @@
+#  Copyright (C) 2008, 2009 Michael Trier and contributors
+#  All rights reserved.
+#  
+# -Redistribution and use in source and binary forms, with or without 
+# -modification, are permitted provided that the following conditions 
+# +Redistribution and use in source and binary forms, with or without
+# +modification, are permitted provided that the following conditions
+#  are met:
+#  
+# -* Redistributions of source code must retain the above copyright 
+# +* Redistributions of source code must retain the above copyright
+#  notice, this list of conditions and the following disclaimer.
+#  
+# -* Redistributions in binary form must reproduce the above copyright 
+# -notice, this list of conditions and the following disclaimer in the 
+# +* Redistributions in binary form must reproduce the above copyright
+# +notice, this list of conditions and the following disclaimer in the
+#  documentation and/or other materials provided with the distribution.
+#  
+# -* Neither the name of the GitPython project nor the names of 
+# -its contributors may be used to endorse or promote products derived 
+# +* Neither the name of the GitPython project nor the names of
+# +its contributors may be used to endorse or promote products derived
+#  from this software without specific prior written permission.
+#  
+# -THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 
+# -"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT 
+# -LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR 
+# -A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT 
+# -OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
+# -SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED 
+# -TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR 
+# -PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF 
+# -LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING 
+# -NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS 
+# +THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+# +"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+# +LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+# +A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+# +OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+# +SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
+# +TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
+# +PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
+# +LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
+# +NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
+#  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+# -
+# 
+#
+
 SUMMARY = "Python library used to interact with Git repositories"
 DESCRIPTION = "GitPython provides object model read and write access to \
 a git repository. Access repository information conveniently, alter the \
@@ -6,13 +67,13 @@ access with big-files support."
 HOMEPAGE = "http://github.com/gitpython-developers/GitPython"
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8b8d26c37c1d5a04f9b0186edbebc183"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5279a7ab369ba336989dcf2a107e5c8e"
 
 PYPI_PACKAGE = "GitPython"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "4bb0c2a6995e85064140d31a33289aa5dce80133a23d36fcd372d716c54d3ebf"
+SRC_URI[sha256sum] = "f9b9ddc0761c125d5780eab2d64be4873fc6817c2899cbcb34b02344bdc7bc54"
 
 DEPENDS += " ${PYTHON_PN}-gitdb"
 
-- 
2.39.2


--===============5702114327714563435==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-git: PV changed from "3.1.36" to "3.1.37"
packages/core2-32-poky-linux/python3-git: PKGV changed from 3.1.36 [default] to 3.1.37 [default]
packages/core2-32-poky-linux/python3-git: SRC_URI changed from "https://files.pythonhosted.org/packages/source/G/GitPython/GitPython-3.1.36.tar.gz;downloadfilename=GitPython-3.1.36.tar.gz" to "https://files.pythonhosted.org/packages/source/G/GitPython/GitPython-3.1.37.tar.gz;downloadfilename=GitPython-3.1.37.tar.gz"
packages/core2-32-poky-linux/python3-git/python3-git-dbg: PV changed from "3.1.36" to "3.1.37"
packages/core2-32-poky-linux/python3-git/python3-git-dbg: PKGV changed from 3.1.36 [default] to 3.1.37 [default]
packages/core2-32-poky-linux/python3-git/python3-git-dev: PV changed from "3.1.36" to "3.1.37"
packages/core2-32-poky-linux/python3-git/python3-git-dev: PKGV changed from 3.1.36 [default] to 3.1.37 [default]
packages/core2-32-poky-linux/python3-git/python3-git-doc: PV changed from "3.1.36" to "3.1.37"
packages/core2-32-poky-linux/python3-git/python3-git-doc: PKGV changed from 3.1.36 [default] to 3.1.37 [default]
packages/core2-32-poky-linux/python3-git/python3-git-locale: PV changed from "3.1.36" to "3.1.37"
packages/core2-32-poky-linux/python3-git/python3-git-locale: PKGV changed from 3.1.36 [default] to 3.1.37 [default]
packages/core2-32-poky-linux/python3-git/python3-git-src: PV changed from "3.1.36" to "3.1.37"
packages/core2-32-poky-linux/python3-git/python3-git-src: PKGV changed from 3.1.36 [default] to 3.1.37 [default]
packages/core2-32-poky-linux/python3-git/python3-git-staticdev: PV changed from "3.1.36" to "3.1.37"
packages/core2-32-poky-linux/python3-git/python3-git-staticdev: PKGV changed from 3.1.36 [default] to 3.1.37 [default]
packages/core2-32-poky-linux/python3-git/python3-git: PV changed from "3.1.36" to "3.1.37"
packages/core2-32-poky-linux/python3-git/python3-git: PKGV changed from 3.1.36 [default] to 3.1.37 [default]
packages/core2-32-poky-linux/python3-git/python3-git: PKGSIZE changed from 1338870 to 1343995 (+0%)
Changes to packages/core2-32-poky-linux/python3-git (sysroot):
  /usr/lib/python3.11/site-packages/GitPython-3.1.36.dist-info moved to /usr/lib/python3.11/site-packages/GitPython-3.1.37.dist-info

--===============5702114327714563435==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-git-upgrade-3.1.36-3.1.37.patch"

RnJvbSBiYWI1NzE5MmE3ZjgyY2I3NTFjMTRhNTBjODlhMzQ5YjFmYjA2OTA2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBPY3QgMjAyMyAwOTo0Nzo1OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtZ2l0OiB1cGdyYWRlIDMuMS4zNiAtPiAzLjEuMzcKCi0tLQogLi4ubjMtZ2l0XzMuMS4z
Ni5iYiA9PiBweXRob24zLWdpdF8zLjEuMzcuYmJ9IHwgNjUgKysrKysrKysrKysrKysrKysrLQog
MSBmaWxlIGNoYW5nZWQsIDYzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1naXRfMy4xLjM2LmJiID0+IHB5
dGhvbjMtZ2l0XzMuMS4zNy5iYn0gKDIyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtZ2l0XzMuMS4zNi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1naXRfMy4xLjM3LmJiCnNpbWlsYXJpdHkgaW5kZXggMjIlCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1naXRfMy4xLjM2LmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZ2l0XzMuMS4z
Ny5iYgppbmRleCBhYjFiMGYyMzUzLi43ODYwYzliYmRkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZ2l0XzMuMS4zNi5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZ2l0XzMuMS4zNy5iYgpAQCAtMSwzICsxLDY0IEBA
CisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQg
YnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2Ug
YmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0
ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMg
aW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChl
eGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisj
IFRoZSBjaGFuZ2VzOgorIworIyAtLS0gTElDRU5TRQorIyArKysgTElDRU5TRQorIyBAQCAtMSwz
MCArMSwyOSBAQAorIyAgQ29weXJpZ2h0IChDKSAyMDA4LCAyMDA5IE1pY2hhZWwgVHJpZXIgYW5k
IGNvbnRyaWJ1dG9ycworIyAgQWxsIHJpZ2h0cyByZXNlcnZlZC4KKyMgIAorIyAtUmVkaXN0cmli
dXRpb24gYW5kIHVzZSBpbiBzb3VyY2UgYW5kIGJpbmFyeSBmb3Jtcywgd2l0aCBvciB3aXRob3V0
IAorIyAtbW9kaWZpY2F0aW9uLCBhcmUgcGVybWl0dGVkIHByb3ZpZGVkIHRoYXQgdGhlIGZvbGxv
d2luZyBjb25kaXRpb25zIAorIyArUmVkaXN0cmlidXRpb24gYW5kIHVzZSBpbiBzb3VyY2UgYW5k
IGJpbmFyeSBmb3Jtcywgd2l0aCBvciB3aXRob3V0CisjICttb2RpZmljYXRpb24sIGFyZSBwZXJt
aXR0ZWQgcHJvdmlkZWQgdGhhdCB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnMKKyMgIGFyZSBtZXQ6
CisjICAKKyMgLSogUmVkaXN0cmlidXRpb25zIG9mIHNvdXJjZSBjb2RlIG11c3QgcmV0YWluIHRo
ZSBhYm92ZSBjb3B5cmlnaHQgCisjICsqIFJlZGlzdHJpYnV0aW9ucyBvZiBzb3VyY2UgY29kZSBt
dXN0IHJldGFpbiB0aGUgYWJvdmUgY29weXJpZ2h0CisjICBub3RpY2UsIHRoaXMgbGlzdCBvZiBj
b25kaXRpb25zIGFuZCB0aGUgZm9sbG93aW5nIGRpc2NsYWltZXIuCisjICAKKyMgLSogUmVkaXN0
cmlidXRpb25zIGluIGJpbmFyeSBmb3JtIG11c3QgcmVwcm9kdWNlIHRoZSBhYm92ZSBjb3B5cmln
aHQgCisjIC1ub3RpY2UsIHRoaXMgbGlzdCBvZiBjb25kaXRpb25zIGFuZCB0aGUgZm9sbG93aW5n
IGRpc2NsYWltZXIgaW4gdGhlIAorIyArKiBSZWRpc3RyaWJ1dGlvbnMgaW4gYmluYXJ5IGZvcm0g
bXVzdCByZXByb2R1Y2UgdGhlIGFib3ZlIGNvcHlyaWdodAorIyArbm90aWNlLCB0aGlzIGxpc3Qg
b2YgY29uZGl0aW9ucyBhbmQgdGhlIGZvbGxvd2luZyBkaXNjbGFpbWVyIGluIHRoZQorIyAgZG9j
dW1lbnRhdGlvbiBhbmQvb3Igb3RoZXIgbWF0ZXJpYWxzIHByb3ZpZGVkIHdpdGggdGhlIGRpc3Ry
aWJ1dGlvbi4KKyMgIAorIyAtKiBOZWl0aGVyIHRoZSBuYW1lIG9mIHRoZSBHaXRQeXRob24gcHJv
amVjdCBub3IgdGhlIG5hbWVzIG9mIAorIyAtaXRzIGNvbnRyaWJ1dG9ycyBtYXkgYmUgdXNlZCB0
byBlbmRvcnNlIG9yIHByb21vdGUgcHJvZHVjdHMgZGVyaXZlZCAKKyMgKyogTmVpdGhlciB0aGUg
bmFtZSBvZiB0aGUgR2l0UHl0aG9uIHByb2plY3Qgbm9yIHRoZSBuYW1lcyBvZgorIyAraXRzIGNv
bnRyaWJ1dG9ycyBtYXkgYmUgdXNlZCB0byBlbmRvcnNlIG9yIHByb21vdGUgcHJvZHVjdHMgZGVy
aXZlZAorIyAgZnJvbSB0aGlzIHNvZnR3YXJlIHdpdGhvdXQgc3BlY2lmaWMgcHJpb3Igd3JpdHRl
biBwZXJtaXNzaW9uLgorIyAgCisjIC1USElTIFNPRlRXQVJFIElTIFBST1ZJREVEIEJZIFRIRSBD
T1BZUklHSFQgSE9MREVSUyBBTkQgQ09OVFJJQlVUT1JTIAorIyAtIkFTIElTIiBBTkQgQU5ZIEVY
UFJFU1MgT1IgSU1QTElFRCBXQVJSQU5USUVTLCBJTkNMVURJTkcsIEJVVCBOT1QgCisjIC1MSU1J
VEVEIFRPLCBUSEUgSU1QTElFRCBXQVJSQU5USUVTIE9GIE1FUkNIQU5UQUJJTElUWSBBTkQgRklU
TkVTUyBGT1IgCisjIC1BIFBBUlRJQ1VMQVIgUFVSUE9TRSBBUkUgRElTQ0xBSU1FRC4gSU4gTk8g
RVZFTlQgU0hBTEwgVEhFIENPUFlSSUdIVCAKKyMgLU9XTkVSIE9SIENPTlRSSUJVVE9SUyBCRSBM
SUFCTEUgRk9SIEFOWSBESVJFQ1QsIElORElSRUNULCBJTkNJREVOVEFMLCAKKyMgLVNQRUNJQUws
IEVYRU1QTEFSWSwgT1IgQ09OU0VRVUVOVElBTCBEQU1BR0VTIChJTkNMVURJTkcsIEJVVCBOT1Qg
TElNSVRFRCAKKyMgLVRPLCBQUk9DVVJFTUVOVCBPRiBTVUJTVElUVVRFIEdPT0RTIE9SIFNFUlZJ
Q0VTOyBMT1NTIE9GIFVTRSwgREFUQSwgT1IgCisjIC1QUk9GSVRTOyBPUiBCVVNJTkVTUyBJTlRF
UlJVUFRJT04pIEhPV0VWRVIgQ0FVU0VEIEFORCBPTiBBTlkgVEhFT1JZIE9GIAorIyAtTElBQklM
SVRZLCBXSEVUSEVSIElOIENPTlRSQUNULCBTVFJJQ1QgTElBQklMSVRZLCBPUiBUT1JUIChJTkNM
VURJTkcgCisjIC1ORUdMSUdFTkNFIE9SIE9USEVSV0lTRSkgQVJJU0lORyBJTiBBTlkgV0FZIE9V
VCBPRiBUSEUgVVNFIE9GIFRISVMgCisjICtUSElTIFNPRlRXQVJFIElTIFBST1ZJREVEIEJZIFRI
RSBDT1BZUklHSFQgSE9MREVSUyBBTkQgQ09OVFJJQlVUT1JTCisjICsiQVMgSVMiIEFORCBBTlkg
RVhQUkVTUyBPUiBJTVBMSUVEIFdBUlJBTlRJRVMsIElOQ0xVRElORywgQlVUIE5PVAorIyArTElN
SVRFRCBUTywgVEhFIElNUExJRUQgV0FSUkFOVElFUyBPRiBNRVJDSEFOVEFCSUxJVFkgQU5EIEZJ
VE5FU1MgRk9SCisjICtBIFBBUlRJQ1VMQVIgUFVSUE9TRSBBUkUgRElTQ0xBSU1FRC4gSU4gTk8g
RVZFTlQgU0hBTEwgVEhFIENPUFlSSUdIVAorIyArT1dORVIgT1IgQ09OVFJJQlVUT1JTIEJFIExJ
QUJMRSBGT1IgQU5ZIERJUkVDVCwgSU5ESVJFQ1QsIElOQ0lERU5UQUwsCisjICtTUEVDSUFMLCBF
WEVNUExBUlksIE9SIENPTlNFUVVFTlRJQUwgREFNQUdFUyAoSU5DTFVESU5HLCBCVVQgTk9UIExJ
TUlURUQKKyMgK1RPLCBQUk9DVVJFTUVOVCBPRiBTVUJTVElUVVRFIEdPT0RTIE9SIFNFUlZJQ0VT
OyBMT1NTIE9GIFVTRSwgREFUQSwgT1IKKyMgK1BST0ZJVFM7IE9SIEJVU0lORVNTIElOVEVSUlVQ
VElPTikgSE9XRVZFUiBDQVVTRUQgQU5EIE9OIEFOWSBUSEVPUlkgT0YKKyMgK0xJQUJJTElUWSwg
V0hFVEhFUiBJTiBDT05UUkFDVCwgU1RSSUNUIExJQUJJTElUWSwgT1IgVE9SVCAoSU5DTFVESU5H
CisjICtORUdMSUdFTkNFIE9SIE9USEVSV0lTRSkgQVJJU0lORyBJTiBBTlkgV0FZIE9VVCBPRiBU
SEUgVVNFIE9GIFRISVMKKyMgIFNPRlRXQVJFLCBFVkVOIElGIEFEVklTRUQgT0YgVEhFIFBPU1NJ
QklMSVRZIE9GIFNVQ0ggREFNQUdFLgorIyAtCisjIAorIworCiBTVU1NQVJZID0gIlB5dGhvbiBs
aWJyYXJ5IHVzZWQgdG8gaW50ZXJhY3Qgd2l0aCBHaXQgcmVwb3NpdG9yaWVzIgogREVTQ1JJUFRJ
T04gPSAiR2l0UHl0aG9uIHByb3ZpZGVzIG9iamVjdCBtb2RlbCByZWFkIGFuZCB3cml0ZSBhY2Nl
c3MgdG8gXAogYSBnaXQgcmVwb3NpdG9yeS4gQWNjZXNzIHJlcG9zaXRvcnkgaW5mb3JtYXRpb24g
Y29udmVuaWVudGx5LCBhbHRlciB0aGUgXApAQCAtNiwxMyArNjcsMTMgQEAgYWNjZXNzIHdpdGgg
YmlnLWZpbGVzIHN1cHBvcnQuIgogSE9NRVBBR0UgPSAiaHR0cDovL2dpdGh1Yi5jb20vZ2l0cHl0
aG9uLWRldmVsb3BlcnMvR2l0UHl0aG9uIgogU0VDVElPTiA9ICJkZXZlbC9weXRob24iCiBMSUNF
TlNFID0gIkJTRC0zLUNsYXVzZSIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7
bWQ1PThiOGQyNmMzN2MxZDVhMDRmOWIwMTg2ZWRiZWJjMTgzIgorTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vTElDRU5TRTttZDU9NTI3OWE3YWIzNjliYTMzNjk4OWRjZjJhMTA3ZTVjOGUiCiAK
IFBZUElfUEFDS0FHRSA9ICJHaXRQeXRob24iCiAKIGluaGVyaXQgcHlwaSBweXRob25fc2V0dXB0
b29sc19idWlsZF9tZXRhCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI0YmIwYzJhNjk5NWU4NTA2
NDE0MGQzMWEzMzI4OWFhNWRjZTgwMTMzYTIzZDM2ZmNkMzcyZDcxNmM1NGQzZWJmIgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gImY5YjlkZGMwNzYxYzEyNWQ1NzgwZWFiMmQ2NGJlNDg3M2ZjNjgxN2My
ODk5Y2JjYjM0YjAyMzQ0YmRjN2JjNTQiCiAKIERFUEVORFMgKz0gIiAke1BZVEhPTl9QTn0tZ2l0
ZGIiCiAKLS0gCjIuMzkuMgoK

--===============5702114327714563435==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-git (sysroot):
  /usr/lib/python3.11/site-packages/GitPython-3.1.36.dist-info moved to /usr/lib/python3.11/site-packages/GitPython-3.1.37.dist-info

--===============5702114327714563435==--

