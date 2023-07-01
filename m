Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CF0BC05051
	for <webhook@archiver.kernel.org>; Sat,  1 Jul 2023 16:02:07 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.10773.1688227324005304019
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jul 2023 09:02:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=avX1aw/W;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018912309d60-42a389ab-676a-458d-8faf-b678eacb8266-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1688227323;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WTbcBr6EmtoU0vkHTCdxuwJiWl4eMZt1EwslKUQGUIQ=;
	b=avX1aw/W9qUoXv6BN294tSjGQYfvvNTpbSAjhUzzesBdpFn4ghDe1sdlRudO2lif
	i0ag6bYukLOI6R+MzlvY8dHEpUSIPIvp+EoJirRgR24heDX1RoLhogX/+En5NWYaRwG
	NLsbwJ2n2VIOvrqSqvu67JVi7RYTC0po0hpmwoAM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1688227323;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WTbcBr6EmtoU0vkHTCdxuwJiWl4eMZt1EwslKUQGUIQ=;
	b=ZUhLMXeCu0bHlEa77ZhESdLEuZ5CoK0mXSNGpM77Krd8a9aPllu87zL5m4DjeuQX
	mdZuSaM9q6i+X6dshqVNuvjMdsyl62ZvpHOCi+VWQ3o2gBKDPYh+wx7yswqhcZfl7EN
	LSWQwZ254SKfBYZ3g+zoDi9USA8YTjtSHlOqgeX8=
Content-Type: multipart/mixed; boundary="===============3961604492848102923=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glslang: upgrading to 1.3.250.1 SUCCEEDED
Message-ID: <0101018912309d60-42a389ab-676a-458d-8faf-b678eacb8266-000000@us-west-2.amazonses.com>
Date: Sat, 1 Jul 2023 16:02:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jul 2023 16:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183751

--===============3961604492848102923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glslang* to *1.3.250.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glslang-upgrade-1.3.250.0-1.3.250.1.patch
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
From 48ebcf2abe8cd653bce82fb5b65573fe20051580 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Jul 2023 11:50:37 +0000
Subject: [PATCH] glslang: upgrade 1.3.250.0 -> 1.3.250.1

