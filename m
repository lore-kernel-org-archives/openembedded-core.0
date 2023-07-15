Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CDDCC27C55
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:39 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.6034.1689456455145859509
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=dP6hXZN8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101895b73ab07-1632a035-dd63-47a5-8372-6d49604e78d6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456454;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=Ldd0HzvqtCQngsdlXnQsEa/UioMkzHyN1BDaY3bDBu4=;
	b=dP6hXZN8TS5EqhP9wnFgjAe7Dq1g9zmDMGphO6o1d03EpdLBNxwTDOwBOLotvGeA
	1PcGyVUXxxYbITOo1SmefNNUpV7iH42CcDDADQls3Z6i9giAlgGS9fo4Sa7fc2uZcQG
	qZFtJes05fLkePvH/gEX/j3vWUpSi7NfOD6rmJFU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456454;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=Ldd0HzvqtCQngsdlXnQsEa/UioMkzHyN1BDaY3bDBu4=;
	b=mbj/IbG2yl7Pfr/aIYbg4YTL//B8fK4zz2j0GqvIsIK6H5k3E9Bt/ZwTRaiH5lBW
	B5J9YIHLKwp4uKHdGmlxF0Y8/pLkq3UO2RygsI3zFPZ2VuJB/eT51pLlI1n7NGnIHrf
	CxBU6uQgKVj7J/IhwGC269J0zZeT1XYYokEafKKo=
Content-Type: multipart/mixed; boundary="===============1493816058830365508=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-numpy: upgrading to 1.25.1 SUCCEEDED
Message-ID: <010101895b73ab07-1632a035-dd63-47a5-8372-6d49604e78d6-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:34 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184358

--===============1493816058830365508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-numpy* to *1.25.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-numpy-upgrade-1.25.0-1.25.1.patch
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
From 378f1ce13c3531a64af5e625a293f8d580fc0f3c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 13:14:44 +0000
Subject: [PATCH] python3-numpy: upgrade 1.25.0 -> 1.25.1

---
 .../python/{python3-numpy_1.25.0.bb => python3-numpy_1.25.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-numpy_1.25.0.bb => python3-numpy_1.25.1.bb} (96%)

diff --git a/meta/recipes-devtools/python/python3-numpy_1.25.0.bb b/meta/recipes-devtools/python/python3-numpy_1.25.1.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3-numpy_1.25.0.bb
rename to meta/recipes-devtools/python/python3-numpy_1.25.1.bb
index d9d37dbf36..3632ab71ee 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.25.0.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.25.1.bb
@@ -12,7 +12,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://0001-numpy-core-Define-RISCV-32-support.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "f1accae9a28dc3cda46a91de86acf69de0d1b5f4edd44a9b0c3ceb8036dfff19"
+SRC_URI[sha256sum] = "9a3a9f3a61480cc086117b426a8bd86869c213fc4072e606f01c4e4b66eb92bf"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
-- 
2.39.2


