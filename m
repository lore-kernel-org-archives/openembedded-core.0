Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E8F3CD8C99
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:46 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1569.1780328137833093025
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=HiU9l5qg;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=sOkDS3JM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019e83d391a8-03212448-fb0c-4e5d-b9ad-2acc4baca9bf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328141;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=a6C8OpzhUPgYpXnIFoAfEniYVMUMJ6vixtuQAOGcXc0=;
	b=HiU9l5qg9qNKuy42gTj3WB0yktkn6aIH9F1p5XboCgdR9Xpzdkeo3PuXXryGDP/5
	+WvNtR4vdd3vDP6V9wah6uF9bk8AdckBwPyutfAt8CY3Yb8jmE+66uBWVNMhhYDN4XG
	aAZlpjOsBzQXP/WROTO8rX/zWwLFzk+3nrQ6jwWY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328141;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=a6C8OpzhUPgYpXnIFoAfEniYVMUMJ6vixtuQAOGcXc0=;
	b=sOkDS3JMEKeuljO7rIEBMnoe3aoGbRe/+yg/KOZFt2jG9+U5LxklZw0aBOJBr4Ws
	qBig31kITy/JaklzbsGuIpA6l0YxSLYVpWVia84/Il+Unrlr539N3LGqbU4oYXm4E11
	t38UbkV81Gt6gbh7VWMufRR4zUrf++EYFL0V9KZo=
Content-Type: multipart/mixed; boundary="===============3025060092876590003=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-snowballstemmer: upgrading to 3.1.0 SUCCEEDED
Message-ID: <0101019e83d391a8-03212448-fb0c-4e5d-b9ad-2acc4baca9bf-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237892

--===============3025060092876590003==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-snowballstemmer* to *3.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-snowballstemmer-upgrade-3.0.1-3.1.0.patch
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
From b8eea3fd3cfb359c23a351cb92bb1a4d57d2c156 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 09:31:09 +0000
Subject: [PATCH] python3-snowballstemmer: upgrade 3.0.1 -> 3.1.0

---
 ....1.bb => python3-snowballstemmer_3.1.0.bb} | 26 +++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-snowballstemmer_3.0.1.bb => python3-snowballstemmer_3.1.0.bb} (21%)

diff --git a/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb b/meta/recipes-devtools/python/python3-snowballstemmer_3.1.0.bb
similarity index 21%
rename from meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb
rename to meta/recipes-devtools/python/python3-snowballstemmer_3.1.0.bb
index 37cfbce7dc..7eb862753f 100644
--- a/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb
+++ b/meta/recipes-devtools/python/python3-snowballstemmer_3.1.0.bb
@@ -1,10 +1,32 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYING
+# +++ COPYING
+# @@ -1,7 +1,7 @@
+#  Copyright (c) 2001, Dr Martin Porter
+#  Copyright (c) 2004,2005, Richard Boulton
+#  Copyright (c) 2013, Yoshiki Shibukawa
+# -Copyright (c) 2006,2007,2009,2010,2011,2014-2019, Olly Betts
+# +Copyright (c) 2006-2025, Olly Betts
+#  All rights reserved.
+#  
+#  Redistribution and use in source and binary forms, with or without
+# 
+#
+
 SUMMARY = "Snowball compiler and stemming algorithms"
 HOMEPAGE = "https://github.com/snowballstem/snowball"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=19139aaf3c8c8fa1ca6edd59c072fb9f"
+LIC_FILES_CHKSUM = "file://COPYING;md5=07c3b61d971c3df6e19ce439cfe1fb8c"
 
-SRC_URI[sha256sum] = "6d5eeeec8e9f84d4d56b847692bacf79bc2c8e90c7f80ca4444ff8b6f2e52895"
+SRC_URI[sha256sum] = "fd9e34526b23340cd23ffea6c9f9760974ecc2c2ac9e1d81401443ccdb2a801f"
 
 PYPI_PACKAGE = "snowballstemmer"
 
