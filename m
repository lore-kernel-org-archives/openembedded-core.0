Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB8CEC5479A
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:20 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.1294.1721071145627914584
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=b+NgaiL/;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=wb5v1fqo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010190b7d594e0-8ed0d43a-72ff-4079-b00a-e471807656f6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071146;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EEy+p3vAhjHe67gibX+Zo9rar9Qha4a5qfi5Yi18/aM=;
	b=b+NgaiL/P7BAzBOF5eXn3tPpNrS7UIlyipZ96xUZRHZxp5PpXwyk61hjU+wtuWvO
	i9uvsmrryKEgMOX9IC+yTcKTV3UEx22PHrVarZ8ufE0JoVPI7M2RKCJxP+CS55v3Gut
	BC8BUDlkYS/JvlWSZFLe1MGX4+HNK9lVbu2aBU78=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071146;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EEy+p3vAhjHe67gibX+Zo9rar9Qha4a5qfi5Yi18/aM=;
	b=wb5v1fqoARHgwSLkgoDsi7W/gWIh3ZJJ0Ch8sRa0Jz+kq9u2cBziA9HAzervzJq7
	/NkLCZHkdEmipDawgBezgD1LCy4oZpTwU86F2/OSaM+tK5aDz/1IkFPNQM4vdJzcDxQ
	12qGo7q6U7YY2DgRuN3SYQDvAgapHwz07FGPlLSA=
Content-Type: multipart/mixed; boundary="===============6077226364068227989=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hatchling: upgrading to 1.25.0 SUCCEEDED
Message-ID: <01010190b7d594e0-8ed0d43a-72ff-4079-b00a-e471807656f6-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201969

--===============6077226364068227989==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hatchling* to *1.25.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hatchling-upgrade-1.24.2-1.25.0.patch
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
From 04f008773cc93927ff10ac82d30b6e83fa8f4a69 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jul 2024 10:25:01 +0000
Subject: [PATCH] python3-hatchling: upgrade 1.24.2 -> 1.25.0

