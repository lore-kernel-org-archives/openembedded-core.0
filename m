Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65195D47CD0
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 01:25:52 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1464.1768526740207822311
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 17:25:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Mq8FmpEV;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=YHX/QY2p;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019bc4689c21-bb6dada0-58b6-4762-b71e-167955d85d14-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768526748;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aVcTmVAjWfBnQ4mxFyAiZetm+KT2cRIEcEoC3b0wzSI=;
	b=Mq8FmpEVK1Lm/SB3NW32Uzh3ZSdhAO3bcrd1kBMriLKb8Zw27hF0bQZQt70dQVlO
	uvx7KO99Q9TpSjkn3l23QerUp15eswXkNAIY2aO68V2UbMNdqmIAJ9lVhUQD5NxZ/U9
	b54CVGpjgVDlZ6133Qxd4JxUrz37lyMArJ7/rq50=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768526748;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aVcTmVAjWfBnQ4mxFyAiZetm+KT2cRIEcEoC3b0wzSI=;
	b=YHX/QY2pRiHxgEpL97A8kpwRRQDKxes3g+7PQSzTdOYtjkdetbX/fdg55Xg6iz5C
	qkSabQZVN1gmMaIYOT+UkTlpO2LB7BFHBM54Iqe5HNyrW66rMLezCX/m/EiLWWfqvKQ
	I7CLsCLOA0kGSg0y4oZuUvM/o4l6wi+kJqY+EtOM=
Content-Type: multipart/mixed; boundary="===============1033221598244181167=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-numpy: upgrading to 2.4.1 SUCCEEDED
Message-ID: <0101019bc4689c21-bb6dada0-58b6-4762-b71e-167955d85d14-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jan 2026 01:25:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.16-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229469

--===============1033221598244181167==
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
From 02f9014d2d01dad1924ef023e25b0acbb008aca0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jan 2026 21:42:04 +0000
Subject: [PATCH] python3-numpy: upgrade 2.3.5 -> 2.4.1

---
 ...1-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch | 2 +-
 .../python/python3-numpy/fix_reproducibility.patch              | 2 +-
 .../python/{python3-numpy_2.3.5.bb => python3-numpy_2.4.1.bb}   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-numpy_2.3.5.bb => python3-numpy_2.4.1.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch b/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
index 3a77ffa4e0..20a70186ba 100644
--- a/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
+++ b/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
@@ -1,4 +1,4 @@
-From 5cb7316128845e3da1ce1618a42b2e3222b59ba9 Mon Sep 17 00:00:00 2001
+From 5101b105cbb4d4fc31d00d0794211aad0a2449a6 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 10 Dec 2015 13:20:30 +0200
 Subject: [PATCH] Don't search /usr and so on for libraries by default to
diff --git a/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch b/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
index 71b3634b77..f8960adb48 100644
--- a/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
+++ b/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
@@ -1,4 +1,4 @@
-From 6fd79cbe7ae9f0a7a5fc4e5cd6c5c3da9ea09815 Mon Sep 17 00:00:00 2001
+From 8124ebf8492408cdec2e4080d7665d15455ebae9 Mon Sep 17 00:00:00 2001
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


