Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D94BCD8C9A
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:46 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1553.1780328129208539660
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZB4r2c8N;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=GjokH2KL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019e83d39126-406bcf47-db85-4e33-89bb-ec04a3d3b7f4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328141;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aOLJKRsn3vq9Zjq0KcYbeEWMu4YLiiJ7lNE0U2HoEs0=;
	b=ZB4r2c8NgFSPOv3oGkMsn2WwQKJWMnd506NBwW4MA6rcjp+gD5itAjb2MW0X4vfb
	XE1KqU6qaLPoVtCWXcKlYMs88Wz8jLzOZYd/LwXS0y4dv+JL+4qVnjKePLp89baDDZH
	ihSqY7A0KnPhL1cb2srDj5f6qEJuIUeO0E89mZ1s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328141;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aOLJKRsn3vq9Zjq0KcYbeEWMu4YLiiJ7lNE0U2HoEs0=;
	b=GjokH2KLR2tqR8HKU+ZS9H5DcENEBM6h4jCVwxSAEhrpzRHbp6j7h9FlWd+q47ot
	lUfB5cii3DX5ScQtNLJtlCG4YcmMF4skKZvSylVglWz9vU7+AN75hNzG64p9IhR/YV7
	+aBxFa36LIW6LclScl4uhCv4XBbw0jYBfaJ/rScM=
Content-Type: multipart/mixed; boundary="===============2941706764938712894=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-rpds-py: upgrading to 2026.5.1 SUCCEEDED
Message-ID: <0101019e83d39126-406bcf47-db85-4e33-89bb-ec04a3d3b7f4-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237891

--===============2941706764938712894==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-rpds-py* to *2026.5.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-rpds-py-upgrade-0.30.0-2026.5.1.patch
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
From 10bb3e7a6b74bbf03bbc64560448ec3c5b32c21b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 09:28:01 +0000
Subject: [PATCH] python3-rpds-py: upgrade 0.30.0 -> 2026.5.1

