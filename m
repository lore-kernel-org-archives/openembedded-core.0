Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED745CCA464
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:03:19 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15485.1792130595611782866
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 23:03:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=aF+mPVLS;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=sZKAh8yf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a1434eb78f-12e3b3c9-644d-4f45-bd70-e9c7fce86d80-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792130594;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GNul/iYLU1xeW0BOuYEQAFyud7qRe2Bzp50/i7+SOVY=;
	b=aF+mPVLStyqPHrTZvz5zUUytlPl/UVz8YdkT407Y1Mrl+SzOMEsrUBCt2YpboOEu
	RjKP4oDJWSE++RKp9Iu3QEQVjNwvGNMEsB6qphlLZlF2lr1bqbWRPdJhS6dez8G4sSf
	UHvZmP5KhB+Zp4u6ftomIKh5IWOFYosdR/5Y9Mg0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792130594;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GNul/iYLU1xeW0BOuYEQAFyud7qRe2Bzp50/i7+SOVY=;
	b=sZKAh8yfQ+g0B33CVVtKgQhqbMr3VKUk7r6IheTl+URK4hByXUIGidqssN8ka62e
	EIH8CQzVxjxpTB8Hqs+A0kOqHDgR+Enay6l3E+v01bs0VJQJL8tJD6htfJlqiFC5GSy
	YprHhH2gGu7HJ7KSHYLKc4WA7LbTo02rtGCWD4l0=
Content-Type: multipart/mixed; boundary="===============8573715607164295303=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pkgconf: upgrading to 3.0.9 SUCCEEDED
Message-ID: <010101a1434eb78f-12e3b3c9-644d-4f45-bd70-e9c7fce86d80-000000@us-west-2.amazonses.com>
Date: Fri, 16 Oct 2026 06:03:14 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.16-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:03:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247960

--===============8573715607164295303==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *pkgconf* to *3.0.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pkgconf-upgrade-3.0.8-3.0.9.patch
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
From fe208c52b3131e782a1097d5506bdad56cf596e3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 16 Oct 2026 05:31:11 +0000
Subject: [PATCH] pkgconf: upgrade 3.0.8 -> 3.0.9

