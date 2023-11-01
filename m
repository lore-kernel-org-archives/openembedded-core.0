Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 826BCC10F07
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:14 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.8661.1698848704882857423
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=VOc2sdEo;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=mNWwgYdg;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.192, mailfrom: 0101018b8b4605c9-ddef6f49-18a9-444e-afa0-35635addcb55-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848704;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9AZ9C8mgm1EzWcPAi+22xCVM13L333xkgFVx0ZSbCM8=;
	b=VOc2sdEoeuCfwIj9ekxrz3ZpyBuC9e+3cn9n3663okuyxXt6mwvgmFKhA1zbCeAj
	ulpnOEf59O6sA5fQm1XrRuQmhEHA8yjsuLduLIgI4OzIiWVyT3IfqrXFpKL+liJUJ9T
	kCEY0y9U/jvU97FlCIt0y1uxwC/cD+nipVmiULXA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848704;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9AZ9C8mgm1EzWcPAi+22xCVM13L333xkgFVx0ZSbCM8=;
	b=mNWwgYdghGiWJgtt+wx7G1bS8M2uwYOR0igeLuZE6uKSCbxppBgVcZL0XO0vZM/K
	Tyj1RmAlyCwt6+u2gqgHdhcwkkwxjmTL5Qp5ILeFNL+ot9wclyLc7iVxab7ag/AQTv5
	P6G3e/BUcwSSxSvXe4VG9z2co2b6fvT/YDswKAa8=
Content-Type: multipart/mixed; boundary="===============0168087368998198923=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyopenssl: upgrading to 23.3.0 SUCCEEDED
Message-ID: <0101018b8b4605c9-ddef6f49-18a9-444e-afa0-35635addcb55-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189976

--===============0168087368998198923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pyopenssl* to *23.3.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyopenssl-upgrade-23.2.0-23.3.0.patch
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
From 890fc1fe71d7d6e7ce7f24dd8a8d73839a58da3e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 09:22:46 +0000
Subject: [PATCH] python3-pyopenssl: upgrade 23.2.0 -> 23.3.0

