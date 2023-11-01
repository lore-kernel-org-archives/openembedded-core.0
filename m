Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CF74C19F2B
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:16 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.8657.1698848704582858328
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=UK9b6mOm;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=EBUTgSLo;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.45, mailfrom: 0101018b8b4602bc-912930cf-339e-4824-81f5-aff0f4d5354e-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848703;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cUKCGgAbdLn7YD+pSAehpdd3zYcWz9kkjMr72aPmnPI=;
	b=UK9b6mOmCOJnG8TddL0qTXb8wnpDKNMcpwhnl4m7Q8U0uGM1PetQ7Ifhx1rzn0kk
	rYREz6ptuQ+g/cwfiWexPBoAyEsX+14gVE/pp+OJZexDB3RDLIinbCqoqArU3jErpXj
	rlTWsCm/lA2hmcJIpJu7Vu5RCQSMZT2fD1SXYVpY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848703;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cUKCGgAbdLn7YD+pSAehpdd3zYcWz9kkjMr72aPmnPI=;
	b=EBUTgSLoi8rmbWo4/n6LQDVVQ+cZih6wF2RGfu5iWg+oqKpnYUYhKX8IfW/jVZnX
	itGPUlC5Pl4sybMMivdg6W+BWocxN4CSZHGV6PRefyqAsRaSKcdEqGdLsnxj8clX/Lr
	+4XgUWthNzkX1mTGZ4huUJbD5xcaAMC92GgKqru8=
Content-Type: multipart/mixed; boundary="===============4130886603004688479=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Marta Rybczynska <mrybczynska@syslinbit.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-beartype: upgrading to 0.16.4 SUCCEEDED
Message-ID: <0101018b8b4602bc-912930cf-339e-4824-81f5-aff0f4d5354e-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189966

--===============4130886603004688479==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-beartype* to *0.16.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-beartype-upgrade-0.16.2-0.16.4.patch
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
From 4cbe4b69d72c839e612c3c629784ad9720c41b49 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 08:09:30 +0000
Subject: [PATCH] python3-beartype: upgrade 0.16.2 -> 0.16.4

---
 .../{python3-beartype_0.16.2.bb => python3-beartype_0.16.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-beartype_0.16.2.bb => python3-beartype_0.16.4.bb} (75%)

diff --git a/meta/recipes-devtools/python/python3-beartype_0.16.2.bb b/meta/recipes-devtools/python/python3-beartype_0.16.4.bb
similarity index 75%
rename from meta/recipes-devtools/python/python3-beartype_0.16.2.bb
rename to meta/recipes-devtools/python/python3-beartype_0.16.4.bb
index 20a5b92c61..ad4462e0e2 100644
--- a/meta/recipes-devtools/python/python3-beartype_0.16.2.bb
+++ b/meta/recipes-devtools/python/python3-beartype_0.16.4.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://beartype.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e40b52d8eb5553aa8f705cdd3f979d69"
 
-SRC_URI[sha256sum] = "47ec1c8c3be3f999f4f9f829e8913f65926aa7e85b180d9ffd305dc78d3e7d7b"
+SRC_URI[sha256sum] = "1ada89cf2d6eb30eb6e156eed2eb5493357782937910d74380918e53c2eae0bf"
 
 inherit setuptools3 pypi
 
-- 
2.39.2


