Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3012.1794721853244758070
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Nov 2026 21:50:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=gMlllsdP;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=qdoZ6g1H;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a1ddc22af8-27afa6e1-b9dd-4922-b2ef-e342e1607e90-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794721852;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tDp6XxNLLMbtLELyggs/KdUxMVe5cnl1ifY/9/RclFQ=;
	b=gMlllsdPfLBb1jx8eDY0soFKKwJFRGVbHlkQQRQD+EGIEFJiO7yuBd023CZOqHcW
	dkOLDXnikrhgIc0xKY3koiVAoBlkRuOrYILCpuZSsk1mITWrgbXqu3DY6gb5VNZbwqI
	fUutwvLE8Mg7d5/Y57HQr8/DNLCuvX2EXhYSEo5E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794721852;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tDp6XxNLLMbtLELyggs/KdUxMVe5cnl1ifY/9/RclFQ=;
	b=qdoZ6g1HHn/z0Nv64p3cztfHF3B/wOHPPEQqSejmt+w8qytrjRshFxR0GS9fN2am
	W1TSfXiiw1gg8ZKgidhpoY8zG0sC8SaLeGygb95ltkCX4CIeNHew5pIiXxL9aGxTAR2
	STTU0qk9c3C65hTfbD8QoncCmVggwkr8GGDGOETk=
Content-Type: multipart/mixed; boundary="===============3082311182549209601=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pkgconf: upgrading to 3.0.11 SUCCEEDED
Message-ID: <010101a1ddc22af8-27afa6e1-b9dd-4922-b2ef-e342e1607e90-000000@us-west-2.amazonses.com>
Date: Sun, 15 Nov 2026 05:50:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 05:51:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250222

--===============3082311182549209601==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *pkgconf* to *3.0.11* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pkgconf-upgrade-3.0.10-3.0.11.patch
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
From 6dbcc5bcf29a87339a4ac7d144dd2d3cbe6c30fd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Nov 2026 05:22:44 +0000
Subject: [PATCH] pkgconf: upgrade 3.0.10 -> 3.0.11