--===============1493816058830365508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-numpy: SRC_URI changed from "https://github.com/numpy/numpy/releases/download/v1.25.0/numpy-1.25.0.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://0001-numpy-core-Define-RISCV-32-support.patch file://run-ptest" to "https://github.com/numpy/numpy/releases/download/v1.25.1/numpy-1.25.1.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://0001-numpy-core-Define-RISCV-32-support.patch file://run-ptest"
packages/core2-32-poky-linux/python3-numpy: PV changed from "1.25.0" to "1.25.1"
packages/core2-32-poky-linux/python3-numpy: PKGV changed from 1.25.0 [default] to 1.25.1 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PV changed from "1.25.0" to "1.25.1"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PKGSIZE changed from 50164836 to 50165380 (+0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PKGV changed from 1.25.0 [default] to 1.25.1 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dev: PV changed from "1.25.0" to "1.25.1"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dev: PKGV changed from 1.25.0 [default] to 1.25.1 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-doc: PV changed from "1.25.0" to "1.25.1"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-doc: PKGV changed from 1.25.0 [default] to 1.25.1 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-locale: PV changed from "1.25.0" to "1.25.1"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-locale: PKGV changed from 1.25.0 [default] to 1.25.1 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-ptest: PV changed from "1.25.0" to "1.25.1"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-ptest: PKGV changed from 1.25.0 [default] to 1.25.1 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PV changed from "1.25.0" to "1.25.1"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PKGSIZE changed from 19514368 to 19515348 (+0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PKGV changed from 1.25.0 [default] to 1.25.1 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PV changed from "1.25.0" to "1.25.1"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PKGSIZE changed from 270368 to 270380 (+0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PKGV changed from 1.25.0 [default] to 1.25.1 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy: FILELIST: directory renamed /usr/lib/python3.11/site-packages/numpy-1.25.0.dist-info -> /usr/lib/python3.11/site-packages/numpy-1.25.1.dist-info, added "/usr/lib/python3.11/site-packages/numpy/f2py/tests/src/crackfortran/gh23879.f90"
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PV changed from "1.25.0" to "1.25.1"
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PKGSIZE changed from 40732002 to 40737309 (+0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PKGV changed from 1.25.0 [default] to 1.25.1 [default]
Changes to packages/core2-32-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.11/site-packages/numpy-1.25.0.dist-info moved to /usr/lib/python3.11/site-packages/numpy-1.25.1.dist-info
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/crackfortran/gh23879.f90 was added

--===============1493816058830365508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-numpy/python3-numpy: FILELIST: directory renamed /usr/lib/python3.11/site-packages/numpy-1.25.0.dist-info -> /usr/lib/python3.11/site-packages/numpy-1.25.1.dist-info, added "/usr/lib/python3.11/site-packages/numpy/f2py/tests/src/crackfortran/gh23879.f90"
Changes to packages/core2-32-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.11/site-packages/numpy-1.25.0.dist-info moved to /usr/lib/python3.11/site-packages/numpy-1.25.1.dist-info
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/crackfortran/gh23879.f90 was added

--===============1493816058830365508==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-numpy-upgrade-1.25.0-1.25.1.patch"

RnJvbSAzNzhmMWNlMTNjMzUzMWE2NGFmNWU2MjVhMjkzZjhkNTgwZmMwZjNjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMTM6MTQ6NDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW51bXB5OiB1cGdyYWRlIDEuMjUuMCAtPiAxLjI1LjEKCi0tLQogLi4uL3B5dGhvbi97
cHl0aG9uMy1udW1weV8xLjI1LjAuYmIgPT4gcHl0aG9uMy1udW1weV8xLjI1LjEuYmJ9IHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1udW1weV8xLjI1LjAuYmIgPT4g
cHl0aG9uMy1udW1weV8xLjI1LjEuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5XzEuMjUuMC5iYiBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weV8xLjI1LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5
NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5
XzEuMjUuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LW51bXB5XzEuMjUuMS5iYgppbmRleCBkOWQzN2RiZjM2Li4zNjMyYWI3MWVlIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHlfMS4yNS4wLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weV8xLjI1LjEuYmIK
QEAgLTEyLDcgKzEyLDcgQEAgU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQv
diR7UFZ9LyR7U1JDTkFNRX0tJHtQVn0udGFyLmd6IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEt
bnVtcHktY29yZS1EZWZpbmUtUklTQ1YtMzItc3VwcG9ydC5wYXRjaCBcCiAgICAgICAgICAgIGZp
bGU6Ly9ydW4tcHRlc3QgXAogICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZjFh
Y2NhZTlhMjhkYzNjZGE0NmE5MWRlODZhY2Y2OWRlMGQxYjVmNGVkZDQ0YTliMGMzY2ViODAzNmRm
ZmYxOSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5YTNhOWYzYTYxNDgwY2MwODYxMTdiNDI2YThi
ZDg2ODY5YzIxM2ZjNDA3MmU2MDZmMDFjNGU0YjY2ZWI5MmJmIgogCiBHSVRIVUJfQkFTRV9VUkkg
PSAiaHR0cHM6Ly9naXRodWIuY29tL251bXB5L251bXB5L3JlbGVhc2VzIgogVVBTVFJFQU1fQ0hF
Q0tfUkVHRVggPSAicmVsZWFzZXMvdGFnL3Y/KD9QPHB2ZXI+XGQrKFwuXGQrKSspJCIKLS0gCjIu
MzkuMgoK

--===============1493816058830365508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1804 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:d127540f8397fe67095254a14d8bea11d99ae7b6"
workspace            = "master:e6d4b610fc24ae009bf6d0710fc429a61a38aa34"

Initialising tasks...done.
Sstate summary: Wanted 48 Local 29 Mirrors 0 Missed 19 Current 473 (60% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1077 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_fetch)
NOTE: Running task 1101 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_fetch)
NOTE: Running task 1276 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_fetch)
NOTE: recipe python3-numpy-1.25.1-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_fetch: Started
NOTE: recipe python3-numpy-1.25.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_fetch: Succeeded
NOTE: Running task 1638 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_unpack)
NOTE: Running task 1639 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_fetch: Started
NOTE: Running task 1640 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_unpack)
NOTE: Running task 1641 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 1677 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_unpack)
NOTE: Running task 1678 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-numpy-1.25.1-r0: task do_unpack: Started
NOTE: recipe python3-numpy-1.25.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_unpack: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1771 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_patch)
NOTE: Running task 1772 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_unpack: Succeeded
NOTE: Running task 1773 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_patch)
NOTE: Running task 1774 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_patch: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-numpy-1.25.1-r0: task do_unpack: Succeeded
NOTE: Running task 1775 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_patch)
NOTE: Running task 1776 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-numpy-1.25.1-r0: task do_patch: Started
NOTE: recipe python3-numpy-1.25.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-numpy-1.25.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-numpy-1.25.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_patch: Succeeded
NOTE: Running task 1777 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1778 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.25.1-r0: task do_patch: Succeeded
NOTE: Running task 1779 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1780 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_populate_lic)
NOTE: recipe python3-numpy-1.25.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.25.1-r0: task do_populate_lic: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1781 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_configure)
NOTE: Running task 1782 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_configure)
NOTE: recipe python3-numpy-1.25.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_populate_lic unihash changed to 441f7b2d2b10330a5aff32973aaf649c2892fbb273f4e374b454e00c5f5f8665
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_configure: Started
NOTE: recipe python3-numpy-1.25.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1783 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_configure)
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_configure: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1784 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_compile)
NOTE: recipe python3-numpy-1.25.1-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_configure: Succeeded
NOTE: Running task 1785 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_configure_ptest_base)
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_compile: Started
NOTE: recipe python3-numpy-1.25.1-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 1786 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_configure_ptest_base)
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1787 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_compile)
NOTE: recipe python3-numpy-1.25.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-1.25.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_compile: Started
NOTE: Running task 1788 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_compile)
NOTE: recipe python3-numpy-1.25.1-r0: task do_compile: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1789 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_install)
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_compile: Succeeded
NOTE: Running task 1790 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_compile_ptest_base)
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1791 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_install)
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_install: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_install: Succeeded
NOTE: Running task 1792 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_package)
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_install: Succeeded
NOTE: Running task 1793 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_install_ptest_base)
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1794 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_package)
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_package: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_package: Succeeded
NOTE: Running task 1795 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_packagedata)
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_packagedata: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1796 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_create_spdx)
NOTE: Running task 1797 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_package_write_rpm)
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_create_spdx: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_package: Succeeded
NOTE: Running task 1798 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_packagedata: Failed
NOTE: recipe python3-numpy-1.25.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1798 tasks of which 1761 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-hypothesis-6.80.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.81.1-r0 to 0:6.80.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.80.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.81.1-r0 to 0:6.80.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.80.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.81.1-r0 to 0:6.80.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.80.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.81.1-r0 to 0:6.80.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.80.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.81.1-r0 to 0:6.80.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.80.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.81.1-r0 to 0:6.80.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.80.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.81.1-r0 to 0:6.80.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.80.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.81.1-r0 to 0:6.80.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.80.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-hypothesis/6.80.0-r0/temp/log.do_packagedata.1719078
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_packagedata) failed with exit code '1'

