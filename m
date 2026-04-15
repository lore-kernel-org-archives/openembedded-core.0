Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D7FCF428F4
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:53 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19825.1776261883061669276
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=kUk/LzBr;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=vcKp5YaY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019d91756235-4cb60a4f-3865-4ad8-9f04-872dab5f2fcd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261882;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=bh6iizT5puk5RVheinCt/p1hPG0XzgA9RoZuswrTj0o=;
	b=kUk/LzBr3ybjUHl9mveZZa8mLDfWQg/dnniynS44kD9XBv6zAKl4Wy1TyaozvHI6
	AeHmWN1On8RwAknmzc36m2U4iMBA48856m0vVOBetRJD32xTEHVyIODrQLEH1iF0/ge
	avxhC/TZfuJi66Xzwmeaz0tu1V3my3Mj8VRWg9mI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261882;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=bh6iizT5puk5RVheinCt/p1hPG0XzgA9RoZuswrTj0o=;
	b=vcKp5YaYaU9c3YY30UXcy3ac+rgvhqD1RZsH7nsZ37NncesC0ybINn23c8qxNwHz
	MH1AIGMMRPl3HzwYNgRFgSYB30Xc7MqU/STFPKUk+5EBYTOvtXj2IaBauvg4eftVBBW
	13u26iSqSkriQpW1TXBZKyJxzTFjCo72U9GSqWy8=
Content-Type: multipart/mixed; boundary="===============5095660353257930837=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Benjamin Robin <benjamin.robin@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-shacl2code: upgrading to 1.0.1 SUCCEEDED
Message-ID: <0101019d91756235-4cb60a4f-3865-4ad8-9f04-872dab5f2fcd-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235249

--===============5095660353257930837==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-shacl2code* to *1.0.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-shacl2code-upgrade-0.0.24-1.0.1.patch
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
From aff94d3ea64267481918911e8e2994dc04e037c2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 09:00:37 +0000
Subject: [PATCH] python3-shacl2code: upgrade 0.0.24 -> 1.0.1

---
 ...python3-shacl2code_0.0.24.bb => python3-shacl2code_1.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-shacl2code_0.0.24.bb => python3-shacl2code_1.0.1.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-shacl2code_0.0.24.bb b/meta/recipes-devtools/python/python3-shacl2code_1.0.1.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-shacl2code_0.0.24.bb
rename to meta/recipes-devtools/python/python3-shacl2code_1.0.1.bb
index 93ed9a2530..904940926f 100644
--- a/meta/recipes-devtools/python/python3-shacl2code_0.0.24.bb
+++ b/meta/recipes-devtools/python/python3-shacl2code_1.0.1.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0582f358628f299f29c23bf5fb2f73c9"
 
 PYPI_PACKAGE = "shacl2code"
-SRC_URI[sha256sum] = "d8b511054ca564b4514b9186ece7f5eb8048cfc5daa6625def1a3adba13c4f66"
+SRC_URI[sha256sum] = "c856822b40c330452b8b31e94a658ad4595a5ef03cdb75ea432ea9c73d0cf7d9"
 
 inherit pypi python_hatchling
 
-- 
2.47.1


--===============5095660353257930837==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code: FILELIST: directory renamed /usr/lib/python3.14/site-packages/shacl2code-0.0.24.dist-info -> /usr/lib/python3.14/site-packages/shacl2code-1.0.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/shacl2code-0.0.24.dist-info/licenses -> /usr/lib/python3.14/site-packages/shacl2code-1.0.1.dist-info/licenses, removed "/usr/lib/python3.14/site-packages/shacl2code/lang/templates/python.j2", added "/usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/cmd.py.j2 /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/__init__.py.j2 /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/__main__.py.j2 /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/model.pyi.j2 /usr/lib/python3.14/site-packages/shacl2code/__pycache__/util.cpython-314.pyc /usr/lib/python3.14/site-packages/shacl2code/util.py /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/mode
 l.py.j2"
Changes to packages/x86-64-v3-poky-linux/python3-shacl2code (sysroot):
  /usr/lib/python3.14/site-packages/shacl2code-1.0.1.dist-info was added
  /usr/lib/python3.14/site-packages/shacl2code-1.0.1.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/shacl2code-1.0.1.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/shacl2code-1.0.1.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/shacl2code-1.0.1.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/shacl2code-1.0.1.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/cmd.py.j2 was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/__init__.py.j2 was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/__main__.py.j2 was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/model.pyi.j2 was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/model.py.j2 was added
  /usr/lib/python3.14/site-packages/shacl2code/__pycache__/util.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/shacl2code/util.py was added
  /usr/lib/python3.14/site-packages/shacl2code-0.0.24.dist-info was removed
  /usr/lib/python3.14/site-packages/shacl2code-0.0.24.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/shacl2code-0.0.24.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/shacl2code-0.0.24.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/shacl2code-0.0.24.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/shacl2code-0.0.24.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python.j2 was removed

--===============5095660353257930837==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-shacl2code-upgrade-0.0.24-1.0.1.patch"

