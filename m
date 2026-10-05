Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93031CA5FE2
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 05:28:51 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13637.1791178118482346616
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Oct 2026 22:28:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=kaNW1AUZ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=bCMhoboV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a10a8911c7-d82cbb14-ad6f-4633-ab9d-3ad1afa5e4a1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791178117;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wtmvwq8SMPoZHbpH7F2oeQ6WyLtNHCuGNh7aCaDi5yM=;
	b=kaNW1AUZCatAZUIRATs2AdhG0xfdU5m58zag6pFmzGGWVZFE84k04xequGLtMNX8
	fYV8vTJkBkjf5oUNJWf4ZKIjg4Du4UR+GJ1JOWn7C1o5DT3L8T2TpvApWZb85gDoBzX
	Rgwj6QtC/kd0Xb2Wvuicslh9EDs2GkwckjYm0R0A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791178117;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wtmvwq8SMPoZHbpH7F2oeQ6WyLtNHCuGNh7aCaDi5yM=;
	b=bCMhoboVdUh/9f3BXROJcv1zwYad9jj5tUWKbZk09qx663rbAP1ByV+N3V1lVqMi
	LD+4RmWLoHfq2BLANDUyPRGjh80SI/yp8qFlKz+6M50NPT9b99sKdJV0tGHaxElZHWT
	hlOsVyQy48iwkMIg9D5dmQ+MBVpg5PkIP5P9IphY=
Content-Type: multipart/mixed; boundary="===============4015311796930873245=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.168.4 SUCCEEDED
Message-ID: <010101a10a8911c7-d82cbb14-ad6f-4633-ab9d-3ad1afa5e4a1-000000@us-west-2.amazonses.com>
Date: Mon, 5 Oct 2026 05:28:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.05-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 05:28:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247211

--===============4015311796930873245==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hypothesis* to *6.168.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.168.3-6.168.4.patch
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
From 6703e61a4cab25aa648af0e153ea8760f515a0de Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 5 Oct 2026 05:16:54 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.168.3 -> 6.168.4

---
 .../python/python3-hypothesis-crates.inc      | 20 +++++++++----------
 ...168.3.bb => python3-hypothesis_6.168.4.bb} |  2 +-
 2 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.168.3.bb => python3-hypothesis_6.168.4.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis-crates.inc b/meta/recipes-devtools/python/python3-hypothesis-crates.inc
index 080e6ed7f4..57a1c2c29e 100644
--- a/meta/recipes-devtools/python/python3-hypothesis-crates.inc
+++ b/meta/recipes-devtools/python/python3-hypothesis-crates.inc
@@ -12,11 +12,11 @@ SRC_URI += " \
     crate://crates.io/portable-atomic/1.13.1 \
     crate://crates.io/ppv-lite86/0.2.21 \
     crate://crates.io/proc-macro2/1.0.106 \
-    crate://crates.io/pyo3/0.29.2 \
-    crate://crates.io/pyo3-build-config/0.29.2 \
-    crate://crates.io/pyo3-ffi/0.29.2 \
-    crate://crates.io/pyo3-macros/0.29.2 \
-    crate://crates.io/pyo3-macros-backend/0.29.2 \
+    crate://crates.io/pyo3/0.29.3 \
+    crate://crates.io/pyo3-build-config/0.29.3 \
+    crate://crates.io/pyo3-ffi/0.29.3 \
+    crate://crates.io/pyo3-macros/0.29.3 \
+    crate://crates.io/pyo3-macros-backend/0.29.3 \
     crate://crates.io/quote/1.0.46 \
     crate://crates.io/r-efi/5.3.0 \
     crate://crates.io/rand/0.9.4 \
@@ -41,11 +41,11 @@ SRC_URI[once_cell-1.21.4.sha256sum] = "9f7c3e4beb33f85d45ae3e3a1792185706c8e16d0
 SRC_URI[portable-atomic-1.13.1.sha256sum] = "c33a9471896f1c69cecef8d20cbe2f7accd12527ce60845ff44c153bb2a21b49"
 SRC_URI[ppv-lite86-0.2.21.sha256sum] = "85eae3c4ed2f50dcfe72643da4befc30deadb458a9b590d720cde2f2b1e97da9"
 SRC_URI[proc-macro2-1.0.106.sha256sum] = "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
