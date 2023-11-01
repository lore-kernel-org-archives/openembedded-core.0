Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36981C19F2D
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:16 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.8641.1698848702993284554
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=HeXvrBhm;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=gb0/k7vh;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.45, mailfrom: 0101018b8b4603cf-0eab73c1-f14c-4b51-896b-3c7b0b8fd9e4-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848703;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mJkqJHuhv4Ymus581XXXWggmLqflKOotb57K08103C0=;
	b=HeXvrBhmiGK1za5+Ime9dUBgS4ix0BRYwznXWURIbgknLPzliw43eNWfZpttxsuc
	U6QSPCgetWFIUt9fJanzgTq6kCJ0oyPQKUXQfkwUKXONHSAuvwFnUa8ponTF4d5iJAx
	m66M6e3KBx8y8TrqZonPJsZ3ORzfxg6TZJtSnhWs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848703;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mJkqJHuhv4Ymus581XXXWggmLqflKOotb57K08103C0=;
	b=gb0/k7vh9XZwAFlWRuQcjzpDqLsgbiVfa0SnC6ZEoAOhdF6ZJ6VtJRWhLDg6baKt
	KOTgHiH/l7S2NVsTb70+WLN5p/wtxE0YVApNqj3GbGbH4HGFQYvHdBg7uZqsDwRXqDI
	+/YN24LuF+RvtIPQYy59SdkQZc+SajX9gi/E5vBA=
Content-Type: multipart/mixed; boundary="===============6486056649180574043=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-git: upgrading to 3.1.40 SUCCEEDED
Message-ID: <0101018b8b4603cf-0eab73c1-f14c-4b51-896b-3c7b0b8fd9e4-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189941

--===============6486056649180574043==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-git* to *3.1.40* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-git-upgrade-3.1.37-3.1.40.patch
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
From 1611c1bf2b89b4404d662e26191ba20bd9e17494 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 08:47:53 +0000
Subject: [PATCH] python3-git: upgrade 3.1.37 -> 3.1.40

