Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FE33C71157
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 13:14:41 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.8886.1749993279766792752
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 06:14:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=pr6aOTih;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=oaifw3Ox;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019773ba4e2e-f081769a-e265-4cc9-8071-abc37441b437-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1749993279;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OF1jw2GZ11jwPp8AvZSvTs18gDOPm4xgCJ5xZQf706k=;
	b=pr6aOTih8cZmBL84z1u+yButJQ7oJSK0eioxA4HtX0pPCJMd3hReff+1bkpVNbfD
	4S/ntIAB0fNbl9GkxmqPLpm2NFTor6jx6DQKnM++YXMuOuSf94IUmtIeRud5A7BCpsC
	skyCA4pBFweWcwfeD7OyyLrwOVfxIEgqGHWpQcNs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1749993279;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OF1jw2GZ11jwPp8AvZSvTs18gDOPm4xgCJ5xZQf706k=;
	b=oaifw3Ox4DpAQs+1RarVyfMqMqhmBnLHv/Zo1tLE7ILuGsSpD7i1xdKQP23gx/Vf
	HRI9TXfAAR5+84K3Q/QR51++sLMigDI+RWpoxF1xYMWXwqQLPdcl2DeUAK3oK68d7lW
	xjzPFAV4u7H6TKfa597ugwXkqiawdRZOaDHCO/1U=
Content-Type: multipart/mixed; boundary="===============0692959730541872503=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>, 
	Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cryptography-vectors,python3-cryptography: upgrading to
 45.0.4,45.0.4 SUCCEEDED
Message-ID: <0101019773ba4e2e-f081769a-e265-4cc9-8071-abc37441b437-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jun 2025 13:14:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 13:14:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218655

--===============0692959730541872503==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-cryptography-vectors,python3-cryptography* to *45.0.4,45.0.4* has Succeeded.

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
From c2ad2175614ff70e9e8ca9389772f57ae809e971 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Jun 2025 05:47:54 +0000
Subject: [PATCH] python3-cryptography-vectors,python3-cryptography: upgrade
 45.0.3 -> 45.0.4,45.0.3 -> 45.0.4

---
 meta/recipes-devtools/python/python3-cryptography-common.inc  | 2 +-
 meta/recipes-devtools/python/python3-cryptography-vectors.bb  | 2 +-
 meta/recipes-devtools/python/python3-cryptography.bb          | 2 +-
 .../0001-pyproject.toml-remove-benchmark-disable-option.patch | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-cryptography-common.inc b/meta/recipes-devtools/python/python3-cryptography-common.inc
index 3018d967b2..5ce2485ed5 100644
--- a/meta/recipes-devtools/python/python3-cryptography-common.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-common.inc
@@ -3,4 +3,4 @@
 #
 # Additionally AUH will detect that they share this .inc file and
 # perform a lockstep upgrade for both.
-PV = "45.0.3"
+PV = "45.0.4"
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors.bb b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
index 46597134b6..a8f8d0cd17 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "b65cebdc334c6b9db8c79081a08253fddf262d009d2c914398edd24a4321db21"
+SRC_URI[sha256sum] = "fbb0408df8ff2d2b3dbd2928bc5b7feebfdd36fb092fa8790d5778a9b9a1f9ef"
 
 PYPI_PACKAGE = "cryptography_vectors"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/recipes-devtools/python/python3-cryptography.bb
index e40e62f626..f41e13f4a1 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -11,7 +11,7 @@ LDSHARED += "-pthread"
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography-vectors
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "ec21313dd335c51d7877baf2972569f40a4291b76a0ce51391523ae358d05899"
+SRC_URI[sha256sum] = "7405ade85c83c37682c8fe65554759800a4a8c54b2d96e0f8ad114d31b808d57"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://check-memfree.py \
diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
index 42876e3489..e238717208 100644
--- a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
@@ -1,4 +1,4 @@
-From 7da554d52bfed4370766d5afd94bc7865791231d Mon Sep 17 00:00:00 2001
+From baa3c56b87ceaea331811a0a4642991cbb12e6ea Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Tue, 17 May 2022 17:22:48 +0800
 Subject: [PATCH] pyproject.toml: remove --benchmark-disable option
