Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02085C2FC04
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:40 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.5944.1689456454850474340
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=SXBHq5/5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101895b73a9b0-c0ab65cb-fb57-4f63-89b7-20dd663f74c0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456454;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=1uJrZqNZZKs0eCcbGgrf0CSUbfPXbF3x1qrNwirCmkY=;
	b=SXBHq5/5xtouvVe4yfXf8VkyI9f95b6VHwijeVt9pcseOUlvlX1kpLCe6UoI1Ld4
	rqrkDNrOCpjFznJxBuD11/e+aNFC+yic1uvJQZ/Cnv1fKfZgSXDez8m5hRrbiyjt5QJ
	UvPcbjqtsUusMf30/CtZbZXThGRk7+td46fYpUW8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456454;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=1uJrZqNZZKs0eCcbGgrf0CSUbfPXbF3x1qrNwirCmkY=;
	b=k0fwQFURy0wQg4xvckIpJqIcJMCsFjKRxL8CmcrO44L5HCyAzKPLuMNCt8/gTjVQ
	h7N8gqTYgBLn5t6mvTyp1P4y6yQY76O4g0INAhyZe8naxGKvjx8omlDpcMvOHaQZci7
	itBzrHUWDAXUQq8Jf8xV/PBlJHBptDFeXg6Dima4=
Content-Type: multipart/mixed; boundary="===============8450394428166414714=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-git: upgrading to 3.1.32 SUCCEEDED
Message-ID: <010101895b73a9b0-c0ab65cb-fb57-4f63-89b7-20dd663f74c0-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:34 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184342

--===============8450394428166414714==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-git* to *3.1.32* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-git-upgrade-3.1.31-3.1.32.patch
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
From ed9ad12475d2a575a8cce3403ab7462105d97861 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 12:11:21 +0000
Subject: [PATCH] python3-git: upgrade 3.1.31 -> 3.1.32

---
 .../python/{python3-git_3.1.31.bb => python3-git_3.1.32.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-git_3.1.31.bb => python3-git_3.1.32.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.31.bb b/meta/recipes-devtools/python/python3-git_3.1.32.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-git_3.1.31.bb
rename to meta/recipes-devtools/python/python3-git_3.1.32.bb
index 08b9f66bcb..f217577eb8 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.31.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.32.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "GitPython"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "8ce3bcf69adfdf7c7d503e78fd3b1c492af782d58893b650adb2ac8912ddd573"
+SRC_URI[sha256sum] = "8d9b8cb1e80b9735e8717c9362079d3ce4c6e5ddeebedd0361b228c3a67a62f6"
 
 DEPENDS += " ${PYTHON_PN}-gitdb"
 
-- 
2.39.2


--===============8450394428166414714==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-git: SRC_URI changed from "https://files.pythonhosted.org/packages/source/G/GitPython/GitPython-3.1.31.tar.gz;downloadfilename=GitPython-3.1.31.tar.gz" to "https://files.pythonhosted.org/packages/source/G/GitPython/GitPython-3.1.32.tar.gz;downloadfilename=GitPython-3.1.32.tar.gz"
packages/core2-32-poky-linux/python3-git: PKGV changed from 3.1.31 [default] to 3.1.32 [default]
packages/core2-32-poky-linux/python3-git: PV changed from "3.1.31" to "3.1.32"
packages/core2-32-poky-linux/python3-git/python3-git-dbg: PKGV changed from 3.1.31 [default] to 3.1.32 [default]
packages/core2-32-poky-linux/python3-git/python3-git-dbg: PV changed from "3.1.31" to "3.1.32"
packages/core2-32-poky-linux/python3-git/python3-git-dev: PKGV changed from 3.1.31 [default] to 3.1.32 [default]
packages/core2-32-poky-linux/python3-git/python3-git-dev: PV changed from "3.1.31" to "3.1.32"
packages/core2-32-poky-linux/python3-git/python3-git-doc: PKGV changed from 3.1.31 [default] to 3.1.32 [default]
packages/core2-32-poky-linux/python3-git/python3-git-doc: PV changed from "3.1.31" to "3.1.32"
packages/core2-32-poky-linux/python3-git/python3-git-locale: PKGV changed from 3.1.31 [default] to 3.1.32 [default]
packages/core2-32-poky-linux/python3-git/python3-git-locale: PV changed from "3.1.31" to "3.1.32"
packages/core2-32-poky-linux/python3-git/python3-git-src: PKGV changed from 3.1.31 [default] to 3.1.32 [default]
packages/core2-32-poky-linux/python3-git/python3-git-src: PV changed from "3.1.31" to "3.1.32"
packages/core2-32-poky-linux/python3-git/python3-git-staticdev: PKGV changed from 3.1.31 [default] to 3.1.32 [default]
packages/core2-32-poky-linux/python3-git/python3-git-staticdev: PV changed from "3.1.31" to "3.1.32"
packages/core2-32-poky-linux/python3-git/python3-git: PKGSIZE changed from 1319857 to 1333912 (+1%)
packages/core2-32-poky-linux/python3-git/python3-git: PKGV changed from 3.1.31 [default] to 3.1.32 [default]
packages/core2-32-poky-linux/python3-git/python3-git: PV changed from "3.1.31" to "3.1.32"
Changes to packages/core2-32-poky-linux/python3-git (sysroot):
  /usr/lib/python3.11/site-packages/GitPython-3.1.31.dist-info moved to /usr/lib/python3.11/site-packages/GitPython-3.1.32.dist-info

--===============8450394428166414714==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-git (sysroot):
  /usr/lib/python3.11/site-packages/GitPython-3.1.31.dist-info moved to /usr/lib/python3.11/site-packages/GitPython-3.1.32.dist-info

--===============8450394428166414714==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-git-upgrade-3.1.31-3.1.32.patch"

RnJvbSBlZDlhZDEyNDc1ZDJhNTc1YThjY2UzNDAzYWI3NDYyMTA1ZDk3ODYxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMTI6MTE6MjEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWdpdDogdXBncmFkZSAzLjEuMzEgLT4gMy4xLjMyCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtZ2l0XzMuMS4zMS5iYiA9PiBweXRob24zLWdpdF8zLjEuMzIuYmJ9ICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtZ2l0XzMuMS4zMS5iYiA9PiBweXRo
b24zLWdpdF8zLjEuMzIuYmJ9ICg5MiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWdpdF8zLjEuMzEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtZ2l0XzMuMS4zMi5iYgpzaW1pbGFyaXR5IGluZGV4IDkyJQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZ2l0XzMuMS4zMS5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWdpdF8zLjEuMzIu
YmIKaW5kZXggMDhiOWY2NmJjYi4uZjIxNzU3N2ViOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWdpdF8zLjEuMzEuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWdpdF8zLjEuMzIuYmIKQEAgLTEyLDcgKzEyLDcgQEAg
UFlQSV9QQUNLQUdFID0gIkdpdFB5dGhvbiIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1cHRv
b2xzX2J1aWxkX21ldGEKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjhjZTNiY2Y2OWFkZmRmN2M3
ZDUwM2U3OGZkM2IxYzQ5MmFmNzgyZDU4ODkzYjY1MGFkYjJhYzg5MTJkZGQ1NzMiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiOGQ5YjhjYjFlODBiOTczNWU4NzE3YzkzNjIwNzlkM2NlNGM2ZTVkZGVl
YmVkZDAzNjFiMjI4YzNhNjdhNjJmNiIKIAogREVQRU5EUyArPSAiICR7UFlUSE9OX1BOfS1naXRk
YiIKIAotLSAKMi4zOS4yCgo=

--===============8450394428166414714==--

