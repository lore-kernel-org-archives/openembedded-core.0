Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDE54C982D8
	for <webhook@archiver.kernel.org>; Sun, 20 Sep 2026 05:18:36 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25137.1789881508547319321
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Sep 2026 22:18:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=QguvFY2a;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Gmf7tf8L;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a0bd405ee4-a6790a9d-9cb3-4872-8018-02ad2aa2952b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789881507;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dj9pOxbRuZwDSkC0Sf1YrpWW1D6lbwmShtyo/SfPTCQ=;
	b=QguvFY2awzAdh/FAncIaTIa9VOGN/2UG/xN2WX6X43KRvXxeo9qkIOGP3XknkjHl
	NFZN0nvGgeRjGgQKwwBVIoBjVs5pimAPsqjjy9+2FWqAqKn55WHYl391pqvSc2kRTFm
	pcyLj4HlE3DFBF4LzIIVGkYJEja5UTj6KAmTrkGQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789881507;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dj9pOxbRuZwDSkC0Sf1YrpWW1D6lbwmShtyo/SfPTCQ=;
	b=Gmf7tf8LOGsny4kcWJoGMx47JsK0c2Ghz+0LFZAKzKlu7/JkHh1ZA64hnFKZrEab
	FApHt3FvvHmMuQ5CdGRWviqH8SkwHt1hBbjTGTV6DYHhwhL6CAbkdDfRRUwNis2VwTr
	xRE6LcOVv+6hf+Ro2bDA96iMfgBDXSI3aHttcHJQ=
Content-Type: multipart/mixed; boundary="===============1817671124780427433=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-poetry-core: upgrading to 2.5.0 SUCCEEDED
Message-ID: <010101a0bd405ee4-a6790a9d-9cb3-4872-8018-02ad2aa2952b-000000@us-west-2.amazonses.com>
Date: Sun, 20 Sep 2026 05:18:27 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.20-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Sep 2026 05:18:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246257

--===============1817671124780427433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-poetry-core* to *2.5.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-poetry-core-upgrade-2.4.1-2.5.0.patch
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
From eeb9fd17fbaf69988efce02c14a6957f6b72f4da Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 20 Sep 2026 05:09:25 +0000
Subject: [PATCH] python3-poetry-core: upgrade 2.4.1 -> 2.5.0

---
 ...ython3-poetry-core_2.4.1.bb => python3-poetry-core_2.5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-poetry-core_2.4.1.bb => python3-poetry-core_2.5.0.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-poetry-core_2.4.1.bb b/meta/recipes-devtools/python/python3-poetry-core_2.5.0.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-poetry-core_2.4.1.bb
rename to meta/recipes-devtools/python/python3-poetry-core_2.5.0.bb
index d063f7e23c..b0d3b8e2ad 100644
--- a/meta/recipes-devtools/python/python3-poetry-core_2.4.1.bb
+++ b/meta/recipes-devtools/python/python3-poetry-core_2.5.0.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "\
     file://src/poetry/core/_vendor/tomli/LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5 \
 "
 
-SRC_URI[sha256sum] = "89dceb6c10e9c6d8650a16183400e3c9ff9ddee13b0a81023b5575334a2b3744"
+SRC_URI[sha256sum] = "81d04c9253b19d0604718268d781867c8f7b2128e5b25bbf1e84141eec6b89c4"
 
 inherit python_poetry_core pypi
 
-- 
2.47.1


--===============1817671124780427433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core: FILELIST: directory renamed /usr/lib/python3.14/site-packages/poetry_core-2.4.1.dist-info -> /usr/lib/python3.14/site-packages/poetry_core-2.5.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/poetry_core-2.4.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/poetry_core-2.5.0.dist-info/licenses, added "/usr/lib/python3.14/site-packages/poetry/core/_vendor/packaging/__pycache__/ranges.cpython-314.pyc /usr/lib/python3.14/site-packages/poetry/core/_vendor/fastjsonschema/__pycache__/draft2019.cpython-314.pyc /usr/lib/python3.14/site-packages/poetry/core/_vendor/packaging/ranges.py /usr/lib/python3.14/site-packages/poetry/core/_vendor/packaging/_ranges.py /usr/lib/python3.14/site-packages/poetry/core/_vendor/fastjsonschema/draft2019.py /usr/lib/python3.14/site-packages/poetry/core/_vendor/packaging/__pycache__/_ranges.cpython-314.pyc"
Changes to packages/x86-64-v3-poky-linux/python3-poetry-core (sysroot):
  /usr/lib/python3.14/site-packages/poetry_core-2.4.1.dist-info moved to /usr/lib/python3.14/site-packages/poetry_core-2.5.0.dist-info
  /usr/lib/python3.14/site-packages/poetry/core/_vendor/fastjsonschema/draft2019.py was added
  /usr/lib/python3.14/site-packages/poetry/core/_vendor/fastjsonschema/__pycache__/draft2019.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/poetry/core/_vendor/packaging/__pycache__/_ranges.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/poetry/core/_vendor/packaging/__pycache__/ranges.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/poetry/core/_vendor/packaging/_ranges.py was added
  /usr/lib/python3.14/site-packages/poetry/core/_vendor/packaging/ranges.py was added

--===============1817671124780427433==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-poetry-core-upgrade-2.4.1-2.5.0.patch"

