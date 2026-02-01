Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 597DAD73EBB
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 13:12:45 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29051.1769951564325005732
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 05:12:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=QN7iGWHf;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=hk6BHjzb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019c19558ecc-8c76846b-4fc3-4b26-8cf8-a96b16aa326a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769951563;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=b0C/zgqy2luenrJHm684HIFV9o+u01eOkvqHH+PpQxM=;
	b=QN7iGWHfCeR6f7EKNQORmvpBliZLCO42d2dRdJqe08OxtK4VMfdKSqq3ApwQDEYZ
	kefB+IA1QDUVWJm1273bSVQLS1GLvz3eptngoLMV9Si6BKpuhADNrwTIBp/yuwLXhRD
	DPC4dNShdrnISABXMXIh8EIX/9PvMQjRTF3Rfgmk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769951563;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=b0C/zgqy2luenrJHm684HIFV9o+u01eOkvqHH+PpQxM=;
	b=hk6BHjzbD0K8152mjiNOK7itv3gAG2cbnPl8DpaDfJJRRAeIZR3dGdU64F/clK/u
	SMhiagRV9aHLRZv3hr5VGr/O8wC0OuP5Xm16ZhBiL4kzOTFgGYaP4LuKiseAXoC+t4N
	UixtVsXKyDrTPWQDbPBEOaeWofVbPnGBta2kwQW0=
Content-Type: multipart/mixed; boundary="===============5230198404059261384=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>, 
	Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cryptography,python3-cryptography-vectors: upgrading to
 46.0.4,46.0.4 SUCCEEDED
Message-ID: <0101019c19558ecc-8c76846b-4fc3-4b26-8cf8-a96b16aa326a-000000@us-west-2.amazonses.com>
Date: Sun, 1 Feb 2026 13:12:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 13:12:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230264

--===============5230198404059261384==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-cryptography,python3-cryptography-vectors* to *46.0.4,46.0.4* has Succeeded.

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
From 5fe3f4a5824d3a4da2ad41d0312855610f61a639 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Feb 2026 05:58:13 +0000
Subject: [PATCH] python3-cryptography,python3-cryptography-vectors: upgrade
 46.0.3 -> 46.0.4,46.0.3 -> 46.0.4

---
 meta/recipes-devtools/python/python3-cryptography-common.inc  | 2 +-
 meta/recipes-devtools/python/python3-cryptography-vectors.bb  | 2 +-
 ...001-pyproject.toml-bump-uv_build-version-requirement.patch | 4 ++--
 meta/recipes-devtools/python/python3-cryptography.bb          | 2 +-
 .../0001-pyproject.toml-remove-benchmark-disable-option.patch | 4 ++--
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-cryptography-common.inc b/meta/recipes-devtools/python/python3-cryptography-common.inc
index 24969828b1..789ce89e53 100644
--- a/meta/recipes-devtools/python/python3-cryptography-common.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-common.inc
@@ -3,4 +3,4 @@
 #
 # Additionally AUH will detect that they share this .inc file and
 # perform a lockstep upgrade for both.
-PV = "46.0.3"
+PV = "46.0.4"
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors.bb b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
index cff5681df1..1408b6b010 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
 SRC_URI += "file://0001-pyproject.toml-bump-uv_build-version-requirement.patch"
-SRC_URI[sha256sum] = "a23246fcb794fc87d814d1b4be20df74a299840a2430cc74651bc7ba0f3b548c"
+SRC_URI[sha256sum] = "fb8e489f5688d9751fd9631d4be0a0df3275698e78d6d753c1b8cf3ce4127c78"
 
 PYPI_PACKAGE = "cryptography_vectors"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors/0001-pyproject.toml-bump-uv_build-version-requirement.patch b/meta/recipes-devtools/python/python3-cryptography-vectors/0001-pyproject.toml-bump-uv_build-version-requirement.patch
