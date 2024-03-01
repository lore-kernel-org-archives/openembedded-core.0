Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 577F7C5478C
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 22:05:17 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.36631.1709330716782904936
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Mar 2024 14:05:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=F6TIvPP+;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=GpjTXGvK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018dfc0cd553-90b31a7c-cfdd-4fef-99d7-5f3a4cd044a2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1709330716;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2lTOHX0cwhh854yWVFqjRcXfB4zStfbbYvCbF+fkNxw=;
	b=F6TIvPP+o9+RsEUd2HK6FrseQcpSvtcFZZsgBD1S3iLdH0GFvX9RVg8z+ngUAP4s
	rsEH/ycvzlFIidcqGrH85mi45JcIutYK6EGW/tuk9+gYAdF0CE2kvBcwEi/4UOBfFlm
	hcRqLYArrcgpvI1Qm+Eu0le8GYdROGfdGFm9ULrY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1709330716;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2lTOHX0cwhh854yWVFqjRcXfB4zStfbbYvCbF+fkNxw=;
	b=GpjTXGvKSOg81k6CuVOeMMs8MsMJ0wu++7jLPrgiA6BcHGKy2cVG1iiyBpLxq4ku
	IrJnIddAn16uPxBi+Jdu1tgYetC/P8VC7UOx5391KvvZP6rh7sRQG2BHEktZLfB+qWK
	OGV825QVTMdWjqP+n2c6yBt7hk4WPGALEhyypJlk=
Content-Type: multipart/mixed; boundary="===============8613433529260332991=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-build: upgrading to 1.1.1 SUCCEEDED
Message-ID: <0101018dfc0cd553-90b31a7c-cfdd-4fef-99d7-5f3a4cd044a2-000000@us-west-2.amazonses.com>
Date: Fri, 1 Mar 2024 22:05:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Mar 2024 22:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196486

--===============8613433529260332991==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-build* to *1.1.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-build-upgrade-1.0.3-1.1.1.patch
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
From d02c052cfa1d4bb5284148b2319babb679db62f6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Mar 2024 12:29:53 +0000
Subject: [PATCH] python3-build: upgrade 1.0.3 -> 1.1.1

