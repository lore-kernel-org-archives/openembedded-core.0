Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2B49CAC593
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:56:42 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.89808.1756850196030763749
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:56:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=O890lJ7D;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=LCwWITqW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101990c6e8b9f-323b0a86-43a5-4a05-9c12-74312841e945-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1756850195;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JhMYnuJQvAuocbqVDlFut+Dm6kTU2wae0QzxM/DGSGo=;
	b=O890lJ7DlGlkpbSriGLB3zY3rZ4ZBKD17A9xDfxtiat7aWfZY6+8YJCJRkPYP/ht
	TShCsLj1+8/rCpMTi2h8//RJgHxZ+WU3M3/YrkxZOurg1D9dRDOEmtShoY2LqOEQJLK
	bjDg9CuOuZvWe/BCjE9SC5/F2x0n1EWboJoWBrpg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1756850195;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JhMYnuJQvAuocbqVDlFut+Dm6kTU2wae0QzxM/DGSGo=;
	b=LCwWITqWiPgnAp5eszopZoAjyKPKCvmk+yz2GD599X5nbL/+f2n/T5zSngcPCs6v
	jKa+NGw08kw5EjalXQMnOLjO7epYASrul7WbDtcHVhqLkp4JPfnSj4TZV1d2fzOPn+l
	AEiOb7a/++4Gg57WnXE0R6ff1HZhmxkdAru159qU=
Content-Type: multipart/mixed; boundary="===============0994249319631641851=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] acpica: upgrading to 20250807 SUCCEEDED
Message-ID: <010101990c6e8b9f-323b0a86-43a5-4a05-9c12-74312841e945-000000@us-west-2.amazonses.com>
Date: Tue, 2 Sep 2025 21:56:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:56:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222796

--===============0994249319631641851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *acpica* to *20250807* has Succeeded.

Next steps:
    - apply the patch: git am 0001-acpica-upgrade-20240827-20250807.patch
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
From 40ab2251066e4e2366850e74dc8beac32e001cf8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 2 Sep 2025 19:12:05 +0000
Subject: [PATCH] acpica: upgrade 20240827 -> 20250807

---
 ...{acpica_20240827.bb => acpica_20250807.bb} | 26 +++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/acpica/{acpica_20240827.bb => acpica_20250807.bb} (66%)

diff --git a/meta/recipes-extended/acpica/acpica_20240827.bb b/meta/recipes-extended/acpica/acpica_20250807.bb
similarity index 66%
rename from meta/recipes-extended/acpica/acpica_20240827.bb
rename to meta/recipes-extended/acpica/acpica_20250807.bb
index f9f9f9f687..cba1a51fdd 100644
--- a/meta/recipes-extended/acpica/acpica_20240827.bb
+++ b/meta/recipes-extended/acpica/acpica_20250807.bb
@@ -1,3 +1,25 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- source/compiler/aslcompile.c
+# +++ source/compiler/aslcompile.c
+# @@ -2,7 +2,7 @@
+#   *
+#   * 1. Copyright Notice
+#   *
+# - * Some or all of this work - Copyright (c) 1999 - 2024, Intel Corp.
+# + * Some or all of this work - Copyright (c) 1999 - 2025, Intel Corp.
+#   * All rights reserved.
+#   *
+#   * 2. License
+# 
+#
+
 SUMMARY = "ACPICA tools for the development and debug of ACPI tables"
 DESCRIPTION = "The ACPI Component Architecture (ACPICA) project provides an \
 OS-independent reference implementation of the Advanced Configuration and \
@@ -10,14 +32,14 @@ HOMEPAGE = "https://www.intel.com/content/www/us/en/developer/topic-technology/o
 SECTION = "console/tools"
 
 LICENSE = "Intel | BSD-3-Clause | GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://source/compiler/aslcompile.c;beginline=7;endline=150;md5=05eb845b15a27440410f456adc2ed082"
+LIC_FILES_CHKSUM = "file://source/compiler/aslcompile.c;beginline=7;endline=150;md5=8566a414d226d05b68e41f30698f9624"
 
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
 DEPENDS = "m4-native flex-native bison-native"
 
 SRC_URI = "git://github.com/acpica/acpica;protocol=https;branch=master"