--===============1493816058830365508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1804 targets, 54 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:d127540f8397fe67095254a14d8bea11d99ae7b6"
workspace            = "master:e6d4b610fc24ae009bf6d0710fc429a61a38aa34"

Initialising tasks...done.
Sstate summary: Wanted 48 Local 29 Mirrors 0 Missed 19 Current 473 (60% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1077 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_fetch)
NOTE: Running task 1101 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_fetch)
NOTE: Running task 1276 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_fetch)
NOTE: recipe python3-numpy-1.25.1-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_fetch: Started
NOTE: recipe python3-numpy-1.25.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_fetch: Succeeded
NOTE: Running task 1728 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_unpack)
NOTE: Running task 1729 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_fetch: Started
NOTE: Running task 1730 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_unpack)
NOTE: Running task 1731 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 1769 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_unpack)
NOTE: Running task 1770 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-numpy-1.25.1-r0: task do_unpack: Started
NOTE: recipe python3-numpy-1.25.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_unpack: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1771 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_patch)
NOTE: Running task 1772 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_unpack: Succeeded
NOTE: Running task 1773 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_patch)
NOTE: Running task 1774 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_patch: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-numpy-1.25.1-r0: task do_unpack: Succeeded
NOTE: Running task 1775 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_patch)
NOTE: Running task 1776 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-numpy-1.25.1-r0: task do_patch: Started
NOTE: recipe python3-numpy-1.25.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-numpy-1.25.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_patch: Succeeded
NOTE: recipe python3-numpy-1.25.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_patch: Succeeded
NOTE: Running task 1777 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1778 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.25.1-r0: task do_patch: Succeeded
NOTE: Running task 1779 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1780 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_populate_lic)
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.25.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.25.1-r0: task do_populate_lic: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1781 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_configure)
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1782 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_configure)
NOTE: recipe python3-numpy-1.25.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_populate_lic unihash changed to 441f7b2d2b10330a5aff32973aaf649c2892fbb273f4e374b454e00c5f5f8665
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_configure: Started
NOTE: recipe python3-numpy-1.25.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1783 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_configure)
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_configure: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1784 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_compile)
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_configure: Succeeded
NOTE: recipe python3-numpy-1.25.1-r0: task do_configure: Started
NOTE: Running task 1785 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_configure_ptest_base)
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_compile: Started
NOTE: recipe python3-numpy-1.25.1-r0: task do_configure: Succeeded
NOTE: Running task 1786 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_configure_ptest_base)
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1787 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_compile)
NOTE: recipe python3-numpy-1.25.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-1.25.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1788 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_compile)
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_compile: Started
NOTE: recipe python3-numpy-1.25.1-r0: task do_compile: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1789 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_install)
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_compile: Succeeded
NOTE: Running task 1790 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_compile_ptest_base)
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1791 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_install)
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_install: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_install: Succeeded
NOTE: Running task 1792 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_package)
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_install: Succeeded
NOTE: Running task 1793 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_install_ptest_base)
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1794 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_package)
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_package: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_package: Succeeded
NOTE: Running task 1795 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_packagedata)
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_packagedata: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1796 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_create_spdx)
NOTE: Running task 1797 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_package_write_rpm)
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_create_spdx: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_package: Succeeded
NOTE: Running task 1798 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_packagedata: Failed
NOTE: recipe python3-numpy-1.25.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1798 tasks of which 1761 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-hypothesis-6.80.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.81.1-r0 to 0:6.80.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.80.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.81.1-r0 to 0:6.80.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.80.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.81.1-r0 to 0:6.80.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.80.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.81.1-r0 to 0:6.80.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.80.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.81.1-r0 to 0:6.80.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.80.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.81.1-r0 to 0:6.80.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.80.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.81.1-r0 to 0:6.80.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.80.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.81.1-r0 to 0:6.80.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.80.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-hypothesis/6.80.0-r0/temp/log.do_packagedata.1708812
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_packagedata) failed with exit code '1'

