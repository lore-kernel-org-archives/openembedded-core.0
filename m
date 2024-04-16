Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12D1CC2B9FB
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:11 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.13437.1713248038976970413
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:13:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=EBhmy2uf;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=tFNZ8Isd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018ee58a6e2a-6ed38ad2-ed70-4349-a551-174e76756225-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248038;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LG+s6PAhK4g/AjaNltq7A5ql4kgyOzjXYyvAm+RVLeY=;
	b=EBhmy2ufiADpxp2vMs3IhSurgZnZVZ7+nInEK46lZsYyF9IF6WMKOCtL0RjMhD2E
	PEo+QtV+QQwgAmfnWKqrCn2NaZ090Omq0Cd3GonqkOow78fcM1HbJ/UEQLndPuPPpAa
	BfSEJmOKDN5JsjUCSzRr/AWGFk+9X/zJhOhry7Qw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248038;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LG+s6PAhK4g/AjaNltq7A5ql4kgyOzjXYyvAm+RVLeY=;
	b=tFNZ8IsdFKbJa4U+tmFPxlKxcj3j0Qui6tCrYcDLoTDS77HnU7vwreiw1p5e3Tqh
	Wr/PiXjjoCx3CyCyuQMbBvgKjPLUuwQ5q0OzRCX/EOc2N7E5XjPgF1xMrON+rArbOHf
	+pz2zjnhibnlix7i/8pVd6w5yxSWZd8zf4rRMulI=
Content-Type: multipart/mixed; boundary="===============3386515827502541378=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-idna: upgrading to 3.7 SUCCEEDED
Message-ID: <0101018ee58a6e2a-6ed38ad2-ed70-4349-a551-174e76756225-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:13:58 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198281

--===============3386515827502541378==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-idna* to *3.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-idna-upgrade-3.6-3.7.patch
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
From f124adb4752489fd6f10bd1d5148f8a2331d026e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Apr 2024 19:10:54 +0000
Subject: [PATCH] python3-idna: upgrade 3.6 -> 3.7

---
 ...ython3-idna_3.6.bb => python3-idna_3.7.bb} | 25 +++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-idna_3.6.bb => python3-idna_3.7.bb} (25%)

diff --git a/meta/recipes-devtools/python/python3-idna_3.6.bb b/meta/recipes-devtools/python/python3-idna_3.7.bb
similarity index 25%
rename from meta/recipes-devtools/python/python3-idna_3.6.bb
rename to meta/recipes-devtools/python/python3-idna_3.7.bb
index 47c080cdf8..f6c161f24a 100644
--- a/meta/recipes-devtools/python/python3-idna_3.6.bb
+++ b/meta/recipes-devtools/python/python3-idna_3.7.bb
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
+# -Copyright (c) 2013-2023, Kim Davies and contributors.
+# +Copyright (c) 2013-2024, Kim Davies and contributors.
+#  All rights reserved.
+#  
+#  Redistribution and use in source and binary forms, with or without
+# 
+#
+
 SUMMARY = "Internationalised Domain Names in Applications"
 HOMEPAGE = "https://github.com/kjd/idna"
 LICENSE = "BSD-3-Clause & Python-2.0 & Unicode-TOU"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=dbec47b98e1469f6a104c82ff9698cee"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=204c0612e40a4dd46012a78d02c80fb1"
 
-SRC_URI[sha256sum] = "9ecdbbd083b06798ae1e86adcbfe8ab1479cf864e4ee30fe4e46a003d12491ca"
+SRC_URI[sha256sum] = "028ff3aadf0609c1fd278d8ea3089299412a7a8b9bd005dd08b9f8285bcb5cfc"
 
 inherit pypi python_flit_core
 
-- 
2.42.0


--===============3386515827502541378==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-idna-upgrade-3.6-3.7.patch"

