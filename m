Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F671C021A0
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 12:42:10 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.8046.1739623326598169694
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Feb 2025 04:42:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=SN/5XQ97;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=An+q92nc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019509a15e77-4b93ebd5-fbac-437e-843a-8fbf5d257582-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1739623325;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8uEk6A3a20JO/hTCL+wiS+JximFlnccIYZ8Yu374Lqk=;
	b=SN/5XQ972gX0m3iU1UaxA9neK3jXmYz0C2mfdeb8anNSMXVaY3gUpU6HWdwA6xrM
	ioZ1qA9pgx5CvVpB4hpIs20CiMuf+POaIX9PNmJ+6i/YhPlx9arcCMuvddX7JozOoqy
	UrAkwlV+1f9YSrwx28qYxTQt3SL9ntzDl8fmIcZ4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1739623325;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8uEk6A3a20JO/hTCL+wiS+JximFlnccIYZ8Yu374Lqk=;
	b=An+q92ncGD0Dk7YcL4PUdkEvBOYl4ecv/zLnjW7WCRue6FSYQoY7kO/oQPg5BDjW
	kxso/CShHzAd9LNRN6EFzYrWzG5TzXZcFDR5n0ll9xnFjvimxYklWcaDNING5MdaDa7
	gfYDQXe2WK03ClBzuw0gesYWfSOrdQ6+yRO98mzM=
Content-Type: multipart/mixed; boundary="===============7940536904907491276=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxcrypt-compat,libxcrypt: upgrading to 4.4.38,4.4.38 FAILED
Message-ID: <0101019509a15e77-4b93ebd5-fbac-437e-843a-8fbf5d257582-000000@us-west-2.amazonses.com>
Date: Sat, 15 Feb 2025 12:42:05 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 12:42:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211395

--===============7940536904907491276==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libxcrypt-compat,libxcrypt* to *4.4.38,4.4.38* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libxcrypt-compat-libxcrypt-upgrade-4.4.37-4.4.38-4.4.patch
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
From 8136917141a5022294714c72cb3354a12609edb9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Feb 2025 05:05:51 +0000
Subject: [PATCH] libxcrypt-compat,libxcrypt: upgrade 4.4.37 -> 4.4.38,4.4.37
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
index 879950bbe3..6e91efe1ff 100644
--- a/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch
+++ b/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch
@@ -1,4 +1,4 @@
-From 1e94a03541e35718dc1eaa8023e0ec3cf2de369b Mon Sep 17 00:00:00 2001
+From 9670e74ad2175356637af20be3a98b5714cbfe16 Mon Sep 17 00:00:00 2001
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


--===============7940536904907491276==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (0 cached, 916 parsed). 1870 targets, 49 skipped, 0 masked, 0 errors.
Removing 7 recipes from the core2-64 sysroot...done.
Removing 6 recipes from the qemux86_64 sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'libxcrypt'
libxcrypt was skipped: PREFERRED_PROVIDER_virtual/crypt set to musl, not libxcrypt
libxcrypt was skipped: PREFERRED_PROVIDER_virtual/crypt set to musl, not libxcrypt

