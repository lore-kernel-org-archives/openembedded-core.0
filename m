Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47D9DC982DB
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 05:47:17 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4919.1789710435868189031
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 22:47:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Y38ZnB9k;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=hj849MZi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a0b30e027f-7b2d5208-7992-41b3-b344-bf822ee294c3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789710435;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=80xY5B4EejS6LoJSnFuGXOJ/QTSbuzqnrCYnbfEXGRM=;
	b=Y38ZnB9knOQHuvCpI8RSqwVni7SuX5oWmrZO2Di30OZsbkxOsmKF/ZFpvdvQad9h
	i3xo0xb8brd0jbTRJ72ejkyNz3DM1XrRTD1zZZ7wZNvmVG9WenL+a3qdYaxSlGlQSrc
	k5zEbPWKeRCWo9EleEd3kZWdK98QjcqQM/2fZOO0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789710435;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=80xY5B4EejS6LoJSnFuGXOJ/QTSbuzqnrCYnbfEXGRM=;
	b=hj849MZiFMvcW3UiTF2KHvxEpCjqPD5WmdeGP0gwNa8G08NSUecBildP63nspvcg
	cYPNvzDhgT7Ei976ocUnx7o3B0HsPvXFkh1iKzSHxLLplidvpUFCouXD+g4mivmTdFb
	4ve8UHat3MXCIVBTAQ4IPiE/oiU71UPRWjAZPbvU=
Content-Type: multipart/mixed; boundary="===============1320755507310463499=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pdm: upgrading to 2.29.2 SUCCEEDED
Message-ID: <010101a0b30e027f-7b2d5208-7992-41b3-b344-bf822ee294c3-000000@us-west-2.amazonses.com>
Date: Fri, 18 Sep 2026 05:47:14 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.18-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 05:47:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246183

--===============1320755507310463499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pdm* to *2.29.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pdm-upgrade-2.29.1-2.29.2.patch
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
From ae46f5bd5a014f3d798c600cbd7b530f3c183d0e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 18 Sep 2026 05:30:14 +0000
Subject: [PATCH] python3-pdm: upgrade 2.29.1 -> 2.29.2

Source: CHANGELOG.md

## Release v2.29.2 (2026-09-17)

### Bug Fixes

