Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B28B3D49775
	for <webhook@archiver.kernel.org>; Sun,  1 Dec 2024 10:06:10 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.148760.1733047555842754100
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Dec 2024 02:05:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=AbFXlYmJ;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=KqqtGflK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019381af2335-0c212484-ff2d-4a9d-aae2-0957ee457a4e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1733047559;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4vHgLmfFvEanjSCQ1XcNotRSyqjKpkRsp6O28Bda9EQ=;
	b=AbFXlYmJcjClUAwMIg2u9R0ZcLjo5wJrvcObk249h6J5WJX41FJ2zNI33w1Zg56u
	HVMcYJ6+/GkbC6AjrXobchECStj9t1cKwRohB2vvAKj/MbTYS7wjoFb/Fw2DMMq26Tn
	EukNrHwSs0YqqVOJB90X2XYnw4J3QR16jdHhT45Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1733047559;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4vHgLmfFvEanjSCQ1XcNotRSyqjKpkRsp6O28Bda9EQ=;
	b=KqqtGflKRd2c/NXB8e1n/0J/U8jnLVXUgJrIOzHsRVUE9MjiBfvKPjy+UrhqCK3q
	3OYlouS8BIiP6i1Vx6bagXSLZQHR6JR6BarSpQb3Ki/4kXSC75ryNli/4n36wTP3zGi
	rVwBB7Z2iQSpO23907j+/85SqLoCh4LZUDC7MBp8=
Content-Type: multipart/mixed; boundary="===============9109602632753222849=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hatchling: upgrading to 1.26.3 SUCCEEDED
Message-ID: <0101019381af2335-0c212484-ff2d-4a9d-aae2-0957ee457a4e-000000@us-west-2.amazonses.com>
Date: Sun, 1 Dec 2024 10:05:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Dec 2024 10:06:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208073

--===============9109602632753222849==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hatchling* to *1.26.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hatchling-upgrade-1.25.0-1.26.3.patch
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
From 63375dac6321d3cae3f354f99ef9e685b600753b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Dec 2024 07:10:08 +0000
Subject: [PATCH] python3-hatchling: upgrade 1.25.0 -> 1.26.3