--===============7940536904907491276==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libxcrypt-compat: PV changed from "4.4.37" to "4.4.38"
packages/core2-64-poky-linux/libxcrypt-compat: PKGV changed from 4.4.37 [default] to 4.4.38 [default]
packages/core2-64-poky-linux/libxcrypt-compat/libxcrypt-compat-dbg: PKGSIZE changed from 482024 to 481896 (-0%)
packages/core2-64-poky-linux/libxcrypt-compat/libxcrypt-compat-dbg: PV changed from "4.4.37" to "4.4.38"
packages/core2-64-poky-linux/libxcrypt-compat/libxcrypt-compat-dbg: PKGV changed from 4.4.37 [default] to 4.4.38 [default]
packages/core2-64-poky-linux/libxcrypt-compat/libxcrypt-compat-dev: PV changed from "4.4.37" to "4.4.38"
packages/core2-64-poky-linux/libxcrypt-compat/libxcrypt-compat-dev: PKGV changed from 4.4.37 [default] to 4.4.38 [default]
packages/core2-64-poky-linux/libxcrypt-compat/libxcrypt-compat-doc: PV changed from "4.4.37" to "4.4.38"
packages/core2-64-poky-linux/libxcrypt-compat/libxcrypt-compat-doc: PKGV changed from 4.4.37 [default] to 4.4.38 [default]
packages/core2-64-poky-linux/libxcrypt-compat/libxcrypt-compat-locale: PV changed from "4.4.37" to "4.4.38"
packages/core2-64-poky-linux/libxcrypt-compat/libxcrypt-compat-locale: PKGV changed from 4.4.37 [default] to 4.4.38 [default]
packages/core2-64-poky-linux/libxcrypt-compat/libxcrypt-compat-src: PKGSIZE changed from 753264 to 753262 (-0%)
packages/core2-64-poky-linux/libxcrypt-compat/libxcrypt-compat-src: PV changed from "4.4.37" to "4.4.38"
packages/core2-64-poky-linux/libxcrypt-compat/libxcrypt-compat-src: PKGV changed from 4.4.37 [default] to 4.4.38 [default]
packages/core2-64-poky-linux/libxcrypt-compat/libxcrypt-compat-staticdev: PV changed from "4.4.37" to "4.4.38"
packages/core2-64-poky-linux/libxcrypt-compat/libxcrypt-compat-staticdev: PKGV changed from 4.4.37 [default] to 4.4.38 [default]
packages/core2-64-poky-linux/libxcrypt-compat/libxcrypt-compat: PV changed from "4.4.37" to "4.4.38"
packages/core2-64-poky-linux/libxcrypt-compat/libxcrypt-compat: PKGV changed from 4.4.37 [default] to 4.4.38 [default]
packages/core2-64-poky-linux/libxcrypt: PV changed from "4.4.37" to "4.4.38"
packages/core2-64-poky-linux/libxcrypt: PKGV changed from 4.4.37 [default] to 4.4.38 [default]
packages/core2-64-poky-linux/libxcrypt/libxcrypt-dbg: PKGSIZE changed from 474344 to 474224 (-0%)
packages/core2-64-poky-linux/libxcrypt/libxcrypt-dbg: PV changed from "4.4.37" to "4.4.38"
packages/core2-64-poky-linux/libxcrypt/libxcrypt-dbg: PKGV changed from 4.4.37 [default] to 4.4.38 [default]
packages/core2-64-poky-linux/libxcrypt/libxcrypt-dev: PV changed from "4.4.37" to "4.4.38"
packages/core2-64-poky-linux/libxcrypt/libxcrypt-dev: PKGV changed from 4.4.37 [default] to 4.4.38 [default]
packages/core2-64-poky-linux/libxcrypt/libxcrypt-doc: PV changed from "4.4.37" to "4.4.38"
packages/core2-64-poky-linux/libxcrypt/libxcrypt-doc: PKGV changed from 4.4.37 [default] to 4.4.38 [default]
packages/core2-64-poky-linux/libxcrypt/libxcrypt-locale: PV changed from "4.4.37" to "4.4.38"
packages/core2-64-poky-linux/libxcrypt/libxcrypt-locale: PKGV changed from 4.4.37 [default] to 4.4.38 [default]
packages/core2-64-poky-linux/libxcrypt/libxcrypt-src: PKGSIZE changed from 746579 to 746577 (-0%)
packages/core2-64-poky-linux/libxcrypt/libxcrypt-src: PV changed from "4.4.37" to "4.4.38"
packages/core2-64-poky-linux/libxcrypt/libxcrypt-src: PKGV changed from 4.4.37 [default] to 4.4.38 [default]
packages/core2-64-poky-linux/libxcrypt/libxcrypt-staticdev: PV changed from "4.4.37" to "4.4.38"
packages/core2-64-poky-linux/libxcrypt/libxcrypt-staticdev: PKGV changed from 4.4.37 [default] to 4.4.38 [default]
packages/core2-64-poky-linux/libxcrypt/libxcrypt: PV changed from "4.4.37" to "4.4.38"
packages/core2-64-poky-linux/libxcrypt/libxcrypt: PKGV changed from 4.4.37 [default] to 4.4.38 [default]

--===============7940536904907491276==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxcrypt-compat-libxcrypt-upgrade-4.4.37-4.4.38-4.4.patch"

