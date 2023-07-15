Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B06C4C27C56
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:39 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.5952.1689456455566258809
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=W16+8cWj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101895b73ad4c-9df43101-9ac9-4bff-89bc-c60e2c10d849-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456455;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1lFCJQRydJS2Bn1B4CYbz+i/tlUqd08fiafeIrgS/zU=;
	b=W16+8cWjYiHzq2j4C1IhncIjD4Fy5s5CIBVd9/tHtspRWFlRygMbI0eA9wXrqQD8
	9aNS3avKE0Hkww6Eg8afb6ZB/lLnVUMhdXWX8x/H2M9zkXctUz/2RKGCCrsRmNOeHsA
	lAyYKdkcVlqyZPcPXRSmKCPxEZZ0y1kD/dXsgWWo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456455;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1lFCJQRydJS2Bn1B4CYbz+i/tlUqd08fiafeIrgS/zU=;
	b=XsxG0FJqtIYKvizja9SzWz/PoyJYY+5Ld/2CHX/assvxMsID/8bYifyznepsMz3z
	SVM/6xdKBusDfXPsRoXIGsq6t/IMpoPEKxX6e+bMxGGUREi0Qjbv/IkDOBFWtvEJk7U
	bFxmaPYsMWiUVDz4rTDzdnPEPf5qzq4xa2EBNbaY=
Content-Type: multipart/mixed; boundary="===============5625034510873139703=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libnss-nis: upgrading to 3.2 SUCCEEDED
Message-ID: <010101895b73ad4c-9df43101-9ac9-4bff-89bc-c60e2c10d849-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:34 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184354

--===============5625034510873139703==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libnss-nis* to *3.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libnss-nis-upgrade-3.1-3.2.patch
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
From 0bfe5b6bea262a2c83fce9630bb9cb503bf78de8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 15:27:36 +0000
Subject: [PATCH] libnss-nis: upgrade 3.1 -> 3.2

---
 meta/recipes-extended/libnss-nis/libnss-nis.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/libnss-nis/libnss-nis.bb b/meta/recipes-extended/libnss-nis/libnss-nis.bb
index d0afb3ca0a..f0e687c330 100644
--- a/meta/recipes-extended/libnss-nis/libnss-nis.bb
+++ b/meta/recipes-extended/libnss-nis/libnss-nis.bb
@@ -13,9 +13,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 DEPENDS += "libtirpc libnsl2"
 
-PV = "3.1+git${SRCPV}"
+PV = "3.2"
 
-SRCREV = "062f31999b35393abf7595cb89dfc9590d5a42ad"
+SRCREV = "cd0d391af9535b56e612ed227c1b89be269f3d59"
 
 SRC_URI = "git://github.com/thkukuk/libnss_nis;branch=master;protocol=https \
           "
-- 
2.39.2


--===============5625034510873139703==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libnss-nis-upgrade-3.1-3.2.patch"

RnJvbSAwYmZlNWI2YmVhMjYyYTJjODNmY2U5NjMwYmI5Y2I1MDNiZjc4ZGU4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMTU6Mjc6MzYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJuc3MtbmlzOiB1cGdyYWRlIDMuMSAtPiAzLjIKCi0tLQogbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L2xpYm5zcy1uaXMvbGlibnNzLW5pcy5iYiB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvbGlibnNzLW5pcy9saWJuc3MtbmlzLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xp
Ym5zcy1uaXMvbGlibnNzLW5pcy5iYgppbmRleCBkMGFmYjNjYTBhLi5mMGU2ODdjMzMwIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlibnNzLW5pcy9saWJuc3MtbmlzLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJuc3MtbmlzL2xpYm5zcy1uaXMuYmIKQEAgLTEz
LDkgKzEzLDkgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9NGZiZDY1
MzgwY2RkMjU1OTUxMDc5MDA4YjM2NDUxNmMiCiBTRUNUSU9OID0gImxpYnMiCiBERVBFTkRTICs9
ICJsaWJ0aXJwYyBsaWJuc2wyIgogCi1QViA9ICIzLjErZ2l0JHtTUkNQVn0iCitQViA9ICIzLjIi
CiAKLVNSQ1JFViA9ICIwNjJmMzE5OTliMzUzOTNhYmY3NTk1Y2I4OWRmYzk1OTBkNWE0MmFkIgor
U1JDUkVWID0gImNkMGQzOTFhZjk1MzViNTZlNjEyZWQyMjdjMWI4OWJlMjY5ZjNkNTkiCiAKIFNS
Q19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS90aGt1a3VrL2xpYm5zc19uaXM7YnJhbmNoPW1hc3Rl
cjtwcm90b2NvbD1odHRwcyBcCiAgICAgICAgICAgIgotLSAKMi4zOS4yCgo=

