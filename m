Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92A271076396
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 14:36:03 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14639.1775054152486170389
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 07:35:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=kTRPVBl+;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ZCFfiKRb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019d4978df95-22020535-2b65-4e10-a618-1600bcc238d6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775054151;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1j6z165C7sDhpKF6z0GaLuc4kADTdtzmJxTzE8YeAiw=;
	b=kTRPVBl+0bZaaCsIeELDmfPC0wmfyg6jsEAn4XxGiobv0ScrUvGySYWoZhRnCPLM
	kgzeMFhrvQC45QpIfwMR4GeywONkqvIkfEWR1PtrLnWx4dcLThJhuTqfTJ7uhKqsFwn
	EDW3p02E32R8f+VJHpaBAWa6XiYXnMqrWd4qdCPA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775054151;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1j6z165C7sDhpKF6z0GaLuc4kADTdtzmJxTzE8YeAiw=;
	b=ZCFfiKRbQE/EVHkiOL7MHqMf7T+0s+MTofvOxc9oEgaUNOPnkuh+0yh+oYkcGVvd
	Fxcdvi31RKv1Mn9TNO4nsR+XgYV6yhD5MF626Rms3xgyJPXvjhbv/ysDag02uM18GSC
	3EYLLSYHUfBKVzkf5+bPYYNpuRmrlr/xU/qvOTNs=
Content-Type: multipart/mixed; boundary="===============8564723277150751813=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>, 
	Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cryptography,python3-cryptography-vectors: upgrading to
 46.0.6,46.0.6 SUCCEEDED
Message-ID: <0101019d4978df95-22020535-2b65-4e10-a618-1600bcc238d6-000000@us-west-2.amazonses.com>
Date: Wed, 1 Apr 2026 14:35:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234356

--===============8564723277150751813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-cryptography,python3-cryptography-vectors* to *46.0.6,46.0.6* has Succeeded.

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
From 22d8f9a3370f4531e62163b8c1139c29b8bbe854 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Apr 2026 05:42:22 +0000
Subject: [PATCH] python3-cryptography,python3-cryptography-vectors: upgrade
 46.0.5 -> 46.0.6,46.0.5 -> 46.0.6

---
 .../python/python3-cryptography-common.inc                 | 2 +-
 .../python/python3-cryptography-vectors.bb                 | 2 +-
 .../0001-bump-uv_build-to-0.10.0-14271.patch               | 7 ++-----
 ...-pyproject.toml-bump-uv_build-version-requirement.patch | 4 ++--
 meta/recipes-devtools/python/python3-cryptography.bb       | 2 +-
 ...01-pyproject.toml-remove-benchmark-disable-option.patch | 4 ++--
 6 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-cryptography-common.inc b/meta/recipes-devtools/python/python3-cryptography-common.inc
index 4e4434bd66..df73806888 100644
--- a/meta/recipes-devtools/python/python3-cryptography-common.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-common.inc
@@ -3,4 +3,4 @@
 #
 # Additionally AUH will detect that they share this .inc file and
 # perform a lockstep upgrade for both.
-PV = "46.0.5"
+PV = "46.0.6"
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors.bb b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
index 800bf1b0e0..c7dacdfa48 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
@@ -12,7 +12,7 @@ require python3-cryptography-common.inc
 SRC_URI += "file://0001-pyproject.toml-bump-uv_build-version-requirement.patch \
             file://0001-bump-uv_build-to-0.10.0-14271.patch \
 "
