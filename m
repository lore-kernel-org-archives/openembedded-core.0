Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A54C021AC
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 12:42:10 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.8046.1739623326598169694
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Feb 2025 04:42:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=e0E+MkIt;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=akL/tTe1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019509a16e7e-6aaa581a-ea46-4857-96e7-b773a0d879ae-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1739623329;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vTTBOpwavvjvVWI5XcxuaBTGX8FUR9eDfmc+viHGIjg=;
	b=e0E+MkItrrMHBI/7iMUwqc7Zbcu0TTytMk7V5++oNFHF3Fve/30Arwgu3tF+ufpl
	qLcxiAcPA6FJ2tY0MHyuFgj+ZWvkBL/dQlwljeoOZtllWuFQA6UX8RrC8wPsd4o0xEP
	MxWKiBBth12B0HwFdpt1zCPvneVDSmbQto8XBlyU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1739623329;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vTTBOpwavvjvVWI5XcxuaBTGX8FUR9eDfmc+viHGIjg=;
	b=akL/tTe1C0XlCTcLFgzidwZALI0gUG8L3DlHNHFvgW1Av6QKNR8mhRbfeDmPZxOR
	rl6gxANWJUKWiBCvWA+4cjmmU9a1myGlpvssrCd8UKzvkOY7U4oPRW46wjaQ3oe2vDN
	7nb3TaMvPPST9z0CVqVd+UJNvV9TJCTVrWp5Ys38=
Content-Type: multipart/mixed; boundary="===============6145856595505035366=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>, 
	Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cryptography-vectors,python3-cryptography: upgrading to
 44.0.1,44.0.1 SUCCEEDED
Message-ID: <0101019509a16e7e-6aaa581a-ea46-4857-96e7-b773a0d879ae-000000@us-west-2.amazonses.com>
Date: Sat, 15 Feb 2025 12:42:09 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 12:42:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211398

--===============6145856595505035366==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-cryptography-vectors,python3-cryptography* to *44.0.1,44.0.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cryptography-vectors-python3-cryptography-up.patch
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
From 7656a0a0543b58b8fc52f715c7ce504edddaa4c5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Feb 2025 05:32:27 +0000
Subject: [PATCH] python3-cryptography-vectors,python3-cryptography: upgrade
 44.0.0 -> 44.0.1,44.0.0 -> 44.0.1

---
 .../python/python3-cryptography-common.inc    |  2 +-
 .../python/python3-cryptography-crates.inc    | 20 +++++++++----------
 .../python/python3-cryptography-vectors.bb    |  2 +-
 .../python/python3-cryptography.bb            |  2 +-
 ...toml-remove-benchmark-disable-option.patch |  4 ++--
 5 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-cryptography-common.inc b/meta/recipes-devtools/python/python3-cryptography-common.inc
index 4220c7d62c..b821f910e8 100644
--- a/meta/recipes-devtools/python/python3-cryptography-common.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-common.inc
@@ -3,4 +3,4 @@
 #
 # Additionally AUH will detect that they share this .inc file and
 # perform a lockstep upgrade for both.
