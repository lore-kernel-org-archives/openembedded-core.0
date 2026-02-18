Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFA9EC531CD
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:41:47 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1415.1771440097149094134
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=CG3AKzFv;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=XQhFbHA3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019c720ec412-e2eaf0f8-882b-48c9-8903-0d11c7b57e89-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440096;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=S+wrQzK8N8COAoF8gE3u/vyQqnKT6N9nO8Y10J18r14=;
	b=CG3AKzFv+kWN/xOezEKPGM8lWCOns+t+VTJf8iLR91NSr4bRiVBEUUe2+/Iwzwe8
	97U8i4TvNfFQWy1fv58UmpJp1XlTW7Ghe9r7k/hzl+vfp7LU9Ru68jPx0S6B4fh/SUk
	G1vFGaGvy8zcr/62yVdRFhCc95YigS/wDdubGZXg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440096;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=S+wrQzK8N8COAoF8gE3u/vyQqnKT6N9nO8Y10J18r14=;
	b=XQhFbHA3FJ7ggraFXUGT29HFQWdAJcX/pzNzyNwHxujf6ORQHIdaA8KvV0nl0/pz
	0F7r8Oeo1amMV7moPfTUufrZFiW7xkyks1lnIgFPe65bLaAPnh2IUWhgASN58x/s3Bu
	6R4YKL7XE1S5LpHsbq6OxtTZhnP9hHxa3CehZusU=
Content-Type: multipart/mixed; boundary="===============4979867040452794794=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>, 
	Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cryptography-vectors,python3-cryptography: upgrading to
 46.0.5,46.0.5 SUCCEEDED
Message-ID: <0101019c720ec412-e2eaf0f8-882b-48c9-8903-0d11c7b57e89-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:36 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:41:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231329

--===============4979867040452794794==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-cryptography-vectors,python3-cryptography* to *46.0.5,46.0.5* has Succeeded.

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
From 64556baf18d4e7196cb942eaf555938ff8cc8783 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 10:09:09 +0000
Subject: [PATCH] python3-cryptography-vectors,python3-cryptography: upgrade
 46.0.4 -> 46.0.5,46.0.4 -> 46.0.5

---
 meta/recipes-devtools/python/python3-cryptography-common.inc  | 2 +-
 meta/recipes-devtools/python/python3-cryptography-vectors.bb  | 2 +-
 ...001-pyproject.toml-bump-uv_build-version-requirement.patch | 4 ++--
 meta/recipes-devtools/python/python3-cryptography.bb          | 2 +-
 .../0001-pyproject.toml-remove-benchmark-disable-option.patch | 4 ++--
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-cryptography-common.inc b/meta/recipes-devtools/python/python3-cryptography-common.inc
index 789ce89e53..4e4434bd66 100644
--- a/meta/recipes-devtools/python/python3-cryptography-common.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-common.inc
@@ -3,4 +3,4 @@
 #
 # Additionally AUH will detect that they share this .inc file and
 # perform a lockstep upgrade for both.
-PV = "46.0.4"
+PV = "46.0.5"
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors.bb b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
index 1408b6b010..31e37e95cd 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
 SRC_URI += "file://0001-pyproject.toml-bump-uv_build-version-requirement.patch"
-SRC_URI[sha256sum] = "fb8e489f5688d9751fd9631d4be0a0df3275698e78d6d753c1b8cf3ce4127c78"
+SRC_URI[sha256sum] = "ffbccee9455201c01b37c63d65d9f83b362d40c2bed9caac248ebbdfa4e4fc7c"
 
 PYPI_PACKAGE = "cryptography_vectors"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors/0001-pyproject.toml-bump-uv_build-version-requirement.patch b/meta/recipes-devtools/python/python3-cryptography-vectors/0001-pyproject.toml-bump-uv_build-version-requirement.patch
