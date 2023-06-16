Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9232C25B77
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:28 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.811.1686887483853747840
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Q+0WmPqd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010188c254465a-f840fc64-c549-477d-8e0c-811a31ff36fe-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887483;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1BucNiW3N1j4tC71vq9yZPgIj5pwKJuF5TqE4YxP+0Y=;
	b=Q+0WmPqdjETVkdPE8RJ/qxWQbqTcJ9WPiHspGonWLgooA2sxbn/COEd+svhzf1Az
	Djwfh6HcGrRpifxaCgq6sFLpR0HZPp3NAdsB5ajhjACE6Pkb7l6UgnJsBHY/nZqs+2A
	/yIvzmQGQJFVJN3S2D4Fz/w1kfDfAFmwaE0dKUbg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887483;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1BucNiW3N1j4tC71vq9yZPgIj5pwKJuF5TqE4YxP+0Y=;
	b=FeQGyetbRv2hng0GCgxydN+SdOwdc3Opt0jBk4JKfXiBd2Ibefa2fwQFK4yELCMK
	fyDvogb5xp8fHrQdQWQCASivsVYu9wSkXV+QGObu/ZB9ZjlSyeG7Fd1zprjQ5+6VUSK
	cNEKPafy5PhcLzmN7XRry1plDuF6FWHG6ApWH8kk=
Content-Type: multipart/mixed; boundary="===============5769718523370363949=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools: upgrading to 67.8.0 FAILED
Message-ID: <01010188c254465a-f840fc64-c549-477d-8e0c-811a31ff36fe-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:23 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182935

--===============5769718523370363949==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-setuptools* to *67.8.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-setuptools-upgrade-67.6.1-67.8.0.patch
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
From 09ab15cf6c3552a42df5a3f761856355c22b9406 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 13:54:07 +0000
Subject: [PATCH] python3-setuptools: upgrade 67.6.1 -> 67.8.0

---
 .../0001-conditionally-do-not-fetch-code-by-easy_install.patch  | 2 +-
 ...ython3-setuptools_67.6.1.bb => python3-setuptools_67.8.0.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_67.6.1.bb => python3-setuptools_67.8.0.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index 4d56dc89ba..547a6c8392 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From 2b06ca797d3ccc5b195aaa04a085c44bf61d4de3 Mon Sep 17 00:00:00 2001
+From 0c742a11d03869e8d610877c425c07acb4063563 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
diff --git a/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb b/meta/recipes-devtools/python/python3-setuptools_67.8.0.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-setuptools_67.6.1.bb
rename to meta/recipes-devtools/python/python3-setuptools_67.8.0.bb
index ad0d7cc527..f9a81491b2 100644
--- a/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_67.8.0.bb
@@ -11,7 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "257de92a9d50a60b8e22abfcbb771571fde0dbf3ec234463212027a4eeecbe9a"
+SRC_URI[sha256sum] = "62642358adc77ffa87233bc4d2354c4b2682d214048f500964dbe760ccedf102"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.39.2


--===============5769718523370363949==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1801 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1801 targets, 36 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:5234ecf3bd79473420ce588a2cdcf1de771b284d"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 128 Local 116 Mirrors 0 Missed 12 Current 273 (90% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 369 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_create_spdx_setscene)
NOTE: Running task 864 of 1387 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.8.0.bb:do_fetch)
NOTE: Running task 865 of 1387 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.8.0.bb:do_fetch)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-67.8.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-67.8.0-r0: task do_fetch: Succeeded
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 987 of 1387 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.8.0.bb:do_unpack)
NOTE: recipe python3-setuptools-native-67.8.0-r0: task do_fetch: Started
NOTE: Running setscene task 386 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_create_spdx_setscene)
NOTE: recipe python3-setuptools-native-67.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 990 of 1387 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.8.0.bb:do_unpack)
NOTE: Running task 991 of 1387 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-setuptools-67.8.0-r0: task do_unpack: Started
NOTE: recipe glibc-2.37-r1: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-native-67.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-native-67.8.0-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-67.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 992 of 1387 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.8.0.bb:do_patch)
NOTE: recipe glibc-2.37-r1: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 393 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-setuptools-native-67.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 1008 of 1387 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.8.0.bb:do_patch)
NOTE: Running task 1009 of 1387 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.8.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-setuptools-67.8.0-r0: task do_patch: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-native-67.8.0-r0: task do_patch: Started
NOTE: recipe python3-setuptools-native-67.8.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-setuptools-native-67.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-67.8.0-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-native-67.8.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1255 of 1387 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.8.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1323 of 1387 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.8.0.bb:do_create_spdx)
NOTE: Running task 1369 of 1387 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.8.0.bb:do_populate_lic)
NOTE: recipe python3-setuptools-67.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-67.8.0-r0: task do_populate_lic: Started
NOTE: recipe python3-setuptools-67.8.0-r0: task do_populate_lic: Failed
NOTE: recipe python3-setuptools-native-67.8.0-r0: task do_patch: Failed
NOTE: recipe python3-setuptools-native-67.8.0-r0: task do_create_spdx: Started
NOTE: recipe python3-setuptools-67.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-setuptools-native-67.8.0-r0: task do_create_spdx: Succeeded
NOTE: Tasks Summary: Attempted 1369 tasks of which 1358 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 2 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.8.0.bb:do_populate_lic
  virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.8.0.bb:do_patch
