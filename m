Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 600F5C2FC24
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:30 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.823.1686887485780580108
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Za58i2VN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010188c2544f30-869c25bf-fee9-4eb8-8000-504363dabae3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887485;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dbnYJfT7afgCE9IqXZlIkzXOaXIcsHc0C8QqC6VL6os=;
	b=Za58i2VNjCfMiWxxc2pE9LHH8oMpkXGaLDU9/K/2ZljJ3vBHQp1YfCsETL4hBLn2
	/HnhTTdBm/1/eZF9vOHw58sNJ9DOTdc1CNTK7AL39gNCWlgfY6Z53P1BZbziJjQV7qM
	zZO7GPzxyZkREZTKH1HWoL7C/bs0ISPUgHW7Vk+o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887485;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dbnYJfT7afgCE9IqXZlIkzXOaXIcsHc0C8QqC6VL6os=;
	b=RAbiV6U/CnBXn1A7mSEcfy+99tSPe5eD04yfJvMHuZ8lyUY5Uwk/l7241G20AAsr
	T8etfEiSs4GmWG6/PbZxhJNjD73f5a5ean6P0FIkJCWY+6S5O1rxSZAuuXDQbXkJTKU
	0MfIcV46Z2DdIvW+dZfhduIWbnAHulv7BLNrRhnQ=
Content-Type: multipart/mixed; boundary="===============5389798605655026948=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libmd: upgrading to 1.1.0 SUCCEEDED
Message-ID: <01010188c2544f30-869c25bf-fee9-4eb8-8000-504363dabae3-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182988

--===============5389798605655026948==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libmd* to *1.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libmd-upgrade-1.0.4-1.1.0.patch
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
From a81e48cf7a71ac05f0f56d20dd1e048baa15c98b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 23:58:39 +0000
Subject: [PATCH] libmd: upgrade 1.0.4 -> 1.1.0