-SRCREV = "e80cbd7b52de20aa8c75bfba9845e9cb61f2e681"
+SRCREV = "aa98db3bd149fc1f8d2a3017cb05b6b1982c3296"
 
 inherit update-alternatives
 
-- 
2.47.1


--===============0994249319631641851==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-acpica-upgrade-20240827-20250807.patch"

RnJvbSA0MGFiMjI1MTA2NmU0ZTIzNjY4NTBlNzRkYzhiZWFjMzJlMDAxY2Y4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMiBTZXAgMjAyNSAxOToxMjowNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGFj
cGljYTogdXBncmFkZSAyMDI0MDgyNyAtPiAyMDI1MDgwNwoKLS0tCiAuLi57YWNwaWNhXzIwMjQw
ODI3LmJiID0+IGFjcGljYV8yMDI1MDgwNy5iYn0gfCAyNiArKysrKysrKysrKysrKysrKy0tCiAx
IGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvYWNwaWNhL3thY3BpY2FfMjAyNDA4MjcuYmIgPT4gYWNwaWNh
XzIwMjUwODA3LmJifSAoNjYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9h
Y3BpY2EvYWNwaWNhXzIwMjQwODI3LmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2FjcGljYS9h
Y3BpY2FfMjAyNTA4MDcuYmIKc2ltaWxhcml0eSBpbmRleCA2NiUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL2FjcGljYS9hY3BpY2FfMjAyNDA4MjcuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9hY3BpY2EvYWNwaWNhXzIwMjUwODA3LmJiCmluZGV4IGY5ZjlmOWY2
ODcuLmNiYTFhNTFmZGQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9hY3BpY2Ev
YWNwaWNhXzIwMjQwODI3LmJiCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9hY3BpY2EvYWNw
aWNhXzIwMjUwODA3LmJiCkBAIC0xLDMgKzEsMjUgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNf
Q0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMg
VGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBu
ZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5l
ZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2Ug
dmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTog
Y29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBz
b3VyY2UvY29tcGlsZXIvYXNsY29tcGlsZS5jCisjICsrKyBzb3VyY2UvY29tcGlsZXIvYXNsY29t
cGlsZS5jCisjIEBAIC0yLDcgKzIsNyBAQAorIyAgICoKKyMgICAqIDEuIENvcHlyaWdodCBOb3Rp
Y2UKKyMgICAqCisjIC0gKiBTb21lIG9yIGFsbCBvZiB0aGlzIHdvcmsgLSBDb3B5cmlnaHQgKGMp
IDE5OTkgLSAyMDI0LCBJbnRlbCBDb3JwLgorIyArICogU29tZSBvciBhbGwgb2YgdGhpcyB3b3Jr
IC0gQ29weXJpZ2h0IChjKSAxOTk5IC0gMjAyNSwgSW50ZWwgQ29ycC4KKyMgICAqIEFsbCByaWdo
dHMgcmVzZXJ2ZWQuCisjICAgKgorIyAgICogMi4gTGljZW5zZQorIyAKKyMKKwogU1VNTUFSWSA9
ICJBQ1BJQ0EgdG9vbHMgZm9yIHRoZSBkZXZlbG9wbWVudCBhbmQgZGVidWcgb2YgQUNQSSB0YWJs
ZXMiCiBERVNDUklQVElPTiA9ICJUaGUgQUNQSSBDb21wb25lbnQgQXJjaGl0ZWN0dXJlIChBQ1BJ
Q0EpIHByb2plY3QgcHJvdmlkZXMgYW4gXAogT1MtaW5kZXBlbmRlbnQgcmVmZXJlbmNlIGltcGxl
bWVudGF0aW9uIG9mIHRoZSBBZHZhbmNlZCBDb25maWd1cmF0aW9uIGFuZCBcCkBAIC0xMCwxNCAr
MzIsMTQgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly93d3cuaW50ZWwuY29tL2NvbnRlbnQvd3d3L3Vz
L2VuL2RldmVsb3Blci90b3BpYy10ZWNobm9sb2d5L28KIFNFQ1RJT04gPSAiY29uc29sZS90b29s
cyIKIAogTElDRU5TRSA9ICJJbnRlbCB8IEJTRC0zLUNsYXVzZSB8IEdQTC0yLjAtb25seSIKLUxJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL3NvdXJjZS9jb21waWxlci9hc2xjb21waWxlLmM7YmVn
aW5saW5lPTc7ZW5kbGluZT0xNTA7bWQ1PTA1ZWI4NDViMTVhMjc0NDA0MTBmNDU2YWRjMmVkMDgy
IgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vc291cmNlL2NvbXBpbGVyL2FzbGNvbXBpbGUu
YztiZWdpbmxpbmU9NztlbmRsaW5lPTE1MDttZDU9ODU2NmE0MTRkMjI2ZDA1YjY4ZTQxZjMwNjk4
Zjk2MjQiCiAKIENPTVBBVElCTEVfSE9TVCA9ICIoaS44Nnx4ODZfNjR8YXJtfGFhcmNoNjQpLiot
bGludXgiCiAKIERFUEVORFMgPSAibTQtbmF0aXZlIGZsZXgtbmF0aXZlIGJpc29uLW5hdGl2ZSIK
IAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL2FjcGljYS9hY3BpY2E7cHJvdG9jb2w9aHR0
cHM7YnJhbmNoPW1hc3RlciIKLVNSQ1JFViA9ICJlODBjYmQ3YjUyZGUyMGFhOGM3NWJmYmE5ODQ1
ZTljYjYxZjJlNjgxIgorU1JDUkVWID0gImFhOThkYjNiZDE0OWZjMWY4ZDJhMzAxN2NiMDViNmIx
OTgyYzMyOTYiCiAKIGluaGVyaXQgdXBkYXRlLWFsdGVybmF0aXZlcwogCi0tIAoyLjQ3LjEKCg==

