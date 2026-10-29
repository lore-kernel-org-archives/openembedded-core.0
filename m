Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5564.1793252421059949429
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 22:40:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=G0Q8ivAR;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=YzZuyjmf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a1862c69d4-50c0eb86-4f30-495c-b660-5db4b5eaa057-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793252420;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=s+PA/ivyYzOp0PW/XUB4PJsLBbckeCcDGYO0/f4px0Q=;
	b=G0Q8ivAR43RU08Ug944HEfHrFtezqhianTD+2zd7RbwX6DKgBqUoXanOIz2bb+7A
	nN35eUmjSI3ZgmzpBLl9soiknSeWtWxMPVnxrlt7pwsiP25lryHBYGftzigcTdi73zr
	c7kE5ZOzh59P9Bx1b6052Bd4IdmtHcD8zJdeSXrU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793252420;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=s+PA/ivyYzOp0PW/XUB4PJsLBbckeCcDGYO0/f4px0Q=;
	b=YzZuyjmfQap/5q5g0iIo8OEBKAUerTB+f/OHWwBk70T2t0qn/toTvCA3vMmqSIu3
	io9/b6fmJ88E0+dBxL9CGFYbK8gXe45PyjHY5iB5s//+4teWd0OBFwhh0deGlncEKAu
	LoO2PQYUD5LFOz00bX22x0zRANpv0FMlHkbLlc6Y=
Content-Type: multipart/mixed; boundary="===============8718818951643275808=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.170.13 SUCCEEDED
Message-ID: <010101a1862c69d4-50c0eb86-4f30-495c-b660-5db4b5eaa057-000000@us-west-2.amazonses.com>
Date: Thu, 29 Oct 2026 05:40:20 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.29-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 05:40:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248893

--===============8718818951643275808==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hypothesis* to *6.170.13* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.170.8-6.170.13.patch
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
From dd2a157e357c41d8ff85fcf5436f8422b143c48a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 29 Oct 2026 05:26:57 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.170.8 -> 6.170.13

---
 ...on3-hypothesis_6.170.8.bb => python3-hypothesis_6.170.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.170.8.bb => python3-hypothesis_6.170.13.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.170.8.bb b/meta/recipes-devtools/python/python3-hypothesis_6.170.13.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.170.8.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.170.13.bb
index e40ed0d9dd..caaa869d07 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.170.8.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.170.13.bb
@@ -16,7 +16,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "dfc56ceac35d825fb6a85fa3ac36a598fee3101d264a39895a62f78c1cc95521"
+SRC_URI[sha256sum] = "1c8a34368f7298796e5a6502d33ffda9c4944158cf484dd575dd0cabc1eccd8c"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.47.1


--===============8718818951643275808==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.170.8.tar.gz crate://crates.io/cfg-if/1.0.4 crate://crates.io/crunchy/0.2.4 crate://crates.io/getrandom/0.3.4 crate://crates.io/half/2.7.1 crate://crates.io/heck/0.5.0 crate://crates.io/libc/0.2.186 crate://crates.io/once_cell/1.21.4 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/ppv-lite86/0.2.21 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/pyo3/0.30.1 crate://crates.io/pyo3-build-config/0.30.1 crate://crates.io/pyo3-ffi/0.30.1 crate://crates.io/pyo3-macros/0.30.1 crate://crates.io/pyo3-macros-backend/0.30.1 crate://crates.io/quote/1.0.46 crate://crates.io/r-efi/5.3.0 crate://crates.io/rand/0.9.4 crate://crates.io/rand_chacha/0.9.0 crate://crates.io/rand_core/0.9.5 crate://crates.io/syn/2.0.118 crate://crates.io/syn/3.0.9 crate://crates.io/target-lexicon/0.13.5 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/
 wasip2/1.0.4+wasi-0.2.12 crate://crates.io/wit-bindgen/0.57.1 crate://crates.io/zerocopy/0.8.53 crate://crates.io/zerocopy-derive/0.8.53 file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.170.13.tar.gz crate://crates.io/cfg-if/1.0.4 crate://crates.io/crunchy/0.2.4 crate://crates.io/getrandom/0.3.4 crate://crates.io/half/2.7.1 crate://crates.io/heck/0.5.0 crate://crates.io/libc/0.2.186 crate://crates.io/once_cell/1.21.4 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/ppv-lite86/0.2.21 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/pyo3/0.30.1 crate://crates.io/pyo3-build-config/0.30.1 crate://crates.io/pyo3-ffi/0.30.1 crate://crates.io/pyo3-macros/0.30.1 crate://crates.io/pyo3-macros-backend/0.30.1 crate://crates.io/quote/1.0.46 crate://crates.io/r-efi/5.3.0 crate://crates.io/rand/0.9.4 crate://crates.io/rand_chacha/0.9.0 crate://crates.io/rand_core/0.9.5 crate://crates.io/syn/2.0.118 crate
 ://crates.io/syn/3.0.9 crate://crates.io/target-lexicon/0.13.5 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/wasip2/1.0.4+wasi-0.2.12 crate://crates.io/wit-bindgen/0.57.1 crate://crates.io/zerocopy/0.8.53 crate://crates.io/zerocopy-derive/0.8.53 file://test_binary_search.py file://test_rle.py"
