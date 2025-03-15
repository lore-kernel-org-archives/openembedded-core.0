Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9358BC35FF3
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:19 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.10325.1742048289486558995
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=KRnHG8RM;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=QAhGR7WX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101959a2b5f82-1b0e1f30-a361-4a9d-a25c-180c32b0fbbe-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048288;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WePOctk8L3L+TGNOfQ2mz0FsxvIMKuFhhAnm7FZZc2o=;
	b=KRnHG8RMqVPHy+GZeXuE2ZaaK/DeH8yuCSPSC3euAdO1oLsNY9o6/wS2Csu+pdfp
	c921QQMU84lULJlctP3Z8/QdCHxY9cIRLIgr8ESxTFq+EM9mZjAktYyHd68a31IAIId
	XhRfe3l3UW2U0vni+INI1zT5h5gHytYeWGvFiZ/g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048288;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WePOctk8L3L+TGNOfQ2mz0FsxvIMKuFhhAnm7FZZc2o=;
	b=QAhGR7WXko+vaCzA3KfMkU7b9yAOy4mxfVvKmB+zwFzMX7z9NLcApGvL0eF7QnCi
	drn8McEkNRlLxl3cu4x4dx7iSQ7oq5klu1BU3fnnsm/ls9DMPP67rwfT26aupkK47Ac
	rqS9+v4aitPgdFvVo96F8r6XSZdnqsGyhlKpWmf4=
Content-Type: multipart/mixed; boundary="===============3924567498908835373=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>, 
	Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cryptography,python3-cryptography-vectors: upgrading to
 44.0.2,44.0.2 SUCCEEDED
Message-ID: <010101959a2b5f82-1b0e1f30-a361-4a9d-a25c-180c32b0fbbe-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212878

--===============3924567498908835373==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-cryptography,python3-cryptography-vectors* to *44.0.2,44.0.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cryptography-python3-cryptography-vectors-up.patch
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
From 4357a99abac0a3f58ac8b09a40ae4407497b5893 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Mar 2025 06:08:16 +0000
Subject: [PATCH] python3-cryptography,python3-cryptography-vectors: upgrade
 44.0.0 -> 44.0.2,44.0.0 -> 44.0.2

---
 .../python/python3-cryptography-common.inc    |  2 +-
 .../python/python3-cryptography-crates.inc    | 20 +++++++++----------
 .../python/python3-cryptography-vectors.bb    |  2 +-
 .../python/python3-cryptography.bb            |  2 +-
 ...toml-remove-benchmark-disable-option.patch |  4 ++--
 5 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-cryptography-common.inc b/meta/recipes-devtools/python/python3-cryptography-common.inc
index 4220c7d62c..368a364cf0 100644
--- a/meta/recipes-devtools/python/python3-cryptography-common.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-common.inc
@@ -3,4 +3,4 @@
 #
 # Additionally AUH will detect that they share this .inc file and
 # perform a lockstep upgrade for both.
-PV = "44.0.0"
+PV = "44.0.2"
diff --git a/meta/recipes-devtools/python/python3-cryptography-crates.inc b/meta/recipes-devtools/python/python3-cryptography-crates.inc
index 18f346aed4..b3aa66002e 100644
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
+    crate://crates.io/pyo3/0.23.5 \
+    crate://crates.io/pyo3-build-config/0.23.5 \
+    crate://crates.io/pyo3-ffi/0.23.5 \
+    crate://crates.io/pyo3-macros/0.23.5 \
+    crate://crates.io/pyo3-macros-backend/0.23.5 \
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
+SRC_URI[pyo3-0.23.5.sha256sum] = "7778bffd85cf38175ac1f545509665d0b9b92a198ca7941f131f85f7a4f9a872"
+SRC_URI[pyo3-build-config-0.23.5.sha256sum] = "94f6cbe86ef3bf18998d9df6e0f3fc1050a8c5efa409bf712e661a4366e010fb"
+SRC_URI[pyo3-ffi-0.23.5.sha256sum] = "e9f1b4c431c0bb1c8fb0a338709859eed0d030ff6daa34368d3b152a63dfdd8d"
+SRC_URI[pyo3-macros-0.23.5.sha256sum] = "fbc2201328f63c4710f68abdf653c89d8dbc2858b88c5d88b0ff38a75288a9da"
+SRC_URI[pyo3-macros-backend-0.23.5.sha256sum] = "fca6726ad0f3da9c9de093d6f116a93c1a38e417ed73bf138472cf4064f72028"
 SRC_URI[quote-1.0.37.sha256sum] = "b5b9d34b8991d19d98081b46eacdd8eb58c6f2b201139f7c5f643cc155a633af"
 SRC_URI[self_cell-1.0.4.sha256sum] = "d369a96f978623eb3dc28807c4852d6cc617fed53da5d3c400feff1ef34a714a"
 SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors.bb b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