-SRC_URI[pyo3-0.29.2.sha256sum] = "4688ddedf473e32662b9b067670129a8afb8c18e351482c70d62ba4a88171e8b"
-SRC_URI[pyo3-build-config-0.29.2.sha256sum] = "f41027e41b4bd03f6e60f9f417fe24a6341a6bb744edd62b6f709f2a52ea30e9"
-SRC_URI[pyo3-ffi-0.29.2.sha256sum] = "e591a95526fead067432c3b3a33fc74770b87b1e04e73671090d9c2055a2b327"
-SRC_URI[pyo3-macros-0.29.2.sha256sum] = "73225868fc1cd84eef2c3c230ddb91273bf1de46aeb8a4248da76d32a0924a1c"
-SRC_URI[pyo3-macros-backend-0.29.2.sha256sum] = "571575aa3749fa6216757dd47d2a3e7ef360f329a40f0666a9fbd14889024952"
+SRC_URI[pyo3-0.29.3.sha256sum] = "700d18fa267b73b9b521fd7e13580e2f446916f176cacee1ab63fcc8191f1655"
+SRC_URI[pyo3-build-config-0.29.3.sha256sum] = "7b3fc0c4d08f6bb10e71fe39dfb9e2f59c6eb6854e22ec8092f50c69a4499adb"
+SRC_URI[pyo3-ffi-0.29.3.sha256sum] = "dfc0b8e19df29aad7086cf977bb0c2a2f143e30567eb113e9cf72b62ca698330"
+SRC_URI[pyo3-macros-0.29.3.sha256sum] = "6100e8a4b5eba53afaa5ed078364851a0b2499c553a44c31026b929049b49dc6"
+SRC_URI[pyo3-macros-backend-0.29.3.sha256sum] = "6143877a16e82b5a727b7127ff4cd86858a24a28d745d72f43e6f227c7b1bdb3"
 SRC_URI[quote-1.0.46.sha256sum] = "dfbc457d0c7a0759a614551b11a6409e5951f6c7537be1f1b7682b9ae9230368"
 SRC_URI[r-efi-5.3.0.sha256sum] = "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
 SRC_URI[rand-0.9.4.sha256sum] = "44c5af06bb1b7d3216d91932aed5265164bf384dc89cd6ba05cf59a35f5f76ea"
diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb b/meta/recipes-devtools/python/python3-hypothesis_6.168.4.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.168.4.bb
index 980161d42c..3e0da8a121 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.168.4.bb
@@ -16,7 +16,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "a43388f9067678fef6e13bdff325b6cfa6961a590498bb37f7ff31589c83bc75"
+SRC_URI[sha256sum] = "fb72038b41d026878f484491ed9c2670e89daee898d276b92129da2cfe4a3846"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.47.1


--===============4015311796930873245==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.168.3-6.168.4.patch"

