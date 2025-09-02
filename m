Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A195FCAC582
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:56:31 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.89790.1756850183863308430
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:56:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=0QCXzFch;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=OWBVCf03;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101990c6e5aea-2b6f7053-6f3a-4cea-a463-3c88da704fc8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1756850183;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=t78d1bGAAHTiU++Oi2qaPlpcsbMifzouIR/hzIpg3R4=;
	b=0QCXzFchQs/z92hqMX0/oVcUdmgZ6nEX1fVIlTwCCH0Zp2M93GVaOXK4XA0iY4Xg
	2KCOP7pd2U6Imsh5A1vnQwYLhBBddalG8EQXwa1Ufi4x+C56ZC8LrnmyoPWqNRXbjIL
	Uqjtem9htpviC4Q3q+QpXXoQqXnKJsvdTKXx4FOs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1756850183;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=t78d1bGAAHTiU++Oi2qaPlpcsbMifzouIR/hzIpg3R4=;
	b=OWBVCf03WZl/Pje9LUkgLaaDWYiCsVh7NXRbxoaETk+7ks4WEbuW9izJ0/UYShoa
	udHrzUAim/mC6eHXQEQrcJH69ZUqurSqxBiXuJUfGOlKnIq0jJhtQRGW1uSrMWC8Hit
	JofzYpBgbszCcvJdF3Jl+lVAA2c2qMBWVBOik2TI=
Content-Type: multipart/mixed; boundary="===============6684618400108581144=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>, 
	Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cryptography-vectors,python3-cryptography: upgrading to
 45.0.7,45.0.7 SUCCEEDED
Message-ID: <010101990c6e5aea-2b6f7053-6f3a-4cea-a463-3c88da704fc8-000000@us-west-2.amazonses.com>
Date: Tue, 2 Sep 2025 21:56:22 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222758

--===============6684618400108581144==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-cryptography-vectors,python3-cryptography* to *45.0.7,45.0.7* has Succeeded.

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
From 75877cd21e35528faafd58515aac7ce5678debe2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 2 Sep 2025 15:06:37 +0000
Subject: [PATCH] python3-cryptography-vectors,python3-cryptography: upgrade
 45.0.6 -> 45.0.7,45.0.6 -> 45.0.7

---
 meta/recipes-devtools/python/python3-cryptography-common.inc  | 2 +-
 meta/recipes-devtools/python/python3-cryptography-vectors.bb  | 2 +-
 meta/recipes-devtools/python/python3-cryptography.bb          | 2 +-
 .../0001-pyproject.toml-remove-benchmark-disable-option.patch | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-cryptography-common.inc b/meta/recipes-devtools/python/python3-cryptography-common.inc
index 874f60bf83..bcb907b645 100644
--- a/meta/recipes-devtools/python/python3-cryptography-common.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-common.inc
@@ -3,4 +3,4 @@
 #
 # Additionally AUH will detect that they share this .inc file and
 # perform a lockstep upgrade for both.
-PV = "45.0.6"
+PV = "45.0.7"
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors.bb b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
index b6b0e38f2e..e845486a94 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "068cee15423f3f1633ca04f12284385ac404c19366e7ccb3b680156c1aa9c573"
+SRC_URI[sha256sum] = "48e71fc4ac5f6298b2de53a99726ddc4a9e5ef0a94d921820109e7b90baf9f56"
 
 PYPI_PACKAGE = "cryptography_vectors"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/recipes-devtools/python/python3-cryptography.bb
index c4204712f2..55fdf13972 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -11,7 +11,7 @@ LDSHARED += "-pthread"
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography-vectors
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "5c966c732cf6e4a276ce83b6e4c729edda2df6929083a952cc7da973c539c719"
+SRC_URI[sha256sum] = "4b1654dfc64ea479c242508eb8c724044f1e964a47d1d1cacc5132292d851971"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://check-memfree.py \
diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
index 16681e80a8..ed0ea3db52 100644
--- a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
@@ -1,4 +1,4 @@
-From b033cd32813a104fb216135cdca7da7180912e56 Mon Sep 17 00:00:00 2001
+From 46c1ab8dfdc59e3282a37beb3c8e9f331413db19 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Tue, 17 May 2022 17:22:48 +0800
 Subject: [PATCH] pyproject.toml: remove --benchmark-disable option
