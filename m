Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1944.1792480405821437857
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 00:13:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=EaFh5tQr;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Q52tvdWZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a158286580-cb427d21-cabd-4433-a46c-6a219d4f8fb4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792480405;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZYSOsVh4mzzmz0Q0jeIXb/fr99306sPcELFaVl0dP/E=;
	b=EaFh5tQrwshFaSoZO0BmDl14CGW1NmK4ly7GIXTvv6BsKkeFuHbwdye6W8cEsVtK
	YIW9hDzlZsrf3T2I4ezKM0HtXO8SekRatjGWIuMZnmL8z/vYgWDeLoO0IGmnFIgBoQO
	7QB5wH/+kevrLYcbyySaeoAjfFvxeSTozL9gbU5Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792480405;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZYSOsVh4mzzmz0Q0jeIXb/fr99306sPcELFaVl0dP/E=;
	b=Q52tvdWZgwANEJPSz1eEezrU8zR9CjWBTXKnv2iW21Lc3kC5BF3huwiVbuz4k2MZ
	Fpk8n9+zirwNE/K0tY/1qc2vy0v1BHALK1GLf5K9L9RrKeVPXblBNZNNU7T/LP4VhjI
	dLJi9+yh6g/e6/almnoh/XzXWjAk4uiSHZxpfWY8=
Content-Type: multipart/mixed; boundary="===============1812246079115552951=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-markdown: upgrading to 3.11.2 SUCCEEDED
Message-ID: <010101a158286580-cb427d21-cabd-4433-a46c-6a219d4f8fb4-000000@us-west-2.amazonses.com>
Date: Tue, 20 Oct 2026 07:13:24 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.20-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 07:13:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248230

--===============1812246079115552951==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-markdown* to *3.11.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-markdown-upgrade-3.11.1-3.11.2.patch
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
From 7acc3fc6eea97d3e8fbdd1b1deb8d8336285b95f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 20 Oct 2026 06:27:43 +0000
Subject: [PATCH] python3-markdown: upgrade 3.11.1 -> 3.11.2