Changes from 3.0.8 to 3.0.9:
----------------------------
---
 .../pkgconf/{pkgconf_3.0.8.bb => pkgconf_3.0.9.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_3.0.8.bb => pkgconf_3.0.9.bb} (97%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_3.0.8.bb b/meta/recipes-devtools/pkgconf/pkgconf_3.0.9.bb
similarity index 97%
rename from meta/recipes-devtools/pkgconf/pkgconf_3.0.8.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_3.0.9.bb
index cd55484c30..c784163cff 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_3.0.8.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_3.0.9.bb
@@ -20,7 +20,7 @@ SRC_URI = "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[sha256sum] = "943f0bc88bcaeceb630b00262e2a8ad5ea4fac3fba72a4267d8b9ec6b35d1194"
+SRC_URI[sha256sum] = "6ab2d3b8087dcf500e34003a6a8934dca55d0a3d6066aeafb03c352db3e68bfd"
 UPSTREAM_CHECK_REGEX = "pkgconf-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)\.tar"
 
 inherit autotools pkgconfig
-- 
2.47.1


--===============8573715607164295303==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86_64-linux/elfutils-native (sysroot):
  /usr/bin/eu-stackprof was added

--===============8573715607164295303==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pkgconf-upgrade-3.0.8-3.0.9.patch"

RnJvbSBmZTIwOGM1MmIzMTMxZTc4MmExMDk3ZDU1MDZiZGFkNTZjZjU5NmUzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTYgT2N0IDIwMjYgMDU6MzE6MTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
a2djb25mOiB1cGdyYWRlIDMuMC44IC0+IDMuMC45CgpDaGFuZ2VzIGZyb20gMy4wLjggdG8gMy4w
Ljk6Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KLS0tCiAuLi4vcGtnY29uZi97cGtnY29u
Zl8zLjAuOC5iYiA9PiBwa2djb25mXzMuMC45LmJifSAgICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcGtnY29uZi97cGtnY29uZl8zLjAuOC5iYiA9PiBwa2djb25mXzMuMC45
LmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wa2djb25mL3Br
Z2NvbmZfMy4wLjguYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGtnY29uZi9wa2djb25mXzMu
MC45LmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9wa2djb25mL3BrZ2NvbmZfMy4wLjguYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9wa2djb25mL3BrZ2NvbmZfMy4wLjkuYmIKaW5kZXggY2Q1NTQ4NGMzMC4uYzc4NDE2M2Nm
ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BrZ2NvbmYvcGtnY29uZl8zLjAu
OC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGtnY29uZi9wa2djb25mXzMuMC45LmJi
CkBAIC0yMCw3ICsyMCw3IEBAIFNSQ19VUkkgPSAiXAogICAgIGZpbGU6Ly9wa2ctY29uZmlnLW5h
dGl2ZS5pbiBcCiAgICAgZmlsZTovL3BrZy1jb25maWctZXNkay5pbiBcCiAiCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiOTQzZjBiYzg4YmNhZWNlYjYzMGIwMDI2MmUyYThhZDVlYTRmYWMzZmJhNzJh
NDI2N2Q4YjllYzZiMzVkMTE5NCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI2YWIyZDNiODA4N2Rj
ZjUwMGUzNDAwM2E2YTg5MzRkY2E1NWQwYTNkNjA2NmFlYWZiMDNjMzUyZGIzZTY4YmZkIgogVVBT
VFJFQU1fQ0hFQ0tfUkVHRVggPSAicGtnY29uZi0oP1A8cHZlcj5cZCtcLlxkK1wuKD8hOVxkKylc
ZCspXC50YXIiCiAKIGluaGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZwotLSAKMi40Ny4xCgo=

--===============8573715607164295303==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="pkgconf-changelog.txt"

Changes from 3.0.8 to 3.0.9:
----------------------------

--===============8573715607164295303==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/pkgconf: PKGV changed from 3.0.8 [default] to 3.0.9 [default]
packages/x86-64-v3-poky-linux/pkgconf: SRC_URI changed from "https://distfiles.ariadne.space/pkgconf/pkgconf-3.0.8.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in" to "https://distfiles.ariadne.space/pkgconf/pkgconf-3.0.9.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in"
packages/x86-64-v3-poky-linux/pkgconf: PV changed from "3.0.8" to "3.0.9"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dbg: PKGV changed from 3.0.8 [default] to 3.0.9 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dbg: PV changed from "3.0.8" to "3.0.9"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dev: PKGV changed from 3.0.8 [default] to 3.0.9 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dev: PV changed from "3.0.8" to "3.0.9"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-doc: PKGV changed from 3.0.8 [default] to 3.0.9 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-doc: PV changed from "3.0.8" to "3.0.9"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-locale: PKGV changed from 3.0.8 [default] to 3.0.9 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-locale: PV changed from "3.0.8" to "3.0.9"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-src: PKGV changed from 3.0.8 [default] to 3.0.9 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-src: PV changed from "3.0.8" to "3.0.9"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-src: FILELIST: directory renamed /usr/src/debug/pkgconf/3.0.8/cli/spdxtool -> /usr/src/debug/pkgconf/3.0.9/cli/spdxtool, directory renamed /usr/src/debug/pkgconf/3.0.8/cli/bomtool -> /usr/src/debug/pkgconf/3.0.9/cli/bomtool, directory renamed /usr/src/debug/pkgconf/3.0.8/libpkgconf -> /usr/src/debug/pkgconf/3.0.9/libpkgconf, directory renamed /usr/src/debug/pkgconf/3.0.8/cli/pccritic -> /usr/src/debug/pkgconf/3.0.9/cli/pccritic, directory renamed /usr/src/debug/pkgconf/3.0.8/cli -> /usr/src/debug/pkgconf/3.0.9/cli
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-staticdev: PKGV changed from 3.0.8 [default] to 3.0.9 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-staticdev: PV changed from "3.0.8" to "3.0.9"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf: PKGV changed from 3.0.8 [default] to 3.0.9 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf: PV changed from "3.0.8" to "3.0.9"
Changes to packages/x86_64-linux/elfutils-native (sysroot):
  /usr/bin/eu-stackprof was added

--===============8573715607164295303==--

