Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2BDEC0218A
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:20:49 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.42618.1738416041146712329
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:20:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=dL6DNfVQ;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=UKCIqa2B;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010194c1aba92e-cb823746-fc44-4c23-b74a-5ca8dcf95dc5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416040;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=HSX/yEhWKs6KhdfcH5RbN0P6hJPBnBUxeFPFoIpngQw=;
	b=dL6DNfVQ8/I44RFWLyHeRHAtbtu4fFUMpmXvRP9sEPK33UExMdQY2GZHVC+aklJO
	XoqazRvqRD0dEFeVQ7vb0YeXbHYFB1plH2wAC1TX992SVwafx4D3BfK0YIVjmSQKmyW
	MgHnltgxxxpAruA5nGlkdbKiFgcZ14YZaSQ24RRU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416040;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=HSX/yEhWKs6KhdfcH5RbN0P6hJPBnBUxeFPFoIpngQw=;
	b=UKCIqa2B8gvjhC5Jwx4JbsF4s6Ul8VjhlhMrWSgWjGhFjIzPmyJNYhmbkFKbHRy/
	p5g5V8OtnjXYAcp73uzG0kLy+od7Tw47FDH3Mu7wSYWEhoDmUitw6I7tTeZ0+eXAMK8
	DQT9WQUKo3xcsExuEDJfoJit0Wg8Y5teOPsLK8Vs=
Content-Type: multipart/mixed; boundary="===============1628730968871940935=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxcrypt,libxcrypt-compat: upgrading to 4.4.38,4.4.38 FAILED
Message-ID: <01010194c1aba92e-cb823746-fc44-4c23-b74a-5ca8dcf95dc5-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:20:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:20:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210506

--===============1628730968871940935==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libxcrypt,libxcrypt-compat* to *4.4.38,4.4.38* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libxcrypt-libxcrypt-compat-upgrade-4.4.37-4.4.38-4.4.patch
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
From 5c7132495bb441653e1fe29011cc1eae342bc394 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Feb 2025 05:07:46 +0000
Subject: [PATCH] libxcrypt,libxcrypt-compat: upgrade 4.4.37 -> 4.4.38,4.4.37
 -> 4.4.38

---
 meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch     | 2 +-
 .../{libxcrypt-compat_4.4.37.bb => libxcrypt-compat_4.4.38.bb}  | 0
 meta/recipes-core/libxcrypt/libxcrypt.inc                       | 2 +-
 .../libxcrypt/{libxcrypt_4.4.37.bb => libxcrypt_4.4.38.bb}      | 0
 4 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/libxcrypt/{libxcrypt-compat_4.4.37.bb => libxcrypt-compat_4.4.38.bb} (100%)
 rename meta/recipes-core/libxcrypt/{libxcrypt_4.4.37.bb => libxcrypt_4.4.38.bb} (100%)

diff --git a/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch b/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch
index 879950bbe3..a6d4d8e96b 100644
--- a/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch
+++ b/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch
@@ -1,4 +1,4 @@
-From 1e94a03541e35718dc1eaa8023e0ec3cf2de369b Mon Sep 17 00:00:00 2001
+From c80b411d0323b4a93aae9ef65ca17242b711df6c Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 30 Apr 2021 10:35:02 +0100
 Subject: [PATCH] libxcrypt: Update to 4.4.19 release and fix symbol version
diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.37.bb b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.38.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.37.bb
rename to meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.38.bb
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index 9ecb333fb9..247499565d 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -12,7 +12,7 @@ inherit autotools pkgconfig
 SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH};protocol=https \
            file://fix_cflags_handling.patch \
            "
-SRCREV = "e5714d1f0a477f91ce3986fa63651c7710f0e183"
+SRCREV = "55ea777e8d567e5e86ffac917c28815ac54cc341"
 SRCBRANCH ?= "master"
 
 PROVIDES = "virtual/crypt"
diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.4.37.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt_4.4.37.bb
rename to meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb
-- 
2.44.1