-- 
2.47.1


--===============3025060092876590003==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-snowballstemmer/python3-snowballstemmer: FILELIST: directory renamed /usr/lib/python3.14/site-packages/snowballstemmer-3.0.1.dist-info -> /usr/lib/python3.14/site-packages/snowballstemmer-3.1.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/snowballstemmer-3.0.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/snowballstemmer-3.1.0.dist-info/licenses, added "/usr/lib/python3.14/site-packages/snowballstemmer/__pycache__/polish_stemmer.cpython-314.pyc /usr/lib/python3.14/site-packages/snowballstemmer/polish_stemmer.py /usr/lib/python3.14/site-packages/snowballstemmer/__pycache__/czech_stemmer.cpython-314.pyc /usr/lib/python3.14/site-packages/snowballstemmer/sesotho_stemmer.py /usr/lib/python3.14/site-packages/snowballstemmer/__pycache__/persian_stemmer.cpython-314.pyc /usr/lib/python3.14/site-packages/snowballstemmer/__pycache__/sesotho_stemmer.cpython-314.pyc /usr/lib/python3.14/site-packages/snowballstemmer/czech_stemmer.py
  /usr/lib/python3.14/site-packages/snowballstemmer/persian_stemmer.py"
Changes to packages/x86-64-v3-poky-linux/python3-snowballstemmer (sysroot):
  /usr/lib/python3.14/site-packages/snowballstemmer-3.0.1.dist-info moved to /usr/lib/python3.14/site-packages/snowballstemmer-3.1.0.dist-info
  /usr/lib/python3.14/site-packages/snowballstemmer/czech_stemmer.py was added
  /usr/lib/python3.14/site-packages/snowballstemmer/persian_stemmer.py was added
  /usr/lib/python3.14/site-packages/snowballstemmer/polish_stemmer.py was added
  /usr/lib/python3.14/site-packages/snowballstemmer/__pycache__/czech_stemmer.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/snowballstemmer/__pycache__/persian_stemmer.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/snowballstemmer/__pycache__/polish_stemmer.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/snowballstemmer/__pycache__/sesotho_stemmer.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/snowballstemmer/sesotho_stemmer.py was added

--===============3025060092876590003==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-snowballstemmer-upgrade-3.0.1-3.1.0.patch"

