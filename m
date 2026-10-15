Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 108D0CCA463
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:44:19 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33250.1792043050123141887
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:44:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=XvOSem9B;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=lz05jXWO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a13e16e08e-1cdda286-5b97-42bc-8ac0-1fd43fdccf7d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792043049;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YEUvaJnfD2nU9nqaf7U+0LAifBUc7g7exwwRcCETBPg=;
	b=XvOSem9BdG+cyqAEb9s9JW3fTBtReQQ2H7H6Z+x7yO3IjrYPNglO8QPajRBM0LkH
	THHlyAOtzckcN7iIiiRvj8/Z+j23IuFFWk/v4rY2afxIzkAcCjIGILxoR2KC8PFpX5f
	wUNxbk77SknV52WhvUaoTOgGCHTsiwEvJR3ufX2U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792043049;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YEUvaJnfD2nU9nqaf7U+0LAifBUc7g7exwwRcCETBPg=;
	b=lz05jXWOshK1ZaWgKJFSn2P1LJ7yyO7xkxNqucsfClqIuHcC5+wvKqFiApDi+8VM
	BsaMobwpBCv4O4tr+dKCOa+9tHMSm8v+sXvg3Gr44uqvIShRtc3IU6FJQtSK3oc3I8u
	Y5c8coIIkBeGcr7Q91pvCNzjU1LF5S6XrIZbTrJA=
Content-Type: multipart/mixed; boundary="===============8047603123486940943=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.169.3 SUCCEEDED
Message-ID: <010101a13e16e08e-1cdda286-5b97-42bc-8ac0-1fd43fdccf7d-000000@us-west-2.amazonses.com>
Date: Thu, 15 Oct 2026 05:44:09 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:44:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247861

--===============8047603123486940943==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hypothesis* to *6.169.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.168.5-6.169.3.patch
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
From 9c72add794a3213011ce811296f17193d281eb96 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Oct 2026 05:26:50 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.168.5 -> 6.169.3

---
 ...hon3-hypothesis_6.168.5.bb => python3-hypothesis_6.169.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.168.5.bb => python3-hypothesis_6.169.3.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.168.5.bb b/meta/recipes-devtools/python/python3-hypothesis_6.169.3.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.168.5.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.169.3.bb
index 93580094f0..a76c758ac1 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.168.5.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.169.3.bb
@@ -16,7 +16,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "76b9226962fe11d40858253a967eda95bb65811365286317e0118f4ec8f808c7"
+SRC_URI[sha256sum] = "54429f636fe1382ec3b3e85e1a3db9bbd7b4ff23737f2644e62186344d7d8138"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.47.1


--===============8047603123486940943==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.168.5.dist-info/licenses -> /usr/lib/python3.14/site-packages/hypothesis-6.169.3.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.168.5.dist-info -> /usr/lib/python3.14/site-packages/hypothesis-6.169.3.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.14/site-packages/hypothesis-6.168.5.dist-info moved to /usr/lib/python3.14/site-packages/hypothesis-6.169.3.dist-info

