Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1E22C27C54
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:39 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.5946.1689456455137237129
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=TAaymr1/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101895b73aadd-710bc74e-2656-4294-89ff-9857d31b9071-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456454;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=ETwV/iYPbB6gh1lvssATkgA8xvKIHvC0Fe8YocBns8U=;
	b=TAaymr1/ZonoFMmmYO+nbOQTqH5JDZ9Nu5Wrkc8/igySIS3apTmXBEWtRZxCTSjy
	6+3t7AZFpSC9HfIf00SLYayqa2XmL6C/GIBORxxFKp/nmgz1vIV42vQjGqKr9RRsIa2
	CY9hl8N/eHIxSPBiGW8KEiYHKUPnwtr61uFYZrGY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456454;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=ETwV/iYPbB6gh1lvssATkgA8xvKIHvC0Fe8YocBns8U=;
	b=CFr/mVb5qRY+ogK/b7NnSmjes30ipECxB0PGae/AZeShobfsO5yapl3+VAAphs7y
	Okv/R/N07+u8lKk7T4iVJsh+2Yk8ebE8+sZvjcSbLz16sieBs0dOsgU0k+JskF67DqD
	xtxybF9fRW/cWWBXjmF7D5WtsYIcBarmDU4x6b0g=
Content-Type: multipart/mixed; boundary="===============0409548283904377280=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools: upgrading to 68.0.0 FAILED
Message-ID: <010101895b73aadd-710bc74e-2656-4294-89ff-9857d31b9071-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:34 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184356

--===============0409548283904377280==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-setuptools* to *68.0.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-setuptools-upgrade-67.6.1-68.0.0.patch
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
From 942585b74b76cf33a841e19138f17c4cfdae5899 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 13:16:12 +0000
Subject: [PATCH] python3-setuptools: upgrade 67.6.1 -> 68.0.0

---
 .../0001-conditionally-do-not-fetch-code-by-easy_install.patch  | 2 +-
 ...ython3-setuptools_67.6.1.bb => python3-setuptools_68.0.0.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_67.6.1.bb => python3-setuptools_68.0.0.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index 4d56dc89ba..fb5518b2c8 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From 2b06ca797d3ccc5b195aaa04a085c44bf61d4de3 Mon Sep 17 00:00:00 2001
+From 1f373cfec448461089ecb6b70e04a8e606c70d7e Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
diff --git a/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb b/meta/recipes-devtools/python/python3-setuptools_68.0.0.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-setuptools_67.6.1.bb
rename to meta/recipes-devtools/python/python3-setuptools_68.0.0.bb
index ad0d7cc527..f383550d7a 100644
--- a/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_68.0.0.bb
@@ -11,7 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "257de92a9d50a60b8e22abfcbb771571fde0dbf3ec234463212027a4eeecbe9a"
+SRC_URI[sha256sum] = "baf1fdb41c6da4cd2eae722e135500da913332ab3f2f5c7d33af9b492acb5235"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.39.2


--===============0409548283904377280==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-upgrade-67.6.1-68.0.0.patch"

