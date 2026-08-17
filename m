Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34942C5DF79
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 05:20:39 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24017.1786944029736476939
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 22:20:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=F/KX9lgc;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=0mZUi9D9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a00e2a0104-133d5174-9b76-41c4-b052-8af726409f56-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1786944029;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JujqjPD4sd2xcF7zoRdi1ga5+mZp9TGkc//P3/7nWvc=;
	b=F/KX9lgcX8Tyk8qZ4XI0/TVzIhUWCidnr7IVI0fG0iPkZKp0fayVxlpI89ckvemd
	aUMk47CuOVWDD0jxAxZ2KccgzHFmG1LsmakCLKCt1GlT/RKbptskrLqOyrzHMkUwFL9
	UrF42cWtf2LM/HEfHuq9SiP+T2xM3570Iw6k05sc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1786944029;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JujqjPD4sd2xcF7zoRdi1ga5+mZp9TGkc//P3/7nWvc=;
	b=0mZUi9D9z/p1GyHssc8I5vaxScB8SkB33bHi6y2jPg9v8WFpCEteBDISAjNUo/nq
	fh6vvAJ8PSJ3p0qfd88qQb8rz2SL1Sf0W9ju5vRsxPdyxM/FNA6co/TgnoB3HC6o9Sw
	lya7/wuEzOYUdgYU0H/AY7MoJ9/QtNCvvTbVFlAM=
Content-Type: multipart/mixed; boundary="===============8232951644633366580=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.165.10 SUCCEEDED
Message-ID: <010101a00e2a0104-133d5174-9b76-41c4-b052-8af726409f56-000000@us-west-2.amazonses.com>
Date: Mon, 17 Aug 2026 05:20:28 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.17-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 05:20:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243590

--===============8232951644633366580==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hypothesis* to *6.165.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.165.2-6.165.10.patch
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
From 4599243e97c6f3820d1458e6a6f956d172aec9e0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 17 Aug 2026 05:15:45 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.165.2 -> 6.165.10

---
 .../python/python3-hypothesis-crates.inc      | 20 +++++++++----------
 ...65.2.bb => python3-hypothesis_6.165.10.bb} |  2 +-
 2 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.165.2.bb => python3-hypothesis_6.165.10.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis-crates.inc b/meta/recipes-devtools/python/python3-hypothesis-crates.inc
index efce454843..080e6ed7f4 100644
--- a/meta/recipes-devtools/python/python3-hypothesis-crates.inc
+++ b/meta/recipes-devtools/python/python3-hypothesis-crates.inc
@@ -12,11 +12,11 @@ SRC_URI += " \
     crate://crates.io/portable-atomic/1.13.1 \
     crate://crates.io/ppv-lite86/0.2.21 \
     crate://crates.io/proc-macro2/1.0.106 \
-    crate://crates.io/pyo3/0.29.0 \
-    crate://crates.io/pyo3-build-config/0.29.0 \
-    crate://crates.io/pyo3-ffi/0.29.0 \
-    crate://crates.io/pyo3-macros/0.29.0 \
-    crate://crates.io/pyo3-macros-backend/0.29.0 \
+    crate://crates.io/pyo3/0.29.2 \
+    crate://crates.io/pyo3-build-config/0.29.2 \
+    crate://crates.io/pyo3-ffi/0.29.2 \
+    crate://crates.io/pyo3-macros/0.29.2 \
+    crate://crates.io/pyo3-macros-backend/0.29.2 \
     crate://crates.io/quote/1.0.46 \
     crate://crates.io/r-efi/5.3.0 \
     crate://crates.io/rand/0.9.4 \
@@ -41,11 +41,11 @@ SRC_URI[once_cell-1.21.4.sha256sum] = "9f7c3e4beb33f85d45ae3e3a1792185706c8e16d0
 SRC_URI[portable-atomic-1.13.1.sha256sum] = "c33a9471896f1c69cecef8d20cbe2f7accd12527ce60845ff44c153bb2a21b49"
 SRC_URI[ppv-lite86-0.2.21.sha256sum] = "85eae3c4ed2f50dcfe72643da4befc30deadb458a9b590d720cde2f2b1e97da9"
 SRC_URI[proc-macro2-1.0.106.sha256sum] = "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