RnJvbSA4MTM2OTE3MTQxYTUwMjIyOTQ3MTRjNzJjYjMzNTRhMTI2MDllZGI5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgRmViIDIwMjUgMDU6MDU6NTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ4Y3J5cHQtY29tcGF0LGxpYnhjcnlwdDogdXBncmFkZSA0LjQuMzcgLT4gNC40LjM4LDQuNC4z
NwogLT4gNC40LjM4CgotLS0KIG1ldGEvcmVjaXBlcy1jb3JlL2xpYnhjcnlwdC9maWxlcy9maXhf
Y2ZsYWdzX2hhbmRsaW5nLnBhdGNoICAgICB8IDIgKy0KIC4uLi97bGlieGNyeXB0LWNvbXBhdF80
LjQuMzcuYmIgPT4gbGlieGNyeXB0LWNvbXBhdF80LjQuMzguYmJ9ICB8IDAKIG1ldGEvcmVjaXBl
cy1jb3JlL2xpYnhjcnlwdC9saWJ4Y3J5cHQuaW5jICAgICAgICAgICAgICAgICAgICAgICB8IDIg
Ky0KIC4uLi9saWJ4Y3J5cHQve2xpYnhjcnlwdF80LjQuMzcuYmIgPT4gbGlieGNyeXB0XzQuNC4z
OC5iYn0gICAgICB8IDAKIDQgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb3JlL2xpYnhjcnlwdC97bGlieGNyeXB0LWNv
bXBhdF80LjQuMzcuYmIgPT4gbGlieGNyeXB0LWNvbXBhdF80LjQuMzguYmJ9ICgxMDAlKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1jb3JlL2xpYnhjcnlwdC97bGlieGNyeXB0XzQuNC4zNy5iYiA9PiBs
aWJ4Y3J5cHRfNC40LjM4LmJifSAoMTAwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29y
ZS9saWJ4Y3J5cHQvZmlsZXMvZml4X2NmbGFnc19oYW5kbGluZy5wYXRjaCBiL21ldGEvcmVjaXBl
cy1jb3JlL2xpYnhjcnlwdC9maWxlcy9maXhfY2ZsYWdzX2hhbmRsaW5nLnBhdGNoCmluZGV4IDg3
OTk1MGJiZTMuLjZlOTFlZmUxZmYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhj
cnlwdC9maWxlcy9maXhfY2ZsYWdzX2hhbmRsaW5nLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1j
b3JlL2xpYnhjcnlwdC9maWxlcy9maXhfY2ZsYWdzX2hhbmRsaW5nLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSAxZTk0YTAzNTQxZTM1NzE4ZGMxZWFhODAyM2UwZWMzY2YyZGUzNjliIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA5NjcwZTc0YWQyMTc1MzU2NjM3YWYyMGJlM2E5OGI1
NzE0Y2JmZTE2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUg
PHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+CiBEYXRlOiBGcmksIDMwIEFwciAy
MDIxIDEwOjM1OjAyICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIGxpYnhjcnlwdDogVXBkYXRlIHRv
IDQuNC4xOSByZWxlYXNlIGFuZCBmaXggc3ltYm9sIHZlcnNpb24KZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1jb3JlL2xpYnhjcnlwdC9saWJ4Y3J5cHQtY29tcGF0XzQuNC4zNy5iYiBiL21ldGEv
cmVjaXBlcy1jb3JlL2xpYnhjcnlwdC9saWJ4Y3J5cHQtY29tcGF0XzQuNC4zOC5iYgpzaW1pbGFy
aXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvbGlieGNyeXB0L2xp
YnhjcnlwdC1jb21wYXRfNC40LjM3LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS9saWJ4
Y3J5cHQvbGlieGNyeXB0LWNvbXBhdF80LjQuMzguYmIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1jb3JlL2xpYnhjcnlwdC9saWJ4Y3J5cHQuaW5jIGIvbWV0YS9yZWNpcGVzLWNvcmUvbGlieGNy
eXB0L2xpYnhjcnlwdC5pbmMKaW5kZXggOWVjYjMzM2ZiOS4uMjQ3NDk5NTY1ZCAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWNvcmUvbGlieGNyeXB0L2xpYnhjcnlwdC5pbmMKKysrIGIvbWV0YS9y
ZWNpcGVzLWNvcmUvbGlieGNyeXB0L2xpYnhjcnlwdC5pbmMKQEAgLTEyLDcgKzEyLDcgQEAgaW5o
ZXJpdCBhdXRvdG9vbHMgcGtnY29uZmlnCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vYmVz
c2VyODIvbGlieGNyeXB0LmdpdDticmFuY2g9JHtTUkNCUkFOQ0h9O3Byb3RvY29sPWh0dHBzIFwK
ICAgICAgICAgICAgZmlsZTovL2ZpeF9jZmxhZ3NfaGFuZGxpbmcucGF0Y2ggXAogICAgICAgICAg
ICAiCi1TUkNSRVYgPSAiZTU3MTRkMWYwYTQ3N2Y5MWNlMzk4NmZhNjM2NTFjNzcxMGYwZTE4MyIK
K1NSQ1JFViA9ICI1NWVhNzc3ZThkNTY3ZTVlODZmZmFjOTE3YzI4ODE1YWM1NGNjMzQxIgogU1JD
QlJBTkNIID89ICJtYXN0ZXIiCiAKIFBST1ZJREVTID0gInZpcnR1YWwvY3J5cHQiCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtY29yZS9saWJ4Y3J5cHQvbGlieGNyeXB0XzQuNC4zNy5iYiBiL21l
dGEvcmVjaXBlcy1jb3JlL2xpYnhjcnlwdC9saWJ4Y3J5cHRfNC40LjM4LmJiCnNpbWlsYXJpdHkg
aW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29yZS9saWJ4Y3J5cHQvbGlieGNy
eXB0XzQuNC4zNy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvcmUvbGlieGNyeXB0L2xpYnhj
cnlwdF80LjQuMzguYmIKLS0gCjIuNDQuMQoK

--===============7940536904907491276==--