---
 .../glslang/{glslang_1.3.250.0.bb => glslang_1.3.250.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/glslang/{glslang_1.3.250.0.bb => glslang_1.3.250.1.bb} (96%)

diff --git a/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb b/meta/recipes-graphics/glslang/glslang_1.3.250.1.bb
similarity index 96%
rename from meta/recipes-graphics/glslang/glslang_1.3.250.0.bb
rename to meta/recipes-graphics/glslang/glslang_1.3.250.1.bb
index 6e9c666d46..16205bf026 100644
--- a/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.3.250.1.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2a2b5acd7bc4844964cfda45fe807dc3"
 
-SRCREV = "d1517d64cfca91f573af1bf7341dc3a5113349c0"
+SRCREV = "3ebb72cc7429f0ab8218104dc3687c659c0f364d"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main \
            file://0001-generate-glslang-pkg-config.patch \
            "
-- 
2.39.2


--===============3961604492848102923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/glslang/glslang-dev: FILELIST: removed "/usr/lib/libglslang-default-resource-limits.so"
packages/core2-32-poky-linux/glslang/glslang-staticdev: PKGSIZE changed from 0 to 172584 (+100%)
packages/core2-32-poky-linux/glslang/glslang-staticdev: FILELIST: added "/usr/lib/libglslang-default-resource-limits.a"
packages/core2-32-poky-linux/glslang/glslang: FILELIST: removed "/usr/lib/libglslang-default-resource-limits.so.12.2.0 /usr/lib/libglslang-default-resource-limits.so.12"
Changes to packages/core2-32-poky-linux/glslang (sysroot):
  /usr/lib/libglslang-default-resource-limits.a was added
  /usr/lib/libglslang-default-resource-limits.so.12.2.0 was removed
  /usr/lib/libglslang-default-resource-limits.so.12 was removed
  /usr/lib/libglslang-default-resource-limits.so was removed

--===============3961604492848102923==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glslang-upgrade-1.3.250.0-1.3.250.1.patch"

RnJvbSA0OGViY2YyYWJlOGNkNjUzYmNlODJmYjViNjU1NzNmZTIwMDUxNTgwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBKdWwgMjAyMyAxMTo1MDozNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGds
c2xhbmc6IHVwZ3JhZGUgMS4zLjI1MC4wIC0+IDEuMy4yNTAuMQoKLS0tCiAuLi4vZ2xzbGFuZy97
Z2xzbGFuZ18xLjMuMjUwLjAuYmIgPT4gZ2xzbGFuZ18xLjMuMjUwLjEuYmJ9ICAgICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZ2xzbGFuZy97Z2xzbGFuZ18xLjMuMjUwLjAuYmIgPT4gZ2xz
bGFuZ18xLjMuMjUwLjEuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL2dsc2xhbmcvZ2xzbGFuZ18xLjMuMjUwLjAuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
Z2xzbGFuZy9nbHNsYW5nXzEuMy4yNTAuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZ2xzbGFuZy9nbHNsYW5nXzEuMy4yNTAuMC5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFuZ18xLjMuMjUwLjEu
YmIKaW5kZXggNmU5YzY2NmQ0Ni4uMTYyMDViZjAyNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFuZ18xLjMuMjUwLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFuZ18xLjMuMjUwLjEuYmIKQEAgLTgsNyArOCw3IEBAIEhP
TUVQQUdFID0gImh0dHBzOi8vd3d3Lmtocm9ub3Mub3JnL29wZW5nbGVzL3Nkay90b29scy9SZWZl
cmVuY2UtQ29tcGlsZXIiCiBMSUNFTlNFID0gIkJTRC0zLUNsYXVzZSAmIEJTRC0yLUNsYXVzZSAm
IE1JVCAmIEFwYWNoZS0yLjAgJiBHUEwtMy13aXRoLWJpc29uLWV4Y2VwdGlvbiIKIExJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UudHh0O21kNT0yYTJiNWFjZDdiYzQ4NDQ5NjRjZmRh
NDVmZTgwN2RjMyIKIAotU1JDUkVWID0gImQxNTE3ZDY0Y2ZjYTkxZjU3M2FmMWJmNzM0MWRjM2E1
MTEzMzQ5YzAiCitTUkNSRVYgPSAiM2ViYjcyY2M3NDI5ZjBhYjgyMTgxMDRkYzM2ODdjNjU5YzBm
MzY0ZCIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9LaHJvbm9zR3JvdXAvZ2xzbGFuZy5n
aXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1haW4gXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1n
ZW5lcmF0ZS1nbHNsYW5nLXBrZy1jb25maWcucGF0Y2ggXAogICAgICAgICAgICAiCi0tIAoyLjM5
LjIKCg==

--===============3961604492848102923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/glslang/glslang-dbg: FILELIST: removed "/usr/lib/.debug/libglslang-default-resource-limits.so.12.2.0"
packages/core2-32-poky-linux/glslang/glslang-dbg: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/glslang/glslang-dbg: PKGSIZE changed from 74683608 to 74612200 (-0%)
packages/core2-32-poky-linux/glslang/glslang-dbg: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/glslang/glslang-dev: FILELIST: removed "/usr/lib/libglslang-default-resource-limits.so"
packages/core2-32-poky-linux/glslang/glslang-dev: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/glslang/glslang-dev: PKGSIZE changed from 1020014 to 1020059 (+0%)
packages/core2-32-poky-linux/glslang/glslang-dev: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/glslang/glslang-doc: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/glslang/glslang-doc: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/glslang/glslang-locale: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/glslang/glslang-locale: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/glslang/glslang-src: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/glslang/glslang-src: PKGSIZE changed from 4821631 to 4822370 (+0%)
packages/core2-32-poky-linux/glslang/glslang-src: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/glslang/glslang-staticdev: FILELIST: added "/usr/lib/libglslang-default-resource-limits.a"
packages/core2-32-poky-linux/glslang/glslang-staticdev: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/glslang/glslang-staticdev: PKGSIZE changed from 0 to 172584 (+100%)
packages/core2-32-poky-linux/glslang/glslang-staticdev: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/glslang/glslang: FILELIST: removed "/usr/lib/libglslang-default-resource-limits.so.12.2.0 /usr/lib/libglslang-default-resource-limits.so.12"
packages/core2-32-poky-linux/glslang/glslang: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/glslang/glslang: PKGSIZE changed from 6530999 to 6525523 (-0%)
packages/core2-32-poky-linux/glslang/glslang: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/glslang: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/glslang: PV changed from "1.3.250.0" to "1.3.250.1"
Changes to packages/core2-32-poky-linux/glslang (sysroot):
  /usr/lib/libglslang-default-resource-limits.a was added
  /usr/lib/libglslang-default-resource-limits.so.12.2.0 was removed
  /usr/lib/libglslang-default-resource-limits.so.12 was removed
  /usr/lib/libglslang-default-resource-limits.so was removed

--===============3961604492848102923==--