RnJvbSBmMTI0YWRiNDc1MjQ4OWZkNmYxMGJkMWQ1MTQ4ZjhhMjMzMWQwMjZlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXByIDIwMjQgMTk6MTA6NTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWlkbmE6IHVwZ3JhZGUgMy42IC0+IDMuNwoKLS0tCiAuLi55dGhvbjMtaWRuYV8zLjYu
YmIgPT4gcHl0aG9uMy1pZG5hXzMuNy5iYn0gfCAyNSArKysrKysrKysrKysrKysrKy0tCiAxIGZp
bGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWlkbmFfMy42LmJiID0+IHB5dGhvbjMt
aWRuYV8zLjcuYmJ9ICgyNSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWlkbmFfMy42LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWlkbmFfMy43LmJiCnNpbWlsYXJpdHkgaW5kZXggMjUlCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1pZG5hXzMuNi5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWlkbmFfMy43LmJiCmluZGV4IDQ3YzA4
MGNkZjguLmY2YzE2MWYyNGEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1pZG5hXzMuNi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtaWRuYV8zLjcuYmIKQEAgLTEsOSArMSwzMCBAQAorIyBGSVhNRTogdGhlIExJQ19G
SUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUn
LgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQg
dGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUg
aWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVz
c2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBk
YXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMg
LS0tIExJQ0VOU0UubWQKKyMgKysrIExJQ0VOU0UubWQKKyMgQEAgLTEsNiArMSw2IEBACisjICBC
U0QgMy1DbGF1c2UgTGljZW5zZQorIyAgCisjIC1Db3B5cmlnaHQgKGMpIDIwMTMtMjAyMywgS2lt
IERhdmllcyBhbmQgY29udHJpYnV0b3JzLgorIyArQ29weXJpZ2h0IChjKSAyMDEzLTIwMjQsIEtp
bSBEYXZpZXMgYW5kIGNvbnRyaWJ1dG9ycy4KKyMgIEFsbCByaWdodHMgcmVzZXJ2ZWQuCisjICAK
KyMgIFJlZGlzdHJpYnV0aW9uIGFuZCB1c2UgaW4gc291cmNlIGFuZCBiaW5hcnkgZm9ybXMsIHdp
dGggb3Igd2l0aG91dAorIyAKKyMKKwogU1VNTUFSWSA9ICJJbnRlcm5hdGlvbmFsaXNlZCBEb21h
aW4gTmFtZXMgaW4gQXBwbGljYXRpb25zIgogSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29t
L2tqZC9pZG5hIgogTElDRU5TRSA9ICJCU0QtMy1DbGF1c2UgJiBQeXRob24tMi4wICYgVW5pY29k
ZS1UT1UiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLm1kO21kNT1kYmVjNDdi
OThlMTQ2OWY2YTEwNGM4MmZmOTY5OGNlZSIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJ
Q0VOU0UubWQ7bWQ1PTIwNGMwNjEyZTQwYTRkZDQ2MDEyYTc4ZDAyYzgwZmIxIgogCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiOWVjZGJiZDA4M2IwNjc5OGFlMWU4NmFkY2JmZThhYjE0NzljZjg2NGU0
ZWUzMGZlNGU0NmEwMDNkMTI0OTFjYSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIwMjhmZjNhYWRm
MDYwOWMxZmQyNzhkOGVhMzA4OTI5OTQxMmE3YThiOWJkMDA1ZGQwOGI5ZjgyODViY2I1Y2ZjIgog
CiBpbmhlcml0IHB5cGkgcHl0aG9uX2ZsaXRfY29yZQogCi0tIAoyLjQyLjAKCg==

--===============3386515827502541378==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-idna/python3-idna: PKGSIZE changed from 505386 to 599871 (+19%)
Changes to packages/core2-64-poky-linux/python3-idna (sysroot):
  /usr/lib/python3.12/site-packages/idna-3.6.dist-info moved to /usr/lib/python3.12/site-packages/idna-3.7.dist-info

--===============3386515827502541378==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-idna: SRC_URI changed from "https://files.pythonhosted.org/packages/source/i/idna/idna-3.6.tar.gz;downloadfilename=idna-3.6.tar.gz" to "https://files.pythonhosted.org/packages/source/i/idna/idna-3.7.tar.gz;downloadfilename=idna-3.7.tar.gz"
packages/core2-64-poky-linux/python3-idna: PKGV changed from 3.6 [default] to 3.7 [default]
packages/core2-64-poky-linux/python3-idna: PV changed from "3.6" to "3.7"
packages/core2-64-poky-linux/python3-idna/python3-idna-dbg: PKGV changed from 3.6 [default] to 3.7 [default]
packages/core2-64-poky-linux/python3-idna/python3-idna-dbg: PV changed from "3.6" to "3.7"
packages/core2-64-poky-linux/python3-idna/python3-idna-dev: PKGV changed from 3.6 [default] to 3.7 [default]
packages/core2-64-poky-linux/python3-idna/python3-idna-dev: PV changed from "3.6" to "3.7"
packages/core2-64-poky-linux/python3-idna/python3-idna-doc: PKGV changed from 3.6 [default] to 3.7 [default]
packages/core2-64-poky-linux/python3-idna/python3-idna-doc: PV changed from "3.6" to "3.7"
packages/core2-64-poky-linux/python3-idna/python3-idna-locale: PKGV changed from 3.6 [default] to 3.7 [default]
packages/core2-64-poky-linux/python3-idna/python3-idna-locale: PV changed from "3.6" to "3.7"
packages/core2-64-poky-linux/python3-idna/python3-idna-src: PKGV changed from 3.6 [default] to 3.7 [default]
packages/core2-64-poky-linux/python3-idna/python3-idna-src: PV changed from "3.6" to "3.7"
packages/core2-64-poky-linux/python3-idna/python3-idna-staticdev: PKGV changed from 3.6 [default] to 3.7 [default]
packages/core2-64-poky-linux/python3-idna/python3-idna-staticdev: PV changed from "3.6" to "3.7"
packages/core2-64-poky-linux/python3-idna/python3-idna: PKGV changed from 3.6 [default] to 3.7 [default]
packages/core2-64-poky-linux/python3-idna/python3-idna: PKGSIZE changed from 505386 to 599871 (+19%)
packages/core2-64-poky-linux/python3-idna/python3-idna: PV changed from "3.6" to "3.7"
Changes to packages/core2-64-poky-linux/python3-idna (sysroot):
  /usr/lib/python3.12/site-packages/idna-3.6.dist-info moved to /usr/lib/python3.12/site-packages/idna-3.7.dist-info

--===============3386515827502541378==--