--===============1033221598244181167==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy: FILELIST: removed "/usr/lib/python3.13/site-packages/numpy/fft/__pycache__/helper.cpython-313.pyc /usr/lib/python3.13/site-packages/numpy/_core/_machar.pyi /usr/lib/python3.13/site-packages/numpy-2.3.5.dist-info/LICENSE.txt /usr/lib/python3.13/site-packages/numpy/linalg/linalg.py /usr/lib/python3.13/site-packages/numpy/fft/helper.pyi /usr/lib/python3.13/site-packages/numpy/fft/helper.py /usr/lib/python3.13/site-packages/numpy/_core/_machar.py /usr/lib/python3.13/site-packages/numpy-2.3.5.dist-info/entry_points.txt /usr/lib/python3.13/site-packages/numpy/linalg/__pycache__/linalg.cpython-313.pyc /usr/lib/python3.13/site-packages/numpy/typing/tests/data/pass/__pycache__/simple_py3.cpython-313.pyc /usr/lib/python3.13/site-packages/numpy/_core/__pycache__/_machar.cpython-313.pyc /usr/lib/python3.13/site-packages/numpy/linalg/linalg.pyi /usr/lib/python3.13/site-packages/numpy-2.3.5.dist-info/WHEEL /usr/lib/python3.13/site-packages
 /numpy/_core/tests/__pycache__/test_machar.cpython-313.pyc /usr/lib/python3.13/site-packages/numpy/typing/tests/data/pass/simple_py3.py /usr/lib/python3.13/site-packages/numpy-2.3.5.dist-info/METADATA /usr/lib/python3.13/site-packages/numpy/_core/tests/test_machar.py", added "/usr/lib/python3.13/site-packages/numpy/_core/tests/test_finfo.py /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/fft/pocketfft/LICENSE.md /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/distributions/LICENSE.md /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/include/numpy/libdivide/LICENSE.txt /usr/lib/python3.13/site-packages/numpy/_core/tests/__pycache__/test_finfo.cpython-313.pyc /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/pcg64/LICENSE.md /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/sfc64/LICENSE.md /usr/lib/python3.13/site-packages/numpy-2.4.1.dis
 t-info/licenses/numpy/random/src/mt19937/LICENSE.md /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/umath/svml/LICENSE /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/WHEEL /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/highway/LICENSE /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/philox/LICENSE.md /usr/lib/python3.13/site-packages/numpy/ma/testutils.pyi /usr/lib/python3.13/site-packages/numpy/_core/tests/test_multiprocessing.py /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/multiarray/dragon4_LICENSE.txt /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/LICENSE.txt /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/entry_points.txt /usr/lib/python3.13/site-packages/numpy/typing/__init__.pyi /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/linalg/lapack_lite/LICENSE.txt /usr/lib/python3.13/site-pack
 ages/numpy-2.4.1.dist-info/licenses/numpy/ma/LICENSE /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/npysort/x86-simd-sort/LICENSE.md /usr/lib/python3.13/site-packages/numpy/_core/tests/__pycache__/test_multiprocessing.cpython-313.pyc /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/common/pythoncapi-compat/COPYING /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/LICENSE.md /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/splitmix64/LICENSE.md /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/METADATA /usr/lib/python3.13/site-packages/numpy/_core/_umath_tests.pyi"
Changes to packages/x86-64-v3-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.13/site-packages/numpy-2.3.5.dist-info moved to /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/include was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/include/numpy was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/include/numpy/libdivide was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/include/numpy/libdivide/LICENSE.txt was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/common was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/common/pythoncapi-compat was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/common/pythoncapi-compat/COPYING was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/highway was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/highway/LICENSE was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/multiarray was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/multiarray/dragon4_LICENSE.txt was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/npysort was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/npysort/x86-simd-sort was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/npysort/x86-simd-sort/LICENSE.md was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/umath was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/umath/svml was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/umath/svml/LICENSE was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/fft was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/fft/pocketfft was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/fft/pocketfft/LICENSE.md was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/linalg was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/linalg/lapack_lite was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/linalg/lapack_lite/LICENSE.txt was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/ma was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/ma/LICENSE was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/LICENSE.md was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/distributions was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/distributions/LICENSE.md was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/mt19937 was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/mt19937/LICENSE.md was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/pcg64 was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/pcg64/LICENSE.md was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/philox was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/philox/LICENSE.md was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/sfc64 was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/sfc64/LICENSE.md was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/splitmix64 was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/splitmix64/LICENSE.md was added
  /usr/lib/python3.13/site-packages/numpy/_core/tests/__pycache__/test_finfo.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/numpy/_core/tests/__pycache__/test_multiprocessing.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/numpy/_core/tests/test_finfo.py was added
  /usr/lib/python3.13/site-packages/numpy/_core/tests/test_multiprocessing.py was added
  /usr/lib/python3.13/site-packages/numpy/_core/_umath_tests.pyi was added
  /usr/lib/python3.13/site-packages/numpy/ma/testutils.pyi was added
  /usr/lib/python3.13/site-packages/numpy/typing/__init__.pyi was added
  /usr/lib/python3.13/site-packages/numpy-2.3.5.dist-info/LICENSE.txt was removed
  /usr/lib/python3.13/site-packages/numpy/_core/_machar.py was removed
  /usr/lib/python3.13/site-packages/numpy/_core/_machar.pyi was removed
  /usr/lib/python3.13/site-packages/numpy/_core/__pycache__/_machar.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/numpy/_core/tests/__pycache__/test_machar.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/numpy/_core/tests/test_machar.py was removed
  /usr/lib/python3.13/site-packages/numpy/fft/helper.py was removed
  /usr/lib/python3.13/site-packages/numpy/fft/helper.pyi was removed
  /usr/lib/python3.13/site-packages/numpy/fft/__pycache__/helper.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/numpy/linalg/linalg.py was removed
  /usr/lib/python3.13/site-packages/numpy/linalg/linalg.pyi was removed
  /usr/lib/python3.13/site-packages/numpy/linalg/__pycache__/linalg.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/numpy/typing/tests/data/pass/__pycache__/simple_py3.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/numpy/typing/tests/data/pass/simple_py3.py was removed

