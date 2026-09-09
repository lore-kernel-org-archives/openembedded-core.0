Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D89F7C79FBC
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 05:42:35 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5177.1788932547358191397
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2026 22:42:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=A8BOgoSe;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=y3r9aDRb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101a084b05fd5-2b5a9c47-a23c-4d6d-a65d-cbdbe8f07450-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1788932546;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DV3duo2fTtMXzfZ9Uzl+et3VycXwKo1BTNqy18SvwVw=;
	b=A8BOgoSe67ZYD+QDw8vmN/mjLGEG1QlTmFHnrYdU4hxVT0w9647oz0YicCpPO5uq
	lmX77SMVE1epSHMKTYaPUqd2MzzrE9Nt7wsmV2bHKj1gHdhUiLyUnYAFhn3Cz4EEhKA
	xwe/XNLR9yLAurNU5IwAK86amdksDUEJiLXOk5yI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1788932546;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DV3duo2fTtMXzfZ9Uzl+et3VycXwKo1BTNqy18SvwVw=;
	b=y3r9aDRbOM/prV4vMjoG8EV8CZ4D/TNZp19Kx+3GBVtslITtHKL0y/YVdGYM+Tmh
	qnRWVRcCTqzWKR73J1J6V2R7tbPdyM8RvyTP22nIMqFDjbOhDt7R6HHMufGPBbbsWfv
	aicX5fpYGusLJqNhQqAkrkcIhY2pd6sF54pFONTE=
Content-Type: multipart/mixed; boundary="===============4668067885089203669=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.168.0 SUCCEEDED
Message-ID: <010101a084b05fd5-2b5a9c47-a23c-4d6d-a65d-cbdbe8f07450-000000@us-west-2.amazonses.com>
Date: Wed, 9 Sep 2026 05:42:26 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.09-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 05:42:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245396

--===============4668067885089203669==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hypothesis* to *6.168.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.167.0-6.168.0.patch
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
From a304f5be9e3f859d44e5e93dfb71cb81582ef652 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 9 Sep 2026 05:17:20 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.167.0 -> 6.168.0

---
 ...hon3-hypothesis_6.167.0.bb => python3-hypothesis_6.168.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.167.0.bb => python3-hypothesis_6.168.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.167.0.bb b/meta/recipes-devtools/python/python3-hypothesis_6.168.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.167.0.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.168.0.bb
index 075a6edca4..ec75251e70 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.167.0.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.168.0.bb
@@ -16,7 +16,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "23a60707a2bc5e0c59ef95e94264c4e8fd1c54b4ca1b95cbde74fb68b9c2eeef"
+SRC_URI[sha256sum] = "72af51087b7b5ab21c49f0d502f803c20897678652835596bd2a8b169a39135e"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.47.1


--===============4668067885089203669==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.167.0-6.168.0.patch"

RnJvbSBhMzA0ZjViZTllM2Y4NTlkNDRlNWU5M2RmYjcxY2I4MTU4MmVmNjUyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgOSBTZXAgMjAyNiAwNToxNzoyMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaHlwb3RoZXNpczogdXBncmFkZSA2LjE2Ny4wIC0+IDYuMTY4LjAKCi0tLQogLi4uaG9u
My1oeXBvdGhlc2lzXzYuMTY3LjAuYmIgPT4gcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTY4LjAuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1oeXBvdGhlc2lzXzYu
MTY3LjAuYmIgPT4gcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTY4LjAuYmJ9ICg5MSUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4x
NjcuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lz
XzYuMTY4LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4xNjcuMC5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4xNjguMC5i
YgppbmRleCAwNzVhNmVkY2E0Li5lYzc1MjUxZTcwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjE2Ny4wLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTY4LjAuYmIKQEAg
LTE2LDcgKzE2LDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBmaWxlOi8vdGVzdF9ybGUucHkgXAog
ICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjIzYTYwNzA3YTJiYzVlMGM1OWVmOTVlOTQy
NjRjNGU4ZmQxYzU0YjRjYTFiOTVjYmRlNzRmYjY4YjljMmVlZWYiCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiNzJhZjUxMDg3YjdiNWFiMjFjNDlmMGQ1MDJmODAzYzIwODk3Njc4NjUyODM1NTk2YmQy
YThiMTY5YTM5MTM1ZSIKIAogUkRFUEVORFM6JHtQTn0gKz0gIiBcCiAgICAgcHl0aG9uMy1hdHRy
cyBcCi0tIAoyLjQ3LjEKCg==

