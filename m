Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CCDBEEE25E
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 19:00:00 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.29463.1694804393273817215
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 11:59:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=LYLmKvGS;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=fqYh9tpR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018a9a36bcfe-4d1e0997-8e9a-4a5f-89af-1fde6dfd68f3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1694804393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=o2Uaxm8K+E6aRLYca4LdWq+IdetAF657XqDBJ6P4usw=;
	b=LYLmKvGSaY7sQv7Hsso7dPna7goQmzdXyZdazauhJbqZkieNUy7/q9mM1XAYRs+9
	l7CssrpavLc4y+YVx6ru5qm1UzOOyI8CMbkDilHHnF4NT5RJcW++ZHcBwUbMtYJjKGa
	vYhmOHYMMqyOEwNPyWJkqxihSVqF3EV3FTgdlSv0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1694804393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=o2Uaxm8K+E6aRLYca4LdWq+IdetAF657XqDBJ6P4usw=;
	b=fqYh9tpRuHZ9dTrpN38cj16HfqcG6yiwsO/36iQKVM8veJfS+WawI4ba8fyYiZrz
	E8EeJxW84MXk6otOooHN+DaEJkeiZ6SKu8F/mOX3YJXA6vWa5PB6Qc+XyIAJ7IuF/v0
	uirnrvubqHdkyI90GxYh77D43IDmqvwXm7oNXRnk=
Content-Type: multipart/mixed; boundary="===============1840472801641762245=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-git: upgrading to 3.1.36 SUCCEEDED
Message-ID: <0101018a9a36bcfe-4d1e0997-8e9a-4a5f-89af-1fde6dfd68f3-000000@us-west-2.amazonses.com>
Date: Fri, 15 Sep 2023 18:59:53 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 19:00:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187707

--===============1840472801641762245==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-git* to *3.1.36* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-git-upgrade-3.1.35-3.1.36.patch
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
From cd59ab1c5e6a6e4dd73cf6ab5efebe3d3319d335 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Sep 2023 10:04:51 +0000
Subject: [PATCH] python3-git: upgrade 3.1.35 -> 3.1.36

