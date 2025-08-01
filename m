Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8B24CA0ECA
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:07:49 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.88799.1754057265782008253
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:07:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=hOBL6ssA;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=r6zntfjj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019865f5cd03-f00be852-24b2-4fb6-a38d-fd25ff9f3eff-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1754057265;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RF5TsOGOccWIX6+hzx3FO9shwMK0Z+6KBIpuemzCXMk=;
	b=hOBL6ssAtVsPYOsjXoMivvqddzTr7ZjXFY4NB39Qy+4coysZUeWf30VwQn/639I6
	fNaeEQ31/HVfPSNz2eTEZsDuwr88VCRVWHo/o7R2hcbOMt2ClGeZLTA9u7OQdFJyXMP
	Ar7J05GXWeSm6uQK1JcPmP5HOqg04V+GOSQ/a7Sw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1754057265;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RF5TsOGOccWIX6+hzx3FO9shwMK0Z+6KBIpuemzCXMk=;
	b=r6zntfjjOTgn36xa5eedGLQts3wtLAnEX1Jc3t0Tcwh8RD1x2tNeG0Yy3fksP1rc
	e9fTaL5DUpbYfaNrks/gTMDUUfuSyJwGvvSKHUsVHRbsrIYrZq9Uhmaj4/uao8ajQr8
	I3vHqQv+VBIkspXNeaITuM0harxfcT3bQawye930=
Content-Type: multipart/mixed; boundary="===============3264349900920454997=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>, 
	Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cryptography,python3-cryptography-vectors: upgrading to
 45.0.5,45.0.5 SUCCEEDED
Message-ID: <0101019865f5cd03-f00be852-24b2-4fb6-a38d-fd25ff9f3eff-000000@us-west-2.amazonses.com>
Date: Fri, 1 Aug 2025 14:07:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:07:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221252

--===============3264349900920454997==
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
From 1864677df26316d36f5fb5a4bceb15680c4ffad6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Aug 2025 06:39:43 +0000
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
index e238717208..d431e6cf24 100644
--- a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
@@ -1,4 +1,4 @@
-From baa3c56b87ceaea331811a0a4642991cbb12e6ea Mon Sep 17 00:00:00 2001
+From b7f0183dfbc7acac5c8d45a9a16172d2ad5844a4 Mon Sep 17 00:00:00 2001
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


--===============3264349900920454997==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cryptography-python3-cryptography-vectors-up.patch"

