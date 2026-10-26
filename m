Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36781.1792991666731583640
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Oct 2026 22:14:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=S5spSiRq;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=zAlebGhV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a176a19dac-83548726-1910-446e-90de-482f717e181e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792991665;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1azgVAbyP/+g/7AjMtfpa6alZPz64zEAhBZTTjgrJi4=;
	b=S5spSiRqqy+qp/Eq8cXWHQ0Hx9t55c5ILk3XthTN066/Ql/QQ3vgoZeQLltLf4hV
	OWAXkmZq6OsuYGOKj7vXrK/mP+RzF9TM1YroN8s2J7S6VbmJgROMV9McKvtgzI5mT08
	3jYvy4BV6XhDPEJMYf5gLlzPX6T4HbrsJK8BcAgc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792991665;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1azgVAbyP/+g/7AjMtfpa6alZPz64zEAhBZTTjgrJi4=;
	b=zAlebGhVCy5LTaWTCbGXP5JL/CUisS2ybykUiH7uowlb0sdHYqNMDqmTUFuzV1fT
	EWdvnDhVoAPC5jT0UMXky2hwFRNHPkmb4ox8T+yeeQTtXOwOYp96kQ8iTirxYZTziH6
	KqJ+x/4FrIWuH1pGhAqzDofXlVWpBj+LYaCYZIeQ=
Content-Type: multipart/mixed; boundary="===============1506943946340952097=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.170.11 SUCCEEDED
Message-ID: <010101a176a19dac-83548726-1910-446e-90de-482f717e181e-000000@us-west-2.amazonses.com>
Date: Mon, 26 Oct 2026 05:14:25 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.26-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 05:14:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248630

--===============1506943946340952097==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hypothesis* to *6.170.11* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.169.0-6.170.11.patch
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
From 03d7661ff0dce79f62e8d42816fa25f2913fd01e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 26 Oct 2026 05:08:23 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.169.0 -> 6.170.11

---
 .../python/python3-hypothesis-crates.inc      | 22 ++++++++++---------
 ...69.0.bb => python3-hypothesis_6.170.11.bb} |  2 +-
 2 files changed, 13 insertions(+), 11 deletions(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.169.0.bb => python3-hypothesis_6.170.11.bb} (91%)

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
diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.169.0.bb b/meta/recipes-devtools/python/python3-hypothesis_6.170.11.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.169.0.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.170.11.bb
index 0e7d97705c..e1ed648265 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.169.0.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.170.11.bb
@@ -16,7 +16,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "b65749d7f7a2fddfb106bb57c9902db4ab25ce8724c821f4af50cc58891a6b7b"
+SRC_URI[sha256sum] = "d78338dcebd65287c34388aba85c301271a8d73e0cc2bbfbd78ac2c1b6d4f4cf"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.47.1


--===============1506943946340952097==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis: PKGV changed from 6.169.0 [default] to 6.170.11 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.169.0.tar.gz crate://crates.io/cfg-if/1.0.4 crate://crates.io/crunchy/0.2.4 crate://crates.io/getrandom/0.3.4 crate://crates.io/half/2.7.1 crate://crates.io/heck/0.5.0 crate://crates.io/libc/0.2.186 crate://crates.io/once_cell/1.21.4 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/ppv-lite86/0.2.21 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/pyo3/0.29.3 crate://crates.io/pyo3-build-config/0.29.3 crate://crates.io/pyo3-ffi/0.29.3 crate://crates.io/pyo3-macros/0.29.3 crate://crates.io/pyo3-macros-backend/0.29.3 crate://crates.io/quote/1.0.46 crate://crates.io/r-efi/5.3.0 crate://crates.io/rand/0.9.4 crate://crates.io/rand_chacha/0.9.0 crate://crates.io/rand_core/0.9.5 crate://crates.io/syn/2.0.118 crate://crates.io/target-lexicon/0.13.5 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/wasip2/1.0.4+wasi-0.2.12 cra
 te://crates.io/wit-bindgen/0.57.1 crate://crates.io/zerocopy/0.8.53 crate://crates.io/zerocopy-derive/0.8.53 file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.170.11.tar.gz crate://crates.io/cfg-if/1.0.4 crate://crates.io/crunchy/0.2.4 crate://crates.io/getrandom/0.3.4 crate://crates.io/half/2.7.1 crate://crates.io/heck/0.5.0 crate://crates.io/libc/0.2.186 crate://crates.io/once_cell/1.21.4 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/ppv-lite86/0.2.21 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/pyo3/0.30.1 crate://crates.io/pyo3-build-config/0.30.1 crate://crates.io/pyo3-ffi/0.30.1 crate://crates.io/pyo3-macros/0.30.1 crate://crates.io/pyo3-macros-backend/0.30.1 crate://crates.io/quote/1.0.46 crate://crates.io/r-efi/5.3.0 crate://crates.io/rand/0.9.4 crate://crates.io/rand_chacha/0.9.0 crate://crates.io/rand_core/0.9.5 crate://crates.io/syn/2.0.118 crate://crates.io/syn/3.0.9 crate
 ://crates.io/target-lexicon/0.13.5 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/wasip2/1.0.4+wasi-0.2.12 crate://crates.io/wit-bindgen/0.57.1 crate://crates.io/zerocopy/0.8.53 crate://crates.io/zerocopy-derive/0.8.53 file://test_binary_search.py file://test_rle.py"
