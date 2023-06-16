Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32823C3DA46
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:30 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.845.1686887486026951063
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=biqMnQhN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010188c2544fc6-5ca48c87-6339-4954-abf5-7cd14de3c536-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887485;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=E41lrkfoOX0WIe0Lhyftr6O0/cBTjcrz1Bmg1EubcHU=;
	b=biqMnQhNl5ABDDNfrbHKQGQ2opCMAA3I1S58XeMH1RZZ1nTF+3xIxizTXVicjRj9
	vNO3s0SG9y0zA0jnntm4rF32RcZssYv/oRkiqnvpF86gvcE9QGfF5vl/tY8UL937WtX
	Tjx76RY25X2NYtjsYvnpdk83dldFl+ZLNZGztNuc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887485;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=E41lrkfoOX0WIe0Lhyftr6O0/cBTjcrz1Bmg1EubcHU=;
	b=qw3G+0nsNJQB55Re3/C8gaCpeFRh+ivARsWzHa6u5TrwtmxE5phV0RF8pybijQXb
	fgzhObLWCFfRAzFqwdh1wLiZfp5Xo9D4DAhPvakSdqZX988S0hvEtdoignn1R1mn/tY
	M9bbmeoBihO+fmH3uW8teNyPglRkOjdtDgeR9lGY=
Content-Type: multipart/mixed; boundary="===============1564687769686946721=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxslt: upgrading to 1.1.38 SUCCEEDED
Message-ID: <01010188c2544fc6-5ca48c87-6339-4954-abf5-7cd14de3c536-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182994

--===============1564687769686946721==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libxslt* to *1.1.38* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxslt-upgrade-1.1.37-1.1.38.patch
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
From a8fabe79b7022713fdacce1b1016ff656c426252 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 16 Jun 2023 00:18:22 +0000
Subject: [PATCH] libxslt: upgrade 1.1.37 -> 1.1.38

