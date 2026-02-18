Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E06A8E9A059
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:41:46 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1416.1771440097377364361
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=lZMYQ8KZ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=hZR8fM+G;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019c720edd0d-c84824a7-f959-4f88-ba0f-6ee99b384e06-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440102;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qQxHXsGEFqJpmvrglGk3TCNiWbJeVp5E7WfYcvFalTQ=;
	b=lZMYQ8KZCSRGwfIJcAHRa+G78KYVJAlxmwrZxpLVJhA1eT5itUnj8FXYTxfLhx3/
	2WX+tz1P37Wi96lXiXmETz3vWDouFuAIbP1rwq2gQcFxTIUwFDc9+Xe6dqXXeAG8k2s
	AlcykXJUFdHiKNBmE81Y4vGubXcIDzjM/gV2kEWA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440102;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qQxHXsGEFqJpmvrglGk3TCNiWbJeVp5E7WfYcvFalTQ=;
	b=hZR8fM+GyDvrG+NckIfU7zxsZVJPEmz7TUQKs9H528xjY4vZqx0aAUs+REG0lz/Q
	1EjGJaaLyFkDvtoFq1vk9/JcCJEF5TJyMwJ0vShfwTAVCBv62vL4o+1kT9W5uiiKi2n
	mgRO49FL9C7xtRY+AsXun9RLAfkFofiDsRCF1oi4=
Content-Type: multipart/mixed; boundary="===============6671756315659153304=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pycparser: upgrading to 3.0 SUCCEEDED
Message-ID: <0101019c720edd0d-c84824a7-f959-4f88-ba0f-6ee99b384e06-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:41:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231355

--===============6671756315659153304==
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
From 2e2ad3e4063df9dfeb5822db4366dfe3129a3649 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 13:39:48 +0000
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


--===============6671756315659153304==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser: PKGSIZE changed from 1871608 to 474185 (-75%)
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pycparser-2.23.dist-info -> /usr/lib/python3.14/site-packages/pycparser-3.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/pycparser-2.23.dist-info/licenses -> /usr/lib/python3.14/site-packages/pycparser-3.0.dist-info/licenses, removed "/usr/lib/python3.14/site-packages/pycparser/ply/__pycache__/ctokens.cpython-314.pyc /usr/lib/python3.14/site-packages/pycparser/plyparser.py /usr/lib/python3.14/site-packages/pycparser/yacctab.py /usr/lib/python3.14/site-packages/pycparser/ply/ygen.py /usr/lib/python3.14/site-packages/pycparser/_build_tables.py /usr/lib/python3.14/site-packages/pycparser/ply/cpp.py /usr/lib/python3.14/site-packages/pycparser/__pycache__/plyparser.cpython-314.pyc /usr/lib/python3.14/site-packages/pycparser/ply/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/pycparser/ply/__init__.py /usr/lib/python3.14/s
 ite-packages/pycparser/__pycache__/_build_tables.cpython-314.pyc /usr/lib/python3.14/site-packages/pycparser/ply/__pycache__/ygen.cpython-314.pyc /usr/lib/python3.14/site-packages/pycparser/ply/__pycache__/yacc.cpython-314.pyc /usr/lib/python3.14/site-packages/pycparser/ply/yacc.py /usr/lib/python3.14/site-packages/pycparser/ply/lex.py /usr/lib/python3.14/site-packages/pycparser/__pycache__/lextab.cpython-314.pyc /usr/lib/python3.14/site-packages/pycparser/lextab.py /usr/lib/python3.14/site-packages/pycparser/ply/__pycache__/cpp.cpython-314.pyc /usr/lib/python3.14/site-packages/pycparser/ply/__pycache__/lex.cpython-314.pyc /usr/lib/python3.14/site-packages/pycparser/ply/ctokens.py /usr/lib/python3.14/site-packages/pycparser/__pycache__/yacctab.cpython-314.pyc"
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

--===============6671756315659153304==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pycparser-upgrade-2.23-3.0.patch"

