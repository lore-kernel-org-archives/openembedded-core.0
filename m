Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43205CA5FE7
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 07:36:38 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6163.1790926589028386856
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 00:36:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=QuQ7bZ//;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 514624E4110C
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Oct 2026 07:36:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2463F603DC
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Oct 2026 07:36:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3BC3310328455;
	Fri,  2 Oct 2026 09:36:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790926586; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jSVYhhSMY/BFDXEJ4XvWB3o92D3vWHW3Wc8eH18tL0o=;
	b=QuQ7bZ//qRL4gD0kqtLMiAxnT8+ZCnOM8u+FsHnwi3GT0AYRrzsttDGGVQouTWc53JchaQ
	BcC/+uv+75POO5wspq9w5pnxOww2WA0eL2AGBH6343ms3KVs9QeowwBw76HHAma/iUmLma
	qqXqw9C371jgU/7cuZ0o3Glphe/X/gosX0++z5MleocImyKvSAx7fBBa09RxoaRAfLdyiD
	UWG+0CqmDgQp/wmxWhQ6LE04HNNpLVWXwweE+LsleYg8yihjvfF5ECyTrVQ0CUIJ2WSxyA
	35WejDd/yI/cVLrNp6RleSl/VBtdCP7bqs6ZmdoOD9UzTn7u0YJGb8/MGqr0Nw==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Fri, 02 Oct 2026 09:36:06 +0200
Subject: [PATCH 3/9] python3-cryptography,python3-cryptography-vectors:
 upgrade 50.0.1 -> 50.0.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-mathieu-2026-10-01-upgrades-v1-3-3fdeab391403@bootlin.com>
References: <20261002-mathieu-2026-10-01-upgrades-v1-0-3fdeab391403@bootlin.com>
In-Reply-To: <20261002-mathieu-2026-10-01-upgrades-v1-0-3fdeab391403@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790926581; l=6937;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=7K/66rFaZpdClGgO56Iu1BVezjzpvfs9CcgqY3cglrs=;
 b=1y8owxr4P1RS44xLgRYqkq4fB0v6LnO6cg7oYZgTJ64byToc9SzubHKNdKgJtwEJskQvW6RJf
 jGUTIlSxtWDBKlhtgOoFB3UCn85GDCxANlAvIsC62jE73O3LmWuhfnY
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 07:36:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247076

Changelog:
- Updated Windows, macOS, and Linux wheels to be compiled with OpenSSL
  4.0.3.
- Added abi3.abi3t wheels for free-threaded CPython 3.15 and later.
- Updated to PyO3 0.29.2, which fixes building cryptography on Cygwin
  and MSYS2.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../python/python3-cryptography-common.inc           |  2 +-
 .../python/python3-cryptography-crates.inc           | 20 ++++++++++----------
 .../python/python3-cryptography-vectors.bb           |  2 +-
 meta/recipes-devtools/python/python3-cryptography.bb |  2 +-
 ...roject.toml-remove-benchmark-disable-option.patch |  6 +++---
 5 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-cryptography-common.inc b/meta/recipes-devtools/python/python3-cryptography-common.inc
index d37f52358d3f..37bac765d051 100644
--- a/meta/recipes-devtools/python/python3-cryptography-common.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-common.inc
@@ -3,4 +3,4 @@
 #
 # Additionally AUH will detect that they share this .inc file and
 # perform a lockstep upgrade for both.
-PV = "50.0.1"
+PV = "50.0.2"
diff --git a/meta/recipes-devtools/python/python3-cryptography-crates.inc b/meta/recipes-devtools/python/python3-cryptography-crates.inc
index f626556e1306..91e910e71174 100644
--- a/meta/recipes-devtools/python/python3-cryptography-crates.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-crates.inc
@@ -22,11 +22,11 @@ SRC_URI += " \
     crate://crates.io/pkg-config/0.3.33 \
     crate://crates.io/portable-atomic/1.14.0 \
     crate://crates.io/proc-macro2/1.0.107 \
-    crate://crates.io/pyo3/0.29.0 \
-    crate://crates.io/pyo3-build-config/0.29.0 \
-    crate://crates.io/pyo3-ffi/0.29.0 \
-    crate://crates.io/pyo3-macros/0.29.0 \
-    crate://crates.io/pyo3-macros-backend/0.29.0 \
+    crate://crates.io/pyo3/0.29.2 \
+    crate://crates.io/pyo3-build-config/0.29.2 \
+    crate://crates.io/pyo3-ffi/0.29.2 \
+    crate://crates.io/pyo3-macros/0.29.2 \
+    crate://crates.io/pyo3-macros-backend/0.29.2 \
     crate://crates.io/quote/1.0.47 \
     crate://crates.io/self_cell/1.3.0 \
     crate://crates.io/shlex/2.0.1 \
@@ -56,11 +56,11 @@ SRC_URI[pem-4.0.0.sha256sum] = "d354a98a3d1251555de99e8fdd8afda05573c31b82f59063
 SRC_URI[pkg-config-0.3.33.sha256sum] = "19f132c84eca552bf34cab8ec81f1c1dcc229b811638f9d283dceabe58c5569e"
 SRC_URI[portable-atomic-1.14.0.sha256sum] = "3d20d5497ef88037a52ff98267d066e7f11fcc5e99bbfbd58a42336193aacec3"
 SRC_URI[proc-macro2-1.0.107.sha256sum] = "985e7ec9bb745e6ce6535b544d84d6cd6f7ad8bd711c398938ae983b91a766d9"
