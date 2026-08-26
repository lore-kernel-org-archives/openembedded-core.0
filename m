Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76EEAC5DF97
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 05:59:58 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6366.1787723991667113181
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 22:59:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=aYtJOPNb;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Gvbx/biv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a03ca74707-c4a18629-9be9-4d7c-9ffc-b7d244f9cd82-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1787723990;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dxC8+QCgA7DytFyyS0hKhwAKCEkmoiCCBoiqp4gHCfw=;
	b=aYtJOPNb6cPwDt17y70xPPE+7NAC0qSKy7sioJE6npt2EtCsE2SXeGHEOCizP5Sz
	H+SWjJW90FPjRSYOf6movS2aEEHGs9gfdwjktML1LgJJpduSGN4BU6pmNe8eDrnR9gi
	W/MArnrfUib0FFX8sQ8KtOwez29sDdXRDABF7apo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1787723990;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dxC8+QCgA7DytFyyS0hKhwAKCEkmoiCCBoiqp4gHCfw=;
	b=Gvbx/bivsM7MOS61vr2o88fiSyOtEzigxpFDlHiLCtKeue+TWqGFEsfyt8tgvetj
	CW45gwncP6ATbhry/8xeNJebzZsWk/EHCA6Q5K6O8p4e9r7f11oTsREQqCYs/aoAwBM
	HlccJ3UxoA21NIqzc6DX3JQ8gYBCcyheAHt0RhjE=
Content-Type: multipart/mixed; boundary="===============4529355687644172439=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-git: upgrading to 3.1.60 SUCCEEDED
Message-ID: <010101a03ca74707-c4a18629-9be9-4d7c-9ffc-b7d244f9cd82-000000@us-west-2.amazonses.com>
Date: Wed, 26 Aug 2026 05:59:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.26-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 05:59:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244308

--===============4529355687644172439==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-git* to *3.1.60* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-git-upgrade-3.1.59-3.1.60.patch
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
From 0ba036ee6c9af10748e9936ef98c0052aa99d4c6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 26 Aug 2026 05:48:43 +0000
Subject: [PATCH] python3-git: upgrade 3.1.59 -> 3.1.60

Source: doc/source/changes.rst

3.1.60
======

Security fixes for

* https://github.com/gitpython-developers/GitPython/security/advisories/GHSA-g5vv-9gxw-82hx
* https://github.com/gitpython-developers/GitPython/security/advisories/GHSA-whh4-5q6c-9v3x
* https://github.com/gitpython-developers/GitPython/security/advisories/GHSA-239g-whfq-7xj9

If you can, also try and provide feedback on the upcoming v4 branch
https://github.com/gitpython-developers/GitPython/pull/2177 - patches welcome.