--===============4130886603004688479==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-beartype: SRC_URI changed from "https://files.pythonhosted.org/packages/source/b/beartype/beartype-0.16.2.tar.gz;downloadfilename=beartype-0.16.2.tar.gz" to "https://files.pythonhosted.org/packages/source/b/beartype/beartype-0.16.4.tar.gz;downloadfilename=beartype-0.16.4.tar.gz"
packages/core2-64-poky-linux/python3-beartype: PV changed from "0.16.2" to "0.16.4"
packages/core2-64-poky-linux/python3-beartype: PKGV changed from 0.16.2 [default] to 0.16.4 [default]
packages/core2-64-poky-linux/python3-beartype/python3-beartype-dbg: PV changed from "0.16.2" to "0.16.4"
packages/core2-64-poky-linux/python3-beartype/python3-beartype-dbg: PKGV changed from 0.16.2 [default] to 0.16.4 [default]
packages/core2-64-poky-linux/python3-beartype/python3-beartype-dev: PV changed from "0.16.2" to "0.16.4"
packages/core2-64-poky-linux/python3-beartype/python3-beartype-dev: PKGV changed from 0.16.2 [default] to 0.16.4 [default]
packages/core2-64-poky-linux/python3-beartype/python3-beartype-doc: PV changed from "0.16.2" to "0.16.4"
packages/core2-64-poky-linux/python3-beartype/python3-beartype-doc: PKGV changed from 0.16.2 [default] to 0.16.4 [default]
packages/core2-64-poky-linux/python3-beartype/python3-beartype-locale: PV changed from "0.16.2" to "0.16.4"
packages/core2-64-poky-linux/python3-beartype/python3-beartype-locale: PKGV changed from 0.16.2 [default] to 0.16.4 [default]
packages/core2-64-poky-linux/python3-beartype/python3-beartype-src: PV changed from "0.16.2" to "0.16.4"
packages/core2-64-poky-linux/python3-beartype/python3-beartype-src: PKGV changed from 0.16.2 [default] to 0.16.4 [default]
packages/core2-64-poky-linux/python3-beartype/python3-beartype-staticdev: PV changed from "0.16.2" to "0.16.4"
packages/core2-64-poky-linux/python3-beartype/python3-beartype-staticdev: PKGV changed from 0.16.2 [default] to 0.16.4 [default]
packages/core2-64-poky-linux/python3-beartype/python3-beartype: PV changed from "0.16.2" to "0.16.4"
packages/core2-64-poky-linux/python3-beartype/python3-beartype: PKGSIZE changed from 4238284 to 4271177 (+1%)
packages/core2-64-poky-linux/python3-beartype/python3-beartype: FILELIST: directory renamed /usr/lib/python3.11/site-packages/beartype-0.16.2.dist-info -> /usr/lib/python3.11/site-packages/beartype-0.16.4.dist-info, removed "/usr/lib/python3.11/site-packages/beartype/_decor/_decormore.py /usr/lib/python3.11/site-packages/beartype/_decor/__pycache__/_decormore.cpython-311.pyc", added "/usr/lib/python3.11/site-packages/beartype/_util/cls/__pycache__/utilclsset.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_decor/__pycache__/_decortype.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_util/cls/utilclsset.py /usr/lib/python3.11/site-packages/beartype/_decor/_decortype.py /usr/lib/python3.11/site-packages/beartype/_decor/__pycache__/_decornontype.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_decor/_decornontype.py"
packages/core2-64-poky-linux/python3-beartype/python3-beartype: PKGV changed from 0.16.2 [default] to 0.16.4 [default]
Changes to packages/core2-64-poky-linux/python3-beartype (sysroot):
  /usr/lib/python3.11/site-packages/beartype-0.16.2.dist-info moved to /usr/lib/python3.11/site-packages/beartype-0.16.4.dist-info
  /usr/lib/python3.11/site-packages/beartype/_decor/_decornontype.py was added
  /usr/lib/python3.11/site-packages/beartype/_decor/_decortype.py was added
  /usr/lib/python3.11/site-packages/beartype/_decor/__pycache__/_decornontype.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_decor/__pycache__/_decortype.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_util/cls/__pycache__/utilclsset.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_util/cls/utilclsset.py was added
  /usr/lib/python3.11/site-packages/beartype/_decor/_decormore.py was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/__pycache__/_decormore.cpython-311.pyc was removed

