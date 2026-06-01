Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4854ECD6E65
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:39 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1555.1780328130323382964
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=fTGWp5ga;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=WjyZhOo8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019e83d38487-b4fef8cc-9744-4c09-a649-1546bc7188f1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328138;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yttV3rJiNLUl9RHXSZLFzymuyNNhKnb3PVMMt9ZWfDo=;
	b=fTGWp5gaoTmrBZZtpddHUg7n8wlURWRDKwnGnX9UWrFKzwZIeDeyTtchen6AxgQv
	M9RgHWY57SY6J4YUED/bit+Sn0wEvKDoUB3HAaYpTu8VN8VanDs2F/VmOM9OL+1uV0W
	eTGcbGd5cAYRrHVtpMNrBVxjHFovErOoxb8vbZE0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328138;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yttV3rJiNLUl9RHXSZLFzymuyNNhKnb3PVMMt9ZWfDo=;
	b=WjyZhOo8gwox+N2EXLKYRBMJ/fvZlod72xki/3G1mxKFHMqD4O0xz4cthxY4SYDW
	k/CkLAH1VjHnhLLCLtu0Nq827gfyxzlkk1k62Q4CR72IMsBeTRAwZZLHrTsk0glrVga
	MRU+j3kDCMqokLJsDwE4Abhqbr14C6jWyh9G4utE=
Content-Type: multipart/mixed; boundary="===============5088143731725251732=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-idna: upgrading to 3.17 SUCCEEDED
Message-ID: <0101019e83d38487-b4fef8cc-9744-4c09-a649-1546bc7188f1-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237882

--===============5088143731725251732==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-idna* to *3.17* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-idna-upgrade-3.13-3.17.patch
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
From 86ac590a302a98fe3241f24778c0118691073778 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 08:33:12 +0000
Subject: [PATCH] python3-idna: upgrade 3.13 -> 3.17

