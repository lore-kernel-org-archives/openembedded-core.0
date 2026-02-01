Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8432DD172B7
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 13:12:56 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29195.1769951570620232642
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 05:12:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=3qpgJuQF;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=HwziDqbS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019c1955a888-929c6c01-b167-4281-9a0c-0c1c34e32673-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769951570;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=R1Gu/byvxJ1QnAMPipUAdcxXGs1v/050+u/MMpT8CeI=;
	b=3qpgJuQFvM2oJ7DdC4ZgEQF4D4ycl2qXV71UtklLPzhAunSS9diJTihCiA3rfsj7
	QPQ4LB2BFs8Xjh1DVPHZf+IKN37zq92IAmwEmXt2vUqMDBAe4UqBQL7SUBE/Q7M85g8
	jQ1Otdc55L3SMJL8MZ7gqUhqIkhoGrjgmTzXcZVg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769951570;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=R1Gu/byvxJ1QnAMPipUAdcxXGs1v/050+u/MMpT8CeI=;
	b=HwziDqbSbjtDEwYLKhrEKrAmF9FPRquZO2h8FmVLRb5TyngWlodrff5JbTzjcCVe
	/OtEZ9Io6e2plwwKBN7yu5FcKc1HETwOjxOxzRFDyC5JTdVen6bFHpCxi7xlvyNyt6V
	OnoWNdRdunRrg8MkFSpWMXsVwSWu4AoQUCEqVe4I=
Content-Type: multipart/mixed; boundary="===============5390160698776284545=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-numpy: upgrading to 2.4.1 SUCCEEDED
Message-ID: <0101019c1955a888-929c6c01-b167-4281-9a0c-0c1c34e32673-000000@us-west-2.amazonses.com>
Date: Sun, 1 Feb 2026 13:12:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 13:12:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230287

--===============5390160698776284545==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-numpy* to *2.4.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-numpy-upgrade-2.3.5-2.4.1.patch
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
From d085b52ba2154f495b941dfb3fecc5762732e334 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Feb 2026 08:26:07 +0000
Subject: [PATCH] python3-numpy: upgrade 2.3.5 -> 2.4.1

---
 ...1-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch | 2 +-
 .../python/python3-numpy/fix_reproducibility.patch              | 2 +-
 .../python/{python3-numpy_2.3.5.bb => python3-numpy_2.4.1.bb}   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-numpy_2.3.5.bb => python3-numpy_2.4.1.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch b/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
index 3a77ffa4e0..d7aa298299 100644
--- a/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
+++ b/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
@@ -1,4 +1,4 @@
-From 5cb7316128845e3da1ce1618a42b2e3222b59ba9 Mon Sep 17 00:00:00 2001
+From 52183191603a1829dc4c8f7c3572edb7ee791f6d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 10 Dec 2015 13:20:30 +0200
 Subject: [PATCH] Don't search /usr and so on for libraries by default to
diff --git a/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch b/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
index 71b3634b77..4c33c3f0ab 100644
--- a/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
+++ b/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
@@ -1,4 +1,4 @@
-From 6fd79cbe7ae9f0a7a5fc4e5cd6c5c3da9ea09815 Mon Sep 17 00:00:00 2001
+From 1bbd3ca94933b740740fab7b630359bae130de10 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 29 Sep 2023 22:53:24 +0100
 Subject: [PATCH] This regex decides whether to use O3 opimisation on numpy or
diff --git a/meta/recipes-devtools/python/python3-numpy_2.3.5.bb b/meta/recipes-devtools/python/python3-numpy_2.4.1.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-numpy_2.3.5.bb
rename to meta/recipes-devtools/python/python3-numpy_2.4.1.bb
index 55b8091ff8..2555627858 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.3.5.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.4.1.bb
@@ -12,7 +12,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://fix_reproducibility.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "784db1dcdab56bf0517743e746dfb0f885fc68d948aba86eeec2cba234bdf1c0"
+SRC_URI[sha256sum] = "a1ceafc5042451a858231588a104093474c6a5c57dcc724841f5c888d237d690"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
-- 
2.47.1


--===============5390160698776284545==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy: FILELIST: removed "/usr/lib/python3.14/site-packages/numpy-2.3.5.dist-info/entry_points.txt /usr/lib/python3.14/site-packages/numpy-2.3.5.dist-info/WHEEL /usr/lib/python3.14/site-packages/numpy/linalg/__pycache__/linalg.cpython-314.pyc /usr/lib/python3.14/site-packages/numpy/fft/__pycache__/helper.cpython-314.pyc /usr/lib/python3.14/site-packages/numpy/linalg/linalg.pyi /usr/lib/python3.14/site-packages/numpy/_core/_machar.pyi /usr/lib/python3.14/site-packages/numpy/fft/helper.py /usr/lib/python3.14/site-packages/numpy-2.3.5.dist-info/LICENSE.txt /usr/lib/python3.14/site-packages/numpy/_core/__pycache__/_machar.cpython-314.pyc /usr/lib/python3.14/site-packages/numpy/fft/helper.pyi /usr/lib/python3.14/site-packages/numpy/_core/tests/test_machar.py /usr/lib/python3.14/site-packages/numpy/typing/tests/data/pass/simple_py3.py /usr/lib/python3.14/site-packages/numpy-2.3.5.dist-info/METADATA /usr/lib/python3.14/site-packages/numpy/
 linalg/linalg.py /usr/lib/python3.14/site-packages/numpy/typing/tests/data/pass/__pycache__/simple_py3.cpython-314.pyc /usr/lib/python3.14/site-packages/numpy/_core/tests/__pycache__/test_machar.cpython-314.pyc /usr/lib/python3.14/site-packages/numpy/_core/_machar.py", added "/usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/splitmix64/LICENSE.md /usr/lib/python3.14/site-packages/numpy/_core/_umath_tests.pyi /usr/lib/python3.14/site-packages/numpy/_core/tests/__pycache__/test_finfo.cpython-314.pyc /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/philox/LICENSE.md /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/include/numpy/libdivide/LICENSE.txt /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/common/pythoncapi-compat/COPYING /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/highway/LICENSE /usr/lib/python3.14/site-packages/nump
 y/typing/__init__.pyi /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/ma/LICENSE /usr/lib/python3.14/site-packages/numpy/ma/testutils.pyi /usr/lib/python3.14/site-packages/numpy/_core/tests/__pycache__/test_multiprocessing.cpython-314.pyc /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/LICENSE.txt /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/mt19937/LICENSE.md /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/fft/pocketfft/LICENSE.md /usr/lib/python3.14/site-packages/numpy/_core/tests/test_multiprocessing.py /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/WHEEL /usr/lib/python3.14/site-packages/numpy/_core/tests/test_finfo.py /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/umath/svml/LICENSE /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/entry_points.txt /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/mul
 tiarray/dragon4_LICENSE.txt /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/LICENSE.md /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/pcg64/LICENSE.md /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/sfc64/LICENSE.md /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/npysort/x86-simd-sort/LICENSE.md /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/linalg/lapack_lite/LICENSE.txt /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/distributions/LICENSE.md /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/METADATA"
