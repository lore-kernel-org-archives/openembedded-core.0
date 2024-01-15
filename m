Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BFCAC48BF6
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 17:34:01 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.88858.1705340030141759937
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 09:33:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=YEi+ZX5V;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=LRGgO5x9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018d0e2fc8f4-4470b629-097b-42e8-b447-157b1eda66af-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1705340029;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zlHxc8hVsmqVsbd28Kgl955chY9aQsXtZXE99u98zOI=;
	b=YEi+ZX5VsFCquO/EtZEePRyUZTsavYEKPy6j5KJ5cg2+4W5dAEZRyEaXSStod2zo
	iUcw56Sq9QA9Nw9JvvrWrnPAB52cy4EywMmCSkgF63s2fjLKZ9U98VWhAaW50tdI0AV
	ZDQo1VGaPwz9XQcnOfo58DkgGBhgpg5fM3HSYOSE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1705340029;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zlHxc8hVsmqVsbd28Kgl955chY9aQsXtZXE99u98zOI=;
	b=LRGgO5x9P7erNlr+rRN2EJ2BDCcd+HNqP1OXqvG8HCN3CyJmlaLYjWPMMhitWT2H
	PSkhGTrmpOHnjrVVRov75pyjChSih9UJ+Rp1WyVwE+48QYLgekckBAdbRlJ3SrrJX/K
	b2YsUf62NwCtTl63fCAbeqQ+CmHY8dx6B5PZlDj0=
Content-Type: multipart/mixed; boundary="===============4005139850324533904=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-git: upgrading to 3.1.41 SUCCEEDED
Message-ID: <0101018d0e2fc8f4-4470b629-097b-42e8-b447-157b1eda66af-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jan 2024 17:33:49 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:34:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193722

--===============4005139850324533904==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-git* to *3.1.41* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-git-upgrade-3.1.40-3.1.41.patch
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
From d881b241e1d724087cd5272ea4bae820f8b6c006 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jan 2024 07:11:01 +0000
Subject: [PATCH] python3-git: upgrade 3.1.40 -> 3.1.41

