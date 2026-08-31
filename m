Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F569C61DD3
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 05:08:22 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23161.1788152899771113408
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 22:08:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=gVi19JS1;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=zJbEYbUi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a05637e50e-492ebff9-1a54-4e60-a7cb-9893776540f6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1788152899;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UrQpIn4d+Cg+Cw74kRU4KY2BkqHZlJCxkpjEUOQjdkg=;
	b=gVi19JS1uhmuSFcBw+/zkxedMR8t5AOtaS9lAoPlCoCjM/+iwg3w9tFkxnHGEIj4
	dLgyEcjRgrvG0NN7mcNpLB7DQgBGP9G+oVt/KGUFzrOR1dKR99d12cSwNlxev63tyUj
	A2zjc5IlQq6KuJS/N5nW+8veXJZdtHT/i6ng7enk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1788152899;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UrQpIn4d+Cg+Cw74kRU4KY2BkqHZlJCxkpjEUOQjdkg=;
	b=zJbEYbUi0N9hJkW9QWqcm7scdK4nZOPrzWHIWVAoNMu1cYWPBVy7Vw1aY1NVJX4n
	csTBBigVLrwYdYhdo1tL8AShpzxpFbbbrC4XYTOWMioqhx6yfgl1DDLWVbJt93yCJOX
	Q90uKMfkyofTSaooxkeLWsCFqTj1xitXtcfXPEgM=
Content-Type: multipart/mixed; boundary="===============2995228120608378152=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.167.1 SUCCEEDED
Message-ID: <010101a05637e50e-492ebff9-1a54-4e60-a7cb-9893776540f6-000000@us-west-2.amazonses.com>
Date: Mon, 31 Aug 2026 05:08:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.31-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 05:08:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244727

--===============2995228120608378152==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hypothesis* to *6.167.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.165.10-6.167.1.patch
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
From 9bd14595ad19f6c2be18d88a0112299ccdd27395 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 31 Aug 2026 05:08:15 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.165.10 -> 6.167.1

---
 ...on3-hypothesis_6.165.10.bb => python3-hypothesis_6.167.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.165.10.bb => python3-hypothesis_6.167.1.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.165.10.bb b/meta/recipes-devtools/python/python3-hypothesis_6.167.1.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-hypothesis_6.165.10.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.167.1.bb
index ccb6c6cf8f..2274188a04 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.165.10.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.167.1.bb
@@ -17,7 +17,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "68b45e09834cd80523cb1eb274463073c7a9af4e4ef7cff34d9615f355572d32"
+SRC_URI[sha256sum] = "62eefcb4d2791423626e9901c3027a6e0c5ffda2ac0b44b3c7e797ab9d2d5a4c"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.47.1


--===============2995228120608378152==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.165.10.dist-info -> /usr/lib/python3.14/site-packages/hypothesis-6.167.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.165.10.dist-info/licenses -> /usr/lib/python3.14/site-packages/hypothesis-6.167.1.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.14/site-packages/hypothesis-6.167.1.dist-info was added
  /usr/lib/python3.14/site-packages/hypothesis-6.167.1.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/hypothesis-6.167.1.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/hypothesis-6.167.1.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/hypothesis-6.167.1.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/hypothesis-6.167.1.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/hypothesis-6.165.10.dist-info was removed
  /usr/lib/python3.14/site-packages/hypothesis-6.165.10.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/hypothesis-6.165.10.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/hypothesis-6.165.10.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/hypothesis-6.165.10.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/hypothesis-6.165.10.dist-info/WHEEL was removed

--===============2995228120608378152==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis: PV changed from "6.165.10" to "6.167.1"
packages/x86-64-v3-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.165.10.tar.gz;downloadfilename=hypothesis-6.165.10.tar.gz crate://crates.io/cfg-if/1.0.4 crate://crates.io/crunchy/0.2.4 crate://crates.io/getrandom/0.3.4 crate://crates.io/half/2.7.1 crate://crates.io/heck/0.5.0 crate://crates.io/libc/0.2.186 crate://crates.io/once_cell/1.21.4 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/ppv-lite86/0.2.21 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/pyo3/0.29.2 crate://crates.io/pyo3-build-config/0.29.2 crate://crates.io/pyo3-ffi/0.29.2 crate://crates.io/pyo3-macros/0.29.2 crate://crates.io/pyo3-macros-backend/0.29.2 crate://crates.io/quote/1.0.46 crate://crates.io/r-efi/5.3.0 crate://crates.io/rand/0.9.4 crate://crates.io/rand_chacha/0.9.0 crate://crates.io/rand_core/0.9.5 crate://crates.io/syn/2.0.118 crate://crates.io/target-lexicon/0.13.5 crate://crates.io/unicode-ident/1.0.24 c
 rate://crates.io/wasip2/1.0.4+wasi-0.2.12 crate://crates.io/wit-bindgen/0.57.1 crate://crates.io/zerocopy/0.8.53 crate://crates.io/zerocopy-derive/0.8.53 file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.167.1.tar.gz;downloadfilename=hypothesis-6.167.1.tar.gz crate://crates.io/cfg-if/1.0.4 crate://crates.io/crunchy/0.2.4 crate://crates.io/getrandom/0.3.4 crate://crates.io/half/2.7.1 crate://crates.io/heck/0.5.0 crate://crates.io/libc/0.2.186 crate://crates.io/once_cell/1.21.4 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/ppv-lite86/0.2.21 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/pyo3/0.29.2 crate://crates.io/pyo3-build-config/0.29.2 crate://crates.io/pyo3-ffi/0.29.2 crate://crates.io/pyo3-macros/0.29.2 crate://crates.io/pyo3-macros-backend/0.29.2 crate://crates.io/quote/1.0.46 crate://crates.io/r-efi/5.3.0 crate://crates.io/rand/0.9.4 crate://crates.io/rand_chacha/0.9.0 crate://cr
 ates.io/rand_core/0.9.5 crate://crates.io/syn/2.0.118 crate://crates.io/target-lexicon/0.13.5 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/wasip2/1.0.4+wasi-0.2.12 crate://crates.io/wit-bindgen/0.57.1 crate://crates.io/zerocopy/0.8.53 crate://crates.io/zerocopy-derive/0.8.53 file://test_binary_search.py file://test_rle.py"
