Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B78F5C61DD3
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 05:59:58 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6364.1787723988855513680
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 22:59:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=jhIyWRK2;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=yswu+Shp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a03ca73c23-693df253-bf27-4ccd-9d14-d6f12ac5d55c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1787723988;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EojQbGAgpN/RI12pgzWiwXEZZenf/HCtFThQ2lUMI4o=;
	b=jhIyWRK2lIu8ACUtoSonv9nxQAeZnfSZ0AotDHwSvGw5vfvH4zaHez3BspsiKOce
	TQ9nIxd+RumFALY9AQQMkFBIizmEj6Ei7zM2DQIQFMhUvMylYk9ZfXlXNXQzAH04ZKv
	VXjxqmnoJlnoWIFye6kqaMEzkgIBN8joUcX21y+w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1787723988;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EojQbGAgpN/RI12pgzWiwXEZZenf/HCtFThQ2lUMI4o=;
	b=yswu+ShpEalOKtmtjSe/kNf6y9Tm1xwepIFEmyWBJKNTxLta8L+aJSAQ6NyU/jjU
	7dV+60QhdmjakvvKARR0QPTJZBjWbLE1wDp7wRI8SDfGw7ig5aoetOAXrgxAeqznlcu
	BWIDnxZGtTPH6v+mZWWfU6czYzMqSXU/2v86D5ME=
Content-Type: multipart/mixed; boundary="===============6858143046746255392=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>, 
	Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cryptography-vectors,python3-cryptography: upgrading to
 50.0.1,50.0.1 SUCCEEDED
Message-ID: <010101a03ca73c23-693df253-bf27-4ccd-9d14-d6f12ac5d55c-000000@us-west-2.amazonses.com>
Date: Wed, 26 Aug 2026 05:59:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.26-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 05:59:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244304

--===============6858143046746255392==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-cryptography-vectors,python3-cryptography* to *50.0.1,50.0.1* has Succeeded.

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
From 2c21d26fbde6aea51060c4d29ca2302429b8b730 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 26 Aug 2026 05:34:51 +0000
Subject: [PATCH] python3-cryptography-vectors,python3-cryptography: upgrade
 50.0.0 -> 50.0.1,50.0.0 -> 50.0.1

Source: CHANGELOG.rst

50.0.1 - 2026-08-25
~~~~~~~~~~~~~~~~~~~

* Updated Windows, macOS, and Linux wheels to be compiled with OpenSSL 4.0.2.
---
 .../python/python3-cryptography-common.inc                | 2 +-
 .../python/python3-cryptography-vectors.bb                | 2 +-
 meta/recipes-devtools/python/python3-cryptography.bb      | 2 +-
 ...1-pyproject.toml-remove-benchmark-disable-option.patch | 8 +++-----
 4 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-cryptography-common.inc b/meta/recipes-devtools/python/python3-cryptography-common.inc
index 298c52d1d3..d37f52358d 100644
--- a/meta/recipes-devtools/python/python3-cryptography-common.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-common.inc
@@ -3,4 +3,4 @@
 #
 # Additionally AUH will detect that they share this .inc file and
 # perform a lockstep upgrade for both.
-PV = "50.0.0"
+PV = "50.0.1"
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors.bb b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
index d62d681c6d..0f25199f68 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "6760814930443e6d73a6afcad09463d3ffdc42084ee0bdcfb2f05697250c3c8d"
+SRC_URI[sha256sum] = "90066d0f7351b12ebac2b4ce594ce0a6f05c19ad3068e4d5cfc64d9d2bec8d80"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/recipes-devtools/python/python3-cryptography.bb
index d6a1bb53f3..f2ac4e1b89 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -11,7 +11,7 @@ LDSHARED += "-pthread"
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography-vectors
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "eeac2acb5a20ed25e0ad6d1df9891a520b78b404266b6d11778f25d5d691a6c9"
+SRC_URI[sha256sum] = "5dd9bda1c12b4162f6ff568eeb5e0ff956c28d14406e875cfe8a63a2d414ff20"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://check-memfree.py \
diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
index 967b661c6e..454e08605a 100644
--- a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
@@ -1,4 +1,4 @@
-From c8fd85d80eb64fede8447842042977b70b3c96bc Mon Sep 17 00:00:00 2001
+From 74473daa46b315f3d98fbf9a6a58f52c9c29a365 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Tue, 17 May 2022 17:22:48 +0800
 Subject: [PATCH] pyproject.toml: remove --benchmark-disable option
