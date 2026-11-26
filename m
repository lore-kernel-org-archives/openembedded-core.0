Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8444.1795671542022193973
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 21:39:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=eqiHd+m6;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=G/qXKkgk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a2165d4574-db1ae6b1-6f37-4afb-83d6-255395d038f4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1795671541;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zW4MndiHYGVQDl4x7Frp/WqVv1+bXlwTlL0IK4Fb6b4=;
	b=eqiHd+m6hcATqzlMjJ0qLTVNOdyNizq6Jcxak16GPQ6tFE2HLSsJMUnr0+CqiZ8q
	u8TkqIgI6+HbvnFh4jLY45H8XjBc/+ToVCujQkbtWKtNROY+MgcCeW83hEuHRiIFXuw
	lLGM2V36wT5vaBqUFj78TuccJ6inG4H3D/5uTiss=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1795671541;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zW4MndiHYGVQDl4x7Frp/WqVv1+bXlwTlL0IK4Fb6b4=;
	b=G/qXKkgkxmlyqs6QHhCR0eVElRAfHHgEdLgccrgcZudQn1bLI7OLcqTBDPqElRr5
	VPI5QIEgWuRsj7zW1ewKex8aX7mOvYja/ZjGEpvnAHcFOmH2DVESTs3BLLktk51uAbB
	PPQ5j78X7hb20joZUW+BRRui4VaxyxoocqDgMgVU=
Content-Type: multipart/mixed; boundary="===============8158478537759220557=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-markdown: upgrading to 3.11.4 SUCCEEDED
Message-ID: <010101a2165d4574-db1ae6b1-6f37-4afb-83d6-255395d038f4-000000@us-west-2.amazonses.com>
Date: Thu, 26 Nov 2026 05:39:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.26-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 05:39:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251277

--===============8158478537759220557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-markdown* to *3.11.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-markdown-upgrade-3.11.1-3.11.4.patch
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
From 030ae8c42a4d3d06355031ee5538340b9a73b2ea Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 26 Nov 2026 05:28:50 +0000
Subject: [PATCH] python3-markdown: upgrade 3.11.1 -> 3.11.4