RnJvbSAyZTJhZDNlNDA2M2RmOWRmZWI1ODIyZGI0MzY2ZGZlMzEyOWEzNjQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTM6Mzk6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5Y3BhcnNlcjogdXBncmFkZSAyLjIzIC0+IDMuMAoKLS0tCiAuLi4ve3B5dGhvbjMt
cHljcGFyc2VyXzIuMjMuYmIgPT4gcHl0aG9uMy1weWNwYXJzZXJfMy4wLmJifSAgICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXB5Y3BhcnNlcl8yLjIzLmJiID0+
IHB5dGhvbjMtcHljcGFyc2VyXzMuMC5iYn0gKDgyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljcGFyc2VyXzIuMjMuYmIgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljcGFyc2VyXzMuMC5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDgyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
cHljcGFyc2VyXzIuMjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1weWNwYXJzZXJfMy4wLmJiCmluZGV4IGEzM2E2NTUzYjQuLmFiMjI1OGEzZTEgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNwYXJzZXJf
Mi4yMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljcGFy
c2VyXzMuMC5iYgpAQCAtMyw3ICszLDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29t
L2VsaWJlbi9weWNwYXJzZXIiCiBMSUNFTlNFID0gIkJTRC0zLUNsYXVzZSIKIExJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTk3NjFjM2ZmZWU3YmE5OWM2MGRjYTA0MDhmZDMy
NjJiIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNzg4MTZkNGYyNGFkZDhmMTBhMDZkNmYwNWI0
ZDQyNGFkOWU5NmNmZWJmNjhhNGRkYzk5YzY1YzA3MjBkMDBjMiIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICI2MDBmNDlkMjE3MzA0YTU5MDJhYzNjMzdlMTI4MWM5ZmU5NGU0ZDA0ODlkZTY0M2E5NTA0
YzVjZGZkZmM2YjI5IgogCiBpbmhlcml0IHB5cGkgc2V0dXB0b29sczMKIAotLSAKMi40Ny4xCgo=

--===============6671756315659153304==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pycparser: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pycparser/pycparser-2.23.tar.gz;downloadfilename=pycparser-2.23.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pycparser/pycparser-3.0.tar.gz;downloadfilename=pycparser-3.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-pycparser: PKGV changed from 2.23 [default] to 3.0 [default]
packages/x86-64-v3-poky-linux/python3-pycparser: PV changed from "2.23" to "3.0"
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
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser: PKGSIZE changed from 1871608 to 474185 (-75%)
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser: PKGV changed from 2.23 [default] to 3.0 [default]
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pycparser-2.23.dist-info -> /usr/lib/python3.14/site-packages/pycparser-3.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/pycparser-2.23.dist-info/licenses -> /usr/lib/python3.14/site-packages/pycparser-3.0.dist-info/licenses, removed "/usr/lib/python3.14/site-packages/pycparser/ply/__init__.py /usr/lib/python3.14/site-packages/pycparser/ply/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/pycparser/yacctab.py /usr/lib/python3.14/site-packages/pycparser/ply/ctokens.py /usr/lib/python3.14/site-packages/pycparser/__pycache__/plyparser.cpython-314.pyc /usr/lib/python3.14/site-packages/pycparser/ply/yacc.py /usr/lib/python3.14/site-packages/pycparser/__pycache__/lextab.cpython-314.pyc /usr/lib/python3.14/site-packages/pycparser/ply/__pycache__/yacc.cpython-314.pyc /usr/lib/python3.14/site-packages/pycparser/ply/__pycache__
 /ygen.cpython-314.pyc /usr/lib/python3.14/site-packages/pycparser/ply/lex.py /usr/lib/python3.14/site-packages/pycparser/plyparser.py /usr/lib/python3.14/site-packages/pycparser/__pycache__/yacctab.cpython-314.pyc /usr/lib/python3.14/site-packages/pycparser/__pycache__/_build_tables.cpython-314.pyc /usr/lib/python3.14/site-packages/pycparser/_build_tables.py /usr/lib/python3.14/site-packages/pycparser/ply/__pycache__/cpp.cpython-314.pyc /usr/lib/python3.14/site-packages/pycparser/ply/__pycache__/lex.cpython-314.pyc /usr/lib/python3.14/site-packages/pycparser/ply/ygen.py /usr/lib/python3.14/site-packages/pycparser/ply/cpp.py /usr/lib/python3.14/site-packages/pycparser/lextab.py /usr/lib/python3.14/site-packages/pycparser/ply/__pycache__/ctokens.cpython-314.pyc"
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser: PV changed from "2.23" to "3.0"
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

--===============6671756315659153304==--

