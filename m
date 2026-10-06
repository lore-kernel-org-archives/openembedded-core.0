Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95CD2CA6004
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 06:25:06 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39328.1791267897362622637
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2026 23:24:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=REY3R70E;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=dsEab2WS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a10fe2fc7d-5b0fc715-48a0-4305-b64c-85edd2eec08d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791267896;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jwxmJcvcLsb3C9OosrD0Aph9ActR5AW+146cCaWQ/CE=;
	b=REY3R70EMO4lI/jyeJbjVRsLtOLjJNc1BlqcPYRF2zv5BqDRywQ7+/x8vMwuJ3gY
	RTmVjLQZSOyQ/SK/klD8+wgdJtfQjLYllJDI2ODt7XrOhWAP50SrtYPXipauWQS9cfS
	vU5ygTS406L3wmf0DjVMCvaI4ULPtuaFvIH1VLWI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791267896;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jwxmJcvcLsb3C9OosrD0Aph9ActR5AW+146cCaWQ/CE=;
	b=dsEab2WSsjJ0UrXSL4ALlEd+11ec9sMkP7MJ+VEMhEK4/BAw3WHLF5ZmodkvEW1R
	CKh4FrVr6h1NqjNilFB9k5bT8I9YXliJYk0nhGrZCfNjvfKCxsk4E6rEpmZSvpw8u0J
	ZPoAlyJ1bwDs3Prp5Vb1jXLNZWsXmYkrLp8Zlodw=
Content-Type: multipart/mixed; boundary="===============3844577043844856262=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.168.5 SUCCEEDED
Message-ID: <010101a10fe2fc7d-5b0fc715-48a0-4305-b64c-85edd2eec08d-000000@us-west-2.amazonses.com>
Date: Tue, 6 Oct 2026 06:24:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.06-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 06:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247270

--===============3844577043844856262==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hypothesis* to *6.168.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.168.3-6.168.5.patch
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
From f70d0c46d4fe83f70fab09400956a5b0531994cd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 6 Oct 2026 05:41:28 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.168.3 -> 6.168.5

---
 .../python/python3-hypothesis-crates.inc      | 20 +++++++++----------
 ...168.3.bb => python3-hypothesis_6.168.5.bb} |  2 +-
 2 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.168.3.bb => python3-hypothesis_6.168.5.bb} (91%)

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
diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb b/meta/recipes-devtools/python/python3-hypothesis_6.168.5.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.168.5.bb
index 980161d42c..93580094f0 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.168.5.bb
@@ -16,7 +16,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "a43388f9067678fef6e13bdff325b6cfa6961a590498bb37f7ff31589c83bc75"
+SRC_URI[sha256sum] = "76b9226962fe11d40858253a967eda95bb65811365286317e0118f4ec8f808c7"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.47.1


--===============3844577043844856262==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.168.3-6.168.5.patch"

RnJvbSBmNzBkMGM0NmQ0ZmU4M2Y3MGZhYjA5NDAwOTU2YTViMDUzMTk5NGNkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgNiBPY3QgMjAyNiAwNTo0MToyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaHlwb3RoZXNpczogdXBncmFkZSA2LjE2OC4zIC0+IDYuMTY4LjUKCi0tLQogLi4uL3B5
dGhvbi9weXRob24zLWh5cG90aGVzaXMtY3JhdGVzLmluYyAgICAgIHwgMjAgKysrKysrKysrLS0t
LS0tLS0tLQogLi4uMTY4LjMuYmIgPT4gcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTY4LjUuYmJ9IHwg
IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1oeXBvdGhlc2lz
XzYuMTY4LjMuYmIgPT4gcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTY4LjUuYmJ9ICg5MSUpCgpkaWZm
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
aXNfNi4xNjguNS5iYgpzaW1pbGFyaXR5IGluZGV4IDkxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjE2OC4zLmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjE2OC41
LmJiCmluZGV4IDk4MDE2MWQ0MmMuLjkzNTgwMDk0ZjAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTY4LjMuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4xNjguNS5iYgpA
QCAtMTYsNyArMTYsNyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGZpbGU6Ly90ZXN0X3JsZS5weSBc
CiAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYTQzMzg4ZjkwNjc2NzhmZWY2ZTEzYmRm
ZjMyNWI2Y2ZhNjk2MWE1OTA0OThiYjM3ZjdmZjMxNTg5YzgzYmM3NSIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICI3NmI5MjI2OTYyZmUxMWQ0MDg1ODI1M2E5NjdlZGE5NWJiNjU4MTEzNjUyODYzMTdl
MDExOGY0ZWM4ZjgwOGM3IgogCiBSREVQRU5EUzoke1BOfSArPSAiIFwKICAgICBweXRob24zLWF0
dHJzIFwKLS0gCjIuNDcuMQoK

--===============3844577043844856262==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.168.3.dist-info -> /usr/lib/python3.14/site-packages/hypothesis-6.168.5.dist-info, directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.168.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/hypothesis-6.168.5.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.14/site-packages/hypothesis-6.168.3.dist-info moved to /usr/lib/python3.14/site-packages/hypothesis-6.168.5.dist-info

--===============3844577043844856262==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis: PV changed from "6.168.3" to "6.168.5"
packages/x86-64-v3-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.168.3.tar.gz crate://crates.io/cfg-if/1.0.4 crate://crates.io/crunchy/0.2.4 crate://crates.io/getrandom/0.3.4 crate://crates.io/half/2.7.1 crate://crates.io/heck/0.5.0 crate://crates.io/libc/0.2.186 crate://crates.io/once_cell/1.21.4 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/ppv-lite86/0.2.21 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/pyo3/0.29.2 crate://crates.io/pyo3-build-config/0.29.2 crate://crates.io/pyo3-ffi/0.29.2 crate://crates.io/pyo3-macros/0.29.2 crate://crates.io/pyo3-macros-backend/0.29.2 crate://crates.io/quote/1.0.46 crate://crates.io/r-efi/5.3.0 crate://crates.io/rand/0.9.4 crate://crates.io/rand_chacha/0.9.0 crate://crates.io/rand_core/0.9.5 crate://crates.io/syn/2.0.118 crate://crates.io/target-lexicon/0.13.5 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/wasip2/1.0.4+wasi-0.2.12 cra
 te://crates.io/wit-bindgen/0.57.1 crate://crates.io/zerocopy/0.8.53 crate://crates.io/zerocopy-derive/0.8.53 file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.168.5.tar.gz crate://crates.io/cfg-if/1.0.4 crate://crates.io/crunchy/0.2.4 crate://crates.io/getrandom/0.3.4 crate://crates.io/half/2.7.1 crate://crates.io/heck/0.5.0 crate://crates.io/libc/0.2.186 crate://crates.io/once_cell/1.21.4 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/ppv-lite86/0.2.21 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/pyo3/0.29.3 crate://crates.io/pyo3-build-config/0.29.3 crate://crates.io/pyo3-ffi/0.29.3 crate://crates.io/pyo3-macros/0.29.3 crate://crates.io/pyo3-macros-backend/0.29.3 crate://crates.io/quote/1.0.46 crate://crates.io/r-efi/5.3.0 crate://crates.io/rand/0.9.4 crate://crates.io/rand_chacha/0.9.0 crate://crates.io/rand_core/0.9.5 crate://crates.io/syn/2.0.118 crate://crates.io/target-lexicon/0
 .13.5 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/wasip2/1.0.4+wasi-0.2.12 crate://crates.io/wit-bindgen/0.57.1 crate://crates.io/zerocopy/0.8.53 crate://crates.io/zerocopy-derive/0.8.53 file://test_binary_search.py file://test_rle.py"
packages/x86-64-v3-poky-linux/python3-hypothesis: PKGV changed from 6.168.3 [default] to 6.168.5 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.168.3" to "6.168.5"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGSIZE changed from 118544 to 118464 (-0%)
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.168.3 [default] to 6.168.5 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.168.3" to "6.168.5"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.168.3 [default] to 6.168.5 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.168.3" to "6.168.5"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.168.3 [default] to 6.168.5 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.168.3" to "6.168.5"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.168.3 [default] to 6.168.5 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.168.3" to "6.168.5"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.168.3 [default] to 6.168.5 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.168.3" to "6.168.5"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.168.3 [default] to 6.168.5 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.168.3" to "6.168.5"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.168.3 [default] to 6.168.5 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.168.3" to "6.168.5"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 4583511 to 4583448 (-0%)
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.168.3 [default] to 6.168.5 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.168.3.dist-info -> /usr/lib/python3.14/site-packages/hypothesis-6.168.5.dist-info, directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.168.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/hypothesis-6.168.5.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.14/site-packages/hypothesis-6.168.3.dist-info moved to /usr/lib/python3.14/site-packages/hypothesis-6.168.5.dist-info