RnJvbSA5NDI1ODViNzRiNzZjZjMzYTg0MWUxOTEzOGYxN2M0Y2ZkYWU1ODk5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMTM6MTY6MTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNldHVwdG9vbHM6IHVwZ3JhZGUgNjcuNi4xIC0+IDY4LjAuMAoKLS0tCiAuLi4vMDAw
MS1jb25kaXRpb25hbGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWVhc3lfaW5zdGFsbC5wYXRjaCAg
fCAyICstCiAuLi55dGhvbjMtc2V0dXB0b29sc182Ny42LjEuYmIgPT4gcHl0aG9uMy1zZXR1cHRv
b2xzXzY4LjAuMC5iYn0gfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRo
b24zLXNldHVwdG9vbHNfNjcuNi4xLmJiID0+IHB5dGhvbjMtc2V0dXB0b29sc182OC4wLjAuYmJ9
ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXNldHVwdG9vbHMvMDAwMS1jb25kaXRpb25hbGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWVhc3lf
aW5zdGFsbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1
cHRvb2xzLzAwMDEtY29uZGl0aW9uYWxseS1kby1ub3QtZmV0Y2gtY29kZS1ieS1lYXN5X2luc3Rh
bGwucGF0Y2gKaW5kZXggNGQ1NmRjODliYS4uZmI1NTE4YjJjOCAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMvMDAwMS1jb25kaXRpb25h
bGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWVhc3lfaW5zdGFsbC5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy8wMDAxLWNvbmRpdGlvbmFs
bHktZG8tbm90LWZldGNoLWNvZGUtYnktZWFzeV9pbnN0YWxsLnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSAyYjA2Y2E3OTdkM2NjYzViMTk1YWFhMDRhMDg1YzQ0YmY2MWQ0ZGUzIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSAxZjM3M2NmZWM0NDg0NjEwODllY2I2YjcwZTA0YThlNjA2
YzcwZDdlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSG9uZ3h1IEppYSA8aG9uZ3h1
LmppYUB3aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCAxNyBKdWwgMjAxOCAxMDoxMzozOCArMDgw
MAogU3ViamVjdDogW1BBVENIXSBjb25kaXRpb25hbGx5IGRvIG5vdCBmZXRjaCBjb2RlIGJ5IGVh
c3lfaW5zdGFsbApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXNldHVwdG9vbHNfNjcuNi4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXNldHVwdG9vbHNfNjguMC4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzY3LjYu
MS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVw
dG9vbHNfNjguMC4wLmJiCmluZGV4IGFkMGQ3Y2M1MjcuLmYzODM1NTBkN2EgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzY3LjYuMS5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29sc182
OC4wLjAuYmIKQEAgLTExLDcgKzExLDcgQEAgU1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZlID0g
IiBmaWxlOi8vMDAwMS1jb25kaXRpb25hbGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWUKIFNSQ19V
UkkgKz0gIiBcCiAgICAgICAgICAgICBmaWxlOi8vMDAwMS1fZGlzdHV0aWxzLXN5c2NvbmZpZy5w
eS1tYWtlLWl0LXBvc3NpYmxlLXRvLXN1YnN0aXRlLnBhdGNoIgogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiMjU3ZGU5MmE5ZDUwYTYwYjhlMjJhYmZjYmI3NzE1NzFmZGUwZGJmM2VjMjM0NDYzMjEy
MDI3YTRlZWVjYmU5YSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJiYWYxZmRiNDFjNmRhNGNkMmVh
ZTcyMmUxMzU1MDBkYTkxMzMzMmFiM2YyZjVjN2QzM2FmOWI0OTJhY2I1MjM1IgogCiBERVBFTkRT
ICs9ICIke1BZVEhPTl9QTn0iCiAKLS0gCjIuMzkuMgoK

--===============0409548283904377280==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1803 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1803 targets, 37 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:4b9e4cb108eaf27595a04c40c98fa9e709ccdd38"
workspace            = "master:e6d4b610fc24ae009bf6d0710fc429a61a38aa34"

Initialising tasks...done.
Sstate summary: Wanted 133 Local 121 Mirrors 0 Missed 12 Current 268 (90% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 364 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_create_spdx_setscene)
NOTE: Running task 359 of 1387 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_68.0.0.bb:do_fetch)
NOTE: Running task 360 of 1387 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_68.0.0.bb:do_fetch)
NOTE: recipe python3-setuptools-68.0.0-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-68.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 404 of 1387 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_68.0.0.bb:do_unpack)
NOTE: recipe python3-setuptools-native-68.0.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-native-68.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 405 of 1387 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_68.0.0.bb:do_unpack)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 385 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_create_spdx_setscene)
NOTE: recipe python3-setuptools-68.0.0-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-native-68.0.0-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-68.0.0-r0: task do_unpack: Succeeded
NOTE: recipe glibc-2.37-r1: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-native-68.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 408 of 1387 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_68.0.0.bb:do_patch)
NOTE: recipe glibc-2.37-r1: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 392 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-setuptools-native-68.0.0-r0: task do_patch: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-setuptools-native-68.0.0-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 623 tasks of which 618 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_68.0.0.bb:do_patch
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-setuptools-native-68.0.0-r0 do_patch: QA Issue: Fuzz detected:

Applying patch 0001-conditionally-do-not-fetch-code-by-easy_install.patch
patching file setuptools/command/easy_install.py
Hunk #1 succeeded at 644 with fuzz 1 (offset -4 lines).


The context lines in the patches can be updated with devtool:

    devtool modify python3-setuptools-native
    devtool finish --force-patch-refresh python3-setuptools-native <layer_path>

Don't forget to review changes done by devtool!

Patch log indicates that patches do not apply cleanly. [patch-fuzz]
ERROR: python3-setuptools-native-68.0.0-r0 do_patch: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/python3-setuptools-native/68.0.0-r0/temp/log.do_patch.1742348
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_68.0.0.bb:do_patch) failed with exit code '1'

--===============0409548283904377280==--

