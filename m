Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A315FCD8C9D
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:46 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1577.1780328141299016481
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=tDFV3VKC;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=j2OleB4m;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019e83d38f5c-1da9aa4f-2653-4ca5-a3fa-85af3ff73477-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328140;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=eV5OUhc4tOPtZU3/Gub/wPaUXtqiqpetGSwFX/Q4sb0=;
	b=tDFV3VKCaQPsd8PqXt0AHTipcdPYHE3Yw7o8w0LCib2YKAX8fR76XpB2ZtSPBHC1
	4X88LQqD21Sa40QGJIkDQW8uuhgyr7z6B9jlHCS3TjD0h3OYLs6jXtMTfWqnAkbkKQm
	zHDd49EpxsgmOfyL1ZRy2bFkGpXmZ26JZgSNj2PI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328140;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=eV5OUhc4tOPtZU3/Gub/wPaUXtqiqpetGSwFX/Q4sb0=;
	b=j2OleB4m5AoDPX0XwU8Fb09Oww2DcbiFuzgfEHvCD+c+vc0BsbwWWyxB6wY64xSV
	XXoSXXR6MlFSech7cIDIXb87NTbnC112wc5qaejUSuWSpyty+Kg75JiGaRRdhUxgLjB
	ZjS5XI4M1LWv1R/7NQJwSoL5CNZi7P/v4JQ5zLZY=
Content-Type: multipart/mixed; boundary="===============3090922618212073469=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-poetry-core: upgrading to 2.4.1 SUCCEEDED
Message-ID: <0101019e83d38f5c-1da9aa4f-2653-4ca5-a3fa-85af3ff73477-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237890

--===============3090922618212073469==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-poetry-core* to *2.4.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-poetry-core-upgrade-2.3.2-2.4.1.patch
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
From 6ad780969e6bd5863b7a3de32d9d572a1a20c672 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 09:12:55 +0000
Subject: [PATCH] python3-poetry-core: upgrade 2.3.2 -> 2.4.1

---
 ...ython3-poetry-core_2.3.2.bb => python3-poetry-core_2.4.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-poetry-core_2.3.2.bb => python3-poetry-core_2.4.1.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-poetry-core_2.3.2.bb b/meta/recipes-devtools/python/python3-poetry-core_2.4.1.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-poetry-core_2.3.2.bb
rename to meta/recipes-devtools/python/python3-poetry-core_2.4.1.bb
index 0f55368d13..a428214b87 100644
--- a/meta/recipes-devtools/python/python3-poetry-core_2.3.2.bb
+++ b/meta/recipes-devtools/python/python3-poetry-core_2.4.1.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "\
     file://src/poetry/core/_vendor/tomli/LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5 \
 "
 
-SRC_URI[sha256sum] = "20cb71be27b774628da9f384effd9183dfceb53bcef84063248a8672aa47031f"
+SRC_URI[sha256sum] = "89dceb6c10e9c6d8650a16183400e3c9ff9ddee13b0a81023b5575334a2b3744"
 
 inherit python_poetry_core pypi
 
-- 
2.47.1


--===============3090922618212073469==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core: PKGSIZE changed from 2789869 to 3119076 (+12%)
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core: FILELIST: directory renamed /usr/lib/python3.14/site-packages/poetry_core-2.3.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/poetry_core-2.4.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/poetry_core-2.3.2.dist-info -> /usr/lib/python3.14/site-packages/poetry_core-2.4.1.dist-info, added "/usr/lib/python3.14/site-packages/poetry/core/_vendor/packaging/errors.py /usr/lib/python3.14/site-packages/poetry/core/_vendor/packaging/pylock.py /usr/lib/python3.14/site-packages/poetry/core/_vendor/packaging/__pycache__/direct_url.cpython-314.pyc /usr/lib/python3.14/site-packages/poetry/core/_vendor/packaging/dependency_groups.py /usr/lib/python3.14/site-packages/poetry/core/_vendor/packaging/__pycache__/dependency_groups.cpython-314.pyc /usr/lib/python3.14/site-packages/poetry/core/_vendor/packaging/direct_url.py /usr/lib/python3.14/site-packages/poetry/core/_vendor/packaging/__pycache__/
 pylock.cpython-314.pyc /usr/lib/python3.14/site-packages/poetry/core/_vendor/packaging/__pycache__/errors.cpython-314.pyc"