RnJvbSAxODY0Njc3ZGYyNjMxNmQzNmY1ZmI1YTRiY2ViMTU2ODBjNGZmYWQ2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBBdWcgMjAyNSAwNjozOTo0MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtY3J5cHRvZ3JhcGh5LHB5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnM6IHVwZ3JhZGUK
IDQ1LjAuNCAtPiA0NS4wLjUsNDUuMC40IC0+IDQ1LjAuNQoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LWNvbW1vbi5pbmMgIHwgMiArLQogbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzLmJi
ICB8IDIgKy0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFw
aHkuYmIgICAgICAgICAgfCAyICstCiAuLi4vMDAwMS1weXByb2plY3QudG9tbC1yZW1vdmUtYmVu
Y2htYXJrLWRpc2FibGUtb3B0aW9uLnBhdGNoIHwgNCArKy0tCiA0IGZpbGVzIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LWNvbW1vbi5pbmMgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LWNvbW1vbi5pbmMKaW5k
ZXggNWNlMjQ4NWVkNS4uMTRmODQwZWYyZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS1jb21tb24uaW5jCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktY29tbW9uLmluYwpAQCAt
Myw0ICszLDQgQEAKICMKICMgQWRkaXRpb25hbGx5IEFVSCB3aWxsIGRldGVjdCB0aGF0IHRoZXkg
c2hhcmUgdGhpcyAuaW5jIGZpbGUgYW5kCiAjIHBlcmZvcm0gYSBsb2Nrc3RlcCB1cGdyYWRlIGZv
ciBib3RoLgotUFYgPSAiNDUuMC40IgorUFYgPSAiNDUuMC41IgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzLmJiIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3Jz
LmJiCmluZGV4IGE4ZjhkMGNkMTcuLjM2OTliNDk5YWEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9ycy5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnMu
YmIKQEAgLTksNyArOSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1
PThjMzYxN2RiNGZiNmZhZTAxZjFkMjUzYWI5MTUxMWU0IFwKICMgTk9URTogTWFrZSBzdXJlIHRv
IGtlZXAgdGhpcyByZWNpcGUgYXQgdGhlIHNhbWUgdmVyc2lvbiBhcyBweXRob24zLWNyeXB0b2dy
YXBoeQogIyAgICAgICBVcGdyYWRlIGJvdGggcmVjaXBlcyBhdCB0aGUgc2FtZSB0aW1lCiByZXF1
aXJlIHB5dGhvbjMtY3J5cHRvZ3JhcGh5LWNvbW1vbi5pbmMKLVNSQ19VUklbc2hhMjU2c3VtXSA9
ICJmYmIwNDA4ZGY4ZmYyZDJiM2RiZDI5MjhiYzViN2ZlZWJmZGQzNmZiMDkyZmE4NzkwZDU3Nzhh
OWI5YTFmOWVmIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjFiOWUyYzFlZTk0ZTZiMjUzYTAzZmMw
ZmQ3NDlkNjcyZmY2ZTFlNDhlNTBkZDdhZjIzMzRmZGUwMzAzZmJiZTciCiAKIFBZUElfUEFDS0FH
RSA9ICJjcnlwdG9ncmFwaHlfdmVjdG9ycyIKIFVQU1RSRUFNX0NIRUNLX1BZUElfUEFDS0FHRSA9
ICIke1BZUElfUEFDS0FHRX0iCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWNyeXB0b2dyYXBoeS5iYgppbmRleCBmNDFlMTNmNGExLi5iYzhlN2ZmZmIwIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3Jh
cGh5LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9n
cmFwaHkuYmIKQEAgLTExLDcgKzExLDcgQEAgTERTSEFSRUQgKz0gIi1wdGhyZWFkIgogIyBOT1RF
OiBNYWtlIHN1cmUgdG8ga2VlcCB0aGlzIHJlY2lwZSBhdCB0aGUgc2FtZSB2ZXJzaW9uIGFzIHB5
dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnMKICMgICAgICAgVXBncmFkZSBib3RoIHJlY2lwZXMg
YXQgdGhlIHNhbWUgdGltZQogcmVxdWlyZSBweXRob24zLWNyeXB0b2dyYXBoeS1jb21tb24uaW5j
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNzQwNWFkZTg1YzgzYzM3NjgyYzhmZTY1NTU0NzU5ODAw
YTRhOGM1NGIyZDk2ZTBmOGFkMTE0ZDMxYjgwOGQ1NyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI3
MmU3NmNhYTAwNGFiNjNhY2NkZjI2MDIzZmNjZDFkMDg3ZjZkOTBlYzYwNDhmZjMzYWQwNDQ1YWJm
N2Y2MDVhIgogCiBTUkNfVVJJICs9ICJmaWxlOi8vMDAwMS1weXByb2plY3QudG9tbC1yZW1vdmUt
YmVuY2htYXJrLWRpc2FibGUtb3B0aW9uLnBhdGNoIFwKICAgICAgICAgICAgIGZpbGU6Ly9jaGVj
ay1tZW1mcmVlLnB5IFwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1jcnlwdG9ncmFwaHkvMDAwMS1weXByb2plY3QudG9tbC1yZW1vdmUtYmVuY2htYXJr
LWRpc2FibGUtb3B0aW9uLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLWNyeXB0b2dyYXBoeS8wMDAxLXB5cHJvamVjdC50b21sLXJlbW92ZS1iZW5jaG1hcmstZGlz
YWJsZS1vcHRpb24ucGF0Y2gKaW5kZXggZTIzODcxNzIwOC4uZDQzMWU2Y2YyNCAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS8wMDAx
LXB5cHJvamVjdC50b21sLXJlbW92ZS1iZW5jaG1hcmstZGlzYWJsZS1vcHRpb24ucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS8wMDAx
LXB5cHJvamVjdC50b21sLXJlbW92ZS1iZW5jaG1hcmstZGlzYWJsZS1vcHRpb24ucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIGJhYTNjNTZiODdjZWFlYTMzMTgxMWEwYTQ2NDI5OTFjYmIxMmU2
ZWEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGI3ZjAxODNkZmJjN2FjYWM1YzhkNDVh
OWExNjE3MmQyYWQ1ODQ0YTQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBNaW5nbGkg
WXUgPG1pbmdsaS55dUB3aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCAxNyBNYXkgMjAyMiAxNzoy
Mjo0OCArMDgwMAogU3ViamVjdDogW1BBVENIXSBweXByb2plY3QudG9tbDogcmVtb3ZlIC0tYmVu
Y2htYXJrLWRpc2FibGUgb3B0aW9uCkBAIC0yNiw3ICsyNiw3IEBAIFNpZ25lZC1vZmYtYnk6IFRp
bSBPcmxpbmcgPHRpbS5vcmxpbmdAa29uc3Vsa28uY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvcHlwcm9qZWN0LnRvbWwg
Yi9weXByb2plY3QudG9tbAotaW5kZXggZDllZjcwNC4uODc4YjcyMCAxMDA2NDQKK2luZGV4IGIx
ZjZmYjMuLmM4MDA3YjAgMTAwNjQ0CiAtLS0gYS9weXByb2plY3QudG9tbAogKysrIGIvcHlwcm9q
ZWN0LnRvbWwKIEBAIC0xMjksNyArMTI5LDcgQEAgZXhjbHVkZSA9IFsKLS0gCjIuNDcuMQoK

