Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.487.1793944897109022030
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 22:01:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=grHfXvHN;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=JawhryUg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a1af72cd64-0f47153b-2de7-4f19-9dff-301a6c389ebe-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793944899;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9GSf8haN0oPfaIQ22tXJqubc79Pg9tekGyIkRstKDKU=;
	b=grHfXvHNC+wWSMQSOlvqTe3x9Utz8UwaoIMaYsWXQBF+uK4VRZxFjau9w1X4+VIz
	Zeu3KJgFhjhhR/XyKaXlTVD+jGpA8VedoJoB54bTQ/GfRX5tR4nr3h47PaNlWFemGpu
	KwjgeLJNAI/azXmG4XEaOpgmSFbP4NqCN9aBkyR4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793944899;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9GSf8haN0oPfaIQ22tXJqubc79Pg9tekGyIkRstKDKU=;
	b=JawhryUgXk+f+5FIA5CXTAXUwNPKvYpvyw2vd3uJl3to3iYqVOlUACAW7/1Nhy/j
	zBhBctc+WsJ+iaeoz8kURNHZ4h3BYa8+mtrPEjlce19CHf96181kUCNWYmNPcJJsZ4a
	ddSjSP/DxV6ZtsHIuw4y16zaVpTydnoh9dPszX04=
Content-Type: multipart/mixed; boundary="===============8206501290396406068=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-markdown: upgrading to 3.11.3 SUCCEEDED
Message-ID: <010101a1af72cd64-0f47153b-2de7-4f19-9dff-301a6c389ebe-000000@us-west-2.amazonses.com>
Date: Fri, 6 Nov 2026 06:01:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.06-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 06:01:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249588

--===============8206501290396406068==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-markdown* to *3.11.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-markdown-upgrade-3.11.1-3.11.3.patch
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
From 03295e82308fbf0d3bb12be81169bdb6a97efc76 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 6 Nov 2026 05:50:25 +0000
Subject: [PATCH] python3-markdown: upgrade 3.11.1 -> 3.11.3