## [3.11.2] - 2026-10-19
### Fixed
---
 .../{python3-markdown_3.11.1.bb => python3-markdown_3.11.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-markdown_3.11.1.bb => python3-markdown_3.11.2.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-markdown_3.11.1.bb b/meta/recipes-devtools/python/python3-markdown_3.11.2.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-markdown_3.11.1.bb
rename to meta/recipes-devtools/python/python3-markdown_3.11.2.bb
index 3611675782..fb4e7ee98c 100644
--- a/meta/recipes-devtools/python/python3-markdown_3.11.1.bb
+++ b/meta/recipes-devtools/python/python3-markdown_3.11.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=ec58cdf7cfed06a21f7a9362627a5480"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "496f4f80f9ebd3395a04c8ec9595c40bbe8ec19e9c67d21fe071a1643e876606"
+SRC_URI[sha256sum] = "87bf5d90f2d2882e2c02fcda182c2800456b985bff38913867c49706481514b0"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.47.1


--===============1812246079115552951==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-markdown-upgrade-3.11.1-3.11.2.patch"

RnJvbSA3YWNjM2ZjNmVlYTk3ZDNlOGZiZGQxYjFkZWI4ZDgzMzYyODViOTVmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMjAgT2N0IDIwMjYgMDY6Mjc6NDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW1hcmtkb3duOiB1cGdyYWRlIDMuMTEuMSAtPiAzLjExLjIKCiMjIFszLjExLjJdIC0g
MjAyNi0xMC0xOQojIyMgRml4ZWQKLS0tCiAuLi4ve3B5dGhvbjMtbWFya2Rvd25fMy4xMS4xLmJi
ID0+IHB5dGhvbjMtbWFya2Rvd25fMy4xMS4yLmJifSAgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3tweXRob24zLW1hcmtkb3duXzMuMTEuMS5iYiA9PiBweXRob24zLW1hcmtkb3du
XzMuMTEuMi5iYn0gKDc5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtbWFya2Rvd25fMy4xMS4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLW1hcmtkb3duXzMuMTEuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDc5JQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFya2Rvd25fMy4x
MS4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFy
a2Rvd25fMy4xMS4yLmJiCmluZGV4IDM2MTE2NzU3ODIuLmZiNGU3ZWU5OGMgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXJrZG93bl8zLjExLjEuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1hcmtkb3duXzMuMTEu
Mi5iYgpAQCAtNSw3ICs1LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS5t
ZDttZDU9ZWM1OGNkZjdjZmVkMDZhMjFmN2E5MzYyNjI3YTU0ODAiCiAKIGluaGVyaXQgcHlwaSBw
eXRob25fc2V0dXB0b29sc19idWlsZF9tZXRhCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI0OTZm
NGY4MGY5ZWJkMzM5NWEwNGM4ZWM5NTk1YzQwYmJlOGVjMTllOWM2N2QyMWZlMDcxYTE2NDNlODc2
NjA2IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjg3YmY1ZDkwZjJkMjg4MmUyYzAyZmNkYTE4MmMy
ODAwNDU2Yjk4NWJmZjM4OTEzODY3YzQ5NzA2NDgxNTE0YjAiCiAKIEJCQ0xBU1NFWFRFTkQgPSAi
bmF0aXZlIG5hdGl2ZXNkayIKIAotLSAKMi40Ny4xCgo=

--===============1812246079115552951==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-markdown: PKGV changed from 3.11.1 [default] to 3.11.2 [default]
packages/x86-64-v3-poky-linux/python3-markdown: SRC_URI changed from "https://files.pythonhosted.org/packages/source/m/markdown/markdown-3.11.1.tar.gz" to "https://files.pythonhosted.org/packages/source/m/markdown/markdown-3.11.2.tar.gz"
packages/x86-64-v3-poky-linux/python3-markdown: PV changed from "3.11.1" to "3.11.2"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-dbg: PKGV changed from 3.11.1 [default] to 3.11.2 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-dbg: PV changed from "3.11.1" to "3.11.2"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-dev: PKGV changed from 3.11.1 [default] to 3.11.2 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-dev: PV changed from "3.11.1" to "3.11.2"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-doc: PKGV changed from 3.11.1 [default] to 3.11.2 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-doc: PV changed from "3.11.1" to "3.11.2"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-locale: PKGV changed from 3.11.1 [default] to 3.11.2 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-locale: PV changed from "3.11.1" to "3.11.2"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-src: PKGV changed from 3.11.1 [default] to 3.11.2 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-src: PV changed from "3.11.1" to "3.11.2"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-staticdev: PKGV changed from 3.11.1 [default] to 3.11.2 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-staticdev: PV changed from "3.11.1" to "3.11.2"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown: PKGV changed from 3.11.1 [default] to 3.11.2 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown: PV changed from "3.11.1" to "3.11.2"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown: PKGSIZE changed from 824829 to 811425 (-2%)
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown: FILELIST: directory renamed /usr/lib/python3.14/site-packages/markdown-3.11.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/markdown-3.11.2.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/markdown-3.11.1.dist-info -> /usr/lib/python3.14/site-packages/markdown-3.11.2.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-markdown (sysroot):
  /usr/lib/python3.14/site-packages/markdown-3.11.1.dist-info moved to /usr/lib/python3.14/site-packages/markdown-3.11.2.dist-info

--===============1812246079115552951==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown: FILELIST: directory renamed /usr/lib/python3.14/site-packages/markdown-3.11.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/markdown-3.11.2.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/markdown-3.11.1.dist-info -> /usr/lib/python3.14/site-packages/markdown-3.11.2.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-markdown (sysroot):
  /usr/lib/python3.14/site-packages/markdown-3.11.1.dist-info moved to /usr/lib/python3.14/site-packages/markdown-3.11.2.dist-info

--===============1812246079115552951==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-markdown-changelog.txt"

## [3.11.2] - 2026-10-19
### Fixed

--===============1812246079115552951==--
