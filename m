Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4631.1794032732375846867
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 22:25:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=f+2AmZHh;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=MFPyZ4LH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a1b4af0528-2080ac97-cfbc-4b97-a78d-f8a17aec3871-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794032731;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lMvuAvK+O/VKLfjFgEnxkY42DDz2384pfHCd/GpYnu8=;
	b=f+2AmZHhjyajGskENVSWB3h9xuUnnF7glhv+UnGl7CLVKyNuN0QGrZjmmt/yGGvC
	9hpXMrH9PWBtEv0AZylIa4NAJXIn4uVDBI9Naup5/GZ8PLsIF3te7YnW+PWS7mStIUE
	H6/o/Jp3h+qygGL4gKhkvnyKRs/L9j0BEOgIW2+A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794032731;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lMvuAvK+O/VKLfjFgEnxkY42DDz2384pfHCd/GpYnu8=;
	b=MFPyZ4LHLnqaccz8zcex+P/5Ov2hMJMdfeEttxtnxEusTOdarHezf4Mlkg5G9iHU
	rXtE1rv8C1BTq7qdXsiEcw950ibOFwQLHvYjPKLyC1m7F8nNIwf1vdv+PCJy/2yolwW
	lWOVt1Ko1MpGrZb6Zx4mc5LlyGiw2UiBA2T1iSiY=
Content-Type: multipart/mixed; boundary="===============6914495450891555630=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.170.15 SUCCEEDED
Message-ID: <010101a1b4af0528-2080ac97-cfbc-4b97-a78d-f8a17aec3871-000000@us-west-2.amazonses.com>
Date: Sat, 7 Nov 2026 06:25:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.07-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 07 Nov 2026 06:25:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249727

--===============6914495450891555630==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hypothesis* to *6.170.15* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.170.12-6.170.15.patch
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
From 04e3724489eee119821b9da55597aafe17373e08 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 7 Nov 2026 05:38:22 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.170.12 -> 6.170.15

---
 ...n3-hypothesis_6.170.12.bb => python3-hypothesis_6.170.15.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.170.12.bb => python3-hypothesis_6.170.15.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.170.12.bb b/meta/recipes-devtools/python/python3-hypothesis_6.170.15.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.170.12.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.170.15.bb
index 564b1d1845..f8f9f7b8a6 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.170.12.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.170.15.bb
@@ -16,7 +16,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "92b353d21a010b50b638c730ce67cb631ca78a369b146bcc28b3488f83136e35"
+SRC_URI[sha256sum] = "a4a57e5fb106ecb29cad37e22e411d957e20d933bfb9fb029e1999b1deb8a0b6"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.47.1


