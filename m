Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0900CA601F
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 06:50:24 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2374.1791528619233888569
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2026 23:50:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=i2hRX/76;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=av7/2dcC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a11f6d4930-5d6880f2-ed87-412d-829d-d62b756e3b3d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791528618;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6+WaabDWRrhMZuaofSKAnJCpnmuql0aDlekzKAmEr4Q=;
	b=i2hRX/76xTzbUWA6bye2zuJ/oR3kGWosOjg8riZM8zvMlHMvxvFdhEDe1V71IyZE
	hskPOkd6xah8oqKNBO/dJq0JYAicZBDs1lGQapB6yn4+xMShM55SkUA9+enXBKhvf7M
	3pDGaonl7IsOmaYzSTMY6tQAKI/QwTQyjD/LJE2c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791528618;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6+WaabDWRrhMZuaofSKAnJCpnmuql0aDlekzKAmEr4Q=;
	b=av7/2dcChnjn1ir4xqVtDOxOML1lBfwZ0sEICAaxUM60COrNB5bC82EU4JKVM8pW
	Cvn6rqVGSPqEYu9Fw2alO1vIFEu0qAx5L5dpq8WyWoa7u+YiadXGjtMsebXziqvtmzc
	huTvEl6ND075sCDy5RcTsuNU8MS94UF8hIZY/nk8=
Content-Type: multipart/mixed; boundary="===============1267570976708912198=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pycparser: upgrading to 3.1 SUCCEEDED
Message-ID: <010101a11f6d4930-5d6880f2-ed87-412d-829d-d62b756e3b3d-000000@us-west-2.amazonses.com>
Date: Fri, 9 Oct 2026 06:50:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.09-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2026 06:50:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247459

--===============1267570976708912198==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pycparser* to *3.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pycparser-upgrade-3.0-3.1.patch
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
From a2b653d8b73b723ac4f8ea33ecaead595529efd8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 9 Oct 2026 05:50:17 +0000
Subject: [PATCH] python3-pycparser: upgrade 3.0 -> 3.1

---
 ...parser_3.0.bb => python3-pycparser_3.1.bb} | 25 +++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pycparser_3.0.bb => python3-pycparser_3.1.bb} (32%)

diff --git a/meta/recipes-devtools/python/python3-pycparser_3.0.bb b/meta/recipes-devtools/python/python3-pycparser_3.1.bb
similarity index 32%
rename from meta/recipes-devtools/python/python3-pycparser_3.0.bb
rename to meta/recipes-devtools/python/python3-pycparser_3.1.bb
index ea7b7cc14b..3d3da7f0eb 100644
--- a/meta/recipes-devtools/python/python3-pycparser_3.0.bb
+++ b/meta/recipes-devtools/python/python3-pycparser_3.1.bb
@@ -1,9 +1,30 @@
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
+# @@ -1,6 +1,6 @@
+#  pycparser -- A C parser in Python
+#  
+# -Copyright (c) 2008-2022, Eli Bendersky
+# +Copyright (c) 2008-2027, Eli Bendersky
+#  All rights reserved.
+#  
+#  Redistribution and use in source and binary forms, with or without modification,
+# 
+#
+
 SUMMARY = "Parser of the C language, written in pure Python"
 HOMEPAGE = "https://github.com/eliben/pycparser"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=9761c3ffee7ba99c60dca0408fd3262b"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c453675224ee9a35b46135214d26c055"
 
-SRC_URI[sha256sum] = "600f49d217304a5902ac3c37e1281c9fe94e4d0489de643a9504c5cdfdfc6b29"
+SRC_URI[sha256sum] = "b3fc6dec06a8b2fefa0ed4ff92285306a5e3be9987bc5603c9edbdc4e492418f"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.1


--===============1267570976708912198==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pycparser: PV changed from "3.0" to "3.1"
packages/x86-64-v3-poky-linux/python3-pycparser: PKGV changed from 3.0 [default] to 3.1 [default]
packages/x86-64-v3-poky-linux/python3-pycparser: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pycparser/pycparser-3.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pycparser/pycparser-3.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-dbg: PV changed from "3.0" to "3.1"
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-dbg: PKGV changed from 3.0 [default] to 3.1 [default]
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-dev: PV changed from "3.0" to "3.1"
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-dev: PKGV changed from 3.0 [default] to 3.1 [default]
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-doc: PV changed from "3.0" to "3.1"
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-doc: PKGV changed from 3.0 [default] to 3.1 [default]
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-locale: PV changed from "3.0" to "3.1"
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-locale: PKGV changed from 3.0 [default] to 3.1 [default]
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-src: PV changed from "3.0" to "3.1"
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-src: PKGV changed from 3.0 [default] to 3.1 [default]
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-staticdev: PV changed from "3.0" to "3.1"
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-staticdev: PKGV changed from 3.0 [default] to 3.1 [default]
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser: PV changed from "3.0" to "3.1"
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser: PKGSIZE changed from 474185 to 475853 (+0%)
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pycparser-3.0.dist-info -> /usr/lib/python3.14/site-packages/pycparser-3.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/pycparser-3.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/pycparser-3.1.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser: PKGV changed from 3.0 [default] to 3.1 [default]
Changes to packages/x86-64-v3-poky-linux/python3-pycparser (sysroot):
  /usr/lib/python3.14/site-packages/pycparser-3.0.dist-info moved to /usr/lib/python3.14/site-packages/pycparser-3.1.dist-info

