Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1942.1792480403302000170
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 00:13:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=LXRBYHJZ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=n0AovZzT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a158285bd6-9e1475d8-2a96-4345-931a-ad180bce2632-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792480402;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CRGxLVHh1gbWk6xnrdkRFo9L1rnZLhj27o/4yJrcuAo=;
	b=LXRBYHJZTQvRk47dwzjAu79xvA96qbWynxlo9yRG9RzvrALf1aQus33+x7taqVaC
	CpyElUr7zGqB9Rzw258HvJAxzliBg2557/JlysbvJQFWzeNhX4RkL2NAdmMKgtLPkeV
	+BjkLDj29hZ1MpBof2CERNwPCly5KQVhE+2RhEmc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792480402;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CRGxLVHh1gbWk6xnrdkRFo9L1rnZLhj27o/4yJrcuAo=;
	b=n0AovZzTEMbwqGzo9alDMhuyBEo9NffsQkxlIuSokcZJJHbktTyOiq7DL5veV7v1
	KVRbPSzHTbPKtdpXUkMmc9QOjpJl1zzhap3Zj8pFOB/F8axBvOBUWzTEYyAw9uhrTU2
	HNqbxSjyPv3S5Qk4+udH+ZZL7pOT5LtbuM78XdV0=
Content-Type: multipart/mixed; boundary="===============7568321064836929937=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.170.5 SUCCEEDED
Message-ID: <010101a158285bd6-9e1475d8-2a96-4345-931a-ad180bce2632-000000@us-west-2.amazonses.com>
Date: Tue, 20 Oct 2026 07:13:22 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.20-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 07:13:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248227

--===============7568321064836929937==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hypothesis* to *6.170.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.169.0-6.170.5.patch
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
From 5d24f8a87aa970fd07b7b18c1f2afe41221dc54a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 20 Oct 2026 06:21:10 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.169.0 -> 6.170.5

---
 ...hon3-hypothesis_6.169.0.bb => python3-hypothesis_6.170.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.169.0.bb => python3-hypothesis_6.170.5.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.169.0.bb b/meta/recipes-devtools/python/python3-hypothesis_6.170.5.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.169.0.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.170.5.bb
index 0e7d97705c..1047380d80 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.169.0.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.170.5.bb
@@ -16,7 +16,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "b65749d7f7a2fddfb106bb57c9902db4ab25ce8724c821f4af50cc58891a6b7b"
+SRC_URI[sha256sum] = "b147f57c7903bda934d9f6ee6df462006e0c70a69b25a55e99663671666b249d"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.47.1


