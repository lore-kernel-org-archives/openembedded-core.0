Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DE61C2FC1F
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:40 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.6016.1689456454098543581
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=BYgXtztr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101895b73a61d-4e2631ff-d229-404e-a748-d7db82262fb0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456453;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9aG7QM7nHXPFQtI+hDd7YmXqaOnXMeX5ba0ijJpwIE0=;
	b=BYgXtztrOr/szvH2aVAgkZR4zQ7U0oMdlflkY+6FRo73Aoo1PTcDKWcgzkglQ+UQ
	3fCmgAcc2RWtcOOX7cJgNEWFfOzsRiyttkKUlJv7VwSO1KloFGlA1sMfP68FEUq+NzJ
	Z2w+hbJBv3kOWprisDzcaveuFJLH+NkXOzSWzM7c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456453;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9aG7QM7nHXPFQtI+hDd7YmXqaOnXMeX5ba0ijJpwIE0=;
	b=qtOnPpRIOqw0ldGb/L0fMwIEy1lHXksI64EaZrKV8606Xga5e0mYJgvTSJcJix3L
	ojigC71h3gcViizBkCWWbWLqYRjpRm1oa9oeDKTNBaweoWiKi+pHrywe4qRAy4D3p51
	1zWma+Z0IKu5czlkv4Me1Dbd1aUb0z4iMnWgIa+4=
Content-Type: multipart/mixed; boundary="===============0601359675131904466=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxcrypt-compat: upgrading to 4.4.36 SUCCEEDED
Message-ID: <010101895b73a61d-4e2631ff-d229-404e-a748-d7db82262fb0-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184321

--===============0601359675131904466==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libxcrypt-compat* to *4.4.36* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxcrypt-compat-upgrade-4.4.35-4.4.36.patch
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
From 89a30c9e53406ef916d32279f19522e8e20d6c86 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 10:11:43 +0000
Subject: [PATCH] libxcrypt-compat: upgrade 4.4.35 -> 4.4.36

---
 .../{libxcrypt-compat_4.4.35.bb => libxcrypt-compat_4.4.36.bb}  | 0
 meta/recipes-core/libxcrypt/libxcrypt.inc                       | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/libxcrypt/{libxcrypt-compat_4.4.35.bb => libxcrypt-compat_4.4.36.bb} (100%)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.35.bb b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.36.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.35.bb
rename to meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.36.bb
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index e70e8859b1..ba93d91aef 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSING;md5=c0a30e2b1502c55a7f37e412cd6c6a4b \
 inherit autotools pkgconfig
 
 SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH};protocol=https"
-SRCREV = "321222c91c4060362b1085b3ca7c29867812ac0a"
+SRCREV = "f531a36aa916a22ef2ce7d270ba381e264250cbf"
 SRCBRANCH ?= "master"
 
 SRC_URI += "file://fix_cflags_handling.patch"
-- 
2.39.2


--===============0601359675131904466==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libxcrypt-compat: PV changed from "4.4.35" to "4.4.36"
packages/core2-32-poky-linux/libxcrypt-compat: PKGV changed from 4.4.35 [default] to 4.4.36 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-dbg: PV changed from "4.4.35" to "4.4.36"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-dbg: PKGV changed from 4.4.35 [default] to 4.4.36 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-dev: PV changed from "4.4.35" to "4.4.36"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-dev: PKGV changed from 4.4.35 [default] to 4.4.36 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-doc: PV changed from "4.4.35" to "4.4.36"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-doc: PKGV changed from 4.4.35 [default] to 4.4.36 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-locale: PV changed from "4.4.35" to "4.4.36"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-locale: PKGV changed from 4.4.35 [default] to 4.4.36 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-src: PV changed from "4.4.35" to "4.4.36"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-src: PKGV changed from 4.4.35 [default] to 4.4.36 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-staticdev: PV changed from "4.4.35" to "4.4.36"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-staticdev: PKGV changed from 4.4.35 [default] to 4.4.36 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat: PV changed from "4.4.35" to "4.4.36"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat: PKGV changed from 4.4.35 [default] to 4.4.36 [default]

--===============0601359675131904466==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxcrypt-compat-upgrade-4.4.35-4.4.36.patch"

RnJvbSA4OWEzMGM5ZTUzNDA2ZWY5MTZkMzIyNzlmMTk1MjJlOGUyMGQ2Yzg2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMTA6MTE6NDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ4Y3J5cHQtY29tcGF0OiB1cGdyYWRlIDQuNC4zNSAtPiA0LjQuMzYKCi0tLQogLi4uL3tsaWJ4
Y3J5cHQtY29tcGF0XzQuNC4zNS5iYiA9PiBsaWJ4Y3J5cHQtY29tcGF0XzQuNC4zNi5iYn0gIHwg
MAogbWV0YS9yZWNpcGVzLWNvcmUvbGlieGNyeXB0L2xpYnhjcnlwdC5pbmMgICAgICAgICAgICAg
ICAgICAgICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb3JlL2xpYnhjcnlwdC97bGlieGNyeXB0LWNv
bXBhdF80LjQuMzUuYmIgPT4gbGlieGNyeXB0LWNvbXBhdF80LjQuMzYuYmJ9ICgxMDAlKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhjcnlwdC9saWJ4Y3J5cHQtY29tcGF0XzQu
NC4zNS5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhjcnlwdC9saWJ4Y3J5cHQtY29tcGF0XzQu
NC4zNi5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNv
cmUvbGlieGNyeXB0L2xpYnhjcnlwdC1jb21wYXRfNC40LjM1LmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtY29yZS9saWJ4Y3J5cHQvbGlieGNyeXB0LWNvbXBhdF80LjQuMzYuYmIKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhjcnlwdC9saWJ4Y3J5cHQuaW5jIGIvbWV0YS9yZWNp
cGVzLWNvcmUvbGlieGNyeXB0L2xpYnhjcnlwdC5pbmMKaW5kZXggZTcwZTg4NTliMS4uYmE5M2Q5
MWFlZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvbGlieGNyeXB0L2xpYnhjcnlwdC5p
bmMKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvbGlieGNyeXB0L2xpYnhjcnlwdC5pbmMKQEAgLTEw
LDcgKzEwLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TSU5HO21kNT1jMGEz
MGUyYjE1MDJjNTVhN2YzN2U0MTJjZDZjNmE0YiBcCiBpbmhlcml0IGF1dG90b29scyBwa2djb25m
aWcKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL2Jlc3NlcjgyL2xpYnhjcnlwdC5naXQ7
YnJhbmNoPSR7U1JDQlJBTkNIfTtwcm90b2NvbD1odHRwcyIKLVNSQ1JFViA9ICIzMjEyMjJjOTFj
NDA2MDM2MmIxMDg1YjNjYTdjMjk4Njc4MTJhYzBhIgorU1JDUkVWID0gImY1MzFhMzZhYTkxNmEy
MmVmMmNlN2QyNzBiYTM4MWUyNjQyNTBjYmYiCiBTUkNCUkFOQ0ggPz0gIm1hc3RlciIKIAogU1JD
X1VSSSArPSAiZmlsZTovL2ZpeF9jZmxhZ3NfaGFuZGxpbmcucGF0Y2giCi0tIAoyLjM5LjIKCg==

--===============0601359675131904466==--