packages/x86-64-v3-poky-linux/python3-hypothesis: PV changed from "6.169.0" to "6.170.11"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGSIZE changed from 118384 to 118416 (+0%)
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.169.0 [default] to 6.170.11 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.169.0" to "6.170.11"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.169.0 [default] to 6.170.11 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.169.0" to "6.170.11"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.169.0 [default] to 6.170.11 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.169.0" to "6.170.11"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.169.0 [default] to 6.170.11 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.169.0" to "6.170.11"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.169.0 [default] to 6.170.11 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.169.0" to "6.170.11"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.169.0 [default] to 6.170.11 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.169.0" to "6.170.11"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.169.0 [default] to 6.170.11 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.169.0" to "6.170.11"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 4566319 to 4652760 (+2%)
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.169.0 [default] to 6.170.11 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.169.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/hypothesis-6.170.11.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.169.0.dist-info -> /usr/lib/python3.14/site-packages/hypothesis-6.170.11.dist-info
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.169.0" to "6.170.11"
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.14/site-packages/hypothesis-6.170.11.dist-info was added
  /usr/lib/python3.14/site-packages/hypothesis-6.170.11.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/hypothesis-6.170.11.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/hypothesis-6.170.11.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/hypothesis-6.170.11.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/hypothesis-6.170.11.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/hypothesis-6.169.0.dist-info was removed
  /usr/lib/python3.14/site-packages/hypothesis-6.169.0.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/hypothesis-6.169.0.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/hypothesis-6.169.0.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/hypothesis-6.169.0.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/hypothesis-6.169.0.dist-info/WHEEL was removed

--===============1506943946340952097==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.169.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/hypothesis-6.170.11.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.169.0.dist-info -> /usr/lib/python3.14/site-packages/hypothesis-6.170.11.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.14/site-packages/hypothesis-6.170.11.dist-info was added
  /usr/lib/python3.14/site-packages/hypothesis-6.170.11.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/hypothesis-6.170.11.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/hypothesis-6.170.11.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/hypothesis-6.170.11.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/hypothesis-6.170.11.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/hypothesis-6.169.0.dist-info was removed
  /usr/lib/python3.14/site-packages/hypothesis-6.169.0.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/hypothesis-6.169.0.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/hypothesis-6.169.0.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/hypothesis-6.169.0.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/hypothesis-6.169.0.dist-info/WHEEL was removed

--===============1506943946340952097==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.169.0-6.170.11.patch"

