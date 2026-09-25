Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 462B4C9830D
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 06:52:58 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2757.1790319174731618655
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Sep 2026 23:52:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=OhRnlTpP;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=n633tFJc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a0d756a062-5e5e7a1b-99b5-446a-be56-2e647e198dd3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790319173;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nz5ckHjrlHblbOsfKtENAa+VBi0GVo8p+c+m2RzVndg=;
	b=OhRnlTpPdS1thE+o/bONocJD/gH97cIZfx9QNwvayJRgzPgEG6Ogu3bvf7pcX8vv
	Vn2LTED7ykqt2BXnIJpGCQ4paMpt8l0udZp+svB9LZyTW9k+gwn0jngejuvzJ5dHw4y
	fFFfFM/71/d4a1GNj/GOb0vI+KUPcTFtne9eXWnE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790319173;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nz5ckHjrlHblbOsfKtENAa+VBi0GVo8p+c+m2RzVndg=;
	b=n633tFJcJYIv0yn7PR3EM40906eirYQejJLwJJ/EGUnDgpsf9qUb/Ht1wz9IecmG
	nx4EwBQmQvgswvmWaZ7KGrgV38w7wZBdJKSTbP5BC0UKZtbF1jw1C45/kV/UGiibdno
	DqUTjdVDdJ6lXdR96O7BFYG/bTmZI49z2R8TgTZ0=
Content-Type: multipart/mixed; boundary="===============1510109715008923311=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-uv-build: upgrading to 0.12.19 SUCCEEDED
Message-ID: <010101a0d756a062-5e5e7a1b-99b5-446a-be56-2e647e198dd3-000000@us-west-2.amazonses.com>
Date: Fri, 25 Sep 2026 06:52:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.25-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2026 06:52:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246602

--===============1510109715008923311==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-uv-build* to *0.12.19* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-uv-build-upgrade-0.12.17-0.12.19.patch
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
From 9455e14bc69d61378a60f09f9d3edf9d7ebcd2e3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 25 Sep 2026 05:19:46 +0000
Subject: [PATCH] python3-uv-build: upgrade 0.12.17 -> 0.12.19

---
 .../python/python3-uv-build-crates.inc               | 12 ++++++------
 ...-build_0.12.17.bb => python3-uv-build_0.12.19.bb} |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.12.17.bb => python3-uv-build_0.12.19.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-uv-build-crates.inc b/meta/recipes-devtools/python/python3-uv-build-crates.inc
index 486d993c32..3ba46dd5de 100644
--- a/meta/recipes-devtools/python/python3-uv-build-crates.inc
+++ b/meta/recipes-devtools/python/python3-uv-build-crates.inc
@@ -58,7 +58,7 @@ SRC_URI += " \
     crate://crates.io/displaydoc/0.2.5 \
     crate://crates.io/dunce/1.0.5 \
     crate://crates.io/dyn-clone/1.0.20 \
-    crate://crates.io/either/1.17.0 \
+    crate://crates.io/either/1.18.0 \
     crate://crates.io/encode_unicode/1.0.0 \
     crate://crates.io/encoding_rs/0.8.35 \
     crate://crates.io/encoding_rs_io/0.1.8 \
@@ -166,8 +166,8 @@ SRC_URI += " \
     crate://crates.io/r-efi/6.0.0 \
     crate://crates.io/rancor/0.1.1 \
     crate://crates.io/redox_syscall/0.5.15 \
-    crate://crates.io/ref-cast/1.0.26 \
-    crate://crates.io/ref-cast-impl/1.0.26 \
+    crate://crates.io/ref-cast/1.0.27 \
+    crate://crates.io/ref-cast-impl/1.0.27 \
     crate://crates.io/reflink-copy/0.1.30 \
     crate://crates.io/regex/1.13.1 \
     crate://crates.io/regex-automata/0.4.18 \
@@ -367,7 +367,7 @@ SRC_URI[digest-0.11.3.sha256sum] = "f1dd6dbb5841937940781866fa1281a1ff7bd3bf8270
 SRC_URI[displaydoc-0.2.5.sha256sum] = "97369cbbc041bc366949bc74d34658d6cda5621039731c6310521892a3a20ae0"
 SRC_URI[dunce-1.0.5.sha256sum] = "92773504d58c093f6de2459af4af33faa518c13451eb8f2b5698ed3d36e7c813"
 SRC_URI[dyn-clone-1.0.20.sha256sum] = "d0881ea181b1df73ff77ffaaf9c7544ecc11e82fba9b5f27b262a3c73a332555"
-SRC_URI[either-1.17.0.sha256sum] = "9e5e8f6c15a24b9a3ee5efec809ccd006d3b30e8b3bb63c39af737c7f87daa1d"
+SRC_URI[either-1.18.0.sha256sum] = "252afb9ae5eaa683babdc6a068b3f5726eb19e05070c731f9b2a23a7c3e8ed34"
 SRC_URI[encode_unicode-1.0.0.sha256sum] = "34aa73646ffb006b8f5147f3dc182bd4bcb190227ce861fc4a4844bf8e3cb2c0"
 SRC_URI[encoding_rs-0.8.35.sha256sum] = "75030f3c4f45dafd7586dd6780965a8c7e8e285a5ecb86713e63a79c5b2766f3"
 SRC_URI[encoding_rs_io-0.1.8.sha256sum] = "fba3fe847045ecff794b9c138293a80db914678c453ad63fbf0c6a9eb6e00b22"