-SRC_URI[pyo3-0.29.0.sha256sum] = "cd274650b21d4bfc26a0a47587962c1edb425f69287324355cd040c3ea66071c"
-SRC_URI[pyo3-build-config-0.29.0.sha256sum] = "c5e2a7d2f0d013342f295c048ad19237add5154a55b1c5a254c0ec93d4109078"
-SRC_URI[pyo3-ffi-0.29.0.sha256sum] = "ca85c467da1bbc8d866eea5deff9cf29ea5f7785054a17da36e65bda9c05845b"
-SRC_URI[pyo3-macros-0.29.0.sha256sum] = "9ac53762fd065daa3194dd09337a38bd793a188100fd1a9304c4ab312d901771"
-SRC_URI[pyo3-macros-backend-0.29.0.sha256sum] = "4ca3a1557399783172dc5bf39cfca835157732532cba56b71d2292161e53b362"
+SRC_URI[pyo3-0.29.2.sha256sum] = "4688ddedf473e32662b9b067670129a8afb8c18e351482c70d62ba4a88171e8b"
+SRC_URI[pyo3-build-config-0.29.2.sha256sum] = "f41027e41b4bd03f6e60f9f417fe24a6341a6bb744edd62b6f709f2a52ea30e9"
+SRC_URI[pyo3-ffi-0.29.2.sha256sum] = "e591a95526fead067432c3b3a33fc74770b87b1e04e73671090d9c2055a2b327"
+SRC_URI[pyo3-macros-0.29.2.sha256sum] = "73225868fc1cd84eef2c3c230ddb91273bf1de46aeb8a4248da76d32a0924a1c"
+SRC_URI[pyo3-macros-backend-0.29.2.sha256sum] = "571575aa3749fa6216757dd47d2a3e7ef360f329a40f0666a9fbd14889024952"
 SRC_URI[quote-1.0.46.sha256sum] = "dfbc457d0c7a0759a614551b11a6409e5951f6c7537be1f1b7682b9ae9230368"
 SRC_URI[r-efi-5.3.0.sha256sum] = "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
 SRC_URI[rand-0.9.4.sha256sum] = "44c5af06bb1b7d3216d91932aed5265164bf384dc89cd6ba05cf59a35f5f76ea"
diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.165.2.bb b/meta/recipes-devtools/python/python3-hypothesis_6.165.10.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-hypothesis_6.165.2.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.165.10.bb
index 0776519a10..ccb6c6cf8f 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.165.2.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.165.10.bb
@@ -17,7 +17,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "680a1adf523ac792b46064f425b112ce6c08a7a8f50e65d08e029de6aa11df95"
+SRC_URI[sha256sum] = "68b45e09834cd80523cb1eb274463073c7a9af4e4ef7cff34d9615f355572d32"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.47.1


--===============8232951644633366580==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.165.2.tar.gz;downloadfilename=hypothesis-6.165.2.tar.gz crate://crates.io/cfg-if/1.0.4 crate://crates.io/crunchy/0.2.4 crate://crates.io/getrandom/0.3.4 crate://crates.io/half/2.7.1 crate://crates.io/heck/0.5.0 crate://crates.io/libc/0.2.186 crate://crates.io/once_cell/1.21.4 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/ppv-lite86/0.2.21 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/pyo3/0.29.0 crate://crates.io/pyo3-build-config/0.29.0 crate://crates.io/pyo3-ffi/0.29.0 crate://crates.io/pyo3-macros/0.29.0 crate://crates.io/pyo3-macros-backend/0.29.0 crate://crates.io/quote/1.0.46 crate://crates.io/r-efi/5.3.0 crate://crates.io/rand/0.9.4 crate://crates.io/rand_chacha/0.9.0 crate://crates.io/rand_core/0.9.5 crate://crates.io/syn/2.0.118 crate://crates.io/target-lexicon/0.13.5 crate://crates.io/unicode-ident/1.0.24 cra
 te://crates.io/wasip2/1.0.4+wasi-0.2.12 crate://crates.io/wit-bindgen/0.57.1 crate://crates.io/zerocopy/0.8.53 crate://crates.io/zerocopy-derive/0.8.53 file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.165.10.tar.gz;downloadfilename=hypothesis-6.165.10.tar.gz crate://crates.io/cfg-if/1.0.4 crate://crates.io/crunchy/0.2.4 crate://crates.io/getrandom/0.3.4 crate://crates.io/half/2.7.1 crate://crates.io/heck/0.5.0 crate://crates.io/libc/0.2.186 crate://crates.io/once_cell/1.21.4 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/ppv-lite86/0.2.21 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/pyo3/0.29.2 crate://crates.io/pyo3-build-config/0.29.2 crate://crates.io/pyo3-ffi/0.29.2 crate://crates.io/pyo3-macros/0.29.2 crate://crates.io/pyo3-macros-backend/0.29.2 crate://crates.io/quote/1.0.46 crate://crates.io/r-efi/5.3.0 crate://crates.io/rand/0.9.4 crate://crates.io/rand_chacha/0.9.0 crate://cr
 ates.io/rand_core/0.9.5 crate://crates.io/syn/2.0.118 crate://crates.io/target-lexicon/0.13.5 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/wasip2/1.0.4+wasi-0.2.12 crate://crates.io/wit-bindgen/0.57.1 crate://crates.io/zerocopy/0.8.53 crate://crates.io/zerocopy-derive/0.8.53 file://test_binary_search.py file://test_rle.py"