--===============1267570976708912198==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pycparser-3.0.dist-info -> /usr/lib/python3.14/site-packages/pycparser-3.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/pycparser-3.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/pycparser-3.1.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-pycparser (sysroot):
  /usr/lib/python3.14/site-packages/pycparser-3.0.dist-info moved to /usr/lib/python3.14/site-packages/pycparser-3.1.dist-info

--===============1267570976708912198==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pycparser-upgrade-3.0-3.1.patch"

RnJvbSBhMmI2NTNkOGI3M2I3MjNhYzRmOGVhMzNlY2FlYWQ1OTU1MjllZmQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgOSBPY3QgMjAyNiAwNTo1MDoxNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHljcGFyc2VyOiB1cGdyYWRlIDMuMCAtPiAzLjEKCi0tLQogLi4ucGFyc2VyXzMuMC5i
YiA9PiBweXRob24zLXB5Y3BhcnNlcl8zLjEuYmJ9IHwgMjUgKysrKysrKysrKysrKysrKystLQog
MSBmaWxlIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1weWNwYXJzZXJfMy4wLmJiID0+
IHB5dGhvbjMtcHljcGFyc2VyXzMuMS5iYn0gKDMyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljcGFyc2VyXzMuMC5iYiBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNwYXJzZXJfMy4xLmJiCnNpbWlsYXJpdHkgaW5k
ZXggMzIlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1w
eWNwYXJzZXJfMy4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtcHljcGFyc2VyXzMuMS5iYgppbmRleCBlYTdiN2NjMTRiLi4zZDNkYTdmMGViIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljcGFyc2VyXzMu
MC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljcGFyc2Vy
XzMuMS5iYgpAQCAtMSw5ICsxLDMwIEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2
YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xs
b3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vu
c2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFu
ZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGlj
ZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdo
dCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gTElDRU5TRQor
IyArKysgTElDRU5TRQorIyBAQCAtMSw2ICsxLDYgQEAKKyMgIHB5Y3BhcnNlciAtLSBBIEMgcGFy
c2VyIGluIFB5dGhvbgorIyAgCisjIC1Db3B5cmlnaHQgKGMpIDIwMDgtMjAyMiwgRWxpIEJlbmRl
cnNreQorIyArQ29weXJpZ2h0IChjKSAyMDA4LTIwMjcsIEVsaSBCZW5kZXJza3kKKyMgIEFsbCBy
aWdodHMgcmVzZXJ2ZWQuCisjICAKKyMgIFJlZGlzdHJpYnV0aW9uIGFuZCB1c2UgaW4gc291cmNl
IGFuZCBiaW5hcnkgZm9ybXMsIHdpdGggb3Igd2l0aG91dCBtb2RpZmljYXRpb24sCisjIAorIwor
CiBTVU1NQVJZID0gIlBhcnNlciBvZiB0aGUgQyBsYW5ndWFnZSwgd3JpdHRlbiBpbiBwdXJlIFB5
dGhvbiIKIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9lbGliZW4vcHljcGFyc2VyIgog
TElDRU5TRSA9ICJCU0QtMy1DbGF1c2UiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNF
TlNFO21kNT05NzYxYzNmZmVlN2JhOTljNjBkY2EwNDA4ZmQzMjYyYiIKK0xJQ19GSUxFU19DSEtT
VU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWM0NTM2NzUyMjRlZTlhMzViNDYxMzUyMTRkMjZjMDU1
IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjAwZjQ5ZDIxNzMwNGE1OTAyYWMzYzM3ZTEyODFj
OWZlOTRlNGQwNDg5ZGU2NDNhOTUwNGM1Y2RmZGZjNmIyOSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICJiM2ZjNmRlYzA2YThiMmZlZmEwZWQ0ZmY5MjI4NTMwNmE1ZTNiZTk5ODdiYzU2MDNjOWVkYmRj
NGU0OTI0MThmIgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YQog
Ci0tIAoyLjQ3LjEKCg==

--===============1267570976708912198==--

