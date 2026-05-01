Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 699A0CD379F
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:41 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15715.1777645540185683116
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=p9Dcm16i;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=UAk5U9iS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019de3ee5054-0d13abab-9673-476d-ab5e-adc09bfd0292-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645539;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4YCirOvQz1ifxkNTBCxuW+dNRls6N/pEjnjJzrTUuss=;
	b=p9Dcm16imvxhN1nnsOLYu/vHgnjIqLrCqZAcHxgmocixR5DUNuH06ic5lx6tKH7p
	cGAWuGXzMjSeiRH3slwAeQI7cSMQW/MZZReVUakfGTpj2KyfHZaWatyMChL92HtDhdd
	NYnkQGyXJqGrpQJY7aYqfiUHtqdI5iMLoC6Y4sGQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645539;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4YCirOvQz1ifxkNTBCxuW+dNRls6N/pEjnjJzrTUuss=;
	b=UAk5U9iSp7zD4SoNFi3rt6qbywm/RpVyq/zn9Q6+QHBc2oK/zrohp/ZTi6ZJ0xTN
	8PPRTKRbvSGGL5puJdtKX66KHsEkX/9WYIIXqNzEnZeuMzswcmfzA7e+oppCX3HD6F0
	YFJHdWmaEs9UajItVtY3g0wYjT0cleSr8rH1+7PE=
Content-Type: multipart/mixed; boundary="===============9054278387386972423=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-idna: upgrading to 3.13 SUCCEEDED
Message-ID: <0101019de3ee5054-0d13abab-9673-476d-ab5e-adc09bfd0292-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236235

--===============9054278387386972423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-idna* to *3.13* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-idna-upgrade-3.11-3.13.patch
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
From 73b14b8b7f466931cacc014dc16ba21ada9907c1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 08:20:13 +0000
Subject: [PATCH] python3-idna: upgrade 3.11 -> 3.13

---
 ...hon3-idna_3.11.bb => python3-idna_3.13.bb} | 25 +++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-idna_3.11.bb => python3-idna_3.13.bb} (29%)

diff --git a/meta/recipes-devtools/python/python3-idna_3.11.bb b/meta/recipes-devtools/python/python3-idna_3.13.bb
similarity index 29%
rename from meta/recipes-devtools/python/python3-idna_3.11.bb
rename to meta/recipes-devtools/python/python3-idna_3.13.bb
index de4595c1d4..eb0f0a1b3c 100644
--- a/meta/recipes-devtools/python/python3-idna_3.11.bb
+++ b/meta/recipes-devtools/python/python3-idna_3.13.bb
@@ -1,9 +1,30 @@
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
+# @@ -1,6 +1,6 @@
+#  BSD 3-Clause License
+#  
+# -Copyright (c) 2013-2025, Kim Davies and contributors.
+# +Copyright (c) 2013-2026, Kim Davies and contributors.
+#  All rights reserved.
+#  
+#  Redistribution and use in source and binary forms, with or without
+# 
+#
+
 SUMMARY = "Internationalised Domain Names in Applications"
 HOMEPAGE = "https://github.com/kjd/idna"
 LICENSE = "BSD-3-Clause & Python-2.0 & Unicode-TOU"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=18a4795c19833413a7e2f1cb3cd3b143"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=9a6c29079fc90c29d80332f44d2625f2"
 
-SRC_URI[sha256sum] = "795dafcc9c04ed0c1fb032c2aa73654d8e8c5023a7df64a53f39190ada629902"
+SRC_URI[sha256sum] = "585ea8fe5d69b9181ec1afba340451fba6ba764af97026f92a91d4eef164a242"
 
 inherit pypi python_flit_core ptest-python-pytest
 
-- 
2.47.1


--===============9054278387386972423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-idna/python3-idna: FILELIST: directory renamed /usr/lib/python3.14/site-packages/idna-3.11.dist-info -> /usr/lib/python3.14/site-packages/idna-3.13.dist-info, directory renamed /usr/lib/python3.14/site-packages/idna-3.11.dist-info/licenses -> /usr/lib/python3.14/site-packages/idna-3.13.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-idna/python3-idna: PKGSIZE changed from 796016 to 604339 (-24%)
Changes to packages/x86-64-v3-poky-linux/python3-idna (sysroot):
  /usr/lib/python3.14/site-packages/idna-3.11.dist-info moved to /usr/lib/python3.14/site-packages/idna-3.13.dist-info

--===============9054278387386972423==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-idna-upgrade-3.11-3.13.patch"