Changes to packages/x86-64-v3-poky-linux/python3-poetry-core (sysroot):
  /usr/lib/python3.14/site-packages/poetry_core-2.3.2.dist-info moved to /usr/lib/python3.14/site-packages/poetry_core-2.4.1.dist-info
  /usr/lib/python3.14/site-packages/poetry/core/_vendor/packaging/dependency_groups.py was added
  /usr/lib/python3.14/site-packages/poetry/core/_vendor/packaging/direct_url.py was added
  /usr/lib/python3.14/site-packages/poetry/core/_vendor/packaging/errors.py was added
  /usr/lib/python3.14/site-packages/poetry/core/_vendor/packaging/__pycache__/dependency_groups.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/poetry/core/_vendor/packaging/__pycache__/direct_url.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/poetry/core/_vendor/packaging/__pycache__/errors.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/poetry/core/_vendor/packaging/__pycache__/pylock.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/poetry/core/_vendor/packaging/pylock.py was added

--===============3090922618212073469==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-poetry-core-upgrade-2.3.2-2.4.1.patch"

RnJvbSA2YWQ3ODA5NjllNmJkNTg2M2I3YTNkZTMyZDlkNTcyYTFhMjBjNjcyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAwOToxMjo1NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcG9ldHJ5LWNvcmU6IHVwZ3JhZGUgMi4zLjIgLT4gMi40LjEKCi0tLQogLi4ueXRob24z
LXBvZXRyeS1jb3JlXzIuMy4yLmJiID0+IHB5dGhvbjMtcG9ldHJ5LWNvcmVfMi40LjEuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1wb2V0cnktY29yZV8yLjMu
Mi5iYiA9PiBweXRob24zLXBvZXRyeS1jb3JlXzIuNC4xLmJifSAoOTMlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wb2V0cnktY29yZV8yLjMuMi5i
YiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wb2V0cnktY29yZV8yLjQu
MS5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcG9ldHJ5LWNvcmVfMi4zLjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wb2V0cnktY29yZV8yLjQuMS5iYgppbmRleCAw
ZjU1MzY4ZDEzLi5hNDI4MjE0Yjg3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcG9ldHJ5LWNvcmVfMi4zLjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXBvZXRyeS1jb3JlXzIuNC4xLmJiCkBAIC0xNSw3ICsxNSw3
IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiXAogICAgIGZpbGU6Ly9zcmMvcG9ldHJ5L2NvcmUvX3Zl
bmRvci90b21saS9MSUNFTlNFO21kNT1hYWFhZjA4NzlkMTdkZjAxMTBkMWFhOGM4YzlmNDZmNSBc
CiAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyMGNiNzFiZTI3Yjc3NDYyOGRhOWYzODRlZmZk
OTE4M2RmY2ViNTNiY2VmODQwNjMyNDhhODY3MmFhNDcwMzFmIgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjg5ZGNlYjZjMTBlOWM2ZDg2NTBhMTYxODM0MDBlM2M5ZmY5ZGRlZTEzYjBhODEwMjNiNTU3
NTMzNGEyYjM3NDQiCiAKIGluaGVyaXQgcHl0aG9uX3BvZXRyeV9jb3JlIHB5cGkKIAotLSAKMi40
Ny4xCgo=

