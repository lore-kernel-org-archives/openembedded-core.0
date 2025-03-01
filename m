Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30A0BC282D2
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 11:25:27 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.7045.1740828318040449150
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 03:25:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=SFbfqCsR;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=2l2Y/rE0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010195517415f4-b3a8eef1-a228-4404-9f87-ffe24f094f6b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1740828317;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AqitmsmGHCjaFT9V3BhFe24gcFXxXx2tyY896DDEInE=;
	b=SFbfqCsRWAdEPvt1vSwXJe5L+P4jBqTsaxCdhfudAuZ4SuFBDoUKQQzFSyq1mmX6
	ApsJ0FizSg8LYPmzp4iWTOBi7n+7uyB7ynvOPUt2QwdIyN83HaafNfXPf4bw0eola/6
	8c/XXHe7udHKga4OSoqwFIkm+Nothw0mq4SSDfUM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1740828317;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AqitmsmGHCjaFT9V3BhFe24gcFXxXx2tyY896DDEInE=;
	b=2l2Y/rE0JwD9SPpZkX+X1f974pgkboEE5aoK4nrFBBHb8VG7C5ydv2ioi5QeSc8e
	U2B0sBnz0EUmd9Jup2TRwlBYTUlSpRbAqwzaQB0ri4fkq0INQQnOZHTjuiLt3bhsEpR
	e+w3mL8SrZ9J0Go51DA9xEroYwLDar0PUVBpYNqo=
Content-Type: multipart/mixed; boundary="===============0707767401260408451=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>, 
	Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cryptography,python3-cryptography-vectors: upgrading to
 44.0.1,44.0.1 SUCCEEDED
Message-ID: <01010195517415f4-b3a8eef1-a228-4404-9f87-ffe24f094f6b-000000@us-west-2.amazonses.com>
Date: Sat, 1 Mar 2025 11:25:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 11:25:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212099

--===============0707767401260408451==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-cryptography,python3-cryptography-vectors* to *44.0.1,44.0.1* has Succeeded.

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
From 96c79e8675de5bd08ab0180ea2f9aa7577e4677a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Mar 2025 05:52:48 +0000
Subject: [PATCH] python3-cryptography,python3-cryptography-vectors: upgrade
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
index b9659eb059..2589f2c22e 100644
--- a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
@@ -1,4 +1,4 @@
-From b8d6e70280367b84af1fc776d35554ffd6996994 Mon Sep 17 00:00:00 2001
+From 2dba7d19a3e13f8afdbc4a4865e95b5e680d7ce2 Mon Sep 17 00:00:00 2001
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


--===============0707767401260408451==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cryptography-python3-cryptography-vectors-up.patch"