---
 .../python/{python3-build_1.0.3.bb => python3-build_1.1.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-build_1.0.3.bb => python3-build_1.1.1.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-build_1.0.3.bb b/meta/recipes-devtools/python/python3-build_1.1.1.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-build_1.0.3.bb
rename to meta/recipes-devtools/python/python3-build_1.1.1.bb
index 2d8faeff25..7fc3eef91b 100644
--- a/meta/recipes-devtools/python/python3-build_1.0.3.bb
+++ b/meta/recipes-devtools/python/python3-build_1.1.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/build"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=310439af287b0fb4780b2ad6907c256c"
 
-SRC_URI[sha256sum] = "538aab1b64f9828977f84bc63ae570b060a8ed1be419e7870b8b4fc5e6ea553b"
+SRC_URI[sha256sum] = "8eea65bb45b1aac2e734ba2cc8dad3a6d97d97901a395bd0ed3e7b46953d2a31"
 
 inherit pypi python_flit_core
 
-- 
2.42.0


--===============8613433529260332991==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-build: SRC_URI changed from "https://files.pythonhosted.org/packages/source/b/build/build-1.0.3.tar.gz;downloadfilename=build-1.0.3.tar.gz" to "https://files.pythonhosted.org/packages/source/b/build/build-1.1.1.tar.gz;downloadfilename=build-1.1.1.tar.gz"
packages/core2-64-poky-linux/python3-build: PKGV changed from 1.0.3 [default] to 1.1.1 [default]
packages/core2-64-poky-linux/python3-build: PV changed from "1.0.3" to "1.1.1"
packages/core2-64-poky-linux/python3-build/python3-build-dbg: PKGV changed from 1.0.3 [default] to 1.1.1 [default]
packages/core2-64-poky-linux/python3-build/python3-build-dbg: PV changed from "1.0.3" to "1.1.1"
packages/core2-64-poky-linux/python3-build/python3-build-dev: PKGV changed from 1.0.3 [default] to 1.1.1 [default]
packages/core2-64-poky-linux/python3-build/python3-build-dev: PV changed from "1.0.3" to "1.1.1"
packages/core2-64-poky-linux/python3-build/python3-build-doc: PKGV changed from 1.0.3 [default] to 1.1.1 [default]
packages/core2-64-poky-linux/python3-build/python3-build-doc: PV changed from "1.0.3" to "1.1.1"
packages/core2-64-poky-linux/python3-build/python3-build-locale: PKGV changed from 1.0.3 [default] to 1.1.1 [default]
packages/core2-64-poky-linux/python3-build/python3-build-locale: PV changed from "1.0.3" to "1.1.1"
packages/core2-64-poky-linux/python3-build/python3-build-src: PKGV changed from 1.0.3 [default] to 1.1.1 [default]
packages/core2-64-poky-linux/python3-build/python3-build-src: PV changed from "1.0.3" to "1.1.1"
packages/core2-64-poky-linux/python3-build/python3-build-staticdev: PKGV changed from 1.0.3 [default] to 1.1.1 [default]
packages/core2-64-poky-linux/python3-build/python3-build-staticdev: PV changed from "1.0.3" to "1.1.1"
packages/core2-64-poky-linux/python3-build/python3-build: PKGSIZE changed from 113761 to 118075 (+4%)
packages/core2-64-poky-linux/python3-build/python3-build: PKGV changed from 1.0.3 [default] to 1.1.1 [default]
packages/core2-64-poky-linux/python3-build/python3-build: FILELIST: directory renamed /usr/lib/python3.12/site-packages/build-1.0.3.dist-info -> /usr/lib/python3.12/site-packages/build-1.1.1.dist-info, removed "/usr/lib/python3.12/site-packages/build/__pycache__/_importlib.cpython-312.pyc /usr/lib/python3.12/site-packages/build/_importlib.py", added "/usr/lib/python3.12/site-packages/build/_compat/tarfile.py /usr/lib/python3.12/site-packages/build/_compat/tomllib.py /usr/lib/python3.12/site-packages/build/_compat/__init__.py /usr/lib/python3.12/site-packages/build/_compat/__pycache__/tarfile.cpython-312.pyc /usr/lib/python3.12/site-packages/build/_compat/__pycache__/tomllib.cpython-312.pyc /usr/lib/python3.12/site-packages/build/_compat/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/build/_compat/importlib.py /usr/lib/python3.12/site-packages/build/_compat/__pycache__/importlib.cpython-312.pyc"
packages/core2-64-poky-linux/python3-build/python3-build: PV changed from "1.0.3" to "1.1.1"
Changes to packages/core2-64-poky-linux/python3-build (sysroot):
  /usr/lib/python3.12/site-packages/build-1.0.3.dist-info moved to /usr/lib/python3.12/site-packages/build-1.1.1.dist-info
  /usr/lib/python3.12/site-packages/build/_compat was added
  /usr/lib/python3.12/site-packages/build/_compat/importlib.py was added
  /usr/lib/python3.12/site-packages/build/_compat/__init__.py was added
  /usr/lib/python3.12/site-packages/build/_compat/__pycache__ was added
  /usr/lib/python3.12/site-packages/build/_compat/__pycache__/importlib.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/build/_compat/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/build/_compat/__pycache__/tarfile.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/build/_compat/__pycache__/tomllib.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/build/_compat/tarfile.py was added
  /usr/lib/python3.12/site-packages/build/_compat/tomllib.py was added
  /usr/lib/python3.12/site-packages/build/_importlib.py was removed
  /usr/lib/python3.12/site-packages/build/__pycache__/_importlib.cpython-312.pyc was removed
Changes to packages/x86_64-linux/python3-build-native (sysroot):
  /usr/lib/python3.12/site-packages/build-1.0.3.dist-info moved to /usr/lib/python3.12/site-packages/build-1.1.1.dist-info
  /usr/lib/python3.12/site-packages/build/_compat was added
  /usr/lib/python3.12/site-packages/build/_compat/importlib.py was added
  /usr/lib/python3.12/site-packages/build/_compat/__init__.py was added
  /usr/lib/python3.12/site-packages/build/_compat/__pycache__ was added
  /usr/lib/python3.12/site-packages/build/_compat/__pycache__/importlib.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/build/_compat/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/build/_compat/__pycache__/tarfile.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/build/_compat/__pycache__/tomllib.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/build/_compat/tarfile.py was added
  /usr/lib/python3.12/site-packages/build/_compat/tomllib.py was added
  /usr/lib/python3.12/site-packages/build/_importlib.py was removed
  /usr/lib/python3.12/site-packages/build/__pycache__/_importlib.cpython-312.pyc was removed

--===============8613433529260332991==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-build-upgrade-1.0.3-1.1.1.patch"

RnJvbSBkMDJjMDUyY2ZhMWQ0YmI1Mjg0MTQ4YjIzMTliYWJiNjc5ZGI2MmY2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXIgMjAyNCAxMjoyOTo1MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtYnVpbGQ6IHVwZ3JhZGUgMS4wLjMgLT4gMS4xLjEKCi0tLQogLi4uL3B5dGhvbi97cHl0
aG9uMy1idWlsZF8xLjAuMy5iYiA9PiBweXRob24zLWJ1aWxkXzEuMS4xLmJifSAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1idWlsZF8xLjAuMy5iYiA9PiBweXRo
b24zLWJ1aWxkXzEuMS4xLmJifSAoODklKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1idWlsZF8xLjAuMy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1idWlsZF8xLjEuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDg5JQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYnVpbGRfMS4wLjMu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1idWlsZF8x
LjEuMS5iYgppbmRleCAyZDhmYWVmZjI1Li43ZmMzZWVmOTFiIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYnVpbGRfMS4wLjMuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJ1aWxkXzEuMS4xLmJiCkBAIC0zLDcgKzMs
NyBAQCBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20vcHlwYS9idWlsZCIKIExJQ0VOU0Ug
PSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MzEwNDM5YWYy
ODdiMGZiNDc4MGIyYWQ2OTA3YzI1NmMiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1MzhhYWIx
YjY0Zjk4Mjg5NzdmODRiYzYzYWU1NzBiMDYwYThlZDFiZTQxOWU3ODcwYjhiNGZjNWU2ZWE1NTNi
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjhlZWE2NWJiNDViMWFhYzJlNzM0YmEyY2M4ZGFkM2E2
ZDk3ZDk3OTAxYTM5NWJkMGVkM2U3YjQ2OTUzZDJhMzEiCiAKIGluaGVyaXQgcHlwaSBweXRob25f
ZmxpdF9jb3JlCiAKLS0gCjIuNDIuMAoK

--===============8613433529260332991==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (0 cached, 916 parsed). 1864 targets, 46 skipped, 0 masked, 0 errors.
Removing 23 recipes from the core2-64 sysroot...done.
Removing 57 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-d9435a3bce7634a1994552be7bb9274b5e58d845"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:d9435a3bce7634a1994552be7bb9274b5e58d845"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 417 Local 393 Mirrors 0 Missed 24 Current 244 (94% match, 96% complete)
Removing 5 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 255 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.1.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 257 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 264 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_23.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 271 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 272 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 273 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 274 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 275 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 276 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-build-1.1.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-build-1.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-packaging-23.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pyproject-hooks-1.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.12.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.12.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.12.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.12.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.12.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-build-1.1.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-packaging-23.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 317 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_23.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-build-1.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pyproject-hooks-1.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 318 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 319 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.12.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-packaging-23.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pyproject-hooks-1.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-build-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 335 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-packaging-23.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-build-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pyproject-hooks-1.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 845 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.1.1.bb:do_fetch)
NOTE: Running task 847 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb:do_fetch)
NOTE: Running task 848 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_23.2.bb:do_fetch)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pyproject-hooks-1.0.0-r0: task do_fetch: Started
NOTE: recipe python3-build-1.1.1-r0: task do_fetch: Started
NOTE: recipe python3-packaging-23.2-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 338 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe python3-pyproject-hooks-1.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-packaging-23.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-build-1.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 849 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb:do_unpack)
NOTE: Running task 850 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_23.2.bb:do_unpack)
NOTE: Running task 851 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.1.1.bb:do_unpack)
NOTE: recipe python3-3.12.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-3.12.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.12.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 339 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 340 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 341 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 342 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 343 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 344 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 345 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 346 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 347 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 348 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: Running setscene task 349 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pyproject-hooks-1.0.0-r0: task do_unpack: Started
NOTE: recipe python3-packaging-23.2-r0: task do_unpack: Started
NOTE: recipe python3-build-1.1.1-r0: task do_unpack: Started
NOTE: recipe python3-pyproject-hooks-1.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-build-1.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 852 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb:do_patch)
NOTE: recipe python3-packaging-23.2-r0: task do_unpack: Succeeded
NOTE: Running task 853 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.1.1.bb:do_patch)
NOTE: Running task 854 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_23.2.bb:do_patch)
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.42-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 353 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyproject-hooks-1.0.0-r0: task do_patch: Started
NOTE: recipe python3-build-1.1.1-r0: task do_patch: Started
NOTE: recipe python3-packaging-23.2-r0: task do_patch: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 367 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 368 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 372 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-build-1.1.1-r0: task do_patch: Succeeded
NOTE: recipe python3-packaging-23.2-r0: task do_patch: Succeeded
NOTE: recipe python3-pyproject-hooks-1.0.0-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 390 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata_setscene)
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 395 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 397 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.12.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 412 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 413 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 414 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 415 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 416 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 417 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 419 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 420 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 421 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 422 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 423 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 424 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 425 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 429 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1006 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/elfutils/0.189/temp/log.do_packagedata_setscene.3691759
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 434 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_package_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe python3-3.12.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 437 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 440 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 442 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 445 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 448 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 449 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 450 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 453 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 456 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: Running task 1019 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1024 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1057 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 462 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 465 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1059 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_package_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1070 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1071 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1072 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe elfutils-0.189-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 466 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 468 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 470 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 473 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 474 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 476 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 478 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 480 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 481 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.45.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.45.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 495 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 497 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 499 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 501 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 509 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.45.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 512 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.45.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.45.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 516 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 517 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 518 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 520 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 521 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 522 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 525 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: Running setscene task 529 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.48.bb:do_packagedata_setscene)
NOTE: recipe curl-8.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 532 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 533 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 539 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 542 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.48-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 546 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 548 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 559 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 565 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.48-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 572 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 574 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 584 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 585 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 587 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 594 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 601 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1219 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 606 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3827d1886d21fc285ddcf2fcb9cb1cc58679b8245b5b8a3c52f01f2714d587ae
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 611 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 612 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 619 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 621 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 622 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 624 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 626 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 627 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 629 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 630 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 632 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 634 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 635 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 636 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 637 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 638 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 640 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 648 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 649 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 651 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 654 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 656 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 657 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 659 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 661 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1665 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1674 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1675 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_23.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1794 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata)
NOTE: Running task 1817 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.1.1.bb:do_collect_spdx_deps)
NOTE: Running task 1818 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb:do_collect_spdx_deps)
NOTE: Running task 1819 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_23.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-build-1.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-packaging-23.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyproject-hooks-1.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.189-r0: task do_packagedata: Started
NOTE: recipe python3-build-1.1.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pyproject-hooks-1.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-packaging-23.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe elfutils-0.189-r0: task do_packagedata: Succeeded
NOTE: recipe python3-packaging-23.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-build-1.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyproject-hooks-1.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-packaging-23.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1825 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_23.2.bb:do_configure)
NOTE: recipe python3-build-1.1.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-pyproject-hooks-1.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1826 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.1.1.bb:do_configure)
NOTE: Running task 1827 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb:do_configure)
NOTE: recipe python3-packaging-23.2-r0: task do_configure: Started
NOTE: recipe python3-build-1.1.1-r0: task do_configure: Started
NOTE: recipe python3-pyproject-hooks-1.0.0-r0: task do_configure: Started
NOTE: recipe python3-build-1.1.1-r0: task do_configure: Succeeded
NOTE: recipe python3-packaging-23.2-r0: task do_configure: Succeeded
NOTE: recipe python3-pyproject-hooks-1.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1828 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.1.1.bb:do_compile)
NOTE: Running task 1829 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb:do_compile)
NOTE: Running task 1830 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_23.2.bb:do_compile)
NOTE: recipe python3-build-1.1.1-r0: task do_compile: Started
NOTE: recipe python3-pyproject-hooks-1.0.0-r0: task do_compile: Started
NOTE: recipe python3-packaging-23.2-r0: task do_compile: Started
NOTE: recipe python3-build-1.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1831 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.1.1.bb:do_install)
NOTE: recipe python3-pyproject-hooks-1.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-packaging-23.2-r0: task do_compile: Succeeded
NOTE: Running task 1832 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb:do_install)
NOTE: Running task 1833 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_23.2.bb:do_install)
NOTE: recipe python3-build-1.1.1-r0: task do_install: Started
NOTE: recipe python3-pyproject-hooks-1.0.0-r0: task do_install: Started
NOTE: recipe python3-packaging-23.2-r0: task do_install: Started
NOTE: recipe python3-pyproject-hooks-1.0.0-r0: task do_install: Succeeded
NOTE: recipe python3-build-1.1.1-r0: task do_install: Succeeded
NOTE: Running task 1834 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb:do_package)
NOTE: Running task 1835 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.1.1.bb:do_package)
NOTE: Running task 1836 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.1.1.bb:do_populate_sysroot)
NOTE: recipe python3-packaging-23.2-r0: task do_install: Succeeded
NOTE: Running task 1837 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_23.2.bb:do_package)
NOTE: recipe python3-pyproject-hooks-1.0.0-r0: task do_package: Started
NOTE: recipe python3-build-1.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-build-1.1.1-r0: task do_package: Started
NOTE: recipe python3-packaging-23.2-r0: task do_package: Started
NOTE: recipe python3-build-1.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pyproject-hooks-1.0.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb:do_package unihash changed to 912e703f2b8c10d0c84c3fe18635e691cb5f2797cb08c5c0afe9badea390073a
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb:do_package_write_ipk became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb:do_package_write_deb became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb:do_packagedata became valid
NOTE: recipe python3-packaging-23.2-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_23.2.bb:do_package unihash changed to 215c0447bf66d926001f79fa0d6cf6b299f6a6f4aacd6f06b5f88d3955e60f84
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_23.2.bb:do_package_write_ipk became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_23.2.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_23.2.bb:do_package_write_deb became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_23.2.bb:do_packagedata became valid
NOTE: recipe python3-build-1.1.1-r0: task do_package: Succeeded
NOTE: Running setscene task 653 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_23.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 654 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_23.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 655 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_23.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 657 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 658 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 659 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb:do_package_write_rpm_setscene)
NOTE: Running task 1838 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.1.1.bb:do_packagedata)
NOTE: recipe python3-packaging-23.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-packaging-23.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-packaging-23.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pyproject-hooks-1.0.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pyproject-hooks-1.0.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pyproject-hooks-1.0.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-build-1.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-packaging-23.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-pyproject-hooks-1.0.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pyproject-hooks-1.0.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-packaging-23.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-packaging-23.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pyproject-hooks-1.0.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 660 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_23.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 661 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb:do_packagedata_setscene)
NOTE: recipe python3-build-1.1.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.1.1.bb:do_packagedata unihash changed to 054eea3b18ccebfd38f0a57f64402e8b1f91ac3018c445359875de34b52e2473
NOTE: recipe python3-pyproject-hooks-1.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-23.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1839 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.1.1.bb:do_create_spdx)
NOTE: recipe python3-packaging-23.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyproject-hooks-1.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1842 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb:do_create_spdx)
NOTE: Running task 1843 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_23.2.bb:do_create_spdx)
NOTE: Running task 1850 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.1.1.bb:do_package_write_ipk)
NOTE: Running task 1851 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.1.1.bb:do_package_write_deb)
NOTE: Running task 1852 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.1.1.bb:do_package_write_rpm)
NOTE: recipe python3-build-1.1.1-r0: task do_create_spdx: Started
NOTE: Running task 1853 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.1.1.bb:do_package_qa)
NOTE: recipe python3-pyproject-hooks-1.0.0-r0: task do_create_spdx: Started
NOTE: recipe python3-packaging-23.2-r0: task do_create_spdx: Started
NOTE: recipe python3-build-1.1.1-r0: task do_package_write_deb: Started
NOTE: recipe python3-build-1.1.1-r0: task do_package_write_ipk: Started
NOTE: recipe python3-build-1.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-build-1.1.1-r0: task do_package_qa: Started
NOTE: recipe python3-build-1.1.1-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-build-1.1.1-r0: task do_package_qa: Succeeded
NOTE: recipe python3-packaging-23.2-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-pyproject-hooks-1.0.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1854 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.1.1.bb:do_create_runtime_spdx)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.1.1.bb:do_package_qa unihash changed to e7897c619b45b6177defbb215e44244b374afbf9c7c10c775e336c4ee10fc0ca
NOTE: recipe python3-build-1.1.1-r0: task do_create_runtime_spdx: Started
NOTE: recipe python3-build-1.1.1-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.1.1.bb:do_package_write_ipk unihash changed to 6b0ec41e7c15ff484e59f33c4b981cbbb48f8e586fa6456b890f0a90514a1688
NOTE: recipe python3-build-1.1.1-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.1.1.bb:do_package_write_deb unihash changed to 2f41055e8dbead78fa93ddd51fe81665109ee8417d317284c16b3424d51c77b4
NOTE: recipe python3-build-1.1.1-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe python3-build-1.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.1.1.bb:do_package_write_rpm unihash changed to d91cbe32227d8fe7d6991ceed6df6e29095cd18e18049ac9f4c56463c143c714
NOTE: Running noexec task 1855 of 1855 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.1.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1855 tasks of which 1807 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 20 ERROR messages, returning a non-zero exit code.
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-src went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-dbg went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-binutils went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package libelf went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package libasm went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package libdw went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package libdebuginfod went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-ptest went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-staticdev went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-dev went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-doc went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-locale-de went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-locale-en+boldquot went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-locale-en+quot went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-locale-es went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-locale-ja went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-locale-pl went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-locale-uk went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8613433529260332991==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-build/python3-build: FILELIST: directory renamed /usr/lib/python3.12/site-packages/build-1.0.3.dist-info -> /usr/lib/python3.12/site-packages/build-1.1.1.dist-info, removed "/usr/lib/python3.12/site-packages/build/__pycache__/_importlib.cpython-312.pyc /usr/lib/python3.12/site-packages/build/_importlib.py", added "/usr/lib/python3.12/site-packages/build/_compat/__pycache__/tarfile.cpython-312.pyc /usr/lib/python3.12/site-packages/build/_compat/tarfile.py /usr/lib/python3.12/site-packages/build/_compat/tomllib.py /usr/lib/python3.12/site-packages/build/_compat/__pycache__/tomllib.cpython-312.pyc /usr/lib/python3.12/site-packages/build/_compat/__init__.py /usr/lib/python3.12/site-packages/build/_compat/__pycache__/importlib.cpython-312.pyc /usr/lib/python3.12/site-packages/build/_compat/importlib.py /usr/lib/python3.12/site-packages/build/_compat/__pycache__/__init__.cpython-312.pyc"
Changes to packages/core2-64-poky-linux/python3-build (sysroot):
  /usr/lib/python3.12/site-packages/build-1.0.3.dist-info moved to /usr/lib/python3.12/site-packages/build-1.1.1.dist-info
  /usr/lib/python3.12/site-packages/build/_compat was added
  /usr/lib/python3.12/site-packages/build/_compat/importlib.py was added
  /usr/lib/python3.12/site-packages/build/_compat/__init__.py was added
  /usr/lib/python3.12/site-packages/build/_compat/__pycache__ was added
  /usr/lib/python3.12/site-packages/build/_compat/__pycache__/importlib.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/build/_compat/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/build/_compat/__pycache__/tarfile.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/build/_compat/__pycache__/tomllib.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/build/_compat/tarfile.py was added
  /usr/lib/python3.12/site-packages/build/_compat/tomllib.py was added
  /usr/lib/python3.12/site-packages/build/_importlib.py was removed
  /usr/lib/python3.12/site-packages/build/__pycache__/_importlib.cpython-312.pyc was removed
Changes to packages/x86_64-linux/python3-build-native (sysroot):
  /usr/lib/python3.12/site-packages/build-1.0.3.dist-info moved to /usr/lib/python3.12/site-packages/build-1.1.1.dist-info
  /usr/lib/python3.12/site-packages/build/_compat was added
  /usr/lib/python3.12/site-packages/build/_compat/importlib.py was added
  /usr/lib/python3.12/site-packages/build/_compat/__init__.py was added
  /usr/lib/python3.12/site-packages/build/_compat/__pycache__ was added
  /usr/lib/python3.12/site-packages/build/_compat/__pycache__/importlib.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/build/_compat/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/build/_compat/__pycache__/tarfile.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/build/_compat/__pycache__/tomllib.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/build/_compat/tarfile.py was added
  /usr/lib/python3.12/site-packages/build/_compat/tomllib.py was added
  /usr/lib/python3.12/site-packages/build/_importlib.py was removed
  /usr/lib/python3.12/site-packages/build/__pycache__/_importlib.cpython-312.pyc was removed

--===============8613433529260332991==--

