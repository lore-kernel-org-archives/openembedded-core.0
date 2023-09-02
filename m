Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DE46CCF966
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:15 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.5669.1693650552490806249
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=bnYJodB3;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=K3MrU2bB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018a55708a0d-90a80196-c9ca-4773-98da-ab3ae2f74caa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650553;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Fo8WXAlJbOFPhXEt5bsz0k1UvrXJ/LZJSzM7RpQVVL8=;
	b=bnYJodB39ALuKZ2IcHrCclLtCFXJqlosCSg1dzE1g8PrN0hVAozoQYmeRq9EuDar
	iagyWhiHtmrHTjCKPG9OJSjxLqLC4yIbIZz+d/ljZ50rys9f8qLTgK7xhHf1QhEjh+0
	ixOPfOO1vm79ZjLnvVSekuUxAD8Hc3/atmw/UxB8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650553;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Fo8WXAlJbOFPhXEt5bsz0k1UvrXJ/LZJSzM7RpQVVL8=;
	b=K3MrU2bBe76l5AJ80yv487/WmJ9txAFhPVRTSsplUUurmguYlsW12ISW7CpP/h4q
	mHzQfARnORZHUL4DPnp/pE534l2BJlsPWE1vdNha5E2syR8g0DWox77W6W+AOl9B2Hl
	wpmOZ2TTGFHTqYslMu4E1/Gn8nLRHuqW6fN6ai5E=
Content-Type: multipart/mixed; boundary="===============1726928505727198334=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinx: upgrading to 7.2.5 SUCCEEDED
Message-ID: <0101018a55708a0d-90a80196-c9ca-4773-98da-ab3ae2f74caa-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187072

--===============1726928505727198334==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-sphinx* to *7.2.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sphinx-upgrade-7.1.1-7.2.5.patch
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
From 215039f33c984c04765a70bf3298c297b3c3a61f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Sep 2023 16:46:41 +0000
Subject: [PATCH] python3-sphinx: upgrade 7.1.1 -> 7.2.5