index 23af7c200d..58a96c0e5a 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors/0001-pyproject.toml-bump-uv_build-version-requirement.patch
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors/0001-pyproject.toml-bump-uv_build-version-requirement.patch
@@ -1,4 +1,4 @@
-From f2f6b2b391a34a10ad5d94f5c8c70c32a72a34a3 Mon Sep 17 00:00:00 2001
+From 556442d9ffb3670762e48781ea1a203e2f92fadc Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 18 Dec 2025 20:20:13 +0100
 Subject: [PATCH] pyproject.toml: bump uv_build version requirement
@@ -10,7 +10,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index 9beed0d..0c421f3 100644
+index 1028f50..464e5eb 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
 @@ -1,5 +1,5 @@
diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/recipes-devtools/python/python3-cryptography.bb
index b3b45cd172..56dffa13ee 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -11,7 +11,7 @@ LDSHARED += "-pthread"
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography-vectors
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "a8b17438104fed022ce745b362294d9ce35b4c2e45c1d958ad4a4b019285f4a1"
+SRC_URI[sha256sum] = "bfd019f60f8abc2ed1b9be4ddc21cfef059c841d86d710bb69909a688cbb8f59"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://check-memfree.py \
diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
index 866b7a058f..7512978103 100644
--- a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
@@ -1,4 +1,4 @@
-From 1fb7785f80037fa1258added61470d0c73fd3222 Mon Sep 17 00:00:00 2001
+From b0c5430742c38db8e932e089410560039c6d60a4 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Tue, 17 May 2022 17:22:48 +0800
 Subject: [PATCH] pyproject.toml: remove --benchmark-disable option