---
 .../libxslt/{libxslt_1.1.37.bb => libxslt_1.1.38.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libxslt/{libxslt_1.1.37.bb => libxslt_1.1.38.bb} (95%)

diff --git a/meta/recipes-support/libxslt/libxslt_1.1.37.bb b/meta/recipes-support/libxslt/libxslt_1.1.38.bb
similarity index 95%
rename from meta/recipes-support/libxslt/libxslt_1.1.37.bb
rename to meta/recipes-support/libxslt/libxslt_1.1.38.bb
index 361bb0f8dc..bf35a94b7f 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.37.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.38.bb
@@ -15,7 +15,7 @@ DEPENDS = "libxml2"
 
 SRC_URI = "https://download.gnome.org/sources/libxslt/1.1/libxslt-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "3a4b27dc8027ccd6146725950336f1ec520928f320f144eb5fa7990ae6123ab4"
+SRC_URI[sha256sum] = "1f32450425819a09acaff2ab7a5a7f8a2ec7956e505d7beeb45e843d0e1ecab1"
 
 UPSTREAM_CHECK_REGEX = "libxslt-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.39.2


--===============1564687769686946721==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxslt-upgrade-1.1.37-1.1.38.patch"

RnJvbSBhOGZhYmU3OWI3MDIyNzEzZmRhY2NlMWIxMDE2ZmY2NTZjNDI2MjUyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTYgSnVuIDIwMjMgMDA6MTg6MjIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ4c2x0OiB1cGdyYWRlIDEuMS4zNyAtPiAxLjEuMzgKCi0tLQogLi4uL2xpYnhzbHQve2xpYnhz
bHRfMS4xLjM3LmJiID0+IGxpYnhzbHRfMS4xLjM4LmJifSAgICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvbGlieHNsdC97bGlieHNsdF8xLjEuMzcuYmIgPT4gbGlieHNsdF8xLjEu
MzguYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlieHNsdC9s
aWJ4c2x0XzEuMS4zNy5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnhzbHQvbGlieHNsdF8x
LjEuMzguYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1
cHBvcnQvbGlieHNsdC9saWJ4c2x0XzEuMS4zNy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1
cHBvcnQvbGlieHNsdC9saWJ4c2x0XzEuMS4zOC5iYgppbmRleCAzNjFiYjBmOGRjLi5iZjM1YTk0
YjdmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJ4c2x0L2xpYnhzbHRfMS4x
LjM3LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnhzbHQvbGlieHNsdF8xLjEuMzgu
YmIKQEAgLTE1LDcgKzE1LDcgQEAgREVQRU5EUyA9ICJsaWJ4bWwyIgogCiBTUkNfVVJJID0gImh0
dHBzOi8vZG93bmxvYWQuZ25vbWUub3JnL3NvdXJjZXMvbGlieHNsdC8xLjEvbGlieHNsdC0ke1BW
fS50YXIueHoiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIzYTRiMjdkYzgwMjdjY2Q2MTQ2NzI1
OTUwMzM2ZjFlYzUyMDkyOGYzMjBmMTQ0ZWI1ZmE3OTkwYWU2MTIzYWI0IgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjFmMzI0NTA0MjU4MTlhMDlhY2FmZjJhYjdhNWE3ZjhhMmVjNzk1NmU1MDVkN2Jl
ZWI0NWU4NDNkMGUxZWNhYjEiCiAKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gImxpYnhzbHQtKD9Q
PHB2ZXI+XGQrKFwuXGQrKSspXC50YXIiCiAKLS0gCjIuMzkuMgoK

--===============1564687769686946721==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libxslt: PKGV changed from 1.1.37 [default] to 1.1.38 [default]
packages/core2-32-poky-linux/libxslt: PV changed from "1.1.37" to "1.1.38"
packages/core2-32-poky-linux/libxslt: SRC_URI changed from "https://download.gnome.org/sources/libxslt/1.1/libxslt-1.1.37.tar.xz" to "https://download.gnome.org/sources/libxslt/1.1/libxslt-1.1.38.tar.xz"
packages/core2-32-poky-linux/libxslt/libxslt-bin: PKGV changed from 1.1.37 [default] to 1.1.38 [default]
packages/core2-32-poky-linux/libxslt/libxslt-bin: PV changed from "1.1.37" to "1.1.38"
packages/core2-32-poky-linux/libxslt/libxslt-dbg: FILELIST: removed "/usr/lib/.debug/libexslt.so.0.8.20 /usr/lib/.debug/libxslt.so.1.1.37", added "/usr/lib/.debug/libxslt.so.1.1.38 /usr/lib/.debug/libexslt.so.0.8.21"
packages/core2-32-poky-linux/libxslt/libxslt-dbg: PKGV changed from 1.1.37 [default] to 1.1.38 [default]
packages/core2-32-poky-linux/libxslt/libxslt-dbg: PV changed from "1.1.37" to "1.1.38"
packages/core2-32-poky-linux/libxslt/libxslt-dbg: PKGSIZE changed from 874144 to 870432 (-0%)
packages/core2-32-poky-linux/libxslt/libxslt-dev: PKGV changed from 1.1.37 [default] to 1.1.38 [default]
packages/core2-32-poky-linux/libxslt/libxslt-dev: PV changed from "1.1.37" to "1.1.38"
packages/core2-32-poky-linux/libxslt/libxslt-dev: PKGSIZE changed from 133900 to 134366 (+0%)
packages/core2-32-poky-linux/libxslt/libxslt-doc: PKGV changed from 1.1.37 [default] to 1.1.38 [default]
packages/core2-32-poky-linux/libxslt/libxslt-doc: PV changed from "1.1.37" to "1.1.38"
packages/core2-32-poky-linux/libxslt/libxslt-doc: PKGSIZE changed from 602412 to 605519 (+1%)
packages/core2-32-poky-linux/libxslt/libxslt-locale: PKGV changed from 1.1.37 [default] to 1.1.38 [default]
packages/core2-32-poky-linux/libxslt/libxslt-locale: PV changed from "1.1.37" to "1.1.38"
packages/core2-32-poky-linux/libxslt/libxslt-src: PKGV changed from 1.1.37 [default] to 1.1.38 [default]
packages/core2-32-poky-linux/libxslt/libxslt-src: PV changed from "1.1.37" to "1.1.38"
packages/core2-32-poky-linux/libxslt/libxslt-src: PKGSIZE changed from 1286109 to 1297537 (+1%)
packages/core2-32-poky-linux/libxslt/libxslt-staticdev: PKGV changed from 1.1.37 [default] to 1.1.38 [default]
packages/core2-32-poky-linux/libxslt/libxslt-staticdev: PV changed from "1.1.37" to "1.1.38"
packages/core2-32-poky-linux/libxslt/libxslt: FILELIST: removed "/usr/lib/libxslt.so.1.1.37 /usr/lib/libexslt.so.0.8.20", added "/usr/lib/libexslt.so.0.8.21 /usr/lib/libxslt.so.1.1.38"
packages/core2-32-poky-linux/libxslt/libxslt: PKGV changed from 1.1.37 [default] to 1.1.38 [default]
packages/core2-32-poky-linux/libxslt/libxslt: PV changed from "1.1.37" to "1.1.38"
Changes to packages/core2-32-poky-linux/libxslt (sysroot):
  /usr/lib/libexslt.so.0 changed symlink target from libexslt.so.0.8.20 to libexslt.so.0.8.21
  /usr/lib/libexslt.so changed symlink target from libexslt.so.0.8.20 to libexslt.so.0.8.21
  /usr/lib/libxslt.so.1 changed symlink target from libxslt.so.1.1.37 to libxslt.so.1.1.38
  /usr/lib/libxslt.so changed symlink target from libxslt.so.1.1.37 to libxslt.so.1.1.38
  /usr/lib/libexslt.so.0.8.20 moved to /usr/lib/libexslt.so.0.8.21
  /usr/lib/libxslt.so.1.1.37 moved to /usr/lib/libxslt.so.1.1.38

--===============1564687769686946721==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libxslt/libxslt: FILELIST: removed "/usr/lib/libxslt.so.1.1.37 /usr/lib/libexslt.so.0.8.20", added "/usr/lib/libexslt.so.0.8.21 /usr/lib/libxslt.so.1.1.38"
Changes to packages/core2-32-poky-linux/libxslt (sysroot):
  /usr/lib/libexslt.so.0 changed symlink target from libexslt.so.0.8.20 to libexslt.so.0.8.21
  /usr/lib/libexslt.so changed symlink target from libexslt.so.0.8.20 to libexslt.so.0.8.21
  /usr/lib/libxslt.so.1 changed symlink target from libxslt.so.1.1.37 to libxslt.so.1.1.38
  /usr/lib/libxslt.so changed symlink target from libxslt.so.1.1.37 to libxslt.so.1.1.38
  /usr/lib/libexslt.so.0.8.20 moved to /usr/lib/libexslt.so.0.8.21
  /usr/lib/libxslt.so.1.1.37 moved to /usr/lib/libxslt.so.1.1.38

--===============1564687769686946721==--