--===============1033221598244181167==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-numpy-upgrade-2.3.5-2.4.1.patch"

RnJvbSAwMmY5MDE0ZDJkMDFkYWQxOTI0ZWYwMjNlMjViMGFjYmIwMDhhY2EwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSmFuIDIwMjYgMjE6NDI6MDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW51bXB5OiB1cGdyYWRlIDIuMy41IC0+IDIuNC4xCgotLS0KIC4uLjEtRG9uLXQtc2Vh
cmNoLXVzci1hbmQtc28tb24tZm9yLWxpYnJhcmllcy1ieS1kZWZhdWx0LS5wYXRjaCB8IDIgKy0K
IC4uLi9weXRob24vcHl0aG9uMy1udW1weS9maXhfcmVwcm9kdWNpYmlsaXR5LnBhdGNoICAgICAg
ICAgICAgICB8IDIgKy0KIC4uLi9weXRob24ve3B5dGhvbjMtbnVtcHlfMi4zLjUuYmIgPT4gcHl0
aG9uMy1udW1weV8yLjQuMS5iYn0gICB8IDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24ve3B5dGhvbjMtbnVtcHlfMi4zLjUuYmIgPT4gcHl0aG9uMy1udW1weV8yLjQuMS5iYn0gKDk3
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVt
cHkvMDAwMS1Eb24tdC1zZWFyY2gtdXNyLWFuZC1zby1vbi1mb3ItbGlicmFyaWVzLWJ5LWRlZmF1
bHQtLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5LzAw
MDEtRG9uLXQtc2VhcmNoLXVzci1hbmQtc28tb24tZm9yLWxpYnJhcmllcy1ieS1kZWZhdWx0LS5w
YXRjaAppbmRleCAzYTc3ZmZhNGUwLi4yMGE3MDE4NmJhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHkvMDAwMS1Eb24tdC1zZWFyY2gtdXNyLWFu
ZC1zby1vbi1mb3ItbGlicmFyaWVzLWJ5LWRlZmF1bHQtLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weS8wMDAxLURvbi10LXNlYXJjaC11c3ItYW5k
LXNvLW9uLWZvci1saWJyYXJpZXMtYnktZGVmYXVsdC0ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIDVjYjczMTYxMjg4NDVlM2RhMWNlMTYxOGE0MmIyZTMyMjJiNTliYTkgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIDUxMDFiMTA1Y2JiNGQ0ZmMzMWQwMGQwNzk0MjExYWFkMGEyNDQ5
YTYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxl
eC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IFRodSwgMTAgRGVjIDIwMTUgMTM6MjA6MzAgKzAy
MDAKIFN1YmplY3Q6IFtQQVRDSF0gRG9uJ3Qgc2VhcmNoIC91c3IgYW5kIHNvIG9uIGZvciBsaWJy
YXJpZXMgYnkgZGVmYXVsdCB0bwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLW51bXB5L2ZpeF9yZXByb2R1Y2liaWxpdHkucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHkvZml4X3JlcHJvZHVjaWJpbGl0eS5wYXRj
aAppbmRleCA3MWIzNjM0Yjc3Li5mODk2MGFkYjQ4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHkvZml4X3JlcHJvZHVjaWJpbGl0eS5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHkvZml4X3JlcHJv
ZHVjaWJpbGl0eS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNmZkNzljYmU3YWU5ZjBhN2E1
ZmM0ZTVjZDZjNWMzZGE5ZWEwOTgxNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gODEy
NGViZjg0OTI0MDhjZGVjMmU0MDgwZDc2NjVkMTU0NTVlYmFlOSBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRp
b24ub3JnPgogRGF0ZTogRnJpLCAyOSBTZXAgMjAyMyAyMjo1MzoyNCArMDEwMAogU3ViamVjdDog
W1BBVENIXSBUaGlzIHJlZ2V4IGRlY2lkZXMgd2hldGhlciB0byB1c2UgTzMgb3BpbWlzYXRpb24g
b24gbnVtcHkgb3IKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1udW1weV8yLjMuNS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1udW1weV8yLjQuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHlfMi4zLjUuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weV8yLjQuMS5iYgppbmRleCA1
NWI4MDkxZmY4Li4yNTU1NjI3ODU4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtbnVtcHlfMi4zLjUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLW51bXB5XzIuNC4xLmJiCkBAIC0xMiw3ICsxMiw3IEBAIFNSQ19VUkkg
PSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rvd25sb2FkL3Yke1BWfS8ke1NSQ05BTUV9LSR7UFZ9LnRh
ci5neiBcCiAgICAgICAgICAgIGZpbGU6Ly9maXhfcmVwcm9kdWNpYmlsaXR5LnBhdGNoIFwKICAg
ICAgICAgICAgZmlsZTovL3J1bi1wdGVzdCBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2
c3VtXSA9ICI3ODRkYjFkY2RhYjU2YmYwNTE3NzQzZTc0NmRmYjBmODg1ZmM2OGQ5NDhhYmE4NmVl
ZWMyY2JhMjM0YmRmMWMwIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImExY2VhZmM1MDQyNDUxYTg1
ODIzMTU4OGExMDQwOTM0NzRjNmE1YzU3ZGNjNzI0ODQxZjVjODg4ZDIzN2Q2OTAiCiAKIEdJVEhV
Ql9CQVNFX1VSSSA9ICJodHRwczovL2dpdGh1Yi5jb20vbnVtcHkvbnVtcHkvcmVsZWFzZXMiCiBV
UFNUUkVBTV9DSEVDS19SRUdFWCA9ICJyZWxlYXNlcy90YWcvdj8oP1A8cHZlcj5cZCsoXC5cZCsp
KykkIgotLSAKMi40Ny4xCgo=