--===============5625034510873139703==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libnss-nis: PKGV changed from 3.1+gitAUTOINC+062f31999b [default] to 3.2 [default]
packages/core2-32-poky-linux/libnss-nis: PV changed from "3.1+gitAUTOINC+062f31999b" to "3.2"
packages/core2-32-poky-linux/libnss-nis/libnss-nis-dbg: PKGV changed from 3.1+git0+062f31999b to 3.2 [default]
packages/core2-32-poky-linux/libnss-nis/libnss-nis-dbg: PKGSIZE changed from 159256 to 158792 (-0%)
packages/core2-32-poky-linux/libnss-nis/libnss-nis-dbg: PV changed from "3.1+gitAUTOINC+062f31999b" to "3.2"
packages/core2-32-poky-linux/libnss-nis/libnss-nis-dev: PKGV changed from 3.1+git0+062f31999b to 3.2 [default]
packages/core2-32-poky-linux/libnss-nis/libnss-nis-dev: PV changed from "3.1+gitAUTOINC+062f31999b" to "3.2"
packages/core2-32-poky-linux/libnss-nis/libnss-nis-doc: PKGV changed from 3.1+git0+062f31999b to 3.2 [default]
packages/core2-32-poky-linux/libnss-nis/libnss-nis-doc: PV changed from "3.1+gitAUTOINC+062f31999b" to "3.2"
packages/core2-32-poky-linux/libnss-nis/libnss-nis-locale: PKGV changed from 3.1+git0+062f31999b to 3.2 [default]
packages/core2-32-poky-linux/libnss-nis/libnss-nis-locale: PV changed from "3.1+gitAUTOINC+062f31999b" to "3.2"
packages/core2-32-poky-linux/libnss-nis/libnss-nis-src: PKGV changed from 3.1+git0+062f31999b to 3.2 [default]
packages/core2-32-poky-linux/libnss-nis/libnss-nis-src: PKGSIZE changed from 127071 to 127010 (-0%)
packages/core2-32-poky-linux/libnss-nis/libnss-nis-src: PV changed from "3.1+gitAUTOINC+062f31999b" to "3.2"
packages/core2-32-poky-linux/libnss-nis/libnss-nis-staticdev: PKGV changed from 3.1+git0+062f31999b to 3.2 [default]
packages/core2-32-poky-linux/libnss-nis/libnss-nis-staticdev: PV changed from "3.1+gitAUTOINC+062f31999b" to "3.2"
packages/core2-32-poky-linux/libnss-nis/libnss-nis: PKGV changed from 3.1+git0+062f31999b to 3.2 [default]
packages/core2-32-poky-linux/libnss-nis/libnss-nis: PV changed from "3.1+gitAUTOINC+062f31999b" to "3.2"

--===============5625034510873139703==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libnss-nis/libnss-nis-dbg: PKGV changed from 3.1+git0+062f31999b to 3.2 [default]
packages/core2-32-poky-linux/libnss-nis/libnss-nis-dev: PKGV changed from 3.1+git0+062f31999b to 3.2 [default]
packages/core2-32-poky-linux/libnss-nis/libnss-nis-doc: PKGV changed from 3.1+git0+062f31999b to 3.2 [default]
packages/core2-32-poky-linux/libnss-nis/libnss-nis-locale: PKGV changed from 3.1+git0+062f31999b to 3.2 [default]
packages/core2-32-poky-linux/libnss-nis/libnss-nis-src: PKGV changed from 3.1+git0+062f31999b to 3.2 [default]
packages/core2-32-poky-linux/libnss-nis/libnss-nis-staticdev: PKGV changed from 3.1+git0+062f31999b to 3.2 [default]
packages/core2-32-poky-linux/libnss-nis/libnss-nis: PKGV changed from 3.1+git0+062f31999b to 3.2 [default]

--===============5625034510873139703==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1804 targets, 48 skipped, 0 masked, 0 errors.
Removing 16 recipes from the core2-32 sysroot...done.
Removing 59 recipes from the qemux86 sysroot...done.

Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'libnss-nis'
libnss-nis was skipped: incompatible with host i686-poky-linux-musl (not in COMPATIBLE_HOST)

--===============5625034510873139703==--