@@ -475,8 +475,8 @@ SRC_URI[quoted_printable-0.5.1.sha256sum] = "640c9bd8497b02465aeef5375144c26062e
 SRC_URI[r-efi-6.0.0.sha256sum] = "f8dcc9c7d52a811697d2151c701e0d08956f92b0e24136cf4cf27b57a6a0d9bf"
 SRC_URI[rancor-0.1.1.sha256sum] = "a063ea72381527c2a0561da9c80000ef822bdd7c3241b1cc1b12100e3df081ee"
 SRC_URI[redox_syscall-0.5.15.sha256sum] = "7e8af0dde094006011e6a740d4879319439489813bd0bcdc7d821beaeeff48ec"
-SRC_URI[ref-cast-1.0.26.sha256sum] = "216e8f773d7923bcba9ceb86a86c93cabb3903a11872fc3f138c49630e50b96d"
-SRC_URI[ref-cast-impl-1.0.26.sha256sum] = "2c9283685feec7d69af75fb0e858d5e7378f33fe4fc699383b2916ab9273e03c"
+SRC_URI[ref-cast-1.0.27.sha256sum] = "7e440fb4e4b4147295338efb76001ab9e4efc0e5839df2c47fc5ac2381d365c3"
+SRC_URI[ref-cast-impl-1.0.27.sha256sum] = "92ecd8964f8453721699a1ed72037b0db49ce2f5a5138486ee89bed6f67cdf3a"
 SRC_URI[reflink-copy-0.1.30.sha256sum] = "d9dd7ab4af0363d5ccfd2838d782a28196cf32a5cc2e4fe3c5dc83f2be588b8b"
 SRC_URI[regex-1.13.1.sha256sum] = "f020237b6c8eed93db2e2cb53c00c60a8e1bc73da7d073199a1180401450218d"
 SRC_URI[regex-automata-0.4.18.sha256sum] = "ad8553b9b26413251cbf30e620595c7a41b3887f03da04579c0e6b0d6a06b4b2"
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.12.17.bb b/meta/recipes-devtools/python/python3-uv-build_0.12.19.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.12.17.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.12.19.bb
index 322ac35f48..9004a76248 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.12.17.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.12.19.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "ae5cd835cf479a76efb161ddb9c6411acf63f5687dacd3d56d15e9a5783f740f"
+SRC_URI[sha256sum] = "6b605574da32cefd4264727f7e391e77fe289686192a7eb772e69b3e705da577"
 
 require ${BPN}-crates.inc
 
-- 
2.47.1


--===============1510109715008923311==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.12.17.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.12.19.dist-info, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.12.17.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.12.19.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.12.17.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.12.19.dist-info

--===============1510109715008923311==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-uv-build-upgrade-0.12.17-0.12.19.patch"