--===============3264349900920454997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-cryptography-vectors: PV changed from "45.0.4" to "45.0.5"
packages/core2-64-poky-linux/python3-cryptography-vectors: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-45.0.4.tar.gz;downloadfilename=cryptography_vectors-45.0.4.tar.gz" to "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-45.0.5.tar.gz;downloadfilename=cryptography_vectors-45.0.5.tar.gz"
packages/core2-64-poky-linux/python3-cryptography-vectors: PKGV changed from 45.0.4 [default] to 45.0.5 [default]
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
packages/core2-64-poky-linux/python3-cryptography: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cryptography/cryptography-45.0.4.tar.gz;downloadfilename=cryptography-45.0.4.tar.gz file://0001-pyproject.toml-remove-benchmark-disable-option.patch file://check-memfree.py file://run-ptest crate://crates.io/asn1/0.21.3 crate://crates.io/asn1_derive/0.21.3 crate://crates.io/autocfg/1.4.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/2.9.1 crate://crates.io/cc/1.2.23 crate://crates.io/cfg-if/1.0.0 crate://crates.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shared/0.1.1 crate://crates.io/heck/0.5.0 crate://crates.io/indoc/2.0.6 crate://crates.io/itoa/1.0.15 crate://crates.io/libc/0.2.172 crate://crates.io/memoffset/0.9.1 crate://crates.io/once_cell/1.21.3 crate://crates.io/openssl/0.10.72 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-sys/0.9.108 crate://crates.io/pem/3.0.5 crate://crates.io/pkg-config/0.3.32 crate://crates.i
 o/portable-atomic/1.11.0 crate://crates.io/proc-macro2/1.0.95 crate://crates.io/pyo3/0.25.0 crate://crates.io/pyo3-build-config/0.25.0 crate://crates.io/pyo3-ffi/0.25.0 crate://crates.io/pyo3-macros/0.25.0 crate://crates.io/pyo3-macros-backend/0.25.0 crate://crates.io/quote/1.0.40 crate://crates.io/self_cell/1.2.0 crate://crates.io/shlex/1.3.0 crate://crates.io/syn/2.0.101 crate://crates.io/target-lexicon/0.13.2 crate://crates.io/unicode-ident/1.0.18 crate://crates.io/unindent/0.2.4 crate://crates.io/vcpkg/0.2.15" to "https://files.pythonhosted.org/packages/source/c/cryptography/cryptography-45.0.5.tar.gz;downloadfilename=cryptography-45.0.5.tar.gz file://0001-pyproject.toml-remove-benchmark-disable-option.patch file://check-memfree.py file://run-ptest crate://crates.io/asn1/0.21.3 crate://crates.io/asn1_derive/0.21.3 crate://crates.io/autocfg/1.4.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/2.9.1 crate://crates.io/cc/1.2.23 crate://crates.io/cfg-if/1.0.0 crate://cra
 tes.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shared/0.1.1 crate://crates.io/heck/0.5.0 crate://crates.io/indoc/2.0.6 crate://crates.io/itoa/1.0.15 crate://crates.io/libc/0.2.172 crate://crates.io/memoffset/0.9.1 crate://crates.io/once_cell/1.21.3 crate://crates.io/openssl/0.10.72 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-sys/0.9.108 crate://crates.io/pem/3.0.5 crate://crates.io/pkg-config/0.3.32 crate://crates.io/portable-atomic/1.11.0 crate://crates.io/proc-macro2/1.0.95 crate://crates.io/pyo3/0.25.0 crate://crates.io/pyo3-build-config/0.25.0 crate://crates.io/pyo3-ffi/0.25.0 crate://crates.io/pyo3-macros/0.25.0 crate://crates.io/pyo3-macros-backend/0.25.0 crate://crates.io/quote/1.0.40 crate://crates.io/self_cell/1.2.0 crate://crates.io/shlex/1.3.0 crate://crates.io/syn/2.0.101 crate://crates.io/target-lexicon/0.13.2 crate://crates.io/unicode-ident/1.0.18 crate://crates.io/unindent/0.2.4 crate://crates.io/vcpkg/0.2.15"
packages/core2-64-poky-linux/python3-cryptography: PKGV changed from 45.0.4 [default] to 45.0.5 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-dbg: PV changed from "45.0.4" to "45.0.5"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-dbg: PKGV changed from 45.0.4 [default] to 45.0.5 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-dbg: PKGSIZE changed from 1174176 to 1174448 (+0%)
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