RnJvbSAwM2Q3NjYxZmYwZGNlNzlmNjJlOGQ0MjgxNmZhMjVmMjkxM2ZkMDFlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMjYgT2N0IDIwMjYgMDU6MDg6MjMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWh5cG90aGVzaXM6IHVwZ3JhZGUgNi4xNjkuMCAtPiA2LjE3MC4xMQoKLS0tCiAuLi4v
cHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpcy1jcmF0ZXMuaW5jICAgICAgfCAyMiArKysrKysrKysr
LS0tLS0tLS0tCiAuLi42OS4wLmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjE3MC4xMS5iYn0g
fCAgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMo
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWh5cG90aGVz
aXNfNi4xNjkuMC5iYiA9PiBweXRob24zLWh5cG90aGVzaXNfNi4xNzAuMTEuYmJ9ICg5MSUpCgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVz
aXMtY3JhdGVzLmluYyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBv
dGhlc2lzLWNyYXRlcy5pbmMKaW5kZXggNTdhMWMyYzI5ZS4uOGRmNTUzNjMwMSAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXMtY3JhdGVz
LmluYworKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNp
cy1jcmF0ZXMuaW5jCkBAIC0xMiwxNyArMTIsMTggQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0
ZTovL2NyYXRlcy5pby9wb3J0YWJsZS1hdG9taWMvMS4xMy4xIFwKICAgICBjcmF0ZTovL2NyYXRl
cy5pby9wcHYtbGl0ZTg2LzAuMi4yMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHJvYy1tYWNy
bzIvMS4wLjEwNiBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy8wLjI5LjMgXAotICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3B5bzMtYnVpbGQtY29uZmlnLzAuMjkuMyBcCi0gICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vcHlvMy1mZmkvMC4yOS4zIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLW1h
Y3Jvcy8wLjI5LjMgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMtbWFjcm9zLWJhY2tlbmQv
MC4yOS4zIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLzAuMzAuMSBcCisgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vcHlvMy1idWlsZC1jb25maWcvMC4zMC4xIFwKKyAgICBjcmF0ZTovL2NyYXRl
cy5pby9weW8zLWZmaS8wLjMwLjEgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMtbWFjcm9z
LzAuMzAuMSBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy1tYWNyb3MtYmFja2VuZC8wLjMw
LjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3F1b3RlLzEuMC40NiBcCiAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vci1lZmkvNS4zLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JhbmQvMC45LjQg
XAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JhbmRfY2hhY2hhLzAuOS4wIFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby9yYW5kX2NvcmUvMC45LjUgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3N5bi8y
LjAuMTE4IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9zeW4vMy4wLjkgXAogICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL3RhcmdldC1sZXhpY29uLzAuMTMuNSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
dW5pY29kZS1pZGVudC8xLjAuMjQgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dhc2lwMi8xLjAu
NCt3YXNpLTAuMi4xMiBcCkBAIC00MSwxNyArNDIsMTggQEAgU1JDX1VSSVtvbmNlX2NlbGwtMS4y
MS40LnNoYTI1NnN1bV0gPSAiOWY3YzNlNGJlYjMzZjg1ZDQ1YWUzZTNhMTc5MjE4NTcwNmM4ZTE2
ZDAKIFNSQ19VUklbcG9ydGFibGUtYXRvbWljLTEuMTMuMS5zaGEyNTZzdW1dID0gImMzM2E5NDcx
ODk2ZjFjNjljZWNlZjhkMjBjYmUyZjdhY2NkMTI1MjdjZTYwODQ1ZmY0NGMxNTNiYjJhMjFiNDki
CiBTUkNfVVJJW3Bwdi1saXRlODYtMC4yLjIxLnNoYTI1NnN1bV0gPSAiODVlYWUzYzRlZDJmNTBk
Y2ZlNzI2NDNkYTRiZWZjMzBkZWFkYjQ1OGE5YjU5MGQ3MjBjZGUyZjJiMWU5N2RhOSIKIFNSQ19V
UklbcHJvYy1tYWNybzItMS4wLjEwNi5zaGEyNTZzdW1dID0gIjhmZDAwZjBiYjJlOTBkODFkMTA0
NGMyYjMyNjE3ZjY4ZmNiOWZhM2JiNzY0MGMyM2U5Yzc0OGU1M2ZiMzA5MzQiCi1TUkNfVVJJW3B5
bzMtMC4yOS4zLnNoYTI1NnN1bV0gPSAiNzAwZDE4ZmEyNjdiNzNiOWI1MjFmZDdlMTM1ODBlMmY0
NDY5MTZmMTc2Y2FjZWUxYWI2M2ZjYzgxOTFmMTY1NSIKLVNSQ19VUklbcHlvMy1idWlsZC1jb25m
aWctMC4yOS4zLnNoYTI1NnN1bV0gPSAiN2IzZmMwYzRkMDhmNmJiMTBlNzFmZTM5ZGZiOWUyZjU5
YzZlYjY4NTRlMjJlYzgwOTJmNTBjNjlhNDQ5OWFkYiIKLVNSQ19VUklbcHlvMy1mZmktMC4yOS4z
LnNoYTI1NnN1bV0gPSAiZGZjMGI4ZTE5ZGYyOWFhZDcwODZjZjk3N2JiMGMyYTJmMTQzZTMwNTY3
ZWIxMTNlOWNmNzJiNjJjYTY5ODMzMCIKLVNSQ19VUklbcHlvMy1tYWNyb3MtMC4yOS4zLnNoYTI1
NnN1bV0gPSAiNjEwMGU4YTRiNWViYTUzYWZhYTVlZDA3ODM2NDg1MWEwYjI0OTljNTUzYTQ0YzMx
MDI2YjkyOTA0OWI0OWRjNiIKLVNSQ19VUklbcHlvMy1tYWNyb3MtYmFja2VuZC0wLjI5LjMuc2hh
MjU2c3VtXSA9ICI2MTQzODc3YTE2ZTgyYjVhNzI3YjcxMjdmZjRjZDg2ODU4YTI0YTI4ZDc0NWQ3
MmY0M2U2ZjIyN2M3YjFiZGIzIgorU1JDX1VSSVtweW8zLTAuMzAuMS5zaGEyNTZzdW1dID0gIjIy
OWNhMTNiOGExNWJiMGQxNDg3YjgxYWI5NzViZmNkOTc1MTM0MTY0OTlhODMxMjAxMWI2MDM2ZTQy
ZTBkZTQiCitTUkNfVVJJW3B5bzMtYnVpbGQtY29uZmlnLTAuMzAuMS5zaGEyNTZzdW1dID0gIjcw
MTMwZTJiNmRkMWVlNTg5YTg3ODgwMjZhNDI5NTYxY2E1YzQwZmE3YTJmYTc5MTRjMjI4MmVkZGFl
MjQ3MDAiCitTUkNfVVJJW3B5bzMtZmZpLTAuMzAuMS5zaGEyNTZzdW1dID0gIjVlN2ZmNzNjNTU1
YzI4NmQyMTJkNGNlN2U1ZmJkYTg0NWE5NzNjNGY2MWJkNWYxNjBmNWYyYzNjMmEwNGQxYzQiCitT
UkNfVVJJW3B5bzMtbWFjcm9zLTAuMzAuMS5zaGEyNTZzdW1dID0gImM0NmQyZTU4NjJjN2JiODIw
N2UzYjYzOWY3MTNkZGEzYzQ5OTkzMzQ0NDc4NDE1NGMxMWQwMTNjNWE2OTFiNjAiCitTUkNfVVJJ
W3B5bzMtbWFjcm9zLWJhY2tlbmQtMC4zMC4xLnNoYTI1NnN1bV0gPSAiMzhiODlmMDY2ZjJhZTcy
YTJhZWY1MmQxNTM3Y2EyZmNkMTA0NDQwZWJmYWRlZTA2ZTk3YWE5MDczOGEyNWI5YiIKIFNSQ19V
UklbcXVvdGUtMS4wLjQ2LnNoYTI1NnN1bV0gPSAiZGZiYzQ1N2QwYzdhMDc1OWE2MTQ1NTFiMTFh
NjQwOWU1OTUxZjZjNzUzN2JlMWYxYjc2ODJiOWFlOTIzMDM2OCIKIFNSQ19VUklbci1lZmktNS4z
LjAuc2hhMjU2c3VtXSA9ICI2OWNkYjM0YzE1OGNlYjI4OGRmMTFlMThiNGJkMzlkZTk5NGY2NjU3
ZDgzODQ3YmRmZmRiZDdmMzQ2NzU0YjBmIgogU1JDX1VSSVtyYW5kLTAuOS40LnNoYTI1NnN1bV0g
PSAiNDRjNWFmMDZiYjFiN2QzMjE2ZDkxOTMyYWVkNTI2NTE2NGJmMzg0ZGM4OWNkNmJhMDVjZjU5
YTM1ZjVmNzZlYSIKIFNSQ19VUklbcmFuZF9jaGFjaGEtMC45LjAuc2hhMjU2c3VtXSA9ICJkMzAy
MmI1ZjFkZjYwZjI2ZTFmZmRkZDZjNjZlOGFhMTVkZTM4MmFlNjNiM2EwYzFiZmMwZTRkM2UzZjMy
NWNiIgogU1JDX1VSSVtyYW5kX2NvcmUtMC45LjUuc2hhMjU2c3VtXSA9ICI3NmFmYzgyNmRlMTQy
MzhlNmU4YzM3NGRkY2MxZmExOWUzNzRmZDhkZDk4NmIwZDJhZjBkMDIzNzcyNjFkODNjIgogU1JD
X1VSSVtzeW4tMi4wLjExOC5zaGEyNTZzdW1dID0gIjFiOWFlNTdmOTA0MjEzZWJiNjQ5Y2U2ODk1
YjhhNjZjNjZmMDIwM2I5MzE5NzE4ZjY5YTU2MTJhMDY1YjE0MjIiCitTUkNfVVJJW3N5bi0zLjAu
OS5zaGEyNTZzdW1dID0gImQ3OGM4ZGVlNGM3YmYwZTE0NjczMDk3MjU2ZmVkNjE0MmNlOWQzYjg1
YTQwODE4OWQwNzQ4MjQ0MjE0NTgyM2IiCiBTUkNfVVJJW3RhcmdldC1sZXhpY29uLTAuMTMuNS5z
aGEyNTZzdW1dID0gImFkYjY5MzVhNmY1YzIwMTcwZWVjZWIxYTM4MzVhNDllMTJlMTlkNzkyZjZk
ZDM0NGNjYzc2YTk4NWNhNWE2Y2EiCiBTUkNfVVJJW3VuaWNvZGUtaWRlbnQtMS4wLjI0LnNoYTI1
NnN1bV0gPSAiZTZlNDMxM2NkNWZjZDNkYWQ1Y2FmYTE3OTcwMmUyYjI0NGY3NjA5OTFmNDUzOTdk
MTRkNGViZjM4MjQ3ZGE3NSIKIFNSQ19VUklbd2FzaXAyLTEuMC40K3dhc2ktMC4yLjEyLnNoYTI1
NnN1bV0gPSAiYjY3ZWZiMzdlMTA2ZTU1Y2U3MjJhNTEwZDZiNWY5YzE3ZjA4M2U1ZmM3OWFmYzJi
YWRlYjEyY2MzMTNkOTQ4NyIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTY5LjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjE3MC4xMS5iYgpzaW1pbGFyaXR5IGluZGV4IDkx
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3Ro
ZXNpc182LjE2OS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtaHlwb3RoZXNpc182LjE3MC4xMS5iYgppbmRleCAwZTdkOTc3MDVjLi5lMWVkNjQ4MjY1
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3Ro
ZXNpc182LjE2OS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1oeXBvdGhlc2lzXzYuMTcwLjExLmJiCkBAIC0xNiw3ICsxNiw3IEBAIFNSQ19VUkkgKz0gIiBc
CiAgICAgZmlsZTovL3Rlc3RfcmxlLnB5IFwKICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9
ICJiNjU3NDlkN2Y3YTJmZGRmYjEwNmJiNTdjOTkwMmRiNGFiMjVjZTg3MjRjODIxZjRhZjUwY2M1
ODg5MWE2YjdiIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImQ3ODMzOGRjZWJkNjUyODdjMzQzODhh
YmE4NWMzMDEyNzFhOGQ3M2UwY2MyYmJmYmQ3OGFjMmMxYjZkNGY0Y2YiCiAKIFJERVBFTkRTOiR7
UE59ICs9ICIgXAogICAgIHB5dGhvbjMtYXR0cnMgXAotLSAKMi40Ny4xCgo=

--===============1506943946340952097==--
