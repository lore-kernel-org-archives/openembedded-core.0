Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA335C5B572
	for <webhook@archiver.kernel.org>; Sat, 22 Aug 2026 05:25:48 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1645.1787376340156929713
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 22:25:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Fb4HBcLi;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=xu4jPsyL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101a027ee88a8-1bb09fcc-5dc0-45f9-b727-cd7dbb4e9d32-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1787376339;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9YndojNFiI7zHV014rTYfB0hu1q/e4M1Qr0NhYLajrc=;
	b=Fb4HBcLimwX0rBCpmK8DBwhn2PMUXth+SoUGNoY/28ufoGcxlCZTy0FxWgjpzB3d
	hQ+/b4svBCTjDYHsy5/tds1SbgO7+fAY8VruFUU6HZ8f3sc5iyVLj4Fpyy5jeA12t+4
	k0fwFOtGjLSPmSnuixi9yen3hWkwmMJVSm7heb7k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1787376339;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9YndojNFiI7zHV014rTYfB0hu1q/e4M1Qr0NhYLajrc=;
	b=xu4jPsyLc79qZ5ykVpE4aJMdaNEMV/fkR6q5/7ADAIv1nvE5KI6jPE5IYsXiaQPL
	vDBqfoHJmpkuNzI+o2HVEJfJNrC43cVfOzrm55ko4rbpDlH8ZJLmBRaaKG1fwwdrhbM
	SioIOH4yCKgcL+FVOFSr2EAqHIHyhl0V70jvY4sA=
Content-Type: multipart/mixed; boundary="===============0213906954035844510=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinx-argparse: upgrading to 0.6.1 SUCCEEDED
Message-ID: <010101a027ee88a8-1bb09fcc-5dc0-45f9-b727-cd7dbb4e9d32-000000@us-west-2.amazonses.com>
Date: Sat, 22 Aug 2026 05:25:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.22-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2026 05:25:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243965

--===============0213906954035844510==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-sphinx-argparse* to *0.6.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sphinx-argparse-upgrade-0.6.0-0.6.1.patch
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
From 671307767a6826550aa5329a3ac35cd26d7d3112 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 22 Aug 2026 05:15:24 +0000
Subject: [PATCH] python3-sphinx-argparse: upgrade 0.6.0 -> 0.6.1

Source: docs/changelog.rst

0.6.1
#####

* `#98 <https://github.com/sphinx-doc/sphinx-argparse/issues/98>`__ Fixed issue where a parallel sphinx build would
  fail (mostly relevant in CI)
---
 ...phinx-argparse_0.6.0.bb => python3-sphinx-argparse_0.6.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinx-argparse_0.6.0.bb => python3-sphinx-argparse_0.6.1.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-sphinx-argparse_0.6.0.bb b/meta/recipes-devtools/python/python3-sphinx-argparse_0.6.1.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-sphinx-argparse_0.6.0.bb
rename to meta/recipes-devtools/python/python3-sphinx-argparse_0.6.1.bb
index 3e672148c0..a60efa0fcc 100644
--- a/meta/recipes-devtools/python/python3-sphinx-argparse_0.6.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinx-argparse_0.6.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://sphinx-argparse.readthedocs.io/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5c1cd8f13774629fee215681e66a1056"
 
-SRC_URI[sha256sum] = "d072bb67dd52b294375f0eedc203cb8e50d0329910dbceb6764e9386bff94e9d"
+SRC_URI[sha256sum] = "f8be167aedf5670bd7c812ef515968ff4717c63cfc9cb4df5f34b54fd5649c37"
 
 PYPI_PACKAGE = "sphinx_argparse"
 
-- 
2.47.1