---
 meta/recipes-support/libmd/{libmd_1.0.4.bb => libmd_1.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libmd/{libmd_1.0.4.bb => libmd_1.1.0.bb} (86%)

diff --git a/meta/recipes-support/libmd/libmd_1.0.4.bb b/meta/recipes-support/libmd/libmd_1.1.0.bb
similarity index 86%
rename from meta/recipes-support/libmd/libmd_1.0.4.bb
rename to meta/recipes-support/libmd/libmd_1.1.0.bb
index b93dc2d78d..dc588a0f95 100644
--- a/meta/recipes-support/libmd/libmd_1.0.4.bb
+++ b/meta/recipes-support/libmd/libmd_1.1.0.bb
@@ -9,7 +9,7 @@ LICENSE = "BSD-3-Clause & BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0436d4fb62a71f661d6e8b7812f9e1df"
 
 SRC_URI = "https://archive.hadrons.org/software/libmd/libmd-${PV}.tar.xz"
-SRC_URI[sha256sum] = "f51c921042e34beddeded4b75557656559cf5b1f2448033b4c1eec11c07e530f"
+SRC_URI[sha256sum] = "1bd6aa42275313af3141c7cf2e5b964e8b1fd488025caf2f971f43b00776b332"
 
 inherit autotools
 
-- 
2.39.2


--===============5389798605655026948==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libmd-upgrade-1.0.4-1.1.0.patch"

RnJvbSBhODFlNDhjZjdhNzFhYzA1ZjBmNTZkMjBkZDFlMDQ4YmFhMTVjOThiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMjM6NTg6MzkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJtZDogdXBncmFkZSAxLjAuNCAtPiAxLjEuMAoKLS0tCiBtZXRhL3JlY2lwZXMtc3VwcG9ydC9s
aWJtZC97bGlibWRfMS4wLjQuYmIgPT4gbGlibWRfMS4xLjAuYmJ9IHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LXN1cHBvcnQvbGlibWQve2xpYm1kXzEuMC40LmJiID0+IGxpYm1kXzEuMS4wLmJifSAoODYlKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYm1kL2xpYm1kXzEuMC40LmJiIGIv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlibWQvbGlibWRfMS4xLjAuYmIKc2ltaWxhcml0eSBpbmRl
eCA4NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlibWQvbGlibWRfMS4wLjQu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYm1kL2xpYm1kXzEuMS4wLmJiCmlu
ZGV4IGI5M2RjMmQ3OGQuLmRjNTg4YTBmOTUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBw
b3J0L2xpYm1kL2xpYm1kXzEuMC40LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYm1k
L2xpYm1kXzEuMS4wLmJiCkBAIC05LDcgKzksNyBAQCBMSUNFTlNFID0gIkJTRC0zLUNsYXVzZSAm
IEJTRC0yLUNsYXVzZSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTA0
MzZkNGZiNjJhNzFmNjYxZDZlOGI3ODEyZjllMWRmIgogCiBTUkNfVVJJID0gImh0dHBzOi8vYXJj
aGl2ZS5oYWRyb25zLm9yZy9zb2Z0d2FyZS9saWJtZC9saWJtZC0ke1BWfS50YXIueHoiCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiZjUxYzkyMTA0MmUzNGJlZGRlZGVkNGI3NTU1NzY1NjU1OWNmNWIx
ZjI0NDgwMzNiNGMxZWVjMTFjMDdlNTMwZiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIxYmQ2YWE0
MjI3NTMxM2FmMzE0MWM3Y2YyZTViOTY0ZThiMWZkNDg4MDI1Y2FmMmY5NzFmNDNiMDA3NzZiMzMy
IgogCiBpbmhlcml0IGF1dG90b29scwogCi0tIAoyLjM5LjIKCg==

--===============5389798605655026948==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libmd: SRC_URI changed from "https://archive.hadrons.org/software/libmd/libmd-1.0.4.tar.xz" to "https://archive.hadrons.org/software/libmd/libmd-1.1.0.tar.xz"
packages/core2-32-poky-linux/libmd: PV changed from "1.0.4" to "1.1.0"
packages/core2-32-poky-linux/libmd: PKGV changed from 1.0.4 [default] to 1.1.0 [default]
packages/core2-32-poky-linux/libmd/libmd-dbg: PV changed from "1.0.4" to "1.1.0"
packages/core2-32-poky-linux/libmd/libmd-dbg: PKGV changed from 1.0.4 [default] to 1.1.0 [default]
packages/core2-32-poky-linux/libmd/libmd-dbg: PKGSIZE changed from 86808 to 100804 (+16%)
packages/core2-32-poky-linux/libmd/libmd-dbg: FILELIST: removed "/usr/lib/.debug/libmd.so.0.0.5", added "/usr/lib/.debug/libmd.so.0.1.0"
packages/core2-32-poky-linux/libmd/libmd-dev: PV changed from "1.0.4" to "1.1.0"
packages/core2-32-poky-linux/libmd/libmd-dev: PKGV changed from 1.0.4 [default] to 1.1.0 [default]
packages/core2-32-poky-linux/libmd/libmd-dev: PKGSIZE changed from 20322 to 21568 (+6%)
packages/core2-32-poky-linux/libmd/libmd-doc: PV changed from "1.0.4" to "1.1.0"
packages/core2-32-poky-linux/libmd/libmd-doc: PKGV changed from 1.0.4 [default] to 1.1.0 [default]
packages/core2-32-poky-linux/libmd/libmd-doc: PKGSIZE changed from 36776 to 40012 (+9%)
packages/core2-32-poky-linux/libmd/libmd-doc: FILELIST: added "/usr/share/man/man7/libmd.7"
packages/core2-32-poky-linux/libmd/libmd-locale: PV changed from "1.0.4" to "1.1.0"
packages/core2-32-poky-linux/libmd/libmd-locale: PKGV changed from 1.0.4 [default] to 1.1.0 [default]
packages/core2-32-poky-linux/libmd/libmd-src: PV changed from "1.0.4" to "1.1.0"
packages/core2-32-poky-linux/libmd/libmd-src: PKGV changed from 1.0.4 [default] to 1.1.0 [default]
packages/core2-32-poky-linux/libmd/libmd-src: PKGSIZE changed from 95183 to 100942 (+6%)
packages/core2-32-poky-linux/libmd/libmd-src: FILELIST: directory renamed /usr/src/debug/libmd/1.0.4-r0/include -> /usr/src/debug/libmd/1.1.0-r0/include, removed "/usr/src/debug/libmd/1.0.4-r0/src/md2.c /usr/src/debug/libmd/1.0.4-r0/src/md5.c /usr/src/debug/libmd/1.0.4-r0/src/rmd160.c /usr/src/debug/libmd/1.0.4-r0/src/md4.c /usr/src/debug/libmd/1.0.4-r0/src/md2hl.c /usr/src/debug/libmd/1.0.4-r0/src/md4hl.c /usr/src/debug/libmd/1.0.4-r0/src/md5hl.c /usr/src/debug/libmd/1.0.4-r0/src/rmd160hl.c /usr/src/debug/libmd/1.0.4-r0/src/sha2.c /usr/src/debug/libmd/1.0.4-r0/src/sha256hl.c /usr/src/debug/libmd/1.0.4-r0/src/sha384hl.c /usr/src/debug/libmd/1.0.4-r0/src/sha1hl.c /usr/src/debug/libmd/1.0.4-r0/src/sha512hl.c /usr/src/debug/libmd/1.0.4-r0/src/sha1.c", added "/usr/src/debug/libmd/1.1.0-r0/src/md2.c /usr/src/debug/libmd/1.1.0-r0/src/md5.c /usr/src/debug/libmd/1.1.0-r0/src/sha512_256hl.c /usr/src/debug/libmd/1.1.0-r0/src/rmd160.c /usr/src/debug/libmd/1.1.0-r0/src/md4.c /usr/src/debug/libmd
 /1.1.0-r0/src/md2hl.c /usr/src/debug/libmd/1.1.0-r0/src/md4hl.c /usr/src/debug/libmd/1.1.0-r0/src/md5hl.c /usr/src/debug/libmd/1.1.0-r0/src/rmd160hl.c /usr/src/debug/libmd/1.1.0-r0/src/sha2.c /usr/src/debug/libmd/1.1.0-r0/src/sha224hl.c /usr/src/debug/libmd/1.1.0-r0/src/sha256hl.c /usr/src/debug/libmd/1.1.0-r0/src/sha1hl.c /usr/src/debug/libmd/1.1.0-r0/src/sha384hl.c /usr/src/debug/libmd/1.1.0-r0/src/sha512hl.c /usr/src/debug/libmd/1.1.0-r0/src/sha1.c"
packages/core2-32-poky-linux/libmd/libmd-staticdev: PV changed from "1.0.4" to "1.1.0"
packages/core2-32-poky-linux/libmd/libmd-staticdev: PKGV changed from 1.0.4 [default] to 1.1.0 [default]
packages/core2-32-poky-linux/libmd/libmd: PV changed from "1.0.4" to "1.1.0"
packages/core2-32-poky-linux/libmd/libmd: PKGV changed from 1.0.4 [default] to 1.1.0 [default]
packages/core2-32-poky-linux/libmd/libmd: PKGSIZE changed from 63086 to 75246 (+19%)
packages/core2-32-poky-linux/libmd/libmd: FILELIST: removed "/usr/lib/libmd.so.0.0.5", added "/usr/lib/libmd.so.0.1.0"
Changes to packages/core2-32-poky-linux/libmd (sysroot):
  /usr/lib/libmd.so.0 changed symlink target from libmd.so.0.0.5 to libmd.so.0.1.0
  /usr/lib/libmd.so changed symlink target from libmd.so.0.0.5 to libmd.so.0.1.0
  /usr/lib/libmd.so.0.0.5 moved to /usr/lib/libmd.so.0.1.0

--===============5389798605655026948==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libmd/libmd-dbg: PKGSIZE changed from 86808 to 100804 (+16%)
packages/core2-32-poky-linux/libmd/libmd-doc: FILELIST: added "/usr/share/man/man7/libmd.7"
packages/core2-32-poky-linux/libmd/libmd: PKGSIZE changed from 63086 to 75246 (+19%)
packages/core2-32-poky-linux/libmd/libmd: FILELIST: removed "/usr/lib/libmd.so.0.0.5", added "/usr/lib/libmd.so.0.1.0"
Changes to packages/core2-32-poky-linux/libmd (sysroot):
  /usr/lib/libmd.so.0 changed symlink target from libmd.so.0.0.5 to libmd.so.0.1.0
  /usr/lib/libmd.so changed symlink target from libmd.so.0.0.5 to libmd.so.0.1.0
  /usr/lib/libmd.so.0.0.5 moved to /usr/lib/libmd.so.0.1.0

--===============5389798605655026948==--