--===============3264349900920454997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 942 .bb files complete (0 cached, 942 parsed). 1934 targets, 50 skipped, 0 masked, 0 errors.
Removing 36 recipes from the core2-64 sysroot...done.
Removing 97 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-9fef71c588346e64467893a1ab4977fe58f4d96a"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:9fef71c588346e64467893a1ab4977fe58f4d96a"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 652 Local 597 Mirrors 0 Missed 55 Current 274 (91% match, 94% complete)
Removing 11 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 280 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 284 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.135.29.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 287 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 294 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 299 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_populate_lic_setscene)
NOTE: Running setscene task 303 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 305 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 306 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 311 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 312 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.4.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 313 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 314 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 315 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 319 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 323 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 325 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-hypothesis-6.135.29-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-cffi-1.17.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-8.4.1-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-cryptography-45.0.5-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-pytest-8.4.1-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 330 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-hypothesis-6.135.29-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 332 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_package_write_ipk_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 333 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 336 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 338 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-cffi-1.17.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 344 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.135.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 349 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.135.29.bb:do_create_spdx_setscene)
NOTE: Running setscene task 350 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-iso8601-2.1.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 351 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 352 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package_qa_setscene)
NOTE: Running setscene task 356 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 358 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 360 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.135.29.bb:do_package_write_deb_setscene)
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 361 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 362 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_create_spdx_setscene)
NOTE: recipe python3-cffi-1.17.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-cryptography-45.0.5-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 363 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_package_write_deb_setscene)
NOTE: recipe python3-hypothesis-6.135.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-hypothesis-6.135.29-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-psutil-7.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 371 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_qa_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-cffi-1.17.1-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-cffi-1.17.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 377 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.135.29-r0: task do_package_write_deb_setscene: Started
NOTE: Running setscene task 378 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 379 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_package_write_deb_setscene)
NOTE: recipe python3-iso8601-2.1.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 381 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.4.1.bb:do_package_write_deb_setscene)
NOTE: recipe python3-hypothesis-6.135.29-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.135.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 387 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 390 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 391 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.4.1.bb:do_package_write_ipk_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 394 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-psutil-7.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 395 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 397 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-cffi-1.17.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-iso8601-2.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.135.29-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Started
NOTE: Running setscene task 399 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 400 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 401 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 402 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-iso8601-2.1.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 405 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_populate_lic_setscene)
NOTE: recipe python3-pytest-8.4.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-cffi-1.17.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytest-8.4.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pytest-8.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 410 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-iso8601-2.1.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-cffi-1.17.1-r0: task do_package_write_deb_setscene: Started
NOTE: Running setscene task 416 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.135.29.bb:do_package_qa_setscene)
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 419 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-pytest-8.4.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 425 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_package_write_deb_setscene)
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-cffi-1.17.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 431 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 433 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-8.4.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 436 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-iso8601-2.1.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 437 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.4.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 439 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: recipe python3-cffi-1.17.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 441 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_packagedata_setscene)
NOTE: Running setscene task 455 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 457 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 459 of 926 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-maturin_1.9.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 460 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-8.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 461 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_packagedata_setscene)
NOTE: recipe python3-hypothesis-6.135.29-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 463 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_packagedata_setscene)
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-8.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 464 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.135.29-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 465 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_packagedata_setscene)
NOTE: recipe python3-iso8601-2.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 470 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_packagedata_setscene)
NOTE: recipe python3-colorama-0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-25.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 471 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 472 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-8.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 473 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_packagedata_setscene)
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 474 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_25.3.0.bb:do_packagedata_setscene)
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 477 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_packagedata_setscene)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-psutil-7.0.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 478 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.4.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 481 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-pytz-2025.2-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-4.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 482 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-attrs-25.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-maturin-native-1.9.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-packaging-25.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 483 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-pytest-8.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 484 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 485 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe python3-maturin-native-1.9.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 487 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.135.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 488 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.1.0.bb:do_packagedata_setscene)
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 494 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 496 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_15.1.bb:do_packagedata_setscene)
NOTE: recipe python3-psutil-7.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 497 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 501 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-attrs-25.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 503 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 510 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.88.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-pytest-8.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cffi-1.17.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 513 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_create_spdx_setscene)
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.135.29-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 517 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 520 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_package_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-2.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.88.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cffi-1.17.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.135.29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-iso8601-2.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.88.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-iniconfig-2.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 522 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 532 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 533 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 539 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 541 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 543 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 549 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 552 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 560 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 563 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 567 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 568 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 571 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 574 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 579 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-2.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 580 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.88.0.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-2.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 585 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 586 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 592 of 926 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-maturin_1.9.1.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 594 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: recipe coreutils-9.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 595 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_recipe_qa_setscene)
NOTE: recipe python3-cryptography-45.0.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 599 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 611 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 613 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_recipe_qa_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 616 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 620 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.8.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libstd-rs-1.88.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 621 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 622 of 926 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.88.0.bb:do_create_spdx_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-cryptography-45.0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 626 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 632 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 633 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 634 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 635 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.88.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 636 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 638 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycparser_2.22.bb:do_packagedata_setscene)
NOTE: recipe cargo-native-1.88.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 641 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pytz-2025.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-maturin-native-1.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 651 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 652 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 658 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 660 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.88.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: recipe cargo-native-1.88.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 661 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.135.29.bb:do_recipe_qa_setscene)
NOTE: recipe python3-psutil-7.0.0-r0: task do_package_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pycparser-2.22-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cffi-1.17.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pytest-8.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 663 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 665 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 667 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 670 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_create_spdx_setscene)
NOTE: recipe libstd-rs-1.88.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-8.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-cffi-1.17.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 673 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pycparser-2.22-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 678 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_packagedata_setscene)
NOTE: Running setscene task 681 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 682 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 684 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-iso8601-2.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 685 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 689 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-hypothesis-6.135.29-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-maturin-native-1.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 691 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-iso8601-2.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 693 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 695 of 926 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.88.0.bb:do_create_spdx_setscene)
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-hypothesis-6.135.29-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 696 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 698 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 700 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 701 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libarchive-3.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 704 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 709 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 713 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.88.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 714 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 715 of 926 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 716 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 717 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 718 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe rust-native-1.88.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 719 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.14.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-psutil-7.0.0-r0: task do_package_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 720 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-setuptools-rust-native-1.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 723 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 725 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 726 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcrypt-1.11.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 727 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.14.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe rust-native-1.88.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 729 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 730 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 732 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.76-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 735 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 737 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 738 of 926 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.5.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-psutil-7.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 739 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 740 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 742 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 744 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-rust-native-1.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 749 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 752 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-psutil-7.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 753 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 756 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 758 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-native-2.14.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunwind-1.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 762 of 926 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.88.0.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 765 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.88.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 768 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 770 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe libunwind-1.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 771 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 772 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_recipe_qa_setscene)
NOTE: recipe cargo-native-1.88.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.88.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 773 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 774 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 775 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-native-2.14.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 777 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 783 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 785 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_create_spdx_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.88.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 786 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 787 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe python3-psutil-7.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 792 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 793 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libunwind-1.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-psutil-7.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 794 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 795 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 798 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 799 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 800 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.13.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 801 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_package_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libunwind-1.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cargo-native-1.88.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 803 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_10.0.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 807 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 811 of 926 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.88.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 813 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_package_setscene: Started
NOTE: recipe qemu-native-10.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 817 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 819 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe rust-native-1.88.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 813 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_fetch)
NOTE: Running task 899 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_write_config)
NOTE: Running task 998 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_fetch)
NOTE: Running task 1003 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_fetch)
NOTE: Running task 1031 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_fetch)
NOTE: recipe libpam-1.7.1-r0: task do_fetch: Started
NOTE: Running task 1102 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_fetch)
NOTE: Running task 1109 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_fetch)
NOTE: recipe libpam-1.7.1-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_write_config: Started
NOTE: Running task 1134 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_unpack)
NOTE: Running task 1161 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_fetch)
NOTE: Running task 1164 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 1165 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_fetch)
NOTE: recipe libcap-2.76-r0: task do_fetch: Started
NOTE: recipe qemu-native-10.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.1-r0: task do_fetch: Started
NOTE: Running setscene task 820 of 926 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.76-r0: task do_fetch: Succeeded
NOTE: Running task 1218 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_unpack)
NOTE: recipe libpam-1.7.1-r0: task do_write_config: Succeeded
NOTE: recipe libgcrypt-1.11.1-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_fetch: Started
NOTE: Running task 1265 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_unpack)
NOTE: Running task 1272 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_fetch)
NOTE: recipe python3-cryptography-45.0.5-r0: task do_fetch: Started
NOTE: recipe elfutils-0.193-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: Running task 1308 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_unpack)
NOTE: recipe libpam-1.7.1-r0: task do_unpack: Started
NOTE: recipe elfutils-0.193-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-45.0.5-r0: task do_fetch: Succeeded
NOTE: Running task 1349 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_unpack)
NOTE: recipe coreutils-9.7-r0: task do_fetch: Started
NOTE: Running task 1366 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_unpack)
NOTE: Running task 1373 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_fetch)
NOTE: Running task 1377 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1378 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe coreutils-9.7-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_fetch: Started
NOTE: recipe libcap-2.76-r0: task do_unpack: Started
NOTE: Running task 1409 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_unpack)
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_fetch: Started
NOTE: recipe shadow-4.18.0-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.11.1-r0: task do_unpack: Started
NOTE: recipe glib-2.0-native-1_2.84.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1464 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_unpack)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_fetch: Succeeded
NOTE: Running task 1498 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe elfutils-0.193-r0: task do_unpack: Started
NOTE: recipe binutils-2.45-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-45.0.5-r0: task do_unpack: Started
NOTE: recipe binutils-2.45-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.76-r0: task do_unpack: Succeeded
NOTE: Running task 1519 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_unpack)
NOTE: Running task 1520 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_patch)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_unpack: Started
NOTE: Running task 1521 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_patch)
NOTE: recipe coreutils-9.7-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 1522 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcap-2.76-r0: task do_patch: Started
NOTE: Running task 1524 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_patch)
NOTE: recipe binutils-2.45-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_patch: Started
NOTE: recipe libcap-2.76-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-native-1_2.84.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 821 of 926 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe libpam-1.7.1-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe rust-native-1.88.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1564 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe meson-native-1.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1573 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe coreutils-9.7-r0: task do_unpack: Succeeded
NOTE: Running task 1574 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_patch)
NOTE: recipe libgcrypt-1.11.1-r0: task do_unpack: Succeeded
NOTE: Running task 1575 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_patch)
NOTE: recipe python3-cryptography-45.0.5-r0: task do_unpack: Succeeded
NOTE: recipe meson-native-1.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1595 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe coreutils-9.7-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1602 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-cryptography-45.0.5-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_unpack: Succeeded
NOTE: Running task 1603 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_patch)
NOTE: recipe coreutils-9.7-r0: task do_patch: Succeeded
NOTE: recipe python3-cryptography-45.0.5-r0: task do_patch: Succeeded
NOTE: Running task 1605 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_deploy_source_date_epoch)
NOTE: Running task 1606 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_rust_gen_targets)
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_patch: Started
NOTE: recipe python3-cryptography-45.0.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_patch: Succeeded
NOTE: recipe python3-cryptography-45.0.5-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-cryptography-45.0.5-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_unpack: Succeeded
NOTE: Running task 1610 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_patch)
NOTE: recipe shadow-4.18.0-r0: task do_unpack: Succeeded
NOTE: Running task 1611 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_patch)
NOTE: recipe libgcrypt-1.11.1-r0: task do_patch: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_patch: Started
NOTE: recipe shadow-4.18.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1613 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-cryptography-45.0.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_deploy_source_date_epoch unihash changed to 3c6d97527f9f5441ff5e4137c0f58976bded6e550dc2a595ed0b507d179f32ab
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe shadow-4.18.0-r0: task do_patch: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1616 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe python3-3.13.5-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 823 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 824 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: Running setscene task 825 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 826 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 827 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 828 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 829 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 830 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 831 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 832 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 833 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 834 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 835 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 836 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 322b8f8b906444532279807f4b6d94c79a2dab3feaff9de6d084f1ef1555cf0a
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash f591700009ba4d0f63a586e9bc7df90e94732379dff50f2e407499291cdb6e6c to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '525369fcb075f531fc445f360665064cd55ba13750997fc72f3f53d9409743a3', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'f591700009ba4d0f63a586e9bc7df90e94732379dff50f2e407499291cdb6e6c'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 525369fcb075f531fc445f360665064cd55ba13750997fc72f3f53d9409743a3 -> f591700009ba4d0f63a586e9bc7df90e94732379dff50f2e407499291cdb6e6c as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Running setscene task 837 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.13.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 838 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 839 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_packagedata_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 840 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 841 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 842 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 843 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 844 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 851 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 852 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 853 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 854 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 858 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 861 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-2.45-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1617 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_patch)
NOTE: recipe openssl-3.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-2.45-r0: task do_patch: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 863 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 866 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 868 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/util-linux-libuuid/2.41/temp/log.do_packagedata_setscene.2375372
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 869 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_package_setscene)
NOTE: recipe openssl-3.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 872 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 874 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 876 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 878 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 879 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_package_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 882 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 883 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 885 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 886 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 887 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 889 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 891 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-2.45-r0: task do_patch: Succeeded
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 893 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 895 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 896 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 897 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 899 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 900 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 905 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 906 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 908 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 909 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 910 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 915 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 917 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 918 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 921 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 924 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 925 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1878 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1979 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2018 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_packagedata)
NOTE: recipe libpam-1.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-45.0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_packagedata: Succeeded
NOTE: Running task 2360 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_collect_spdx_deps)
NOTE: recipe python3-cryptography-45.0.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libpam-1.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2417 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_configure)
NOTE: recipe libpam-1.7.1-r0: task do_configure: Started
NOTE: recipe python3-cryptography-45.0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cryptography-45.0.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2418 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_rust_create_wrappers)
NOTE: recipe python3-cryptography-45.0.5-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-cryptography-45.0.5-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 2419 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_configure)
NOTE: recipe python3-cryptography-45.0.5-r0: task do_configure: Started
NOTE: recipe python3-cryptography-45.0.5-r0: task do_configure: Succeeded
NOTE: Running task 2420 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_configure_ptest_base)
NOTE: recipe python3-cryptography-45.0.5-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-cryptography-45.0.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2421 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_compile)
NOTE: recipe python3-cryptography-45.0.5-r0: task do_compile: Started
NOTE: recipe libpam-1.7.1-r0: task do_configure: Succeeded
NOTE: Running task 2422 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_configure_ptest_base)
NOTE: recipe libpam-1.7.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libpam-1.7.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2423 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_compile)
NOTE: recipe libpam-1.7.1-r0: task do_compile: Started
NOTE: recipe libpam-1.7.1-r0: task do_compile: Succeeded
NOTE: Running task 2424 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_compile_ptest_base)
NOTE: recipe libpam-1.7.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libpam-1.7.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2425 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_install)
NOTE: recipe libpam-1.7.1-r0: task do_install: Started
NOTE: recipe libpam-1.7.1-r0: task do_install: Succeeded
NOTE: Running task 2426 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_install_ptest_base)
NOTE: recipe libpam-1.7.1-r0: task do_install_ptest_base: Started
NOTE: recipe libpam-1.7.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2427 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot)
NOTE: Running task 2428 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_package)
NOTE: recipe libpam-1.7.1-r0: task do_package: Started
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot: Started
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot unihash changed to 408c17271eb3d05303a56f6a12892d35342c23d50559157d345204e83bf778ed
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_create_spdx as unihash 3fa2a9914d703810bb793b91b4f8e57f638061a66d73a3293344eab5a4390540 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'e64064f3166fa6d37e21673e5aa8d9de67d54fb257f6d387d8a91f81bc570ac8', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '3fa2a9914d703810bb793b91b4f8e57f638061a66d73a3293344eab5a4390540'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_create_spdx unihash changed e64064f3166fa6d37e21673e5aa8d9de67d54fb257f6d387d8a91f81bc570ac8 -> 3fa2a9914d703810bb793b91b4f8e57f638061a66d73a3293344eab5a4390540 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_sysroot as unihash 6bdb22951719f0d5d18ce6a8fdc51668ea1f8ad506aa8d4329e1d457beddcfec to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '13f48a72ec9d14d08aa092524787d6c0df630c744f5687f62666da402bc6c81c', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '13f48a72ec9d14d08aa092524787d6c0df630c744f5687f62666da402bc6c81c'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_sysroot unihash 13f48a72ec9d14d08aa092524787d6c0df630c744f5687f62666da402bc6c81c unchanged by server
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_create_spdx as unihash be07e9c897c46fc981b157bdd76b99af163a136c8a4e34173cfaac2a570767fa to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '43e9d1da9e857816c0bf408cc86f075d07deb72f73a52b810e3e876258debd16', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'be07e9c897c46fc981b157bdd76b99af163a136c8a4e34173cfaac2a570767fa'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_create_spdx unihash changed 43e9d1da9e857816c0bf408cc86f075d07deb72f73a52b810e3e876258debd16 -> be07e9c897c46fc981b157bdd76b99af163a136c8a4e34173cfaac2a570767fa as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_populate_sysroot became valid
NOTE: Running setscene task 914 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_populate_sysroot_setscene)
NOTE: Running task 2429 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.193-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.193-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 924 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2430 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_configure)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 925 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 926 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2431 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-2.76-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-2.76-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2432 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_configure)
NOTE: recipe libcap-2.76-r0: task do_configure: Started
NOTE: recipe libcap-2.76-r0: task do_configure: Succeeded
NOTE: Running task 2433 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_compile)
NOTE: recipe libcap-2.76-r0: task do_compile: Started
NOTE: recipe libcap-2.76-r0: task do_compile: Succeeded
NOTE: Running task 2434 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_install)
NOTE: recipe libcap-2.76-r0: task do_install: Started
NOTE: recipe libcap-2.76-r0: task do_install: Succeeded
NOTE: Running task 2436 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2437 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.11.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2438 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_configure)
NOTE: recipe coreutils-9.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2439 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_configure)
NOTE: recipe libgcrypt-1.11.1-r0: task do_configure: Started
NOTE: recipe coreutils-9.7-r0: task do_configure: Started
NOTE: recipe libpam-1.7.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_package unihash changed to e4561828b0c025ce6778a444d78c05eda3daed3bd71517c443629c5afc520008
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_create_spdx as unihash 3fa2a9914d703810bb793b91b4f8e57f638061a66d73a3293344eab5a4390540 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '048a7d99baf3edc62e76872c8b84232c3926558992ec1f1729cd8febf3dabf31', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '3fa2a9914d703810bb793b91b4f8e57f638061a66d73a3293344eab5a4390540'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_create_spdx unihash changed 048a7d99baf3edc62e76872c8b84232c3926558992ec1f1729cd8febf3dabf31 -> 3fa2a9914d703810bb793b91b4f8e57f638061a66d73a3293344eab5a4390540 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_create_spdx as unihash be07e9c897c46fc981b157bdd76b99af163a136c8a4e34173cfaac2a570767fa to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'abcfa9eda86ecb4977b3fc2afc0dc16783f5836dea319c55ad138d1e51438dbf', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'be07e9c897c46fc981b157bdd76b99af163a136c8a4e34173cfaac2a570767fa'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_create_spdx unihash changed abcfa9eda86ecb4977b3fc2afc0dc16783f5836dea319c55ad138d1e51438dbf -> be07e9c897c46fc981b157bdd76b99af163a136c8a4e34173cfaac2a570767fa as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_package_write_rpm became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_package_write_rpm became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_package_qa became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_package_qa became valid
NOTE: Running setscene task 907 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_package_qa_setscene)
NOTE: Running setscene task 908 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 909 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 910 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 911 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 912 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 913 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 914 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 915 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata_setscene)
NOTE: Running setscene task 916 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: recipe python3-psutil-7.0.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-psutil-7.0.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-psutil-7.0.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-psutil-7.0.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-psutil-7.0.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-psutil-7.0.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-psutil-7.0.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-psutil-7.0.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 918 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 919 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 920 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.45-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 922 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 924 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 926 of 926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe shadow-4.18.0-r0: task do_configure: Succeeded
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_package became valid
NOTE: Setscene tasks completed
NOTE: recipe python3-cryptography-45.0.5-r0: task do_compile: Succeeded
NOTE: Running task 2480 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_compile_ptest_base)
NOTE: recipe libgcrypt-1.11.1-r0: task do_configure: Succeeded
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_package became valid
NOTE: Setscene tasks completed
NOTE: recipe python3-cryptography-45.0.5-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-cryptography-45.0.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2512 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_install)
NOTE: recipe python3-cryptography-45.0.5-r0: task do_install: Started
NOTE: recipe python3-cryptography-45.0.5-r0: task do_install: Succeeded
NOTE: Running task 2513 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_install_ptest_base)
NOTE: recipe python3-cryptography-45.0.5-r0: task do_install_ptest_base: Started
NOTE: recipe python3-cryptography-45.0.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2514 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_package)
NOTE: Running task 2515 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_populate_sysroot)
NOTE: recipe python3-cryptography-45.0.5-r0: task do_package: Started
NOTE: recipe python3-cryptography-45.0.5-r0: task do_populate_sysroot: Started
NOTE: recipe python3-cryptography-45.0.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2516 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2517 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_configure: Succeeded
NOTE: Running task 2518 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_compile: Started
NOTE: recipe python3-cryptography-45.0.5-r0: task do_package: Succeeded
NOTE: Running task 2519 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_packagedata)
NOTE: recipe python3-cryptography-45.0.5-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-45.0.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2520 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_create_spdx)
NOTE: recipe python3-cryptography-45.0.5-r0: task do_create_spdx: Started
NOTE: recipe python3-cryptography-45.0.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 2521 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_collect_spdx_deps)
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_compile: Succeeded
NOTE: Running task 2522 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_install)
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_install: Started
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_install: Succeeded
NOTE: Running task 2523 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_package)
NOTE: Running task 2524 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_populate_sysroot)
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_package: Started
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_populate_sysroot: Started
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_package: Succeeded
NOTE: Running task 2525 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_packagedata)
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_packagedata unihash changed to 76af455c0b6f4962f12130cab62461fffacb9c163e4875ffd4bfb95f3669af43
NOTE: Setscene tasks completed
NOTE: Running task 2526 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_create_spdx)
NOTE: Running task 2527 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_package_write_ipk)
NOTE: Running task 2528 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_package_write_deb)
NOTE: Running task 2529 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_package_write_rpm)
NOTE: Running task 2530 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_package_qa)
NOTE: Running task 2531 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_package_write_ipk)
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_create_spdx: Started
NOTE: Running task 2532 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_package_write_deb)
NOTE: Running task 2533 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_package_write_rpm)
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_package_write_ipk: Started
NOTE: Running task 2534 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_package_qa)
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_package_write_deb: Started
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_package_write_rpm: Started
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_package_qa: Started
NOTE: recipe python3-cryptography-45.0.5-r0: task do_package_write_ipk: Started
NOTE: recipe python3-cryptography-45.0.5-r0: task do_package_write_deb: Started
NOTE: recipe python3-cryptography-45.0.5-r0: task do_package_write_rpm: Started
NOTE: recipe python3-cryptography-45.0.5-r0: task do_package_qa: Started
NOTE: recipe python3-cryptography-45.0.5-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_package_qa unihash changed to 94408b224cebf6b7f348ba7cb6c4edce5e77da80813ceba49447540f7fb0a5aa
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_package_write_ipk unihash changed to 7cb3501c86697a5c7ee2af9b279b417c015ee1143e28c2c32eab8dbf55e82135
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 2535 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_create_package_spdx)
NOTE: Running task 2536 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_create_package_spdx)
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_create_package_spdx: Started
NOTE: recipe python3-cryptography-45.0.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cryptography-45.0.5-r0: task do_create_package_spdx: Started
NOTE: recipe python3-cryptography-45.0.5-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_package_qa unihash changed to 8b14c3a7f3b2ec8e01d94aec2e7cad2d1d84e448dc51288cebf29a9fe5da106e
NOTE: recipe python3-cryptography-45.0.5-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_create_package_spdx: Succeeded
NOTE: recipe python3-cryptography-45.0.5-r0: task do_create_package_spdx: Succeeded
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_package_write_rpm unihash changed to 3744df93054c3c8a15488c87d77f953d38d3a5abbb592740c16b280ac041aece
NOTE: recipe coreutils-9.7-r0: task do_configure: Succeeded
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_package became valid
NOTE: Setscene tasks completed
NOTE: recipe python3-cryptography-vectors-45.0.5-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_package_write_deb unihash changed to 69dbcc3384b9a0a169deba86610727e2c1256d9189498194da83a0e9d961508e
NOTE: Running noexec task 2552 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_build)
NOTE: Running noexec task 2553 of 2553 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_build)
NOTE: Tasks Summary: Attempted 2553 tasks of which 2457 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: util-linux-libuuid-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-src went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-dbg went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-staticdev went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-dev went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-doc went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-locale went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.41-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3264349900920454997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.13/site-packages/cryptography_vectors-45.0.4.dist-info moved to /usr/lib/python3.13/site-packages/cryptography_vectors-45.0.5.dist-info
Changes to packages/core2-64-poky-linux/python3-cryptography (sysroot):
  /usr/lib/python3.13/site-packages/cryptography-45.0.4.dist-info moved to /usr/lib/python3.13/site-packages/cryptography-45.0.5.dist-info

--===============3264349900920454997==--