---
 .../python/{python3-git_3.1.40.bb => python3-git_3.1.41.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-git_3.1.40.bb => python3-git_3.1.41.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.40.bb b/meta/recipes-devtools/python/python3-git_3.1.41.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-git_3.1.40.bb
rename to meta/recipes-devtools/python/python3-git_3.1.41.bb
index 47aa7f09ac..de199ef18b 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.40.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.41.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "GitPython"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "22b126e9ffb671fdd0c129796343a02bf67bf2994b35449ffc9321aa755e18a4"
+SRC_URI[sha256sum] = "ed66e624884f76df22c8e16066d567aaa5a37d5b5fa19db2c6df6f7156db9048"
 
 DEPENDS += " ${PYTHON_PN}-gitdb"
 
-- 
2.42.0


--===============4005139850324533904==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-git-upgrade-3.1.40-3.1.41.patch"

RnJvbSBkODgxYjI0MWUxZDcyNDA4N2NkNTI3MmVhNGJhZTgyMGY4YjZjMDA2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSmFuIDIwMjQgMDc6MTE6MDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWdpdDogdXBncmFkZSAzLjEuNDAgLT4gMy4xLjQxCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtZ2l0XzMuMS40MC5iYiA9PiBweXRob24zLWdpdF8zLjEuNDEuYmJ9ICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtZ2l0XzMuMS40MC5iYiA9PiBweXRo
b24zLWdpdF8zLjEuNDEuYmJ9ICg5MiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWdpdF8zLjEuNDAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtZ2l0XzMuMS40MS5iYgpzaW1pbGFyaXR5IGluZGV4IDkyJQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZ2l0XzMuMS40MC5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWdpdF8zLjEuNDEu
YmIKaW5kZXggNDdhYTdmMDlhYy4uZGUxOTllZjE4YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWdpdF8zLjEuNDAuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWdpdF8zLjEuNDEuYmIKQEAgLTEyLDcgKzEyLDcgQEAg
UFlQSV9QQUNLQUdFID0gIkdpdFB5dGhvbiIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1cHRv
b2xzX2J1aWxkX21ldGEKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjIyYjEyNmU5ZmZiNjcxZmRk
MGMxMjk3OTYzNDNhMDJiZjY3YmYyOTk0YjM1NDQ5ZmZjOTMyMWFhNzU1ZTE4YTQiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiZWQ2NmU2MjQ4ODRmNzZkZjIyYzhlMTYwNjZkNTY3YWFhNWEzN2Q1YjVm
YTE5ZGIyYzZkZjZmNzE1NmRiOTA0OCIKIAogREVQRU5EUyArPSAiICR7UFlUSE9OX1BOfS1naXRk
YiIKIAotLSAKMi40Mi4wCgo=

--===============4005139850324533904==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-git (sysroot):
  /usr/lib/python3.11/site-packages/GitPython-3.1.40.dist-info moved to /usr/lib/python3.11/site-packages/GitPython-3.1.41.dist-info

--===============4005139850324533904==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-git: PKGV changed from 3.1.40 [default] to 3.1.41 [default]
packages/core2-64-poky-linux/python3-git: SRC_URI changed from "https://files.pythonhosted.org/packages/source/G/GitPython/GitPython-3.1.40.tar.gz;downloadfilename=GitPython-3.1.40.tar.gz" to "https://files.pythonhosted.org/packages/source/G/GitPython/GitPython-3.1.41.tar.gz;downloadfilename=GitPython-3.1.41.tar.gz"
packages/core2-64-poky-linux/python3-git: PV changed from "3.1.40" to "3.1.41"
packages/core2-64-poky-linux/python3-git/python3-git-dbg: PKGV changed from 3.1.40 [default] to 3.1.41 [default]
packages/core2-64-poky-linux/python3-git/python3-git-dbg: PV changed from "3.1.40" to "3.1.41"
packages/core2-64-poky-linux/python3-git/python3-git-dev: PKGV changed from 3.1.40 [default] to 3.1.41 [default]
packages/core2-64-poky-linux/python3-git/python3-git-dev: PV changed from "3.1.40" to "3.1.41"
packages/core2-64-poky-linux/python3-git/python3-git-doc: PKGV changed from 3.1.40 [default] to 3.1.41 [default]
packages/core2-64-poky-linux/python3-git/python3-git-doc: PV changed from "3.1.40" to "3.1.41"
packages/core2-64-poky-linux/python3-git/python3-git-locale: PKGV changed from 3.1.40 [default] to 3.1.41 [default]
packages/core2-64-poky-linux/python3-git/python3-git-locale: PV changed from "3.1.40" to "3.1.41"
packages/core2-64-poky-linux/python3-git/python3-git-src: PKGV changed from 3.1.40 [default] to 3.1.41 [default]
packages/core2-64-poky-linux/python3-git/python3-git-src: PV changed from "3.1.40" to "3.1.41"
packages/core2-64-poky-linux/python3-git/python3-git-staticdev: PKGV changed from 3.1.40 [default] to 3.1.41 [default]
packages/core2-64-poky-linux/python3-git/python3-git-staticdev: PV changed from "3.1.40" to "3.1.41"
packages/core2-64-poky-linux/python3-git/python3-git: PKGV changed from 3.1.40 [default] to 3.1.41 [default]
packages/core2-64-poky-linux/python3-git/python3-git: PKGSIZE changed from 1346764 to 1374718 (+2%)
packages/core2-64-poky-linux/python3-git/python3-git: PV changed from "3.1.40" to "3.1.41"
Changes to packages/core2-64-poky-linux/python3-git (sysroot):
  /usr/lib/python3.11/site-packages/GitPython-3.1.40.dist-info moved to /usr/lib/python3.11/site-packages/GitPython-3.1.41.dist-info

--===============4005139850324533904==--