-PV = "44.0.0"
+PV = "44.0.1"
diff --git a/meta/recipes-devtools/python/python3-cryptography-crates.inc b/meta/recipes-devtools/python/python3-cryptography-crates.inc
index 18f346aed4..ccb729cf3c 100644
--- a/meta/recipes-devtools/python/python3-cryptography-crates.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-crates.inc
@@ -24,11 +24,11 @@ SRC_URI += " \
     crate://crates.io/pkg-config/0.3.31 \
     crate://crates.io/portable-atomic/1.10.0 \
     crate://crates.io/proc-macro2/1.0.92 \
-    crate://crates.io/pyo3/0.23.2 \
-    crate://crates.io/pyo3-build-config/0.23.2 \
-    crate://crates.io/pyo3-ffi/0.23.2 \
-    crate://crates.io/pyo3-macros/0.23.2 \
-    crate://crates.io/pyo3-macros-backend/0.23.2 \
+    crate://crates.io/pyo3/0.23.4 \
+    crate://crates.io/pyo3-build-config/0.23.4 \
+    crate://crates.io/pyo3-ffi/0.23.4 \
+    crate://crates.io/pyo3-macros/0.23.4 \
+    crate://crates.io/pyo3-macros-backend/0.23.4 \
     crate://crates.io/quote/1.0.37 \
     crate://crates.io/self_cell/1.0.4 \
     crate://crates.io/shlex/1.3.0 \
@@ -61,11 +61,11 @@ SRC_URI[pem-3.0.4.sha256sum] = "8e459365e590736a54c3fa561947c84837534b8e9af6fc5b
 SRC_URI[pkg-config-0.3.31.sha256sum] = "953ec861398dccce10c670dfeaf3ec4911ca479e9c02154b3a215178c5f566f2"
 SRC_URI[portable-atomic-1.10.0.sha256sum] = "280dc24453071f1b63954171985a0b0d30058d287960968b9b2aca264c8d4ee6"
 SRC_URI[proc-macro2-1.0.92.sha256sum] = "37d3544b3f2748c54e147655edb5025752e2303145b5aefb3c3ea2c78b973bb0"
-SRC_URI[pyo3-0.23.2.sha256sum] = "f54b3d09cbdd1f8c20650b28e7b09e338881482f4aa908a5f61a00c98fba2690"
-SRC_URI[pyo3-build-config-0.23.2.sha256sum] = "3015cf985888fe66cfb63ce0e321c603706cd541b7aec7ddd35c281390af45d8"
-SRC_URI[pyo3-ffi-0.23.2.sha256sum] = "6fca7cd8fd809b5ac4eefb89c1f98f7a7651d3739dfb341ca6980090f554c270"
-SRC_URI[pyo3-macros-0.23.2.sha256sum] = "34e657fa5379a79151b6ff5328d9216a84f55dc93b17b08e7c3609a969b73aa0"
-SRC_URI[pyo3-macros-backend-0.23.2.sha256sum] = "295548d5ffd95fd1981d2d3cf4458831b21d60af046b729b6fd143b0ba7aee2f"
+SRC_URI[pyo3-0.23.4.sha256sum] = "57fe09249128b3173d092de9523eaa75136bf7ba85e0d69eca241c7939c933cc"
+SRC_URI[pyo3-build-config-0.23.4.sha256sum] = "1cd3927b5a78757a0d71aa9dff669f903b1eb64b54142a9bd9f757f8fde65fd7"
+SRC_URI[pyo3-ffi-0.23.4.sha256sum] = "dab6bb2102bd8f991e7749f130a70d05dd557613e39ed2deeee8e9ca0c4d548d"
+SRC_URI[pyo3-macros-0.23.4.sha256sum] = "91871864b353fd5ffcb3f91f2f703a22a9797c91b9ab497b1acac7b07ae509c7"
+SRC_URI[pyo3-macros-backend-0.23.4.sha256sum] = "43abc3b80bc20f3facd86cd3c60beed58c3e2aa26213f3cda368de39c60a27e4"
 SRC_URI[quote-1.0.37.sha256sum] = "b5b9d34b8991d19d98081b46eacdd8eb58c6f2b201139f7c5f643cc155a633af"
 SRC_URI[self_cell-1.0.4.sha256sum] = "d369a96f978623eb3dc28807c4852d6cc617fed53da5d3c400feff1ef34a714a"
 SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors.bb b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
index 8eae2c3cbe..bcdec46e53 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "106228766c45b9a5ffd1a8b3e254f0560c821da79d5cd7fd113a17e3753580ab"
+SRC_URI[sha256sum] = "5a9866b14465dcfaf12bcdfbc3392987bb559f37ac8b8a4c9b6359be7a3d7ea0"
 
 PYPI_PACKAGE = "cryptography_vectors"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/recipes-devtools/python/python3-cryptography.bb
