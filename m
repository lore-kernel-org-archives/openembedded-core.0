Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1243.1795158387524757655
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 23:06:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=BNPLIkgs;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=DALq6LKm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a1f7c727aa-c97d8c5d-d3dd-4702-9f53-0b89731604cb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1795158386;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Pv6PAG2Y/VYUkefcIOJzacwCRltoozYaazeHUhH4Wu8=;
	b=BNPLIkgsrXZl4ptcFHKNdsyLGU/QvVsIIgbN0ofrXodqoiclV4xpzI1AB69wjtpo
	14TZ+AN0HvuvAyUh7DlzN9p7bkTQjEMfxkmm7cySpA/cI3jEeFTPt30FS01K9hr9sgM
	7HDfP2yFzOsLeMZ8yHgSuC83CfKfw3+Pl78DoaXk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1795158386;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Pv6PAG2Y/VYUkefcIOJzacwCRltoozYaazeHUhH4Wu8=;
	b=DALq6LKmRgnGEWpkO03Q7o98/s2889zDEgnmjOaS3E8RUPQSAVxzcPdl3evWD/ia
	FXRnQmoQbZ2g4/A+V8bYznL8XCnu/9Xd8Ih61P2LkY+TAagJGitrq1Mgftp4AaVYeCX
	GLAtEWhAr1Xz/zcSJmJg/ouDKY227m9pZfjEz1k0=
Content-Type: multipart/mixed; boundary="===============7174617727066275953=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.170.16 SUCCEEDED
Message-ID: <010101a1f7c727aa-c97d8c5d-d3dd-4702-9f53-0b89731604cb-000000@us-west-2.amazonses.com>
Date: Fri, 20 Nov 2026 07:06:26 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.20-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 07:06:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250729

--===============7174617727066275953==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hypothesis* to *6.170.16* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.170.12-6.170.16.patch
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
From 25113abf40c9212e4ad82f6c50ca784839e327b4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 20 Nov 2026 05:54:22 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.170.12 -> 6.170.16

---
 ...n3-hypothesis_6.170.12.bb => python3-hypothesis_6.170.16.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.170.12.bb => python3-hypothesis_6.170.16.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.170.12.bb b/meta/recipes-devtools/python/python3-hypothesis_6.170.16.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.170.12.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.170.16.bb
index 564b1d1845..d6f9a8ae48 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.170.12.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.170.16.bb
@@ -16,7 +16,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "92b353d21a010b50b638c730ce67cb631ca78a369b146bcc28b3488f83136e35"
+SRC_URI[sha256sum] = "74fd937971ae3099a30028ca25a647b14f4bd9066bab62a6f10bd439bab0d871"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.47.1


--===============7174617727066275953==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis: PKGV changed from 6.170.12 [default] to 6.170.16 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.170.12.tar.gz crate://crates.io/cfg-if/1.0.4 crate://crates.io/crunchy/0.2.4 crate://crates.io/getrandom/0.3.4 crate://crates.io/half/2.7.1 crate://crates.io/heck/0.5.0 crate://crates.io/libc/0.2.186 crate://crates.io/once_cell/1.21.4 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/ppv-lite86/0.2.21 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/pyo3/0.30.1 crate://crates.io/pyo3-build-config/0.30.1 crate://crates.io/pyo3-ffi/0.30.1 crate://crates.io/pyo3-macros/0.30.1 crate://crates.io/pyo3-macros-backend/0.30.1 crate://crates.io/quote/1.0.46 crate://crates.io/r-efi/5.3.0 crate://crates.io/rand/0.9.4 crate://crates.io/rand_chacha/0.9.0 crate://crates.io/rand_core/0.9.5 crate://crates.io/syn/2.0.118 crate://crates.io/syn/3.0.9 crate://crates.io/target-lexicon/0.13.5 crate://crates.io/unicode-ident/1.0.24 crate://crates.io
 /wasip2/1.0.4+wasi-0.2.12 crate://crates.io/wit-bindgen/0.57.1 crate://crates.io/zerocopy/0.8.53 crate://crates.io/zerocopy-derive/0.8.53 file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.170.16.tar.gz crate://crates.io/cfg-if/1.0.4 crate://crates.io/crunchy/0.2.4 crate://crates.io/getrandom/0.3.4 crate://crates.io/half/2.7.1 crate://crates.io/heck/0.5.0 crate://crates.io/libc/0.2.186 crate://crates.io/once_cell/1.21.4 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/ppv-lite86/0.2.21 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/pyo3/0.30.1 crate://crates.io/pyo3-build-config/0.30.1 crate://crates.io/pyo3-ffi/0.30.1 crate://crates.io/pyo3-macros/0.30.1 crate://crates.io/pyo3-macros-backend/0.30.1 crate://crates.io/quote/1.0.46 crate://crates.io/r-efi/5.3.0 crate://crates.io/rand/0.9.4 crate://crates.io/rand_chacha/0.9.0 crate://crates.io/rand_core/0.9.5 crate://crates.io/syn/2.0.118 crat
 e://crates.io/syn/3.0.9 crate://crates.io/target-lexicon/0.13.5 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/wasip2/1.0.4+wasi-0.2.12 crate://crates.io/wit-bindgen/0.57.1 crate://crates.io/zerocopy/0.8.53 crate://crates.io/zerocopy-derive/0.8.53 file://test_binary_search.py file://test_rle.py"
