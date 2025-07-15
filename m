Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68D9BC87FC8
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:55:39 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.12165.1752594932807501531
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:55:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=UMy/2FWY;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Mp/8oOiM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101980ecc610b-6a61f49d-e495-4025-b34d-51f611181725-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1752594932;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=BmR3ZCdaGQbYJdjVReBG6R0Ushqyb5nAY5Fh+qJ9IrQ=;
	b=UMy/2FWYWRq4w0vtOU/ei9/yufhzXWcR9rJGQowsogoU1XhuoD4JrtS+yWF0S+SU
	WR4SV1HdWXkS6FjIVuPCC/nq4owAmJermfJz8DC4NGWSLx6D4D2KejzmuaoAdF3y9LK
	r+jm0LvSziphaL6dnkOV/X7JReRI8GJ5AUIV1tNk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1752594932;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=BmR3ZCdaGQbYJdjVReBG6R0Ushqyb5nAY5Fh+qJ9IrQ=;
	b=Mp/8oOiMCLWEG1FnDkADn4kc3F6DSIUlRtvqrcgnWqk/vqZxc+SBalIZnGITc5/D
	S8lo3VQCq5UAXpKJiXQeMzQ2TkCzgTDAsejvqhr04jyHheH1ct9H1IiGkLHe6Aw1P5a
	BMulh1uos4kT6ouuaCmh3vve966KRtFGZc+UfKJY=
Content-Type: multipart/mixed; boundary="===============4077937844388718712=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>, 
	Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cryptography,python3-cryptography-vectors: upgrading to
 45.0.5,45.0.5 SUCCEEDED
Message-ID: <010101980ecc610b-6a61f49d-e495-4025-b34d-51f611181725-000000@us-west-2.amazonses.com>
Date: Tue, 15 Jul 2025 15:55:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:55:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220315

--===============4077937844388718712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-cryptography,python3-cryptography-vectors* to *45.0.5,45.0.5* has Succeeded.

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
From 88eb5bf38953702f3f2f2685e4cec697fe6decf3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Jul 2025 07:22:41 +0000
Subject: [PATCH] python3-cryptography,python3-cryptography-vectors: upgrade
 45.0.4 -> 45.0.5,45.0.4 -> 45.0.5

---
 meta/recipes-devtools/python/python3-cryptography-common.inc  | 2 +-
 meta/recipes-devtools/python/python3-cryptography-vectors.bb  | 2 +-
 meta/recipes-devtools/python/python3-cryptography.bb          | 2 +-
 .../0001-pyproject.toml-remove-benchmark-disable-option.patch | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-cryptography-common.inc b/meta/recipes-devtools/python/python3-cryptography-common.inc
index 5ce2485ed5..14f840ef2e 100644
--- a/meta/recipes-devtools/python/python3-cryptography-common.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-common.inc
@@ -3,4 +3,4 @@
 #
 # Additionally AUH will detect that they share this .inc file and
 # perform a lockstep upgrade for both.
-PV = "45.0.4"
+PV = "45.0.5"
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors.bb b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
index a8f8d0cd17..3699b499aa 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "fbb0408df8ff2d2b3dbd2928bc5b7feebfdd36fb092fa8790d5778a9b9a1f9ef"
+SRC_URI[sha256sum] = "1b9e2c1ee94e6b253a03fc0fd749d672ff6e1e48e50dd7af2334fde0303fbbe7"
 
 PYPI_PACKAGE = "cryptography_vectors"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/recipes-devtools/python/python3-cryptography.bb
index f41e13f4a1..bc8e7fffb0 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -11,7 +11,7 @@ LDSHARED += "-pthread"
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography-vectors
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "7405ade85c83c37682c8fe65554759800a4a8c54b2d96e0f8ad114d31b808d57"
+SRC_URI[sha256sum] = "72e76caa004ab63accdf26023fccd1d087f6d90ec6048ff33ad0445abf7f605a"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://check-memfree.py \
diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
index e238717208..31c131b610 100644
--- a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
@@ -1,4 +1,4 @@
-From baa3c56b87ceaea331811a0a4642991cbb12e6ea Mon Sep 17 00:00:00 2001
+From aa0ed22a21c5cb0ef6c4298439a54aa32cd4370e Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Tue, 17 May 2022 17:22:48 +0800
 Subject: [PATCH] pyproject.toml: remove --benchmark-disable option