packages/x86-64-v3-poky-linux/python3-hypothesis: PV changed from "6.165.2" to "6.165.10"
packages/x86-64-v3-poky-linux/python3-hypothesis: PKGV changed from 6.165.2 [default] to 6.165.10 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.165.2" to "6.165.10"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGSIZE changed from 109240 to 109344 (+0%)
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.165.2 [default] to 6.165.10 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.165.2" to "6.165.10"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.165.2 [default] to 6.165.10 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.165.2" to "6.165.10"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.165.2 [default] to 6.165.10 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.165.2" to "6.165.10"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.165.2 [default] to 6.165.10 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.165.2" to "6.165.10"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.165.2 [default] to 6.165.10 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.165.2" to "6.165.10"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.165.2 [default] to 6.165.10 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.165.2" to "6.165.10"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.165.2 [default] to 6.165.10 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.165.2" to "6.165.10"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 4521298 to 4532104 (+0%)
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.165.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/hypothesis-6.165.10.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.165.2.dist-info -> /usr/lib/python3.14/site-packages/hypothesis-6.165.10.dist-info
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.165.2 [default] to 6.165.10 [default]
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.14/site-packages/hypothesis-6.165.10.dist-info was added
  /usr/lib/python3.14/site-packages/hypothesis-6.165.10.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/hypothesis-6.165.10.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/hypothesis-6.165.10.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/hypothesis-6.165.10.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/hypothesis-6.165.10.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/hypothesis-6.165.2.dist-info was removed
  /usr/lib/python3.14/site-packages/hypothesis-6.165.2.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/hypothesis-6.165.2.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/hypothesis-6.165.2.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/hypothesis-6.165.2.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/hypothesis-6.165.2.dist-info/WHEEL was removed

--===============8232951644633366580==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.165.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/hypothesis-6.165.10.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.165.2.dist-info -> /usr/lib/python3.14/site-packages/hypothesis-6.165.10.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.14/site-packages/hypothesis-6.165.10.dist-info was added
  /usr/lib/python3.14/site-packages/hypothesis-6.165.10.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/hypothesis-6.165.10.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/hypothesis-6.165.10.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/hypothesis-6.165.10.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/hypothesis-6.165.10.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/hypothesis-6.165.2.dist-info was removed
  /usr/lib/python3.14/site-packages/hypothesis-6.165.2.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/hypothesis-6.165.2.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/hypothesis-6.165.2.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/hypothesis-6.165.2.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/hypothesis-6.165.2.dist-info/WHEEL was removed

--===============8232951644633366580==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.165.2-6.165.10.patch"