RnJvbSA3M2IxNGI4YjdmNDY2OTMxY2FjYzAxNGRjMTZiYTIxYWRhOTkwN2MxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAwODoyMDoxMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaWRuYTogdXBncmFkZSAzLjExIC0+IDMuMTMKCi0tLQogLi4uaG9uMy1pZG5hXzMuMTEu
YmIgPT4gcHl0aG9uMy1pZG5hXzMuMTMuYmJ9IHwgMjUgKysrKysrKysrKysrKysrKystLQogMSBm
aWxlIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1pZG5hXzMuMTEuYmIgPT4gcHl0aG9u
My1pZG5hXzMuMTMuYmJ9ICgyOSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWlkbmFfMy4xMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1pZG5hXzMuMTMuYmIKc2ltaWxhcml0eSBpbmRleCAyOSUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWlkbmFfMy4xMS5iYgpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWlkbmFfMy4xMy5iYgppbmRl
eCBkZTQ1OTVjMWQ0Li5lYjBmMGExYjNjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtaWRuYV8zLjExLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1pZG5hXzMuMTMuYmIKQEAgLTEsOSArMSwzMCBAQAorIyBGSVhNRTog
dGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29s
IHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhl
IG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VO
U0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBj
b21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xp
Y2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdl
czoKKyMKKyMgLS0tIExJQ0VOU0UubWQKKyMgKysrIExJQ0VOU0UubWQKKyMgQEAgLTEsNiArMSw2
IEBACisjICBCU0QgMy1DbGF1c2UgTGljZW5zZQorIyAgCisjIC1Db3B5cmlnaHQgKGMpIDIwMTMt
MjAyNSwgS2ltIERhdmllcyBhbmQgY29udHJpYnV0b3JzLgorIyArQ29weXJpZ2h0IChjKSAyMDEz
LTIwMjYsIEtpbSBEYXZpZXMgYW5kIGNvbnRyaWJ1dG9ycy4KKyMgIEFsbCByaWdodHMgcmVzZXJ2
ZWQuCisjICAKKyMgIFJlZGlzdHJpYnV0aW9uIGFuZCB1c2UgaW4gc291cmNlIGFuZCBiaW5hcnkg
Zm9ybXMsIHdpdGggb3Igd2l0aG91dAorIyAKKyMKKwogU1VNTUFSWSA9ICJJbnRlcm5hdGlvbmFs
aXNlZCBEb21haW4gTmFtZXMgaW4gQXBwbGljYXRpb25zIgogSE9NRVBBR0UgPSAiaHR0cHM6Ly9n
aXRodWIuY29tL2tqZC9pZG5hIgogTElDRU5TRSA9ICJCU0QtMy1DbGF1c2UgJiBQeXRob24tMi4w
ICYgVW5pY29kZS1UT1UiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLm1kO21k
NT0xOGE0Nzk1YzE5ODMzNDEzYTdlMmYxY2IzY2QzYjE0MyIKK0xJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0xJQ0VOU0UubWQ7bWQ1PTlhNmMyOTA3OWZjOTBjMjlkODAzMzJmNDRkMjYyNWYyIgog
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNzk1ZGFmY2M5YzA0ZWQwYzFmYjAzMmMyYWE3MzY1NGQ4
ZThjNTAyM2E3ZGY2NGE1M2YzOTE5MGFkYTYyOTkwMiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI1
ODVlYThmZTVkNjliOTE4MWVjMWFmYmEzNDA0NTFmYmE2YmE3NjRhZjk3MDI2ZjkyYTkxZDRlZWYx
NjRhMjQyIgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX2ZsaXRfY29yZSBwdGVzdC1weXRob24tcHl0
ZXN0CiAKLS0gCjIuNDcuMQoK

--===============9054278387386972423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-idna: PKGV changed from 3.11 [default] to 3.13 [default]
packages/x86-64-v3-poky-linux/python3-idna: PV changed from "3.11" to "3.13"
packages/x86-64-v3-poky-linux/python3-idna: SRC_URI changed from "https://files.pythonhosted.org/packages/source/i/idna/idna-3.11.tar.gz;downloadfilename=idna-3.11.tar.gz" to "https://files.pythonhosted.org/packages/source/i/idna/idna-3.13.tar.gz;downloadfilename=idna-3.13.tar.gz"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-dbg: PKGV changed from 3.11 [default] to 3.13 [default]
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-dbg: PV changed from "3.11" to "3.13"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-dev: PKGV changed from 3.11 [default] to 3.13 [default]
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-dev: PV changed from "3.11" to "3.13"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-doc: PKGV changed from 3.11 [default] to 3.13 [default]
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-doc: PV changed from "3.11" to "3.13"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-locale: PKGV changed from 3.11 [default] to 3.13 [default]
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-locale: PV changed from "3.11" to "3.13"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-ptest: PKGV changed from 3.11 [default] to 3.13 [default]
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-ptest: PV changed from "3.11" to "3.13"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-ptest: PKGSIZE changed from 1483590 to 1483107 (-0%)
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-src: PKGV changed from 3.11 [default] to 3.13 [default]
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-src: PV changed from "3.11" to "3.13"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-staticdev: PKGV changed from 3.11 [default] to 3.13 [default]
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-staticdev: PV changed from "3.11" to "3.13"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna: PKGV changed from 3.11 [default] to 3.13 [default]
packages/x86-64-v3-poky-linux/python3-idna/python3-idna: FILELIST: directory renamed /usr/lib/python3.14/site-packages/idna-3.11.dist-info -> /usr/lib/python3.14/site-packages/idna-3.13.dist-info, directory renamed /usr/lib/python3.14/site-packages/idna-3.11.dist-info/licenses -> /usr/lib/python3.14/site-packages/idna-3.13.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-idna/python3-idna: PV changed from "3.11" to "3.13"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna: PKGSIZE changed from 796016 to 604339 (-24%)
Changes to packages/x86-64-v3-poky-linux/python3-idna (sysroot):
  /usr/lib/python3.14/site-packages/idna-3.11.dist-info moved to /usr/lib/python3.14/site-packages/idna-3.13.dist-info

--===============9054278387386972423==--