---
 .../python/{python3-idna_3.13.bb => python3-idna_3.17.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-idna_3.13.bb => python3-idna_3.17.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-idna_3.13.bb b/meta/recipes-devtools/python/python3-idna_3.17.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-idna_3.13.bb
rename to meta/recipes-devtools/python/python3-idna_3.17.bb
index 339abb89c2..bf91b8627d 100644
--- a/meta/recipes-devtools/python/python3-idna_3.13.bb
+++ b/meta/recipes-devtools/python/python3-idna_3.17.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/kjd/idna"
 LICENSE = "BSD-3-Clause & Python-2.0 & Unicode-TOU"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=9a6c29079fc90c29d80332f44d2625f2"
 
-SRC_URI[sha256sum] = "585ea8fe5d69b9181ec1afba340451fba6ba764af97026f92a91d4eef164a242"
+SRC_URI[sha256sum] = "5eb0cb53bc467c12eadcf6de83163ad8527cec9416f44b9b61b19caedad2b87f"
 
 inherit pypi python_flit_core ptest-python-pytest
 
-- 
2.47.1


--===============5088143731725251732==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-idna/python3-idna-ptest: FILELIST: added "/usr/lib/python3-idna/ptest/tests/test_idna_cli.py"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna: FILELIST: directory renamed /usr/lib/python3.14/site-packages/idna-3.13.dist-info/licenses -> /usr/lib/python3.14/site-packages/idna-3.17.dist-info/licenses, removed "/usr/lib/python3.14/site-packages/idna-3.13.dist-info/WHEEL /usr/lib/python3.14/site-packages/idna-3.13.dist-info/METADATA", added "/usr/lib/python3.14/site-packages/idna/__main__.py /usr/lib/python3.14/site-packages/idna/__pycache__/__main__.cpython-314.pyc /usr/lib/python3.14/site-packages/idna/__pycache__/cli.cpython-314.pyc /usr/lib/python3.14/site-packages/idna/cli.py /usr/lib/python3.14/site-packages/idna-3.17.dist-info/WHEEL /usr/bin/idna /usr/lib/python3.14/site-packages/idna-3.17.dist-info/entry_points.txt /usr/lib/python3.14/site-packages/idna-3.17.dist-info/METADATA"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna: PKGSIZE changed from 604339 to 496280 (-18%)
Changes to packages/x86-64-v3-poky-linux/python3-idna (sysroot):
  /usr/lib/python3.14/site-packages/idna-3.13.dist-info moved to /usr/lib/python3.14/site-packages/idna-3.17.dist-info
  /usr/lib/python3.14/site-packages/idna-3.17.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/idna/cli.py was added
  /usr/lib/python3.14/site-packages/idna/__main__.py was added
  /usr/lib/python3.14/site-packages/idna/__pycache__/cli.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/idna/__pycache__/__main__.cpython-314.pyc was added

--===============5088143731725251732==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-idna-upgrade-3.13-3.17.patch"

RnJvbSA4NmFjNTkwYTMwMmE5OGZlMzI0MWYyNDc3OGMwMTE4NjkxMDczNzc4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAwODozMzoxMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaWRuYTogdXBncmFkZSAzLjEzIC0+IDMuMTcKCi0tLQogLi4uL3B5dGhvbi97cHl0aG9u
My1pZG5hXzMuMTMuYmIgPT4gcHl0aG9uMy1pZG5hXzMuMTcuYmJ9ICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1pZG5hXzMuMTMuYmIgPT4gcHl0aG9uMy1p
ZG5hXzMuMTcuYmJ9ICg4MiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWlkbmFfMy4xMy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1pZG5hXzMuMTcuYmIKc2ltaWxhcml0eSBpbmRleCA4MiUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWlkbmFfMy4xMy5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWlkbmFfMy4xNy5iYgppbmRleCAz
MzlhYmI4OWMyLi5iZjkxYjg2MjdkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtaWRuYV8zLjEzLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1pZG5hXzMuMTcuYmIKQEAgLTMsNyArMyw3IEBAIEhPTUVQQUdFID0gImh0
dHBzOi8vZ2l0aHViLmNvbS9ramQvaWRuYSIKIExJQ0VOU0UgPSAiQlNELTMtQ2xhdXNlICYgUHl0
aG9uLTIuMCAmIFVuaWNvZGUtVE9VIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5T
RS5tZDttZDU9OWE2YzI5MDc5ZmM5MGMyOWQ4MDMzMmY0NGQyNjI1ZjIiCiAKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICI1ODVlYThmZTVkNjliOTE4MWVjMWFmYmEzNDA0NTFmYmE2YmE3NjRhZjk3MDI2
ZjkyYTkxZDRlZWYxNjRhMjQyIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjVlYjBjYjUzYmM0Njdj
MTJlYWRjZjZkZTgzMTYzYWQ4NTI3Y2VjOTQxNmY0NGI5YjYxYjE5Y2FlZGFkMmI4N2YiCiAKIGlu
aGVyaXQgcHlwaSBweXRob25fZmxpdF9jb3JlIHB0ZXN0LXB5dGhvbi1weXRlc3QKIAotLSAKMi40
Ny4xCgo=

--===============5088143731725251732==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-idna: SRC_URI changed from "https://files.pythonhosted.org/packages/source/i/idna/idna-3.13.tar.gz;downloadfilename=idna-3.13.tar.gz" to "https://files.pythonhosted.org/packages/source/i/idna/idna-3.17.tar.gz;downloadfilename=idna-3.17.tar.gz"
packages/x86-64-v3-poky-linux/python3-idna: PV changed from "3.13" to "3.17"
packages/x86-64-v3-poky-linux/python3-idna: PKGV changed from 3.13 [default] to 3.17 [default]
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-dbg: PV changed from "3.13" to "3.17"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-dbg: PKGV changed from 3.13 [default] to 3.17 [default]
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-dev: PV changed from "3.13" to "3.17"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-dev: PKGV changed from 3.13 [default] to 3.17 [default]
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-doc: PV changed from "3.13" to "3.17"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-doc: PKGV changed from 3.13 [default] to 3.17 [default]
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-locale: PV changed from "3.13" to "3.17"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-locale: PKGV changed from 3.13 [default] to 3.17 [default]
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-ptest: PV changed from "3.13" to "3.17"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-ptest: PKGSIZE changed from 1483107 to 1497611 (+1%)
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-ptest: PKGV changed from 3.13 [default] to 3.17 [default]
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-ptest: FILELIST: added "/usr/lib/python3-idna/ptest/tests/test_idna_cli.py"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-src: PV changed from "3.13" to "3.17"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-src: PKGV changed from 3.13 [default] to 3.17 [default]
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-staticdev: PV changed from "3.13" to "3.17"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-staticdev: PKGV changed from 3.13 [default] to 3.17 [default]
packages/x86-64-v3-poky-linux/python3-idna/python3-idna: PV changed from "3.13" to "3.17"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna: PKGSIZE changed from 604339 to 496280 (-18%)
packages/x86-64-v3-poky-linux/python3-idna/python3-idna: PKGV changed from 3.13 [default] to 3.17 [default]
packages/x86-64-v3-poky-linux/python3-idna/python3-idna: FILELIST: directory renamed /usr/lib/python3.14/site-packages/idna-3.13.dist-info/licenses -> /usr/lib/python3.14/site-packages/idna-3.17.dist-info/licenses, removed "/usr/lib/python3.14/site-packages/idna-3.13.dist-info/METADATA /usr/lib/python3.14/site-packages/idna-3.13.dist-info/WHEEL", added "/usr/lib/python3.14/site-packages/idna/__pycache__/__main__.cpython-314.pyc /usr/lib/python3.14/site-packages/idna/__main__.py /usr/lib/python3.14/site-packages/idna-3.17.dist-info/METADATA /usr/bin/idna /usr/lib/python3.14/site-packages/idna-3.17.dist-info/entry_points.txt /usr/lib/python3.14/site-packages/idna/__pycache__/cli.cpython-314.pyc /usr/lib/python3.14/site-packages/idna/cli.py /usr/lib/python3.14/site-packages/idna-3.17.dist-info/WHEEL"
Changes to packages/x86-64-v3-poky-linux/python3-idna (sysroot):
  /usr/lib/python3.14/site-packages/idna-3.13.dist-info moved to /usr/lib/python3.14/site-packages/idna-3.17.dist-info
  /usr/lib/python3.14/site-packages/idna-3.17.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/idna/cli.py was added
  /usr/lib/python3.14/site-packages/idna/__main__.py was added
  /usr/lib/python3.14/site-packages/idna/__pycache__/cli.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/idna/__pycache__/__main__.cpython-314.pyc was added

--===============5088143731725251732==--