Changes to packages/x86-64-v3-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.14/site-packages/numpy-2.3.5.dist-info moved to /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/include was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/include/numpy was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/include/numpy/libdivide was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/include/numpy/libdivide/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/common was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/common/pythoncapi-compat was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/common/pythoncapi-compat/COPYING was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/highway was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/highway/LICENSE was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/multiarray was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/multiarray/dragon4_LICENSE.txt was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/npysort was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/npysort/x86-simd-sort was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/npysort/x86-simd-sort/LICENSE.md was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/umath was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/umath/svml was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/umath/svml/LICENSE was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/fft was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/fft/pocketfft was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/fft/pocketfft/LICENSE.md was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/linalg was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/linalg/lapack_lite was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/linalg/lapack_lite/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/ma was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/ma/LICENSE was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/LICENSE.md was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/distributions was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/distributions/LICENSE.md was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/mt19937 was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/mt19937/LICENSE.md was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/pcg64 was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/pcg64/LICENSE.md was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/philox was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/philox/LICENSE.md was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/sfc64 was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/sfc64/LICENSE.md was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/splitmix64 was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/splitmix64/LICENSE.md was added
  /usr/lib/python3.14/site-packages/numpy/_core/tests/__pycache__/test_finfo.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/numpy/_core/tests/__pycache__/test_multiprocessing.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/numpy/_core/tests/test_finfo.py was added
  /usr/lib/python3.14/site-packages/numpy/_core/tests/test_multiprocessing.py was added
  /usr/lib/python3.14/site-packages/numpy/_core/_umath_tests.pyi was added
  /usr/lib/python3.14/site-packages/numpy/ma/testutils.pyi was added
  /usr/lib/python3.14/site-packages/numpy/typing/__init__.pyi was added
  /usr/lib/python3.14/site-packages/numpy-2.3.5.dist-info/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/numpy/_core/_machar.py was removed
  /usr/lib/python3.14/site-packages/numpy/_core/_machar.pyi was removed
  /usr/lib/python3.14/site-packages/numpy/_core/__pycache__/_machar.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/numpy/_core/tests/__pycache__/test_machar.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/numpy/_core/tests/test_machar.py was removed
  /usr/lib/python3.14/site-packages/numpy/fft/helper.py was removed
  /usr/lib/python3.14/site-packages/numpy/fft/helper.pyi was removed
  /usr/lib/python3.14/site-packages/numpy/fft/__pycache__/helper.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/numpy/linalg/linalg.py was removed
  /usr/lib/python3.14/site-packages/numpy/linalg/linalg.pyi was removed
  /usr/lib/python3.14/site-packages/numpy/linalg/__pycache__/linalg.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/numpy/typing/tests/data/pass/__pycache__/simple_py3.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/numpy/typing/tests/data/pass/simple_py3.py was removed

