Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58EFBC54ECC
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 12:31:49 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.11025.1747312305912840272
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 05:31:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=GtZwTHKY;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=CNYcONBC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010196d3ede437-30c4ae99-0e2b-4086-9301-146582d67f89-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1747312305;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fSXS+ua5pWP3vXR1JxVXciNczS5XTQOvspn5HjMOaKE=;
	b=GtZwTHKYTL/j1OEWyiCgnX+iw/DJqKKp2WPpbJSSOUbh6qdDg3DL6SsmZCsjBrTT
	EmM1TZZ7wqgskP/PY48xjCVd4+XK+VArFRGYRNoNryQDrGBqX20eWTe4WFadGo71hLx
	XIOi2qEcm3VtLNbTgqswuG1iwWO/dyoVKlM4CR1I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1747312305;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fSXS+ua5pWP3vXR1JxVXciNczS5XTQOvspn5HjMOaKE=;
	b=CNYcONBC6SA471edO7sIv3afcYSde6W7sfrOGunFuQRHFDwaW5NVt4yOXYXG4JsU
	np4mH8ansJSP5XSPowQzQ2PsRaTP5STlE4K4kXsajcTjh0AbjSUuaZ69/O+M98S3sKr
	oUvF8x371rC9Wi6vGuEpIc/aJ5mjDmqee5ZIKHV0=
Content-Type: multipart/mixed; boundary="===============3633326853013656981=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>, 
	Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cryptography,python3-cryptography-vectors: upgrading to
 44.0.3,44.0.3 SUCCEEDED
Message-ID: <01010196d3ede437-30c4ae99-0e2b-4086-9301-146582d67f89-000000@us-west-2.amazonses.com>
Date: Thu, 15 May 2025 12:31:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216581

--===============3633326853013656981==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-cryptography,python3-cryptography-vectors* to *44.0.3,44.0.3* has Succeeded.

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
From 654c5ec4b6fe3c6acc18bbc13df83c2532cf5b10 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 May 2025 05:58:21 +0000
Subject: [PATCH] python3-cryptography,python3-cryptography-vectors: upgrade
 44.0.2 -> 44.0.3,44.0.2 -> 44.0.3

---
 meta/recipes-devtools/python/python3-cryptography-common.inc  | 2 +-
 meta/recipes-devtools/python/python3-cryptography-crates.inc  | 4 ++--
 meta/recipes-devtools/python/python3-cryptography-vectors.bb  | 2 +-
 meta/recipes-devtools/python/python3-cryptography.bb          | 2 +-
 .../0001-pyproject.toml-remove-benchmark-disable-option.patch | 4 ++--
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-cryptography-common.inc b/meta/recipes-devtools/python/python3-cryptography-common.inc
index 368a364cf0..24dff7e37d 100644
--- a/meta/recipes-devtools/python/python3-cryptography-common.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-common.inc
@@ -3,4 +3,4 @@
 #
 # Additionally AUH will detect that they share this .inc file and
 # perform a lockstep upgrade for both.
-PV = "44.0.2"
+PV = "44.0.3"
diff --git a/meta/recipes-devtools/python/python3-cryptography-crates.inc b/meta/recipes-devtools/python/python3-cryptography-crates.inc
index b3aa66002e..c65b1841a8 100644
--- a/meta/recipes-devtools/python/python3-cryptography-crates.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-crates.inc
@@ -19,7 +19,7 @@ SRC_URI += " \
     crate://crates.io/once_cell/1.20.2 \
     crate://crates.io/openssl/0.10.68 \
     crate://crates.io/openssl-macros/0.1.1 \
-    crate://crates.io/openssl-sys/0.9.104 \
+    crate://crates.io/openssl-sys/0.9.108 \
     crate://crates.io/pem/3.0.4 \
     crate://crates.io/pkg-config/0.3.31 \
     crate://crates.io/portable-atomic/1.10.0 \
@@ -56,7 +56,7 @@ SRC_URI[memoffset-0.9.1.sha256sum] = "488016bfae457b036d996092f6cb448677611ce444
 SRC_URI[once_cell-1.20.2.sha256sum] = "1261fe7e33c73b354eab43b1273a57c8f967d0391e80353e51f764ac02cf6775"
 SRC_URI[openssl-0.10.68.sha256sum] = "6174bc48f102d208783c2c84bf931bb75927a617866870de8a4ea85597f871f5"
 SRC_URI[openssl-macros-0.1.1.sha256sum] = "a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c"
-SRC_URI[openssl-sys-0.9.104.sha256sum] = "45abf306cbf99debc8195b66b7346498d7b10c210de50418b5ccd7ceba08c741"
+SRC_URI[openssl-sys-0.9.108.sha256sum] = "e145e1651e858e820e4860f7b9c5e169bc1d8ce1c86043be79fa7b7634821847"
 SRC_URI[pem-3.0.4.sha256sum] = "8e459365e590736a54c3fa561947c84837534b8e9af6fc5bf781307e82658fae"
 SRC_URI[pkg-config-0.3.31.sha256sum] = "953ec861398dccce10c670dfeaf3ec4911ca479e9c02154b3a215178c5f566f2"
 SRC_URI[portable-atomic-1.10.0.sha256sum] = "280dc24453071f1b63954171985a0b0d30058d287960968b9b2aca264c8d4ee6"
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors.bb b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
index 075115f3f9..188b35b89f 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "ab32e156b6e7eaf6d8c727a32245967dcce049487301482fca38c0c5fdc84e4b"
+SRC_URI[sha256sum] = "340e790dd7dbe81a0bbec128bfb4ab58e4e10081b05ecb24a8c69380909a3a4b"
 
 PYPI_PACKAGE = "cryptography_vectors"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/recipes-devtools/python/python3-cryptography.bb
index 566e80c4f9..bfd1b179e7 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -11,7 +11,7 @@ LDSHARED += "-pthread"
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography-vectors
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "c63454aa261a0cf0c5b4718349629793e9e634993538db841165b3df74f37ec0"
+SRC_URI[sha256sum] = "fe19d8bc5536a91a24a8133328880a41831b6c5df54599a8417b62fe015d3053"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://check-memfree.py \
diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
index 19ade60c03..a1948a467d 100644
--- a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
@@ -1,4 +1,4 @@
-From 682c99345a7c8cba87e9cea1187aa007eed962fa Mon Sep 17 00:00:00 2001
+From fe576b26dcfe15eeff4bac7ec2d925444d51cf08 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Tue, 17 May 2022 17:22:48 +0800
 Subject: [PATCH] pyproject.toml: remove --benchmark-disable option