Changes from 3.0.10 to 3.0.11:
------------------------------
---
 .../pkgconf/{pkgconf_3.0.10.bb => pkgconf_3.0.11.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_3.0.10.bb => pkgconf_3.0.11.bb} (97%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_3.0.10.bb b/meta/recipes-devtools/pkgconf/pkgconf_3.0.11.bb
similarity index 97%
rename from meta/recipes-devtools/pkgconf/pkgconf_3.0.10.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_3.0.11.bb
index e8746c1ceb..6e05dae2f3 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_3.0.10.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_3.0.11.bb
@@ -20,7 +20,7 @@ SRC_URI = "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[sha256sum] = "9371b2f6372da574d4c6dc96fe9b1463037bcf6afcb6671c1555afde7b17e2de"
+SRC_URI[sha256sum] = "d0cd841bc8e55b9da888106c00dc256d05b7d1d8e5a46f4be4eb4c5125bd2dc4"
 UPSTREAM_CHECK_REGEX = "pkgconf-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)\.tar"
 
 inherit autotools pkgconfig
-- 
2.47.1


--===============3082311182549209601==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="pkgconf-changelog.txt"

Changes from 3.0.10 to 3.0.11:
------------------------------

--===============3082311182549209601==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/pkgconf: PV changed from "3.0.10" to "3.0.11"
packages/x86-64-v3-poky-linux/pkgconf: SRC_URI changed from "https://distfiles.ariadne.space/pkgconf/pkgconf-3.0.10.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in" to "https://distfiles.ariadne.space/pkgconf/pkgconf-3.0.11.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in"
packages/x86-64-v3-poky-linux/pkgconf: PKGV changed from 3.0.10 [default] to 3.0.11 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dbg: PKGSIZE changed from 793384 to 796464 (+0%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dbg: PV changed from "3.0.10" to "3.0.11"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dbg: PKGV changed from 3.0.10 [default] to 3.0.11 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dev: PV changed from "3.0.10" to "3.0.11"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dev: PKGV changed from 3.0.10 [default] to 3.0.11 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-doc: PKGSIZE changed from 68169 to 68189 (+0%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-doc: PV changed from "3.0.10" to "3.0.11"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-doc: PKGV changed from 3.0.10 [default] to 3.0.11 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-locale: PV changed from "3.0.10" to "3.0.11"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-locale: PKGV changed from 3.0.10 [default] to 3.0.11 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-src: PKGSIZE changed from 575605 to 578314 (+0%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-src: PV changed from "3.0.10" to "3.0.11"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-src: FILELIST: directory renamed /usr/src/debug/pkgconf/3.0.10/cli/bomtool -> /usr/src/debug/pkgconf/3.0.11/cli/bomtool, directory renamed /usr/src/debug/pkgconf/3.0.10/cli -> /usr/src/debug/pkgconf/3.0.11/cli, directory renamed /usr/src/debug/pkgconf/3.0.10/cli/spdxtool -> /usr/src/debug/pkgconf/3.0.11/cli/spdxtool, directory renamed /usr/src/debug/pkgconf/3.0.10/libpkgconf -> /usr/src/debug/pkgconf/3.0.11/libpkgconf, directory renamed /usr/src/debug/pkgconf/3.0.10/cli/pccritic -> /usr/src/debug/pkgconf/3.0.11/cli/pccritic
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-src: PKGV changed from 3.0.10 [default] to 3.0.11 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-staticdev: PV changed from "3.0.10" to "3.0.11"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-staticdev: PKGV changed from 3.0.10 [default] to 3.0.11 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf: PV changed from "3.0.10" to "3.0.11"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf: PKGV changed from 3.0.10 [default] to 3.0.11 [default]
Changes to packages/x86_64-linux/elfutils-native (sysroot):
  /usr/bin/eu-stackprof was added

--===============3082311182549209601==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86_64-linux/elfutils-native (sysroot):
  /usr/bin/eu-stackprof was added

--===============3082311182549209601==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pkgconf-upgrade-3.0.10-3.0.11.patch"

RnJvbSA2ZGJjYzViY2YyOWE4NzMzOWE0YWM3ZDE0NGRkMmQzY2JlNmMzMGZkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgTm92IDIwMjYgMDU6MjI6NDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
a2djb25mOiB1cGdyYWRlIDMuMC4xMCAtPiAzLjAuMTEKCkNoYW5nZXMgZnJvbSAzLjAuMTAgdG8g
My4wLjExOgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KLS0tCiAuLi4vcGtnY29uZi97
cGtnY29uZl8zLjAuMTAuYmIgPT4gcGtnY29uZl8zLjAuMTEuYmJ9ICAgICAgICAgICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGtnY29uZi97cGtnY29uZl8zLjAuMTAuYmIgPT4gcGtnY29u
Zl8zLjAuMTEuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Br
Z2NvbmYvcGtnY29uZl8zLjAuMTAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGtnY29uZi9w
a2djb25mXzMuMC4xMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcGtnY29uZi9wa2djb25mXzMuMC4xMC5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3BrZ2NvbmYvcGtnY29uZl8zLjAuMTEuYmIKaW5kZXggZTg3NDZjMWNl
Yi4uNmUwNWRhZTJmMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BrZ2NvbmYv
cGtnY29uZl8zLjAuMTAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BrZ2NvbmYvcGtn
Y29uZl8zLjAuMTEuYmIKQEAgLTIwLDcgKzIwLDcgQEAgU1JDX1VSSSA9ICJcCiAgICAgZmlsZTov
L3BrZy1jb25maWctbmF0aXZlLmluIFwKICAgICBmaWxlOi8vcGtnLWNvbmZpZy1lc2RrLmluIFwK
ICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI5MzcxYjJmNjM3MmRhNTc0ZDRjNmRjOTZmZTliMTQ2
MzAzN2JjZjZhZmNiNjY3MWMxNTU1YWZkZTdiMTdlMmRlIgorU1JDX1VSSVtzaGEyNTZzdW1dID0g
ImQwY2Q4NDFiYzhlNTViOWRhODg4MTA2YzAwZGMyNTZkMDViN2QxZDhlNWE0NmY0YmU0ZWI0YzUx
MjViZDJkYzQiCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJwa2djb25mLSg/UDxwdmVyPlxkK1wu
XGQrXC4oPyE5XGQrKVxkKylcLnRhciIKIAogaW5oZXJpdCBhdXRvdG9vbHMgcGtnY29uZmlnCi0t
IAoyLjQ3LjEKCg==

--===============3082311182549209601==--
