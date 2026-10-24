Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1855.1792822999133895694
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 23:23:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=eL4GWOl1;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=hbk4eSgX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a16c93f4aa-6df9a5b0-4bc1-4e01-b89a-7cfad6a368a2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792822998;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gYjOacYQxpgtV+GgJYlt8VI1f+XejSpXME1AACFgWNs=;
	b=eL4GWOl1Ixyiam+8Mj/MEB0o+9iu1K89wJyg8egnbpD3jXDjfPDcFLIBbYq6+/xV
	WB3FQ/bh9AVLFlUJHiY1JAMoNOwoVprJGdm+dE5mttCHt/ycY0LaL39LW1hMVh4PZe1
	7xPjXptXJ6+zrAVa25Jk6/rBEMkUyws2sd2lp0o4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792822998;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gYjOacYQxpgtV+GgJYlt8VI1f+XejSpXME1AACFgWNs=;
	b=hbk4eSgXKEwfbAFXYVsAa/CYd7o4KVnPrWrrP1DcY1HHxvpkYJvPZsLhbMGoTsJj
	JDB3yXJD6Kbc9tK56xZ0EeH6BnSAWHU97czPLoS2Ggg9httOOmXzyBpQby84tCS7sry
	/lEzIKzNwsonVxFrumzHFo4pQFDdBOwp8+Xl0guE=
Content-Type: multipart/mixed; boundary="===============5096975071966052642=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.170.9 SUCCEEDED
Message-ID: <010101a16c93f4aa-6df9a5b0-4bc1-4e01-b89a-7cfad6a368a2-000000@us-west-2.amazonses.com>
Date: Sat, 24 Oct 2026 06:23:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.24-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 24 Oct 2026 06:23:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248578

--===============5096975071966052642==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hypothesis* to *6.170.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.169.0-6.170.9.patch
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
From 78e51f074db2a0c6562de17e1773306e75d5f157 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 24 Oct 2026 05:27:25 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.169.0 -> 6.170.9

