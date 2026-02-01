Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61F0ED172B3
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 13:12:56 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29194.1769951570514286567
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 05:12:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=llIXZJVd;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=IbtE+F09;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019c1955a9ef-dd14b2c5-8fa2-4878-928d-e8680db02164-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769951570;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=i3VZszoS6xv3SHGdC06GpYM6/OV9kBjlzoI3uBmHojU=;
	b=llIXZJVdDiPrIkmN1JrnSyDUmg+T+oSamhlvVb0fipxBeUnslEK2w6hayRYYe927
	oAMOCa6f3FQsAjquTVI/lU/1qnuW0AP3k8IKYKLKjdJVmxTE4HoGka512L1VHFOvsIu
	lWc2qO+qU06UWibORxe5p19ixbOQgO0w1hXnHWFE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769951570;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=i3VZszoS6xv3SHGdC06GpYM6/OV9kBjlzoI3uBmHojU=;
	b=IbtE+F09N8J7AAs82u/X7eMJTZ8qceln+pxD1cuwSlzJqne0mexzf8L1iAKq77WY
	YQ9SACZW9W6eI/+nMQm3tRQGTM/HQg/5+9/piAGmZeQCPqSJO9b3JVfSPxulbnoGCi9
	hs/hImUXQ277JIRD/LXEXhz80AZO3mH9tc/lNrpQ=
Content-Type: multipart/mixed; boundary="===============8643184731326019918=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pycparser: upgrading to 3.0 SUCCEEDED
Message-ID: <0101019c1955a9ef-dd14b2c5-8fa2-4878-928d-e8680db02164-000000@us-west-2.amazonses.com>
Date: Sun, 1 Feb 2026 13:12:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 13:12:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230288

--===============8643184731326019918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pycparser* to *3.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pycparser-upgrade-2.23-3.0.patch
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
From 1136a78546b0420d59924e2dfe628a8729b0886f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Feb 2026 09:14:35 +0000
Subject: [PATCH] python3-pycparser: upgrade 2.23 -> 3.0