RnJvbSBiOGVlYTNmZDNjZmIzNTljMjNhMzUxY2I5MmJiMWE0ZDU3ZDJjMTU2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAwOTozMTowOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc25vd2JhbGxzdGVtbWVyOiB1cGdyYWRlIDMuMC4xIC0+IDMuMS4wCgotLS0KIC4uLi4x
LmJiID0+IHB5dGhvbjMtc25vd2JhbGxzdGVtbWVyXzMuMS4wLmJifSB8IDI2ICsrKysrKysrKysr
KysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtc25vd2JhbGxz
dGVtbWVyXzMuMC4xLmJiID0+IHB5dGhvbjMtc25vd2JhbGxzdGVtbWVyXzMuMS4wLmJifSAoMjEl
KQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zbm93
YmFsbHN0ZW1tZXJfMy4wLjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtc25vd2JhbGxzdGVtbWVyXzMuMS4wLmJiCnNpbWlsYXJpdHkgaW5kZXggMjElCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zbm93YmFsbHN0ZW1tZXJf
My4wLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1z
bm93YmFsbHN0ZW1tZXJfMy4xLjAuYmIKaW5kZXggMzdjZmJjZTdkYy4uN2ViODYyNzUzZiAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNub3diYWxsc3Rl
bW1lcl8zLjAuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
c25vd2JhbGxzdGVtbWVyXzMuMS4wLmJiCkBAIC0xLDEwICsxLDMyIEBACisjIEZJWE1FOiB0aGUg
TElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBn
cmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xk
IGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2
YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1p
dCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5z
ZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgor
IworIyAtLS0gQ09QWUlORworIyArKysgQ09QWUlORworIyBAQCAtMSw3ICsxLDcgQEAKKyMgIENv
cHlyaWdodCAoYykgMjAwMSwgRHIgTWFydGluIFBvcnRlcgorIyAgQ29weXJpZ2h0IChjKSAyMDA0
LDIwMDUsIFJpY2hhcmQgQm91bHRvbgorIyAgQ29weXJpZ2h0IChjKSAyMDEzLCBZb3NoaWtpIFNo
aWJ1a2F3YQorIyAtQ29weXJpZ2h0IChjKSAyMDA2LDIwMDcsMjAwOSwyMDEwLDIwMTEsMjAxNC0y
MDE5LCBPbGx5IEJldHRzCisjICtDb3B5cmlnaHQgKGMpIDIwMDYtMjAyNSwgT2xseSBCZXR0cwor
IyAgQWxsIHJpZ2h0cyByZXNlcnZlZC4KKyMgIAorIyAgUmVkaXN0cmlidXRpb24gYW5kIHVzZSBp
biBzb3VyY2UgYW5kIGJpbmFyeSBmb3Jtcywgd2l0aCBvciB3aXRob3V0CisjIAorIworCiBTVU1N
QVJZID0gIlNub3diYWxsIGNvbXBpbGVyIGFuZCBzdGVtbWluZyBhbGdvcml0aG1zIgogSE9NRVBB
R0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL3Nub3diYWxsc3RlbS9zbm93YmFsbCIKIAogTElDRU5T
RSA9ICJCU0QtMy1DbGF1c2UiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21k
NT0xOTEzOWFhZjNjOGM4ZmExY2E2ZWRkNTljMDcyZmI5ZiIKK0xJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0NPUFlJTkc7bWQ1PTA3YzNiNjFkOTcxYzNkZjZlMTljZTQzOWNmZTFmYjhjIgogCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiNmQ1ZWVlZWM4ZTlmODRkNGQ1NmI4NDc2OTJiYWNmNzliYzJj
OGU5MGM3ZjgwY2E0NDQ0ZmY4YjZmMmU1Mjg5NSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJmZDll
MzQ1MjZiMjMzNDBjZDIzZmZlYTZjOWY5NzYwOTc0ZWNjMmMyYWM5ZTFkODE0MDE0NDNjY2RiMmE4
MDFmIgogCiBQWVBJX1BBQ0tBR0UgPSAic25vd2JhbGxzdGVtbWVyIgogCi0tIAoyLjQ3LjEKCg==

