Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67A0EC25B7E
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:09 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.13442.1713248039915144425
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:14:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=B3WwRIZN;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=boMSNlnM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018ee58a7195-6cdfa017-720d-4d30-9b46-458a5d6338c7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248039;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3KtVpgBbtbOu72ZAFkzundMoM0iqnzTcxiOgmBntZoQ=;
	b=B3WwRIZNyd7xDr9eJslcwMmrDl4Bu+VKBZFJ6xgWR7Z1Oyxv4+vATetRJY9tMlcn
	ZHxsBJAUyLtcvmQ8CCdFNXYBe1bFhHaknsOQt4xDd04kMPkysQ8zgmBzDlo1WCAPYWY
	4iYRBfxcIXNVMxHR932I2xD05cXP5Z+wi9j66agI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248039;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3KtVpgBbtbOu72ZAFkzundMoM0iqnzTcxiOgmBntZoQ=;
	b=boMSNlnMRBn80IBVv+oHNz1qV/KqXqM1P8MbQsgxK0e51SnbMSgjrpX3W6MNI6LF
	fmM3WoJ5wVP2d5DxooHaMZaxT2okAOrFJ/9MsvbAlEsdbHpj3XUQqJGt3rDAn8X6MJi
	XV1/KhrerQq1fyaZEtRfb3ioJK/tWj8vj/XIWy8k=
Content-Type: multipart/mixed; boundary="===============1491152185886635219=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pytest-subtests: upgrading to 0.12.1 SUCCEEDED
Message-ID: <0101018ee58a7195-6cdfa017-720d-4d30-9b46-458a5d6338c7-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:13:59 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198306

--===============1491152185886635219==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pytest-subtests* to *0.12.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pytest-subtests-upgrade-0.11.0-0.12.1.patch
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
From f3687c86ee9a39548f69bff77c65e63250354c5d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Apr 2024 19:50:41 +0000
Subject: [PATCH] python3-pytest-subtests: upgrade 0.11.0 -> 0.12.1

---
 ...est-subtests_0.11.0.bb => python3-pytest-subtests_0.12.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest-subtests_0.11.0.bb => python3-pytest-subtests_0.12.1.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb b/meta/recipes-devtools/python/python3-pytest-subtests_0.12.1.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb
rename to meta/recipes-devtools/python/python3-pytest-subtests_0.12.1.bb
index 44fa1e2b80..0590be705f 100644
--- a/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb
+++ b/meta/recipes-devtools/python/python3-pytest-subtests_0.12.1.bb
@@ -7,7 +7,7 @@ BUGTRACKER = "https://github.com/pytest-dev/pytest-subtests/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=242b4e17fa287dcf7aef372f6bc3dcb1"
 
-SRC_URI[sha256sum] = "51865c88457545f51fb72011942f0a3c6901ee9e24cbfb6d1b9dc1348bafbe37"
+SRC_URI[sha256sum] = "d6605dcb88647e0b7c1889d027f8ef1c17d7a2c60927ebfdc09c7b0d8120476d"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.42.0


--===============1491152185886635219==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-pytest-subtests/python3-pytest-subtests: PKGSIZE changed from 33972 to 38139 (+12%)
packages/core2-64-poky-linux/python3-pytest-subtests/python3-pytest-subtests: FILELIST: directory renamed /usr/lib/python3.12/site-packages/pytest_subtests-0.11.0.dist-info -> /usr/lib/python3.12/site-packages/pytest_subtests-0.12.1.dist-info, removed "/usr/lib/python3.12/site-packages/__pycache__/pytest_subtests.cpython-312.pyc /usr/lib/python3.12/site-packages/pytest_subtests.py", added "/usr/lib/python3.12/site-packages/pytest_subtests/plugin.py /usr/lib/python3.12/site-packages/pytest_subtests/py.typed /usr/lib/python3.12/site-packages/pytest_subtests/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/pytest_subtests/__init__.py /usr/lib/python3.12/site-packages/pytest_subtests/__pycache__/plugin.cpython-312.pyc"
Changes to packages/core2-64-poky-linux/python3-pytest-subtests (sysroot):
  /usr/lib/python3.12/site-packages/pytest_subtests-0.11.0.dist-info moved to /usr/lib/python3.12/site-packages/pytest_subtests-0.12.1.dist-info
  /usr/lib/python3.12/site-packages/pytest_subtests was added
  /usr/lib/python3.12/site-packages/pytest_subtests/__init__.py was added
  /usr/lib/python3.12/site-packages/pytest_subtests/plugin.py was added
  /usr/lib/python3.12/site-packages/pytest_subtests/__pycache__ was added
  /usr/lib/python3.12/site-packages/pytest_subtests/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/pytest_subtests/__pycache__/plugin.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/pytest_subtests/py.typed was added
  /usr/lib/python3.12/site-packages/__pycache__ was removed
  /usr/lib/python3.12/site-packages/__pycache__/pytest_subtests.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pytest_subtests.py was removed