packages/x86-64-v3-poky-linux/python3-hypothesis: PV changed from "6.170.12" to "6.170.16"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.170.12 [default] to 6.170.16 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.170.12" to "6.170.16"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.170.12 [default] to 6.170.16 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.170.12" to "6.170.16"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.170.12 [default] to 6.170.16 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.170.12" to "6.170.16"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.170.12 [default] to 6.170.16 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.170.12" to "6.170.16"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.170.12 [default] to 6.170.16 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.170.12" to "6.170.16"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.170.12 [default] to 6.170.16 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.170.12" to "6.170.16"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.170.12 [default] to 6.170.16 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.170.12" to "6.170.16"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 4715332 to 4725632 (+0%)
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.170.12 [default] to 6.170.16 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.15/site-packages/hypothesis-6.170.12.dist-info -> /usr/lib/python3.15/site-packages/hypothesis-6.170.16.dist-info, directory renamed /usr/lib/python3.15/site-packages/hypothesis-6.170.12.dist-info/licenses -> /usr/lib/python3.15/site-packages/hypothesis-6.170.16.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.170.12" to "6.170.16"
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.15/site-packages/hypothesis-6.170.12.dist-info moved to /usr/lib/python3.15/site-packages/hypothesis-6.170.16.dist-info

--===============7174617727066275953==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.15/site-packages/hypothesis-6.170.12.dist-info -> /usr/lib/python3.15/site-packages/hypothesis-6.170.16.dist-info, directory renamed /usr/lib/python3.15/site-packages/hypothesis-6.170.12.dist-info/licenses -> /usr/lib/python3.15/site-packages/hypothesis-6.170.16.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.15/site-packages/hypothesis-6.170.12.dist-info moved to /usr/lib/python3.15/site-packages/hypothesis-6.170.16.dist-info

--===============7174617727066275953==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.170.12-6.170.16.patch"

RnJvbSAyNTExM2FiZjQwYzkyMTJlNGFkODJmNmM1MGNhNzg0ODM5ZTMyN2I0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMjAgTm92IDIwMjYgMDU6NTQ6MjIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWh5cG90aGVzaXM6IHVwZ3JhZGUgNi4xNzAuMTIgLT4gNi4xNzAuMTYKCi0tLQogLi4u
bjMtaHlwb3RoZXNpc182LjE3MC4xMi5iYiA9PiBweXRob24zLWh5cG90aGVzaXNfNi4xNzAuMTYu
YmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1oeXBvdGhlc2lz
XzYuMTcwLjEyLmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjE3MC4xNi5iYn0gKDkxJSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNp
c182LjE3MC4xMi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBv
dGhlc2lzXzYuMTcwLjE2LmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTcwLjEyLmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182
LjE3MC4xNi5iYgppbmRleCA1NjRiMWQxODQ1Li5kNmY5YThhZTQ4IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjE3MC4xMi5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjE3
MC4xNi5iYgpAQCAtMTYsNyArMTYsNyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGZpbGU6Ly90ZXN0
X3JsZS5weSBcCiAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOTJiMzUzZDIxYTAxMGI1
MGI2MzhjNzMwY2U2N2NiNjMxY2E3OGEzNjliMTQ2YmNjMjhiMzQ4OGY4MzEzNmUzNSIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICI3NGZkOTM3OTcxYWUzMDk5YTMwMDI4Y2EyNWE2NDdiMTRmNGJkOTA2
NmJhYjYyYTZmMTBiZDQzOWJhYjBkODcxIgogCiBSREVQRU5EUzoke1BOfSArPSAiIFwKICAgICBw
eXRob24zLWF0dHJzIFwKLS0gCjIuNDcuMQoK

--===============7174617727066275953==--
