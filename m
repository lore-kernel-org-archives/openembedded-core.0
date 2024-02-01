Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68A48C54E68
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:19 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.2107.1706810406131215031
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=W/1zrnwI;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=fybtEwiq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018d65d3f1ba-6776efd9-17e2-487b-a42c-57c98e01fadc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810405;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4FvyUhBAksnyYaSn+HZiVUh7GauF6ZD+rocMfdBVhTo=;
	b=W/1zrnwIVeGGepsVvetVABrGaEm9kfcU7TmUAl082YJBcjku2Mu767HHzrUVgE5N
	DKhKPzB2Wh1jbshMg9oaR8/4GiONRYbgi7Qvt53RvVORiVQVvOW526VKdSLzTYGs9bt
	N00K80q7X7OfmRWBQWPjM9qzlZkAiGPheMCk/aQk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810405;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4FvyUhBAksnyYaSn+HZiVUh7GauF6ZD+rocMfdBVhTo=;
	b=fybtEwiqH0+JEXmFPCGcdlZ2WN98TYdw+zTcClH5vahMBy7nvT8gVpNeHGjTjODY
	PM94g70Ix8sBk4b8P7c68BBmnPpxiGBzsBNw6gjKyAZ3WavocWvedRw8Hgpr9+XXBqq
	j48JTdrwHI3VXsVL+5zVdC/UDt2c6bVYAQ2zBDJA=
Content-Type: multipart/mixed; boundary="===============2533502070515950015=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-mako: upgrading to 1.3.2 SUCCEEDED
Message-ID: <0101018d65d3f1ba-6776efd9-17e2-487b-a42c-57c98e01fadc-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:05 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194637

--===============2533502070515950015==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-mako* to *1.3.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-mako-upgrade-1.3.0-1.3.2.patch
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
From 27b7a9210d74d91daf4adb3af344e48b9839a34f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Feb 2024 07:53:43 +0000
Subject: [PATCH] python3-mako: upgrade 1.3.0 -> 1.3.2

---
 ...n3-mako_1.3.0.bb => python3-mako_1.3.2.bb} | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-mako_1.3.0.bb => python3-mako_1.3.2.bb} (33%)

diff --git a/meta/recipes-devtools/python/python3-mako_1.3.0.bb b/meta/recipes-devtools/python/python3-mako_1.3.2.bb
similarity index 33%
rename from meta/recipes-devtools/python/python3-mako_1.3.0.bb
rename to meta/recipes-devtools/python/python3-mako_1.3.2.bb
index d180e05cea..13fe7c80cf 100644
--- a/meta/recipes-devtools/python/python3-mako_1.3.0.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.3.2.bb
@@ -1,14 +1,33 @@
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
+# @@ -1,4 +1,4 @@
+# -Copyright 2006-2023 the Mako authors and contributors <see AUTHORS file>.
+# +Copyright 2006-2024 the Mako authors and contributors <see AUTHORS file>.
+#  
+#  Permission is hereby granted, free of charge, to any person obtaining a copy of
+#  this software and associated documentation files (the "Software"), to deal in
+# 
+#
+
 SUMMARY = "Templating library for Python"
 HOMEPAGE = "http://www.makotemplates.org/"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=fcc01df649aee6c59dcb254c894ea0d4"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d0995d6f7ba3f186a03118f244e88f57"
 
 PYPI_PACKAGE = "Mako"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "e3a9d388fd00e87043edbe8792f45880ac0114e9c4adc69f6e9bfb2c55e3b11b"
+SRC_URI[sha256sum] = "2a0c8ad7f6274271b3bb7467dd37cf9cc6dab4bc19cb69a4ef10669402de698e"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-html \
                   ${PYTHON_PN}-markupsafe \
-- 
2.42.0


--===============2533502070515950015==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-mako (sysroot):
  /usr/lib/python3.12/site-packages/Mako-1.3.0.dist-info moved to /usr/lib/python3.12/site-packages/Mako-1.3.2.dist-info

--===============2533502070515950015==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-mako-upgrade-1.3.0-1.3.2.patch"

