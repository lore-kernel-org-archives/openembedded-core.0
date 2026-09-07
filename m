Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 958C7C79F9E
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 05:23:47 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28212.1788758621411201223
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Sep 2026 22:23:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=YVZJFNjd;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=BZ8ZVObG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a07a5277d8-6eba1326-0ffa-42d7-a8a5-0d65e88002a8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1788758620;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YLSejdxje5ugxkDI4ST6Jt9+Zlatq/oJAu1rYJUtZmk=;
	b=YVZJFNjd7eAZrizZl4nxnKttvpV1bh388RsibD6Oecv/xcezINVm+7+eqyJyTsVm
	bgMe+u0RwK8I53jpHZDtCVmnJ5DqWqPbVju/wqaYD85wlc2LVLPL+l9x6GGKkKuNKkq
	H4Bg9cBJE52HzsGv26cZe76fiBsA3WLxSnsy7+jU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1788758620;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YLSejdxje5ugxkDI4ST6Jt9+Zlatq/oJAu1rYJUtZmk=;
	b=BZ8ZVObGBgOGUBnPr9wUWaf62Htgsy/NfJaH/smMEbbjZpXbjjJCh8cdTLF7Wc9c
	vA2r9vlRK9sTvXCn2CbILqDB+xdI5bZ7IGY2ij+HWGTazkWaKDT6bG+4tgKatb+0wZH
	pKi+xsE+XZk7MJ8grTHXOYfKg8L/mpIaZjXJ9RWg=
Content-Type: multipart/mixed; boundary="===============4850668472528427894=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-git: upgrading to 3.1.62 SUCCEEDED
Message-ID: <010101a07a5277d8-6eba1326-0ffa-42d7-a8a5-0d65e88002a8-000000@us-west-2.amazonses.com>
Date: Mon, 7 Sep 2026 05:23:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.07-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 05:23:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245226

--===============4850668472528427894==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-git* to *3.1.62* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-git-upgrade-3.1.61-3.1.62.patch
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
From be962d8b51773e79b2a023efbb6f256b2ce2e496 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 7 Sep 2026 05:16:25 +0000
Subject: [PATCH] python3-git: upgrade 3.1.61 -> 3.1.62

Source: doc/source/changes.rst

3.1.62
======

Security fixes for

* https://github.com/gitpython-developers/GitPython/security/advisories/GHSA-59cr-6r3x-644w

If you can, also try and provide feedback on the upcoming v4 branch
https://github.com/gitpython-developers/GitPython/pull/2177 - patches welcome.