index 23af7c200d..6faaf1051d 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors/0001-pyproject.toml-bump-uv_build-version-requirement.patch
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors/0001-pyproject.toml-bump-uv_build-version-requirement.patch
@@ -1,4 +1,4 @@
-From f2f6b2b391a34a10ad5d94f5c8c70c32a72a34a3 Mon Sep 17 00:00:00 2001
+From 6d4c14a2781fb02903fd4d59f638cf72ee370b8d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 18 Dec 2025 20:20:13 +0100
 Subject: [PATCH] pyproject.toml: bump uv_build version requirement
@@ -10,7 +10,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index 9beed0d..0c421f3 100644
+index 2ed12a3..f01d2c1 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
 @@ -1,5 +1,5 @@
diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/recipes-devtools/python/python3-cryptography.bb
index 036bfd2117..fc5cb50b02 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -11,7 +11,7 @@ LDSHARED += "-pthread"
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography-vectors
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "bfd019f60f8abc2ed1b9be4ddc21cfef059c841d86d710bb69909a688cbb8f59"
+SRC_URI[sha256sum] = "abace499247268e3757271b2f1e244b36b06f8515cf27c4d49468fc9eb16e93d"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://check-memfree.py \
diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
index 866b7a058f..5c2e3c53ba 100644
--- a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
@@ -1,4 +1,4 @@
-From 1fb7785f80037fa1258added61470d0c73fd3222 Mon Sep 17 00:00:00 2001
+From 6d6fbe77732ce3c4d2dcf3a5f75bb20ea352bf4a Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Tue, 17 May 2022 17:22:48 +0800
 Subject: [PATCH] pyproject.toml: remove --benchmark-disable option