--===============4130886603004688479==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-beartype/python3-beartype: FILELIST: directory renamed /usr/lib/python3.11/site-packages/beartype-0.16.2.dist-info -> /usr/lib/python3.11/site-packages/beartype-0.16.4.dist-info, removed "/usr/lib/python3.11/site-packages/beartype/_decor/__pycache__/_decormore.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_decor/_decormore.py", added "/usr/lib/python3.11/site-packages/beartype/_decor/_decornontype.py /usr/lib/python3.11/site-packages/beartype/_decor/__pycache__/_decornontype.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_decor/__pycache__/_decortype.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_util/cls/utilclsset.py /usr/lib/python3.11/site-packages/beartype/_decor/_decortype.py /usr/lib/python3.11/site-packages/beartype/_util/cls/__pycache__/utilclsset.cpython-311.pyc"
Changes to packages/core2-64-poky-linux/python3-beartype (sysroot):
  /usr/lib/python3.11/site-packages/beartype-0.16.2.dist-info moved to /usr/lib/python3.11/site-packages/beartype-0.16.4.dist-info
  /usr/lib/python3.11/site-packages/beartype/_decor/_decornontype.py was added
  /usr/lib/python3.11/site-packages/beartype/_decor/_decortype.py was added
  /usr/lib/python3.11/site-packages/beartype/_decor/__pycache__/_decornontype.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_decor/__pycache__/_decortype.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_util/cls/__pycache__/utilclsset.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_util/cls/utilclsset.py was added
  /usr/lib/python3.11/site-packages/beartype/_decor/_decormore.py was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/__pycache__/_decormore.cpython-311.pyc was removed

--===============4130886603004688479==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-beartype-upgrade-0.16.2-0.16.4.patch"

RnJvbSA0Y2JlNGI2OWQ3MmM4MzllNjEyYzNjNjI5Nzg0YWQ5NzIwYzQxYjQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAwODowOTozMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtYmVhcnR5cGU6IHVwZ3JhZGUgMC4xNi4yIC0+IDAuMTYuNAoKLS0tCiAuLi4ve3B5dGhv
bjMtYmVhcnR5cGVfMC4xNi4yLmJiID0+IHB5dGhvbjMtYmVhcnR5cGVfMC4xNi40LmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWJlYXJ0eXBlXzAuMTYuMi5i
YiA9PiBweXRob24zLWJlYXJ0eXBlXzAuMTYuNC5iYn0gKDc1JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmVhcnR5cGVfMC4xNi4yLmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJlYXJ0eXBlXzAuMTYuNC5iYgpzaW1p
bGFyaXR5IGluZGV4IDc1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtYmVhcnR5cGVfMC4xNi4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtYmVhcnR5cGVfMC4xNi40LmJiCmluZGV4IDIwYTViOTJjNjEuLmFk
NDQ2MmUwZTIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1iZWFydHlwZV8wLjE2LjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWJlYXJ0eXBlXzAuMTYuNC5iYgpAQCAtNCw3ICs0LDcgQEAgSE9NRVBBR0UgPSAiaHR0
cHM6Ly9iZWFydHlwZS5yZWFkdGhlZG9jcy5pbyIKIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVT
X0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9ZTQwYjUyZDhlYjU1NTNhYThmNzA1Y2RkM2Y5
NzlkNjkiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI0N2VjMWM4YzNiZTNmOTk5ZjRmOWY4Mjll
ODkxM2Y2NTkyNmFhN2U4NWIxODBkOWZmZDMwNWRjNzhkM2U3ZDdiIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjFhZGE4OWNmMmQ2ZWIzMGViNmUxNTZlZWQyZWI1NDkzMzU3NzgyOTM3OTEwZDc0Mzgw
OTE4ZTUzYzJlYWUwYmYiCiAKIGluaGVyaXQgc2V0dXB0b29sczMgcHlwaQogCi0tIAoyLjM5LjIK
Cg==

--===============4130886603004688479==--

