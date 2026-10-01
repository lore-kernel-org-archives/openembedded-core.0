Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 538BACA5FB3
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 06:31:41 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5325.1790836300624507265
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 23:31:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=W1JJFaNr;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Xyb7RCX4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a0f6295818-53a7f4af-6e03-48f8-8d43-69caf4960780-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790836300;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=MseazpcVtluI7SN5w+RXXIt2jGkMuKz8pIPGFaxG0CI=;
	b=W1JJFaNrFK6wBw4tT00VvZBJTF9Kvc0KclauCLczr7n41yUkRKDJdexly1//4dYh
	eRb57gmkV2+8OkJW6C2xp5/qvqhZCCQkpqfiIDenAiqxUt0sa97N7DCVA4qgkZQSIZD
	Hc7aUWUM92mS7I0gp5ksAvPKUg63nugOGc5zUjvA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790836300;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=MseazpcVtluI7SN5w+RXXIt2jGkMuKz8pIPGFaxG0CI=;
	b=Xyb7RCX4WSgX0XKEYhRBTKeH5nBPkBCp9qbRqnZL6EgF4nvMbdxWk/YbGySZkwEH
	Nhgw6oAZ0fSpM63FiWdlx24QX2MmooypbpBq0oycontZ3/Z8/EPoDiOnL29rVrlsKki
	Mz+3u/ZwNLC0vO0Bh3+RGE7jkAb+741QOQ/vLNIE=
Content-Type: multipart/mixed; boundary="===============1463433677303811511=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>, 
	Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cryptography,python3-cryptography-vectors: upgrading to
 50.0.2 SUCCEEDED
Message-ID: <010101a0f6295818-53a7f4af-6e03-48f8-8d43-69caf4960780-000000@us-west-2.amazonses.com>
Date: Thu, 1 Oct 2026 06:31:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 06:31:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247001

--===============1463433677303811511==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-cryptography,python3-cryptography-vectors* to *50.0.2* has Succeeded.

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
From 167cdbfda81d67c77db8e6c73eaaea2f66551ff5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Oct 2026 05:12:12 +0000
Subject: [PATCH] python3-cryptography,python3-cryptography-vectors: upgrade
 50.0.1 -> 50.0.2

50.0.2 - 2026-09-30
~~~~~~~~~~~~~~~~~~~
---
 .../python/python3-cryptography-common.inc    |  2 +-
 .../python/python3-cryptography-crates.inc    | 20 +++++++++----------
 .../python/python3-cryptography-vectors.bb    |  2 +-
 .../python/python3-cryptography.bb            |  2 +-
 ...toml-remove-benchmark-disable-option.patch |  6 +++---
 5 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-cryptography-common.inc b/meta/recipes-devtools/python/python3-cryptography-common.inc
index d37f52358d..37bac765d0 100644
--- a/meta/recipes-devtools/python/python3-cryptography-common.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-common.inc
@@ -3,4 +3,4 @@
 #
 # Additionally AUH will detect that they share this .inc file and
 # perform a lockstep upgrade for both.
-PV = "50.0.1"
+PV = "50.0.2"
diff --git a/meta/recipes-devtools/python/python3-cryptography-crates.inc b/meta/recipes-devtools/python/python3-cryptography-crates.inc
index f626556e13..91e910e711 100644
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
index 0f25199f68..8e7d972959 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "90066d0f7351b12ebac2b4ce594ce0a6f05c19ad3068e4d5cfc64d9d2bec8d80"
+SRC_URI[sha256sum] = "d99111fe5dd5a8d40650e300aad34b6e6910ca198c674b8008450ca69f8f05c4"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/recipes-devtools/python/python3-cryptography.bb
index f2ac4e1b89..0386f5d5a2 100644
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
index 454e08605a..012f7e5761 100644
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
2.47.1


--===============1463433677303811511==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cryptography-python3-cryptography-vectors-up.patch"