--===============4668067885089203669==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.167.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/hypothesis-6.168.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.167.0.dist-info -> /usr/lib/python3.14/site-packages/hypothesis-6.168.0.dist-info, added "/usr/lib/python3.14/site-packages/hypothesis/vendor/leap-seconds.txt"
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.14/site-packages/hypothesis-6.167.0.dist-info moved to /usr/lib/python3.14/site-packages/hypothesis-6.168.0.dist-info
  /usr/lib/python3.14/site-packages/hypothesis/vendor/leap-seconds.txt was added

--===============4668067885089203669==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.167.0.tar.gz crate://crates.io/cfg-if/1.0.4 crate://crates.io/crunchy/0.2.4 crate://crates.io/getrandom/0.3.4 crate://crates.io/half/2.7.1 crate://crates.io/heck/0.5.0 crate://crates.io/libc/0.2.186 crate://crates.io/once_cell/1.21.4 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/ppv-lite86/0.2.21 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/pyo3/0.29.2 crate://crates.io/pyo3-build-config/0.29.2 crate://crates.io/pyo3-ffi/0.29.2 crate://crates.io/pyo3-macros/0.29.2 crate://crates.io/pyo3-macros-backend/0.29.2 crate://crates.io/quote/1.0.46 crate://crates.io/r-efi/5.3.0 crate://crates.io/rand/0.9.4 crate://crates.io/rand_chacha/0.9.0 crate://crates.io/rand_core/0.9.5 crate://crates.io/syn/2.0.118 crate://crates.io/target-lexicon/0.13.5 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/wasip2/1.0.4+wasi-0.2.12 cra
 te://crates.io/wit-bindgen/0.57.1 crate://crates.io/zerocopy/0.8.53 crate://crates.io/zerocopy-derive/0.8.53 file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.168.0.tar.gz crate://crates.io/cfg-if/1.0.4 crate://crates.io/crunchy/0.2.4 crate://crates.io/getrandom/0.3.4 crate://crates.io/half/2.7.1 crate://crates.io/heck/0.5.0 crate://crates.io/libc/0.2.186 crate://crates.io/once_cell/1.21.4 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/ppv-lite86/0.2.21 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/pyo3/0.29.2 crate://crates.io/pyo3-build-config/0.29.2 crate://crates.io/pyo3-ffi/0.29.2 crate://crates.io/pyo3-macros/0.29.2 crate://crates.io/pyo3-macros-backend/0.29.2 crate://crates.io/quote/1.0.46 crate://crates.io/r-efi/5.3.0 crate://crates.io/rand/0.9.4 crate://crates.io/rand_chacha/0.9.0 crate://crates.io/rand_core/0.9.5 crate://crates.io/syn/2.0.118 crate://crates.io/target-lexicon/0
 .13.5 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/wasip2/1.0.4+wasi-0.2.12 crate://crates.io/wit-bindgen/0.57.1 crate://crates.io/zerocopy/0.8.53 crate://crates.io/zerocopy-derive/0.8.53 file://test_binary_search.py file://test_rle.py"
packages/x86-64-v3-poky-linux/python3-hypothesis: PKGV changed from 6.167.0 [default] to 6.168.0 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis: PV changed from "6.167.0" to "6.168.0"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.167.0 [default] to 6.168.0 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.167.0" to "6.168.0"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.167.0 [default] to 6.168.0 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.167.0" to "6.168.0"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.167.0 [default] to 6.168.0 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.167.0" to "6.168.0"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.167.0 [default] to 6.168.0 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.167.0" to "6.168.0"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.167.0 [default] to 6.168.0 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.167.0" to "6.168.0"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.167.0 [default] to 6.168.0 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.167.0" to "6.168.0"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.167.0 [default] to 6.168.0 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.167.0" to "6.168.0"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 4549224 to 4582540 (+1%)
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.167.0 [default] to 6.168.0 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.167.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/hypothesis-6.168.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.167.0.dist-info -> /usr/lib/python3.14/site-packages/hypothesis-6.168.0.dist-info, added "/usr/lib/python3.14/site-packages/hypothesis/vendor/leap-seconds.txt"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.167.0" to "6.168.0"
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.14/site-packages/hypothesis-6.167.0.dist-info moved to /usr/lib/python3.14/site-packages/hypothesis-6.168.0.dist-info
  /usr/lib/python3.14/site-packages/hypothesis/vendor/leap-seconds.txt was added

--===============4668067885089203669==--

