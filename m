Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B613C982EA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 06:27:48 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1210.1790144866958447138
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 23:27:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=awKZiIuD;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=T53Pizko;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a0ccf2e743-c45e933e-6dab-4e2c-a9b4-73393cf58bd7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790144866;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=BU8KpFq6lKrl+cI6md/dcjjKTRrNOLVNDxN5M6ks8LE=;
	b=awKZiIuDMyzFBaoGhB64HMTxRhHhIRuP/akgsDOCKLXufgAj1mtLpID+uptIdbSM
	AuBR8rNU97AMPOTVqO7CquJqHMiMzUM8Mmt1Z+Zqp+Fq2s77+yUdLp/ae3HC1PSB+Py
	A0wl5Nh+C8Msr5SS1gARkJMHJBGyQEWkmVar2+Rk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790144866;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=BU8KpFq6lKrl+cI6md/dcjjKTRrNOLVNDxN5M6ks8LE=;
	b=T53PizkoqpqtNA5i6jFfIBJ4UklFMtM6P1c4zuaBMJFGNLSRUz1zg2T6LCdHUf9b
	JlWoHRwVbkCb6eE3gZAaR5ATKyj/DGKmfXlPfLRk+ECyD6Od+H8eqoX3UTZppL5EuVD
	xP/GaeAXVAOQ2IqodgzJUxhQ3fu5xz0EXi63Gn3c=
Content-Type: multipart/mixed; boundary="===============2701038058006453020=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.168.1 SUCCEEDED
Message-ID: <010101a0ccf2e743-c45e933e-6dab-4e2c-a9b4-73393cf58bd7-000000@us-west-2.amazonses.com>
Date: Wed, 23 Sep 2026 06:27:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.23-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 06:27:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246441

--===============2701038058006453020==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hypothesis* to *6.168.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.168.0-6.168.1.patch
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
From 99058bf1a99448705f0fd5a4b0349d363f3dce60 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 23 Sep 2026 06:07:08 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.168.0 -> 6.168.1

---
 ...hon3-hypothesis_6.168.0.bb => python3-hypothesis_6.168.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.168.0.bb => python3-hypothesis_6.168.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.168.0.bb b/meta/recipes-devtools/python/python3-hypothesis_6.168.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.168.0.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.168.1.bb
index ec75251e70..7386f26afa 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.168.0.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.168.1.bb
@@ -16,7 +16,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "72af51087b7b5ab21c49f0d502f803c20897678652835596bd2a8b169a39135e"
+SRC_URI[sha256sum] = "fd8acb5c67f260dfbdcc1b2dc95ff48b2b3f90708ae595c76f591bbf3f6f8eeb"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.47.1