RnJvbSA2NzAzZTYxYTRjYWIyNWFhNjQ4YWYwZTE1M2VhODc2MGY1MTVhMGRlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgNSBPY3QgMjAyNiAwNToxNjo1NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaHlwb3RoZXNpczogdXBncmFkZSA2LjE2OC4zIC0+IDYuMTY4LjQKCi0tLQogLi4uL3B5
dGhvbi9weXRob24zLWh5cG90aGVzaXMtY3JhdGVzLmluYyAgICAgIHwgMjAgKysrKysrKysrLS0t
LS0tLS0tLQogLi4uMTY4LjMuYmIgPT4gcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTY4LjQuYmJ9IHwg
IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1oeXBvdGhlc2lz
XzYuMTY4LjMuYmIgPT4gcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTY4LjQuYmJ9ICg5MSUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXMt
Y3JhdGVzLmluYyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhl
c2lzLWNyYXRlcy5pbmMKaW5kZXggMDgwZTZlZDdmNC4uNTdhMWMyYzI5ZSAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXMtY3JhdGVzLmlu
YworKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpcy1j
cmF0ZXMuaW5jCkBAIC0xMiwxMSArMTIsMTEgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby9wb3J0YWJsZS1hdG9taWMvMS4xMy4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5p
by9wcHYtbGl0ZTg2LzAuMi4yMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHJvYy1tYWNybzIv
MS4wLjEwNiBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy8wLjI5LjIgXAotICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3B5bzMtYnVpbGQtY29uZmlnLzAuMjkuMiBcCi0gICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vcHlvMy1mZmkvMC4yOS4yIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLW1hY3Jv
cy8wLjI5LjIgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMtbWFjcm9zLWJhY2tlbmQvMC4y
OS4yIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLzAuMjkuMyBcCisgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vcHlvMy1idWlsZC1jb25maWcvMC4yOS4zIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5p
by9weW8zLWZmaS8wLjI5LjMgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMtbWFjcm9zLzAu
MjkuMyBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy1tYWNyb3MtYmFja2VuZC8wLjI5LjMg
XAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3F1b3RlLzEuMC40NiBcCiAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vci1lZmkvNS4zLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JhbmQvMC45LjQgXApA
QCAtNDEsMTEgKzQxLDExIEBAIFNSQ19VUklbb25jZV9jZWxsLTEuMjEuNC5zaGEyNTZzdW1dID0g
IjlmN2MzZTRiZWIzM2Y4NWQ0NWFlM2UzYTE3OTIxODU3MDZjOGUxNmQwCiBTUkNfVVJJW3BvcnRh
YmxlLWF0b21pYy0xLjEzLjEuc2hhMjU2c3VtXSA9ICJjMzNhOTQ3MTg5NmYxYzY5Y2VjZWY4ZDIw
Y2JlMmY3YWNjZDEyNTI3Y2U2MDg0NWZmNDRjMTUzYmIyYTIxYjQ5IgogU1JDX1VSSVtwcHYtbGl0
ZTg2LTAuMi4yMS5zaGEyNTZzdW1dID0gIjg1ZWFlM2M0ZWQyZjUwZGNmZTcyNjQzZGE0YmVmYzMw
ZGVhZGI0NThhOWI1OTBkNzIwY2RlMmYyYjFlOTdkYTkiCiBTUkNfVVJJW3Byb2MtbWFjcm8yLTEu
MC4xMDYuc2hhMjU2c3VtXSA9ICI4ZmQwMGYwYmIyZTkwZDgxZDEwNDRjMmIzMjYxN2Y2OGZjYjlm
YTNiYjc2NDBjMjNlOWM3NDhlNTNmYjMwOTM0IgotU1JDX1VSSVtweW8zLTAuMjkuMi5zaGEyNTZz
dW1dID0gIjQ2ODhkZGVkZjQ3M2UzMjY2MmI5YjA2NzY3MDEyOWE4YWZiOGMxOGUzNTE0ODJjNzBk
NjJiYTRhODgxNzFlOGIiCi1TUkNfVVJJW3B5bzMtYnVpbGQtY29uZmlnLTAuMjkuMi5zaGEyNTZz
dW1dID0gImY0MTAyN2U0MWI0YmQwM2Y2ZTYwZjlmNDE3ZmUyNGE2MzQxYTZiYjc0NGVkZDYyYjZm
NzA5ZjJhNTJlYTMwZTkiCi1TUkNfVVJJW3B5bzMtZmZpLTAuMjkuMi5zaGEyNTZzdW1dID0gImU1
OTFhOTU1MjZmZWFkMDY3NDMyYzNiM2EzM2ZjNzQ3NzBiODdiMWUwNGU3MzY3MTA5MGQ5YzIwNTVh
MmIzMjciCi1TUkNfVVJJW3B5bzMtbWFjcm9zLTAuMjkuMi5zaGEyNTZzdW1dID0gIjczMjI1ODY4
ZmMxY2Q4NGVlZjJjM2MyMzBkZGI5MTI3M2JmMWRlNDZhZWI4YTQyNDhkYTc2ZDMyYTA5MjRhMWMi
Ci1TUkNfVVJJW3B5bzMtbWFjcm9zLWJhY2tlbmQtMC4yOS4yLnNoYTI1NnN1bV0gPSAiNTcxNTc1
YWEzNzQ5ZmE2MjE2NzU3ZGQ0N2QyYTNlN2VmMzYwZjMyOWE0MGYwNjY2YTlmYmQxNDg4OTAyNDk1
MiIKK1NSQ19VUklbcHlvMy0wLjI5LjMuc2hhMjU2c3VtXSA9ICI3MDBkMThmYTI2N2I3M2I5YjUy
MWZkN2UxMzU4MGUyZjQ0NjkxNmYxNzZjYWNlZTFhYjYzZmNjODE5MWYxNjU1IgorU1JDX1VSSVtw
eW8zLWJ1aWxkLWNvbmZpZy0wLjI5LjMuc2hhMjU2c3VtXSA9ICI3YjNmYzBjNGQwOGY2YmIxMGU3
MWZlMzlkZmI5ZTJmNTljNmViNjg1NGUyMmVjODA5MmY1MGM2OWE0NDk5YWRiIgorU1JDX1VSSVtw
eW8zLWZmaS0wLjI5LjMuc2hhMjU2c3VtXSA9ICJkZmMwYjhlMTlkZjI5YWFkNzA4NmNmOTc3YmIw
YzJhMmYxNDNlMzA1NjdlYjExM2U5Y2Y3MmI2MmNhNjk4MzMwIgorU1JDX1VSSVtweW8zLW1hY3Jv
cy0wLjI5LjMuc2hhMjU2c3VtXSA9ICI2MTAwZThhNGI1ZWJhNTNhZmFhNWVkMDc4MzY0ODUxYTBi
MjQ5OWM1NTNhNDRjMzEwMjZiOTI5MDQ5YjQ5ZGM2IgorU1JDX1VSSVtweW8zLW1hY3Jvcy1iYWNr
ZW5kLTAuMjkuMy5zaGEyNTZzdW1dID0gIjYxNDM4NzdhMTZlODJiNWE3MjdiNzEyN2ZmNGNkODY4
NThhMjRhMjhkNzQ1ZDcyZjQzZTZmMjI3YzdiMWJkYjMiCiBTUkNfVVJJW3F1b3RlLTEuMC40Ni5z
aGEyNTZzdW1dID0gImRmYmM0NTdkMGM3YTA3NTlhNjE0NTUxYjExYTY0MDllNTk1MWY2Yzc1Mzdi
ZTFmMWI3NjgyYjlhZTkyMzAzNjgiCiBTUkNfVVJJW3ItZWZpLTUuMy4wLnNoYTI1NnN1bV0gPSAi
NjljZGIzNGMxNThjZWIyODhkZjExZTE4YjRiZDM5ZGU5OTRmNjY1N2Q4Mzg0N2JkZmZkYmQ3ZjM0
Njc1NGIwZiIKIFNSQ19VUklbcmFuZC0wLjkuNC5zaGEyNTZzdW1dID0gIjQ0YzVhZjA2YmIxYjdk
MzIxNmQ5MTkzMmFlZDUyNjUxNjRiZjM4NGRjODljZDZiYTA1Y2Y1OWEzNWY1Zjc2ZWEiCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182
LjE2OC4zLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVz
aXNfNi4xNjguNC5iYgpzaW1pbGFyaXR5IGluZGV4IDkxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjE2OC4zLmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjE2OC40
LmJiCmluZGV4IDk4MDE2MWQ0MmMuLjNlMGRhOGExMjEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTY4LjMuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4xNjguNC5iYgpA
QCAtMTYsNyArMTYsNyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGZpbGU6Ly90ZXN0X3JsZS5weSBc
CiAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYTQzMzg4ZjkwNjc2NzhmZWY2ZTEzYmRm
ZjMyNWI2Y2ZhNjk2MWE1OTA0OThiYjM3ZjdmZjMxNTg5YzgzYmM3NSIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICJmYjcyMDM4YjQxZDAyNjg3OGY0ODQ0OTFlZDljMjY3MGU4OWRhZWU4OThkMjc2Yjky
MTI5ZGEyY2ZlNGEzODQ2IgogCiBSREVQRU5EUzoke1BOfSArPSAiIFwKICAgICBweXRob24zLWF0
dHJzIFwKLS0gCjIuNDcuMQoK