RnJvbSA5NDU1ZTE0YmM2OWQ2MTM3OGE2MGYwOWY5ZDNlZGY5ZDdlYmNkMmUzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMjUgU2VwIDIwMjYgMDU6MTk6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXV2LWJ1aWxkOiB1cGdyYWRlIDAuMTIuMTcgLT4gMC4xMi4xOQoKLS0tCiAuLi4vcHl0
aG9uL3B5dGhvbjMtdXYtYnVpbGQtY3JhdGVzLmluYyAgICAgICAgICAgICAgIHwgMTIgKysrKysr
LS0tLS0tCiAuLi4tYnVpbGRfMC4xMi4xNy5iYiA9PiBweXRob24zLXV2LWJ1aWxkXzAuMTIuMTku
YmJ9IHwgIDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9u
cygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtdXYtYnVp
bGRfMC4xMi4xNy5iYiA9PiBweXRob24zLXV2LWJ1aWxkXzAuMTIuMTkuYmJ9ICg5MiUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNy
YXRlcy5pbmMgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGQt
Y3JhdGVzLmluYwppbmRleCA0ODZkOTkzYzMyLi4zYmE0NmRkNWRlIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGQtY3JhdGVzLmluYworKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGQtY3JhdGVzLmlu
YwpAQCAtNTgsNyArNTgsNyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlv
L2Rpc3BsYXlkb2MvMC4yLjUgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2R1bmNlLzEuMC41IFwK
ICAgICBjcmF0ZTovL2NyYXRlcy5pby9keW4tY2xvbmUvMS4wLjIwIFwKLSAgICBjcmF0ZTovL2Ny
YXRlcy5pby9laXRoZXIvMS4xNy4wIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9laXRoZXIvMS4x
OC4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9lbmNvZGVfdW5pY29kZS8xLjAuMCBcCiAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vZW5jb2RpbmdfcnMvMC44LjM1IFwKICAgICBjcmF0ZTovL2NyYXRl
cy5pby9lbmNvZGluZ19yc19pby8wLjEuOCBcCkBAIC0xNjYsOCArMTY2LDggQEAgU1JDX1VSSSAr
PSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9yLWVmaS82LjAuMCBcCiAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vcmFuY29yLzAuMS4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9yZWRveF9zeXNj
YWxsLzAuNS4xNSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcmVmLWNhc3QvMS4wLjI2IFwKLSAg
ICBjcmF0ZTovL2NyYXRlcy5pby9yZWYtY2FzdC1pbXBsLzEuMC4yNiBcCisgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vcmVmLWNhc3QvMS4wLjI3IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9yZWYtY2Fz
dC1pbXBsLzEuMC4yNyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcmVmbGluay1jb3B5LzAuMS4z
MCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcmVnZXgvMS4xMy4xIFwKICAgICBjcmF0ZTovL2Ny
YXRlcy5pby9yZWdleC1hdXRvbWF0YS8wLjQuMTggXApAQCAtMzY3LDcgKzM2Nyw3IEBAIFNSQ19V
UklbZGlnZXN0LTAuMTEuMy5zaGEyNTZzdW1dID0gImYxZGQ2ZGJiNTg0MTkzNzk0MDc4MTg2NmZh
MTI4MWExZmY3YmQzYmY4MjcwCiBTUkNfVVJJW2Rpc3BsYXlkb2MtMC4yLjUuc2hhMjU2c3VtXSA9
ICI5NzM2OWNiYmMwNDFiYzM2Njk0OWJjNzRkMzQ2NThkNmNkYTU2MjEwMzk3MzFjNjMxMDUyMTg5
MmEzYTIwYWUwIgogU1JDX1VSSVtkdW5jZS0xLjAuNS5zaGEyNTZzdW1dID0gIjkyNzczNTA0ZDU4
YzA5M2Y2ZGUyNDU5YWY0YWYzM2ZhYTUxOGMxMzQ1MWViOGYyYjU2OThlZDNkMzZlN2M4MTMiCiBT
UkNfVVJJW2R5bi1jbG9uZS0xLjAuMjAuc2hhMjU2c3VtXSA9ICJkMDg4MWVhMTgxYjFkZjczZmY3
N2ZmYWFmOWM3NTQ0ZWNjMTFlODJmYmE5YjVmMjdiMjYyYTNjNzNhMzMyNTU1IgotU1JDX1VSSVtl
aXRoZXItMS4xNy4wLnNoYTI1NnN1bV0gPSAiOWU1ZThmNmMxNWEyNGI5YTNlZTVlZmVjODA5Y2Nk
MDA2ZDNiMzBlOGIzYmI2M2MzOWFmNzM3YzdmODdkYWExZCIKK1NSQ19VUklbZWl0aGVyLTEuMTgu
MC5zaGEyNTZzdW1dID0gIjI1MmFmYjlhZTVlYWE2ODNiYWJkYzZhMDY4YjNmNTcyNmViMTllMDUw
NzBjNzMxZjliMmEyM2E3YzNlOGVkMzQiCiBTUkNfVVJJW2VuY29kZV91bmljb2RlLTEuMC4wLnNo
YTI1NnN1bV0gPSAiMzRhYTczNjQ2ZmZiMDA2YjhmNTE0N2YzZGMxODJiZDRiY2IxOTAyMjdjZTg2
MWZjNGE0ODQ0YmY4ZTNjYjJjMCIKIFNSQ19VUklbZW5jb2RpbmdfcnMtMC44LjM1LnNoYTI1NnN1
bV0gPSAiNzUwMzBmM2M0ZjQ1ZGFmZDc1ODZkZDY3ODA5NjVhOGM3ZThlMjg1YTVlY2I4NjcxM2U2
M2E3OWM1YjI3NjZmMyIKIFNSQ19VUklbZW5jb2RpbmdfcnNfaW8tMC4xLjguc2hhMjU2c3VtXSA9
ICJmYmEzZmU4NDcwNDVlY2ZmNzk0YjljMTM4MjkzYTgwZGI5MTQ2NzhjNDUzYWQ2M2ZiZjBjNmE5
ZWI2ZTAwYjIyIgpAQCAtNDc1LDggKzQ3NSw4IEBAIFNSQ19VUklbcXVvdGVkX3ByaW50YWJsZS0w
LjUuMS5zaGEyNTZzdW1dID0gIjY0MGM5YmQ4NDk3YjAyNDY1YWVlZjUzNzUxNDRjMjYwNjJlCiBT
UkNfVVJJW3ItZWZpLTYuMC4wLnNoYTI1NnN1bV0gPSAiZjhkY2M5YzdkNTJhODExNjk3ZDIxNTFj
NzAxZTBkMDg5NTZmOTJiMGUyNDEzNmNmNGNmMjdiNTdhNmEwZDliZiIKIFNSQ19VUklbcmFuY29y
LTAuMS4xLnNoYTI1NnN1bV0gPSAiYTA2M2VhNzIzODE1MjdjMmEwNTYxZGE5YzgwMDAwZWY4MjJi
ZGQ3YzMyNDFiMWNjMWIxMjEwMGUzZGYwODFlZSIKIFNSQ19VUklbcmVkb3hfc3lzY2FsbC0wLjUu
MTUuc2hhMjU2c3VtXSA9ICI3ZThhZjBkZGUwOTQwMDYwMTFlNmE3NDBkNDg3OTMxOTQzOTQ4OTgx
M2JkMGJjZGM3ZDgyMWJlYWVlZmY0OGVjIgotU1JDX1VSSVtyZWYtY2FzdC0xLjAuMjYuc2hhMjU2
c3VtXSA9ICIyMTZlOGY3NzNkNzkyM2JjYmE5Y2ViODZhODZjOTNjYWJiMzkwM2ExMTg3MmZjM2Yx
MzhjNDk2MzBlNTBiOTZkIgotU1JDX1VSSVtyZWYtY2FzdC1pbXBsLTEuMC4yNi5zaGEyNTZzdW1d
ID0gIjJjOTI4MzY4NWZlZWM3ZDY5YWY3NWZiMGU4NThkNWU3Mzc4ZjMzZmU0ZmM2OTkzODNiMjkx
NmFiOTI3M2UwM2MiCitTUkNfVVJJW3JlZi1jYXN0LTEuMC4yNy5zaGEyNTZzdW1dID0gIjdlNDQw
ZmI0ZTRiNDE0NzI5NTMzOGVmYjc2MDAxYWI5ZTRlZmMwZTU4MzlkZjJjNDdmYzVhYzIzODFkMzY1
YzMiCitTUkNfVVJJW3JlZi1jYXN0LWltcGwtMS4wLjI3LnNoYTI1NnN1bV0gPSAiOTJlY2Q4OTY0
Zjg0NTM3MjE2OTlhMWVkNzIwMzdiMGRiNDljZTJmNWE1MTM4NDg2ZWU4OWJlZDZmNjdjZGYzYSIK
IFNSQ19VUklbcmVmbGluay1jb3B5LTAuMS4zMC5zaGEyNTZzdW1dID0gImQ5ZGQ3YWI0YWYwMzYz
ZDVjY2ZkMjgzOGQ3ODJhMjgxOTZjZjMyYTVjYzJlNGZlM2M1ZGM4M2YyYmU1ODhiOGIiCiBTUkNf
VVJJW3JlZ2V4LTEuMTMuMS5zaGEyNTZzdW1dID0gImYwMjAyMzdiNmM4ZWVkOTNkYjJlMmNiNTNj
MDBjNjBhOGUxYmM3M2RhN2QwNzMxOTlhMTE4MDQwMTQ1MDIxOGQiCiBTUkNfVVJJW3JlZ2V4LWF1
dG9tYXRhLTAuNC4xOC5zaGEyNTZzdW1dID0gImFkODU1M2I5YjI2NDEzMjUxY2JmMzBlNjIwNTk1
YzdhNDFiMzg4N2YwM2RhMDQ1NzljMGU2YjBkNmEwNmI0YjIiCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGRfMC4xMi4xNy5iYiBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZF8wLjEyLjE5LmJiCnNpbWls
YXJpdHkgaW5kZXggOTIlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy11di1idWlsZF8wLjEyLjE3LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGRfMC4xMi4xOS5iYgppbmRleCAzMjJhYzM1ZjQ4Li45
MDA0YTc2MjQ4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtdXYtYnVpbGRfMC4xMi4xNy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtdXYtYnVpbGRfMC4xMi4xOS5iYgpAQCAtMTEsNyArMTEsNyBAQCBMSUNfRklMRVNf
Q0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLUFQQUNIRTttZDU9ODZkM2YzYTk1YzMyNGM5NDc5YmQ4
OTg2OTY4ZjQzMjcgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vY3JhdGVzL3V2LXBlcDUw
OC9MaWNlbnNlLUFwYWNoZTttZDU9ZTIzZmFkZDZjZWVmOGM2MThmYzFjNjUxOTFkODQ2ZmEgXAog
ICAgICAgICAgICAgICAgICAgICBmaWxlOi8vY3JhdGVzL3V2LXBlcDUwOC9MaWNlbnNlLUJTRDtt
ZDU9ZWY3YTYwMjdkYzRjMjM4OWI5YWZhZDdlNjkwMjc0YzciCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICJhZTVjZDgzNWNmNDc5YTc2ZWZiMTYxZGRiOWM2NDExYWNmNjNmNTY4N2RhY2QzZDU2ZDE1
ZTlhNTc4M2Y3NDBmIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjZiNjA1NTc0ZGEzMmNlZmQ0MjY0
NzI3ZjdlMzkxZTc3ZmUyODk2ODYxOTJhN2ViNzcyZTY5YjNlNzA1ZGE1NzciCiAKIHJlcXVpcmUg
JHtCUE59LWNyYXRlcy5pbmMKIAotLSAKMi40Ny4xCgo=