RnJvbSAxNjdjZGJmZGE4MWQ2N2M3N2RiOGU2YzczZWFhZWEyZjY2NTUxZmY1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBPY3QgMjAyNiAwNToxMjoxMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtY3J5cHRvZ3JhcGh5LHB5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnM6IHVwZ3JhZGUK
IDUwLjAuMSAtPiA1MC4wLjIKCjUwLjAuMiAtIDIwMjYtMDktMzAKfn5+fn5+fn5+fn5+fn5+fn5+
fgotLS0KIC4uLi9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktY29tbW9uLmluYyAgICB8ICAy
ICstCiAuLi4vcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LWNyYXRlcy5pbmMgICAgfCAyMCAr
KysrKysrKystLS0tLS0tLS0tCiAuLi4vcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3Rv
cnMuYmIgICAgfCAgMiArLQogLi4uL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS5iYiAgICAg
ICAgICAgIHwgIDIgKy0KIC4uLnRvbWwtcmVtb3ZlLWJlbmNobWFyay1kaXNhYmxlLW9wdGlvbi5w
YXRjaCB8ICA2ICsrKy0tLQogNSBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAxNiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtY3J5cHRvZ3JhcGh5LWNvbW1vbi5pbmMgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LWNvbW1vbi5pbmMKaW5kZXggZDM3ZjUyMzU4ZC4uMzdi
YWM3NjVkMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LWNyeXB0b2dyYXBoeS1jb21tb24uaW5jCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1jcnlwdG9ncmFwaHktY29tbW9uLmluYwpAQCAtMyw0ICszLDQgQEAKICMKICMg
QWRkaXRpb25hbGx5IEFVSCB3aWxsIGRldGVjdCB0aGF0IHRoZXkgc2hhcmUgdGhpcyAuaW5jIGZp
bGUgYW5kCiAjIHBlcmZvcm0gYSBsb2Nrc3RlcCB1cGdyYWRlIGZvciBib3RoLgotUFYgPSAiNTAu
MC4xIgorUFYgPSAiNTAuMC4yIgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS1jcmF0ZXMuaW5jIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS1jcmF0ZXMuaW5jCmluZGV4IGY2MjY1NTZl
MTMuLjkxZTkxMGU3MTEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1jcnlwdG9ncmFwaHktY3JhdGVzLmluYworKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LWNyYXRlcy5pbmMKQEAgLTIyLDExICsyMiwx
MSBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3BrZy1jb25maWcvMC4z
LjMzIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9wb3J0YWJsZS1hdG9taWMvMS4xNC4wIFwKICAg
ICBjcmF0ZTovL2NyYXRlcy5pby9wcm9jLW1hY3JvMi8xLjAuMTA3IFwKLSAgICBjcmF0ZTovL2Ny
YXRlcy5pby9weW8zLzAuMjkuMCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy1idWlsZC1j
b25maWcvMC4yOS4wIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLWZmaS8wLjI5LjAgXAot
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMtbWFjcm9zLzAuMjkuMCBcCi0gICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vcHlvMy1tYWNyb3MtYmFja2VuZC8wLjI5LjAgXAorICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3B5bzMvMC4yOS4yIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLWJ1aWxkLWNvbmZp
Zy8wLjI5LjIgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMtZmZpLzAuMjkuMiBcCisgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy1tYWNyb3MvMC4yOS4yIFwKKyAgICBjcmF0ZTovL2NyYXRl
cy5pby9weW8zLW1hY3Jvcy1iYWNrZW5kLzAuMjkuMiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
cXVvdGUvMS4wLjQ3IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9zZWxmX2NlbGwvMS4zLjAgXAog
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NobGV4LzIuMC4xIFwKQEAgLTU2LDExICs1NiwxMSBAQCBT
UkNfVVJJW3BlbS00LjAuMC5zaGEyNTZzdW1dID0gImQzNTRhOThhM2QxMjUxNTU1ZGU5OWU4ZmRk
OGFmZGEwNTU3M2MzMWI4MmY1OTA2MwogU1JDX1VSSVtwa2ctY29uZmlnLTAuMy4zMy5zaGEyNTZz
dW1dID0gIjE5ZjEzMmM4NGVjYTU1MmJmMzRjYWI4ZWM4MWYxYzFkY2MyMjliODExNjM4ZjlkMjgz
ZGNlYWJlNThjNTU2OWUiCiBTUkNfVVJJW3BvcnRhYmxlLWF0b21pYy0xLjE0LjAuc2hhMjU2c3Vt
XSA9ICIzZDIwZDU0OTdlZjg4MDM3YTUyZmY5ODI2N2QwNjZlN2YxMWZjYzVlOTliYmZiZDU4YTQy
MzM2MTkzYWFjZWMzIgogU1JDX1VSSVtwcm9jLW1hY3JvMi0xLjAuMTA3LnNoYTI1NnN1bV0gPSAi
OTg1ZTdlYzliYjc0NWU2Y2U2NTM1YjU0NGQ4NGQ2Y2Q2ZjdhZDhiZDcxMWMzOTg5MzhhZTk4M2I5
MWE3NjZkOSIKLVNSQ19VUklbcHlvMy0wLjI5LjAuc2hhMjU2c3VtXSA9ICJjZDI3NDY1MGIyMWQ0
YmZjMjZhMGE0NzU4Nzk2MmMxZWRiNDI1ZjY5Mjg3MzI0MzU1Y2QwNDBjM2VhNjYwNzFjIgotU1JD
X1VSSVtweW8zLWJ1aWxkLWNvbmZpZy0wLjI5LjAuc2hhMjU2c3VtXSA9ICJjNWUyYTdkMmYwZDAx
MzM0MmYyOTVjMDQ4YWQxOTIzN2FkZDUxNTRhNTViMWM1YTI1NGMwZWM5M2Q0MTA5MDc4IgotU1JD
X1VSSVtweW8zLWZmaS0wLjI5LjAuc2hhMjU2c3VtXSA9ICJjYTg1YzQ2N2RhMWJiYzhkODY2ZWVh
NWRlZmY5Y2YyOWVhNWY3Nzg1MDU0YTE3ZGEzNmU2NWJkYTljMDU4NDViIgotU1JDX1VSSVtweW8z
LW1hY3Jvcy0wLjI5LjAuc2hhMjU2c3VtXSA9ICI5YWM1Mzc2MmZkMDY1ZGFhMzE5NGRkMDkzMzdh
MzhiZDc5M2ExODgxMDBmZDFhOTMwNGM0YWIzMTJkOTAxNzcxIgotU1JDX1VSSVtweW8zLW1hY3Jv
cy1iYWNrZW5kLTAuMjkuMC5zaGEyNTZzdW1dID0gIjRjYTNhMTU1NzM5OTc4MzE3MmRjNWJmMzlj
ZmNhODM1MTU3NzMyNTMyY2JhNTZiNzFkMjI5MjE2MWU1M2IzNjIiCitTUkNfVVJJW3B5bzMtMC4y
OS4yLnNoYTI1NnN1bV0gPSAiNDY4OGRkZWRmNDczZTMyNjYyYjliMDY3NjcwMTI5YThhZmI4YzE4
ZTM1MTQ4MmM3MGQ2MmJhNGE4ODE3MWU4YiIKK1NSQ19VUklbcHlvMy1idWlsZC1jb25maWctMC4y
OS4yLnNoYTI1NnN1bV0gPSAiZjQxMDI3ZTQxYjRiZDAzZjZlNjBmOWY0MTdmZTI0YTYzNDFhNmJi
NzQ0ZWRkNjJiNmY3MDlmMmE1MmVhMzBlOSIKK1NSQ19VUklbcHlvMy1mZmktMC4yOS4yLnNoYTI1
NnN1bV0gPSAiZTU5MWE5NTUyNmZlYWQwNjc0MzJjM2IzYTMzZmM3NDc3MGI4N2IxZTA0ZTczNjcx
MDkwZDljMjA1NWEyYjMyNyIKK1NSQ19VUklbcHlvMy1tYWNyb3MtMC4yOS4yLnNoYTI1NnN1bV0g
PSAiNzMyMjU4NjhmYzFjZDg0ZWVmMmMzYzIzMGRkYjkxMjczYmYxZGU0NmFlYjhhNDI0OGRhNzZk
MzJhMDkyNGExYyIKK1NSQ19VUklbcHlvMy1tYWNyb3MtYmFja2VuZC0wLjI5LjIuc2hhMjU2c3Vt
XSA9ICI1NzE1NzVhYTM3NDlmYTYyMTY3NTdkZDQ3ZDJhM2U3ZWYzNjBmMzI5YTQwZjA2NjZhOWZi
ZDE0ODg5MDI0OTUyIgogU1JDX1VSSVtxdW90ZS0xLjAuNDcuc2hhMjU2c3VtXSA9ICIxZmJmNGRi
MTQyYTQ3M2E4ZDgwYzI2YmJmMTg0NTRlZDQ1OGJmOGQyNmM4MjE5YzMzMWRhZWNmZGJkMDc5MDAx
IgogU1JDX1VSSVtzZWxmX2NlbGwtMS4zLjAuc2hhMjU2c3VtXSA9ICIyYWI0MmNhMDI3NDllMTIw
MDk3ZTMyOGQ5MWQ0MTUzMjViZGY0M2IxYzcyYzRjOGJhZGYzNzM3NWZlNDBhODEzIgogU1JDX1VS
SVtzaGxleC0yLjAuMS5zaGEyNTZzdW1dID0gImY4ZmFkZDU5Yzg1NWVmMjA4MGRlY2RlZjhmZjE2
MWViNjY2MWI4NjkzM2M5ZDgyZTViYTI5ZGM2MDJhNTVhYmEiCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnMuYmIgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnMu
YmIKaW5kZXggMGYyNTE5OWY2OC4uOGU3ZDk3Mjk1OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzLmJiCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9ycy5i
YgpAQCAtOSw3ICs5LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9
OGMzNjE3ZGI0ZmI2ZmFlMDFmMWQyNTNhYjkxNTExZTQgXAogIyBOT1RFOiBNYWtlIHN1cmUgdG8g
a2VlcCB0aGlzIHJlY2lwZSBhdCB0aGUgc2FtZSB2ZXJzaW9uIGFzIHB5dGhvbjMtY3J5cHRvZ3Jh
cGh5CiAjICAgICAgIFVwZ3JhZGUgYm90aCByZWNpcGVzIGF0IHRoZSBzYW1lIHRpbWUKIHJlcXVp
cmUgcHl0aG9uMy1jcnlwdG9ncmFwaHktY29tbW9uLmluYwotU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjkwMDY2ZDBmNzM1MWIxMmViYWMyYjRjZTU5NGNlMGE2ZjA1YzE5YWQzMDY4ZTRkNWNmYzY0ZDlk
MmJlYzhkODAiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDk5MTExZmU1ZGQ1YThkNDA2NTBlMzAw
YWFkMzRiNmU2OTEwY2ExOThjNjc0YjgwMDg0NTBjYTY5ZjhmMDVjNCIKIAogUFlQSV9QQUNLQUdF
ID0gImNyeXB0b2dyYXBoeV92ZWN0b3JzIgogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS5iYgppbmRleCBmMmFjNGUxYjg5Li4wMzg2
ZjVkNWEyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
Y3J5cHRvZ3JhcGh5LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1jcnlwdG9ncmFwaHkuYmIKQEAgLTExLDcgKzExLDcgQEAgTERTSEFSRUQgKz0gIi1wdGhyZWFk
IgogIyBOT1RFOiBNYWtlIHN1cmUgdG8ga2VlcCB0aGlzIHJlY2lwZSBhdCB0aGUgc2FtZSB2ZXJz
aW9uIGFzIHB5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnMKICMgICAgICAgVXBncmFkZSBib3Ro
IHJlY2lwZXMgYXQgdGhlIHNhbWUgdGltZQogcmVxdWlyZSBweXRob24zLWNyeXB0b2dyYXBoeS1j
b21tb24uaW5jCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNWRkOWJkYTFjMTJiNDE2MmY2ZmY1Njhl
ZWI1ZTBmZjk1NmMyOGQxNDQwNmU4NzVjZmU4YTYzYTJkNDE0ZmYyMCIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICI3YjQ2MTY1YmI1NmViNDcwNGUyZWFhZjg2ZjNjOTQwZDE5MTU0NTM1ZDliMGNhN2Q2
ZDU5MGIwNDA2MGUwMGQ1IgogCiBTUkNfVVJJICs9ICJmaWxlOi8vMDAwMS1weXByb2plY3QudG9t
bC1yZW1vdmUtYmVuY2htYXJrLWRpc2FibGUtb3B0aW9uLnBhdGNoIFwKICAgICAgICAgICAgIGZp
bGU6Ly9jaGVjay1tZW1mcmVlLnB5IFwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHkvMDAwMS1weXByb2plY3QudG9tbC1yZW1vdmUt
YmVuY2htYXJrLWRpc2FibGUtb3B0aW9uLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS8wMDAxLXB5cHJvamVjdC50b21sLXJlbW92ZS1iZW5j
aG1hcmstZGlzYWJsZS1vcHRpb24ucGF0Y2gKaW5kZXggNDU0ZTA4NjA1YS4uMDEyZjdlNTc2MSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dy
YXBoeS8wMDAxLXB5cHJvamVjdC50b21sLXJlbW92ZS1iZW5jaG1hcmstZGlzYWJsZS1vcHRpb24u
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dy
YXBoeS8wMDAxLXB5cHJvamVjdC50b21sLXJlbW92ZS1iZW5jaG1hcmstZGlzYWJsZS1vcHRpb24u
cGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDc0NDczZGFhNDZiMzE1ZjNkOThmYmY5YTZhNThm
NTJjOWMyOWEzNjUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDFlODY3MDBlZDQ3ODA3
MTJmOWMyYTc4ZGQxYjk4Y2RlOTJkNjc0ZTIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBNaW5nbGkgWXUgPG1pbmdsaS55dUB3aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCAxNyBNYXkg
MjAyMiAxNzoyMjo0OCArMDgwMAogU3ViamVjdDogW1BBVENIXSBweXByb2plY3QudG9tbDogcmVt
b3ZlIC0tYmVuY2htYXJrLWRpc2FibGUgb3B0aW9uCkBAIC0yNiwxMCArMjYsMTAgQEAgU2lnbmVk
LW9mZi1ieTogVGltIE9ybGluZyA8dGltLm9ybGluZ0Brb25zdWxrby5jb20+CiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9weXBy
b2plY3QudG9tbCBiL3B5cHJvamVjdC50b21sCi1pbmRleCBiNTZjZGE5Li43ODE3NDNiIDEwMDY0
NAoraW5kZXggZDAxODdhOC4uY2JlYzdhMSAxMDA2NDQKIC0tLSBhL3B5cHJvamVjdC50b21sCiAr
KysgYi9weXByb2plY3QudG9tbAotQEAgLTE0MCw3ICsxNDAsNyBAQCBleGNsdWRlID0gWworQEAg
LTE0MSw3ICsxNDEsNyBAQCBleGNsdWRlID0gWwogIF0KICAKICBbdG9vbC5weXRlc3QuaW5pX29w
dGlvbnNdCi0tIAoyLjQ3LjEKCg==

