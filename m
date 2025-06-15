Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11C0FC7115F
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 13:14:52 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.8895.1749993288954611347
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 06:14:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=oNBXHD9n;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Cq7H5qol;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019773ba7273-a97f796e-5d82-4e55-8123-a063e9f162ee-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1749993288;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gFcwJ1PgkeonL8rZSk9ZJA58yVi1u6wFNzKIU1MkszI=;
	b=oNBXHD9nfQP/3BQOpfDKIFCkE9Jmu1+pWc/MLRfW11EYvQ+8oaqwzSejU9I6fnVP
	y+lurp46K8agXkTx1wOVHHn7/+Tu5iSxBL9RIBMWUXcMYeRj/+54guJOALP4KZ7j/hT
	HB1cZYBv2naT7YrA/EvohcOG2bD/TseEkDUXtcsw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1749993288;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gFcwJ1PgkeonL8rZSk9ZJA58yVi1u6wFNzKIU1MkszI=;
	b=Cq7H5qoltK1Zczturc3moPLxqCLEwRm3GOaflYf2h+9vbMzX0V99eHHC+9lfY4uW
	QD92o9JwSqVGinF/aHKQ6bPcNzamn0pnfIz9HB5DeKlRONl/eaEkS5+LqNdxYUZoMYw
	k/isdTtp5RHgZhVE1voD8L8u9na5QnpJBjBO59o4=
Content-Type: multipart/mixed; boundary="===============5021261520893208383=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pdm: upgrading to 2.25.1 SUCCEEDED
Message-ID: <0101019773ba7273-a97f796e-5d82-4e55-8123-a063e9f162ee-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jun 2025 13:14:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 13:14:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218685

--===============5021261520893208383==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pdm* to *2.25.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pdm-upgrade-2.24.2-2.25.1.patch
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
From 435e5449fb19fddfee68744f1f70e703d3960c30 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Jun 2025 08:44:57 +0000
Subject: [PATCH] python3-pdm: upgrade 2.24.2 -> 2.25.1