--===============5390160698776284545==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1958 targets, 71 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-35f926c42d5bd5676a720b495c4b7902e1d46b08"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 = "tmp-auh-upgrades:35f926c42d5bd5676a720b495c4b7902e1d46b08"
meta-yocto-bsp       
meta-poky            = "master:de4abc0a175af12eacc761a2e1e60ca7fdfeaa1b"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: Initial setup loop progress: 142 of 2242 in 30.18466281890869
NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 525 Local 484 Mirrors 0 Missed 41 Current 284 (92% match, 94% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 289 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 292 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 296 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 298 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 316 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.150.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 323 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_package_qa_setscene)
NOTE: Running setscene task 329 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 330 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 331 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 337 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.150.3.bb:do_package_qa_setscene)
NOTE: Running setscene task 342 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 352 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 353 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 354 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 356 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 358 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_package_write_deb_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-hypothesis-6.150.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-hypothesis-6.150.3-r0: task do_package_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pytest-9.0.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pytest-9.0.2-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 363 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 370 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.2.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 380 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.150.3.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 382 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_write_deb_setscene)
NOTE: recipe python3-hypothesis-6.150.3-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 386 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-hypothesis-6.150.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 387 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 401 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 403 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.150.3.bb:do_package_write_deb_setscene)
NOTE: recipe python3-pytest-9.0.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 406 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.2.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-pytest-9.0.2-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-3.14.2-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 412 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 414 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 415 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.150.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 419 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_create_spdx_setscene)
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pytest-9.0.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-hypothesis-6.150.3-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-hypothesis-6.150.3-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pytest-9.0.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-9.0.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-hypothesis-6.150.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 421 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pytest-9.0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 425 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 438 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 439 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 440 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-hypothesis-6.150.3-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.150.3-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-3.14.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.14.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pytest-9.0.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pytest-9.0.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.150.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 441 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 442 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 444 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 445 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 446 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 448 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 450 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 451 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.150.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 452 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ninja-1.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 453 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_packagedata_setscene)
NOTE: recipe python3-numpy-2.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 455 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 456 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_packagedata_setscene)
NOTE: recipe python3-colorama-0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-numpy-2.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ninja-1.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 458 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 462 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_25.4.0.bb:do_packagedata_setscene)
NOTE: recipe python3-pygments-2.19.2-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.45.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.150.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-25.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 463 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_packagedata_setscene)
NOTE: recipe python3-pygments-2.19.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-9.0.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 464 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe python3-attrs-25.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 473 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 475 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 485 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_recipe_qa_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-hypothesis/6.150.3/temp/log.do_packagedata_setscene.1662990
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.150.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 491 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.150.3.bb:do_package_setscene)
NOTE: recipe coreutils-9.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-25.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-9.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.45.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-attrs-25.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 503 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_packagedata_setscene)
NOTE: Running setscene task 512 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 514 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 533 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 535 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 542 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 545 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 552 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 553 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-9.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pytest-9.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 561 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 563 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 570 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 574 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 575 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 576 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 577 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 582 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 587 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 588 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: Running task 878 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.1.bb:do_fetch)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 942 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 953 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.1.bb:do_write_config)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: Running task 1058 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.1.bb:do_recipe_qa)
NOTE: Running task 1060 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_fetch)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: Running task 1148 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_fetch)
NOTE: recipe python3-numpy-2.4.1-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe python3-numpy-2.4.1-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1240 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.1.bb:do_unpack)
NOTE: recipe python3-numpy-2.4.1-r0: task do_write_config: Started
NOTE: Running task 1241 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1242 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe meson-1.10.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_fetch: Started
NOTE: recipe libarchive-3.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 603 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.150.3-r0: task do_package_setscene: Started
NOTE: recipe ninja-1.13.2-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 619 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 622 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 626 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 627 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.18.0.bb:do_packagedata_setscene)
NOTE: Running task 1311 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_unpack)
NOTE: recipe python3-numpy-2.4.1-r0: task do_write_config: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe python3-numpy-2.4.1-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gnutls-3.8.11-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1325 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_unpack: Succeeded
NOTE: Running task 1327 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_patch)
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 635 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_packagedata_setscene)
NOTE: Running setscene task 637 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_packagedata_setscene)
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 642 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: recipe ninja-1.13.2-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1338 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: Running setscene task 648 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe curl-8.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.58-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1350 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe ninja-1.13.2-r0: task do_unpack: Started
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_patch: Succeeded
NOTE: recipe gnutls-3.8.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1351 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 653 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 655 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 656 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 659 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.150.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 666 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 667 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 669 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.150.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1362 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 671 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.58-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.150.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe python3-3.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 682 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe python3-hypothesis-6.150.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1388 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 695 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe ninja-1.13.2-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1404 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_patch)
NOTE: recipe python3-numpy-2.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 1405 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.1.bb:do_patch)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ninja-1.13.2-r0: task do_patch: Started
NOTE: recipe python3-3.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 701 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 702 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 703 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 704 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 705 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 706 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 707 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 708 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-numpy-2.4.1-r0: task do_patch: Started
NOTE: Running setscene task 709 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 710 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: recipe ninja-1.13.2-r0: task do_patch: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 711 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 712 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 713 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 714 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.2.bb:do_packagedata_setscene)
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 715 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 716 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 717 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 718 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-numpy-2.4.1-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 719 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 720 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 721 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.51.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.51.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 728 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 731 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 738 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 744 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 746 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 748 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1422 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe sqlite3-3_3.51.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 750 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.2.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 752 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 753 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 756 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 758 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 759 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.51.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-numpy-2.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 762 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe meson-1.10.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 763 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 765 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.51.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1448 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.1.bb:do_fetch)
NOTE: Running task 1449 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 767 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1461 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1462 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.1.bb:do_populate_lic)
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 768 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe meson-1.10.1-r0: task do_fetch: Started
NOTE: Running setscene task 773 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ninja-1.13.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe meson-1.10.1-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: Running task 1478 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.1.bb:do_unpack)
NOTE: recipe python3-numpy-2.4.1-r0: task do_populate_lic: Started
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe meson-1.10.1-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 775 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 777 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 778 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 780 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe meson-1.10.1-r0: task do_unpack: Succeeded
NOTE: Running task 1505 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.1.bb:do_patch)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe meson-1.10.1-r0: task do_patch: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 782 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 783 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 784 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe meson-1.10.1-r0: task do_patch: Succeeded
NOTE: Running task 1506 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 786 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_package_setscene)
NOTE: recipe meson-1.10.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 787 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 788 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_package_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_deploy_source_date_epoch unihash changed to 14c3da509de6ca7f88b4235abf770193bc9f8e914abf35976c8102245136ed78
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-numpy-2.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ninja-1.13.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-numpy-2.4.1-r0: task do_populate_lic: Succeeded
NOTE: recipe meson-1.10.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_package_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.1.bb:do_deploy_source_date_epoch unihash changed to c04dc417f18f541ac5ba3a380d3eff2efead8f2eba829d5c9e413afa7e2e58ca
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_deploy_source_date_epoch unihash changed to 70ac6b7a48a890b33adaa8fc9fdd10546d7b9ab5ba4a1edc8b3becae48504738
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.1.bb:do_populate_lic unihash changed to 5f11b3b84109b404242a20313e3e0dbdcb0fcab22d4a73e86bb41d9dc6d6ce78
NOTE: Running setscene task 772 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 773 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 774 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 778 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 784 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 787 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 788 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running task 1522 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe musl-1.2.5+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe musl-1.2.5+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 800 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 805 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 807 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 809 of 809 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1838 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1974 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1975 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2011 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.150.3.bb:do_packagedata)
NOTE: Running task 2059 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2143 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-numpy-2.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2152 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2153 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.1.bb:do_collect_spdx_deps)
NOTE: recipe meson-1.10.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2178 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_package_write_ipk)
NOTE: Running task 2179 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_package_write_deb)
NOTE: recipe python3-hypothesis-6.150.3-r0: task do_packagedata: Started
NOTE: recipe ninja-1.13.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2180 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm)
NOTE: Running task 2181 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_package_qa)
NOTE: recipe python3-numpy-2.4.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe meson-1.10.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_deb: Started
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_ipk: Started
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_rpm: Started
NOTE: recipe musl-1.2.5+git-r0: task do_package_qa: Started
NOTE: recipe ninja-1.13.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running noexec task 2182 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_configure)
NOTE: Running task 2183 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_compile)
NOTE: recipe ninja-1.13.2-r0: task do_compile: Started
NOTE: recipe meson-1.10.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe meson-1.10.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-numpy-2.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-numpy-2.4.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2184 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.1.bb:do_configure)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2185 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.1.bb:do_configure)
NOTE: Running task 2186 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_configure)
NOTE: recipe meson-1.10.1-r0: task do_configure: Started
NOTE: recipe python3-numpy-2.4.1-r0: task do_configure: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_configure: Started
NOTE: recipe meson-1.10.1-r0: task do_configure: Succeeded
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_configure: Succeeded
NOTE: recipe python3-numpy-2.4.1-r0: task do_configure: Succeeded
NOTE: Running task 2187 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_compile)
NOTE: Running task 2188 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.1.bb:do_configure_ptest_base)
NOTE: Running task 2189 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.1.bb:do_compile)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_compile: Started
NOTE: recipe python3-numpy-2.4.1-r0: task do_configure_ptest_base: Started
NOTE: recipe meson-1.10.1-r0: task do_compile: Started
NOTE: recipe python3-numpy-2.4.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2190 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.1.bb:do_compile)
NOTE: recipe python3-numpy-2.4.1-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 0873286c2467e40c2b12ebffd5a4ef2f2b3bc36c226ee2078761e8d3279e059d to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '5421bd84c50a142ecd52b83d9608da1797e0af78d8c789eefc467abdcc38272a', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '0873286c2467e40c2b12ebffd5a4ef2f2b3bc36c226ee2078761e8d3279e059d'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 5421bd84c50a142ecd52b83d9608da1797e0af78d8c789eefc467abdcc38272a -> 0873286c2467e40c2b12ebffd5a4ef2f2b3bc36c226ee2078761e8d3279e059d as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe python3-hypothesis-6.150.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_compile: Succeeded
NOTE: Running task 2193 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_install)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_install: Started
NOTE: recipe meson-1.10.1-r0: task do_compile: Succeeded
NOTE: Running task 2210 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.1.bb:do_install)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_install: Succeeded
NOTE: Running task 2211 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_package)
NOTE: Running task 2212 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_populate_sysroot)
NOTE: recipe meson-1.10.1-r0: task do_install: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_package: Started
NOTE: recipe ninja-1.13.2-r0: task do_compile: Succeeded
NOTE: Running task 2213 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_install)
NOTE: recipe ninja-1.13.2-r0: task do_install: Started
NOTE: recipe ninja-1.13.2-r0: task do_install: Succeeded
NOTE: Running task 2214 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_package)
NOTE: recipe ninja-1.13.2-r0: task do_package: Started
NOTE: recipe musl-1.2.5+git-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_package_qa unihash changed to d4ca3d9131cd31ba4e937dcc8be683d5704e25d5ba2fb816816d7f6be31d1ec6
NOTE: recipe meson-1.10.1-r0: task do_install: Succeeded
NOTE: Running task 2215 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.1.bb:do_package)
NOTE: Running task 2216 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.1.bb:do_populate_sysroot)
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm unihash changed to 90ecc080a6ef66c18942c1f9ece1ad5058bdf0e2e56ca449225b47b101b23176
NOTE: recipe meson-1.10.1-r0: task do_populate_sysroot: Started
NOTE: recipe meson-1.10.1-r0: task do_package: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_package_write_deb unihash changed to 0884e0ad9964ce1daa5189ac1ce8d1f47af2e4923f1a8ab67c09b28a58552c45
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_package_write_ipk unihash changed to 4a14617e72ccb78adbda0020fb388c331355817f2c623f552215cbc91a5458e6
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_package: Succeeded
NOTE: Running task 2217 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_packagedata)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_packagedata: Started
NOTE: recipe ninja-1.13.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_package unihash changed to 4f0d4a85f37963de012287ee267cf2b49e4bf31f7f1093be68361ab359fccf11
NOTE: recipe meson-1.10.1-r0: task do_populate_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2218 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_packagedata)
NOTE: recipe ninja-1.13.2-r0: task do_packagedata: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2219 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_create_spdx)
NOTE: Running task 2220 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_package_write_ipk)
NOTE: Running task 2221 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_package_write_deb)
NOTE: Running task 2222 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_package_write_rpm)
NOTE: Running task 2223 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_package_qa)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_create_spdx: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_package_qa: Started
NOTE: recipe meson-1.10.1-r0: task do_package: Succeeded
NOTE: Running task 2224 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.1.bb:do_packagedata)
NOTE: recipe meson-1.10.1-r0: task do_packagedata: Started
NOTE: recipe ninja-1.13.2-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_packagedata unihash changed to f8b24d7a8170c55d4e3c19cb482fce6c64244f26234494330b59579598a353ee
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_package_qa unihash changed to 941403d83423f0772317c15c76c2b9e51121922ad6aaccffb488925ef0a2ab82
NOTE: Setscene tasks completed
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe meson-1.10.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2225 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.1.bb:do_create_spdx)
NOTE: Running task 2226 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.1.bb:do_package_write_ipk)
NOTE: Running task 2227 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.1.bb:do_package_write_deb)
NOTE: Running task 2228 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.1.bb:do_package_write_rpm)
NOTE: Running task 2229 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.1.bb:do_package_qa)
NOTE: recipe meson-1.10.1-r0: task do_create_spdx: Started
NOTE: recipe meson-1.10.1-r0: task do_package_write_ipk: Started
NOTE: recipe meson-1.10.1-r0: task do_package_write_deb: Started
NOTE: recipe meson-1.10.1-r0: task do_package_write_rpm: Started
NOTE: recipe meson-1.10.1-r0: task do_package_qa: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe meson-1.10.1-r0: task do_create_spdx: Succeeded
NOTE: recipe meson-1.10.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe meson-1.10.1-r0: task do_package_write_ipk: Succeeded
NOTE: recipe meson-1.10.1-r0: task do_package_qa: Succeeded
NOTE: recipe meson-1.10.1-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-numpy-2.4.1-r0: task do_compile: Succeeded
NOTE: Running task 2230 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.1.bb:do_compile_ptest_base)
NOTE: recipe python3-numpy-2.4.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-numpy-2.4.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2231 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.1.bb:do_install)
NOTE: recipe python3-numpy-2.4.1-r0: task do_install: Started
NOTE: recipe python3-numpy-2.4.1-r0: task do_install: Succeeded
NOTE: Running task 2232 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.1.bb:do_install_ptest_base)
NOTE: recipe python3-numpy-2.4.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-numpy-2.4.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2233 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.1.bb:do_package)
NOTE: Running task 2234 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.1.bb:do_populate_sysroot)
NOTE: recipe python3-numpy-2.4.1-r0: task do_package: Started
NOTE: recipe python3-numpy-2.4.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-numpy-2.4.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-numpy-2.4.1-r0: task do_package: Succeeded
NOTE: Running task 2235 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.1.bb:do_packagedata)
NOTE: recipe python3-numpy-2.4.1-r0: task do_packagedata: Started
NOTE: recipe python3-numpy-2.4.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2236 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.1.bb:do_create_spdx)
NOTE: Running task 2237 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.1.bb:do_package_write_ipk)
NOTE: Running task 2238 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.1.bb:do_package_write_deb)
NOTE: Running task 2239 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.1.bb:do_package_write_rpm)
NOTE: Running task 2240 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.1.bb:do_package_qa)
NOTE: recipe python3-numpy-2.4.1-r0: task do_create_spdx: Started
NOTE: recipe python3-numpy-2.4.1-r0: task do_package_write_ipk: Started
NOTE: recipe python3-numpy-2.4.1-r0: task do_package_write_deb: Started
NOTE: recipe python3-numpy-2.4.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-numpy-2.4.1-r0: task do_package_qa: Started
NOTE: recipe python3-numpy-2.4.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2241 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.1.bb:do_create_package_spdx)
NOTE: recipe python3-numpy-2.4.1-r0: task do_create_package_spdx: Started
NOTE: recipe python3-numpy-2.4.1-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.1.bb:do_package_qa unihash changed to be0e389cf42c7cbffcc536aa3e2d0c4f73417ed7c807f7b20ca1b05908dfb9db
NOTE: recipe python3-numpy-2.4.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-numpy-2.4.1-r0: task do_create_package_spdx: Succeeded
NOTE: recipe python3-numpy-2.4.1-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-numpy-2.4.1-r0: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 2242 of 2242 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2242 tasks of which 2159 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-hypothesis-6.150.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.151.4-r0 to 0:6.150.3-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.150.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.151.4-r0 to 0:6.150.3-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.150.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.151.4-r0 to 0:6.150.3-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.150.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.151.4-r0 to 0:6.150.3-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.150.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.151.4-r0 to 0:6.150.3-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.150.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.151.4-r0 to 0:6.150.3-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.150.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.151.4-r0 to 0:6.150.3-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.150.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.151.4-r0 to 0:6.150.3-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.150.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5390160698776284545==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-numpy-upgrade-2.3.5-2.4.1.patch"

