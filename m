Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2198BC531FF
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 05:43:13 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13550.1784871785089686837
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 22:43:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZaVcLu3A;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=fvktvqBJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019f92a60ec8-adc0b7d2-5ca4-4fa6-99d0-df465c181fe5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1784871784;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VKS2/YXXvHez/Vs4z+6SDj0Fuk1FYsqjqOL8fcA/o2Q=;
	b=ZaVcLu3AYg4etEMnX02QuVTxd97e+5RPEKeV9ZZEhCPjE4Bq5EvINU8B06IsYZ62
	1XsRh/A7zw3GYIbrgrghx5xGuPCG3C9dIFITn/r1gfEhLXe0CPuY+wyaaj68D02Mjaq
	ZQaw/9S0Ay5aoXkRFLHvOt31qNz2B6GbNyeR7e4s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1784871784;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VKS2/YXXvHez/Vs4z+6SDj0Fuk1FYsqjqOL8fcA/o2Q=;
	b=fvktvqBJSoo7yNNIwPzBNq5ej7oJsqc9m+d8fw8E78i/sAwQOrn8bgkgr4oi+y4t
	wIX50k17nXF6v8U0+2T/EtJHSwW9vgzsdnP8Jx7B9v7VbFQShfMoX//UHW/WaHoWkPh
	fwQSetxD+AA62zLeIfx6fU1zQ91KVPaE51fN+xsw=
Content-Type: multipart/mixed; boundary="===============0009528770732281465=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Marta Rybczynska <marta.rybczynska@ygreky.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-uritools: upgrading to 6.1.3 SUCCEEDED
Message-ID: <0101019f92a60ec8-adc0b7d2-5ca4-4fa6-99d0-df465c181fe5-000000@us-west-2.amazonses.com>
Date: Fri, 24 Jul 2026 05:43:04 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.24-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 05:43:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241892

--===============0009528770732281465==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-uritools* to *6.1.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-uritools-upgrade-6.1.2-6.1.3.patch
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
From b2e529c34211b484bbb03920ed905920235d79bc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 24 Jul 2026 05:27:22 +0000
Subject: [PATCH] python3-uritools: upgrade 6.1.2 -> 6.1.3

Source: CHANGELOG.rst

v6.1.3 (2026-07-24)
===================

- Minor style improvements to keep ``ruff`` happy.