--===============1510109715008923311==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-uv-build: PV changed from "0.12.17" to "0.12.19"
packages/x86-64-v3-poky-linux/python3-uv-build: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/uv_build/uv_build-0.12.17.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/ambient-authority/0.0.2 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.104 crate://crates.io/archive-trait/0.0.14 crate://crates.io/arcstr/1.2.0 crate://crates.io/arrayvec/0.7.8 crate://crates.io/astral-tokio-tar/0.7.0 crate://crates.io/astral-version-ranges/0.2.2 crate://crates.io/astral_async_zip/0.0.20 crate://crates.io/async-compression/0.4.19 crate://crates.io/autocfg/1.5.0 crate://crates.io/backon/1.6.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.13.1 crate://crates.io/block-buffer/0.10.4 crate://crates.io/block-buffer/0.12.1 crate://
 crates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.1 crate://crates.io/bumpalo/3.20.2 crate://crates.io/bytecheck/0.8.3 crate://crates.io/bytecheck_derive/0.8.3 crate://crates.io/bytes/1.12.1 crate://crates.io/cap-primitives/4.0.3 crate://crates.io/cap-std/4.0.3 crate://crates.io/cc/1.2.57 crate://crates.io/cfg-if/1.0.4 crate://crates.io/charset/0.1.5 crate://crates.io/clap/4.6.6 crate://crates.io/clap_builder/4.6.6 crate://crates.io/clap_derive/4.6.4 crate://crates.io/clap_lex/1.1.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/console/0.16.4 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/cpufeatures/0.3.0 crate://crates.io/crc32fast/1.5.0 crate://crates.io/crypto-common/0.1.7 crate://crates.io/crypto-common/0.2.2 crate://crates.io/csv/1.4.0 crate://crates.io/csv-core/0.1.13 crate://crates.io/data-encoding/2.11.1 crate://crates.io/defmt/1.1.0 crate://crates.io/defmt-macros/1.1.0 crate://crates.io/defmt-parser/1.0.0 crate://crates.io/digest/0.10.7 crate://crates.io/
 digest/0.11.3 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.17.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/encoding_rs_io/0.1.8 crate://crates.io/enumflags2/0.7.12 crate://crates.io/enumflags2_derive/0.7.12 crate://crates.io/equivalent/1.0.2 crate://crates.io/erased-serde/0.4.10 crate://crates.io/errno/0.3.14 crate://crates.io/fastrand/2.5.0 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.9 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.1 crate://crates.io/fs-set-times/0.20.3 crate://crates.io/futures/0.3.34 crate://crates.io/futures-channel/0.3.34 crate://crates.io/futures-core/0.3.34 crate://crates.io/futures-executor/0.3.34 crate://crates.io/futures-io/0.3.34 crate://crates.io/futures-lite/2.6.1 crate://cra
 tes.io/futures-macro/0.3.34 crate://crates.io/futures-sink/0.3.34 crate://crates.io/futures-task/0.3.34 crate://crates.io/futures-util/0.3.34 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.4.3 crate://crates.io/globset/0.4.20 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.17.1 crate://crates.io/heck/0.5.0 crate://crates.io/hex/0.4.3 crate://crates.io/hybrid-array/0.4.13 crate://crates.io/icu_collections/2.1.1 crate://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.2 crate://crates.io/icu_properties_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/indexmap/2.14.0 crate://crates.io/indoc/2.0.7 crate://crates.io/insta/1.48.0 crate://crates.io/io-extras/0.19.0 crate://crates.io/io-lifetimes/2.0.4 crate://crates.io/io-lifetimes/3.0.1 crate://crates.io/ipnet/2.12.0 
 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.17 crate://crates.io/jiff/0.2.35 crate://crates.io/jiff-core/0.1.0 crate://crates.io/jiff-static/0.2.35 crate://crates.io/jiff-tzdb/0.1.8 crate://crates.io/jiff-tzdb-platform/0.1.3 crate://crates.io/jobserver/0.1.35 crate://crates.io/js-sys/0.3.91 crate://crates.io/junction/2.0.0 crate://crates.io/lazy_static/1.5.0 crate://crates.io/libc/0.2.189 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.1 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/mailparse/0.16.1 crate://crates.io/matchers/0.2.0 crate://crates.io/maybe-owned/0.3.4 crate://crates.io/memchr/2.8.3 crate://crates.io/miniz_oxide/0.8.9 crate://crates.io/mio/1.2.0 crate://crates.io/munge/0.4.7 crate://crates.io/munge_macro/0.4.7 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/owo-col
 ors/4.3.0 crate://crates.io/parking/2.2.1 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/path-slash/0.2.1 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/pest/2.8.6 crate://crates.io/pest_derive/2.8.6 crate://crates.io/pest_generator/2.8.6 crate://crates.io/pest_meta/2.8.6 crate://crates.io/petgraph/0.8.3 crate://crates.io/pin-project/1.1.11 crate://crates.io/pin-project-internal/1.1.11 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/pkg-config/0.3.32 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/portable-atomic-util/0.2.6 crate://crates.io/potential_utf/0.1.4 crate://crates.io/proc-macro-error-attr2/2.0.0 crate://crates.io/proc-macro-error2/2.0.1 crate://crates.io/proc-macro2/1.0.107 crate://crates.io/ptr_meta/0.3.1 crate://crates.io/ptr_meta_derive/0.3.1 crate://crates.io/quote/1.0.47 crate://crates.io/quoted_printable/0.5.1 crate://crates.io/r-efi/6.0.0 crate://crates.io/rancor/0.1.1 crate://cra
 tes.io/redox_syscall/0.5.15 crate://crates.io/ref-cast/1.0.26 crate://crates.io/ref-cast-impl/1.0.26 crate://crates.io/reflink-copy/0.1.30 crate://crates.io/regex/1.13.1 crate://crates.io/regex-automata/0.4.18 crate://crates.io/regex-syntax/0.8.11 crate://crates.io/rend/0.5.3 crate://crates.io/rkyv/0.8.18 crate://crates.io/rkyv_derive/0.8.18 crate://crates.io/rustc-hash/2.1.3 crate://crates.io/rustix/1.1.4 crate://crates.io/rustix-linux-procfs/0.1.1 crate://crates.io/rustversion/1.0.22 crate://crates.io/ryu/1.0.23 crate://crates.io/same-file/1.0.6 crate://crates.io/schemars/1.2.2 crate://crates.io/schemars_derive/1.2.2 crate://crates.io/scopeguard/1.2.0 crate://crates.io/seahash/4.1.0 crate://crates.io/self-replace/1.5.0 crate://crates.io/serde/1.0.229 crate://crates.io/serde-untagged/0.1.9 crate://crates.io/serde_core/1.0.229 crate://crates.io/serde_derive/1.0.229 crate://crates.io/serde_derive_internals/0.30.0 crate://crates.io/serde_json/1.0.151 crate://crates.io/serde_spanned/1.
 1.1 crate://crates.io/sha2/0.10.9 crate://crates.io/sha2/0.11.0 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shlex/1.3.0 crate://crates.io/signal-hook-registry/1.4.8 crate://crates.io/simd-adler32/0.3.8 crate://crates.io/simdutf8/0.1.5 crate://crates.io/similar/2.7.0 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.15.2 crate://crates.io/smawk/0.3.2 crate://crates.io/socket2/0.6.3 crate://crates.io/spdx/0.13.5 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/strip-ansi-escapes/0.2.1 crate://crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.118 crate://crates.io/syn/3.0.3 crate://crates.io/synstructure/0.13.2 crate://crates.io/tar-codec/0.0.14 crate://crates.io/tar-framing/0.0.14 crate://crates.io/temp-env/0.3.6 crate://crates.io/tempfile/3.27.0 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.16.2 crate://crates.io/thiserror/2.0.20 crate://crates.io/thiserror-impl/2.0.20 crate://crates.io/thread_local/1.1.9 crate://crates.io/tinystr/
 0.8.2 crate://crates.io/tinyvec/1.11.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/tokio/1.53.1 crate://crates.io/tokio-macros/2.7.0 crate://crates.io/tokio-stream/0.1.19 crate://crates.io/toml/1.1.3+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates.io/toml_edit/0.25.13+spec-1.1.0 crate://crates.io/toml_parser/1.1.2+spec-1.1.0 crate://crates.io/toml_writer/1.1.2+spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/tracing-test/0.2.6 crate://crates.io/tracing-test-macro/0.2.6 crate://crates.io/typeid/1.0.3 crate://crates.io/typenum/1.20.1 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unscanny/0.1.0 crate://crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate
 ://crates.io/uuid/1.24.0 crate://crates.io/valuable/0.1.1 crate://crates.io/version_check/0.9.5 crate://crates.io/vte/0.14.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasm-bindgen/0.2.114 crate://crates.io/wasm-bindgen-macro/0.2.114 crate://crates.io/wasm-bindgen-macro-support/0.2.114 crate://crates.io/wasm-bindgen-shared/0.2.114 crate://crates.io/winapi-util/0.1.11 crate://crates.io/windows/0.61.3 crate://crates.io/windows-collections/0.2.0 crate://crates.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.1.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numerics/0.2.0 crate://crates.io/windows-result/0.3.4 crate://crates.io/windows-strings/0.4.2 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.60.2 crate://crates.io/windows-sys/0.61.2 crate://crates.io/wind
 ows-targets/0.52.6 crate://crates.io/windows-targets/0.53.5 crate://crates.io/windows-threading/0.1.0 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_gnullvm/0.53.1 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_aarch64_msvc/0.53.1 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnu/0.53.1 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_gnullvm/0.53.1 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_i686_msvc/0.53.1 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnu/0.53.1 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.53.1 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/windows_x86_64_msvc/0.53.1 crate://crates.io/winnow/1.0.3 crate://crates.io/winx/0.36.4 crate://crates.io/writeable/0.6.2 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://c
 rates.io/zerocopy/0.8.56 crate://crates.io/zerocopy-derive/0.8.56 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7" to "https://files.pythonhosted.org/packages/source/u/uv_build/uv_build-0.12.19.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/ambient-authority/0.0.2 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.104 crate://crates.io/archive-trait/0.0.14 crate://crates.io/arcstr/1.2.0 crate://crates.io/arrayvec/0.7.8 crate://crates.io/astral-tokio-tar/0.7.0 crate://crates.io/astral-
 version-ranges/0.2.2 crate://crates.io/astral_async_zip/0.0.20 crate://crates.io/async-compression/0.4.19 crate://crates.io/autocfg/1.5.0 crate://crates.io/backon/1.6.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.13.1 crate://crates.io/block-buffer/0.10.4 crate://crates.io/block-buffer/0.12.1 crate://crates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.1 crate://crates.io/bumpalo/3.20.2 crate://crates.io/bytecheck/0.8.3 crate://crates.io/bytecheck_derive/0.8.3 crate://crates.io/bytes/1.12.1 crate://crates.io/cap-primitives/4.0.3 crate://crates.io/cap-std/4.0.3 crate://crates.io/cc/1.2.57 crate://crates.io/cfg-if/1.0.4 crate://crates.io/charset/0.1.5 crate://crates.io/clap/4.6.6 crate://crates.io/clap_builder/4.6.6 crate://crates.io/clap_derive/4.6.4 crate://crates.io/clap_lex/1.1.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/console/0.16.4 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/cpufeatures/0.3.0 crate://crate
 s.io/crc32fast/1.5.0 crate://crates.io/crypto-common/0.1.7 crate://crates.io/crypto-common/0.2.2 crate://crates.io/csv/1.4.0 crate://crates.io/csv-core/0.1.13 crate://crates.io/data-encoding/2.11.1 crate://crates.io/defmt/1.1.0 crate://crates.io/defmt-macros/1.1.0 crate://crates.io/defmt-parser/1.0.0 crate://crates.io/digest/0.10.7 crate://crates.io/digest/0.11.3 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.18.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/encoding_rs_io/0.1.8 crate://crates.io/enumflags2/0.7.12 crate://crates.io/enumflags2_derive/0.7.12 crate://crates.io/equivalent/1.0.2 crate://crates.io/erased-serde/0.4.10 crate://crates.io/errno/0.3.14 crate://crates.io/fastrand/2.5.0 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.9 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0
 .2.0 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.1 crate://crates.io/fs-set-times/0.20.3 crate://crates.io/futures/0.3.34 crate://crates.io/futures-channel/0.3.34 crate://crates.io/futures-core/0.3.34 crate://crates.io/futures-executor/0.3.34 crate://crates.io/futures-io/0.3.34 crate://crates.io/futures-lite/2.6.1 crate://crates.io/futures-macro/0.3.34 crate://crates.io/futures-sink/0.3.34 crate://crates.io/futures-task/0.3.34 crate://crates.io/futures-util/0.3.34 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.4.3 crate://crates.io/globset/0.4.20 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.17.1 crate://crates.io/heck/0.5.0 crate://crates.io/hex/0.4.3 crate://crates.io/hybrid-array/0.4.13 crate://crates.io/icu_collections/2.1.1 crate://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.2 crate://crates.io/icu_properti
 es_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/indexmap/2.14.0 crate://crates.io/indoc/2.0.7 crate://crates.io/insta/1.48.0 crate://crates.io/io-extras/0.19.0 crate://crates.io/io-lifetimes/2.0.4 crate://crates.io/io-lifetimes/3.0.1 crate://crates.io/ipnet/2.12.0 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.17 crate://crates.io/jiff/0.2.35 crate://crates.io/jiff-core/0.1.0 crate://crates.io/jiff-static/0.2.35 crate://crates.io/jiff-tzdb/0.1.8 crate://crates.io/jiff-tzdb-platform/0.1.3 crate://crates.io/jobserver/0.1.35 crate://crates.io/js-sys/0.3.91 crate://crates.io/junction/2.0.0 crate://crates.io/lazy_static/1.5.0 crate://crates.io/libc/0.2.189 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.1 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/mailparse/0.16.1 crate://crates.io/ma
 tchers/0.2.0 crate://crates.io/maybe-owned/0.3.4 crate://crates.io/memchr/2.8.3 crate://crates.io/miniz_oxide/0.8.9 crate://crates.io/mio/1.2.0 crate://crates.io/munge/0.4.7 crate://crates.io/munge_macro/0.4.7 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/owo-colors/4.3.0 crate://crates.io/parking/2.2.1 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/path-slash/0.2.1 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/pest/2.8.6 crate://crates.io/pest_derive/2.8.6 crate://crates.io/pest_generator/2.8.6 crate://crates.io/pest_meta/2.8.6 crate://crates.io/petgraph/0.8.3 crate://crates.io/pin-project/1.1.11 crate://crates.io/pin-project-internal/1.1.11 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/pkg-config/0.3.32 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/portable-atomic-util/0.2.6 crate://crates.io/potential_ut
 f/0.1.4 crate://crates.io/proc-macro-error-attr2/2.0.0 crate://crates.io/proc-macro-error2/2.0.1 crate://crates.io/proc-macro2/1.0.107 crate://crates.io/ptr_meta/0.3.1 crate://crates.io/ptr_meta_derive/0.3.1 crate://crates.io/quote/1.0.47 crate://crates.io/quoted_printable/0.5.1 crate://crates.io/r-efi/6.0.0 crate://crates.io/rancor/0.1.1 crate://crates.io/redox_syscall/0.5.15 crate://crates.io/ref-cast/1.0.27 crate://crates.io/ref-cast-impl/1.0.27 crate://crates.io/reflink-copy/0.1.30 crate://crates.io/regex/1.13.1 crate://crates.io/regex-automata/0.4.18 crate://crates.io/regex-syntax/0.8.11 crate://crates.io/rend/0.5.3 crate://crates.io/rkyv/0.8.18 crate://crates.io/rkyv_derive/0.8.18 crate://crates.io/rustc-hash/2.1.3 crate://crates.io/rustix/1.1.4 crate://crates.io/rustix-linux-procfs/0.1.1 crate://crates.io/rustversion/1.0.22 crate://crates.io/ryu/1.0.23 crate://crates.io/same-file/1.0.6 crate://crates.io/schemars/1.2.2 crate://crates.io/schemars_derive/1.2.2 crate://crates.io/
 scopeguard/1.2.0 crate://crates.io/seahash/4.1.0 crate://crates.io/self-replace/1.5.0 crate://crates.io/serde/1.0.229 crate://crates.io/serde-untagged/0.1.9 crate://crates.io/serde_core/1.0.229 crate://crates.io/serde_derive/1.0.229 crate://crates.io/serde_derive_internals/0.30.0 crate://crates.io/serde_json/1.0.151 crate://crates.io/serde_spanned/1.1.1 crate://crates.io/sha2/0.10.9 crate://crates.io/sha2/0.11.0 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shlex/1.3.0 crate://crates.io/signal-hook-registry/1.4.8 crate://crates.io/simd-adler32/0.3.8 crate://crates.io/simdutf8/0.1.5 crate://crates.io/similar/2.7.0 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.15.2 crate://crates.io/smawk/0.3.2 crate://crates.io/socket2/0.6.3 crate://crates.io/spdx/0.13.5 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/strip-ansi-escapes/0.2.1 crate://crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.118 crate://crates.io/syn/3.0.3 crate://crates.io/synstructure/0.13
 .2 crate://crates.io/tar-codec/0.0.14 crate://crates.io/tar-framing/0.0.14 crate://crates.io/temp-env/0.3.6 crate://crates.io/tempfile/3.27.0 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.16.2 crate://crates.io/thiserror/2.0.20 crate://crates.io/thiserror-impl/2.0.20 crate://crates.io/thread_local/1.1.9 crate://crates.io/tinystr/0.8.2 crate://crates.io/tinyvec/1.11.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/tokio/1.53.1 crate://crates.io/tokio-macros/2.7.0 crate://crates.io/tokio-stream/0.1.19 crate://crates.io/toml/1.1.3+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates.io/toml_edit/0.25.13+spec-1.1.0 crate://crates.io/toml_parser/1.1.2+spec-1.1.0 crate://crates.io/toml_writer/1.1.2+spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/tracing-test/0.2.6
  crate://crates.io/tracing-test-macro/0.2.6 crate://crates.io/typeid/1.0.3 crate://crates.io/typenum/1.20.1 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unscanny/0.1.0 crate://crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.24.0 crate://crates.io/valuable/0.1.1 crate://crates.io/version_check/0.9.5 crate://crates.io/vte/0.14.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasm-bindgen/0.2.114 crate://crates.io/wasm-bindgen-macro/0.2.114 crate://crates.io/wasm-bindgen-macro-support/0.2.114 crate://crates.io/wasm-bindgen-shared/0.2.114 crate://crates.io/winapi-util/0.1.11 crate://crates.io/windows/0.61.3 crate://crates.io/windows-collections/0.2.0 crate://crates.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.60.2 crate://crates.io/
 windows-interface/0.59.3 crate://crates.io/windows-link/0.1.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numerics/0.2.0 crate://crates.io/windows-result/0.3.4 crate://crates.io/windows-strings/0.4.2 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.60.2 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-targets/0.53.5 crate://crates.io/windows-threading/0.1.0 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_gnullvm/0.53.1 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_aarch64_msvc/0.53.1 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnu/0.53.1 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_gnullvm/0.53.1 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_i686_msvc/0.53.1 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnu/0.53.1 cra
 te://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.53.1 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/windows_x86_64_msvc/0.53.1 crate://crates.io/winnow/1.0.3 crate://crates.io/winx/0.36.4 crate://crates.io/writeable/0.6.2 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://crates.io/zerocopy/0.8.56 crate://crates.io/zerocopy-derive/0.8.56 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7"
packages/x86-64-v3-poky-linux/python3-uv-build: PKGV changed from 0.12.17 [default] to 0.12.19 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PV changed from "0.12.17" to "0.12.19"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PKGV changed from 0.12.17 [default] to 0.12.19 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PV changed from "0.12.17" to "0.12.19"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PKGV changed from 0.12.17 [default] to 0.12.19 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PV changed from "0.12.17" to "0.12.19"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PKGV changed from 0.12.17 [default] to 0.12.19 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PV changed from "0.12.17" to "0.12.19"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PKGV changed from 0.12.17 [default] to 0.12.19 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PV changed from "0.12.17" to "0.12.19"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PKGV changed from 0.12.17 [default] to 0.12.19 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PV changed from "0.12.17" to "0.12.19"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PKGV changed from 0.12.17 [default] to 0.12.19 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PV changed from "0.12.17" to "0.12.19"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGSIZE changed from 4490465 to 4486369 (-0%)
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGV changed from 0.12.17 [default] to 0.12.19 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.12.17.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.12.19.dist-info, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.12.17.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.12.19.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.12.17.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.12.19.dist-info

--===============1510109715008923311==--