index 69329ec954..0e6eb12f3b 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -11,7 +11,7 @@ LDSHARED += "-pthread"
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography-vectors
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "cd4e834f340b4293430701e772ec543b0fbe6c2dea510a5286fe0acabe153a02"
+SRC_URI[sha256sum] = "f51f5705ab27898afda1aaa430f34ad90dc117421057782022edf0600bec5f14"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://check-memfree.py \
diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
index b9659eb059..d9770b1e84 100644
--- a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
@@ -1,4 +1,4 @@
-From b8d6e70280367b84af1fc776d35554ffd6996994 Mon Sep 17 00:00:00 2001
+From 9e73d98c399a04f5a99dc70756f2c17286e215ca Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Tue, 17 May 2022 17:22:48 +0800
 Subject: [PATCH] pyproject.toml: remove --benchmark-disable option
@@ -26,7 +26,7 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index 949d684..8c62432 100644
+index 759ceba..68bea99 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
 @@ -118,7 +118,7 @@ exclude = [
-- 
2.44.1


--===============6145856595505035366==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-cryptography-vectors: PKGV changed from 44.0.0 [default] to 44.0.1 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors: PV changed from "44.0.0" to "44.0.1"
packages/core2-64-poky-linux/python3-cryptography-vectors: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-44.0.0.tar.gz;downloadfilename=cryptography_vectors-44.0.0.tar.gz" to "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-44.0.1.tar.gz;downloadfilename=cryptography_vectors-44.0.1.tar.gz"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PKGV changed from 44.0.0 [default] to 44.0.1 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PV changed from "44.0.0" to "44.0.1"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PKGV changed from 44.0.0 [default] to 44.0.1 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PV changed from "44.0.0" to "44.0.1"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PKGV changed from 44.0.0 [default] to 44.0.1 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PV changed from "44.0.0" to "44.0.1"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PKGV changed from 44.0.0 [default] to 44.0.1 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PV changed from "44.0.0" to "44.0.1"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PKGV changed from 44.0.0 [default] to 44.0.1 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PV changed from "44.0.0" to "44.0.1"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PKGV changed from 44.0.0 [default] to 44.0.1 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PV changed from "44.0.0" to "44.0.1"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PKGV changed from 44.0.0 [default] to 44.0.1 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PV changed from "44.0.0" to "44.0.1"
Changes to packages/core2-64-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.13/site-packages/cryptography_vectors-44.0.0.dist-info moved to /usr/lib/python3.13/site-packages/cryptography_vectors-44.0.1.dist-info
packages/core2-64-poky-linux/python3-cryptography: PKGV changed from 44.0.0 [default] to 44.0.1 [default]
packages/core2-64-poky-linux/python3-cryptography: PV changed from "44.0.0" to "44.0.1"
packages/core2-64-poky-linux/python3-cryptography: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cryptography/cryptography-44.0.0.tar.gz;downloadfilename=cryptography-44.0.0.tar.gz file://0001-pyproject.toml-remove-benchmark-disable-option.patch file://check-memfree.py file://run-ptest crate://crates.io/asn1/0.20.0 crate://crates.io/asn1_derive/0.20.0 crate://crates.io/autocfg/1.4.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/2.6.0 crate://crates.io/cc/1.2.1 crate://crates.io/cfg-if/1.0.0 crate://crates.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shared/0.1.1 crate://crates.io/heck/0.5.0 crate://crates.io/indoc/2.0.5 crate://crates.io/itoa/1.0.14 crate://crates.io/libc/0.2.166 crate://crates.io/memoffset/0.9.1 crate://crates.io/once_cell/1.20.2 crate://crates.io/openssl/0.10.68 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-sys/0.9.104 crate://crates.io/pem/3.0.4 crate://crates.io/pkg-config/0.3.31 crate://crates.io
 /portable-atomic/1.10.0 crate://crates.io/proc-macro2/1.0.92 crate://crates.io/pyo3/0.23.2 crate://crates.io/pyo3-build-config/0.23.2 crate://crates.io/pyo3-ffi/0.23.2 crate://crates.io/pyo3-macros/0.23.2 crate://crates.io/pyo3-macros-backend/0.23.2 crate://crates.io/quote/1.0.37 crate://crates.io/self_cell/1.0.4 crate://crates.io/shlex/1.3.0 crate://crates.io/syn/2.0.89 crate://crates.io/target-lexicon/0.12.16 crate://crates.io/unicode-ident/1.0.14 crate://crates.io/unindent/0.2.3 crate://crates.io/vcpkg/0.2.15" to "https://files.pythonhosted.org/packages/source/c/cryptography/cryptography-44.0.1.tar.gz;downloadfilename=cryptography-44.0.1.tar.gz file://0001-pyproject.toml-remove-benchmark-disable-option.patch file://check-memfree.py file://run-ptest crate://crates.io/asn1/0.20.0 crate://crates.io/asn1_derive/0.20.0 crate://crates.io/autocfg/1.4.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/2.6.0 crate://crates.io/cc/1.2.1 crate://crates.io/cfg-if/1.0.0 crate://crate
 s.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shared/0.1.1 crate://crates.io/heck/0.5.0 crate://crates.io/indoc/2.0.5 crate://crates.io/itoa/1.0.14 crate://crates.io/libc/0.2.166 crate://crates.io/memoffset/0.9.1 crate://crates.io/once_cell/1.20.2 crate://crates.io/openssl/0.10.68 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-sys/0.9.104 crate://crates.io/pem/3.0.4 crate://crates.io/pkg-config/0.3.31 crate://crates.io/portable-atomic/1.10.0 crate://crates.io/proc-macro2/1.0.92 crate://crates.io/pyo3/0.23.4 crate://crates.io/pyo3-build-config/0.23.4 crate://crates.io/pyo3-ffi/0.23.4 crate://crates.io/pyo3-macros/0.23.4 crate://crates.io/pyo3-macros-backend/0.23.4 crate://crates.io/quote/1.0.37 crate://crates.io/self_cell/1.0.4 crate://crates.io/shlex/1.3.0 crate://crates.io/syn/2.0.89 crate://crates.io/target-lexicon/0.12.16 crate://crates.io/unicode-ident/1.0.14 crate://crates.io/unindent/0.2.3 crate://crates.io/vcpkg/0.2.15"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-dbg: PKGV changed from 44.0.0 [default] to 44.0.1 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-dbg: PKGSIZE changed from 1095912 to 1098200 (+0%)
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-dbg: PV changed from "44.0.0" to "44.0.1"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-dev: PKGV changed from 44.0.0 [default] to 44.0.1 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-dev: PV changed from "44.0.0" to "44.0.1"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-doc: PKGV changed from 44.0.0 [default] to 44.0.1 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-doc: PV changed from "44.0.0" to "44.0.1"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-locale: PKGV changed from 44.0.0 [default] to 44.0.1 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-locale: PV changed from "44.0.0" to "44.0.1"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-ptest: PKGV changed from 44.0.0 [default] to 44.0.1 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-ptest: PV changed from "44.0.0" to "44.0.1"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-src: PKGV changed from 44.0.0 [default] to 44.0.1 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-src: PV changed from "44.0.0" to "44.0.1"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-staticdev: PKGV changed from 44.0.0 [default] to 44.0.1 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-staticdev: PV changed from "44.0.0" to "44.0.1"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography: PKGV changed from 44.0.0 [default] to 44.0.1 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography: PV changed from "44.0.0" to "44.0.1"
Changes to packages/core2-64-poky-linux/python3-cryptography (sysroot):
  /usr/lib/python3.13/site-packages/cryptography-44.0.0.dist-info moved to /usr/lib/python3.13/site-packages/cryptography-44.0.1.dist-info

--===============6145856595505035366==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cryptography-vectors-python3-cryptography-up.patch"

RnJvbSA3NjU2YTBhMDU0M2I1OGI4ZmM1MmY3MTVjN2NlNTA0ZWRkZGFhNGM1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgRmViIDIwMjUgMDU6MzI6MjcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzLHB5dGhvbjMtY3J5cHRvZ3JhcGh5OiB1cGdyYWRl
CiA0NC4wLjAgLT4gNDQuMC4xLDQ0LjAuMCAtPiA0NC4wLjEKCi0tLQogLi4uL3B5dGhvbi9weXRo
b24zLWNyeXB0b2dyYXBoeS1jb21tb24uaW5jICAgIHwgIDIgKy0KIC4uLi9weXRob24vcHl0aG9u
My1jcnlwdG9ncmFwaHktY3JhdGVzLmluYyAgICB8IDIwICsrKysrKysrKy0tLS0tLS0tLS0KIC4u
Li9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9ycy5iYiAgICB8ICAyICstCiAuLi4v
cHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LmJiICAgICAgICAgICAgfCAgMiArLQogLi4udG9t
bC1yZW1vdmUtYmVuY2htYXJrLWRpc2FibGUtb3B0aW9uLnBhdGNoIHwgIDQgKystLQogNSBmaWxl
cyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LWNvbW1v
bi5pbmMgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5
LWNvbW1vbi5pbmMKaW5kZXggNDIyMGM3ZDYyYy4uYjgyMWY5MTBlOCAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS1jb21tb24uaW5j
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHkt
Y29tbW9uLmluYwpAQCAtMyw0ICszLDQgQEAKICMKICMgQWRkaXRpb25hbGx5IEFVSCB3aWxsIGRl
dGVjdCB0aGF0IHRoZXkgc2hhcmUgdGhpcyAuaW5jIGZpbGUgYW5kCiAjIHBlcmZvcm0gYSBsb2Nr
c3RlcCB1cGdyYWRlIGZvciBib3RoLgotUFYgPSAiNDQuMC4wIgorUFYgPSAiNDQuMC4xIgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBo
eS1jcmF0ZXMuaW5jIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0
b2dyYXBoeS1jcmF0ZXMuaW5jCmluZGV4IDE4ZjM0NmFlZDQuLmNjYjcyOWNmM2MgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktY3Jh
dGVzLmluYworKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRv
Z3JhcGh5LWNyYXRlcy5pbmMKQEAgLTI0LDExICsyNCwxMSBAQCBTUkNfVVJJICs9ICIgXAogICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3BrZy1jb25maWcvMC4zLjMxIFwKICAgICBjcmF0ZTovL2NyYXRl
cy5pby9wb3J0YWJsZS1hdG9taWMvMS4xMC4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9wcm9j
LW1hY3JvMi8xLjAuOTIgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMvMC4yMy4yIFwKLSAg
ICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLWJ1aWxkLWNvbmZpZy8wLjIzLjIgXAotICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3B5bzMtZmZpLzAuMjMuMiBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlv
My1tYWNyb3MvMC4yMy4yIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLW1hY3Jvcy1iYWNr
ZW5kLzAuMjMuMiBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy8wLjIzLjQgXAorICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3B5bzMtYnVpbGQtY29uZmlnLzAuMjMuNCBcCisgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vcHlvMy1mZmkvMC4yMy40IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLW1h
Y3Jvcy8wLjIzLjQgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMtbWFjcm9zLWJhY2tlbmQv
MC4yMy40IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9xdW90ZS8xLjAuMzcgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3NlbGZfY2VsbC8xLjAuNCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2hs
ZXgvMS4zLjAgXApAQCAtNjEsMTEgKzYxLDExIEBAIFNSQ19VUklbcGVtLTMuMC40LnNoYTI1NnN1
bV0gPSAiOGU0NTkzNjVlNTkwNzM2YTU0YzNmYTU2MTk0N2M4NDgzNzUzNGI4ZTlhZjZmYzViCiBT
UkNfVVJJW3BrZy1jb25maWctMC4zLjMxLnNoYTI1NnN1bV0gPSAiOTUzZWM4NjEzOThkY2NjZTEw
YzY3MGRmZWFmM2VjNDkxMWNhNDc5ZTljMDIxNTRiM2EyMTUxNzhjNWY1NjZmMiIKIFNSQ19VUklb
cG9ydGFibGUtYXRvbWljLTEuMTAuMC5zaGEyNTZzdW1dID0gIjI4MGRjMjQ0NTMwNzFmMWI2Mzk1
NDE3MTk4NWEwYjBkMzAwNThkMjg3OTYwOTY4YjliMmFjYTI2NGM4ZDRlZTYiCiBTUkNfVVJJW3By
b2MtbWFjcm8yLTEuMC45Mi5zaGEyNTZzdW1dID0gIjM3ZDM1NDRiM2YyNzQ4YzU0ZTE0NzY1NWVk
YjUwMjU3NTJlMjMwMzE0NWI1YWVmYjNjM2VhMmM3OGI5NzNiYjAiCi1TUkNfVVJJW3B5bzMtMC4y
My4yLnNoYTI1NnN1bV0gPSAiZjU0YjNkMDljYmRkMWY4YzIwNjUwYjI4ZTdiMDllMzM4ODgxNDgy
ZjRhYTkwOGE1ZjYxYTAwYzk4ZmJhMjY5MCIKLVNSQ19VUklbcHlvMy1idWlsZC1jb25maWctMC4y
My4yLnNoYTI1NnN1bV0gPSAiMzAxNWNmOTg1ODg4ZmU2NmNmYjYzY2UwZTMyMWM2MDM3MDZjZDU0
MWI3YWVjN2RkZDM1YzI4MTM5MGFmNDVkOCIKLVNSQ19VUklbcHlvMy1mZmktMC4yMy4yLnNoYTI1
NnN1bV0gPSAiNmZjYTdjZDhmZDgwOWI1YWM0ZWVmYjg5YzFmOThmN2E3NjUxZDM3MzlkZmIzNDFj
YTY5ODAwOTBmNTU0YzI3MCIKLVNSQ19VUklbcHlvMy1tYWNyb3MtMC4yMy4yLnNoYTI1NnN1bV0g
PSAiMzRlNjU3ZmE1Mzc5YTc5MTUxYjZmZjUzMjhkOTIxNmE4NGY1NWRjOTNiMTdiMDhlN2MzNjA5
YTk2OWI3M2FhMCIKLVNSQ19VUklbcHlvMy1tYWNyb3MtYmFja2VuZC0wLjIzLjIuc2hhMjU2c3Vt
XSA9ICIyOTU1NDhkNWZmZDk1ZmQxOTgxZDJkM2NmNDQ1ODgzMWIyMWQ2MGFmMDQ2YjcyOWI2ZmQx
NDNiMGJhN2FlZTJmIgorU1JDX1VSSVtweW8zLTAuMjMuNC5zaGEyNTZzdW1dID0gIjU3ZmUwOTI0
OTEyOGIzMTczZDA5MmRlOTUyM2VhYTc1MTM2YmY3YmE4NWUwZDY5ZWNhMjQxYzc5MzljOTMzY2Mi
CitTUkNfVVJJW3B5bzMtYnVpbGQtY29uZmlnLTAuMjMuNC5zaGEyNTZzdW1dID0gIjFjZDM5Mjdi
NWE3ODc1N2EwZDcxYWE5ZGZmNjY5ZjkwM2IxZWI2NGI1NDE0MmE5YmQ5Zjc1N2Y4ZmRlNjVmZDci
CitTUkNfVVJJW3B5bzMtZmZpLTAuMjMuNC5zaGEyNTZzdW1dID0gImRhYjZiYjIxMDJiZDhmOTkx
ZTc3NDlmMTMwYTcwZDA1ZGQ1NTc2MTNlMzllZDJkZWVlZThlOWNhMGM0ZDU0OGQiCitTUkNfVVJJ
W3B5bzMtbWFjcm9zLTAuMjMuNC5zaGEyNTZzdW1dID0gIjkxODcxODY0YjM1M2ZkNWZmY2IzZjkx
ZjJmNzAzYTIyYTk3OTdjOTFiOWFiNDk3YjFhY2FjN2IwN2FlNTA5YzciCitTUkNfVVJJW3B5bzMt
bWFjcm9zLWJhY2tlbmQtMC4yMy40LnNoYTI1NnN1bV0gPSAiNDNhYmMzYjgwYmMyMGYzZmFjZDg2
Y2QzYzYwYmVlZDU4YzNlMmFhMjYyMTNmM2NkYTM2OGRlMzljNjBhMjdlNCIKIFNSQ19VUklbcXVv
dGUtMS4wLjM3LnNoYTI1NnN1bV0gPSAiYjViOWQzNGI4OTkxZDE5ZDk4MDgxYjQ2ZWFjZGQ4ZWI1
OGM2ZjJiMjAxMTM5ZjdjNWY2NDNjYzE1NWE2MzNhZiIKIFNSQ19VUklbc2VsZl9jZWxsLTEuMC40
LnNoYTI1NnN1bV0gPSAiZDM2OWE5NmY5Nzg2MjNlYjNkYzI4ODA3YzQ4NTJkNmNjNjE3ZmVkNTNk
YTVkM2M0MDBmZWZmMWVmMzRhNzE0YSIKIFNSQ19VUklbc2hsZXgtMS4zLjAuc2hhMjU2c3VtXSA9
ICIwZmRhMmZmMGQwODQwMTliYTRkN2M2ZjM3MWM5NWQ4ZmQ3NWNlMzUyNGMzY2I4ZmI2NTNhMzAy
M2Y2MzIzZTY0IgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzLmJiCmluZGV4IDhlYWUyYzNjYmUuLmJjZGVj
NDZlNTMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1j
cnlwdG9ncmFwaHktdmVjdG9ycy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnMuYmIKQEAgLTksNyArOSw3IEBAIExJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PThjMzYxN2RiNGZiNmZhZTAxZjFkMjUzYWI5
MTUxMWU0IFwKICMgTk9URTogTWFrZSBzdXJlIHRvIGtlZXAgdGhpcyByZWNpcGUgYXQgdGhlIHNh
bWUgdmVyc2lvbiBhcyBweXRob24zLWNyeXB0b2dyYXBoeQogIyAgICAgICBVcGdyYWRlIGJvdGgg
cmVjaXBlcyBhdCB0aGUgc2FtZSB0aW1lCiByZXF1aXJlIHB5dGhvbjMtY3J5cHRvZ3JhcGh5LWNv
bW1vbi5pbmMKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIxMDYyMjg3NjZjNDViOWE1ZmZkMWE4YjNl
MjU0ZjA1NjBjODIxZGE3OWQ1Y2Q3ZmQxMTNhMTdlMzc1MzU4MGFiIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjVhOTg2NmIxNDQ2NWRjZmFmMTJiY2RmYmMzMzkyOTg3YmI1NTlmMzdhYzhiOGE0Yzli
NjM1OWJlN2EzZDdlYTAiCiAKIFBZUElfUEFDS0FHRSA9ICJjcnlwdG9ncmFwaHlfdmVjdG9ycyIK
IFVQU1RSRUFNX0NIRUNLX1BZUElfUEFDS0FHRSA9ICIke1BZUElfUEFDS0FHRX0iCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LmJi
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS5iYgpp
bmRleCA2OTMyOWVjOTU0Li4wZTZlYjEyZjNiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHkuYmIKQEAgLTExLDcgKzExLDcgQEAg
TERTSEFSRUQgKz0gIi1wdGhyZWFkIgogIyBOT1RFOiBNYWtlIHN1cmUgdG8ga2VlcCB0aGlzIHJl
Y2lwZSBhdCB0aGUgc2FtZSB2ZXJzaW9uIGFzIHB5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnMK
ICMgICAgICAgVXBncmFkZSBib3RoIHJlY2lwZXMgYXQgdGhlIHNhbWUgdGltZQogcmVxdWlyZSBw
eXRob24zLWNyeXB0b2dyYXBoeS1jb21tb24uaW5jCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiY2Q0
ZTgzNGYzNDBiNDI5MzQzMDcwMWU3NzJlYzU0M2IwZmJlNmMyZGVhNTEwYTUyODZmZTBhY2FiZTE1
M2EwMiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJmNTFmNTcwNWFiMjc4OThhZmRhMWFhYTQzMGYz
NGFkOTBkYzExNzQyMTA1Nzc4MjAyMmVkZjA2MDBiZWM1ZjE0IgogCiBTUkNfVVJJICs9ICJmaWxl
Oi8vMDAwMS1weXByb2plY3QudG9tbC1yZW1vdmUtYmVuY2htYXJrLWRpc2FibGUtb3B0aW9uLnBh
dGNoIFwKICAgICAgICAgICAgIGZpbGU6Ly9jaGVjay1tZW1mcmVlLnB5IFwKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHkvMDAwMS1w
eXByb2plY3QudG9tbC1yZW1vdmUtYmVuY2htYXJrLWRpc2FibGUtb3B0aW9uLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS8wMDAxLXB5cHJv
amVjdC50b21sLXJlbW92ZS1iZW5jaG1hcmstZGlzYWJsZS1vcHRpb24ucGF0Y2gKaW5kZXggYjk2
NTllYjA1OS4uZDk3NzBiMWU4NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS8wMDAxLXB5cHJvamVjdC50b21sLXJlbW92ZS1iZW5j
aG1hcmstZGlzYWJsZS1vcHRpb24ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS8wMDAxLXB5cHJvamVjdC50b21sLXJlbW92ZS1iZW5j
aG1hcmstZGlzYWJsZS1vcHRpb24ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGI4ZDZlNzAy
ODAzNjdiODRhZjFmYzc3NmQzNTU1NGZmZDY5OTY5OTQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIDllNzNkOThjMzk5YTA0ZjVhOTlkYzcwNzU2ZjJjMTcyODZlMjE1Y2EgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBNaW5nbGkgWXUgPG1pbmdsaS55dUB3aW5kcml2ZXIuY29t
PgogRGF0ZTogVHVlLCAxNyBNYXkgMjAyMiAxNzoyMjo0OCArMDgwMAogU3ViamVjdDogW1BBVENI
XSBweXByb2plY3QudG9tbDogcmVtb3ZlIC0tYmVuY2htYXJrLWRpc2FibGUgb3B0aW9uCkBAIC0y
Niw3ICsyNiw3IEBAIFNpZ25lZC1vZmYtYnk6IFRpbSBPcmxpbmcgPHRpbS5vcmxpbmdAa29uc3Vs
a28uY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
CiBkaWZmIC0tZ2l0IGEvcHlwcm9qZWN0LnRvbWwgYi9weXByb2plY3QudG9tbAotaW5kZXggOTQ5
ZDY4NC4uOGM2MjQzMiAxMDA2NDQKK2luZGV4IDc1OWNlYmEuLjY4YmVhOTkgMTAwNjQ0CiAtLS0g
YS9weXByb2plY3QudG9tbAogKysrIGIvcHlwcm9qZWN0LnRvbWwKIEBAIC0xMTgsNyArMTE4LDcg
QEAgZXhjbHVkZSA9IFsKLS0gCjIuNDQuMQoK

--===============6145856595505035366==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.13/site-packages/cryptography_vectors-44.0.0.dist-info moved to /usr/lib/python3.13/site-packages/cryptography_vectors-44.0.1.dist-info
Changes to packages/core2-64-poky-linux/python3-cryptography (sysroot):
  /usr/lib/python3.13/site-packages/cryptography-44.0.0.dist-info moved to /usr/lib/python3.13/site-packages/cryptography-44.0.1.dist-info

--===============6145856595505035366==--