--===============1463433677303811511==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: FILELIST: directory renamed /usr/lib/python3.14/site-packages/cryptography_vectors-50.0.1.dist-info -> /usr/lib/python3.14/site-packages/cryptography_vectors-50.0.2.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.14/site-packages/cryptography_vectors-50.0.1.dist-info moved to /usr/lib/python3.14/site-packages/cryptography_vectors-50.0.2.dist-info
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography: FILELIST: directory renamed /usr/lib/python3.14/site-packages/cryptography-50.0.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/cryptography-50.0.2.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/cryptography-50.0.1.dist-info -> /usr/lib/python3.14/site-packages/cryptography-50.0.2.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-cryptography (sysroot):
  /usr/lib/python3.14/site-packages/cryptography-50.0.1.dist-info moved to /usr/lib/python3.14/site-packages/cryptography-50.0.2.dist-info

--===============1463433677303811511==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-cryptography-changelog.txt"

50.0.2 - 2026-09-30
~~~~~~~~~~~~~~~~~~~

--===============1463433677303811511==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-cryptography-vectors: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-50.0.1.tar.gz" to "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-50.0.2.tar.gz"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors: PKGV changed from 50.0.1 [default] to 50.0.2 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors: PV changed from "50.0.1" to "50.0.2"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PKGV changed from 50.0.1 [default] to 50.0.2 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PV changed from "50.0.1" to "50.0.2"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PKGV changed from 50.0.1 [default] to 50.0.2 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PV changed from "50.0.1" to "50.0.2"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PKGV changed from 50.0.1 [default] to 50.0.2 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PV changed from "50.0.1" to "50.0.2"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PKGV changed from 50.0.1 [default] to 50.0.2 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PV changed from "50.0.1" to "50.0.2"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PKGV changed from 50.0.1 [default] to 50.0.2 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PV changed from "50.0.1" to "50.0.2"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PKGV changed from 50.0.1 [default] to 50.0.2 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PV changed from "50.0.1" to "50.0.2"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: FILELIST: directory renamed /usr/lib/python3.14/site-packages/cryptography_vectors-50.0.1.dist-info -> /usr/lib/python3.14/site-packages/cryptography_vectors-50.0.2.dist-info
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PKGV changed from 50.0.1 [default] to 50.0.2 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PV changed from "50.0.1" to "50.0.2"
Changes to packages/x86-64-v3-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.14/site-packages/cryptography_vectors-50.0.1.dist-info moved to /usr/lib/python3.14/site-packages/cryptography_vectors-50.0.2.dist-info
packages/x86-64-v3-poky-linux/python3-cryptography: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cryptography/cryptography-50.0.1.tar.gz file://0001-pyproject.toml-remove-benchmark-disable-option.patch file://check-memfree.py file://run-ptest crate://crates.io/asn1/0.24.1 crate://crates.io/asn1_derive/0.24.1 crate://crates.io/base64/0.23.0 crate://crates.io/bitflags/2.13.1 crate://crates.io/cc/1.4.0 crate://crates.io/cfg-if/1.0.4 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shared/0.1.1 crate://crates.io/heck/0.5.0 crate://crates.io/itoa/1.0.18 crate://crates.io/libc/0.2.189 crate://crates.io/once_cell/1.21.4 crate://crates.io/openssl/0.10.81 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-sys/0.9.117 crate://crates.io/pem/4.0.0 crate://crates.io/pkg-config/0.3.33 crate://crates.io/portable-atomic/1.14.0 crate://crates.io/proc-macro2/1.0.107 crate://crates.io/pyo3/0.29.0 crate:
 //crates.io/pyo3-build-config/0.29.0 crate://crates.io/pyo3-ffi/0.29.0 crate://crates.io/pyo3-macros/0.29.0 crate://crates.io/pyo3-macros-backend/0.29.0 crate://crates.io/quote/1.0.47 crate://crates.io/self_cell/1.3.0 crate://crates.io/shlex/2.0.1 crate://crates.io/syn/2.0.119 crate://crates.io/target-lexicon/0.13.5 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/vcpkg/0.2.15" to "https://files.pythonhosted.org/packages/source/c/cryptography/cryptography-50.0.2.tar.gz file://0001-pyproject.toml-remove-benchmark-disable-option.patch file://check-memfree.py file://run-ptest crate://crates.io/asn1/0.24.1 crate://crates.io/asn1_derive/0.24.1 crate://crates.io/base64/0.23.0 crate://crates.io/bitflags/2.13.1 crate://crates.io/cc/1.4.0 crate://crates.io/cfg-if/1.0.4 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shared/0.1.1 crate://crates.io/heck/0.5.0 crate://crates.io/itoa/1.0.18 crate://crates.io/libc/0.2.189 crate
 ://crates.io/once_cell/1.21.4 crate://crates.io/openssl/0.10.81 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-sys/0.9.117 crate://crates.io/pem/4.0.0 crate://crates.io/pkg-config/0.3.33 crate://crates.io/portable-atomic/1.14.0 crate://crates.io/proc-macro2/1.0.107 crate://crates.io/pyo3/0.29.2 crate://crates.io/pyo3-build-config/0.29.2 crate://crates.io/pyo3-ffi/0.29.2 crate://crates.io/pyo3-macros/0.29.2 crate://crates.io/pyo3-macros-backend/0.29.2 crate://crates.io/quote/1.0.47 crate://crates.io/self_cell/1.3.0 crate://crates.io/shlex/2.0.1 crate://crates.io/syn/2.0.119 crate://crates.io/target-lexicon/0.13.5 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/vcpkg/0.2.15"
