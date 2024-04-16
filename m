Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 113D3C27C53
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:10 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.13596.1713248039179901627
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:13:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ekNLkcQE;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=CGLNhmnx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018ee58a6ed2-c5d1267e-1df8-4726-a313-a1f1150587d9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248038;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EXlOALXNkVg8xUNxM4K3lViO3bgWK3UNHnXP4SLH+T0=;
	b=ekNLkcQEvGF6yi8iAzEq2DFjbfB2DHV5uMS/Crv54TaQJOrPep8CKwY+jr7G7iA7
	m5FapBJfNE8eDRnUOmNfyZdZdCkOxTPkqWx6TIvnBV6hTcTv48Z5WOdKHquUYAtFS/Q
	RJhEwpgnvMBM/kg+hFywsSZ0DtiXhColno9sjWEg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248038;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EXlOALXNkVg8xUNxM4K3lViO3bgWK3UNHnXP4SLH+T0=;
	b=CGLNhmnx3qv1Z/Mi9GHWUpoED9QtmL/VkZY5UaCjKdjxsvhIxGgZVFPH7JV3F6Yo
	2AGP2xTpyFhc0VQWQeHKKb0iQUyfiynh63RIis561BcgVRzK7jf0BWYi5RUAHAz4V2j
	OfFHF1GjKhp3p+aa/qKwSLTJHvqErVdtApAmidcA=
Content-Type: multipart/mixed; boundary="===============2972661200580495893=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-git: upgrading to 3.1.43 SUCCEEDED
Message-ID: <0101018ee58a6ed2-c5d1267e-1df8-4726-a313-a1f1150587d9-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:13:58 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198295

--===============2972661200580495893==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-git* to *3.1.43* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-git-upgrade-3.1.42-3.1.43.patch
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
From fb3e23e4a4d5b755705618e91d5cbe416045defa Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Apr 2024 19:03:12 +0000
Subject: [PATCH] python3-git: upgrade 3.1.42 -> 3.1.43

---
 .../python/{python3-git_3.1.42.bb => python3-git_3.1.43.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-git_3.1.42.bb => python3-git_3.1.43.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.42.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-git_3.1.42.bb
rename to meta/recipes-devtools/python/python3-git_3.1.43.bb
index 19885a58c7..45c988117b 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.42.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "GitPython"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "2d99869e0fef71a73cbd242528105af1d6c1b108c60dfabd994bf292f76c3ceb"
+SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
 DEPENDS += " python3-gitdb"
 
-- 
2.42.0


--===============2972661200580495893==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-git (sysroot):
  /usr/lib/python3.12/site-packages/GitPython-3.1.42.dist-info moved to /usr/lib/python3.12/site-packages/GitPython-3.1.43.dist-info

--===============2972661200580495893==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-git: PKGV changed from 3.1.42 [default] to 3.1.43 [default]
packages/core2-64-poky-linux/python3-git: SRC_URI changed from "https://files.pythonhosted.org/packages/source/G/GitPython/GitPython-3.1.42.tar.gz;downloadfilename=GitPython-3.1.42.tar.gz" to "https://files.pythonhosted.org/packages/source/G/GitPython/GitPython-3.1.43.tar.gz;downloadfilename=GitPython-3.1.43.tar.gz"
packages/core2-64-poky-linux/python3-git: PV changed from "3.1.42" to "3.1.43"
packages/core2-64-poky-linux/python3-git/python3-git-dbg: PKGV changed from 3.1.42 [default] to 3.1.43 [default]
packages/core2-64-poky-linux/python3-git/python3-git-dbg: PV changed from "3.1.42" to "3.1.43"
packages/core2-64-poky-linux/python3-git/python3-git-dev: PKGV changed from 3.1.42 [default] to 3.1.43 [default]
packages/core2-64-poky-linux/python3-git/python3-git-dev: PV changed from "3.1.42" to "3.1.43"
packages/core2-64-poky-linux/python3-git/python3-git-doc: PKGV changed from 3.1.42 [default] to 3.1.43 [default]
packages/core2-64-poky-linux/python3-git/python3-git-doc: PV changed from "3.1.42" to "3.1.43"
packages/core2-64-poky-linux/python3-git/python3-git-locale: PKGV changed from 3.1.42 [default] to 3.1.43 [default]
packages/core2-64-poky-linux/python3-git/python3-git-locale: PV changed from "3.1.42" to "3.1.43"
packages/core2-64-poky-linux/python3-git/python3-git-src: PKGV changed from 3.1.42 [default] to 3.1.43 [default]
packages/core2-64-poky-linux/python3-git/python3-git-src: PV changed from "3.1.42" to "3.1.43"
packages/core2-64-poky-linux/python3-git/python3-git-staticdev: PKGV changed from 3.1.42 [default] to 3.1.43 [default]
packages/core2-64-poky-linux/python3-git/python3-git-staticdev: PV changed from "3.1.42" to "3.1.43"
packages/core2-64-poky-linux/python3-git/python3-git: PKGV changed from 3.1.42 [default] to 3.1.43 [default]
packages/core2-64-poky-linux/python3-git/python3-git: PV changed from "3.1.42" to "3.1.43"
packages/core2-64-poky-linux/python3-git/python3-git: PKGSIZE changed from 1304285 to 1385441 (+6%)
Changes to packages/core2-64-poky-linux/python3-git (sysroot):
  /usr/lib/python3.12/site-packages/GitPython-3.1.42.dist-info moved to /usr/lib/python3.12/site-packages/GitPython-3.1.43.dist-info

--===============2972661200580495893==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-git-upgrade-3.1.42-3.1.43.patch"

RnJvbSBmYjNlMjNlNGE0ZDViNzU1NzA1NjE4ZTkxZDVjYmU0MTYwNDVkZWZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXByIDIwMjQgMTk6MDM6MTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWdpdDogdXBncmFkZSAzLjEuNDIgLT4gMy4xLjQzCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtZ2l0XzMuMS40Mi5iYiA9PiBweXRob24zLWdpdF8zLjEuNDMuYmJ9ICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtZ2l0XzMuMS40Mi5iYiA9PiBweXRo
b24zLWdpdF8zLjEuNDMuYmJ9ICg5MiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWdpdF8zLjEuNDIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtZ2l0XzMuMS40My5iYgpzaW1pbGFyaXR5IGluZGV4IDkyJQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZ2l0XzMuMS40Mi5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWdpdF8zLjEuNDMu
YmIKaW5kZXggMTk4ODVhNThjNy4uNDVjOTg4MTE3YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWdpdF8zLjEuNDIuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWdpdF8zLjEuNDMuYmIKQEAgLTEyLDcgKzEyLDcgQEAg
UFlQSV9QQUNLQUdFID0gIkdpdFB5dGhvbiIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1cHRv
b2xzX2J1aWxkX21ldGEKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjJkOTk4NjllMGZlZjcxYTcz
Y2JkMjQyNTI4MTA1YWYxZDZjMWIxMDhjNjBkZmFiZDk5NGJmMjkyZjc2YzNjZWIiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiMzVmMzE0YTlmODc4NDY3ZjU0NTNjYzFmZWUyOTVjM2UxOGU1MmYxYjk5
ZjEwZjZjZjViMTY4MmU5NjhhOWU3YyIKIAogREVQRU5EUyArPSAiIHB5dGhvbjMtZ2l0ZGIiCiAK
LS0gCjIuNDIuMAoK

--===============2972661200580495893==--