---
 .../python/python3-rpds-py-crates.inc         | 36 ++++++++-----------
 ..._0.30.0.bb => python3-rpds-py_2026.5.1.bb} |  2 +-
 2 files changed, 15 insertions(+), 23 deletions(-)
 rename meta/recipes-devtools/python/{python3-rpds-py_0.30.0.bb => python3-rpds-py_2026.5.1.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-rpds-py-crates.inc b/meta/recipes-devtools/python/python3-rpds-py-crates.inc
index c9e354ac04..9556b6f593 100644
--- a/meta/recipes-devtools/python/python3-rpds-py-crates.inc
+++ b/meta/recipes-devtools/python/python3-rpds-py-crates.inc
@@ -3,56 +3,48 @@
 # from Cargo.lock
 SRC_URI += " \
     crate://crates.io/archery/1.2.2 \
-    crate://crates.io/autocfg/1.5.0 \
     crate://crates.io/cc/1.2.48 \
     crate://crates.io/find-msvc-tools/0.1.5 \
     crate://crates.io/heck/0.5.0 \
-    crate://crates.io/indoc/2.0.7 \
     crate://crates.io/libc/0.2.177 \
-    crate://crates.io/memoffset/0.9.1 \
     crate://crates.io/once_cell/1.21.3 \
     crate://crates.io/portable-atomic/1.11.1 \
     crate://crates.io/proc-macro2/1.0.103 \
-    crate://crates.io/pyo3/0.27.2 \
-    crate://crates.io/pyo3-build-config/0.27.2 \
-    crate://crates.io/pyo3-ffi/0.27.2 \
-    crate://crates.io/pyo3-macros/0.27.2 \
-    crate://crates.io/pyo3-macros-backend/0.27.2 \
+    crate://crates.io/pyo3/0.28.3 \
+    crate://crates.io/pyo3-build-config/0.28.3 \
+    crate://crates.io/pyo3-ffi/0.28.3 \
+    crate://crates.io/pyo3-macros/0.28.3 \
+    crate://crates.io/pyo3-macros-backend/0.28.3 \
     crate://crates.io/python3-dll-a/0.2.14 \
     crate://crates.io/quote/1.0.42 \
-    crate://crates.io/rpds/1.2.0 \
-    crate://crates.io/rustversion/1.0.22 \
+    crate://crates.io/rpds/1.2.1 \
     crate://crates.io/shlex/1.3.0 \
+    crate://crates.io/smallvec/1.15.1 \
     crate://crates.io/syn/2.0.111 \
     crate://crates.io/target-lexicon/0.13.3 \
     crate://crates.io/triomphe/0.1.15 \
     crate://crates.io/unicode-ident/1.0.22 \
-    crate://crates.io/unindent/0.2.4 \
 "
 
 SRC_URI[archery-1.2.2.sha256sum] = "70e0a5f99dfebb87bb342d0f53bb92c81842e100bbb915223e38349580e5441d"
-SRC_URI[autocfg-1.5.0.sha256sum] = "c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8"
 SRC_URI[cc-1.2.48.sha256sum] = "c481bdbf0ed3b892f6f806287d72acd515b352a4ec27a208489b8c1bc839633a"
 SRC_URI[find-msvc-tools-0.1.5.sha256sum] = "3a3076410a55c90011c298b04d0cfa770b00fa04e1e3c97d3f6c9de105a03844"
 SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
-SRC_URI[indoc-2.0.7.sha256sum] = "79cf5c93f93228cf8efb3ba362535fb11199ac548a09ce117c9b1adc3030d706"
 SRC_URI[libc-0.2.177.sha256sum] = "2874a2af47a2325c2001a6e6fad9b16a53b802102b528163885171cf92b15976"
-SRC_URI[memoffset-0.9.1.sha256sum] = "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
 SRC_URI[once_cell-1.21.3.sha256sum] = "42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d"
 SRC_URI[portable-atomic-1.11.1.sha256sum] = "f84267b20a16ea918e43c6a88433c2d54fa145c92a811b5b047ccbe153674483"
 SRC_URI[proc-macro2-1.0.103.sha256sum] = "5ee95bc4ef87b8d5ba32e8b7714ccc834865276eab0aed5c9958d00ec45f49e8"
-SRC_URI[pyo3-0.27.2.sha256sum] = "ab53c047fcd1a1d2a8820fe84f05d6be69e9526be40cb03b73f86b6b03e6d87d"
-SRC_URI[pyo3-build-config-0.27.2.sha256sum] = "b455933107de8642b4487ed26d912c2d899dec6114884214a0b3bb3be9261ea6"
-SRC_URI[pyo3-ffi-0.27.2.sha256sum] = "1c85c9cbfaddf651b1221594209aed57e9e5cff63c4d11d1feead529b872a089"
-SRC_URI[pyo3-macros-0.27.2.sha256sum] = "0a5b10c9bf9888125d917fb4d2ca2d25c8df94c7ab5a52e13313a07e050a3b02"
-SRC_URI[pyo3-macros-backend-0.27.2.sha256sum] = "03b51720d314836e53327f5871d4c0cfb4fb37cc2c4a11cc71907a86342c40f9"
+SRC_URI[pyo3-0.28.3.sha256sum] = "91fd8e38a3b50ed1167fb981cd6fd60147e091784c427b8f7183a7ee32c31c12"
+SRC_URI[pyo3-build-config-0.28.3.sha256sum] = "e368e7ddfdeb98c9bca7f8383be1648fd84ab466bf2bc015e94008db6d35611e"
+SRC_URI[pyo3-ffi-0.28.3.sha256sum] = "7f29e10af80b1f7ccaf7f69eace800a03ecd13e883acfacc1e5d0988605f651e"
+SRC_URI[pyo3-macros-0.28.3.sha256sum] = "df6e520eff47c45997d2fc7dd8214b25dd1310918bbb2642156ef66a67f29813"
+SRC_URI[pyo3-macros-backend-0.28.3.sha256sum] = "c4cdc218d835738f81c2338f822078af45b4afdf8b2e33cbb5916f108b813acb"
 SRC_URI[python3-dll-a-0.2.14.sha256sum] = "d381ef313ae70b4da5f95f8a4de773c6aa5cd28f73adec4b4a31df70b66780d8"
 SRC_URI[quote-1.0.42.sha256sum] = "a338cc41d27e6cc6dce6cefc13a0729dfbb81c262b1f519331575dd80ef3067f"
-SRC_URI[rpds-1.2.0.sha256sum] = "9e75f485e819d4d3015e6c0d55d02a4fd3db47c1993d9e603e0361fba2bffb34"
-SRC_URI[rustversion-1.0.22.sha256sum] = "b39cdef0fa800fc44525c84ccb54a029961a8215f9619753635a9c0d2538d46d"
+SRC_URI[rpds-1.2.1.sha256sum] = "e025feb26210bc196b908e72deb063b1b4000754304341cbc168a1e72c857ebc"
 SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
+SRC_URI[smallvec-1.15.1.sha256sum] = "67b1b7a3b5fe4f1376887184045fcf45c69e92af734b7aaddc05fb777b6fbd03"
 SRC_URI[syn-2.0.111.sha256sum] = "390cc9a294ab71bdb1aa2e99d13be9c753cd2d7bd6560c77118597410c4d2e87"
 SRC_URI[target-lexicon-0.13.3.sha256sum] = "df7f62577c25e07834649fc3b39fafdc597c0a3527dc1c60129201ccfcbaa50c"
 SRC_URI[triomphe-0.1.15.sha256sum] = "dd69c5aa8f924c7519d6372789a74eac5b94fb0f8fcf0d4a97eb0bfc3e785f39"
 SRC_URI[unicode-ident-1.0.22.sha256sum] = "9312f7c4f6ff9069b165498234ce8be658059c6728633667c526e27dc2cf1df5"
-SRC_URI[unindent-0.2.4.sha256sum] = "7264e107f553ccae879d21fbea1d6724ac785e8c3bfc762137959b5802826ef3"
diff --git a/meta/recipes-devtools/python/python3-rpds-py_0.30.0.bb b/meta/recipes-devtools/python/python3-rpds-py_2026.5.1.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-rpds-py_0.30.0.bb
rename to meta/recipes-devtools/python/python3-rpds-py_2026.5.1.bb
index 173dabeecd..7f1511589f 100644
--- a/meta/recipes-devtools/python/python3-rpds-py_0.30.0.bb
+++ b/meta/recipes-devtools/python/python3-rpds-py_2026.5.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/rpds-py/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7767fa537c4596c54141f32882c4a984"
 
-SRC_URI[sha256sum] = "dd8ff7cf90014af0c0f787eea34794ebf6415242ee1d6fa91eaba725cc441e84"
+SRC_URI[sha256sum] = "07b24fea40541e28570e5b795a4a38fbdcd12550c06bd0748005ecc8116ca256"
 
 require ${BPN}-crates.inc
 
-- 
2.47.1


--===============2941706764938712894==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py: FILELIST: directory renamed /usr/lib/python3.14/site-packages/rpds_py-0.30.0.dist-info -> /usr/lib/python3.14/site-packages/rpds_py-2026.5.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/rpds_py-0.30.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/rpds_py-2026.5.1.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-rpds-py (sysroot):
  /usr/lib/python3.14/site-packages/rpds_py-2026.5.1.dist-info was added
  /usr/lib/python3.14/site-packages/rpds_py-2026.5.1.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/rpds_py-2026.5.1.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/rpds_py-2026.5.1.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/rpds_py-2026.5.1.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/rpds_py-0.30.0.dist-info was removed
  /usr/lib/python3.14/site-packages/rpds_py-0.30.0.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/rpds_py-0.30.0.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/rpds_py-0.30.0.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/rpds_py-0.30.0.dist-info/WHEEL was removed

--===============2941706764938712894==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-rpds-py-upgrade-0.30.0-2026.5.1.patch"

RnJvbSAxMGJiM2U3YTZiNzRiYmYwM2JiYzY0NTYwNDQ4ZWMzYzViMzJjMjFiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAwOToyODowMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcnBkcy1weTogdXBncmFkZSAwLjMwLjAgLT4gMjAyNi41LjEKCi0tLQogLi4uL3B5dGhv
bi9weXRob24zLXJwZHMtcHktY3JhdGVzLmluYyAgICAgICAgIHwgMzYgKysrKysrKystLS0tLS0t
LS0tLQogLi4uXzAuMzAuMC5iYiA9PiBweXRob24zLXJwZHMtcHlfMjAyNi41LjEuYmJ9IHwgIDIg
Ky0KIDIgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMjMgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1ycGRzLXB5XzAuMzAu
MC5iYiA9PiBweXRob24zLXJwZHMtcHlfMjAyNi41LjEuYmJ9ICg4NCUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJwZHMtcHktY3JhdGVzLmluYyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1ycGRzLXB5LWNyYXRlcy5pbmMK
aW5kZXggYzllMzU0YWMwNC4uOTU1NmI2ZjU5MyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXJwZHMtcHktY3JhdGVzLmluYworKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnBkcy1weS1jcmF0ZXMuaW5jCkBAIC0zLDU2ICsz
LDQ4IEBACiAjIGZyb20gQ2FyZ28ubG9jawogU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2Ny
YXRlcy5pby9hcmNoZXJ5LzEuMi4yIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9hdXRvY2ZnLzEu
NS4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9jYy8xLjIuNDggXAogICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL2ZpbmQtbXN2Yy10b29scy8wLjEuNSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaGVj
ay8wLjUuMCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaW5kb2MvMi4wLjcgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL2xpYmMvMC4yLjE3NyBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbWVtb2Zm
c2V0LzAuOS4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9vbmNlX2NlbGwvMS4yMS4zIFwKICAg
ICBjcmF0ZTovL2NyYXRlcy5pby9wb3J0YWJsZS1hdG9taWMvMS4xMS4xIFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby9wcm9jLW1hY3JvMi8xLjAuMTAzIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9w
eW8zLzAuMjcuMiBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy1idWlsZC1jb25maWcvMC4y
Ny4yIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLWZmaS8wLjI3LjIgXAotICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3B5bzMtbWFjcm9zLzAuMjcuMiBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
cHlvMy1tYWNyb3MtYmFja2VuZC8wLjI3LjIgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMv
MC4yOC4zIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLWJ1aWxkLWNvbmZpZy8wLjI4LjMg
XAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMtZmZpLzAuMjguMyBcCisgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vcHlvMy1tYWNyb3MvMC4yOC4zIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8z
LW1hY3Jvcy1iYWNrZW5kLzAuMjguMyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHl0aG9uMy1k
bGwtYS8wLjIuMTQgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3F1b3RlLzEuMC40MiBcCi0gICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vcnBkcy8xLjIuMCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcnVz
dHZlcnNpb24vMS4wLjIyIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9ycGRzLzEuMi4xIFwKICAg
ICBjcmF0ZTovL2NyYXRlcy5pby9zaGxleC8xLjMuMCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
c21hbGx2ZWMvMS4xNS4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9zeW4vMi4wLjExMSBcCiAg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdGFyZ2V0LWxleGljb24vMC4xMy4zIFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby90cmlvbXBoZS8wLjEuMTUgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3VuaWNv
ZGUtaWRlbnQvMS4wLjIyIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby91bmluZGVudC8wLjIuNCBc
CiAiCiAKIFNSQ19VUklbYXJjaGVyeS0xLjIuMi5zaGEyNTZzdW1dID0gIjcwZTBhNWY5OWRmZWJi
ODdiYjM0MmQwZjUzYmI5MmM4MTg0MmUxMDBiYmI5MTUyMjNlMzgzNDk1ODBlNTQ0MWQiCi1TUkNf
VVJJW2F1dG9jZmctMS41LjAuc2hhMjU2c3VtXSA9ICJjMDg2MDZmOGMzY2JmNGNlNmVjOGUyOGZi
MDAxNGEyYzA4NjcwOGZlOTU0ZWFhODg1Mzg0YTYxNjUxNzJlN2U4IgogU1JDX1VSSVtjYy0xLjIu
NDguc2hhMjU2c3VtXSA9ICJjNDgxYmRiZjBlZDNiODkyZjZmODA2Mjg3ZDcyYWNkNTE1YjM1MmE0
ZWMyN2EyMDg0ODliOGMxYmM4Mzk2MzNhIgogU1JDX1VSSVtmaW5kLW1zdmMtdG9vbHMtMC4xLjUu
c2hhMjU2c3VtXSA9ICIzYTMwNzY0MTBhNTVjOTAwMTFjMjk4YjA0ZDBjZmE3NzBiMDBmYTA0ZTFl
M2M5N2QzZjZjOWRlMTA1YTAzODQ0IgogU1JDX1VSSVtoZWNrLTAuNS4wLnNoYTI1NnN1bV0gPSAi
MjMwNGUwMDk4M2Y4N2ZmYjM4YjU1YjQ0NGI1ZTNiNjBhODg0YjVkMzBjMGZjYTdkODJmZTMzNDQ5
YmJlNTVlYSIKLVNSQ19VUklbaW5kb2MtMi4wLjcuc2hhMjU2c3VtXSA9ICI3OWNmNWM5M2Y5MzIy
OGNmOGVmYjNiYTM2MjUzNWZiMTExOTlhYzU0OGEwOWNlMTE3YzliMWFkYzMwMzBkNzA2IgogU1JD
X1VSSVtsaWJjLTAuMi4xNzcuc2hhMjU2c3VtXSA9ICIyODc0YTJhZjQ3YTIzMjVjMjAwMWE2ZTZm
YWQ5YjE2YTUzYjgwMjEwMmI1MjgxNjM4ODUxNzFjZjkyYjE1OTc2IgotU1JDX1VSSVttZW1vZmZz
ZXQtMC45LjEuc2hhMjU2c3VtXSA9ICI0ODgwMTZiZmFlNDU3YjAzNmQ5OTYwOTJmNmNiNDQ4Njc3
NjExY2U0NDQ5ZTk3MGNlYWY0MjY5NTIwM2YyMThhIgogU1JDX1VSSVtvbmNlX2NlbGwtMS4yMS4z
LnNoYTI1NnN1bV0gPSAiNDJmNWUxNWM5OTUzYzVlNGNjY2VlYjJlNzM4MmE3MTY0ODJjMzQ1MTUz
MTVmN2IwMzUzMmI4YjRlODM5M2QyZCIKIFNSQ19VUklbcG9ydGFibGUtYXRvbWljLTEuMTEuMS5z
aGEyNTZzdW1dID0gImY4NDI2N2IyMGExNmVhOTE4ZTQzYzZhODg0MzNjMmQ1NGZhMTQ1YzkyYTgx
MWI1YjA0N2NjYmUxNTM2NzQ0ODMiCiBTUkNfVVJJW3Byb2MtbWFjcm8yLTEuMC4xMDMuc2hhMjU2
c3VtXSA9ICI1ZWU5NWJjNGVmODdiOGQ1YmEzMmU4Yjc3MTRjY2M4MzQ4NjUyNzZlYWIwYWVkNWM5
OTU4ZDAwZWM0NWY0OWU4IgotU1JDX1VSSVtweW8zLTAuMjcuMi5zaGEyNTZzdW1dID0gImFiNTNj
MDQ3ZmNkMWExZDJhODgyMGZlODRmMDVkNmJlNjllOTUyNmJlNDBjYjAzYjczZjg2YjZiMDNlNmQ4
N2QiCi1TUkNfVVJJW3B5bzMtYnVpbGQtY29uZmlnLTAuMjcuMi5zaGEyNTZzdW1dID0gImI0NTU5
MzMxMDdkZTg2NDJiNDQ4N2VkMjZkOTEyYzJkODk5ZGVjNjExNDg4NDIxNGEwYjNiYjNiZTkyNjFl
YTYiCi1TUkNfVVJJW3B5bzMtZmZpLTAuMjcuMi5zaGEyNTZzdW1dID0gIjFjODVjOWNiZmFkZGY2
NTFiMTIyMTU5NDIwOWFlZDU3ZTllNWNmZjYzYzRkMTFkMWZlZWFkNTI5Yjg3MmEwODkiCi1TUkNf
VVJJW3B5bzMtbWFjcm9zLTAuMjcuMi5zaGEyNTZzdW1dID0gIjBhNWIxMGM5YmY5ODg4MTI1ZDkx
N2ZiNGQyY2EyZDI1YzhkZjk0YzdhYjVhNTJlMTMzMTNhMDdlMDUwYTNiMDIiCi1TUkNfVVJJW3B5
bzMtbWFjcm9zLWJhY2tlbmQtMC4yNy4yLnNoYTI1NnN1bV0gPSAiMDNiNTE3MjBkMzE0ODM2ZTUz
MzI3ZjU4NzFkNGMwY2ZiNGZiMzdjYzJjNGExMWNjNzE5MDdhODYzNDJjNDBmOSIKK1NSQ19VUklb
cHlvMy0wLjI4LjMuc2hhMjU2c3VtXSA9ICI5MWZkOGUzOGEzYjUwZWQxMTY3ZmI5ODFjZDZmZDYw
MTQ3ZTA5MTc4NGM0MjdiOGY3MTgzYTdlZTMyYzMxYzEyIgorU1JDX1VSSVtweW8zLWJ1aWxkLWNv
bmZpZy0wLjI4LjMuc2hhMjU2c3VtXSA9ICJlMzY4ZTdkZGZkZWI5OGM5YmNhN2Y4MzgzYmUxNjQ4
ZmQ4NGFiNDY2YmYyYmMwMTVlOTQwMDhkYjZkMzU2MTFlIgorU1JDX1VSSVtweW8zLWZmaS0wLjI4
LjMuc2hhMjU2c3VtXSA9ICI3ZjI5ZTEwYWY4MGIxZjdjY2FmN2Y2OWVhY2U4MDBhMDNlY2QxM2U4
ODNhY2ZhY2MxZTVkMDk4ODYwNWY2NTFlIgorU1JDX1VSSVtweW8zLW1hY3Jvcy0wLjI4LjMuc2hh
MjU2c3VtXSA9ICJkZjZlNTIwZWZmNDdjNDU5OTdkMmZjN2RkODIxNGIyNWRkMTMxMDkxOGJiYjI2
NDIxNTZlZjY2YTY3ZjI5ODEzIgorU1JDX1VSSVtweW8zLW1hY3Jvcy1iYWNrZW5kLTAuMjguMy5z
aGEyNTZzdW1dID0gImM0Y2RjMjE4ZDgzNTczOGY4MWMyMzM4ZjgyMjA3OGFmNDViNGFmZGY4YjJl
MzNjYmI1OTE2ZjEwOGI4MTNhY2IiCiBTUkNfVVJJW3B5dGhvbjMtZGxsLWEtMC4yLjE0LnNoYTI1
NnN1bV0gPSAiZDM4MWVmMzEzYWU3MGI0ZGE1Zjk1ZjhhNGRlNzczYzZhYTVjZDI4ZjczYWRlYzRi
NGEzMWRmNzBiNjY3ODBkOCIKIFNSQ19VUklbcXVvdGUtMS4wLjQyLnNoYTI1NnN1bV0gPSAiYTMz
OGNjNDFkMjdlNmNjNmRjZTZjZWZjMTNhMDcyOWRmYmI4MWMyNjJiMWY1MTkzMzE1NzVkZDgwZWYz
MDY3ZiIKLVNSQ19VUklbcnBkcy0xLjIuMC5zaGEyNTZzdW1dID0gIjllNzVmNDg1ZTgxOWQ0ZDMw
MTVlNmMwZDU1ZDAyYTRmZDNkYjQ3YzE5OTNkOWU2MDNlMDM2MWZiYTJiZmZiMzQiCi1TUkNfVVJJ
W3J1c3R2ZXJzaW9uLTEuMC4yMi5zaGEyNTZzdW1dID0gImIzOWNkZWYwZmE4MDBmYzQ0NTI1Yzg0
Y2NiNTRhMDI5OTYxYTgyMTVmOTYxOTc1MzYzNWE5YzBkMjUzOGQ0NmQiCitTUkNfVVJJW3JwZHMt
MS4yLjEuc2hhMjU2c3VtXSA9ICJlMDI1ZmViMjYyMTBiYzE5NmI5MDhlNzJkZWIwNjNiMWI0MDAw
NzU0MzA0MzQxY2JjMTY4YTFlNzJjODU3ZWJjIgogU1JDX1VSSVtzaGxleC0xLjMuMC5zaGEyNTZz
dW1dID0gIjBmZGEyZmYwZDA4NDAxOWJhNGQ3YzZmMzcxYzk1ZDhmZDc1Y2UzNTI0YzNjYjhmYjY1
M2EzMDIzZjYzMjNlNjQiCitTUkNfVVJJW3NtYWxsdmVjLTEuMTUuMS5zaGEyNTZzdW1dID0gIjY3
YjFiN2EzYjVmZTRmMTM3Njg4NzE4NDA0NWZjZjQ1YzY5ZTkyYWY3MzRiN2FhZGRjMDVmYjc3N2I2
ZmJkMDMiCiBTUkNfVVJJW3N5bi0yLjAuMTExLnNoYTI1NnN1bV0gPSAiMzkwY2M5YTI5NGFiNzFi
ZGIxYWEyZTk5ZDEzYmU5Yzc1M2NkMmQ3YmQ2NTYwYzc3MTE4NTk3NDEwYzRkMmU4NyIKIFNSQ19V
UklbdGFyZ2V0LWxleGljb24tMC4xMy4zLnNoYTI1NnN1bV0gPSAiZGY3ZjYyNTc3YzI1ZTA3ODM0
NjQ5ZmMzYjM5ZmFmZGM1OTdjMGEzNTI3ZGMxYzYwMTI5MjAxY2NmY2JhYTUwYyIKIFNSQ19VUklb
dHJpb21waGUtMC4xLjE1LnNoYTI1NnN1bV0gPSAiZGQ2OWM1YWE4ZjkyNGM3NTE5ZDYzNzI3ODlh
NzRlYWM1Yjk0ZmIwZjhmY2YwZDRhOTdlYjBiZmMzZTc4NWYzOSIKIFNSQ19VUklbdW5pY29kZS1p
ZGVudC0xLjAuMjIuc2hhMjU2c3VtXSA9ICI5MzEyZjdjNGY2ZmY5MDY5YjE2NTQ5ODIzNGNlOGJl
NjU4MDU5YzY3Mjg2MzM2NjdjNTI2ZTI3ZGMyY2YxZGY1IgotU1JDX1VSSVt1bmluZGVudC0wLjIu
NC5zaGEyNTZzdW1dID0gIjcyNjRlMTA3ZjU1M2NjYWU4NzlkMjFmYmVhMWQ2NzI0YWM3ODVlOGMz
YmZjNzYyMTM3OTU5YjU4MDI4MjZlZjMiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcnBkcy1weV8wLjMwLjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcnBkcy1weV8yMDI2LjUuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDg0
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnBkcy1w
eV8wLjMwLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1ycGRzLXB5XzIwMjYuNS4xLmJiCmluZGV4IDE3M2RhYmVlY2QuLjdmMTUxMTU4OWYgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1ycGRzLXB5XzAuMzAu
MC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnBkcy1weV8y
MDI2LjUuMS5iYgpAQCAtNCw3ICs0LDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9weXBpLm9yZy9w
cm9qZWN0L3JwZHMtcHkvIgogTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZp
bGU6Ly9MSUNFTlNFO21kNT03NzY3ZmE1MzdjNDU5NmM1NDE0MWYzMjg4MmM0YTk4NCIKIAotU1JD
X1VSSVtzaGEyNTZzdW1dID0gImRkOGZmN2NmOTAwMTRhZjBjMGY3ODdlZWEzNDc5NGViZjY0MTUy
NDJlZTFkNmZhOTFlYWJhNzI1Y2M0NDFlODQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMDdiMjRm
ZWE0MDU0MWUyODU3MGU1Yjc5NWE0YTM4ZmJkY2QxMjU1MGMwNmJkMDc0ODAwNWVjYzgxMTZjYTI1
NiIKIAogcmVxdWlyZSAke0JQTn0tY3JhdGVzLmluYwogCi0tIAoyLjQ3LjEKCg==

--===============2941706764938712894==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-rpds-py: PKGV changed from 0.30.0 [default] to 2026.5.1 [default]
packages/x86-64-v3-poky-linux/python3-rpds-py: SRC_URI changed from "https://files.pythonhosted.org/packages/source/r/rpds_py/rpds_py-0.30.0.tar.gz;downloadfilename=rpds_py-0.30.0.tar.gz crate://crates.io/archery/1.2.2 crate://crates.io/autocfg/1.5.0 crate://crates.io/cc/1.2.48 crate://crates.io/find-msvc-tools/0.1.5 crate://crates.io/heck/0.5.0 crate://crates.io/indoc/2.0.7 crate://crates.io/libc/0.2.177 crate://crates.io/memoffset/0.9.1 crate://crates.io/once_cell/1.21.3 crate://crates.io/portable-atomic/1.11.1 crate://crates.io/proc-macro2/1.0.103 crate://crates.io/pyo3/0.27.2 crate://crates.io/pyo3-build-config/0.27.2 crate://crates.io/pyo3-ffi/0.27.2 crate://crates.io/pyo3-macros/0.27.2 crate://crates.io/pyo3-macros-backend/0.27.2 crate://crates.io/python3-dll-a/0.2.14 crate://crates.io/quote/1.0.42 crate://crates.io/rpds/1.2.0 crate://crates.io/rustversion/1.0.22 crate://crates.io/shlex/1.3.0 crate://crates.io/syn/2.0.111 crate://crates.io/target-lexicon/0.13.3 crate://crates.i
 o/triomphe/0.1.15 crate://crates.io/unicode-ident/1.0.22 crate://crates.io/unindent/0.2.4" to "https://files.pythonhosted.org/packages/source/r/rpds_py/rpds_py-2026.5.1.tar.gz;downloadfilename=rpds_py-2026.5.1.tar.gz crate://crates.io/archery/1.2.2 crate://crates.io/cc/1.2.48 crate://crates.io/find-msvc-tools/0.1.5 crate://crates.io/heck/0.5.0 crate://crates.io/libc/0.2.177 crate://crates.io/once_cell/1.21.3 crate://crates.io/portable-atomic/1.11.1 crate://crates.io/proc-macro2/1.0.103 crate://crates.io/pyo3/0.28.3 crate://crates.io/pyo3-build-config/0.28.3 crate://crates.io/pyo3-ffi/0.28.3 crate://crates.io/pyo3-macros/0.28.3 crate://crates.io/pyo3-macros-backend/0.28.3 crate://crates.io/python3-dll-a/0.2.14 crate://crates.io/quote/1.0.42 crate://crates.io/rpds/1.2.1 crate://crates.io/shlex/1.3.0 crate://crates.io/smallvec/1.15.1 crate://crates.io/syn/2.0.111 crate://crates.io/target-lexicon/0.13.3 crate://crates.io/triomphe/0.1.15 crate://crates.io/unicode-ident/1.0.22"
packages/x86-64-v3-poky-linux/python3-rpds-py: PV changed from "0.30.0" to "2026.5.1"
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-dbg: PV changed from "0.30.0" to "2026.5.1"
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-dbg: PKGV changed from 0.30.0 [default] to 2026.5.1 [default]
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-dbg: PKGSIZE changed from 308784 to 285680 (-7%)
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-dev: PV changed from "0.30.0" to "2026.5.1"
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-dev: PKGV changed from 0.30.0 [default] to 2026.5.1 [default]
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-doc: PV changed from "0.30.0" to "2026.5.1"
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-doc: PKGV changed from 0.30.0 [default] to 2026.5.1 [default]
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-locale: PV changed from "0.30.0" to "2026.5.1"
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-locale: PKGV changed from 0.30.0 [default] to 2026.5.1 [default]
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-ptest: PV changed from "0.30.0" to "2026.5.1"
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-ptest: PKGV changed from 0.30.0 [default] to 2026.5.1 [default]
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-src: PV changed from "0.30.0" to "2026.5.1"
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-src: PKGV changed from 0.30.0 [default] to 2026.5.1 [default]
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-staticdev: PV changed from "0.30.0" to "2026.5.1"
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-staticdev: PKGV changed from 0.30.0 [default] to 2026.5.1 [default]
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py: PV changed from "0.30.0" to "2026.5.1"
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py: PKGV changed from 0.30.0 [default] to 2026.5.1 [default]
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py: PKGSIZE changed from 743784 to 735642 (-1%)
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py: FILELIST: directory renamed /usr/lib/python3.14/site-packages/rpds_py-0.30.0.dist-info -> /usr/lib/python3.14/site-packages/rpds_py-2026.5.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/rpds_py-0.30.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/rpds_py-2026.5.1.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-rpds-py (sysroot):
  /usr/lib/python3.14/site-packages/rpds_py-2026.5.1.dist-info was added
  /usr/lib/python3.14/site-packages/rpds_py-2026.5.1.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/rpds_py-2026.5.1.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/rpds_py-2026.5.1.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/rpds_py-2026.5.1.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/rpds_py-0.30.0.dist-info was removed
  /usr/lib/python3.14/site-packages/rpds_py-0.30.0.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/rpds_py-0.30.0.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/rpds_py-0.30.0.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/rpds_py-0.30.0.dist-info/WHEEL was removed

--===============2941706764938712894==--