RnJvbSA5NmM3OWU4Njc1ZGU1YmQwOGFiMDE4MGVhMmY5YWE3NTc3ZTQ2NzdhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBNYXIgMjAyNSAwNTo1Mjo0OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtY3J5cHRvZ3JhcGh5LHB5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnM6IHVwZ3JhZGUK
IDQ0LjAuMCAtPiA0NC4wLjEsNDQuMC4wIC0+IDQ0LjAuMQoKLS0tCiAuLi4vcHl0aG9uL3B5dGhv
bjMtY3J5cHRvZ3JhcGh5LWNvbW1vbi5pbmMgICAgfCAgMiArLQogLi4uL3B5dGhvbi9weXRob24z
LWNyeXB0b2dyYXBoeS1jcmF0ZXMuaW5jICAgIHwgMjAgKysrKysrKysrLS0tLS0tLS0tLQogLi4u
L3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzLmJiICAgIHwgIDIgKy0KIC4uLi9w
eXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHkuYmIgICAgICAgICAgICB8ICAyICstCiAuLi50b21s
LXJlbW92ZS1iZW5jaG1hcmstZGlzYWJsZS1vcHRpb24ucGF0Y2ggfCAgNCArKy0tCiA1IGZpbGVz
IGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktY29tbW9u
LmluYyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHkt
Y29tbW9uLmluYwppbmRleCA0MjIwYzdkNjJjLi5iODIxZjkxMGU4IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LWNvbW1vbi5pbmMK
KysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS1j
b21tb24uaW5jCkBAIC0zLDQgKzMsNCBAQAogIwogIyBBZGRpdGlvbmFsbHkgQVVIIHdpbGwgZGV0
ZWN0IHRoYXQgdGhleSBzaGFyZSB0aGlzIC5pbmMgZmlsZSBhbmQKICMgcGVyZm9ybSBhIGxvY2tz
dGVwIHVwZ3JhZGUgZm9yIGJvdGguCi1QViA9ICI0NC4wLjAiCitQViA9ICI0NC4wLjEiCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5
LWNyYXRlcy5pbmMgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRv
Z3JhcGh5LWNyYXRlcy5pbmMKaW5kZXggMThmMzQ2YWVkNC4uY2NiNzI5Y2YzYyAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS1jcmF0
ZXMuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9n
cmFwaHktY3JhdGVzLmluYwpAQCAtMjQsMTEgKzI0LDExIEBAIFNSQ19VUkkgKz0gIiBcCiAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vcGtnLWNvbmZpZy8wLjMuMzEgXAogICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3BvcnRhYmxlLWF0b21pYy8xLjEwLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Byb2Mt
bWFjcm8yLzEuMC45MiBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy8wLjIzLjIgXAotICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMtYnVpbGQtY29uZmlnLzAuMjMuMiBcCi0gICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vcHlvMy1mZmkvMC4yMy4yIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8z
LW1hY3Jvcy8wLjIzLjIgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMtbWFjcm9zLWJhY2tl
bmQvMC4yMy4yIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLzAuMjMuNCBcCisgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vcHlvMy1idWlsZC1jb25maWcvMC4yMy40IFwKKyAgICBjcmF0ZTovL2Ny
YXRlcy5pby9weW8zLWZmaS8wLjIzLjQgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMtbWFj
cm9zLzAuMjMuNCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy1tYWNyb3MtYmFja2VuZC8w
LjIzLjQgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3F1b3RlLzEuMC4zNyBcCiAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vc2VsZl9jZWxsLzEuMC40IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9zaGxl
eC8xLjMuMCBcCkBAIC02MSwxMSArNjEsMTEgQEAgU1JDX1VSSVtwZW0tMy4wLjQuc2hhMjU2c3Vt
XSA9ICI4ZTQ1OTM2NWU1OTA3MzZhNTRjM2ZhNTYxOTQ3Yzg0ODM3NTM0YjhlOWFmNmZjNWIKIFNS
Q19VUklbcGtnLWNvbmZpZy0wLjMuMzEuc2hhMjU2c3VtXSA9ICI5NTNlYzg2MTM5OGRjY2NlMTBj
NjcwZGZlYWYzZWM0OTExY2E0NzllOWMwMjE1NGIzYTIxNTE3OGM1ZjU2NmYyIgogU1JDX1VSSVtw
b3J0YWJsZS1hdG9taWMtMS4xMC4wLnNoYTI1NnN1bV0gPSAiMjgwZGMyNDQ1MzA3MWYxYjYzOTU0
MTcxOTg1YTBiMGQzMDA1OGQyODc5NjA5NjhiOWIyYWNhMjY0YzhkNGVlNiIKIFNSQ19VUklbcHJv
Yy1tYWNybzItMS4wLjkyLnNoYTI1NnN1bV0gPSAiMzdkMzU0NGIzZjI3NDhjNTRlMTQ3NjU1ZWRi
NTAyNTc1MmUyMzAzMTQ1YjVhZWZiM2MzZWEyYzc4Yjk3M2JiMCIKLVNSQ19VUklbcHlvMy0wLjIz
LjIuc2hhMjU2c3VtXSA9ICJmNTRiM2QwOWNiZGQxZjhjMjA2NTBiMjhlN2IwOWUzMzg4ODE0ODJm
NGFhOTA4YTVmNjFhMDBjOThmYmEyNjkwIgotU1JDX1VSSVtweW8zLWJ1aWxkLWNvbmZpZy0wLjIz
LjIuc2hhMjU2c3VtXSA9ICIzMDE1Y2Y5ODU4ODhmZTY2Y2ZiNjNjZTBlMzIxYzYwMzcwNmNkNTQx
YjdhZWM3ZGRkMzVjMjgxMzkwYWY0NWQ4IgotU1JDX1VSSVtweW8zLWZmaS0wLjIzLjIuc2hhMjU2
c3VtXSA9ICI2ZmNhN2NkOGZkODA5YjVhYzRlZWZiODljMWY5OGY3YTc2NTFkMzczOWRmYjM0MWNh
Njk4MDA5MGY1NTRjMjcwIgotU1JDX1VSSVtweW8zLW1hY3Jvcy0wLjIzLjIuc2hhMjU2c3VtXSA9
ICIzNGU2NTdmYTUzNzlhNzkxNTFiNmZmNTMyOGQ5MjE2YTg0ZjU1ZGM5M2IxN2IwOGU3YzM2MDlh
OTY5YjczYWEwIgotU1JDX1VSSVtweW8zLW1hY3Jvcy1iYWNrZW5kLTAuMjMuMi5zaGEyNTZzdW1d
ID0gIjI5NTU0OGQ1ZmZkOTVmZDE5ODFkMmQzY2Y0NDU4ODMxYjIxZDYwYWYwNDZiNzI5YjZmZDE0
M2IwYmE3YWVlMmYiCitTUkNfVVJJW3B5bzMtMC4yMy40LnNoYTI1NnN1bV0gPSAiNTdmZTA5MjQ5
MTI4YjMxNzNkMDkyZGU5NTIzZWFhNzUxMzZiZjdiYTg1ZTBkNjllY2EyNDFjNzkzOWM5MzNjYyIK
K1NSQ19VUklbcHlvMy1idWlsZC1jb25maWctMC4yMy40LnNoYTI1NnN1bV0gPSAiMWNkMzkyN2I1
YTc4NzU3YTBkNzFhYTlkZmY2NjlmOTAzYjFlYjY0YjU0MTQyYTliZDlmNzU3ZjhmZGU2NWZkNyIK
K1NSQ19VUklbcHlvMy1mZmktMC4yMy40LnNoYTI1NnN1bV0gPSAiZGFiNmJiMjEwMmJkOGY5OTFl
Nzc0OWYxMzBhNzBkMDVkZDU1NzYxM2UzOWVkMmRlZWVlOGU5Y2EwYzRkNTQ4ZCIKK1NSQ19VUklb
cHlvMy1tYWNyb3MtMC4yMy40LnNoYTI1NnN1bV0gPSAiOTE4NzE4NjRiMzUzZmQ1ZmZjYjNmOTFm
MmY3MDNhMjJhOTc5N2M5MWI5YWI0OTdiMWFjYWM3YjA3YWU1MDljNyIKK1NSQ19VUklbcHlvMy1t
YWNyb3MtYmFja2VuZC0wLjIzLjQuc2hhMjU2c3VtXSA9ICI0M2FiYzNiODBiYzIwZjNmYWNkODZj
ZDNjNjBiZWVkNThjM2UyYWEyNjIxM2YzY2RhMzY4ZGUzOWM2MGEyN2U0IgogU1JDX1VSSVtxdW90
ZS0xLjAuMzcuc2hhMjU2c3VtXSA9ICJiNWI5ZDM0Yjg5OTFkMTlkOTgwODFiNDZlYWNkZDhlYjU4
YzZmMmIyMDExMzlmN2M1ZjY0M2NjMTU1YTYzM2FmIgogU1JDX1VSSVtzZWxmX2NlbGwtMS4wLjQu
c2hhMjU2c3VtXSA9ICJkMzY5YTk2Zjk3ODYyM2ViM2RjMjg4MDdjNDg1MmQ2Y2M2MTdmZWQ1M2Rh
NWQzYzQwMGZlZmYxZWYzNGE3MTRhIgogU1JDX1VSSVtzaGxleC0xLjMuMC5zaGEyNTZzdW1dID0g
IjBmZGEyZmYwZDA4NDAxOWJhNGQ3YzZmMzcxYzk1ZDhmZDc1Y2UzNTI0YzNjYjhmYjY1M2EzMDIz
ZjYzMjNlNjQiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnMuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnMuYmIKaW5kZXggOGVhZTJjM2NiZS4uYmNkZWM0
NmU1MyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNy
eXB0b2dyYXBoeS12ZWN0b3JzLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9ycy5iYgpAQCAtOSw3ICs5LDcgQEAgTElDX0ZJTEVT
X0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9OGMzNjE3ZGI0ZmI2ZmFlMDFmMWQyNTNhYjkx
NTExZTQgXAogIyBOT1RFOiBNYWtlIHN1cmUgdG8ga2VlcCB0aGlzIHJlY2lwZSBhdCB0aGUgc2Ft
ZSB2ZXJzaW9uIGFzIHB5dGhvbjMtY3J5cHRvZ3JhcGh5CiAjICAgICAgIFVwZ3JhZGUgYm90aCBy
ZWNpcGVzIGF0IHRoZSBzYW1lIHRpbWUKIHJlcXVpcmUgcHl0aG9uMy1jcnlwdG9ncmFwaHktY29t
bW9uLmluYwotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjEwNjIyODc2NmM0NWI5YTVmZmQxYThiM2Uy
NTRmMDU2MGM4MjFkYTc5ZDVjZDdmZDExM2ExN2UzNzUzNTgwYWIiCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiNWE5ODY2YjE0NDY1ZGNmYWYxMmJjZGZiYzMzOTI5ODdiYjU1OWYzN2FjOGI4YTRjOWI2
MzU5YmU3YTNkN2VhMCIKIAogUFlQSV9QQUNLQUdFID0gImNyeXB0b2dyYXBoeV92ZWN0b3JzIgog
VVBTVFJFQU1fQ0hFQ0tfUFlQSV9QQUNLQUdFID0gIiR7UFlQSV9QQUNLQUdFfSIKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHkuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LmJiCmlu
ZGV4IDY5MzI5ZWM5NTQuLjBlNmViMTJmM2IgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHkuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS5iYgpAQCAtMTEsNyArMTEsNyBAQCBM
RFNIQVJFRCArPSAiLXB0aHJlYWQiCiAjIE5PVEU6IE1ha2Ugc3VyZSB0byBrZWVwIHRoaXMgcmVj
aXBlIGF0IHRoZSBzYW1lIHZlcnNpb24gYXMgcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9ycwog
IyAgICAgICBVcGdyYWRlIGJvdGggcmVjaXBlcyBhdCB0aGUgc2FtZSB0aW1lCiByZXF1aXJlIHB5
dGhvbjMtY3J5cHRvZ3JhcGh5LWNvbW1vbi5pbmMKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJjZDRl
ODM0ZjM0MGI0MjkzNDMwNzAxZTc3MmVjNTQzYjBmYmU2YzJkZWE1MTBhNTI4NmZlMGFjYWJlMTUz
YTAyIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImY1MWY1NzA1YWIyNzg5OGFmZGExYWFhNDMwZjM0
YWQ5MGRjMTE3NDIxMDU3NzgyMDIyZWRmMDYwMGJlYzVmMTQiCiAKIFNSQ19VUkkgKz0gImZpbGU6
Ly8wMDAxLXB5cHJvamVjdC50b21sLXJlbW92ZS1iZW5jaG1hcmstZGlzYWJsZS1vcHRpb24ucGF0
Y2ggXAogICAgICAgICAgICAgZmlsZTovL2NoZWNrLW1lbWZyZWUucHkgXApkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS8wMDAxLXB5
cHJvamVjdC50b21sLXJlbW92ZS1iZW5jaG1hcmstZGlzYWJsZS1vcHRpb24ucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LzAwMDEtcHlwcm9q
ZWN0LnRvbWwtcmVtb3ZlLWJlbmNobWFyay1kaXNhYmxlLW9wdGlvbi5wYXRjaAppbmRleCBiOTY1
OWViMDU5Li4yNTg5ZjJjMjJlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LzAwMDEtcHlwcm9qZWN0LnRvbWwtcmVtb3ZlLWJlbmNo
bWFyay1kaXNhYmxlLW9wdGlvbi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LzAwMDEtcHlwcm9qZWN0LnRvbWwtcmVtb3ZlLWJlbmNo
bWFyay1kaXNhYmxlLW9wdGlvbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYjhkNmU3MDI4
MDM2N2I4NGFmMWZjNzc2ZDM1NTU0ZmZkNjk5Njk5NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gMmRiYTdkMTlhM2UxM2Y4YWZkYmM0YTQ4NjVlOTViNWU2ODBkN2NlMiBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IE1pbmdsaSBZdSA8bWluZ2xpLnl1QHdpbmRyaXZlci5jb20+
CiBEYXRlOiBUdWUsIDE3IE1heSAyMDIyIDE3OjIyOjQ4ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hd
IHB5cHJvamVjdC50b21sOiByZW1vdmUgLS1iZW5jaG1hcmstZGlzYWJsZSBvcHRpb24KQEAgLTI2
LDcgKzI2LDcgQEAgU2lnbmVkLW9mZi1ieTogVGltIE9ybGluZyA8dGltLm9ybGluZ0Brb25zdWxr
by5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAK
IGRpZmYgLS1naXQgYS9weXByb2plY3QudG9tbCBiL3B5cHJvamVjdC50b21sCi1pbmRleCA5NDlk
Njg0Li44YzYyNDMyIDEwMDY0NAoraW5kZXggNzU5Y2ViYS4uNjhiZWE5OSAxMDA2NDQKIC0tLSBh
L3B5cHJvamVjdC50b21sCiArKysgYi9weXByb2plY3QudG9tbAogQEAgLTExOCw3ICsxMTgsNyBA
QCBleGNsdWRlID0gWwotLSAKMi40NC4xCgo=