-SRC_URI[sha256sum] = "ffbccee9455201c01b37c63d65d9f83b362d40c2bed9caac248ebbdfa4e4fc7c"
+SRC_URI[sha256sum] = "cbb5762ba5c7fbc7383f48714602d71ef6bded635d0ec2c90712fd730c80bf52"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors/0001-bump-uv_build-to-0.10.0-14271.patch b/meta/recipes-devtools/python/python3-cryptography-vectors/0001-bump-uv_build-to-0.10.0-14271.patch
index 9fa4d1cd47..3107e21c7f 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors/0001-bump-uv_build-to-0.10.0-14271.patch
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors/0001-bump-uv_build-to-0.10.0-14271.patch
@@ -1,4 +1,4 @@
-From 1f6626557e4766ffa40874984f1e29197ed66eb8 Mon Sep 17 00:00:00 2001
+From 686f2a867544a5bd9545fa24087de53925a11574 Mon Sep 17 00:00:00 2001
 From: Ridai Govinda Pombo <beholderseye@vivaldi.net>
 Date: Tue, 3 Mar 2026 10:38:12 +0800
 Subject: [PATCH] bump uv_build to 0.10.0 (#14271)
@@ -12,7 +12,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index f01d2c1..f7af712 100644
+index 9e3afd4..ffe38d9 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
 @@ -1,5 +1,5 @@
@@ -22,6 +22,3 @@ index f01d2c1..f7af712 100644
  build-backend = "uv_build"
  
  [project]
--- 
-2.34.1
-
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors/0001-pyproject.toml-bump-uv_build-version-requirement.patch b/meta/recipes-devtools/python/python3-cryptography-vectors/0001-pyproject.toml-bump-uv_build-version-requirement.patch
index 6faaf1051d..ba15dd328c 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors/0001-pyproject.toml-bump-uv_build-version-requirement.patch
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors/0001-pyproject.toml-bump-uv_build-version-requirement.patch
@@ -1,4 +1,4 @@
-From 6d4c14a2781fb02903fd4d59f638cf72ee370b8d Mon Sep 17 00:00:00 2001
+From 2ff14a061307315c91d2afa71d6f24a3e75e0432 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 18 Dec 2025 20:20:13 +0100
 Subject: [PATCH] pyproject.toml: bump uv_build version requirement
@@ -10,7 +10,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index 2ed12a3..f01d2c1 100644
+index 0e71df2..9e3afd4 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
 @@ -1,5 +1,5 @@
diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/recipes-devtools/python/python3-cryptography.bb
index fc5cb50b02..a7b2112489 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -11,7 +11,7 @@ LDSHARED += "-pthread"
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography-vectors
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "abace499247268e3757271b2f1e244b36b06f8515cf27c4d49468fc9eb16e93d"
+SRC_URI[sha256sum] = "27550628a518c5c6c903d84f637fbecf287f6cb9ced3804838a1295dc1fd0759"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://check-memfree.py \
diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
index 5c2e3c53ba..785208313c 100644
--- a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
@@ -1,4 +1,4 @@
-From 6d6fbe77732ce3c4d2dcf3a5f75bb20ea352bf4a Mon Sep 17 00:00:00 2001
+From baebbc4c2be4e2e96f5e97e011e17bb745d38bd2 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Tue, 17 May 2022 17:22:48 +0800
 Subject: [PATCH] pyproject.toml: remove --benchmark-disable option
@@ -26,7 +26,7 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index 95ced11..75bfcbb 100644
+index f9752f8..95b7f13 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
 @@ -134,7 +134,7 @@ exclude = [
-- 
2.47.1


--===============8564723277150751813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: FILELIST: directory renamed /usr/lib/python3.14/site-packages/cryptography_vectors-46.0.5.dist-info -> /usr/lib/python3.14/site-packages/cryptography_vectors-46.0.6.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.14/site-packages/cryptography_vectors-46.0.5.dist-info moved to /usr/lib/python3.14/site-packages/cryptography_vectors-46.0.6.dist-info
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography: FILELIST: directory renamed /usr/lib/python3.14/site-packages/cryptography-46.0.5.dist-info/licenses -> /usr/lib/python3.14/site-packages/cryptography-46.0.6.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/cryptography-46.0.5.dist-info -> /usr/lib/python3.14/site-packages/cryptography-46.0.6.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-cryptography (sysroot):
  /usr/lib/python3.14/site-packages/cryptography-46.0.5.dist-info moved to /usr/lib/python3.14/site-packages/cryptography-46.0.6.dist-info

--===============8564723277150751813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-cryptography-vectors: PKGV changed from 46.0.5 [default] to 46.0.6 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors: PV changed from "46.0.5" to "46.0.6"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-46.0.5.tar.gz;downloadfilename=cryptography_vectors-46.0.5.tar.gz file://0001-pyproject.toml-bump-uv_build-version-requirement.patch file://0001-bump-uv_build-to-0.10.0-14271.patch" to "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-46.0.6.tar.gz;downloadfilename=cryptography_vectors-46.0.6.tar.gz file://0001-pyproject.toml-bump-uv_build-version-requirement.patch file://0001-bump-uv_build-to-0.10.0-14271.patch"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PKGV changed from 46.0.5 [default] to 46.0.6 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PV changed from "46.0.5" to "46.0.6"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PKGV changed from 46.0.5 [default] to 46.0.6 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PV changed from "46.0.5" to "46.0.6"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PKGV changed from 46.0.5 [default] to 46.0.6 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PV changed from "46.0.5" to "46.0.6"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PKGV changed from 46.0.5 [default] to 46.0.6 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PV changed from "46.0.5" to "46.0.6"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PKGV changed from 46.0.5 [default] to 46.0.6 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PV changed from "46.0.5" to "46.0.6"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PKGV changed from 46.0.5 [default] to 46.0.6 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PV changed from "46.0.5" to "46.0.6"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PKGV changed from 46.0.5 [default] to 46.0.6 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PV changed from "46.0.5" to "46.0.6"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: FILELIST: directory renamed /usr/lib/python3.14/site-packages/cryptography_vectors-46.0.5.dist-info -> /usr/lib/python3.14/site-packages/cryptography_vectors-46.0.6.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.14/site-packages/cryptography_vectors-46.0.5.dist-info moved to /usr/lib/python3.14/site-packages/cryptography_vectors-46.0.6.dist-info
packages/x86-64-v3-poky-linux/python3-cryptography: PKGV changed from 46.0.5 [default] to 46.0.6 [default]
packages/x86-64-v3-poky-linux/python3-cryptography: PV changed from "46.0.5" to "46.0.6"
packages/x86-64-v3-poky-linux/python3-cryptography: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cryptography/cryptography-46.0.5.tar.gz;downloadfilename=cryptography-46.0.5.tar.gz file://0001-pyproject.toml-remove-benchmark-disable-option.patch file://check-memfree.py file://run-ptest crate://crates.io/asn1/0.22.0 crate://crates.io/asn1_derive/0.22.0 crate://crates.io/autocfg/1.5.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/2.9.4 crate://crates.io/cc/1.2.37 crate://crates.io/cfg-if/1.0.3 crate://crates.io/find-msvc-tools/0.1.1 crate://crates.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shared/0.1.1 crate://crates.io/heck/0.5.0 crate://crates.io/indoc/2.0.6 crate://crates.io/itoa/1.0.15 crate://crates.io/libc/0.2.175 crate://crates.io/memoffset/0.9.1 crate://crates.io/once_cell/1.21.3 crate://crates.io/openssl/0.10.74 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-sys/0.9.110 crate://crates.io/pem/3.0.5 crate://cra
 tes.io/pkg-config/0.3.32 crate://crates.io/portable-atomic/1.11.1 crate://crates.io/proc-macro2/1.0.101 crate://crates.io/pyo3/0.26.0 crate://crates.io/pyo3-build-config/0.26.0 crate://crates.io/pyo3-ffi/0.26.0 crate://crates.io/pyo3-macros/0.26.0 crate://crates.io/pyo3-macros-backend/0.26.0 crate://crates.io/quote/1.0.40 crate://crates.io/self_cell/1.2.0 crate://crates.io/shlex/1.3.0 crate://crates.io/syn/2.0.106 crate://crates.io/target-lexicon/0.13.3 crate://crates.io/unicode-ident/1.0.19 crate://crates.io/unindent/0.2.4 crate://crates.io/vcpkg/0.2.15" to "https://files.pythonhosted.org/packages/source/c/cryptography/cryptography-46.0.6.tar.gz;downloadfilename=cryptography-46.0.6.tar.gz file://0001-pyproject.toml-remove-benchmark-disable-option.patch file://check-memfree.py file://run-ptest crate://crates.io/asn1/0.22.0 crate://crates.io/asn1_derive/0.22.0 crate://crates.io/autocfg/1.5.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/2.9.4 crate://crates.io/cc/1.2.37 
 crate://crates.io/cfg-if/1.0.3 crate://crates.io/find-msvc-tools/0.1.1 crate://crates.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shared/0.1.1 crate://crates.io/heck/0.5.0 crate://crates.io/indoc/2.0.6 crate://crates.io/itoa/1.0.15 crate://crates.io/libc/0.2.175 crate://crates.io/memoffset/0.9.1 crate://crates.io/once_cell/1.21.3 crate://crates.io/openssl/0.10.74 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-sys/0.9.110 crate://crates.io/pem/3.0.5 crate://crates.io/pkg-config/0.3.32 crate://crates.io/portable-atomic/1.11.1 crate://crates.io/proc-macro2/1.0.101 crate://crates.io/pyo3/0.26.0 crate://crates.io/pyo3-build-config/0.26.0 crate://crates.io/pyo3-ffi/0.26.0 crate://crates.io/pyo3-macros/0.26.0 crate://crates.io/pyo3-macros-backend/0.26.0 crate://crates.io/quote/1.0.40 crate://crates.io/self_cell/1.2.0 crate://crates.io/shlex/1.3.0 crate://crates.io/syn/2.0.106 crate://crates.io/target-lexicon/0.13.3 crate://crates.io/unicode-ident/1.0.19 crate:/
 /crates.io/unindent/0.2.4 crate://crates.io/vcpkg/0.2.15"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-dbg: PKGV changed from 46.0.5 [default] to 46.0.6 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-dbg: PV changed from "46.0.5" to "46.0.6"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-dbg: PKGSIZE changed from 1203088 to 1202432 (-0%)
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-dev: PKGV changed from 46.0.5 [default] to 46.0.6 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-dev: PV changed from "46.0.5" to "46.0.6"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-doc: PKGV changed from 46.0.5 [default] to 46.0.6 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-doc: PV changed from "46.0.5" to "46.0.6"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-locale: PKGV changed from 46.0.5 [default] to 46.0.6 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-locale: PV changed from "46.0.5" to "46.0.6"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-ptest: PKGV changed from 46.0.5 [default] to 46.0.6 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-ptest: PV changed from "46.0.5" to "46.0.6"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-ptest: PKGSIZE changed from 1822520 to 1822942 (+0%)
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-src: PKGV changed from 46.0.5 [default] to 46.0.6 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-src: PV changed from "46.0.5" to "46.0.6"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-staticdev: PKGV changed from 46.0.5 [default] to 46.0.6 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-staticdev: PV changed from "46.0.5" to "46.0.6"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography: PKGV changed from 46.0.5 [default] to 46.0.6 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography: PV changed from "46.0.5" to "46.0.6"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography: PKGSIZE changed from 10493822 to 10494938 (+0%)
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography: FILELIST: directory renamed /usr/lib/python3.14/site-packages/cryptography-46.0.5.dist-info/licenses -> /usr/lib/python3.14/site-packages/cryptography-46.0.6.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/cryptography-46.0.5.dist-info -> /usr/lib/python3.14/site-packages/cryptography-46.0.6.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-cryptography (sysroot):
  /usr/lib/python3.14/site-packages/cryptography-46.0.5.dist-info moved to /usr/lib/python3.14/site-packages/cryptography-46.0.6.dist-info

--===============8564723277150751813==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cryptography-python3-cryptography-vectors-up.patch"

RnJvbSAyMmQ4ZjlhMzM3MGY0NTMxZTYyMTYzYjhjMTEzOWMyOWI4YmJlODU0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBBcHIgMjAyNiAwNTo0MjoyMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtY3J5cHRvZ3JhcGh5LHB5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnM6IHVwZ3JhZGUK
IDQ2LjAuNSAtPiA0Ni4wLjYsNDYuMC41IC0+IDQ2LjAuNgoKLS0tCiAuLi4vcHl0aG9uL3B5dGhv
bjMtY3J5cHRvZ3JhcGh5LWNvbW1vbi5pbmMgICAgICAgICAgICAgICAgIHwgMiArLQogLi4uL3B5
dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzLmJiICAgICAgICAgICAgICAgICB8IDIg
Ky0KIC4uLi8wMDAxLWJ1bXAtdXZfYnVpbGQtdG8tMC4xMC4wLTE0MjcxLnBhdGNoICAgICAgICAg
ICAgICAgfCA3ICsrLS0tLS0KIC4uLi1weXByb2plY3QudG9tbC1idW1wLXV2X2J1aWxkLXZlcnNp
b24tcmVxdWlyZW1lbnQucGF0Y2ggfCA0ICsrLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1jcnlwdG9ncmFwaHkuYmIgICAgICAgfCAyICstCiAuLi4wMS1weXByb2plY3Qu
dG9tbC1yZW1vdmUtYmVuY2htYXJrLWRpc2FibGUtb3B0aW9uLnBhdGNoIHwgNCArKy0tCiA2IGZp
bGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS1jb21t
b24uaW5jIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBo
eS1jb21tb24uaW5jCmluZGV4IDRlNDQzNGJkNjYuLmRmNzM4MDY4ODggMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktY29tbW9uLmlu
YworKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5
LWNvbW1vbi5pbmMKQEAgLTMsNCArMyw0IEBACiAjCiAjIEFkZGl0aW9uYWxseSBBVUggd2lsbCBk
ZXRlY3QgdGhhdCB0aGV5IHNoYXJlIHRoaXMgLmluYyBmaWxlIGFuZAogIyBwZXJmb3JtIGEgbG9j
a3N0ZXAgdXBncmFkZSBmb3IgYm90aC4KLVBWID0gIjQ2LjAuNSIKK1BWID0gIjQ2LjAuNiIKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFw
aHktdmVjdG9ycy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlw
dG9ncmFwaHktdmVjdG9ycy5iYgppbmRleCA4MDBiZjFiMGUwLi5jN2RhY2RmYTQ4IDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LXZl
Y3RvcnMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0
b2dyYXBoeS12ZWN0b3JzLmJiCkBAIC0xMiw3ICsxMiw3IEBAIHJlcXVpcmUgcHl0aG9uMy1jcnlw
dG9ncmFwaHktY29tbW9uLmluYwogU1JDX1VSSSArPSAiZmlsZTovLzAwMDEtcHlwcm9qZWN0LnRv
bWwtYnVtcC11dl9idWlsZC12ZXJzaW9uLXJlcXVpcmVtZW50LnBhdGNoIFwKICAgICAgICAgICAg
IGZpbGU6Ly8wMDAxLWJ1bXAtdXZfYnVpbGQtdG8tMC4xMC4wLTE0MjcxLnBhdGNoIFwKICIKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICJmZmJjY2VlOTQ1NTIwMWMwMWIzN2M2M2Q2NWQ5ZjgzYjM2MmQ0
MGMyYmVkOWNhYWMyNDhlYmJkZmE0ZTRmYzdjIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImNiYjU3
NjJiYTVjN2ZiYzczODNmNDg3MTQ2MDJkNzFlZjZiZGVkNjM1ZDBlYzJjOTA3MTJmZDczMGM4MGJm
NTIiCiAKIFBZUElfUEFDS0FHRSA9ICJjcnlwdG9ncmFwaHlfdmVjdG9ycyIKIApkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS12ZWN0
b3JzLzAwMDEtYnVtcC11dl9idWlsZC10by0wLjEwLjAtMTQyNzEucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnMvMDAwMS1idW1w
LXV2X2J1aWxkLXRvLTAuMTAuMC0xNDI3MS5wYXRjaAppbmRleCA5ZmE0ZDFjZDQ3Li4zMTA3ZTIx
YzdmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5
cHRvZ3JhcGh5LXZlY3RvcnMvMDAwMS1idW1wLXV2X2J1aWxkLXRvLTAuMTAuMC0xNDI3MS5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5
LXZlY3RvcnMvMDAwMS1idW1wLXV2X2J1aWxkLXRvLTAuMTAuMC0xNDI3MS5wYXRjaApAQCAtMSw0
ICsxLDQgQEAKLUZyb20gMWY2NjI2NTU3ZTQ3NjZmZmE0MDg3NDk4NGYxZTI5MTk3ZWQ2NmViOCBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNjg2ZjJhODY3NTQ0YTViZDk1NDVmYTI0MDg3
ZGU1MzkyNWExMTU3NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJpZGFpIEdvdmlu
ZGEgUG9tYm8gPGJlaG9sZGVyc2V5ZUB2aXZhbGRpLm5ldD4KIERhdGU6IFR1ZSwgMyBNYXIgMjAy
NiAxMDozODoxMiArMDgwMAogU3ViamVjdDogW1BBVENIXSBidW1wIHV2X2J1aWxkIHRvIDAuMTAu
MCAoIzE0MjcxKQpAQCAtMTIsNyArMTIsNyBAQCBTaWduZWQtb2ZmLWJ5OiBIb25neHUgSmlhIDxo
b25neHUuamlhQHdpbmRyaXZlci5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9weXByb2plY3QudG9tbCBiL3B5cHJvamVj
dC50b21sCi1pbmRleCBmMDFkMmMxLi5mN2FmNzEyIDEwMDY0NAoraW5kZXggOWUzYWZkNC4uZmZl
MzhkOSAxMDA2NDQKIC0tLSBhL3B5cHJvamVjdC50b21sCiArKysgYi9weXByb2plY3QudG9tbAog
QEAgLTEsNSArMSw1IEBACkBAIC0yMiw2ICsyMiwzIEBAIGluZGV4IGYwMWQyYzEuLmY3YWY3MTIg
MTAwNjQ0CiAgYnVpbGQtYmFja2VuZCA9ICJ1dl9idWlsZCIKICAKICBbcHJvamVjdF0KLS0tIAot
Mi4zNC4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1jcnlwdG9ncmFwaHktdmVjdG9ycy8wMDAxLXB5cHJvamVjdC50b21sLWJ1bXAtdXZfYnVpbGQt
dmVyc2lvbi1yZXF1aXJlbWVudC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9ycy8wMDAxLXB5cHJvamVjdC50b21sLWJ1bXAtdXZf
YnVpbGQtdmVyc2lvbi1yZXF1aXJlbWVudC5wYXRjaAppbmRleCA2ZmFhZjEwNTFkLi5iYTE1ZGQz
MjhjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5
cHRvZ3JhcGh5LXZlY3RvcnMvMDAwMS1weXByb2plY3QudG9tbC1idW1wLXV2X2J1aWxkLXZlcnNp
b24tcmVxdWlyZW1lbnQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzLzAwMDEtcHlwcm9qZWN0LnRvbWwtYnVtcC11dl9i
dWlsZC12ZXJzaW9uLXJlcXVpcmVtZW50LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA2ZDRj
MTRhMjc4MWZiMDI5MDNmZDRkNTlmNjM4Y2Y3MmVlMzcwYjhkIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSAyZmYxNGEwNjEzMDczMTVjOTFkMmFmYTcxZDZmMjRhM2U3NWUwNDMyIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRy
b25peC5kZT4KIERhdGU6IFRodSwgMTggRGVjIDIwMjUgMjA6MjA6MTMgKzAxMDAKIFN1YmplY3Q6
IFtQQVRDSF0gcHlwcm9qZWN0LnRvbWw6IGJ1bXAgdXZfYnVpbGQgdmVyc2lvbiByZXF1aXJlbWVu
dApAQCAtMTAsNyArMTAsNyBAQCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxl
eEBsaW51dHJvbml4LmRlPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvcHlwcm9qZWN0LnRvbWwgYi9weXByb2plY3QudG9tbAot
aW5kZXggMmVkMTJhMy4uZjAxZDJjMSAxMDA2NDQKK2luZGV4IDBlNzFkZjIuLjllM2FmZDQgMTAw
NjQ0CiAtLS0gYS9weXByb2plY3QudG9tbAogKysrIGIvcHlwcm9qZWN0LnRvbWwKIEBAIC0xLDUg
KzEsNSBAQApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LWNyeXB0b2dyYXBoeS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1j
cnlwdG9ncmFwaHkuYmIKaW5kZXggZmM1Y2I1MGIwMi4uYTdiMjExMjQ4OSAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LmJiCkBA
IC0xMSw3ICsxMSw3IEBAIExEU0hBUkVEICs9ICItcHRocmVhZCIKICMgTk9URTogTWFrZSBzdXJl
IHRvIGtlZXAgdGhpcyByZWNpcGUgYXQgdGhlIHNhbWUgdmVyc2lvbiBhcyBweXRob24zLWNyeXB0
b2dyYXBoeS12ZWN0b3JzCiAjICAgICAgIFVwZ3JhZGUgYm90aCByZWNpcGVzIGF0IHRoZSBzYW1l
IHRpbWUKIHJlcXVpcmUgcHl0aG9uMy1jcnlwdG9ncmFwaHktY29tbW9uLmluYwotU1JDX1VSSVtz
aGEyNTZzdW1dID0gImFiYWNlNDk5MjQ3MjY4ZTM3NTcyNzFiMmYxZTI0NGIzNmIwNmY4NTE1Y2Yy
N2M0ZDQ5NDY4ZmM5ZWIxNmU5M2QiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMjc1NTA2MjhhNTE4
YzVjNmM5MDNkODRmNjM3ZmJlY2YyODdmNmNiOWNlZDM4MDQ4MzhhMTI5NWRjMWZkMDc1OSIKIAog
U1JDX1VSSSArPSAiZmlsZTovLzAwMDEtcHlwcm9qZWN0LnRvbWwtcmVtb3ZlLWJlbmNobWFyay1k
aXNhYmxlLW9wdGlvbi5wYXRjaCBcCiAgICAgICAgICAgICBmaWxlOi8vY2hlY2stbWVtZnJlZS5w
eSBcCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5
cHRvZ3JhcGh5LzAwMDEtcHlwcm9qZWN0LnRvbWwtcmVtb3ZlLWJlbmNobWFyay1kaXNhYmxlLW9w
dGlvbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9n
cmFwaHkvMDAwMS1weXByb2plY3QudG9tbC1yZW1vdmUtYmVuY2htYXJrLWRpc2FibGUtb3B0aW9u
LnBhdGNoCmluZGV4IDVjMmUzYzUzYmEuLjc4NTIwODMxM2MgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHkvMDAwMS1weXByb2plY3Qu
dG9tbC1yZW1vdmUtYmVuY2htYXJrLWRpc2FibGUtb3B0aW9uLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHkvMDAwMS1weXByb2plY3Qu
dG9tbC1yZW1vdmUtYmVuY2htYXJrLWRpc2FibGUtb3B0aW9uLnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSA2ZDZmYmU3NzczMmNlM2M0ZDJkY2YzYTVmNzViYjIwZWEzNTJiZjRhIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiYWViYmM0YzJiZTRlMmU5NmY1ZTk3ZTAxMWUxN2JiNzQ1
ZDM4YmQyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogTWluZ2xpIFl1IDxtaW5nbGku
eXVAd2luZHJpdmVyLmNvbT4KIERhdGU6IFR1ZSwgMTcgTWF5IDIwMjIgMTc6MjI6NDggKzA4MDAK
IFN1YmplY3Q6IFtQQVRDSF0gcHlwcm9qZWN0LnRvbWw6IHJlbW92ZSAtLWJlbmNobWFyay1kaXNh
YmxlIG9wdGlvbgpAQCAtMjYsNyArMjYsNyBAQCBTaWduZWQtb2ZmLWJ5OiBUaW0gT3JsaW5nIDx0
aW0ub3JsaW5nQGtvbnN1bGtvLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL3B5cHJvamVjdC50b21sIGIvcHlwcm9qZWN0
LnRvbWwKLWluZGV4IDk1Y2VkMTEuLjc1YmZjYmIgMTAwNjQ0CitpbmRleCBmOTc1MmY4Li45NWI3
ZjEzIDEwMDY0NAogLS0tIGEvcHlwcm9qZWN0LnRvbWwKICsrKyBiL3B5cHJvamVjdC50b21sCiBA
QCAtMTM0LDcgKzEzNCw3IEBAIGV4Y2x1ZGUgPSBbCi0tIAoyLjQ3LjEKCg==

--===============8564723277150751813==--