--===============8047603123486940943==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis: PKGV changed from 6.168.5 [default] to 6.169.3 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.168.5.tar.gz crate://crates.io/cfg-if/1.0.4 crate://crates.io/crunchy/0.2.4 crate://crates.io/getrandom/0.3.4 crate://crates.io/half/2.7.1 crate://crates.io/heck/0.5.0 crate://crates.io/libc/0.2.186 crate://crates.io/once_cell/1.21.4 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/ppv-lite86/0.2.21 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/pyo3/0.29.3 crate://crates.io/pyo3-build-config/0.29.3 crate://crates.io/pyo3-ffi/0.29.3 crate://crates.io/pyo3-macros/0.29.3 crate://crates.io/pyo3-macros-backend/0.29.3 crate://crates.io/quote/1.0.46 crate://crates.io/r-efi/5.3.0 crate://crates.io/rand/0.9.4 crate://crates.io/rand_chacha/0.9.0 crate://crates.io/rand_core/0.9.5 crate://crates.io/syn/2.0.118 crate://crates.io/target-lexicon/0.13.5 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/wasip2/1.0.4+wasi-0.2.12 cra
 te://crates.io/wit-bindgen/0.57.1 crate://crates.io/zerocopy/0.8.53 crate://crates.io/zerocopy-derive/0.8.53 file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.169.3.tar.gz crate://crates.io/cfg-if/1.0.4 crate://crates.io/crunchy/0.2.4 crate://crates.io/getrandom/0.3.4 crate://crates.io/half/2.7.1 crate://crates.io/heck/0.5.0 crate://crates.io/libc/0.2.186 crate://crates.io/once_cell/1.21.4 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/ppv-lite86/0.2.21 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/pyo3/0.29.3 crate://crates.io/pyo3-build-config/0.29.3 crate://crates.io/pyo3-ffi/0.29.3 crate://crates.io/pyo3-macros/0.29.3 crate://crates.io/pyo3-macros-backend/0.29.3 crate://crates.io/quote/1.0.46 crate://crates.io/r-efi/5.3.0 crate://crates.io/rand/0.9.4 crate://crates.io/rand_chacha/0.9.0 crate://crates.io/rand_core/0.9.5 crate://crates.io/syn/2.0.118 crate://crates.io/target-lexicon/0
 .13.5 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/wasip2/1.0.4+wasi-0.2.12 crate://crates.io/wit-bindgen/0.57.1 crate://crates.io/zerocopy/0.8.53 crate://crates.io/zerocopy-derive/0.8.53 file://test_binary_search.py file://test_rle.py"
packages/x86-64-v3-poky-linux/python3-hypothesis: PV changed from "6.168.5" to "6.169.3"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.168.5 [default] to 6.169.3 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.168.5" to "6.169.3"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.168.5 [default] to 6.169.3 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.168.5" to "6.169.3"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.168.5 [default] to 6.169.3 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.168.5" to "6.169.3"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.168.5 [default] to 6.169.3 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.168.5" to "6.169.3"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.168.5 [default] to 6.169.3 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.168.5" to "6.169.3"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.168.5 [default] to 6.169.3 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.168.5" to "6.169.3"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.168.5 [default] to 6.169.3 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.168.5" to "6.169.3"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.168.5 [default] to 6.169.3 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.168.5.dist-info -> /usr/lib/python3.14/site-packages/hypothesis-6.169.3.dist-info, directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.168.5.dist-info/licenses -> /usr/lib/python3.14/site-packages/hypothesis-6.169.3.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.168.5" to "6.169.3"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 4575384 to 4567990 (-0%)
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.14/site-packages/hypothesis-6.168.5.dist-info moved to /usr/lib/python3.14/site-packages/hypothesis-6.169.3.dist-info

--===============8047603123486940943==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.168.5-6.169.3.patch"

RnJvbSA5YzcyYWRkNzk0YTMyMTMwMTFjZTgxMTI5NmYxNzE5M2QyODFlYjk2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgT2N0IDIwMjYgMDU6MjY6NTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWh5cG90aGVzaXM6IHVwZ3JhZGUgNi4xNjguNSAtPiA2LjE2OS4zCgotLS0KIC4uLmhv
bjMtaHlwb3RoZXNpc182LjE2OC41LmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjE2OS4zLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaHlwb3RoZXNpc182
LjE2OC41LmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjE2OS4zLmJifSAoOTElKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYu
MTY4LjUuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNp
c182LjE2OS4zLmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTY4LjUuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTY5LjMu
YmIKaW5kZXggOTM1ODAwOTRmMC4uYTc2Yzc1OGFjMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4xNjguNS5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjE2OS4zLmJiCkBA
IC0xNiw3ICsxNiw3IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgZmlsZTovL3Rlc3RfcmxlLnB5IFwK
ICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI3NmI5MjI2OTYyZmUxMWQ0MDg1ODI1M2E5
NjdlZGE5NWJiNjU4MTEzNjUyODYzMTdlMDExOGY0ZWM4ZjgwOGM3IgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjU0NDI5ZjYzNmZlMTM4MmVjM2IzZTg1ZTFhM2RiOWJiZDdiNGZmMjM3MzdmMjY0NGU2
MjE4NjM0NGQ3ZDgxMzgiCiAKIFJERVBFTkRTOiR7UE59ICs9ICIgXAogICAgIHB5dGhvbjMtYXR0
cnMgXAotLSAKMi40Ny4xCgo=

--===============8047603123486940943==--