See the following for all changes.
https://github.com/gitpython-developers/GitPython/releases/tag/3.1.62
---
 .../python/{python3-git_3.1.61.bb => python3-git_3.1.62.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-git_3.1.61.bb => python3-git_3.1.62.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.61.bb b/meta/recipes-devtools/python/python3-git_3.1.62.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-git_3.1.61.bb
rename to meta/recipes-devtools/python/python3-git_3.1.62.bb
index 975579e656..ad912886bb 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.61.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.62.bb
@@ -14,7 +14,7 @@ CVE_PRODUCT = "gitpython_project:gitpython"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "f51c24d8c0f733a195447385f5774a5dfe8767f5acfd7994a33755644c6ecc95"
+SRC_URI[sha256sum] = "1791de66309bc0c7cfca40bf8d2e3de7ca091cbf94e6051be1ad0722c61062af"
 
 DEPENDS += " python3-gitdb"
 
-- 
2.47.1


--===============4850668472528427894==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-git: PV changed from "3.1.61" to "3.1.62"
packages/x86-64-v3-poky-linux/python3-git: SRC_URI changed from "https://files.pythonhosted.org/packages/source/g/gitpython/gitpython-3.1.61.tar.gz" to "https://files.pythonhosted.org/packages/source/g/gitpython/gitpython-3.1.62.tar.gz"
packages/x86-64-v3-poky-linux/python3-git: PKGV changed from 3.1.61 [default] to 3.1.62 [default]
packages/x86-64-v3-poky-linux/python3-git/python3-git-dbg: PV changed from "3.1.61" to "3.1.62"
packages/x86-64-v3-poky-linux/python3-git/python3-git-dbg: PKGV changed from 3.1.61 [default] to 3.1.62 [default]
packages/x86-64-v3-poky-linux/python3-git/python3-git-dev: PV changed from "3.1.61" to "3.1.62"
packages/x86-64-v3-poky-linux/python3-git/python3-git-dev: PKGV changed from 3.1.61 [default] to 3.1.62 [default]
packages/x86-64-v3-poky-linux/python3-git/python3-git-doc: PV changed from "3.1.61" to "3.1.62"
packages/x86-64-v3-poky-linux/python3-git/python3-git-doc: PKGV changed from 3.1.61 [default] to 3.1.62 [default]
packages/x86-64-v3-poky-linux/python3-git/python3-git-locale: PV changed from "3.1.61" to "3.1.62"
packages/x86-64-v3-poky-linux/python3-git/python3-git-locale: PKGV changed from 3.1.61 [default] to 3.1.62 [default]
packages/x86-64-v3-poky-linux/python3-git/python3-git-src: PV changed from "3.1.61" to "3.1.62"
packages/x86-64-v3-poky-linux/python3-git/python3-git-src: PKGV changed from 3.1.61 [default] to 3.1.62 [default]
packages/x86-64-v3-poky-linux/python3-git/python3-git-staticdev: PV changed from "3.1.61" to "3.1.62"
packages/x86-64-v3-poky-linux/python3-git/python3-git-staticdev: PKGV changed from 3.1.61 [default] to 3.1.62 [default]
packages/x86-64-v3-poky-linux/python3-git/python3-git: PKGSIZE changed from 1645411 to 1652294 (+0%)
packages/x86-64-v3-poky-linux/python3-git/python3-git: PV changed from "3.1.61" to "3.1.62"
packages/x86-64-v3-poky-linux/python3-git/python3-git: FILELIST: directory renamed /usr/lib/python3.14/site-packages/gitpython-3.1.61.dist-info/licenses -> /usr/lib/python3.14/site-packages/gitpython-3.1.62.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/gitpython-3.1.61.dist-info -> /usr/lib/python3.14/site-packages/gitpython-3.1.62.dist-info
packages/x86-64-v3-poky-linux/python3-git/python3-git: PKGV changed from 3.1.61 [default] to 3.1.62 [default]
Changes to packages/x86-64-v3-poky-linux/python3-git (sysroot):
  /usr/lib/python3.14/site-packages/gitpython-3.1.61.dist-info moved to /usr/lib/python3.14/site-packages/gitpython-3.1.62.dist-info

--===============4850668472528427894==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-git/python3-git: FILELIST: directory renamed /usr/lib/python3.14/site-packages/gitpython-3.1.61.dist-info -> /usr/lib/python3.14/site-packages/gitpython-3.1.62.dist-info, directory renamed /usr/lib/python3.14/site-packages/gitpython-3.1.61.dist-info/licenses -> /usr/lib/python3.14/site-packages/gitpython-3.1.62.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-git (sysroot):
  /usr/lib/python3.14/site-packages/gitpython-3.1.61.dist-info moved to /usr/lib/python3.14/site-packages/gitpython-3.1.62.dist-info

--===============4850668472528427894==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-git-upgrade-3.1.61-3.1.62.patch"

RnJvbSBiZTk2MmQ4YjUxNzczZTc5YjJhMDIzZWZiYjZmMjU2YjJjZTJlNDk2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgNyBTZXAgMjAyNiAwNToxNjoyNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtZ2l0OiB1cGdyYWRlIDMuMS42MSAtPiAzLjEuNjIKClNvdXJjZTogZG9jL3NvdXJjZS9j
aGFuZ2VzLnJzdAoKMy4xLjYyCj09PT09PQoKU2VjdXJpdHkgZml4ZXMgZm9yCgoqIGh0dHBzOi8v
Z2l0aHViLmNvbS9naXRweXRob24tZGV2ZWxvcGVycy9HaXRQeXRob24vc2VjdXJpdHkvYWR2aXNv
cmllcy9HSFNBLTU5Y3ItNnIzeC02NDR3CgpJZiB5b3UgY2FuLCBhbHNvIHRyeSBhbmQgcHJvdmlk
ZSBmZWVkYmFjayBvbiB0aGUgdXBjb21pbmcgdjQgYnJhbmNoCmh0dHBzOi8vZ2l0aHViLmNvbS9n
aXRweXRob24tZGV2ZWxvcGVycy9HaXRQeXRob24vcHVsbC8yMTc3IC0gcGF0Y2hlcyB3ZWxjb21l
LgoKU2VlIHRoZSBmb2xsb3dpbmcgZm9yIGFsbCBjaGFuZ2VzLgpodHRwczovL2dpdGh1Yi5jb20v
Z2l0cHl0aG9uLWRldmVsb3BlcnMvR2l0UHl0aG9uL3JlbGVhc2VzL3RhZy8zLjEuNjIKLS0tCiAu
Li4vcHl0aG9uL3tweXRob24zLWdpdF8zLjEuNjEuYmIgPT4gcHl0aG9uMy1naXRfMy4xLjYyLmJi
fSAgICAgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWdpdF8zLjEu
NjEuYmIgPT4gcHl0aG9uMy1naXRfMy4xLjYyLmJifSAoOTIlKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1naXRfMy4xLjYxLmJiIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWdpdF8zLjEuNjIuYmIKc2ltaWxhcml0eSBpbmRl
eCA5MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWdp
dF8zLjEuNjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1naXRfMy4xLjYyLmJiCmluZGV4IDk3NTU3OWU2NTYuLmFkOTEyODg2YmIgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1naXRfMy4xLjYxLmJiCisrKyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1naXRfMy4xLjYyLmJiCkBAIC0x
NCw3ICsxNCw3IEBAIENWRV9QUk9EVUNUID0gImdpdHB5dGhvbl9wcm9qZWN0OmdpdHB5dGhvbiIK
IAogaW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEKIAotU1JDX1VSSVtz
aGEyNTZzdW1dID0gImY1MWMyNGQ4YzBmNzMzYTE5NTQ0NzM4NWY1Nzc0YTVkZmU4NzY3ZjVhY2Zk
Nzk5NGEzMzc1NTY0NGM2ZWNjOTUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMTc5MWRlNjYzMDli
YzBjN2NmY2E0MGJmOGQyZTNkZTdjYTA5MWNiZjk0ZTYwNTFiZTFhZDA3MjJjNjEwNjJhZiIKIAog
REVQRU5EUyArPSAiIHB5dGhvbjMtZ2l0ZGIiCiAKLS0gCjIuNDcuMQoK

--===============4850668472528427894==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-git-changelog.txt"

Changelog for python3-git: 3.1.61 -> 3.1.62
Source: doc/source/changes.rst

3.1.62
======

Security fixes for

* https://github.com/gitpython-developers/GitPython/security/advisories/GHSA-59cr-6r3x-644w

If you can, also try and provide feedback on the upcoming v4 branch
https://github.com/gitpython-developers/GitPython/pull/2177 - patches welcome.

See the following for all changes.
https://github.com/gitpython-developers/GitPython/releases/tag/3.1.62

--===============4850668472528427894==--