---
 .../python/{python3-pdm_2.24.2.bb => python3-pdm_2.25.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm_2.24.2.bb => python3-pdm_2.25.1.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-pdm_2.24.2.bb b/meta/recipes-devtools/python/python3-pdm_2.25.1.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-pdm_2.24.2.bb
rename to meta/recipes-devtools/python/python3-pdm_2.25.1.bb
index d24e03d650..d9331ba72c 100644
--- a/meta/recipes-devtools/python/python3-pdm_2.24.2.bb
+++ b/meta/recipes-devtools/python/python3-pdm_2.25.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "ce0d5e9005fe26238b8ba5cf0e37ac00acab2fb90f904bf0219a5e8445849dfb"
+SRC_URI[sha256sum] = "3145251f37a3f94fa211ade992e7db7792da4c3e8e3eeeb1993d952adebe0b96"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.1


--===============5021261520893208383==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pdm: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.24.2.tar.gz;downloadfilename=pdm-2.24.2.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.25.1.tar.gz;downloadfilename=pdm-2.25.1.tar.gz"
packages/core2-64-poky-linux/python3-pdm: PV changed from "2.24.2" to "2.25.1"
packages/core2-64-poky-linux/python3-pdm: PKGV changed from 2.24.2 [default] to 2.25.1 [default]
packages/core2-64-poky-linux/python3-pdm/python3-pdm-dbg: PV changed from "2.24.2" to "2.25.1"
packages/core2-64-poky-linux/python3-pdm/python3-pdm-dbg: PKGV changed from 2.24.2 [default] to 2.25.1 [default]
packages/core2-64-poky-linux/python3-pdm/python3-pdm-dev: PV changed from "2.24.2" to "2.25.1"
packages/core2-64-poky-linux/python3-pdm/python3-pdm-dev: PKGV changed from 2.24.2 [default] to 2.25.1 [default]
packages/core2-64-poky-linux/python3-pdm/python3-pdm-doc: PV changed from "2.24.2" to "2.25.1"
packages/core2-64-poky-linux/python3-pdm/python3-pdm-doc: PKGV changed from 2.24.2 [default] to 2.25.1 [default]
packages/core2-64-poky-linux/python3-pdm/python3-pdm-locale: PV changed from "2.24.2" to "2.25.1"
packages/core2-64-poky-linux/python3-pdm/python3-pdm-locale: PKGV changed from 2.24.2 [default] to 2.25.1 [default]
packages/core2-64-poky-linux/python3-pdm/python3-pdm-src: PV changed from "2.24.2" to "2.25.1"
packages/core2-64-poky-linux/python3-pdm/python3-pdm-src: PKGV changed from 2.24.2 [default] to 2.25.1 [default]
packages/core2-64-poky-linux/python3-pdm/python3-pdm-staticdev: PV changed from "2.24.2" to "2.25.1"
packages/core2-64-poky-linux/python3-pdm/python3-pdm-staticdev: PKGV changed from 2.24.2 [default] to 2.25.1 [default]
packages/core2-64-poky-linux/python3-pdm/python3-pdm: PV changed from "2.24.2" to "2.25.1"
packages/core2-64-poky-linux/python3-pdm/python3-pdm: PKGSIZE changed from 2190671 to 2231487 (+2%)
packages/core2-64-poky-linux/python3-pdm/python3-pdm: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pdm-2.24.2.dist-info/licenses -> /usr/lib/python3.13/site-packages/pdm-2.25.1.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/pdm-2.24.2.dist-info -> /usr/lib/python3.13/site-packages/pdm-2.25.1.dist-info, removed "/usr/lib/python3.13/site-packages/pdm/project/lockfile.py /usr/lib/python3.13/site-packages/pdm/project/__pycache__/lockfile.cpython-313.pyc", added "/usr/lib/python3.13/site-packages/pdm/project/lockfile/pdmlock.py /usr/lib/python3.13/site-packages/pdm/project/lockfile/__init__.py /usr/lib/python3.13/site-packages/pdm/project/lockfile/pylock.py /usr/lib/python3.13/site-packages/pdm/project/lockfile/__pycache__/pylock.cpython-313.pyc /usr/lib/python3.13/site-packages/pdm/project/lockfile/__pycache__/base.cpython-313.pyc /usr/lib/python3.13/site-packages/pdm/project/lockfile/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-
 packages/pdm/project/lockfile/__pycache__/pdmlock.cpython-313.pyc /usr/lib/python3.13/site-packages/pdm/project/lockfile/base.py"
packages/core2-64-poky-linux/python3-pdm/python3-pdm: PKGV changed from 2.24.2 [default] to 2.25.1 [default]
Changes to packages/core2-64-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.13/site-packages/pdm-2.24.2.dist-info moved to /usr/lib/python3.13/site-packages/pdm-2.25.1.dist-info
  /usr/lib/python3.13/site-packages/pdm/project/lockfile was added
  /usr/lib/python3.13/site-packages/pdm/project/lockfile/base.py was added
  /usr/lib/python3.13/site-packages/pdm/project/lockfile/__init__.py was added
  /usr/lib/python3.13/site-packages/pdm/project/lockfile/pdmlock.py was added
  /usr/lib/python3.13/site-packages/pdm/project/lockfile/__pycache__ was added
  /usr/lib/python3.13/site-packages/pdm/project/lockfile/__pycache__/base.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pdm/project/lockfile/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pdm/project/lockfile/__pycache__/pdmlock.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pdm/project/lockfile/__pycache__/pylock.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pdm/project/lockfile/pylock.py was added
  /usr/lib/python3.13/site-packages/pdm/project/lockfile.py was removed
  /usr/lib/python3.13/site-packages/pdm/project/__pycache__/lockfile.cpython-313.pyc was removed

--===============5021261520893208383==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pdm-upgrade-2.24.2-2.25.1.patch"

RnJvbSA0MzVlNTQ0OWZiMTlmZGRmZWU2ODc0NGYxZjcwZTcwM2QzOTYwYzMwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSnVuIDIwMjUgMDg6NDQ6NTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBkbTogdXBncmFkZSAyLjI0LjIgLT4gMi4yNS4xCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtcGRtXzIuMjQuMi5iYiA9PiBweXRob24zLXBkbV8yLjI1LjEuYmJ9ICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcGRtXzIuMjQuMi5iYiA9PiBweXRo
b24zLXBkbV8yLjI1LjEuYmJ9ICg4MiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXBkbV8yLjI0LjIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcGRtXzIuMjUuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDgyJQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjQuMi5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBkbV8yLjI1LjEu
YmIKaW5kZXggZDI0ZTAzZDY1MC4uZDkzMzFiYTcyYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBkbV8yLjI0LjIuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBkbV8yLjI1LjEuYmIKQEAgLTQsNyArNCw3IEBAIExJ
Q0VOU0UgPSAiTUlUIgogU0VDVElPTiA9ICJkZXZlbC9weXRob24iCiBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFO21kNT0yZWIzMWEyY2MxYTc1OGMzNGI0OTlmMjg3ZGQwNGVmMiIK
IAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImNlMGQ1ZTkwMDVmZTI2MjM4YjhiYTVjZjBlMzdhYzAw
YWNhYjJmYjkwZjkwNGJmMDIxOWE1ZTg0NDU4NDlkZmIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAi
MzE0NTI1MWYzN2EzZjk0ZmEyMTFhZGU5OTJlN2RiNzc5MmRhNGMzZThlM2VlZWIxOTkzZDk1MmFk
ZWJlMGI5NiIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEKIAot
LSAKMi40Ny4xCgo=

--===============5021261520893208383==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-pdm/python3-pdm: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pdm-2.24.2.dist-info/licenses -> /usr/lib/python3.13/site-packages/pdm-2.25.1.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/pdm-2.24.2.dist-info -> /usr/lib/python3.13/site-packages/pdm-2.25.1.dist-info, removed "/usr/lib/python3.13/site-packages/pdm/project/__pycache__/lockfile.cpython-313.pyc /usr/lib/python3.13/site-packages/pdm/project/lockfile.py", added "/usr/lib/python3.13/site-packages/pdm/project/lockfile/base.py /usr/lib/python3.13/site-packages/pdm/project/lockfile/__pycache__/base.cpython-313.pyc /usr/lib/python3.13/site-packages/pdm/project/lockfile/__pycache__/pdmlock.cpython-313.pyc /usr/lib/python3.13/site-packages/pdm/project/lockfile/__pycache__/pylock.cpython-313.pyc /usr/lib/python3.13/site-packages/pdm/project/lockfile/pdmlock.py /usr/lib/python3.13/site-packages/pdm/project/lockfile/__init__.py /usr/lib/python3.13/site-pac
 kages/pdm/project/lockfile/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/pdm/project/lockfile/pylock.py"
Changes to packages/core2-64-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.13/site-packages/pdm-2.24.2.dist-info moved to /usr/lib/python3.13/site-packages/pdm-2.25.1.dist-info
  /usr/lib/python3.13/site-packages/pdm/project/lockfile was added
  /usr/lib/python3.13/site-packages/pdm/project/lockfile/base.py was added
  /usr/lib/python3.13/site-packages/pdm/project/lockfile/__init__.py was added
  /usr/lib/python3.13/site-packages/pdm/project/lockfile/pdmlock.py was added
  /usr/lib/python3.13/site-packages/pdm/project/lockfile/__pycache__ was added
  /usr/lib/python3.13/site-packages/pdm/project/lockfile/__pycache__/base.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pdm/project/lockfile/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pdm/project/lockfile/__pycache__/pdmlock.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pdm/project/lockfile/__pycache__/pylock.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pdm/project/lockfile/pylock.py was added
  /usr/lib/python3.13/site-packages/pdm/project/lockfile.py was removed
  /usr/lib/python3.13/site-packages/pdm/project/__pycache__/lockfile.cpython-313.pyc was removed

--===============5021261520893208383==--