--===============1033221598244181167==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-numpy: PV changed from "2.3.5" to "2.4.1"
packages/x86-64-v3-poky-linux/python3-numpy: PKGV changed from 2.3.5 [default] to 2.4.1 [default]
packages/x86-64-v3-poky-linux/python3-numpy: SRC_URI changed from "https://github.com/numpy/numpy/releases/download/v2.3.5/numpy-2.3.5.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://fix_reproducibility.patch file://run-ptest" to "https://github.com/numpy/numpy/releases/download/v2.4.1/numpy-2.4.1.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://fix_reproducibility.patch file://run-ptest"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-dbg: PV changed from "2.3.5" to "2.4.1"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-dbg: PKGSIZE changed from 100493688 to 94714288 (-6%)
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
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-src: PKGSIZE changed from 24901289 to 25090450 (+1%)
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-src: PKGV changed from 2.3.5 [default] to 2.4.1 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-src: FILELIST: directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/npymath -> /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/npymath, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/textreading -> /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/textreading, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/random/mtrand.cpython-313-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.4.1/numpy/random/mtrand.cpython-313-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/npysort -> /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/npysort, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/random/bit_generator.cpython-313-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.4.1/numpy/random/bit_generator.cpython-313-x86_64-linux-gnu.so.p/numpy/random, directory
  renamed /usr/src/debug/python3-numpy/2.3.5/numpy/random/src/philox -> /usr/src/debug/python3-numpy/2.4.1/numpy/random/src/philox, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/fft/pocketfft -> /usr/src/debug/python3-numpy/2.4.1/numpy/fft/pocketfft, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/simd/avx2 -> /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/simd/avx2, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/highway/hwy -> /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/highway/hwy, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/random/_bounded_integers.cpython-313-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.4.1/numpy/random/_bounded_integers.cpython-313-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/stringdtype -> /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/stringdtype, directory 
 renamed /usr/src/debug/python3-numpy/2.3.5/numpy/_core/include/numpy/libdivide -> /usr/src/debug/python3-numpy/2.4.1/numpy/_core/include/numpy/libdivide, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/random/src/legacy -> /usr/src/debug/python3-numpy/2.4.1/numpy/random/src/legacy, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/random/src/pcg64 -> /usr/src/debug/python3-numpy/2.4.1/numpy/random/src/pcg64, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/pythoncapi-compat -> /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/pythoncapi-compat, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/random/src/sfc64 -> /usr/src/debug/python3-numpy/2.4.1/numpy/random/src/sfc64, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/random/_mt19937.cpython-313-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.4.1/numpy/random/_mt19937.cpython-313-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/
 src/debug/python3-numpy/2.3.5/numpy/random/_pcg64.cpython-313-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.4.1/numpy/random/_pcg64.cpython-313-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/dlpack -> /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/dlpack, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/fft -> /usr/src/debug/python3-numpy/2.4.1/numpy/fft, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/random/_sfc64.cpython-313-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.4.1/numpy/random/_sfc64.cpython-313-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/simd/sse -> /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/simd/sse, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/_core -> /usr/src/debug/python3-numpy/2.4.1/numpy/_core, directory renamed /usr/src/debug
 /python3-numpy/2.3.5/numpy/_core/include/numpy -> /usr/src/debug/python3-numpy/2.4.1/numpy/_core/include/numpy, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/random/src/mt19937 -> /usr/src/debug/python3-numpy/2.4.1/numpy/random/src/mt19937, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/_core/include/numpy/random -> /usr/src/debug/python3-numpy/2.4.1/numpy/_core/include/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/random/_generator.cpython-313-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.4.1/numpy/random/_generator.cpython-313-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/umath -> /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/umath, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/_simd -> /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/_simd, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/random/include -> /u
 sr/src/debug/python3-numpy/2.4.1/numpy/random/include, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/npysort/x86-simd-sort/src -> /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/npysort/x86-simd-sort/src, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/linalg -> /usr/src/debug/python3-numpy/2.4.1/numpy/linalg, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/random/_common.cpython-313-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.4.1/numpy/random/_common.cpython-313-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/random/_philox.cpython-313-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.4.1/numpy/random/_philox.cpython-313-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/highway/hwy/ops -> /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/highway/hwy/ops, directory renamed /usr/src/debug/pyt
 hon3-numpy/2.3.5/numpy/linalg/lapack_lite -> /usr/src/debug/python3-numpy/2.4.1/numpy/linalg/lapack_lite, directory renamed /usr/src/debug/python3-numpy/2.3.5/numpy/random/src/distributions -> /usr/src/debug/python3-numpy/2.4.1/numpy/random/src/distributions, removed "/usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/simd/avx512/conversion.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/nditer_api.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/scalartypes.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/array_method.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/half.hpp /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/meta.hpp /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_extint128.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/array_converter.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_cpu_features.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/m
 ultiarray/iterators.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/array_assign_array.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/usertypes.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/array_method.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_cpu_features.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/iterators.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/usertypes.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/array_converter.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/alloc.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/nditer_pywrap.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/ufunc_override.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/ctors.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/descriptor.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/nditer
 _pywrap.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/alloc.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/unique.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/descriptor.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/binop_override.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/ufunc_override.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/ctors.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/array_assign.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/datetime_strings.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/numpy_tag.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/array_assign.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/datetime_strings.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/public_dtype_api.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_hashtable.h /usr/src/debug/pyt
 hon3-numpy/2.3.5/numpy/_core/src/multiarray/convert_datatype.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/public_dtype_api.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/convert_datatype.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/unique.cpp /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_sort.h.src /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/simd/simd.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/shape.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_binsearch.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/templ_common.h.src /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/shape.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/array_assign_scalar.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/vdot.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/nditer_impl.h /usr/src/debug/python3-numpy/2.3.5/n
 umpy/_core/src/multiarray/vdot.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/scalartypes.c.src /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/common_dtype.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_hashtable.cpp /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npstd.hpp /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/utils.hpp /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/npy_static_data.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/multiarraymodule.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/npy_buffer.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/multiarraymodule.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/npy_static_data.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/compiled_base.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/compiled_base.h /usr/src/debug/python3-numpy/2.3.5/numpy/_
 core/src/multiarray/strfuncs.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/simd/avx512/misc.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/simd/avx512/arithmetic.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/strfuncs.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_import.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/umathmodule.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_argparse.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_longdouble.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_argparse.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_import.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_longdouble.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/blas_utils.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/flagsobject.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/item_selection
 .c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/blas_utils.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/flagsobject.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/item_selection.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_cpu_dispatch.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/hashdescr.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_cpu_dispatch.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/hashdescr.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/legacy_dtype_implementation.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/argfunc.dispatch.c.src /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/legacy_dtype_implementation.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/datetime.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/dlpack.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/co
 mmon/npy_ctypes.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/numpyos.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/scalarapi.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/simd/avx512/utils.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/number.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/number.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/_datetime.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/numpyos.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/refcount.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/buffer.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/refcount.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/simd/avx512/maskop.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/dtype_transfer.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_dlpack.h /usr/src/debug/python3-numpy/
 2.3.5/numpy/_core/src/multiarray/conversion_utils.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/dtype_transfer.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/conversion_utils.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/dtypemeta.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/arraytypes.c.src /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/dtypemeta.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/einsum_sumprod.c.src /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/abstractdtypes.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/mem_overlap.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/get_attr_string.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/getset.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/abstractdtypes.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/getset.c /usr/src/debug/python3-nump
 y/2.3.5/numpy/_core/src/common/mem_overlap.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/simd/intdiv.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/methods.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/_multiarray_tests.c.src /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/nditer_templ.c.src /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/convert.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/methods.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/convert.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/can_cast_table.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/temp_elide.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/calculation.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/dtype_traversal.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_partition.h /usr/src/debug/python3-numpy/2.3.5/numpy/
 _core/src/common/simd/avx512/math.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/arraytypes.h.src /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/calculation.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/temp_elide.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/dtype_traversal.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/datetime_busday.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/sequence.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/arraywrap.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/arraywrap.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/simd/avx512/memory.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/sequence.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/datetime_busday.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/common.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/
 src/common/simd/avx512/operators.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/datetime_busdaycal.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/einsum_sumprod.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/common.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/datetime_busdaycal.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/simd/avx512/reorder.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/mapping.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/mapping.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/nditer_constr.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/float_status.hpp /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/simd/emulate_maskop.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/half_private.hpp /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/lowlevel_strided_loops.c.src /usr/src/debug/python3-
 numpy/2.3.5/numpy/_core/src/multiarray/array_api_standard.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/arrayfunction_override.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/array_api_standard.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/arrayfunction_override.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/gil_utils.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/arrayobject.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/einsum.c.src /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_atomic.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/gil_utils.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/arrayobject.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/array_coercion.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/dragon4.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/lowlevel_strided_loops.h /usr/src
 /debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/dragon4.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/array_coercion.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/simd/avx512/avx512.h", added "/usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/simd/avx512/conversion.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/nditer_api.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/scalartypes.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/array_method.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/half.hpp /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/meta.hpp /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/npy_extint128.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/array_converter.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/npy_cpu_features.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/iterators.c /usr/src/debug/p
 ython3-numpy/2.4.1/numpy/_core/src/multiarray/array_assign_array.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/usertypes.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/array_method.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/npy_cpu_features.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/iterators.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/usertypes.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/array_converter.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/alloc.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/nditer_pywrap.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/ufunc_override.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/ctors.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/descriptor.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/nditer_pywrap.c /usr/src/debug/python3-numpy
 /2.4.1/numpy/_core/src/multiarray/alloc.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/unique.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/descriptor.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/binop_override.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/ufunc_override.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/ctors.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/array_assign.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/datetime_strings.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/numpy_tag.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/array_assign.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/datetime_strings.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/public_dtype_api.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/npy_hashtable.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multi
 array/convert_datatype.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/public_dtype_api.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/convert_datatype.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/unique.cpp /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/npy_sort.h.src /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/simd/simd.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/shape.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/npy_binsearch.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/templ_common.h.src /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/shape.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/array_assign_scalar.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/vdot.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/nditer_impl.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/vdot.h /usr/
 src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/scalartypes.c.src /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/common_dtype.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/npy_hashtable.cpp /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/npstd.hpp /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/utils.hpp /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/npy_static_data.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/multiarraymodule.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/npy_buffer.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/multiarraymodule.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/npy_static_data.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/compiled_base.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/compiled_base.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/strfuncs.c /usr/sr
 c/debug/python3-numpy/2.4.1/numpy/_core/src/common/simd/avx512/misc.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/simd/avx512/arithmetic.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/strfuncs.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/npy_longdouble.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/npy_import.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/npy_argparse.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/umathmodule.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/npy_argparse.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/npy_longdouble.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/npy_import.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/einsum.cpp /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/blas_utils.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/flagsobject.h /usr/src/debug/python3-numpy/2.4.1/numpy/
 _core/src/multiarray/item_selection.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/blas_utils.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/flagsobject.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/item_selection.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/npy_cpu_dispatch.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/hashdescr.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/fnv.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/npy_cpu_dispatch.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/fnv.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/hashdescr.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/simd/simd.hpp /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/legacy_dtype_implementation.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/argfunc.dispatch.c.src /usr/src/debug/python3-numpy/2.4.1/numpy/_core
 /src/multiarray/legacy_dtype_implementation.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/datetime.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/dlpack.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/npy_ctypes.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/numpyos.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/scalarapi.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/number.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/number.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/_datetime.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/numpyos.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/refcount.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/buffer.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/refcount.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/simd/avx512/maskop.h /usr/src/debug
 /python3-numpy/2.4.1/numpy/_core/src/common/raii_utils.hpp /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/dtype_transfer.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/npy_dlpack.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/conversion_utils.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/dtype_transfer.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/conversion_utils.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/dtypemeta.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/arraytypes.c.src /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/dtypemeta.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/einsum_sumprod.c.src /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/simd/simd.inc.hpp /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/abstractdtypes.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/mem_overlap.h /usr/src/d
 ebug/python3-numpy/2.4.1/numpy/_core/src/common/get_attr_string.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/getset.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/abstractdtypes.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/getset.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/mem_overlap.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/simd/intdiv.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/methods.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/_multiarray_tests.c.src /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/nditer_templ.c.src /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/convert.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/methods.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/convert.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/can_cast_table.h /usr/src/debug/python3-numpy/2.4
 .1/numpy/_core/src/multiarray/temp_elide.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/calculation.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/dtype_traversal.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/npy_partition.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/simd/avx512/math.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/arraytypes.h.src /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/calculation.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/temp_elide.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/dtype_traversal.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/datetime_busday.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/sequence.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/arraywrap.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/arraywrap.h /usr/src/debug/python3-numpy/2.4.1/n
 umpy/_core/src/common/simd/avx512/memory.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/sequence.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/datetime_busday.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/common.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/simd/avx512/operators.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/datetime_busdaycal.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/einsum_sumprod.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/common.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/datetime_busdaycal.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/simd/avx512/reorder.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/mapping.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/mapping.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/nditer_constr.c /usr/src/debug/python3-numpy/2
 .4.1/numpy/_core/src/common/float_status.hpp /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/simd/emulate_maskop.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/half_private.hpp /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/lowlevel_strided_loops.c.src /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/array_api_standard.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/arrayfunction_override.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/array_api_standard.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/arrayfunction_override.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/gil_utils.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/arrayobject.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/npy_atomic.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/gil_utils.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/arrayobject.h /us
 r/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/array_coercion.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/dragon4.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/lowlevel_strided_loops.h /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/dragon4.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/multiarray/array_coercion.c /usr/src/debug/python3-numpy/2.4.1/numpy/_core/src/common/simd/avx512/avx512.h"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-staticdev: PV changed from "2.3.5" to "2.4.1"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-staticdev: PKGSIZE changed from 354326 to 355718 (+0%)
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-staticdev: PKGV changed from 2.3.5 [default] to 2.4.1 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy: PV changed from "2.3.5" to "2.4.1"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy: PKGSIZE changed from 40809996 to 39813076 (-2%)
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy: PKGV changed from 2.3.5 [default] to 2.4.1 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy: FILELIST: removed "/usr/lib/python3.13/site-packages/numpy/typing/tests/data/pass/__pycache__/simple_py3.cpython-313.pyc /usr/lib/python3.13/site-packages/numpy/fft/__pycache__/helper.cpython-313.pyc /usr/lib/python3.13/site-packages/numpy/_core/_machar.pyi /usr/lib/python3.13/site-packages/numpy/linalg/linalg.pyi /usr/lib/python3.13/site-packages/numpy/linalg/linalg.py /usr/lib/python3.13/site-packages/numpy-2.3.5.dist-info/LICENSE.txt /usr/lib/python3.13/site-packages/numpy/_core/__pycache__/_machar.cpython-313.pyc /usr/lib/python3.13/site-packages/numpy/typing/tests/data/pass/simple_py3.py /usr/lib/python3.13/site-packages/numpy/_core/tests/__pycache__/test_machar.cpython-313.pyc /usr/lib/python3.13/site-packages/numpy/_core/tests/test_machar.py /usr/lib/python3.13/site-packages/numpy/linalg/__pycache__/linalg.cpython-313.pyc /usr/lib/python3.13/site-packages/numpy-2.3.5.dist-info/entry_points.txt /usr/lib/python3.13/site-
 packages/numpy-2.3.5.dist-info/WHEEL /usr/lib/python3.13/site-packages/numpy/fft/helper.py /usr/lib/python3.13/site-packages/numpy-2.3.5.dist-info/METADATA /usr/lib/python3.13/site-packages/numpy/_core/_machar.py /usr/lib/python3.13/site-packages/numpy/fft/helper.pyi", added "/usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/include/numpy/libdivide/LICENSE.txt /usr/lib/python3.13/site-packages/numpy/_core/tests/__pycache__/test_finfo.cpython-313.pyc /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/LICENSE.txt /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/umath/svml/LICENSE /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/highway/LICENSE /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/splitmix64/LICENSE.md /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/npysort/x86-simd-sort/LICENSE.md /usr/lib/python3.13/site
 -packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/mt19937/LICENSE.md /usr/lib/python3.13/site-packages/numpy/_core/tests/test_finfo.py /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/ma/LICENSE /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/LICENSE.md /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/common/pythoncapi-compat/COPYING /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/WHEEL /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/distributions/LICENSE.md /usr/lib/python3.13/site-packages/numpy/ma/testutils.pyi /usr/lib/python3.13/site-packages/numpy/_core/tests/__pycache__/test_multiprocessing.cpython-313.pyc /usr/lib/python3.13/site-packages/numpy/_core/tests/test_multiprocessing.py /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/METADATA /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/fft/pocketfft/LICENSE.md /usr/
 lib/python3.13/site-packages/numpy/typing/__init__.pyi /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/multiarray/dragon4_LICENSE.txt /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/pcg64/LICENSE.md /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/sfc64/LICENSE.md /usr/lib/python3.13/site-packages/numpy/_core/_umath_tests.pyi /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/philox/LICENSE.md /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/entry_points.txt /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/linalg/lapack_lite/LICENSE.txt"