packages/x86-64-v3-poky-linux/python3-cryptography: PKGV changed from 50.0.1 [default] to 50.0.2 [default]
packages/x86-64-v3-poky-linux/python3-cryptography: PV changed from "50.0.1" to "50.0.2"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-dbg: PKGSIZE changed from 1860480 to 1896560 (+2%)
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-dbg: PKGV changed from 50.0.1 [default] to 50.0.2 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-dbg: PV changed from "50.0.1" to "50.0.2"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-dev: PKGV changed from 50.0.1 [default] to 50.0.2 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-dev: PV changed from "50.0.1" to "50.0.2"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-doc: PKGV changed from 50.0.1 [default] to 50.0.2 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-doc: PV changed from "50.0.1" to "50.0.2"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-locale: PKGV changed from 50.0.1 [default] to 50.0.2 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-locale: PV changed from "50.0.1" to "50.0.2"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-ptest: PKGSIZE changed from 2096586 to 2096632 (+0%)
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-ptest: PKGV changed from 50.0.1 [default] to 50.0.2 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-ptest: PV changed from "50.0.1" to "50.0.2"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-src: PKGV changed from 50.0.1 [default] to 50.0.2 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-src: PV changed from "50.0.1" to "50.0.2"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-staticdev: PKGV changed from 50.0.1 [default] to 50.0.2 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-staticdev: PV changed from "50.0.1" to "50.0.2"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography: PKGSIZE changed from 5896693 to 5892648 (-0%)
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography: FILELIST: directory renamed /usr/lib/python3.14/site-packages/cryptography-50.0.1.dist-info -> /usr/lib/python3.14/site-packages/cryptography-50.0.2.dist-info, directory renamed /usr/lib/python3.14/site-packages/cryptography-50.0.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/cryptography-50.0.2.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography: PKGV changed from 50.0.1 [default] to 50.0.2 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography: PV changed from "50.0.1" to "50.0.2"
Changes to packages/x86-64-v3-poky-linux/python3-cryptography (sysroot):
  /usr/lib/python3.14/site-packages/cryptography-50.0.1.dist-info moved to /usr/lib/python3.14/site-packages/cryptography-50.0.2.dist-info

--===============1463433677303811511==--