--===============6914495450891555630==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis: PKGV changed from 6.170.12 [default] to 6.170.15 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis: PV changed from "6.170.12" to "6.170.15"
packages/x86-64-v3-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.170.12.tar.gz crate://crates.io/cfg-if/1.0.4 crate://crates.io/crunchy/0.2.4 crate://crates.io/getrandom/0.3.4 crate://crates.io/half/2.7.1 crate://crates.io/heck/0.5.0 crate://crates.io/libc/0.2.186 crate://crates.io/once_cell/1.21.4 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/ppv-lite86/0.2.21 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/pyo3/0.30.1 crate://crates.io/pyo3-build-config/0.30.1 crate://crates.io/pyo3-ffi/0.30.1 crate://crates.io/pyo3-macros/0.30.1 crate://crates.io/pyo3-macros-backend/0.30.1 crate://crates.io/quote/1.0.46 crate://crates.io/r-efi/5.3.0 crate://crates.io/rand/0.9.4 crate://crates.io/rand_chacha/0.9.0 crate://crates.io/rand_core/0.9.5 crate://crates.io/syn/2.0.118 crate://crates.io/syn/3.0.9 crate://crates.io/target-lexicon/0.13.5 crate://crates.io/unicode-ident/1.0.24 crate://crates.io
 /wasip2/1.0.4+wasi-0.2.12 crate://crates.io/wit-bindgen/0.57.1 crate://crates.io/zerocopy/0.8.53 crate://crates.io/zerocopy-derive/0.8.53 file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.170.15.tar.gz crate://crates.io/cfg-if/1.0.4 crate://crates.io/crunchy/0.2.4 crate://crates.io/getrandom/0.3.4 crate://crates.io/half/2.7.1 crate://crates.io/heck/0.5.0 crate://crates.io/libc/0.2.186 crate://crates.io/once_cell/1.21.4 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/ppv-lite86/0.2.21 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/pyo3/0.30.1 crate://crates.io/pyo3-build-config/0.30.1 crate://crates.io/pyo3-ffi/0.30.1 crate://crates.io/pyo3-macros/0.30.1 crate://crates.io/pyo3-macros-backend/0.30.1 crate://crates.io/quote/1.0.46 crate://crates.io/r-efi/5.3.0 crate://crates.io/rand/0.9.4 crate://crates.io/rand_chacha/0.9.0 crate://crates.io/rand_core/0.9.5 crate://crates.io/syn/2.0.118 crat
 e://crates.io/syn/3.0.9 crate://crates.io/target-lexicon/0.13.5 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/wasip2/1.0.4+wasi-0.2.12 crate://crates.io/wit-bindgen/0.57.1 crate://crates.io/zerocopy/0.8.53 crate://crates.io/zerocopy-derive/0.8.53 file://test_binary_search.py file://test_rle.py"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.170.12 [default] to 6.170.15 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.170.12" to "6.170.15"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.170.12 [default] to 6.170.15 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.170.12" to "6.170.15"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.170.12 [default] to 6.170.15 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.170.12" to "6.170.15"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.170.12 [default] to 6.170.15 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.170.12" to "6.170.15"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.170.12 [default] to 6.170.15 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.170.12" to "6.170.15"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.170.12 [default] to 6.170.15 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.170.12" to "6.170.15"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.170.12 [default] to 6.170.15 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.170.12" to "6.170.15"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.170.12 [default] to 6.170.15 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.170.12.dist-info -> /usr/lib/python3.14/site-packages/hypothesis-6.170.15.dist-info, directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.170.12.dist-info/licenses -> /usr/lib/python3.14/site-packages/hypothesis-6.170.15.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.170.12" to "6.170.15"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 4664233 to 4672368 (+0%)
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.14/site-packages/hypothesis-6.170.12.dist-info moved to /usr/lib/python3.14/site-packages/hypothesis-6.170.15.dist-info

--===============6914495450891555630==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.170.12-6.170.15.patch"

RnJvbSAwNGUzNzI0NDg5ZWVlMTE5ODIxYjlkYTU1NTk3YWFmZTE3MzczZTA4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNyBOb3YgMjAyNiAwNTozODoyMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaHlwb3RoZXNpczogdXBncmFkZSA2LjE3MC4xMiAtPiA2LjE3MC4xNQoKLS0tCiAuLi5u
My1oeXBvdGhlc2lzXzYuMTcwLjEyLmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjE3MC4xNS5i
Yn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWh5cG90aGVzaXNf
Ni4xNzAuMTIuYmIgPT4gcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTcwLjE1LmJifSAoOTElKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lz
XzYuMTcwLjEyLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90
aGVzaXNfNi4xNzAuMTUuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4xNzAuMTIuYmIKcmVu
YW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYu
MTcwLjE1LmJiCmluZGV4IDU2NGIxZDE4NDUuLmY4ZjlmN2I4YTYgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTcwLjEyLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTcw
LjE1LmJiCkBAIC0xNiw3ICsxNiw3IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgZmlsZTovL3Rlc3Rf
cmxlLnB5IFwKICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI5MmIzNTNkMjFhMDEwYjUw
YjYzOGM3MzBjZTY3Y2I2MzFjYTc4YTM2OWIxNDZiY2MyOGIzNDg4ZjgzMTM2ZTM1IgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gImE0YTU3ZTVmYjEwNmVjYjI5Y2FkMzdlMjJlNDExZDk1N2UyMGQ5MzNi
ZmI5ZmIwMjllMTk5OWIxZGViOGEwYjYiCiAKIFJERVBFTkRTOiR7UE59ICs9ICIgXAogICAgIHB5
dGhvbjMtYXR0cnMgXAotLSAKMi40Ny4xCgo=

--===============6914495450891555630==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.170.12.dist-info -> /usr/lib/python3.14/site-packages/hypothesis-6.170.15.dist-info, directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.170.12.dist-info/licenses -> /usr/lib/python3.14/site-packages/hypothesis-6.170.15.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.14/site-packages/hypothesis-6.170.12.dist-info moved to /usr/lib/python3.14/site-packages/hypothesis-6.170.15.dist-info

--===============6914495450891555630==--