RnJvbSAyN2I3YTkyMTBkNzRkOTFkYWY0YWRiM2FmMzQ0ZTQ4Yjk4MzlhMzRmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBGZWIgMjAyNCAwNzo1Mzo0MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbWFrbzogdXBncmFkZSAxLjMuMCAtPiAxLjMuMgoKLS0tCiAuLi5uMy1tYWtvXzEuMy4w
LmJiID0+IHB5dGhvbjMtbWFrb18xLjMuMi5iYn0gfCAyMyArKysrKysrKysrKysrKysrKy0tCiAx
IGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLW1ha29fMS4zLjAuYmIgPT4gcHl0
aG9uMy1tYWtvXzEuMy4yLmJifSAoMzMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1tYWtvXzEuMy4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLW1ha29fMS4zLjIuYmIKc2ltaWxhcml0eSBpbmRleCAzMyUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1ha29fMS4zLjAuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYWtvXzEuMy4y
LmJiCmluZGV4IGQxODBlMDVjZWEuLjEzZmU3YzgwY2YgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYWtvXzEuMy4wLmJiCisrKyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYWtvXzEuMy4yLmJiCkBAIC0xLDE0ICsxLDMzIEBA
CisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQg
YnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2Ug
YmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0
ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMg
aW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChl
eGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisj
IFRoZSBjaGFuZ2VzOgorIworIyAtLS0gTElDRU5TRQorIyArKysgTElDRU5TRQorIyBAQCAtMSw0
ICsxLDQgQEAKKyMgLUNvcHlyaWdodCAyMDA2LTIwMjMgdGhlIE1ha28gYXV0aG9ycyBhbmQgY29u
dHJpYnV0b3JzIDxzZWUgQVVUSE9SUyBmaWxlPi4KKyMgK0NvcHlyaWdodCAyMDA2LTIwMjQgdGhl
IE1ha28gYXV0aG9ycyBhbmQgY29udHJpYnV0b3JzIDxzZWUgQVVUSE9SUyBmaWxlPi4KKyMgIAor
IyAgUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBw
ZXJzb24gb2J0YWluaW5nIGEgY29weSBvZgorIyAgdGhpcyBzb2Z0d2FyZSBhbmQgYXNzb2NpYXRl
ZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUgIlNvZnR3YXJlIiksIHRvIGRlYWwgaW4KKyMgCisj
CisKIFNVTU1BUlkgPSAiVGVtcGxhdGluZyBsaWJyYXJ5IGZvciBQeXRob24iCiBIT01FUEFHRSA9
ICJodHRwOi8vd3d3Lm1ha290ZW1wbGF0ZXMub3JnLyIKIFNFQ1RJT04gPSAiZGV2ZWwvcHl0aG9u
IgogTElDRU5TRSA9ICJNSVQiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21k
NT1mY2MwMWRmNjQ5YWVlNmM1OWRjYjI1NGM4OTRlYTBkNCIKK0xJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0xJQ0VOU0U7bWQ1PWQwOTk1ZDZmN2JhM2YxODZhMDMxMThmMjQ0ZTg4ZjU3IgogCiBQ
WVBJX1BBQ0tBR0UgPSAiTWFrbyIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1cHRvb2xzX2J1
aWxkX21ldGEKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImUzYTlkMzg4ZmQwMGU4NzA0M2VkYmU4
NzkyZjQ1ODgwYWMwMTE0ZTljNGFkYzY5ZjZlOWJmYjJjNTVlM2IxMWIiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiMmEwYzhhZDdmNjI3NDI3MWIzYmI3NDY3ZGQzN2NmOWNjNmRhYjRiYzE5Y2I2OWE0
ZWYxMDY2OTQwMmRlNjk4ZSIKIAogUkRFUEVORFM6JHtQTn0gPSAiJHtQWVRIT05fUE59LWh0bWwg
XAogICAgICAgICAgICAgICAgICAgJHtQWVRIT05fUE59LW1hcmt1cHNhZmUgXAotLSAKMi40Mi4w
Cgo=

--===============2533502070515950015==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-mako: PV changed from "1.3.0" to "1.3.2"
packages/core2-64-poky-linux/python3-mako: PKGV changed from 1.3.0 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/python3-mako: SRC_URI changed from "https://files.pythonhosted.org/packages/source/M/Mako/Mako-1.3.0.tar.gz;downloadfilename=Mako-1.3.0.tar.gz" to "https://files.pythonhosted.org/packages/source/M/Mako/Mako-1.3.2.tar.gz;downloadfilename=Mako-1.3.2.tar.gz"
packages/core2-64-poky-linux/python3-mako/python3-mako-dbg: PV changed from "1.3.0" to "1.3.2"
packages/core2-64-poky-linux/python3-mako/python3-mako-dbg: PKGV changed from 1.3.0 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/python3-mako/python3-mako-dev: PV changed from "1.3.0" to "1.3.2"
packages/core2-64-poky-linux/python3-mako/python3-mako-dev: PKGV changed from 1.3.0 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/python3-mako/python3-mako-doc: PV changed from "1.3.0" to "1.3.2"
packages/core2-64-poky-linux/python3-mako/python3-mako-doc: PKGV changed from 1.3.0 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/python3-mako/python3-mako-locale: PV changed from "1.3.0" to "1.3.2"
packages/core2-64-poky-linux/python3-mako/python3-mako-locale: PKGV changed from 1.3.0 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/python3-mako/python3-mako-src: PV changed from "1.3.0" to "1.3.2"
packages/core2-64-poky-linux/python3-mako/python3-mako-src: PKGV changed from 1.3.0 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/python3-mako/python3-mako-staticdev: PV changed from "1.3.0" to "1.3.2"
packages/core2-64-poky-linux/python3-mako/python3-mako-staticdev: PKGV changed from 1.3.0 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/python3-mako/python3-mako: PKGSIZE changed from 634809 to 636089 (+0%)
packages/core2-64-poky-linux/python3-mako/python3-mako: PV changed from "1.3.0" to "1.3.2"
packages/core2-64-poky-linux/python3-mako/python3-mako: PKGV changed from 1.3.0 [default] to 1.3.2 [default]
Changes to packages/core2-64-poky-linux/python3-mako (sysroot):
  /usr/lib/python3.12/site-packages/Mako-1.3.0.dist-info moved to /usr/lib/python3.12/site-packages/Mako-1.3.2.dist-info

--===============2533502070515950015==--