@@ -26,7 +26,7 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index b3d8c31..6593057 100644
+index 95ced11..75bfcbb 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
 @@ -134,7 +134,7 @@ exclude = [
-- 
2.47.1


--===============4979867040452794794==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: FILELIST: directory renamed /usr/lib/python3.14/site-packages/cryptography_vectors-46.0.4.dist-info -> /usr/lib/python3.14/site-packages/cryptography_vectors-46.0.5.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.14/site-packages/cryptography_vectors-46.0.4.dist-info moved to /usr/lib/python3.14/site-packages/cryptography_vectors-46.0.5.dist-info
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography: FILELIST: directory renamed /usr/lib/python3.14/site-packages/cryptography-46.0.4.dist-info -> /usr/lib/python3.14/site-packages/cryptography-46.0.5.dist-info, directory renamed /usr/lib/python3.14/site-packages/cryptography-46.0.4.dist-info/licenses -> /usr/lib/python3.14/site-packages/cryptography-46.0.5.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-cryptography (sysroot):
  /usr/lib/python3.14/site-packages/cryptography-46.0.4.dist-info moved to /usr/lib/python3.14/site-packages/cryptography-46.0.5.dist-info

--===============4979867040452794794==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-cryptography-vectors: PKGV changed from 46.0.4 [default] to 46.0.5 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-46.0.4.tar.gz;downloadfilename=cryptography_vectors-46.0.4.tar.gz file://0001-pyproject.toml-bump-uv_build-version-requirement.patch" to "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-46.0.5.tar.gz;downloadfilename=cryptography_vectors-46.0.5.tar.gz file://0001-pyproject.toml-bump-uv_build-version-requirement.patch"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors: PV changed from "46.0.4" to "46.0.5"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PKGV changed from 46.0.4 [default] to 46.0.5 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PV changed from "46.0.4" to "46.0.5"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PKGV changed from 46.0.4 [default] to 46.0.5 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PV changed from "46.0.4" to "46.0.5"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PKGV changed from 46.0.4 [default] to 46.0.5 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PV changed from "46.0.4" to "46.0.5"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PKGV changed from 46.0.4 [default] to 46.0.5 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PV changed from "46.0.4" to "46.0.5"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PKGV changed from 46.0.4 [default] to 46.0.5 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PV changed from "46.0.4" to "46.0.5"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PKGV changed from 46.0.4 [default] to 46.0.5 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PV changed from "46.0.4" to "46.0.5"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PKGV changed from 46.0.4 [default] to 46.0.5 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: FILELIST: directory renamed /usr/lib/python3.14/site-packages/cryptography_vectors-46.0.4.dist-info -> /usr/lib/python3.14/site-packages/cryptography_vectors-46.0.5.dist-info
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PV changed from "46.0.4" to "46.0.5"
Changes to packages/x86-64-v3-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.14/site-packages/cryptography_vectors-46.0.4.dist-info moved to /usr/lib/python3.14/site-packages/cryptography_vectors-46.0.5.dist-info
packages/x86-64-v3-poky-linux/python3-cryptography: PKGV changed from 46.0.4 [default] to 46.0.5 [default]
packages/x86-64-v3-poky-linux/python3-cryptography: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cryptography/cryptography-46.0.4.tar.gz;downloadfilename=cryptography-46.0.4.tar.gz file://0001-pyproject.toml-remove-benchmark-disable-option.patch file://check-memfree.py file://run-ptest crate://crates.io/asn1/0.22.0 crate://crates.io/asn1_derive/0.22.0 crate://crates.io/autocfg/1.5.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/2.9.4 crate://crates.io/cc/1.2.37 crate://crates.io/cfg-if/1.0.3 crate://crates.io/find-msvc-tools/0.1.1 crate://crates.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shared/0.1.1 crate://crates.io/heck/0.5.0 crate://crates.io/indoc/2.0.6 crate://crates.io/itoa/1.0.15 crate://crates.io/libc/0.2.175 crate://crates.io/memoffset/0.9.1 crate://crates.io/once_cell/1.21.3 crate://crates.io/openssl/0.10.74 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-sys/0.9.110 crate://crates.io/pem/3.0.5 crate://cra
 tes.io/pkg-config/0.3.32 crate://crates.io/portable-atomic/1.11.1 crate://crates.io/proc-macro2/1.0.101 crate://crates.io/pyo3/0.26.0 crate://crates.io/pyo3-build-config/0.26.0 crate://crates.io/pyo3-ffi/0.26.0 crate://crates.io/pyo3-macros/0.26.0 crate://crates.io/pyo3-macros-backend/0.26.0 crate://crates.io/quote/1.0.40 crate://crates.io/self_cell/1.2.0 crate://crates.io/shlex/1.3.0 crate://crates.io/syn/2.0.106 crate://crates.io/target-lexicon/0.13.3 crate://crates.io/unicode-ident/1.0.19 crate://crates.io/unindent/0.2.4 crate://crates.io/vcpkg/0.2.15" to "https://files.pythonhosted.org/packages/source/c/cryptography/cryptography-46.0.5.tar.gz;downloadfilename=cryptography-46.0.5.tar.gz file://0001-pyproject.toml-remove-benchmark-disable-option.patch file://check-memfree.py file://run-ptest crate://crates.io/asn1/0.22.0 crate://crates.io/asn1_derive/0.22.0 crate://crates.io/autocfg/1.5.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/2.9.4 crate://crates.io/cc/1.2.37 
 crate://crates.io/cfg-if/1.0.3 crate://crates.io/find-msvc-tools/0.1.1 crate://crates.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shared/0.1.1 crate://crates.io/heck/0.5.0 crate://crates.io/indoc/2.0.6 crate://crates.io/itoa/1.0.15 crate://crates.io/libc/0.2.175 crate://crates.io/memoffset/0.9.1 crate://crates.io/once_cell/1.21.3 crate://crates.io/openssl/0.10.74 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-sys/0.9.110 crate://crates.io/pem/3.0.5 crate://crates.io/pkg-config/0.3.32 crate://crates.io/portable-atomic/1.11.1 crate://crates.io/proc-macro2/1.0.101 crate://crates.io/pyo3/0.26.0 crate://crates.io/pyo3-build-config/0.26.0 crate://crates.io/pyo3-ffi/0.26.0 crate://crates.io/pyo3-macros/0.26.0 crate://crates.io/pyo3-macros-backend/0.26.0 crate://crates.io/quote/1.0.40 crate://crates.io/self_cell/1.2.0 crate://crates.io/shlex/1.3.0 crate://crates.io/syn/2.0.106 crate://crates.io/target-lexicon/0.13.3 crate://crates.io/unicode-ident/1.0.19 crate:/
 /crates.io/unindent/0.2.4 crate://crates.io/vcpkg/0.2.15"
packages/x86-64-v3-poky-linux/python3-cryptography: PV changed from "46.0.4" to "46.0.5"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-dbg: PKGV changed from 46.0.4 [default] to 46.0.5 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-dbg: PKGSIZE changed from 1201864 to 1201696 (-0%)
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-dbg: PV changed from "46.0.4" to "46.0.5"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-dev: PKGV changed from 46.0.4 [default] to 46.0.5 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-dev: PV changed from "46.0.4" to "46.0.5"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-doc: PKGV changed from 46.0.4 [default] to 46.0.5 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-doc: PV changed from "46.0.4" to "46.0.5"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-locale: PKGV changed from 46.0.4 [default] to 46.0.5 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-locale: PV changed from "46.0.4" to "46.0.5"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-ptest: PKGV changed from 46.0.4 [default] to 46.0.5 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-ptest: PKGSIZE changed from 1820813 to 1822520 (+0%)
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-ptest: PV changed from "46.0.4" to "46.0.5"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-src: PKGV changed from 46.0.4 [default] to 46.0.5 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-src: PV changed from "46.0.4" to "46.0.5"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-staticdev: PKGV changed from 46.0.4 [default] to 46.0.5 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-staticdev: PV changed from "46.0.4" to "46.0.5"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography: PKGV changed from 46.0.4 [default] to 46.0.5 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography: PKGSIZE changed from 5062514 to 5059351 (-0%)
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography: FILELIST: directory renamed /usr/lib/python3.14/site-packages/cryptography-46.0.4.dist-info -> /usr/lib/python3.14/site-packages/cryptography-46.0.5.dist-info, directory renamed /usr/lib/python3.14/site-packages/cryptography-46.0.4.dist-info/licenses -> /usr/lib/python3.14/site-packages/cryptography-46.0.5.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography: PV changed from "46.0.4" to "46.0.5"
Changes to packages/x86-64-v3-poky-linux/python3-cryptography (sysroot):
  /usr/lib/python3.14/site-packages/cryptography-46.0.4.dist-info moved to /usr/lib/python3.14/site-packages/cryptography-46.0.5.dist-info

--===============4979867040452794794==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cryptography-vectors-python3-cryptography-up.patch"

RnJvbSA2NDU1NmJhZjE4ZDRlNzE5NmNiOTQyZWFmNTU1OTM4ZmY4Y2M4NzgzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTA6MDk6MDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzLHB5dGhvbjMtY3J5cHRvZ3JhcGh5OiB1cGdyYWRl
CiA0Ni4wLjQgLT4gNDYuMC41LDQ2LjAuNCAtPiA0Ni4wLjUKCi0tLQogbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS1jb21tb24uaW5jICB8IDIgKy0KIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9ycy5i
YiAgfCAyICstCiAuLi4wMDEtcHlwcm9qZWN0LnRvbWwtYnVtcC11dl9idWlsZC12ZXJzaW9uLXJl
cXVpcmVtZW50LnBhdGNoIHwgNCArKy0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtY3J5cHRvZ3JhcGh5LmJiICAgICAgICAgIHwgMiArLQogLi4uLzAwMDEtcHlwcm9qZWN0
LnRvbWwtcmVtb3ZlLWJlbmNobWFyay1kaXNhYmxlLW9wdGlvbi5wYXRjaCB8IDQgKystLQogNSBm
aWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS1jb21t
b24uaW5jIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBo
eS1jb21tb24uaW5jCmluZGV4IDc4OWNlODllNTMuLjRlNDQzNGJkNjYgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktY29tbW9uLmlu
YworKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5
LWNvbW1vbi5pbmMKQEAgLTMsNCArMyw0IEBACiAjCiAjIEFkZGl0aW9uYWxseSBBVUggd2lsbCBk
ZXRlY3QgdGhhdCB0aGV5IHNoYXJlIHRoaXMgLmluYyBmaWxlIGFuZAogIyBwZXJmb3JtIGEgbG9j
a3N0ZXAgdXBncmFkZSBmb3IgYm90aC4KLVBWID0gIjQ2LjAuNCIKK1BWID0gIjQ2LjAuNSIKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFw
aHktdmVjdG9ycy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlw
dG9ncmFwaHktdmVjdG9ycy5iYgppbmRleCAxNDA4YjZiMDEwLi4zMWUzN2U5NWNkIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LXZl
Y3RvcnMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0
b2dyYXBoeS12ZWN0b3JzLmJiCkBAIC0xMCw3ICsxMCw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0xJQ0VOU0U7bWQ1PThjMzYxN2RiNGZiNmZhZTAxZjFkMjUzYWI5MTUxMWU0IFwKICMg
ICAgICAgVXBncmFkZSBib3RoIHJlY2lwZXMgYXQgdGhlIHNhbWUgdGltZQogcmVxdWlyZSBweXRo
b24zLWNyeXB0b2dyYXBoeS1jb21tb24uaW5jCiBTUkNfVVJJICs9ICJmaWxlOi8vMDAwMS1weXBy
b2plY3QudG9tbC1idW1wLXV2X2J1aWxkLXZlcnNpb24tcmVxdWlyZW1lbnQucGF0Y2giCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiZmI4ZTQ4OWY1Njg4ZDk3NTFmZDk2MzFkNGJlMGEwZGYzMjc1Njk4
ZTc4ZDZkNzUzYzFiOGNmM2NlNDEyN2M3OCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJmZmJjY2Vl
OTQ1NTIwMWMwMWIzN2M2M2Q2NWQ5ZjgzYjM2MmQ0MGMyYmVkOWNhYWMyNDhlYmJkZmE0ZTRmYzdj
IgogCiBQWVBJX1BBQ0tBR0UgPSAiY3J5cHRvZ3JhcGh5X3ZlY3RvcnMiCiBVUFNUUkVBTV9DSEVD
S19QWVBJX1BBQ0tBR0UgPSAiJHtQWVBJX1BBQ0tBR0V9IgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzLzAwMDEtcHlw
cm9qZWN0LnRvbWwtYnVtcC11dl9idWlsZC12ZXJzaW9uLXJlcXVpcmVtZW50LnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzLzAw
MDEtcHlwcm9qZWN0LnRvbWwtYnVtcC11dl9idWlsZC12ZXJzaW9uLXJlcXVpcmVtZW50LnBhdGNo
CmluZGV4IDIzYWY3YzIwMGQuLjZmYWFmMTA1MWQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9ycy8wMDAxLXB5cHJvamVj
dC50b21sLWJ1bXAtdXZfYnVpbGQtdmVyc2lvbi1yZXF1aXJlbWVudC5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnMvMDAw
MS1weXByb2plY3QudG9tbC1idW1wLXV2X2J1aWxkLXZlcnNpb24tcmVxdWlyZW1lbnQucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIGYyZjZiMmIzOTFhMzRhMTBhZDVkOTRmNWM4YzcwYzMyYTcy
YTM0YTMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDZkNGMxNGEyNzgxZmIwMjkwM2Zk
NGQ1OWY2MzhjZjcyZWUzNzBiOGQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4
YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgogRGF0ZTogVGh1LCAxOCBEZWMgMjAy
NSAyMDoyMDoxMyArMDEwMAogU3ViamVjdDogW1BBVENIXSBweXByb2plY3QudG9tbDogYnVtcCB1
dl9idWlsZCB2ZXJzaW9uIHJlcXVpcmVtZW50CkBAIC0xMCw3ICsxMCw3IEBAIFNpZ25lZC1vZmYt
Ynk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+CiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9weXByb2pl
Y3QudG9tbCBiL3B5cHJvamVjdC50b21sCi1pbmRleCA5YmVlZDBkLi4wYzQyMWYzIDEwMDY0NAor
aW5kZXggMmVkMTJhMy4uZjAxZDJjMSAxMDA2NDQKIC0tLSBhL3B5cHJvamVjdC50b21sCiArKysg
Yi9weXByb2plY3QudG9tbAogQEAgLTEsNSArMSw1IEBACmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LmJiIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS5iYgppbmRleCAwMzZiZmQyMTE3
Li5mYzVjYjUwYjAyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtY3J5cHRvZ3JhcGh5LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1jcnlwdG9ncmFwaHkuYmIKQEAgLTExLDcgKzExLDcgQEAgTERTSEFSRUQgKz0gIi1w
dGhyZWFkIgogIyBOT1RFOiBNYWtlIHN1cmUgdG8ga2VlcCB0aGlzIHJlY2lwZSBhdCB0aGUgc2Ft
ZSB2ZXJzaW9uIGFzIHB5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnMKICMgICAgICAgVXBncmFk
ZSBib3RoIHJlY2lwZXMgYXQgdGhlIHNhbWUgdGltZQogcmVxdWlyZSBweXRob24zLWNyeXB0b2dy
YXBoeS1jb21tb24uaW5jCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYmZkMDE5ZjYwZjhhYmMyZWQx
YjliZTRkZGMyMWNmZWYwNTljODQxZDg2ZDcxMGJiNjk5MDlhNjg4Y2JiOGY1OSIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICJhYmFjZTQ5OTI0NzI2OGUzNzU3MjcxYjJmMWUyNDRiMzZiMDZmODUxNWNm
MjdjNGQ0OTQ2OGZjOWViMTZlOTNkIgogCiBTUkNfVVJJICs9ICJmaWxlOi8vMDAwMS1weXByb2pl
Y3QudG9tbC1yZW1vdmUtYmVuY2htYXJrLWRpc2FibGUtb3B0aW9uLnBhdGNoIFwKICAgICAgICAg
ICAgIGZpbGU6Ly9jaGVjay1tZW1mcmVlLnB5IFwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHkvMDAwMS1weXByb2plY3QudG9tbC1y
ZW1vdmUtYmVuY2htYXJrLWRpc2FibGUtb3B0aW9uLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS8wMDAxLXB5cHJvamVjdC50b21sLXJlbW92
ZS1iZW5jaG1hcmstZGlzYWJsZS1vcHRpb24ucGF0Y2gKaW5kZXggODY2YjdhMDU4Zi4uNWMyZTNj
NTNiYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNy
eXB0b2dyYXBoeS8wMDAxLXB5cHJvamVjdC50b21sLXJlbW92ZS1iZW5jaG1hcmstZGlzYWJsZS1v
cHRpb24ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNy
eXB0b2dyYXBoeS8wMDAxLXB5cHJvamVjdC50b21sLXJlbW92ZS1iZW5jaG1hcmstZGlzYWJsZS1v
cHRpb24ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDFmYjc3ODVmODAwMzdmYTEyNThhZGRl
ZDYxNDcwZDBjNzNmZDMyMjIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDZkNmZiZTc3
NzMyY2UzYzRkMmRjZjNhNWY3NWJiMjBlYTM1MmJmNGEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBNaW5nbGkgWXUgPG1pbmdsaS55dUB3aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCAx
NyBNYXkgMjAyMiAxNzoyMjo0OCArMDgwMAogU3ViamVjdDogW1BBVENIXSBweXByb2plY3QudG9t
bDogcmVtb3ZlIC0tYmVuY2htYXJrLWRpc2FibGUgb3B0aW9uCkBAIC0yNiw3ICsyNiw3IEBAIFNp
Z25lZC1vZmYtYnk6IFRpbSBPcmxpbmcgPHRpbS5vcmxpbmdAa29uc3Vsa28uY29tPgogIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEv
cHlwcm9qZWN0LnRvbWwgYi9weXByb2plY3QudG9tbAotaW5kZXggYjNkOGMzMS4uNjU5MzA1NyAx
MDA2NDQKK2luZGV4IDk1Y2VkMTEuLjc1YmZjYmIgMTAwNjQ0CiAtLS0gYS9weXByb2plY3QudG9t
bAogKysrIGIvcHlwcm9qZWN0LnRvbWwKIEBAIC0xMzQsNyArMTM0LDcgQEAgZXhjbHVkZSA9IFsK
LS0gCjIuNDcuMQoK

--===============4979867040452794794==--

