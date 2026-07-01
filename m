Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF86CC43458
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 06:34:19 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38893.1782887651712595462
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 23:34:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=QF6v94yG;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Dfvq8Raq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019f1c629553-0ec557c5-5bf2-423f-b760-818e34c20bea-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782887650;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4U9jjpbS1VNBlyWq4o14fWJJ9UluoUIixEEPT8sALzs=;
	b=QF6v94yGpZc94cLI3CFWe61DI8jG8zpuG0CtXLvQBYr8jvm77KAM7AulNn0X8W3Q
	+3NpoBFBTt8/niZoAHJsKveqvnqRHlMvq4d3R8jClpPklMkbJFNRM5Bg5K1J5PYAlzy
	R49TC4GtRtxI1nY4iQ6P55jjrOjVfcPS+qor2BCw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782887650;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4U9jjpbS1VNBlyWq4o14fWJJ9UluoUIixEEPT8sALzs=;
	b=Dfvq8RaqbSFkLS7oJePvESQjBl9pEnJy6TDz9+Zx+3lWsy0aIvTxpeXP4m5cVazK
	ozZreXKKlwrkNi7SgsYKBSl46aGRIzEnHDOYe/kuRkmuuSo8bNXCx4suH8wf4u5yIYY
	VrfpxeG9OM34hqYyPbJTDv0dPHTf+DRmnByDS4QA=
Content-Type: multipart/mixed; boundary="===============7505865323060132413=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-rpds-py: upgrading to 2026.6.3 SUCCEEDED
Message-ID: <0101019f1c629553-0ec557c5-5bf2-423f-b760-818e34c20bea-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jul 2026 06:34:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 06:34:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239934

--===============7505865323060132413==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-rpds-py* to *2026.6.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-rpds-py-upgrade-2026.5.1-2026.6.3.patch
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
From 68efbe78dc829399942fda0fb4c796dc2dd09fd0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Jul 2026 06:00:36 +0000
Subject: [PATCH] python3-rpds-py: upgrade 2026.5.1 -> 2026.6.3