---
 .../python/{python3-sphinx_7.1.1.bb => python3-sphinx_7.2.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinx_7.1.1.bb => python3-sphinx_7.2.5.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-sphinx_7.1.1.bb b/meta/recipes-devtools/python/python3-sphinx_7.2.5.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-sphinx_7.1.1.bb
rename to meta/recipes-devtools/python/python3-sphinx_7.2.5.bb
index 92d6012692..f55cc5a3ec 100644
--- a/meta/recipes-devtools/python/python3-sphinx_7.1.1.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_7.2.5.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5eb6ac1b115a1ed24a12d9f15b633993"
 
-SRC_URI[sha256sum] = "59b8e391f0768a96cd233e8300fe7f0a8dc2f64f83dc2a54336a9a84f428ff4e"
+SRC_URI[sha256sum] = "1a9290001b75c497fd087e92b0334f1bbfa1a1ae7fddc084990c4b7bd1130b88"
 
 inherit python_flit_core pypi
 UPSTREAM_CHECK_REGEX = "/Sphinx/(?P<pver>(\d+[\.\-_]*)+)/"
-- 
2.39.2


--===============1726928505727198334==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-sphinx: PV changed from "7.1.1" to "7.2.5"
packages/core2-32-poky-linux/python3-sphinx: PKGV changed from 7.1.1 [default] to 7.2.5 [default]
packages/core2-32-poky-linux/python3-sphinx: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/sphinx/sphinx-7.1.1.tar.gz;downloadfilename=sphinx-7.1.1.tar.gz" to "https://files.pythonhosted.org/packages/source/s/sphinx/sphinx-7.2.5.tar.gz;downloadfilename=sphinx-7.2.5.tar.gz"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-dbg: PV changed from "7.1.1" to "7.2.5"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-dbg: PKGV changed from 7.1.1 [default] to 7.2.5 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-dev: PV changed from "7.1.1" to "7.2.5"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-dev: PKGV changed from 7.1.1 [default] to 7.2.5 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-doc: PV changed from "7.1.1" to "7.2.5"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-doc: PKGV changed from 7.1.1 [default] to 7.2.5 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-locale: PV changed from "7.1.1" to "7.2.5"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-locale: PKGV changed from 7.1.1 [default] to 7.2.5 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-src: PV changed from "7.1.1" to "7.2.5"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-src: PKGV changed from 7.1.1 [default] to 7.2.5 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-staticdev: PV changed from "7.1.1" to "7.2.5"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-staticdev: PKGV changed from 7.1.1 [default] to 7.2.5 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx: PV changed from "7.1.1" to "7.2.5"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx: PKGV changed from 7.1.1 [default] to 7.2.5 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx: PKGSIZE changed from 15480057 to 15669062 (+1%)
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx: FILELIST: directory renamed /usr/lib/python3.11/site-packages/sphinx-7.1.1.dist-info -> /usr/lib/python3.11/site-packages/sphinx-7.2.5.dist-info, removed "/usr/lib/python3.11/site-packages/sphinx/testing/__pycache__/comparer.cpython-311.pyc /usr/lib/python3.11/site-packages/sphinx/testing/comparer.py", added "/usr/lib/python3.11/site-packages/sphinx/locale/gl/LC_MESSAGES/sphinx.js /usr/lib/python3.11/site-packages/sphinx/locale/gl/LC_MESSAGES/sphinx.mo /usr/lib/python3.11/site-packages/sphinx/builders/html/__pycache__/_assets.cpython-311.pyc /usr/lib/python3.11/site-packages/sphinx/util/__pycache__/index_entries.cpython-311.pyc /usr/lib/python3.11/site-packages/sphinx/builders/html/_assets.py /usr/lib/python3.11/site-packages/sphinx/locale/gl/LC_MESSAGES/sphinx.po /usr/lib/python3.11/site-packages/sphinx/util/index_entries.py /usr/lib/python3.11/site-packages/sphinx/util/__pycache__/_pathlib.cpython-311.pyc /usr/lib/python3.
 11/site-packages/sphinx/util/_pathlib.py"
Changes to packages/core2-32-poky-linux/python3-sphinx (sysroot):
  /usr/lib/python3.11/site-packages/sphinx-7.1.1.dist-info moved to /usr/lib/python3.11/site-packages/sphinx-7.2.5.dist-info
  /usr/lib/python3.11/site-packages/sphinx/builders/html/_assets.py was added
  /usr/lib/python3.11/site-packages/sphinx/builders/html/__pycache__/_assets.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/sphinx/locale/gl was added
  /usr/lib/python3.11/site-packages/sphinx/locale/gl/LC_MESSAGES was added
  /usr/lib/python3.11/site-packages/sphinx/locale/gl/LC_MESSAGES/sphinx.js was added
  /usr/lib/python3.11/site-packages/sphinx/locale/gl/LC_MESSAGES/sphinx.mo was added
  /usr/lib/python3.11/site-packages/sphinx/locale/gl/LC_MESSAGES/sphinx.po was added
  /usr/lib/python3.11/site-packages/sphinx/util/index_entries.py was added
  /usr/lib/python3.11/site-packages/sphinx/util/_pathlib.py was added
  /usr/lib/python3.11/site-packages/sphinx/util/__pycache__/index_entries.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/sphinx/util/__pycache__/_pathlib.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/sphinx/testing/comparer.py was removed
  /usr/lib/python3.11/site-packages/sphinx/testing/__pycache__/comparer.cpython-311.pyc was removed

--===============1726928505727198334==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-sphinx-upgrade-7.1.1-7.2.5.patch"

RnJvbSAyMTUwMzlmMzNjOTg0YzA0NzY1YTcwYmYzMjk4YzI5N2IzYzNhNjFmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBTZXAgMjAyMyAxNjo0Njo0MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc3BoaW54OiB1cGdyYWRlIDcuMS4xIC0+IDcuMi41CgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtc3BoaW54XzcuMS4xLmJiID0+IHB5dGhvbjMtc3BoaW54XzcuMi41LmJifSB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtc3BoaW54XzcuMS4xLmJiID0+IHB5
dGhvbjMtc3BoaW54XzcuMi41LmJifSAoOTElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhpbnhfNy4xLjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54XzcuMi41LmJiCnNpbWlsYXJpdHkgaW5kZXggOTEl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhpbnhf
Ny4xLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1z
cGhpbnhfNy4yLjUuYmIKaW5kZXggOTJkNjAxMjY5Mi4uZjU1Y2M1YTNlYyAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNwaGlueF83LjEuMS5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54XzcuMi41LmJiCkBA
IC00LDcgKzQsNyBAQCBTRUNUSU9OID0gImRldmVsL3B5dGhvbiIKIExJQ0VOU0UgPSAiQlNELTIt
Q2xhdXNlICYgTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9NWVi
NmFjMWIxMTVhMWVkMjRhMTJkOWYxNWI2MzM5OTMiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1
OWI4ZTM5MWYwNzY4YTk2Y2QyMzNlODMwMGZlN2YwYThkYzJmNjRmODNkYzJhNTQzMzZhOWE4NGY0
MjhmZjRlIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjFhOTI5MDAwMWI3NWM0OTdmZDA4N2U5MmIw
MzM0ZjFiYmZhMWExYWU3ZmRkYzA4NDk5MGM0YjdiZDExMzBiODgiCiAKIGluaGVyaXQgcHl0aG9u
X2ZsaXRfY29yZSBweXBpCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICIvU3BoaW54Lyg/UDxwdmVy
PihcZCtbXC5cLV9dKikrKS8iCi0tIAoyLjM5LjIKCg==

--===============1726928505727198334==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-sphinx/python3-sphinx: FILELIST: directory renamed /usr/lib/python3.11/site-packages/sphinx-7.1.1.dist-info -> /usr/lib/python3.11/site-packages/sphinx-7.2.5.dist-info, removed "/usr/lib/python3.11/site-packages/sphinx/testing/comparer.py /usr/lib/python3.11/site-packages/sphinx/testing/__pycache__/comparer.cpython-311.pyc", added "/usr/lib/python3.11/site-packages/sphinx/builders/html/__pycache__/_assets.cpython-311.pyc /usr/lib/python3.11/site-packages/sphinx/util/__pycache__/index_entries.cpython-311.pyc /usr/lib/python3.11/site-packages/sphinx/util/__pycache__/_pathlib.cpython-311.pyc /usr/lib/python3.11/site-packages/sphinx/util/index_entries.py /usr/lib/python3.11/site-packages/sphinx/util/_pathlib.py /usr/lib/python3.11/site-packages/sphinx/builders/html/_assets.py /usr/lib/python3.11/site-packages/sphinx/locale/gl/LC_MESSAGES/sphinx.js /usr/lib/python3.11/site-packages/sphinx/locale/gl/LC_MESSAGES/sphinx.mo /usr/lib/python3.11/site-package
 s/sphinx/locale/gl/LC_MESSAGES/sphinx.po"
Changes to packages/core2-32-poky-linux/python3-sphinx (sysroot):
  /usr/lib/python3.11/site-packages/sphinx-7.1.1.dist-info moved to /usr/lib/python3.11/site-packages/sphinx-7.2.5.dist-info
  /usr/lib/python3.11/site-packages/sphinx/builders/html/_assets.py was added
  /usr/lib/python3.11/site-packages/sphinx/builders/html/__pycache__/_assets.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/sphinx/locale/gl was added
  /usr/lib/python3.11/site-packages/sphinx/locale/gl/LC_MESSAGES was added
  /usr/lib/python3.11/site-packages/sphinx/locale/gl/LC_MESSAGES/sphinx.js was added
  /usr/lib/python3.11/site-packages/sphinx/locale/gl/LC_MESSAGES/sphinx.mo was added
  /usr/lib/python3.11/site-packages/sphinx/locale/gl/LC_MESSAGES/sphinx.po was added
  /usr/lib/python3.11/site-packages/sphinx/util/index_entries.py was added
  /usr/lib/python3.11/site-packages/sphinx/util/_pathlib.py was added
  /usr/lib/python3.11/site-packages/sphinx/util/__pycache__/index_entries.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/sphinx/util/__pycache__/_pathlib.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/sphinx/testing/comparer.py was removed
  /usr/lib/python3.11/site-packages/sphinx/testing/__pycache__/comparer.cpython-311.pyc was removed

--===============1726928505727198334==--