RnJvbSBkMDg1YjUyYmEyMTU0ZjQ5NWI5NDFkZmIzZmVjYzU3NjI3MzJlMzM0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBGZWIgMjAyNiAwODoyNjowNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbnVtcHk6IHVwZ3JhZGUgMi4zLjUgLT4gMi40LjEKCi0tLQogLi4uMS1Eb24tdC1zZWFy
Y2gtdXNyLWFuZC1zby1vbi1mb3ItbGlicmFyaWVzLWJ5LWRlZmF1bHQtLnBhdGNoIHwgMiArLQog
Li4uL3B5dGhvbi9weXRob24zLW51bXB5L2ZpeF9yZXByb2R1Y2liaWxpdHkucGF0Y2ggICAgICAg
ICAgICAgIHwgMiArLQogLi4uL3B5dGhvbi97cHl0aG9uMy1udW1weV8yLjMuNS5iYiA9PiBweXRo
b24zLW51bXB5XzIuNC4xLmJifSAgIHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKyksIDMgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi97cHl0aG9uMy1udW1weV8yLjMuNS5iYiA9PiBweXRob24zLW51bXB5XzIuNC4xLmJifSAoOTcl
KQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1w
eS8wMDAxLURvbi10LXNlYXJjaC11c3ItYW5kLXNvLW9uLWZvci1saWJyYXJpZXMtYnktZGVmYXVs
dC0ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHkvMDAw
MS1Eb24tdC1zZWFyY2gtdXNyLWFuZC1zby1vbi1mb3ItbGlicmFyaWVzLWJ5LWRlZmF1bHQtLnBh
dGNoCmluZGV4IDNhNzdmZmE0ZTAuLmQ3YWEyOTgyOTkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weS8wMDAxLURvbi10LXNlYXJjaC11c3ItYW5k
LXNvLW9uLWZvci1saWJyYXJpZXMtYnktZGVmYXVsdC0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5LzAwMDEtRG9uLXQtc2VhcmNoLXVzci1hbmQt
c28tb24tZm9yLWxpYnJhcmllcy1ieS1kZWZhdWx0LS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gNWNiNzMxNjEyODg0NWUzZGExY2UxNjE4YTQyYjJlMzIyMmI1OWJhOSBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gNTIxODMxOTE2MDNhMTgyOWRjNGM4ZjdjMzU3MmVkYjdlZTc5MWY2
ZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4
LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogVGh1LCAxMCBEZWMgMjAxNSAxMzoyMDozMCArMDIw
MAogU3ViamVjdDogW1BBVENIXSBEb24ndCBzZWFyY2ggL3VzciBhbmQgc28gb24gZm9yIGxpYnJh
cmllcyBieSBkZWZhdWx0IHRvCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtbnVtcHkvZml4X3JlcHJvZHVjaWJpbGl0eS5wYXRjaCBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weS9maXhfcmVwcm9kdWNpYmlsaXR5LnBhdGNo
CmluZGV4IDcxYjM2MzRiNzcuLjRjMzNjM2YwYWIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weS9maXhfcmVwcm9kdWNpYmlsaXR5LnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weS9maXhfcmVwcm9k
dWNpYmlsaXR5LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA2ZmQ3OWNiZTdhZTlmMGE3YTVm
YzRlNWNkNmM1YzNkYTllYTA5ODE1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAxYmJk
M2NhOTQ5MzNiNzQwNzQwZmFiN2I2MzAzNTliYWUxMzBkZTEwIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlv
bi5vcmc+CiBEYXRlOiBGcmksIDI5IFNlcCAyMDIzIDIyOjUzOjI0ICswMTAwCiBTdWJqZWN0OiBb
UEFUQ0hdIFRoaXMgcmVnZXggZGVjaWRlcyB3aGV0aGVyIHRvIHVzZSBPMyBvcGltaXNhdGlvbiBv
biBudW1weSBvcgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLW51bXB5XzIuMy41LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LW51bXB5XzIuNC4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weV8yLjMuNS5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5XzIuNC4xLmJiCmluZGV4IDU1
YjgwOTFmZjguLjI1NTU2Mjc4NTggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1udW1weV8yLjMuNS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtbnVtcHlfMi40LjEuYmIKQEAgLTEyLDcgKzEyLDcgQEAgU1JDX1VSSSA9
ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvdiR7UFZ9LyR7U1JDTkFNRX0tJHtQVn0udGFy
Lmd6IFwKICAgICAgICAgICAgZmlsZTovL2ZpeF9yZXByb2R1Y2liaWxpdHkucGF0Y2ggXAogICAg
ICAgICAgICBmaWxlOi8vcnVuLXB0ZXN0IFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjc4NGRiMWRjZGFiNTZiZjA1MTc3NDNlNzQ2ZGZiMGY4ODVmYzY4ZDk0OGFiYTg2ZWVl
YzJjYmEyMzRiZGYxYzAiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYTFjZWFmYzUwNDI0NTFhODU4
MjMxNTg4YTEwNDA5MzQ3NGM2YTVjNTdkY2M3MjQ4NDFmNWM4ODhkMjM3ZDY5MCIKIAogR0lUSFVC
X0JBU0VfVVJJID0gImh0dHBzOi8vZ2l0aHViLmNvbS9udW1weS9udW1weS9yZWxlYXNlcyIKIFVQ
U1RSRUFNX0NIRUNLX1JFR0VYID0gInJlbGVhc2VzL3RhZy92Pyg/UDxwdmVyPlxkKyhcLlxkKykr
KSQiCi0tIAoyLjQ3LjEKCg==