- Update build environment.
---
 .../{python3-uritools_6.1.2.bb => python3-uritools_6.1.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-uritools_6.1.2.bb => python3-uritools_6.1.3.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-uritools_6.1.2.bb b/meta/recipes-devtools/python/python3-uritools_6.1.3.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-uritools_6.1.2.bb
rename to meta/recipes-devtools/python/python3-uritools_6.1.3.bb
index 3112b98c19..47fddec046 100644
--- a/meta/recipes-devtools/python/python3-uritools_6.1.2.bb
+++ b/meta/recipes-devtools/python/python3-uritools_6.1.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/tkem/uritools/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=079933dfba36eb60b5e3512ca0ab61ae"
 
-SRC_URI[sha256sum] = "fa60028843a8be651699a1ee2b399066eeaef349224b32a177efa4aeba463f00"
+SRC_URI[sha256sum] = "3a498e7e85ef3249343d5710618d641a414da0fbae6d23053ada7976ee83ea5f"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.47.1


--===============0009528770732281465==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-uritools: PV changed from "6.1.2" to "6.1.3"
packages/x86-64-v3-poky-linux/python3-uritools: PKGV changed from 6.1.2 [default] to 6.1.3 [default]
packages/x86-64-v3-poky-linux/python3-uritools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/uritools/uritools-6.1.2.tar.gz;downloadfilename=uritools-6.1.2.tar.gz" to "https://files.pythonhosted.org/packages/source/u/uritools/uritools-6.1.3.tar.gz;downloadfilename=uritools-6.1.3.tar.gz"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-dbg: PV changed from "6.1.2" to "6.1.3"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-dbg: PKGV changed from 6.1.2 [default] to 6.1.3 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-dev: PV changed from "6.1.2" to "6.1.3"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-dev: PKGV changed from 6.1.2 [default] to 6.1.3 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-doc: PV changed from "6.1.2" to "6.1.3"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-doc: PKGV changed from 6.1.2 [default] to 6.1.3 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-locale: PV changed from "6.1.2" to "6.1.3"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-locale: PKGV changed from 6.1.2 [default] to 6.1.3 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-ptest: PV changed from "6.1.2" to "6.1.3"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-ptest: PKGV changed from 6.1.2 [default] to 6.1.3 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-ptest: PKGSIZE changed from 50081 to 50062 (-0%)
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-src: PV changed from "6.1.2" to "6.1.3"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-src: PKGV changed from 6.1.2 [default] to 6.1.3 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-staticdev: PV changed from "6.1.2" to "6.1.3"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-staticdev: PKGV changed from 6.1.2 [default] to 6.1.3 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools: PV changed from "6.1.2" to "6.1.3"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uritools-6.1.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/uritools-6.1.3.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/uritools-6.1.2.dist-info -> /usr/lib/python3.14/site-packages/uritools-6.1.3.dist-info
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools: PKGV changed from 6.1.2 [default] to 6.1.3 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools: PKGSIZE changed from 73227 to 73198 (-0%)
Changes to packages/x86-64-v3-poky-linux/python3-uritools (sysroot):
  /usr/lib/python3.14/site-packages/uritools-6.1.2.dist-info moved to /usr/lib/python3.14/site-packages/uritools-6.1.3.dist-info

--===============0009528770732281465==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uritools-6.1.2.dist-info -> /usr/lib/python3.14/site-packages/uritools-6.1.3.dist-info, directory renamed /usr/lib/python3.14/site-packages/uritools-6.1.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/uritools-6.1.3.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-uritools (sysroot):
  /usr/lib/python3.14/site-packages/uritools-6.1.2.dist-info moved to /usr/lib/python3.14/site-packages/uritools-6.1.3.dist-info

--===============0009528770732281465==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-uritools-upgrade-6.1.2-6.1.3.patch"

RnJvbSBiMmU1MjljMzQyMTFiNDg0YmJiMDM5MjBlZDkwNTkyMDIzNWQ3OWJjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMjQgSnVsIDIwMjYgMDU6Mjc6MjIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXVyaXRvb2xzOiB1cGdyYWRlIDYuMS4yIC0+IDYuMS4zCgpTb3VyY2U6IENIQU5HRUxP
Ry5yc3QKCnY2LjEuMyAoMjAyNi0wNy0yNCkKPT09PT09PT09PT09PT09PT09PQoKLSBNaW5vciBz
dHlsZSBpbXByb3ZlbWVudHMgdG8ga2VlcCBgYHJ1ZmZgYCBoYXBweS4KCi0gVXBkYXRlIGJ1aWxk
IGVudmlyb25tZW50LgotLS0KIC4uLi97cHl0aG9uMy11cml0b29sc182LjEuMi5iYiA9PiBweXRo
b24zLXVyaXRvb2xzXzYuMS4zLmJifSAgICB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24ve3B5dGhvbjMtdXJpdG9vbHNfNi4xLjIuYmIgPT4gcHl0aG9uMy11cml0b29sc182LjEuMy5i
Yn0gKDc5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtdXJpdG9vbHNfNi4xLjIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtdXJpdG9vbHNfNi4xLjMuYmIKc2ltaWxhcml0eSBpbmRleCA3OSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXVyaXRvb2xzXzYuMS4yLmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXJpdG9vbHNfNi4xLjMu
YmIKaW5kZXggMzExMmI5OGMxOS4uNDdmZGRlYzA0NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXVyaXRvb2xzXzYuMS4yLmJiCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11cml0b29sc182LjEuMy5iYgpAQCAtNCw3ICs0
LDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL3RrZW0vdXJpdG9vbHMvIgogTElD
RU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0wNzk5
MzNkZmJhMzZlYjYwYjVlMzUxMmNhMGFiNjFhZSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImZh
NjAwMjg4NDNhOGJlNjUxNjk5YTFlZTJiMzk5MDY2ZWVhZWYzNDkyMjRiMzJhMTc3ZWZhNGFlYmE0
NjNmMDAiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiM2E0OThlN2U4NWVmMzI0OTM0M2Q1NzEwNjE4
ZDY0MWE0MTRkYTBmYmFlNmQyMzA1M2FkYTc5NzZlZTgzZWE1ZiIKIAogaW5oZXJpdCBweXBpIHB5
dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEgcHRlc3QtcHl0aG9uLXB5dGVzdAogCi0tIAoyLjQ3
LjEKCg==

--===============0009528770732281465==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-uritools-changelog.txt"

Changelog for python3-uritools: 6.1.2 -> 6.1.3
Source: CHANGELOG.rst

v6.1.3 (2026-07-24)
===================

- Minor style improvements to keep ``ruff`` happy.

- Update build environment.

--===============0009528770732281465==--

