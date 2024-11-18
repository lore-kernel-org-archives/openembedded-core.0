Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66BF8D60074
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:17:21 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.4642.1731964601359175614
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:17:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=G4jp3QZv;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=tyzQ9pok;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019341230497-7fdbd6de-5ba7-4642-890f-a2bd9db0e057-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964634;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=HDKsaAD6gHRyuuxGR+Jcd8r/4U4nrpSr1DVlV5MRCgQ=;
	b=G4jp3QZviQH3clicK55BWi626jlk9sdvwnTWYPY81oLglT0HO0SuFknkv+6p0ceo
	8IfFF6jPN97AXO+TJUodmVag5j7933Mml9zE4eEZGEkwjWZS9SMypyfcHxxmqBFNTQ1
	4AmiGqDxv6RQSnMHlTndUdKl7TVV7qMP6MiFAGhA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964634;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=HDKsaAD6gHRyuuxGR+Jcd8r/4U4nrpSr1DVlV5MRCgQ=;
	b=tyzQ9pokAbaM+KkESjjqcPbT3A9o9NqYf/LqhciDgXB2pa1uBg5vvfbPubMNjx5A
	iStOQj/s35oTrZ4noZZV2afq8poAJB/v+RdJJlsL4XCk5sZqkHqmMiqwgAowTa3YdPd
	SKRcxa7FR5rC1OlFZpMvpS07xoL7bJejW3FYoNv0=
Content-Type: multipart/mixed; boundary="===============5568312995783107711=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-packaging: upgrading to 24.2 SUCCEEDED
Message-ID: <0101019341230497-7fdbd6de-5ba7-4642-890f-a2bd9db0e057-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:17:14 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:17:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207287

--===============5568312995783107711==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-packaging* to *24.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-packaging-upgrade-24.1-24.2.patch
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
From 29290d61fa5dd907f728558bbbe6a209ea7e8db3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 17 Nov 2024 00:32:02 +0000
Subject: [PATCH] python3-packaging: upgrade 24.1 -> 24.2