--===============1628730968871940935==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libxcrypt-compat: PKGV changed from 4.4.37 [default] to 4.4.38 [default]
packages/core2-64-poky-linux/libxcrypt-compat: PV changed from "4.4.37" to "4.4.38"
packages/core2-64-poky-linux/libxcrypt-compat/libxcrypt-compat-dbg: PKGV changed from 4.4.37 [default] to 4.4.38 [default]
packages/core2-64-poky-linux/libxcrypt-compat/libxcrypt-compat-dbg: PV changed from "4.4.37" to "4.4.38"
packages/core2-64-poky-linux/libxcrypt-compat/libxcrypt-compat-dbg: PKGSIZE changed from 573280 to 573152 (-0%)
packages/core2-64-poky-linux/libxcrypt-compat/libxcrypt-compat-dev: PKGV changed from 4.4.37 [default] to 4.4.38 [default]
packages/core2-64-poky-linux/libxcrypt-compat/libxcrypt-compat-dev: PV changed from "4.4.37" to "4.4.38"
packages/core2-64-poky-linux/libxcrypt-compat/libxcrypt-compat-doc: PKGV changed from 4.4.37 [default] to 4.4.38 [default]
packages/core2-64-poky-linux/libxcrypt-compat/libxcrypt-compat-doc: PV changed from "4.4.37" to "4.4.38"
packages/core2-64-poky-linux/libxcrypt-compat/libxcrypt-compat-locale: PKGV changed from 4.4.37 [default] to 4.4.38 [default]
packages/core2-64-poky-linux/libxcrypt-compat/libxcrypt-compat-locale: PV changed from "4.4.37" to "4.4.38"
packages/core2-64-poky-linux/libxcrypt-compat/libxcrypt-compat-src: PKGV changed from 4.4.37 [default] to 4.4.38 [default]
packages/core2-64-poky-linux/libxcrypt-compat/libxcrypt-compat-src: PV changed from "4.4.37" to "4.4.38"
packages/core2-64-poky-linux/libxcrypt-compat/libxcrypt-compat-src: PKGSIZE changed from 753264 to 753262 (-0%)
packages/core2-64-poky-linux/libxcrypt-compat/libxcrypt-compat-staticdev: PKGV changed from 4.4.37 [default] to 4.4.38 [default]
packages/core2-64-poky-linux/libxcrypt-compat/libxcrypt-compat-staticdev: PV changed from "4.4.37" to "4.4.38"
packages/core2-64-poky-linux/libxcrypt-compat/libxcrypt-compat: PKGV changed from 4.4.37 [default] to 4.4.38 [default]
packages/core2-64-poky-linux/libxcrypt-compat/libxcrypt-compat: PV changed from "4.4.37" to "4.4.38"
packages/core2-64-poky-linux/libxcrypt: PKGV changed from 4.4.37 [default] to 4.4.38 [default]
packages/core2-64-poky-linux/libxcrypt: PV changed from "4.4.37" to "4.4.38"
packages/core2-64-poky-linux/libxcrypt/libxcrypt-dbg: PKGV changed from 4.4.37 [default] to 4.4.38 [default]
packages/core2-64-poky-linux/libxcrypt/libxcrypt-dbg: PV changed from "4.4.37" to "4.4.38"
packages/core2-64-poky-linux/libxcrypt/libxcrypt-dbg: PKGSIZE changed from 565368 to 565240 (-0%)
packages/core2-64-poky-linux/libxcrypt/libxcrypt-dev: PKGV changed from 4.4.37 [default] to 4.4.38 [default]
packages/core2-64-poky-linux/libxcrypt/libxcrypt-dev: PV changed from "4.4.37" to "4.4.38"
packages/core2-64-poky-linux/libxcrypt/libxcrypt-doc: PKGV changed from 4.4.37 [default] to 4.4.38 [default]
packages/core2-64-poky-linux/libxcrypt/libxcrypt-doc: PV changed from "4.4.37" to "4.4.38"
packages/core2-64-poky-linux/libxcrypt/libxcrypt-locale: PKGV changed from 4.4.37 [default] to 4.4.38 [default]
packages/core2-64-poky-linux/libxcrypt/libxcrypt-locale: PV changed from "4.4.37" to "4.4.38"
packages/core2-64-poky-linux/libxcrypt/libxcrypt-src: PKGV changed from 4.4.37 [default] to 4.4.38 [default]
packages/core2-64-poky-linux/libxcrypt/libxcrypt-src: PV changed from "4.4.37" to "4.4.38"
packages/core2-64-poky-linux/libxcrypt/libxcrypt-src: PKGSIZE changed from 746579 to 746577 (-0%)
packages/core2-64-poky-linux/libxcrypt/libxcrypt-staticdev: PKGV changed from 4.4.37 [default] to 4.4.38 [default]
packages/core2-64-poky-linux/libxcrypt/libxcrypt-staticdev: PV changed from "4.4.37" to "4.4.38"
packages/core2-64-poky-linux/libxcrypt/libxcrypt: PKGV changed from 4.4.37 [default] to 4.4.38 [default]
packages/core2-64-poky-linux/libxcrypt/libxcrypt: PV changed from "4.4.37" to "4.4.38"