packages/x86-64-v3-poky-linux/python3-hypothesis: PV changed from "6.170.8" to "6.170.13"
packages/x86-64-v3-poky-linux/python3-hypothesis: PKGV changed from 6.170.8 [default] to 6.170.13 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.170.8" to "6.170.13"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.170.8 [default] to 6.170.13 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.170.8" to "6.170.13"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.170.8 [default] to 6.170.13 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.170.8" to "6.170.13"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.170.8 [default] to 6.170.13 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.170.8" to "6.170.13"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.170.8 [default] to 6.170.13 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.170.8" to "6.170.13"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.170.8 [default] to 6.170.13 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.170.8" to "6.170.13"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.170.8 [default] to 6.170.13 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.170.8" to "6.170.13"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.170.8 [default] to 6.170.13 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.170.8" to "6.170.13"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.170.8 [default] to 6.170.13 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 4641133 to 4664351 (+1%)
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.170.8.dist-info -> /usr/lib/python3.14/site-packages/hypothesis-6.170.13.dist-info, directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.170.8.dist-info/licenses -> /usr/lib/python3.14/site-packages/hypothesis-6.170.13.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.14/site-packages/hypothesis-6.170.13.dist-info was added
  /usr/lib/python3.14/site-packages/hypothesis-6.170.13.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/hypothesis-6.170.13.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/hypothesis-6.170.13.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/hypothesis-6.170.13.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/hypothesis-6.170.13.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/hypothesis-6.170.8.dist-info was removed
  /usr/lib/python3.14/site-packages/hypothesis-6.170.8.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/hypothesis-6.170.8.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/hypothesis-6.170.8.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/hypothesis-6.170.8.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/hypothesis-6.170.8.dist-info/WHEEL was removed

--===============8718818951643275808==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.170.8.dist-info/licenses -> /usr/lib/python3.14/site-packages/hypothesis-6.170.13.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.170.8.dist-info -> /usr/lib/python3.14/site-packages/hypothesis-6.170.13.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.14/site-packages/hypothesis-6.170.13.dist-info was added
  /usr/lib/python3.14/site-packages/hypothesis-6.170.13.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/hypothesis-6.170.13.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/hypothesis-6.170.13.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/hypothesis-6.170.13.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/hypothesis-6.170.13.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/hypothesis-6.170.8.dist-info was removed
  /usr/lib/python3.14/site-packages/hypothesis-6.170.8.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/hypothesis-6.170.8.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/hypothesis-6.170.8.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/hypothesis-6.170.8.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/hypothesis-6.170.8.dist-info/WHEEL was removed

--===============8718818951643275808==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.170.8-6.170.13.patch"

RnJvbSBkZDJhMTU3ZTM1N2M0MWQ4ZmY4NWZjZjU0MzZmODQyMmIxNDNjNDhhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMjkgT2N0IDIwMjYgMDU6MjY6NTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWh5cG90aGVzaXM6IHVwZ3JhZGUgNi4xNzAuOCAtPiA2LjE3MC4xMwoKLS0tCiAuLi5v
bjMtaHlwb3RoZXNpc182LjE3MC44LmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjE3MC4xMy5i
Yn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWh5cG90aGVzaXNf
Ni4xNzAuOC5iYiA9PiBweXRob24zLWh5cG90aGVzaXNfNi4xNzAuMTMuYmJ9ICg5MSUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNf
Ni4xNzAuOC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhl
c2lzXzYuMTcwLjEzLmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTcwLjguYmIKcmVuYW1l
IHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTcw
LjEzLmJiCmluZGV4IGU0MGVkMGQ5ZGQuLmNhYWE4NjlkMDcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTcwLjguYmIKKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4xNzAuMTMu
YmIKQEAgLTE2LDcgKzE2LDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBmaWxlOi8vdGVzdF9ybGUu
cHkgXAogICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImRmYzU2Y2VhYzM1ZDgyNWZiNmE4
NWZhM2FjMzZhNTk4ZmVlMzEwMWQyNjRhMzk4OTVhNjJmNzhjMWNjOTU1MjEiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiMWM4YTM0MzY4ZjcyOTg3OTZlNWE2NTAyZDMzZmZkYTljNDk0NDE1OGNmNDg0
ZGQ1NzVkZDBjYWJjMWVjY2Q4YyIKIAogUkRFUEVORFM6JHtQTn0gKz0gIiBcCiAgICAgcHl0aG9u
My1hdHRycyBcCi0tIAoyLjQ3LjEKCg==

--===============8718818951643275808==--