--===============3025060092876590003==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-snowballstemmer: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/snowballstemmer/snowballstemmer-3.0.1.tar.gz;downloadfilename=snowballstemmer-3.0.1.tar.gz" to "https://files.pythonhosted.org/packages/source/s/snowballstemmer/snowballstemmer-3.1.0.tar.gz;downloadfilename=snowballstemmer-3.1.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-snowballstemmer: PKGV changed from 3.0.1 [default] to 3.1.0 [default]
packages/x86-64-v3-poky-linux/python3-snowballstemmer: PV changed from "3.0.1" to "3.1.0"
packages/x86-64-v3-poky-linux/python3-snowballstemmer/python3-snowballstemmer-dbg: PKGV changed from 3.0.1 [default] to 3.1.0 [default]
packages/x86-64-v3-poky-linux/python3-snowballstemmer/python3-snowballstemmer-dbg: PV changed from "3.0.1" to "3.1.0"
packages/x86-64-v3-poky-linux/python3-snowballstemmer/python3-snowballstemmer-dev: PKGV changed from 3.0.1 [default] to 3.1.0 [default]
packages/x86-64-v3-poky-linux/python3-snowballstemmer/python3-snowballstemmer-dev: PV changed from "3.0.1" to "3.1.0"
packages/x86-64-v3-poky-linux/python3-snowballstemmer/python3-snowballstemmer-doc: PKGV changed from 3.0.1 [default] to 3.1.0 [default]
packages/x86-64-v3-poky-linux/python3-snowballstemmer/python3-snowballstemmer-doc: PV changed from "3.0.1" to "3.1.0"
packages/x86-64-v3-poky-linux/python3-snowballstemmer/python3-snowballstemmer-locale: PKGV changed from 3.0.1 [default] to 3.1.0 [default]
packages/x86-64-v3-poky-linux/python3-snowballstemmer/python3-snowballstemmer-locale: PV changed from "3.0.1" to "3.1.0"
packages/x86-64-v3-poky-linux/python3-snowballstemmer/python3-snowballstemmer-src: PKGV changed from 3.0.1 [default] to 3.1.0 [default]
packages/x86-64-v3-poky-linux/python3-snowballstemmer/python3-snowballstemmer-src: PV changed from "3.0.1" to "3.1.0"
packages/x86-64-v3-poky-linux/python3-snowballstemmer/python3-snowballstemmer-staticdev: PKGV changed from 3.0.1 [default] to 3.1.0 [default]
packages/x86-64-v3-poky-linux/python3-snowballstemmer/python3-snowballstemmer-staticdev: PV changed from "3.0.1" to "3.1.0"
packages/x86-64-v3-poky-linux/python3-snowballstemmer/python3-snowballstemmer: PKGSIZE changed from 1934424 to 1876693 (-3%)
packages/x86-64-v3-poky-linux/python3-snowballstemmer/python3-snowballstemmer: FILELIST: directory renamed /usr/lib/python3.14/site-packages/snowballstemmer-3.0.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/snowballstemmer-3.1.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/snowballstemmer-3.0.1.dist-info -> /usr/lib/python3.14/site-packages/snowballstemmer-3.1.0.dist-info, added "/usr/lib/python3.14/site-packages/snowballstemmer/__pycache__/persian_stemmer.cpython-314.pyc /usr/lib/python3.14/site-packages/snowballstemmer/__pycache__/czech_stemmer.cpython-314.pyc /usr/lib/python3.14/site-packages/snowballstemmer/sesotho_stemmer.py /usr/lib/python3.14/site-packages/snowballstemmer/__pycache__/polish_stemmer.cpython-314.pyc /usr/lib/python3.14/site-packages/snowballstemmer/czech_stemmer.py /usr/lib/python3.14/site-packages/snowballstemmer/__pycache__/sesotho_stemmer.cpython-314.pyc /usr/lib/python3.14/site-packages/snowballstemmer/polish_stemmer.py
  /usr/lib/python3.14/site-packages/snowballstemmer/persian_stemmer.py"
packages/x86-64-v3-poky-linux/python3-snowballstemmer/python3-snowballstemmer: PKGV changed from 3.0.1 [default] to 3.1.0 [default]
packages/x86-64-v3-poky-linux/python3-snowballstemmer/python3-snowballstemmer: PV changed from "3.0.1" to "3.1.0"
Changes to packages/x86-64-v3-poky-linux/python3-snowballstemmer (sysroot):
  /usr/lib/python3.14/site-packages/snowballstemmer-3.0.1.dist-info moved to /usr/lib/python3.14/site-packages/snowballstemmer-3.1.0.dist-info
  /usr/lib/python3.14/site-packages/snowballstemmer/czech_stemmer.py was added
  /usr/lib/python3.14/site-packages/snowballstemmer/persian_stemmer.py was added
  /usr/lib/python3.14/site-packages/snowballstemmer/polish_stemmer.py was added
  /usr/lib/python3.14/site-packages/snowballstemmer/__pycache__/czech_stemmer.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/snowballstemmer/__pycache__/persian_stemmer.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/snowballstemmer/__pycache__/polish_stemmer.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/snowballstemmer/__pycache__/sesotho_stemmer.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/snowballstemmer/sesotho_stemmer.py was added

--===============3025060092876590003==--

