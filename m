Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F047BC02187
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 10:26:07 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.17860.1736936760080810099
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 02:26:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=JS2HJUdF;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=LiVQt59H;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010194697f9f7a-d4bb3450-54ce-40dd-b3cf-6f2ae6dbd2e0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1736936759;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=QrUNf2Ht2D6z+FWjZreNhwKcY/yb3QIm3nS5SGFv0pg=;
	b=JS2HJUdFbs0iIA9d/W8tEpZkUBFeNgy8UAA7wFLcI+bd6XK1tk/1AhEpZshFzbDs
	7zBLVWDCrL1XtGsrpErrKFaRUxH8mzMN3VTgPVod7wIaZJZMT7lZTp5jlaNJQT4zOE3
	TwhzhzWg+Z8oSoTFsGXcoTY/kr9lPnvP4ZrVhQsM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1736936759;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=QrUNf2Ht2D6z+FWjZreNhwKcY/yb3QIm3nS5SGFv0pg=;
	b=LiVQt59HEuY9owOyzf1O8BeGx/vHtbnO1I1IwBQ30OmJdrIDo7bhSuGCiJ6/5Ox6
	MXfdu9lCr5yzU80NEEmf3YKlqoUjk2/xdrd3e7dqNmQHa4KFkVswpOva2X2pmPlT1iL
	QgaqI5hUYx8xT0b0DEh0j86wggRmVU3ujEEDcY1c=
Content-Type: multipart/mixed; boundary="===============5454787359836787277=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxcrypt,libxcrypt-compat: upgrading to 4.4.38,4.4.38 FAILED
Message-ID: <01010194697f9f7a-d4bb3450-54ce-40dd-b3cf-6f2ae6dbd2e0-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jan 2025 10:25:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 10:26:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209825

--===============5454787359836787277==
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
From 90d85bda89b83f6b759c317886aacc11def2d4b3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jan 2025 05:05:53 +0000
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
index 879950bbe3..5035b153b1 100644
--- a/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch
+++ b/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch
@@ -1,4 +1,4 @@
-From 1e94a03541e35718dc1eaa8023e0ec3cf2de369b Mon Sep 17 00:00:00 2001
+From 8b05aef488f0e466bf3891a85aee97f1a74d5a46 Mon Sep 17 00:00:00 2001
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


--===============5454787359836787277==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxcrypt-libxcrypt-compat-upgrade-4.4.37-4.4.38-4.4.patch"

RnJvbSA5MGQ4NWJkYTg5YjgzZjZiNzU5YzMxNzg4NmFhY2MxMWRlZjJkNGIzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgSmFuIDIwMjUgMDU6MDU6NTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ4Y3J5cHQsbGlieGNyeXB0LWNvbXBhdDogdXBncmFkZSA0LjQuMzcgLT4gNC40LjM4LDQuNC4z
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
OTk1MGJiZTMuLjUwMzViMTUzYjEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhj
cnlwdC9maWxlcy9maXhfY2ZsYWdzX2hhbmRsaW5nLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1j
b3JlL2xpYnhjcnlwdC9maWxlcy9maXhfY2ZsYWdzX2hhbmRsaW5nLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSAxZTk0YTAzNTQxZTM1NzE4ZGMxZWFhODAyM2UwZWMzY2YyZGUzNjliIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4YjA1YWVmNDg4ZjBlNDY2YmYzODkxYTg1YWVlOTdm
MWE3NGQ1YTQ2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUg
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

--===============5454787359836787277==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libxcrypt-compat: PKGV changed from 4.4.37 [default] to 4.4.38 [default]
packages/core2-64-poky-linux/libxcrypt-compat: PV changed from "4.4.37" to "4.4.38"
packages/core2-64-poky-linux/libxcrypt-compat/libxcrypt-compat-dbg: PKGSIZE changed from 573280 to 573152 (-0%)
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
packages/core2-64-poky-linux/libxcrypt: PKGV changed from 4.4.37 [default] to 4.4.38 [default]
packages/core2-64-poky-linux/libxcrypt: PV changed from "4.4.37" to "4.4.38"
packages/core2-64-poky-linux/libxcrypt/libxcrypt-dbg: PKGSIZE changed from 565368 to 565240 (-0%)
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

--===============5454787359836787277==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 919 .bb files complete (0 cached, 919 parsed). 1875 targets, 52 skipped, 0 masked, 0 errors.
Removing 7 recipes from the core2-64 sysroot...done.
Removing 6 recipes from the qemux86_64 sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'libxcrypt'
libxcrypt was skipped: PREFERRED_PROVIDER_virtual/crypt set to musl, not libxcrypt
libxcrypt was skipped: PREFERRED_PROVIDER_virtual/crypt set to musl, not libxcrypt

--===============5454787359836787277==--