---
 ...{python3-hatchling_1.24.2.bb => python3-hatchling_1.25.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.24.2.bb => python3-hatchling_1.25.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.24.2.bb b/meta/recipes-devtools/python/python3-hatchling_1.25.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-hatchling_1.24.2.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.25.0.bb
index 0ad545f448..111b447815 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.24.2.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.25.0.bb
@@ -8,7 +8,7 @@ inherit pypi python_hatchling
 DEPENDS += "python3-pluggy-native python3-pathspec-native python3-packaging-native python3-editables-native python3-trove-classifiers-native"
 DEPENDS:remove:class-native = "python3-hatchling-native"
 
-SRC_URI[sha256sum] = "41ddc27cdb25db9ef7b68bef075f829c84cb349aa1bff8240797d012510547b0"
+SRC_URI[sha256sum] = "7064631a512610b52250a4d3ff1bd81551d6d1431c4eb7b72e734df6c74f4262"
 
 do_compile:prepend() {
     export PYTHONPATH=src
-- 
2.44.0


--===============6077226364068227989==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-hatchling/python3-hatchling: FILELIST: directory renamed /usr/lib/python3.12/site-packages/hatchling-1.24.2.dist-info -> /usr/lib/python3.12/site-packages/hatchling-1.25.0.dist-info, directory renamed /usr/lib/python3.12/site-packages/hatchling-1.24.2.dist-info/licenses -> /usr/lib/python3.12/site-packages/hatchling-1.25.0.dist-info/licenses, added "/usr/lib/python3.12/site-packages/hatchling/builders/macos.py /usr/lib/python3.12/site-packages/hatchling/builders/__pycache__/macos.cpython-312.pyc"
Changes to packages/core2-64-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.12/site-packages/hatchling-1.24.2.dist-info moved to /usr/lib/python3.12/site-packages/hatchling-1.25.0.dist-info
  /usr/lib/python3.12/site-packages/hatchling/builders/macos.py was added
  /usr/lib/python3.12/site-packages/hatchling/builders/__pycache__/macos.cpython-312.pyc was added
Changes to packages/x86_64-linux/python3-hatchling-native (sysroot):
  /usr/lib/python3.12/site-packages/hatchling-1.24.2.dist-info moved to /usr/lib/python3.12/site-packages/hatchling-1.25.0.dist-info
  /usr/lib/python3.12/site-packages/hatchling/builders/macos.py was added
  /usr/lib/python3.12/site-packages/hatchling/builders/__pycache__/macos.cpython-312.pyc was added

--===============6077226364068227989==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hatchling-upgrade-1.24.2-1.25.0.patch"

RnJvbSAwNGYwMDg3NzNjYzkzOTI3ZmYxMGFjODJkMzBiNmU4M2ZhOGY0YTY5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSnVsIDIwMjQgMTA6MjU6MDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWhhdGNobGluZzogdXBncmFkZSAxLjI0LjIgLT4gMS4yNS4wCgotLS0KIC4uLntweXRo
b24zLWhhdGNobGluZ18xLjI0LjIuYmIgPT4gcHl0aG9uMy1oYXRjaGxpbmdfMS4yNS4wLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaGF0Y2hsaW5nXzEuMjQu
Mi5iYiA9PiBweXRob24zLWhhdGNobGluZ18xLjI1LjAuYmJ9ICg4NSUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjI0LjIuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMjUuMC5i
YgpzaW1pbGFyaXR5IGluZGV4IDg1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMjQuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjI1LjAuYmIKaW5kZXggMGFkNTQ1
ZjQ0OC4uMTExYjQ0NzgxNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWhhdGNobGluZ18xLjI0LjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjI1LjAuYmIKQEAgLTgsNyArOCw3IEBAIGluaGVy
aXQgcHlwaSBweXRob25faGF0Y2hsaW5nCiBERVBFTkRTICs9ICJweXRob24zLXBsdWdneS1uYXRp
dmUgcHl0aG9uMy1wYXRoc3BlYy1uYXRpdmUgcHl0aG9uMy1wYWNrYWdpbmctbmF0aXZlIHB5dGhv
bjMtZWRpdGFibGVzLW5hdGl2ZSBweXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzLW5hdGl2ZSIKIERF
UEVORFM6cmVtb3ZlOmNsYXNzLW5hdGl2ZSA9ICJweXRob24zLWhhdGNobGluZy1uYXRpdmUiCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICI0MWRkYzI3Y2RiMjVkYjllZjdiNjhiZWYwNzVmODI5Yzg0
Y2IzNDlhYTFiZmY4MjQwNzk3ZDAxMjUxMDU0N2IwIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjcw
NjQ2MzFhNTEyNjEwYjUyMjUwYTRkM2ZmMWJkODE1NTFkNmQxNDMxYzRlYjdiNzJlNzM0ZGY2Yzc0
ZjQyNjIiCiAKIGRvX2NvbXBpbGU6cHJlcGVuZCgpIHsKICAgICBleHBvcnQgUFlUSE9OUEFUSD1z
cmMKLS0gCjIuNDQuMAoK

--===============6077226364068227989==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-hatchling: PKGV changed from 1.24.2 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/python3-hatchling: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.24.2.tar.gz;downloadfilename=hatchling-1.24.2.tar.gz" to "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.25.0.tar.gz;downloadfilename=hatchling-1.25.0.tar.gz"
packages/core2-64-poky-linux/python3-hatchling: PV changed from "1.24.2" to "1.25.0"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-dbg: PKGV changed from 1.24.2 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-dbg: PV changed from "1.24.2" to "1.25.0"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-dev: PKGV changed from 1.24.2 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-dev: PV changed from "1.24.2" to "1.25.0"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-doc: PKGV changed from 1.24.2 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-doc: PV changed from "1.24.2" to "1.25.0"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-locale: PKGV changed from 1.24.2 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-locale: PV changed from "1.24.2" to "1.25.0"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-src: PKGV changed from 1.24.2 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-src: PV changed from "1.24.2" to "1.25.0"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-staticdev: PKGV changed from 1.24.2 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-staticdev: PV changed from "1.24.2" to "1.25.0"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling: PKGV changed from 1.24.2 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling: FILELIST: directory renamed /usr/lib/python3.12/site-packages/hatchling-1.24.2.dist-info -> /usr/lib/python3.12/site-packages/hatchling-1.25.0.dist-info, directory renamed /usr/lib/python3.12/site-packages/hatchling-1.24.2.dist-info/licenses -> /usr/lib/python3.12/site-packages/hatchling-1.25.0.dist-info/licenses, added "/usr/lib/python3.12/site-packages/hatchling/builders/macos.py /usr/lib/python3.12/site-packages/hatchling/builders/__pycache__/macos.cpython-312.pyc"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling: PV changed from "1.24.2" to "1.25.0"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling: PKGSIZE changed from 715588 to 720636 (+1%)
Changes to packages/core2-64-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.12/site-packages/hatchling-1.24.2.dist-info moved to /usr/lib/python3.12/site-packages/hatchling-1.25.0.dist-info
  /usr/lib/python3.12/site-packages/hatchling/builders/macos.py was added
  /usr/lib/python3.12/site-packages/hatchling/builders/__pycache__/macos.cpython-312.pyc was added
Changes to packages/x86_64-linux/python3-hatchling-native (sysroot):
  /usr/lib/python3.12/site-packages/hatchling-1.24.2.dist-info moved to /usr/lib/python3.12/site-packages/hatchling-1.25.0.dist-info
  /usr/lib/python3.12/site-packages/hatchling/builders/macos.py was added
  /usr/lib/python3.12/site-packages/hatchling/builders/__pycache__/macos.cpython-312.pyc was added

--===============6077226364068227989==--