--===============3090922618212073469==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1975 targets, 62 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-0474c95ea51b7c5d1093ea96a007899d4f3467f8"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:0474c95ea51b7c5d1093ea96a007899d4f3467f8"
meta-yocto-bsp       
meta-poky            = "master:d13ca2a2e0f478046d920b8fc7dd3098952b5ad8"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 448 Local 423 Mirrors 0 Missed 25 Current 293 (94% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 318 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_package_qa_setscene)
NOTE: Running setscene task 345 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_82.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 351 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.4.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 357 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 359 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 363 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 364 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 392 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_26.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-82.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-poetry-core-2.4.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-pip-26.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pip-26.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-poetry-core-2.4.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-setuptools-82.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.5-r0: task do_package_qa_setscene: Succeeded
NOTE: Running task 774 of 1900 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.4.1.bb:do_recipe_qa)
NOTE: Running task 779 of 1900 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_26.1.1.bb:do_fetch)
NOTE: recipe python3-3.14.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 402 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 408 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 417 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-poetry-core-2.4.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-pip-26.1.1-r0: task do_fetch: Started
NOTE: recipe python3-pip-26.1.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.14.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running task 879 of 1900 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_26.1.1.bb:do_unpack)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.14.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 418 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 419 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 420 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 421 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 422 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 423 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 424 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 425 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 426 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pip-26.1.1-r0: task do_unpack: Started
NOTE: Running setscene task 428 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.14.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 445 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.46-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-poetry-core-2.4.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_packagedata_setscene: Started
NOTE: Running task 880 of 1900 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.4.1.bb:do_fetch)
NOTE: recipe python3-pip-26.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 881 of 1900 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_26.1.1.bb:do_patch)
NOTE: recipe python3-3.14.5-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-poetry-core-2.4.1-r0: task do_fetch: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 457 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 458 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 461 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-poetry-core-2.4.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pip-26.1.1-r0: task do_patch: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 897 of 1900 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.4.1.bb:do_unpack)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 468 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 473 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-poetry-core-2.4.1-r0: task do_unpack: Started
NOTE: recipe binutils-2.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 480 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pip-26.1.1-r0: task do_patch: Succeeded
NOTE: Running setscene task 488 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running task 921 of 1900 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_26.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-poetry-core-2.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 922 of 1900 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.4.1.bb:do_patch)
NOTE: recipe coreutils-9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-3.14.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 508 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 509 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 510 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 511 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 512 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 513 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 514 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 515 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 516 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 517 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pip-26.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-poetry-core-2.4.1-r0: task do_patch: Started
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 518 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 521 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1021 of 1900 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe expat-2.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-poetry-core-2.4.1-r0: task do_patch: Succeeded
NOTE: Running task 1025 of 1900 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 528 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.5.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 529 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-poetry-core-2.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 532 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 534 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 536 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-1.0.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 537 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 539 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 543 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 544 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 545 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 546 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 553 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 555 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.8.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 561 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 564 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.47.bb:do_packagedata_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pip-26.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_26.1.1.bb:do_deploy_source_date_epoch unihash changed to 1a4a6923a87178f6fd4b2692ac2aa6bd85618f798d7c24a4be0746b74a74173d
NOTE: recipe expat-2.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 558 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 562 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 563 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 565 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 573 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.47-r0: task do_packagedata_setscene: Started
NOTE: Running task 1077 of 1900 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1096 of 1900 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libarchive-3.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 596 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.53.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 599 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_recipe_qa_setscene)
NOTE: Running task 1121 of 1900 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.4.1.bb:do_create_recipe_spdx)
NOTE: Running task 1123 of 1900 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_26.1.1.bb:do_create_recipe_spdx)
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 602 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.13-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe file-5.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 604 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 605 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 606 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-poetry-core-2.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 608 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_packagedata_setscene)
NOTE: recipe python3-poetry-core-2.4.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-pip-26.1.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 609 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 610 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 612 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.12.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running setscene task 616 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.60.bb:do_packagedata_setscene)
NOTE: Running setscene task 617 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 622 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 623 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 624 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 630 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_populate_sysroot_setscene)
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 632 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.60-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 637 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 640 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: recipe python3-poetry-core-2.4.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 642 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 643 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe python3-pip-26.1.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 647 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running task 1175 of 1900 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 652 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 654 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 661 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 663 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.60-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1192 of 1900 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 673 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 677 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 683 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 685 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 689 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1238 of 1900 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 696 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1249 of 1900 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 706 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 708 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 712 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 713 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 715 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 717 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: Running task 1336 of 1900 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 719 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 720 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 721 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 722 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 723 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 728 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 729 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 730 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 734 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 737 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 739 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 741 of 741 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1739 of 1900 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.4.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1740 of 1900 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_26.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-poetry-core-2.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pip-26.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pip-26.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-poetry-core-2.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1870 of 1900 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_26.1.1.bb:do_configure)
NOTE: Running task 1871 of 1900 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.4.1.bb:do_configure)
NOTE: recipe python3-pip-26.1.1-r0: task do_configure: Started
NOTE: recipe python3-poetry-core-2.4.1-r0: task do_configure: Started
NOTE: recipe python3-pip-26.1.1-r0: task do_configure: Succeeded
NOTE: recipe python3-poetry-core-2.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1872 of 1900 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_26.1.1.bb:do_compile)
NOTE: Running task 1873 of 1900 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.4.1.bb:do_compile)
NOTE: recipe python3-pip-26.1.1-r0: task do_compile: Started
NOTE: recipe python3-poetry-core-2.4.1-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1874 of 1900 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: recipe python3-pip-26.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1881 of 1900 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_26.1.1.bb:do_install)
NOTE: recipe python3-pip-26.1.1-r0: task do_install: Started
NOTE: recipe python3-poetry-core-2.4.1-r0: task do_compile: Succeeded
NOTE: Running task 1882 of 1900 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.4.1.bb:do_install)
NOTE: recipe python3-poetry-core-2.4.1-r0: task do_install: Started
NOTE: recipe python3-poetry-core-2.4.1-r0: task do_install: Succeeded
NOTE: Running task 1883 of 1900 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.4.1.bb:do_package)
NOTE: Running task 1884 of 1900 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.4.1.bb:do_populate_sysroot)
NOTE: recipe python3-poetry-core-2.4.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-poetry-core-2.4.1-r0: task do_package: Started
NOTE: recipe python3-poetry-core-2.4.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pip-26.1.1-r0: task do_install: Succeeded
NOTE: Running task 1885 of 1900 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_26.1.1.bb:do_package)
NOTE: Running task 1886 of 1900 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_26.1.1.bb:do_populate_sysroot)
NOTE: recipe python3-pip-26.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pip-26.1.1-r0: task do_package: Started
NOTE: recipe python3-pip-26.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-poetry-core-2.4.1-r0: task do_package: Succeeded
NOTE: Running task 1887 of 1900 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.4.1.bb:do_packagedata)
NOTE: recipe python3-poetry-core-2.4.1-r0: task do_packagedata: Started
NOTE: recipe python3-poetry-core-2.4.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1888 of 1900 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.4.1.bb:do_create_spdx)
NOTE: recipe python3-poetry-core-2.4.1-r0: task do_create_spdx: Started
NOTE: recipe python3-poetry-core-2.4.1-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-pip-26.1.1-r0: task do_package: Succeeded
NOTE: Running task 1889 of 1900 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_26.1.1.bb:do_packagedata)
NOTE: recipe python3-pip-26.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-pip-26.1.1-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1889 tasks of which 1854 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260601091232.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260601091232.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_26.1.1.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-pip/26.1.1/temp/log.do_packagedata.2177277
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-pip-26.1.1-r0 do_packagedata: QA Issue: Package version for package python3-pip-src went backwards which would break package feeds (from 0:26.1.2-r0 to 0:26.1.1-r0) [version-going-backwards]
ERROR: python3-pip-26.1.1-r0 do_packagedata: QA Issue: Package version for package python3-pip-dbg went backwards which would break package feeds (from 0:26.1.2-r0 to 0:26.1.1-r0) [version-going-backwards]
ERROR: python3-pip-26.1.1-r0 do_packagedata: QA Issue: Package version for package python3-pip-staticdev went backwards which would break package feeds (from 0:26.1.2-r0 to 0:26.1.1-r0) [version-going-backwards]
ERROR: python3-pip-26.1.1-r0 do_packagedata: QA Issue: Package version for package python3-pip-dev went backwards which would break package feeds (from 0:26.1.2-r0 to 0:26.1.1-r0) [version-going-backwards]
ERROR: python3-pip-26.1.1-r0 do_packagedata: QA Issue: Package version for package python3-pip-doc went backwards which would break package feeds (from 0:26.1.2-r0 to 0:26.1.1-r0) [version-going-backwards]
ERROR: python3-pip-26.1.1-r0 do_packagedata: QA Issue: Package version for package python3-pip-locale went backwards which would break package feeds (from 0:26.1.2-r0 to 0:26.1.1-r0) [version-going-backwards]
ERROR: python3-pip-26.1.1-r0 do_packagedata: QA Issue: Package version for package python3-pip went backwards which would break package feeds (from 0:26.1.2-r0 to 0:26.1.1-r0) [version-going-backwards]
ERROR: python3-pip-26.1.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-pip/26.1.1/temp/log.do_packagedata.2177277
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_26.1.1.bb:do_packagedata) failed with exit code '1'