---
 .../python/{python3-git_3.1.37.bb => python3-git_3.1.40.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-git_3.1.37.bb => python3-git_3.1.40.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.37.bb b/meta/recipes-devtools/python/python3-git_3.1.40.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-git_3.1.37.bb
rename to meta/recipes-devtools/python/python3-git_3.1.40.bb
index 56a335a79e..47aa7f09ac 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.37.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.40.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "GitPython"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "f9b9ddc0761c125d5780eab2d64be4873fc6817c2899cbcb34b02344bdc7bc54"
+SRC_URI[sha256sum] = "22b126e9ffb671fdd0c129796343a02bf67bf2994b35449ffc9321aa755e18a4"
 
 DEPENDS += " ${PYTHON_PN}-gitdb"
 
-- 
2.39.2


--===============6486056649180574043==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-git-upgrade-3.1.37-3.1.40.patch"

RnJvbSAxNjExYzFiZjJiODliNDQwNGQ2NjJlMjYxOTFiYTIwYmQ5ZTE3NDk0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAwODo0Nzo1MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtZ2l0OiB1cGdyYWRlIDMuMS4zNyAtPiAzLjEuNDAKCi0tLQogLi4uL3B5dGhvbi97cHl0
aG9uMy1naXRfMy4xLjM3LmJiID0+IHB5dGhvbjMtZ2l0XzMuMS40MC5iYn0gICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1naXRfMy4xLjM3LmJiID0+IHB5dGhv
bjMtZ2l0XzMuMS40MC5iYn0gKDkyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtZ2l0XzMuMS4zNy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1naXRfMy4xLjQwLmJiCnNpbWlsYXJpdHkgaW5kZXggOTIlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1naXRfMy4xLjM3LmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZ2l0XzMuMS40MC5i
YgppbmRleCA1NmEzMzVhNzllLi40N2FhN2YwOWFjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZ2l0XzMuMS4zNy5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZ2l0XzMuMS40MC5iYgpAQCAtMTIsNyArMTIsNyBAQCBQ
WVBJX1BBQ0tBR0UgPSAiR2l0UHl0aG9uIgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9v
bHNfYnVpbGRfbWV0YQogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZjliOWRkYzA3NjFjMTI1ZDU3
ODBlYWIyZDY0YmU0ODczZmM2ODE3YzI4OTljYmNiMzRiMDIzNDRiZGM3YmM1NCIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICIyMmIxMjZlOWZmYjY3MWZkZDBjMTI5Nzk2MzQzYTAyYmY2N2JmMjk5NGIz
NTQ0OWZmYzkzMjFhYTc1NWUxOGE0IgogCiBERVBFTkRTICs9ICIgJHtQWVRIT05fUE59LWdpdGRi
IgogCi0tIAoyLjM5LjIKCg==

--===============6486056649180574043==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-git: PKGV changed from 3.1.37 [default] to 3.1.40 [default]
packages/core2-64-poky-linux/python3-git: SRC_URI changed from "https://files.pythonhosted.org/packages/source/G/GitPython/GitPython-3.1.37.tar.gz;downloadfilename=GitPython-3.1.37.tar.gz" to "https://files.pythonhosted.org/packages/source/G/GitPython/GitPython-3.1.40.tar.gz;downloadfilename=GitPython-3.1.40.tar.gz"
packages/core2-64-poky-linux/python3-git: PV changed from "3.1.37" to "3.1.40"
packages/core2-64-poky-linux/python3-git/python3-git-dbg: PKGV changed from 3.1.37 [default] to 3.1.40 [default]
packages/core2-64-poky-linux/python3-git/python3-git-dbg: PV changed from "3.1.37" to "3.1.40"
packages/core2-64-poky-linux/python3-git/python3-git-dev: PKGV changed from 3.1.37 [default] to 3.1.40 [default]
packages/core2-64-poky-linux/python3-git/python3-git-dev: PV changed from "3.1.37" to "3.1.40"
packages/core2-64-poky-linux/python3-git/python3-git-doc: PKGV changed from 3.1.37 [default] to 3.1.40 [default]
packages/core2-64-poky-linux/python3-git/python3-git-doc: PV changed from "3.1.37" to "3.1.40"
packages/core2-64-poky-linux/python3-git/python3-git-locale: PKGV changed from 3.1.37 [default] to 3.1.40 [default]
packages/core2-64-poky-linux/python3-git/python3-git-locale: PV changed from "3.1.37" to "3.1.40"
packages/core2-64-poky-linux/python3-git/python3-git-src: PKGV changed from 3.1.37 [default] to 3.1.40 [default]
packages/core2-64-poky-linux/python3-git/python3-git-src: PV changed from "3.1.37" to "3.1.40"
packages/core2-64-poky-linux/python3-git/python3-git-staticdev: PKGV changed from 3.1.37 [default] to 3.1.40 [default]
packages/core2-64-poky-linux/python3-git/python3-git-staticdev: PV changed from "3.1.37" to "3.1.40"
packages/core2-64-poky-linux/python3-git/python3-git: PKGV changed from 3.1.37 [default] to 3.1.40 [default]
packages/core2-64-poky-linux/python3-git/python3-git: PKGSIZE changed from 1343995 to 1346764 (+0%)
packages/core2-64-poky-linux/python3-git/python3-git: PV changed from "3.1.37" to "3.1.40"
Changes to packages/core2-64-poky-linux/python3-git (sysroot):
  /usr/lib/python3.11/site-packages/GitPython-3.1.37.dist-info moved to /usr/lib/python3.11/site-packages/GitPython-3.1.40.dist-info

--===============6486056649180574043==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-git (sysroot):
  /usr/lib/python3.11/site-packages/GitPython-3.1.37.dist-info moved to /usr/lib/python3.11/site-packages/GitPython-3.1.40.dist-info

--===============6486056649180574043==--