@@ -26,7 +26,7 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index d94a1f5..c0f87a7 100644
+index d9ef704..878b720 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
 @@ -129,7 +129,7 @@ exclude = [
-- 
2.47.1


--===============0692959730541872503==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cryptography-vectors-python3-cryptography-up.patch"

RnJvbSBjMmFkMjE3NTYxNGZmNzBlOWU4Y2E5Mzg5NzcyZjU3YWU4MDllOTcxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSnVuIDIwMjUgMDU6NDc6NTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzLHB5dGhvbjMtY3J5cHRvZ3JhcGh5OiB1cGdyYWRl
CiA0NS4wLjMgLT4gNDUuMC40LDQ1LjAuMyAtPiA0NS4wLjQKCi0tLQogbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS1jb21tb24uaW5jICB8IDIgKy0KIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9ycy5i
YiAgfCAyICstCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3Jh
cGh5LmJiICAgICAgICAgIHwgMiArLQogLi4uLzAwMDEtcHlwcm9qZWN0LnRvbWwtcmVtb3ZlLWJl
bmNobWFyay1kaXNhYmxlLW9wdGlvbi5wYXRjaCB8IDQgKystLQogNCBmaWxlcyBjaGFuZ2VkLCA1
IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS1jb21tb24uaW5jIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS1jb21tb24uaW5jCmlu
ZGV4IDMwMThkOTY3YjIuLjVjZTI0ODVlZDUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktY29tbW9uLmluYworKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LWNvbW1vbi5pbmMKQEAg
LTMsNCArMyw0IEBACiAjCiAjIEFkZGl0aW9uYWxseSBBVUggd2lsbCBkZXRlY3QgdGhhdCB0aGV5
IHNoYXJlIHRoaXMgLmluYyBmaWxlIGFuZAogIyBwZXJmb3JtIGEgbG9ja3N0ZXAgdXBncmFkZSBm
b3IgYm90aC4KLVBWID0gIjQ1LjAuMyIKK1BWID0gIjQ1LjAuNCIKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9ycy5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9y
cy5iYgppbmRleCA0NjU5NzEzNGI2Li5hOGY4ZDBjZDE3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnMuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3Jz
LmJiCkBAIC05LDcgKzksNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21k
NT04YzM2MTdkYjRmYjZmYWUwMWYxZDI1M2FiOTE1MTFlNCBcCiAjIE5PVEU6IE1ha2Ugc3VyZSB0
byBrZWVwIHRoaXMgcmVjaXBlIGF0IHRoZSBzYW1lIHZlcnNpb24gYXMgcHl0aG9uMy1jcnlwdG9n
cmFwaHkKICMgICAgICAgVXBncmFkZSBib3RoIHJlY2lwZXMgYXQgdGhlIHNhbWUgdGltZQogcmVx
dWlyZSBweXRob24zLWNyeXB0b2dyYXBoeS1jb21tb24uaW5jCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiYjY1Y2ViZGMzMzRjNmI5ZGI4Yzc5MDgxYTA4MjUzZmRkZjI2MmQwMDlkMmM5MTQzOThlZGQy
NGE0MzIxZGIyMSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJmYmIwNDA4ZGY4ZmYyZDJiM2RiZDI5
MjhiYzViN2ZlZWJmZGQzNmZiMDkyZmE4NzkwZDU3NzhhOWI5YTFmOWVmIgogCiBQWVBJX1BBQ0tB
R0UgPSAiY3J5cHRvZ3JhcGh5X3ZlY3RvcnMiCiBVUFNUUkVBTV9DSEVDS19QWVBJX1BBQ0tBR0Ug
PSAiJHtQWVBJX1BBQ0tBR0V9IgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1jcnlwdG9ncmFwaHkuYmIKaW5kZXggZTQwZTYyZjYyNi4uZjQxZTEzZjRhMSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dy
YXBoeS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRv
Z3JhcGh5LmJiCkBAIC0xMSw3ICsxMSw3IEBAIExEU0hBUkVEICs9ICItcHRocmVhZCIKICMgTk9U
RTogTWFrZSBzdXJlIHRvIGtlZXAgdGhpcyByZWNpcGUgYXQgdGhlIHNhbWUgdmVyc2lvbiBhcyBw
eXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzCiAjICAgICAgIFVwZ3JhZGUgYm90aCByZWNpcGVz
IGF0IHRoZSBzYW1lIHRpbWUKIHJlcXVpcmUgcHl0aG9uMy1jcnlwdG9ncmFwaHktY29tbW9uLmlu
YwotU1JDX1VSSVtzaGEyNTZzdW1dID0gImVjMjEzMTNkZDMzNWM1MWQ3ODc3YmFmMjk3MjU2OWY0
MGE0MjkxYjc2YTBjZTUxMzkxNTIzYWUzNThkMDU4OTkiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAi
NzQwNWFkZTg1YzgzYzM3NjgyYzhmZTY1NTU0NzU5ODAwYTRhOGM1NGIyZDk2ZTBmOGFkMTE0ZDMx
YjgwOGQ1NyIKIAogU1JDX1VSSSArPSAiZmlsZTovLzAwMDEtcHlwcm9qZWN0LnRvbWwtcmVtb3Zl
LWJlbmNobWFyay1kaXNhYmxlLW9wdGlvbi5wYXRjaCBcCiAgICAgICAgICAgICBmaWxlOi8vY2hl
Y2stbWVtZnJlZS5weSBcCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtY3J5cHRvZ3JhcGh5LzAwMDEtcHlwcm9qZWN0LnRvbWwtcmVtb3ZlLWJlbmNobWFy
ay1kaXNhYmxlLW9wdGlvbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1jcnlwdG9ncmFwaHkvMDAwMS1weXByb2plY3QudG9tbC1yZW1vdmUtYmVuY2htYXJrLWRp
c2FibGUtb3B0aW9uLnBhdGNoCmluZGV4IDQyODc2ZTM0ODkuLmUyMzg3MTcyMDggMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHkvMDAw
MS1weXByb2plY3QudG9tbC1yZW1vdmUtYmVuY2htYXJrLWRpc2FibGUtb3B0aW9uLnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHkvMDAw
MS1weXByb2plY3QudG9tbC1yZW1vdmUtYmVuY2htYXJrLWRpc2FibGUtb3B0aW9uLnBhdGNoCkBA
IC0xLDQgKzEsNCBAQAotRnJvbSA3ZGE1NTRkNTJiZmVkNDM3MDc2NmQ1YWZkOTRiYzc4NjU3OTEy
MzFkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiYWEzYzU2Yjg3Y2VhZWEzMzE4MTFh
MGE0NjQyOTkxY2JiMTJlNmVhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogTWluZ2xp
IFl1IDxtaW5nbGkueXVAd2luZHJpdmVyLmNvbT4KIERhdGU6IFR1ZSwgMTcgTWF5IDIwMjIgMTc6
MjI6NDggKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gcHlwcm9qZWN0LnRvbWw6IHJlbW92ZSAtLWJl
bmNobWFyay1kaXNhYmxlIG9wdGlvbgpAQCAtMjYsNyArMjYsNyBAQCBTaWduZWQtb2ZmLWJ5OiBU
aW0gT3JsaW5nIDx0aW0ub3JsaW5nQGtvbnN1bGtvLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL3B5cHJvamVjdC50b21s
IGIvcHlwcm9qZWN0LnRvbWwKLWluZGV4IGQ5NGExZjUuLmMwZjg3YTcgMTAwNjQ0CitpbmRleCBk
OWVmNzA0Li44NzhiNzIwIDEwMDY0NAogLS0tIGEvcHlwcm9qZWN0LnRvbWwKICsrKyBiL3B5cHJv
amVjdC50b21sCiBAQCAtMTI5LDcgKzEyOSw3IEBAIGV4Y2x1ZGUgPSBbCi0tIAoyLjQ3LjEKCg==

--===============0692959730541872503==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-cryptography-vectors: PV changed from "45.0.3" to "45.0.4"
packages/core2-64-poky-linux/python3-cryptography-vectors: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-45.0.3.tar.gz;downloadfilename=cryptography_vectors-45.0.3.tar.gz" to "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-45.0.4.tar.gz;downloadfilename=cryptography_vectors-45.0.4.tar.gz"
packages/core2-64-poky-linux/python3-cryptography-vectors: PKGV changed from 45.0.3 [default] to 45.0.4 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PV changed from "45.0.3" to "45.0.4"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PKGV changed from 45.0.3 [default] to 45.0.4 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PV changed from "45.0.3" to "45.0.4"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PKGV changed from 45.0.3 [default] to 45.0.4 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PV changed from "45.0.3" to "45.0.4"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PKGV changed from 45.0.3 [default] to 45.0.4 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PV changed from "45.0.3" to "45.0.4"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PKGV changed from 45.0.3 [default] to 45.0.4 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PV changed from "45.0.3" to "45.0.4"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PKGV changed from 45.0.3 [default] to 45.0.4 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PV changed from "45.0.3" to "45.0.4"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PKGV changed from 45.0.3 [default] to 45.0.4 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: FILELIST: directory renamed /usr/lib/python3.13/site-packages/cryptography_vectors-45.0.3.dist-info -> /usr/lib/python3.13/site-packages/cryptography_vectors-45.0.4.dist-info, directory renamed /usr/lib/python3.13/site-packages/cryptography_vectors-45.0.3.dist-info/licenses -> /usr/lib/python3.13/site-packages/cryptography_vectors-45.0.4.dist-info/licenses, added "/usr/lib/python3.13/site-packages/cryptography_vectors/asymmetric/PKCS8/enc-ec-sha1-128-rc4.pem"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PV changed from "45.0.3" to "45.0.4"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PKGV changed from 45.0.3 [default] to 45.0.4 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PKGSIZE changed from 75038392 to 75038702 (+0%)
Changes to packages/core2-64-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.13/site-packages/cryptography_vectors-45.0.3.dist-info moved to /usr/lib/python3.13/site-packages/cryptography_vectors-45.0.4.dist-info
  /usr/lib/python3.13/site-packages/cryptography_vectors/asymmetric/PKCS8/enc-ec-sha1-128-rc4.pem was added
packages/core2-64-poky-linux/python3-cryptography: PV changed from "45.0.3" to "45.0.4"
packages/core2-64-poky-linux/python3-cryptography: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cryptography/cryptography-45.0.3.tar.gz;downloadfilename=cryptography-45.0.3.tar.gz file://0001-pyproject.toml-remove-benchmark-disable-option.patch file://check-memfree.py file://run-ptest crate://crates.io/asn1/0.21.3 crate://crates.io/asn1_derive/0.21.3 crate://crates.io/autocfg/1.4.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/2.9.1 crate://crates.io/cc/1.2.23 crate://crates.io/cfg-if/1.0.0 crate://crates.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shared/0.1.1 crate://crates.io/heck/0.5.0 crate://crates.io/indoc/2.0.6 crate://crates.io/itoa/1.0.15 crate://crates.io/libc/0.2.172 crate://crates.io/memoffset/0.9.1 crate://crates.io/once_cell/1.21.3 crate://crates.io/openssl/0.10.72 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-sys/0.9.108 crate://crates.io/pem/3.0.5 crate://crates.io/pkg-config/0.3.32 crate://crates.i
 o/portable-atomic/1.11.0 crate://crates.io/proc-macro2/1.0.95 crate://crates.io/pyo3/0.25.0 crate://crates.io/pyo3-build-config/0.25.0 crate://crates.io/pyo3-ffi/0.25.0 crate://crates.io/pyo3-macros/0.25.0 crate://crates.io/pyo3-macros-backend/0.25.0 crate://crates.io/quote/1.0.40 crate://crates.io/self_cell/1.2.0 crate://crates.io/shlex/1.3.0 crate://crates.io/syn/2.0.101 crate://crates.io/target-lexicon/0.13.2 crate://crates.io/unicode-ident/1.0.18 crate://crates.io/unindent/0.2.4 crate://crates.io/vcpkg/0.2.15" to "https://files.pythonhosted.org/packages/source/c/cryptography/cryptography-45.0.4.tar.gz;downloadfilename=cryptography-45.0.4.tar.gz file://0001-pyproject.toml-remove-benchmark-disable-option.patch file://check-memfree.py file://run-ptest crate://crates.io/asn1/0.21.3 crate://crates.io/asn1_derive/0.21.3 crate://crates.io/autocfg/1.4.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/2.9.1 crate://crates.io/cc/1.2.23 crate://crates.io/cfg-if/1.0.0 crate://cra
 tes.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shared/0.1.1 crate://crates.io/heck/0.5.0 crate://crates.io/indoc/2.0.6 crate://crates.io/itoa/1.0.15 crate://crates.io/libc/0.2.172 crate://crates.io/memoffset/0.9.1 crate://crates.io/once_cell/1.21.3 crate://crates.io/openssl/0.10.72 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-sys/0.9.108 crate://crates.io/pem/3.0.5 crate://crates.io/pkg-config/0.3.32 crate://crates.io/portable-atomic/1.11.0 crate://crates.io/proc-macro2/1.0.95 crate://crates.io/pyo3/0.25.0 crate://crates.io/pyo3-build-config/0.25.0 crate://crates.io/pyo3-ffi/0.25.0 crate://crates.io/pyo3-macros/0.25.0 crate://crates.io/pyo3-macros-backend/0.25.0 crate://crates.io/quote/1.0.40 crate://crates.io/self_cell/1.2.0 crate://crates.io/shlex/1.3.0 crate://crates.io/syn/2.0.101 crate://crates.io/target-lexicon/0.13.2 crate://crates.io/unicode-ident/1.0.18 crate://crates.io/unindent/0.2.4 crate://crates.io/vcpkg/0.2.15"
packages/core2-64-poky-linux/python3-cryptography: PKGV changed from 45.0.3 [default] to 45.0.4 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-dbg: PV changed from "45.0.3" to "45.0.4"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-dbg: PKGV changed from 45.0.3 [default] to 45.0.4 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-dbg: PKGSIZE changed from 1174280 to 1175256 (+0%)
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-dev: PV changed from "45.0.3" to "45.0.4"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-dev: PKGV changed from 45.0.3 [default] to 45.0.4 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-doc: PV changed from "45.0.3" to "45.0.4"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-doc: PKGV changed from 45.0.3 [default] to 45.0.4 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-locale: PV changed from "45.0.3" to "45.0.4"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-locale: PKGV changed from 45.0.3 [default] to 45.0.4 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-ptest: PV changed from "45.0.3" to "45.0.4"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-ptest: PKGV changed from 45.0.3 [default] to 45.0.4 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-ptest: PKGSIZE changed from 1817337 to 1817909 (+0%)
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-src: PV changed from "45.0.3" to "45.0.4"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-src: PKGV changed from 45.0.3 [default] to 45.0.4 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-staticdev: PV changed from "45.0.3" to "45.0.4"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-staticdev: PKGV changed from 45.0.3 [default] to 45.0.4 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography: PV changed from "45.0.3" to "45.0.4"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography: PKGV changed from 45.0.3 [default] to 45.0.4 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography: PKGSIZE changed from 4798585 to 4802681 (+0%)
Changes to packages/core2-64-poky-linux/python3-cryptography (sysroot):
  /usr/lib/python3.13/site-packages/cryptography-45.0.3.dist-info moved to /usr/lib/python3.13/site-packages/cryptography-45.0.4.dist-info

--===============0692959730541872503==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: FILELIST: directory renamed /usr/lib/python3.13/site-packages/cryptography_vectors-45.0.3.dist-info/licenses -> /usr/lib/python3.13/site-packages/cryptography_vectors-45.0.4.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/cryptography_vectors-45.0.3.dist-info -> /usr/lib/python3.13/site-packages/cryptography_vectors-45.0.4.dist-info, added "/usr/lib/python3.13/site-packages/cryptography_vectors/asymmetric/PKCS8/enc-ec-sha1-128-rc4.pem"
Changes to packages/core2-64-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.13/site-packages/cryptography_vectors-45.0.3.dist-info moved to /usr/lib/python3.13/site-packages/cryptography_vectors-45.0.4.dist-info
  /usr/lib/python3.13/site-packages/cryptography_vectors/asymmetric/PKCS8/enc-ec-sha1-128-rc4.pem was added
Changes to packages/core2-64-poky-linux/python3-cryptography (sysroot):
  /usr/lib/python3.13/site-packages/cryptography-45.0.3.dist-info moved to /usr/lib/python3.13/site-packages/cryptography-45.0.4.dist-info

--===============0692959730541872503==--