--===============7568321064836929937==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis: PKGV changed from 6.169.0 [default] to 6.170.5 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis: PV changed from "6.169.0" to "6.170.5"
packages/x86-64-v3-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.169.0.tar.gz crate://crates.io/cfg-if/1.0.4 crate://crates.io/crunchy/0.2.4 crate://crates.io/getrandom/0.3.4 crate://crates.io/half/2.7.1 crate://crates.io/heck/0.5.0 crate://crates.io/libc/0.2.186 crate://crates.io/once_cell/1.21.4 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/ppv-lite86/0.2.21 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/pyo3/0.29.3 crate://crates.io/pyo3-build-config/0.29.3 crate://crates.io/pyo3-ffi/0.29.3 crate://crates.io/pyo3-macros/0.29.3 crate://crates.io/pyo3-macros-backend/0.29.3 crate://crates.io/quote/1.0.46 crate://crates.io/r-efi/5.3.0 crate://crates.io/rand/0.9.4 crate://crates.io/rand_chacha/0.9.0 crate://crates.io/rand_core/0.9.5 crate://crates.io/syn/2.0.118 crate://crates.io/target-lexicon/0.13.5 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/wasip2/1.0.4+wasi-0.2.12 cra
 te://crates.io/wit-bindgen/0.57.1 crate://crates.io/zerocopy/0.8.53 crate://crates.io/zerocopy-derive/0.8.53 file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.170.5.tar.gz crate://crates.io/cfg-if/1.0.4 crate://crates.io/crunchy/0.2.4 crate://crates.io/getrandom/0.3.4 crate://crates.io/half/2.7.1 crate://crates.io/heck/0.5.0 crate://crates.io/libc/0.2.186 crate://crates.io/once_cell/1.21.4 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/ppv-lite86/0.2.21 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/pyo3/0.29.3 crate://crates.io/pyo3-build-config/0.29.3 crate://crates.io/pyo3-ffi/0.29.3 crate://crates.io/pyo3-macros/0.29.3 crate://crates.io/pyo3-macros-backend/0.29.3 crate://crates.io/quote/1.0.46 crate://crates.io/r-efi/5.3.0 crate://crates.io/rand/0.9.4 crate://crates.io/rand_chacha/0.9.0 crate://crates.io/rand_core/0.9.5 crate://crates.io/syn/2.0.118 crate://crates.io/target-lexicon/0
 .13.5 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/wasip2/1.0.4+wasi-0.2.12 crate://crates.io/wit-bindgen/0.57.1 crate://crates.io/zerocopy/0.8.53 crate://crates.io/zerocopy-derive/0.8.53 file://test_binary_search.py file://test_rle.py"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.169.0" to "6.170.5"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.169.0 [default] to 6.170.5 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.169.0" to "6.170.5"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.169.0 [default] to 6.170.5 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.169.0" to "6.170.5"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.169.0 [default] to 6.170.5 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.169.0" to "6.170.5"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.169.0 [default] to 6.170.5 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.169.0" to "6.170.5"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.169.0 [default] to 6.170.5 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.169.0" to "6.170.5"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.169.0 [default] to 6.170.5 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.169.0" to "6.170.5"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.169.0 [default] to 6.170.5 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.169.0" to "6.170.5"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.169.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/hypothesis-6.170.5.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.169.0.dist-info -> /usr/lib/python3.14/site-packages/hypothesis-6.170.5.dist-info
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 4566319 to 4626284 (+1%)
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.169.0 [default] to 6.170.5 [default]
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.14/site-packages/hypothesis-6.169.0.dist-info moved to /usr/lib/python3.14/site-packages/hypothesis-6.170.5.dist-info

--===============7568321064836929937==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.169.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/hypothesis-6.170.5.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.169.0.dist-info -> /usr/lib/python3.14/site-packages/hypothesis-6.170.5.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.14/site-packages/hypothesis-6.169.0.dist-info moved to /usr/lib/python3.14/site-packages/hypothesis-6.170.5.dist-info

--===============7568321064836929937==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.169.0-6.170.5.patch"

RnJvbSA1ZDI0ZjhhODdhYTk3MGZkMDdiN2IxOGMxZjJhZmU0MTIyMWRjNTRhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMjAgT2N0IDIwMjYgMDY6MjE6MTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWh5cG90aGVzaXM6IHVwZ3JhZGUgNi4xNjkuMCAtPiA2LjE3MC41CgotLS0KIC4uLmhv
bjMtaHlwb3RoZXNpc182LjE2OS4wLmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjE3MC41LmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaHlwb3RoZXNpc182
LjE2OS4wLmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjE3MC41LmJifSAoOTElKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYu
MTY5LjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNp
c182LjE3MC41LmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTY5LjAuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTcwLjUu
YmIKaW5kZXggMGU3ZDk3NzA1Yy4uMTA0NzM4MGQ4MCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4xNjkuMC5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjE3MC41LmJiCkBA
IC0xNiw3ICsxNiw3IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgZmlsZTovL3Rlc3RfcmxlLnB5IFwK
ICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJiNjU3NDlkN2Y3YTJmZGRmYjEwNmJiNTdj
OTkwMmRiNGFiMjVjZTg3MjRjODIxZjRhZjUwY2M1ODg5MWE2YjdiIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gImIxNDdmNTdjNzkwM2JkYTkzNGQ5ZjZlZTZkZjQ2MjAwNmUwYzcwYTY5YjI1YTU1ZTk5
NjYzNjcxNjY2YjI0OWQiCiAKIFJERVBFTkRTOiR7UE59ICs9ICIgXAogICAgIHB5dGhvbjMtYXR0
cnMgXAotLSAKMi40Ny4xCgo=

--===============7568321064836929937==--