--===============2701038058006453020==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis: PKGV changed from 6.168.0 [default] to 6.168.1 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis: PV changed from "6.168.0" to "6.168.1"
packages/x86-64-v3-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.168.0.tar.gz crate://crates.io/cfg-if/1.0.4 crate://crates.io/crunchy/0.2.4 crate://crates.io/getrandom/0.3.4 crate://crates.io/half/2.7.1 crate://crates.io/heck/0.5.0 crate://crates.io/libc/0.2.186 crate://crates.io/once_cell/1.21.4 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/ppv-lite86/0.2.21 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/pyo3/0.29.2 crate://crates.io/pyo3-build-config/0.29.2 crate://crates.io/pyo3-ffi/0.29.2 crate://crates.io/pyo3-macros/0.29.2 crate://crates.io/pyo3-macros-backend/0.29.2 crate://crates.io/quote/1.0.46 crate://crates.io/r-efi/5.3.0 crate://crates.io/rand/0.9.4 crate://crates.io/rand_chacha/0.9.0 crate://crates.io/rand_core/0.9.5 crate://crates.io/syn/2.0.118 crate://crates.io/target-lexicon/0.13.5 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/wasip2/1.0.4+wasi-0.2.12 cra
 te://crates.io/wit-bindgen/0.57.1 crate://crates.io/zerocopy/0.8.53 crate://crates.io/zerocopy-derive/0.8.53 file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.168.1.tar.gz crate://crates.io/cfg-if/1.0.4 crate://crates.io/crunchy/0.2.4 crate://crates.io/getrandom/0.3.4 crate://crates.io/half/2.7.1 crate://crates.io/heck/0.5.0 crate://crates.io/libc/0.2.186 crate://crates.io/once_cell/1.21.4 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/ppv-lite86/0.2.21 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/pyo3/0.29.2 crate://crates.io/pyo3-build-config/0.29.2 crate://crates.io/pyo3-ffi/0.29.2 crate://crates.io/pyo3-macros/0.29.2 crate://crates.io/pyo3-macros-backend/0.29.2 crate://crates.io/quote/1.0.46 crate://crates.io/r-efi/5.3.0 crate://crates.io/rand/0.9.4 crate://crates.io/rand_chacha/0.9.0 crate://crates.io/rand_core/0.9.5 crate://crates.io/syn/2.0.118 crate://crates.io/target-lexicon/0
 .13.5 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/wasip2/1.0.4+wasi-0.2.12 crate://crates.io/wit-bindgen/0.57.1 crate://crates.io/zerocopy/0.8.53 crate://crates.io/zerocopy-derive/0.8.53 file://test_binary_search.py file://test_rle.py"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.168.0 [default] to 6.168.1 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.168.0" to "6.168.1"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.168.0 [default] to 6.168.1 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.168.0" to "6.168.1"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.168.0 [default] to 6.168.1 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.168.0" to "6.168.1"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.168.0 [default] to 6.168.1 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.168.0" to "6.168.1"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.168.0 [default] to 6.168.1 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.168.0" to "6.168.1"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.168.0 [default] to 6.168.1 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.168.0" to "6.168.1"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.168.0 [default] to 6.168.1 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.168.0" to "6.168.1"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.168.0.dist-info -> /usr/lib/python3.14/site-packages/hypothesis-6.168.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.168.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/hypothesis-6.168.1.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.168.0 [default] to 6.168.1 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.168.0" to "6.168.1"
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.14/site-packages/hypothesis-6.168.0.dist-info moved to /usr/lib/python3.14/site-packages/hypothesis-6.168.1.dist-info

--===============2701038058006453020==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.168.0.dist-info -> /usr/lib/python3.14/site-packages/hypothesis-6.168.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.168.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/hypothesis-6.168.1.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.14/site-packages/hypothesis-6.168.0.dist-info moved to /usr/lib/python3.14/site-packages/hypothesis-6.168.1.dist-info

--===============2701038058006453020==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.168.0-6.168.1.patch"

RnJvbSA5OTA1OGJmMWE5OTQ0ODcwNWYwZmQ1YTRiMDM0OWQzNjNmM2RjZTYwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjMgU2VwIDIwMjYgMDY6MDc6MDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWh5cG90aGVzaXM6IHVwZ3JhZGUgNi4xNjguMCAtPiA2LjE2OC4xCgotLS0KIC4uLmhv
bjMtaHlwb3RoZXNpc182LjE2OC4wLmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjE2OC4xLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaHlwb3RoZXNpc182
LjE2OC4wLmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjE2OC4xLmJifSAoOTElKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYu
MTY4LjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNp
c182LjE2OC4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTY4LjAuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTY4LjEu
YmIKaW5kZXggZWM3NTI1MWU3MC4uNzM4NmYyNmFmYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4xNjguMC5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjE2OC4xLmJiCkBA
IC0xNiw3ICsxNiw3IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgZmlsZTovL3Rlc3RfcmxlLnB5IFwK
ICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI3MmFmNTEwODdiN2I1YWIyMWM0OWYwZDUw
MmY4MDNjMjA4OTc2Nzg2NTI4MzU1OTZiZDJhOGIxNjlhMzkxMzVlIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gImZkOGFjYjVjNjdmMjYwZGZiZGNjMWIyZGM5NWZmNDhiMmIzZjkwNzA4YWU1OTVjNzZm
NTkxYmJmM2Y2ZjhlZWIiCiAKIFJERVBFTkRTOiR7UE59ICs9ICIgXAogICAgIHB5dGhvbjMtYXR0
cnMgXAotLSAKMi40Ny4xCgo=

--===============2701038058006453020==--