--===============5390160698776284545==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-numpy: PV changed from "2.3.5" to "2.4.1"
packages/x86-64-v3-poky-linux/python3-numpy: PKGV changed from 2.3.5 [default] to 2.4.1 [default]
packages/x86-64-v3-poky-linux/python3-numpy: SRC_URI changed from "https://github.com/numpy/numpy/releases/download/v2.3.5/numpy-2.3.5.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://fix_reproducibility.patch file://run-ptest" to "https://github.com/numpy/numpy/releases/download/v2.4.1/numpy-2.4.1.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://fix_reproducibility.patch file://run-ptest"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-dbg: PV changed from "2.3.5" to "2.4.1"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-dbg: PKGSIZE changed from 100304664 to 94517920 (-6%)
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-dbg: PKGV changed from 2.3.5 [default] to 2.4.1 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-dev: PV changed from "2.3.5" to "2.4.1"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-dev: PKGV changed from 2.3.5 [default] to 2.4.1 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-doc: PV changed from "2.3.5" to "2.4.1"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-doc: PKGV changed from 2.3.5 [default] to 2.4.1 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-locale: PV changed from "2.3.5" to "2.4.1"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-locale: PKGV changed from 2.3.5 [default] to 2.4.1 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-ptest: PV changed from "2.3.5" to "2.4.1"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-ptest: PKGV changed from 2.3.5 [default] to 2.4.1 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-src: PV changed from "2.3.5" to "2.4.1"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-src: PKGSIZE changed from 25057177 to 25246413 (+1%)
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-src: FILELIST: directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/simd/sse -> /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/simd/sse, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/npymath -> /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/npymath, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/_core/include/numpy/random -> /usr/src/debug/python3-numpy/2.4.1/numpy/_core/include/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/random/_philox.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.4.1/numpy/random/_philox.cpython-314-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/random/_common.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.4.1/numpy/random/_common.cpython-314-x86_64-linux-gnu.so.p/numpy/random, directory renam
 ed /usr/src/debug/python3-numpy/2.3.5/numpy/linalg/lapack_lite -> /usr/src/debug/python3-numpy/2.4.1/numpy/linalg/lapack_lite, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/random/_bounded_integers.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.4.1/numpy/random/_bounded_integers.cpython-314-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/npysort -> /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/npysort, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/linalg -> /usr/src/debug/python3-numpy/2.4.1/numpy/linalg, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/_core -> /usr/src/debug/python3-numpy/2.4.1/numpy/_core, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/_core/include/numpy -> /usr/src/debug/python3-numpy/2.4.1/numpy/_core/include/numpy, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/random/src/mt19937 -> /usr/src/debug/python3-
 numpy/2.4.1/numpy/random/src/mt19937, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/simd/avx2 -> /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/simd/avx2, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/_core/include/numpy/libdivide -> /usr/src/debug/python3-numpy/2.4.1/numpy/_core/include/numpy/libdivide, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/random/src/legacy -> /usr/src/debug/python3-numpy/2.4.1/numpy/random/src/legacy, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/dlpack -> /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/dlpack, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/npysort/x86-simd-sort/src -> /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/npysort/x86-simd-sort/src, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/random/mtrand.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.4.1/numpy/rando
 m/mtrand.cpython-314-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/random/src/pcg64 -> /usr/src/debug/python3-numpy/2.4.1/numpy/random/src/pcg64, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/textreading -> /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/textreading, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/random/src/sfc64 -> /usr/src/debug/python3-numpy/2.4.1/numpy/random/src/sfc64, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/highway/hwy -> /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/highway/hwy, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/random/src/philox -> /usr/src/debug/python3-numpy/2.4.1/numpy/random/src/philox, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/random/bit_generator.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.4.1/numpy/random/bit_generator.cpython-314-x8
 6_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/random/src/distributions -> /usr/src/debug/python3-numpy/2.4.1/numpy/random/src/distributions, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/fft -> /usr/src/debug/python3-numpy/2.4.1/numpy/fft, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/_simd -> /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/_simd, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/random/_generator.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.4.1/numpy/random/_generator.cpython-314-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/umath -> /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/umath, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/fft/pocketfft -> /usr/src/debug/python3-numpy/2.4.1/numpy/fft/pocketfft, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/
 _core/src/highway/hwy/ops -> /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/highway/hwy/ops, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/random/_mt19937.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.4.1/numpy/random/_mt19937.cpython-314-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/random/_pcg64.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.4.1/numpy/random/_pcg64.cpython-314-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/random/_sfc64.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.4.1/numpy/random/_sfc64.cpython-314-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/stringdtype -> /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/stringdtype, directory renamed /usr/src/debug/python3-numpy/2
 .3.5/numpy/random/include -> /usr/src/debug/python3-numpy/2.4.1/numpy/random/include, removed "/usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/nditer_impl.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/compiled_base.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/temp_elide.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/dtypemeta.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/compiled_base.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/scalartypes.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_atomic.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/dtypemeta.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/temp_elide.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/unique.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/simd/avx512/arithmetic.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/dlpack.c 
 /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/scalartypes.c.src /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/templ_common.h.src /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/npy_buffer.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/nditer_api.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/umathmodule.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/public_dtype_api.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/argfunc.dispatch.c.src /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/einsum.c.src /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/public_dtype_api.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/refcount.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_dlpack.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/shape.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/nditer_constr.c /usr
 /src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/refcount.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/shape.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/float_status.hpp /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/scalarapi.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/simd/avx512/utils.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/simd/avx512/reorder.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/_datetime.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/getset.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/dragon4.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/getset.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/dragon4.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/buffer.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/dtype_traversal.c /usr/src/debug/python3-numpy/2.3.5/numpy
 /_core/src/multiarray/common.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/dtype_traversal.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/common.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/mapping.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_sort.h.src /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/can_cast_table.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/mapping.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/array_assign_array.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/blas_utils.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/blas_utils.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_cpu_features.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/conversion_utils.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/mem_overlap.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/mem_ov
 erlap.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_cpu_features.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/conversion_utils.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/arrayobject.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/arrayobject.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/einsum_sumprod.c.src /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/lowlevel_strided_loops.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/npy_static_data.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/npy_static_data.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/item_selection.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_import.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/item_selection.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npstd.hpp /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/commo
 n/utils.hpp /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/unique.cpp /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_import.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/numpy_tag.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/lowlevel_strided_loops.c.src /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/datetime.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/simd/simd.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/simd/avx512/misc.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_hashtable.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/flagsobject.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/array_assign_scalar.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/nditer_pywrap.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/flagsobject.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/nditer_pyw
 rap.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/array_converter.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/iterators.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/usertypes.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_cpu_dispatch.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/methods.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/simd/avx512/memory.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/array_converter.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/iterators.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/methods.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_cpu_dispatch.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/usertypes.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/arraytypes.h.src /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/ufunc_override.c /usr
 /src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/arraytypes.c.src /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/calculation.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/alloc.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/vdot.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/binop_override.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/ufunc_override.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/alloc.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/calculation.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/vdot.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/datetime_strings.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/array_coercion.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/_multiarray_tests.c.src /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/simd/avx512/avx512.h /usr/src/debug/py
 thon3-numpy/2.3.5/numpy/_core/src/multiarray/abstractdtypes.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/abstractdtypes.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/array_coercion.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/datetime_strings.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_partition.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/simd/avx512/math.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_binsearch.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/array_method.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/nditer_templ.c.src /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/array_method.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/simd/intdiv.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/convert_datatype.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/ctors.h /usr/src/debu
 g/python3-numpy/2.3.5/numpy/_core/src/multiarray/ctors.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/half_private.hpp /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/convert_datatype.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/einsum_sumprod.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/get_attr_string.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/arraywrap.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/convert.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/dtype_transfer.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/arraywrap.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/convert.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/dtype_transfer.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/descriptor.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/common_dtype.c /usr/src/debug/python3-nump
 y/2.3.5/numpy/_core/src/multiarray/descriptor.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/sequence.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/datetime_busday.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/datetime_busday.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/sequence.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/simd/avx512/conversion.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/datetime_busdaycal.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_argparse.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_longdouble.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/datetime_busdaycal.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_longdouble.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_argparse.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/hashdescr.c /usr/src/debug/python3-n
 umpy/2.3.5/numpy/_core/src/multiarray/array_api_standard.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/array_assign.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/arrayfunction_override.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/array_api_standard.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/arrayfunction_override.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/hashdescr.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/array_assign.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/gil_utils.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/legacy_dtype_implementation.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/number.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/simd/avx512/maskop.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/legacy_dtype_implementation.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common
 /gil_utils.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/number.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/multiarraymodule.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/half.hpp /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/meta.hpp /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_ctypes.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/multiarraymodule.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/simd/avx512/operators.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/numpyos.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_hashtable.cpp /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/numpyos.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/simd/emulate_maskop.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_extint128.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/strfuncs.c /usr/src/debug/python3-nu
 mpy/2.3.5/numpy/_core/src/multiarray/strfuncs.h", added "/usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/nditer_impl.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/compiled_base.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/temp_elide.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/dtypemeta.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/compiled_base.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/scalartypes.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/npy_atomic.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/dtypemeta.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/temp_elide.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/unique.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/simd/avx512/arithmetic.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/dlpack.c /usr/src/debug/python3-numpy/2.4.1/num
 py/_core/src/multiarray/scalartypes.c.src /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/templ_common.h.src /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/npy_buffer.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/nditer_api.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/umathmodule.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/public_dtype_api.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/argfunc.dispatch.c.src /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/public_dtype_api.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/refcount.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/npy_dlpack.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/shape.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/nditer_constr.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/refcount.c /usr/src/debug/python3-numpy/2.4.1/numpy/_co
 re/src/multiarray/shape.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/float_status.hpp /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/scalarapi.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/simd/avx512/reorder.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/_datetime.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/getset.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/dragon4.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/getset.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/dragon4.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/buffer.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/dtype_traversal.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/common.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/dtype_traversal.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/common.h /usr/src/
 debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/mapping.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/npy_sort.h.src /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/can_cast_table.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/mapping.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/array_assign_array.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/blas_utils.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/blas_utils.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/npy_cpu_features.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/conversion_utils.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/mem_overlap.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/mem_overlap.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/npy_cpu_features.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/conversion_utils.c /usr/src/debug/python3-nu
 mpy/2.4.1/numpy/_core/src/multiarray/arrayobject.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/arrayobject.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/einsum_sumprod.c.src /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/lowlevel_strided_loops.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/npy_static_data.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/npy_static_data.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/item_selection.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/npy_import.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/item_selection.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/utils.hpp /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/npstd.hpp /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/unique.cpp /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/npy_import.c /usr/src/debug/python3-numpy/2.4.1/
 numpy/_core/src/common/numpy_tag.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/lowlevel_strided_loops.c.src /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/datetime.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/simd/simd.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/simd/avx512/misc.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/npy_hashtable.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/flagsobject.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/array_assign_scalar.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/nditer_pywrap.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/flagsobject.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/nditer_pywrap.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/array_converter.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/iterators.c /usr/src/debug/python3-numpy/2.
 4.1/numpy/_core/src/multiarray/usertypes.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/npy_cpu_dispatch.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/methods.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/simd/avx512/memory.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/array_converter.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/iterators.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/methods.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/npy_cpu_dispatch.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/usertypes.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/arraytypes.h.src /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/ufunc_override.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/arraytypes.c.src /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/calculation.c /usr/src/debug/python3-numpy/2.4.1/numpy
 /_core/src/multiarray/alloc.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/vdot.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/binop_override.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/ufunc_override.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/alloc.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/calculation.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/vdot.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/datetime_strings.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/array_coercion.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/_multiarray_tests.c.src /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/simd/avx512/avx512.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/abstractdtypes.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/abstractdtypes.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src
 /multiarray/array_coercion.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/datetime_strings.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/einsum.cpp /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/npy_partition.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/simd/avx512/math.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/npy_binsearch.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/array_method.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/nditer_templ.c.src /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/array_method.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/simd/intdiv.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/convert_datatype.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/ctors.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/ctors.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/hal
 f_private.hpp /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/convert_datatype.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/einsum_sumprod.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/get_attr_string.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/arraywrap.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/convert.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/dtype_transfer.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/arraywrap.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/convert.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/dtype_transfer.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/descriptor.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/common_dtype.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/descriptor.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/sequence
 .h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/datetime_busday.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/datetime_busday.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/sequence.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/simd/avx512/conversion.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/datetime_busdaycal.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/npy_argparse.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/npy_longdouble.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/datetime_busdaycal.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/npy_longdouble.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/npy_argparse.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/hashdescr.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/array_api_standard.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/a
 rray_assign.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/arrayfunction_override.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/raii_utils.hpp /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/array_api_standard.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/arrayfunction_override.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/hashdescr.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/array_assign.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/gil_utils.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/legacy_dtype_implementation.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/number.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/simd/avx512/maskop.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/legacy_dtype_implementation.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/gil_utils.h /usr/src/debug/python3-numpy/2.4
 .1/numpy/_core/src/multiarray/number.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/fnv.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/multiarraymodule.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/half.hpp /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/meta.hpp /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/npy_ctypes.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/multiarraymodule.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/fnv.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/simd/avx512/operators.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/simd/simd.hpp /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/numpyos.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/simd/simd.inc.hpp /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/npy_hashtable.cpp /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/numpyos.h /usr/src/debu
 g/python3-numpy/2.4.1/numpy/_core/src/common/simd/emulate_maskop.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/npy_extint128.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/strfuncs.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/strfuncs.h"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-src: PKGV changed from 2.3.5 [default] to 2.4.1 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-staticdev: PV changed from "2.3.5" to "2.4.1"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-staticdev: PKGSIZE changed from 354278 to 355662 (+0%)
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-staticdev: PKGV changed from 2.3.5 [default] to 2.4.1 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy: PV changed from "2.3.5" to "2.4.1"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy: PKGSIZE changed from 41243814 to 40270354 (-2%)
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy: FILELIST: removed "/usr/lib/python3.14/site-packages/numpy/linalg/linalg.py /usr/lib/python3.14/site-packages/numpy/linalg/linalg.pyi /usr/lib/python3.14/site-packages/numpy-2.3.5.dist-info/LICENSE.txt /usr/lib/python3.14/site-packages/numpy/_core/__pycache__/_machar.cpython-314.pyc /usr/lib/python3.14/site-packages/numpy/_core/tests/test_machar.py /usr/lib/python3.14/site-packages/numpy/_core/_machar.pyi /usr/lib/python3.14/site-packages/numpy/typing/tests/data/pass/simple_py3.py /usr/lib/python3.14/site-packages/numpy/_core/tests/__pycache__/test_machar.cpython-314.pyc /usr/lib/python3.14/site-packages/numpy/fft/helper.py /usr/lib/python3.14/site-packages/numpy-2.3.5.dist-info/WHEEL /usr/lib/python3.14/site-packages/numpy/typing/tests/data/pass/__pycache__/simple_py3.cpython-314.pyc /usr/lib/python3.14/site-packages/numpy-2.3.5.dist-info/entry_points.txt /usr/lib/python3.14/site-packages/numpy/linalg/__pycache__/linalg.cpyt
 hon-314.pyc /usr/lib/python3.14/site-packages/numpy/fft/__pycache__/helper.cpython-314.pyc /usr/lib/python3.14/site-packages/numpy/_core/_machar.py /usr/lib/python3.14/site-packages/numpy/fft/helper.pyi /usr/lib/python3.14/site-packages/numpy-2.3.5.dist-info/METADATA", added "/usr/lib/python3.14/site-packages/numpy/ma/testutils.pyi /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/LICENSE.md /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/splitmix64/LICENSE.md /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/philox/LICENSE.md /usr/lib/python3.14/site-packages/numpy/_core/tests/__pycache__/test_multiprocessing.cpython-314.pyc /usr/lib/python3.14/site-packages/numpy/typing/__init__.pyi /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/fft/pocketfft/LICENSE.md /usr/lib/python3.14/site-packages/numpy/_core/tests/test_finfo.py /usr/lib/python3.14/site-packages/numpy-2.4.1.d
 ist-info/licenses/numpy/_core/src/multiarray/dragon4_LICENSE.txt /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/WHEEL /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/umath/svml/LICENSE /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/METADATA /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/pcg64/LICENSE.md /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/sfc64/LICENSE.md /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/ma/LICENSE /usr/lib/python3.14/site-packages/numpy/_core/tests/test_multiprocessing.py /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/entry_points.txt /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/highway/LICENSE /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/distributions/LICENSE.md /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/l
 inalg/lapack_lite/LICENSE.txt /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/npysort/x86-simd-sort/LICENSE.md /usr/lib/python3.14/site-packages/numpy/_core/tests/__pycache__/test_finfo.cpython-314.pyc /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/mt19937/LICENSE.md /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/include/numpy/libdivide/LICENSE.txt /usr/lib/python3.14/site-packages/numpy/_core/_umath_tests.pyi /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/LICENSE.txt /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/common/pythoncapi-compat/COPYING"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy: PKGV changed from 2.3.5 [default] to 2.4.1 [default]