@@ -26,7 +26,7 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index d9ef704..878b720 100644
+index b1f6fb3..c8007b0 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
 @@ -129,7 +129,7 @@ exclude = [
-- 
2.47.1


--===============4077937844388718712==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cryptography-python3-cryptography-vectors-up.patch"

RnJvbSA4OGViNWJmMzg5NTM3MDJmM2YyZjI2ODVlNGNlYzY5N2ZlNmRlY2YzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgSnVsIDIwMjUgMDc6MjI6NDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNyeXB0b2dyYXBoeSxweXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzOiB1cGdyYWRl
CiA0NS4wLjQgLT4gNDUuMC41LDQ1LjAuNCAtPiA0NS4wLjUKCi0tLQogbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS1jb21tb24uaW5jICB8IDIgKy0KIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9ycy5i
YiAgfCAyICstCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3Jh
cGh5LmJiICAgICAgICAgIHwgMiArLQogLi4uLzAwMDEtcHlwcm9qZWN0LnRvbWwtcmVtb3ZlLWJl
bmNobWFyay1kaXNhYmxlLW9wdGlvbi5wYXRjaCB8IDQgKystLQogNCBmaWxlcyBjaGFuZ2VkLCA1
IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS1jb21tb24uaW5jIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS1jb21tb24uaW5jCmlu
ZGV4IDVjZTI0ODVlZDUuLjE0Zjg0MGVmMmUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktY29tbW9uLmluYworKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LWNvbW1vbi5pbmMKQEAg
LTMsNCArMyw0IEBACiAjCiAjIEFkZGl0aW9uYWxseSBBVUggd2lsbCBkZXRlY3QgdGhhdCB0aGV5
IHNoYXJlIHRoaXMgLmluYyBmaWxlIGFuZAogIyBwZXJmb3JtIGEgbG9ja3N0ZXAgdXBncmFkZSBm
b3IgYm90aC4KLVBWID0gIjQ1LjAuNCIKK1BWID0gIjQ1LjAuNSIKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9ycy5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9y
cy5iYgppbmRleCBhOGY4ZDBjZDE3Li4zNjk5YjQ5OWFhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnMuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3Jz
LmJiCkBAIC05LDcgKzksNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21k
NT04YzM2MTdkYjRmYjZmYWUwMWYxZDI1M2FiOTE1MTFlNCBcCiAjIE5PVEU6IE1ha2Ugc3VyZSB0
byBrZWVwIHRoaXMgcmVjaXBlIGF0IHRoZSBzYW1lIHZlcnNpb24gYXMgcHl0aG9uMy1jcnlwdG9n
cmFwaHkKICMgICAgICAgVXBncmFkZSBib3RoIHJlY2lwZXMgYXQgdGhlIHNhbWUgdGltZQogcmVx
dWlyZSBweXRob24zLWNyeXB0b2dyYXBoeS1jb21tb24uaW5jCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiZmJiMDQwOGRmOGZmMmQyYjNkYmQyOTI4YmM1YjdmZWViZmRkMzZmYjA5MmZhODc5MGQ1Nzc4
YTliOWExZjllZiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIxYjllMmMxZWU5NGU2YjI1M2EwM2Zj
MGZkNzQ5ZDY3MmZmNmUxZTQ4ZTUwZGQ3YWYyMzM0ZmRlMDMwM2ZiYmU3IgogCiBQWVBJX1BBQ0tB
R0UgPSAiY3J5cHRvZ3JhcGh5X3ZlY3RvcnMiCiBVUFNUUkVBTV9DSEVDS19QWVBJX1BBQ0tBR0Ug
PSAiJHtQWVBJX1BBQ0tBR0V9IgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1jcnlwdG9ncmFwaHkuYmIKaW5kZXggZjQxZTEzZjRhMS4uYmM4ZTdmZmZiMCAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dy
YXBoeS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRv
Z3JhcGh5LmJiCkBAIC0xMSw3ICsxMSw3IEBAIExEU0hBUkVEICs9ICItcHRocmVhZCIKICMgTk9U
RTogTWFrZSBzdXJlIHRvIGtlZXAgdGhpcyByZWNpcGUgYXQgdGhlIHNhbWUgdmVyc2lvbiBhcyBw
eXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzCiAjICAgICAgIFVwZ3JhZGUgYm90aCByZWNpcGVz
IGF0IHRoZSBzYW1lIHRpbWUKIHJlcXVpcmUgcHl0aG9uMy1jcnlwdG9ncmFwaHktY29tbW9uLmlu
YwotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjc0MDVhZGU4NWM4M2MzNzY4MmM4ZmU2NTU1NDc1OTgw
MGE0YThjNTRiMmQ5NmUwZjhhZDExNGQzMWI4MDhkNTciCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAi
NzJlNzZjYWEwMDRhYjYzYWNjZGYyNjAyM2ZjY2QxZDA4N2Y2ZDkwZWM2MDQ4ZmYzM2FkMDQ0NWFi
ZjdmNjA1YSIKIAogU1JDX1VSSSArPSAiZmlsZTovLzAwMDEtcHlwcm9qZWN0LnRvbWwtcmVtb3Zl
LWJlbmNobWFyay1kaXNhYmxlLW9wdGlvbi5wYXRjaCBcCiAgICAgICAgICAgICBmaWxlOi8vY2hl
Y2stbWVtZnJlZS5weSBcCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtY3J5cHRvZ3JhcGh5LzAwMDEtcHlwcm9qZWN0LnRvbWwtcmVtb3ZlLWJlbmNobWFy
ay1kaXNhYmxlLW9wdGlvbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1jcnlwdG9ncmFwaHkvMDAwMS1weXByb2plY3QudG9tbC1yZW1vdmUtYmVuY2htYXJrLWRp
c2FibGUtb3B0aW9uLnBhdGNoCmluZGV4IGUyMzg3MTcyMDguLjMxYzEzMWI2MTAgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHkvMDAw
MS1weXByb2plY3QudG9tbC1yZW1vdmUtYmVuY2htYXJrLWRpc2FibGUtb3B0aW9uLnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHkvMDAw
MS1weXByb2plY3QudG9tbC1yZW1vdmUtYmVuY2htYXJrLWRpc2FibGUtb3B0aW9uLnBhdGNoCkBA
IC0xLDQgKzEsNCBAQAotRnJvbSBiYWEzYzU2Yjg3Y2VhZWEzMzE4MTFhMGE0NjQyOTkxY2JiMTJl
NmVhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhYTBlZDIyYTIxYzVjYjBlZjZjNDI5
ODQzOWE1NGFhMzJjZDQzNzBlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogTWluZ2xp
IFl1IDxtaW5nbGkueXVAd2luZHJpdmVyLmNvbT4KIERhdGU6IFR1ZSwgMTcgTWF5IDIwMjIgMTc6
MjI6NDggKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gcHlwcm9qZWN0LnRvbWw6IHJlbW92ZSAtLWJl
bmNobWFyay1kaXNhYmxlIG9wdGlvbgpAQCAtMjYsNyArMjYsNyBAQCBTaWduZWQtb2ZmLWJ5OiBU
aW0gT3JsaW5nIDx0aW0ub3JsaW5nQGtvbnN1bGtvLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL3B5cHJvamVjdC50b21s
IGIvcHlwcm9qZWN0LnRvbWwKLWluZGV4IGQ5ZWY3MDQuLjg3OGI3MjAgMTAwNjQ0CitpbmRleCBi
MWY2ZmIzLi5jODAwN2IwIDEwMDY0NAogLS0tIGEvcHlwcm9qZWN0LnRvbWwKICsrKyBiL3B5cHJv
amVjdC50b21sCiBAQCAtMTI5LDcgKzEyOSw3IEBAIGV4Y2x1ZGUgPSBbCi0tIAoyLjQ3LjEKCg==

--===============4077937844388718712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 941 .bb files complete (0 cached, 941 parsed). 1929 targets, 50 skipped, 0 masked, 0 errors.
Removing 49 recipes from the core2-64 sysroot...done.
Removing 98 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-c1d1f88d1986235584bf8dcb6d0d090e90513877"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:c1d1f88d1986235584bf8dcb6d0d090e90513877"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 613 Local 474 Mirrors 0 Missed 139 Current 313 (77% match, 84% complete)
Removing 11 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 328 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 332 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 340 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 359 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_package_qa_setscene)
NOTE: Running setscene task 374 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_populate_lic_setscene)
NOTE: Running setscene task 403 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 404 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 405 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 406 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 428 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_populate_lic_setscene)
NOTE: Running setscene task 455 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 465 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 466 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 467 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 474 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-25.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 492 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.4.1.bb:do_packagedata_setscene)
NOTE: recipe python3-cryptography-45.0.5-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 497 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 502 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 506 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 507 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 509 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 510 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-pytest-8.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-cryptography-45.0.5-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 511 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-packaging-25.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 517 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_25.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 523 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_package_setscene)
NOTE: recipe python3-psutil-7.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-cffi-1.17.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytest-8.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-psutil-7.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-attrs-25.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-iso8601-2.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-cffi-1.17.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-attrs-25.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 526 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 527 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.135.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 528 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 529 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.4.1.bb:do_package_setscene)
NOTE: Running setscene task 532 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 535 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 536 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 539 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 541 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 546 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_25.3.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 549 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 551 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 552 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 553 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_packagedata_setscene)
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.135.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-cffi-1.17.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-attrs-25.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 554 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe python3-hypothesis-6.135.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 555 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_recipe_qa_setscene)
NOTE: recipe python3-cffi-1.17.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-attrs-25.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 556 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package_setscene)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 557 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 559 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_15.1.bb:do_packagedata_setscene)
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 565 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 566 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 567 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 568 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 572 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 573 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 577 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-4.0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-iniconfig-2.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.44-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe procps-4.0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 578 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_packagedata_setscene)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 580 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 582 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 583 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-iniconfig-2.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 585 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 586 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 587 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 592 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_setscene: Started
NOTE: recipe python3-pytest-8.4.1-r0: task do_package_setscene: Started
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-psutil-7.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 595 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe python3-pygments-2.19.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-2.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 600 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.135.16.bb:do_recipe_qa_setscene)
NOTE: recipe python3-psutil-7.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-iso8601-2.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 603 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_10.0.2.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 609 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycparser_2.22.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 611 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.87.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 621 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pygments-2.19.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-iniconfig-2.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-2.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 626 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 629 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 630 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_packagedata_setscene)
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.135.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe qemu-native-10.0.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pycparser-2.22-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 634 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_create_spdx_setscene)
NOTE: recipe libstd-rs-1.87.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-hypothesis-6.135.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunwind-1.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 639 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 643 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Started
NOTE: recipe qemu-native-10.0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pycparser-2.22-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 647 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 651 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycparser_2.22.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 652 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 653 of 926 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.8.2.bb:do_create_spdx_setscene)
NOTE: recipe libstd-rs-1.87.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 654 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.87.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 655 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libunwind-1.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 656 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 658 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 661 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 664 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pycparser-2.22-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pytest-8.4.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 667 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 668 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libstd-rs-1.87.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe meson-native-1.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 669 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pycparser-2.22-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 672 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 675 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 676 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 678 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libstd-rs-1.87.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pytest-8.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe meson-native-1.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 681 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 682 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 683 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 685 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 688 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 689 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 692 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-8.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 695 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-8.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 704 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 713 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 715 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 717 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 721 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-8.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 734 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_create_spdx_setscene)
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 747 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 748 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 750 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_packagedata_setscene)
NOTE: recipe curl-8.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 752 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: Running setscene task 753 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 754 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 755 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_packagedata_setscene)
NOTE: Running setscene task 757 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 758 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 760 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_packagedata_setscene)
NOTE: Running setscene task 761 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata_setscene)
NOTE: Running setscene task 762 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 766 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 767 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 768 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 770 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 771 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 773 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/util-linux-libuuid/2.41/temp/log.do_packagedata_setscene.1683426
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 777 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 778 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 779 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 784 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 785 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 788 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 792 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 793 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 794 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_package_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 797 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 800 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 801 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 805 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 806 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_package_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 815 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 822 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 825 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 827 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 831 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 834 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 835 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 837 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 843 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 846 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 847 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 850 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 859 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 864 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 865 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 867 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 869 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 874 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 879 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 881 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 883 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_10.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 885 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 886 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_packagedata_setscene)
NOTE: recipe qemu-native-10.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 897 of 2553 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.87.0.bb:do_rust_gen_targets)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 890 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_packagedata_setscene)
NOTE: Running task 988 of 2553 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.87.0.bb:do_rust_gen_targets)
NOTE: Running task 1013 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_fetch)
NOTE: recipe qemu-native-10.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1021 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.8.2.bb:do_fetch)
NOTE: Running setscene task 891 of 926 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_populate_sysroot_setscene)
NOTE: recipe rust-native-1.87.0-r0: task do_rust_gen_targets: Started
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe rust-native-1.87.0-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 1027 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.87.0.bb:do_fetch)
NOTE: Running task 1038 of 2553 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.87.0.bb:do_compile)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 892 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 893 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_recipe_qa_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_fetch: Started
NOTE: recipe libunwind-1.8.2-r0: task do_fetch: Started
NOTE: recipe cargo-native-1.87.0-r0: task do_rust_gen_targets: Started
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cargo-native-1.87.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe libstd-rs-1.87.0-r0: task do_fetch: Started
NOTE: Running setscene task 896 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-native-1_2.84.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.87.0-r0: task do_fetch: Succeeded
NOTE: Running task 1077 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.87.0.bb:do_unpack)
NOTE: recipe libgcc-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rust-native-1.87.0-r0: task do_compile: Started
NOTE: Running task 1113 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_recipe_qa)
NOTE: Running task 1116 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_write_config)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: Running task 1134 of 2553 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb:do_rust_gen_targets)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe rust-native-1.87.0-r0: task do_compile: Succeeded
NOTE: recipe libstd-rs-1.87.0-r0: task do_unpack: Started
NOTE: Running task 1155 of 2553 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.87.0.bb:do_install)
NOTE: Running task 1158 of 2553 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-maturin_1.9.0.bb:do_rust_gen_targets)
NOTE: Running task 1164 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycparser_2.22.bb:do_fetch)
NOTE: recipe libucontext-1.3.2-r0: task do_write_config: Started
NOTE: Running task 1168 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_fetch)
NOTE: recipe libgcc-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 898 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 899 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cryptography-45.0.5-r0: task do_recipe_qa: Started
NOTE: Running setscene task 901 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 902 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_write_config: Succeeded
NOTE: Running setscene task 903 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-rust-native-1.11.1-r0: task do_rust_gen_targets: Started
NOTE: recipe glib-2.0-native-1_2.84.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-setuptools-rust-native-1.11.1-r0: task do_rust_gen_targets: Succeeded
NOTE: Running setscene task 904 of 926 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pycparser-2.22-r0: task do_fetch: Started
NOTE: recipe python3-pycparser-2.22-r0: task do_fetch: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rust-native-1.87.0-r0: task do_install: Started
NOTE: recipe libgcc-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_fetch: Succeeded
NOTE: recipe libgcc-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe meson-native-1.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 906 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-cryptography-45.0.5-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 912 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 913 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running task 1184 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_fetch)
NOTE: recipe python3-maturin-native-1.9.0-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-maturin-native-1.9.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1207 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycparser_2.22.bb:do_unpack)
NOTE: Running task 1211 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_fetch)
NOTE: Running task 1214 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_fetch)
NOTE: Running task 1217 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_unpack)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe meson-native-1.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunwind-1.8.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-45.0.5-r0: task do_fetch: Started
NOTE: recipe python3-pycparser-2.22-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.17.1-r0: task do_fetch: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 915 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-cffi-1.17.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pycparser-2.22-r0: task do_unpack: Succeeded
NOTE: recipe python3-cryptography-45.0.5-r0: task do_fetch: Succeeded
NOTE: Running setscene task 917 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_unpack: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 919 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running task 1254 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.8.2.bb:do_unpack)
NOTE: Running task 1255 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_unpack)
NOTE: Running task 1256 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycparser_2.22.bb:do_patch)
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1274 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.135.16.bb:do_fetch)
NOTE: Running task 1275 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_unpack)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1282 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_unpack)
NOTE: recipe libunwind-1.8.2-r0: task do_unpack: Started
NOTE: recipe python3-pycparser-2.22-r0: task do_patch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-cryptography-45.0.5-r0: task do_unpack: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.135.16-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.135.16-r0: task do_fetch: Succeeded
NOTE: recipe python3-cffi-1.17.1-r0: task do_unpack: Started
NOTE: Running task 1305 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 1306 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.135.16.bb:do_unpack)
NOTE: recipe python3-pytz-2025.2-r0: task do_unpack: Succeeded
NOTE: Running task 1320 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_patch)
NOTE: recipe python3-pycparser-2.22-r0: task do_patch: Succeeded
NOTE: recipe libunwind-1.8.2-r0: task do_unpack: Succeeded
NOTE: Running task 1323 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.8.2.bb:do_patch)
NOTE: recipe python3-cffi-1.17.1-r0: task do_unpack: Succeeded
NOTE: Running task 1332 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.135.16-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1365 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_25.3.0.bb:do_fetch)
NOTE: recipe python3-pytz-2025.2-r0: task do_patch: Started
NOTE: Running task 1376 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycparser_2.22.bb:do_check_backend)
NOTE: recipe libunwind-1.8.2-r0: task do_patch: Started
NOTE: Running task 1379 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe python3-hypothesis-6.135.16-r0: task do_unpack: Succeeded
NOTE: recipe python3-cffi-1.17.1-r0: task do_patch: Started
NOTE: Running task 1385 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.135.16.bb:do_patch)
NOTE: Running task 1407 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.4.1.bb:do_fetch)
NOTE: Running task 1408 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_recipe_qa)
NOTE: Running task 1412 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_fetch)
NOTE: recipe python3-attrs-25.3.0-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe python3-pycparser-2.22-r0: task do_check_backend: Started
NOTE: recipe python3-pycparser-2.22-r0: task do_check_backend: Succeeded
NOTE: recipe python3-attrs-25.3.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_patch: Succeeded
NOTE: Running task 1413 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_25.3.0.bb:do_unpack)
NOTE: Running task 1415 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_fetch)
NOTE: Running task 1417 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_check_backend)
NOTE: recipe python3-hypothesis-6.135.16-r0: task do_patch: Started
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_recipe_qa: Started
NOTE: recipe python3-pytest-8.4.1-r0: task do_fetch: Started
NOTE: recipe libucontext-1.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 1418 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_unpack)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_fetch: Started
NOTE: recipe python3-pytest-8.4.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 1430 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.17.1-r0: task do_patch: Succeeded
NOTE: recipe python3-attrs-25.3.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1438 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe python3-pytz-2025.2-r0: task do_check_backend: Started
NOTE: Running task 1439 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.4.1.bb:do_unpack)
NOTE: recipe python3-pytz-2025.2-r0: task do_check_backend: Succeeded
NOTE: recipe python3-hypothesis-6.135.16-r0: task do_patch: Succeeded
NOTE: recipe python3-attrs-25.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 1446 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_25.3.0.bb:do_patch)
NOTE: recipe libucontext-1.3.2-r0: task do_unpack: Started
NOTE: Running task 1452 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_unpack)
NOTE: Running task 1454 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: Running task 1476 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb:do_fetch)
NOTE: recipe python3-pytest-8.4.1-r0: task do_unpack: Started
NOTE: recipe python3-attrs-25.3.0-r0: task do_patch: Started
NOTE: recipe python3-cryptography-45.0.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1477 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_patch)
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: Running task 1478 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_fetch)
NOTE: Running task 1479 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_unpack)
NOTE: Running task 1480 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_fetch)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 1481 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_fetch)
NOTE: recipe python3-pytest-8.4.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_fetch: Started
NOTE: Running task 1482 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_fetch: Succeeded
NOTE: Running task 1484 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe python3-attrs-25.3.0-r0: task do_patch: Succeeded
NOTE: Running task 1485 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.4.1.bb:do_patch)
NOTE: Running task 1487 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_fetch: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-7.0.0-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_fetch: Succeeded
NOTE: recipe libunwind-1.8.2-r0: task do_patch: Succeeded
NOTE: Running task 1493 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_patch)
NOTE: recipe python3-cryptography-45.0.5-r0: task do_patch: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-psutil-7.0.0-r0: task do_fetch: Succeeded
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_patch: Started
NOTE: Running setscene task 921 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: Running task 1505 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_unpack)
NOTE: recipe python3-pytest-8.4.1-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: Running task 1519 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe linux-libc-headers-6.15-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1524 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_patch: Succeeded
NOTE: Running task 1529 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb:do_unpack)
NOTE: Running task 1530 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_unpack)
NOTE: Running task 1531 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_unpack)
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_patch: Started
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_unpack: Started
NOTE: recipe python3-pytest-8.4.1-r0: task do_patch: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 1544 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_patch)
NOTE: recipe python3-cryptography-45.0.5-r0: task do_patch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: Running task 1556 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_deploy_source_date_epoch)
NOTE: Running task 1557 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_rust_gen_targets)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_unpack: Started
NOTE: recipe python3-psutil-7.0.0-r0: task do_unpack: Started
NOTE: Running task 1568 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_fetch)
NOTE: recipe python3-iso8601-2.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_patch: Succeeded
NOTE: Running task 1573 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-psutil-7.0.0-r0: task do_unpack: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_patch: Started
NOTE: Running task 1575 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_rust_gen_targets)
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: Running task 1576 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb:do_patch)
NOTE: Running task 1577 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_patch)
NOTE: Running task 1578 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_patch)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-45.0.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-45.0.5-r0: task do_rust_gen_targets: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-45.0.5-r0: task do_rust_gen_targets: Succeeded
NOTE: Running setscene task 924 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 925 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_unpack: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_patch: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_patch: Started
NOTE: recipe python3-psutil-7.0.0-r0: task do_patch: Started
NOTE: Running task 1596 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_patch)
NOTE: Running task 1599 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_check_backend)
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_rust_gen_targets: Started
NOTE: Running task 1608 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.1.0.bb:do_fetch)
NOTE: Running task 1609 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_fetch)
NOTE: Running task 1610 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 1611 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_fetch)
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_check_backend: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_check_backend: Succeeded
NOTE: recipe linux-libc-headers-6.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_patch: Succeeded
NOTE: recipe python3-iso8601-2.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-psutil-7.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-iniconfig-2.1.0-r0: task do_fetch: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_fetch: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_fetch: Started
NOTE: recipe python3-iniconfig-2.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_fetch: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_fetch: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_fetch: Succeeded
NOTE: Running task 1628 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_unpack)
NOTE: recipe python3-cryptography-45.0.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1638 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.1.0.bb:do_unpack)
NOTE: Running task 1639 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_unpack)
NOTE: Running task 1640 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_unpack)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_unpack: Started
NOTE: recipe python3-iniconfig-2.1.0-r0: task do_unpack: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_unpack: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_unpack: Started
NOTE: Running task 1695 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_patch)
NOTE: recipe python3-iniconfig-2.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 1696 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.1.0.bb:do_patch)
NOTE: Running task 1697 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_patch)
NOTE: recipe procps-4.0.5-r0: task do_fetch: Succeeded
NOTE: Running task 1698 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_unpack)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_patch: Started
NOTE: recipe python3-iniconfig-2.1.0-r0: task do_patch: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_patch: Started
NOTE: recipe procps-4.0.5-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-iniconfig-2.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_patch: Succeeded
NOTE: Running task 1886 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1977 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_packagedata)
NOTE: recipe python3-pygments-2.19.2-r0: task do_unpack: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2035 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycparser_2.22.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2043 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2044 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.135.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_packagedata: Started
NOTE: Running task 2062 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_patch)
NOTE: Running task 2064 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_25.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pycparser-2.22-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2080 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-pytz-2025.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.135.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2098 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.4.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2100 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_patch: Started
NOTE: Running task 2110 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-attrs-25.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: Running task 2152 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-8.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2153 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_patch: Succeeded
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2154 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_deploy_source_date_epoch)
NOTE: recipe procps-4.0.5-r0: task do_unpack: Succeeded
NOTE: Running task 2155 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2161 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libucontext-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-psutil-7.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2162 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_configure)
NOTE: recipe libucontext-1.3.2-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pycparser-2.22-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.135.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2174 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_configure)
NOTE: Running task 2175 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycparser_2.22.bb:do_configure)
NOTE: Running task 2176 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.135.16.bb:do_configure)
NOTE: Running task 2210 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_patch)
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_configure: Started
NOTE: recipe python3-pytest-8.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pycparser-2.22-r0: task do_configure: Started
NOTE: recipe python3-attrs-25.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2211 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_configure)
NOTE: recipe python3-hypothesis-6.135.16-r0: task do_configure: Started
NOTE: Running task 2212 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_25.3.0.bb:do_configure)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2213 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.4.1.bb:do_configure)
NOTE: recipe python3-pygments-2.19.2-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2214 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_configure)
NOTE: Running task 2215 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pycparser-2.22-r0: task do_configure: Succeeded
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_configure: Started
NOTE: Running task 2216 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb:do_configure)
NOTE: recipe python3-pytz-2025.2-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.135.16-r0: task do_configure: Succeeded
NOTE: Running task 2217 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycparser_2.22.bb:do_compile)
NOTE: recipe python3-attrs-25.3.0-r0: task do_configure: Started
NOTE: recipe python3-pytest-8.4.1-r0: task do_configure: Started
NOTE: Running task 2218 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_configure_ptest_base)
NOTE: recipe python3-pygments-2.19.2-r0: task do_patch: Succeeded
NOTE: Running task 2219 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.135.16.bb:do_configure_ptest_base)
NOTE: recipe python3-iso8601-2.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_configure: Started
NOTE: recipe python3-psutil-7.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: Running task 2220 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_configure)
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_configure: Succeeded
NOTE: Running task 2221 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_configure)
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_configure: Started
NOTE: Running task 2222 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_compile)
NOTE: recipe python3-pycparser-2.22-r0: task do_compile: Started
NOTE: Running task 2223 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_patch)
NOTE: recipe python3-pytest-8.4.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_configure_ptest_base: Started
NOTE: Running task 2224 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.4.1.bb:do_compile)
NOTE: recipe python3-attrs-25.3.0-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.135.16-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: recipe python3-iso8601-2.1.0-r0: task do_configure: Started
NOTE: Running task 2225 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_configure_ptest_base)
NOTE: recipe python3-pytz-2025.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-psutil-7.0.0-r0: task do_configure: Started
NOTE: Running task 2226 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_25.3.0.bb:do_configure_ptest_base)
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.135.16-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2227 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_compile: Started
NOTE: recipe procps-4.0.5-r0: task do_patch: Started
NOTE: Running task 2228 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_compile)
NOTE: Running task 2229 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.135.16.bb:do_compile)
NOTE: recipe python3-pytest-8.4.1-r0: task do_compile: Started
NOTE: Running task 2230 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb:do_compile)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-psutil-7.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-attrs-25.3.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 2231 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_compile)
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: Running task 2232 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_compile)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_patch: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_compile: Started
NOTE: recipe python3-attrs-25.3.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2233 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_compile)
NOTE: recipe python3-hypothesis-6.135.16-r0: task do_compile: Started
NOTE: Running task 2234 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_25.3.0.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_compile: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_compile: Started
NOTE: Running task 2255 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-psutil-7.0.0-r0: task do_compile: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_compile: Started
NOTE: recipe python3-attrs-25.3.0-r0: task do_compile: Started
NOTE: recipe libucontext-1.3.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libucontext-1.3.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2257 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_check_backend)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_check_backend: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_check_backend: Succeeded
NOTE: Running task 2259 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libucontext-1.3.2-r0: task do_configure: Succeeded
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_compile: Succeeded
NOTE: Running task 2260 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_compile)
NOTE: Running task 2261 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_install)
NOTE: recipe libucontext-1.3.2-r0: task do_compile: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: Running task 2262 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2264 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-attrs-25.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2265 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: Running task 2266 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_25.3.0.bb:do_compile_ptest_base)
NOTE: recipe python3-pycparser-2.22-r0: task do_compile: Succeeded
NOTE: recipe python3-iniconfig-2.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2267 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycparser_2.22.bb:do_install)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2268 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_install)
NOTE: recipe python3-attrs-25.3.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pycparser-2.22-r0: task do_install: Started
NOTE: recipe python3-attrs-25.3.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2269 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_25.3.0.bb:do_install)
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_install: Succeeded
NOTE: recipe python3-iso8601-2.1.0-r0: task do_install: Started
NOTE: Running task 2273 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libucontext-1.3.2-r0: task do_compile: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_compile: Succeeded
NOTE: Running task 2274 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_install)
NOTE: Running task 2275 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_compile_ptest_base)
NOTE: recipe python3-attrs-25.3.0-r0: task do_install: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_compile: Succeeded
NOTE: Running task 2276 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb:do_install)
NOTE: Running task 2280 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libucontext-1.3.2-r0: task do_install: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_compile_ptest_base: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 322b8f8b906444532279807f4b6d94c79a2dab3feaff9de6d084f1ef1555cf0a
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 0270db806ed3b201881e88fc75408abf881c06eb86f9d17d75d9f81e0eeefcfa to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '0e6e57956825dc34de222e571f7dfb1898df4fd8b81fc4321104367a353e806b', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '0270db806ed3b201881e88fc75408abf881c06eb86f9d17d75d9f81e0eeefcfa'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 0e6e57956825dc34de222e571f7dfb1898df4fd8b81fc4321104367a353e806b -> 0270db806ed3b201881e88fc75408abf881c06eb86f9d17d75d9f81e0eeefcfa as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe python3-pytz-2025.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2284 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2285 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_install)
NOTE: recipe python3-pygments-2.19.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_install: Started
NOTE: recipe python3-pytest-8.4.1-r0: task do_compile: Succeeded
NOTE: recipe python3-hypothesis-6.135.16-r0: task do_compile: Succeeded
NOTE: Running task 2286 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.4.1.bb:do_install)
NOTE: Running task 2287 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.135.16.bb:do_compile_ptest_base)
NOTE: recipe procps-4.0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iniconfig-2.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_install: Started
NOTE: Running task 2290 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_configure)
NOTE: recipe python3-iso8601-2.1.0-r0: task do_install: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_compile: Succeeded
NOTE: Running task 2291 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_compile_ptest_base)
NOTE: recipe python3-pytest-8.4.1-r0: task do_install: Started
NOTE: Running task 2292 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_package)
NOTE: recipe python3-hypothesis-6.135.16-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.135.16-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-pycparser-2.22-r0: task do_install: Succeeded
NOTE: Running task 2293 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.135.16.bb:do_install)
NOTE: Running task 2294 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycparser_2.22.bb:do_populate_sysroot)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_package: Started
NOTE: recipe python3-attrs-25.3.0-r0: task do_install: Succeeded
NOTE: Running task 2295 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycparser_2.22.bb:do_package)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2296 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_install)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2297 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_25.3.0.bb:do_install_ptest_base)
NOTE: recipe python3-pycparser-2.22-r0: task do_populate_sysroot: Started
NOTE: Running task 2298 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.1.0.bb:do_configure)
NOTE: recipe python3-hypothesis-6.135.16-r0: task do_install: Started
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_install: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2299 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_configure)
NOTE: Running task 2300 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb:do_package)
NOTE: recipe python3-pycparser-2.22-r0: task do_package: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_install: Started
NOTE: recipe python3-attrs-25.3.0-r0: task do_install_ptest_base: Started
NOTE: recipe libucontext-1.3.2-r0: task do_install: Succeeded
NOTE: recipe python3-iniconfig-2.1.0-r0: task do_configure: Started
NOTE: Running task 2301 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_populate_sysroot)
NOTE: recipe python3-colorama-0.4.6-r0: task do_configure: Started
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_package: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2302 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_package)
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-attrs-25.3.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-iniconfig-2.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2303 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_configure)
NOTE: recipe python3-colorama-0.4.6-r0: task do_configure: Succeeded
NOTE: Running task 2304 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_25.3.0.bb:do_package)
NOTE: Running task 2305 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_configure)
NOTE: recipe libucontext-1.3.2-r0: task do_package: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_configure: Started
NOTE: recipe procps-4.0.5-r0: task do_configure: Started
NOTE: recipe python3-attrs-25.3.0-r0: task do_package: Started
NOTE: recipe python3-pycparser-2.22-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2306 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pygments-2.19.2-r0: task do_configure: Succeeded
NOTE: Running task 2309 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_compile)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_install: Succeeded
NOTE: Running task 2310 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.1.0.bb:do_compile)
NOTE: recipe python3-cffi-1.17.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-8.4.1-r0: task do_install: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_install: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_compile: Started
NOTE: Running task 2313 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_install_ptest_base)
NOTE: Running task 2314 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_compile)
NOTE: recipe python3-iniconfig-2.1.0-r0: task do_compile: Started
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_populate_sysroot unihash changed to 9cddcefb193ba6082639a7867cc8ee4e680b8a033dc685eb3838d4966b7a0dc2
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.8.2.bb:do_populate_sysroot became valid
NOTE: recipe python3-colorama-0.4.6-r0: task do_compile: Started
NOTE: recipe python3-psutil-7.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running setscene task 909 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 2315 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_install)
NOTE: Running task 2316 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_package)
NOTE: recipe python3-hypothesis-6.135.16-r0: task do_install: Succeeded
NOTE: Running task 2317 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.135.16.bb:do_install_ptest_base)
NOTE: recipe libunwind-1.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-psutil-7.0.0-r0: task do_install: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_package: Started
NOTE: recipe python3-cffi-1.17.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.135.16-r0: task do_install_ptest_base: Started
NOTE: Running task 2318 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_configure)
NOTE: recipe libunwind-1.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2319 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cffi-1.17.1-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.135.16-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2320 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.135.16.bb:do_package)
NOTE: recipe libunwind-1.8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_package: Succeeded
NOTE: Running task 2321 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.135.16-r0: task do_package: Started
NOTE: recipe python3-cffi-1.17.1-r0: task do_configure: Succeeded
NOTE: Running task 2322 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_configure_ptest_base)
NOTE: recipe python3-iso8601-2.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.17.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libunwind-1.8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2323 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.8.2.bb:do_configure)
NOTE: recipe python3-cffi-1.17.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pycparser-2.22-r0: task do_package: Succeeded
NOTE: Running task 2324 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_compile)
NOTE: Running task 2325 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycparser_2.22.bb:do_packagedata)
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_package: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_package: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_compile: Succeeded
NOTE: recipe libunwind-1.8.2-r0: task do_configure: Started
NOTE: recipe python3-psutil-7.0.0-r0: task do_install: Succeeded
NOTE: Running task 2326 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb:do_packagedata)
NOTE: Running task 2327 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_package)
NOTE: recipe python3-colorama-0.4.6-r0: task do_compile: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_package unihash changed to c75ce963c00854d49089232be0ce014268fcd66012f3007d3eeeabae49e5f480
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_packagedata became valid
NOTE: recipe python3-cffi-1.17.1-r0: task do_compile: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pycparser-2.22-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-7.0.0-r0: task do_package: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_packagedata unihash changed to cf9d57c017afb1a1b4bc3ad9049b5e726911327e129b8f8689de2217b2cab4fb
NOTE: recipe python3-iniconfig-2.1.0-r0: task do_compile: Succeeded
NOTE: Running setscene task 921 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_packagedata_setscene)
NOTE: Running task 2328 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_compile)
NOTE: Running task 2331 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_install)
NOTE: Running task 2333 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_install_ptest_base)
NOTE: Running task 2334 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.1.0.bb:do_install)
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_compile: Started
NOTE: recipe python3-pycparser-2.22-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycparser_2.22.bb:do_packagedata unihash changed to 497005e3b43253789caf199de844c96e6f996f66716478fce6e2f9ee36279913
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_install: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-iniconfig-2.1.0-r0: task do_install: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb:do_packagedata unihash changed to 259436a82d5f5d593bbf5e424363bd27cceb47350a9ad22d9186de73852e40e2
NOTE: recipe python3-attrs-25.3.0-r0: task do_package: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2336 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_25.3.0.bb:do_packagedata)
NOTE: Running task 2337 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_create_spdx)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2338 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_install)
NOTE: Running task 2344 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_package)
NOTE: Running task 2359 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycparser_2.22.bb:do_collect_spdx_deps)
NOTE: recipe python3-attrs-25.3.0-r0: task do_packagedata: Started
NOTE: recipe libucontext-1.3.2-r0: task do_create_spdx: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_install: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_package: Started
NOTE: recipe python3-pycparser-2.22-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-iniconfig-2.1.0-r0: task do_install: Succeeded
NOTE: recipe python3-pycparser-2.22-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_install: Succeeded
NOTE: Running task 2363 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycparser_2.22.bb:do_create_spdx)
NOTE: Running task 2364 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package)
NOTE: recipe libucontext-1.3.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2365 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.1.0.bb:do_package)
NOTE: recipe python3-attrs-25.3.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_25.3.0.bb:do_packagedata unihash changed to 9ff378302ebc982a9a5bc5a964e0ce3608c310d467c8dd8809b20c36c2c5fa4f
NOTE: recipe python3-pycparser-2.22-r0: task do_create_spdx: Started
NOTE: Setscene tasks completed
NOTE: Running task 2366 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.8.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package: Started
NOTE: Running task 2367 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-iniconfig-2.1.0-r0: task do_package: Started
NOTE: recipe libunwind-1.8.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_install: Succeeded
NOTE: Running task 2368 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_package)
NOTE: recipe python3-pytz-2025.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libunwind-1.8.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2369 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_populate_sysroot)
NOTE: recipe python3-colorama-0.4.6-r0: task do_package: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2372 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.135.16.bb:do_collect_spdx_deps)
NOTE: recipe python3-pycparser-2.22-r0: task do_create_spdx: Succeeded
NOTE: Running task 2373 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.135.16.bb:do_populate_sysroot)
NOTE: recipe python3-pytz-2025.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-hypothesis-6.135.16-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-hypothesis-6.135.16-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_compile: Succeeded
NOTE: Running task 2374 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_install)
NOTE: recipe python3-hypothesis-6.135.16-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2375 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_collect_spdx_deps)
NOTE: recipe python3-pygments-2.19.2-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-hypothesis-6.135.16-r0: task do_package: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2376 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_populate_sysroot)
NOTE: Running task 2377 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.135.16.bb:do_packagedata)
NOTE: recipe python3-psutil-7.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2378 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.135.16-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2379 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-pretend-1.0.9-r0: task do_populate_sysroot: Started
NOTE: Running task 2380 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb:do_populate_sysroot)
NOTE: recipe python3-hypothesis-6.135.16-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-7.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2381 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_package: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_package: Succeeded
NOTE: Running task 2382 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_packagedata)
NOTE: Running task 2383 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_packagedata)
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.135.16-r0: task do_packagedata: Succeeded
NOTE: Running task 2384 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_populate_sysroot)
NOTE: recipe python3-psutil-7.0.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.135.16.bb:do_packagedata unihash changed to 59e1213919237cbbc868c87fc427d4af488fe36a94f8d1e3b56dc96eda1f447e
NOTE: recipe python3-pluggy-1.6.0-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_packagedata: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_packagedata unihash changed to 661ffed0d714e6f9c00a4918cbafdc71d22bfaf9800b511e5fb6545330bdb66b
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-iniconfig-2.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package: Succeeded
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_populate_sysroot: Started
NOTE: Setscene tasks completed
NOTE: Running task 2385 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_collect_spdx_deps)
NOTE: Running task 2386 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_packagedata)
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2387 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.1.0.bb:do_packagedata)
NOTE: Running task 2388 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_populate_sysroot)
NOTE: Running task 2389 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.4.1.bb:do_collect_spdx_deps)
NOTE: Running task 2390 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.4.1.bb:do_populate_sysroot)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-iniconfig-2.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pytest-8.4.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-8.4.1-r0: task do_populate_sysroot: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_packagedata unihash changed to 0f4ffb8c2b186d31917a852cf34ab3c6434bf3e51b4522d62eead8cdd6298465
NOTE: recipe python3-pytz-2025.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-iso8601-2.1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_packagedata unihash changed to cca2c089cc4f733f1d6ce06405b822d3c2b14bdd85460d5457385a3d00b574db
NOTE: recipe python3-pytest-8.4.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_package: Succeeded
NOTE: Running task 2391 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2392 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_packagedata)
NOTE: Running task 2393 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_populate_sysroot)
NOTE: recipe python3-iniconfig-2.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2394 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.1.0.bb:do_packagedata unihash changed to 0e6b10bb02a8c7fdb09ccba5e8c3353c4096f9c798b6f9de30deab5bbb955098
NOTE: recipe python3-psutil-7.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-7.0.0-r0: task do_populate_sysroot: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_packagedata unihash changed to 91ddaff3708119faf7e35a57fd93336dc56ed4d403345f378701dcce0d3f896d
NOTE: recipe python3-cffi-1.17.1-r0: task do_collect_spdx_deps: Started
NOTE: Setscene tasks completed
NOTE: Running task 2395 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_create_spdx)
NOTE: recipe python3-iso8601-2.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2397 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.135.16.bb:do_create_spdx)
NOTE: recipe python3-psutil-7.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2398 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_create_spdx)
NOTE: Running task 2399 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb:do_create_spdx)
NOTE: recipe python3-cffi-1.17.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2400 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_create_spdx)
NOTE: recipe python3-pytz-2025.2-r0: task do_create_spdx: Started
NOTE: Running task 2401 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_create_spdx)
NOTE: recipe python3-pytest-8.4.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.135.16-r0: task do_create_spdx: Started
NOTE: Running task 2402 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_package_write_ipk)
NOTE: recipe python3-pretend-1.0.9-r0: task do_create_spdx: Started
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_create_spdx: Started
NOTE: Running task 2403 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.4.1.bb:do_create_spdx)
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_create_spdx: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_packagedata unihash changed to e242accbab838a4ad9ef80f432308da7a9c4469fdbbb27fa545fa832e4b8e003
NOTE: recipe python3-iso8601-2.1.0-r0: task do_create_spdx: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_package_write_ipk: Started
NOTE: Setscene tasks completed
NOTE: Running task 2404 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_package_write_deb)
NOTE: recipe python3-pytest-8.4.1-r0: task do_create_spdx: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_install: Succeeded
NOTE: Running task 2405 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_package)
NOTE: recipe python3-psutil-7.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_package_write_deb: Started
NOTE: Running task 2406 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_create_spdx)
NOTE: recipe python3-pretend-1.0.9-r0: task do_create_spdx: Succeeded
NOTE: Running task 2407 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_package_write_rpm)
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-iso8601-2.1.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-hypothesis-6.135.16-r0: task do_create_spdx: Succeeded
NOTE: Running task 2408 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_package_qa)
NOTE: recipe python3-psutil-7.0.0-r0: task do_create_spdx: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_package: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2413 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.135.16.bb:do_package_write_ipk)
NOTE: Running task 2414 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.135.16.bb:do_package_write_deb)
NOTE: Running task 2415 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.135.16.bb:do_package_write_rpm)
NOTE: recipe python3-pytest-8.4.1-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_package_write_rpm: Started
NOTE: Running task 2416 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.135.16.bb:do_package_qa)
NOTE: recipe python3-pytz-2025.2-r0: task do_package_qa: Started
NOTE: Running task 2417 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package_write_ipk)
NOTE: recipe python3-hypothesis-6.135.16-r0: task do_package_write_ipk: Started
NOTE: recipe python3-hypothesis-6.135.16-r0: task do_package_write_deb: Started
NOTE: recipe python3-hypothesis-6.135.16-r0: task do_package_write_rpm: Started
NOTE: recipe python3-hypothesis-6.135.16-r0: task do_package_qa: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_ipk: Started
NOTE: recipe python3-psutil-7.0.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2418 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package_write_deb)
NOTE: recipe python3-pytz-2025.2-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_deb: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_package_write_ipk unihash changed to bb41bee26a923aa3c31b6e5359fb5b81f00716128905d04587de203a5c5f4ea7
NOTE: Running task 2419 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package_write_rpm)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-hypothesis-6.135.16-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.135.16.bb:do_package_write_ipk unihash changed to 7a67af637b90d42f8a653d5c0674ff378c0f45b7584a68e342434b6168d9a20f
NOTE: Running task 2420 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package_qa)
NOTE: recipe python3-hypothesis-6.135.16-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_package_write_deb unihash changed to 4b166c4955ae37190e30109486f8c0a424981393d08ddf02281bf4f9e7285704
NOTE: Running task 2421 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb:do_package_write_ipk)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package_write_ipk unihash changed to bd2c6297bbc77b4ed435a16aabd5373427a40f8f4eb4a44f0daaa407ad5af01e
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.135.16.bb:do_package_qa unihash changed to e3891cf337b538f2f558d49d7d56599bd33435c248fc67cc91bed458caef3a5f
NOTE: Running task 2422 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb:do_package_write_deb)
NOTE: Running task 2423 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb:do_package_write_rpm)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_qa: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_package_write_ipk: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package_write_deb unihash changed to 33c66bf59240d6ebc0e5bbaec9c6a0fd5ec0da685807328852d640d6b343aec0
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_package_qa unihash changed to b0be61f0a96e137669c5c6d07780fa4477a7b14a0996f7abb9414e08f0027fea
NOTE: Running task 2424 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb:do_package_qa)
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_package_write_deb: Started
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_package_write_rpm: Started
NOTE: Running task 2425 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_package_write_ipk)
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_package_qa: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_ipk: Started
NOTE: recipe python3-hypothesis-6.135.16-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.135.16.bb:do_package_write_rpm unihash changed to 69c453a6f0642eacbaa766b6b33cc663a2eebb7c9e7fce3db5cee2e6fa5bbc25
NOTE: Running task 2426 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_package_write_deb)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package_qa unihash changed to 60ab8ee81ac608f2f454dca3631886e7915da27a3199e68346f85fb6286e21fc
NOTE: Running task 2427 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_package_write_rpm)
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_deb: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package_write_rpm unihash changed to 24a788bd94d86c57926141f6b780973703d73c75afdac7357545b6f8ac82eabb
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_package_write_rpm unihash changed to 1a3ba726af506af483a12ad28265643c7805f0b7e6f84a0476d58bc57e5d266f
NOTE: Running task 2428 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_package_qa)
NOTE: Running task 2429 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_package_write_ipk)
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_qa: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb:do_package_write_ipk unihash changed to ece3c5fcd72d6a2d06686893315f75c78dc3f341d5a2c3a4576bf196141784a3
NOTE: Running task 2430 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_package_write_deb)
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_package_qa: Succeeded
NOTE: recipe python3-iso8601-2.1.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb:do_package_qa unihash changed to 316709d1eb4bbdd800680803472a58b53be05e5db31804aaca4acf02f568e647
NOTE: Running task 2431 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_package_write_rpm)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb:do_package_write_deb unihash changed to 8e31f980dc2b404b61988604ab23d81d553ee184afadd85eddce07327d0ce125
NOTE: Running task 2432 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_package_qa)
NOTE: recipe python3-iso8601-2.1.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-iso8601-2.1.0-r0: task do_package_write_rpm: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb:do_package_write_rpm unihash changed to 902c323422f76db5bf087b1b82f366d78b345100048a212d68416668964ed867
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-iso8601-2.1.0-r0: task do_package_qa: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_package_write_ipk unihash changed to 020d3fc83f8e7703c6a13b093ba40b5665a3a3fabf029d14e01d299ed33fc64a
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_package_write_deb unihash changed to 94f4af463a4e0bf9fe387c5190d784f5fa5cf5099e6b0bc5267e6a7fee7ba0ec
NOTE: recipe python3-iso8601-2.1.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_package_write_ipk unihash changed to 346a1be4a99a27b7fc68f5a0e263309d5f5fd7bacf949d1f59002f01b5e81e58
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_package_qa unihash changed to 0bc4bb2e6fb0ed8eeb8cd62ff456257e6bd9a74b11407b46dc14c61c89603068
NOTE: recipe python3-iso8601-2.1.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-iso8601-2.1.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-hypothesis-6.135.16-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_package_qa unihash changed to 8a49fc4e7b525568c7c13404136f1704dd853c0c442837de9c3c9986a49d456a
NOTE: recipe python3-cffi-1.17.1-r0: task do_compile: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_package_write_deb unihash changed to 6ee356b2352b9b2719cd0afa30161e06a2a610a645d919f599cbb6022ce55102
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.135.16.bb:do_package_write_deb unihash changed to 53f02ba9c79e11fbf7fb4ae94c2b7f8b2bd9a723b27c5d80e0a6b85b59f09f50
NOTE: Running task 2434 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_compile_ptest_base)
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_package_write_rpm unihash changed to 0e7853ef131e1caaf4eddf5f3e695d23dffe0e7b446c8e2fa6e083d14c21921b
NOTE: Setscene tasks completed
NOTE: recipe python3-cffi-1.17.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cffi-1.17.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2435 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_install)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_package_write_rpm unihash changed to 7dbc1b40d9e41c8129fdeaf287dee12aa2c858567bdfd2692896c784e0cde7c8
NOTE: recipe python3-cffi-1.17.1-r0: task do_install: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_package: Succeeded
NOTE: Running task 2436 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_packagedata)
NOTE: recipe python3-cffi-1.17.1-r0: task do_install: Succeeded
NOTE: Running task 2437 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_install_ptest_base)
NOTE: recipe python3-pygments-2.19.2-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.17.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-cffi-1.17.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2438 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_package)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_packagedata unihash changed to eb58b12ec73cef475dd44ee4f4c9d390067fa441d59ebf053978f0c5dff3de8e
NOTE: Setscene tasks completed
NOTE: Running task 2439 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_populate_sysroot)
NOTE: Running task 2440 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.4.1.bb:do_package_write_ipk)
NOTE: Running task 2441 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.4.1.bb:do_package_write_deb)
NOTE: Running task 2442 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.4.1.bb:do_package_write_rpm)
NOTE: recipe python3-cffi-1.17.1-r0: task do_package: Started
NOTE: Running task 2443 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.4.1.bb:do_package_qa)
NOTE: recipe python3-cffi-1.17.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pytest-8.4.1-r0: task do_package_write_ipk: Started
NOTE: recipe python3-pytest-8.4.1-r0: task do_package_write_deb: Started
NOTE: recipe python3-pytest-8.4.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytest-8.4.1-r0: task do_package_qa: Started
NOTE: recipe python3-cffi-1.17.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pytest-8.4.1-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.4.1.bb:do_package_write_ipk unihash changed to 4b57aa1142c8d30cb1c60461b8ef999a15b0e1d1ba3a06310116c6f885c67aa0
NOTE: recipe python3-pytest-8.4.1-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.4.1.bb:do_package_qa unihash changed to 4f51fb0abe4bd43c5b45c96a9975965bca4cab16ca20b7a77f7306bef2fc634e
NOTE: recipe python3-pytest-8.4.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.4.1.bb:do_package_write_rpm unihash changed to b981b49f060efee0077003d44c6393e17162471ac55f49577639d54ca0030e54
NOTE: recipe python3-pytest-8.4.1-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.4.1.bb:do_package_write_deb unihash changed to 6eecfed782fe5fded9f2dc1c49b3417fe8d7a4d8f44cd0bddd3ed3c17b20bb99
NOTE: recipe python3-cffi-1.17.1-r0: task do_package: Succeeded
NOTE: Running task 2444 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_packagedata)
NOTE: recipe python3-cffi-1.17.1-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.17.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_packagedata unihash changed to da86ba8cd01a6bcea6911d8de57e4bfba3f1d787de14411cbf377330a0e0f339
NOTE: Setscene tasks completed
NOTE: Running task 2445 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_create_spdx)
NOTE: Running task 2446 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_package_write_ipk)
NOTE: Running task 2447 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_package_write_deb)
NOTE: Running task 2448 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_package_write_rpm)
NOTE: Running task 2449 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_package_qa)
NOTE: recipe python3-cffi-1.17.1-r0: task do_create_spdx: Started
NOTE: recipe python3-cffi-1.17.1-r0: task do_package_write_ipk: Started
NOTE: recipe python3-cffi-1.17.1-r0: task do_package_write_deb: Started
NOTE: recipe python3-cffi-1.17.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-cffi-1.17.1-r0: task do_package_qa: Started
NOTE: recipe python3-cffi-1.17.1-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-cffi-1.17.1-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_package_write_ipk unihash changed to 5c9c877ae89d565e0c78d9752bbf78dca26886ad6bf5250a0fffb7fa58698d60
NOTE: recipe python3-cffi-1.17.1-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_package_qa unihash changed to 46e9c44e9b8ccdfde1f24f2f0bbf575097ca7cf93f819538cf093aaa7f0e5769
NOTE: recipe python3-cffi-1.17.1-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_package_write_deb unihash changed to 4b8c45c8a14ac8fd13740513d80e79978061ba2e3ba00a9a2cce1b4320fc38ba
NOTE: recipe python3-cffi-1.17.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_package_write_rpm unihash changed to e2f452ef43281a2f5f80d7997a7b7c1393edf2b43a9a0f5e2227c3a24e0b5dad
NOTE: recipe libunwind-1.8.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2450 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.8.2.bb:do_compile)
NOTE: recipe libunwind-1.8.2-r0: task do_compile: Started
NOTE: recipe procps-4.0.5-r0: task do_configure: Succeeded
NOTE: Running task 2451 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_compile)
NOTE: recipe procps-4.0.5-r0: task do_compile: Started
NOTE: recipe libunwind-1.8.2-r0: task do_compile: Succeeded
NOTE: Running task 2452 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.8.2.bb:do_install)
NOTE: recipe libunwind-1.8.2-r0: task do_install: Started
NOTE: recipe libunwind-1.8.2-r0: task do_install: Succeeded
NOTE: Running task 2454 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.8.2.bb:do_package)
NOTE: recipe libunwind-1.8.2-r0: task do_package: Started
NOTE: recipe libstd-rs-1.87.0-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2455 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.87.0.bb:do_patch)
NOTE: recipe libstd-rs-1.87.0-r0: task do_patch: Started
NOTE: recipe rust-native-1.87.0-r0: task do_install: Succeeded
NOTE: Running task 2456 of 2553 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.87.0.bb:do_populate_sysroot)
NOTE: recipe rust-native-1.87.0-r0: task do_populate_sysroot: Started
NOTE: recipe libstd-rs-1.87.0-r0: task do_patch: Succeeded
NOTE: Running task 2458 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.87.0.bb:do_rust_gen_targets)
NOTE: recipe libstd-rs-1.87.0-r0: task do_rust_gen_targets: Started
NOTE: recipe libstd-rs-1.87.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_compile: Succeeded
NOTE: Running task 2459 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_install)
NOTE: recipe procps-4.0.5-r0: task do_install: Started
NOTE: recipe libunwind-1.8.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.8.2.bb:do_package unihash changed to 9b37c93b0694ab1d369d5613351be623936c994b3df3fa39ff04602f322b7d18
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.8.2.bb:do_packagedata became valid
NOTE: Running setscene task 926 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.8.2.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2461 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.8.2.bb:do_create_spdx)
NOTE: recipe libunwind-1.8.2-r0: task do_create_spdx: Started
NOTE: recipe libunwind-1.8.2-r0: task do_create_spdx: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_install: Succeeded
NOTE: Running task 2462 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_package)
NOTE: recipe procps-4.0.5-r0: task do_package: Started
NOTE: recipe rust-native-1.87.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2463 of 2553 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.87.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2464 of 2553 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.87.0.bb:do_create_spdx)
NOTE: recipe cargo-native-1.87.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rust-native-1.87.0-r0: task do_create_spdx: Started
NOTE: recipe cargo-native-1.87.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2465 of 2553 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.87.0.bb:do_rust_create_wrappers)
NOTE: recipe cargo-native-1.87.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe rust-native-1.87.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2466 of 2553 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.87.0.bb:do_collect_spdx_deps)
NOTE: recipe cargo-native-1.87.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 2467 of 2553 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.87.0.bb:do_configure)
NOTE: recipe cargo-native-1.87.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe cargo-native-1.87.0-r0: task do_configure: Started
NOTE: recipe cargo-native-1.87.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe cargo-native-1.87.0-r0: task do_configure: Succeeded
NOTE: Running task 2468 of 2553 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.87.0.bb:do_compile)
NOTE: recipe cargo-native-1.87.0-r0: task do_compile: Started
NOTE: recipe cargo-native-1.87.0-r0: task do_compile: Succeeded
NOTE: Running task 2469 of 2553 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.87.0.bb:do_install)
NOTE: recipe cargo-native-1.87.0-r0: task do_install: Started
NOTE: recipe cargo-native-1.87.0-r0: task do_install: Succeeded
NOTE: Running task 2470 of 2553 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.87.0.bb:do_populate_sysroot)
NOTE: recipe cargo-native-1.87.0-r0: task do_populate_sysroot: Started
NOTE: recipe procps-4.0.5-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_package unihash changed to 4365cfafa7d26786f73215e30caeccbc27b51833372ede87c5158d1c23dd3a4a
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_packagedata became valid
NOTE: Running setscene task 926 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_packagedata_setscene)
NOTE: recipe procps-4.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe cargo-native-1.87.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2472 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_package_write_ipk)
NOTE: Running task 2473 of 2553 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2474 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.87.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2475 of 2553 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.87.0.bb:do_create_spdx)
NOTE: Running task 2476 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_package_write_deb)
NOTE: Running task 2477 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_package_write_rpm)
NOTE: Running task 2478 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_package_qa)
NOTE: recipe python3-psutil-7.0.0-r0: task do_package_write_ipk: Started
NOTE: recipe libstd-rs-1.87.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-rust-native-1.11.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-psutil-7.0.0-r0: task do_package_write_deb: Started
NOTE: recipe cargo-native-1.87.0-r0: task do_create_spdx: Started
NOTE: recipe python3-psutil-7.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-psutil-7.0.0-r0: task do_package_qa: Started
NOTE: recipe python3-setuptools-rust-native-1.11.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2479 of 2553 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb:do_rust_create_wrappers)
NOTE: recipe python3-setuptools-rust-native-1.11.1-r0: task do_rust_create_wrappers: Started
NOTE: recipe cargo-native-1.87.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2480 of 2553 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb:do_collect_spdx_deps)
NOTE: Running task 2481 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.87.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-setuptools-rust-native-1.11.1-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 2482 of 2553 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb:do_configure)
NOTE: recipe libstd-rs-1.87.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2483 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.87.0.bb:do_rust_create_wrappers)
NOTE: recipe libstd-rs-1.87.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-setuptools-rust-native-1.11.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-setuptools-rust-native-1.11.1-r0: task do_configure: Started
NOTE: recipe python3-setuptools-rust-native-1.11.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libstd-rs-1.87.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe libstd-rs-1.87.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-psutil-7.0.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_package_write_ipk unihash changed to 97b423369b3d81395135ed112bac7000ae4fcdd73d0161ae6e50934ee7971464
NOTE: recipe python3-setuptools-rust-native-1.11.1-r0: task do_configure: Succeeded
NOTE: Running task 2484 of 2553 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb:do_compile)
NOTE: recipe libstd-rs-1.87.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe python3-psutil-7.0.0-r0: task do_package_qa: Succeeded
NOTE: Running task 2485 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.87.0.bb:do_configure)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_package_qa unihash changed to 27b9d440ba25f6029ab0e11da81e3da1b65a4e00164ae38d9b38109b811ffa4b
NOTE: recipe python3-setuptools-rust-native-1.11.1-r0: task do_compile: Started
NOTE: recipe libstd-rs-1.87.0-r0: task do_configure: Started
NOTE: recipe python3-psutil-7.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_package_write_rpm unihash changed to 2aca8ba3d9b9d4d2efc2df1cd52c10fbb40ffd48c7bcfa79fae69d9db406519d
NOTE: recipe libstd-rs-1.87.0-r0: task do_configure: Succeeded
NOTE: recipe python3-psutil-7.0.0-r0: task do_package_write_deb: Succeeded
NOTE: Running task 2486 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.87.0.bb:do_compile)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_package_write_deb unihash changed to f2994dc0a814cb989173faf05c97bdad5594c1bad7dac09694970d82721ca11d
NOTE: recipe libstd-rs-1.87.0-r0: task do_compile: Started
NOTE: recipe python3-setuptools-rust-native-1.11.1-r0: task do_compile: Succeeded
NOTE: Running task 2487 of 2553 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb:do_install)
NOTE: recipe python3-setuptools-rust-native-1.11.1-r0: task do_install: Started
NOTE: recipe python3-setuptools-rust-native-1.11.1-r0: task do_install: Succeeded
NOTE: Running task 2488 of 2553 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb:do_populate_sysroot)
NOTE: recipe python3-setuptools-rust-native-1.11.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-setuptools-rust-native-1.11.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2489 of 2553 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-maturin_1.9.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2490 of 2553 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb:do_create_spdx)
NOTE: recipe python3-setuptools-rust-native-1.11.1-r0: task do_create_spdx: Started
NOTE: recipe python3-maturin-native-1.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-rust-native-1.11.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2491 of 2553 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-maturin_1.9.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-maturin-native-1.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2492 of 2553 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-maturin_1.9.0.bb:do_rust_create_wrappers)
NOTE: recipe python3-maturin-native-1.9.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-maturin-native-1.9.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-maturin-native-1.9.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-maturin-native-1.9.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 2493 of 2553 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-maturin_1.9.0.bb:do_configure)
NOTE: recipe python3-maturin-native-1.9.0-r0: task do_configure: Started
NOTE: recipe python3-maturin-native-1.9.0-r0: task do_configure: Succeeded
NOTE: Running task 2494 of 2553 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-maturin_1.9.0.bb:do_compile)
NOTE: recipe python3-maturin-native-1.9.0-r0: task do_compile: Started
NOTE: recipe python3-maturin-native-1.9.0-r0: task do_compile: Succeeded
NOTE: Running task 2495 of 2553 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-maturin_1.9.0.bb:do_install)
NOTE: recipe python3-maturin-native-1.9.0-r0: task do_install: Started
NOTE: recipe python3-maturin-native-1.9.0-r0: task do_install: Succeeded
NOTE: Running task 2496 of 2553 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-maturin_1.9.0.bb:do_populate_sysroot)
NOTE: recipe python3-maturin-native-1.9.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-maturin-native-1.9.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2497 of 2553 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-maturin_1.9.0.bb:do_create_spdx)
NOTE: recipe python3-maturin-native-1.9.0-r0: task do_create_spdx: Started
NOTE: recipe python3-maturin-native-1.9.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libstd-rs-1.87.0-r0: task do_compile: Succeeded
NOTE: Running task 2498 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.87.0.bb:do_install)
NOTE: recipe libstd-rs-1.87.0-r0: task do_install: Started
NOTE: recipe libstd-rs-1.87.0-r0: task do_install: Succeeded
NOTE: Running task 2499 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.87.0.bb:do_populate_sysroot)
NOTE: Running task 2500 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.87.0.bb:do_package)
NOTE: recipe libstd-rs-1.87.0-r0: task do_populate_sysroot: Started
NOTE: recipe libstd-rs-1.87.0-r0: task do_package: Started
NOTE: recipe libstd-rs-1.87.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.87.0.bb:do_populate_sysroot unihash changed to c257ccdbb4145be2aae8833dbc9af214710590700810f5fa21a94b04ab52c454
NOTE: Setscene tasks completed
NOTE: Running task 2501 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2502 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-45.0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-45.0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2503 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_rust_create_wrappers)
NOTE: Running task 2504 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_rust_create_wrappers)
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-cryptography-45.0.5-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-cryptography-45.0.5-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 2505 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_configure)
NOTE: Running task 2506 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_configure)
NOTE: recipe python3-cryptography-45.0.5-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_configure: Started
NOTE: recipe python3-cryptography-45.0.5-r0: task do_configure: Succeeded
NOTE: Running task 2507 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_configure_ptest_base)
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2508 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_configure_ptest_base)
NOTE: recipe libstd-rs-1.87.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.87.0.bb:do_package unihash changed to 6f2dee8f9290f46ee496c1acdfe1b8e92487af5060d1369e41a030193f6b7f47
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.87.0.bb:do_packagedata became valid
NOTE: recipe python3-cryptography-45.0.5-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-cryptography-45.0.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running setscene task 926 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.87.0.bb:do_packagedata_setscene)
NOTE: Running task 2509 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_compile)
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2510 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_compile)
NOTE: recipe libstd-rs-1.87.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-45.0.5-r0: task do_compile: Started
NOTE: recipe libstd-rs-1.87.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_compile: Started
NOTE: Setscene tasks completed
NOTE: Running task 2512 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.87.0.bb:do_create_spdx)
NOTE: recipe libstd-rs-1.87.0-r0: task do_create_spdx: Started
NOTE: recipe libstd-rs-1.87.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2513 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_collect_spdx_deps)
NOTE: Running task 2514 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-cryptography-45.0.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-cryptography-45.0.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2515 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_compile_ptest_base)
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2516 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_install)
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_install: Started
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_install: Succeeded
NOTE: Running task 2517 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_install_ptest_base)
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2518 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_package)
NOTE: Running task 2519 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_populate_sysroot)
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_package: Started
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_package: Succeeded
NOTE: Running task 2520 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_packagedata)
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_packagedata unihash changed to 7e65d66e0fa8e07f070818dccace0e80effd3affff38fe688d5be97a4be1d379
NOTE: Setscene tasks completed
NOTE: Running task 2521 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_create_spdx)
NOTE: Running task 2522 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_package_write_ipk)
NOTE: Running task 2523 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_package_write_deb)
NOTE: Running task 2524 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_package_write_rpm)
NOTE: Running task 2525 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_package_qa)
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_create_spdx: Started
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_package_qa: Started
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_package_write_ipk unihash changed to abce990a42b0cc3ebb2a77b33f06abc6a37053c44550f96c946b1a029b3d618a
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_package_qa unihash changed to 11130fa4d8418043389fbfcfb33788659b4c58d6524ed7a5aa1b7ff3c25ad570
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_package_write_deb unihash changed to 22ea3e129e038c09033690f770b78b2066d943617be292754620445b853c12e0
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_package_write_rpm unihash changed to 2772eeea9d51986c7f6b0ccb121983f84e1cd7df0886ddb54837e9fa84694387
NOTE: recipe python3-cryptography-45.0.5-r0: task do_compile: Succeeded
NOTE: Running task 2526 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_compile_ptest_base)
NOTE: recipe python3-cryptography-45.0.5-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-cryptography-45.0.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2527 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_install)
NOTE: recipe python3-cryptography-45.0.5-r0: task do_install: Started
NOTE: recipe python3-cryptography-45.0.5-r0: task do_install: Succeeded
NOTE: Running task 2528 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_install_ptest_base)
NOTE: recipe python3-cryptography-45.0.5-r0: task do_install_ptest_base: Started
NOTE: recipe python3-cryptography-45.0.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2529 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_package)
NOTE: Running task 2530 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_populate_sysroot)
NOTE: recipe python3-cryptography-45.0.5-r0: task do_populate_sysroot: Started
NOTE: recipe python3-cryptography-45.0.5-r0: task do_package: Started
NOTE: recipe python3-cryptography-45.0.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2531 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2532 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_configure: Succeeded
NOTE: Running task 2533 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_compile: Started
NOTE: recipe python3-cryptography-45.0.5-r0: task do_package: Succeeded
NOTE: Running task 2534 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_packagedata)
NOTE: recipe python3-cryptography-45.0.5-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-45.0.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2535 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_create_spdx)
NOTE: recipe python3-cryptography-45.0.5-r0: task do_create_spdx: Started
NOTE: recipe python3-cryptography-45.0.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 2536 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_collect_spdx_deps)
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_compile: Succeeded
NOTE: Running task 2537 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_install)
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_install: Started
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_install: Succeeded
NOTE: Running task 2538 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_package)
NOTE: Running task 2539 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_populate_sysroot)
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_populate_sysroot: Started
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_package: Started
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_package: Succeeded
NOTE: Running task 2540 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_packagedata)
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2541 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_create_spdx)
NOTE: Running task 2542 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_package_write_ipk)
NOTE: Running task 2543 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_package_write_deb)
NOTE: Running task 2544 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_package_write_rpm)
NOTE: Running task 2545 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_package_qa)
NOTE: Running task 2546 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_package_write_ipk)
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_create_spdx: Started
NOTE: Running task 2547 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_package_write_deb)
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_package_write_ipk: Started
NOTE: Running task 2548 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_package_write_rpm)
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_package_write_deb: Started
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_package_write_rpm: Started
NOTE: Running task 2549 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_package_qa)
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_package_qa: Started
NOTE: recipe python3-cryptography-45.0.5-r0: task do_package_write_ipk: Started
NOTE: recipe python3-cryptography-45.0.5-r0: task do_package_write_deb: Started
NOTE: recipe python3-cryptography-45.0.5-r0: task do_package_write_rpm: Started
NOTE: recipe python3-cryptography-45.0.5-r0: task do_package_qa: Started
NOTE: recipe python3-cryptography-45.0.5-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-cryptography-45.0.5-r0: task do_package_qa: Succeeded
NOTE: recipe python3-cryptography-45.0.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 2550 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_create_package_spdx)
NOTE: Running task 2551 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_create_package_spdx)
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_create_package_spdx: Started
NOTE: recipe python3-cryptography-45.0.5-r0: task do_create_package_spdx: Started
NOTE: recipe python3-cryptography-45.0.5-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_package_qa: Succeeded
NOTE: recipe python3-cryptography-45.0.5-r0: task do_create_package_spdx: Succeeded
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_create_package_spdx: Succeeded
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 2552 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_build)
NOTE: Running noexec task 2553 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_build)
NOTE: Tasks Summary: Attempted 2553 tasks of which 2179 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: util-linux-libuuid-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-src went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-dbg went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-staticdev went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-dev went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-doc went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-locale went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.41-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4077937844388718712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-cryptography-vectors: PV changed from "45.0.4" to "45.0.5"
packages/core2-64-poky-linux/python3-cryptography-vectors: PKGV changed from 45.0.4 [default] to 45.0.5 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-45.0.4.tar.gz;downloadfilename=cryptography_vectors-45.0.4.tar.gz" to "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-45.0.5.tar.gz;downloadfilename=cryptography_vectors-45.0.5.tar.gz"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PV changed from "45.0.4" to "45.0.5"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PKGV changed from 45.0.4 [default] to 45.0.5 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PV changed from "45.0.4" to "45.0.5"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PKGV changed from 45.0.4 [default] to 45.0.5 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PV changed from "45.0.4" to "45.0.5"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PKGV changed from 45.0.4 [default] to 45.0.5 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PV changed from "45.0.4" to "45.0.5"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PKGV changed from 45.0.4 [default] to 45.0.5 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PV changed from "45.0.4" to "45.0.5"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PKGV changed from 45.0.4 [default] to 45.0.5 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PV changed from "45.0.4" to "45.0.5"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PKGV changed from 45.0.4 [default] to 45.0.5 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PV changed from "45.0.4" to "45.0.5"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PKGV changed from 45.0.4 [default] to 45.0.5 [default]
Changes to packages/core2-64-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.13/site-packages/cryptography_vectors-45.0.4.dist-info moved to /usr/lib/python3.13/site-packages/cryptography_vectors-45.0.5.dist-info
packages/core2-64-poky-linux/python3-cryptography: PV changed from "45.0.4" to "45.0.5"
packages/core2-64-poky-linux/python3-cryptography: PKGV changed from 45.0.4 [default] to 45.0.5 [default]
packages/core2-64-poky-linux/python3-cryptography: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cryptography/cryptography-45.0.4.tar.gz;downloadfilename=cryptography-45.0.4.tar.gz file://0001-pyproject.toml-remove-benchmark-disable-option.patch file://check-memfree.py file://run-ptest crate://crates.io/asn1/0.21.3 crate://crates.io/asn1_derive/0.21.3 crate://crates.io/autocfg/1.4.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/2.9.1 crate://crates.io/cc/1.2.23 crate://crates.io/cfg-if/1.0.0 crate://crates.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shared/0.1.1 crate://crates.io/heck/0.5.0 crate://crates.io/indoc/2.0.6 crate://crates.io/itoa/1.0.15 crate://crates.io/libc/0.2.172 crate://crates.io/memoffset/0.9.1 crate://crates.io/once_cell/1.21.3 crate://crates.io/openssl/0.10.72 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-sys/0.9.108 crate://crates.io/pem/3.0.5 crate://crates.io/pkg-config/0.3.32 crate://crates.i
 o/portable-atomic/1.11.0 crate://crates.io/proc-macro2/1.0.95 crate://crates.io/pyo3/0.25.0 crate://crates.io/pyo3-build-config/0.25.0 crate://crates.io/pyo3-ffi/0.25.0 crate://crates.io/pyo3-macros/0.25.0 crate://crates.io/pyo3-macros-backend/0.25.0 crate://crates.io/quote/1.0.40 crate://crates.io/self_cell/1.2.0 crate://crates.io/shlex/1.3.0 crate://crates.io/syn/2.0.101 crate://crates.io/target-lexicon/0.13.2 crate://crates.io/unicode-ident/1.0.18 crate://crates.io/unindent/0.2.4 crate://crates.io/vcpkg/0.2.15" to "https://files.pythonhosted.org/packages/source/c/cryptography/cryptography-45.0.5.tar.gz;downloadfilename=cryptography-45.0.5.tar.gz file://0001-pyproject.toml-remove-benchmark-disable-option.patch file://check-memfree.py file://run-ptest crate://crates.io/asn1/0.21.3 crate://crates.io/asn1_derive/0.21.3 crate://crates.io/autocfg/1.4.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/2.9.1 crate://crates.io/cc/1.2.23 crate://crates.io/cfg-if/1.0.0 crate://cra
 tes.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shared/0.1.1 crate://crates.io/heck/0.5.0 crate://crates.io/indoc/2.0.6 crate://crates.io/itoa/1.0.15 crate://crates.io/libc/0.2.172 crate://crates.io/memoffset/0.9.1 crate://crates.io/once_cell/1.21.3 crate://crates.io/openssl/0.10.72 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-sys/0.9.108 crate://crates.io/pem/3.0.5 crate://crates.io/pkg-config/0.3.32 crate://crates.io/portable-atomic/1.11.0 crate://crates.io/proc-macro2/1.0.95 crate://crates.io/pyo3/0.25.0 crate://crates.io/pyo3-build-config/0.25.0 crate://crates.io/pyo3-ffi/0.25.0 crate://crates.io/pyo3-macros/0.25.0 crate://crates.io/pyo3-macros-backend/0.25.0 crate://crates.io/quote/1.0.40 crate://crates.io/self_cell/1.2.0 crate://crates.io/shlex/1.3.0 crate://crates.io/syn/2.0.101 crate://crates.io/target-lexicon/0.13.2 crate://crates.io/unicode-ident/1.0.18 crate://crates.io/unindent/0.2.4 crate://crates.io/vcpkg/0.2.15"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-dbg: PV changed from "45.0.4" to "45.0.5"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-dbg: PKGV changed from 45.0.4 [default] to 45.0.5 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-dbg: PKGSIZE changed from 1174048 to 1174288 (+0%)
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-dev: PV changed from "45.0.4" to "45.0.5"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-dev: PKGV changed from 45.0.4 [default] to 45.0.5 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-doc: PV changed from "45.0.4" to "45.0.5"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-doc: PKGV changed from 45.0.4 [default] to 45.0.5 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-locale: PV changed from "45.0.4" to "45.0.5"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-locale: PKGV changed from 45.0.4 [default] to 45.0.5 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-ptest: PV changed from "45.0.4" to "45.0.5"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-ptest: PKGV changed from 45.0.4 [default] to 45.0.5 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-src: PV changed from "45.0.4" to "45.0.5"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-src: PKGV changed from 45.0.4 [default] to 45.0.5 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-staticdev: PV changed from "45.0.4" to "45.0.5"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-staticdev: PKGV changed from 45.0.4 [default] to 45.0.5 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography: PV changed from "45.0.4" to "45.0.5"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography: PKGV changed from 45.0.4 [default] to 45.0.5 [default]
Changes to packages/core2-64-poky-linux/python3-cryptography (sysroot):
  /usr/lib/python3.13/site-packages/cryptography-45.0.4.dist-info moved to /usr/lib/python3.13/site-packages/cryptography-45.0.5.dist-info

--===============4077937844388718712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.13/site-packages/cryptography_vectors-45.0.4.dist-info moved to /usr/lib/python3.13/site-packages/cryptography_vectors-45.0.5.dist-info
Changes to packages/core2-64-poky-linux/python3-cryptography (sysroot):
  /usr/lib/python3.13/site-packages/cryptography-45.0.4.dist-info moved to /usr/lib/python3.13/site-packages/cryptography-45.0.5.dist-info

--===============4077937844388718712==--

