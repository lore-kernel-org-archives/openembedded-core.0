Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B614FCD98CF
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:37 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50405.1781195492834895590
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=uWorx6wS;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=wTgws9fG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019eb786577e-af456927-df1f-4604-af99-393ddf1aeaf4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195495;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=50D3OVE5aQ18JW5SB2UC5EdlMuWfWKI1SFOZxvfb06k=;
	b=uWorx6wSwzlMHr/TaXFG9SPjI4hezQH2CgCklTTrQkCi8r8evrtVU3v4Y+N1G5L+
	sASzkogG8WQI3r0AqDf/yabWmv5+JrBQO8sU1+8lle8JdQUSx4X9cdTaIVHamPQs30R
	WXEcayRqv758OUAocnYDTpPHhONdcw2TpU3zjqiE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195495;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=50D3OVE5aQ18JW5SB2UC5EdlMuWfWKI1SFOZxvfb06k=;
	b=wTgws9fGbky/PmuImtgwyBSQEM8yv7Un8hAtlFmGTUapUaQnAkuywQWZ6cF4xwjz
	RBkZjKLehNKSFRqwWiot4W5LUaNlT8tLGDJMnsKYt4CvHcUmdkX5zPeOGy8BXCjhZPA
	WC/ajMYiENun6mgW2Kb3+JwZN/BDpDMIQMVJfH1I=
Content-Type: multipart/mixed; boundary="===============2049944238013505722=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>, 
	Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cryptography,python3-cryptography-vectors: upgrading to
 48.0.1,48.0.1 SUCCEEDED
Message-ID: <0101019eb786577e-af456927-df1f-4604-af99-393ddf1aeaf4-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238458

--===============2049944238013505722==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-cryptography,python3-cryptography-vectors* to *48.0.1,48.0.1* has Succeeded.

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
From b3a1be714153f45ae386159404842bd054eab040 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 07:14:09 +0000
Subject: [PATCH] python3-cryptography,python3-cryptography-vectors: upgrade
 48.0.0 -> 48.0.1,48.0.0 -> 48.0.1

---
 .../recipes-devtools/python/python3-cryptography-common.inc | 2 +-
 .../recipes-devtools/python/python3-cryptography-vectors.bb | 2 +-
 meta/recipes-devtools/python/python3-cryptography.bb        | 2 +-
 ...001-pyproject.toml-remove-benchmark-disable-option.patch | 6 +++---
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-cryptography-common.inc b/meta/recipes-devtools/python/python3-cryptography-common.inc
index 77d9781688..4077fdebbf 100644
--- a/meta/recipes-devtools/python/python3-cryptography-common.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-common.inc
@@ -3,4 +3,4 @@
 #
 # Additionally AUH will detect that they share this .inc file and
 # perform a lockstep upgrade for both.
-PV = "48.0.0"
+PV = "48.0.1"
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors.bb b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
index 6abb727915..0119b70b7e 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "69836f597ddfbe3920b3c90d1f18e5560973f0791b90e1921ad345e8111ac23e"
+SRC_URI[sha256sum] = "52bfaaf93b50e013d59a5ba070b510e4c1272f8cfabcb2e4fb58bc327c69b8f1"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/recipes-devtools/python/python3-cryptography.bb
index 5e24dbaf5a..915b35f3a5 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -11,7 +11,7 @@ LDSHARED += "-pthread"
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography-vectors
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "5c3932f4436d1cccb036cb0eaef46e6e2db91035166f1ad6505c3c9d5a635920"
+SRC_URI[sha256sum] = "266f4ee051abb2f725b74ef8072b521ce1feacf685a3364fa6a6b45548db791a"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://check-memfree.py \
diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
index 5c2e3c53ba..de0718ec03 100644
--- a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
@@ -1,4 +1,4 @@
-From 6d6fbe77732ce3c4d2dcf3a5f75bb20ea352bf4a Mon Sep 17 00:00:00 2001
+From f870c1b00a302999fc3a7dd9cc6bb1d340511803 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Tue, 17 May 2022 17:22:48 +0800
 Subject: [PATCH] pyproject.toml: remove --benchmark-disable option