--===============3090922618212073469==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-poetry-core: PV changed from "2.3.2" to "2.4.1"
packages/x86-64-v3-poky-linux/python3-poetry-core: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/poetry_core/poetry_core-2.3.2.tar.gz;downloadfilename=poetry_core-2.3.2.tar.gz" to "https://files.pythonhosted.org/packages/source/p/poetry_core/poetry_core-2.4.1.tar.gz;downloadfilename=poetry_core-2.4.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-poetry-core: PKGV changed from 2.3.2 [default] to 2.4.1 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-dbg: PV changed from "2.3.2" to "2.4.1"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-dbg: PKGV changed from 2.3.2 [default] to 2.4.1 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-dev: PV changed from "2.3.2" to "2.4.1"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-dev: PKGV changed from 2.3.2 [default] to 2.4.1 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-doc: PV changed from "2.3.2" to "2.4.1"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-doc: PKGV changed from 2.3.2 [default] to 2.4.1 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-locale: PV changed from "2.3.2" to "2.4.1"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-locale: PKGV changed from 2.3.2 [default] to 2.4.1 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-src: PV changed from "2.3.2" to "2.4.1"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-src: PKGV changed from 2.3.2 [default] to 2.4.1 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-staticdev: PV changed from "2.3.2" to "2.4.1"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-staticdev: PKGV changed from 2.3.2 [default] to 2.4.1 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core: FILELIST: directory renamed /usr/lib/python3.14/site-packages/poetry_core-2.3.2.dist-info -> /usr/lib/python3.14/site-packages/poetry_core-2.4.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/poetry_core-2.3.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/poetry_core-2.4.1.dist-info/licenses, added "/usr/lib/python3.14/site-packages/poetry/core/_vendor/packaging/__pycache__/pylock.cpython-314.pyc /usr/lib/python3.14/site-packages/poetry/core/_vendor/packaging/errors.py /usr/lib/python3.14/site-packages/poetry/core/_vendor/packaging/dependency_groups.py /usr/lib/python3.14/site-packages/poetry/core/_vendor/packaging/__pycache__/dependency_groups.cpython-314.pyc /usr/lib/python3.14/site-packages/poetry/core/_vendor/packaging/pylock.py /usr/lib/python3.14/site-packages/poetry/core/_vendor/packaging/direct_url.py /usr/lib/python3.14/site-packages/poetry/core/_vendor/packaging/__pycache__/erro
 rs.cpython-314.pyc /usr/lib/python3.14/site-packages/poetry/core/_vendor/packaging/__pycache__/direct_url.cpython-314.pyc"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core: PV changed from "2.3.2" to "2.4.1"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core: PKGSIZE changed from 2789869 to 3119076 (+12%)
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core: PKGV changed from 2.3.2 [default] to 2.4.1 [default]
Changes to packages/x86-64-v3-poky-linux/python3-poetry-core (sysroot):
  /usr/lib/python3.14/site-packages/poetry_core-2.3.2.dist-info moved to /usr/lib/python3.14/site-packages/poetry_core-2.4.1.dist-info
  /usr/lib/python3.14/site-packages/poetry/core/_vendor/packaging/dependency_groups.py was added
  /usr/lib/python3.14/site-packages/poetry/core/_vendor/packaging/direct_url.py was added
  /usr/lib/python3.14/site-packages/poetry/core/_vendor/packaging/errors.py was added
  /usr/lib/python3.14/site-packages/poetry/core/_vendor/packaging/__pycache__/dependency_groups.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/poetry/core/_vendor/packaging/__pycache__/direct_url.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/poetry/core/_vendor/packaging/__pycache__/errors.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/poetry/core/_vendor/packaging/__pycache__/pylock.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/poetry/core/_vendor/packaging/pylock.py was added

--===============3090922618212073469==--