---
 .../{python3-packaging_24.1.bb => python3-packaging_24.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-packaging_24.1.bb => python3-packaging_24.2.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-packaging_24.1.bb b/meta/recipes-devtools/python/python3-packaging_24.2.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-packaging_24.1.bb
rename to meta/recipes-devtools/python/python3-packaging_24.2.bb
index 0aac283389..3526cd5b39 100644
--- a/meta/recipes-devtools/python/python3-packaging_24.1.bb
+++ b/meta/recipes-devtools/python/python3-packaging_24.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/packaging"
 LICENSE = "Apache-2.0 | BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=faadaedca9251a90b205c9167578ce91"
 
-SRC_URI[sha256sum] = "026ed72c8ed3fcce5bf8950572258698927fd1dbda10a5e981cdf0ac37f4f002"
+SRC_URI[sha256sum] = "c228a6dc5e932d346bc5739379109d49e8853dd8223571c7c5b55260edc0b97f"
 
 SRC_URI += "file://run-ptest.in"
 
-- 
2.44.1


--===============5568312995783107711==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-packaging/python3-packaging-ptest: FILELIST: added "/usr/lib/python3-packaging/ptest/tests/test_licenses.py"
packages/core2-64-poky-linux/python3-packaging/python3-packaging: FILELIST: directory renamed /usr/lib/python3.13/site-packages/packaging-24.1.dist-info -> /usr/lib/python3.13/site-packages/packaging-24.2.dist-info, added "/usr/lib/python3.13/site-packages/packaging/licenses/_spdx.py /usr/lib/python3.13/site-packages/packaging/licenses/__pycache__/_spdx.cpython-313.pyc /usr/lib/python3.13/site-packages/packaging/licenses/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/packaging/licenses/__init__.py"
packages/core2-64-poky-linux/python3-packaging/python3-packaging: PKGSIZE changed from 347598 to 463517 (+33%)
Changes to packages/core2-64-poky-linux/python3-packaging (sysroot):
  /usr/lib/python3.13/site-packages/packaging-24.1.dist-info moved to /usr/lib/python3.13/site-packages/packaging-24.2.dist-info
  /usr/lib/python3.13/site-packages/packaging/licenses was added
  /usr/lib/python3.13/site-packages/packaging/licenses/__init__.py was added
  /usr/lib/python3.13/site-packages/packaging/licenses/__pycache__ was added
  /usr/lib/python3.13/site-packages/packaging/licenses/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/packaging/licenses/__pycache__/_spdx.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/packaging/licenses/_spdx.py was added
Changes to packages/x86_64-linux/python3-packaging-native (sysroot):
  /usr/lib/python3.13/site-packages/packaging-24.1.dist-info moved to /usr/lib/python3.13/site-packages/packaging-24.2.dist-info
  /usr/lib/python3.13/site-packages/packaging/licenses was added
  /usr/lib/python3.13/site-packages/packaging/licenses/__init__.py was added
  /usr/lib/python3.13/site-packages/packaging/licenses/__pycache__ was added
  /usr/lib/python3.13/site-packages/packaging/licenses/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/packaging/licenses/__pycache__/_spdx.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/packaging/licenses/_spdx.py was added

--===============5568312995783107711==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-packaging: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/packaging/packaging-24.1.tar.gz;downloadfilename=packaging-24.1.tar.gz file://run-ptest.in" to "https://files.pythonhosted.org/packages/source/p/packaging/packaging-24.2.tar.gz;downloadfilename=packaging-24.2.tar.gz file://run-ptest.in"
packages/core2-64-poky-linux/python3-packaging: PKGV changed from 24.1 [default] to 24.2 [default]
packages/core2-64-poky-linux/python3-packaging: PV changed from "24.1" to "24.2"
packages/core2-64-poky-linux/python3-packaging/python3-packaging-dbg: PKGV changed from 24.1 [default] to 24.2 [default]
packages/core2-64-poky-linux/python3-packaging/python3-packaging-dbg: PV changed from "24.1" to "24.2"
packages/core2-64-poky-linux/python3-packaging/python3-packaging-dev: PKGV changed from 24.1 [default] to 24.2 [default]
packages/core2-64-poky-linux/python3-packaging/python3-packaging-dev: PV changed from "24.1" to "24.2"
packages/core2-64-poky-linux/python3-packaging/python3-packaging-doc: PKGV changed from 24.1 [default] to 24.2 [default]
packages/core2-64-poky-linux/python3-packaging/python3-packaging-doc: PV changed from "24.1" to "24.2"
packages/core2-64-poky-linux/python3-packaging/python3-packaging-locale: PKGV changed from 24.1 [default] to 24.2 [default]
packages/core2-64-poky-linux/python3-packaging/python3-packaging-locale: PV changed from "24.1" to "24.2"
packages/core2-64-poky-linux/python3-packaging/python3-packaging-ptest: FILELIST: added "/usr/lib/python3-packaging/ptest/tests/test_licenses.py"
packages/core2-64-poky-linux/python3-packaging/python3-packaging-ptest: PKGSIZE changed from 2165442 to 2175657 (+0%)
packages/core2-64-poky-linux/python3-packaging/python3-packaging-ptest: PKGV changed from 24.1 [default] to 24.2 [default]
packages/core2-64-poky-linux/python3-packaging/python3-packaging-ptest: PV changed from "24.1" to "24.2"
packages/core2-64-poky-linux/python3-packaging/python3-packaging-src: PKGV changed from 24.1 [default] to 24.2 [default]
packages/core2-64-poky-linux/python3-packaging/python3-packaging-src: PV changed from "24.1" to "24.2"
packages/core2-64-poky-linux/python3-packaging/python3-packaging-staticdev: PKGV changed from 24.1 [default] to 24.2 [default]
packages/core2-64-poky-linux/python3-packaging/python3-packaging-staticdev: PV changed from "24.1" to "24.2"
packages/core2-64-poky-linux/python3-packaging/python3-packaging: FILELIST: directory renamed /usr/lib/python3.13/site-packages/packaging-24.1.dist-info -> /usr/lib/python3.13/site-packages/packaging-24.2.dist-info, added "/usr/lib/python3.13/site-packages/packaging/licenses/_spdx.py /usr/lib/python3.13/site-packages/packaging/licenses/__init__.py /usr/lib/python3.13/site-packages/packaging/licenses/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/packaging/licenses/__pycache__/_spdx.cpython-313.pyc"
packages/core2-64-poky-linux/python3-packaging/python3-packaging: PKGSIZE changed from 347598 to 463517 (+33%)
packages/core2-64-poky-linux/python3-packaging/python3-packaging: PKGV changed from 24.1 [default] to 24.2 [default]
packages/core2-64-poky-linux/python3-packaging/python3-packaging: PV changed from "24.1" to "24.2"
Changes to packages/core2-64-poky-linux/python3-packaging (sysroot):
  /usr/lib/python3.13/site-packages/packaging-24.1.dist-info moved to /usr/lib/python3.13/site-packages/packaging-24.2.dist-info
  /usr/lib/python3.13/site-packages/packaging/licenses was added
  /usr/lib/python3.13/site-packages/packaging/licenses/__init__.py was added
  /usr/lib/python3.13/site-packages/packaging/licenses/__pycache__ was added
  /usr/lib/python3.13/site-packages/packaging/licenses/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/packaging/licenses/__pycache__/_spdx.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/packaging/licenses/_spdx.py was added
Changes to packages/x86_64-linux/python3-packaging-native (sysroot):
  /usr/lib/python3.13/site-packages/packaging-24.1.dist-info moved to /usr/lib/python3.13/site-packages/packaging-24.2.dist-info
  /usr/lib/python3.13/site-packages/packaging/licenses was added
  /usr/lib/python3.13/site-packages/packaging/licenses/__init__.py was added
  /usr/lib/python3.13/site-packages/packaging/licenses/__pycache__ was added
  /usr/lib/python3.13/site-packages/packaging/licenses/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/packaging/licenses/__pycache__/_spdx.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/packaging/licenses/_spdx.py was added

--===============5568312995783107711==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-packaging-upgrade-24.1-24.2.patch"

RnJvbSAyOTI5MGQ2MWZhNWRkOTA3ZjcyODU1OGJiYmU2YTIwOWVhN2U4ZGIzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTcgTm92IDIwMjQgMDA6MzI6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBhY2thZ2luZzogdXBncmFkZSAyNC4xIC0+IDI0LjIKCi0tLQogLi4uL3tweXRob24z
LXBhY2thZ2luZ18yNC4xLmJiID0+IHB5dGhvbjMtcGFja2FnaW5nXzI0LjIuYmJ9ICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1wYWNrYWdpbmdfMjQuMS5iYiA9
PiBweXRob24zLXBhY2thZ2luZ18yNC4yLmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wYWNrYWdpbmdfMjQuMS5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wYWNrYWdpbmdfMjQuMi5iYgpzaW1pbGFyaXR5
IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtcGFja2FnaW5nXzI0LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1wYWNrYWdpbmdfMjQuMi5iYgppbmRleCAwYWFjMjgzMzg5Li4zNTI2Y2Q1YjM5
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGFja2Fn
aW5nXzI0LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBh
Y2thZ2luZ18yNC4yLmJiCkBAIC0zLDcgKzMsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1
Yi5jb20vcHlwYS9wYWNrYWdpbmciCiBMSUNFTlNFID0gIkFwYWNoZS0yLjAgfCBCU0QtMi1DbGF1
c2UiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1mYWFkYWVkY2E5MjUx
YTkwYjIwNWM5MTY3NTc4Y2U5MSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjAyNmVkNzJjOGVk
M2ZjY2U1YmY4OTUwNTcyMjU4Njk4OTI3ZmQxZGJkYTEwYTVlOTgxY2RmMGFjMzdmNGYwMDIiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiYzIyOGE2ZGM1ZTkzMmQzNDZiYzU3MzkzNzkxMDlkNDllODg1
M2RkODIyMzU3MWM3YzViNTUyNjBlZGMwYjk3ZiIKIAogU1JDX1VSSSArPSAiZmlsZTovL3J1bi1w
dGVzdC5pbiIKIAotLSAKMi40NC4xCgo=

--===============5568312995783107711==--