@@ -26,7 +26,7 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index b3d8c31..6593057 100644
+index 8612efd..aeb71a1 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
 @@ -134,7 +134,7 @@ exclude = [
-- 
2.47.1


--===============5230198404059261384==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: FILELIST: directory renamed /usr/lib/python3.14/site-packages/cryptography_vectors-46.0.3.dist-info -> /usr/lib/python3.14/site-packages/cryptography_vectors-46.0.4.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.14/site-packages/cryptography_vectors-46.0.3.dist-info moved to /usr/lib/python3.14/site-packages/cryptography_vectors-46.0.4.dist-info
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography: FILELIST: directory renamed /usr/lib/python3.14/site-packages/cryptography-46.0.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/cryptography-46.0.4.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/cryptography-46.0.3.dist-info -> /usr/lib/python3.14/site-packages/cryptography-46.0.4.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-cryptography (sysroot):
  /usr/lib/python3.14/site-packages/cryptography-46.0.3.dist-info moved to /usr/lib/python3.14/site-packages/cryptography-46.0.4.dist-info

--===============5230198404059261384==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-cryptography-vectors: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-46.0.3.tar.gz;downloadfilename=cryptography_vectors-46.0.3.tar.gz file://0001-pyproject.toml-bump-uv_build-version-requirement.patch" to "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-46.0.4.tar.gz;downloadfilename=cryptography_vectors-46.0.4.tar.gz file://0001-pyproject.toml-bump-uv_build-version-requirement.patch"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors: PKGV changed from 46.0.3 [default] to 46.0.4 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors: PV changed from "46.0.3" to "46.0.4"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PKGV changed from 46.0.3 [default] to 46.0.4 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PV changed from "46.0.3" to "46.0.4"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PKGV changed from 46.0.3 [default] to 46.0.4 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PV changed from "46.0.3" to "46.0.4"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PKGV changed from 46.0.3 [default] to 46.0.4 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PV changed from "46.0.3" to "46.0.4"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PKGV changed from 46.0.3 [default] to 46.0.4 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PV changed from "46.0.3" to "46.0.4"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PKGV changed from 46.0.3 [default] to 46.0.4 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PV changed from "46.0.3" to "46.0.4"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PKGV changed from 46.0.3 [default] to 46.0.4 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PV changed from "46.0.3" to "46.0.4"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PKGV changed from 46.0.3 [default] to 46.0.4 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PV changed from "46.0.3" to "46.0.4"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: FILELIST: directory renamed /usr/lib/python3.14/site-packages/cryptography_vectors-46.0.3.dist-info -> /usr/lib/python3.14/site-packages/cryptography_vectors-46.0.4.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.14/site-packages/cryptography_vectors-46.0.3.dist-info moved to /usr/lib/python3.14/site-packages/cryptography_vectors-46.0.4.dist-info
packages/x86-64-v3-poky-linux/python3-cryptography: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cryptography/cryptography-46.0.3.tar.gz;downloadfilename=cryptography-46.0.3.tar.gz file://0001-pyproject.toml-remove-benchmark-disable-option.patch file://check-memfree.py file://run-ptest crate://crates.io/asn1/0.22.0 crate://crates.io/asn1_derive/0.22.0 crate://crates.io/autocfg/1.5.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/2.9.4 crate://crates.io/cc/1.2.37 crate://crates.io/cfg-if/1.0.3 crate://crates.io/find-msvc-tools/0.1.1 crate://crates.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shared/0.1.1 crate://crates.io/heck/0.5.0 crate://crates.io/indoc/2.0.6 crate://crates.io/itoa/1.0.15 crate://crates.io/libc/0.2.175 crate://crates.io/memoffset/0.9.1 crate://crates.io/once_cell/1.21.3 crate://crates.io/openssl/0.10.74 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-sys/0.9.110 crate://crates.io/pem/3.0.5 crate://cra
 tes.io/pkg-config/0.3.32 crate://crates.io/portable-atomic/1.11.1 crate://crates.io/proc-macro2/1.0.101 crate://crates.io/pyo3/0.26.0 crate://crates.io/pyo3-build-config/0.26.0 crate://crates.io/pyo3-ffi/0.26.0 crate://crates.io/pyo3-macros/0.26.0 crate://crates.io/pyo3-macros-backend/0.26.0 crate://crates.io/quote/1.0.40 crate://crates.io/self_cell/1.2.0 crate://crates.io/shlex/1.3.0 crate://crates.io/syn/2.0.106 crate://crates.io/target-lexicon/0.13.3 crate://crates.io/unicode-ident/1.0.19 crate://crates.io/unindent/0.2.4 crate://crates.io/vcpkg/0.2.15" to "https://files.pythonhosted.org/packages/source/c/cryptography/cryptography-46.0.4.tar.gz;downloadfilename=cryptography-46.0.4.tar.gz file://0001-pyproject.toml-remove-benchmark-disable-option.patch file://check-memfree.py file://run-ptest crate://crates.io/asn1/0.22.0 crate://crates.io/asn1_derive/0.22.0 crate://crates.io/autocfg/1.5.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/2.9.4 crate://crates.io/cc/1.2.37 
 crate://crates.io/cfg-if/1.0.3 crate://crates.io/find-msvc-tools/0.1.1 crate://crates.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shared/0.1.1 crate://crates.io/heck/0.5.0 crate://crates.io/indoc/2.0.6 crate://crates.io/itoa/1.0.15 crate://crates.io/libc/0.2.175 crate://crates.io/memoffset/0.9.1 crate://crates.io/once_cell/1.21.3 crate://crates.io/openssl/0.10.74 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-sys/0.9.110 crate://crates.io/pem/3.0.5 crate://crates.io/pkg-config/0.3.32 crate://crates.io/portable-atomic/1.11.1 crate://crates.io/proc-macro2/1.0.101 crate://crates.io/pyo3/0.26.0 crate://crates.io/pyo3-build-config/0.26.0 crate://crates.io/pyo3-ffi/0.26.0 crate://crates.io/pyo3-macros/0.26.0 crate://crates.io/pyo3-macros-backend/0.26.0 crate://crates.io/quote/1.0.40 crate://crates.io/self_cell/1.2.0 crate://crates.io/shlex/1.3.0 crate://crates.io/syn/2.0.106 crate://crates.io/target-lexicon/0.13.3 crate://crates.io/unicode-ident/1.0.19 crate:/
 /crates.io/unindent/0.2.4 crate://crates.io/vcpkg/0.2.15"
packages/x86-64-v3-poky-linux/python3-cryptography: PKGV changed from 46.0.3 [default] to 46.0.4 [default]
packages/x86-64-v3-poky-linux/python3-cryptography: PV changed from "46.0.3" to "46.0.4"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-dbg: PKGV changed from 46.0.3 [default] to 46.0.4 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-dbg: PKGSIZE changed from 1172704 to 1173400 (+0%)
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-dbg: PV changed from "46.0.3" to "46.0.4"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-dev: PKGV changed from 46.0.3 [default] to 46.0.4 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-dev: PV changed from "46.0.3" to "46.0.4"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-doc: PKGV changed from 46.0.3 [default] to 46.0.4 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-doc: PV changed from "46.0.3" to "46.0.4"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-locale: PKGV changed from 46.0.3 [default] to 46.0.4 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-locale: PV changed from "46.0.3" to "46.0.4"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-ptest: PKGV changed from 46.0.3 [default] to 46.0.4 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-ptest: PV changed from "46.0.3" to "46.0.4"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-src: PKGV changed from 46.0.3 [default] to 46.0.4 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-src: PV changed from "46.0.3" to "46.0.4"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-staticdev: PKGV changed from 46.0.3 [default] to 46.0.4 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-staticdev: PV changed from "46.0.3" to "46.0.4"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography: PKGV changed from 46.0.3 [default] to 46.0.4 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography: PV changed from "46.0.3" to "46.0.4"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography: FILELIST: directory renamed /usr/lib/python3.14/site-packages/cryptography-46.0.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/cryptography-46.0.4.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/cryptography-46.0.3.dist-info -> /usr/lib/python3.14/site-packages/cryptography-46.0.4.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-cryptography (sysroot):
  /usr/lib/python3.14/site-packages/cryptography-46.0.3.dist-info moved to /usr/lib/python3.14/site-packages/cryptography-46.0.4.dist-info

--===============5230198404059261384==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cryptography-python3-cryptography-vectors-up.patch"

RnJvbSA1ZmUzZjRhNTgyNGQzYTRkYTJhZDQxZDAzMTI4NTU2MTBmNjFhNjM5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBGZWIgMjAyNiAwNTo1ODoxMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtY3J5cHRvZ3JhcGh5LHB5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnM6IHVwZ3JhZGUK
IDQ2LjAuMyAtPiA0Ni4wLjQsNDYuMC4zIC0+IDQ2LjAuNAoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LWNvbW1vbi5pbmMgIHwgMiArLQogbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzLmJi
ICB8IDIgKy0KIC4uLjAwMS1weXByb2plY3QudG9tbC1idW1wLXV2X2J1aWxkLXZlcnNpb24tcmVx
dWlyZW1lbnQucGF0Y2ggfCA0ICsrLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1jcnlwdG9ncmFwaHkuYmIgICAgICAgICAgfCAyICstCiAuLi4vMDAwMS1weXByb2plY3Qu
dG9tbC1yZW1vdmUtYmVuY2htYXJrLWRpc2FibGUtb3B0aW9uLnBhdGNoIHwgNCArKy0tCiA1IGZp
bGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LWNvbW1v
bi5pbmMgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5
LWNvbW1vbi5pbmMKaW5kZXggMjQ5Njk4MjhiMS4uNzg5Y2U4OWU1MyAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS1jb21tb24uaW5j
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHkt
Y29tbW9uLmluYwpAQCAtMyw0ICszLDQgQEAKICMKICMgQWRkaXRpb25hbGx5IEFVSCB3aWxsIGRl
dGVjdCB0aGF0IHRoZXkgc2hhcmUgdGhpcyAuaW5jIGZpbGUgYW5kCiAjIHBlcmZvcm0gYSBsb2Nr
c3RlcCB1cGdyYWRlIGZvciBib3RoLgotUFYgPSAiNDYuMC4zIgorUFYgPSAiNDYuMC40IgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBo
eS12ZWN0b3JzLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0
b2dyYXBoeS12ZWN0b3JzLmJiCmluZGV4IGNmZjU2ODFkZjEuLjE0MDhiNmIwMTAgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVj
dG9ycy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRv
Z3JhcGh5LXZlY3RvcnMuYmIKQEAgLTEwLDcgKzEwLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vTElDRU5TRTttZDU9OGMzNjE3ZGI0ZmI2ZmFlMDFmMWQyNTNhYjkxNTExZTQgXAogIyAg
ICAgICBVcGdyYWRlIGJvdGggcmVjaXBlcyBhdCB0aGUgc2FtZSB0aW1lCiByZXF1aXJlIHB5dGhv
bjMtY3J5cHRvZ3JhcGh5LWNvbW1vbi5pbmMKIFNSQ19VUkkgKz0gImZpbGU6Ly8wMDAxLXB5cHJv
amVjdC50b21sLWJ1bXAtdXZfYnVpbGQtdmVyc2lvbi1yZXF1aXJlbWVudC5wYXRjaCIKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICJhMjMyNDZmY2I3OTRmYzg3ZDgxNGQxYjRiZTIwZGY3NGEyOTk4NDBh
MjQzMGNjNzQ2NTFiYzdiYTBmM2I1NDhjIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImZiOGU0ODlm
NTY4OGQ5NzUxZmQ5NjMxZDRiZTBhMGRmMzI3NTY5OGU3OGQ2ZDc1M2MxYjhjZjNjZTQxMjdjNzgi
CiAKIFBZUElfUEFDS0FHRSA9ICJjcnlwdG9ncmFwaHlfdmVjdG9ycyIKIFVQU1RSRUFNX0NIRUNL
X1BZUElfUEFDS0FHRSA9ICIke1BZUElfUEFDS0FHRX0iCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnMvMDAwMS1weXBy
b2plY3QudG9tbC1idW1wLXV2X2J1aWxkLXZlcnNpb24tcmVxdWlyZW1lbnQucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnMvMDAw
MS1weXByb2plY3QudG9tbC1idW1wLXV2X2J1aWxkLXZlcnNpb24tcmVxdWlyZW1lbnQucGF0Y2gK
aW5kZXggMjNhZjdjMjAwZC4uNThhOTZjMGU1YSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzLzAwMDEtcHlwcm9qZWN0
LnRvbWwtYnVtcC11dl9idWlsZC12ZXJzaW9uLXJlcXVpcmVtZW50LnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9ycy8wMDAx
LXB5cHJvamVjdC50b21sLWJ1bXAtdXZfYnVpbGQtdmVyc2lvbi1yZXF1aXJlbWVudC5wYXRjaApA
QCAtMSw0ICsxLDQgQEAKLUZyb20gZjJmNmIyYjM5MWEzNGExMGFkNWQ5NGY1YzhjNzBjMzJhNzJh
MzRhMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNTU2NDQyZDlmZmIzNjcwNzYyZTQ4
NzgxZWExYTIwM2UyZjkyZmFkYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhh
bmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+CiBEYXRlOiBUaHUsIDE4IERlYyAyMDI1
IDIwOjIwOjEzICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIHB5cHJvamVjdC50b21sOiBidW1wIHV2
X2J1aWxkIHZlcnNpb24gcmVxdWlyZW1lbnQKQEAgLTEwLDcgKzEwLDcgQEAgU2lnbmVkLW9mZi1i
eTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL3B5cHJvamVj
dC50b21sIGIvcHlwcm9qZWN0LnRvbWwKLWluZGV4IDliZWVkMGQuLjBjNDIxZjMgMTAwNjQ0Citp
bmRleCAxMDI4ZjUwLi40NjRlNWViIDEwMDY0NAogLS0tIGEvcHlwcm9qZWN0LnRvbWwKICsrKyBi
L3B5cHJvamVjdC50b21sCiBAQCAtMSw1ICsxLDUgQEAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHkuYmIgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LmJiCmluZGV4IGIzYjQ1Y2QxNzIu
LjU2ZGZmYTEzZWUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1jcnlwdG9ncmFwaHkuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWNyeXB0b2dyYXBoeS5iYgpAQCAtMTEsNyArMTEsNyBAQCBMRFNIQVJFRCArPSAiLXB0
aHJlYWQiCiAjIE5PVEU6IE1ha2Ugc3VyZSB0byBrZWVwIHRoaXMgcmVjaXBlIGF0IHRoZSBzYW1l
IHZlcnNpb24gYXMgcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9ycwogIyAgICAgICBVcGdyYWRl
IGJvdGggcmVjaXBlcyBhdCB0aGUgc2FtZSB0aW1lCiByZXF1aXJlIHB5dGhvbjMtY3J5cHRvZ3Jh
cGh5LWNvbW1vbi5pbmMKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJhOGIxNzQzODEwNGZlZDAyMmNl
NzQ1YjM2MjI5NGQ5Y2UzNWI0YzJlNDVjMWQ5NThhZDRhNGIwMTkyODVmNGExIgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gImJmZDAxOWY2MGY4YWJjMmVkMWI5YmU0ZGRjMjFjZmVmMDU5Yzg0MWQ4NmQ3
MTBiYjY5OTA5YTY4OGNiYjhmNTkiCiAKIFNSQ19VUkkgKz0gImZpbGU6Ly8wMDAxLXB5cHJvamVj
dC50b21sLXJlbW92ZS1iZW5jaG1hcmstZGlzYWJsZS1vcHRpb24ucGF0Y2ggXAogICAgICAgICAg
ICAgZmlsZTovL2NoZWNrLW1lbWZyZWUucHkgXApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS8wMDAxLXB5cHJvamVjdC50b21sLXJl
bW92ZS1iZW5jaG1hcmstZGlzYWJsZS1vcHRpb24ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LzAwMDEtcHlwcm9qZWN0LnRvbWwtcmVtb3Zl
LWJlbmNobWFyay1kaXNhYmxlLW9wdGlvbi5wYXRjaAppbmRleCA4NjZiN2EwNThmLi43NTEyOTc4
MTAzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5
cHRvZ3JhcGh5LzAwMDEtcHlwcm9qZWN0LnRvbWwtcmVtb3ZlLWJlbmNobWFyay1kaXNhYmxlLW9w
dGlvbi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5
cHRvZ3JhcGh5LzAwMDEtcHlwcm9qZWN0LnRvbWwtcmVtb3ZlLWJlbmNobWFyay1kaXNhYmxlLW9w
dGlvbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMWZiNzc4NWY4MDAzN2ZhMTI1OGFkZGVk
NjE0NzBkMGM3M2ZkMzIyMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYjBjNTQzMDc0
MmMzOGRiOGU5MzJlMDg5NDEwNTYwMDM5YzZkNjBhNCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IE1pbmdsaSBZdSA8bWluZ2xpLnl1QHdpbmRyaXZlci5jb20+CiBEYXRlOiBUdWUsIDE3
IE1heSAyMDIyIDE3OjIyOjQ4ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIHB5cHJvamVjdC50b21s
OiByZW1vdmUgLS1iZW5jaG1hcmstZGlzYWJsZSBvcHRpb24KQEAgLTI2LDcgKzI2LDcgQEAgU2ln
bmVkLW9mZi1ieTogVGltIE9ybGluZyA8dGltLm9ybGluZ0Brb25zdWxrby5jb20+CiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9w
eXByb2plY3QudG9tbCBiL3B5cHJvamVjdC50b21sCi1pbmRleCBiM2Q4YzMxLi42NTkzMDU3IDEw
MDY0NAoraW5kZXggODYxMmVmZC4uYWViNzFhMSAxMDA2NDQKIC0tLSBhL3B5cHJvamVjdC50b21s
CiArKysgYi9weXByb2plY3QudG9tbAogQEAgLTEzNCw3ICsxMzQsNyBAQCBleGNsdWRlID0gWwot
LSAKMi40Ny4xCgo=

--===============5230198404059261384==--