## [3.11.4] - 2026-11-25
### Fixed
## [3.11.3] - 2026-11-05
### Fixed
## [3.11.2] - 2026-10-19
### Fixed
---
 .../{python3-markdown_3.11.1.bb => python3-markdown_3.11.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-markdown_3.11.1.bb => python3-markdown_3.11.4.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-markdown_3.11.1.bb b/meta/recipes-devtools/python/python3-markdown_3.11.4.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-markdown_3.11.1.bb
rename to meta/recipes-devtools/python/python3-markdown_3.11.4.bb
index 3611675782..6ff6e79cbe 100644
--- a/meta/recipes-devtools/python/python3-markdown_3.11.1.bb
+++ b/meta/recipes-devtools/python/python3-markdown_3.11.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=ec58cdf7cfed06a21f7a9362627a5480"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "496f4f80f9ebd3395a04c8ec9595c40bbe8ec19e9c67d21fe071a1643e876606"
+SRC_URI[sha256sum] = "c911a757f33d64a2578bed2d20c57e007b2aedd8a67bceabd593b31143d54ead"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.47.1


--===============8158478537759220557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown: FILELIST: directory renamed /usr/lib/python3.15/site-packages/markdown-3.11.1.dist-info/licenses -> /usr/lib/python3.15/site-packages/markdown-3.11.4.dist-info/licenses, directory renamed /usr/lib/python3.15/site-packages/markdown-3.11.1.dist-info -> /usr/lib/python3.15/site-packages/markdown-3.11.4.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-markdown (sysroot):
  /usr/lib/python3.15/site-packages/markdown-3.11.1.dist-info moved to /usr/lib/python3.15/site-packages/markdown-3.11.4.dist-info

--===============8158478537759220557==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-markdown-upgrade-3.11.1-3.11.4.patch"

RnJvbSAwMzBhZThjNDJhNGQzZDA2MzU1MDMxZWU1NTM4MzQwYjlhNzNiMmVhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMjYgTm92IDIwMjYgMDU6Mjg6NTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW1hcmtkb3duOiB1cGdyYWRlIDMuMTEuMSAtPiAzLjExLjQKCiMjIFszLjExLjRdIC0g
MjAyNi0xMS0yNQojIyMgRml4ZWQKIyMgWzMuMTEuM10gLSAyMDI2LTExLTA1CiMjIyBGaXhlZAoj
IyBbMy4xMS4yXSAtIDIwMjYtMTAtMTkKIyMjIEZpeGVkCi0tLQogLi4uL3tweXRob24zLW1hcmtk
b3duXzMuMTEuMS5iYiA9PiBweXRob24zLW1hcmtkb3duXzMuMTEuNC5iYn0gIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1tYXJrZG93bl8zLjExLjEuYmIgPT4gcHl0
aG9uMy1tYXJrZG93bl8zLjExLjQuYmJ9ICg3OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1hcmtkb3duXzMuMTEuMS5iYiBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXJrZG93bl8zLjExLjQuYmIKc2ltaWxhcml0eSBp
bmRleCA3OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LW1hcmtkb3duXzMuMTEuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLW1hcmtkb3duXzMuMTEuNC5iYgppbmRleCAzNjExNjc1NzgyLi42ZmY2ZTc5Y2Jl
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFya2Rv
d25fMy4xMS4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1t
YXJrZG93bl8zLjExLjQuYmIKQEAgLTUsNyArNSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmls
ZTovL0xJQ0VOU0UubWQ7bWQ1PWVjNThjZGY3Y2ZlZDA2YTIxZjdhOTM2MjYyN2E1NDgwIgogCiBp
bmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YQogCi1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiNDk2ZjRmODBmOWViZDMzOTVhMDRjOGVjOTU5NWM0MGJiZThlYzE5ZTljNjdkMjFm
ZTA3MWExNjQzZTg3NjYwNiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJjOTExYTc1N2YzM2Q2NGEy
NTc4YmVkMmQyMGM1N2UwMDdiMmFlZGQ4YTY3YmNlYWJkNTkzYjMxMTQzZDU0ZWFkIgogCiBCQkNM
QVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiCiAKLS0gCjIuNDcuMQoK

--===============8158478537759220557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-markdown-changelog.txt"

## [3.11.4] - 2026-11-25
### Fixed
## [3.11.3] - 2026-11-05
### Fixed
## [3.11.2] - 2026-10-19
### Fixed

--===============8158478537759220557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-markdown: SRC_URI changed from "https://files.pythonhosted.org/packages/source/m/markdown/markdown-3.11.1.tar.gz" to "https://files.pythonhosted.org/packages/source/m/markdown/markdown-3.11.4.tar.gz"
packages/x86-64-v3-poky-linux/python3-markdown: PKGV changed from 3.11.1 [default] to 3.11.4 [default]
packages/x86-64-v3-poky-linux/python3-markdown: PV changed from "3.11.1" to "3.11.4"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-dbg: PKGV changed from 3.11.1 [default] to 3.11.4 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-dbg: PV changed from "3.11.1" to "3.11.4"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-dev: PKGV changed from 3.11.1 [default] to 3.11.4 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-dev: PV changed from "3.11.1" to "3.11.4"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-doc: PKGV changed from 3.11.1 [default] to 3.11.4 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-doc: PV changed from "3.11.1" to "3.11.4"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-locale: PKGV changed from 3.11.1 [default] to 3.11.4 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-locale: PV changed from "3.11.1" to "3.11.4"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-src: PKGV changed from 3.11.1 [default] to 3.11.4 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-src: PV changed from "3.11.1" to "3.11.4"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-staticdev: PKGV changed from 3.11.1 [default] to 3.11.4 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-staticdev: PV changed from "3.11.1" to "3.11.4"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown: PKGSIZE changed from 834673 to 847884 (+2%)
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown: FILELIST: directory renamed /usr/lib/python3.15/site-packages/markdown-3.11.1.dist-info/licenses -> /usr/lib/python3.15/site-packages/markdown-3.11.4.dist-info/licenses, directory renamed /usr/lib/python3.15/site-packages/markdown-3.11.1.dist-info -> /usr/lib/python3.15/site-packages/markdown-3.11.4.dist-info
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown: PKGV changed from 3.11.1 [default] to 3.11.4 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown: PV changed from "3.11.1" to "3.11.4"
Changes to packages/x86-64-v3-poky-linux/python3-markdown (sysroot):
  /usr/lib/python3.15/site-packages/markdown-3.11.1.dist-info moved to /usr/lib/python3.15/site-packages/markdown-3.11.4.dist-info

--===============8158478537759220557==--
