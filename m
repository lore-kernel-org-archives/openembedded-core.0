Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFE62CA6001
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 05:28:51 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13638.1791178118746391479
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Oct 2026 22:28:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZTkaW/Pg;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ihEokY4/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a10a891380-62ba86f0-525d-42c4-a0c7-f214f3c276e4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791178118;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DJBtGKsLANXi1+z1DawV9E2HINlWR690F4gcoyMRcRI=;
	b=ZTkaW/PgFhHVEsEXvG8kkhZM7B1zXCBu/zU47s0cOG13dHSummYYdEwF2dtzXkm8
	sRZqyx9IUZ6bi+NR0Q72BSbJQgb/U1SStFpfsXPore+SDmC2O5vd+i3aj5tfDZOmW/I
	HpWxPpPlJt4k+KBTq4Z+zZG060m8JY+SuSSAnJaQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791178118;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DJBtGKsLANXi1+z1DawV9E2HINlWR690F4gcoyMRcRI=;
	b=ihEokY4/5gq20DUZKvxH9yQr+CNR/f8SUSay8knQoCUL/PERDUL/vJZWUJPXJQDm
	XuJjPO8qr8oHlI/mVJwarDxWfZdoWIukH7da5aN9o5byOjrvJl8ekY0q888bhvHo7Yw
	0+5SS3eWxmnMdrGwHvaJCP6r6nJBe013WYFCJxQw=
Content-Type: multipart/mixed; boundary="===============9163802129311784603=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-rpds-py: upgrading to 2026.9.1 SUCCEEDED
Message-ID: <010101a10a891380-62ba86f0-525d-42c4-a0c7-f214f3c276e4-000000@us-west-2.amazonses.com>
Date: Mon, 5 Oct 2026 05:28:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.05-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 05:28:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247213

--===============9163802129311784603==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-rpds-py* to *2026.9.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-rpds-py-upgrade-2026.6.3-2026.9.1.patch
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
From 6c4345b693f23428e7f004a2319b17063c2b077b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 5 Oct 2026 05:25:06 +0000
Subject: [PATCH] python3-rpds-py: upgrade 2026.6.3 -> 2026.9.1