--===============1628730968871940935==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 919 .bb files complete (0 cached, 919 parsed). 1875 targets, 52 skipped, 0 masked, 0 errors.
Removing 30 recipes from the core2-64 sysroot...done.
Removing 30 recipes from the qemux86_64 sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'libxcrypt'
libxcrypt was skipped: PREFERRED_PROVIDER_virtual/crypt set to musl, not libxcrypt
libxcrypt was skipped: PREFERRED_PROVIDER_virtual/crypt set to musl, not libxcrypt

--===============1628730968871940935==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxcrypt-libxcrypt-compat-upgrade-4.4.37-4.4.38-4.4.patch"

RnJvbSA1YzcxMzI0OTViYjQ0MTY1M2UxZmUyOTAxMWNjMWVhZTM0MmJjMzk0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBGZWIgMjAyNSAwNTowNzo0NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnhjcnlwdCxsaWJ4Y3J5cHQtY29tcGF0OiB1cGdyYWRlIDQuNC4zNyAtPiA0LjQuMzgsNC40LjM3
CiAtPiA0LjQuMzgKCi0tLQogbWV0YS9yZWNpcGVzLWNvcmUvbGlieGNyeXB0L2ZpbGVzL2ZpeF9j
ZmxhZ3NfaGFuZGxpbmcucGF0Y2ggICAgIHwgMiArLQogLi4uL3tsaWJ4Y3J5cHQtY29tcGF0XzQu
NC4zNy5iYiA9PiBsaWJ4Y3J5cHQtY29tcGF0XzQuNC4zOC5iYn0gIHwgMAogbWV0YS9yZWNpcGVz
LWNvcmUvbGlieGNyeXB0L2xpYnhjcnlwdC5pbmMgICAgICAgICAgICAgICAgICAgICAgIHwgMiAr
LQogLi4uL2xpYnhjcnlwdC97bGlieGNyeXB0XzQuNC4zNy5iYiA9PiBsaWJ4Y3J5cHRfNC40LjM4
LmJifSAgICAgIHwgMAogNCBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvbGlieGNyeXB0L3tsaWJ4Y3J5cHQtY29t
cGF0XzQuNC4zNy5iYiA9PiBsaWJ4Y3J5cHQtY29tcGF0XzQuNC4zOC5iYn0gKDEwMCUpCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWNvcmUvbGlieGNyeXB0L3tsaWJ4Y3J5cHRfNC40LjM3LmJiID0+IGxp
YnhjcnlwdF80LjQuMzguYmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3Jl
L2xpYnhjcnlwdC9maWxlcy9maXhfY2ZsYWdzX2hhbmRsaW5nLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWNvcmUvbGlieGNyeXB0L2ZpbGVzL2ZpeF9jZmxhZ3NfaGFuZGxpbmcucGF0Y2gKaW5kZXggODc5
OTUwYmJlMy4uYTZkNGQ4ZTk2YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvbGlieGNy
eXB0L2ZpbGVzL2ZpeF9jZmxhZ3NfaGFuZGxpbmcucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNv
cmUvbGlieGNyeXB0L2ZpbGVzL2ZpeF9jZmxhZ3NfaGFuZGxpbmcucGF0Y2gKQEAgLTEsNCArMSw0
IEBACi1Gcm9tIDFlOTRhMDM1NDFlMzU3MThkYzFlYWE4MDIzZTBlYzNjZjJkZTM2OWIgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGM4MGI0MTFkMDMyM2I0YTkzYWFlOWVmNjVjYTE3MjQy
YjcxMWRmNmMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8
cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KIERhdGU6IEZyaSwgMzAgQXByIDIw
MjEgMTA6MzU6MDIgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gbGlieGNyeXB0OiBVcGRhdGUgdG8g
NC40LjE5IHJlbGVhc2UgYW5kIGZpeCBzeW1ib2wgdmVyc2lvbgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWNvcmUvbGlieGNyeXB0L2xpYnhjcnlwdC1jb21wYXRfNC40LjM3LmJiIGIvbWV0YS9y
ZWNpcGVzLWNvcmUvbGlieGNyeXB0L2xpYnhjcnlwdC1jb21wYXRfNC40LjM4LmJiCnNpbWlsYXJp
dHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29yZS9saWJ4Y3J5cHQvbGli
eGNyeXB0LWNvbXBhdF80LjQuMzcuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL2xpYnhj
cnlwdC9saWJ4Y3J5cHQtY29tcGF0XzQuNC4zOC5iYgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWNvcmUvbGlieGNyeXB0L2xpYnhjcnlwdC5pbmMgYi9tZXRhL3JlY2lwZXMtY29yZS9saWJ4Y3J5
cHQvbGlieGNyeXB0LmluYwppbmRleCA5ZWNiMzMzZmI5Li4yNDc0OTk1NjVkIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtY29yZS9saWJ4Y3J5cHQvbGlieGNyeXB0LmluYworKysgYi9tZXRhL3Jl
Y2lwZXMtY29yZS9saWJ4Y3J5cHQvbGlieGNyeXB0LmluYwpAQCAtMTIsNyArMTIsNyBAQCBpbmhl
cml0IGF1dG90b29scyBwa2djb25maWcKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9iZXNz
ZXI4Mi9saWJ4Y3J5cHQuZ2l0O2JyYW5jaD0ke1NSQ0JSQU5DSH07cHJvdG9jb2w9aHR0cHMgXAog
ICAgICAgICAgICBmaWxlOi8vZml4X2NmbGFnc19oYW5kbGluZy5wYXRjaCBcCiAgICAgICAgICAg
ICIKLVNSQ1JFViA9ICJlNTcxNGQxZjBhNDc3ZjkxY2UzOTg2ZmE2MzY1MWM3NzEwZjBlMTgzIgor
U1JDUkVWID0gIjU1ZWE3NzdlOGQ1NjdlNWU4NmZmYWM5MTdjMjg4MTVhYzU0Y2MzNDEiCiBTUkNC
UkFOQ0ggPz0gIm1hc3RlciIKIAogUFJPVklERVMgPSAidmlydHVhbC9jcnlwdCIKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhjcnlwdC9saWJ4Y3J5cHRfNC40LjM3LmJiIGIvbWV0
YS9yZWNpcGVzLWNvcmUvbGlieGNyeXB0L2xpYnhjcnlwdF80LjQuMzguYmIKc2ltaWxhcml0eSBp
bmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL2xpYnhjcnlwdC9saWJ4Y3J5
cHRfNC40LjM3LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS9saWJ4Y3J5cHQvbGlieGNy
eXB0XzQuNC4zOC5iYgotLSAKMi40NC4xCgo=

--===============1628730968871940935==--