--===============1493816058830365508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1804 targets, 48 skipped, 0 masked, 0 errors.
Removing 28 recipes from the core2-32 sysroot...done.
Removing 54 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:d127540f8397fe67095254a14d8bea11d99ae7b6"
workspace            = "master:e6d4b610fc24ae009bf6d0710fc429a61a38aa34"

Initialising tasks...done.
Sstate summary: Wanted 267 Local 247 Mirrors 0 Missed 20 Current 249 (92% match, 96% complete)
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 250 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 266 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.4.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 267 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 268 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 269 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 275 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 276 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 277 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 278 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 279 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm_setscene)
NOTE: Running task 311 of 1794 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_fetch)
NOTE: Running task 324 of 1794 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: Running task 376 of 1794 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_fetch)
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-7.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytest-7.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+8259375d30-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+8259375d30-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-numpy-1.25.1-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_fetch: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_fetch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+8259375d30-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pytest-7.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 292 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+8259375d30-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 300 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 301 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-7.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 415 of 1794 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_unpack)
NOTE: Running setscene task 302 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe python3-numpy-1.25.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 303 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 304 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 305 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 306 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 307 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 308 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 309 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 310 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 311 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 312 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 313 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 314 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_packagedata_setscene)
NOTE: Running task 416 of 1794 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_unpack)
NOTE: Running task 417 of 1794 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_unpack)
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_unpack: Started
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-more-itertools-9.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-23.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-1.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-67.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-7.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-numpy-1.25.1-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_unpack: Started
NOTE: recipe python3-3.11.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 318 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 319 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 320 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 321 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 322 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-more-itertools-9.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pluggy-1.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-23.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-67.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-7.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+8259375d30-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 364 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 367 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 368 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_populate_sysroot_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+8259375d30-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 374 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 376 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 377 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-numpy-1.25.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 381 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 388 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 390 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 392 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 401 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_create_spdx_setscene)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 405 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 411 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 412 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 413 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 414 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 415 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 416 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 417 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 418 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 419 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 420 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 423 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 425 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 426 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 427 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 428 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 430 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 431 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 432 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 433 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 434 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 435 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 440 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 446 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 453 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 454 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 967 of 1794 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_patch)
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 980 of 1794 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_patch)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1055 of 1794 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_patch)
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-numpy-1.25.1-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_patch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_patch: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 467 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_patch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1201 of 1794 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_patch: Succeeded
NOTE: Running task 1206 of 1794 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 470 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-numpy-1.25.1-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1211 of 1794 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1212 of 1794 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_populate_lic)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 472 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-numpy-1.25.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.25.1-r0: task do_populate_lic: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-numpy-1.25.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_populate_lic unihash changed to 441f7b2d2b10330a5aff32973aaf649c2892fbb273f4e374b454e00c5f5f8665
NOTE: recipe python3-numpy-1.25.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 479 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 480 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 485 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 487 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 489 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 491 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 493 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 494 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 496 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_package_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 497 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 498 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 499 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 500 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 501 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 504 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_packagedata_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 510 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 513 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 514 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1506 of 1794 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1511 of 1794 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1613 of 1794 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1653 of 1794 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_collect_spdx_deps)
NOTE: Running task 1735 of 1794 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-numpy-1.25.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1737 of 1794 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1762 of 1794 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm)
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-numpy-1.25.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1764 of 1794 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_configure)
NOTE: recipe python3-numpy-1.25.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-numpy-1.25.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1765 of 1794 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_configure)
NOTE: Running task 1766 of 1794 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_configure)
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_configure: Started
NOTE: recipe python3-numpy-1.25.1-r0: task do_configure: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_configure: Succeeded
NOTE: recipe python3-numpy-1.25.1-r0: task do_configure: Succeeded
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1767 of 1794 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_configure_ptest_base)
NOTE: Running task 1768 of 1794 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_configure_ptest_base)
NOTE: Running task 1769 of 1794 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_compile)
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-1.25.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-numpy-1.25.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1770 of 1794 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_compile)
NOTE: Running task 1771 of 1794 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_compile)
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_compile: Started
NOTE: recipe python3-numpy-1.25.1-r0: task do_compile: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1772 of 1794 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_install)
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_compile: Succeeded
NOTE: Running task 1773 of 1794 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_compile_ptest_base)
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1774 of 1794 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_install)
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_install: Succeeded
NOTE: Running task 1775 of 1794 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_package)
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_install: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_install: Succeeded
NOTE: Running task 1776 of 1794 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_install_ptest_base)
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1777 of 1794 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_package)
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_package: Succeeded
NOTE: Running task 1778 of 1794 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_package: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_packagedata: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1779 of 1794 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_create_spdx)
NOTE: Running task 1780 of 1794 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_package_write_rpm)
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_create_spdx: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_package: Succeeded
NOTE: Running task 1781 of 1794 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_packagedata: Failed
NOTE: recipe python3-numpy-1.25.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1781 tasks of which 1743 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-hypothesis-6.80.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.81.1-r0 to 0:6.80.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.80.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.81.1-r0 to 0:6.80.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.80.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.81.1-r0 to 0:6.80.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.80.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.81.1-r0 to 0:6.80.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.80.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.81.1-r0 to 0:6.80.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.80.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.81.1-r0 to 0:6.80.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.80.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.81.1-r0 to 0:6.80.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.80.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.81.1-r0 to 0:6.80.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.80.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-hypothesis/6.80.0-r0/temp/log.do_packagedata.1731187
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_packagedata) failed with exit code '1'