Changes to packages/x86-64-v3-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.14/site-packages/numpy-2.3.5.dist-info moved to /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/include was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/include/numpy was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/include/numpy/libdivide was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/include/numpy/libdivide/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/common was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/common/pythoncapi-compat was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/common/pythoncapi-compat/COPYING was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/highway was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/highway/LICENSE was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/multiarray was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/multiarray/dragon4_LICENSE.txt was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/npysort was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/npysort/x86-simd-sort was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/npysort/x86-simd-sort/LICENSE.md was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/umath was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/umath/svml was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/umath/svml/LICENSE was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/fft was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/fft/pocketfft was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/fft/pocketfft/LICENSE.md was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/linalg was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/linalg/lapack_lite was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/linalg/lapack_lite/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/ma was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/ma/LICENSE was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/LICENSE.md was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/distributions was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/distributions/LICENSE.md was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/mt19937 was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/mt19937/LICENSE.md was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/pcg64 was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/pcg64/LICENSE.md was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/philox was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/philox/LICENSE.md was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/sfc64 was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/sfc64/LICENSE.md was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/splitmix64 was added
  /usr/lib/python3.14/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/splitmix64/LICENSE.md was added
  /usr/lib/python3.14/site-packages/numpy/_core/tests/__pycache__/test_finfo.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/numpy/_core/tests/__pycache__/test_multiprocessing.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/numpy/_core/tests/test_finfo.py was added
  /usr/lib/python3.14/site-packages/numpy/_core/tests/test_multiprocessing.py was added
  /usr/lib/python3.14/site-packages/numpy/_core/_umath_tests.pyi was added
  /usr/lib/python3.14/site-packages/numpy/ma/testutils.pyi was added
  /usr/lib/python3.14/site-packages/numpy/typing/__init__.pyi was added
  /usr/lib/python3.14/site-packages/numpy-2.3.5.dist-info/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/numpy/_core/_machar.py was removed
  /usr/lib/python3.14/site-packages/numpy/_core/_machar.pyi was removed
  /usr/lib/python3.14/site-packages/numpy/_core/__pycache__/_machar.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/numpy/_core/tests/__pycache__/test_machar.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/numpy/_core/tests/test_machar.py was removed
  /usr/lib/python3.14/site-packages/numpy/fft/helper.py was removed
  /usr/lib/python3.14/site-packages/numpy/fft/helper.pyi was removed
  /usr/lib/python3.14/site-packages/numpy/fft/__pycache__/helper.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/numpy/linalg/linalg.py was removed
  /usr/lib/python3.14/site-packages/numpy/linalg/linalg.pyi was removed
  /usr/lib/python3.14/site-packages/numpy/linalg/__pycache__/linalg.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/numpy/typing/tests/data/pass/__pycache__/simple_py3.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/numpy/typing/tests/data/pass/simple_py3.py was removed

--===============5390160698776284545==--