--===============0707767401260408451==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-cryptography-vectors: PV changed from "44.0.0" to "44.0.1"
packages/core2-64-poky-linux/python3-cryptography-vectors: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-44.0.0.tar.gz;downloadfilename=cryptography_vectors-44.0.0.tar.gz" to "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-44.0.1.tar.gz;downloadfilename=cryptography_vectors-44.0.1.tar.gz"
packages/core2-64-poky-linux/python3-cryptography-vectors: PKGV changed from 44.0.0 [default] to 44.0.1 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PV changed from "44.0.0" to "44.0.1"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PKGV changed from 44.0.0 [default] to 44.0.1 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PV changed from "44.0.0" to "44.0.1"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PKGV changed from 44.0.0 [default] to 44.0.1 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PV changed from "44.0.0" to "44.0.1"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PKGV changed from 44.0.0 [default] to 44.0.1 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PV changed from "44.0.0" to "44.0.1"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PKGV changed from 44.0.0 [default] to 44.0.1 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PV changed from "44.0.0" to "44.0.1"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PKGV changed from 44.0.0 [default] to 44.0.1 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PV changed from "44.0.0" to "44.0.1"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PKGV changed from 44.0.0 [default] to 44.0.1 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PV changed from "44.0.0" to "44.0.1"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PKGV changed from 44.0.0 [default] to 44.0.1 [default]
Changes to packages/core2-64-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.13/site-packages/cryptography_vectors-44.0.0.dist-info moved to /usr/lib/python3.13/site-packages/cryptography_vectors-44.0.1.dist-info
packages/core2-64-poky-linux/python3-cryptography: PV changed from "44.0.0" to "44.0.1"
packages/core2-64-poky-linux/python3-cryptography: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cryptography/cryptography-44.0.0.tar.gz;downloadfilename=cryptography-44.0.0.tar.gz file://0001-pyproject.toml-remove-benchmark-disable-option.patch file://check-memfree.py file://run-ptest crate://crates.io/asn1/0.20.0 crate://crates.io/asn1_derive/0.20.0 crate://crates.io/autocfg/1.4.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/2.6.0 crate://crates.io/cc/1.2.1 crate://crates.io/cfg-if/1.0.0 crate://crates.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shared/0.1.1 crate://crates.io/heck/0.5.0 crate://crates.io/indoc/2.0.5 crate://crates.io/itoa/1.0.14 crate://crates.io/libc/0.2.166 crate://crates.io/memoffset/0.9.1 crate://crates.io/once_cell/1.20.2 crate://crates.io/openssl/0.10.68 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-sys/0.9.104 crate://crates.io/pem/3.0.4 crate://crates.io/pkg-config/0.3.31 crate://crates.io
 /portable-atomic/1.10.0 crate://crates.io/proc-macro2/1.0.92 crate://crates.io/pyo3/0.23.2 crate://crates.io/pyo3-build-config/0.23.2 crate://crates.io/pyo3-ffi/0.23.2 crate://crates.io/pyo3-macros/0.23.2 crate://crates.io/pyo3-macros-backend/0.23.2 crate://crates.io/quote/1.0.37 crate://crates.io/self_cell/1.0.4 crate://crates.io/shlex/1.3.0 crate://crates.io/syn/2.0.89 crate://crates.io/target-lexicon/0.12.16 crate://crates.io/unicode-ident/1.0.14 crate://crates.io/unindent/0.2.3 crate://crates.io/vcpkg/0.2.15" to "https://files.pythonhosted.org/packages/source/c/cryptography/cryptography-44.0.1.tar.gz;downloadfilename=cryptography-44.0.1.tar.gz file://0001-pyproject.toml-remove-benchmark-disable-option.patch file://check-memfree.py file://run-ptest crate://crates.io/asn1/0.20.0 crate://crates.io/asn1_derive/0.20.0 crate://crates.io/autocfg/1.4.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/2.6.0 crate://crates.io/cc/1.2.1 crate://crates.io/cfg-if/1.0.0 crate://crate
 s.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shared/0.1.1 crate://crates.io/heck/0.5.0 crate://crates.io/indoc/2.0.5 crate://crates.io/itoa/1.0.14 crate://crates.io/libc/0.2.166 crate://crates.io/memoffset/0.9.1 crate://crates.io/once_cell/1.20.2 crate://crates.io/openssl/0.10.68 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-sys/0.9.104 crate://crates.io/pem/3.0.4 crate://crates.io/pkg-config/0.3.31 crate://crates.io/portable-atomic/1.10.0 crate://crates.io/proc-macro2/1.0.92 crate://crates.io/pyo3/0.23.4 crate://crates.io/pyo3-build-config/0.23.4 crate://crates.io/pyo3-ffi/0.23.4 crate://crates.io/pyo3-macros/0.23.4 crate://crates.io/pyo3-macros-backend/0.23.4 crate://crates.io/quote/1.0.37 crate://crates.io/self_cell/1.0.4 crate://crates.io/shlex/1.3.0 crate://crates.io/syn/2.0.89 crate://crates.io/target-lexicon/0.12.16 crate://crates.io/unicode-ident/1.0.14 crate://crates.io/unindent/0.2.3 crate://crates.io/vcpkg/0.2.15"