--===============1493816058830365508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1806 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1804 targets, 37 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:d127540f8397fe67095254a14d8bea11d99ae7b6"
workspace            = "master:e6d4b610fc24ae009bf6d0710fc429a61a38aa34"

Initialising tasks...done.
Sstate summary: Wanted 48 Local 29 Mirrors 0 Missed 19 Current 473 (60% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1077 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_fetch)
NOTE: Running task 1101 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_fetch)
NOTE: Running task 1276 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_fetch)
NOTE: recipe python3-numpy-1.25.1-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_fetch: Started
NOTE: recipe python3-numpy-1.25.1-r0: task do_fetch: Succeeded
NOTE: Running task 1623 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_unpack)
NOTE: Running task 1624 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_fetch: Started
NOTE: Running task 1625 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_unpack)
NOTE: Running task 1626 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 1690 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_unpack)
NOTE: Running task 1691 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-numpy-1.25.1-r0: task do_unpack: Started
NOTE: recipe python3-numpy-1.25.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_unpack: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1771 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_patch)
NOTE: Running task 1772 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_unpack: Succeeded
NOTE: Running task 1773 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_patch)
NOTE: Running task 1774 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_patch: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-numpy-1.25.1-r0: task do_unpack: Succeeded
NOTE: Running task 1775 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_patch)
NOTE: Running task 1776 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-numpy-1.25.1-r0: task do_patch: Started
NOTE: recipe python3-numpy-1.25.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-numpy-1.25.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-numpy-1.25.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_patch: Succeeded
NOTE: Running task 1777 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_patch: Succeeded
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1778 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.25.1-r0: task do_patch: Succeeded
NOTE: Running task 1779 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1780 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_populate_lic)
NOTE: recipe python3-numpy-1.25.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.25.1-r0: task do_populate_lic: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1781 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_configure)
NOTE: Running task 1782 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_configure)
NOTE: recipe python3-numpy-1.25.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_populate_lic unihash changed to 441f7b2d2b10330a5aff32973aaf649c2892fbb273f4e374b454e00c5f5f8665
NOTE: recipe python3-numpy-1.25.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_configure: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_configure: Started
NOTE: Running task 1783 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_configure)
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_configure: Succeeded
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_configure: Succeeded
NOTE: recipe python3-numpy-1.25.1-r0: task do_configure: Started
NOTE: Running task 1784 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_configure_ptest_base)
NOTE: Running task 1785 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_compile)
NOTE: recipe python3-numpy-1.25.1-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_compile: Started
NOTE: Running task 1786 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_configure_ptest_base)
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1787 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_compile)
NOTE: recipe python3-numpy-1.25.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-1.25.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1788 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_compile)
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_compile: Started
NOTE: recipe python3-numpy-1.25.1-r0: task do_compile: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1789 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_install)
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_compile: Succeeded
NOTE: Running task 1790 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_compile_ptest_base)
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1791 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_install)
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_install: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_install: Succeeded
NOTE: Running task 1792 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_package)
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_install: Succeeded
NOTE: Running task 1793 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_install_ptest_base)
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1794 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_package)
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_package: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_package: Succeeded
NOTE: Running task 1795 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_packagedata)
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_packagedata: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1796 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_create_spdx)
NOTE: Running task 1797 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_package_write_rpm)
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_create_spdx: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_package: Succeeded
NOTE: Running task 1798 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_packagedata: Failed
NOTE: recipe python3-numpy-1.25.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1798 tasks of which 1761 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-hypothesis-6.80.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.81.1-r0 to 0:6.80.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.80.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.81.1-r0 to 0:6.80.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.80.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.81.1-r0 to 0:6.80.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.80.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.81.1-r0 to 0:6.80.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.80.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.81.1-r0 to 0:6.80.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.80.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.81.1-r0 to 0:6.80.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.80.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.81.1-r0 to 0:6.80.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.80.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.81.1-r0 to 0:6.80.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.80.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-hypothesis/6.80.0-r0/temp/log.do_packagedata.1703068
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_packagedata) failed with exit code '1'