RnJvbSA0NTk5MjQzZTk3YzZmMzgyMGQxNDU4ZTZhNmY5NTZkMTcyYWVjOWUwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTcgQXVnIDIwMjYgMDU6MTU6NDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWh5cG90aGVzaXM6IHVwZ3JhZGUgNi4xNjUuMiAtPiA2LjE2NS4xMAoKLS0tCiAuLi4v
cHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpcy1jcmF0ZXMuaW5jICAgICAgfCAyMCArKysrKysrKyst
LS0tLS0tLS0tCiAuLi42NS4yLmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjE2NS4xMC5iYn0g
fCAgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMo
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWh5cG90aGVz
aXNfNi4xNjUuMi5iYiA9PiBweXRob24zLWh5cG90aGVzaXNfNi4xNjUuMTAuYmJ9ICg5MiUpCgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVz
aXMtY3JhdGVzLmluYyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBv
dGhlc2lzLWNyYXRlcy5pbmMKaW5kZXggZWZjZTQ1NDg0My4uMDgwZTZlZDdmNCAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXMtY3JhdGVz
LmluYworKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNp
cy1jcmF0ZXMuaW5jCkBAIC0xMiwxMSArMTIsMTEgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0
ZTovL2NyYXRlcy5pby9wb3J0YWJsZS1hdG9taWMvMS4xMy4xIFwKICAgICBjcmF0ZTovL2NyYXRl
cy5pby9wcHYtbGl0ZTg2LzAuMi4yMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHJvYy1tYWNy
bzIvMS4wLjEwNiBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy8wLjI5LjAgXAotICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3B5bzMtYnVpbGQtY29uZmlnLzAuMjkuMCBcCi0gICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vcHlvMy1mZmkvMC4yOS4wIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLW1h
Y3Jvcy8wLjI5LjAgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMtbWFjcm9zLWJhY2tlbmQv
MC4yOS4wIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLzAuMjkuMiBcCisgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vcHlvMy1idWlsZC1jb25maWcvMC4yOS4yIFwKKyAgICBjcmF0ZTovL2NyYXRl
cy5pby9weW8zLWZmaS8wLjI5LjIgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMtbWFjcm9z
LzAuMjkuMiBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy1tYWNyb3MtYmFja2VuZC8wLjI5
LjIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3F1b3RlLzEuMC40NiBcCiAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vci1lZmkvNS4zLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JhbmQvMC45LjQg
XApAQCAtNDEsMTEgKzQxLDExIEBAIFNSQ19VUklbb25jZV9jZWxsLTEuMjEuNC5zaGEyNTZzdW1d
ID0gIjlmN2MzZTRiZWIzM2Y4NWQ0NWFlM2UzYTE3OTIxODU3MDZjOGUxNmQwCiBTUkNfVVJJW3Bv
cnRhYmxlLWF0b21pYy0xLjEzLjEuc2hhMjU2c3VtXSA9ICJjMzNhOTQ3MTg5NmYxYzY5Y2VjZWY4
ZDIwY2JlMmY3YWNjZDEyNTI3Y2U2MDg0NWZmNDRjMTUzYmIyYTIxYjQ5IgogU1JDX1VSSVtwcHYt
bGl0ZTg2LTAuMi4yMS5zaGEyNTZzdW1dID0gIjg1ZWFlM2M0ZWQyZjUwZGNmZTcyNjQzZGE0YmVm
YzMwZGVhZGI0NThhOWI1OTBkNzIwY2RlMmYyYjFlOTdkYTkiCiBTUkNfVVJJW3Byb2MtbWFjcm8y
LTEuMC4xMDYuc2hhMjU2c3VtXSA9ICI4ZmQwMGYwYmIyZTkwZDgxZDEwNDRjMmIzMjYxN2Y2OGZj
YjlmYTNiYjc2NDBjMjNlOWM3NDhlNTNmYjMwOTM0IgotU1JDX1VSSVtweW8zLTAuMjkuMC5zaGEy
NTZzdW1dID0gImNkMjc0NjUwYjIxZDRiZmMyNmEwYTQ3NTg3OTYyYzFlZGI0MjVmNjkyODczMjQz
NTVjZDA0MGMzZWE2NjA3MWMiCi1TUkNfVVJJW3B5bzMtYnVpbGQtY29uZmlnLTAuMjkuMC5zaGEy
NTZzdW1dID0gImM1ZTJhN2QyZjBkMDEzMzQyZjI5NWMwNDhhZDE5MjM3YWRkNTE1NGE1NWIxYzVh
MjU0YzBlYzkzZDQxMDkwNzgiCi1TUkNfVVJJW3B5bzMtZmZpLTAuMjkuMC5zaGEyNTZzdW1dID0g
ImNhODVjNDY3ZGExYmJjOGQ4NjZlZWE1ZGVmZjljZjI5ZWE1Zjc3ODUwNTRhMTdkYTM2ZTY1YmRh
OWMwNTg0NWIiCi1TUkNfVVJJW3B5bzMtbWFjcm9zLTAuMjkuMC5zaGEyNTZzdW1dID0gIjlhYzUz
NzYyZmQwNjVkYWEzMTk0ZGQwOTMzN2EzOGJkNzkzYTE4ODEwMGZkMWE5MzA0YzRhYjMxMmQ5MDE3
NzEiCi1TUkNfVVJJW3B5bzMtbWFjcm9zLWJhY2tlbmQtMC4yOS4wLnNoYTI1NnN1bV0gPSAiNGNh
M2ExNTU3Mzk5NzgzMTcyZGM1YmYzOWNmY2E4MzUxNTc3MzI1MzJjYmE1NmI3MWQyMjkyMTYxZTUz
YjM2MiIKK1NSQ19VUklbcHlvMy0wLjI5LjIuc2hhMjU2c3VtXSA9ICI0Njg4ZGRlZGY0NzNlMzI2
NjJiOWIwNjc2NzAxMjlhOGFmYjhjMThlMzUxNDgyYzcwZDYyYmE0YTg4MTcxZThiIgorU1JDX1VS
SVtweW8zLWJ1aWxkLWNvbmZpZy0wLjI5LjIuc2hhMjU2c3VtXSA9ICJmNDEwMjdlNDFiNGJkMDNm
NmU2MGY5ZjQxN2ZlMjRhNjM0MWE2YmI3NDRlZGQ2MmI2ZjcwOWYyYTUyZWEzMGU5IgorU1JDX1VS
SVtweW8zLWZmaS0wLjI5LjIuc2hhMjU2c3VtXSA9ICJlNTkxYTk1NTI2ZmVhZDA2NzQzMmMzYjNh
MzNmYzc0NzcwYjg3YjFlMDRlNzM2NzEwOTBkOWMyMDU1YTJiMzI3IgorU1JDX1VSSVtweW8zLW1h
Y3Jvcy0wLjI5LjIuc2hhMjU2c3VtXSA9ICI3MzIyNTg2OGZjMWNkODRlZWYyYzNjMjMwZGRiOTEy
NzNiZjFkZTQ2YWViOGE0MjQ4ZGE3NmQzMmEwOTI0YTFjIgorU1JDX1VSSVtweW8zLW1hY3Jvcy1i
YWNrZW5kLTAuMjkuMi5zaGEyNTZzdW1dID0gIjU3MTU3NWFhMzc0OWZhNjIxNjc1N2RkNDdkMmEz
ZTdlZjM2MGYzMjlhNDBmMDY2NmE5ZmJkMTQ4ODkwMjQ5NTIiCiBTUkNfVVJJW3F1b3RlLTEuMC40
Ni5zaGEyNTZzdW1dID0gImRmYmM0NTdkMGM3YTA3NTlhNjE0NTUxYjExYTY0MDllNTk1MWY2Yzc1
MzdiZTFmMWI3NjgyYjlhZTkyMzAzNjgiCiBTUkNfVVJJW3ItZWZpLTUuMy4wLnNoYTI1NnN1bV0g
PSAiNjljZGIzNGMxNThjZWIyODhkZjExZTE4YjRiZDM5ZGU5OTRmNjY1N2Q4Mzg0N2JkZmZkYmQ3
ZjM0Njc1NGIwZiIKIFNSQ19VUklbcmFuZC0wLjkuNC5zaGEyNTZzdW1dID0gIjQ0YzVhZjA2YmIx
YjdkMzIxNmQ5MTkzMmFlZDUyNjUxNjRiZjM4NGRjODljZDZiYTA1Y2Y1OWEzNWY1Zjc2ZWEiCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNp
c182LjE2NS4yLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90
aGVzaXNfNi4xNjUuMTAuYmIKc2ltaWxhcml0eSBpbmRleCA5MiUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4xNjUuMi5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4x
NjUuMTAuYmIKaW5kZXggMDc3NjUxOWExMC4uY2NiNmM2Y2Y4ZiAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4xNjUuMi5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjE2NS4x
MC5iYgpAQCAtMTcsNyArMTcsNyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGZpbGU6Ly90ZXN0X3Js
ZS5weSBcCiAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjgwYTFhZGY1MjNhYzc5MmI0
NjA2NGY0MjViMTEyY2U2YzA4YTdhOGY1MGU2NWQwOGUwMjlkZTZhYTExZGY5NSIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICI2OGI0NWUwOTgzNGNkODA1MjNjYjFlYjI3NDQ2MzA3M2M3YTlhZjRlNGVm
N2NmZjM0ZDk2MTVmMzU1NTcyZDMyIgogCiBSREVQRU5EUzoke1BOfSArPSAiIFwKICAgICBweXRo
b24zLWF0dHJzIFwKLS0gCjIuNDcuMQoK

--===============8232951644633366580==--