---
 .../python/{python3-git_3.1.35.bb => python3-git_3.1.36.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-git_3.1.35.bb => python3-git_3.1.36.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.35.bb b/meta/recipes-devtools/python/python3-git_3.1.36.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-git_3.1.35.bb
rename to meta/recipes-devtools/python/python3-git_3.1.36.bb
index 9b2e36d5af..ab1b0f2353 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.35.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.36.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "GitPython"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "9cbefbd1789a5fe9bcf621bb34d3f441f3a90c8461d377f84eda73e721d9b06b"
+SRC_URI[sha256sum] = "4bb0c2a6995e85064140d31a33289aa5dce80133a23d36fcd372d716c54d3ebf"
 
 DEPENDS += " ${PYTHON_PN}-gitdb"
 
-- 
2.39.2


--===============1840472801641762245==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-git-upgrade-3.1.35-3.1.36.patch"

RnJvbSBjZDU5YWIxYzVlNmE2ZTRkZDczY2Y2YWI1ZWZlYmUzZDMzMTlkMzM1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgU2VwIDIwMjMgMTA6MDQ6NTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWdpdDogdXBncmFkZSAzLjEuMzUgLT4gMy4xLjM2CgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtZ2l0XzMuMS4zNS5iYiA9PiBweXRob24zLWdpdF8zLjEuMzYuYmJ9ICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtZ2l0XzMuMS4zNS5iYiA9PiBweXRo
b24zLWdpdF8zLjEuMzYuYmJ9ICg5MiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWdpdF8zLjEuMzUuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtZ2l0XzMuMS4zNi5iYgpzaW1pbGFyaXR5IGluZGV4IDkyJQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZ2l0XzMuMS4zNS5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWdpdF8zLjEuMzYu
YmIKaW5kZXggOWIyZTM2ZDVhZi4uYWIxYjBmMjM1MyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWdpdF8zLjEuMzUuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWdpdF8zLjEuMzYuYmIKQEAgLTEyLDcgKzEyLDcgQEAg
UFlQSV9QQUNLQUdFID0gIkdpdFB5dGhvbiIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1cHRv
b2xzX2J1aWxkX21ldGEKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjljYmVmYmQxNzg5YTVmZTli
Y2Y2MjFiYjM0ZDNmNDQxZjNhOTBjODQ2MWQzNzdmODRlZGE3M2U3MjFkOWIwNmIiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiNGJiMGMyYTY5OTVlODUwNjQxNDBkMzFhMzMyODlhYTVkY2U4MDEzM2Ey
M2QzNmZjZDM3MmQ3MTZjNTRkM2ViZiIKIAogREVQRU5EUyArPSAiICR7UFlUSE9OX1BOfS1naXRk
YiIKIAotLSAKMi4zOS4yCgo=

--===============1840472801641762245==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-git: SRC_URI changed from "https://files.pythonhosted.org/packages/source/G/GitPython/GitPython-3.1.35.tar.gz;downloadfilename=GitPython-3.1.35.tar.gz" to "https://files.pythonhosted.org/packages/source/G/GitPython/GitPython-3.1.36.tar.gz;downloadfilename=GitPython-3.1.36.tar.gz"
packages/core2-32-poky-linux/python3-git: PKGV changed from 3.1.35 [default] to 3.1.36 [default]
packages/core2-32-poky-linux/python3-git: PV changed from "3.1.35" to "3.1.36"
packages/core2-32-poky-linux/python3-git/python3-git-dbg: PKGV changed from 3.1.35 [default] to 3.1.36 [default]
packages/core2-32-poky-linux/python3-git/python3-git-dbg: PV changed from "3.1.35" to "3.1.36"
packages/core2-32-poky-linux/python3-git/python3-git-dev: PKGV changed from 3.1.35 [default] to 3.1.36 [default]
packages/core2-32-poky-linux/python3-git/python3-git-dev: PV changed from "3.1.35" to "3.1.36"
packages/core2-32-poky-linux/python3-git/python3-git-doc: PKGV changed from 3.1.35 [default] to 3.1.36 [default]
packages/core2-32-poky-linux/python3-git/python3-git-doc: PV changed from "3.1.35" to "3.1.36"
packages/core2-32-poky-linux/python3-git/python3-git-locale: PKGV changed from 3.1.35 [default] to 3.1.36 [default]
packages/core2-32-poky-linux/python3-git/python3-git-locale: PV changed from "3.1.35" to "3.1.36"
packages/core2-32-poky-linux/python3-git/python3-git-src: PKGV changed from 3.1.35 [default] to 3.1.36 [default]
packages/core2-32-poky-linux/python3-git/python3-git-src: PV changed from "3.1.35" to "3.1.36"
packages/core2-32-poky-linux/python3-git/python3-git-staticdev: PKGV changed from 3.1.35 [default] to 3.1.36 [default]
packages/core2-32-poky-linux/python3-git/python3-git-staticdev: PV changed from "3.1.35" to "3.1.36"
packages/core2-32-poky-linux/python3-git/python3-git: PKGV changed from 3.1.35 [default] to 3.1.36 [default]
packages/core2-32-poky-linux/python3-git/python3-git: PKGSIZE changed from 1336671 to 1338870 (+0%)
packages/core2-32-poky-linux/python3-git/python3-git: PV changed from "3.1.35" to "3.1.36"
Changes to packages/core2-32-poky-linux/python3-git (sysroot):
  /usr/lib/python3.11/site-packages/GitPython-3.1.35.dist-info moved to /usr/lib/python3.11/site-packages/GitPython-3.1.36.dist-info

--===============1840472801641762245==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-git (sysroot):
  /usr/lib/python3.11/site-packages/GitPython-3.1.35.dist-info moved to /usr/lib/python3.11/site-packages/GitPython-3.1.36.dist-info

--===============1840472801641762245==--