--===============1493816058830365508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1804 targets, 64 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:d127540f8397fe67095254a14d8bea11d99ae7b6"
workspace            = "master:e6d4b610fc24ae009bf6d0710fc429a61a38aa34"

Initialising tasks...done.
Sstate summary: Wanted 48 Local 29 Mirrors 0 Missed 19 Current 473 (60% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1077 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_fetch)
NOTE: Running task 1101 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_fetch)
NOTE: Running task 1276 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_fetch)
NOTE: recipe python3-numpy-1.25.1-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_fetch: Started
NOTE: recipe python3-numpy-1.25.1-r0: task do_fetch: Succeeded
NOTE: Running task 1698 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_unpack)
NOTE: Running task 1699 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_fetch: Started
NOTE: Running task 1700 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_unpack)
NOTE: Running task 1701 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 1725 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_unpack)
NOTE: Running task 1726 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-numpy-1.25.1-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_unpack: Started
NOTE: recipe python3-numpy-1.25.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1771 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_patch)
NOTE: Running task 1772 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_unpack: Succeeded
NOTE: Running task 1773 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_patch)
NOTE: Running task 1774 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_patch: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-numpy-1.25.1-r0: task do_unpack: Succeeded
NOTE: Running task 1775 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_patch)
NOTE: Running task 1776 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-numpy-1.25.1-r0: task do_patch: Started
NOTE: recipe python3-numpy-1.25.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-numpy-1.25.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_patch: Succeeded
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_patch: Succeeded
NOTE: recipe python3-numpy-1.25.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1777 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1778 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.25.1-r0: task do_patch: Succeeded
NOTE: Running task 1779 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1780 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_populate_lic)
NOTE: recipe python3-numpy-1.25.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.25.1-r0: task do_populate_lic: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1781 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_configure)
NOTE: Running task 1782 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_configure)
NOTE: recipe python3-numpy-1.25.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_populate_lic unihash changed to 441f7b2d2b10330a5aff32973aaf649c2892fbb273f4e374b454e00c5f5f8665
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_configure: Started
NOTE: recipe python3-numpy-1.25.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_configure: Started
NOTE: Running task 1783 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_configure)
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1784 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_compile)
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_configure: Succeeded
NOTE: Running task 1785 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_configure_ptest_base)
NOTE: recipe python3-numpy-1.25.1-r0: task do_configure: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_compile: Started
NOTE: recipe python3-numpy-1.25.1-r0: task do_configure: Succeeded
NOTE: Running task 1786 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_configure_ptest_base)
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1787 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_compile)
NOTE: recipe python3-numpy-1.25.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-1.25.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1788 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.1.bb:do_compile)
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_compile: Started
NOTE: recipe python3-numpy-1.25.1-r0: task do_compile: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1789 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_install)
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_compile: Succeeded
NOTE: Running task 1790 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_compile_ptest_base)
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1791 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_install)
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_install: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_install: Succeeded
NOTE: Running task 1792 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_package)
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_install: Succeeded
NOTE: Running task 1793 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_install_ptest_base)
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1794 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_package)
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_package: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_package: Succeeded
NOTE: Running task 1795 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_packagedata)
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_packagedata: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1796 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_create_spdx)
NOTE: Running task 1797 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_package_write_rpm)
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_create_spdx: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_package: Succeeded
NOTE: Running task 1798 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.80.0-r0: task do_packagedata: Failed
NOTE: recipe python3-numpy-1.25.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1798 tasks of which 1761 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-hypothesis-6.80.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.81.1-r0 to 0:6.80.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.80.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.81.1-r0 to 0:6.80.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.80.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.81.1-r0 to 0:6.80.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.80.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.81.1-r0 to 0:6.80.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.80.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.81.1-r0 to 0:6.80.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.80.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.81.1-r0 to 0:6.80.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.80.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.81.1-r0 to 0:6.80.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.80.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.81.1-r0 to 0:6.80.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.80.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-hypothesis/6.80.0-r0/temp/log.do_packagedata.1713991
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb:do_packagedata) failed with exit code '1'

--===============1493816058830365508==--