## [3.11.3] - 2026-11-05
### Fixed
## [3.11.2] - 2026-10-19
### Fixed
---
 .../{python3-markdown_3.11.1.bb => python3-markdown_3.11.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-markdown_3.11.1.bb => python3-markdown_3.11.3.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-markdown_3.11.1.bb b/meta/recipes-devtools/python/python3-markdown_3.11.3.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-markdown_3.11.1.bb
rename to meta/recipes-devtools/python/python3-markdown_3.11.3.bb
index 3611675782..3d3239337a 100644
--- a/meta/recipes-devtools/python/python3-markdown_3.11.1.bb
+++ b/meta/recipes-devtools/python/python3-markdown_3.11.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=ec58cdf7cfed06a21f7a9362627a5480"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "496f4f80f9ebd3395a04c8ec9595c40bbe8ec19e9c67d21fe071a1643e876606"
+SRC_URI[sha256sum] = "81eb91631dc97ad1efbc76019ef0f80fe90ca49ddf81546752d79989c3bfff3e"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.47.1


--===============8206501290396406068==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-markdown: PV changed from "3.11.1" to "3.11.3"
packages/x86-64-v3-poky-linux/python3-markdown: SRC_URI changed from "https://files.pythonhosted.org/packages/source/m/markdown/markdown-3.11.1.tar.gz" to "https://files.pythonhosted.org/packages/source/m/markdown/markdown-3.11.3.tar.gz"
packages/x86-64-v3-poky-linux/python3-markdown: PKGV changed from 3.11.1 [default] to 3.11.3 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-dbg: PV changed from "3.11.1" to "3.11.3"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-dbg: PKGV changed from 3.11.1 [default] to 3.11.3 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-dev: PV changed from "3.11.1" to "3.11.3"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-dev: PKGV changed from 3.11.1 [default] to 3.11.3 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-doc: PV changed from "3.11.1" to "3.11.3"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-doc: PKGV changed from 3.11.1 [default] to 3.11.3 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-locale: PV changed from "3.11.1" to "3.11.3"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-locale: PKGV changed from 3.11.1 [default] to 3.11.3 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-src: PV changed from "3.11.1" to "3.11.3"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-src: PKGV changed from 3.11.1 [default] to 3.11.3 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-staticdev: PV changed from "3.11.1" to "3.11.3"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-staticdev: PKGV changed from 3.11.1 [default] to 3.11.3 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown: PV changed from "3.11.1" to "3.11.3"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown: FILELIST: directory renamed /usr/lib/python3.14/site-packages/markdown-3.11.1.dist-info -> /usr/lib/python3.14/site-packages/markdown-3.11.3.dist-info, directory renamed /usr/lib/python3.14/site-packages/markdown-3.11.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/markdown-3.11.3.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown: PKGV changed from 3.11.1 [default] to 3.11.3 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown: PKGSIZE changed from 824829 to 823053 (-0%)
Changes to packages/x86-64-v3-poky-linux/python3-markdown (sysroot):
  /usr/lib/python3.14/site-packages/markdown-3.11.1.dist-info moved to /usr/lib/python3.14/site-packages/markdown-3.11.3.dist-info

--===============8206501290396406068==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-markdown-changelog.txt"

## [3.11.3] - 2026-11-05
### Fixed
## [3.11.2] - 2026-10-19
### Fixed

--===============8206501290396406068==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-markdown-upgrade-3.11.1-3.11.3.patch"

RnJvbSAwMzI5NWU4MjMwOGZiZjBkM2JiMTJiZTgxMTY5YmRiNmE5N2VmYzc2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgNiBOb3YgMjAyNiAwNTo1MDoyNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbWFya2Rvd246IHVwZ3JhZGUgMy4xMS4xIC0+IDMuMTEuMwoKIyMgWzMuMTEuM10gLSAy
MDI2LTExLTA1CiMjIyBGaXhlZAojIyBbMy4xMS4yXSAtIDIwMjYtMTAtMTkKIyMjIEZpeGVkCi0t
LQogLi4uL3tweXRob24zLW1hcmtkb3duXzMuMTEuMS5iYiA9PiBweXRob24zLW1hcmtkb3duXzMu
MTEuMy5iYn0gIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1tYXJr
ZG93bl8zLjExLjEuYmIgPT4gcHl0aG9uMy1tYXJrZG93bl8zLjExLjMuYmJ9ICg3OSUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1hcmtkb3duXzMu
MTEuMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXJrZG93bl8z
LjExLjMuYmIKc2ltaWxhcml0eSBpbmRleCA3OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLW1hcmtkb3duXzMuMTEuMS5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1hcmtkb3duXzMuMTEuMy5iYgppbmRleCAz
NjExNjc1NzgyLi4zZDMyMzkzMzdhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtbWFya2Rvd25fMy4xMS4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1tYXJrZG93bl8zLjExLjMuYmIKQEAgLTUsNyArNSw3IEBAIExJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UubWQ7bWQ1PWVjNThjZGY3Y2ZlZDA2YTIx
ZjdhOTM2MjYyN2E1NDgwIgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRf
bWV0YQogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNDk2ZjRmODBmOWViZDMzOTVhMDRjOGVjOTU5
NWM0MGJiZThlYzE5ZTljNjdkMjFmZTA3MWExNjQzZTg3NjYwNiIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICI4MWViOTE2MzFkYzk3YWQxZWZiYzc2MDE5ZWYwZjgwZmU5MGNhNDlkZGY4MTU0Njc1MmQ3
OTk4OWMzYmZmZjNlIgogCiBCQkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiCiAKLS0g
CjIuNDcuMQoK

--===============8206501290396406068==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown: FILELIST: directory renamed /usr/lib/python3.14/site-packages/markdown-3.11.1.dist-info -> /usr/lib/python3.14/site-packages/markdown-3.11.3.dist-info, directory renamed /usr/lib/python3.14/site-packages/markdown-3.11.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/markdown-3.11.3.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-markdown (sysroot):
  /usr/lib/python3.14/site-packages/markdown-3.11.1.dist-info moved to /usr/lib/python3.14/site-packages/markdown-3.11.3.dist-info

--===============8206501290396406068==--