index 8eae2c3cbe..075115f3f9 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "106228766c45b9a5ffd1a8b3e254f0560c821da79d5cd7fd113a17e3753580ab"
+SRC_URI[sha256sum] = "ab32e156b6e7eaf6d8c727a32245967dcce049487301482fca38c0c5fdc84e4b"
 
 PYPI_PACKAGE = "cryptography_vectors"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/recipes-devtools/python/python3-cryptography.bb
index 69329ec954..566e80c4f9 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -11,7 +11,7 @@ LDSHARED += "-pthread"
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography-vectors
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "cd4e834f340b4293430701e772ec543b0fbe6c2dea510a5286fe0acabe153a02"
+SRC_URI[sha256sum] = "c63454aa261a0cf0c5b4718349629793e9e634993538db841165b3df74f37ec0"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://check-memfree.py \
diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
index b9659eb059..19ade60c03 100644
--- a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
@@ -1,4 +1,4 @@
-From b8d6e70280367b84af1fc776d35554ffd6996994 Mon Sep 17 00:00:00 2001
+From 682c99345a7c8cba87e9cea1187aa007eed962fa Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Tue, 17 May 2022 17:22:48 +0800
 Subject: [PATCH] pyproject.toml: remove --benchmark-disable option
@@ -26,7 +26,7 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index 949d684..8c62432 100644
+index 13d8b2c..e93dee9 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
 @@ -118,7 +118,7 @@ exclude = [
-- 
2.44.1


--===============3924567498908835373==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-cryptography-vectors: PV changed from "44.0.0" to "44.0.2"
packages/core2-64-poky-linux/python3-cryptography-vectors: PKGV changed from 44.0.0 [default] to 44.0.2 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-44.0.0.tar.gz;downloadfilename=cryptography_vectors-44.0.0.tar.gz" to "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-44.0.2.tar.gz;downloadfilename=cryptography_vectors-44.0.2.tar.gz"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PV changed from "44.0.0" to "44.0.2"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PKGV changed from 44.0.0 [default] to 44.0.2 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PV changed from "44.0.0" to "44.0.2"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PKGV changed from 44.0.0 [default] to 44.0.2 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PV changed from "44.0.0" to "44.0.2"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PKGV changed from 44.0.0 [default] to 44.0.2 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PV changed from "44.0.0" to "44.0.2"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PKGV changed from 44.0.0 [default] to 44.0.2 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PV changed from "44.0.0" to "44.0.2"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PKGV changed from 44.0.0 [default] to 44.0.2 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PV changed from "44.0.0" to "44.0.2"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PKGV changed from 44.0.0 [default] to 44.0.2 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PV changed from "44.0.0" to "44.0.2"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PKGV changed from 44.0.0 [default] to 44.0.2 [default]
Changes to packages/core2-64-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.13/site-packages/cryptography_vectors-44.0.0.dist-info moved to /usr/lib/python3.13/site-packages/cryptography_vectors-44.0.2.dist-info
packages/core2-64-poky-linux/python3-cryptography: PV changed from "44.0.0" to "44.0.2"
packages/core2-64-poky-linux/python3-cryptography: PKGV changed from 44.0.0 [default] to 44.0.2 [default]
packages/core2-64-poky-linux/python3-cryptography: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cryptography/cryptography-44.0.0.tar.gz;downloadfilename=cryptography-44.0.0.tar.gz file://0001-pyproject.toml-remove-benchmark-disable-option.patch file://check-memfree.py file://run-ptest crate://crates.io/asn1/0.20.0 crate://crates.io/asn1_derive/0.20.0 crate://crates.io/autocfg/1.4.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/2.6.0 crate://crates.io/cc/1.2.1 crate://crates.io/cfg-if/1.0.0 crate://crates.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shared/0.1.1 crate://crates.io/heck/0.5.0 crate://crates.io/indoc/2.0.5 crate://crates.io/itoa/1.0.14 crate://crates.io/libc/0.2.166 crate://crates.io/memoffset/0.9.1 crate://crates.io/once_cell/1.20.2 crate://crates.io/openssl/0.10.68 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-sys/0.9.104 crate://crates.io/pem/3.0.4 crate://crates.io/pkg-config/0.3.31 crate://crates.io
 /portable-atomic/1.10.0 crate://crates.io/proc-macro2/1.0.92 crate://crates.io/pyo3/0.23.2 crate://crates.io/pyo3-build-config/0.23.2 crate://crates.io/pyo3-ffi/0.23.2 crate://crates.io/pyo3-macros/0.23.2 crate://crates.io/pyo3-macros-backend/0.23.2 crate://crates.io/quote/1.0.37 crate://crates.io/self_cell/1.0.4 crate://crates.io/shlex/1.3.0 crate://crates.io/syn/2.0.89 crate://crates.io/target-lexicon/0.12.16 crate://crates.io/unicode-ident/1.0.14 crate://crates.io/unindent/0.2.3 crate://crates.io/vcpkg/0.2.15" to "https://files.pythonhosted.org/packages/source/c/cryptography/cryptography-44.0.2.tar.gz;downloadfilename=cryptography-44.0.2.tar.gz file://0001-pyproject.toml-remove-benchmark-disable-option.patch file://check-memfree.py file://run-ptest crate://crates.io/asn1/0.20.0 crate://crates.io/asn1_derive/0.20.0 crate://crates.io/autocfg/1.4.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/2.6.0 crate://crates.io/cc/1.2.1 crate://crates.io/cfg-if/1.0.0 crate://crate
 s.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shared/0.1.1 crate://crates.io/heck/0.5.0 crate://crates.io/indoc/2.0.5 crate://crates.io/itoa/1.0.14 crate://crates.io/libc/0.2.166 crate://crates.io/memoffset/0.9.1 crate://crates.io/once_cell/1.20.2 crate://crates.io/openssl/0.10.68 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-sys/0.9.104 crate://crates.io/pem/3.0.4 crate://crates.io/pkg-config/0.3.31 crate://crates.io/portable-atomic/1.10.0 crate://crates.io/proc-macro2/1.0.92 crate://crates.io/pyo3/0.23.5 crate://crates.io/pyo3-build-config/0.23.5 crate://crates.io/pyo3-ffi/0.23.5 crate://crates.io/pyo3-macros/0.23.5 crate://crates.io/pyo3-macros-backend/0.23.5 crate://crates.io/quote/1.0.37 crate://crates.io/self_cell/1.0.4 crate://crates.io/shlex/1.3.0 crate://crates.io/syn/2.0.89 crate://crates.io/target-lexicon/0.12.16 crate://crates.io/unicode-ident/1.0.14 crate://crates.io/unindent/0.2.3 crate://crates.io/vcpkg/0.2.15"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-dbg: PV changed from "44.0.0" to "44.0.2"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-dbg: PKGV changed from 44.0.0 [default] to 44.0.2 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-dbg: PKGSIZE changed from 1105232 to 1104704 (-0%)
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-dev: PV changed from "44.0.0" to "44.0.2"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-dev: PKGV changed from 44.0.0 [default] to 44.0.2 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-doc: PV changed from "44.0.0" to "44.0.2"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-doc: PKGV changed from 44.0.0 [default] to 44.0.2 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-locale: PV changed from "44.0.0" to "44.0.2"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-locale: PKGV changed from 44.0.0 [default] to 44.0.2 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-ptest: PV changed from "44.0.0" to "44.0.2"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-ptest: PKGV changed from 44.0.0 [default] to 44.0.2 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-src: PV changed from "44.0.0" to "44.0.2"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-src: PKGV changed from 44.0.0 [default] to 44.0.2 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-staticdev: PV changed from "44.0.0" to "44.0.2"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-staticdev: PKGV changed from 44.0.0 [default] to 44.0.2 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography: PV changed from "44.0.0" to "44.0.2"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography: PKGV changed from 44.0.0 [default] to 44.0.2 [default]
Changes to packages/core2-64-poky-linux/python3-cryptography (sysroot):
  /usr/lib/python3.13/site-packages/cryptography-44.0.0.dist-info moved to /usr/lib/python3.13/site-packages/cryptography-44.0.2.dist-info

--===============3924567498908835373==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cryptography-python3-cryptography-vectors-up.patch"

RnJvbSA0MzU3YTk5YWJhYzBhM2Y1OGFjOGIwOWE0MGFlNDQwNzQ5N2I1ODkzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTWFyIDIwMjUgMDY6MDg6MTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNyeXB0b2dyYXBoeSxweXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzOiB1cGdyYWRl
CiA0NC4wLjAgLT4gNDQuMC4yLDQ0LjAuMCAtPiA0NC4wLjIKCi0tLQogLi4uL3B5dGhvbi9weXRo
b24zLWNyeXB0b2dyYXBoeS1jb21tb24uaW5jICAgIHwgIDIgKy0KIC4uLi9weXRob24vcHl0aG9u
My1jcnlwdG9ncmFwaHktY3JhdGVzLmluYyAgICB8IDIwICsrKysrKysrKy0tLS0tLS0tLS0KIC4u
Li9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9ycy5iYiAgICB8ICAyICstCiAuLi4v
cHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LmJiICAgICAgICAgICAgfCAgMiArLQogLi4udG9t
bC1yZW1vdmUtYmVuY2htYXJrLWRpc2FibGUtb3B0aW9uLnBhdGNoIHwgIDQgKystLQogNSBmaWxl
cyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LWNvbW1v
bi5pbmMgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5
LWNvbW1vbi5pbmMKaW5kZXggNDIyMGM3ZDYyYy4uMzY4YTM2NGNmMCAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS1jb21tb24uaW5j
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHkt
Y29tbW9uLmluYwpAQCAtMyw0ICszLDQgQEAKICMKICMgQWRkaXRpb25hbGx5IEFVSCB3aWxsIGRl
dGVjdCB0aGF0IHRoZXkgc2hhcmUgdGhpcyAuaW5jIGZpbGUgYW5kCiAjIHBlcmZvcm0gYSBsb2Nr
c3RlcCB1cGdyYWRlIGZvciBib3RoLgotUFYgPSAiNDQuMC4wIgorUFYgPSAiNDQuMC4yIgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBo
eS1jcmF0ZXMuaW5jIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0
b2dyYXBoeS1jcmF0ZXMuaW5jCmluZGV4IDE4ZjM0NmFlZDQuLmIzYWE2NjAwMmUgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktY3Jh
dGVzLmluYworKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRv
Z3JhcGh5LWNyYXRlcy5pbmMKQEAgLTI0LDExICsyNCwxMSBAQCBTUkNfVVJJICs9ICIgXAogICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3BrZy1jb25maWcvMC4zLjMxIFwKICAgICBjcmF0ZTovL2NyYXRl
cy5pby9wb3J0YWJsZS1hdG9taWMvMS4xMC4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9wcm9j
LW1hY3JvMi8xLjAuOTIgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMvMC4yMy4yIFwKLSAg
ICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLWJ1aWxkLWNvbmZpZy8wLjIzLjIgXAotICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3B5bzMtZmZpLzAuMjMuMiBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlv
My1tYWNyb3MvMC4yMy4yIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLW1hY3Jvcy1iYWNr
ZW5kLzAuMjMuMiBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy8wLjIzLjUgXAorICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3B5bzMtYnVpbGQtY29uZmlnLzAuMjMuNSBcCisgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vcHlvMy1mZmkvMC4yMy41IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLW1h
Y3Jvcy8wLjIzLjUgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMtbWFjcm9zLWJhY2tlbmQv
MC4yMy41IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9xdW90ZS8xLjAuMzcgXAogICAgIGNyYXRl
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
NDNiMGJhN2FlZTJmIgorU1JDX1VSSVtweW8zLTAuMjMuNS5zaGEyNTZzdW1dID0gIjc3NzhiZmZk
ODVjZjM4MTc1YWMxZjU0NTUwOTY2NWQwYjliOTJhMTk4Y2E3OTQxZjEzMWY4NWY3YTRmOWE4NzIi
CitTUkNfVVJJW3B5bzMtYnVpbGQtY29uZmlnLTAuMjMuNS5zaGEyNTZzdW1dID0gIjk0ZjZjYmU4
NmVmM2JmMTg5OThkOWRmNmUwZjNmYzEwNTBhOGM1ZWZhNDA5YmY3MTJlNjYxYTQzNjZlMDEwZmIi
CitTUkNfVVJJW3B5bzMtZmZpLTAuMjMuNS5zaGEyNTZzdW1dID0gImU5ZjFiNGM0MzFjMGJiMWM4
ZmIwYTMzODcwOTg1OWVlZDBkMDMwZmY2ZGFhMzQzNjhkM2IxNTJhNjNkZmRkOGQiCitTUkNfVVJJ
W3B5bzMtbWFjcm9zLTAuMjMuNS5zaGEyNTZzdW1dID0gImZiYzIyMDEzMjhmNjNjNDcxMGY2OGFi
ZGY2NTNjODlkOGRiYzI4NThiODhjNWQ4OGIwZmYzOGE3NTI4OGE5ZGEiCitTUkNfVVJJW3B5bzMt
bWFjcm9zLWJhY2tlbmQtMC4yMy41LnNoYTI1NnN1bV0gPSAiZmNhNjcyNmFkMGYzZGE5YzlkZTA5
M2Q2ZjExNmE5M2MxYTM4ZTQxN2VkNzNiZjEzODQ3MmNmNDA2NGY3MjAyOCIKIFNSQ19VUklbcXVv
dGUtMS4wLjM3LnNoYTI1NnN1bV0gPSAiYjViOWQzNGI4OTkxZDE5ZDk4MDgxYjQ2ZWFjZGQ4ZWI1
OGM2ZjJiMjAxMTM5ZjdjNWY2NDNjYzE1NWE2MzNhZiIKIFNSQ19VUklbc2VsZl9jZWxsLTEuMC40
LnNoYTI1NnN1bV0gPSAiZDM2OWE5NmY5Nzg2MjNlYjNkYzI4ODA3YzQ4NTJkNmNjNjE3ZmVkNTNk
YTVkM2M0MDBmZWZmMWVmMzRhNzE0YSIKIFNSQ19VUklbc2hsZXgtMS4zLjAuc2hhMjU2c3VtXSA9
ICIwZmRhMmZmMGQwODQwMTliYTRkN2M2ZjM3MWM5NWQ4ZmQ3NWNlMzUyNGMzY2I4ZmI2NTNhMzAy
M2Y2MzIzZTY0IgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzLmJiCmluZGV4IDhlYWUyYzNjYmUuLjA3NTEx
NWYzZjkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1j
cnlwdG9ncmFwaHktdmVjdG9ycy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnMuYmIKQEAgLTksNyArOSw3IEBAIExJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PThjMzYxN2RiNGZiNmZhZTAxZjFkMjUzYWI5
MTUxMWU0IFwKICMgTk9URTogTWFrZSBzdXJlIHRvIGtlZXAgdGhpcyByZWNpcGUgYXQgdGhlIHNh
bWUgdmVyc2lvbiBhcyBweXRob24zLWNyeXB0b2dyYXBoeQogIyAgICAgICBVcGdyYWRlIGJvdGgg
cmVjaXBlcyBhdCB0aGUgc2FtZSB0aW1lCiByZXF1aXJlIHB5dGhvbjMtY3J5cHRvZ3JhcGh5LWNv
bW1vbi5pbmMKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIxMDYyMjg3NjZjNDViOWE1ZmZkMWE4YjNl
MjU0ZjA1NjBjODIxZGE3OWQ1Y2Q3ZmQxMTNhMTdlMzc1MzU4MGFiIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gImFiMzJlMTU2YjZlN2VhZjZkOGM3MjdhMzIyNDU5NjdkY2NlMDQ5NDg3MzAxNDgyZmNh
MzhjMGM1ZmRjODRlNGIiCiAKIFBZUElfUEFDS0FHRSA9ICJjcnlwdG9ncmFwaHlfdmVjdG9ycyIK
IFVQU1RSRUFNX0NIRUNLX1BZUElfUEFDS0FHRSA9ICIke1BZUElfUEFDS0FHRX0iCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LmJi
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS5iYgpp
bmRleCA2OTMyOWVjOTU0Li41NjZlODBjNGY5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHkuYmIKQEAgLTExLDcgKzExLDcgQEAg
TERTSEFSRUQgKz0gIi1wdGhyZWFkIgogIyBOT1RFOiBNYWtlIHN1cmUgdG8ga2VlcCB0aGlzIHJl
Y2lwZSBhdCB0aGUgc2FtZSB2ZXJzaW9uIGFzIHB5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnMK
ICMgICAgICAgVXBncmFkZSBib3RoIHJlY2lwZXMgYXQgdGhlIHNhbWUgdGltZQogcmVxdWlyZSBw
eXRob24zLWNyeXB0b2dyYXBoeS1jb21tb24uaW5jCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiY2Q0
ZTgzNGYzNDBiNDI5MzQzMDcwMWU3NzJlYzU0M2IwZmJlNmMyZGVhNTEwYTUyODZmZTBhY2FiZTE1
M2EwMiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJjNjM0NTRhYTI2MWEwY2YwYzViNDcxODM0OTYy
OTc5M2U5ZTYzNDk5MzUzOGRiODQxMTY1YjNkZjc0ZjM3ZWMwIgogCiBTUkNfVVJJICs9ICJmaWxl
Oi8vMDAwMS1weXByb2plY3QudG9tbC1yZW1vdmUtYmVuY2htYXJrLWRpc2FibGUtb3B0aW9uLnBh
dGNoIFwKICAgICAgICAgICAgIGZpbGU6Ly9jaGVjay1tZW1mcmVlLnB5IFwKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHkvMDAwMS1w
eXByb2plY3QudG9tbC1yZW1vdmUtYmVuY2htYXJrLWRpc2FibGUtb3B0aW9uLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS8wMDAxLXB5cHJv
amVjdC50b21sLXJlbW92ZS1iZW5jaG1hcmstZGlzYWJsZS1vcHRpb24ucGF0Y2gKaW5kZXggYjk2
NTllYjA1OS4uMTlhZGU2MGMwMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS8wMDAxLXB5cHJvamVjdC50b21sLXJlbW92ZS1iZW5j
aG1hcmstZGlzYWJsZS1vcHRpb24ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS8wMDAxLXB5cHJvamVjdC50b21sLXJlbW92ZS1iZW5j
aG1hcmstZGlzYWJsZS1vcHRpb24ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGI4ZDZlNzAy
ODAzNjdiODRhZjFmYzc3NmQzNTU1NGZmZDY5OTY5OTQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIDY4MmM5OTM0NWE3YzhjYmE4N2U5Y2VhMTE4N2FhMDA3ZWVkOTYyZmEgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBNaW5nbGkgWXUgPG1pbmdsaS55dUB3aW5kcml2ZXIuY29t
PgogRGF0ZTogVHVlLCAxNyBNYXkgMjAyMiAxNzoyMjo0OCArMDgwMAogU3ViamVjdDogW1BBVENI
XSBweXByb2plY3QudG9tbDogcmVtb3ZlIC0tYmVuY2htYXJrLWRpc2FibGUgb3B0aW9uCkBAIC0y
Niw3ICsyNiw3IEBAIFNpZ25lZC1vZmYtYnk6IFRpbSBPcmxpbmcgPHRpbS5vcmxpbmdAa29uc3Vs
a28uY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
CiBkaWZmIC0tZ2l0IGEvcHlwcm9qZWN0LnRvbWwgYi9weXByb2plY3QudG9tbAotaW5kZXggOTQ5
ZDY4NC4uOGM2MjQzMiAxMDA2NDQKK2luZGV4IDEzZDhiMmMuLmU5M2RlZTkgMTAwNjQ0CiAtLS0g
YS9weXByb2plY3QudG9tbAogKysrIGIvcHlwcm9qZWN0LnRvbWwKIEBAIC0xMTgsNyArMTE4LDcg
QEAgZXhjbHVkZSA9IFsKLS0gCjIuNDQuMQoK

--===============3924567498908835373==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.13/site-packages/cryptography_vectors-44.0.0.dist-info moved to /usr/lib/python3.13/site-packages/cryptography_vectors-44.0.2.dist-info
Changes to packages/core2-64-poky-linux/python3-cryptography (sysroot):
  /usr/lib/python3.13/site-packages/cryptography-44.0.0.dist-info moved to /usr/lib/python3.13/site-packages/cryptography-44.0.2.dist-info

--===============3924567498908835373==--