See the following for all changes.
https://github.com/gitpython-developers/GitPython/releases/tag/3.1.60
---
 .../python/{python3-git_3.1.59.bb => python3-git_3.1.60.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-git_3.1.59.bb => python3-git_3.1.60.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.59.bb b/meta/recipes-devtools/python/python3-git_3.1.60.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-git_3.1.59.bb
rename to meta/recipes-devtools/python/python3-git_3.1.60.bb
index 92e5977789..5becc0af58 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.59.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.60.bb
@@ -14,7 +14,7 @@ CVE_PRODUCT = "gitpython_project:gitpython"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "0a1475cfdc38a5bfba1a3e9a4a9da52a39749ecec322b772915c019f94e5b7e4"
+SRC_URI[sha256sum] = "e936431879fa85581b4311fa63492ea52251909e2d655b6529c704c904ddcc24"
 
 DEPENDS += " python3-gitdb"
 
-- 
2.47.1


--===============4529355687644172439==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-git: SRC_URI changed from "https://files.pythonhosted.org/packages/source/g/gitpython/gitpython-3.1.59.tar.gz;downloadfilename=gitpython-3.1.59.tar.gz" to "https://files.pythonhosted.org/packages/source/g/gitpython/gitpython-3.1.60.tar.gz;downloadfilename=gitpython-3.1.60.tar.gz"
packages/x86-64-v3-poky-linux/python3-git: PKGV changed from 3.1.59 [default] to 3.1.60 [default]
packages/x86-64-v3-poky-linux/python3-git: PV changed from "3.1.59" to "3.1.60"
packages/x86-64-v3-poky-linux/python3-git/python3-git-dbg: PKGV changed from 3.1.59 [default] to 3.1.60 [default]
packages/x86-64-v3-poky-linux/python3-git/python3-git-dbg: PV changed from "3.1.59" to "3.1.60"
packages/x86-64-v3-poky-linux/python3-git/python3-git-dev: PKGV changed from 3.1.59 [default] to 3.1.60 [default]
packages/x86-64-v3-poky-linux/python3-git/python3-git-dev: PV changed from "3.1.59" to "3.1.60"
packages/x86-64-v3-poky-linux/python3-git/python3-git-doc: PKGV changed from 3.1.59 [default] to 3.1.60 [default]
packages/x86-64-v3-poky-linux/python3-git/python3-git-doc: PV changed from "3.1.59" to "3.1.60"
packages/x86-64-v3-poky-linux/python3-git/python3-git-locale: PKGV changed from 3.1.59 [default] to 3.1.60 [default]
packages/x86-64-v3-poky-linux/python3-git/python3-git-locale: PV changed from "3.1.59" to "3.1.60"
packages/x86-64-v3-poky-linux/python3-git/python3-git-src: PKGV changed from 3.1.59 [default] to 3.1.60 [default]
packages/x86-64-v3-poky-linux/python3-git/python3-git-src: PV changed from "3.1.59" to "3.1.60"
packages/x86-64-v3-poky-linux/python3-git/python3-git-staticdev: PKGV changed from 3.1.59 [default] to 3.1.60 [default]
packages/x86-64-v3-poky-linux/python3-git/python3-git-staticdev: PV changed from "3.1.59" to "3.1.60"
packages/x86-64-v3-poky-linux/python3-git/python3-git: PKGV changed from 3.1.59 [default] to 3.1.60 [default]
packages/x86-64-v3-poky-linux/python3-git/python3-git: FILELIST: directory renamed /usr/lib/python3.14/site-packages/gitpython-3.1.59.dist-info -> /usr/lib/python3.14/site-packages/gitpython-3.1.60.dist-info, directory renamed /usr/lib/python3.14/site-packages/gitpython-3.1.59.dist-info/licenses -> /usr/lib/python3.14/site-packages/gitpython-3.1.60.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-git/python3-git: PKGSIZE changed from 1634336 to 1643376 (+1%)
packages/x86-64-v3-poky-linux/python3-git/python3-git: PV changed from "3.1.59" to "3.1.60"
Changes to packages/x86-64-v3-poky-linux/python3-git (sysroot):
  /usr/lib/python3.14/site-packages/gitpython-3.1.59.dist-info moved to /usr/lib/python3.14/site-packages/gitpython-3.1.60.dist-info

--===============4529355687644172439==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-git-upgrade-3.1.59-3.1.60.patch"

RnJvbSAwYmEwMzZlZTZjOWFmMTA3NDhlOTkzNmVmOThjMDA1MmFhOTlkNGM2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjYgQXVnIDIwMjYgMDU6NDg6NDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWdpdDogdXBncmFkZSAzLjEuNTkgLT4gMy4xLjYwCgpTb3VyY2U6IGRvYy9zb3VyY2Uv
Y2hhbmdlcy5yc3QKCjMuMS42MAo9PT09PT0KClNlY3VyaXR5IGZpeGVzIGZvcgoKKiBodHRwczov
L2dpdGh1Yi5jb20vZ2l0cHl0aG9uLWRldmVsb3BlcnMvR2l0UHl0aG9uL3NlY3VyaXR5L2Fkdmlz
b3JpZXMvR0hTQS1nNXZ2LTlneHctODJoeAoqIGh0dHBzOi8vZ2l0aHViLmNvbS9naXRweXRob24t
ZGV2ZWxvcGVycy9HaXRQeXRob24vc2VjdXJpdHkvYWR2aXNvcmllcy9HSFNBLXdoaDQtNXE2Yy05
djN4CiogaHR0cHM6Ly9naXRodWIuY29tL2dpdHB5dGhvbi1kZXZlbG9wZXJzL0dpdFB5dGhvbi9z
ZWN1cml0eS9hZHZpc29yaWVzL0dIU0EtMjM5Zy13aGZxLTd4ajkKCklmIHlvdSBjYW4sIGFsc28g
dHJ5IGFuZCBwcm92aWRlIGZlZWRiYWNrIG9uIHRoZSB1cGNvbWluZyB2NCBicmFuY2gKaHR0cHM6
Ly9naXRodWIuY29tL2dpdHB5dGhvbi1kZXZlbG9wZXJzL0dpdFB5dGhvbi9wdWxsLzIxNzcgLSBw
YXRjaGVzIHdlbGNvbWUuCgpTZWUgdGhlIGZvbGxvd2luZyBmb3IgYWxsIGNoYW5nZXMuCmh0dHBz
Oi8vZ2l0aHViLmNvbS9naXRweXRob24tZGV2ZWxvcGVycy9HaXRQeXRob24vcmVsZWFzZXMvdGFn
LzMuMS42MAotLS0KIC4uLi9weXRob24ve3B5dGhvbjMtZ2l0XzMuMS41OS5iYiA9PiBweXRob24z
LWdpdF8zLjEuNjAuYmJ9ICAgICB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5
dGhvbjMtZ2l0XzMuMS41OS5iYiA9PiBweXRob24zLWdpdF8zLjEuNjAuYmJ9ICg5MiUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWdpdF8zLjEuNTku
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZ2l0XzMuMS42MC5iYgpz
aW1pbGFyaXR5IGluZGV4IDkyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtZ2l0XzMuMS41OS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWdpdF8zLjEuNjAuYmIKaW5kZXggOTJlNTk3Nzc4OS4uNWJlY2MwYWY1
OCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWdpdF8z
LjEuNTkuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWdpdF8z
LjEuNjAuYmIKQEAgLTE0LDcgKzE0LDcgQEAgQ1ZFX1BST0RVQ1QgPSAiZ2l0cHl0aG9uX3Byb2pl
Y3Q6Z2l0cHl0aG9uIgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0
YQogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMGExNDc1Y2ZkYzM4YTViZmJhMWEzZTlhNGE5ZGE1
MmEzOTc0OWVjZWMzMjJiNzcyOTE1YzAxOWY5NGU1YjdlNCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICJlOTM2NDMxODc5ZmE4NTU4MWI0MzExZmE2MzQ5MmVhNTIyNTE5MDllMmQ2NTViNjUyOWM3MDRj
OTA0ZGRjYzI0IgogCiBERVBFTkRTICs9ICIgcHl0aG9uMy1naXRkYiIKIAotLSAKMi40Ny4xCgo=

--===============4529355687644172439==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-git-changelog.txt"

Changelog for python3-git: 3.1.59 -> 3.1.60
Source: doc/source/changes.rst

3.1.60
======

Security fixes for

* https://github.com/gitpython-developers/GitPython/security/advisories/GHSA-g5vv-9gxw-82hx
* https://github.com/gitpython-developers/GitPython/security/advisories/GHSA-whh4-5q6c-9v3x
* https://github.com/gitpython-developers/GitPython/security/advisories/GHSA-239g-whfq-7xj9

If you can, also try and provide feedback on the upcoming v4 branch
https://github.com/gitpython-developers/GitPython/pull/2177 - patches welcome.

See the following for all changes.
https://github.com/gitpython-developers/GitPython/releases/tag/3.1.60

--===============4529355687644172439==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-git/python3-git: FILELIST: directory renamed /usr/lib/python3.14/site-packages/gitpython-3.1.59.dist-info -> /usr/lib/python3.14/site-packages/gitpython-3.1.60.dist-info, directory renamed /usr/lib/python3.14/site-packages/gitpython-3.1.59.dist-info/licenses -> /usr/lib/python3.14/site-packages/gitpython-3.1.60.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-git (sysroot):
  /usr/lib/python3.14/site-packages/gitpython-3.1.59.dist-info moved to /usr/lib/python3.14/site-packages/gitpython-3.1.60.dist-info

--===============4529355687644172439==--

