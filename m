Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4147BCD13BD
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:32 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.44644.1711994601541615293
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Nbq6zHPc;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=idOIAwLD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018e9ad47e13-2b5f84ec-1ba3-4985-8c7d-e78c04e499d0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994601;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=j2UiyNnD+DZ7Ro00rgJXB6HdUUuSJGF8ejQelfGzBFg=;
	b=Nbq6zHPcWaFsKuIS9v2Ka8WOY+onG4KyOPrVyTMQkmadAAXGPIkvP0t3uPvlc0mE
	DzseW5P5Yj2v3BWjCBThtW1tMB/zOk8CcaN9RZDTGby9CceanqeXY/zI0WOsD3cclzx
	VvoSyTb960+4nR892S35Y63/+Saif3gC2R9VRGmY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994601;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=j2UiyNnD+DZ7Ro00rgJXB6HdUUuSJGF8ejQelfGzBFg=;
	b=idOIAwLDaGTx81ZuuAoDjFbKssVlzPH9Cr0YoQrLwmgMpuyrR8GRVsq1+ewVZpAu
	7ggYV+MwsyFF1hyBkCSLpRJZ6bZq7Md+MP8hsl4fFlU3o+R7ENtZOLpRoDOS3q/h6hW
	RRT8Ns1WPurhFeDSBoD4EsZYQ/o+zbk/9rfRiqrE=
Content-Type: multipart/mixed; boundary="===============2958021035361222842=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-build: upgrading to 1.2.1 SUCCEEDED
Message-ID: <0101018e9ad47e13-2b5f84ec-1ba3-4985-8c7d-e78c04e499d0-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:20 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197717

--===============2958021035361222842==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-build* to *1.2.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-build-upgrade-1.1.1-1.2.1.patch
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
From 3fbf0c65501388acc8dcf7200ebca5a614846f26 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 07:36:52 +0000
Subject: [PATCH] python3-build: upgrade 1.1.1 -> 1.2.1