-SRC_URI[pyo3-0.29.0.sha256sum] = "cd274650b21d4bfc26a0a47587962c1edb425f69287324355cd040c3ea66071c"
-SRC_URI[pyo3-build-config-0.29.0.sha256sum] = "c5e2a7d2f0d013342f295c048ad19237add5154a55b1c5a254c0ec93d4109078"
-SRC_URI[pyo3-ffi-0.29.0.sha256sum] = "ca85c467da1bbc8d866eea5deff9cf29ea5f7785054a17da36e65bda9c05845b"
-SRC_URI[pyo3-macros-0.29.0.sha256sum] = "9ac53762fd065daa3194dd09337a38bd793a188100fd1a9304c4ab312d901771"
-SRC_URI[pyo3-macros-backend-0.29.0.sha256sum] = "4ca3a1557399783172dc5bf39cfca835157732532cba56b71d2292161e53b362"
+SRC_URI[pyo3-0.29.2.sha256sum] = "4688ddedf473e32662b9b067670129a8afb8c18e351482c70d62ba4a88171e8b"
+SRC_URI[pyo3-build-config-0.29.2.sha256sum] = "f41027e41b4bd03f6e60f9f417fe24a6341a6bb744edd62b6f709f2a52ea30e9"
+SRC_URI[pyo3-ffi-0.29.2.sha256sum] = "e591a95526fead067432c3b3a33fc74770b87b1e04e73671090d9c2055a2b327"
+SRC_URI[pyo3-macros-0.29.2.sha256sum] = "73225868fc1cd84eef2c3c230ddb91273bf1de46aeb8a4248da76d32a0924a1c"
+SRC_URI[pyo3-macros-backend-0.29.2.sha256sum] = "571575aa3749fa6216757dd47d2a3e7ef360f329a40f0666a9fbd14889024952"
 SRC_URI[quote-1.0.47.sha256sum] = "1fbf4db142a473a8d80c26bbf18454ed458bf8d26c8219c331daecfdbd079001"
 SRC_URI[self_cell-1.3.0.sha256sum] = "2ab42ca02749e120097e328d91d415325bdf43b1c72c4c8badf37375fe40a813"
 SRC_URI[shlex-2.0.1.sha256sum] = "f8fadd59c855ef2080decdef8ff161eb6661b86933c9d82e5ba29dc602a55aba"
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors.bb b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
index 87302e1b2f3f..86e437ea5a6b 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "90066d0f7351b12ebac2b4ce594ce0a6f05c19ad3068e4d5cfc64d9d2bec8d80"
+SRC_URI[sha256sum] = "d99111fe5dd5a8d40650e300aad34b6e6910ca198c674b8008450ca69f8f05c4"
 
 inherit pypi python_uv_build
 
diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/recipes-devtools/python/python3-cryptography.bb
index edcdb5a75b15..5a1ce9fe2dd8 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -11,7 +11,7 @@ LDSHARED += "-pthread"
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography-vectors
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "5dd9bda1c12b4162f6ff568eeb5e0ff956c28d14406e875cfe8a63a2d414ff20"
+SRC_URI[sha256sum] = "7b46165bb56eb4704e2eaaf86f3c940d19154535d9b0ca7d6d590b04060e00d5"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://check-memfree.py \
diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
index 454e08605aa6..012f7e5761f1 100644
--- a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
@@ -1,4 +1,4 @@
-From 74473daa46b315f3d98fbf9a6a58f52c9c29a365 Mon Sep 17 00:00:00 2001
+From 1e86700ed4780712f9c2a78dd1b98cde92d674e2 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Tue, 17 May 2022 17:22:48 +0800
 Subject: [PATCH] pyproject.toml: remove --benchmark-disable option
@@ -26,10 +26,10 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index b56cda9..781743b 100644
+index d0187a8..cbec7a1 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
-@@ -140,7 +140,7 @@ exclude = [
+@@ -141,7 +141,7 @@ exclude = [
  ]
  
  [tool.pytest.ini_options]

-- 
2.47.3