--===============0213906954035844510==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-sphinx-argparse: PV changed from "0.6.0" to "0.6.1"
packages/x86-64-v3-poky-linux/python3-sphinx-argparse: PKGV changed from 0.6.0 [default] to 0.6.1 [default]
packages/x86-64-v3-poky-linux/python3-sphinx-argparse: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/sphinx_argparse/sphinx_argparse-0.6.0.tar.gz;downloadfilename=sphinx_argparse-0.6.0.tar.gz" to "https://files.pythonhosted.org/packages/source/s/sphinx_argparse/sphinx_argparse-0.6.1.tar.gz;downloadfilename=sphinx_argparse-0.6.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-sphinx-argparse/python3-sphinx-argparse-dbg: PV changed from "0.6.0" to "0.6.1"
packages/x86-64-v3-poky-linux/python3-sphinx-argparse/python3-sphinx-argparse-dbg: PKGV changed from 0.6.0 [default] to 0.6.1 [default]
packages/x86-64-v3-poky-linux/python3-sphinx-argparse/python3-sphinx-argparse-dev: PV changed from "0.6.0" to "0.6.1"
packages/x86-64-v3-poky-linux/python3-sphinx-argparse/python3-sphinx-argparse-dev: PKGV changed from 0.6.0 [default] to 0.6.1 [default]
packages/x86-64-v3-poky-linux/python3-sphinx-argparse/python3-sphinx-argparse-doc: PV changed from "0.6.0" to "0.6.1"
packages/x86-64-v3-poky-linux/python3-sphinx-argparse/python3-sphinx-argparse-doc: PKGV changed from 0.6.0 [default] to 0.6.1 [default]
packages/x86-64-v3-poky-linux/python3-sphinx-argparse/python3-sphinx-argparse-locale: PV changed from "0.6.0" to "0.6.1"
packages/x86-64-v3-poky-linux/python3-sphinx-argparse/python3-sphinx-argparse-locale: PKGV changed from 0.6.0 [default] to 0.6.1 [default]
packages/x86-64-v3-poky-linux/python3-sphinx-argparse/python3-sphinx-argparse-src: PV changed from "0.6.0" to "0.6.1"
packages/x86-64-v3-poky-linux/python3-sphinx-argparse/python3-sphinx-argparse-src: PKGV changed from 0.6.0 [default] to 0.6.1 [default]
packages/x86-64-v3-poky-linux/python3-sphinx-argparse/python3-sphinx-argparse-staticdev: PV changed from "0.6.0" to "0.6.1"
packages/x86-64-v3-poky-linux/python3-sphinx-argparse/python3-sphinx-argparse-staticdev: PKGV changed from 0.6.0 [default] to 0.6.1 [default]
packages/x86-64-v3-poky-linux/python3-sphinx-argparse/python3-sphinx-argparse: PV changed from "0.6.0" to "0.6.1"
packages/x86-64-v3-poky-linux/python3-sphinx-argparse/python3-sphinx-argparse: PKGV changed from 0.6.0 [default] to 0.6.1 [default]
packages/x86-64-v3-poky-linux/python3-sphinx-argparse/python3-sphinx-argparse: FILELIST: directory renamed /usr/lib/python3.14/site-packages/sphinx_argparse-0.6.0.dist-info -> /usr/lib/python3.14/site-packages/sphinx_argparse-0.6.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/sphinx_argparse-0.6.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/sphinx_argparse-0.6.1.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-sphinx-argparse/python3-sphinx-argparse: PKGSIZE changed from 136704 to 140969 (+3%)
Changes to packages/x86-64-v3-poky-linux/python3-sphinx-argparse (sysroot):
  /usr/lib/python3.14/site-packages/sphinx_argparse-0.6.0.dist-info moved to /usr/lib/python3.14/site-packages/sphinx_argparse-0.6.1.dist-info

--===============0213906954035844510==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-sphinx-argparse/python3-sphinx-argparse: FILELIST: directory renamed /usr/lib/python3.14/site-packages/sphinx_argparse-0.6.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/sphinx_argparse-0.6.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/sphinx_argparse-0.6.0.dist-info -> /usr/lib/python3.14/site-packages/sphinx_argparse-0.6.1.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-sphinx-argparse (sysroot):
  /usr/lib/python3.14/site-packages/sphinx_argparse-0.6.0.dist-info moved to /usr/lib/python3.14/site-packages/sphinx_argparse-0.6.1.dist-info