Summary: There was 1 WARNING message.
Summary: There were 4 ERROR messages, returning a non-zero exit code.
ERROR: python3-setuptools-67.8.0-r0 do_populate_lic: QA Issue: python3-setuptools: The LIC_FILES_CHKSUM does not match for file://LICENSE;beginline=1;endline=19;md5=7a7126e068206290f3fe9f8d6c713ea6
python3-setuptools: The new md5 checksum is 141643e11c48898150daa83802dbc65f
python3-setuptools: Here is the selected license text:
vvvvvvvvvvvvvvvvvvvvvvvvvvvv beginline=1 vvvvvvvvvvvvvvvvvvvvvvvvvvvvv
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to
deal in the Software without restriction, including without limitation the
rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
sell copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
IN THE SOFTWARE.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ endline=19 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
python3-setuptools: Check if the license information has changed in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-setuptools/67.8.0-r0/setuptools-67.8.0/LICENSE (lines 1 through to 19) to verify that the LICENSE value "MIT" remains valid [license-checksum]
ERROR: python3-setuptools-67.8.0-r0 do_populate_lic: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-setuptools/67.8.0-r0/temp/log.do_populate_lic.30865
ERROR: python3-setuptools-native-67.8.0-r0 do_patch: QA Issue: Fuzz detected:

Applying patch 0001-conditionally-do-not-fetch-code-by-easy_install.patch
patching file setuptools/command/easy_install.py
Hunk #1 succeeded at 644 with fuzz 1 (offset -4 lines).


The context lines in the patches can be updated with devtool:

    devtool modify python3-setuptools-native
    devtool finish --force-patch-refresh python3-setuptools-native <layer_path>

Don't forget to review changes done by devtool!

Patch log indicates that patches do not apply cleanly. [patch-fuzz]
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.8.0.bb:do_populate_lic) failed with exit code '1'
ERROR: python3-setuptools-native-67.8.0-r0 do_patch: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/python3-setuptools-native/67.8.0-r0/temp/log.do_patch.29527
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.8.0.bb:do_patch) failed with exit code '1'

--===============5769718523370363949==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-upgrade-67.6.1-67.8.0.patch"

RnJvbSAwOWFiMTVjZjZjMzU1MmE0MmRmNWEzZjc2MTg1NjM1NWMyMmI5NDA2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMTM6NTQ6MDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNldHVwdG9vbHM6IHVwZ3JhZGUgNjcuNi4xIC0+IDY3LjguMAoKLS0tCiAuLi4vMDAw
MS1jb25kaXRpb25hbGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWVhc3lfaW5zdGFsbC5wYXRjaCAg
fCAyICstCiAuLi55dGhvbjMtc2V0dXB0b29sc182Ny42LjEuYmIgPT4gcHl0aG9uMy1zZXR1cHRv
b2xzXzY3LjguMC5iYn0gfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRo
b24zLXNldHVwdG9vbHNfNjcuNi4xLmJiID0+IHB5dGhvbjMtc2V0dXB0b29sc182Ny44LjAuYmJ9
ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXNldHVwdG9vbHMvMDAwMS1jb25kaXRpb25hbGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWVhc3lf
aW5zdGFsbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1
cHRvb2xzLzAwMDEtY29uZGl0aW9uYWxseS1kby1ub3QtZmV0Y2gtY29kZS1ieS1lYXN5X2luc3Rh
bGwucGF0Y2gKaW5kZXggNGQ1NmRjODliYS4uNTQ3YTZjODM5MiAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMvMDAwMS1jb25kaXRpb25h
bGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWVhc3lfaW5zdGFsbC5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy8wMDAxLWNvbmRpdGlvbmFs
bHktZG8tbm90LWZldGNoLWNvZGUtYnktZWFzeV9pbnN0YWxsLnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSAyYjA2Y2E3OTdkM2NjYzViMTk1YWFhMDRhMDg1YzQ0YmY2MWQ0ZGUzIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwYzc0MmExMWQwMzg2OWU4ZDYxMDg3N2M0MjVjMDdhY2I0
MDYzNTYzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSG9uZ3h1IEppYSA8aG9uZ3h1
LmppYUB3aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCAxNyBKdWwgMjAxOCAxMDoxMzozOCArMDgw
MAogU3ViamVjdDogW1BBVENIXSBjb25kaXRpb25hbGx5IGRvIG5vdCBmZXRjaCBjb2RlIGJ5IGVh
c3lfaW5zdGFsbApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXNldHVwdG9vbHNfNjcuNi4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXNldHVwdG9vbHNfNjcuOC4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzY3LjYu
MS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVw
dG9vbHNfNjcuOC4wLmJiCmluZGV4IGFkMGQ3Y2M1MjcuLmY5YTgxNDkxYjIgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzY3LjYuMS5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29sc182
Ny44LjAuYmIKQEAgLTExLDcgKzExLDcgQEAgU1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZlID0g
IiBmaWxlOi8vMDAwMS1jb25kaXRpb25hbGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWUKIFNSQ19V
UkkgKz0gIiBcCiAgICAgICAgICAgICBmaWxlOi8vMDAwMS1fZGlzdHV0aWxzLXN5c2NvbmZpZy5w
eS1tYWtlLWl0LXBvc3NpYmxlLXRvLXN1YnN0aXRlLnBhdGNoIgogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiMjU3ZGU5MmE5ZDUwYTYwYjhlMjJhYmZjYmI3NzE1NzFmZGUwZGJmM2VjMjM0NDYzMjEy
MDI3YTRlZWVjYmU5YSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI2MjY0MjM1OGFkYzc3ZmZhODcy
MzNiYzRkMjM1NGM0YjI2ODJkMjE0MDQ4ZjUwMDk2NGRiZTc2MGNjZWRmMTAyIgogCiBERVBFTkRT
ICs9ICIke1BZVEhPTl9QTn0iCiAKLS0gCjIuMzkuMgoK

--===============5769718523370363949==--