RnJvbSBhZmY5NGQzZWE2NDI2NzQ4MTkxODkxMWU4ZTI5OTRkYzA0ZTAzN2MyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMDk6MDA6MzcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNoYWNsMmNvZGU6IHVwZ3JhZGUgMC4wLjI0IC0+IDEuMC4xCgotLS0KIC4uLnB5dGhv
bjMtc2hhY2wyY29kZV8wLjAuMjQuYmIgPT4gcHl0aG9uMy1zaGFjbDJjb2RlXzEuMC4xLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtc2hhY2wyY29kZV8wLjAu
MjQuYmIgPT4gcHl0aG9uMy1zaGFjbDJjb2RlXzEuMC4xLmJifSAoODElKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zaGFjbDJjb2RlXzAuMC4yNC5i
YiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zaGFjbDJjb2RlXzEuMC4x
LmJiCnNpbWlsYXJpdHkgaW5kZXggODElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1zaGFjbDJjb2RlXzAuMC4yNC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNoYWNsMmNvZGVfMS4wLjEuYmIKaW5kZXggOTNl
ZDlhMjUzMC4uOTA0OTQwOTI2ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXNoYWNsMmNvZGVfMC4wLjI0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1zaGFjbDJjb2RlXzEuMC4xLmJiCkBAIC01LDcgKzUsNyBAQCBM
SUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTA1
ODJmMzU4NjI4ZjI5OWYyOWMyM2JmNWZiMmY3M2M5IgogCiBQWVBJX1BBQ0tBR0UgPSAic2hhY2wy
Y29kZSIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJkOGI1MTEwNTRjYTU2NGI0NTE0YjkxODZlY2U3
ZjVlYjgwNDhjZmM1ZGFhNjYyNWRlZjFhM2FkYmExM2M0ZjY2IgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gImM4NTY4MjJiNDBjMzMwNDUyYjhiMzFlOTRhNjU4YWQ0NTk1YTVlZjAzY2RiNzVlYTQzMmVh
OWM3M2QwY2Y3ZDkiCiAKIGluaGVyaXQgcHlwaSBweXRob25faGF0Y2hsaW5nCiAKLS0gCjIuNDcu
MQoK

--===============5095660353257930837==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-shacl2code: PV changed from "0.0.24" to "1.0.1"
packages/x86-64-v3-poky-linux/python3-shacl2code: PKGV changed from 0.0.24 [default] to 1.0.1 [default]
packages/x86-64-v3-poky-linux/python3-shacl2code: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/shacl2code/shacl2code-0.0.24.tar.gz;downloadfilename=shacl2code-0.0.24.tar.gz" to "https://files.pythonhosted.org/packages/source/s/shacl2code/shacl2code-1.0.1.tar.gz;downloadfilename=shacl2code-1.0.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-dbg: PV changed from "0.0.24" to "1.0.1"
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-dbg: PKGV changed from 0.0.24 [default] to 1.0.1 [default]
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-dev: PV changed from "0.0.24" to "1.0.1"
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-dev: PKGV changed from 0.0.24 [default] to 1.0.1 [default]
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-doc: PV changed from "0.0.24" to "1.0.1"
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-doc: PKGV changed from 0.0.24 [default] to 1.0.1 [default]
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-locale: PV changed from "0.0.24" to "1.0.1"
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-locale: PKGV changed from 0.0.24 [default] to 1.0.1 [default]
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-src: PV changed from "0.0.24" to "1.0.1"
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-src: PKGV changed from 0.0.24 [default] to 1.0.1 [default]
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-staticdev: PV changed from "0.0.24" to "1.0.1"
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-staticdev: PKGV changed from 0.0.24 [default] to 1.0.1 [default]
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code: FILELIST: directory renamed /usr/lib/python3.14/site-packages/shacl2code-0.0.24.dist-info -> /usr/lib/python3.14/site-packages/shacl2code-1.0.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/shacl2code-0.0.24.dist-info/licenses -> /usr/lib/python3.14/site-packages/shacl2code-1.0.1.dist-info/licenses, removed "/usr/lib/python3.14/site-packages/shacl2code/lang/templates/python.j2", added "/usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/__init__.py.j2 /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/__main__.py.j2 /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/cmd.py.j2 /usr/lib/python3.14/site-packages/shacl2code/util.py /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/model.py.j2 /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/model.pyi.j2 /usr/lib/python3.14/site-packages/shacl2code/__pycache__/util.cpython-
 314.pyc"
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code: PV changed from "0.0.24" to "1.0.1"
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code: PKGV changed from 0.0.24 [default] to 1.0.1 [default]
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code: PKGSIZE changed from 1546856 to 1607336 (+4%)
Changes to packages/x86-64-v3-poky-linux/python3-shacl2code (sysroot):
  /usr/lib/python3.14/site-packages/shacl2code-1.0.1.dist-info was added
  /usr/lib/python3.14/site-packages/shacl2code-1.0.1.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/shacl2code-1.0.1.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/shacl2code-1.0.1.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/shacl2code-1.0.1.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/shacl2code-1.0.1.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/cmd.py.j2 was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/__init__.py.j2 was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/__main__.py.j2 was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/model.pyi.j2 was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/model.py.j2 was added
  /usr/lib/python3.14/site-packages/shacl2code/__pycache__/util.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/shacl2code/util.py was added
  /usr/lib/python3.14/site-packages/shacl2code-0.0.24.dist-info was removed
  /usr/lib/python3.14/site-packages/shacl2code-0.0.24.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/shacl2code-0.0.24.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/shacl2code-0.0.24.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/shacl2code-0.0.24.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/shacl2code-0.0.24.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python.j2 was removed

--===============5095660353257930837==--