RnJvbSBlZWI5ZmQxN2ZiYWY2OTk4OGVmY2UwMmMxNGE2OTU3ZjZiNzJmNGRhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMjAgU2VwIDIwMjYgMDU6MDk6MjUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBvZXRyeS1jb3JlOiB1cGdyYWRlIDIuNC4xIC0+IDIuNS4wCgotLS0KIC4uLnl0aG9u
My1wb2V0cnktY29yZV8yLjQuMS5iYiA9PiBweXRob24zLXBvZXRyeS1jb3JlXzIuNS4wLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcG9ldHJ5LWNvcmVfMi40
LjEuYmIgPT4gcHl0aG9uMy1wb2V0cnktY29yZV8yLjUuMC5iYn0gKDkzJSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcG9ldHJ5LWNvcmVfMi40LjEu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcG9ldHJ5LWNvcmVfMi41
LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXBvZXRyeS1jb3JlXzIuNC4xLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcG9ldHJ5LWNvcmVfMi41LjAuYmIKaW5kZXgg
ZDA2M2Y3ZTIzYy4uYjBkM2I4ZTJhZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXBvZXRyeS1jb3JlXzIuNC4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1wb2V0cnktY29yZV8yLjUuMC5iYgpAQCAtMTUsNyArMTUs
NyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gIlwKICAgICBmaWxlOi8vc3JjL3BvZXRyeS9jb3JlL192
ZW5kb3IvdG9tbGkvTElDRU5TRTttZDU9YWFhYWYwODc5ZDE3ZGYwMTEwZDFhYThjOGM5ZjQ2ZjUg
XAogIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiODlkY2ViNmMxMGU5YzZkODY1MGExNjE4MzQw
MGUzYzlmZjlkZGVlMTNiMGE4MTAyM2I1NTc1MzM0YTJiMzc0NCIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICI4MWQwNGM5MjUzYjE5ZDA2MDQ3MTgyNjhkNzgxODY3YzhmN2IyMTI4ZTViMjViYmYxZTg0
MTQxZWVjNmI4OWM0IgogCiBpbmhlcml0IHB5dGhvbl9wb2V0cnlfY29yZSBweXBpCiAKLS0gCjIu
NDcuMQoK

--===============1817671124780427433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-poetry-core: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/poetry_core/poetry_core-2.4.1.tar.gz" to "https://files.pythonhosted.org/packages/source/p/poetry_core/poetry_core-2.5.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-poetry-core: PKGV changed from 2.4.1 [default] to 2.5.0 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core: PV changed from "2.4.1" to "2.5.0"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-dbg: PKGV changed from 2.4.1 [default] to 2.5.0 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-dbg: PV changed from "2.4.1" to "2.5.0"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-dev: PKGV changed from 2.4.1 [default] to 2.5.0 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-dev: PV changed from "2.4.1" to "2.5.0"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-doc: PKGV changed from 2.4.1 [default] to 2.5.0 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-doc: PV changed from "2.4.1" to "2.5.0"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-locale: PKGV changed from 2.4.1 [default] to 2.5.0 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-locale: PV changed from "2.4.1" to "2.5.0"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-src: PKGV changed from 2.4.1 [default] to 2.5.0 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-src: PV changed from "2.4.1" to "2.5.0"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-staticdev: PKGV changed from 2.4.1 [default] to 2.5.0 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-staticdev: PV changed from "2.4.1" to "2.5.0"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core: FILELIST: directory renamed /usr/lib/python3.14/site-packages/poetry_core-2.4.1.dist-info -> /usr/lib/python3.14/site-packages/poetry_core-2.5.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/poetry_core-2.4.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/poetry_core-2.5.0.dist-info/licenses, added "/usr/lib/python3.14/site-packages/poetry/core/_vendor/fastjsonschema/__pycache__/draft2019.cpython-314.pyc /usr/lib/python3.14/site-packages/poetry/core/_vendor/packaging/_ranges.py /usr/lib/python3.14/site-packages/poetry/core/_vendor/packaging/__pycache__/ranges.cpython-314.pyc /usr/lib/python3.14/site-packages/poetry/core/_vendor/packaging/ranges.py /usr/lib/python3.14/site-packages/poetry/core/_vendor/fastjsonschema/draft2019.py /usr/lib/python3.14/site-packages/poetry/core/_vendor/packaging/__pycache__/_ranges.cpython-314.pyc"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core: PKGV changed from 2.4.1 [default] to 2.5.0 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core: PKGSIZE changed from 3119076 to 3413682 (+9%)
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core: PV changed from "2.4.1" to "2.5.0"
Changes to packages/x86-64-v3-poky-linux/python3-poetry-core (sysroot):
  /usr/lib/python3.14/site-packages/poetry_core-2.4.1.dist-info moved to /usr/lib/python3.14/site-packages/poetry_core-2.5.0.dist-info
  /usr/lib/python3.14/site-packages/poetry/core/_vendor/fastjsonschema/draft2019.py was added
  /usr/lib/python3.14/site-packages/poetry/core/_vendor/fastjsonschema/__pycache__/draft2019.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/poetry/core/_vendor/packaging/__pycache__/_ranges.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/poetry/core/_vendor/packaging/__pycache__/ranges.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/poetry/core/_vendor/packaging/_ranges.py was added
  /usr/lib/python3.14/site-packages/poetry/core/_vendor/packaging/ranges.py was added

--===============1817671124780427433==--