@@ -26,7 +26,7 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index 13d8b2c..e93dee9 100644
+index ca3f620..1651697 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
 @@ -118,7 +118,7 @@ exclude = [
-- 
2.47.1


--===============3633326853013656981==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cryptography-python3-cryptography-vectors-up.patch"

RnJvbSA2NTRjNWVjNGI2ZmUzYzZhY2MxOGJiYzEzZGY4M2MyNTMyY2Y1YjEwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgTWF5IDIwMjUgMDU6NTg6MjEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNyeXB0b2dyYXBoeSxweXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzOiB1cGdyYWRl
CiA0NC4wLjIgLT4gNDQuMC4zLDQ0LjAuMiAtPiA0NC4wLjMKCi0tLQogbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS1jb21tb24uaW5jICB8IDIgKy0KIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktY3JhdGVzLmlu
YyAgfCA0ICsrLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9n
cmFwaHktdmVjdG9ycy5iYiAgfCAyICstCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtY3J5cHRvZ3JhcGh5LmJiICAgICAgICAgIHwgMiArLQogLi4uLzAwMDEtcHlwcm9qZWN0
LnRvbWwtcmVtb3ZlLWJlbmNobWFyay1kaXNhYmxlLW9wdGlvbi5wYXRjaCB8IDQgKystLQogNSBm
aWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS1jb21t
b24uaW5jIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBo
eS1jb21tb24uaW5jCmluZGV4IDM2OGEzNjRjZjAuLjI0ZGZmN2UzN2QgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktY29tbW9uLmlu
YworKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5
LWNvbW1vbi5pbmMKQEAgLTMsNCArMyw0IEBACiAjCiAjIEFkZGl0aW9uYWxseSBBVUggd2lsbCBk
ZXRlY3QgdGhhdCB0aGV5IHNoYXJlIHRoaXMgLmluYyBmaWxlIGFuZAogIyBwZXJmb3JtIGEgbG9j
a3N0ZXAgdXBncmFkZSBmb3IgYm90aC4KLVBWID0gIjQ0LjAuMiIKK1BWID0gIjQ0LjAuMyIKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFw
aHktY3JhdGVzLmluYyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlw
dG9ncmFwaHktY3JhdGVzLmluYwppbmRleCBiM2FhNjYwMDJlLi5jNjViMTg0MWE4IDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LWNy
YXRlcy5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0
b2dyYXBoeS1jcmF0ZXMuaW5jCkBAIC0xOSw3ICsxOSw3IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vb25jZV9jZWxsLzEuMjAuMiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vb3BlbnNzbC8wLjEwLjY4IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9vcGVuc3NsLW1hY3Jv
cy8wLjEuMSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vb3BlbnNzbC1zeXMvMC45LjEwNCBcCisg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vb3BlbnNzbC1zeXMvMC45LjEwOCBcCiAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vcGVtLzMuMC40IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9wa2ctY29uZmlnLzAu
My4zMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcG9ydGFibGUtYXRvbWljLzEuMTAuMCBcCkBA
IC01Niw3ICs1Niw3IEBAIFNSQ19VUklbbWVtb2Zmc2V0LTAuOS4xLnNoYTI1NnN1bV0gPSAiNDg4
MDE2YmZhZTQ1N2IwMzZkOTk2MDkyZjZjYjQ0ODY3NzYxMWNlNDQ0CiBTUkNfVVJJW29uY2VfY2Vs
bC0xLjIwLjIuc2hhMjU2c3VtXSA9ICIxMjYxZmU3ZTMzYzczYjM1NGVhYjQzYjEyNzNhNTdjOGY5
NjdkMDM5MWU4MDM1M2U1MWY3NjRhYzAyY2Y2Nzc1IgogU1JDX1VSSVtvcGVuc3NsLTAuMTAuNjgu
c2hhMjU2c3VtXSA9ICI2MTc0YmM0OGYxMDJkMjA4NzgzYzJjODRiZjkzMWJiNzU5MjdhNjE3ODY2
ODcwZGU4YTRlYTg1NTk3Zjg3MWY1IgogU1JDX1VSSVtvcGVuc3NsLW1hY3Jvcy0wLjEuMS5zaGEy
NTZzdW1dID0gImE5NDg2NjZiNjM3YTBmNDY1ZTg1NjRjNzNlODlkNGRkZTAwZDcyZDRkNDczY2M5
NzJmMzkwZmMzZGNlZTdkOWMiCi1TUkNfVVJJW29wZW5zc2wtc3lzLTAuOS4xMDQuc2hhMjU2c3Vt
XSA9ICI0NWFiZjMwNmNiZjk5ZGViYzgxOTViNjZiNzM0NjQ5OGQ3YjEwYzIxMGRlNTA0MThiNWNj
ZDdjZWJhMDhjNzQxIgorU1JDX1VSSVtvcGVuc3NsLXN5cy0wLjkuMTA4LnNoYTI1NnN1bV0gPSAi
ZTE0NWUxNjUxZTg1OGU4MjBlNDg2MGY3YjljNWUxNjliYzFkOGNlMWM4NjA0M2JlNzlmYTdiNzYz
NDgyMTg0NyIKIFNSQ19VUklbcGVtLTMuMC40LnNoYTI1NnN1bV0gPSAiOGU0NTkzNjVlNTkwNzM2
YTU0YzNmYTU2MTk0N2M4NDgzNzUzNGI4ZTlhZjZmYzViZjc4MTMwN2U4MjY1OGZhZSIKIFNSQ19V
UklbcGtnLWNvbmZpZy0wLjMuMzEuc2hhMjU2c3VtXSA9ICI5NTNlYzg2MTM5OGRjY2NlMTBjNjcw
ZGZlYWYzZWM0OTExY2E0NzllOWMwMjE1NGIzYTIxNTE3OGM1ZjU2NmYyIgogU1JDX1VSSVtwb3J0
YWJsZS1hdG9taWMtMS4xMC4wLnNoYTI1NnN1bV0gPSAiMjgwZGMyNDQ1MzA3MWYxYjYzOTU0MTcx
OTg1YTBiMGQzMDA1OGQyODc5NjA5NjhiOWIyYWNhMjY0YzhkNGVlNiIKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9ycy5i
YiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVj
dG9ycy5iYgppbmRleCAwNzUxMTVmM2Y5Li4xODhiMzViODlmIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnMuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS12ZWN0
b3JzLmJiCkBAIC05LDcgKzksNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNF
O21kNT04YzM2MTdkYjRmYjZmYWUwMWYxZDI1M2FiOTE1MTFlNCBcCiAjIE5PVEU6IE1ha2Ugc3Vy
ZSB0byBrZWVwIHRoaXMgcmVjaXBlIGF0IHRoZSBzYW1lIHZlcnNpb24gYXMgcHl0aG9uMy1jcnlw
dG9ncmFwaHkKICMgICAgICAgVXBncmFkZSBib3RoIHJlY2lwZXMgYXQgdGhlIHNhbWUgdGltZQog
cmVxdWlyZSBweXRob24zLWNyeXB0b2dyYXBoeS1jb21tb24uaW5jCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiYWIzMmUxNTZiNmU3ZWFmNmQ4YzcyN2EzMjI0NTk2N2RjY2UwNDk0ODczMDE0ODJmY2Ez
OGMwYzVmZGM4NGU0YiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIzNDBlNzkwZGQ3ZGJlODFhMGJi
ZWMxMjhiZmI0YWI1OGU0ZTEwMDgxYjA1ZWNiMjRhOGM2OTM4MDkwOWEzYTRiIgogCiBQWVBJX1BB
Q0tBR0UgPSAiY3J5cHRvZ3JhcGh5X3ZlY3RvcnMiCiBVUFNUUkVBTV9DSEVDS19QWVBJX1BBQ0tB
R0UgPSAiJHtQWVBJX1BBQ0tBR0V9IgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHkuYmIKaW5kZXggNTY2ZTgwYzRmOS4uYmZkMWIxNzll
NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0
b2dyYXBoeS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5
cHRvZ3JhcGh5LmJiCkBAIC0xMSw3ICsxMSw3IEBAIExEU0hBUkVEICs9ICItcHRocmVhZCIKICMg
Tk9URTogTWFrZSBzdXJlIHRvIGtlZXAgdGhpcyByZWNpcGUgYXQgdGhlIHNhbWUgdmVyc2lvbiBh
cyBweXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzCiAjICAgICAgIFVwZ3JhZGUgYm90aCByZWNp
cGVzIGF0IHRoZSBzYW1lIHRpbWUKIHJlcXVpcmUgcHl0aG9uMy1jcnlwdG9ncmFwaHktY29tbW9u
LmluYwotU1JDX1VSSVtzaGEyNTZzdW1dID0gImM2MzQ1NGFhMjYxYTBjZjBjNWI0NzE4MzQ5NjI5
NzkzZTllNjM0OTkzNTM4ZGI4NDExNjViM2RmNzRmMzdlYzAiCitTUkNfVVJJW3NoYTI1NnN1bV0g
PSAiZmUxOWQ4YmM1NTM2YTkxYTI0YTgxMzMzMjg4ODBhNDE4MzFiNmM1ZGY1NDU5OWE4NDE3YjYy
ZmUwMTVkMzA1MyIKIAogU1JDX1VSSSArPSAiZmlsZTovLzAwMDEtcHlwcm9qZWN0LnRvbWwtcmVt
b3ZlLWJlbmNobWFyay1kaXNhYmxlLW9wdGlvbi5wYXRjaCBcCiAgICAgICAgICAgICBmaWxlOi8v
Y2hlY2stbWVtZnJlZS5weSBcCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LzAwMDEtcHlwcm9qZWN0LnRvbWwtcmVtb3ZlLWJlbmNo
bWFyay1kaXNhYmxlLW9wdGlvbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1jcnlwdG9ncmFwaHkvMDAwMS1weXByb2plY3QudG9tbC1yZW1vdmUtYmVuY2htYXJr
LWRpc2FibGUtb3B0aW9uLnBhdGNoCmluZGV4IDE5YWRlNjBjMDMuLmExOTQ4YTQ2N2QgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHkv
MDAwMS1weXByb2plY3QudG9tbC1yZW1vdmUtYmVuY2htYXJrLWRpc2FibGUtb3B0aW9uLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHkv
MDAwMS1weXByb2plY3QudG9tbC1yZW1vdmUtYmVuY2htYXJrLWRpc2FibGUtb3B0aW9uLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSA2ODJjOTkzNDVhN2M4Y2JhODdlOWNlYTExODdhYTAwN2Vl
ZDk2MmZhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBmZTU3NmIyNmRjZmUxNWVlZmY0
YmFjN2VjMmQ5MjU0NDRkNTFjZjA4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogTWlu
Z2xpIFl1IDxtaW5nbGkueXVAd2luZHJpdmVyLmNvbT4KIERhdGU6IFR1ZSwgMTcgTWF5IDIwMjIg
MTc6MjI6NDggKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gcHlwcm9qZWN0LnRvbWw6IHJlbW92ZSAt
LWJlbmNobWFyay1kaXNhYmxlIG9wdGlvbgpAQCAtMjYsNyArMjYsNyBAQCBTaWduZWQtb2ZmLWJ5
OiBUaW0gT3JsaW5nIDx0aW0ub3JsaW5nQGtvbnN1bGtvLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL3B5cHJvamVjdC50
b21sIGIvcHlwcm9qZWN0LnRvbWwKLWluZGV4IDEzZDhiMmMuLmU5M2RlZTkgMTAwNjQ0CitpbmRl
eCBjYTNmNjIwLi4xNjUxNjk3IDEwMDY0NAogLS0tIGEvcHlwcm9qZWN0LnRvbWwKICsrKyBiL3B5
cHJvamVjdC50b21sCiBAQCAtMTE4LDcgKzExOCw3IEBAIGV4Y2x1ZGUgPSBbCi0tIAoyLjQ3LjEK
Cg==

--===============3633326853013656981==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 937 .bb files complete (0 cached, 937 parsed). 1917 targets, 48 skipped, 0 masked, 0 errors.
Removing 71 recipes from the core2-64 sysroot...done.
Removing 107 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:91436590247466f25eb42d1a4edd5fe59d7249a3"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 658 Local 604 Mirrors 0 Missed 54 Current 277 (91% match, 94% complete)
Removing 11 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 282 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 286 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 290 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.14.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 295 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 297 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 303 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.131.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 307 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 310 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 311 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 312 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 315 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 319 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 322 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 323 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 332 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 333 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_package_write_deb_setscene)
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pytest-subtests-0.14.1-r0: task do_package_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-cffi-1.17.1-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-8.3.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-hypothesis-6.131.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-cffi-1.17.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-pytest-subtests-0.14.1-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 335 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 336 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_package_write_deb_setscene)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-cffi-1.17.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 338 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_package_qa_setscene)
NOTE: recipe python3-iso8601-2.1.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 339 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.5.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-pytz-2025.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-iso8601-2.1.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 340 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-cffi-1.17.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-pytest-8.3.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.131.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 345 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 356 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 358 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.14.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 360 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 362 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.14.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 363 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.14.1.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-pytest-8.3.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 370 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-iso8601-2.1.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-pytest-8.3.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_package_write_deb_setscene: Started
NOTE: Running setscene task 376 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 378 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.131.14.bb:do_package_qa_setscene)
NOTE: Running setscene task 385 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_qa_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 388 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.131.14.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pytest-subtests-0.14.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pytest-subtests-0.14.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pytest-subtests-0.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-cffi-1.17.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-8.3.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-iso8601-2.1.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 390 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.131.14.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 391 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-8.3.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 397 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package_qa_setscene)
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.131.14-r0: task do_package_qa_setscene: Started
NOTE: Running setscene task 400 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_package_write_deb_setscene)
NOTE: recipe python3-hypothesis-6.131.14-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pytest-subtests-0.14.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-pytest-subtests-0.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-cffi-1.17.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 405 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 408 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 410 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_populate_lic_setscene)
NOTE: Running setscene task 413 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_populate_lic_setscene)
NOTE: recipe python3-pytest-subtests-0.14.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 414 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 418 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.5.bb:do_package_qa_setscene)
NOTE: recipe python3-iso8601-2.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-hypothesis-6.131.14-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 419 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_package_qa_setscene)
NOTE: recipe python3-hypothesis-6.131.14-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 424 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_create_spdx_setscene)
NOTE: Running setscene task 425 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 426 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 427 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: recipe python3-hypothesis-6.131.14-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-cffi-1.17.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-cryptography-vectors-44.0.3-r0: task do_populate_lic_setscene: Started
NOTE: Running setscene task 428 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.5.bb:do_create_spdx_setscene)
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pytest-8.3.5-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-hypothesis-6.131.14-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 429 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-cryptography-44.0.3-r0: task do_populate_lic_setscene: Started
NOTE: Running setscene task 431 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 432 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_create_spdx_setscene)
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe procps-4.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-cryptography-vectors-44.0.3-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cffi-1.17.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-pytest-8.3.5-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 434 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-pytest-8.3.5-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 435 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 436 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_25.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 437 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 438 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-cryptography-44.0.3-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 439 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_packagedata_setscene)
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 440 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 442 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytest-8.3.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 443 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_packagedata_setscene)
NOTE: recipe python3-psutil-7.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-attrs-25.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 444 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.131.14.bb:do_create_spdx_setscene)
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-iso8601-2.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 446 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.14.1.bb:do_create_spdx_setscene)
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 452 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pluggy_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe procps-4.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 453 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_15.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 454 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb:do_packagedata_setscene)
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-cffi-1.17.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 456 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: recipe python3-psutil-7.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 459 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata_setscene)
NOTE: recipe python3-hypothesis-6.131.14-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 463 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 464 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_packagedata_setscene)
NOTE: recipe python3-attrs-25.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-subtests-0.14.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 465 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-78.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 468 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cffi-1.17.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 473 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 475 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-hypothesis-6.131.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-8.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-subtests-0.14.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 477 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 479 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 484 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_packagedata_setscene)
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_packagedata_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pluggy-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-packaging-25.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-78.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 496 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 498 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 502 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 506 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.14.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-2.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-8.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 511 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 513 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.131.14.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-iso8601-2.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-psutil-7.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-subtests-0.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-packaging-25.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 519 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.85.1.bb:do_create_spdx_setscene)
NOTE: recipe binutils-2.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 520 of 935 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-maturin_1.8.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 521 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 529 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 531 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 532 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 536 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 545 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-iniconfig-2.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cffi-1.17.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.131.14-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 546 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 547 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe python3-iso8601-2.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-psutil-7.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.85.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytest-subtests-0.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.7.9-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 550 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-cffi-1.17.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.131.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.85.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 553 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libarchive-3.7.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 555 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 559 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 572 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.9.bb:do_populate_sysroot_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 573 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-2.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 574 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 577 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 578 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-2.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.7.9-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 580 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 584 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_package_setscene)
NOTE: recipe python3-maturin-native-1.8.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.192-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-maturin-native-1.8.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe elfutils-0.192-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 600 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 603 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 604 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 610 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 616 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.85.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 618 of 935 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.85.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 621 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 623 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.85.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 625 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 626 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 630 of 935 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-maturin_1.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 631 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 636 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 638 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 639 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.7.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.85.1-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.85.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cargo-native-1.85.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pytest-8.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.7.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 640 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.17.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.85.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 641 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_populate_sysroot_setscene)
NOTE: recipe cargo-native-1.85.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-iso8601-2.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pytest-8.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 643 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.8.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 649 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe elfutils-0.192-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 655 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.14.1.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 656 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycparser_2.22.bb:do_packagedata_setscene)
NOTE: Running setscene task 662 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_packagedata_setscene)
NOTE: Running setscene task 665 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 667 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 673 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-0.192-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 675 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe python3-maturin-native-1.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 678 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 679 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 680 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 683 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-subtests-0.14.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pycparser-2.22-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-psutil-7.0.0-r0: task do_package_setscene: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cffi-1.17.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunwind-1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 686 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pytest-subtests-0.14.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 689 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-cffi-1.17.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 690 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 691 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pycparser-2.22-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 692 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.17.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 697 of 935 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.85.1.bb:do_create_spdx_setscene)
NOTE: recipe libunwind-1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 702 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 703 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.131.14.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.85.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 706 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 707 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-maturin-native-1.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 710 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.131.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 711 of 935 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.11.0.bb:do_populate_sysroot_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 712 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 713 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 714 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 715 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 716 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 717 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe rust-native-1.85.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 720 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-hypothesis-6.131.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 722 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 723 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 724 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunwind-1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rust-native-1.85.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.75-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 729 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 736 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-setuptools-rust-native-1.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 737 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-psutil-7.0.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 741 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.85.1.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.75-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 743 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_recipe_qa_setscene)
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 744 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 745 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 747 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 748 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 749 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunwind-1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 750 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 751 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libstd-rs-1.85.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.75-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-rust-native-1.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 755 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 756 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 757 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 759 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.12.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.85.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-psutil-7.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.75-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 763 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 764 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 765 of 935 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.85.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 767 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.13.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 768 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 771 of 935 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.8.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-psutil-7.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.12.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 773 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 776 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 779 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 780 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 782 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 783 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe cargo-native-1.85.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-native-2.13.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunwind-1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 784 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 785 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 788 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 791 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-psutil-7.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 793 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 795 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_create_spdx_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 797 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 798 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-psutil-7.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 800 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 802 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 803 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_10.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-native-2.13.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 805 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 806 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_setscene)
NOTE: recipe qemu-native-10.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cargo-native-1.85.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 807 of 935 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.85.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 816 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 818 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rust-native-1.85.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe qemu-native-10.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 819 of 935 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.1.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-native-1_2.84.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-native-1_2.84.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 820 of 935 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.8.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 833 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_fetch)
NOTE: Running task 918 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_write_config)
NOTE: recipe libpam-1.7.0-r0: task do_fetch: Started
NOTE: recipe meson-native-1.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 968 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_unpack)
NOTE: recipe rust-native-1.85.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_write_config: Started
NOTE: Running task 1039 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_fetch)
NOTE: Running task 1045 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_fetch)
NOTE: recipe libpam-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_unpack: Started
NOTE: Running task 1073 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_recipe_qa)
NOTE: recipe libcap-2.75-r0: task do_fetch: Started
NOTE: recipe meson-native-1.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_fetch: Started
NOTE: recipe libcap-2.75-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_fetch: Succeeded
NOTE: Running task 1143 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_unpack)
NOTE: Running task 1144 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_unpack)
NOTE: recipe python3-cryptography-44.0.3-r0: task do_recipe_qa: Started
NOTE: Running task 1179 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_fetch)
NOTE: Running task 1183 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_fetch)
NOTE: recipe libcap-2.75-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_unpack: Started
NOTE: Running task 1234 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_fetch)
NOTE: Running task 1237 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_fetch)
NOTE: recipe libpam-1.7.0-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_fetch: Started
NOTE: Running task 1248 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_patch)
NOTE: recipe elfutils-0.192-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1257 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_unpack)
NOTE: recipe elfutils-0.192-r0: task do_fetch: Succeeded
NOTE: Running task 1271 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_unpack)
NOTE: recipe libcap-2.75-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_fetch: Started
NOTE: Running task 1293 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_patch)
NOTE: recipe coreutils-9.6-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.0-r0: task do_patch: Started
NOTE: recipe python3-cryptography-44.0.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_unpack: Started
NOTE: recipe coreutils-9.6-r0: task do_fetch: Succeeded
NOTE: Running task 1307 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_fetch)
NOTE: Running task 1308 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_unpack)
NOTE: Running task 1311 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_unpack)
NOTE: recipe elfutils-0.192-r0: task do_unpack: Started
NOTE: recipe libcap-2.75-r0: task do_patch: Started
NOTE: Running task 1349 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_recipe_qa)
NOTE: recipe libcap-2.75-r0: task do_patch: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_unpack: Started
NOTE: Running task 1369 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_patch)
NOTE: recipe libpam-1.7.0-r0: task do_patch: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-44.0.3-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-44.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 1424 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_unpack)
NOTE: recipe python3-cryptography-vectors-44.0.3-r0: task do_recipe_qa: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_patch: Started
NOTE: Running task 1458 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_fetch)
NOTE: recipe python3-cryptography-44.0.3-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_patch: Succeeded
NOTE: recipe binutils-2.44-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-44.0.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1556 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_fetch)
NOTE: recipe binutils-2.44-r0: task do_fetch: Succeeded
NOTE: Running task 1573 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_unpack)
NOTE: recipe libgcrypt-1.11.0-r0: task do_unpack: Succeeded
NOTE: Running task 1605 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_patch)
NOTE: recipe python3-cryptography-vectors-44.0.3-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-44.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 1606 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_unpack)
NOTE: recipe binutils-2.44-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_patch: Started
NOTE: recipe python3-cryptography-vectors-44.0.3-r0: task do_unpack: Started
NOTE: recipe coreutils-9.6-r0: task do_unpack: Succeeded
NOTE: Running task 1607 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_patch)
NOTE: recipe coreutils-9.6-r0: task do_patch: Started
NOTE: recipe python3-cryptography-44.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 1608 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_patch)
NOTE: recipe libgcrypt-1.11.0-r0: task do_patch: Succeeded
NOTE: recipe python3-cryptography-44.0.3-r0: task do_patch: Started
NOTE: recipe shadow-4.17.3-r0: task do_unpack: Succeeded
NOTE: Running task 1610 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_patch)
NOTE: recipe coreutils-9.6-r0: task do_patch: Succeeded
NOTE: recipe elfutils-0.192-r0: task do_unpack: Succeeded
NOTE: Running task 1612 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_patch)
NOTE: recipe shadow-4.17.3-r0: task do_patch: Started
NOTE: recipe python3-cryptography-44.0.3-r0: task do_patch: Succeeded
NOTE: Running task 1613 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_deploy_source_date_epoch)
NOTE: Running task 1614 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_rust_gen_targets)
NOTE: recipe elfutils-0.192-r0: task do_patch: Started
NOTE: recipe python3-cryptography-vectors-44.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 1616 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_patch)
NOTE: recipe python3-cryptography-44.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-44.0.3-r0: task do_rust_gen_targets: Started
NOTE: recipe shadow-4.17.3-r0: task do_patch: Succeeded
NOTE: recipe python3-cryptography-44.0.3-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-cryptography-vectors-44.0.3-r0: task do_patch: Started
NOTE: recipe python3-cryptography-vectors-44.0.3-r0: task do_patch: Succeeded
NOTE: Running task 1618 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-cryptography-44.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-vectors-44.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-44.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe elfutils-0.192-r0: task do_patch: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 822 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 823 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 824 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 825 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 826 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 827 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 828 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 829 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 830 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 831 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 832 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 833 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: Running setscene task 834 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 835 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 836 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 837 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/util-linux-libuuid/2.40.4/temp/log.do_packagedata_setscene.2504281
NOTE: recipe libffi-3.4.8-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 838 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 839 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.8.bb:do_packagedata_setscene)
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 840 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 841 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 842 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 843 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 844 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 845 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 847 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_package_setscene)
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 849 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 852 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 853 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 858 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 859 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_package_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 862 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 865 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.8.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 868 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 871 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 873 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 874 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 875 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 879 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 880 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 882 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 884 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 885 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_package_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 887 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 890 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 891 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 893 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 895 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 897 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 898 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 900 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 902 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 903 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 905 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 907 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 908 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 909 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.44-r0: task do_unpack: Succeeded
NOTE: Running task 1702 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_patch)
NOTE: recipe libgcc-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-2.44-r0: task do_patch: Started
NOTE: recipe libgcc-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 910 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 911 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 917 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 919 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 920 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 923 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 925 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 927 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-2.44-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 929 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 932 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 934 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1903 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2003 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpam-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2045 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_packagedata)
NOTE: recipe python3-cryptography-44.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_packagedata: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2384 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_collect_spdx_deps)
NOTE: recipe libpam-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2437 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_configure)
NOTE: recipe python3-cryptography-44.0.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libpam-1.7.0-r0: task do_configure: Started
NOTE: recipe python3-cryptography-44.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cryptography-44.0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2438 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_rust_create_wrappers)
NOTE: recipe python3-cryptography-44.0.3-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-cryptography-44.0.3-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 2439 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_configure)
NOTE: recipe python3-cryptography-44.0.3-r0: task do_configure: Started
NOTE: recipe python3-cryptography-44.0.3-r0: task do_configure: Succeeded
NOTE: Running task 2440 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_configure_ptest_base)
NOTE: recipe python3-cryptography-44.0.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-cryptography-44.0.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2441 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_compile)
NOTE: recipe python3-cryptography-44.0.3-r0: task do_compile: Started
NOTE: recipe libpam-1.7.0-r0: task do_configure: Succeeded
NOTE: Running task 2442 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_configure_ptest_base)
NOTE: recipe libpam-1.7.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libpam-1.7.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2443 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_compile)
NOTE: recipe libpam-1.7.0-r0: task do_compile: Started
NOTE: recipe libpam-1.7.0-r0: task do_compile: Succeeded
NOTE: Running task 2444 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_compile_ptest_base)
NOTE: recipe libpam-1.7.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libpam-1.7.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2445 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_install)
NOTE: recipe libpam-1.7.0-r0: task do_install: Started
NOTE: recipe libpam-1.7.0-r0: task do_install: Succeeded
NOTE: Running task 2446 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_install_ptest_base)
NOTE: recipe libpam-1.7.0-r0: task do_install_ptest_base: Started
NOTE: recipe libpam-1.7.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2447 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_populate_sysroot)
NOTE: Running task 2448 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_package)
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe libpam-1.7.0-r0: task do_package: Started
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_populate_sysroot unihash changed to 451eb056cc3721af778fd4eab221e84895314233089e40a47e8e8e9537df224b
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_create_spdx as unihash 71dd502a8cf2b6151f2e027c9417fb25e374e42d5a1901fd5819a7753e763e7c to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '6f62d741fb9eeff9cfe3995ecbc0aaa8ea17f29e86e9f95b1a57bbd513403e6b', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '71dd502a8cf2b6151f2e027c9417fb25e374e42d5a1901fd5819a7753e763e7c'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_create_spdx unihash changed 6f62d741fb9eeff9cfe3995ecbc0aaa8ea17f29e86e9f95b1a57bbd513403e6b -> 71dd502a8cf2b6151f2e027c9417fb25e374e42d5a1901fd5819a7753e763e7c as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_populate_sysroot as unihash 88ab2d726ba6fc25969df7b01dd4b9e455a8a37f7a90cbff2edf38ff58ef1d56 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'ae3acc62149be3923d04010f570897bbafa4c24860908319a72a3b87b70387d2', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'ae3acc62149be3923d04010f570897bbafa4c24860908319a72a3b87b70387d2'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_populate_sysroot unihash ae3acc62149be3923d04010f570897bbafa4c24860908319a72a3b87b70387d2 unchanged by server
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_create_spdx as unihash de0897a06c18d4953d8b7572cefd7834ad590c05b1dc2fceeee12a46e1b6e591 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'f1e3619f7183a826ea5e27e6fdba152d80ad8b0ff29d037883e4821599c3c6be', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'de0897a06c18d4953d8b7572cefd7834ad590c05b1dc2fceeee12a46e1b6e591'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_create_spdx unihash changed f1e3619f7183a826ea5e27e6fdba152d80ad8b0ff29d037883e4821599c3c6be -> de0897a06c18d4953d8b7572cefd7834ad590c05b1dc2fceeee12a46e1b6e591 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_populate_sysroot became valid
NOTE: Running setscene task 923 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_populate_sysroot_setscene)
NOTE: Running task 2449 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.192-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.192-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 933 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2450 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_configure)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 934 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.17.3-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 935 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.75-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.75-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2451 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-2.75-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-2.75-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2452 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_configure)
NOTE: recipe libcap-2.75-r0: task do_configure: Started
NOTE: recipe libcap-2.75-r0: task do_configure: Succeeded
NOTE: Running task 2453 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_compile)
NOTE: recipe libcap-2.75-r0: task do_compile: Started
NOTE: recipe libcap-2.75-r0: task do_compile: Succeeded
NOTE: Running task 2454 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_install)
NOTE: recipe libcap-2.75-r0: task do_install: Started
NOTE: recipe libcap-2.75-r0: task do_install: Succeeded
NOTE: Running task 2456 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2457 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2458 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_configure)
NOTE: recipe coreutils-9.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2459 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_configure)
NOTE: recipe libgcrypt-1.11.0-r0: task do_configure: Started
NOTE: recipe coreutils-9.6-r0: task do_configure: Started
NOTE: recipe libpam-1.7.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_package unihash changed to 66d9ff51e74ef35d53b602a7bffbe4d2ea1e366c7244ba479eb686994aa9b5ec
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_create_spdx as unihash 71dd502a8cf2b6151f2e027c9417fb25e374e42d5a1901fd5819a7753e763e7c to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'c6ce8f41081751ff366d39f5eb41bfbdd2524c8172b7a208cc1faf721801efd6', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '71dd502a8cf2b6151f2e027c9417fb25e374e42d5a1901fd5819a7753e763e7c'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_create_spdx unihash changed c6ce8f41081751ff366d39f5eb41bfbdd2524c8172b7a208cc1faf721801efd6 -> 71dd502a8cf2b6151f2e027c9417fb25e374e42d5a1901fd5819a7753e763e7c as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_create_spdx as unihash de0897a06c18d4953d8b7572cefd7834ad590c05b1dc2fceeee12a46e1b6e591 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '82c670fa0bcdd14ef9d905095062ab3a21f474455db98a7e2dbe34d55e74274b', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'de0897a06c18d4953d8b7572cefd7834ad590c05b1dc2fceeee12a46e1b6e591'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_create_spdx unihash changed 82c670fa0bcdd14ef9d905095062ab3a21f474455db98a7e2dbe34d55e74274b -> de0897a06c18d4953d8b7572cefd7834ad590c05b1dc2fceeee12a46e1b6e591 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata became valid
NOTE: Running setscene task 929 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2461 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_package)
NOTE: recipe libcap-2.75-r0: task do_package: Started
NOTE: recipe libcap-2.75-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_package unihash changed to e8577f5da8008308f776b5a9c8bd037a508f875576d0172e945cfe6727e77302
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_packagedata became valid
NOTE: Running setscene task 919 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.75-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.75-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe shadow-4.17.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2465 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_compile)
NOTE: recipe shadow-4.17.3-r0: task do_compile: Started
NOTE: recipe shadow-4.17.3-r0: task do_compile: Succeeded
NOTE: Running task 2466 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_install)
NOTE: recipe python3-cryptography-44.0.3-r0: task do_compile: Succeeded
NOTE: Running task 2467 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_compile_ptest_base)
NOTE: recipe shadow-4.17.3-r0: task do_install: Started
NOTE: recipe python3-cryptography-44.0.3-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-cryptography-44.0.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2468 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_install)
NOTE: recipe python3-cryptography-44.0.3-r0: task do_install: Started
NOTE: recipe python3-cryptography-44.0.3-r0: task do_install: Succeeded
NOTE: Running task 2469 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_install_ptest_base)
NOTE: recipe python3-cryptography-44.0.3-r0: task do_install_ptest_base: Started
NOTE: recipe python3-cryptography-44.0.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2470 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_package)
NOTE: Running task 2471 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_populate_sysroot)
NOTE: recipe python3-cryptography-44.0.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-cryptography-44.0.3-r0: task do_package: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_configure: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2472 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_configure_ptest_base)
NOTE: Running task 2473 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_package)
NOTE: recipe libgcrypt-1.11.0-r0: task do_configure_ptest_base: Started
NOTE: recipe shadow-4.17.3-r0: task do_package: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2480 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_compile)
NOTE: recipe libgcrypt-1.11.0-r0: task do_compile: Started
NOTE: recipe python3-cryptography-44.0.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2481 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-vectors-44.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-44.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2482 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-44.0.3-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-44.0.3-r0: task do_configure: Succeeded
NOTE: Running task 2483 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-44.0.3-r0: task do_compile: Started
NOTE: recipe python3-cryptography-44.0.3-r0: task do_package: Succeeded
NOTE: Running task 2484 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_packagedata)
NOTE: recipe python3-cryptography-44.0.3-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-44.0.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2485 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_create_spdx)
NOTE: recipe python3-cryptography-44.0.3-r0: task do_create_spdx: Started
NOTE: recipe python3-cryptography-44.0.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 2486 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_collect_spdx_deps)
NOTE: recipe python3-cryptography-vectors-44.0.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-cryptography-vectors-44.0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_package unihash changed to 9467ccbc8c1c47ef248e92aed1a3b10d56815674814ffdb034a6652e329e0d28
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_create_spdx as unihash de0897a06c18d4953d8b7572cefd7834ad590c05b1dc2fceeee12a46e1b6e591 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'db8f439a4cf8480e411b08b8487846680f597c719dba615fcefcebadb4728bca', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'de0897a06c18d4953d8b7572cefd7834ad590c05b1dc2fceeee12a46e1b6e591'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_create_spdx unihash changed db8f439a4cf8480e411b08b8487846680f597c719dba615fcefcebadb4728bca -> de0897a06c18d4953d8b7572cefd7834ad590c05b1dc2fceeee12a46e1b6e591 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_packagedata became valid
NOTE: Running setscene task 935 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.17.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-cryptography-vectors-44.0.3-r0: task do_compile: Succeeded
NOTE: Running task 2513 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_install)
NOTE: recipe python3-cryptography-vectors-44.0.3-r0: task do_install: Started
NOTE: recipe python3-cryptography-vectors-44.0.3-r0: task do_install: Succeeded
NOTE: Running task 2514 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_package)
NOTE: Running task 2515 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_populate_sysroot)
NOTE: recipe python3-cryptography-vectors-44.0.3-r0: task do_package: Started
NOTE: recipe python3-cryptography-vectors-44.0.3-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_compile: Succeeded
NOTE: Running task 2516 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_compile_ptest_base)
NOTE: recipe libgcrypt-1.11.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2517 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_install)
NOTE: recipe libgcrypt-1.11.0-r0: task do_install: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_install: Succeeded
NOTE: Running task 2518 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_install_ptest_base)
NOTE: recipe libgcrypt-1.11.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-cryptography-vectors-44.0.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2520 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2521 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_package)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_package: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2522 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_configure)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_package unihash changed to f175a43cf96804e35bd63c0d04147317719b6289d204e9137975e9b57e839021
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_packagedata became valid
NOTE: Running setscene task 930 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-cryptography-vectors-44.0.3-r0: task do_package: Succeeded
NOTE: Running task 2524 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_packagedata)
NOTE: recipe python3-cryptography-vectors-44.0.3-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-vectors-44.0.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2525 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_create_spdx)
NOTE: Running task 2526 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_package_write_ipk)
NOTE: Running task 2527 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_package_write_deb)
NOTE: Running task 2528 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_package_write_rpm)
NOTE: Running task 2529 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_package_qa)
NOTE: Running task 2530 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_package_write_ipk)
NOTE: recipe python3-cryptography-vectors-44.0.3-r0: task do_create_spdx: Started
NOTE: Running task 2531 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_package_write_deb)
NOTE: recipe python3-cryptography-vectors-44.0.3-r0: task do_package_write_ipk: Started
NOTE: recipe python3-cryptography-vectors-44.0.3-r0: task do_package_write_deb: Started
NOTE: Running task 2532 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_package_write_rpm)
NOTE: recipe python3-cryptography-vectors-44.0.3-r0: task do_package_write_rpm: Started
NOTE: Running task 2533 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_package_qa)
NOTE: recipe python3-cryptography-vectors-44.0.3-r0: task do_package_qa: Started
NOTE: recipe python3-cryptography-44.0.3-r0: task do_package_write_ipk: Started
NOTE: recipe python3-cryptography-44.0.3-r0: task do_package_write_deb: Started
NOTE: recipe python3-cryptography-44.0.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-cryptography-44.0.3-r0: task do_package_qa: Started
NOTE: recipe python3-cryptography-44.0.3-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-cryptography-44.0.3-r0: task do_package_qa: Succeeded
NOTE: recipe python3-cryptography-44.0.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cryptography-vectors-44.0.3-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-cryptography-vectors-44.0.3-r0: task do_package_write_ipk: Succeeded
NOTE: Running task 2534 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_create_package_spdx)
NOTE: Running task 2535 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_create_package_spdx)
NOTE: recipe python3-cryptography-vectors-44.0.3-r0: task do_create_package_spdx: Started
NOTE: recipe python3-cryptography-44.0.3-r0: task do_create_package_spdx: Started
NOTE: recipe python3-cryptography-44.0.3-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-cryptography-vectors-44.0.3-r0: task do_package_qa: Succeeded
NOTE: recipe python3-cryptography-vectors-44.0.3-r0: task do_create_package_spdx: Succeeded
NOTE: recipe python3-cryptography-44.0.3-r0: task do_create_package_spdx: Succeeded
NOTE: recipe python3-cryptography-vectors-44.0.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2536 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_configure_ptest_base)
NOTE: recipe coreutils-9.6-r0: task do_configure_ptest_base: Started
NOTE: recipe coreutils-9.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2537 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_compile)
NOTE: recipe coreutils-9.6-r0: task do_compile: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2538 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_compile)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_compile: Started
NOTE: recipe python3-cryptography-vectors-44.0.3-r0: task do_package_write_deb: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_compile: Succeeded
NOTE: Running task 2539 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_install)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_install: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_install: Succeeded
NOTE: Running task 2541 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2542 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_package)
NOTE: recipe elfutils-0.192-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_package: Started
NOTE: recipe elfutils-0.192-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2543 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_configure)
NOTE: recipe elfutils-0.192-r0: task do_configure: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_package unihash changed to e34f80dd3d3c14872ca7ed2a49cf844c119bc434963cde344866b99e28218ce2
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata became valid
NOTE: Running setscene task 928 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe coreutils-9.6-r0: task do_compile: Succeeded
NOTE: Running task 2545 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_compile_ptest_base)
NOTE: recipe coreutils-9.6-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-9.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2546 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_install)
NOTE: recipe coreutils-9.6-r0: task do_install: Started
NOTE: recipe coreutils-9.6-r0: task do_install: Succeeded
NOTE: Running task 2547 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_install_ptest_base)
NOTE: recipe coreutils-9.6-r0: task do_install_ptest_base: Started
NOTE: recipe elfutils-0.192-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2548 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_configure_ptest_base)
NOTE: recipe coreutils-9.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2549 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_package)
NOTE: recipe elfutils-0.192-r0: task do_configure_ptest_base: Started
NOTE: recipe elfutils-0.192-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2550 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_compile)
NOTE: recipe coreutils-9.6-r0: task do_package: Started
NOTE: recipe elfutils-0.192-r0: task do_compile: Started
NOTE: recipe coreutils-9.6-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_package unihash changed to b71d68a1fbe0a9b3c31c3b7ea785a2a58cfbbd780d909d8b795dcbadfd0d1b23
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_packagedata became valid
NOTE: Running setscene task 935 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.6-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe elfutils-0.192-r0: task do_compile: Succeeded
NOTE: Running task 2552 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_compile_ptest_base)
NOTE: recipe elfutils-0.192-r0: task do_compile_ptest_base: Started
NOTE: recipe elfutils-0.192-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2553 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_install)
NOTE: recipe elfutils-0.192-r0: task do_install: Started
NOTE: recipe elfutils-0.192-r0: task do_install: Succeeded
NOTE: Running task 2554 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_install_ptest_base)
NOTE: recipe elfutils-0.192-r0: task do_install_ptest_base: Started
NOTE: recipe elfutils-0.192-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2556 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2557 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_package)
NOTE: recipe binutils-2.44-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.192-r0: task do_package: Started
NOTE: recipe binutils-2.44-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2558 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_configure)
NOTE: recipe binutils-2.44-r0: task do_configure: Started
NOTE: recipe binutils-2.44-r0: task do_configure: Succeeded
NOTE: Running task 2559 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_compile)
NOTE: recipe binutils-2.44-r0: task do_compile: Started
NOTE: recipe elfutils-0.192-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_package unihash changed to b7e9be5bac2065ec97f942a70ef75ecd43fce8ed0a3ec2f329fc00031169c505
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_packagedata became valid
NOTE: Running setscene task 932 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.192-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe binutils-2.44-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2561 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_install)
NOTE: recipe binutils-2.44-r0: task do_install: Started
NOTE: recipe binutils-2.44-r0: task do_install: Succeeded
NOTE: Running task 2562 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_package)
NOTE: recipe binutils-2.44-r0: task do_package: Started
NOTE: recipe binutils-2.44-r0: task do_package: Succeeded
NOTE: Running task 2563 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_packagedata)
NOTE: recipe binutils-2.44-r0: task do_packagedata: Started
NOTE: recipe binutils-2.44-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_packagedata unihash changed to 485eb4d547a59eb006c5acc695aca1394a6e23c446c9eaeb74e571fa81dc4594
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_package_write_rpm became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_write_rpm became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_qa became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_package_qa became valid
NOTE: Running setscene task 928 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 929 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 930 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 931 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 932 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 933 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 934 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 935 of 935 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_package_qa_setscene)
NOTE: recipe python3-psutil-7.0.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-psutil-7.0.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-psutil-7.0.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-psutil-7.0.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-psutil-7.0.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-psutil-7.0.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-psutil-7.0.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-psutil-7.0.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running noexec task 2572 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_build)
NOTE: Running noexec task 2573 of 2573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_build)
NOTE: Tasks Summary: Attempted 2573 tasks of which 2448 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: util-linux-libuuid-2.40.4-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-src went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.40.4-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-dbg went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.40.4-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-staticdev went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.40.4-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-dev went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.40.4-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-doc went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.40.4-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-locale went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.40.4-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.40.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3633326853013656981==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-cryptography-vectors: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-44.0.2.tar.gz;downloadfilename=cryptography_vectors-44.0.2.tar.gz" to "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-44.0.3.tar.gz;downloadfilename=cryptography_vectors-44.0.3.tar.gz"
packages/core2-64-poky-linux/python3-cryptography-vectors: PV changed from "44.0.2" to "44.0.3"
packages/core2-64-poky-linux/python3-cryptography-vectors: PKGV changed from 44.0.2 [default] to 44.0.3 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PV changed from "44.0.2" to "44.0.3"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PKGV changed from 44.0.2 [default] to 44.0.3 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PV changed from "44.0.2" to "44.0.3"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PKGV changed from 44.0.2 [default] to 44.0.3 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PV changed from "44.0.2" to "44.0.3"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PKGV changed from 44.0.2 [default] to 44.0.3 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PV changed from "44.0.2" to "44.0.3"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PKGV changed from 44.0.2 [default] to 44.0.3 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PV changed from "44.0.2" to "44.0.3"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PKGV changed from 44.0.2 [default] to 44.0.3 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PV changed from "44.0.2" to "44.0.3"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PKGV changed from 44.0.2 [default] to 44.0.3 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PV changed from "44.0.2" to "44.0.3"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PKGV changed from 44.0.2 [default] to 44.0.3 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PKGSIZE changed from 74984052 to 74984048 (-0%)
Changes to packages/core2-64-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.13/site-packages/cryptography_vectors-44.0.2.dist-info moved to /usr/lib/python3.13/site-packages/cryptography_vectors-44.0.3.dist-info
packages/core2-64-poky-linux/python3-cryptography: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cryptography/cryptography-44.0.2.tar.gz;downloadfilename=cryptography-44.0.2.tar.gz file://0001-pyproject.toml-remove-benchmark-disable-option.patch file://check-memfree.py file://run-ptest crate://crates.io/asn1/0.20.0 crate://crates.io/asn1_derive/0.20.0 crate://crates.io/autocfg/1.4.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/2.6.0 crate://crates.io/cc/1.2.1 crate://crates.io/cfg-if/1.0.0 crate://crates.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shared/0.1.1 crate://crates.io/heck/0.5.0 crate://crates.io/indoc/2.0.5 crate://crates.io/itoa/1.0.14 crate://crates.io/libc/0.2.166 crate://crates.io/memoffset/0.9.1 crate://crates.io/once_cell/1.20.2 crate://crates.io/openssl/0.10.68 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-sys/0.9.104 crate://crates.io/pem/3.0.4 crate://crates.io/pkg-config/0.3.31 crate://crates.io
 /portable-atomic/1.10.0 crate://crates.io/proc-macro2/1.0.92 crate://crates.io/pyo3/0.23.5 crate://crates.io/pyo3-build-config/0.23.5 crate://crates.io/pyo3-ffi/0.23.5 crate://crates.io/pyo3-macros/0.23.5 crate://crates.io/pyo3-macros-backend/0.23.5 crate://crates.io/quote/1.0.37 crate://crates.io/self_cell/1.0.4 crate://crates.io/shlex/1.3.0 crate://crates.io/syn/2.0.89 crate://crates.io/target-lexicon/0.12.16 crate://crates.io/unicode-ident/1.0.14 crate://crates.io/unindent/0.2.3 crate://crates.io/vcpkg/0.2.15" to "https://files.pythonhosted.org/packages/source/c/cryptography/cryptography-44.0.3.tar.gz;downloadfilename=cryptography-44.0.3.tar.gz file://0001-pyproject.toml-remove-benchmark-disable-option.patch file://check-memfree.py file://run-ptest crate://crates.io/asn1/0.20.0 crate://crates.io/asn1_derive/0.20.0 crate://crates.io/autocfg/1.4.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/2.6.0 crate://crates.io/cc/1.2.1 crate://crates.io/cfg-if/1.0.0 crate://crate
 s.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shared/0.1.1 crate://crates.io/heck/0.5.0 crate://crates.io/indoc/2.0.5 crate://crates.io/itoa/1.0.14 crate://crates.io/libc/0.2.166 crate://crates.io/memoffset/0.9.1 crate://crates.io/once_cell/1.20.2 crate://crates.io/openssl/0.10.68 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-sys/0.9.108 crate://crates.io/pem/3.0.4 crate://crates.io/pkg-config/0.3.31 crate://crates.io/portable-atomic/1.10.0 crate://crates.io/proc-macro2/1.0.92 crate://crates.io/pyo3/0.23.5 crate://crates.io/pyo3-build-config/0.23.5 crate://crates.io/pyo3-ffi/0.23.5 crate://crates.io/pyo3-macros/0.23.5 crate://crates.io/pyo3-macros-backend/0.23.5 crate://crates.io/quote/1.0.37 crate://crates.io/self_cell/1.0.4 crate://crates.io/shlex/1.3.0 crate://crates.io/syn/2.0.89 crate://crates.io/target-lexicon/0.12.16 crate://crates.io/unicode-ident/1.0.14 crate://crates.io/unindent/0.2.3 crate://crates.io/vcpkg/0.2.15"
