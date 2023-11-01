Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D73EC10DC3
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:14 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.8664.1698848705130060815
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=FH4NtdEQ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=P4+n8b+Z;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.193, mailfrom: 0101018b8b4607ab-82fe09a0-7f69-4d97-a179-23103a9c65a0-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848704;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=96ZgneMRqt276eP+8IdmCufaBo+LDr2to1iPdBBCe1k=;
	b=FH4NtdEQmzxtQpiZxmF7ct5/rrliCyFPUcUcA+gGILR+ERvE/aCwaWqTPuGn0R4Y
	wVgXJ9i7/j7zysGqQiPxHpTN2lYXy2JdaKn9sf4xkj60YQh11E1ij+lmcClZrG7UJlA
	etYu58FpEJtGj4xyqizYDfDp4Ovg0N9rjM4QAjrg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848704;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=96ZgneMRqt276eP+8IdmCufaBo+LDr2to1iPdBBCe1k=;
	b=P4+n8b+ZCz6lKc7hnL/sira53gEP/eMadoGOb9wxpsCHFU94S2Mej4Ih5zGQI2hG
	+69Uv0fpzFc1JRjfkNpDq7ecWFsbNaNEnewxi4+ZU4ejm8Itpl2GRqUqQo21axnvi46
	Sjsxuzc5FVcBV/lBAyxYnh+KXbVhbkqNmx539k6s=
Content-Type: multipart/mixed; boundary="===============2432961526217491828=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-trove-classifiers: upgrading to 2023.10.18 SUCCEEDED
Message-ID: <0101018b8b4607ab-82fe09a0-7f69-4d97-a179-23103a9c65a0-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:04 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189981

--===============2432961526217491828==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-trove-classifiers* to *2023.10.18* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-trove-classifiers-upgrade-2023.9.19-2023.10..patch
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
From 5b2b51a1a23982351ada4856554e0edb492a4c9f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 09:39:13 +0000
Subject: [PATCH] python3-trove-classifiers: upgrade 2023.9.19 -> 2023.10.18

---
 ...ers_2023.9.19.bb => python3-trove-classifiers_2023.10.18.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2023.9.19.bb => python3-trove-classifiers_2023.10.18.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2023.9.19.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2023.10.18.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2023.9.19.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2023.10.18.bb
index aa062f659b..b0c1b84cc5 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2023.9.19.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2023.10.18.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "3e700af445c802f251ce2b741ee78d2e5dfa5ab8115b933b89ca631b414691c9"
+SRC_URI[sha256sum] = "2cdfcc7f31f7ffdd57666a9957296089ac72daad4d11ab5005060e5cd7e29939"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.39.2


--===============2432961526217491828==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-trove-classifiers-upgrade-2023.9.19-2023.10..patch"

