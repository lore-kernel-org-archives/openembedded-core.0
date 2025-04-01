Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70523C369A7
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:23 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.18038.1743511387886438903
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=f2oUzUOv;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=PgYbqUj1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010195f160a06f-c9dbd940-2508-40f6-bd30-7456dbde288c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511397;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cBTEWRQY+AmEemZo8I6Fmu8saSRgDrF7npjGsIzHk00=;
	b=f2oUzUOvpNKSuIv9u+Fbv3QST8DRhJpLHJxE5Oe8wnWJuPHhG19X1qNPGQg1VdXW
	8jRm9YL+AzSLCof4hOdBZ+3x5a/Lc73d2JEGgaRxZlJ3ofQSI0cqHmey/TWIbKd0xqN
	1hFoBoWieS5g52seAPuehWTWhn607Bi9D9F7eSGM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511397;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cBTEWRQY+AmEemZo8I6Fmu8saSRgDrF7npjGsIzHk00=;
	b=PgYbqUj1UAcitFBjH3ryQ76tw+6CU6dOW1rETwjZOBvMPUboK/Xzycl+yJpDNfMi
	LcLwnleygdlYskvd2Mccs971DVyovuGz/6di9WawN+YtJ5sR0XOtrmsUDnz5VemfUpg
	tOw54xadNsf331H7ocTaVml14iZ5gYxZsHJgS7pg=
Content-Type: multipart/mixed; boundary="===============0146430023199023422=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-iniconfig: upgrading to 2.1.0 SUCCEEDED
Message-ID: <01010195f160a06f-c9dbd940-2508-40f6-bd30-7456dbde288c-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:16 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214062

--===============0146430023199023422==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-iniconfig* to *2.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-iniconfig-upgrade-2.0.0-2.1.0.patch
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
From f106adf94eb6e53976b57d4af6be39af2311b185 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Apr 2025 08:55:11 +0000
Subject: [PATCH] python3-iniconfig: upgrade 2.0.0 -> 2.1.0

---
 .../python/python3-iniconfig_2.0.0.bb         | 13 ----
 .../python/python3-iniconfig_2.1.0.bb         | 65 +++++++++++++++++++
 2 files changed, 65 insertions(+), 13 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-iniconfig_2.1.0.bb

diff --git a/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb b/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb
deleted file mode 100644
index 2abeec62f4..0000000000
--- a/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY = "A small and simple INI-file parser module"
-HOMEPAGE = "https://pypi.org/project/iniconfig/"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
-
-SRC_URI[sha256sum] = "2d91e135bf72d31a410b17c16da610a82cb55f6b0477d1a902134b24a455b8b3"
-
-DEPENDS += "python3-hatch-vcs-native"
-
-inherit pypi python_hatchling
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-iniconfig_2.1.0.bb b/meta/recipes-devtools/python/python3-iniconfig_2.1.0.bb
new file mode 100644
index 0000000000..dc22340e0c
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-iniconfig_2.1.0.bb
@@ -0,0 +1,65 @@
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
+# @@ -1,19 +1,21 @@
+# +The MIT License (MIT)
+#  
+# -  Permission is hereby granted, free of charge, to any person obtaining a copy
+# -  of this software and associated documentation files (the "Software"), to deal
+# -  in the Software without restriction, including without limitation the rights
+# -  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+# -  copies of the Software, and to permit persons to whom the Software is
+# -  furnished to do so, subject to the following conditions:
+# -     
+# -  The above copyright notice and this permission notice shall be included in all
+# -  copies or substantial portions of the Software.
+# - 
+# -  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+# -  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+# -  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+# -  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+# -  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+# -  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+# -  SOFTWARE.
+# +Copyright (c) 2010 - 2023 Holger Krekel and others
+#  
+# +Permission is hereby granted, free of charge, to any person obtaining a copy of
+# +this software and associated documentation files (the "Software"), to deal in
+# +the Software without restriction, including without limitation the rights to
+# +use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
+# +of the Software, and to permit persons to whom the Software is furnished to do
+# +so, subject to the following conditions:
+# +
+# +The above copyright notice and this permission notice shall be included in all
+# +copies or substantial portions of the Software.
+# +
+# +THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+# +IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+# +FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+# +AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+# +LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+# +OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+# +SOFTWARE.
+# 
+#
+
+SUMMARY = "A small and simple INI-file parser module"
+HOMEPAGE = "https://pypi.org/project/iniconfig/"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4a73af4b5f1f3a8731e5def70e8c1254"
+
+SRC_URI[sha256sum] = "3abbd2e30b36733fee78f9c7f7308f2d0050e88f0087fd25c2645f63c773e1c7"
+
+DEPENDS += "python3-hatch-vcs-native"
+
+inherit pypi python_hatchling
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.47.1