---
 ...{python3-pyopenssl_23.2.0.bb => python3-pyopenssl_23.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyopenssl_23.2.0.bb => python3-pyopenssl_23.3.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb b/meta/recipes-devtools/python/python3-pyopenssl_23.3.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb
rename to meta/recipes-devtools/python/python3-pyopenssl_23.3.0.bb
index 86ae406ffb..cdcae48d60 100644
--- a/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb
+++ b/meta/recipes-devtools/python/python3-pyopenssl_23.3.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS += "openssl ${PYTHON_PN}-cryptography"
 
-SRC_URI[sha256sum] = "276f931f55a452e7dea69c7173e984eb2a4407ce413c918aa34b55f82f9b8bac"
+SRC_URI[sha256sum] = "6b2cba5cc46e822750ec3e5a81ee12819850b11303630d575e98108a079c2b12"
 
 PYPI_PACKAGE = "pyOpenSSL"
 inherit pypi setuptools3
-- 
2.39.2


--===============0168087368998198923==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyopenssl-upgrade-23.2.0-23.3.0.patch"

RnJvbSA4OTBmYzFmZTcxZDdkNmU3Y2U3ZjI0ZGQ4YThkNzM4MzlhNThkYTNlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAwOToyMjo0NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHlvcGVuc3NsOiB1cGdyYWRlIDIzLjIuMCAtPiAyMy4zLjAKCi0tLQogLi4ue3B5dGhv
bjMtcHlvcGVuc3NsXzIzLjIuMC5iYiA9PiBweXRob24zLXB5b3BlbnNzbF8yMy4zLjAuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1weW9wZW5zc2xfMjMuMi4w
LmJiID0+IHB5dGhvbjMtcHlvcGVuc3NsXzIzLjMuMC5iYn0gKDg2JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlvcGVuc3NsXzIzLjIuMC5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weW9wZW5zc2xfMjMuMy4wLmJi
CnNpbWlsYXJpdHkgaW5kZXggODYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1weW9wZW5zc2xfMjMuMi4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlvcGVuc3NsXzIzLjMuMC5iYgppbmRleCA4NmFlNDA2
ZmZiLi5jZGNhZTQ4ZDYwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtcHlvcGVuc3NsXzIzLjIuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcHlvcGVuc3NsXzIzLjMuMC5iYgpAQCAtNSw3ICs1LDcgQEAgTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9M2I4M2VmOTYzODdmMTQ2NTVmYzg1NGRk
YzNjNmJkNTciCiAKIERFUEVORFMgKz0gIm9wZW5zc2wgJHtQWVRIT05fUE59LWNyeXB0b2dyYXBo
eSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjI3NmY5MzFmNTVhNDUyZTdkZWE2OWM3MTczZTk4
NGViMmE0NDA3Y2U0MTNjOTE4YWEzNGI1NWY4MmY5YjhiYWMiCitTUkNfVVJJW3NoYTI1NnN1bV0g
PSAiNmIyY2JhNWNjNDZlODIyNzUwZWMzZTVhODFlZTEyODE5ODUwYjExMzAzNjMwZDU3NWU5ODEw
OGEwNzljMmIxMiIKIAogUFlQSV9QQUNLQUdFID0gInB5T3BlblNTTCIKIGluaGVyaXQgcHlwaSBz
ZXR1cHRvb2xzMwotLSAKMi4zOS4yCgo=

--===============0168087368998198923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pyopenssl: PKGV changed from 23.2.0 [default] to 23.3.0 [default]
packages/core2-64-poky-linux/python3-pyopenssl: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyOpenSSL/pyOpenSSL-23.2.0.tar.gz;downloadfilename=pyOpenSSL-23.2.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pyOpenSSL/pyOpenSSL-23.3.0.tar.gz;downloadfilename=pyOpenSSL-23.3.0.tar.gz"
packages/core2-64-poky-linux/python3-pyopenssl: PV changed from "23.2.0" to "23.3.0"
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-dbg: PV changed from "23.2.0" to "23.3.0"
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-dbg: PKGV changed from 23.2.0 [default] to 23.3.0 [default]
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-dev: PV changed from "23.2.0" to "23.3.0"
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-dev: PKGV changed from 23.2.0 [default] to 23.3.0 [default]
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-doc: PV changed from "23.2.0" to "23.3.0"
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-doc: PKGV changed from 23.2.0 [default] to 23.3.0 [default]
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-locale: PV changed from "23.2.0" to "23.3.0"
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-locale: PKGV changed from 23.2.0 [default] to 23.3.0 [default]
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-src: PV changed from "23.2.0" to "23.3.0"
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-src: PKGV changed from 23.2.0 [default] to 23.3.0 [default]
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-staticdev: PV changed from "23.2.0" to "23.3.0"
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-staticdev: PKGV changed from 23.2.0 [default] to 23.3.0 [default]
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-tests: PV changed from "23.2.0" to "23.3.0"
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-tests: PKGV changed from 23.2.0 [default] to 23.3.0 [default]
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl: PKGSIZE changed from 528524 to 524329 (-1%)
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl: PV changed from "23.2.0" to "23.3.0"
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl: PKGV changed from 23.2.0 [default] to 23.3.0 [default]
Changes to packages/core2-64-poky-linux/python3-pyopenssl (sysroot):
  /usr/lib/python3.11/site-packages/pyOpenSSL-23.2.0.dist-info moved to /usr/lib/python3.11/site-packages/pyOpenSSL-23.3.0.dist-info

--===============0168087368998198923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (0 cached, 911 parsed). 1843 targets, 67 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-be4dd4eb7eec4b640746b2f0750f64ad760c5d67"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:be4dd4eb7eec4b640746b2f0750f64ad760c5d67"
workspace            = "master:3a7b408178439482d49d573113cc61a69fb28147"

Initialising tasks...done.
Sstate summary: Wanted 85 Local 37 Mirrors 0 Missed 48 Current 714 (43% match, 93% complete)
Removing 2 stale sstate objects for arch qemuarm...done.
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 736 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.87.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 783 of 799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-poetry-core_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 785 of 799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-hypothesis-6.87.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-poetry-core-native-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-rust-native-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-hypothesis-6.87.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-poetry-core-native-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 797 of 799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-poetry-core_1.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-rust-native-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 798 of 799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.70.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-poetry-core-native-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cargo-native-1.70.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1530 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_recipe_qa)
NOTE: recipe python3-poetry-core-native-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1616 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.3.0.bb:do_recipe_qa)
NOTE: Running task 1756 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_recipe_qa)
NOTE: Running task 1848 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-pyopenssl-23.3.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_recipe_qa: Started
NOTE: recipe cargo-native-1.70.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_recipe_qa: Started
NOTE: recipe python3-pyopenssl-23.3.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 799 of 799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.70.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1855 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_fetch)
NOTE: Running task 1856 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.3.0.bb:do_fetch)
NOTE: Running task 1857 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_fetch)
NOTE: Running task 1866 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_recipe_qa)
NOTE: Running task 1868 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_recipe_qa)
NOTE: Running task 1869 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_recipe_qa)
NOTE: Running task 1870 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb:do_recipe_qa)
NOTE: Running task 1871 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_recipe_qa)
NOTE: Running task 1872 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.16.0.bb:do_recipe_qa)
NOTE: Running task 2111 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe python3-pyopenssl-23.3.0-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_recipe_qa: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_recipe_qa: Started
NOTE: recipe python3-cffi-1.16.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_recipe_qa: Started
NOTE: recipe python3-pyopenssl-23.3.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Succeeded
NOTE: Running task 2112 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.3.0.bb:do_unpack)
NOTE: Running task 2113 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_unpack)
NOTE: Running task 2114 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Started
NOTE: recipe rust-native-1.70.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 2115 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_unpack)
NOTE: recipe python3-psutil-5.9.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-cffi-1.16.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2116 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_fetch)
NOTE: recipe python3-iso8601-2.1.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2117 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 2118 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.16.0.bb:do_fetch)
NOTE: recipe python3-pyopenssl-23.3.0-r0: task do_unpack: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Started
NOTE: Running task 2119 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_fetch)
NOTE: Running task 2120 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_fetch)
NOTE: Running task 2121 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb:do_fetch)
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyopenssl-23.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 2122 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.3.0.bb:do_patch)
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Succeeded
NOTE: Running task 2123 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_patch)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Started
NOTE: recipe python3-cffi-1.16.0-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_fetch: Started
NOTE: Running task 2124 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.16.0.bb:do_unpack)
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: Running task 2125 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb:do_unpack)
NOTE: recipe python3-iso8601-2.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_fetch: Succeeded
NOTE: Running task 2126 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_unpack)
NOTE: Running task 2127 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_unpack)
NOTE: Running task 2128 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-23.3.0-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_fetch: Succeeded
NOTE: Running task 2129 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: Running task 2130 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 2131 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_unpack)
NOTE: Running task 2132 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2133 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe python3-cffi-1.16.0-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-23.3.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_unpack: Started
NOTE: Running task 2134 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.3.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2135 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.3.0.bb:do_populate_lic)
NOTE: Running task 2139 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-iso8601-2.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-cffi-1.16.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_unpack: Succeeded
NOTE: Running task 2142 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_patch)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2143 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.16.0.bb:do_patch)
NOTE: Running task 2144 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_patch)
NOTE: recipe python3-psutil-5.9.5-r0: task do_unpack: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2145 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: recipe python3-psutil-5.9.5-r0: task do_unpack: Succeeded
NOTE: Running task 2146 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_patch)
NOTE: recipe python3-pyopenssl-23.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-23.3.0-r0: task do_populate_lic: Started
NOTE: recipe python3-cffi-1.16.0-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe rust-native-1.70.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-psutil-5.9.5-r0: task do_patch: Started
NOTE: Running task 2184 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2193 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2202 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.3.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-cffi-1.16.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2203 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2204 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyopenssl-23.3.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Succeeded
NOTE: recipe python3-pyopenssl-23.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2205 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyopenssl-23.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyopenssl-23.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cffi-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iso8601-2.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_patch: Succeeded
NOTE: Running task 2206 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 2207 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-psutil-5.9.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iso8601-2.1.0-r0: task do_patch: Succeeded
NOTE: Running task 2208 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_patch: Succeeded
NOTE: recipe python3-cffi-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2209 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2210 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_configure)
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-iso8601-2.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2211 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb:do_patch)
NOTE: recipe python3-psutil-5.9.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 2212 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_patch)
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-23.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2213 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.3.0.bb:do_configure)
NOTE: recipe python3-pyopenssl-23.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Succeeded
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2214 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2215 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2216 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_configure)
NOTE: Running task 2217 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2218 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-psutil-5.9.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2219 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: Running task 2220 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_configure)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-23.3.0-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Started
NOTE: Running task 2221 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_rust_create_wrappers)
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: Running task 2222 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2223 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_rust_gen_targets)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_configure: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_configure: Started
NOTE: recipe python3-pyopenssl-23.3.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: Running task 2224 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.3.0.bb:do_compile)
NOTE: Running task 2225 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_configure: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2226 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 2227 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_compile)
NOTE: recipe python3-psutil-5.9.5-r0: task do_configure: Succeeded
NOTE: Running task 2228 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyopenssl-23.3.0-r0: task do_compile: Started
NOTE: Running task 2229 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb:do_configure)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_create_wrappers: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3f47b5ed9eb8441973c4ab548f6730c1607013d772c0621215c8eb30a3b8334f
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_compile: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_compile: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2233 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_configure: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_configure: Started
NOTE: Running task 2234 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_configure: Succeeded
NOTE: Running task 2235 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_configure_ptest_base)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2236 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_compile)
NOTE: recipe python3-pyopenssl-23.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2237 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.3.0.bb:do_install)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_compile: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Succeeded
NOTE: Running task 2238 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: Running task 2239 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: recipe python3-pyopenssl-23.3.0-r0: task do_install: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2240 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: Running task 2241 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: recipe python3-pyopenssl-23.3.0-r0: task do_install: Succeeded
NOTE: Running task 2242 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.3.0.bb:do_package)
NOTE: Running task 2243 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.3.0.bb:do_populate_sysroot)
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: Running task 2244 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_populate_sysroot)
NOTE: Running task 2245 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_package)
NOTE: recipe python3-iso8601-2.1.0-r0: task do_install: Succeeded
NOTE: recipe python3-pyopenssl-23.3.0-r0: task do_package: Started
NOTE: recipe python3-pyopenssl-23.3.0-r0: task do_populate_sysroot: Started
NOTE: Running task 2246 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_package)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_compile: Succeeded
NOTE: Running task 2247 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_install)
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_install: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_compile: Succeeded
NOTE: Running task 2248 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_install)
NOTE: recipe python3-psutil-5.9.5-r0: task do_install: Started
NOTE: recipe python3-pyopenssl-23.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2249 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_install: Succeeded
NOTE: recipe python3-cffi-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2250 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_package)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_package: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_install: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: Running task 2251 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_package)
NOTE: Running task 2252 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: recipe python3-cffi-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2253 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.16.0.bb:do_configure)
NOTE: recipe python3-psutil-5.9.5-r0: task do_package: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-pyopenssl-23.3.0-r0: task do_package: Succeeded
NOTE: recipe python3-cffi-1.16.0-r0: task do_configure: Started
NOTE: Running task 2254 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_packagedata)
NOTE: Running task 2255 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.3.0.bb:do_packagedata)
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Succeeded
NOTE: Running task 2256 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata)
NOTE: recipe python3-cffi-1.16.0-r0: task do_configure: Succeeded
NOTE: Running task 2257 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.16.0.bb:do_compile)
NOTE: recipe python3-iso8601-2.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-pyopenssl-23.3.0-r0: task do_packagedata: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.16.0-r0: task do_compile: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyopenssl-23.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2258 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.3.0.bb:do_create_spdx)
NOTE: Running task 2259 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.3.0.bb:do_package_write_rpm)
NOTE: Running task 2260 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.3.0.bb:do_package_qa)
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyopenssl-23.3.0-r0: task do_create_spdx: Started
NOTE: recipe python3-pyopenssl-23.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_package: Succeeded
NOTE: recipe python3-pyopenssl-23.3.0-r0: task do_package_qa: Started
NOTE: Running task 2261 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_packagedata)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_packagedata: Started
NOTE: recipe python3-pyopenssl-23.3.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2262 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.3.0.bb:do_create_runtime_spdx)
NOTE: recipe python3-pyopenssl-23.3.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyopenssl-23.3.0-r0: task do_create_runtime_spdx: Started
NOTE: recipe python3-pyopenssl-23.3.0-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe python3-pyopenssl-23.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_package: Succeeded
NOTE: Running task 2263 of 2278 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.5-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_packagedata: Failed
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_compile: Succeeded
NOTE: recipe python3-cffi-1.16.0-r0: task do_compile: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2263 tasks of which 2158 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_packagedata
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-psutil-5.9.5-r0 do_packagedata: QA Issue: Package version for package python3-psutil-src went backwards which would break package feeds (from 0:5.9.6-r0 to 0:5.9.5-r0) [version-going-backwards]
ERROR: python3-psutil-5.9.5-r0 do_packagedata: QA Issue: Package version for package python3-psutil-dbg went backwards which would break package feeds (from 0:5.9.6-r0 to 0:5.9.5-r0) [version-going-backwards]
ERROR: python3-psutil-5.9.5-r0 do_packagedata: QA Issue: Package version for package python3-psutil-tests went backwards which would break package feeds (from 0:5.9.6-r0 to 0:5.9.5-r0) [version-going-backwards]
ERROR: python3-psutil-5.9.5-r0 do_packagedata: QA Issue: Package version for package python3-psutil-staticdev went backwards which would break package feeds (from 0:5.9.6-r0 to 0:5.9.5-r0) [version-going-backwards]
ERROR: python3-psutil-5.9.5-r0 do_packagedata: QA Issue: Package version for package python3-psutil-dev went backwards which would break package feeds (from 0:5.9.6-r0 to 0:5.9.5-r0) [version-going-backwards]
ERROR: python3-psutil-5.9.5-r0 do_packagedata: QA Issue: Package version for package python3-psutil-doc went backwards which would break package feeds (from 0:5.9.6-r0 to 0:5.9.5-r0) [version-going-backwards]
ERROR: python3-psutil-5.9.5-r0 do_packagedata: QA Issue: Package version for package python3-psutil-locale went backwards which would break package feeds (from 0:5.9.6-r0 to 0:5.9.5-r0) [version-going-backwards]
ERROR: python3-psutil-5.9.5-r0 do_packagedata: QA Issue: Package version for package python3-psutil went backwards which would break package feeds (from 0:5.9.6-r0 to 0:5.9.5-r0) [version-going-backwards]
ERROR: python3-psutil-5.9.5-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-psutil/5.9.5/temp/log.do_packagedata.3671941
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_packagedata) failed with exit code '1'

--===============0168087368998198923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-pyopenssl (sysroot):
  /usr/lib/python3.11/site-packages/pyOpenSSL-23.2.0.dist-info moved to /usr/lib/python3.11/site-packages/pyOpenSSL-23.3.0.dist-info

--===============0168087368998198923==--