--===============0994249319631641851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/acpica/acpica-dbg: PV changed from "20240827" to "20250807"
packages/x86-64-v3-poky-linux/acpica/acpica-dbg: PKGSIZE changed from 10747064 to 10772032 (+0%)
packages/x86-64-v3-poky-linux/acpica/acpica-dbg: PKGV changed from 20240827 [default] to 20250807 [default]
packages/x86-64-v3-poky-linux/acpica/acpica-dev: PV changed from "20240827" to "20250807"
packages/x86-64-v3-poky-linux/acpica/acpica-dev: PKGV changed from 20240827 [default] to 20250807 [default]
packages/x86-64-v3-poky-linux/acpica/acpica-doc: PV changed from "20240827" to "20250807"
packages/x86-64-v3-poky-linux/acpica/acpica-doc: PKGV changed from 20240827 [default] to 20250807 [default]
packages/x86-64-v3-poky-linux/acpica/acpica-locale: PV changed from "20240827" to "20250807"
packages/x86-64-v3-poky-linux/acpica/acpica-locale: PKGV changed from 20240827 [default] to 20250807 [default]
packages/x86-64-v3-poky-linux/acpica/acpica-src: PV changed from "20240827" to "20250807"
packages/x86-64-v3-poky-linux/acpica/acpica-src: PKGSIZE changed from 10463157 to 10553641 (+1%)
packages/x86-64-v3-poky-linux/acpica/acpica-src: PKGV changed from 20240827 [default] to 20250807 [default]
packages/x86-64-v3-poky-linux/acpica/acpica-staticdev: PV changed from "20240827" to "20250807"
packages/x86-64-v3-poky-linux/acpica/acpica-staticdev: PKGV changed from 20240827 [default] to 20250807 [default]
packages/x86-64-v3-poky-linux/acpica/acpica: PV changed from "20240827" to "20250807"
packages/x86-64-v3-poky-linux/acpica/acpica: PKGSIZE changed from 2660960 to 2682016 (+1%)
packages/x86-64-v3-poky-linux/acpica/acpica: PKGV changed from 20240827 [default] to 20250807 [default]
packages/x86-64-v3-poky-linux/acpica: PV changed from "20240827" to "20250807"
packages/x86-64-v3-poky-linux/acpica: PKGV changed from 20240827 [default] to 20250807 [default]

--===============0994249319631641851==--