packages/x86-64-v3-poky-linux/python3-hypothesis: PKGV changed from 6.165.10 [default] to 6.167.1 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.165.10" to "6.167.1"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.165.10 [default] to 6.167.1 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.165.10" to "6.167.1"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.165.10 [default] to 6.167.1 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.165.10" to "6.167.1"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.165.10 [default] to 6.167.1 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.165.10" to "6.167.1"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.165.10 [default] to 6.167.1 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.165.10" to "6.167.1"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.165.10 [default] to 6.167.1 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.165.10" to "6.167.1"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.165.10 [default] to 6.167.1 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.165.10" to "6.167.1"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.165.10 [default] to 6.167.1 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 4532112 to 4549708 (+0%)
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.165.10" to "6.167.1"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.165.10.dist-info -> /usr/lib/python3.14/site-packages/hypothesis-6.167.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.165.10.dist-info/licenses -> /usr/lib/python3.14/site-packages/hypothesis-6.167.1.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.165.10 [default] to 6.167.1 [default]
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.14/site-packages/hypothesis-6.167.1.dist-info was added
  /usr/lib/python3.14/site-packages/hypothesis-6.167.1.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/hypothesis-6.167.1.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/hypothesis-6.167.1.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/hypothesis-6.167.1.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/hypothesis-6.167.1.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/hypothesis-6.165.10.dist-info was removed
  /usr/lib/python3.14/site-packages/hypothesis-6.165.10.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/hypothesis-6.165.10.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/hypothesis-6.165.10.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/hypothesis-6.165.10.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/hypothesis-6.165.10.dist-info/WHEEL was removed

--===============2995228120608378152==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.165.10-6.167.1.patch"

RnJvbSA5YmQxNDU5NWFkMTlmNmMyYmUxOGQ4OGEwMTEyMjk5Y2NkZDI3Mzk1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMzEgQXVnIDIwMjYgMDU6MDg6MTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWh5cG90aGVzaXM6IHVwZ3JhZGUgNi4xNjUuMTAgLT4gNi4xNjcuMQoKLS0tCiAuLi5v
bjMtaHlwb3RoZXNpc182LjE2NS4xMC5iYiA9PiBweXRob24zLWh5cG90aGVzaXNfNi4xNjcuMS5i
Yn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWh5cG90aGVzaXNf
Ni4xNjUuMTAuYmIgPT4gcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTY3LjEuYmJ9ICg5MiUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNf
Ni4xNjUuMTAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3Ro
ZXNpc182LjE2Ny4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTIlCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTY1LjEwLmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjE2
Ny4xLmJiCmluZGV4IGNjYjZjNmNmOGYuLjIyNzQxODhhMDQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTY1LjEwLmJiCisrKyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTY3LjEu
YmIKQEAgLTE3LDcgKzE3LDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBmaWxlOi8vdGVzdF9ybGUu
cHkgXAogICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjY4YjQ1ZTA5ODM0Y2Q4MDUyM2Ni
MWViMjc0NDYzMDczYzdhOWFmNGU0ZWY3Y2ZmMzRkOTYxNWYzNTU1NzJkMzIiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiNjJlZWZjYjRkMjc5MTQyMzYyNmU5OTAxYzMwMjdhNmUwYzVmZmRhMmFjMGI0
NGIzYzdlNzk3YWI5ZDJkNWE0YyIKIAogUkRFUEVORFM6JHtQTn0gKz0gIiBcCiAgICAgcHl0aG9u
My1hdHRycyBcCi0tIAoyLjQ3LjEKCg==

--===============2995228120608378152==--