--===============1491152185886635219==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pytest-subtests: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pytest-subtests/pytest-subtests-0.11.0.tar.gz;downloadfilename=pytest-subtests-0.11.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pytest-subtests/pytest-subtests-0.12.1.tar.gz;downloadfilename=pytest-subtests-0.12.1.tar.gz"
packages/core2-64-poky-linux/python3-pytest-subtests: PV changed from "0.11.0" to "0.12.1"
packages/core2-64-poky-linux/python3-pytest-subtests: PKGV changed from 0.11.0 [default] to 0.12.1 [default]
packages/core2-64-poky-linux/python3-pytest-subtests/python3-pytest-subtests-dbg: PV changed from "0.11.0" to "0.12.1"
packages/core2-64-poky-linux/python3-pytest-subtests/python3-pytest-subtests-dbg: PKGV changed from 0.11.0 [default] to 0.12.1 [default]
packages/core2-64-poky-linux/python3-pytest-subtests/python3-pytest-subtests-dev: PV changed from "0.11.0" to "0.12.1"
packages/core2-64-poky-linux/python3-pytest-subtests/python3-pytest-subtests-dev: PKGV changed from 0.11.0 [default] to 0.12.1 [default]
packages/core2-64-poky-linux/python3-pytest-subtests/python3-pytest-subtests-doc: PV changed from "0.11.0" to "0.12.1"
packages/core2-64-poky-linux/python3-pytest-subtests/python3-pytest-subtests-doc: PKGV changed from 0.11.0 [default] to 0.12.1 [default]
packages/core2-64-poky-linux/python3-pytest-subtests/python3-pytest-subtests-locale: PV changed from "0.11.0" to "0.12.1"
packages/core2-64-poky-linux/python3-pytest-subtests/python3-pytest-subtests-locale: PKGV changed from 0.11.0 [default] to 0.12.1 [default]
packages/core2-64-poky-linux/python3-pytest-subtests/python3-pytest-subtests-src: PV changed from "0.11.0" to "0.12.1"
packages/core2-64-poky-linux/python3-pytest-subtests/python3-pytest-subtests-src: PKGV changed from 0.11.0 [default] to 0.12.1 [default]
packages/core2-64-poky-linux/python3-pytest-subtests/python3-pytest-subtests-staticdev: PV changed from "0.11.0" to "0.12.1"
packages/core2-64-poky-linux/python3-pytest-subtests/python3-pytest-subtests-staticdev: PKGV changed from 0.11.0 [default] to 0.12.1 [default]
packages/core2-64-poky-linux/python3-pytest-subtests/python3-pytest-subtests: PV changed from "0.11.0" to "0.12.1"
packages/core2-64-poky-linux/python3-pytest-subtests/python3-pytest-subtests: FILELIST: directory renamed /usr/lib/python3.12/site-packages/pytest_subtests-0.11.0.dist-info -> /usr/lib/python3.12/site-packages/pytest_subtests-0.12.1.dist-info, removed "/usr/lib/python3.12/site-packages/__pycache__/pytest_subtests.cpython-312.pyc /usr/lib/python3.12/site-packages/pytest_subtests.py", added "/usr/lib/python3.12/site-packages/pytest_subtests/plugin.py /usr/lib/python3.12/site-packages/pytest_subtests/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/pytest_subtests/__init__.py /usr/lib/python3.12/site-packages/pytest_subtests/py.typed /usr/lib/python3.12/site-packages/pytest_subtests/__pycache__/plugin.cpython-312.pyc"
packages/core2-64-poky-linux/python3-pytest-subtests/python3-pytest-subtests: PKGV changed from 0.11.0 [default] to 0.12.1 [default]
packages/core2-64-poky-linux/python3-pytest-subtests/python3-pytest-subtests: PKGSIZE changed from 33972 to 38139 (+12%)
Changes to packages/core2-64-poky-linux/python3-pytest-subtests (sysroot):
  /usr/lib/python3.12/site-packages/pytest_subtests-0.11.0.dist-info moved to /usr/lib/python3.12/site-packages/pytest_subtests-0.12.1.dist-info
  /usr/lib/python3.12/site-packages/pytest_subtests was added
  /usr/lib/python3.12/site-packages/pytest_subtests/__init__.py was added
  /usr/lib/python3.12/site-packages/pytest_subtests/plugin.py was added
  /usr/lib/python3.12/site-packages/pytest_subtests/__pycache__ was added
  /usr/lib/python3.12/site-packages/pytest_subtests/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/pytest_subtests/__pycache__/plugin.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/pytest_subtests/py.typed was added
  /usr/lib/python3.12/site-packages/__pycache__ was removed
  /usr/lib/python3.12/site-packages/__pycache__/pytest_subtests.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pytest_subtests.py was removed