--===============0146430023199023422==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-iniconfig (sysroot):
  /usr/lib/python3.13/site-packages/iniconfig-2.0.0.dist-info moved to /usr/lib/python3.13/site-packages/iniconfig-2.1.0.dist-info

--===============0146430023199023422==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-iniconfig: SRC_URI changed from "https://files.pythonhosted.org/packages/source/i/iniconfig/iniconfig-2.0.0.tar.gz;downloadfilename=iniconfig-2.0.0.tar.gz" to "https://files.pythonhosted.org/packages/source/i/iniconfig/iniconfig-2.1.0.tar.gz;downloadfilename=iniconfig-2.1.0.tar.gz"
packages/core2-64-poky-linux/python3-iniconfig: PKGV changed from 2.0.0 [default] to 2.1.0 [default]
packages/core2-64-poky-linux/python3-iniconfig: PV changed from "2.0.0" to "2.1.0"
packages/core2-64-poky-linux/python3-iniconfig/python3-iniconfig-dbg: PKGV changed from 2.0.0 [default] to 2.1.0 [default]
packages/core2-64-poky-linux/python3-iniconfig/python3-iniconfig-dbg: PV changed from "2.0.0" to "2.1.0"
packages/core2-64-poky-linux/python3-iniconfig/python3-iniconfig-dev: PKGV changed from 2.0.0 [default] to 2.1.0 [default]
packages/core2-64-poky-linux/python3-iniconfig/python3-iniconfig-dev: PV changed from "2.0.0" to "2.1.0"
packages/core2-64-poky-linux/python3-iniconfig/python3-iniconfig-doc: PKGV changed from 2.0.0 [default] to 2.1.0 [default]
packages/core2-64-poky-linux/python3-iniconfig/python3-iniconfig-doc: PV changed from "2.0.0" to "2.1.0"
packages/core2-64-poky-linux/python3-iniconfig/python3-iniconfig-locale: PKGV changed from 2.0.0 [default] to 2.1.0 [default]
packages/core2-64-poky-linux/python3-iniconfig/python3-iniconfig-locale: PV changed from "2.0.0" to "2.1.0"
packages/core2-64-poky-linux/python3-iniconfig/python3-iniconfig-src: PKGV changed from 2.0.0 [default] to 2.1.0 [default]
packages/core2-64-poky-linux/python3-iniconfig/python3-iniconfig-src: PV changed from "2.0.0" to "2.1.0"
packages/core2-64-poky-linux/python3-iniconfig/python3-iniconfig-staticdev: PKGV changed from 2.0.0 [default] to 2.1.0 [default]
packages/core2-64-poky-linux/python3-iniconfig/python3-iniconfig-staticdev: PV changed from "2.0.0" to "2.1.0"
packages/core2-64-poky-linux/python3-iniconfig/python3-iniconfig: PKGSIZE changed from 26884 to 26913 (+0%)
packages/core2-64-poky-linux/python3-iniconfig/python3-iniconfig: PKGV changed from 2.0.0 [default] to 2.1.0 [default]
packages/core2-64-poky-linux/python3-iniconfig/python3-iniconfig: PV changed from "2.0.0" to "2.1.0"
Changes to packages/core2-64-poky-linux/python3-iniconfig (sysroot):
  /usr/lib/python3.13/site-packages/iniconfig-2.0.0.dist-info moved to /usr/lib/python3.13/site-packages/iniconfig-2.1.0.dist-info