Changes to packages/x86-64-v3-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.13/site-packages/numpy-2.3.5.dist-info moved to /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/include was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/include/numpy was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/include/numpy/libdivide was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/include/numpy/libdivide/LICENSE.txt was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/common was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/common/pythoncapi-compat was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/common/pythoncapi-compat/COPYING was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/highway was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/highway/LICENSE was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/multiarray was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/multiarray/dragon4_LICENSE.txt was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/npysort was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/npysort/x86-simd-sort was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/npysort/x86-simd-sort/LICENSE.md was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/umath was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/umath/svml was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/_core/src/umath/svml/LICENSE was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/fft was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/fft/pocketfft was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/fft/pocketfft/LICENSE.md was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/linalg was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/linalg/lapack_lite was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/linalg/lapack_lite/LICENSE.txt was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/ma was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/ma/LICENSE was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/LICENSE.md was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/distributions was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/distributions/LICENSE.md was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/mt19937 was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/mt19937/LICENSE.md was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/pcg64 was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/pcg64/LICENSE.md was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/philox was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/philox/LICENSE.md was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/sfc64 was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/sfc64/LICENSE.md was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/splitmix64 was added
  /usr/lib/python3.13/site-packages/numpy-2.4.1.dist-info/licenses/numpy/random/src/splitmix64/LICENSE.md was added
  /usr/lib/python3.13/site-packages/numpy/_core/tests/__pycache__/test_finfo.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/numpy/_core/tests/__pycache__/test_multiprocessing.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/numpy/_core/tests/test_finfo.py was added
  /usr/lib/python3.13/site-packages/numpy/_core/tests/test_multiprocessing.py was added
  /usr/lib/python3.13/site-packages/numpy/_core/_umath_tests.pyi was added
  /usr/lib/python3.13/site-packages/numpy/ma/testutils.pyi was added
  /usr/lib/python3.13/site-packages/numpy/typing/__init__.pyi was added
  /usr/lib/python3.13/site-packages/numpy-2.3.5.dist-info/LICENSE.txt was removed
  /usr/lib/python3.13/site-packages/numpy/_core/_machar.py was removed
  /usr/lib/python3.13/site-packages/numpy/_core/_machar.pyi was removed
  /usr/lib/python3.13/site-packages/numpy/_core/__pycache__/_machar.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/numpy/_core/tests/__pycache__/test_machar.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/numpy/_core/tests/test_machar.py was removed
  /usr/lib/python3.13/site-packages/numpy/fft/helper.py was removed
  /usr/lib/python3.13/site-packages/numpy/fft/helper.pyi was removed
  /usr/lib/python3.13/site-packages/numpy/fft/__pycache__/helper.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/numpy/linalg/linalg.py was removed
  /usr/lib/python3.13/site-packages/numpy/linalg/linalg.pyi was removed
  /usr/lib/python3.13/site-packages/numpy/linalg/__pycache__/linalg.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/numpy/typing/tests/data/pass/__pycache__/simple_py3.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/numpy/typing/tests/data/pass/simple_py3.py was removed

--===============1033221598244181167==--