---
 .../python/python3-hypothesis-crates.inc      | 22 ++++++++++---------
 ...169.0.bb => python3-hypothesis_6.170.9.bb} |  2 +-
 2 files changed, 13 insertions(+), 11 deletions(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.169.0.bb => python3-hypothesis_6.170.9.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis-crates.inc b/meta/recipes-devtools/python/python3-hypothesis-crates.inc
index 57a1c2c29e..8df5536301 100644
--- a/meta/recipes-devtools/python/python3-hypothesis-crates.inc
+++ b/meta/recipes-devtools/python/python3-hypothesis-crates.inc
@@ -12,17 +12,18 @@ SRC_URI += " \
     crate://crates.io/portable-atomic/1.13.1 \
     crate://crates.io/ppv-lite86/0.2.21 \
     crate://crates.io/proc-macro2/1.0.106 \
-    crate://crates.io/pyo3/0.29.3 \
-    crate://crates.io/pyo3-build-config/0.29.3 \
-    crate://crates.io/pyo3-ffi/0.29.3 \
-    crate://crates.io/pyo3-macros/0.29.3 \
-    crate://crates.io/pyo3-macros-backend/0.29.3 \
+    crate://crates.io/pyo3/0.30.1 \
+    crate://crates.io/pyo3-build-config/0.30.1 \
+    crate://crates.io/pyo3-ffi/0.30.1 \
+    crate://crates.io/pyo3-macros/0.30.1 \
+    crate://crates.io/pyo3-macros-backend/0.30.1 \
     crate://crates.io/quote/1.0.46 \
     crate://crates.io/r-efi/5.3.0 \
     crate://crates.io/rand/0.9.4 \
     crate://crates.io/rand_chacha/0.9.0 \
     crate://crates.io/rand_core/0.9.5 \
     crate://crates.io/syn/2.0.118 \
+    crate://crates.io/syn/3.0.9 \
     crate://crates.io/target-lexicon/0.13.5 \
     crate://crates.io/unicode-ident/1.0.24 \
     crate://crates.io/wasip2/1.0.4+wasi-0.2.12 \
@@ -41,17 +42,18 @@ SRC_URI[once_cell-1.21.4.sha256sum] = "9f7c3e4beb33f85d45ae3e3a1792185706c8e16d0
 SRC_URI[portable-atomic-1.13.1.sha256sum] = "c33a9471896f1c69cecef8d20cbe2f7accd12527ce60845ff44c153bb2a21b49"
 SRC_URI[ppv-lite86-0.2.21.sha256sum] = "85eae3c4ed2f50dcfe72643da4befc30deadb458a9b590d720cde2f2b1e97da9"
 SRC_URI[proc-macro2-1.0.106.sha256sum] = "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
-SRC_URI[pyo3-0.29.3.sha256sum] = "700d18fa267b73b9b521fd7e13580e2f446916f176cacee1ab63fcc8191f1655"
-SRC_URI[pyo3-build-config-0.29.3.sha256sum] = "7b3fc0c4d08f6bb10e71fe39dfb9e2f59c6eb6854e22ec8092f50c69a4499adb"
-SRC_URI[pyo3-ffi-0.29.3.sha256sum] = "dfc0b8e19df29aad7086cf977bb0c2a2f143e30567eb113e9cf72b62ca698330"
-SRC_URI[pyo3-macros-0.29.3.sha256sum] = "6100e8a4b5eba53afaa5ed078364851a0b2499c553a44c31026b929049b49dc6"
-SRC_URI[pyo3-macros-backend-0.29.3.sha256sum] = "6143877a16e82b5a727b7127ff4cd86858a24a28d745d72f43e6f227c7b1bdb3"
+SRC_URI[pyo3-0.30.1.sha256sum] = "229ca13b8a15bb0d1487b81ab975bfcd97513416499a8312011b6036e42e0de4"
+SRC_URI[pyo3-build-config-0.30.1.sha256sum] = "70130e2b6dd1ee589a8788026a429561ca5c40fa7a2fa7914c2282eddae24700"
+SRC_URI[pyo3-ffi-0.30.1.sha256sum] = "5e7ff73c555c286d212d4ce7e5fbda845a973c4f61bd5f160f5f2c3c2a04d1c4"
+SRC_URI[pyo3-macros-0.30.1.sha256sum] = "c46d2e5862c7bb8207e3b639f713dda3c499933444784154c11d013c5a691b60"
+SRC_URI[pyo3-macros-backend-0.30.1.sha256sum] = "38b89f066f2ae72a2aef52d1537ca2fcd104440ebfadee06e97aa90738a25b9b"
 SRC_URI[quote-1.0.46.sha256sum] = "dfbc457d0c7a0759a614551b11a6409e5951f6c7537be1f1b7682b9ae9230368"
 SRC_URI[r-efi-5.3.0.sha256sum] = "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
 SRC_URI[rand-0.9.4.sha256sum] = "44c5af06bb1b7d3216d91932aed5265164bf384dc89cd6ba05cf59a35f5f76ea"
 SRC_URI[rand_chacha-0.9.0.sha256sum] = "d3022b5f1df60f26e1ffddd6c66e8aa15de382ae63b3a0c1bfc0e4d3e3f325cb"
 SRC_URI[rand_core-0.9.5.sha256sum] = "76afc826de14238e6e8c374ddcc1fa19e374fd8dd986b0d2af0d02377261d83c"
 SRC_URI[syn-2.0.118.sha256sum] = "1b9ae57f904213ebb649ce6895b8a66c66f0203b9319718f69a5612a065b1422"
+SRC_URI[syn-3.0.9.sha256sum] = "d78c8dee4c7bf0e14673097256fed6142ce9d3b85a408189d07482442145823b"
 SRC_URI[target-lexicon-0.13.5.sha256sum] = "adb6935a6f5c20170eeceb1a3835a49e12e19d792f6dd344ccc76a985ca5a6ca"
 SRC_URI[unicode-ident-1.0.24.sha256sum] = "e6e4313cd5fcd3dad5cafa179702e2b244f760991f45397d14d4ebf38247da75"
 SRC_URI[wasip2-1.0.4+wasi-0.2.12.sha256sum] = "b67efb37e106e55ce722a510d6b5f9c17f083e5fc79afc2badeb12cc313d9487"
diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.169.0.bb b/meta/recipes-devtools/python/python3-hypothesis_6.170.9.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.169.0.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.170.9.bb
index 0e7d97705c..294a95618d 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.169.0.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.170.9.bb
@@ -16,7 +16,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "b65749d7f7a2fddfb106bb57c9902db4ab25ce8724c821f4af50cc58891a6b7b"
+SRC_URI[sha256sum] = "72fd7e6571aaf47439bda2292156a8b86c9afc83aa59b47e8857557576fa8be2"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.47.1


--===============5096975071966052642==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis: PV changed from "6.169.0" to "6.170.9"
packages/x86-64-v3-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.169.0.tar.gz crate://crates.io/cfg-if/1.0.4 crate://crates.io/crunchy/0.2.4 crate://crates.io/getrandom/0.3.4 crate://crates.io/half/2.7.1 crate://crates.io/heck/0.5.0 crate://crates.io/libc/0.2.186 crate://crates.io/once_cell/1.21.4 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/ppv-lite86/0.2.21 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/pyo3/0.29.3 crate://crates.io/pyo3-build-config/0.29.3 crate://crates.io/pyo3-ffi/0.29.3 crate://crates.io/pyo3-macros/0.29.3 crate://crates.io/pyo3-macros-backend/0.29.3 crate://crates.io/quote/1.0.46 crate://crates.io/r-efi/5.3.0 crate://crates.io/rand/0.9.4 crate://crates.io/rand_chacha/0.9.0 crate://crates.io/rand_core/0.9.5 crate://crates.io/syn/2.0.118 crate://crates.io/target-lexicon/0.13.5 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/wasip2/1.0.4+wasi-0.2.12 cra
 te://crates.io/wit-bindgen/0.57.1 crate://crates.io/zerocopy/0.8.53 crate://crates.io/zerocopy-derive/0.8.53 file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.170.9.tar.gz crate://crates.io/cfg-if/1.0.4 crate://crates.io/crunchy/0.2.4 crate://crates.io/getrandom/0.3.4 crate://crates.io/half/2.7.1 crate://crates.io/heck/0.5.0 crate://crates.io/libc/0.2.186 crate://crates.io/once_cell/1.21.4 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/ppv-lite86/0.2.21 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/pyo3/0.30.1 crate://crates.io/pyo3-build-config/0.30.1 crate://crates.io/pyo3-ffi/0.30.1 crate://crates.io/pyo3-macros/0.30.1 crate://crates.io/pyo3-macros-backend/0.30.1 crate://crates.io/quote/1.0.46 crate://crates.io/r-efi/5.3.0 crate://crates.io/rand/0.9.4 crate://crates.io/rand_chacha/0.9.0 crate://crates.io/rand_core/0.9.5 crate://crates.io/syn/2.0.118 crate://crates.io/syn/3.0.9 crate:
 //crates.io/target-lexicon/0.13.5 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/wasip2/1.0.4+wasi-0.2.12 crate://crates.io/wit-bindgen/0.57.1 crate://crates.io/zerocopy/0.8.53 crate://crates.io/zerocopy-derive/0.8.53 file://test_binary_search.py file://test_rle.py"
packages/x86-64-v3-poky-linux/python3-hypothesis: PKGV changed from 6.169.0 [default] to 6.170.9 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.169.0" to "6.170.9"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGSIZE changed from 118384 to 118416 (+0%)
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.169.0 [default] to 6.170.9 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.169.0" to "6.170.9"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.169.0 [default] to 6.170.9 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.169.0" to "6.170.9"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.169.0 [default] to 6.170.9 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.169.0" to "6.170.9"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.169.0 [default] to 6.170.9 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.169.0" to "6.170.9"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.169.0 [default] to 6.170.9 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.169.0" to "6.170.9"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.169.0 [default] to 6.170.9 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.169.0" to "6.170.9"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.169.0 [default] to 6.170.9 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.169.0" to "6.170.9"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 4566319 to 4641928 (+2%)
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.169.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/hypothesis-6.170.9.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.169.0.dist-info -> /usr/lib/python3.14/site-packages/hypothesis-6.170.9.dist-info
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.169.0 [default] to 6.170.9 [default]
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.14/site-packages/hypothesis-6.169.0.dist-info moved to /usr/lib/python3.14/site-packages/hypothesis-6.170.9.dist-info

--===============5096975071966052642==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.169.0-6.170.9.patch"

RnJvbSA3OGU1MWYwNzRkYjJhMGM2NTYyZGUxN2UxNzczMzA2ZTc1ZDVmMTU3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMjQgT2N0IDIwMjYgMDU6Mjc6MjUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWh5cG90aGVzaXM6IHVwZ3JhZGUgNi4xNjkuMCAtPiA2LjE3MC45CgotLS0KIC4uLi9w
eXRob24vcHl0aG9uMy1oeXBvdGhlc2lzLWNyYXRlcy5pbmMgICAgICB8IDIyICsrKysrKysrKyst
LS0tLS0tLS0KIC4uLjE2OS4wLmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjE3MC45LmJifSB8
ICAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaHlwb3RoZXNp
c182LjE2OS4wLmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjE3MC45LmJifSAoOTElKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lz
LWNyYXRlcy5pbmMgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3Ro
ZXNpcy1jcmF0ZXMuaW5jCmluZGV4IDU3YTFjMmMyOWUuLjhkZjU1MzYzMDEgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzLWNyYXRlcy5p
bmMKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXMt
Y3JhdGVzLmluYwpAQCAtMTIsMTcgKzEyLDE4IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vcG9ydGFibGUtYXRvbWljLzEuMTMuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vcHB2LWxpdGU4Ni8wLjIuMjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Byb2MtbWFjcm8y
LzEuMC4xMDYgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMvMC4yOS4zIFwKLSAgICBjcmF0
ZTovL2NyYXRlcy5pby9weW8zLWJ1aWxkLWNvbmZpZy8wLjI5LjMgXAotICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL3B5bzMtZmZpLzAuMjkuMyBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy1tYWNy
b3MvMC4yOS4zIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLW1hY3Jvcy1iYWNrZW5kLzAu
MjkuMyBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy8wLjMwLjEgXAorICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL3B5bzMtYnVpbGQtY29uZmlnLzAuMzAuMSBcCisgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vcHlvMy1mZmkvMC4zMC4xIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLW1hY3Jvcy8w
LjMwLjEgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMtbWFjcm9zLWJhY2tlbmQvMC4zMC4x
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9xdW90ZS8xLjAuNDYgXAogICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL3ItZWZpLzUuMy4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9yYW5kLzAuOS40IFwK
ICAgICBjcmF0ZTovL2NyYXRlcy5pby9yYW5kX2NoYWNoYS8wLjkuMCBcCiAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vcmFuZF9jb3JlLzAuOS41IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9zeW4vMi4w
LjExOCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc3luLzMuMC45IFwKICAgICBjcmF0ZTovL2Ny
YXRlcy5pby90YXJnZXQtbGV4aWNvbi8wLjEzLjUgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Vu
aWNvZGUtaWRlbnQvMS4wLjI0IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby93YXNpcDIvMS4wLjQr
d2FzaS0wLjIuMTIgXApAQCAtNDEsMTcgKzQyLDE4IEBAIFNSQ19VUklbb25jZV9jZWxsLTEuMjEu
NC5zaGEyNTZzdW1dID0gIjlmN2MzZTRiZWIzM2Y4NWQ0NWFlM2UzYTE3OTIxODU3MDZjOGUxNmQw
CiBTUkNfVVJJW3BvcnRhYmxlLWF0b21pYy0xLjEzLjEuc2hhMjU2c3VtXSA9ICJjMzNhOTQ3MTg5
NmYxYzY5Y2VjZWY4ZDIwY2JlMmY3YWNjZDEyNTI3Y2U2MDg0NWZmNDRjMTUzYmIyYTIxYjQ5Igog
U1JDX1VSSVtwcHYtbGl0ZTg2LTAuMi4yMS5zaGEyNTZzdW1dID0gIjg1ZWFlM2M0ZWQyZjUwZGNm
ZTcyNjQzZGE0YmVmYzMwZGVhZGI0NThhOWI1OTBkNzIwY2RlMmYyYjFlOTdkYTkiCiBTUkNfVVJJ
W3Byb2MtbWFjcm8yLTEuMC4xMDYuc2hhMjU2c3VtXSA9ICI4ZmQwMGYwYmIyZTkwZDgxZDEwNDRj
MmIzMjYxN2Y2OGZjYjlmYTNiYjc2NDBjMjNlOWM3NDhlNTNmYjMwOTM0IgotU1JDX1VSSVtweW8z
LTAuMjkuMy5zaGEyNTZzdW1dID0gIjcwMGQxOGZhMjY3YjczYjliNTIxZmQ3ZTEzNTgwZTJmNDQ2
OTE2ZjE3NmNhY2VlMWFiNjNmY2M4MTkxZjE2NTUiCi1TUkNfVVJJW3B5bzMtYnVpbGQtY29uZmln
LTAuMjkuMy5zaGEyNTZzdW1dID0gIjdiM2ZjMGM0ZDA4ZjZiYjEwZTcxZmUzOWRmYjllMmY1OWM2
ZWI2ODU0ZTIyZWM4MDkyZjUwYzY5YTQ0OTlhZGIiCi1TUkNfVVJJW3B5bzMtZmZpLTAuMjkuMy5z
aGEyNTZzdW1dID0gImRmYzBiOGUxOWRmMjlhYWQ3MDg2Y2Y5NzdiYjBjMmEyZjE0M2UzMDU2N2Vi
MTEzZTljZjcyYjYyY2E2OTgzMzAiCi1TUkNfVVJJW3B5bzMtbWFjcm9zLTAuMjkuMy5zaGEyNTZz
dW1dID0gIjYxMDBlOGE0YjVlYmE1M2FmYWE1ZWQwNzgzNjQ4NTFhMGIyNDk5YzU1M2E0NGMzMTAy
NmI5MjkwNDliNDlkYzYiCi1TUkNfVVJJW3B5bzMtbWFjcm9zLWJhY2tlbmQtMC4yOS4zLnNoYTI1
NnN1bV0gPSAiNjE0Mzg3N2ExNmU4MmI1YTcyN2I3MTI3ZmY0Y2Q4Njg1OGEyNGEyOGQ3NDVkNzJm
NDNlNmYyMjdjN2IxYmRiMyIKK1NSQ19VUklbcHlvMy0wLjMwLjEuc2hhMjU2c3VtXSA9ICIyMjlj
YTEzYjhhMTViYjBkMTQ4N2I4MWFiOTc1YmZjZDk3NTEzNDE2NDk5YTgzMTIwMTFiNjAzNmU0MmUw
ZGU0IgorU1JDX1VSSVtweW8zLWJ1aWxkLWNvbmZpZy0wLjMwLjEuc2hhMjU2c3VtXSA9ICI3MDEz
MGUyYjZkZDFlZTU4OWE4Nzg4MDI2YTQyOTU2MWNhNWM0MGZhN2EyZmE3OTE0YzIyODJlZGRhZTI0
NzAwIgorU1JDX1VSSVtweW8zLWZmaS0wLjMwLjEuc2hhMjU2c3VtXSA9ICI1ZTdmZjczYzU1NWMy
ODZkMjEyZDRjZTdlNWZiZGE4NDVhOTczYzRmNjFiZDVmMTYwZjVmMmMzYzJhMDRkMWM0IgorU1JD
X1VSSVtweW8zLW1hY3Jvcy0wLjMwLjEuc2hhMjU2c3VtXSA9ICJjNDZkMmU1ODYyYzdiYjgyMDdl
M2I2MzlmNzEzZGRhM2M0OTk5MzM0NDQ3ODQxNTRjMTFkMDEzYzVhNjkxYjYwIgorU1JDX1VSSVtw
eW8zLW1hY3Jvcy1iYWNrZW5kLTAuMzAuMS5zaGEyNTZzdW1dID0gIjM4Yjg5ZjA2NmYyYWU3MmEy
YWVmNTJkMTUzN2NhMmZjZDEwNDQ0MGViZmFkZWUwNmU5N2FhOTA3MzhhMjViOWIiCiBTUkNfVVJJ
W3F1b3RlLTEuMC40Ni5zaGEyNTZzdW1dID0gImRmYmM0NTdkMGM3YTA3NTlhNjE0NTUxYjExYTY0
MDllNTk1MWY2Yzc1MzdiZTFmMWI3NjgyYjlhZTkyMzAzNjgiCiBTUkNfVVJJW3ItZWZpLTUuMy4w
LnNoYTI1NnN1bV0gPSAiNjljZGIzNGMxNThjZWIyODhkZjExZTE4YjRiZDM5ZGU5OTRmNjY1N2Q4
Mzg0N2JkZmZkYmQ3ZjM0Njc1NGIwZiIKIFNSQ19VUklbcmFuZC0wLjkuNC5zaGEyNTZzdW1dID0g
IjQ0YzVhZjA2YmIxYjdkMzIxNmQ5MTkzMmFlZDUyNjUxNjRiZjM4NGRjODljZDZiYTA1Y2Y1OWEz
NWY1Zjc2ZWEiCiBTUkNfVVJJW3JhbmRfY2hhY2hhLTAuOS4wLnNoYTI1NnN1bV0gPSAiZDMwMjJi
NWYxZGY2MGYyNmUxZmZkZGQ2YzY2ZThhYTE1ZGUzODJhZTYzYjNhMGMxYmZjMGU0ZDNlM2YzMjVj
YiIKIFNSQ19VUklbcmFuZF9jb3JlLTAuOS41LnNoYTI1NnN1bV0gPSAiNzZhZmM4MjZkZTE0MjM4
ZTZlOGMzNzRkZGNjMWZhMTllMzc0ZmQ4ZGQ5ODZiMGQyYWYwZDAyMzc3MjYxZDgzYyIKIFNSQ19V
Uklbc3luLTIuMC4xMTguc2hhMjU2c3VtXSA9ICIxYjlhZTU3ZjkwNDIxM2ViYjY0OWNlNjg5NWI4
YTY2YzY2ZjAyMDNiOTMxOTcxOGY2OWE1NjEyYTA2NWIxNDIyIgorU1JDX1VSSVtzeW4tMy4wLjku
c2hhMjU2c3VtXSA9ICJkNzhjOGRlZTRjN2JmMGUxNDY3MzA5NzI1NmZlZDYxNDJjZTlkM2I4NWE0
MDgxODlkMDc0ODI0NDIxNDU4MjNiIgogU1JDX1VSSVt0YXJnZXQtbGV4aWNvbi0wLjEzLjUuc2hh
MjU2c3VtXSA9ICJhZGI2OTM1YTZmNWMyMDE3MGVlY2ViMWEzODM1YTQ5ZTEyZTE5ZDc5MmY2ZGQz
NDRjY2M3NmE5ODVjYTVhNmNhIgogU1JDX1VSSVt1bmljb2RlLWlkZW50LTEuMC4yNC5zaGEyNTZz
dW1dID0gImU2ZTQzMTNjZDVmY2QzZGFkNWNhZmExNzk3MDJlMmIyNDRmNzYwOTkxZjQ1Mzk3ZDE0
ZDRlYmYzODI0N2RhNzUiCiBTUkNfVVJJW3dhc2lwMi0xLjAuNCt3YXNpLTAuMi4xMi5zaGEyNTZz
dW1dID0gImI2N2VmYjM3ZTEwNmU1NWNlNzIyYTUxMGQ2YjVmOWMxN2YwODNlNWZjNzlhZmMyYmFk
ZWIxMmNjMzEzZDk0ODciCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtaHlwb3RoZXNpc182LjE2OS4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4xNzAuOS5iYgpzaW1pbGFyaXR5IGluZGV4IDkxJQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNp
c182LjE2OS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtaHlwb3RoZXNpc182LjE3MC45LmJiCmluZGV4IDBlN2Q5NzcwNWMuLjI5NGE5NTYxOGQgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lz
XzYuMTY5LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5
cG90aGVzaXNfNi4xNzAuOS5iYgpAQCAtMTYsNyArMTYsNyBAQCBTUkNfVVJJICs9ICIgXAogICAg
IGZpbGU6Ly90ZXN0X3JsZS5weSBcCiAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjY1
NzQ5ZDdmN2EyZmRkZmIxMDZiYjU3Yzk5MDJkYjRhYjI1Y2U4NzI0YzgyMWY0YWY1MGNjNTg4OTFh
NmI3YiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI3MmZkN2U2NTcxYWFmNDc0MzliZGEyMjkyMTU2
YThiODZjOWFmYzgzYWE1OWI0N2U4ODU3NTU3NTc2ZmE4YmUyIgogCiBSREVQRU5EUzoke1BOfSAr
PSAiIFwKICAgICBweXRob24zLWF0dHJzIFwKLS0gCjIuNDcuMQoK

--===============5096975071966052642==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.169.0.dist-info -> /usr/lib/python3.14/site-packages/hypothesis-6.170.9.dist-info, directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.169.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/hypothesis-6.170.9.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.14/site-packages/hypothesis-6.169.0.dist-info moved to /usr/lib/python3.14/site-packages/hypothesis-6.170.9.dist-info

--===============5096975071966052642==--