@@ -26,7 +26,7 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index 4746201..df98351 100644
+index a79b7f3..b5f140b 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
 @@ -129,7 +129,7 @@ exclude = [
-- 
2.47.1


--===============6684618400108581144==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-cryptography-vectors: PV changed from "45.0.6" to "45.0.7"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-45.0.6.tar.gz;downloadfilename=cryptography_vectors-45.0.6.tar.gz" to "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-45.0.7.tar.gz;downloadfilename=cryptography_vectors-45.0.7.tar.gz"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors: PKGV changed from 45.0.6 [default] to 45.0.7 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PV changed from "45.0.6" to "45.0.7"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PKGV changed from 45.0.6 [default] to 45.0.7 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PV changed from "45.0.6" to "45.0.7"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PKGV changed from 45.0.6 [default] to 45.0.7 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PV changed from "45.0.6" to "45.0.7"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PKGV changed from 45.0.6 [default] to 45.0.7 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PV changed from "45.0.6" to "45.0.7"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PKGV changed from 45.0.6 [default] to 45.0.7 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PV changed from "45.0.6" to "45.0.7"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PKGV changed from 45.0.6 [default] to 45.0.7 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PV changed from "45.0.6" to "45.0.7"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PKGV changed from 45.0.6 [default] to 45.0.7 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PV changed from "45.0.6" to "45.0.7"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PKGV changed from 45.0.6 [default] to 45.0.7 [default]
Changes to packages/x86-64-v3-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.13/site-packages/cryptography_vectors-45.0.6.dist-info moved to /usr/lib/python3.13/site-packages/cryptography_vectors-45.0.7.dist-info
packages/x86-64-v3-poky-linux/python3-cryptography: PV changed from "45.0.6" to "45.0.7"
packages/x86-64-v3-poky-linux/python3-cryptography: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cryptography/cryptography-45.0.6.tar.gz;downloadfilename=cryptography-45.0.6.tar.gz file://0001-pyproject.toml-remove-benchmark-disable-option.patch file://check-memfree.py file://run-ptest crate://crates.io/asn1/0.21.3 crate://crates.io/asn1_derive/0.21.3 crate://crates.io/autocfg/1.4.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/2.9.1 crate://crates.io/cc/1.2.23 crate://crates.io/cfg-if/1.0.0 crate://crates.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shared/0.1.1 crate://crates.io/heck/0.5.0 crate://crates.io/indoc/2.0.6 crate://crates.io/itoa/1.0.15 crate://crates.io/libc/0.2.172 crate://crates.io/memoffset/0.9.1 crate://crates.io/once_cell/1.21.3 crate://crates.io/openssl/0.10.72 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-sys/0.9.108 crate://crates.io/pem/3.0.5 crate://crates.io/pkg-config/0.3.32 crate://crates.
 io/portable-atomic/1.11.0 crate://crates.io/proc-macro2/1.0.95 crate://crates.io/pyo3/0.25.0 crate://crates.io/pyo3-build-config/0.25.0 crate://crates.io/pyo3-ffi/0.25.0 crate://crates.io/pyo3-macros/0.25.0 crate://crates.io/pyo3-macros-backend/0.25.0 crate://crates.io/quote/1.0.40 crate://crates.io/self_cell/1.2.0 crate://crates.io/shlex/1.3.0 crate://crates.io/syn/2.0.101 crate://crates.io/target-lexicon/0.13.2 crate://crates.io/unicode-ident/1.0.18 crate://crates.io/unindent/0.2.4 crate://crates.io/vcpkg/0.2.15" to "https://files.pythonhosted.org/packages/source/c/cryptography/cryptography-45.0.7.tar.gz;downloadfilename=cryptography-45.0.7.tar.gz file://0001-pyproject.toml-remove-benchmark-disable-option.patch file://check-memfree.py file://run-ptest crate://crates.io/asn1/0.21.3 crate://crates.io/asn1_derive/0.21.3 crate://crates.io/autocfg/1.4.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/2.9.1 crate://crates.io/cc/1.2.23 crate://crates.io/cfg-if/1.0.0 crate://cr
 ates.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shared/0.1.1 crate://crates.io/heck/0.5.0 crate://crates.io/indoc/2.0.6 crate://crates.io/itoa/1.0.15 crate://crates.io/libc/0.2.172 crate://crates.io/memoffset/0.9.1 crate://crates.io/once_cell/1.21.3 crate://crates.io/openssl/0.10.72 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-sys/0.9.108 crate://crates.io/pem/3.0.5 crate://crates.io/pkg-config/0.3.32 crate://crates.io/portable-atomic/1.11.0 crate://crates.io/proc-macro2/1.0.95 crate://crates.io/pyo3/0.25.0 crate://crates.io/pyo3-build-config/0.25.0 crate://crates.io/pyo3-ffi/0.25.0 crate://crates.io/pyo3-macros/0.25.0 crate://crates.io/pyo3-macros-backend/0.25.0 crate://crates.io/quote/1.0.40 crate://crates.io/self_cell/1.2.0 crate://crates.io/shlex/1.3.0 crate://crates.io/syn/2.0.101 crate://crates.io/target-lexicon/0.13.2 crate://crates.io/unicode-ident/1.0.18 crate://crates.io/unindent/0.2.4 crate://crates.io/vcpkg/0.2.15"
packages/x86-64-v3-poky-linux/python3-cryptography: PKGV changed from 45.0.6 [default] to 45.0.7 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-dbg: PV changed from "45.0.6" to "45.0.7"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-dbg: PKGSIZE changed from 1183928 to 1184264 (+0%)
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-dbg: PKGV changed from 45.0.6 [default] to 45.0.7 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-dev: PV changed from "45.0.6" to "45.0.7"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-dev: PKGV changed from 45.0.6 [default] to 45.0.7 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-doc: PV changed from "45.0.6" to "45.0.7"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-doc: PKGV changed from 45.0.6 [default] to 45.0.7 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-locale: PV changed from "45.0.6" to "45.0.7"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-locale: PKGV changed from 45.0.6 [default] to 45.0.7 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-ptest: PV changed from "45.0.6" to "45.0.7"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-ptest: PKGV changed from 45.0.6 [default] to 45.0.7 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-src: PV changed from "45.0.6" to "45.0.7"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-src: PKGV changed from 45.0.6 [default] to 45.0.7 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-staticdev: PV changed from "45.0.6" to "45.0.7"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-staticdev: PKGV changed from 45.0.6 [default] to 45.0.7 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography: PV changed from "45.0.6" to "45.0.7"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography: PKGSIZE changed from 4737270 to 4741398 (+0%)
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography: PKGV changed from 45.0.6 [default] to 45.0.7 [default]
Changes to packages/x86-64-v3-poky-linux/python3-cryptography (sysroot):
  /usr/lib/python3.13/site-packages/cryptography-45.0.6.dist-info moved to /usr/lib/python3.13/site-packages/cryptography-45.0.7.dist-info

--===============6684618400108581144==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cryptography-vectors-python3-cryptography-up.patch"

RnJvbSA3NTg3N2NkMjFlMzU1MjhmYWFmZDU4NTE1YWFjN2NlNTY3OGRlYmUyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMiBTZXAgMjAyNSAxNTowNjozNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnMscHl0aG9uMy1jcnlwdG9ncmFwaHk6IHVwZ3JhZGUK
IDQ1LjAuNiAtPiA0NS4wLjcsNDUuMC42IC0+IDQ1LjAuNwoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LWNvbW1vbi5pbmMgIHwgMiArLQogbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzLmJi
ICB8IDIgKy0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFw
aHkuYmIgICAgICAgICAgfCAyICstCiAuLi4vMDAwMS1weXByb2plY3QudG9tbC1yZW1vdmUtYmVu
Y2htYXJrLWRpc2FibGUtb3B0aW9uLnBhdGNoIHwgNCArKy0tCiA0IGZpbGVzIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LWNvbW1vbi5pbmMgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LWNvbW1vbi5pbmMKaW5k
ZXggODc0ZjYwYmY4My4uYmNiOTA3YjY0NSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS1jb21tb24uaW5jCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktY29tbW9uLmluYwpAQCAt
Myw0ICszLDQgQEAKICMKICMgQWRkaXRpb25hbGx5IEFVSCB3aWxsIGRldGVjdCB0aGF0IHRoZXkg
c2hhcmUgdGhpcyAuaW5jIGZpbGUgYW5kCiAjIHBlcmZvcm0gYSBsb2Nrc3RlcCB1cGdyYWRlIGZv
ciBib3RoLgotUFYgPSAiNDUuMC42IgorUFYgPSAiNDUuMC43IgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzLmJiIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3Jz
LmJiCmluZGV4IGI2YjBlMzhmMmUuLmU4NDU0ODZhOTQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9ycy5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnMu
YmIKQEAgLTksNyArOSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1
PThjMzYxN2RiNGZiNmZhZTAxZjFkMjUzYWI5MTUxMWU0IFwKICMgTk9URTogTWFrZSBzdXJlIHRv
IGtlZXAgdGhpcyByZWNpcGUgYXQgdGhlIHNhbWUgdmVyc2lvbiBhcyBweXRob24zLWNyeXB0b2dy
YXBoeQogIyAgICAgICBVcGdyYWRlIGJvdGggcmVjaXBlcyBhdCB0aGUgc2FtZSB0aW1lCiByZXF1
aXJlIHB5dGhvbjMtY3J5cHRvZ3JhcGh5LWNvbW1vbi5pbmMKLVNSQ19VUklbc2hhMjU2c3VtXSA9
ICIwNjhjZWUxNTQyM2YzZjE2MzNjYTA0ZjEyMjg0Mzg1YWM0MDRjMTkzNjZlN2NjYjNiNjgwMTU2
YzFhYTljNTczIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjQ4ZTcxZmM0YWM1ZjYyOThiMmRlNTNh
OTk3MjZkZGM0YTllNWVmMGE5NGQ5MjE4MjAxMDllN2I5MGJhZjlmNTYiCiAKIFBZUElfUEFDS0FH
RSA9ICJjcnlwdG9ncmFwaHlfdmVjdG9ycyIKIFVQU1RSRUFNX0NIRUNLX1BZUElfUEFDS0FHRSA9
ICIke1BZUElfUEFDS0FHRX0iCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWNyeXB0b2dyYXBoeS5iYgppbmRleCBjNDIwNDcxMmYyLi41NWZkZjEzOTcyIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3Jh
cGh5LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9n
cmFwaHkuYmIKQEAgLTExLDcgKzExLDcgQEAgTERTSEFSRUQgKz0gIi1wdGhyZWFkIgogIyBOT1RF
OiBNYWtlIHN1cmUgdG8ga2VlcCB0aGlzIHJlY2lwZSBhdCB0aGUgc2FtZSB2ZXJzaW9uIGFzIHB5
dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnMKICMgICAgICAgVXBncmFkZSBib3RoIHJlY2lwZXMg
YXQgdGhlIHNhbWUgdGltZQogcmVxdWlyZSBweXRob24zLWNyeXB0b2dyYXBoeS1jb21tb24uaW5j
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNWM5NjZjNzMyY2Y2ZTRhMjc2Y2U4M2I2ZTRjNzI5ZWRk
YTJkZjY5MjkwODNhOTUyY2M3ZGE5NzNjNTM5YzcxOSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI0
YjE2NTRkZmM2NGVhNDc5YzI0MjUwOGViOGM3MjQwNDRmMWU5NjRhNDdkMWQxY2FjYzUxMzIyOTJk
ODUxOTcxIgogCiBTUkNfVVJJICs9ICJmaWxlOi8vMDAwMS1weXByb2plY3QudG9tbC1yZW1vdmUt
YmVuY2htYXJrLWRpc2FibGUtb3B0aW9uLnBhdGNoIFwKICAgICAgICAgICAgIGZpbGU6Ly9jaGVj
ay1tZW1mcmVlLnB5IFwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1jcnlwdG9ncmFwaHkvMDAwMS1weXByb2plY3QudG9tbC1yZW1vdmUtYmVuY2htYXJr
LWRpc2FibGUtb3B0aW9uLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLWNyeXB0b2dyYXBoeS8wMDAxLXB5cHJvamVjdC50b21sLXJlbW92ZS1iZW5jaG1hcmstZGlz
YWJsZS1vcHRpb24ucGF0Y2gKaW5kZXggMTY2ODFlODBhOC4uZWQwZWEzZGI1MiAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS8wMDAx
LXB5cHJvamVjdC50b21sLXJlbW92ZS1iZW5jaG1hcmstZGlzYWJsZS1vcHRpb24ucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS8wMDAx
LXB5cHJvamVjdC50b21sLXJlbW92ZS1iZW5jaG1hcmstZGlzYWJsZS1vcHRpb24ucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIGIwMzNjZDMyODEzYTEwNGZiMjE2MTM1Y2RjYTdkYTcxODA5MTJl
NTYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDQ2YzFhYjhkZmRjNTllMzI4MmEzN2Jl
YjNjOGU5ZjMzMTQxM2RiMTkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBNaW5nbGkg
WXUgPG1pbmdsaS55dUB3aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCAxNyBNYXkgMjAyMiAxNzoy
Mjo0OCArMDgwMAogU3ViamVjdDogW1BBVENIXSBweXByb2plY3QudG9tbDogcmVtb3ZlIC0tYmVu
Y2htYXJrLWRpc2FibGUgb3B0aW9uCkBAIC0yNiw3ICsyNiw3IEBAIFNpZ25lZC1vZmYtYnk6IFRp
bSBPcmxpbmcgPHRpbS5vcmxpbmdAa29uc3Vsa28uY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvcHlwcm9qZWN0LnRvbWwg
Yi9weXByb2plY3QudG9tbAotaW5kZXggNDc0NjIwMS4uZGY5ODM1MSAxMDA2NDQKK2luZGV4IGE3
OWI3ZjMuLmI1ZjE0MGIgMTAwNjQ0CiAtLS0gYS9weXByb2plY3QudG9tbAogKysrIGIvcHlwcm9q
ZWN0LnRvbWwKIEBAIC0xMjksNyArMTI5LDcgQEAgZXhjbHVkZSA9IFsKLS0gCjIuNDcuMQoK

--===============6684618400108581144==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.13/site-packages/cryptography_vectors-45.0.6.dist-info moved to /usr/lib/python3.13/site-packages/cryptography_vectors-45.0.7.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-cryptography (sysroot):
  /usr/lib/python3.13/site-packages/cryptography-45.0.6.dist-info moved to /usr/lib/python3.13/site-packages/cryptography-45.0.7.dist-info

--===============6684618400108581144==--