---
 .../python/{python3-build_1.1.1.bb => python3-build_1.2.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-build_1.1.1.bb => python3-build_1.2.1.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-build_1.1.1.bb b/meta/recipes-devtools/python/python3-build_1.2.1.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-build_1.1.1.bb
rename to meta/recipes-devtools/python/python3-build_1.2.1.bb
index 7fc3eef91b..0156861201 100644
--- a/meta/recipes-devtools/python/python3-build_1.1.1.bb
+++ b/meta/recipes-devtools/python/python3-build_1.2.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/build"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=310439af287b0fb4780b2ad6907c256c"
 
-SRC_URI[sha256sum] = "8eea65bb45b1aac2e734ba2cc8dad3a6d97d97901a395bd0ed3e7b46953d2a31"
+SRC_URI[sha256sum] = "526263f4870c26f26c433545579475377b2b7588b6f1eac76a001e873ae3e19d"
 
 inherit pypi python_flit_core
 
-- 
2.42.0


--===============2958021035361222842==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-build-upgrade-1.1.1-1.2.1.patch"

RnJvbSAzZmJmMGM2NTUwMTM4OGFjYzhkY2Y3MjAwZWJjYTVhNjE0ODQ2ZjI2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAwNzozNjo1MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtYnVpbGQ6IHVwZ3JhZGUgMS4xLjEgLT4gMS4yLjEKCi0tLQogLi4uL3B5dGhvbi97cHl0
aG9uMy1idWlsZF8xLjEuMS5iYiA9PiBweXRob24zLWJ1aWxkXzEuMi4xLmJifSAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1idWlsZF8xLjEuMS5iYiA9PiBweXRo
b24zLWJ1aWxkXzEuMi4xLmJifSAoODklKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1idWlsZF8xLjEuMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1idWlsZF8xLjIuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDg5JQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYnVpbGRfMS4xLjEu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1idWlsZF8x
LjIuMS5iYgppbmRleCA3ZmMzZWVmOTFiLi4wMTU2ODYxMjAxIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYnVpbGRfMS4xLjEuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJ1aWxkXzEuMi4xLmJiCkBAIC0zLDcgKzMs
NyBAQCBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20vcHlwYS9idWlsZCIKIExJQ0VOU0Ug
PSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MzEwNDM5YWYy
ODdiMGZiNDc4MGIyYWQ2OTA3YzI1NmMiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI4ZWVhNjVi
YjQ1YjFhYWMyZTczNGJhMmNjOGRhZDNhNmQ5N2Q5NzkwMWEzOTViZDBlZDNlN2I0Njk1M2QyYTMx
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjUyNjI2M2Y0ODcwYzI2ZjI2YzQzMzU0NTU3OTQ3NTM3
N2IyYjc1ODhiNmYxZWFjNzZhMDAxZTg3M2FlM2UxOWQiCiAKIGluaGVyaXQgcHlwaSBweXRob25f
ZmxpdF9jb3JlCiAKLS0gCjIuNDIuMAoK

--===============2958021035361222842==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-build/python3-build: FILELIST: directory renamed /usr/lib/python3.12/site-packages/build-1.1.1.dist-info -> /usr/lib/python3.12/site-packages/build-1.2.1.dist-info, added "/usr/lib/python3.12/site-packages/build/_types.py /usr/lib/python3.12/site-packages/build/__pycache__/_types.cpython-312.pyc /usr/lib/python3.12/site-packages/build/__pycache__/_builder.cpython-312.pyc /usr/lib/python3.12/site-packages/build/_builder.py /usr/lib/python3.12/site-packages/build/_ctx.py /usr/lib/python3.12/site-packages/build/__pycache__/_ctx.cpython-312.pyc"
packages/core2-64-poky-linux/python3-build/python3-build: PKGSIZE changed from 118075 to 131439 (+11%)
Changes to packages/core2-64-poky-linux/python3-build (sysroot):
  /usr/lib/python3.12/site-packages/build-1.1.1.dist-info moved to /usr/lib/python3.12/site-packages/build-1.2.1.dist-info
  /usr/lib/python3.12/site-packages/build/_builder.py was added
  /usr/lib/python3.12/site-packages/build/_ctx.py was added
  /usr/lib/python3.12/site-packages/build/__pycache__/_builder.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/build/__pycache__/_ctx.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/build/__pycache__/_types.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/build/_types.py was added
Changes to packages/x86_64-linux/python3-build-native (sysroot):
  /usr/lib/python3.12/site-packages/build-1.1.1.dist-info moved to /usr/lib/python3.12/site-packages/build-1.2.1.dist-info
  /usr/lib/python3.12/site-packages/build/_builder.py was added
  /usr/lib/python3.12/site-packages/build/_ctx.py was added
  /usr/lib/python3.12/site-packages/build/__pycache__/_builder.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/build/__pycache__/_ctx.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/build/__pycache__/_types.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/build/_types.py was added

--===============2958021035361222842==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-build: SRC_URI changed from "https://files.pythonhosted.org/packages/source/b/build/build-1.1.1.tar.gz;downloadfilename=build-1.1.1.tar.gz" to "https://files.pythonhosted.org/packages/source/b/build/build-1.2.1.tar.gz;downloadfilename=build-1.2.1.tar.gz"
packages/core2-64-poky-linux/python3-build: PV changed from "1.1.1" to "1.2.1"
packages/core2-64-poky-linux/python3-build: PKGV changed from 1.1.1 [default] to 1.2.1 [default]
packages/core2-64-poky-linux/python3-build/python3-build-dbg: PV changed from "1.1.1" to "1.2.1"
packages/core2-64-poky-linux/python3-build/python3-build-dbg: PKGV changed from 1.1.1 [default] to 1.2.1 [default]
packages/core2-64-poky-linux/python3-build/python3-build-dev: PV changed from "1.1.1" to "1.2.1"
packages/core2-64-poky-linux/python3-build/python3-build-dev: PKGV changed from 1.1.1 [default] to 1.2.1 [default]
packages/core2-64-poky-linux/python3-build/python3-build-doc: PV changed from "1.1.1" to "1.2.1"
packages/core2-64-poky-linux/python3-build/python3-build-doc: PKGV changed from 1.1.1 [default] to 1.2.1 [default]
packages/core2-64-poky-linux/python3-build/python3-build-locale: PV changed from "1.1.1" to "1.2.1"
packages/core2-64-poky-linux/python3-build/python3-build-locale: PKGV changed from 1.1.1 [default] to 1.2.1 [default]
packages/core2-64-poky-linux/python3-build/python3-build-src: PV changed from "1.1.1" to "1.2.1"
packages/core2-64-poky-linux/python3-build/python3-build-src: PKGV changed from 1.1.1 [default] to 1.2.1 [default]
packages/core2-64-poky-linux/python3-build/python3-build-staticdev: PV changed from "1.1.1" to "1.2.1"
packages/core2-64-poky-linux/python3-build/python3-build-staticdev: PKGV changed from 1.1.1 [default] to 1.2.1 [default]
packages/core2-64-poky-linux/python3-build/python3-build: PKGSIZE changed from 118075 to 131439 (+11%)
packages/core2-64-poky-linux/python3-build/python3-build: PV changed from "1.1.1" to "1.2.1"
packages/core2-64-poky-linux/python3-build/python3-build: FILELIST: directory renamed /usr/lib/python3.12/site-packages/build-1.1.1.dist-info -> /usr/lib/python3.12/site-packages/build-1.2.1.dist-info, added "/usr/lib/python3.12/site-packages/build/__pycache__/_types.cpython-312.pyc /usr/lib/python3.12/site-packages/build/_types.py /usr/lib/python3.12/site-packages/build/__pycache__/_builder.cpython-312.pyc /usr/lib/python3.12/site-packages/build/_builder.py /usr/lib/python3.12/site-packages/build/_ctx.py /usr/lib/python3.12/site-packages/build/__pycache__/_ctx.cpython-312.pyc"
packages/core2-64-poky-linux/python3-build/python3-build: PKGV changed from 1.1.1 [default] to 1.2.1 [default]
Changes to packages/core2-64-poky-linux/python3-build (sysroot):
  /usr/lib/python3.12/site-packages/build-1.1.1.dist-info moved to /usr/lib/python3.12/site-packages/build-1.2.1.dist-info
  /usr/lib/python3.12/site-packages/build/_builder.py was added
  /usr/lib/python3.12/site-packages/build/_ctx.py was added
  /usr/lib/python3.12/site-packages/build/__pycache__/_builder.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/build/__pycache__/_ctx.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/build/__pycache__/_types.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/build/_types.py was added
Changes to packages/x86_64-linux/python3-build-native (sysroot):
  /usr/lib/python3.12/site-packages/build-1.1.1.dist-info moved to /usr/lib/python3.12/site-packages/build-1.2.1.dist-info
  /usr/lib/python3.12/site-packages/build/_builder.py was added
  /usr/lib/python3.12/site-packages/build/_ctx.py was added
  /usr/lib/python3.12/site-packages/build/__pycache__/_builder.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/build/__pycache__/_ctx.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/build/__pycache__/_types.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/build/_types.py was added

--===============2958021035361222842==--