--===============1491152185886635219==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pytest-subtests-upgrade-0.11.0-0.12.1.patch"

RnJvbSBmMzY4N2M4NmVlOWEzOTU0OGY2OWJmZjc3YzY1ZTYzMjUwMzU0YzVkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXByIDIwMjQgMTk6NTA6NDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5dGVzdC1zdWJ0ZXN0czogdXBncmFkZSAwLjExLjAgLT4gMC4xMi4xCgotLS0KIC4u
LmVzdC1zdWJ0ZXN0c18wLjExLjAuYmIgPT4gcHl0aG9uMy1weXRlc3Qtc3VidGVzdHNfMC4xMi4x
LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHl0ZXN0LXN1
YnRlc3RzXzAuMTEuMC5iYiA9PiBweXRob24zLXB5dGVzdC1zdWJ0ZXN0c18wLjEyLjEuYmJ9ICg4
NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5
dGVzdC1zdWJ0ZXN0c18wLjExLjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtcHl0ZXN0LXN1YnRlc3RzXzAuMTIuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDg2JQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl0ZXN0LXN1YnRl
c3RzXzAuMTEuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXB5dGVzdC1zdWJ0ZXN0c18wLjEyLjEuYmIKaW5kZXggNDRmYTFlMmI4MC4uMDU5MGJlNzA1
ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5dGVz
dC1zdWJ0ZXN0c18wLjExLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXB5dGVzdC1zdWJ0ZXN0c18wLjEyLjEuYmIKQEAgLTcsNyArNyw3IEBAIEJVR1RSQUNL
RVIgPSAiaHR0cHM6Ly9naXRodWIuY29tL3B5dGVzdC1kZXYvcHl0ZXN0LXN1YnRlc3RzL2lzc3Vl
cyIKIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTtt
ZDU9MjQyYjRlMTdmYTI4N2RjZjdhZWYzNzJmNmJjM2RjYjEiCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICI1MTg2NWM4ODQ1NzU0NWY1MWZiNzIwMTE5NDJmMGEzYzY5MDFlZTllMjRjYmZiNmQxYjlk
YzEzNDhiYWZiZTM3IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImQ2NjA1ZGNiODg2NDdlMGI3YzE4
ODlkMDI3ZjhlZjFjMTdkN2EyYzYwOTI3ZWJmZGMwOWM3YjBkODEyMDQ3NmQiCiAKIGluaGVyaXQg
cHlwaSBweXRob25fc2V0dXB0b29sc19idWlsZF9tZXRhCiAKLS0gCjIuNDIuMAoK

--===============1491152185886635219==--