RnJvbSA1YjJiNTFhMWEyMzk4MjM1MWFkYTQ4NTY1NTRlMGVkYjQ5MmE0YzlmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAwOTozOToxMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdHJvdmUtY2xhc3NpZmllcnM6IHVwZ3JhZGUgMjAyMy45LjE5IC0+IDIwMjMuMTAuMTgK
Ci0tLQogLi4uZXJzXzIwMjMuOS4xOS5iYiA9PiBweXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIw
MjMuMTAuMTguYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy10
cm92ZS1jbGFzc2lmaWVyc18yMDIzLjkuMTkuYmIgPT4gcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVy
c18yMDIzLjEwLjE4LmJifSAoODclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDIzLjkuMTkuYmIgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHJvdmUtY2xhc3NpZmllcnNfMjAyMy4xMC4x
OC5iYgpzaW1pbGFyaXR5IGluZGV4IDg3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtdHJvdmUtY2xhc3NpZmllcnNfMjAyMy45LjE5LmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHJvdmUtY2xhc3NpZmllcnNf
MjAyMy4xMC4xOC5iYgppbmRleCBhYTA2MmY2NTliLi5iMGMxYjg0Y2M1IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHJvdmUtY2xhc3NpZmllcnNfMjAy
My45LjE5LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10cm92
ZS1jbGFzc2lmaWVyc18yMDIzLjEwLjE4LmJiCkBAIC0zLDcgKzMsNyBAQCBIT01FUEFHRSA9ICJo
dHRwczovL2dpdGh1Yi5jb20vcHlwYS90cm92ZS1jbGFzc2lmaWVycyIKIExJQ0VOU0UgPSAiQXBh
Y2hlLTIuMCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTg2ZDNmM2E5
NWMzMjRjOTQ3OWJkODk4Njk2OGY0MzI3IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiM2U3MDBh
ZjQ0NWM4MDJmMjUxY2UyYjc0MWVlNzhkMmU1ZGZhNWFiODExNWI5MzNiODljYTYzMWI0MTQ2OTFj
OSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIyY2RmY2M3ZjMxZjdmZmRkNTc2NjZhOTk1NzI5NjA4
OWFjNzJkYWFkNGQxMWFiNTAwNTA2MGU1Y2Q3ZTI5OTM5IgogCiBpbmhlcml0IHB5cGkgcHl0aG9u
X3NldHVwdG9vbHNfYnVpbGRfbWV0YSBwdGVzdAogCi0tIAoyLjM5LjIKCg==

--===============2432961526217491828==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-trove-classifiers: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/trove-classifiers/trove-classifiers-2023.9.19.tar.gz;downloadfilename=trove-classifiers-2023.9.19.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/t/trove-classifiers/trove-classifiers-2023.10.18.tar.gz;downloadfilename=trove-classifiers-2023.10.18.tar.gz file://run-ptest"
packages/core2-64-poky-linux/python3-trove-classifiers: PKGV changed from 2023.9.19 [default] to 2023.10.18 [default]
packages/core2-64-poky-linux/python3-trove-classifiers: PV changed from "2023.9.19" to "2023.10.18"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PKGV changed from 2023.9.19 [default] to 2023.10.18 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PV changed from "2023.9.19" to "2023.10.18"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PKGV changed from 2023.9.19 [default] to 2023.10.18 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PV changed from "2023.9.19" to "2023.10.18"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PKGV changed from 2023.9.19 [default] to 2023.10.18 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PV changed from "2023.9.19" to "2023.10.18"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PKGV changed from 2023.9.19 [default] to 2023.10.18 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PV changed from "2023.9.19" to "2023.10.18"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PKGV changed from 2023.9.19 [default] to 2023.10.18 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PV changed from "2023.9.19" to "2023.10.18"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PKGV changed from 2023.9.19 [default] to 2023.10.18 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PV changed from "2023.9.19" to "2023.10.18"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PKGV changed from 2023.9.19 [default] to 2023.10.18 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PV changed from "2023.9.19" to "2023.10.18"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGV changed from 2023.9.19 [default] to 2023.10.18 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGSIZE changed from 90554 to 90712 (+0%)
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PV changed from "2023.9.19" to "2023.10.18"
Changes to packages/core2-64-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.10.18.dist-info was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.10.18.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.10.18.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.10.18.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.10.18.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.10.18.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.9.19.dist-info was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.9.19.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.9.19.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.9.19.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.9.19.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.9.19.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.10.18.dist-info was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.10.18.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.10.18.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.10.18.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.10.18.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.10.18.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.9.19.dist-info was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.9.19.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.9.19.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.9.19.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.9.19.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.9.19.dist-info/WHEEL was removed

--===============2432961526217491828==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.10.18.dist-info was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.10.18.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.10.18.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.10.18.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.10.18.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.10.18.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.9.19.dist-info was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.9.19.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.9.19.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.9.19.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.9.19.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.9.19.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.10.18.dist-info was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.10.18.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.10.18.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.10.18.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.10.18.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.10.18.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.9.19.dist-info was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.9.19.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.9.19.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.9.19.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.9.19.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.9.19.dist-info/WHEEL was removed

--===============2432961526217491828==--