---
 .../{python3-pycparser_2.23.bb => python3-pycparser_3.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pycparser_2.23.bb => python3-pycparser_3.0.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-pycparser_2.23.bb b/meta/recipes-devtools/python/python3-pycparser_3.0.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-pycparser_2.23.bb
rename to meta/recipes-devtools/python/python3-pycparser_3.0.bb
index a33a6553b4..ab2258a3e1 100644
--- a/meta/recipes-devtools/python/python3-pycparser_2.23.bb
+++ b/meta/recipes-devtools/python/python3-pycparser_3.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eliben/pycparser"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9761c3ffee7ba99c60dca0408fd3262b"
 
-SRC_URI[sha256sum] = "78816d4f24add8f10a06d6f05b4d424ad9e96cfebf68a4ddc99c65c0720d00c2"
+SRC_URI[sha256sum] = "600f49d217304a5902ac3c37e1281c9fe94e4d0489de643a9504c5cdfdfc6b29"
 
 inherit pypi setuptools3
 
-- 
2.47.1


--===============8643184731326019918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser: PKGSIZE changed from 1871608 to 474185 (-75%)
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pycparser-2.23.dist-info -> /usr/lib/python3.14/site-packages/pycparser-3.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/pycparser-2.23.dist-info/licenses -> /usr/lib/python3.14/site-packages/pycparser-3.0.dist-info/licenses, removed "/usr/lib/python3.14/site-packages/pycparser/ply/__init__.py /usr/lib/python3.14/site-packages/pycparser/ply/yacc.py /usr/lib/python3.14/site-packages/pycparser/ply/ctokens.py /usr/lib/python3.14/site-packages/pycparser/lextab.py /usr/lib/python3.14/site-packages/pycparser/_build_tables.py /usr/lib/python3.14/site-packages/pycparser/ply/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/pycparser/yacctab.py /usr/lib/python3.14/site-packages/pycparser/__pycache__/_build_tables.cpython-314.pyc /usr/lib/python3.14/site-packages/pycparser/__pycache__/yacctab.cpython-314.pyc /usr/lib/python3.14/
 site-packages/pycparser/ply/ygen.py /usr/lib/python3.14/site-packages/pycparser/ply/lex.py /usr/lib/python3.14/site-packages/pycparser/ply/__pycache__/lex.cpython-314.pyc /usr/lib/python3.14/site-packages/pycparser/ply/__pycache__/cpp.cpython-314.pyc /usr/lib/python3.14/site-packages/pycparser/ply/__pycache__/yacc.cpython-314.pyc /usr/lib/python3.14/site-packages/pycparser/ply/__pycache__/ygen.cpython-314.pyc /usr/lib/python3.14/site-packages/pycparser/__pycache__/lextab.cpython-314.pyc /usr/lib/python3.14/site-packages/pycparser/plyparser.py /usr/lib/python3.14/site-packages/pycparser/__pycache__/plyparser.cpython-314.pyc /usr/lib/python3.14/site-packages/pycparser/ply/cpp.py /usr/lib/python3.14/site-packages/pycparser/ply/__pycache__/ctokens.cpython-314.pyc"
Changes to packages/x86-64-v3-poky-linux/python3-pycparser (sysroot):
  /usr/lib/python3.14/site-packages/pycparser-3.0.dist-info was added
  /usr/lib/python3.14/site-packages/pycparser-3.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/pycparser-3.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/pycparser-3.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/pycparser-3.0.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/pycparser-3.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/pycparser-2.23.dist-info was removed
  /usr/lib/python3.14/site-packages/pycparser-2.23.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/pycparser-2.23.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/pycparser-2.23.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/pycparser-2.23.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/pycparser-2.23.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/pycparser/_build_tables.py was removed
  /usr/lib/python3.14/site-packages/pycparser/lextab.py was removed
  /usr/lib/python3.14/site-packages/pycparser/ply was removed
  /usr/lib/python3.14/site-packages/pycparser/ply/cpp.py was removed
  /usr/lib/python3.14/site-packages/pycparser/ply/ctokens.py was removed
  /usr/lib/python3.14/site-packages/pycparser/ply/__init__.py was removed
  /usr/lib/python3.14/site-packages/pycparser/ply/lex.py was removed
  /usr/lib/python3.14/site-packages/pycparser/plyparser.py was removed
  /usr/lib/python3.14/site-packages/pycparser/ply/__pycache__ was removed
  /usr/lib/python3.14/site-packages/pycparser/ply/__pycache__/cpp.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pycparser/ply/__pycache__/ctokens.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pycparser/ply/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pycparser/ply/__pycache__/lex.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pycparser/ply/__pycache__/yacc.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pycparser/ply/__pycache__/ygen.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pycparser/ply/yacc.py was removed
  /usr/lib/python3.14/site-packages/pycparser/ply/ygen.py was removed
  /usr/lib/python3.14/site-packages/pycparser/__pycache__/_build_tables.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pycparser/__pycache__/lextab.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pycparser/__pycache__/plyparser.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pycparser/__pycache__/yacctab.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pycparser/yacctab.py was removed

--===============8643184731326019918==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pycparser-upgrade-2.23-3.0.patch"

RnJvbSAxMTM2YTc4NTQ2YjA0MjBkNTk5MjRlMmRmZTYyOGE4NzI5YjA4ODZmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBGZWIgMjAyNiAwOToxNDozNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHljcGFyc2VyOiB1cGdyYWRlIDIuMjMgLT4gMy4wCgotLS0KIC4uLi97cHl0aG9uMy1w
eWNwYXJzZXJfMi4yMy5iYiA9PiBweXRob24zLXB5Y3BhcnNlcl8zLjAuYmJ9ICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHljcGFyc2VyXzIuMjMuYmIgPT4g
cHl0aG9uMy1weWNwYXJzZXJfMy4wLmJifSAoODIlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNwYXJzZXJfMi4yMy5iYiBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNwYXJzZXJfMy4wLmJiCnNpbWlsYXJpdHkgaW5k
ZXggODIlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1w
eWNwYXJzZXJfMi4yMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXB5Y3BhcnNlcl8zLjAuYmIKaW5kZXggYTMzYTY1NTNiNC4uYWIyMjU4YTNlMSAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y3BhcnNlcl8y
LjIzLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNwYXJz
ZXJfMy4wLmJiCkBAIC0zLDcgKzMsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20v
ZWxpYmVuL3B5Y3BhcnNlciIKIExJQ0VOU0UgPSAiQlNELTMtQ2xhdXNlIgogTElDX0ZJTEVTX0NI
S1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9OTc2MWMzZmZlZTdiYTk5YzYwZGNhMDQwOGZkMzI2
MmIiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI3ODgxNmQ0ZjI0YWRkOGYxMGEwNmQ2ZjA1YjRk
NDI0YWQ5ZTk2Y2ZlYmY2OGE0ZGRjOTljNjVjMDcyMGQwMGMyIgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjYwMGY0OWQyMTczMDRhNTkwMmFjM2MzN2UxMjgxYzlmZTk0ZTRkMDQ4OWRlNjQzYTk1MDRj
NWNkZmRmYzZiMjkiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi0tIAoyLjQ3LjEKCg==

--===============8643184731326019918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pycparser: PKGV changed from 2.23 [default] to 3.0 [default]
packages/x86-64-v3-poky-linux/python3-pycparser: PV changed from "2.23" to "3.0"
packages/x86-64-v3-poky-linux/python3-pycparser: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pycparser/pycparser-2.23.tar.gz;downloadfilename=pycparser-2.23.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pycparser/pycparser-3.0.tar.gz;downloadfilename=pycparser-3.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-dbg: PKGV changed from 2.23 [default] to 3.0 [default]
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-dbg: PV changed from "2.23" to "3.0"
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-dev: PKGV changed from 2.23 [default] to 3.0 [default]
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-dev: PV changed from "2.23" to "3.0"
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-doc: PKGV changed from 2.23 [default] to 3.0 [default]
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-doc: PV changed from "2.23" to "3.0"
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-locale: PKGV changed from 2.23 [default] to 3.0 [default]
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-locale: PV changed from "2.23" to "3.0"
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-src: PKGV changed from 2.23 [default] to 3.0 [default]
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-src: PV changed from "2.23" to "3.0"
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-staticdev: PKGV changed from 2.23 [default] to 3.0 [default]
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-staticdev: PV changed from "2.23" to "3.0"
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser: PKGV changed from 2.23 [default] to 3.0 [default]
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser: PV changed from "2.23" to "3.0"
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser: PKGSIZE changed from 1871608 to 474185 (-75%)
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pycparser-2.23.dist-info/licenses -> /usr/lib/python3.14/site-packages/pycparser-3.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pycparser-2.23.dist-info -> /usr/lib/python3.14/site-packages/pycparser-3.0.dist-info, removed "/usr/lib/python3.14/site-packages/pycparser/yacctab.py /usr/lib/python3.14/site-packages/pycparser/plyparser.py /usr/lib/python3.14/site-packages/pycparser/ply/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/pycparser/ply/ygen.py /usr/lib/python3.14/site-packages/pycparser/lextab.py /usr/lib/python3.14/site-packages/pycparser/_build_tables.py /usr/lib/python3.14/site-packages/pycparser/ply/lex.py /usr/lib/python3.14/site-packages/pycparser/__pycache__/_build_tables.cpython-314.pyc /usr/lib/python3.14/site-packages/pycparser/__pycache__/lextab.cpython-314.pyc /usr/lib/python3.14/site-pac
 kages/pycparser/__pycache__/yacctab.cpython-314.pyc /usr/lib/python3.14/site-packages/pycparser/ply/ctokens.py /usr/lib/python3.14/site-packages/pycparser/ply/__pycache__/cpp.cpython-314.pyc /usr/lib/python3.14/site-packages/pycparser/ply/__pycache__/lex.cpython-314.pyc /usr/lib/python3.14/site-packages/pycparser/ply/__pycache__/ygen.cpython-314.pyc /usr/lib/python3.14/site-packages/pycparser/ply/__pycache__/yacc.cpython-314.pyc /usr/lib/python3.14/site-packages/pycparser/ply/__init__.py /usr/lib/python3.14/site-packages/pycparser/__pycache__/plyparser.cpython-314.pyc /usr/lib/python3.14/site-packages/pycparser/ply/yacc.py /usr/lib/python3.14/site-packages/pycparser/ply/cpp.py /usr/lib/python3.14/site-packages/pycparser/ply/__pycache__/ctokens.cpython-314.pyc"
Changes to packages/x86-64-v3-poky-linux/python3-pycparser (sysroot):
  /usr/lib/python3.14/site-packages/pycparser-3.0.dist-info was added
  /usr/lib/python3.14/site-packages/pycparser-3.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/pycparser-3.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/pycparser-3.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/pycparser-3.0.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/pycparser-3.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/pycparser-2.23.dist-info was removed
  /usr/lib/python3.14/site-packages/pycparser-2.23.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/pycparser-2.23.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/pycparser-2.23.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/pycparser-2.23.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/pycparser-2.23.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/pycparser/_build_tables.py was removed
  /usr/lib/python3.14/site-packages/pycparser/lextab.py was removed
  /usr/lib/python3.14/site-packages/pycparser/ply was removed
  /usr/lib/python3.14/site-packages/pycparser/ply/cpp.py was removed
  /usr/lib/python3.14/site-packages/pycparser/ply/ctokens.py was removed
  /usr/lib/python3.14/site-packages/pycparser/ply/__init__.py was removed
  /usr/lib/python3.14/site-packages/pycparser/ply/lex.py was removed
  /usr/lib/python3.14/site-packages/pycparser/plyparser.py was removed
  /usr/lib/python3.14/site-packages/pycparser/ply/__pycache__ was removed
  /usr/lib/python3.14/site-packages/pycparser/ply/__pycache__/cpp.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pycparser/ply/__pycache__/ctokens.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pycparser/ply/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pycparser/ply/__pycache__/lex.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pycparser/ply/__pycache__/yacc.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pycparser/ply/__pycache__/ygen.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pycparser/ply/yacc.py was removed
  /usr/lib/python3.14/site-packages/pycparser/ply/ygen.py was removed
  /usr/lib/python3.14/site-packages/pycparser/__pycache__/_build_tables.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pycparser/__pycache__/lextab.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pycparser/__pycache__/plyparser.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pycparser/__pycache__/yacctab.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pycparser/yacctab.py was removed

--===============8643184731326019918==--