@@ -26,17 +26,15 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index fb8185913..29d0b3e08 100644
+index b56cda9..781743b 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
 @@ -140,7 +140,7 @@ exclude = [
  ]
-
+ 
  [tool.pytest.ini_options]
 -addopts = "-r s --capture=no --strict-markers --benchmark-disable"
 +addopts = "-r s --capture=no --strict-markers"
  testpaths = ["tests"]
  console_output_style = "progress-even-when-capture-no"
  markers = [
---
-2.43.0
-- 
2.47.1


--===============6858143046746255392==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-cryptography-vectors: PKGV changed from 50.0.0 [default] to 50.0.1 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors: PV changed from "50.0.0" to "50.0.1"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-50.0.0.tar.gz;downloadfilename=cryptography_vectors-50.0.0.tar.gz" to "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-50.0.1.tar.gz;downloadfilename=cryptography_vectors-50.0.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PKGV changed from 50.0.0 [default] to 50.0.1 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PV changed from "50.0.0" to "50.0.1"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PKGV changed from 50.0.0 [default] to 50.0.1 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PV changed from "50.0.0" to "50.0.1"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PKGV changed from 50.0.0 [default] to 50.0.1 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PV changed from "50.0.0" to "50.0.1"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PKGV changed from 50.0.0 [default] to 50.0.1 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PV changed from "50.0.0" to "50.0.1"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PKGV changed from 50.0.0 [default] to 50.0.1 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PV changed from "50.0.0" to "50.0.1"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PKGV changed from 50.0.0 [default] to 50.0.1 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PV changed from "50.0.0" to "50.0.1"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PKGV changed from 50.0.0 [default] to 50.0.1 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PV changed from "50.0.0" to "50.0.1"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: FILELIST: directory renamed /usr/lib/python3.14/site-packages/cryptography_vectors-50.0.0.dist-info -> /usr/lib/python3.14/site-packages/cryptography_vectors-50.0.1.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.14/site-packages/cryptography_vectors-50.0.0.dist-info moved to /usr/lib/python3.14/site-packages/cryptography_vectors-50.0.1.dist-info
packages/x86-64-v3-poky-linux/python3-cryptography: PKGV changed from 50.0.0 [default] to 50.0.1 [default]
packages/x86-64-v3-poky-linux/python3-cryptography: PV changed from "50.0.0" to "50.0.1"
packages/x86-64-v3-poky-linux/python3-cryptography: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cryptography/cryptography-50.0.0.tar.gz;downloadfilename=cryptography-50.0.0.tar.gz file://0001-pyproject.toml-remove-benchmark-disable-option.patch file://check-memfree.py file://run-ptest crate://crates.io/asn1/0.24.1 crate://crates.io/asn1_derive/0.24.1 crate://crates.io/base64/0.23.0 crate://crates.io/bitflags/2.13.1 crate://crates.io/cc/1.4.0 crate://crates.io/cfg-if/1.0.4 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shared/0.1.1 crate://crates.io/heck/0.5.0 crate://crates.io/itoa/1.0.18 crate://crates.io/libc/0.2.189 crate://crates.io/once_cell/1.21.4 crate://crates.io/openssl/0.10.81 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-sys/0.9.117 crate://crates.io/pem/4.0.0 crate://crates.io/pkg-config/0.3.33 crate://crates.io/portable-atomic/1.14.0 crate://crates.io/proc-macro2/
 1.0.107 crate://crates.io/pyo3/0.29.0 crate://crates.io/pyo3-build-config/0.29.0 crate://crates.io/pyo3-ffi/0.29.0 crate://crates.io/pyo3-macros/0.29.0 crate://crates.io/pyo3-macros-backend/0.29.0 crate://crates.io/quote/1.0.47 crate://crates.io/self_cell/1.3.0 crate://crates.io/shlex/2.0.1 crate://crates.io/syn/2.0.119 crate://crates.io/target-lexicon/0.13.5 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/vcpkg/0.2.15" to "https://files.pythonhosted.org/packages/source/c/cryptography/cryptography-50.0.1.tar.gz;downloadfilename=cryptography-50.0.1.tar.gz file://0001-pyproject.toml-remove-benchmark-disable-option.patch file://check-memfree.py file://run-ptest crate://crates.io/asn1/0.24.1 crate://crates.io/asn1_derive/0.24.1 crate://crates.io/base64/0.23.0 crate://crates.io/bitflags/2.13.1 crate://crates.io/cc/1.4.0 crate://crates.io/cfg-if/1.0.4 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shared/0.1.1 crate:/
 /crates.io/heck/0.5.0 crate://crates.io/itoa/1.0.18 crate://crates.io/libc/0.2.189 crate://crates.io/once_cell/1.21.4 crate://crates.io/openssl/0.10.81 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-sys/0.9.117 crate://crates.io/pem/4.0.0 crate://crates.io/pkg-config/0.3.33 crate://crates.io/portable-atomic/1.14.0 crate://crates.io/proc-macro2/1.0.107 crate://crates.io/pyo3/0.29.0 crate://crates.io/pyo3-build-config/0.29.0 crate://crates.io/pyo3-ffi/0.29.0 crate://crates.io/pyo3-macros/0.29.0 crate://crates.io/pyo3-macros-backend/0.29.0 crate://crates.io/quote/1.0.47 crate://crates.io/self_cell/1.3.0 crate://crates.io/shlex/2.0.1 crate://crates.io/syn/2.0.119 crate://crates.io/target-lexicon/0.13.5 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/vcpkg/0.2.15"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-dbg: PKGV changed from 50.0.0 [default] to 50.0.1 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-dbg: PV changed from "50.0.0" to "50.0.1"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-dbg: PKGSIZE changed from 1840056 to 1840256 (+0%)
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-dev: PKGV changed from 50.0.0 [default] to 50.0.1 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-dev: PV changed from "50.0.0" to "50.0.1"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-doc: PKGV changed from 50.0.0 [default] to 50.0.1 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-doc: PV changed from "50.0.0" to "50.0.1"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-locale: PKGV changed from 50.0.0 [default] to 50.0.1 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-locale: PV changed from "50.0.0" to "50.0.1"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-ptest: PKGV changed from 50.0.0 [default] to 50.0.1 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-ptest: PV changed from "50.0.0" to "50.0.1"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-src: PKGV changed from 50.0.0 [default] to 50.0.1 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-src: PV changed from "50.0.0" to "50.0.1"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-staticdev: PKGV changed from 50.0.0 [default] to 50.0.1 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-staticdev: PV changed from "50.0.0" to "50.0.1"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography: PKGV changed from 50.0.0 [default] to 50.0.1 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography: PV changed from "50.0.0" to "50.0.1"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography: FILELIST: directory renamed /usr/lib/python3.14/site-packages/cryptography-50.0.0.dist-info -> /usr/lib/python3.14/site-packages/cryptography-50.0.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/cryptography-50.0.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/cryptography-50.0.1.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-cryptography (sysroot):
  /usr/lib/python3.14/site-packages/cryptography-50.0.0.dist-info moved to /usr/lib/python3.14/site-packages/cryptography-50.0.1.dist-info

--===============6858143046746255392==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-cryptography-changelog.txt"

Changelog for python3-cryptography: 50.0.0 -> 50.0.1
Source: CHANGELOG.rst

50.0.1 - 2026-08-25
~~~~~~~~~~~~~~~~~~~

* Updated Windows, macOS, and Linux wheels to be compiled with OpenSSL 4.0.2.

--===============6858143046746255392==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cryptography-vectors-python3-cryptography-up.patch"

RnJvbSAyYzIxZDI2ZmJkZTZhZWE1MTA2MGM0ZDI5Y2EyMzAyNDI5YjhiNzMwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjYgQXVnIDIwMjYgMDU6MzQ6NTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzLHB5dGhvbjMtY3J5cHRvZ3JhcGh5OiB1cGdyYWRl
CiA1MC4wLjAgLT4gNTAuMC4xLDUwLjAuMCAtPiA1MC4wLjEKClNvdXJjZTogQ0hBTkdFTE9HLnJz
dAoKNTAuMC4xIC0gMjAyNi0wOC0yNQp+fn5+fn5+fn5+fn5+fn5+fn5+CgoqIFVwZGF0ZWQgV2lu
ZG93cywgbWFjT1MsIGFuZCBMaW51eCB3aGVlbHMgdG8gYmUgY29tcGlsZWQgd2l0aCBPcGVuU1NM
IDQuMC4yLgotLS0KIC4uLi9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktY29tbW9uLmluYyAg
ICAgICAgICAgICAgICB8IDIgKy0KIC4uLi9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVj
dG9ycy5iYiAgICAgICAgICAgICAgICB8IDIgKy0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1jcnlwdG9ncmFwaHkuYmIgICAgICB8IDIgKy0KIC4uLjEtcHlwcm9qZWN0LnRv
bWwtcmVtb3ZlLWJlbmNobWFyay1kaXNhYmxlLW9wdGlvbi5wYXRjaCB8IDggKysrLS0tLS0KIDQg
ZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktY29t
bW9uLmluYyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFw
aHktY29tbW9uLmluYwppbmRleCAyOThjNTJkMWQzLi5kMzdmNTIzNThkIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LWNvbW1vbi5p
bmMKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBo
eS1jb21tb24uaW5jCkBAIC0zLDQgKzMsNCBAQAogIwogIyBBZGRpdGlvbmFsbHkgQVVIIHdpbGwg
ZGV0ZWN0IHRoYXQgdGhleSBzaGFyZSB0aGlzIC5pbmMgZmlsZSBhbmQKICMgcGVyZm9ybSBhIGxv
Y2tzdGVwIHVwZ3JhZGUgZm9yIGJvdGguCi1QViA9ICI1MC4wLjAiCitQViA9ICI1MC4wLjEiCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3Jh
cGh5LXZlY3RvcnMuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5
cHRvZ3JhcGh5LXZlY3RvcnMuYmIKaW5kZXggZDYyZDY4MWM2ZC4uMGYyNTE5OWY2OCAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS12
ZWN0b3JzLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlw
dG9ncmFwaHktdmVjdG9ycy5iYgpAQCAtOSw3ICs5LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vTElDRU5TRTttZDU9OGMzNjE3ZGI0ZmI2ZmFlMDFmMWQyNTNhYjkxNTExZTQgXAogIyBO
T1RFOiBNYWtlIHN1cmUgdG8ga2VlcCB0aGlzIHJlY2lwZSBhdCB0aGUgc2FtZSB2ZXJzaW9uIGFz
IHB5dGhvbjMtY3J5cHRvZ3JhcGh5CiAjICAgICAgIFVwZ3JhZGUgYm90aCByZWNpcGVzIGF0IHRo
ZSBzYW1lIHRpbWUKIHJlcXVpcmUgcHl0aG9uMy1jcnlwdG9ncmFwaHktY29tbW9uLmluYwotU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjY3NjA4MTQ5MzA0NDNlNmQ3M2E2YWZjYWQwOTQ2M2QzZmZkYzQy
MDg0ZWUwYmRjZmIyZjA1Njk3MjUwYzNjOGQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOTAwNjZk
MGY3MzUxYjEyZWJhYzJiNGNlNTk0Y2UwYTZmMDVjMTlhZDMwNjhlNGQ1Y2ZjNjRkOWQyYmVjOGQ4
MCIKIAogUFlQSV9QQUNLQUdFID0gImNyeXB0b2dyYXBoeV92ZWN0b3JzIgogCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LmJiIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS5iYgppbmRl
eCBkNmExYmI1M2YzLi5mMmFjNGUxYjg5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHkuYmIKQEAgLTExLDcgKzExLDcgQEAgTERT
SEFSRUQgKz0gIi1wdGhyZWFkIgogIyBOT1RFOiBNYWtlIHN1cmUgdG8ga2VlcCB0aGlzIHJlY2lw
ZSBhdCB0aGUgc2FtZSB2ZXJzaW9uIGFzIHB5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnMKICMg
ICAgICAgVXBncmFkZSBib3RoIHJlY2lwZXMgYXQgdGhlIHNhbWUgdGltZQogcmVxdWlyZSBweXRo
b24zLWNyeXB0b2dyYXBoeS1jb21tb24uaW5jCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZWVhYzJh
Y2I1YTIwZWQyNWUwYWQ2ZDFkZjk4OTFhNTIwYjc4YjQwNDI2NmI2ZDExNzc4ZjI1ZDVkNjkxYTZj
OSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI1ZGQ5YmRhMWMxMmI0MTYyZjZmZjU2OGVlYjVlMGZm
OTU2YzI4ZDE0NDA2ZTg3NWNmZThhNjNhMmQ0MTRmZjIwIgogCiBTUkNfVVJJICs9ICJmaWxlOi8v
MDAwMS1weXByb2plY3QudG9tbC1yZW1vdmUtYmVuY2htYXJrLWRpc2FibGUtb3B0aW9uLnBhdGNo
IFwKICAgICAgICAgICAgIGZpbGU6Ly9jaGVjay1tZW1mcmVlLnB5IFwKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHkvMDAwMS1weXBy
b2plY3QudG9tbC1yZW1vdmUtYmVuY2htYXJrLWRpc2FibGUtb3B0aW9uLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS8wMDAxLXB5cHJvamVj
dC50b21sLXJlbW92ZS1iZW5jaG1hcmstZGlzYWJsZS1vcHRpb24ucGF0Y2gKaW5kZXggOTY3YjY2
MWM2ZS4uNDU0ZTA4NjA1YSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWNyeXB0b2dyYXBoeS8wMDAxLXB5cHJvamVjdC50b21sLXJlbW92ZS1iZW5jaG1h
cmstZGlzYWJsZS1vcHRpb24ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWNyeXB0b2dyYXBoeS8wMDAxLXB5cHJvamVjdC50b21sLXJlbW92ZS1iZW5jaG1h
cmstZGlzYWJsZS1vcHRpb24ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGM4ZmQ4NWQ4MGVi
NjRmZWRlODQ0Nzg0MjA0Mjk3N2I3MGIzYzk2YmMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIDc0NDczZGFhNDZiMzE1ZjNkOThmYmY5YTZhNThmNTJjOWMyOWEzNjUgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBNaW5nbGkgWXUgPG1pbmdsaS55dUB3aW5kcml2ZXIuY29tPgog
RGF0ZTogVHVlLCAxNyBNYXkgMjAyMiAxNzoyMjo0OCArMDgwMAogU3ViamVjdDogW1BBVENIXSBw
eXByb2plY3QudG9tbDogcmVtb3ZlIC0tYmVuY2htYXJrLWRpc2FibGUgb3B0aW9uCkBAIC0yNiwx
NyArMjYsMTUgQEAgU2lnbmVkLW9mZi1ieTogVGltIE9ybGluZyA8dGltLm9ybGluZ0Brb25zdWxr
by5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAK
IGRpZmYgLS1naXQgYS9weXByb2plY3QudG9tbCBiL3B5cHJvamVjdC50b21sCi1pbmRleCBmYjgx
ODU5MTMuLjI5ZDBiM2UwOCAxMDA2NDQKK2luZGV4IGI1NmNkYTkuLjc4MTc0M2IgMTAwNjQ0CiAt
LS0gYS9weXByb2plY3QudG9tbAogKysrIGIvcHlwcm9qZWN0LnRvbWwKIEBAIC0xNDAsNyArMTQw
LDcgQEAgZXhjbHVkZSA9IFsKICBdCi0KKyAKICBbdG9vbC5weXRlc3QuaW5pX29wdGlvbnNdCiAt
YWRkb3B0cyA9ICItciBzIC0tY2FwdHVyZT1ubyAtLXN0cmljdC1tYXJrZXJzIC0tYmVuY2htYXJr
LWRpc2FibGUiCiArYWRkb3B0cyA9ICItciBzIC0tY2FwdHVyZT1ubyAtLXN0cmljdC1tYXJrZXJz
IgogIHRlc3RwYXRocyA9IFsidGVzdHMiXQogIGNvbnNvbGVfb3V0cHV0X3N0eWxlID0gInByb2dy
ZXNzLWV2ZW4td2hlbi1jYXB0dXJlLW5vIgogIG1hcmtlcnMgPSBbCi0tLQotMi40My4wCi0tIAoy
LjQ3LjEKCg==

--===============6858143046746255392==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: FILELIST: directory renamed /usr/lib/python3.14/site-packages/cryptography_vectors-50.0.0.dist-info -> /usr/lib/python3.14/site-packages/cryptography_vectors-50.0.1.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.14/site-packages/cryptography_vectors-50.0.0.dist-info moved to /usr/lib/python3.14/site-packages/cryptography_vectors-50.0.1.dist-info
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography: FILELIST: directory renamed /usr/lib/python3.14/site-packages/cryptography-50.0.0.dist-info -> /usr/lib/python3.14/site-packages/cryptography-50.0.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/cryptography-50.0.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/cryptography-50.0.1.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-cryptography (sysroot):
  /usr/lib/python3.14/site-packages/cryptography-50.0.0.dist-info moved to /usr/lib/python3.14/site-packages/cryptography-50.0.1.dist-info

--===============6858143046746255392==--