packages/core2-64-poky-linux/python3-cryptography: PV changed from "44.0.2" to "44.0.3"
packages/core2-64-poky-linux/python3-cryptography: PKGV changed from 44.0.2 [default] to 44.0.3 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-dbg: PV changed from "44.0.2" to "44.0.3"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-dbg: PKGV changed from 44.0.2 [default] to 44.0.3 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-dbg: PKGSIZE changed from 1122832 to 1124312 (+0%)
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-dev: PV changed from "44.0.2" to "44.0.3"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-dev: PKGV changed from 44.0.2 [default] to 44.0.3 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-doc: PV changed from "44.0.2" to "44.0.3"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-doc: PKGV changed from 44.0.2 [default] to 44.0.3 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-locale: PV changed from "44.0.2" to "44.0.3"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-locale: PKGV changed from 44.0.2 [default] to 44.0.3 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-ptest: PV changed from "44.0.2" to "44.0.3"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-ptest: PKGV changed from 44.0.2 [default] to 44.0.3 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-ptest: PKGSIZE changed from 1742002 to 1743261 (+0%)
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-src: PV changed from "44.0.2" to "44.0.3"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-src: PKGV changed from 44.0.2 [default] to 44.0.3 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-staticdev: PV changed from "44.0.2" to "44.0.3"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-staticdev: PKGV changed from 44.0.2 [default] to 44.0.3 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography: PV changed from "44.0.2" to "44.0.3"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography: PKGV changed from 44.0.2 [default] to 44.0.3 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography: PKGSIZE changed from 4609049 to 4609255 (+0%)
Changes to packages/core2-64-poky-linux/python3-cryptography (sysroot):
  /usr/lib/python3.13/site-packages/cryptography-44.0.2.dist-info moved to /usr/lib/python3.13/site-packages/cryptography-44.0.3.dist-info

--===============3633326853013656981==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.13/site-packages/cryptography_vectors-44.0.2.dist-info moved to /usr/lib/python3.13/site-packages/cryptography_vectors-44.0.3.dist-info
Changes to packages/core2-64-poky-linux/python3-cryptography (sysroot):
  /usr/lib/python3.13/site-packages/cryptography-44.0.2.dist-info moved to /usr/lib/python3.13/site-packages/cryptography-44.0.3.dist-info

--===============3633326853013656981==--