---
 .../python/python3-rpds-py-crates.inc         | 28 +++++++------------
 ...026.5.1.bb => python3-rpds-py_2026.6.3.bb} |  2 +-
 2 files changed, 11 insertions(+), 19 deletions(-)
 rename meta/recipes-devtools/python/{python3-rpds-py_2026.5.1.bb => python3-rpds-py_2026.6.3.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-rpds-py-crates.inc b/meta/recipes-devtools/python/python3-rpds-py-crates.inc
index 9556b6f593..16091415ef 100644
--- a/meta/recipes-devtools/python/python3-rpds-py-crates.inc
+++ b/meta/recipes-devtools/python/python3-rpds-py-crates.inc
@@ -3,22 +3,18 @@
 # from Cargo.lock
 SRC_URI += " \
     crate://crates.io/archery/1.2.2 \
-    crate://crates.io/cc/1.2.48 \
-    crate://crates.io/find-msvc-tools/0.1.5 \
     crate://crates.io/heck/0.5.0 \
     crate://crates.io/libc/0.2.177 \
     crate://crates.io/once_cell/1.21.3 \
     crate://crates.io/portable-atomic/1.11.1 \
     crate://crates.io/proc-macro2/1.0.103 \
-    crate://crates.io/pyo3/0.28.3 \
-    crate://crates.io/pyo3-build-config/0.28.3 \
-    crate://crates.io/pyo3-ffi/0.28.3 \
-    crate://crates.io/pyo3-macros/0.28.3 \
-    crate://crates.io/pyo3-macros-backend/0.28.3 \
-    crate://crates.io/python3-dll-a/0.2.14 \
+    crate://crates.io/pyo3/0.29.0 \
+    crate://crates.io/pyo3-build-config/0.29.0 \
+    crate://crates.io/pyo3-ffi/0.29.0 \
+    crate://crates.io/pyo3-macros/0.29.0 \
+    crate://crates.io/pyo3-macros-backend/0.29.0 \
     crate://crates.io/quote/1.0.42 \
     crate://crates.io/rpds/1.2.1 \
-    crate://crates.io/shlex/1.3.0 \
     crate://crates.io/smallvec/1.15.1 \
     crate://crates.io/syn/2.0.111 \
     crate://crates.io/target-lexicon/0.13.3 \
@@ -27,22 +23,18 @@ SRC_URI += " \
 "
 
 SRC_URI[archery-1.2.2.sha256sum] = "70e0a5f99dfebb87bb342d0f53bb92c81842e100bbb915223e38349580e5441d"
-SRC_URI[cc-1.2.48.sha256sum] = "c481bdbf0ed3b892f6f806287d72acd515b352a4ec27a208489b8c1bc839633a"
-SRC_URI[find-msvc-tools-0.1.5.sha256sum] = "3a3076410a55c90011c298b04d0cfa770b00fa04e1e3c97d3f6c9de105a03844"
 SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
 SRC_URI[libc-0.2.177.sha256sum] = "2874a2af47a2325c2001a6e6fad9b16a53b802102b528163885171cf92b15976"
 SRC_URI[once_cell-1.21.3.sha256sum] = "42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d"
 SRC_URI[portable-atomic-1.11.1.sha256sum] = "f84267b20a16ea918e43c6a88433c2d54fa145c92a811b5b047ccbe153674483"
 SRC_URI[proc-macro2-1.0.103.sha256sum] = "5ee95bc4ef87b8d5ba32e8b7714ccc834865276eab0aed5c9958d00ec45f49e8"
-SRC_URI[pyo3-0.28.3.sha256sum] = "91fd8e38a3b50ed1167fb981cd6fd60147e091784c427b8f7183a7ee32c31c12"
-SRC_URI[pyo3-build-config-0.28.3.sha256sum] = "e368e7ddfdeb98c9bca7f8383be1648fd84ab466bf2bc015e94008db6d35611e"
-SRC_URI[pyo3-ffi-0.28.3.sha256sum] = "7f29e10af80b1f7ccaf7f69eace800a03ecd13e883acfacc1e5d0988605f651e"
-SRC_URI[pyo3-macros-0.28.3.sha256sum] = "df6e520eff47c45997d2fc7dd8214b25dd1310918bbb2642156ef66a67f29813"
-SRC_URI[pyo3-macros-backend-0.28.3.sha256sum] = "c4cdc218d835738f81c2338f822078af45b4afdf8b2e33cbb5916f108b813acb"
-SRC_URI[python3-dll-a-0.2.14.sha256sum] = "d381ef313ae70b4da5f95f8a4de773c6aa5cd28f73adec4b4a31df70b66780d8"
+SRC_URI[pyo3-0.29.0.sha256sum] = "cd274650b21d4bfc26a0a47587962c1edb425f69287324355cd040c3ea66071c"
+SRC_URI[pyo3-build-config-0.29.0.sha256sum] = "c5e2a7d2f0d013342f295c048ad19237add5154a55b1c5a254c0ec93d4109078"
+SRC_URI[pyo3-ffi-0.29.0.sha256sum] = "ca85c467da1bbc8d866eea5deff9cf29ea5f7785054a17da36e65bda9c05845b"
+SRC_URI[pyo3-macros-0.29.0.sha256sum] = "9ac53762fd065daa3194dd09337a38bd793a188100fd1a9304c4ab312d901771"
+SRC_URI[pyo3-macros-backend-0.29.0.sha256sum] = "4ca3a1557399783172dc5bf39cfca835157732532cba56b71d2292161e53b362"
 SRC_URI[quote-1.0.42.sha256sum] = "a338cc41d27e6cc6dce6cefc13a0729dfbb81c262b1f519331575dd80ef3067f"
 SRC_URI[rpds-1.2.1.sha256sum] = "e025feb26210bc196b908e72deb063b1b4000754304341cbc168a1e72c857ebc"
-SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
 SRC_URI[smallvec-1.15.1.sha256sum] = "67b1b7a3b5fe4f1376887184045fcf45c69e92af734b7aaddc05fb777b6fbd03"
 SRC_URI[syn-2.0.111.sha256sum] = "390cc9a294ab71bdb1aa2e99d13be9c753cd2d7bd6560c77118597410c4d2e87"
 SRC_URI[target-lexicon-0.13.3.sha256sum] = "df7f62577c25e07834649fc3b39fafdc597c0a3527dc1c60129201ccfcbaa50c"
diff --git a/meta/recipes-devtools/python/python3-rpds-py_2026.5.1.bb b/meta/recipes-devtools/python/python3-rpds-py_2026.6.3.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-rpds-py_2026.5.1.bb
rename to meta/recipes-devtools/python/python3-rpds-py_2026.6.3.bb
index 7f1511589f..5898649c3b 100644
--- a/meta/recipes-devtools/python/python3-rpds-py_2026.5.1.bb
+++ b/meta/recipes-devtools/python/python3-rpds-py_2026.6.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/rpds-py/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7767fa537c4596c54141f32882c4a984"
 
-SRC_URI[sha256sum] = "07b24fea40541e28570e5b795a4a38fbdcd12550c06bd0748005ecc8116ca256"
+SRC_URI[sha256sum] = "1cebd1337c242e4ec2293e541f712b2da849b29f48f0c293684b71c0632625d4"
 
 require ${BPN}-crates.inc
 
-- 
2.47.1


--===============7505865323060132413==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-rpds-py: PKGV changed from 2026.5.1 [default] to 2026.6.3 [default]
packages/x86-64-v3-poky-linux/python3-rpds-py: SRC_URI changed from "https://files.pythonhosted.org/packages/source/r/rpds_py/rpds_py-2026.5.1.tar.gz;downloadfilename=rpds_py-2026.5.1.tar.gz crate://crates.io/archery/1.2.2 crate://crates.io/cc/1.2.48 crate://crates.io/find-msvc-tools/0.1.5 crate://crates.io/heck/0.5.0 crate://crates.io/libc/0.2.177 crate://crates.io/once_cell/1.21.3 crate://crates.io/portable-atomic/1.11.1 crate://crates.io/proc-macro2/1.0.103 crate://crates.io/pyo3/0.28.3 crate://crates.io/pyo3-build-config/0.28.3 crate://crates.io/pyo3-ffi/0.28.3 crate://crates.io/pyo3-macros/0.28.3 crate://crates.io/pyo3-macros-backend/0.28.3 crate://crates.io/python3-dll-a/0.2.14 crate://crates.io/quote/1.0.42 crate://crates.io/rpds/1.2.1 crate://crates.io/shlex/1.3.0 crate://crates.io/smallvec/1.15.1 crate://crates.io/syn/2.0.111 crate://crates.io/target-lexicon/0.13.3 crate://crates.io/triomphe/0.1.15 crate://crates.io/unicode-ident/1.0.22" to "https://files.pythonhosted.org/pa
 ckages/source/r/rpds_py/rpds_py-2026.6.3.tar.gz;downloadfilename=rpds_py-2026.6.3.tar.gz crate://crates.io/archery/1.2.2 crate://crates.io/heck/0.5.0 crate://crates.io/libc/0.2.177 crate://crates.io/once_cell/1.21.3 crate://crates.io/portable-atomic/1.11.1 crate://crates.io/proc-macro2/1.0.103 crate://crates.io/pyo3/0.29.0 crate://crates.io/pyo3-build-config/0.29.0 crate://crates.io/pyo3-ffi/0.29.0 crate://crates.io/pyo3-macros/0.29.0 crate://crates.io/pyo3-macros-backend/0.29.0 crate://crates.io/quote/1.0.42 crate://crates.io/rpds/1.2.1 crate://crates.io/smallvec/1.15.1 crate://crates.io/syn/2.0.111 crate://crates.io/target-lexicon/0.13.3 crate://crates.io/triomphe/0.1.15 crate://crates.io/unicode-ident/1.0.22"
packages/x86-64-v3-poky-linux/python3-rpds-py: PV changed from "2026.5.1" to "2026.6.3"
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-dbg: PKGV changed from 2026.5.1 [default] to 2026.6.3 [default]
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-dbg: PV changed from "2026.5.1" to "2026.6.3"
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-dbg: PKGSIZE changed from 289296 to 286368 (-1%)
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-dev: PKGV changed from 2026.5.1 [default] to 2026.6.3 [default]
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-dev: PV changed from "2026.5.1" to "2026.6.3"
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-doc: PKGV changed from 2026.5.1 [default] to 2026.6.3 [default]
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-doc: PV changed from "2026.5.1" to "2026.6.3"
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-locale: PKGV changed from 2026.5.1 [default] to 2026.6.3 [default]
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-locale: PV changed from "2026.5.1" to "2026.6.3"
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-ptest: PKGV changed from 2026.5.1 [default] to 2026.6.3 [default]
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-ptest: PV changed from "2026.5.1" to "2026.6.3"
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-src: PKGV changed from 2026.5.1 [default] to 2026.6.3 [default]
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-src: PV changed from "2026.5.1" to "2026.6.3"
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-staticdev: PKGV changed from 2026.5.1 [default] to 2026.6.3 [default]
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-staticdev: PV changed from "2026.5.1" to "2026.6.3"
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py: PKGV changed from 2026.5.1 [default] to 2026.6.3 [default]
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py: PV changed from "2026.5.1" to "2026.6.3"
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py: FILELIST: directory renamed /usr/lib/python3.14/site-packages/rpds_py-2026.5.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/rpds_py-2026.6.3.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/rpds_py-2026.5.1.dist-info -> /usr/lib/python3.14/site-packages/rpds_py-2026.6.3.dist-info
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py: PKGSIZE changed from 743834 to 723362 (-3%)
Changes to packages/x86-64-v3-poky-linux/python3-rpds-py (sysroot):
  /usr/lib/python3.14/site-packages/rpds_py-2026.5.1.dist-info moved to /usr/lib/python3.14/site-packages/rpds_py-2026.6.3.dist-info

--===============7505865323060132413==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py: FILELIST: directory renamed /usr/lib/python3.14/site-packages/rpds_py-2026.5.1.dist-info -> /usr/lib/python3.14/site-packages/rpds_py-2026.6.3.dist-info, directory renamed /usr/lib/python3.14/site-packages/rpds_py-2026.5.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/rpds_py-2026.6.3.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-rpds-py (sysroot):
  /usr/lib/python3.14/site-packages/rpds_py-2026.5.1.dist-info moved to /usr/lib/python3.14/site-packages/rpds_py-2026.6.3.dist-info

--===============7505865323060132413==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-rpds-py-upgrade-2026.5.1-2026.6.3.patch"

RnJvbSA2OGVmYmU3OGRjODI5Mzk5OTQyZmRhMGZiNGM3OTZkYzJkZDA5ZmQwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBKdWwgMjAyNiAwNjowMDozNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcnBkcy1weTogdXBncmFkZSAyMDI2LjUuMSAtPiAyMDI2LjYuMwoKLS0tCiAuLi4vcHl0
aG9uL3B5dGhvbjMtcnBkcy1weS1jcmF0ZXMuaW5jICAgICAgICAgfCAyOCArKysrKysrLS0tLS0t
LS0tLS0tCiAuLi4wMjYuNS4xLmJiID0+IHB5dGhvbjMtcnBkcy1weV8yMDI2LjYuMy5iYn0gfCAg
MiArLQogMiBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXJwZHMtcHlfMjAy
Ni41LjEuYmIgPT4gcHl0aG9uMy1ycGRzLXB5XzIwMjYuNi4zLmJifSAoODQlKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1ycGRzLXB5LWNyYXRlcy5p
bmMgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnBkcy1weS1jcmF0ZXMu
aW5jCmluZGV4IDk1NTZiNmY1OTMuLjE2MDkxNDE1ZWYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1ycGRzLXB5LWNyYXRlcy5pbmMKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJwZHMtcHktY3JhdGVzLmluYwpAQCAtMywy
MiArMywxOCBAQAogIyBmcm9tIENhcmdvLmxvY2sKIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vYXJjaGVyeS8xLjIuMiBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2MvMS4y
LjQ4IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9maW5kLW1zdmMtdG9vbHMvMC4xLjUgXAogICAg
IGNyYXRlOi8vY3JhdGVzLmlvL2hlY2svMC41LjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2xp
YmMvMC4yLjE3NyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vb25jZV9jZWxsLzEuMjEuMyBcCiAg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcG9ydGFibGUtYXRvbWljLzEuMTEuMSBcCiAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vcHJvYy1tYWNybzIvMS4wLjEwMyBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
cHlvMy8wLjI4LjMgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMtYnVpbGQtY29uZmlnLzAu
MjguMyBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy1mZmkvMC4yOC4zIFwKLSAgICBjcmF0
ZTovL2NyYXRlcy5pby9weW8zLW1hY3Jvcy8wLjI4LjMgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3B5bzMtbWFjcm9zLWJhY2tlbmQvMC4yOC4zIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9weXRo
b24zLWRsbC1hLzAuMi4xNCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy8wLjI5LjAgXAor
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMtYnVpbGQtY29uZmlnLzAuMjkuMCBcCisgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vcHlvMy1mZmkvMC4yOS4wIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9w
eW8zLW1hY3Jvcy8wLjI5LjAgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMtbWFjcm9zLWJh
Y2tlbmQvMC4yOS4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9xdW90ZS8xLjAuNDIgXAogICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3JwZHMvMS4yLjEgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3No
bGV4LzEuMy4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9zbWFsbHZlYy8xLjE1LjEgXAogICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3N5bi8yLjAuMTExIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby90
YXJnZXQtbGV4aWNvbi8wLjEzLjMgXApAQCAtMjcsMjIgKzIzLDE4IEBAIFNSQ19VUkkgKz0gIiBc
CiAiCiAKIFNSQ19VUklbYXJjaGVyeS0xLjIuMi5zaGEyNTZzdW1dID0gIjcwZTBhNWY5OWRmZWJi
ODdiYjM0MmQwZjUzYmI5MmM4MTg0MmUxMDBiYmI5MTUyMjNlMzgzNDk1ODBlNTQ0MWQiCi1TUkNf
VVJJW2NjLTEuMi40OC5zaGEyNTZzdW1dID0gImM0ODFiZGJmMGVkM2I4OTJmNmY4MDYyODdkNzJh
Y2Q1MTViMzUyYTRlYzI3YTIwODQ4OWI4YzFiYzgzOTYzM2EiCi1TUkNfVVJJW2ZpbmQtbXN2Yy10
b29scy0wLjEuNS5zaGEyNTZzdW1dID0gIjNhMzA3NjQxMGE1NWM5MDAxMWMyOThiMDRkMGNmYTc3
MGIwMGZhMDRlMWUzYzk3ZDNmNmM5ZGUxMDVhMDM4NDQiCiBTUkNfVVJJW2hlY2stMC41LjAuc2hh
MjU2c3VtXSA9ICIyMzA0ZTAwOTgzZjg3ZmZiMzhiNTViNDQ0YjVlM2I2MGE4ODRiNWQzMGMwZmNh
N2Q4MmZlMzM0NDliYmU1NWVhIgogU1JDX1VSSVtsaWJjLTAuMi4xNzcuc2hhMjU2c3VtXSA9ICIy
ODc0YTJhZjQ3YTIzMjVjMjAwMWE2ZTZmYWQ5YjE2YTUzYjgwMjEwMmI1MjgxNjM4ODUxNzFjZjky
YjE1OTc2IgogU1JDX1VSSVtvbmNlX2NlbGwtMS4yMS4zLnNoYTI1NnN1bV0gPSAiNDJmNWUxNWM5
OTUzYzVlNGNjY2VlYjJlNzM4MmE3MTY0ODJjMzQ1MTUzMTVmN2IwMzUzMmI4YjRlODM5M2QyZCIK
IFNSQ19VUklbcG9ydGFibGUtYXRvbWljLTEuMTEuMS5zaGEyNTZzdW1dID0gImY4NDI2N2IyMGEx
NmVhOTE4ZTQzYzZhODg0MzNjMmQ1NGZhMTQ1YzkyYTgxMWI1YjA0N2NjYmUxNTM2NzQ0ODMiCiBT
UkNfVVJJW3Byb2MtbWFjcm8yLTEuMC4xMDMuc2hhMjU2c3VtXSA9ICI1ZWU5NWJjNGVmODdiOGQ1
YmEzMmU4Yjc3MTRjY2M4MzQ4NjUyNzZlYWIwYWVkNWM5OTU4ZDAwZWM0NWY0OWU4IgotU1JDX1VS
SVtweW8zLTAuMjguMy5zaGEyNTZzdW1dID0gIjkxZmQ4ZTM4YTNiNTBlZDExNjdmYjk4MWNkNmZk
NjAxNDdlMDkxNzg0YzQyN2I4ZjcxODNhN2VlMzJjMzFjMTIiCi1TUkNfVVJJW3B5bzMtYnVpbGQt
Y29uZmlnLTAuMjguMy5zaGEyNTZzdW1dID0gImUzNjhlN2RkZmRlYjk4YzliY2E3ZjgzODNiZTE2
NDhmZDg0YWI0NjZiZjJiYzAxNWU5NDAwOGRiNmQzNTYxMWUiCi1TUkNfVVJJW3B5bzMtZmZpLTAu
MjguMy5zaGEyNTZzdW1dID0gIjdmMjllMTBhZjgwYjFmN2NjYWY3ZjY5ZWFjZTgwMGEwM2VjZDEz
ZTg4M2FjZmFjYzFlNWQwOTg4NjA1ZjY1MWUiCi1TUkNfVVJJW3B5bzMtbWFjcm9zLTAuMjguMy5z
aGEyNTZzdW1dID0gImRmNmU1MjBlZmY0N2M0NTk5N2QyZmM3ZGQ4MjE0YjI1ZGQxMzEwOTE4YmJi
MjY0MjE1NmVmNjZhNjdmMjk4MTMiCi1TUkNfVVJJW3B5bzMtbWFjcm9zLWJhY2tlbmQtMC4yOC4z
LnNoYTI1NnN1bV0gPSAiYzRjZGMyMThkODM1NzM4ZjgxYzIzMzhmODIyMDc4YWY0NWI0YWZkZjhi
MmUzM2NiYjU5MTZmMTA4YjgxM2FjYiIKLVNSQ19VUklbcHl0aG9uMy1kbGwtYS0wLjIuMTQuc2hh
MjU2c3VtXSA9ICJkMzgxZWYzMTNhZTcwYjRkYTVmOTVmOGE0ZGU3NzNjNmFhNWNkMjhmNzNhZGVj
NGI0YTMxZGY3MGI2Njc4MGQ4IgorU1JDX1VSSVtweW8zLTAuMjkuMC5zaGEyNTZzdW1dID0gImNk
Mjc0NjUwYjIxZDRiZmMyNmEwYTQ3NTg3OTYyYzFlZGI0MjVmNjkyODczMjQzNTVjZDA0MGMzZWE2
NjA3MWMiCitTUkNfVVJJW3B5bzMtYnVpbGQtY29uZmlnLTAuMjkuMC5zaGEyNTZzdW1dID0gImM1
ZTJhN2QyZjBkMDEzMzQyZjI5NWMwNDhhZDE5MjM3YWRkNTE1NGE1NWIxYzVhMjU0YzBlYzkzZDQx
MDkwNzgiCitTUkNfVVJJW3B5bzMtZmZpLTAuMjkuMC5zaGEyNTZzdW1dID0gImNhODVjNDY3ZGEx
YmJjOGQ4NjZlZWE1ZGVmZjljZjI5ZWE1Zjc3ODUwNTRhMTdkYTM2ZTY1YmRhOWMwNTg0NWIiCitT
UkNfVVJJW3B5bzMtbWFjcm9zLTAuMjkuMC5zaGEyNTZzdW1dID0gIjlhYzUzNzYyZmQwNjVkYWEz
MTk0ZGQwOTMzN2EzOGJkNzkzYTE4ODEwMGZkMWE5MzA0YzRhYjMxMmQ5MDE3NzEiCitTUkNfVVJJ
W3B5bzMtbWFjcm9zLWJhY2tlbmQtMC4yOS4wLnNoYTI1NnN1bV0gPSAiNGNhM2ExNTU3Mzk5Nzgz
MTcyZGM1YmYzOWNmY2E4MzUxNTc3MzI1MzJjYmE1NmI3MWQyMjkyMTYxZTUzYjM2MiIKIFNSQ19V
UklbcXVvdGUtMS4wLjQyLnNoYTI1NnN1bV0gPSAiYTMzOGNjNDFkMjdlNmNjNmRjZTZjZWZjMTNh
MDcyOWRmYmI4MWMyNjJiMWY1MTkzMzE1NzVkZDgwZWYzMDY3ZiIKIFNSQ19VUklbcnBkcy0xLjIu
MS5zaGEyNTZzdW1dID0gImUwMjVmZWIyNjIxMGJjMTk2YjkwOGU3MmRlYjA2M2IxYjQwMDA3NTQz
MDQzNDFjYmMxNjhhMWU3MmM4NTdlYmMiCi1TUkNfVVJJW3NobGV4LTEuMy4wLnNoYTI1NnN1bV0g
PSAiMGZkYTJmZjBkMDg0MDE5YmE0ZDdjNmYzNzFjOTVkOGZkNzVjZTM1MjRjM2NiOGZiNjUzYTMw
MjNmNjMyM2U2NCIKIFNSQ19VUklbc21hbGx2ZWMtMS4xNS4xLnNoYTI1NnN1bV0gPSAiNjdiMWI3
YTNiNWZlNGYxMzc2ODg3MTg0MDQ1ZmNmNDVjNjllOTJhZjczNGI3YWFkZGMwNWZiNzc3YjZmYmQw
MyIKIFNSQ19VUklbc3luLTIuMC4xMTEuc2hhMjU2c3VtXSA9ICIzOTBjYzlhMjk0YWI3MWJkYjFh
YTJlOTlkMTNiZTljNzUzY2QyZDdiZDY1NjBjNzcxMTg1OTc0MTBjNGQyZTg3IgogU1JDX1VSSVt0
YXJnZXQtbGV4aWNvbi0wLjEzLjMuc2hhMjU2c3VtXSA9ICJkZjdmNjI1NzdjMjVlMDc4MzQ2NDlm
YzNiMzlmYWZkYzU5N2MwYTM1MjdkYzFjNjAxMjkyMDFjY2ZjYmFhNTBjIgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJwZHMtcHlfMjAyNi41LjEuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnBkcy1weV8yMDI2LjYuMy5i
YgpzaW1pbGFyaXR5IGluZGV4IDg0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcnBkcy1weV8yMDI2LjUuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJwZHMtcHlfMjAyNi42LjMuYmIKaW5kZXggN2YxNTEx
NTg5Zi4uNTg5ODY0OWMzYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXJwZHMtcHlfMjAyNi41LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXJwZHMtcHlfMjAyNi42LjMuYmIKQEAgLTQsNyArNCw3IEBAIEhPTUVQ
QUdFID0gImh0dHBzOi8vcHlwaS5vcmcvcHJvamVjdC9ycGRzLXB5LyIKIExJQ0VOU0UgPSAiTUlU
IgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9Nzc2N2ZhNTM3YzQ1OTZj
NTQxNDFmMzI4ODJjNGE5ODQiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIwN2IyNGZlYTQwNTQx
ZTI4NTcwZTViNzk1YTRhMzhmYmRjZDEyNTUwYzA2YmQwNzQ4MDA1ZWNjODExNmNhMjU2IgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjFjZWJkMTMzN2MyNDJlNGVjMjI5M2U1NDFmNzEyYjJkYTg0OWIy
OWY0OGYwYzI5MzY4NGI3MWMwNjMyNjI1ZDQiCiAKIHJlcXVpcmUgJHtCUE59LWNyYXRlcy5pbmMK
IAotLSAKMi40Ny4xCgo=

--===============7505865323060132413==--