- Fix writing lock files specified as bare relative filenames with `pdm lock --lockfile`. ([#3891](https://github.com/pdm-project/pdm/issues/3891))
- Preserve local paths containing spaces and their extras and environment markers when importing requirements files. ([#3894](https://github.com/pdm-project/pdm/issues/3894))

### Documentation

- List the install-pdm.py options the script actually accepts. ([#3889](https://github.com/pdm-project/pdm/issues/3889))
---
 .../python/{python3-pdm_2.29.1.bb => python3-pdm_2.29.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm_2.29.1.bb => python3-pdm_2.29.2.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pdm_2.29.1.bb b/meta/recipes-devtools/python/python3-pdm_2.29.2.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pdm_2.29.1.bb
rename to meta/recipes-devtools/python/python3-pdm_2.29.2.bb
index 4520e677ee..83e9508612 100644
--- a/meta/recipes-devtools/python/python3-pdm_2.29.1.bb
+++ b/meta/recipes-devtools/python/python3-pdm_2.29.2.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "6bb5d893d301edb2b83d46042039634bf36c96c57cc7edad22a59521a41df9f8"
+SRC_URI[sha256sum] = "bad9705e9482e7d877a53380ff25273b01e9c1d313ee6ce7b215a6562a9d8bdd"
 
 inherit pypi python_pdm
 
-- 
2.47.1


--===============1320755507310463499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pdm-2.29.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/pdm-2.29.2.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pdm-2.29.1.dist-info -> /usr/lib/python3.14/site-packages/pdm-2.29.2.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.14/site-packages/pdm-2.29.1.dist-info moved to /usr/lib/python3.14/site-packages/pdm-2.29.2.dist-info

--===============1320755507310463499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-pdm-changelog.txt"

Changelog for python3-pdm: 2.29.1 -> 2.29.2
Source: CHANGELOG.md

## Release v2.29.2 (2026-09-17)

### Bug Fixes

- Fix writing lock files specified as bare relative filenames with `pdm lock --lockfile`. ([#3891](https://github.com/pdm-project/pdm/issues/3891))
- Preserve local paths containing spaces and their extras and environment markers when importing requirements files. ([#3894](https://github.com/pdm-project/pdm/issues/3894))

### Documentation

- List the install-pdm.py options the script actually accepts. ([#3889](https://github.com/pdm-project/pdm/issues/3889))

--===============1320755507310463499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pdm: PV changed from "2.29.1" to "2.29.2"
packages/x86-64-v3-poky-linux/python3-pdm: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.29.1.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.29.2.tar.gz"
packages/x86-64-v3-poky-linux/python3-pdm: PKGV changed from 2.29.1 [default] to 2.29.2 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dbg: PV changed from "2.29.1" to "2.29.2"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dbg: PKGV changed from 2.29.1 [default] to 2.29.2 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dev: PV changed from "2.29.1" to "2.29.2"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dev: PKGV changed from 2.29.1 [default] to 2.29.2 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-doc: PV changed from "2.29.1" to "2.29.2"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-doc: PKGV changed from 2.29.1 [default] to 2.29.2 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-locale: PV changed from "2.29.1" to "2.29.2"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-locale: PKGV changed from 2.29.1 [default] to 2.29.2 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-src: PV changed from "2.29.1" to "2.29.2"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-src: PKGV changed from 2.29.1 [default] to 2.29.2 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-staticdev: PV changed from "2.29.1" to "2.29.2"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-staticdev: PKGV changed from 2.29.1 [default] to 2.29.2 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PKGSIZE changed from 2554566 to 2554870 (+0%)
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PV changed from "2.29.1" to "2.29.2"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PKGV changed from 2.29.1 [default] to 2.29.2 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pdm-2.29.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/pdm-2.29.2.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pdm-2.29.1.dist-info -> /usr/lib/python3.14/site-packages/pdm-2.29.2.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.14/site-packages/pdm-2.29.1.dist-info moved to /usr/lib/python3.14/site-packages/pdm-2.29.2.dist-info

--===============1320755507310463499==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pdm-upgrade-2.29.1-2.29.2.patch"

RnJvbSBhZTQ2ZjViZDVhMDE0ZjNkNzk4YzYwMGNiZDdiNTMwZjNjMTgzZDBlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTggU2VwIDIwMjYgMDU6MzA6MTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBkbTogdXBncmFkZSAyLjI5LjEgLT4gMi4yOS4yCgpTb3VyY2U6IENIQU5HRUxPRy5t
ZAoKIyMgUmVsZWFzZSB2Mi4yOS4yICgyMDI2LTA5LTE3KQoKIyMjIEJ1ZyBGaXhlcwoKLSBGaXgg
d3JpdGluZyBsb2NrIGZpbGVzIHNwZWNpZmllZCBhcyBiYXJlIHJlbGF0aXZlIGZpbGVuYW1lcyB3
aXRoIGBwZG0gbG9jayAtLWxvY2tmaWxlYC4gKFsjMzg5MV0oaHR0cHM6Ly9naXRodWIuY29tL3Bk
bS1wcm9qZWN0L3BkbS9pc3N1ZXMvMzg5MSkpCi0gUHJlc2VydmUgbG9jYWwgcGF0aHMgY29udGFp
bmluZyBzcGFjZXMgYW5kIHRoZWlyIGV4dHJhcyBhbmQgZW52aXJvbm1lbnQgbWFya2VycyB3aGVu
IGltcG9ydGluZyByZXF1aXJlbWVudHMgZmlsZXMuIChbIzM4OTRdKGh0dHBzOi8vZ2l0aHViLmNv
bS9wZG0tcHJvamVjdC9wZG0vaXNzdWVzLzM4OTQpKQoKIyMjIERvY3VtZW50YXRpb24KCi0gTGlz
dCB0aGUgaW5zdGFsbC1wZG0ucHkgb3B0aW9ucyB0aGUgc2NyaXB0IGFjdHVhbGx5IGFjY2VwdHMu
IChbIzM4ODldKGh0dHBzOi8vZ2l0aHViLmNvbS9wZG0tcHJvamVjdC9wZG0vaXNzdWVzLzM4ODkp
KQotLS0KIC4uLi9weXRob24ve3B5dGhvbjMtcGRtXzIuMjkuMS5iYiA9PiBweXRob24zLXBkbV8y
LjI5LjIuYmJ9ICAgICB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMt
cGRtXzIuMjkuMS5iYiA9PiBweXRob24zLXBkbV8yLjI5LjIuYmJ9ICg4MCUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBkbV8yLjI5LjEuYmIgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjkuMi5iYgpzaW1pbGFy
aXR5IGluZGV4IDgwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtcGRtXzIuMjkuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXBkbV8yLjI5LjIuYmIKaW5kZXggNDUyMGU2NzdlZS4uODNlOTUwODYxMiAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBkbV8yLjI5LjEu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBkbV8yLjI5LjIu
YmIKQEAgLTQsNyArNCw3IEBAIExJQ0VOU0UgPSAiTUlUIgogU0VDVElPTiA9ICJkZXZlbC9weXRo
b24iCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0yZWIzMWEyY2MxYTc1
OGMzNGI0OTlmMjg3ZGQwNGVmMiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjZiYjVkODkzZDMw
MWVkYjJiODNkNDYwNDIwMzk2MzRiZjM2Yzk2YzU3Y2M3ZWRhZDIyYTU5NTIxYTQxZGY5ZjgiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiYmFkOTcwNWU5NDgyZTdkODc3YTUzMzgwZmYyNTI3M2IwMWU5
YzFkMzEzZWU2Y2U3YjIxNWE2NTYyYTlkOGJkZCIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9wZG0K
IAotLSAKMi40Ny4xCgo=

--===============1320755507310463499==--