--===============0213906954035844510==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="python3-sphinx-argparse-changelog.txt"

Changelog for python3-sphinx-argparse: 0.6.0 -> 0.6.1
Source: docs/changelog.rst

0.6.1
#####

* `#98 <https://github.com/sphinx-doc/sphinx-argparse/issues/98>`__ Fixed issue where a parallel sphinx build would
  fail (mostly relevant in CI)

--===============0213906954035844510==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-sphinx-argparse-upgrade-0.6.0-0.6.1.patch"

RnJvbSA2NzEzMDc3NjdhNjgyNjU1MGFhNTMyOWEzYWMzNWNkMjZkN2QzMTEyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMjIgQXVnIDIwMjYgMDU6MTU6MjQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNwaGlueC1hcmdwYXJzZTogdXBncmFkZSAwLjYuMCAtPiAwLjYuMQoKU291cmNlOiBk
b2NzL2NoYW5nZWxvZy5yc3QKCjAuNi4xCiMjIyMjCgoqIGAjOTggPGh0dHBzOi8vZ2l0aHViLmNv
bS9zcGhpbngtZG9jL3NwaGlueC1hcmdwYXJzZS9pc3N1ZXMvOTg+YF9fIEZpeGVkIGlzc3VlIHdo
ZXJlIGEgcGFyYWxsZWwgc3BoaW54IGJ1aWxkIHdvdWxkCiAgZmFpbCAobW9zdGx5IHJlbGV2YW50
IGluIENJKQotLS0KIC4uLnBoaW54LWFyZ3BhcnNlXzAuNi4wLmJiID0+IHB5dGhvbjMtc3BoaW54
LWFyZ3BhcnNlXzAuNi4xLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5
dGhvbjMtc3BoaW54LWFyZ3BhcnNlXzAuNi4wLmJiID0+IHB5dGhvbjMtc3BoaW54LWFyZ3BhcnNl
XzAuNi4xLmJifSAoNzklKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1zcGhpbngtYXJncGFyc2VfMC42LjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54LWFyZ3BhcnNlXzAuNi4xLmJiCnNpbWlsYXJpdHkgaW5k
ZXggNzklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1z
cGhpbngtYXJncGFyc2VfMC42LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1zcGhpbngtYXJncGFyc2VfMC42LjEuYmIKaW5kZXggM2U2NzIxNDhjMC4u
YTYwZWZhMGZjYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXNwaGlueC1hcmdwYXJzZV8wLjYuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtc3BoaW54LWFyZ3BhcnNlXzAuNi4xLmJiCkBAIC0zLDcgKzMsNyBAQCBI
T01FUEFHRSA9ICJodHRwczovL3NwaGlueC1hcmdwYXJzZS5yZWFkdGhlZG9jcy5pby8iCiBMSUNF
TlNFID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UucnN0O21kNT01
YzFjZDhmMTM3NzQ2MjlmZWUyMTU2ODFlNjZhMTA1NiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0g
ImQwNzJiYjY3ZGQ1MmIyOTQzNzVmMGVlZGMyMDNjYjhlNTBkMDMyOTkxMGRiY2ViNjc2NGU5Mzg2
YmZmOTRlOWQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZjhiZTE2N2FlZGY1NjcwYmQ3YzgxMmVm
NTE1OTY4ZmY0NzE3YzYzY2ZjOWNiNGRmNWYzNGI1NGZkNTY0OWMzNyIKIAogUFlQSV9QQUNLQUdF
ID0gInNwaGlueF9hcmdwYXJzZSIKIAotLSAKMi40Ny4xCgo=

--===============0213906954035844510==--