@@ -26,10 +26,10 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index 95ced11..75bfcbb 100644
+index f9d05bb..3aaf9fe 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
-@@ -134,7 +134,7 @@ exclude = [
+@@ -139,7 +139,7 @@ exclude = [
  ]
  
  [tool.pytest.ini_options]
-- 
2.47.1


--===============2049944238013505722==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cryptography-python3-cryptography-vectors-up.patch"

RnJvbSBiM2ExYmU3MTQxNTNmNDVhZTM4NjE1OTQwNDg0MmJkMDU0ZWFiMDQwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMDc6MTQ6MDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNyeXB0b2dyYXBoeSxweXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzOiB1cGdyYWRl
CiA0OC4wLjAgLT4gNDguMC4xLDQ4LjAuMCAtPiA0OC4wLjEKCi0tLQogLi4uL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LWNvbW1vbi5pbmMgfCAyICstCiAuLi4v
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9ycy5iYiB8
IDIgKy0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHku
YmIgICAgICAgIHwgMiArLQogLi4uMDAxLXB5cHJvamVjdC50b21sLXJlbW92ZS1iZW5jaG1hcmst
ZGlzYWJsZS1vcHRpb24ucGF0Y2ggfCA2ICsrKy0tLQogNCBmaWxlcyBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS1jb21tb24uaW5jIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS1jb21tb24uaW5jCmluZGV4IDc3
ZDk3ODE2ODguLjQwNzdmZGViYmYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktY29tbW9uLmluYworKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LWNvbW1vbi5pbmMKQEAgLTMsNCAr
Myw0IEBACiAjCiAjIEFkZGl0aW9uYWxseSBBVUggd2lsbCBkZXRlY3QgdGhhdCB0aGV5IHNoYXJl
IHRoaXMgLmluYyBmaWxlIGFuZAogIyBwZXJmb3JtIGEgbG9ja3N0ZXAgdXBncmFkZSBmb3IgYm90
aC4KLVBWID0gIjQ4LjAuMCIKK1BWID0gIjQ4LjAuMSIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9ycy5iYiBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9ycy5iYgpp
bmRleCA2YWJiNzI3OTE1Li4wMTE5YjcwYjdlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnMuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzLmJiCkBA
IC05LDcgKzksNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT04YzM2
MTdkYjRmYjZmYWUwMWYxZDI1M2FiOTE1MTFlNCBcCiAjIE5PVEU6IE1ha2Ugc3VyZSB0byBrZWVw
IHRoaXMgcmVjaXBlIGF0IHRoZSBzYW1lIHZlcnNpb24gYXMgcHl0aG9uMy1jcnlwdG9ncmFwaHkK
ICMgICAgICAgVXBncmFkZSBib3RoIHJlY2lwZXMgYXQgdGhlIHNhbWUgdGltZQogcmVxdWlyZSBw
eXRob24zLWNyeXB0b2dyYXBoeS1jb21tb24uaW5jCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjk4
MzZmNTk3ZGRmYmUzOTIwYjNjOTBkMWYxOGU1NTYwOTczZjA3OTFiOTBlMTkyMWFkMzQ1ZTgxMTFh
YzIzZSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI1MmJmYWFmOTNiNTBlMDEzZDU5YTViYTA3MGI1
MTBlNGMxMjcyZjhjZmFiY2IyZTRmYjU4YmMzMjdjNjliOGYxIgogCiBQWVBJX1BBQ0tBR0UgPSAi
Y3J5cHRvZ3JhcGh5X3ZlY3RvcnMiCiAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHkuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LmJiCmluZGV4IDVlMjRkYmFmNWEuLjkxNWIzNWYz
YTUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlw
dG9ncmFwaHkuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNy
eXB0b2dyYXBoeS5iYgpAQCAtMTEsNyArMTEsNyBAQCBMRFNIQVJFRCArPSAiLXB0aHJlYWQiCiAj
IE5PVEU6IE1ha2Ugc3VyZSB0byBrZWVwIHRoaXMgcmVjaXBlIGF0IHRoZSBzYW1lIHZlcnNpb24g
YXMgcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9ycwogIyAgICAgICBVcGdyYWRlIGJvdGggcmVj
aXBlcyBhdCB0aGUgc2FtZSB0aW1lCiByZXF1aXJlIHB5dGhvbjMtY3J5cHRvZ3JhcGh5LWNvbW1v
bi5pbmMKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1YzM5MzJmNDQzNmQxY2NjYjAzNmNiMGVhZWY0
NmU2ZTJkYjkxMDM1MTY2ZjFhZDY1MDVjM2M5ZDVhNjM1OTIwIgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjI2NmY0ZWUwNTFhYmIyZjcyNWI3NGVmODA3MmI1MjFjZTFmZWFjZjY4NWEzMzY0ZmE2YTZi
NDU1NDhkYjc5MWEiCiAKIFNSQ19VUkkgKz0gImZpbGU6Ly8wMDAxLXB5cHJvamVjdC50b21sLXJl
bW92ZS1iZW5jaG1hcmstZGlzYWJsZS1vcHRpb24ucGF0Y2ggXAogICAgICAgICAgICAgZmlsZTov
L2NoZWNrLW1lbWZyZWUucHkgXApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS8wMDAxLXB5cHJvamVjdC50b21sLXJlbW92ZS1iZW5j
aG1hcmstZGlzYWJsZS1vcHRpb24ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtY3J5cHRvZ3JhcGh5LzAwMDEtcHlwcm9qZWN0LnRvbWwtcmVtb3ZlLWJlbmNobWFy
ay1kaXNhYmxlLW9wdGlvbi5wYXRjaAppbmRleCA1YzJlM2M1M2JhLi5kZTA3MThlYzAzIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5
LzAwMDEtcHlwcm9qZWN0LnRvbWwtcmVtb3ZlLWJlbmNobWFyay1kaXNhYmxlLW9wdGlvbi5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5
LzAwMDEtcHlwcm9qZWN0LnRvbWwtcmVtb3ZlLWJlbmNobWFyay1kaXNhYmxlLW9wdGlvbi5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNmQ2ZmJlNzc3MzJjZTNjNGQyZGNmM2E1Zjc1YmIyMGVh
MzUyYmY0YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZjg3MGMxYjAwYTMwMjk5OWZj
M2E3ZGQ5Y2M2YmIxZDM0MDUxMTgwMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IE1p
bmdsaSBZdSA8bWluZ2xpLnl1QHdpbmRyaXZlci5jb20+CiBEYXRlOiBUdWUsIDE3IE1heSAyMDIy
IDE3OjIyOjQ4ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIHB5cHJvamVjdC50b21sOiByZW1vdmUg
LS1iZW5jaG1hcmstZGlzYWJsZSBvcHRpb24KQEAgLTI2LDEwICsyNiwxMCBAQCBTaWduZWQtb2Zm
LWJ5OiBUaW0gT3JsaW5nIDx0aW0ub3JsaW5nQGtvbnN1bGtvLmNvbT4KICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL3B5cHJvamVj
dC50b21sIGIvcHlwcm9qZWN0LnRvbWwKLWluZGV4IDk1Y2VkMTEuLjc1YmZjYmIgMTAwNjQ0Citp
bmRleCBmOWQwNWJiLi4zYWFmOWZlIDEwMDY0NAogLS0tIGEvcHlwcm9qZWN0LnRvbWwKICsrKyBi
L3B5cHJvamVjdC50b21sCi1AQCAtMTM0LDcgKzEzNCw3IEBAIGV4Y2x1ZGUgPSBbCitAQCAtMTM5
LDcgKzEzOSw3IEBAIGV4Y2x1ZGUgPSBbCiAgXQogIAogIFt0b29sLnB5dGVzdC5pbmlfb3B0aW9u
c10KLS0gCjIuNDcuMQoK

--===============2049944238013505722==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-cryptography-vectors: PKGV changed from 48.0.0 [default] to 48.0.1 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors: PV changed from "48.0.0" to "48.0.1"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-48.0.0.tar.gz;downloadfilename=cryptography_vectors-48.0.0.tar.gz" to "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-48.0.1.tar.gz;downloadfilename=cryptography_vectors-48.0.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PKGV changed from 48.0.0 [default] to 48.0.1 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PV changed from "48.0.0" to "48.0.1"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PKGV changed from 48.0.0 [default] to 48.0.1 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PV changed from "48.0.0" to "48.0.1"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PKGV changed from 48.0.0 [default] to 48.0.1 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PV changed from "48.0.0" to "48.0.1"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PKGV changed from 48.0.0 [default] to 48.0.1 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PV changed from "48.0.0" to "48.0.1"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PKGV changed from 48.0.0 [default] to 48.0.1 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PV changed from "48.0.0" to "48.0.1"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PKGV changed from 48.0.0 [default] to 48.0.1 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PV changed from "48.0.0" to "48.0.1"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: FILELIST: directory renamed /usr/lib/python3.14/site-packages/cryptography_vectors-48.0.0.dist-info -> /usr/lib/python3.14/site-packages/cryptography_vectors-48.0.1.dist-info
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PKGV changed from 48.0.0 [default] to 48.0.1 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PV changed from "48.0.0" to "48.0.1"
Changes to packages/x86-64-v3-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.14/site-packages/cryptography_vectors-48.0.0.dist-info moved to /usr/lib/python3.14/site-packages/cryptography_vectors-48.0.1.dist-info
packages/x86-64-v3-poky-linux/python3-cryptography: PKGV changed from 48.0.0 [default] to 48.0.1 [default]
packages/x86-64-v3-poky-linux/python3-cryptography: PV changed from "48.0.0" to "48.0.1"
packages/x86-64-v3-poky-linux/python3-cryptography: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cryptography/cryptography-48.0.0.tar.gz;downloadfilename=cryptography-48.0.0.tar.gz file://0001-pyproject.toml-remove-benchmark-disable-option.patch file://check-memfree.py file://run-ptest crate://crates.io/asn1/0.24.1 crate://crates.io/asn1_derive/0.24.1 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/2.11.1 crate://crates.io/cc/1.2.61 crate://crates.io/cfg-if/1.0.4 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shared/0.1.1 crate://crates.io/heck/0.5.0 crate://crates.io/itoa/1.0.18 crate://crates.io/libc/0.2.186 crate://crates.io/once_cell/1.21.4 crate://crates.io/openssl/0.10.79 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-sys/0.9.115 crate://crates.io/pem/3.0.6 crate://crates.io/pkg-config/0.3.33 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/proc-macro2
 /1.0.106 crate://crates.io/pyo3/0.28.3 crate://crates.io/pyo3-build-config/0.28.3 crate://crates.io/pyo3-ffi/0.28.3 crate://crates.io/pyo3-macros/0.28.3 crate://crates.io/pyo3-macros-backend/0.28.3 crate://crates.io/quote/1.0.45 crate://crates.io/self_cell/1.2.2 crate://crates.io/shlex/1.3.0 crate://crates.io/syn/2.0.117 crate://crates.io/target-lexicon/0.13.5 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/vcpkg/0.2.15" to "https://files.pythonhosted.org/packages/source/c/cryptography/cryptography-48.0.1.tar.gz;downloadfilename=cryptography-48.0.1.tar.gz file://0001-pyproject.toml-remove-benchmark-disable-option.patch file://check-memfree.py file://run-ptest crate://crates.io/asn1/0.24.1 crate://crates.io/asn1_derive/0.24.1 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/2.11.1 crate://crates.io/cc/1.2.61 crate://crates.io/cfg-if/1.0.4 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shared/0.1.1 crate
 ://crates.io/heck/0.5.0 crate://crates.io/itoa/1.0.18 crate://crates.io/libc/0.2.186 crate://crates.io/once_cell/1.21.4 crate://crates.io/openssl/0.10.79 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-sys/0.9.115 crate://crates.io/pem/3.0.6 crate://crates.io/pkg-config/0.3.33 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/pyo3/0.28.3 crate://crates.io/pyo3-build-config/0.28.3 crate://crates.io/pyo3-ffi/0.28.3 crate://crates.io/pyo3-macros/0.28.3 crate://crates.io/pyo3-macros-backend/0.28.3 crate://crates.io/quote/1.0.45 crate://crates.io/self_cell/1.2.2 crate://crates.io/shlex/1.3.0 crate://crates.io/syn/2.0.117 crate://crates.io/target-lexicon/0.13.5 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/vcpkg/0.2.15"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-dbg: PKGSIZE changed from 1427616 to 1426856 (-0%)
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-dbg: PKGV changed from 48.0.0 [default] to 48.0.1 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-dbg: PV changed from "48.0.0" to "48.0.1"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-dev: PKGV changed from 48.0.0 [default] to 48.0.1 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-dev: PV changed from "48.0.0" to "48.0.1"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-doc: PKGV changed from 48.0.0 [default] to 48.0.1 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-doc: PV changed from "48.0.0" to "48.0.1"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-locale: PKGV changed from 48.0.0 [default] to 48.0.1 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-locale: PV changed from "48.0.0" to "48.0.1"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-ptest: PKGV changed from 48.0.0 [default] to 48.0.1 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-ptest: PV changed from "48.0.0" to "48.0.1"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-src: PKGV changed from 48.0.0 [default] to 48.0.1 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-src: PV changed from "48.0.0" to "48.0.1"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-staticdev: PKGV changed from 48.0.0 [default] to 48.0.1 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-staticdev: PV changed from "48.0.0" to "48.0.1"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography: FILELIST: directory renamed /usr/lib/python3.14/site-packages/cryptography-48.0.0.dist-info -> /usr/lib/python3.14/site-packages/cryptography-48.0.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/cryptography-48.0.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/cryptography-48.0.1.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography: PKGV changed from 48.0.0 [default] to 48.0.1 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography: PV changed from "48.0.0" to "48.0.1"
Changes to packages/x86-64-v3-poky-linux/python3-cryptography (sysroot):
  /usr/lib/python3.14/site-packages/cryptography-48.0.0.dist-info moved to /usr/lib/python3.14/site-packages/cryptography-48.0.1.dist-info

--===============2049944238013505722==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: FILELIST: directory renamed /usr/lib/python3.14/site-packages/cryptography_vectors-48.0.0.dist-info -> /usr/lib/python3.14/site-packages/cryptography_vectors-48.0.1.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.14/site-packages/cryptography_vectors-48.0.0.dist-info moved to /usr/lib/python3.14/site-packages/cryptography_vectors-48.0.1.dist-info
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography: FILELIST: directory renamed /usr/lib/python3.14/site-packages/cryptography-48.0.0.dist-info -> /usr/lib/python3.14/site-packages/cryptography-48.0.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/cryptography-48.0.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/cryptography-48.0.1.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-cryptography (sysroot):
  /usr/lib/python3.14/site-packages/cryptography-48.0.0.dist-info moved to /usr/lib/python3.14/site-packages/cryptography-48.0.1.dist-info

--===============2049944238013505722==--