packages/core2-64-poky-linux/python3-cryptography: PKGV changed from 44.0.0 [default] to 44.0.1 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-dbg: PV changed from "44.0.0" to "44.0.1"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-dbg: PKGSIZE changed from 1102544 to 1105384 (+0%)
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-dbg: PKGV changed from 44.0.0 [default] to 44.0.1 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-dev: PV changed from "44.0.0" to "44.0.1"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-dev: PKGV changed from 44.0.0 [default] to 44.0.1 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-doc: PV changed from "44.0.0" to "44.0.1"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-doc: PKGV changed from 44.0.0 [default] to 44.0.1 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-locale: PV changed from "44.0.0" to "44.0.1"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-locale: PKGV changed from 44.0.0 [default] to 44.0.1 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-ptest: PV changed from "44.0.0" to "44.0.1"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-ptest: PKGV changed from 44.0.0 [default] to 44.0.1 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-src: PV changed from "44.0.0" to "44.0.1"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-src: PKGV changed from 44.0.0 [default] to 44.0.1 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-staticdev: PV changed from "44.0.0" to "44.0.1"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-staticdev: PKGV changed from 44.0.0 [default] to 44.0.1 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography: PV changed from "44.0.0" to "44.0.1"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography: PKGV changed from 44.0.0 [default] to 44.0.1 [default]
Changes to packages/core2-64-poky-linux/python3-cryptography (sysroot):
  /usr/lib/python3.13/site-packages/cryptography-44.0.0.dist-info moved to /usr/lib/python3.13/site-packages/cryptography-44.0.1.dist-info

--===============0707767401260408451==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.13/site-packages/cryptography_vectors-44.0.0.dist-info moved to /usr/lib/python3.13/site-packages/cryptography_vectors-44.0.1.dist-info
Changes to packages/core2-64-poky-linux/python3-cryptography (sysroot):
  /usr/lib/python3.13/site-packages/cryptography-44.0.0.dist-info moved to /usr/lib/python3.13/site-packages/cryptography-44.0.1.dist-info

--===============0707767401260408451==--