--===============3844577043844856262==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 958 .bb files complete (0 cached, 958 parsed). 1992 targets, 66 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-9e8242149ea73ce98e56b8b1f85f5285994be312"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:9e8242149ea73ce98e56b8b1f85f5285994be312"
meta-yocto-bsp       
meta-poky            = "master:49a2b44583968d321b3195bfd0cb2232dff13950"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 731 Local 493 Mirrors 0 Missed 238 Current 284 (67% match, 76% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 382 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.5.bb:do_populate_lic_setscene)
NOTE: Running setscene task 416 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb:do_packagedata_setscene)
NOTE: Running setscene task 429 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 431 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 433 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 437 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 455 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatch-vcs_0.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 468 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 477 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 480 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 487 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 490 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 491 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 494 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 497 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_25.1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 507 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe ca-certificates-20260816-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2026e-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe binutils-2.47-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-hypothesis-6.168.5-r0: task do_populate_lic_setscene: Started
NOTE: recipe elfutils-0.196-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-hatch-fancy-pypi-readme-native-25.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 513 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_recipe_qa_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 515 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe ca-certificates-20260816-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 520 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 524 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-2.47-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 528 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 530 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 532 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe coreutils-9.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe elfutils-0.196-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 535 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 536 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-hypothesis-6.168.5-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe tzdata-2026e-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 538 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 541 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 547 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe python3-hatch-fancy-pypi-readme-native-25.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 548 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_25.1.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 552 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 558 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatch-vcs_0.5.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 561 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-packaging-26.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-packaging-26.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 563 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcxx-native-23.1.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-hatch-fancy-pypi-readme-native-25.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe sed-4.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 565 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pygments-2.21.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 567 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 568 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 571 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gcc-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 572 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-colorama-0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 577 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 579 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.5.bb:do_create_recipe_spdx_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 581 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 582 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcxx-native-23.1.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 583 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 585 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatch-vcs_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-hatch-fancy-pypi-readme-native-25.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 587 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 589 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 597 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-16.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 598 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.32.4.bb:do_create_spdx_setscene)
NOTE: recipe openssl-4.0.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe expat-2.8.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe elfutils-0.196-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 599 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.12.bb:do_recipe_qa_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-16.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 605 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 608 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 609 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.1.2.bb:do_create_spdx_setscene)
NOTE: recipe libcap-2.78-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe json-c-0.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 610 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 611 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 613 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe openssl-4.0.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libmpc-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe elfutils-0.196-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 615 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 617 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 618 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.98.1.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.8.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 620 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 621 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.98.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 624 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-hatchling-native-1.32.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 626 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe qemu-native-11.1.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe binutils-2.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 629 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-hatchling-native-1.32.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.10-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 632 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.98.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.98.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 633 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe qemu-native-11.1.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 634 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe acl-2.4.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe binutils-2.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 635 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 636 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 637 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 638 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.1.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe sed-4.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 639 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 642 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 646 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libstd-rs-1.98.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 650 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_26.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.98.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 655 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 657 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libarchive-3.8.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 663 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe qemu-native-11.1.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 664 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 666 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 668 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe compiler-rt-native-23.1.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-attrs-26.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.8.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 669 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.32.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libcxx-native-23.1.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 670 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_25.1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.78-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe qemu-native-11.1.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 671 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 675 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 677 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 678 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmpc-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-attrs-26.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe compiler-rt-native-23.1.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 680 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 682 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 687 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 689 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcxx-native-23.1.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 690 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-hatchling-native-1.32.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 692 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-hatch-fancy-pypi-readme-native-25.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 693 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 694 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 700 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe expat-2.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-hatchling-native-1.32.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 709 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 714 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 717 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatch-vcs_0.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 718 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 720 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.6.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 724 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-hatch-fancy-pypi-readme-native-25.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 726 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 727 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_create_spdx_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 728 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe file-5.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 731 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcxx-23.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 732 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 738 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 739 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 743 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 745 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 748 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 749 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libcxx-23.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 750 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-setuptools-scm-native-10.3.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 751 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe compiler-rt-native-23.1.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.22.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 752 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/clang_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 755 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libseccomp-2.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-setuptools-scm-native-10.3.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 757 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libarchive-3.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-4.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe compiler-rt-native-23.1.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 759 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 760 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 761 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_25.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.22.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 763 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcxx-23.1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 764 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 765 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 766 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.20.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 767 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libarchive-3.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 768 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.32.4.bb:do_populate_sysroot_setscene)
NOTE: recipe clang-native-23.1.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 769 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libcxx-23.1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 772 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 776 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.20.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 777 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnutls-3.8.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-hatch-fancy-pypi-readme-native-25.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe clang-native-23.1.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 778 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 779 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-hatchling-native-1.32.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 784 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-hatch-fancy-pypi-readme-native-25.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 785 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnutls-3.8.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 787 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 788 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libpsl-0.23.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 790 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 791 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 793 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_populate_sysroot_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 794 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 795 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-4.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 796 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 797 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 799 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 800 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.8.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 801 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-hatchling-native-1.32.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 803 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-scm-native-10.3.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 804 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 805 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 806 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcxx-native-23.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 807 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.8.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 808 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe file-5.48-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 812 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-setuptools-scm-native-10.3.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 813 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2026.9.21.13.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 814 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 815 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.48-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 818 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 819 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 820 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 821 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe curl-8.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 822 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 823 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 824 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.14.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 825 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.8.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-trove-classifiers-native-2026.9.21.13-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 829 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe nettle-4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 830 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 831 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 833 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe qemu-native-11.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-16.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 834 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe compiler-rt-23.1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 835 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 837 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 838 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/clang_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.20.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-trove-classifiers-native-2026.9.21.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 840 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 841 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 845 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 846 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe compiler-rt-23.1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 847 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.32.4.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-16.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 848 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcxx-native-23.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 849 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.20.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 850 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pathspec_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 852 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 857 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-tomlkit_0.15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-4.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe clang-native-23.1.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe compiler-rt-23.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 858 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 860 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_create_spdx_setscene)
NOTE: recipe attr-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 862 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 863 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libpam-1.7.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-hatchling-native-1.32.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-4.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 866 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 867 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-calver_2025.10.20.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pathspec-native-1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe clang-native-23.1.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 868 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe compiler-rt-23.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 869 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 871 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe python3-tomlkit-native-0.15.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-hatchling-native-1.32.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 872 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 873 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2026.9.21.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 876 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 877 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 879 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pathspec-native-1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 880 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 885 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_recipe_qa_setscene)
NOTE: recipe qemu-native-11.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 887 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-tomlkit-native-0.15.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 889 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 893 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 894 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 895 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-trove-classifiers-native-2026.9.21.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 896 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 897 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 901 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 906 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 908 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 912 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-trove-classifiers-native-2026.9.21.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 925 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-calver_2025.10.20.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 929 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_packagedata_setscene)
NOTE: recipe libcxx-native-23.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe compiler-rt-native-23.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-4.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-native-1_2.90.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 930 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-tomlkit_0.15.1.bb:do_recipe_qa_setscene)
NOTE: recipe libcxx-native-23.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 931 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 932 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.bb:do_create_recipe_spdx_setscene)
NOTE: recipe attr-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 933 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake-native_4.4.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-poetry-core-native-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 934 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pathspec_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-4.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 937 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.1.bb:do_create_spdx_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 941 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe compiler-rt-native-23.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 942 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 943 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 947 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/clang_git.bb:do_populate_sysroot_setscene)
NOTE: recipe cmake-native-4.4.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 949 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 952 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-tomlkit-native-0.15.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe autoconf-archive-native-2024.10.16-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 954 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pathspec-native-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cmake-native-4.4.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 956 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_recipe_spdx_setscene)
NOTE: recipe meson-native-1.12.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-tomlkit-native-0.15.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe autoconf-archive-native-2024.10.16-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe compiler-rt-native-23.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-native-1_2.90.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-poetry-core-native-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 961 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 962 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_packagedata_setscene)
NOTE: recipe clang-native-23.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pathspec-native-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 963 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe meson-native-1.12.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 964 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 965 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_create_spdx_setscene)
NOTE: recipe compiler-rt-native-23.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 970 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.47.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-native-1.0.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-poetry-core-native-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 976 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-arm-2.47-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe meson-native-1.12.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-native-1.0.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-poetry-core-native-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 978 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe binutils-cross-arm-2.47-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe meson-native-1.12.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 980 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running task 562 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: recipe util-linux-native-2.42.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: Running task 670 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_fetch)
NOTE: Running task 672 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.5.bb:do_fetch)
NOTE: Running task 686 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_fetch)
NOTE: Running task 721 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_fetch)
NOTE: Running task 723 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 725 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_fetch)
NOTE: Running task 727 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_fetch)
NOTE: Running task 729 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_fetch)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Started
NOTE: Running setscene task 982 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 983 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running task 797 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_fetch)
NOTE: recipe zlib-1.3.2-r0: task do_fetch: Started
NOTE: recipe expat-2.8.5-r0: task do_fetch: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-4.0.3-r0: task do_fetch: Started
NOTE: Running setscene task 985 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.8.5-r0: task do_fetch: Succeeded
NOTE: Running setscene task 986 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: Running setscene task 987 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.4-r0: task do_fetch: Started
NOTE: recipe attr-2.6.0-r0: task do_fetch: Started
NOTE: recipe gdbm-1.26-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 798 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.5.bb:do_unpack)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_fetch: Succeeded
NOTE: Running task 799 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_unpack)
NOTE: Running task 800 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_unpack)
NOTE: recipe ncurses-6.6-r0: task do_fetch: Started
NOTE: recipe xz-5.8.4-r0: task do_fetch: Succeeded
NOTE: Running task 801 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_unpack)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 804 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_unpack)
NOTE: recipe expat-2.8.5-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.2-r0: task do_unpack: Started
NOTE: recipe attr-2.6.0-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 805 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: Running task 806 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 989 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.4-r0: task do_unpack: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 990 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_recipe_qa_setscene)
NOTE: Running task 807 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_patch)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 808 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_patch)
NOTE: recipe linux-libc-headers-7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_unpack: Started
NOTE: Running task 827 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/rust-source_1.98.1.bb:do_fetch)
NOTE: Running task 847 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_fetch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Started
NOTE: recipe util-linux-native-2.42.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 994 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.37.0.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.8.5-r0: task do_unpack: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 852 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.5.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe gdbm-1.26-r0: task do_unpack: Succeeded
NOTE: recipe rust-source-1.98.1-1.98.1-r0: task do_fetch: Started
NOTE: Running task 853 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_patch)
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_patch: Started
NOTE: recipe xz-5.8.4-r0: task do_unpack: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_fetch: Succeeded
NOTE: Running task 854 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_patch)
NOTE: Running task 855 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_unpack)
NOTE: recipe attr-2.6.0-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_fetch: Succeeded
NOTE: Running task 857 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 863 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_fetch)
NOTE: recipe gtk-doc-native-1.37.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_patch: Started
NOTE: recipe expat-2.8.5-r0: task do_patch: Started
NOTE: recipe zlib-1.3.2-r0: task do_patch: Succeeded
NOTE: Running task 865 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_fetch)
NOTE: recipe xz-5.8.4-r0: task do_patch: Started
NOTE: recipe ncurses-6.6-r0: task do_unpack: Started
NOTE: recipe attr-2.6.0-r0: task do_patch: Succeeded
NOTE: Running task 867 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_fetch)
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: Running setscene task 997 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-4.0.3-r0: task do_fetch: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_fetch: Started
NOTE: Running setscene task 998 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 999 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1000 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_fetch: Started
NOTE: recipe expat-2.8.5-r0: task do_patch: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_fetch: Started
NOTE: recipe xz-5.8.4-r0: task do_patch: Succeeded
NOTE: recipe gtk-doc-native-1.37.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 879 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_unpack)
NOTE: Running task 882 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.5.bb:do_generate_toolchain_file)
NOTE: Running setscene task 1004 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_fetch: Succeeded
NOTE: Running task 889 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_fetch)
NOTE: Running task 891 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_fetch)
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 898 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_fetch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-4.0.3-r0: task do_unpack: Started
NOTE: recipe expat-2.8.5-r0: task do_generate_toolchain_file: Started
NOTE: Running task 904 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_fetch)
NOTE: recipe acl-2.4.0-r0: task do_fetch: Started
NOTE: recipe meson-native-1.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_fetch: Succeeded
NOTE: recipe nettle-4.0-r0: task do_fetch: Started
NOTE: Running task 906 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_fetch)
NOTE: recipe expat-2.8.5-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_fetch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1006 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running task 925 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_unpack)
NOTE: recipe nettle-4.0-r0: task do_fetch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 926 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: recipe python3-3.14.7-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1008 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running task 927 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_unpack)
NOTE: recipe libseccomp-2.6.1-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1010 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_fetch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_unpack: Started
NOTE: Running task 928 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_unpack: Started
NOTE: recipe libunistring-1.4.2-r0: task do_fetch: Succeeded
NOTE: Running task 929 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_unpack)
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe meson-native-1.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_unpack: Succeeded
NOTE: Running task 954 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1007 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_unpack)
NOTE: Running task 1008 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_patch)
NOTE: Running task 1009 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_unpack)
NOTE: Running task 1015 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_unpack)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_unpack: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: Running task 1016 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_patch)
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_unpack: Started
NOTE: Running task 1067 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_unpack: Started
NOTE: recipe acl-2.4.0-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_patch: Started
NOTE: recipe libffi-3.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 1068 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe opkg-utils-0.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.14.7-r0: task do_unpack: Started
NOTE: recipe acl-2.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 1069 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libseccomp-2.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 1070 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe zlib-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: Running task 1072 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1080 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_patch)
NOTE: recipe libedit-20260512-3.1-r0: task do_patch: Succeeded
NOTE: recipe openssl-4.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1081 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_patch)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_patch: Succeeded
NOTE: Running task 1085 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_unpack)
NOTE: recipe gdbm-1.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_patch: Started
NOTE: recipe expat-2.8.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1086 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_configure)
NOTE: recipe opkg-utils-0.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_patch: Started
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Succeeded
NOTE: recipe nettle-4.0-r0: task do_unpack: Started
NOTE: Running task 1087 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_patch)
NOTE: Running task 1088 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_configure)
NOTE: recipe ncurses-6.6-r0: task do_unpack: Succeeded
NOTE: Running task 1089 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_patch)
NOTE: recipe zlib-1.3.2-r0: task do_configure: Started
NOTE: recipe acl-2.4.0-r0: task do_patch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_configure: Started
NOTE: Running task 1090 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_unpack)
NOTE: recipe nettle-4.0-r0: task do_unpack: Succeeded
NOTE: Running task 1091 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_patch)
NOTE: recipe libffi-3.8.0-r0: task do_patch: Succeeded
NOTE: Running task 1092 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_unpack)
NOTE: recipe ncurses-6.6-r0: task do_patch: Started
NOTE: recipe gdbm-1.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe openssl-4.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1093 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_configure)
NOTE: Running task 1104 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_fetch)
NOTE: recipe libseccomp-2.6.1-r0: task do_unpack: Started
NOTE: Running task 1105 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_compile)
NOTE: recipe clang-native-23.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1011 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-4.0-r0: task do_patch: Started
NOTE: recipe libunistring-1.4.2-r0: task do_unpack: Started
NOTE: recipe expat-2.8.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 1013 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/clang_git.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Succeeded
NOTE: Running task 1106 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm-project-source.bb:do_fetch)
NOTE: recipe binutils-native-2.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe llvm-project-source-23.1.2-23.1.2-r0: task do_fetch: Started
NOTE: recipe clang-native-23.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1107 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_install)
NOTE: recipe nettle-4.0-r0: task do_patch: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_unpack: Succeeded
NOTE: recipe clang-native-23.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-4.0.3-r0: task do_unpack: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_patch: Succeeded
NOTE: recipe binutils-native-2.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_unpack: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_configure: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_patch: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1015 of 1015 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_recipe_qa_setscene)
NOTE: Running task 1108 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_patch)
NOTE: Running task 1109 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.5.bb:do_configure)
NOTE: Running task 1110 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_configure_ptest_base)
NOTE: Running task 1112 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_patch)
NOTE: Running task 1113 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_patch)
NOTE: Running task 1114 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_patch)
NOTE: Running task 1116 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_fetch)
NOTE: Running task 1158 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_unpack)
NOTE: Running task 1160 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe opkg-utils-0.7.0-r0: task do_install: Started
NOTE: recipe zlib-1.3.2-r0: task do_configure_ptest_base: Started
NOTE: recipe openssl-4.0.3-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_patch: Started
NOTE: recipe expat-2.8.5-r0: task do_configure: Started
NOTE: recipe libunistring-1.4.2-r0: task do_patch: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_patch: Started
NOTE: recipe binutils-native-2.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.3-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libpam-1.7.3-r0: task do_fetch: Succeeded
NOTE: Running task 1161 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_unpack)
NOTE: Running task 1162 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_compile)
NOTE: recipe binutils-native-2.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1174 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libunistring-1.4.2-r0: task do_patch: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_patch: Succeeded
NOTE: Running task 1177 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1178 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_install: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Succeeded
NOTE: recipe libpam-1.7.3-r0: task do_unpack: Started
NOTE: Running task 1179 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_patch)
NOTE: Running task 1180 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_configure)
NOTE: recipe gmp-6.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1182 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe openssl-4.0.3-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.14.7-r0: task do_unpack: Succeeded
NOTE: Running task 1184 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_configure)
NOTE: Running task 1185 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_configure: Started
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpam-1.7.3-r0: task do_unpack: Succeeded
NOTE: Running task 1186 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe openssl-4.0.3-r0: task do_configure: Started
NOTE: recipe xz-5.8.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Succeeded
NOTE: Running task 1187 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gmp-6.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1188 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_patch)
NOTE: recipe libffi-3.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1189 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_patch)
NOTE: Running task 1190 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_configure)
NOTE: recipe ncurses-6.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_patch: Succeeded
NOTE: Running task 1192 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_configure)
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1193 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure)
NOTE: recipe python3-3.14.7-r0: task do_patch: Started
NOTE: recipe libpam-1.7.3-r0: task do_patch: Started
NOTE: recipe gmp-6.3.0-r0: task do_configure: Started
NOTE: recipe xz-5.8.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1194 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_configure)
NOTE: recipe libffi-3.8.0-r0: task do_configure: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Started
NOTE: recipe attr-2.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1195 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_configure)
NOTE: recipe libpam-1.7.3-r0: task do_patch: Succeeded
NOTE: Running task 1196 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_configure)
NOTE: recipe xz-5.8.4-r0: task do_configure: Started
NOTE: recipe ncurses-6.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1197 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_configure)
NOTE: recipe llvm-project-source-23.1.2-23.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 1198 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm-project-source.bb:do_unpack)
NOTE: recipe attr-2.6.0-r0: task do_configure: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_configure: Started
NOTE: recipe llvm-project-source-23.1.2-23.1.2-r0: task do_unpack: Started
NOTE: recipe rust-source-1.98.1-1.98.1-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_configure: Started
NOTE: Running task 1199 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/rust-source_1.98.1.bb:do_unpack)
NOTE: recipe zlib-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 1200 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_compile_ptest_base)
NOTE: recipe rust-source-1.98.1-1.98.1-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.2-r0: task do_compile_ptest_base: Started
NOTE: recipe zlib-1.3.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1201 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_install)
NOTE: recipe zlib-1.3.2-r0: task do_install: Started
NOTE: recipe python3-3.14.7-r0: task do_patch: Succeeded
NOTE: Running task 1213 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe zlib-1.3.2-r0: task do_install: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1214 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_install_ptest_base)
NOTE: recipe zlib-1.3.2-r0: task do_install_ptest_base: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1215 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_configure)
NOTE: Running task 1220 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe expat-2.8.5-r0: task do_configure: Succeeded
NOTE: Running task 1221 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.5.bb:do_configure_ptest_base)
NOTE: recipe libseccomp-2.6.1-r0: task do_configure: Started
NOTE: recipe libunistring-1.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.8.5-r0: task do_configure_ptest_base: Started
NOTE: recipe expat-2.8.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1222 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.5.bb:do_compile)
NOTE: recipe libunistring-1.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1223 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_configure)
NOTE: recipe expat-2.8.5-r0: task do_compile: Started
NOTE: recipe libunistring-1.4.2-r0: task do_configure: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_configure: Succeeded
NOTE: Running task 1224 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_compile)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_compile: Started
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Succeeded
NOTE: Running task 1225 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_unpack)
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Succeeded
NOTE: Running task 1226 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_patch)
NOTE: recipe zstd-1.5.7-r0: task do_patch: Started
NOTE: recipe zstd-1.5.7-r0: task do_patch: Succeeded
NOTE: Running task 1228 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe expat-2.8.5-r0: task do_compile: Succeeded
NOTE: Running task 1229 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.5.bb:do_compile_ptest_base)
NOTE: recipe zstd-1.5.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.8.5-r0: task do_compile_ptest_base: Started
NOTE: recipe expat-2.8.5-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1230 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.5.bb:do_install)
NOTE: Running task 1231 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_configure)
NOTE: recipe zstd-1.5.7-r0: task do_configure: Started
NOTE: recipe expat-2.8.5-r0: task do_install: Started
NOTE: recipe zstd-1.5.7-r0: task do_configure: Succeeded
NOTE: Running task 1232 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_configure_ptest_base)
NOTE: recipe zstd-1.5.7-r0: task do_configure_ptest_base: Started
NOTE: recipe expat-2.8.5-r0: task do_install: Succeeded
NOTE: Running task 1233 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.5.bb:do_install_ptest_base)
NOTE: recipe zstd-1.5.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1234 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_compile)
NOTE: recipe expat-2.8.5-r0: task do_install_ptest_base: Started
NOTE: recipe zstd-1.5.7-r0: task do_compile: Started
NOTE: recipe expat-2.8.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1242 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/clang-cross_git.bb:do_recipe_qa)
NOTE: recipe clang-cross-arm-git-r0: task do_recipe_qa: Started
NOTE: recipe clang-cross-arm-git-r0: task do_recipe_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/clang-cross_git.bb:do_recipe_qa unihash changed to 028e1bd5e1881c7e97fcc72a6d548f6af235a01b2bdbc3344abfe86a033b99ee
NOTE: Setscene tasks completed
NOTE: Running task 1243 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/clang-cross_git.bb:do_fetch)
NOTE: recipe clang-cross-arm-git-r0: task do_fetch: Started
NOTE: recipe clang-cross-arm-git-r0: task do_fetch: Succeeded
NOTE: Running task 1268 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_fetch)
NOTE: recipe libpsl-0.23.3-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_fetch: Succeeded
NOTE: Running task 1269 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure_ptest_base)
NOTE: Running task 1272 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Started
NOTE: recipe curl-8.22.0-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe curl-8.22.0-r0: task do_fetch: Succeeded
NOTE: Running task 1279 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile)
NOTE: Running task 1283 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_write_config)
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Started
NOTE: recipe libpam-1.7.3-r0: task do_write_config: Started
NOTE: recipe libpam-1.7.3-r0: task do_write_config: Succeeded
NOTE: Running task 1284 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpam-1.7.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpam-1.7.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1285 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_configure)
NOTE: recipe libpam-1.7.3-r0: task do_configure: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Succeeded
NOTE: Running task 1286 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1287 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install)
NOTE: recipe gdbm-1.26-r0: task do_configure: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_install: Started
NOTE: Running task 1288 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_configure_ptest_base)
NOTE: recipe gdbm-1.26-r0: task do_configure_ptest_base: Started
NOTE: recipe gdbm-1.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1289 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_compile)
NOTE: recipe gdbm-1.26-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_configure: Succeeded
NOTE: Running task 1290 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_configure_ptest_base)
NOTE: Running task 1291 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_ptest_base)
NOTE: recipe attr-2.6.0-r0: task do_configure_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Started
NOTE: recipe attr-2.6.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1292 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_compile)
NOTE: recipe openssl-4.0.3-r0: task do_configure: Succeeded
NOTE: Running task 1293 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_configure_ptest_base)
NOTE: recipe attr-2.6.0-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Succeeded
NOTE: recipe openssl-4.0.3-r0: task do_configure_ptest_base: Started
NOTE: Running task 1297 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/clang-cross_git.bb:do_unpack)
NOTE: recipe openssl-4.0.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1298 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_compile)
NOTE: recipe clang-cross-arm-git-r0: task do_unpack: Started
NOTE: recipe libffi-3.8.0-r0: task do_configure: Succeeded
NOTE: recipe clang-cross-arm-git-r0: task do_unpack: Succeeded
NOTE: Running task 1300 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/clang-cross_git.bb:do_patch)
NOTE: Running task 1301 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_compile)
NOTE: recipe clang-cross-arm-git-r0: task do_patch: Started
NOTE: recipe libffi-3.8.0-r0: task do_compile: Started
NOTE: recipe clang-cross-arm-git-r0: task do_patch: Succeeded
NOTE: recipe openssl-4.0.3-r0: task do_compile: Started
NOTE: Running task 1312 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_unpack)
NOTE: recipe libpsl-0.23.3-r0: task do_unpack: Started
NOTE: recipe attr-2.6.0-r0: task do_compile: Succeeded
NOTE: Running task 1313 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_compile_ptest_base)
NOTE: recipe libpsl-0.23.3-r0: task do_unpack: Succeeded
NOTE: Running task 1314 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_patch)
NOTE: recipe attr-2.6.0-r0: task do_compile_ptest_base: Started
NOTE: recipe attr-2.6.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1315 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_install)
NOTE: recipe libpsl-0.23.3-r0: task do_patch: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_configure: Succeeded
NOTE: Running task 1316 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_configure_ptest_base)
NOTE: recipe attr-2.6.0-r0: task do_install: Started
NOTE: recipe libpsl-0.23.3-r0: task do_patch: Succeeded
NOTE: Running task 1317 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_unpack)
NOTE: recipe libseccomp-2.6.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe curl-8.22.0-r0: task do_unpack: Started
NOTE: Running task 1318 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_compile)
NOTE: recipe libseccomp-2.6.1-r0: task do_compile: Started
NOTE: recipe curl-8.22.0-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_compile: Succeeded
NOTE: Running task 1319 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_patch)
NOTE: Running task 1320 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_install)
NOTE: recipe gdbm-1.26-r0: task do_compile: Succeeded
NOTE: Running task 1321 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_compile_ptest_base)
NOTE: recipe curl-8.22.0-r0: task do_patch: Started
NOTE: recipe libffi-3.8.0-r0: task do_install: Started
NOTE: recipe gdbm-1.26-r0: task do_compile_ptest_base: Started
NOTE: recipe attr-2.6.0-r0: task do_install: Succeeded
NOTE: recipe curl-8.22.0-r0: task do_patch: Succeeded
NOTE: Running task 1322 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_install_ptest_base)
NOTE: Running task 1324 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_fetch)
NOTE: recipe attr-2.6.0-r0: task do_install_ptest_base: Started
NOTE: recipe json-c-0.19-r0: task do_fetch: Started
NOTE: recipe json-c-0.19-r0: task do_fetch: Succeeded
NOTE: Running task 1342 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_fetch)
NOTE: recipe attr-2.6.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1344 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtasn1-4.21.0-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_fetch: Succeeded
NOTE: Running task 1346 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_fetch)
NOTE: recipe acl-2.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.8.13-r0: task do_fetch: Started
NOTE: recipe libffi-3.8.0-r0: task do_install: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_fetch: Succeeded
NOTE: Running task 1350 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_fetch)
NOTE: Running task 1352 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_unpack)
NOTE: recipe gdbm-1.26-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1353 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_install)
NOTE: recipe libarchive-3.8.9-r0: task do_fetch: Started
NOTE: recipe json-c-0.19-r0: task do_unpack: Started
NOTE: recipe libarchive-3.8.9-r0: task do_fetch: Succeeded
NOTE: Running task 1356 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/clang-cross_git.bb:do_deploy_source_date_epoch)
NOTE: recipe acl-2.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe json-c-0.19-r0: task do_unpack: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_install: Started
NOTE: Running task 1357 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_configure)
NOTE: recipe clang-cross-arm-git-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1358 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_patch)
NOTE: recipe acl-2.4.0-r0: task do_configure: Started
NOTE: recipe libpam-1.7.3-r0: task do_configure: Succeeded
NOTE: recipe json-c-0.19-r0: task do_patch: Started
NOTE: Running task 1359 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_configure_ptest_base)
NOTE: recipe clang-cross-arm-git-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/clang-cross_git.bb:do_deploy_source_date_epoch unihash changed to 771a669695ecaaab97584cb6a082e86979b6a69a7773a182618bb993c17c2127
NOTE: recipe libpam-1.7.3-r0: task do_configure_ptest_base: Started
NOTE: Setscene tasks completed
NOTE: recipe json-c-0.19-r0: task do_patch: Succeeded
NOTE: Running task 1365 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_unpack)
NOTE: Running task 1366 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_unpack)
NOTE: recipe libpam-1.7.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1367 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_compile)
NOTE: recipe libtasn1-4.21.0-r0: task do_unpack: Started
NOTE: recipe gnutls-3.8.13-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.3-r0: task do_compile: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_unpack: Succeeded
NOTE: Running task 1368 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_patch)
NOTE: recipe libtasn1-4.21.0-r0: task do_patch: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_patch: Succeeded
NOTE: Running task 1378 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_write_config)
NOTE: recipe libpsl-0.23.3-r0: task do_write_config: Started
NOTE: recipe libpsl-0.23.3-r0: task do_write_config: Succeeded
NOTE: Running task 1382 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_unpack)
NOTE: recipe libarchive-3.8.9-r0: task do_unpack: Started
NOTE: recipe gnutls-3.8.13-r0: task do_unpack: Succeeded
NOTE: Running task 1383 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_patch)
NOTE: recipe gdbm-1.26-r0: task do_install: Succeeded
NOTE: Running task 1384 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_install_ptest_base)
NOTE: recipe gnutls-3.8.13-r0: task do_patch: Started
NOTE: recipe libarchive-3.8.9-r0: task do_unpack: Succeeded
NOTE: Running task 1385 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_patch)
NOTE: recipe gdbm-1.26-r0: task do_install_ptest_base: Started
NOTE: recipe libarchive-3.8.9-r0: task do_patch: Started
NOTE: recipe xz-5.8.4-r0: task do_configure: Succeeded
NOTE: Running task 1386 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_configure_ptest_base)
NOTE: recipe libpam-1.7.3-r0: task do_compile: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_patch: Succeeded
NOTE: Running task 1401 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_package)
NOTE: Running task 1403 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.5.bb:do_recipe_qa)
NOTE: recipe xz-5.8.4-r0: task do_configure_ptest_base: Started
NOTE: recipe xz-5.8.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1404 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_compile)
NOTE: recipe opkg-utils-0.7.0-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.168.5-r0: task do_recipe_qa: Started
NOTE: recipe xz-5.8.4-r0: task do_compile: Started
NOTE: recipe libarchive-3.8.9-r0: task do_patch: Succeeded
NOTE: Running task 1406 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_fetch)
NOTE: recipe python3-hypothesis-6.168.5-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1407 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.5.bb:do_fetch)
NOTE: recipe libcap-2.78-r0: task do_fetch: Started
NOTE: recipe libcap-2.78-r0: task do_fetch: Succeeded
NOTE: Running task 1413 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_compile_ptest_base)
NOTE: recipe python3-hypothesis-6.168.5-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.168.5-r0: task do_fetch: Succeeded
NOTE: Running noexec task 1426 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_fetch)
NOTE: recipe libpam-1.7.3-r0: task do_compile_ptest_base: Started
NOTE: Running task 1427 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_generate_toolchain_file)
NOTE: recipe compiler-rt-23.1.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe compiler-rt-23.1.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running noexec task 1430 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_fetch)
NOTE: Running task 1431 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_generate_toolchain_file)
NOTE: recipe libpam-1.7.3-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libcxx-23.1.2-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1432 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_install)
NOTE: recipe libcxx-23.1.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running noexec task 1444 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.98.1.bb:do_fetch)
NOTE: Running task 1449 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpam-1.7.3-r0: task do_install: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_compile: Succeeded
NOTE: Running task 1450 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_configure)
NOTE: Running task 1451 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_compile_ptest_base)
NOTE: recipe libtasn1-4.21.0-r0: task do_configure: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_compile_ptest_base: Started
NOTE: recipe gdbm-1.26-r0: task do_install_ptest_base: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_package: Succeeded
NOTE: Running task 1453 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_deploy_source_date_epoch)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_package unihash changed to 7428a4559a1bca4801de71940e9121b44c4505f2f68d98e4e11890130b52d3d6
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx became valid
NOTE: Running setscene task 1014 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe gnutls-3.8.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpam-1.7.3-r0: task do_install: Succeeded
NOTE: Running task 1456 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.5.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1015 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe python3-hypothesis-6.168.5-r0: task do_unpack: Started
NOTE: recipe gnutls-3.8.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_deploy_source_date_epoch unihash changed to 5b91a03851af66255bc4070f0c30628396513885ddf7e6b0a7d2a4a7f88a0c9d
NOTE: Running task 1457 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1459 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_generate_toolchain_file)
NOTE: recipe libcap-2.78-r0: task do_unpack: Started
NOTE: recipe libcap-2.78-r0: task do_unpack: Succeeded
NOTE: Running task 1460 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_patch)
NOTE: recipe json-c-0.19-r0: task do_generate_toolchain_file: Started
NOTE: recipe json-c-0.19-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1462 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-2.78-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.168.5-r0: task do_unpack: Succeeded
NOTE: Running task 1463 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.5.bb:do_patch)
NOTE: recipe libcap-2.78-r0: task do_patch: Succeeded
NOTE: Running task 1471 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_install_ptest_base)
NOTE: recipe json-c-0.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1472 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_install)
NOTE: recipe python3-hypothesis-6.168.5-r0: task do_patch: Started
NOTE: recipe libpam-1.7.3-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.168.5-r0: task do_patch: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_install: Started
NOTE: Running task 1518 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_26.1.0.bb:do_fetch)
NOTE: recipe json-c-0.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1519 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_configure)
NOTE: recipe libpam-1.7.3-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-attrs-26.1.0-r0: task do_fetch: Started
NOTE: Running task 1520 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_populate_sysroot)
NOTE: recipe python3-attrs-26.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1523 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.98.1.bb:do_rust_gen_targets)
NOTE: recipe json-c-0.19-r0: task do_configure: Started
NOTE: recipe xz-5.8.4-r0: task do_compile: Succeeded
NOTE: Running task 1524 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_compile_ptest_base)
NOTE: recipe libpam-1.7.3-r0: task do_populate_sysroot: Started
NOTE: recipe libstd-rs-1.98.1-r0: task do_rust_gen_targets: Started
NOTE: recipe libstd-rs-1.98.1-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 1526 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_fetch)
NOTE: recipe xz-5.8.4-r0: task do_compile_ptest_base: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_fetch: Succeeded
NOTE: Running task 1544 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_fetch)
NOTE: recipe lzlib-1.16-r0: task do_fetch: Started
NOTE: recipe lzlib-1.16-r0: task do_fetch: Succeeded
NOTE: Running task 1547 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_26.1.0.bb:do_unpack)
NOTE: recipe libseccomp-2.6.1-r0: task do_install: Succeeded
NOTE: Running task 1548 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_install_ptest_base)
NOTE: recipe python3-attrs-26.1.0-r0: task do_unpack: Started
NOTE: recipe python3-attrs-26.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1551 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_26.1.0.bb:do_patch)
NOTE: recipe libseccomp-2.6.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-attrs-26.1.0-r0: task do_patch: Started
NOTE: recipe libpam-1.7.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-attrs-26.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1553 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_fetch)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_populate_sysroot unihash changed to 198e0afc6f95c1efb94a5d9f50b27c07fe209fb088375a3af3614f4949fa295f
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_populate_sysroot became valid
NOTE: Running setscene task 1005 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.48-r0: task do_fetch: Started
NOTE: recipe shadow-4.20.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.20.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1013 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.78-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe llvm-project-source-23.1.2-23.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1554 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm-project-source.bb:do_patch)
NOTE: recipe libcap-2.78-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1555 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_prepare_recipe_sysroot)
NOTE: recipe llvm-project-source-23.1.2-23.1.2-r0: task do_patch: Started
NOTE: recipe libcap-2.78-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-2.78-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe file-5.48-r0: task do_fetch: Succeeded
NOTE: Running task 1564 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_fetch)
NOTE: Running task 1565 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_configure)
NOTE: recipe musl-obstack-1.2.3-r0: task do_fetch: Started
NOTE: recipe libcap-2.78-r0: task do_configure: Started
NOTE: recipe libcap-2.78-r0: task do_configure: Succeeded
NOTE: Running task 1566 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_fetch)
NOTE: recipe musl-legacy-error-1.0-r0: task do_fetch: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1567 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_fetch)
NOTE: recipe musl-obstack-1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_fetch: Started
NOTE: Running task 1568 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_fetch)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_fetch: Succeeded
NOTE: Running task 1569 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_fetch)
NOTE: recipe fts-1.2.7-r0: task do_fetch: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_fetch: Started
NOTE: recipe xz-5.8.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1570 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_install)
NOTE: recipe xz-5.8.4-r0: task do_install: Started
NOTE: recipe fts-1.2.7-r0: task do_fetch: Succeeded
NOTE: Running task 1572 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_unpack)
NOTE: recipe argp-standalone-1.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 1574 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_fetch)
NOTE: recipe base-passwd-3.6.8-r0: task do_unpack: Started
NOTE: recipe elfutils-0.196-r0: task do_fetch: Started
NOTE: recipe elfutils-0.196-r0: task do_fetch: Succeeded
NOTE: Running task 1578 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_package)
NOTE: recipe base-passwd-3.6.8-r0: task do_unpack: Succeeded
NOTE: Running task 1579 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_patch)
NOTE: recipe zlib-1.3.2-r0: task do_package: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_patch: Started
NOTE: recipe acl-2.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1580 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_configure_ptest_base)
NOTE: recipe acl-2.4.0-r0: task do_configure_ptest_base: Started
NOTE: recipe acl-2.4.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1581 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_compile)
NOTE: recipe acl-2.4.0-r0: task do_compile: Started
NOTE: recipe gmp-6.3.0-r0: task do_configure: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_patch: Succeeded
NOTE: Running task 1582 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_unpack)
NOTE: Running task 1583 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_compile)
NOTE: recipe llvm-project-source-23.1.2-23.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1584 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm-project-source.bb:do_preconfigure)
NOTE: recipe lzlib-1.16-r0: task do_unpack: Started
NOTE: recipe lzlib-1.16-r0: task do_unpack: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_compile: Started
NOTE: Running task 1585 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_patch)
NOTE: recipe llvm-project-source-23.1.2-23.1.2-r0: task do_preconfigure: Started
NOTE: recipe llvm-project-source-23.1.2-23.1.2-r0: task do_preconfigure: Succeeded
NOTE: Running task 1608 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/clang-cross_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe lzlib-1.16-r0: task do_patch: Started
NOTE: recipe clang-cross-arm-git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lzlib-1.16-r0: task do_patch: Succeeded
NOTE: Running task 1613 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: recipe clang-cross-arm-git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1614 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/clang-cross_git.bb:do_configure)
NOTE: recipe clang-cross-arm-git-r0: task do_configure: Started
NOTE: recipe clang-cross-arm-git-r0: task do_configure: Succeeded
NOTE: Running task 1615 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/clang-cross_git.bb:do_compile)
NOTE: recipe clang-cross-arm-git-r0: task do_compile: Started
NOTE: recipe clang-cross-arm-git-r0: task do_compile: Succeeded
NOTE: Running task 1616 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/clang-cross_git.bb:do_install)
NOTE: recipe json-c-0.19-r0: task do_configure: Succeeded
NOTE: Running task 1617 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_configure_ptest_base)
NOTE: recipe acl-2.4.0-r0: task do_compile: Succeeded
NOTE: recipe clang-cross-arm-git-r0: task do_install: Started
NOTE: Running task 1618 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_compile_ptest_base)
NOTE: recipe json-c-0.19-r0: task do_configure_ptest_base: Started
NOTE: recipe acl-2.4.0-r0: task do_compile_ptest_base: Started
NOTE: recipe json-c-0.19-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe clang-cross-arm-git-r0: task do_install: Succeeded
NOTE: Running task 1619 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_compile)
NOTE: Running task 1620 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/clang-cross_git.bb:do_populate_sysroot)
NOTE: recipe clang-cross-arm-git-r0: task do_populate_sysroot: Started
NOTE: recipe json-c-0.19-r0: task do_compile: Started
NOTE: recipe zlib-1.3.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_package unihash changed to 2536d83f1f968e1aa05131b6634ec19b069a9a8ab063ef84ea40d04b922290d9
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata became valid
NOTE: recipe acl-2.4.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running setscene task 1015 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: Running task 1621 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_install)
NOTE: recipe clang-cross-arm-git-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1622 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_install: Started
NOTE: recipe compiler-rt-23.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1625 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_unpack)
NOTE: recipe file-5.48-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe json-c-0.19-r0: task do_compile: Succeeded
NOTE: Running task 1626 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1628 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_package)
NOTE: recipe python3-hypothesis-6.168.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdbm-1.26-r0: task do_package: Started
NOTE: recipe compiler-rt-23.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1629 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_configure)
NOTE: recipe compiler-rt-23.1.2-r0: task do_configure: Started
NOTE: recipe acl-2.4.0-r0: task do_install: Succeeded
NOTE: Running task 1630 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_install_ptest_base)
NOTE: recipe python3-hypothesis-6.168.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1631 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.5.bb:do_package)
NOTE: recipe acl-2.4.0-r0: task do_install_ptest_base: Started
NOTE: recipe file-5.48-r0: task do_unpack: Succeeded
NOTE: Running task 1632 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_patch)
NOTE: recipe expat-2.8.5-r0: task do_package: Started
NOTE: recipe file-5.48-r0: task do_patch: Started
NOTE: recipe file-5.48-r0: task do_patch: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1633 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_package)
NOTE: Running task 1637 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe libffi-3.8.0-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1638 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_fetch)
NOTE: recipe shadow-4.20.3-r0: task do_fetch: Started
NOTE: recipe shadow-4.20.3-r0: task do_fetch: Succeeded
NOTE: Running task 1639 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.5.bb:do_rust_gen_targets)
NOTE: recipe python3-hypothesis-6.168.5-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-hypothesis-6.168.5-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 1641 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_configure_ptest_base)
NOTE: recipe libcap-2.78-r0: task do_configure_ptest_base: Started
NOTE: recipe libcap-2.78-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: Running task 1642 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_compile)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package unihash changed to 4a7fd08eaa8c02801e638445b81289bc96c563af453ce9cb4763674ff9337899
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata became valid
NOTE: recipe libcap-2.78-r0: task do_compile: Started
NOTE: recipe xz-5.8.4-r0: task do_install: Succeeded
NOTE: Running setscene task 1015 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running task 1643 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_install_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_install_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1645 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_unpack)
NOTE: recipe musl-obstack-1.2.3-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_configure: Succeeded
NOTE: recipe expat-2.8.5-r0: task do_package: Succeeded
NOTE: Running task 1646 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_compile)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.5.bb:do_package unihash changed to 44845c53c6f3bb7d9931803ee8d1fbfa89a0137b5b151dad41d11977e3af455a
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.5.bb:do_packagedata became valid
NOTE: recipe musl-obstack-1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_compile: Started
NOTE: Running setscene task 1015 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.5.bb:do_packagedata_setscene)
NOTE: Running task 1647 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_unpack)
NOTE: recipe musl-legacy-error-1.0-r0: task do_unpack: Started
NOTE: recipe expat-2.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1648 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_unpack)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/expat/2.8.5/temp/log.do_packagedata_setscene.1100731
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.5.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Setscene tasks completed
NOTE: Running task 1649 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.5.bb:do_packagedata)
NOTE: recipe expat-2.8.5-r0: task do_packagedata: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_unpack: Succeeded
NOTE: Running task 1650 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_unpack)
NOTE: recipe libffi-3.8.0-r0: task do_package: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_unpack: Started
NOTE: recipe xz-5.8.4-r0: task do_install_ptest_base: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_package unihash changed to 58acab68a25d8334d170b283ddd2a372bbbf047087730d3429f74b1e29c45e3c
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_packagedata became valid
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_compile: Succeeded
NOTE: Running setscene task 1015 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_packagedata_setscene)
NOTE: recipe expat-2.8.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1652 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_install)
NOTE: Running task 1653 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_package)
NOTE: Running task 1654 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_unpack)
NOTE: recipe libffi-3.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_unpack: Started
NOTE: recipe xz-5.8.4-r0: task do_package: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_install: Started
NOTE: recipe libcap-2.78-r0: task do_compile: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1655 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_patch)
NOTE: Running task 1657 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_patch)
NOTE: recipe musl-legacy-error-1.0-r0: task do_patch: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_patch: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_patch: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_patch: Succeeded
NOTE: Running task 1658 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_patch)
NOTE: Running task 1659 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_compile_ptest_base)
NOTE: recipe fts-1.2.7-r0: task do_unpack: Succeeded
NOTE: Running task 1660 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_patch)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_patch: Started
NOTE: recipe json-c-0.19-r0: task do_compile_ptest_base: Started
NOTE: recipe fts-1.2.7-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_patch: Succeeded
NOTE: recipe json-c-0.19-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1661 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_unpack)
NOTE: Running task 1662 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_install)
NOTE: recipe fts-1.2.7-r0: task do_patch: Succeeded
NOTE: Running task 1663 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_26.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gdbm-1.26-r0: task do_package: Succeeded
NOTE: recipe elfutils-0.196-r0: task do_unpack: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 1664 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_patch)
NOTE: recipe json-c-0.19-r0: task do_install: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_package unihash changed to 201b4cf9a17715999eecfac1a0fa4fe6bcc2d9c41eb5bf9d15d6c2dc28f98785
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata became valid
NOTE: recipe python3-attrs-26.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_patch: Started
NOTE: Running setscene task 1015 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_patch: Succeeded
NOTE: recipe python3-attrs-26.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe json-c-0.19-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_26.1.0.bb:do_deploy_source_date_epoch unihash changed to 82ff7dc84ebea0bb50c2a8fd50dd0433c31a552a30d49e002614c7722a3817d2
NOTE: Running task 1679 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1680 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1681 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_unpack)
NOTE: recipe base-passwd-3.6.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.20.3-r0: task do_unpack: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: Setscene tasks completed
NOTE: Running task 1690 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_fetch)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_install: Succeeded
NOTE: Running task 1692 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_package)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1693 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe psmisc-23.7-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_package: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1694 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_configure)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1695 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_fetch)
NOTE: recipe base-passwd-3.6.8-r0: task do_configure: Started
NOTE: recipe psmisc-23.7-r0: task do_fetch: Succeeded
NOTE: Running task 1696 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_fetch)
NOTE: recipe python3-packaging-26.3-r0: task do_fetch: Started
NOTE: recipe python3-packaging-26.3-r0: task do_fetch: Succeeded
NOTE: Running task 1697 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.12.bb:do_fetch)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_fetch: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 1698 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_fetch)
NOTE: recipe elfutils-0.196-r0: task do_unpack: Succeeded
NOTE: Running task 1699 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_patch)
NOTE: recipe coreutils-9.12-r0: task do_fetch: Started
NOTE: recipe coreutils-9.12-r0: task do_fetch: Succeeded
NOTE: Running task 1700 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_fetch)
NOTE: recipe bash-5.3-r0: task do_fetch: Started
NOTE: recipe bash-5.3-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.196-r0: task do_patch: Started
NOTE: Running task 1707 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe sed-4.10-r0: task do_fetch: Started
NOTE: recipe sed-4.10-r0: task do_fetch: Succeeded
NOTE: Running task 1714 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_compile_ptest_base)
NOTE: recipe lzlib-1.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.20.3-r0: task do_unpack: Succeeded
NOTE: Running task 1715 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_patch)
NOTE: recipe libcap-2.78-r0: task do_compile_ptest_base: Started
NOTE: recipe lzlib-1.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shadow-4.20.3-r0: task do_patch: Started
NOTE: Running task 1716 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_configure)
NOTE: recipe lzlib-1.16-r0: task do_configure: Started
NOTE: recipe shadow-4.20.3-r0: task do_patch: Succeeded
NOTE: Running task 1718 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_prepare_recipe_sysroot)
NOTE: recipe lzlib-1.16-r0: task do_configure: Succeeded
NOTE: Running task 1719 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_compile)
NOTE: recipe musl-obstack-1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lzlib-1.16-r0: task do_compile: Started
NOTE: recipe elfutils-0.196-r0: task do_patch: Succeeded
NOTE: Running task 1721 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_prepare_recipe_sysroot)
NOTE: recipe musl-obstack-1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1724 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe musl-legacy-error-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1726 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe fts-1.2.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-2.78-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_compile: Succeeded
NOTE: Running task 1727 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_install)
NOTE: Running task 1728 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_install)
NOTE: recipe fts-1.2.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcap-2.78-r0: task do_install: Started
NOTE: Running task 1729 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_configure)
NOTE: recipe gmp-6.3.0-r0: task do_install: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running noexec task 1730 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_configure)
NOTE: Running task 1731 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_configure)
NOTE: recipe musl-obstack-1.2.3-r0: task do_configure: Started
NOTE: recipe fts-1.2.7-r0: task do_configure: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_package unihash changed to f316bf5ae653e210b42ea1d297a417d33adcbfa9e83172c0743ee0cface8711f
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_packagedata became valid
NOTE: Running setscene task 1015 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_install: Succeeded
NOTE: Running task 1733 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1735 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_configure)
NOTE: recipe nettle-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_configure: Started
NOTE: recipe nettle-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1736 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_configure)
NOTE: recipe libcap-2.78-r0: task do_install: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_compile: Succeeded
NOTE: Running noexec task 1737 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_compile)
NOTE: Running task 1738 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_fetch)
NOTE: Running task 1739 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_compile_ptest_base)
NOTE: recipe nettle-4.0-r0: task do_configure: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.7-r0: task do_compile_ptest_base: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1740 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_install_ptest_base)
NOTE: recipe ncurses-6.6-r0: task do_configure: Succeeded
NOTE: Running task 1741 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_compile)
NOTE: recipe json-c-0.19-r0: task do_install_ptest_base: Started
NOTE: recipe ncurses-6.6-r0: task do_compile: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_configure: Succeeded
NOTE: Running task 1742 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_compile)
NOTE: recipe lzlib-1.16-r0: task do_compile: Succeeded
NOTE: Running task 1743 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_install)
NOTE: recipe base-passwd-3.6.8-r0: task do_compile: Started
NOTE: recipe json-c-0.19-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1744 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_install)
NOTE: recipe lzlib-1.16-r0: task do_install: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_install: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_install: Succeeded
NOTE: Running task 1746 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_populate_sysroot)
NOTE: recipe lzlib-1.16-r0: task do_install: Succeeded
NOTE: recipe json-c-0.19-r0: task do_populate_sysroot: Started
NOTE: Running task 1753 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_fetch)
NOTE: recipe base-passwd-3.6.8-r0: task do_compile: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_package: Succeeded
NOTE: Running task 1754 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_install)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_fetch: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_package unihash changed to d5e52b2f6de45e440e4bcd388a43806365e72860c1ab97cc3355e8b276a3f824
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_packagedata became valid
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_fetch: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_install: Started
NOTE: Running setscene task 1015 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_packagedata_setscene)
NOTE: Running task 1755 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_unpack)
NOTE: recipe json-c-0.19-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_packagedata_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_populate_sysroot unihash changed to 9edab3cefcfb427795107c7b525507ef6ee7d18f1a49810e78f3dc0cfaf1b29d
NOTE: recipe psmisc-23.7-r0: task do_unpack: Started
NOTE: Running task 1756 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_unpack)
NOTE: recipe base-passwd-3.6.8-r0: task do_install: Succeeded
NOTE: Running task 1758 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_unpack)
NOTE: recipe python3-packaging-26.3-r0: task do_unpack: Started
NOTE: recipe python3-packaging-26.3-r0: task do_unpack: Succeeded
NOTE: Running task 1759 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.12.bb:do_unpack)
NOTE: recipe xz-5.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1761 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_unpack)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_unpack: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 1762 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_unpack)
NOTE: recipe bash-5.3-r0: task do_unpack: Started
NOTE: recipe coreutils-9.12-r0: task do_unpack: Started
NOTE: recipe sed-4.10-r0: task do_unpack: Started
NOTE: recipe sed-4.10-r0: task do_unpack: Succeeded
NOTE: Running task 1763 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_patch)
NOTE: recipe bash-5.3-r0: task do_unpack: Succeeded
NOTE: Running task 1764 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_patch)
NOTE: recipe python3-packaging-26.3-r0: task do_patch: Started
NOTE: recipe psmisc-23.7-r0: task do_unpack: Succeeded
NOTE: Running task 1765 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_patch)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_patch: Started
NOTE: recipe psmisc-23.7-r0: task do_patch: Started
NOTE: recipe python3-packaging-26.3-r0: task do_patch: Succeeded
NOTE: Running task 1766 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_patch)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_patch: Succeeded
NOTE: Running task 1767 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_patch)
NOTE: recipe coreutils-9.12-r0: task do_unpack: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_patch: Succeeded
NOTE: Running task 1768 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.12.bb:do_patch)
NOTE: Running task 1770 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_fetch)
NOTE: recipe bash-5.3-r0: task do_patch: Started
NOTE: recipe sed-4.10-r0: task do_patch: Started
NOTE: recipe mpfr-4.2.2-r0: task do_fetch: Started
NOTE: recipe coreutils-9.12-r0: task do_patch: Started
NOTE: recipe mpfr-4.2.2-r0: task do_fetch: Succeeded
NOTE: Running task 1775 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_fetch)
NOTE: recipe sed-4.10-r0: task do_patch: Succeeded
NOTE: Running task 1776 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_fetch)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_fetch: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_fetch: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1787 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_unpack)
NOTE: recipe coreutils-9.12-r0: task do_patch: Succeeded
NOTE: Running task 1788 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_unpack)
NOTE: recipe bash-5.3-r0: task do_patch: Succeeded
NOTE: Running task 1789 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe ptest-runner-2.5.1-r0: task do_unpack: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_unpack: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 1790 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1792 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_fetch: Succeeded
NOTE: Running task 1793 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_patch)
NOTE: recipe shadow-4.20.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_patch: Started
NOTE: Running task 1794 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_patch: Succeeded
NOTE: Running task 1796 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_package)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1797 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe shadow-4.20.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1798 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_configure)
NOTE: recipe attr-2.6.0-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe rust-source-1.98.1-1.98.1-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1799 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/rust-source_1.98.1.bb:do_patch)
NOTE: recipe shadow-4.20.3-r0: task do_configure: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_unpack: Succeeded
NOTE: recipe rust-source-1.98.1-1.98.1-r0: task do_patch: Started
NOTE: Running task 1802 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_patch)
NOTE: recipe ptest-runner-2.5.1-r0: task do_patch: Started
NOTE: recipe libunistring-1.4.2-r0: task do_configure: Succeeded
NOTE: Running task 1803 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_compile)
NOTE: recipe ptest-runner-2.5.1-r0: task do_patch: Succeeded
NOTE: Running task 1808 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_unpack)
NOTE: recipe libunistring-1.4.2-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_unpack: Started
NOTE: Running task 1809 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_unpack)
NOTE: recipe nettle-4.0-r0: task do_configure: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_unpack: Started
NOTE: Running task 1810 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_configure_ptest_base)
NOTE: recipe mpfr-4.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 1811 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_patch)
NOTE: recipe nettle-4.0-r0: task do_configure_ptest_base: Started
NOTE: recipe mpfr-4.2.2-r0: task do_patch: Started
NOTE: recipe nettle-4.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1812 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_compile)
NOTE: recipe mpfr-4.2.2-r0: task do_patch: Succeeded
NOTE: Running task 1813 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_unpack)
NOTE: recipe nettle-4.0-r0: task do_compile: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_unpack: Started
NOTE: recipe rust-source-1.98.1-1.98.1-r0: task do_patch: Succeeded
NOTE: Running task 1838 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_install_ptest_base)
NOTE: recipe python3-pytest-9.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1839 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_patch)
NOTE: recipe libcap-2.78-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_patch: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1840 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_compile)
NOTE: recipe compiler-rt-23.1.2-r0: task do_configure: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1841 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_patch)
NOTE: Running task 1843 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_compile)
NOTE: Running task 1845 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_package)
NOTE: recipe libcap-2.78-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1848 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_patch: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_configure: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_compile: Started
NOTE: recipe compiler-rt-23.1.2-r0: task do_compile: Started
NOTE: Running task 1849 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_compile)
NOTE: recipe python3-packaging-26.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpam-1.7.3-r0: task do_package: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_patch: Succeeded
NOTE: Running task 1850 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libtasn1-4.21.0-r0: task do_compile: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-packaging-26.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_deploy_source_date_epoch unihash changed to ab7321ddf6cb7d18411b84fff2b74b583dda864f513690f64a3d1ca120349dcc
NOTE: recipe python3-pluggy-1.6.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_configure: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_deploy_source_date_epoch unihash changed to 811f0476af4e6819b3562985b4be647b4073c50e95511d5869d18de37028632c
NOTE: Setscene tasks completed
NOTE: Running task 1851 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_compile)
NOTE: Running task 1853 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1856 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe musl-obstack-1.2.3-r0: task do_compile: Started
NOTE: recipe sed-4.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe compiler-rt-23.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1857 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_install)
NOTE: recipe sed-4.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe coreutils-9.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1858 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_configure)
NOTE: recipe compiler-rt-23.1.2-r0: task do_install: Started
NOTE: Running task 1859 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.12.bb:do_configure)
NOTE: recipe sed-4.10-r0: task do_configure: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_compile: Succeeded
NOTE: recipe coreutils-9.12-r0: task do_configure: Started
NOTE: recipe fts-1.2.7-r0: task do_configure: Succeeded
NOTE: Running task 1860 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_install)
NOTE: Running task 1861 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_compile)
NOTE: recipe compiler-rt-23.1.2-r0: task do_install: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_install: Started
NOTE: recipe fts-1.2.7-r0: task do_compile: Started
NOTE: Running task 1862 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_populate_sysroot)
NOTE: recipe compiler-rt-23.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 1863 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_install)
NOTE: recipe argp-standalone-1.4.1-r0: task do_install: Succeeded
NOTE: Running task 1865 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_package)
NOTE: recipe musl-obstack-1.2.3-r0: task do_install: Started
NOTE: recipe compiler-rt-23.1.2-r0: task do_package: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_install: Succeeded
NOTE: Running task 1881 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package)
NOTE: recipe compiler-rt-23.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_populate_sysroot unihash changed to b52cabafb43153fe4212b9e6eaa8255b00030e40e28d615c8f28999aeeb64588
NOTE: Running task 1882 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe gmp-6.3.0-r0: task do_package: Started
NOTE: recipe attr-2.6.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_package unihash changed to 4e35f9b73e62691d44899fbff77dd9b8752919078382af50a7c1038e23083fad
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_create_spdx became valid
NOTE: recipe libcxx-23.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 1009 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_create_spdx_setscene)
NOTE: recipe fts-1.2.7-r0: task do_compile: Succeeded
NOTE: Running task 1883 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_install)
NOTE: recipe attr-2.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_install: Started
NOTE: recipe attr-2.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1015 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe attr-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_install: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1885 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_package)
NOTE: Running task 1888 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_package)
NOTE: recipe libcxx-23.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1889 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_configure)
NOTE: recipe base-passwd-3.6.8-r0: task do_package: Started
NOTE: recipe acl-2.4.0-r0: task do_package: Started
NOTE: recipe libcxx-23.1.2-r0: task do_configure: Started
NOTE: recipe compiler-rt-23.1.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_package unihash changed to b26b8315db3e1503e681b42ff3567e55afdf61b9f93344f72b391794836973fb
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_packagedata became valid
NOTE: Running setscene task 1012 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_packagedata_setscene)
NOTE: recipe compiler-rt-23.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe compiler-rt-23.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1897 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_fetch)
NOTE: recipe libmpc-1.4.1-r0: task do_fetch: Started
NOTE: recipe libmpc-1.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 1901 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_package unihash changed to 89dadd3d5a540e58829021e1d51ec9c6aa3fb4de7986ad48616e70c60dd36b46
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata became valid
NOTE: Running setscene task 1014 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1015 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1904 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/clang-cross_git.bb:do_create_recipe_spdx)
NOTE: recipe clang-cross-arm-git-r0: task do_create_recipe_spdx: Started
NOTE: recipe clang-cross-arm-git-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1910 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1911 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe gmp-6.3.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package unihash changed to 1715f6798a2a53592085b1f562d70a979057856c0639ad70dd743b3cf12a3016
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata became valid
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: Running setscene task 1015 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe acl-2.4.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_package unihash changed to c8195cdd15ef150ac527ca768019251e9220e295375236b438fd4a613f9b9e7f
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_packagedata became valid
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1005 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_create_spdx_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_compile: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1912 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_install)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Running task 1919 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_deploy_source_date_epoch)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 7e86448afe1b3e8fcf2e9f542240cb9b328cc75e1ab3c65f36609a2d1377b4f7
NOTE: Running task 1922 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe acl-2.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1015 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to f0aa88e3c9fe4568c522cd7c8c986e1f301d8f6a83227a8313f97a5121401199
NOTE: recipe python3-pytest-9.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_install: Started
NOTE: Running task 1925 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_create_recipe_spdx)
NOTE: recipe mpfr-4.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe acl-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_compile: Succeeded
NOTE: Running task 1926 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_install)
NOTE: recipe xz-5.8.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe acl-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1928 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_create_recipe_spdx)
NOTE: recipe ncurses-6.6-r0: task do_install: Started
NOTE: recipe mpfr-4.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1929 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_configure)
NOTE: recipe python3-pytest-9.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_create_recipe_spdx: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_deploy_source_date_epoch unihash changed to 10dead60c8eed45b8201dd10bb83f61b9427d94051b93b933114e23bc13d8a25
NOTE: recipe xz-5.8.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_configure: Started
NOTE: Setscene tasks completed
NOTE: Running task 1935 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_create_recipe_spdx)
NOTE: Running task 1939 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdbm-1.26-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1943 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_unpack)
NOTE: recipe libmpc-1.4.1-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1949 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_fetch)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_deploy_source_date_epoch unihash changed to ef3a727f2e2dffff874bc6e03282a573e96a6f148c7b317dd98c39684e1aceba
NOTE: recipe libmpc-1.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 1950 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_patch)
NOTE: Running task 1954 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_check_backend)
NOTE: recipe musl-locales-1.0+git-r0: task do_fetch: Started
NOTE: recipe nettle-4.0-r0: task do_compile: Succeeded
NOTE: Running task 1955 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_compile_ptest_base)
NOTE: recipe libmpc-1.4.1-r0: task do_patch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_check_backend: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_check_backend: Succeeded
NOTE: Running task 1961 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_create_recipe_spdx)
NOTE: recipe nettle-4.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libmpc-1.4.1-r0: task do_patch: Succeeded
NOTE: Running task 1969 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_fetch)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_fetch: Started
NOTE: recipe python3-3.14.7-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 1970 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_fetch)
NOTE: recipe musl-locales-1.0+git-r0: task do_fetch: Succeeded
NOTE: Running task 1971 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_fetch)
NOTE: recipe python3-colorama-0.4.6-r0: task do_fetch: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygments-2.21.0-r0: task do_fetch: Started
NOTE: Running task 1972 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_fetch)
NOTE: recipe libtasn1-4.21.0-r0: task do_install: Succeeded
NOTE: recipe python3-pygments-2.21.0-r0: task do_fetch: Succeeded
NOTE: Running task 1974 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: recipe python3-3.14.7-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1975 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_populate_sysroot)
NOTE: Running task 1977 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_unpack)
NOTE: recipe binutils-2.47-r0: task do_fetch: Started
NOTE: recipe binutils-2.47-r0: task do_fetch: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_fetch: Started
NOTE: Running task 1989 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_create_recipe_spdx)
NOTE: recipe libtasn1-4.21.0-r0: task do_populate_sysroot: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_unpack: Started
NOTE: recipe unzip-1_6.0-r0: task do_fetch: Succeeded
NOTE: Running task 1994 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_unpack)
NOTE: recipe compiler-rt-23.1.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_unpack: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 1995 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_unpack)
NOTE: recipe python3-colorama-0.4.6-r0: task do_unpack: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 1996 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_unpack)
NOTE: recipe compiler-rt-23.1.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1997 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_unpack)
NOTE: recipe libtasn1-4.21.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_populate_sysroot unihash changed to f3673c1ab30f50971b0ffef17442312f0c559f603d354c69e27ba81b35f19fe7
NOTE: recipe python3-pygments-2.21.0-r0: task do_unpack: Started
NOTE: recipe binutils-2.47-r0: task do_unpack: Started
NOTE: Running task 1999 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: recipe nettle-4.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2000 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_install)
NOTE: recipe unzip-1_6.0-r0: task do_unpack: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_unpack: Succeeded
NOTE: Running task 2001 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_patch)
NOTE: recipe nettle-4.0-r0: task do_install: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_patch: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_unpack: Succeeded
NOTE: Running task 2003 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_patch)
NOTE: recipe unzip-1_6.0-r0: task do_unpack: Succeeded
NOTE: Running task 2004 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_patch)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_patch: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_patch: Succeeded
NOTE: Running task 2005 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_patch)
NOTE: recipe python3-colorama-0.4.6-r0: task do_patch: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_patch: Succeeded
NOTE: Running task 2007 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: recipe python3-pygments-2.21.0-r0: task do_patch: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_patch: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_patch: Started
NOTE: Running task 2009 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_create_recipe_spdx)
NOTE: recipe python3-pygments-2.21.0-r0: task do_patch: Succeeded
NOTE: Running task 2020 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_create_spdx)
NOTE: recipe libcxx-23.1.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe xz-5.8.4-r0: task do_create_spdx: Started
NOTE: recipe libcxx-23.1.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2021 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_create_spdx)
NOTE: recipe nettle-4.0-r0: task do_install: Succeeded
NOTE: Running task 2022 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_install_ptest_base)
NOTE: recipe gdbm-1.26-r0: task do_create_spdx: Started
NOTE: recipe nettle-4.0-r0: task do_install_ptest_base: Started
NOTE: recipe libpam-1.7.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_package unihash changed to 622bb4f8f63585f00458bbcc0a53f7f4443c71b1c7e156c1f056f71f976e9b4d
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_packagedata became valid
NOTE: Running setscene task 1010 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 2023 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.5.bb:do_create_spdx)
NOTE: recipe libpam-1.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.8.5-r0: task do_create_spdx: Started
NOTE: recipe expat-2.8.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 2024 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx)
NOTE: recipe gdbm-1.26-r0: task do_create_spdx: Succeeded
NOTE: Running task 2025 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_create_spdx)
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx: Started
NOTE: recipe libffi-3.8.0-r0: task do_create_spdx: Started
NOTE: recipe libpam-1.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2027 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_create_spdx)
NOTE: recipe unzip-1_6.0-r0: task do_patch: Succeeded
NOTE: Running task 2029 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_create_spdx: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2038 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/clang-cross_git.bb:do_create_spdx)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx: Started
NOTE: recipe clang-cross-arm-git-r0: task do_create_spdx: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 2042 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.98.1.bb:do_create_recipe_spdx)
NOTE: recipe nettle-4.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2047 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_package)
NOTE: recipe clang-cross-arm-git-r0: task do_create_spdx: Succeeded
NOTE: recipe libstd-rs-1.98.1-r0: task do_create_recipe_spdx: Started
NOTE: Running task 2048 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_package)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 2049 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_package)
NOTE: recipe nettle-4.0-r0: task do_package: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_package: Started
NOTE: recipe libffi-3.8.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_package: Started
NOTE: Running task 2050 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_package)
NOTE: recipe libstd-rs-1.98.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running noexec task 2056 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_fetch)
NOTE: Running task 2057 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_package)
NOTE: recipe lzlib-1.16-r0: task do_package: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_package: Started
NOTE: recipe libcxx-23.1.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2058 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_compile)
NOTE: recipe libcxx-23.1.2-r0: task do_compile: Started
NOTE: recipe openssl-4.0.3-r0: task do_compile: Succeeded
NOTE: Running task 2059 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_compile_ptest_base)
NOTE: recipe openssl-4.0.3-r0: task do_compile_ptest_base: Started
NOTE: recipe openssl-4.0.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2060 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_install)
NOTE: recipe shadow-4.20.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2061 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_compile)
NOTE: recipe openssl-4.0.3-r0: task do_install: Started
NOTE: recipe shadow-4.20.3-r0: task do_compile: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_package unihash changed to 3ee7059517e7a0a005d120cacda675c7804e0a021dccad6e3413d4c98fd94644
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata became valid
NOTE: Running setscene task 1015 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2063 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_package)
NOTE: recipe json-c-0.19-r0: task do_package: Started
NOTE: recipe lzlib-1.16-r0: task do_package: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_package unihash changed to 6bdf58f89e21274a6ec4341ad2a0b03e5a95c6548ebd356c7e1136753b70c9e1
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_packagedata became valid
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_package unihash changed to 30f16ecd7c3b9006cc618b3f1bdc3c5c328fb1c019db54301d9e3b66348fb57a
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata became valid
NOTE: Running setscene task 1009 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 1015 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2064 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_package)
NOTE: Setscene tasks completed
NOTE: Running task 2066 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_package)
NOTE: recipe musl-legacy-error-1.0-r0: task do_package: Started
NOTE: recipe fts-1.2.7-r0: task do_package: Started
NOTE: recipe shadow-4.20.3-r0: task do_compile: Succeeded
NOTE: Running task 2067 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_install)
NOTE: recipe shadow-4.20.3-r0: task do_install: Started
NOTE: recipe openssl-4.0.3-r0: task do_install: Succeeded
NOTE: Running task 2068 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_install_ptest_base)
NOTE: recipe openssl-4.0.3-r0: task do_install_ptest_base: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_package unihash changed to 17d20b66bc4b3677e29411c8f6514f450dc782c967828a77dc44e9776e98176f
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata became valid
NOTE: Running setscene task 1014 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_configure: Succeeded
NOTE: Running task 2069 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_compile)
NOTE: recipe fts-1.2.7-r0: task do_package: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2070 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_package)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_package unihash changed to be904d8db0a1d8b886b834ce1758b03f02370ef19a3e591c7813dd121b0966f1
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata became valid
NOTE: recipe mpfr-4.2.2-r0: task do_compile: Started
NOTE: Running setscene task 1015 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_package: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2071 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe json-c-0.19-r0: task do_package: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2072 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-colorama-0.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_deploy_source_date_epoch unihash changed to dc0c0efb3fbfb368b1ff3b2dfa5a1bb764b6b4b4402f9171261aac6d04939e9c
NOTE: Setscene tasks completed
NOTE: Running task 2073 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libseccomp-2.6.1-r0: task do_package: Succeeded
NOTE: Running task 2074 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_packagedata)
NOTE: recipe python3-colorama-0.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_deploy_source_date_epoch unihash changed to 3011835116f9cc0c321b12c536fbaa14154fa6c0656df529002002cee4a1e91b
NOTE: recipe python3-pygments-2.21.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Setscene tasks completed
NOTE: Running task 2078 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libseccomp-2.6.1-r0: task do_packagedata: Started
NOTE: recipe unzip-1_6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_deploy_source_date_epoch unihash changed to 98a0aabf470ed7031964b09d85467ce96d7c6fed7eea35c818c7875de37d7e63
NOTE: Setscene tasks completed
NOTE: Running task 2079 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_generate_toolchain_file)
NOTE: recipe shadow-4.20.3-r0: task do_install: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2080 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_package)
NOTE: Running task 2082 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.47-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2083 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_patch)
NOTE: recipe musl-locales-1.0+git-r0: task do_generate_toolchain_file: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2085 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe musl-locales-1.0+git-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2090 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_packagedata)
NOTE: recipe shadow-4.20.3-r0: task do_package: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.47-r0: task do_patch: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-c-0.19-r0: task do_packagedata: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2094 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_configure)
NOTE: recipe ptest-runner-2.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2095 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_configure)
NOTE: recipe json-c-0.19-r0: task do_packagedata: Succeeded
NOTE: Running task 2096 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_configure)
NOTE: recipe unzip-1_6.0-r0: task do_configure: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_configure: Started
NOTE: recipe unzip-1_6.0-r0: task do_configure: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_configure: Started
NOTE: Running task 2098 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_package)
NOTE: recipe ptest-runner-2.5.1-r0: task do_configure: Succeeded
NOTE: Running task 2099 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_compile)
NOTE: recipe nettle-4.0-r0: task do_package: Succeeded
NOTE: recipe libcap-2.78-r0: task do_package: Started
NOTE: Running task 2100 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_packagedata)
NOTE: recipe ptest-runner-2.5.1-r0: task do_compile: Started
NOTE: recipe binutils-2.47-r0: task do_patch: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_package: Succeeded
NOTE: Running task 2103 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_compile)
NOTE: recipe nettle-4.0-r0: task do_packagedata: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_package unihash changed to 8a405ea3c4dc5d8e150079df7d7d30939388f4eea16809cd729e5b7c20d86cac
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata became valid
NOTE: Running setscene task 1015 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_compile: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_configure: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2104 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_compile)
NOTE: Running task 2105 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_install)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2114 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_create_recipe_spdx)
NOTE: recipe musl-locales-1.0+git-r0: task do_compile: Started
NOTE: recipe nettle-4.0-r0: task do_packagedata: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_install: Started
NOTE: Running task 2123 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_create_spdx)
NOTE: recipe libpam-1.7.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe compiler-rt-23.1.2-r0: task do_create_spdx: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_compile: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_install: Succeeded
NOTE: Running task 2124 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_install)
NOTE: Running task 2134 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.5.bb:do_create_recipe_spdx)
NOTE: recipe libpam-1.7.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2135 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_create_recipe_spdx)
NOTE: recipe python3-hypothesis-6.168.5-r0: task do_create_recipe_spdx: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_install: Started
NOTE: recipe shadow-4.20.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe compiler-rt-23.1.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2139 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_create_spdx)
NOTE: recipe python3-hypothesis-6.168.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2141 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe libpam-1.7.3-r0: task do_create_spdx: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_install: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: recipe shadow-4.20.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2142 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_package)
NOTE: Running task 2149 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_create_recipe_spdx)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_package: Started
NOTE: recipe mpfr-4.2.2-r0: task do_compile: Succeeded
NOTE: Running task 2150 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_install)
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: Running task 2151 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_26.1.0.bb:do_create_recipe_spdx)
NOTE: recipe mpfr-4.2.2-r0: task do_install: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2152 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_create_recipe_spdx)
NOTE: recipe python3-attrs-26.1.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-attrs-26.1.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2153 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_create_recipe_spdx)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_install: Succeeded
NOTE: Running task 2156 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2157 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_package)
NOTE: recipe libmpc-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpfr-4.2.2-r0: task do_package: Started
NOTE: recipe libpam-1.7.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libmpc-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2158 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_configure)
NOTE: recipe libmpc-1.4.1-r0: task do_configure: Started
NOTE: recipe libcap-2.78-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_package unihash changed to 92eb0f1578e2533a217d65f9230598a45d8945f01aa89623181082822059896a
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_packagedata became valid
NOTE: Running setscene task 1010 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_package unihash changed to 604333414f418153078c6e8087cc324f40e80686554b53d549319958fd1ae6b1
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata became valid
NOTE: Running setscene task 1015 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.20.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_package unihash changed to e8fa27820fcef8d8b6ae04e8a73dd9377413cd472e9c3b6c98e491f3977e9287
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_packagedata became valid
NOTE: Running setscene task 1015 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_package unihash changed to 8d12a42ff17d1cde6134c66a9a2f3b4dd0641c3880ba31200764bb0916ebe666
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata became valid
NOTE: Running setscene task 1015 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.20.3-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.20.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2163 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package)
NOTE: Running task 2164 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_create_spdx)
NOTE: recipe ptest-runner-2.5.1-r0: task do_package: Started
NOTE: recipe shadow-4.20.3-r0: task do_create_spdx: Started
NOTE: recipe shadow-4.20.3-r0: task do_create_spdx: Succeeded
NOTE: recipe sed-4.10-r0: task do_configure: Succeeded
NOTE: Running task 2165 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_configure_ptest_base)
NOTE: recipe ptest-runner-2.5.1-r0: task do_package: Succeeded
NOTE: recipe sed-4.10-r0: task do_configure_ptest_base: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package unihash changed to 35d8a32fdda2605ee747fd128e995051340620fbc568b0d375bc189885cdfe50
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata became valid
NOTE: recipe sed-4.10-r0: task do_configure_ptest_base: Succeeded
NOTE: Running setscene task 1014 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_create_spdx_setscene)
NOTE: Running task 2166 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_compile)
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe sed-4.10-r0: task do_compile: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1015 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe unzip-1_6.0-r0: task do_compile: Succeeded
NOTE: Running task 2169 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_install)
NOTE: recipe unzip-1_6.0-r0: task do_install: Started
NOTE: recipe unzip-1_6.0-r0: task do_install: Succeeded
NOTE: Running task 2170 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_package)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_compile: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_package: Started
NOTE: Running task 2171 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_install)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_install: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_install: Succeeded
NOTE: Running task 2173 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_package)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_package: Started
NOTE: recipe libmpc-1.4.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2174 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_compile)
NOTE: recipe libmpc-1.4.1-r0: task do_compile: Started
NOTE: recipe libcxx-23.1.2-r0: task do_compile: Succeeded
NOTE: Running task 2175 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_install)
NOTE: recipe libcxx-23.1.2-r0: task do_install: Started
NOTE: recipe libmpc-1.4.1-r0: task do_compile: Succeeded
NOTE: Running task 2176 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_install)
NOTE: recipe sed-4.10-r0: task do_compile: Succeeded
NOTE: Running task 2177 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_compile_ptest_base)
NOTE: recipe libmpc-1.4.1-r0: task do_install: Started
NOTE: recipe sed-4.10-r0: task do_compile_ptest_base: Started
NOTE: recipe unzip-1_6.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_package unihash changed to da2d3ff7c23fe4017290cd75ee73dac486f6697f61e24d1b6faa75213631bbd6
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata became valid
NOTE: recipe sed-4.10-r0: task do_compile_ptest_base: Succeeded
NOTE: Running setscene task 1015 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running task 2178 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_install)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.10-r0: task do_install: Started
NOTE: recipe ncurses-6.6-r0: task do_install: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2181 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2182 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_package)
NOTE: Running task 2183 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2184 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmpc-1.4.1-r0: task do_install: Succeeded
NOTE: Running task 2186 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_package)
NOTE: recipe libedit-20260512-3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.6-r0: task do_package: Started
NOTE: recipe psmisc-23.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-5.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmpc-1.4.1-r0: task do_package: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_package unihash changed to 026ff1aaa30e50f871941b9fa62f6492739620ae36ca728bc0bbc8f644b92314
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_packagedata became valid
NOTE: recipe libedit-20260512-3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bash-5.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 1015 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_packagedata_setscene)
NOTE: Running task 2187 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_configure)
NOTE: Running task 2188 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_configure)
NOTE: Running task 2189 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_configure)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_configure: Started
NOTE: recipe psmisc-23.7-r0: task do_configure: Started
NOTE: recipe bash-5.3-r0: task do_configure: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2191 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_create_spdx)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_create_spdx: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_create_spdx: Succeeded
NOTE: recipe sed-4.10-r0: task do_install: Succeeded
NOTE: Running task 2192 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_install_ptest_base)
NOTE: recipe sed-4.10-r0: task do_install_ptest_base: Started
NOTE: recipe sed-4.10-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2193 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_package)
NOTE: recipe sed-4.10-r0: task do_package: Started
NOTE: recipe libmpc-1.4.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_package unihash changed to f5d9a9f245384e880eeb975e8e196f9212b40829b6bbffe50e31b361276f6cdf
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_packagedata became valid
NOTE: Running setscene task 1015 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libcxx-23.1.2-r0: task do_install: Succeeded
NOTE: Running task 2195 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_populate_sysroot)
NOTE: Running task 2196 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_package)
NOTE: recipe zstd-1.5.7-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libcxx-23.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libcxx-23.1.2-r0: task do_package: Started
NOTE: Running task 2197 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_install)
NOTE: recipe zstd-1.5.7-r0: task do_install: Started
NOTE: recipe libcxx-23.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_populate_sysroot unihash changed to 0be707a6871fe1d4de4cff0909a9d3cfbee82640030fd82eb18ab80642905584
NOTE: Setscene tasks completed
NOTE: Running task 2198 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.98.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libstd-rs-1.98.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libstd-rs-1.98.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2199 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.98.1.bb:do_rust_create_wrappers)
NOTE: recipe libstd-rs-1.98.1-r0: task do_rust_create_wrappers: Started
NOTE: recipe libstd-rs-1.98.1-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 2200 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.98.1.bb:do_configure)
NOTE: recipe libstd-rs-1.98.1-r0: task do_configure: Started
NOTE: recipe libstd-rs-1.98.1-r0: task do_configure: Succeeded
NOTE: Running task 2201 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.98.1.bb:do_compile)
NOTE: recipe libstd-rs-1.98.1-r0: task do_compile: Started
NOTE: recipe sed-4.10-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_package unihash changed to 1e3c0b20d0d9704835377200d2e2732a9b6bb37c396ab86dfdaeb8a9ee758b3b
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_packagedata became valid
NOTE: Running setscene task 1015 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_packagedata_setscene)
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe openssl-4.0.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2204 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_package)
NOTE: recipe openssl-4.0.3-r0: task do_package: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_configure: Succeeded
NOTE: Running task 2205 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_compile)
NOTE: recipe libedit-20260512-3.1-r0: task do_compile: Started
NOTE: recipe libcxx-23.1.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_package unihash changed to 4d24ae055da9b81c1bc30039b4d9c537a71aeca4abd294ad3a3e1d6e3e04a16e
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_packagedata became valid
NOTE: Running setscene task 1012 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_packagedata_setscene)
NOTE: recipe libcxx-23.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcxx-23.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2207 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_create_spdx)
NOTE: recipe libcxx-23.1.2-r0: task do_create_spdx: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_compile: Succeeded
NOTE: Running task 2208 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_install)
NOTE: recipe libedit-20260512-3.1-r0: task do_install: Started
NOTE: recipe libcxx-23.1.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_install: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_package unihash changed to 006de3c403b81651c4edf4d2cf0ec37002cee7ee094a096a8ac10595a28bded5
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata became valid
NOTE: Running setscene task 1010 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_spdx_setscene)
NOTE: recipe ncurses-6.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1015 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2211 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_package)
NOTE: recipe libedit-20260512-3.1-r0: task do_package: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_package unihash changed to 788661a49ca70e101dcf55ac968d49cb8b2e95c0c50b051576f6b558814666ce
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_packagedata became valid
NOTE: recipe psmisc-23.7-r0: task do_configure: Succeeded
NOTE: Running setscene task 1015 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_packagedata_setscene)
NOTE: Running task 2213 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_configure_ptest_base)
NOTE: recipe zstd-1.5.7-r0: task do_install: Succeeded
NOTE: Running task 2214 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_install_ptest_base)
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_configure_ptest_base: Started
NOTE: recipe zstd-1.5.7-r0: task do_install_ptest_base: Started
NOTE: recipe psmisc-23.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2215 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_compile)
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2217 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_create_spdx)
NOTE: recipe psmisc-23.7-r0: task do_compile: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_create_spdx: Started
NOTE: recipe zstd-1.5.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2219 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2220 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2221 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_package)
NOTE: Running task 2222 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2223 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libarchive-3.8.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.48-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.7-r0: task do_package: Started
NOTE: recipe gcc-16.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.14.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_create_spdx: Succeeded
NOTE: recipe file-5.48-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2224 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_configure)
NOTE: recipe libarchive-3.8.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2225 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_configure)
NOTE: recipe gcc-16.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2226 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_configure)
NOTE: recipe file-5.48-r0: task do_configure: Started
NOTE: recipe libarchive-3.8.9-r0: task do_configure: Started
NOTE: recipe gcc-16.2.0-r0: task do_configure: Started
NOTE: recipe python3-3.14.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2227 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_configure)
NOTE: recipe bash-5.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2228 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_configure_ptest_base)
NOTE: recipe python3-3.14.7-r0: task do_configure: Started
NOTE: recipe bash-5.3-r0: task do_configure_ptest_base: Started
NOTE: recipe bash-5.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2229 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_compile)
NOTE: recipe bash-5.3-r0: task do_compile: Started
NOTE: recipe psmisc-23.7-r0: task do_compile: Succeeded
NOTE: recipe coreutils-9.12-r0: task do_configure: Succeeded
NOTE: Running task 2230 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_compile_ptest_base)
NOTE: Setscene tasks completed
NOTE: Running task 2231 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.12.bb:do_configure_ptest_base)
NOTE: recipe psmisc-23.7-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-9.12-r0: task do_configure_ptest_base: Started
NOTE: recipe coreutils-9.12-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2232 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.12.bb:do_compile)
NOTE: recipe psmisc-23.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2233 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_install)
NOTE: recipe coreutils-9.12-r0: task do_compile: Started
NOTE: recipe psmisc-23.7-r0: task do_install: Started
NOTE: recipe psmisc-23.7-r0: task do_install: Succeeded
NOTE: Running task 2234 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_install_ptest_base)
NOTE: recipe psmisc-23.7-r0: task do_install_ptest_base: Started
NOTE: recipe psmisc-23.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2235 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_package)
NOTE: recipe psmisc-23.7-r0: task do_package: Started
NOTE: recipe gcc-16.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2236 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_compile)
NOTE: recipe gcc-16.2.0-r0: task do_compile: Started
NOTE: recipe zstd-1.5.7-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_package unihash changed to e401f0b6d9821b49725997ed92821361c44edeabbdc574f9e9637b12bd1665e3
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata became valid
NOTE: Running setscene task 1013 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2238 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_spdx)
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx: Started
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx: Succeeded
NOTE: recipe bash-5.3-r0: task do_compile: Succeeded
NOTE: Running task 2239 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_compile_ptest_base)
NOTE: recipe bash-5.3-r0: task do_compile_ptest_base: Started
NOTE: recipe bash-5.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2240 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_install)
NOTE: recipe psmisc-23.7-r0: task do_package: Succeeded
NOTE: recipe bash-5.3-r0: task do_install: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_package unihash changed to 02bafbec94a4f9bd6f8ed860549c9d61409ef31bca54ceac0ceb93718f4d8cb4
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_qa became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_write_deb became valid
NOTE: Running setscene task 1011 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 1013 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 1014 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_write_ipk_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_qa_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1015 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: recipe openssl-4.0.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_package unihash changed to 7fae561fb1a8a4eea0f22e49afd793cfcc83234c5ec494660d28bc67e64efb4d
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_packagedata became valid
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.12-r0: task do_compile: Succeeded
NOTE: Running setscene task 1015 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_packagedata_setscene)
NOTE: Running task 2241 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.12.bb:do_compile_ptest_base)
NOTE: recipe openssl-4.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.12-r0: task do_compile_ptest_base: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2245 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_write_rpm)
NOTE: recipe coreutils-9.12-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2247 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.12.bb:do_install)
NOTE: recipe openssl-4.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2249 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_create_spdx)
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe coreutils-9.12-r0: task do_install: Started
NOTE: recipe openssl-4.0.3-r0: task do_create_spdx: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_write_rpm unihash changed to b9356eef9c9065def98108c9d19b81476b05c33cb2cf6d8da94132bd1fdcc6d6
NOTE: recipe libunistring-1.4.2-r0: task do_compile: Succeeded
NOTE: Running task 2250 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_install)
NOTE: recipe libunistring-1.4.2-r0: task do_install: Started
NOTE: recipe libunistring-1.4.2-r0: task do_install: Succeeded
NOTE: Running task 2252 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2253 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_package)
NOTE: recipe libidn2-2.3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.4.2-r0: task do_package: Started
NOTE: recipe bash-5.3-r0: task do_install: Succeeded
NOTE: Running task 2254 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_install_ptest_base)
NOTE: recipe bash-5.3-r0: task do_install_ptest_base: Started
NOTE: recipe libidn2-2.3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2255 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_configure)
NOTE: recipe libidn2-2.3.8-r0: task do_configure: Started
NOTE: recipe file-5.48-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2256 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_compile)
NOTE: recipe coreutils-9.12-r0: task do_install: Succeeded
NOTE: Running task 2257 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.12.bb:do_install_ptest_base)
NOTE: recipe file-5.48-r0: task do_compile: Started
NOTE: recipe coreutils-9.12-r0: task do_install_ptest_base: Started
NOTE: recipe bash-5.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2258 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package)
NOTE: recipe bash-5.3-r0: task do_package: Started
NOTE: recipe openssl-4.0.3-r0: task do_create_spdx: Succeeded
NOTE: recipe file-5.48-r0: task do_compile: Succeeded
NOTE: Running task 2259 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_install)
NOTE: recipe file-5.48-r0: task do_install: Started
NOTE: recipe file-5.48-r0: task do_install: Succeeded
NOTE: Running task 2261 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_package)
NOTE: recipe file-5.48-r0: task do_package: Started
NOTE: recipe libunistring-1.4.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_package unihash changed to 45d398b579349dd5c96eb2cad75c45df8ab99df4838f03bfbc88b0d874c22f95
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_packagedata became valid
NOTE: Running setscene task 1015 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe coreutils-9.12-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2263 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.12.bb:do_package)
NOTE: recipe file-5.48-r0: task do_package: Succeeded
NOTE: recipe coreutils-9.12-r0: task do_package: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_package unihash changed to 1191ce3b5e3f51762783bb2c2832226cb0777bfa6049e10e3c30617d58b57a73
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_packagedata became valid
NOTE: Running setscene task 1015 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_packagedata_setscene)
NOTE: recipe file-5.48-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.48-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe bash-5.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package unihash changed to ebd86b735fd390ae6782d7b078439740e61583abbe27ca20e5e9251633cb84a1
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata became valid
NOTE: Running setscene task 1015 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libarchive-3.8.9-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2266 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_configure_ptest_base)
NOTE: recipe libarchive-3.8.9-r0: task do_configure_ptest_base: Started
NOTE: recipe libarchive-3.8.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2267 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_compile)
NOTE: recipe libarchive-3.8.9-r0: task do_compile: Started
NOTE: recipe libstd-rs-1.98.1-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2268 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.98.1.bb:do_install)
NOTE: recipe libstd-rs-1.98.1-r0: task do_install: Started
NOTE: recipe libstd-rs-1.98.1-r0: task do_install: Succeeded
NOTE: Running task 2269 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.98.1.bb:do_populate_sysroot)
NOTE: Running task 2270 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.98.1.bb:do_package)
NOTE: recipe libstd-rs-1.98.1-r0: task do_populate_sysroot: Started
NOTE: recipe libstd-rs-1.98.1-r0: task do_package: Started
NOTE: recipe libstd-rs-1.98.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.98.1.bb:do_populate_sysroot unihash changed to b214dc44d4ffad55885afa03b69d0bd1652b4024cb38aab96e40def5eeb88879
NOTE: Setscene tasks completed
NOTE: recipe libarchive-3.8.9-r0: task do_compile: Succeeded
NOTE: Running task 2271 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_compile_ptest_base)
NOTE: recipe libarchive-3.8.9-r0: task do_compile_ptest_base: Started
NOTE: recipe libstd-rs-1.98.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.98.1.bb:do_package unihash changed to bd178814d0f426370e7f176be0f4615af25bbfe33c450f2f6fdae9adc176f42b
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.98.1.bb:do_packagedata became valid
NOTE: Running setscene task 1015 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.98.1.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.98.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.98.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2273 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.98.1.bb:do_create_spdx)
NOTE: recipe libstd-rs-1.98.1-r0: task do_create_spdx: Started
NOTE: recipe libstd-rs-1.98.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2274 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_compile)
NOTE: recipe libidn2-2.3.8-r0: task do_compile: Started
NOTE: recipe python3-3.14.7-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2275 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_configure_ptest_base)
NOTE: recipe python3-3.14.7-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-3.14.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2276 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_compile)
NOTE: recipe python3-3.14.7-r0: task do_compile: Started
NOTE: recipe libarchive-3.8.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2277 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_install)
NOTE: recipe libarchive-3.8.9-r0: task do_install: Started
NOTE: recipe libarchive-3.8.9-r0: task do_install: Succeeded
NOTE: Running task 2278 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_install_ptest_base)
NOTE: recipe libarchive-3.8.9-r0: task do_install_ptest_base: Started
NOTE: recipe libidn2-2.3.8-r0: task do_compile: Succeeded
NOTE: Running task 2279 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_install)
NOTE: recipe libidn2-2.3.8-r0: task do_install: Started
NOTE: recipe libarchive-3.8.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2280 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_populate_sysroot)
NOTE: Running task 2281 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_package)
NOTE: recipe libarchive-3.8.9-r0: task do_package: Started
NOTE: recipe libarchive-3.8.9-r0: task do_populate_sysroot: Started
NOTE: recipe libarchive-3.8.9-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_populate_sysroot unihash changed to eb746b058e3f0b80963bc84f75939cb50dec280d6ed2c6d258e9fd306f4ac80c
NOTE: recipe libidn2-2.3.8-r0: task do_install: Succeeded
NOTE: recipe coreutils-9.12-r0: task do_package: Succeeded
NOTE: Running task 2282 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot)
NOTE: Running task 2283 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_package)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.12.bb:do_package unihash changed to 6cdfe7194db82410dd45085205e66bef2ba8b3c17953a0eaeac130124ec77f61
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.12.bb:do_packagedata became valid
NOTE: Running setscene task 1015 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.12.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_package: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot: Started
NOTE: recipe coreutils-9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot unihash changed to b57fb910f2cf5097ba3efabb1beb3842154e657547412dbd497820ae67815869
NOTE: Setscene tasks completed
NOTE: Running task 2285 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2286 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpsl-0.23.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.8.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpsl-0.23.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2287 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_configure)
NOTE: recipe gnutls-3.8.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2288 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_configure)
NOTE: recipe libpsl-0.23.3-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.13-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.8-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_package unihash changed to 4c36c9703a718debca62e19bf727cb8bfaba919f6cfff241bef93a2a3f8117e3
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata became valid
NOTE: Running setscene task 1015 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libpsl-0.23.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2290 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_compile)
NOTE: recipe libpsl-0.23.3-r0: task do_compile: Started
NOTE: recipe libpsl-0.23.3-r0: task do_compile: Succeeded
NOTE: Running task 2291 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_install)
NOTE: recipe libpsl-0.23.3-r0: task do_install: Started
NOTE: recipe libarchive-3.8.9-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_package unihash changed to 950d9f718c299061c7db52e194853fe693dbac8a6fa82aeabd1875a504059d4b
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_packagedata became valid
NOTE: Running setscene task 1015 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_install: Succeeded
NOTE: Running task 2292 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_populate_sysroot)
NOTE: Running task 2293 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_package)
NOTE: recipe libarchive-3.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libpsl-0.23.3-r0: task do_populate_sysroot: Started
NOTE: recipe libpsl-0.23.3-r0: task do_package: Started
NOTE: recipe libpsl-0.23.3-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_populate_sysroot unihash changed to d081b19485b8da05e59a881c4497feebe461e541f0d0b8295e82e13d70f12b5b
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_populate_sysroot became valid
NOTE: Running setscene task 1013 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2295 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpsl-0.23.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_package unihash changed to 988ea5af67d32c182a79beb5689dc411be64ff2e50e2a699c32fad43e0123ec6
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_packagedata became valid
NOTE: recipe curl-8.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 1005 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_packagedata_setscene)
NOTE: recipe libpsl-0.23.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe curl-8.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2297 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_configure)
NOTE: recipe curl-8.22.0-r0: task do_configure: Started
NOTE: recipe python3-3.14.7-r0: task do_compile: Succeeded
NOTE: Running task 2298 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_compile_ptest_base)
NOTE: recipe python3-3.14.7-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-3.14.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2299 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_install)
NOTE: recipe python3-3.14.7-r0: task do_install: Started
NOTE: recipe curl-8.22.0-r0: task do_configure: Succeeded
NOTE: Running task 2300 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_configure_ptest_base)
NOTE: recipe curl-8.22.0-r0: task do_configure_ptest_base: Started
NOTE: recipe curl-8.22.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2301 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_compile)
NOTE: recipe curl-8.22.0-r0: task do_compile: Started
NOTE: recipe curl-8.22.0-r0: task do_compile: Succeeded
NOTE: Running task 2302 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_compile_ptest_base)
NOTE: recipe curl-8.22.0-r0: task do_compile_ptest_base: Started
NOTE: recipe curl-8.22.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2303 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_install)
NOTE: recipe curl-8.22.0-r0: task do_install: Started
NOTE: recipe gnutls-3.8.13-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2304 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_configure_ptest_base)
NOTE: recipe python3-3.14.7-r0: task do_install: Succeeded
NOTE: Running task 2305 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_install_ptest_base)
NOTE: recipe gnutls-3.8.13-r0: task do_configure_ptest_base: Started
NOTE: recipe gnutls-3.8.13-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2306 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_compile)
NOTE: recipe python3-3.14.7-r0: task do_install_ptest_base: Started
NOTE: recipe gnutls-3.8.13-r0: task do_compile: Started
NOTE: recipe python3-3.14.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2307 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_populate_sysroot)
NOTE: Running task 2308 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package)
NOTE: recipe python3-3.14.7-r0: task do_populate_sysroot: Started
NOTE: recipe python3-3.14.7-r0: task do_package: Started
NOTE: recipe python3-3.14.7-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_populate_sysroot unihash changed to 5dff1ac91a4155dd90379b6fc31149f04f70db5a325013a22c7ec4de2a077b32
NOTE: Setscene tasks completed
NOTE: Running task 2309 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-8.22.0-r0: task do_install: Succeeded
NOTE: Running task 2310 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_26.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2311 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2312 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2313 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_install_ptest_base)
NOTE: Running task 2314 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2315 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2316 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2317 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2318 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2319 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-attrs-26.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-packaging-26.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.168.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-8.22.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-packaging-26.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2320 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_configure)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2321 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_configure)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2322 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_configure)
NOTE: recipe python3-attrs-26.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2323 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_configure)
NOTE: Running task 2324 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_26.1.0.bb:do_configure)
NOTE: Running task 2325 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_configure)
NOTE: Running task 2326 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_configure)
NOTE: recipe python3-colorama-0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2327 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_configure)
NOTE: recipe python3-pygments-2.21.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2328 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_configure)
NOTE: recipe python3-packaging-26.3-r0: task do_configure: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_configure: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_configure: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_configure: Started
NOTE: recipe python3-attrs-26.1.0-r0: task do_configure: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_configure: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_configure: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_configure: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_configure: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_configure: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_configure: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_configure: Succeeded
NOTE: Running task 2329 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_configure_ptest_base)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2330 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_configure_ptest_base)
NOTE: Running task 2331 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_compile)
NOTE: Running task 2332 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_compile)
NOTE: recipe python3-attrs-26.1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.168.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_configure: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2333 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_26.1.0.bb:do_configure_ptest_base)
NOTE: Running task 2334 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_compile)
NOTE: recipe python3-colorama-0.4.6-r0: task do_configure: Succeeded
NOTE: Running task 2335 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_compile)
NOTE: recipe python3-pygments-2.21.0-r0: task do_configure: Succeeded
NOTE: Running task 2336 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.5.bb:do_rust_create_wrappers)
NOTE: Running task 2337 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_compile)
NOTE: Running task 2338 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_compile)
NOTE: recipe python3-packaging-26.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_compile: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_compile: Started
NOTE: recipe python3-attrs-26.1.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_compile: Started
NOTE: recipe python3-packaging-26.3-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_compile: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe curl-8.22.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2339 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_compile)
NOTE: recipe python3-colorama-0.4.6-r0: task do_compile: Started
NOTE: Running task 2341 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_compile)
NOTE: Running task 2342 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_package)
NOTE: recipe python3-pygments-2.21.0-r0: task do_compile: Started
NOTE: recipe python3-attrs-26.1.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-hypothesis-6.168.5-r0: task do_rust_create_wrappers: Started
NOTE: Running task 2343 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_26.1.0.bb:do_compile)
NOTE: recipe python3-packaging-26.3-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.168.5-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_compile: Started
NOTE: Running task 2344 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.5.bb:do_configure)
NOTE: recipe curl-8.22.0-r0: task do_package: Started
NOTE: recipe python3-attrs-26.1.0-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.168.5-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.168.5-r0: task do_configure: Succeeded
NOTE: Running task 2345 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.5.bb:do_configure_ptest_base)
NOTE: recipe python3-hypothesis-6.168.5-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-hypothesis-6.168.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2346 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.5.bb:do_compile)
NOTE: recipe python3-hypothesis-6.168.5-r0: task do_compile: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_compile: Succeeded
NOTE: Running task 2347 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_install)
NOTE: recipe python3-colorama-0.4.6-r0: task do_compile: Succeeded
NOTE: Running task 2348 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_install)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_install: Started
NOTE: recipe python3-packaging-26.3-r0: task do_compile: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2349 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_compile_ptest_base)
NOTE: Running task 2350 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_install)
NOTE: recipe python3-pygments-2.21.0-r0: task do_compile: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_install: Started
NOTE: Running task 2351 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_install)
NOTE: recipe python3-attrs-26.1.0-r0: task do_compile: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_compile_ptest_base: Started
NOTE: Running task 2352 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_26.1.0.bb:do_compile_ptest_base)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_install: Started
NOTE: recipe python3-packaging-26.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2353 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_install)
NOTE: recipe python3-pygments-2.21.0-r0: task do_install: Started
NOTE: recipe python3-attrs-26.1.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-attrs-26.1.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2354 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_26.1.0.bb:do_install)
NOTE: recipe python3-packaging-26.3-r0: task do_install: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_install: Succeeded
NOTE: Running task 2355 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_populate_sysroot)
NOTE: recipe python3-attrs-26.1.0-r0: task do_install: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_populate_sysroot: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_install: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_install: Succeeded
NOTE: Running task 2356 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_populate_sysroot)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2357 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_install)
NOTE: recipe python3-pytest-9.1.1-r0: task do_compile: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_install: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_install: Started
NOTE: Running task 2358 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_install)
NOTE: Running task 2359 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_install_ptest_base)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_compile: Succeeded
NOTE: Running task 2360 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_compile_ptest_base)
NOTE: recipe python3-attrs-26.1.0-r0: task do_install: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2361 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_26.1.0.bb:do_install_ptest_base)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_populate_sysroot unihash changed to 7b9224c497a89dd56518e99af8e31bf98225700232f20ecb7c08472f02a477d0
NOTE: recipe python3-pluggy-1.6.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_install: Started
NOTE: recipe python3-packaging-26.3-r0: task do_install_ptest_base: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_populate_sysroot unihash changed to 065f80295ce7eb85206cf6ef2b494534fa98ddd785be018521eafe68acb83f09
NOTE: recipe python3-pluggy-1.6.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2362 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_install)
NOTE: recipe python3-attrs-26.1.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-packaging-26.3-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-attrs-26.1.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_install: Started
NOTE: Running task 2363 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_26.1.0.bb:do_populate_sysroot)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_install: Succeeded
NOTE: recipe python3-attrs-26.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_install: Succeeded
NOTE: Running task 2364 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_install_ptest_base)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_install: Succeeded
NOTE: recipe python3-attrs-26.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2365 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_populate_sysroot)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_26.1.0.bb:do_populate_sysroot unihash changed to be5265534a0eb1f76b9097a3a33481dbb07f422380f6977e5f44308f449d33f0
NOTE: Setscene tasks completed
NOTE: recipe python3-pluggy-1.6.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_install: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_populate_sysroot unihash changed to e20ba79f2015a59b2d0320b4fa1638ab8afb9a4608e47f89d9ce61309869cf10
NOTE: Setscene tasks completed
NOTE: recipe curl-8.22.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_package unihash changed to 7054ec5d0da09967a563b8f3051e230043ad7e1130d0d59b94b5ceb7260fca2a
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_packagedata became valid
NOTE: Running setscene task 1015 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_packagedata_setscene)
NOTE: recipe curl-8.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-3.14.7-r0: task do_package: Succeeded
NOTE: Running task 2367 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_packagedata)
NOTE: recipe python3-3.14.7-r0: task do_packagedata: Started
NOTE: recipe python3-3.14.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2368 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package)
NOTE: Running task 2369 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_package)
NOTE: Running task 2370 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_26.1.0.bb:do_package)
NOTE: Running task 2371 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package)
NOTE: Running task 2372 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_create_spdx)
NOTE: Running task 2373 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_package)
NOTE: Running task 2374 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_package)
NOTE: Running task 2375 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_package)
NOTE: Running task 2376 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_package)
NOTE: Running task 2377 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_package)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_package: Started
NOTE: recipe python3-attrs-26.1.0-r0: task do_package: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package: Started
NOTE: recipe python3-packaging-26.3-r0: task do_package: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_package: Started
NOTE: recipe python3-3.14.7-r0: task do_create_spdx: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_package: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_package: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_package: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package unihash changed to 674a91f89507b899b5c653c196e942f3154028ad62d5a456b772f405c4c868cf
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_packagedata became valid
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package unihash changed to 6b30a9dc1b920bd45440d977948eef26c673c5f1e98c35a023e388b25b9d3f56
NOTE: Running setscene task 1013 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_packagedata_setscene)
NOTE: Running task 2378 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_packagedata)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_package: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_package unihash changed to 29dc7d6601a7ad317a9e983fcea96a5164eb9c2a35a5d6eaa903d25abdc554aa
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_package unihash changed to 95ba4db2b1c1e71b16a4e81e353cc6f398fc82ddd3b211d7523c8115d0502440
NOTE: Running task 2379 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_packagedata)
NOTE: Running task 2380 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_packagedata)
NOTE: recipe python3-attrs-26.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2382 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_write_ipk)
NOTE: Running task 2383 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_write_deb)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_26.1.0.bb:do_package unihash changed to 1e977fff95c920ed690219659269c28bffc2709dd4812a23c924bf46e99ef314
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_packagedata: Started
NOTE: Running task 2384 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_26.1.0.bb:do_packagedata)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_packagedata: Started
NOTE: Running task 2385 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_write_rpm)
NOTE: Running task 2386 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_qa)
NOTE: recipe python3-packaging-26.3-r0: task do_package: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_ipk: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_package: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_deb: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_package unihash changed to 622d86158213077a9aa6a7654ed1b4bdd72af249e10ff3121b22652099ad04cf
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_package unihash changed to 8bc850126114d9467cb5b9b9c4aa6d1fe298138902f4f4b2b6a148f364589d19
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-attrs-26.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_rpm: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_packagedata unihash changed to 23a0b6386ccc18dd9b990f1d6195e6ecc8f1aecc2944006f406adabec390f995
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_qa: Started
NOTE: Running task 2387 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_packagedata)
NOTE: Running task 2388 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_packagedata)
NOTE: Running task 2389 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_write_ipk)
NOTE: recipe python3-colorama-0.4.6-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_package unihash changed to 02dd13d63b81aa3321a20a3b663c70197e7c0dae04774e529d77f68c465c0a20
NOTE: Setscene tasks completed
NOTE: Running task 2390 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_packagedata)
NOTE: recipe python3-pytest-9.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-packaging-26.3-r0: task do_packagedata: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-attrs-26.1.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_26.1.0.bb:do_packagedata unihash changed to 1443819921714d7150da1795af95fd438d22319ab04fb66a6ed42b8f6de89ba9
NOTE: recipe python3-colorama-0.4.6-r0: task do_packagedata: Started
NOTE: Running task 2391 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_write_deb)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_packagedata unihash changed to 656c0d91f24f905b74445e93ab420579c08a14012b84ae14546a983b4bbc176c
NOTE: Running task 2392 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_write_rpm)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_qa: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_deb: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_qa unihash changed to 407885ab42d9af1dc05c4804a2174558bdaeb1b974bc4c2d99f2531d19b23a27
NOTE: Running task 2393 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_qa)
NOTE: recipe python3-pytest-9.1.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_write_ipk unihash changed to b0b4dd38f213f2fcb9a81ec111593efa0792e51a7807094c344587293ed24998
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_packagedata unihash changed to 824ec622b33f3c406107efc71bb76f4d1933561e9319a4d8c73e58756336143a
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_rpm: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_write_deb unihash changed to 07940e638ec873faa435373eff09fe0e4bc561f23200189bb7ff2e349becf092
NOTE: recipe python3-colorama-0.4.6-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_packagedata unihash changed to fcf58cf9de0f787cad2fd808f39f5cf2dd27f63dbed4f20cb48746e4d3d9ea52
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_qa: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_write_rpm unihash changed to e4bf55982da0a3f65a6b51d290e829cb07c000dd9771d5678b90d0796c7e0581
NOTE: recipe python3-packaging-26.3-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_packagedata unihash changed to 9823dda3d09218756ab8a3778f54ab670d18abae04783d39aa2320462e9dae33
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_packagedata unihash changed to 37a1bc0cc34b0dff0735d13350fb3795ad3f031f66a931e81aa955f083f698eb
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_write_ipk unihash changed to 532c0c42ca72220f0b7d6c57a75a9d0b02ee1f3c3c9f8da3d2e5e05bb16e965a
NOTE: Setscene tasks completed
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_qa unihash changed to 266694a480d5cf69d2c40cd3321f4ec5c937329e74ec2cfa0ea523e94879c9b7
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_write_deb unihash changed to 951fe59174d41efe8bd17869ff68d609dbefb0b61f6ddda9e7812c285c40cd86
NOTE: recipe python3-pygments-2.21.0-r0: task do_package: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_package unihash changed to 96683e3ebd86d9f22c09d5765ae9f1e506926a2091bc2b9bd819ec84495719d6
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_write_rpm unihash changed to 18473869d59d7c6a8860c862b0231cd472eb01a3b79a927fac68f6170c208472
NOTE: Setscene tasks completed
NOTE: Running task 2394 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_packagedata)
NOTE: recipe python3-pygments-2.21.0-r0: task do_packagedata: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_packagedata unihash changed to b43fff1094a108e4540dd78d58d344475a7cd4724fd5187adddfaabb93454a96
NOTE: Setscene tasks completed
NOTE: Running task 2395 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_package_write_ipk)
NOTE: Running task 2396 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_package_write_deb)
NOTE: Running task 2397 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_package_write_rpm)
NOTE: Running task 2398 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_package_qa)
NOTE: recipe python3-pytest-9.1.1-r0: task do_package_write_ipk: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_package_write_deb: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_package_qa: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_package_write_ipk unihash changed to 42d60296355709c26fd5798504f975f3c6e0bcdd405e186b546dfa834f2a74cc
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_package_qa unihash changed to e22cde4decfc14ef8ff39f1bb8410e10e92df22adb2f68fa5237f774138d59d2
NOTE: recipe python3-pytest-9.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_package_write_rpm unihash changed to 952dbe39ce0d4217862a9e49451cc8275456ccaa44562dd5066f0ddad44cef68
NOTE: recipe python3-3.14.7-r0: task do_create_spdx: Succeeded
NOTE: Running task 2399 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_create_spdx)
NOTE: Running task 2400 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_26.1.0.bb:do_create_spdx)
NOTE: Running task 2401 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_create_spdx)
NOTE: Running task 2402 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_create_spdx)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_create_spdx: Started
NOTE: recipe python3-attrs-26.1.0-r0: task do_create_spdx: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_create_spdx: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_create_spdx: Started
NOTE: recipe python3-hypothesis-6.168.5-r0: task do_compile: Succeeded
NOTE: Running task 2403 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.5.bb:do_compile_ptest_base)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-attrs-26.1.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-hypothesis-6.168.5-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-hypothesis-6.168.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2404 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.5.bb:do_install)
NOTE: recipe python3-pytest-9.1.1-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_package_write_deb unihash changed to 45b0710c2100ca24f80771e80f1ef8011520511b09c2be561c4058623303837c
NOTE: recipe python3-hypothesis-6.168.5-r0: task do_install: Started
NOTE: recipe gnutls-3.8.13-r0: task do_compile: Succeeded
NOTE: Running task 2405 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_compile_ptest_base)
NOTE: recipe gnutls-3.8.13-r0: task do_compile_ptest_base: Started
NOTE: recipe gnutls-3.8.13-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2406 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_install)
NOTE: recipe gnutls-3.8.13-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.168.5-r0: task do_install: Succeeded
NOTE: Running task 2407 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.5.bb:do_install_ptest_base)
NOTE: recipe python3-hypothesis-6.168.5-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.168.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2408 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.5.bb:do_package)
NOTE: Running task 2409 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.5.bb:do_populate_sysroot)
NOTE: recipe python3-hypothesis-6.168.5-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.168.5-r0: task do_populate_sysroot: Started
NOTE: recipe python3-hypothesis-6.168.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.168.5-r0: task do_package: Succeeded
NOTE: Running task 2410 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.5.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.168.5-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.168.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2411 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.5.bb:do_create_spdx)
NOTE: Running task 2412 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_26.1.0.bb:do_package_write_ipk)
NOTE: Running task 2413 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_26.1.0.bb:do_package_write_deb)
NOTE: Running task 2414 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_26.1.0.bb:do_package_write_rpm)
NOTE: Running task 2415 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_26.1.0.bb:do_package_qa)
NOTE: Running task 2416 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.5.bb:do_package_write_ipk)
NOTE: Running task 2417 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.5.bb:do_package_write_deb)
NOTE: Running task 2418 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.5.bb:do_package_write_rpm)
NOTE: Running task 2419 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.5.bb:do_package_qa)
NOTE: recipe python3-hypothesis-6.168.5-r0: task do_create_spdx: Started
NOTE: recipe python3-attrs-26.1.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-attrs-26.1.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-attrs-26.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-attrs-26.1.0-r0: task do_package_qa: Started
NOTE: recipe python3-hypothesis-6.168.5-r0: task do_package_write_ipk: Started
NOTE: recipe python3-hypothesis-6.168.5-r0: task do_package_write_deb: Started
NOTE: recipe python3-hypothesis-6.168.5-r0: task do_package_write_rpm: Started
NOTE: recipe python3-hypothesis-6.168.5-r0: task do_package_qa: Started
NOTE: recipe python3-attrs-26.1.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-attrs-26.1.0-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_26.1.0.bb:do_package_write_ipk unihash changed to fcb24a66846427e95d0781158d0497bc29059ffb849208481f56f0b4dcd134f1
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_26.1.0.bb:do_package_qa unihash changed to 505258644eb52db1fc2ee7ea87cc80b834ba38302ef831f9fb510a74dbc536cd
NOTE: recipe python3-attrs-26.1.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_26.1.0.bb:do_package_write_deb unihash changed to 1640ddf4aed1aeda8b4d516ffdf1f17a0b7403709e8d5d50019122a79519850c
NOTE: recipe python3-hypothesis-6.168.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 2420 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.5.bb:do_create_package_spdx)
NOTE: recipe python3-hypothesis-6.168.5-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-attrs-26.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.168.5-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_26.1.0.bb:do_package_write_rpm unihash changed to aab1c176231ba7035fe8c1aba1e0271b9c23481acbf8cf9d05de1fa6424f3c88
NOTE: recipe python3-hypothesis-6.168.5-r0: task do_create_package_spdx: Started
NOTE: recipe python3-hypothesis-6.168.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_install: Succeeded
NOTE: Running task 2421 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_install_ptest_base)
NOTE: recipe gnutls-3.8.13-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.168.5-r0: task do_create_package_spdx: Succeeded
NOTE: recipe python3-hypothesis-6.168.5-r0: task do_package_write_deb: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2422 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_populate_sysroot)
NOTE: Running task 2423 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_package)
NOTE: recipe gnutls-3.8.13-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.8.13-r0: task do_package: Started
NOTE: recipe gnutls-3.8.13-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_populate_sysroot unihash changed to 0103322e3ed679176fccffea0b5b302d1fcb3a2e5247e568de0db03cce597613
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_populate_sysroot became valid
NOTE: Running setscene task 1012 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_populate_sysroot_setscene)
NOTE: recipe elfutils-0.196-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.196-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1015 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2424 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2425 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_configure)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.13-r0: task do_package: Succeeded
NOTE: Running task 2426 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_packagedata)
NOTE: recipe gnutls-3.8.13-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.8.13-r0: task do_packagedata: Succeeded
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_configure: Succeeded
NOTE: Running task 2427 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_compile)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_compile: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_compile: Succeeded
NOTE: Running task 2428 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_install)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_install: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_install: Succeeded
NOTE: Running task 2430 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2431 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_package)
NOTE: recipe elfutils-0.196-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_package: Started
NOTE: recipe elfutils-0.196-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2432 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_configure)
NOTE: recipe elfutils-0.196-r0: task do_configure: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_package unihash changed to 315c679fb5290c29025f47cd551677b99e945fd51d6d320cdd84f454fa55bca7
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_packagedata became valid
NOTE: Running setscene task 1008 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe elfutils-0.196-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2434 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_configure_ptest_base)
NOTE: recipe elfutils-0.196-r0: task do_configure_ptest_base: Started
NOTE: recipe elfutils-0.196-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2435 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_compile)
NOTE: recipe elfutils-0.196-r0: task do_compile: Started
NOTE: recipe elfutils-0.196-r0: task do_compile: Succeeded
NOTE: Running task 2436 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_compile_ptest_base)
NOTE: recipe elfutils-0.196-r0: task do_compile_ptest_base: Started
NOTE: recipe elfutils-0.196-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2437 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_install)
NOTE: recipe elfutils-0.196-r0: task do_install: Started
NOTE: recipe elfutils-0.196-r0: task do_install: Succeeded
NOTE: Running task 2438 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_install_ptest_base)
NOTE: recipe elfutils-0.196-r0: task do_install_ptest_base: Started
NOTE: recipe elfutils-0.196-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2440 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2441 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_package)
NOTE: recipe binutils-2.47-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.196-r0: task do_package: Started
NOTE: recipe binutils-2.47-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2442 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_configure)
NOTE: recipe binutils-2.47-r0: task do_configure: Started
NOTE: recipe binutils-2.47-r0: task do_configure: Succeeded
NOTE: Running task 2443 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_compile)
NOTE: recipe binutils-2.47-r0: task do_compile: Started
NOTE: recipe elfutils-0.196-r0: task do_package: Succeeded
NOTE: Running task 2444 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_packagedata)
NOTE: recipe elfutils-0.196-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.196-r0: task do_packagedata: Succeeded
NOTE: recipe gcc-16.2.0-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2445 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_install)
NOTE: recipe gcc-16.2.0-r0: task do_install: Started
NOTE: recipe binutils-2.47-r0: task do_compile: Succeeded
NOTE: Running task 2446 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_install)
NOTE: recipe binutils-2.47-r0: task do_install: Started
NOTE: recipe gcc-16.2.0-r0: task do_install: Succeeded
NOTE: Running task 2447 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_package)
NOTE: recipe gcc-16.2.0-r0: task do_package: Started
NOTE: recipe binutils-2.47-r0: task do_install: Succeeded
NOTE: Running task 2448 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_package)
NOTE: recipe binutils-2.47-r0: task do_package: Started
NOTE: recipe binutils-2.47-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_package unihash changed to 23bb7a0d8ea889bc4ad76ebbf6d309f94516e879bdcaf88d15ebde7c5d727369
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_packagedata became valid
NOTE: Running setscene task 1015 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.47-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gcc-16.2.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_package unihash changed to 707eec60339638c9d67e4d78aaa55063822723f01db4d9d4be8db3a0c3210cc8
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_packagedata became valid
NOTE: Running setscene task 1015 of 1015 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2451 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_write_ipk)
NOTE: Running task 2452 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_write_deb)
NOTE: Running task 2453 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_write_rpm)
NOTE: Running task 2454 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_qa)
NOTE: recipe python3-3.14.7-r0: task do_package_write_deb: Started
NOTE: recipe python3-3.14.7-r0: task do_package_write_rpm: Started
NOTE: recipe python3-3.14.7-r0: task do_package_write_ipk: Started
NOTE: recipe python3-3.14.7-r0: task do_package_qa: Started
NOTE: recipe python3-3.14.7-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_write_ipk unihash changed to 3bf0eb04619dfc17ab3af868f3fd5d74a0b2b9d1deaf75b3c0cd8f0357568e19
NOTE: recipe python3-3.14.7-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_qa unihash changed to d7d66b7745f42aad44cda0709af988ac1ea680f3481f6d2f5fe8537c25c9eebc
NOTE: recipe python3-3.14.7-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_write_rpm unihash changed to e150cede4899a657547f2b5d344dab1e48592f5588f0f1f309ebffe4ef742bfe
NOTE: recipe python3-3.14.7-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_write_deb unihash changed to 15d625274e41d83d12d6fafcf4c4fa5f30e50c921ba11d4f18df8127be4247c2
NOTE: Running noexec task 2455 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.5.bb:do_build)
NOTE: Tasks Summary: Attempted 2455 tasks of which 1730 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 10 ERROR messages, returning a non-zero exit code.
ERROR: expat-2.8.5-r0 do_packagedata_setscene: QA Issue: Package version for package expat-src went backwards which would break package feeds (from 0:2.9.0-r0 to 0:2.8.5-r0) [version-going-backwards]
ERROR: expat-2.8.5-r0 do_packagedata_setscene: QA Issue: Package version for package expat-dbg went backwards which would break package feeds (from 0:2.9.0-r0 to 0:2.8.5-r0) [version-going-backwards]
ERROR: expat-2.8.5-r0 do_packagedata_setscene: QA Issue: Package version for package expat-ptest went backwards which would break package feeds (from 0:2.9.0-r0 to 0:2.8.5-r0) [version-going-backwards]
ERROR: expat-2.8.5-r0 do_packagedata_setscene: QA Issue: Package version for package expat-staticdev went backwards which would break package feeds (from 0:2.9.0-r0 to 0:2.8.5-r0) [version-going-backwards]
ERROR: expat-2.8.5-r0 do_packagedata_setscene: QA Issue: Package version for package expat-dev went backwards which would break package feeds (from 0:2.9.0-r0 to 0:2.8.5-r0) [version-going-backwards]
ERROR: expat-2.8.5-r0 do_packagedata_setscene: QA Issue: Package version for package expat-doc went backwards which would break package feeds (from 0:2.9.0-r0 to 0:2.8.5-r0) [version-going-backwards]
ERROR: expat-2.8.5-r0 do_packagedata_setscene: QA Issue: Package version for package expat-locale went backwards which would break package feeds (from 0:2.9.0-r0 to 0:2.8.5-r0) [version-going-backwards]
ERROR: expat-2.8.5-r0 do_packagedata_setscene: QA Issue: Package version for package expat-bin went backwards which would break package feeds (from 0:2.9.0-r0 to 0:2.8.5-r0) [version-going-backwards]
ERROR: expat-2.8.5-r0 do_packagedata_setscene: QA Issue: Package version for package expat went backwards which would break package feeds (from 0:2.9.0-r0 to 0:2.8.5-r0) [version-going-backwards]
ERROR: expat-2.8.5-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3844577043844856262==--