---
 ...{python3-hatchling_1.25.0.bb => python3-hatchling_1.26.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.25.0.bb => python3-hatchling_1.26.3.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.25.0.bb b/meta/recipes-devtools/python/python3-hatchling_1.26.3.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-hatchling_1.25.0.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.26.3.bb
index 111b447815..590456ad9b 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.25.0.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.26.3.bb
@@ -8,7 +8,7 @@ inherit pypi python_hatchling
 DEPENDS += "python3-pluggy-native python3-pathspec-native python3-packaging-native python3-editables-native python3-trove-classifiers-native"
 DEPENDS:remove:class-native = "python3-hatchling-native"
 
-SRC_URI[sha256sum] = "7064631a512610b52250a4d3ff1bd81551d6d1431c4eb7b72e734df6c74f4262"
+SRC_URI[sha256sum] = "b672a9c36a601a06c4e88a1abb1330639ee8e721e0535a37536e546a667efc7a"
 
 do_compile:prepend() {
     export PYTHONPATH=src
-- 
2.44.1


--===============9109602632753222849==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-hatchling/python3-hatchling: PKGSIZE changed from 722150 to 625862 (-13%)
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling: FILELIST: directory renamed /usr/lib/python3.13/site-packages/hatchling-1.25.0.dist-info/licenses -> /usr/lib/python3.13/site-packages/hatchling-1.26.3.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/hatchling-1.25.0.dist-info -> /usr/lib/python3.13/site-packages/hatchling-1.26.3.dist-info, removed "/usr/lib/python3.13/site-packages/hatchling/licenses/__pycache__/parse.cpython-313.pyc /usr/lib/python3.13/site-packages/hatchling/licenses/parse.py", added "/usr/lib/python3.13/site-packages/hatchling/cli/dep/__pycache__/core.cpython-313.pyc /usr/lib/python3.13/site-packages/hatchling/cli/dep/core.py"
Changes to packages/core2-64-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.13/site-packages/hatchling-1.25.0.dist-info moved to /usr/lib/python3.13/site-packages/hatchling-1.26.3.dist-info
  /usr/lib/python3.13/site-packages/hatchling/cli/dep/core.py was added
  /usr/lib/python3.13/site-packages/hatchling/cli/dep/__pycache__/core.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/hatchling/licenses/parse.py was removed
  /usr/lib/python3.13/site-packages/hatchling/licenses/__pycache__/parse.cpython-313.pyc was removed
Changes to packages/x86_64-linux/python3-hatchling-native (sysroot):
  /usr/lib/python3.13/site-packages/hatchling-1.25.0.dist-info moved to /usr/lib/python3.13/site-packages/hatchling-1.26.3.dist-info
  /usr/lib/python3.13/site-packages/hatchling/cli/dep/core.py was added
  /usr/lib/python3.13/site-packages/hatchling/cli/dep/__pycache__/core.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/hatchling/licenses/parse.py was removed
  /usr/lib/python3.13/site-packages/hatchling/licenses/__pycache__/parse.cpython-313.pyc was removed

--===============9109602632753222849==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hatchling-upgrade-1.25.0-1.26.3.patch"

RnJvbSA2MzM3NWRhYzYzMjFkM2NhZTNmMzU0Zjk5ZWY5ZTY4NWI2MDA3NTNiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBEZWMgMjAyNCAwNzoxMDowOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaGF0Y2hsaW5nOiB1cGdyYWRlIDEuMjUuMCAtPiAxLjI2LjMKCi0tLQogLi4ue3B5dGhv
bjMtaGF0Y2hsaW5nXzEuMjUuMC5iYiA9PiBweXRob24zLWhhdGNobGluZ18xLjI2LjMuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1oYXRjaGxpbmdfMS4yNS4w
LmJiID0+IHB5dGhvbjMtaGF0Y2hsaW5nXzEuMjYuMy5iYn0gKDg1JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMjUuMC5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oYXRjaGxpbmdfMS4yNi4zLmJi
CnNpbWlsYXJpdHkgaW5kZXggODUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1oYXRjaGxpbmdfMS4yNS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMjYuMy5iYgppbmRleCAxMTFiNDQ3
ODE1Li41OTA0NTZhZDliIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtaGF0Y2hsaW5nXzEuMjUuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMjYuMy5iYgpAQCAtOCw3ICs4LDcgQEAgaW5oZXJp
dCBweXBpIHB5dGhvbl9oYXRjaGxpbmcKIERFUEVORFMgKz0gInB5dGhvbjMtcGx1Z2d5LW5hdGl2
ZSBweXRob24zLXBhdGhzcGVjLW5hdGl2ZSBweXRob24zLXBhY2thZ2luZy1uYXRpdmUgcHl0aG9u
My1lZGl0YWJsZXMtbmF0aXZlIHB5dGhvbjMtdHJvdmUtY2xhc3NpZmllcnMtbmF0aXZlIgogREVQ
RU5EUzpyZW1vdmU6Y2xhc3MtbmF0aXZlID0gInB5dGhvbjMtaGF0Y2hsaW5nLW5hdGl2ZSIKIAot
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjcwNjQ2MzFhNTEyNjEwYjUyMjUwYTRkM2ZmMWJkODE1NTFk
NmQxNDMxYzRlYjdiNzJlNzM0ZGY2Yzc0ZjQyNjIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjY3
MmE5YzM2YTYwMWEwNmM0ZTg4YTFhYmIxMzMwNjM5ZWU4ZTcyMWUwNTM1YTM3NTM2ZTU0NmE2Njdl
ZmM3YSIKIAogZG9fY29tcGlsZTpwcmVwZW5kKCkgewogICAgIGV4cG9ydCBQWVRIT05QQVRIPXNy
YwotLSAKMi40NC4xCgo=

--===============9109602632753222849==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-hatchling: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.25.0.tar.gz;downloadfilename=hatchling-1.25.0.tar.gz" to "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.26.3.tar.gz;downloadfilename=hatchling-1.26.3.tar.gz"
packages/core2-64-poky-linux/python3-hatchling: PKGV changed from 1.25.0 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/python3-hatchling: PV changed from "1.25.0" to "1.26.3"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-dbg: PKGV changed from 1.25.0 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-dbg: PV changed from "1.25.0" to "1.26.3"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-dev: PKGV changed from 1.25.0 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-dev: PV changed from "1.25.0" to "1.26.3"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-doc: PKGV changed from 1.25.0 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-doc: PV changed from "1.25.0" to "1.26.3"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-locale: PKGV changed from 1.25.0 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-locale: PV changed from "1.25.0" to "1.26.3"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-src: PKGV changed from 1.25.0 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-src: PV changed from "1.25.0" to "1.26.3"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-staticdev: PKGV changed from 1.25.0 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-staticdev: PV changed from "1.25.0" to "1.26.3"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling: PKGSIZE changed from 722150 to 625862 (-13%)
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling: FILELIST: directory renamed /usr/lib/python3.13/site-packages/hatchling-1.25.0.dist-info/licenses -> /usr/lib/python3.13/site-packages/hatchling-1.26.3.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/hatchling-1.25.0.dist-info -> /usr/lib/python3.13/site-packages/hatchling-1.26.3.dist-info, removed "/usr/lib/python3.13/site-packages/hatchling/licenses/parse.py /usr/lib/python3.13/site-packages/hatchling/licenses/__pycache__/parse.cpython-313.pyc", added "/usr/lib/python3.13/site-packages/hatchling/cli/dep/core.py /usr/lib/python3.13/site-packages/hatchling/cli/dep/__pycache__/core.cpython-313.pyc"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling: PKGV changed from 1.25.0 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling: PV changed from "1.25.0" to "1.26.3"
Changes to packages/core2-64-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.13/site-packages/hatchling-1.25.0.dist-info moved to /usr/lib/python3.13/site-packages/hatchling-1.26.3.dist-info
  /usr/lib/python3.13/site-packages/hatchling/cli/dep/core.py was added
  /usr/lib/python3.13/site-packages/hatchling/cli/dep/__pycache__/core.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/hatchling/licenses/parse.py was removed
  /usr/lib/python3.13/site-packages/hatchling/licenses/__pycache__/parse.cpython-313.pyc was removed
Changes to packages/x86_64-linux/python3-hatchling-native (sysroot):
  /usr/lib/python3.13/site-packages/hatchling-1.25.0.dist-info moved to /usr/lib/python3.13/site-packages/hatchling-1.26.3.dist-info
  /usr/lib/python3.13/site-packages/hatchling/cli/dep/core.py was added
  /usr/lib/python3.13/site-packages/hatchling/cli/dep/__pycache__/core.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/hatchling/licenses/parse.py was removed
  /usr/lib/python3.13/site-packages/hatchling/licenses/__pycache__/parse.cpython-313.pyc was removed

--===============9109602632753222849==--