---
 .../python/python3-rpds-py-crates.inc         | 28 +++++++++----------
 ...026.6.3.bb => python3-rpds-py_2026.9.1.bb} |  2 +-
 2 files changed, 15 insertions(+), 15 deletions(-)
 rename meta/recipes-devtools/python/{python3-rpds-py_2026.6.3.bb => python3-rpds-py_2026.9.1.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-rpds-py-crates.inc b/meta/recipes-devtools/python/python3-rpds-py-crates.inc
index 16091415ef..a5ec5a993a 100644
--- a/meta/recipes-devtools/python/python3-rpds-py-crates.inc
+++ b/meta/recipes-devtools/python/python3-rpds-py-crates.inc
@@ -2,41 +2,41 @@
 
 # from Cargo.lock
 SRC_URI += " \
-    crate://crates.io/archery/1.2.2 \
+    crate://crates.io/archery/1.2.3 \
     crate://crates.io/heck/0.5.0 \
     crate://crates.io/libc/0.2.177 \
     crate://crates.io/once_cell/1.21.3 \
     crate://crates.io/portable-atomic/1.11.1 \
     crate://crates.io/proc-macro2/1.0.103 \
-    crate://crates.io/pyo3/0.29.0 \
-    crate://crates.io/pyo3-build-config/0.29.0 \
-    crate://crates.io/pyo3-ffi/0.29.0 \
-    crate://crates.io/pyo3-macros/0.29.0 \
-    crate://crates.io/pyo3-macros-backend/0.29.0 \
+    crate://crates.io/pyo3/0.29.3 \
+    crate://crates.io/pyo3-build-config/0.29.3 \
+    crate://crates.io/pyo3-ffi/0.29.3 \
+    crate://crates.io/pyo3-macros/0.29.3 \
+    crate://crates.io/pyo3-macros-backend/0.29.3 \
     crate://crates.io/quote/1.0.42 \
     crate://crates.io/rpds/1.2.1 \
     crate://crates.io/smallvec/1.15.1 \
     crate://crates.io/syn/2.0.111 \
     crate://crates.io/target-lexicon/0.13.3 \
-    crate://crates.io/triomphe/0.1.15 \
+    crate://crates.io/triomphe/0.1.16 \
     crate://crates.io/unicode-ident/1.0.22 \
 "
 
-SRC_URI[archery-1.2.2.sha256sum] = "70e0a5f99dfebb87bb342d0f53bb92c81842e100bbb915223e38349580e5441d"
+SRC_URI[archery-1.2.3.sha256sum] = "33ca55ee147b1926dbea904f50fe4902494e97bc742205abbbf10c709e43815f"
 SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
 SRC_URI[libc-0.2.177.sha256sum] = "2874a2af47a2325c2001a6e6fad9b16a53b802102b528163885171cf92b15976"
 SRC_URI[once_cell-1.21.3.sha256sum] = "42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d"
 SRC_URI[portable-atomic-1.11.1.sha256sum] = "f84267b20a16ea918e43c6a88433c2d54fa145c92a811b5b047ccbe153674483"
 SRC_URI[proc-macro2-1.0.103.sha256sum] = "5ee95bc4ef87b8d5ba32e8b7714ccc834865276eab0aed5c9958d00ec45f49e8"
-SRC_URI[pyo3-0.29.0.sha256sum] = "cd274650b21d4bfc26a0a47587962c1edb425f69287324355cd040c3ea66071c"
-SRC_URI[pyo3-build-config-0.29.0.sha256sum] = "c5e2a7d2f0d013342f295c048ad19237add5154a55b1c5a254c0ec93d4109078"
-SRC_URI[pyo3-ffi-0.29.0.sha256sum] = "ca85c467da1bbc8d866eea5deff9cf29ea5f7785054a17da36e65bda9c05845b"
-SRC_URI[pyo3-macros-0.29.0.sha256sum] = "9ac53762fd065daa3194dd09337a38bd793a188100fd1a9304c4ab312d901771"
-SRC_URI[pyo3-macros-backend-0.29.0.sha256sum] = "4ca3a1557399783172dc5bf39cfca835157732532cba56b71d2292161e53b362"
+SRC_URI[pyo3-0.29.3.sha256sum] = "700d18fa267b73b9b521fd7e13580e2f446916f176cacee1ab63fcc8191f1655"
+SRC_URI[pyo3-build-config-0.29.3.sha256sum] = "7b3fc0c4d08f6bb10e71fe39dfb9e2f59c6eb6854e22ec8092f50c69a4499adb"
+SRC_URI[pyo3-ffi-0.29.3.sha256sum] = "dfc0b8e19df29aad7086cf977bb0c2a2f143e30567eb113e9cf72b62ca698330"
+SRC_URI[pyo3-macros-0.29.3.sha256sum] = "6100e8a4b5eba53afaa5ed078364851a0b2499c553a44c31026b929049b49dc6"
+SRC_URI[pyo3-macros-backend-0.29.3.sha256sum] = "6143877a16e82b5a727b7127ff4cd86858a24a28d745d72f43e6f227c7b1bdb3"
 SRC_URI[quote-1.0.42.sha256sum] = "a338cc41d27e6cc6dce6cefc13a0729dfbb81c262b1f519331575dd80ef3067f"
 SRC_URI[rpds-1.2.1.sha256sum] = "e025feb26210bc196b908e72deb063b1b4000754304341cbc168a1e72c857ebc"
 SRC_URI[smallvec-1.15.1.sha256sum] = "67b1b7a3b5fe4f1376887184045fcf45c69e92af734b7aaddc05fb777b6fbd03"
 SRC_URI[syn-2.0.111.sha256sum] = "390cc9a294ab71bdb1aa2e99d13be9c753cd2d7bd6560c77118597410c4d2e87"
 SRC_URI[target-lexicon-0.13.3.sha256sum] = "df7f62577c25e07834649fc3b39fafdc597c0a3527dc1c60129201ccfcbaa50c"
-SRC_URI[triomphe-0.1.15.sha256sum] = "dd69c5aa8f924c7519d6372789a74eac5b94fb0f8fcf0d4a97eb0bfc3e785f39"
+SRC_URI[triomphe-0.1.16.sha256sum] = "b40688ea6389c8171614b25491f71d4a27946e0c7ce2da1c6de27e25abf1a0ae"
 SRC_URI[unicode-ident-1.0.22.sha256sum] = "9312f7c4f6ff9069b165498234ce8be658059c6728633667c526e27dc2cf1df5"
diff --git a/meta/recipes-devtools/python/python3-rpds-py_2026.6.3.bb b/meta/recipes-devtools/python/python3-rpds-py_2026.9.1.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-rpds-py_2026.6.3.bb
rename to meta/recipes-devtools/python/python3-rpds-py_2026.9.1.bb
index 5898649c3b..6d86f8cd0a 100644
--- a/meta/recipes-devtools/python/python3-rpds-py_2026.6.3.bb
+++ b/meta/recipes-devtools/python/python3-rpds-py_2026.9.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/rpds-py/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7767fa537c4596c54141f32882c4a984"
 
-SRC_URI[sha256sum] = "1cebd1337c242e4ec2293e541f712b2da849b29f48f0c293684b71c0632625d4"
+SRC_URI[sha256sum] = "4793ef7f78268b124b73fa933440f01d258bbae01de9fa53e9080c9ab0425a12"
 
 require ${BPN}-crates.inc
 
-- 
2.47.1


--===============9163802129311784603==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py: FILELIST: directory renamed /usr/lib/python3.14/site-packages/rpds_py-2026.6.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/rpds_py-2026.9.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/rpds_py-2026.6.3.dist-info -> /usr/lib/python3.14/site-packages/rpds_py-2026.9.1.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-rpds-py (sysroot):
  /usr/lib/python3.14/site-packages/rpds_py-2026.6.3.dist-info moved to /usr/lib/python3.14/site-packages/rpds_py-2026.9.1.dist-info

--===============9163802129311784603==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-rpds-py-upgrade-2026.6.3-2026.9.1.patch"

RnJvbSA2YzQzNDViNjkzZjIzNDI4ZTdmMDA0YTIzMTliMTcwNjNjMmIwNzdiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgNSBPY3QgMjAyNiAwNToyNTowNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcnBkcy1weTogdXBncmFkZSAyMDI2LjYuMyAtPiAyMDI2LjkuMQoKLS0tCiAuLi4vcHl0
aG9uL3B5dGhvbjMtcnBkcy1weS1jcmF0ZXMuaW5jICAgICAgICAgfCAyOCArKysrKysrKystLS0t
LS0tLS0tCiAuLi4wMjYuNi4zLmJiID0+IHB5dGhvbjMtcnBkcy1weV8yMDI2LjkuMS5iYn0gfCAg
MiArLQogMiBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXJwZHMtcHlfMjAy
Ni42LjMuYmIgPT4gcHl0aG9uMy1ycGRzLXB5XzIwMjYuOS4xLmJifSAoODQlKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1ycGRzLXB5LWNyYXRlcy5p
bmMgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnBkcy1weS1jcmF0ZXMu
aW5jCmluZGV4IDE2MDkxNDE1ZWYuLmE1ZWM1YTk5M2EgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1ycGRzLXB5LWNyYXRlcy5pbmMKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJwZHMtcHktY3JhdGVzLmluYwpAQCAtMiw0
MSArMiw0MSBAQAogCiAjIGZyb20gQ2FyZ28ubG9jawogU1JDX1VSSSArPSAiIFwKLSAgICBjcmF0
ZTovL2NyYXRlcy5pby9hcmNoZXJ5LzEuMi4yIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9hcmNo
ZXJ5LzEuMi4zIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9oZWNrLzAuNS4wIFwKICAgICBjcmF0
ZTovL2NyYXRlcy5pby9saWJjLzAuMi4xNzcgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL29uY2Vf
Y2VsbC8xLjIxLjMgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3BvcnRhYmxlLWF0b21pYy8xLjEx
LjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Byb2MtbWFjcm8yLzEuMC4xMDMgXAotICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3B5bzMvMC4yOS4wIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8z
LWJ1aWxkLWNvbmZpZy8wLjI5LjAgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMtZmZpLzAu
MjkuMCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy1tYWNyb3MvMC4yOS4wIFwKLSAgICBj
cmF0ZTovL2NyYXRlcy5pby9weW8zLW1hY3Jvcy1iYWNrZW5kLzAuMjkuMCBcCisgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vcHlvMy8wLjI5LjMgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMtYnVp
bGQtY29uZmlnLzAuMjkuMyBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy1mZmkvMC4yOS4z
IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLW1hY3Jvcy8wLjI5LjMgXAorICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3B5bzMtbWFjcm9zLWJhY2tlbmQvMC4yOS4zIFwKICAgICBjcmF0ZTovL2Ny
YXRlcy5pby9xdW90ZS8xLjAuNDIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JwZHMvMS4yLjEg
XAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NtYWxsdmVjLzEuMTUuMSBcCiAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vc3luLzIuMC4xMTEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RhcmdldC1sZXhp
Y29uLzAuMTMuMyBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdHJpb21waGUvMC4xLjE1IFwKKyAg
ICBjcmF0ZTovL2NyYXRlcy5pby90cmlvbXBoZS8wLjEuMTYgXAogICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3VuaWNvZGUtaWRlbnQvMS4wLjIyIFwKICIKIAotU1JDX1VSSVthcmNoZXJ5LTEuMi4yLnNo
YTI1NnN1bV0gPSAiNzBlMGE1Zjk5ZGZlYmI4N2JiMzQyZDBmNTNiYjkyYzgxODQyZTEwMGJiYjkx
NTIyM2UzODM0OTU4MGU1NDQxZCIKK1NSQ19VUklbYXJjaGVyeS0xLjIuMy5zaGEyNTZzdW1dID0g
IjMzY2E1NWVlMTQ3YjE5MjZkYmVhOTA0ZjUwZmU0OTAyNDk0ZTk3YmM3NDIyMDVhYmJiZjEwYzcw
OWU0MzgxNWYiCiBTUkNfVVJJW2hlY2stMC41LjAuc2hhMjU2c3VtXSA9ICIyMzA0ZTAwOTgzZjg3
ZmZiMzhiNTViNDQ0YjVlM2I2MGE4ODRiNWQzMGMwZmNhN2Q4MmZlMzM0NDliYmU1NWVhIgogU1JD
X1VSSVtsaWJjLTAuMi4xNzcuc2hhMjU2c3VtXSA9ICIyODc0YTJhZjQ3YTIzMjVjMjAwMWE2ZTZm
YWQ5YjE2YTUzYjgwMjEwMmI1MjgxNjM4ODUxNzFjZjkyYjE1OTc2IgogU1JDX1VSSVtvbmNlX2Nl
bGwtMS4yMS4zLnNoYTI1NnN1bV0gPSAiNDJmNWUxNWM5OTUzYzVlNGNjY2VlYjJlNzM4MmE3MTY0
ODJjMzQ1MTUzMTVmN2IwMzUzMmI4YjRlODM5M2QyZCIKIFNSQ19VUklbcG9ydGFibGUtYXRvbWlj
LTEuMTEuMS5zaGEyNTZzdW1dID0gImY4NDI2N2IyMGExNmVhOTE4ZTQzYzZhODg0MzNjMmQ1NGZh
MTQ1YzkyYTgxMWI1YjA0N2NjYmUxNTM2NzQ0ODMiCiBTUkNfVVJJW3Byb2MtbWFjcm8yLTEuMC4x
MDMuc2hhMjU2c3VtXSA9ICI1ZWU5NWJjNGVmODdiOGQ1YmEzMmU4Yjc3MTRjY2M4MzQ4NjUyNzZl
YWIwYWVkNWM5OTU4ZDAwZWM0NWY0OWU4IgotU1JDX1VSSVtweW8zLTAuMjkuMC5zaGEyNTZzdW1d
ID0gImNkMjc0NjUwYjIxZDRiZmMyNmEwYTQ3NTg3OTYyYzFlZGI0MjVmNjkyODczMjQzNTVjZDA0
MGMzZWE2NjA3MWMiCi1TUkNfVVJJW3B5bzMtYnVpbGQtY29uZmlnLTAuMjkuMC5zaGEyNTZzdW1d
ID0gImM1ZTJhN2QyZjBkMDEzMzQyZjI5NWMwNDhhZDE5MjM3YWRkNTE1NGE1NWIxYzVhMjU0YzBl
YzkzZDQxMDkwNzgiCi1TUkNfVVJJW3B5bzMtZmZpLTAuMjkuMC5zaGEyNTZzdW1dID0gImNhODVj
NDY3ZGExYmJjOGQ4NjZlZWE1ZGVmZjljZjI5ZWE1Zjc3ODUwNTRhMTdkYTM2ZTY1YmRhOWMwNTg0
NWIiCi1TUkNfVVJJW3B5bzMtbWFjcm9zLTAuMjkuMC5zaGEyNTZzdW1dID0gIjlhYzUzNzYyZmQw
NjVkYWEzMTk0ZGQwOTMzN2EzOGJkNzkzYTE4ODEwMGZkMWE5MzA0YzRhYjMxMmQ5MDE3NzEiCi1T
UkNfVVJJW3B5bzMtbWFjcm9zLWJhY2tlbmQtMC4yOS4wLnNoYTI1NnN1bV0gPSAiNGNhM2ExNTU3
Mzk5NzgzMTcyZGM1YmYzOWNmY2E4MzUxNTc3MzI1MzJjYmE1NmI3MWQyMjkyMTYxZTUzYjM2MiIK
K1NSQ19VUklbcHlvMy0wLjI5LjMuc2hhMjU2c3VtXSA9ICI3MDBkMThmYTI2N2I3M2I5YjUyMWZk
N2UxMzU4MGUyZjQ0NjkxNmYxNzZjYWNlZTFhYjYzZmNjODE5MWYxNjU1IgorU1JDX1VSSVtweW8z
LWJ1aWxkLWNvbmZpZy0wLjI5LjMuc2hhMjU2c3VtXSA9ICI3YjNmYzBjNGQwOGY2YmIxMGU3MWZl
MzlkZmI5ZTJmNTljNmViNjg1NGUyMmVjODA5MmY1MGM2OWE0NDk5YWRiIgorU1JDX1VSSVtweW8z
LWZmaS0wLjI5LjMuc2hhMjU2c3VtXSA9ICJkZmMwYjhlMTlkZjI5YWFkNzA4NmNmOTc3YmIwYzJh
MmYxNDNlMzA1NjdlYjExM2U5Y2Y3MmI2MmNhNjk4MzMwIgorU1JDX1VSSVtweW8zLW1hY3Jvcy0w
LjI5LjMuc2hhMjU2c3VtXSA9ICI2MTAwZThhNGI1ZWJhNTNhZmFhNWVkMDc4MzY0ODUxYTBiMjQ5
OWM1NTNhNDRjMzEwMjZiOTI5MDQ5YjQ5ZGM2IgorU1JDX1VSSVtweW8zLW1hY3Jvcy1iYWNrZW5k
LTAuMjkuMy5zaGEyNTZzdW1dID0gIjYxNDM4NzdhMTZlODJiNWE3MjdiNzEyN2ZmNGNkODY4NThh
MjRhMjhkNzQ1ZDcyZjQzZTZmMjI3YzdiMWJkYjMiCiBTUkNfVVJJW3F1b3RlLTEuMC40Mi5zaGEy
NTZzdW1dID0gImEzMzhjYzQxZDI3ZTZjYzZkY2U2Y2VmYzEzYTA3MjlkZmJiODFjMjYyYjFmNTE5
MzMxNTc1ZGQ4MGVmMzA2N2YiCiBTUkNfVVJJW3JwZHMtMS4yLjEuc2hhMjU2c3VtXSA9ICJlMDI1
ZmViMjYyMTBiYzE5NmI5MDhlNzJkZWIwNjNiMWI0MDAwNzU0MzA0MzQxY2JjMTY4YTFlNzJjODU3
ZWJjIgogU1JDX1VSSVtzbWFsbHZlYy0xLjE1LjEuc2hhMjU2c3VtXSA9ICI2N2IxYjdhM2I1ZmU0
ZjEzNzY4ODcxODQwNDVmY2Y0NWM2OWU5MmFmNzM0YjdhYWRkYzA1ZmI3NzdiNmZiZDAzIgogU1JD
X1VSSVtzeW4tMi4wLjExMS5zaGEyNTZzdW1dID0gIjM5MGNjOWEyOTRhYjcxYmRiMWFhMmU5OWQx
M2JlOWM3NTNjZDJkN2JkNjU2MGM3NzExODU5NzQxMGM0ZDJlODciCiBTUkNfVVJJW3RhcmdldC1s
ZXhpY29uLTAuMTMuMy5zaGEyNTZzdW1dID0gImRmN2Y2MjU3N2MyNWUwNzgzNDY0OWZjM2IzOWZh
ZmRjNTk3YzBhMzUyN2RjMWM2MDEyOTIwMWNjZmNiYWE1MGMiCi1TUkNfVVJJW3RyaW9tcGhlLTAu
MS4xNS5zaGEyNTZzdW1dID0gImRkNjljNWFhOGY5MjRjNzUxOWQ2MzcyNzg5YTc0ZWFjNWI5NGZi
MGY4ZmNmMGQ0YTk3ZWIwYmZjM2U3ODVmMzkiCitTUkNfVVJJW3RyaW9tcGhlLTAuMS4xNi5zaGEy
NTZzdW1dID0gImI0MDY4OGVhNjM4OWM4MTcxNjE0YjI1NDkxZjcxZDRhMjc5NDZlMGM3Y2UyZGEx
YzZkZTI3ZTI1YWJmMWEwYWUiCiBTUkNfVVJJW3VuaWNvZGUtaWRlbnQtMS4wLjIyLnNoYTI1NnN1
bV0gPSAiOTMxMmY3YzRmNmZmOTA2OWIxNjU0OTgyMzRjZThiZTY1ODA1OWM2NzI4NjMzNjY3YzUy
NmUyN2RjMmNmMWRmNSIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1ycGRzLXB5XzIwMjYuNi4zLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXJwZHMtcHlfMjAyNi45LjEuYmIKc2ltaWxhcml0eSBpbmRleCA4NCUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJwZHMtcHlfMjAyNi42
LjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1ycGRz
LXB5XzIwMjYuOS4xLmJiCmluZGV4IDU4OTg2NDljM2IuLjZkODZmOGNkMGEgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1ycGRzLXB5XzIwMjYuNi4zLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1ycGRzLXB5XzIwMjYu
OS4xLmJiCkBAIC00LDcgKzQsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL3B5cGkub3JnL3Byb2pl
Y3QvcnBkcy1weS8iCiBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTov
L0xJQ0VOU0U7bWQ1PTc3NjdmYTUzN2M0NTk2YzU0MTQxZjMyODgyYzRhOTg0IgogCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiMWNlYmQxMzM3YzI0MmU0ZWMyMjkzZTU0MWY3MTJiMmRhODQ5YjI5ZjQ4
ZjBjMjkzNjg0YjcxYzA2MzI2MjVkNCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI0NzkzZWY3Zjc4
MjY4YjEyNGI3M2ZhOTMzNDQwZjAxZDI1OGJiYWUwMWRlOWZhNTNlOTA4MGM5YWIwNDI1YTEyIgog
CiByZXF1aXJlICR7QlBOfS1jcmF0ZXMuaW5jCiAKLS0gCjIuNDcuMQoK

--===============9163802129311784603==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-rpds-py: PV changed from "2026.6.3" to "2026.9.1"
packages/x86-64-v3-poky-linux/python3-rpds-py: PKGV changed from 2026.6.3 [default] to 2026.9.1 [default]
packages/x86-64-v3-poky-linux/python3-rpds-py: SRC_URI changed from "https://files.pythonhosted.org/packages/source/r/rpds_py/rpds_py-2026.6.3.tar.gz crate://crates.io/archery/1.2.2 crate://crates.io/heck/0.5.0 crate://crates.io/libc/0.2.177 crate://crates.io/once_cell/1.21.3 crate://crates.io/portable-atomic/1.11.1 crate://crates.io/proc-macro2/1.0.103 crate://crates.io/pyo3/0.29.0 crate://crates.io/pyo3-build-config/0.29.0 crate://crates.io/pyo3-ffi/0.29.0 crate://crates.io/pyo3-macros/0.29.0 crate://crates.io/pyo3-macros-backend/0.29.0 crate://crates.io/quote/1.0.42 crate://crates.io/rpds/1.2.1 crate://crates.io/smallvec/1.15.1 crate://crates.io/syn/2.0.111 crate://crates.io/target-lexicon/0.13.3 crate://crates.io/triomphe/0.1.15 crate://crates.io/unicode-ident/1.0.22" to "https://files.pythonhosted.org/packages/source/r/rpds_py/rpds_py-2026.9.1.tar.gz crate://crates.io/archery/1.2.3 crate://crates.io/heck/0.5.0 crate://crates.io/libc/0.2.177 crate://crates.io/once_cell/1.21.3 cra
 te://crates.io/portable-atomic/1.11.1 crate://crates.io/proc-macro2/1.0.103 crate://crates.io/pyo3/0.29.3 crate://crates.io/pyo3-build-config/0.29.3 crate://crates.io/pyo3-ffi/0.29.3 crate://crates.io/pyo3-macros/0.29.3 crate://crates.io/pyo3-macros-backend/0.29.3 crate://crates.io/quote/1.0.42 crate://crates.io/rpds/1.2.1 crate://crates.io/smallvec/1.15.1 crate://crates.io/syn/2.0.111 crate://crates.io/target-lexicon/0.13.3 crate://crates.io/triomphe/0.1.16 crate://crates.io/unicode-ident/1.0.22"
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-dbg: PV changed from "2026.6.3" to "2026.9.1"
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-dbg: PKGV changed from 2026.6.3 [default] to 2026.9.1 [default]
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-dbg: PKGSIZE changed from 335056 to 341064 (+2%)
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-dev: PV changed from "2026.6.3" to "2026.9.1"
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-dev: PKGV changed from 2026.6.3 [default] to 2026.9.1 [default]
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-doc: PV changed from "2026.6.3" to "2026.9.1"
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-doc: PKGV changed from 2026.6.3 [default] to 2026.9.1 [default]
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-locale: PV changed from "2026.6.3" to "2026.9.1"
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-locale: PKGV changed from 2026.6.3 [default] to 2026.9.1 [default]
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-ptest: PV changed from "2026.6.3" to "2026.9.1"
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-ptest: PKGV changed from 2026.6.3 [default] to 2026.9.1 [default]
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-src: PV changed from "2026.6.3" to "2026.9.1"
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-src: PKGV changed from 2026.6.3 [default] to 2026.9.1 [default]
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-staticdev: PV changed from "2026.6.3" to "2026.9.1"
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-staticdev: PKGV changed from 2026.6.3 [default] to 2026.9.1 [default]
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py: PV changed from "2026.6.3" to "2026.9.1"
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py: FILELIST: directory renamed /usr/lib/python3.14/site-packages/rpds_py-2026.6.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/rpds_py-2026.9.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/rpds_py-2026.6.3.dist-info -> /usr/lib/python3.14/site-packages/rpds_py-2026.9.1.dist-info
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py: PKGV changed from 2026.6.3 [default] to 2026.9.1 [default]
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py: PKGSIZE changed from 727474 to 735674 (+1%)
Changes to packages/x86-64-v3-poky-linux/python3-rpds-py (sysroot):
  /usr/lib/python3.14/site-packages/rpds_py-2026.6.3.dist-info moved to /usr/lib/python3.14/site-packages/rpds_py-2026.9.1.dist-info

--===============9163802129311784603==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 959 .bb files complete (0 cached, 959 parsed). 1994 targets, 66 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-45c817a3e537f7164febed2f20c68aa8d9f90a45"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:45c817a3e537f7164febed2f20c68aa8d9f90a45"
meta-yocto-bsp       
meta-poky            = "master:49a2b44583968d321b3195bfd0cb2232dff13950"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 758 Local 717 Mirrors 0 Missed 41 Current 240 (94% match, 95% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 241 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 245 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_2026.9.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 251 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_qa_setscene)
NOTE: Running setscene task 256 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 268 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 269 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 270 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 276 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 300 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 301 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 302 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 304 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 314 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 317 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 325 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 332 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_package_qa_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_qa_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-rpds-py-2026.9.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 336 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_qa_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 346 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 348 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 350 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-pytest-9.1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 354 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.98.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 362 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 397 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-pytest-9.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-rpds-py-2026.9.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 398 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 399 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 401 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 402 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 403 of 998 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 404 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_packagedata_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libstd-rs-1.98.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-packaging-26.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-scm-native-10.3.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 406 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 408 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 413 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.98.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 418 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.98.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 419 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.14.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 429 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.98.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 431 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_recipe_qa_setscene)
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 433 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.98.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 441 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-colorama-0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-scm-native-10.3.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 455 of 998 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 472 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_package_setscene)
NOTE: recipe python3-pygments-2.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.98.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.98.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.98.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-scm-native-10.3.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 473 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-9.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 476 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 478 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 481 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 489 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 492 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 493 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_package_setscene)
NOTE: Running setscene task 496 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 503 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.98.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 511 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_package_setscene)
NOTE: recipe libstd-rs-1.98.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 514 of 998 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 525 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-scm-native-10.3.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 533 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 535 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.47-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcxx-23.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 550 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 558 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 560 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-9.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 572 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 578 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_spdx_setscene)
NOTE: recipe libcxx-23.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 583 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 589 of 998 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 593 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe binutils-2.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 611 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.98.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 619 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 627 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 629 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.98.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 630 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_populate_sysroot_setscene)
NOTE: recipe coreutils-9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 642 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe compiler-rt-23.1.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 649 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.14.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 669 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.196-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-26.3-r0: task do_package_setscene: Started
NOTE: recipe libcxx-23.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_package_setscene: Started
NOTE: recipe libstd-rs-1.98.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_package_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe compiler-rt-23.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.98.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 678 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 708 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 713 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe elfutils-0.196-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 715 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 717 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 719 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 721 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 722 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 723 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 726 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 748 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_2026.9.1.bb:do_recipe_qa)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_packagedata_setscene: Started
NOTE: Running task 770 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb:do_fetch)
NOTE: recipe libarchive-3.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 773 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 734 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcxx-23.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 735 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 738 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 749 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 762 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 763 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe python3-rpds-py-2026.9.1-r0: task do_recipe_qa: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 764 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 767 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 769 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_packagedata_setscene)
NOTE: Running setscene task 773 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_packagedata_setscene)
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_fetch: Started
NOTE: recipe json-c-0.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 787 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe libcxx-23.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_fetch: Succeeded
NOTE: recipe compiler-rt-23.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-packaging-26.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 939 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb:do_unpack)
NOTE: Running task 942 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running setscene task 800 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.48-r0: task do_packagedata_setscene: Started
NOTE: recipe libcxx-23.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 995 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-3.14.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 801 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-packaging-26.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 802 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-rpds-py-2026.9.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1089 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_2026.9.1.bb:do_fetch)
NOTE: Running task 1094 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe compiler-rt-23.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 803 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_recipe_qa_setscene)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.48-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 810 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_packagedata_setscene)
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 828 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_packagedata_setscene)
NOTE: recipe python3-packaging-26.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: Running setscene task 834 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe compiler-rt-23.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-rpds-py-2026.9.1-r0: task do_fetch: Started
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1146 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 1150 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_fetch)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1163 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_fetch)
NOTE: recipe python3-rpds-py-2026.9.1-r0: task do_fetch: Succeeded
NOTE: Running task 1176 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 1185 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_2026.9.1.bb:do_unpack)
NOTE: recipe gnutls-3.8.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 838 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 841 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 842 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_packagedata_setscene)
NOTE: recipe libpsl-0.23.3-r0: task do_packagedata_setscene: Started
NOTE: recipe compiler-rt-23.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1209 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_fetch)
NOTE: recipe attr-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_fetch: Started
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_fetch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_fetch: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1225 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_unpack)
NOTE: recipe libseccomp-2.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe python3-rpds-py-2026.9.1-r0: task do_unpack: Started
NOTE: Running task 1248 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_unpack)
NOTE: Running task 1256 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: Running task 1257 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: recipe libpsl-0.23.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 853 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_fetch: Started
NOTE: Running setscene task 856 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 857 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 858 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 859 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_packagedata_setscene)
NOTE: recipe python3-packaging-26.3-r0: task do_fetch: Succeeded
NOTE: Running setscene task 861 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_unpack: Started
NOTE: recipe attr-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 862 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_unpack: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: Running setscene task 863 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 864 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 865 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 867 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 869 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_unpack: Succeeded
NOTE: Running setscene task 870 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 871 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.5.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: recipe openssl-4.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 872 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 875 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 876 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 880 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 881 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-rpds-py-2026.9.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 883 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 884 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 887 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-4.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 888 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 895 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 898 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 899 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-4.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 906 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 912 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 913 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 915 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 920 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 922 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 924 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 926 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-4.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 928 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 930 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 933 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 937 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 939 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1461 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_2026.9.1.bb:do_patch)
NOTE: recipe expat-2.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1472 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_unpack)
NOTE: Running task 1473 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_patch)
NOTE: Running task 1477 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb:do_patch)
NOTE: Running task 1478 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 944 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1484 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_patch)
NOTE: recipe openssl-4.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1546 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_check_backend)
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_unpack: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1574 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_2026.9.1.bb:do_create_recipe_spdx)
NOTE: recipe openssl-4.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1579 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_create_recipe_spdx)
NOTE: recipe python3-rpds-py-2026.9.1-r0: task do_patch: Started
NOTE: recipe xz-5.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_patch: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_patch: Started
NOTE: Running task 1590 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_create_recipe_spdx)
NOTE: Running task 1597 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_create_recipe_spdx)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_unpack: Succeeded
NOTE: Running task 1598 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_patch)
NOTE: Running task 1599 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_check_backend: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_check_backend: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 946 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_packagedata_setscene)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_create_recipe_spdx: Started
NOTE: Running setscene task 947 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 950 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe python3-rpds-py-2026.9.1-r0: task do_patch: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1606 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_2026.9.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1607 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_2026.9.1.bb:do_rust_gen_targets)
NOTE: recipe python3-rpds-py-2026.9.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_patch: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1610 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb:do_rust_gen_targets)
NOTE: recipe python3-packaging-26.3-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-rpds-py-2026.9.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-rpds-py-2026.9.1-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-rpds-py-2026.9.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_patch: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 953 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 955 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 957 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-rpds-py-2026.9.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcc-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-rpds-py-2026.9.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe libgcc-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 959 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 960 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 961 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running setscene task 964 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 965 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 966 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 971 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 972 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 973 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 975 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 980 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 981 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 985 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 987 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 994 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1770 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2048 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_2026.9.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2077 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2078 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2131 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2193 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2258 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-rpds-py-2026.9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-packaging-26.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-packaging-26.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2337 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_configure)
NOTE: Running task 2338 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_configure)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2339 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_configure)
NOTE: Running task 2340 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: recipe python3-packaging-26.3-r0: task do_configure: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_configure: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_configure: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: recipe python3-packaging-26.3-r0: task do_configure: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_configure: Succeeded
NOTE: Running task 2341 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_configure_ptest_base)
NOTE: Running task 2342 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_configure_ptest_base)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2343 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_compile)
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: Running task 2344 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: recipe python3-rpds-py-2026.9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_configure_ptest_base: Started
NOTE: Running task 2345 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_2026.9.1.bb:do_rust_create_wrappers)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-packaging-26.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2346 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_compile)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_compile: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2347 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb:do_rust_create_wrappers)
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: Running task 2348 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_compile)
NOTE: recipe python3-rpds-py-2026.9.1-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-packaging-26.3-r0: task do_compile: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-rpds-py-2026.9.1-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 2349 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_2026.9.1.bb:do_configure)
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 2350 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb:do_configure)
NOTE: recipe python3-rpds-py-2026.9.1-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_configure: Started
NOTE: recipe python3-rpds-py-2026.9.1-r0: task do_configure: Succeeded
NOTE: Running task 2351 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_2026.9.1.bb:do_configure_ptest_base)
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_configure: Succeeded
NOTE: Running task 2352 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb:do_configure_ptest_base)
NOTE: recipe python3-rpds-py-2026.9.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-rpds-py-2026.9.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2353 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_2026.9.1.bb:do_compile)
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2354 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb:do_compile)
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe python3-rpds-py-2026.9.1-r0: task do_compile: Started
NOTE: Running task 2355 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe python3-packaging-26.3-r0: task do_compile: Succeeded
NOTE: Running task 2356 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_compile_ptest_base)
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: Running task 2357 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: recipe python3-packaging-26.3-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-packaging-26.3-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Running task 2358 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_install)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 7e86448afe1b3e8fcf2e9f542240cb9b328cc75e1ab3c65f36609a2d1377b4f7
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 88804d32f1b161eaa2aaa2b5d569c6f99f1efba126894eccc4f4f6cb2e360d1a to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'fce6c83ee8242bbda69076f9157dadc0d4a1594143a339824673796433b36a15', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '88804d32f1b161eaa2aaa2b5d569c6f99f1efba126894eccc4f4f6cb2e360d1a'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed fce6c83ee8242bbda69076f9157dadc0d4a1594143a339824673796433b36a15 -> 88804d32f1b161eaa2aaa2b5d569c6f99f1efba126894eccc4f4f6cb2e360d1a as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-packaging-26.3-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: Running task 2371 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: Running task 2372 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_install)
NOTE: recipe python3-packaging-26.3-r0: task do_install: Succeeded
NOTE: Running task 2373 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_install_ptest_base)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_compile: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_install: Started
NOTE: Running task 2374 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_compile_ptest_base)
NOTE: recipe python3-packaging-26.3-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2375 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_install)
NOTE: recipe python3-packaging-26.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2378 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_populate_sysroot)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_install: Started
NOTE: recipe python3-packaging-26.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_install: Succeeded
NOTE: Running task 2381 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_populate_sysroot)
NOTE: Running task 2382 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_package_write_ipk)
NOTE: Running task 2383 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_package_write_deb)
NOTE: Running task 2384 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_package_write_rpm)
NOTE: Running task 2385 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_package_qa)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_package_qa: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_install: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2386 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_install_ptest_base)
NOTE: Running task 2387 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_create_spdx)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-packaging-26.3-r0: task do_create_spdx: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2388 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_create_spdx)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_package_qa: Succeeded
NOTE: Running task 2391 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_populate_sysroot)
NOTE: Running task 2392 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_package_write_ipk)
NOTE: Running task 2393 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_package_write_deb)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_create_spdx: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: Running task 2394 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_package_write_rpm)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_package_write_ipk: Succeeded
NOTE: Running task 2395 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_package_qa)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package unihash changed to 9a1a30e251984b344a2cc97abcc7cae082f0c988abb23fb65026fabc41265469
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata became valid
NOTE: Running setscene task 998 of 998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata_setscene)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_package_qa: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-26.3-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-pluggy-1.6.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2401 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_create_spdx)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_create_spdx: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-rpds-py-2026.9.1-r0: task do_compile: Succeeded
NOTE: Running task 2402 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_2026.9.1.bb:do_compile_ptest_base)
NOTE: recipe python3-rpds-py-2026.9.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-rpds-py-2026.9.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2403 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_2026.9.1.bb:do_install)
NOTE: recipe python3-rpds-py-2026.9.1-r0: task do_install: Started
NOTE: recipe python3-rpds-py-2026.9.1-r0: task do_install: Succeeded
NOTE: Running task 2404 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_2026.9.1.bb:do_install_ptest_base)
NOTE: recipe python3-rpds-py-2026.9.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-rpds-py-2026.9.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2405 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_2026.9.1.bb:do_package)
NOTE: Running task 2406 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_2026.9.1.bb:do_populate_sysroot)
NOTE: recipe python3-rpds-py-2026.9.1-r0: task do_package: Started
NOTE: recipe python3-rpds-py-2026.9.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-rpds-py-2026.9.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-rpds-py-2026.9.1-r0: task do_package: Succeeded
NOTE: Running task 2407 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_2026.9.1.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_compile: Succeeded
NOTE: Running task 2408 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb:do_compile_ptest_base)
NOTE: recipe python3-rpds-py-2026.9.1-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2409 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb:do_install)
NOTE: recipe python3-rpds-py-2026.9.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_install: Started
NOTE: Running task 2410 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_2026.9.1.bb:do_create_spdx)
NOTE: Running task 2411 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_2026.9.1.bb:do_package_write_ipk)
NOTE: Running task 2412 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_2026.9.1.bb:do_package_write_deb)
NOTE: Running task 2413 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_2026.9.1.bb:do_package_write_rpm)
NOTE: Running task 2414 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_2026.9.1.bb:do_package_qa)
NOTE: recipe python3-rpds-py-2026.9.1-r0: task do_create_spdx: Started
NOTE: recipe python3-rpds-py-2026.9.1-r0: task do_package_write_ipk: Started
NOTE: recipe python3-rpds-py-2026.9.1-r0: task do_package_write_deb: Started
NOTE: recipe python3-rpds-py-2026.9.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-rpds-py-2026.9.1-r0: task do_package_qa: Started
NOTE: recipe python3-rpds-py-2026.9.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2415 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_2026.9.1.bb:do_create_package_spdx)
NOTE: recipe python3-rpds-py-2026.9.1-r0: task do_package_qa: Succeeded
NOTE: recipe python3-rpds-py-2026.9.1-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-rpds-py-2026.9.1-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-rpds-py-2026.9.1-r0: task do_create_package_spdx: Started
NOTE: recipe python3-rpds-py-2026.9.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_install: Succeeded
NOTE: Running task 2416 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb:do_install_ptest_base)
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2417 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb:do_package)
NOTE: recipe python3-rpds-py-2026.9.1-r0: task do_create_package_spdx: Succeeded
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_package: Succeeded
NOTE: Running task 2418 of 2423 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2418 tasks of which 2318 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261005052426.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261005052426.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-hypothesis/6.168.3/temp/log.do_packagedata.2924619
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-hypothesis-6.168.3-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.168.4-r0 to 0:6.168.3-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.168.3-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.168.4-r0 to 0:6.168.3-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.168.3-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.168.4-r0 to 0:6.168.3-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.168.3-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.168.4-r0 to 0:6.168.3-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.168.3-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.168.4-r0 to 0:6.168.3-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.168.3-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.168.4-r0 to 0:6.168.3-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.168.3-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.168.4-r0 to 0:6.168.3-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.168.3-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.168.4-r0 to 0:6.168.3-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.168.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-hypothesis/6.168.3/temp/log.do_packagedata.2924619
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb:do_packagedata) failed with exit code '1'

--===============9163802129311784603==--