--===============4015311796930873245==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.168.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/hypothesis-6.168.4.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.168.3.dist-info -> /usr/lib/python3.14/site-packages/hypothesis-6.168.4.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.14/site-packages/hypothesis-6.168.3.dist-info moved to /usr/lib/python3.14/site-packages/hypothesis-6.168.4.dist-info

--===============4015311796930873245==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis: PKGV changed from 6.168.3 [default] to 6.168.4 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.168.3.tar.gz crate://crates.io/cfg-if/1.0.4 crate://crates.io/crunchy/0.2.4 crate://crates.io/getrandom/0.3.4 crate://crates.io/half/2.7.1 crate://crates.io/heck/0.5.0 crate://crates.io/libc/0.2.186 crate://crates.io/once_cell/1.21.4 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/ppv-lite86/0.2.21 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/pyo3/0.29.2 crate://crates.io/pyo3-build-config/0.29.2 crate://crates.io/pyo3-ffi/0.29.2 crate://crates.io/pyo3-macros/0.29.2 crate://crates.io/pyo3-macros-backend/0.29.2 crate://crates.io/quote/1.0.46 crate://crates.io/r-efi/5.3.0 crate://crates.io/rand/0.9.4 crate://crates.io/rand_chacha/0.9.0 crate://crates.io/rand_core/0.9.5 crate://crates.io/syn/2.0.118 crate://crates.io/target-lexicon/0.13.5 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/wasip2/1.0.4+wasi-0.2.12 cra
 te://crates.io/wit-bindgen/0.57.1 crate://crates.io/zerocopy/0.8.53 crate://crates.io/zerocopy-derive/0.8.53 file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.168.4.tar.gz crate://crates.io/cfg-if/1.0.4 crate://crates.io/crunchy/0.2.4 crate://crates.io/getrandom/0.3.4 crate://crates.io/half/2.7.1 crate://crates.io/heck/0.5.0 crate://crates.io/libc/0.2.186 crate://crates.io/once_cell/1.21.4 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/ppv-lite86/0.2.21 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/pyo3/0.29.3 crate://crates.io/pyo3-build-config/0.29.3 crate://crates.io/pyo3-ffi/0.29.3 crate://crates.io/pyo3-macros/0.29.3 crate://crates.io/pyo3-macros-backend/0.29.3 crate://crates.io/quote/1.0.46 crate://crates.io/r-efi/5.3.0 crate://crates.io/rand/0.9.4 crate://crates.io/rand_chacha/0.9.0 crate://crates.io/rand_core/0.9.5 crate://crates.io/syn/2.0.118 crate://crates.io/target-lexicon/0
 .13.5 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/wasip2/1.0.4+wasi-0.2.12 crate://crates.io/wit-bindgen/0.57.1 crate://crates.io/zerocopy/0.8.53 crate://crates.io/zerocopy-derive/0.8.53 file://test_binary_search.py file://test_rle.py"
packages/x86-64-v3-poky-linux/python3-hypothesis: PV changed from "6.168.3" to "6.168.4"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.168.3 [default] to 6.168.4 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.168.3" to "6.168.4"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGSIZE changed from 118544 to 118464 (-0%)
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.168.3 [default] to 6.168.4 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.168.3" to "6.168.4"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.168.3 [default] to 6.168.4 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.168.3" to "6.168.4"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.168.3 [default] to 6.168.4 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.168.3" to "6.168.4"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.168.3 [default] to 6.168.4 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.168.3" to "6.168.4"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.168.3 [default] to 6.168.4 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.168.3" to "6.168.4"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.168.3 [default] to 6.168.4 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.168.3" to "6.168.4"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.168.3 [default] to 6.168.4 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.168.3" to "6.168.4"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.168.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/hypothesis-6.168.4.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.168.3.dist-info -> /usr/lib/python3.14/site-packages/hypothesis-6.168.4.dist-info
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 4583511 to 4583567 (+0%)
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.14/site-packages/hypothesis-6.168.3.dist-info moved to /usr/lib/python3.14/site-packages/hypothesis-6.168.4.dist-info

--===============4015311796930873245==--