--===============0146430023199023422==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-iniconfig-upgrade-2.0.0-2.1.0.patch"

RnJvbSBmMTA2YWRmOTRlYjZlNTM5NzZiNTdkNGFmNmJlMzlhZjIzMTFiMTg1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBcHIgMjAyNSAwODo1NToxMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaW5pY29uZmlnOiB1cGdyYWRlIDIuMC4wIC0+IDIuMS4wCgotLS0KIC4uLi9weXRob24v
cHl0aG9uMy1pbmljb25maWdfMi4wLjAuYmIgICAgICAgICB8IDEzIC0tLS0KIC4uLi9weXRob24v
cHl0aG9uMy1pbmljb25maWdfMi4xLjAuYmIgICAgICAgICB8IDY1ICsrKysrKysrKysrKysrKysr
KysKIDIgZmlsZXMgY2hhbmdlZCwgNjUgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCiBk
ZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWlu
aWNvbmZpZ18yLjAuMC5iYgogY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1pbmljb25maWdfMi4xLjAuYmIKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaW5pY29uZmlnXzIuMC4wLmJiIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWluaWNvbmZpZ18yLjAuMC5iYgpkZWxldGVk
IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMmFiZWVjNjJmNC4uMDAwMDAwMDAwMAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaW5pY29uZmlnXzIuMC4wLmJiCisrKyAv
ZGV2L251bGwKQEAgLTEsMTMgKzAsMCBAQAotU1VNTUFSWSA9ICJBIHNtYWxsIGFuZCBzaW1wbGUg
SU5JLWZpbGUgcGFyc2VyIG1vZHVsZSIKLUhPTUVQQUdFID0gImh0dHBzOi8vcHlwaS5vcmcvcHJv
amVjdC9pbmljb25maWcvIgotCi1MSUNFTlNFID0gIk1JVCIKLUxJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0xJQ0VOU0U7bWQ1PWE2YmIwMzIwYjA0YTBhNTAzZjEyZjY5ZmVhNDc5ZGU5IgotCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiMmQ5MWUxMzViZjcyZDMxYTQxMGIxN2MxNmRhNjEwYTgyY2I1
NWY2YjA0NzdkMWE5MDIxMzRiMjRhNDU1YjhiMyIKLQotREVQRU5EUyArPSAicHl0aG9uMy1oYXRj
aC12Y3MtbmF0aXZlIgotCi1pbmhlcml0IHB5cGkgcHl0aG9uX2hhdGNobGluZwotCi1CQkNMQVNT
RVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtaW5pY29uZmlnXzIuMS4wLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWluaWNvbmZpZ18yLjEuMC5iYgpuZXcgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCAwMDAwMDAwMDAwLi5kYzIyMzQwZTBjCi0tLSAvZGV2L251bGwKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWluaWNvbmZpZ18yLjEuMC5iYgpAQCAt
MCwwICsxLDY1IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBi
ZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhl
IGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMg
UGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUg
dGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6
JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRh
dGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gTElDRU5TRQorIyArKysgTElDRU5T
RQorIyBAQCAtMSwxOSArMSwyMSBAQAorIyArVGhlIE1JVCBMaWNlbnNlIChNSVQpCisjICAKKyMg
LSAgUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBw
ZXJzb24gb2J0YWluaW5nIGEgY29weQorIyAtICBvZiB0aGlzIHNvZnR3YXJlIGFuZCBhc3NvY2lh
dGVkIGRvY3VtZW50YXRpb24gZmlsZXMgKHRoZSAiU29mdHdhcmUiKSwgdG8gZGVhbAorIyAtICBp
biB0aGUgU29mdHdhcmUgd2l0aG91dCByZXN0cmljdGlvbiwgaW5jbHVkaW5nIHdpdGhvdXQgbGlt
aXRhdGlvbiB0aGUgcmlnaHRzCisjIC0gIHRvIHVzZSwgY29weSwgbW9kaWZ5LCBtZXJnZSwgcHVi
bGlzaCwgZGlzdHJpYnV0ZSwgc3VibGljZW5zZSwgYW5kL29yIHNlbGwKKyMgLSAgY29waWVzIG9m
IHRoZSBTb2Z0d2FyZSwgYW5kIHRvIHBlcm1pdCBwZXJzb25zIHRvIHdob20gdGhlIFNvZnR3YXJl
IGlzCisjIC0gIGZ1cm5pc2hlZCB0byBkbyBzbywgc3ViamVjdCB0byB0aGUgZm9sbG93aW5nIGNv
bmRpdGlvbnM6CisjIC0gICAgIAorIyAtICBUaGUgYWJvdmUgY29weXJpZ2h0IG5vdGljZSBhbmQg
dGhpcyBwZXJtaXNzaW9uIG5vdGljZSBzaGFsbCBiZSBpbmNsdWRlZCBpbiBhbGwKKyMgLSAgY29w
aWVzIG9yIHN1YnN0YW50aWFsIHBvcnRpb25zIG9mIHRoZSBTb2Z0d2FyZS4KKyMgLSAKKyMgLSAg
VEhFIFNPRlRXQVJFIElTIFBST1ZJREVEICJBUyBJUyIsIFdJVEhPVVQgV0FSUkFOVFkgT0YgQU5Z
IEtJTkQsIEVYUFJFU1MgT1IKKyMgLSAgSU1QTElFRCwgSU5DTFVESU5HIEJVVCBOT1QgTElNSVRF
RCBUTyBUSEUgV0FSUkFOVElFUyBPRiBNRVJDSEFOVEFCSUxJVFksCisjIC0gIEZJVE5FU1MgRk9S
IEEgUEFSVElDVUxBUiBQVVJQT1NFIEFORCBOT05JTkZSSU5HRU1FTlQuIElOIE5PIEVWRU5UIFNI
QUxMIFRIRQorIyAtICBBVVRIT1JTIE9SIENPUFlSSUdIVCBIT0xERVJTIEJFIExJQUJMRSBGT1Ig
QU5ZIENMQUlNLCBEQU1BR0VTIE9SIE9USEVSCisjIC0gIExJQUJJTElUWSwgV0hFVEhFUiBJTiBB
TiBBQ1RJT04gT0YgQ09OVFJBQ1QsIFRPUlQgT1IgT1RIRVJXSVNFLCBBUklTSU5HIEZST00sCisj
IC0gIE9VVCBPRiBPUiBJTiBDT05ORUNUSU9OIFdJVEggVEhFIFNPRlRXQVJFIE9SIFRIRSBVU0Ug
T1IgT1RIRVIgREVBTElOR1MgSU4gVEhFCisjIC0gIFNPRlRXQVJFLgorIyArQ29weXJpZ2h0IChj
KSAyMDEwIC0gMjAyMyBIb2xnZXIgS3Jla2VsIGFuZCBvdGhlcnMKKyMgIAorIyArUGVybWlzc2lv
biBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24gb2J0YWlu
aW5nIGEgY29weSBvZgorIyArdGhpcyBzb2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0
aW9uIGZpbGVzICh0aGUgIlNvZnR3YXJlIiksIHRvIGRlYWwgaW4KKyMgK3RoZSBTb2Z0d2FyZSB3
aXRob3V0IHJlc3RyaWN0aW9uLCBpbmNsdWRpbmcgd2l0aG91dCBsaW1pdGF0aW9uIHRoZSByaWdo
dHMgdG8KKyMgK3VzZSwgY29weSwgbW9kaWZ5LCBtZXJnZSwgcHVibGlzaCwgZGlzdHJpYnV0ZSwg
c3VibGljZW5zZSwgYW5kL29yIHNlbGwgY29waWVzCisjICtvZiB0aGUgU29mdHdhcmUsIGFuZCB0
byBwZXJtaXQgcGVyc29ucyB0byB3aG9tIHRoZSBTb2Z0d2FyZSBpcyBmdXJuaXNoZWQgdG8gZG8K
KyMgK3NvLCBzdWJqZWN0IHRvIHRoZSBmb2xsb3dpbmcgY29uZGl0aW9uczoKKyMgKworIyArVGhl
IGFib3ZlIGNvcHlyaWdodCBub3RpY2UgYW5kIHRoaXMgcGVybWlzc2lvbiBub3RpY2Ugc2hhbGwg
YmUgaW5jbHVkZWQgaW4gYWxsCisjICtjb3BpZXMgb3Igc3Vic3RhbnRpYWwgcG9ydGlvbnMgb2Yg
dGhlIFNvZnR3YXJlLgorIyArCisjICtUSEUgU09GVFdBUkUgSVMgUFJPVklERUQgIkFTIElTIiwg
V0lUSE9VVCBXQVJSQU5UWSBPRiBBTlkgS0lORCwgRVhQUkVTUyBPUgorIyArSU1QTElFRCwgSU5D
TFVESU5HIEJVVCBOT1QgTElNSVRFRCBUTyBUSEUgV0FSUkFOVElFUyBPRiBNRVJDSEFOVEFCSUxJ
VFksCisjICtGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRSBBTkQgTk9OSU5GUklOR0VN
RU5ULiBJTiBOTyBFVkVOVCBTSEFMTCBUSEUKKyMgK0FVVEhPUlMgT1IgQ09QWVJJR0hUIEhPTERF
UlMgQkUgTElBQkxFIEZPUiBBTlkgQ0xBSU0sIERBTUFHRVMgT1IgT1RIRVIKKyMgK0xJQUJJTElU
WSwgV0hFVEhFUiBJTiBBTiBBQ1RJT04gT0YgQ09OVFJBQ1QsIFRPUlQgT1IgT1RIRVJXSVNFLCBB
UklTSU5HIEZST00sCisjICtPVVQgT0YgT1IgSU4gQ09OTkVDVElPTiBXSVRIIFRIRSBTT0ZUV0FS
RSBPUiBUSEUgVVNFIE9SIE9USEVSIERFQUxJTkdTIElOIFRIRQorIyArU09GVFdBUkUuCisjIAor
IworCitTVU1NQVJZID0gIkEgc21hbGwgYW5kIHNpbXBsZSBJTkktZmlsZSBwYXJzZXIgbW9kdWxl
IgorSE9NRVBBR0UgPSAiaHR0cHM6Ly9weXBpLm9yZy9wcm9qZWN0L2luaWNvbmZpZy8iCisKK0xJ
Q0VOU0UgPSAiTUlUIgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9NGE3
M2FmNGI1ZjFmM2E4NzMxZTVkZWY3MGU4YzEyNTQiCisKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIz
YWJiZDJlMzBiMzY3MzNmZWU3OGY5YzdmNzMwOGYyZDAwNTBlODhmMDA4N2ZkMjVjMjY0NWY2M2M3
NzNlMWM3IgorCitERVBFTkRTICs9ICJweXRob24zLWhhdGNoLXZjcy1uYXRpdmUiCisKK2luaGVy
aXQgcHlwaSBweXRob25faGF0Y2hsaW5nCisKK0JCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2
ZXNkayIKLS0gCjIuNDcuMQoK

--===============0146430023199023422==--

