Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B3E8E9A050
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:41:46 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1383.1771440091132418618
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=p6a5T5ez;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=ksWmY4NO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019c720ee6c6-e45fb965-bd06-42ab-8623-4f7aa90bb139-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440105;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=bSR1LU9WhlA63DHZY2Wc1mcfk2BbAtNeEAsxFXM0gGo=;
	b=p6a5T5ezGqgB8fFFxjDzbgbPBVWdrs/omkgHOg/8nrfCeTy3/wazHvv8RlqDDeZ/
	Bd5YQc/apYpq161qcv4ZqUi/MxSxMwakxe6DV9xBhGDQl4mpaHUpkaOmyMP1i9P9Ho+
	6b/Q/Lf+u5eTRwkKjnLA2MLK5xdpMdzjmVtyGeCc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440105;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=bSR1LU9WhlA63DHZY2Wc1mcfk2BbAtNeEAsxFXM0gGo=;
	b=ksWmY4NOABZ76+LoBFqA2b+24VfDjn6QiBbn3D10i57MHL0nieti9hIfouxEUefw
	jNOl2cYDtbPWRZ9Ztgc+03dqRbatsGk+TNUOHLhQsqIAMm4xU7RjZYg0y3PZER57i2z
	TMuzMfrk8vRlwjiM9fCYETfcH2ffaOmUW4XNnWa8=
Content-Type: multipart/mixed; boundary="===============8454187861027943145=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools: upgrading to 82.0.0 SUCCEEDED
Message-ID: <0101019c720ee6c6-e45fb965-bd06-42ab-8623-4f7aa90bb139-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:41:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231364

--===============8454187861027943145==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-setuptools* to *82.0.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-upgrade-80.9.0-82.0.0.patch
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
From d1709a742dbdc69236a4237f8d6828691d2d0d43 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 13:53:21 +0000
Subject: [PATCH] python3-setuptools: upgrade 80.9.0 -> 82.0.0

---
 ...1-_distutils-sysconfig.py-make-it-possible-to-substite.patch | 2 +-
 ...ython3-setuptools_80.9.0.bb => python3-setuptools_82.0.0.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_80.9.0.bb => python3-setuptools_82.0.0.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
index 39153883b0..0fc5e3f134 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
@@ -1,4 +1,4 @@
-From e2eab8c254f16c461de25123f6859b8a18db5cd8 Mon Sep 17 00:00:00 2001
+From cb37237fd60689ccf999689ff60acabe8e1ec1de Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Wed, 11 May 2022 21:41:14 +0200
 Subject: [PATCH] _distutils/sysconfig.py: make it possible to substite the
diff --git a/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb b/meta/recipes-devtools/python/python3-setuptools_82.0.0.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-setuptools_80.9.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_82.0.0.bb
index 533d8ce3d4..e9313d2a07 100644
--- a/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_82.0.0.bb
@@ -11,7 +11,7 @@ CVE_PRODUCT = "python3-setuptools python:setuptools"
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "f36b47402ecde768dbfafc46e8e4207b4360c654f1f3bb84475f0a28628fb19c"
+SRC_URI[sha256sum] = "22e0a2d69474c6ae4feb01951cb69d515ed23728cf96d05513d36e42b62b37cb"
 
 DEPENDS += "python3"
 
-- 
2.47.1


--===============8454187861027943145==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-upgrade-80.9.0-82.0.0.patch"

RnJvbSBkMTcwOWE3NDJkYmRjNjkyMzZhNDIzN2Y4ZDY4Mjg2OTFkMmQwZDQzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTM6NTM6MjEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNldHVwdG9vbHM6IHVwZ3JhZGUgODAuOS4wIC0+IDgyLjAuMAoKLS0tCiAuLi4xLV9k
aXN0dXRpbHMtc3lzY29uZmlnLnB5LW1ha2UtaXQtcG9zc2libGUtdG8tc3Vic3RpdGUucGF0Y2gg
fCAyICstCiAuLi55dGhvbjMtc2V0dXB0b29sc184MC45LjAuYmIgPT4gcHl0aG9uMy1zZXR1cHRv
b2xzXzgyLjAuMC5iYn0gfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRo
b24zLXNldHVwdG9vbHNfODAuOS4wLmJiID0+IHB5dGhvbjMtc2V0dXB0b29sc184Mi4wLjAuYmJ9
ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXNldHVwdG9vbHMvMDAwMS1fZGlzdHV0aWxzLXN5c2NvbmZpZy5weS1tYWtlLWl0LXBvc3NpYmxl
LXRvLXN1YnN0aXRlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXNldHVwdG9vbHMvMDAwMS1fZGlzdHV0aWxzLXN5c2NvbmZpZy5weS1tYWtlLWl0LXBvc3NpYmxl
LXRvLXN1YnN0aXRlLnBhdGNoCmluZGV4IDM5MTUzODgzYjAuLjBmYzVlM2YxMzQgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzLzAwMDEt
X2Rpc3R1dGlscy1zeXNjb25maWcucHktbWFrZS1pdC1wb3NzaWJsZS10by1zdWJzdGl0ZS5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy8w
MDAxLV9kaXN0dXRpbHMtc3lzY29uZmlnLnB5LW1ha2UtaXQtcG9zc2libGUtdG8tc3Vic3RpdGUu
cGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGUyZWFiOGMyNTRmMTZjNDYxZGUyNTEyM2Y2ODU5
YjhhMThkYjVjZDggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGNiMzcyMzdmZDYwNjg5
Y2NmOTk5Njg5ZmY2MGFjYWJlOGUxZWMxZGUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgogRGF0ZTogV2VkLCAxMSBN
YXkgMjAyMiAyMTo0MToxNCArMDIwMAogU3ViamVjdDogW1BBVENIXSBfZGlzdHV0aWxzL3N5c2Nv
bmZpZy5weTogbWFrZSBpdCBwb3NzaWJsZSB0byBzdWJzdGl0ZSB0aGUKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzgwLjkuMC5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzgyLjAuMC5i
YgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtc2V0dXB0b29sc184MC45LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzgyLjAuMC5iYgppbmRleCA1MzNk
OGNlM2Q0Li5lOTMxM2QyYTA3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtc2V0dXB0b29sc184MC45LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHNfODIuMC4wLmJiCkBAIC0xMSw3ICsxMSw3IEBA
IENWRV9QUk9EVUNUID0gInB5dGhvbjMtc2V0dXB0b29scyBweXRob246c2V0dXB0b29scyIKIFNS
Q19VUkkgKz0gIiBcCiAgICAgICAgICAgICBmaWxlOi8vMDAwMS1fZGlzdHV0aWxzLXN5c2NvbmZp
Zy5weS1tYWtlLWl0LXBvc3NpYmxlLXRvLXN1YnN0aXRlLnBhdGNoIgogCi1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiZjM2YjQ3NDAyZWNkZTc2OGRiZmFmYzQ2ZThlNDIwN2I0MzYwYzY1NGYxZjNiYjg0
NDc1ZjBhMjg2MjhmYjE5YyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIyMmUwYTJkNjk0NzRjNmFl
NGZlYjAxOTUxY2I2OWQ1MTVlZDIzNzI4Y2Y5NmQwNTUxM2QzNmU0MmI2MmIzN2NiIgogCiBERVBF
TkRTICs9ICJweXRob24zIgogCi0tIAoyLjQ3LjEKCg==

--===============8454187861027943145==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-setuptools/python3-pkg-resources: FILELIST: removed all items "/usr/lib/python3.14/site-packages/pkg_resources/tests/__pycache__/test_markers.cpython-314.pyc /usr/lib/python3.14/site-packages/pkg_resources/tests/__pycache__/test_working_set.cpython-314.pyc /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package-zip/my-test-package.zip /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/dependency_links.txt /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package-source/__pycache__/setup.cpython-314.pyc /usr/lib/python3.14/site-packages/pkg_resources/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/SOURCES.txt /usr/lib/python3.14/site-packages/pkg_resources/tests/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-
 packages/pkg_resources/tests/test_pkg_resources.py /usr/lib/python3.14/site-packages/pkg_resources/tests/__init__.py /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_zipped-egg/my_test_package-1.0-py3.7.egg /usr/lib/python3.14/site-packages/pkg_resources/__init__.py /usr/lib/python3.14/site-packages/pkg_resources/tests/__pycache__/test_resources.cpython-314.pyc /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package-source/setup.cfg /usr/lib/python3.14/site-packages/pkg_resources/tests/test_integration_zope_interface.py /usr/lib/python3.14/site-packages/pkg_resources/tests/test_working_set.py /usr/lib/python3.14/site-packages/pkg_resources/tests/__pycache__/test_find_distributions.cpython-314.pyc /usr/lib/python3.14/site-packages/pkg_resources/tests/__pycache__/test_integration_zope_interface.cpython-314.pyc /usr/lib/python3.14/site-packages/pkg_resources/tests/test_markers.py /usr/lib/python3.14/site-packages/pkg_resources/py.typed /usr/
 lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/PKG-INFO /usr/lib/python3.14/site-packages/pkg_resources/tests/test_resources.py /usr/lib/python3.14/site-packages/pkg_resources/tests/test_find_distributions.py /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/zip-safe /usr/lib/python3.14/site-packages/pkg_resources/api_tests.txt /usr/lib/python3.14/site-packages/pkg_resources/tests/__pycache__/test_pkg_resources.cpython-314.pyc /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/top_level.txt /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package-source/setup.py"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-pkg-resources: PKGSIZE changed from 492729 to 0 (-100%)
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools: FILELIST: directory renamed /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info -> /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli -> /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands, directory renamed /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/__pycache__ -> /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/context/__pycache__, directory renamed /usr/lib/python3.14/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.8.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/__pycache__ -> /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/__pycache__, directory rena
 med /usr/lib/python3.14/site-packages/setuptools-80.9.0.dist-info -> /usr/lib/python3.14/site-packages/setuptools-82.0.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info -> /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect -> /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/context, directory renamed /usr/lib/python3.14/site-packages/setuptools-80.9.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.7.1.dist-info/licenses, removed "/usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/requirements.py /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_musllinux.py /usr/lib/python3.14/site-packages/setuptools/_vendor/
 jaraco.text-3.12.1.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/utils.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.45.1.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info/LICENSE.APACHE /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_suppression.py /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_exceptions.py /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/compat/__pycache__/py38.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/compat/py38.py /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_tokenizer.py /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__
 /_decorators.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/version.py /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.45.1.dist-info/LICENSE.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_functions.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/top_level.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.45.1.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.45.1.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_pytest_plugin.cpython-314.pyc /usr/lib/python3.14/site-packages/s
 etuptools/_vendor/wheel/vendored/packaging/_elffile.py /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/collections/py.typed /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__init__.py /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/specifiers.py /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/markers.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_tokenizer.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_manylinux
 .cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_musllinux.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_structures.py /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_decorators.py /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_union_transformer.py /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_config.py /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/utils.py /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/compat/__pycache__/__init__.cpytho
 n-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/collections/__init__.py /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/markers.py /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info/LICENSE.BSD /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/__pycache__/context.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/entry_points.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/__init__.py /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/tags.py /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_functions.py /usr/lib/python3.14
 /site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/version.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_memo.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_transformer.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/requirements.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/LICENSE.APACHE /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_v
 endor/typeguard/_importhook.py /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_parser.py /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/tags.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/collections/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_checkers.py /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/__pycache__/util.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info/REQUESTED /usr/lib/python3.14/site-pack
 ages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_elffile.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/top_level.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_importhook.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_config.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_pytest_plugin.py /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_parser.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/v
 endored/vendor.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/context.py /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_transformer.py /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/top_level.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_checkers.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_memo.py /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/LICENSE /usr/lib/python3.14/
 site-packages/setuptools/_vendor/__pycache__/typing_extensions.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/top_level.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_utils.py /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_union_transformer.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_suppression.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/top_level.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_manylinux.py /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/pack
 aging/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/util.py /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/specifiers.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_exceptions.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_structures.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.45.1.dist-info/entry_points.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/INSTALLER /usr/lib/python
 3.14/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/top_level.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/top_level.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__init__.py /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/py.typed /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/LICENSE.BSD /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/WHEEL /usr/lib/pyth
 on3.14/site-packages/setuptools/_vendor/typing_extensions.py /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.45.1.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/compat/__init__.py /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_utils.cpython-314.pyc", added "/usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.4.0.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/platformdirs-4.4.0.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.46.3.dist-info/licenses/LICENSE.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.23.0.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/top_level.txt /usr/lib/python3.14/si
 te-packages/setuptools/_vendor/more_itertools-10.8.0.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_metadata.py /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.23.0.dist-info/licenses/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/licenses/LICENSE.BSD /usr/lib/python3.14/site-packages/setuptools/_vendor/platformdirs-4.4.0.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/platformdirs-4.4.0.dist-info/licenses/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/_functools.py /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/compat/__pycache__/py313.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/licenses/LICENSE.APACHE /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/pylock.py /usr/lib/python3.14/site-package
 s/setuptools/_vendor/platformdirs-4.4.0.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.46.3.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.7.1.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/compat/overlay.py /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.8.0.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/licenses/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/platformdirs-4.4.0.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/.lock /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/licenses/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.46.3.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/
 importlib_metadata-8.7.1.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/compat/__pycache__/overlay.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/__pycache__/_metadata.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/__pycache__/_functools.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools-82.0.0.dist-info/licenses/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.4.0.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/top_level.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.8.0.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.4.0.dist-info/REQUESTED /usr/lib/python3.14/site-packages/
 setuptools/_vendor/importlib_metadata-8.7.1.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/_typing.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.4.0.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/__pycache__/pylock.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.46.3.dist-info/entry_points.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.7.1.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.23.0.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata/_typing.py /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/compat/py313.py /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.23.0.dist-info/REQUESTED /usr/lib/python3.14/site-packages/set
 uptools/_vendor/importlib_metadata-8.7.1.dist-info/top_level.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.4.0.dist-info/licenses/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/licenses/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.23.0.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.8.0.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.23.0.dist-info/top_level.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.46.3.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.46.3.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/REQUESTED"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools: PKGSIZE changed from 8385954 to 7347833 (-12%)
Changes to packages/x86-64-v3-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.14/site-packages/setuptools-80.9.0.dist-info moved to /usr/lib/python3.14/site-packages/setuptools-82.0.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.7.1.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.8.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/platformdirs-4.4.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.4.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.45.1.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.46.3.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.23.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info/REQUESTED was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.7.1.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.7.1.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/_typing.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata/_typing.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/context was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/INSTALLER was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/REQUESTED was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/context/__init__.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/context/__pycache__ was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/context/__pycache__/__init__.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/context/py.typed was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/INSTALLER was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/REQUESTED was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info/INSTALLER was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info/REQUESTED was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/.lock was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.8.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.8.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/licenses/LICENSE.APACHE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/licenses/LICENSE.BSD was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/__pycache__/pylock.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/pylock.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.4.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.4.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.46.3.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.46.3.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/convert.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/__init__.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/pack.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/__pycache__ was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/__pycache__/convert.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/__pycache__/__init__.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/__pycache__/pack.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/__pycache__/tags.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/__pycache__/unpack.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/tags.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/unpack.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_metadata.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/__pycache__/_metadata.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.23.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.23.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/compat/overlay.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/compat/py313.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/compat/__pycache__/overlay.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/compat/__pycache__/py313.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/_functools.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/__pycache__/_functools.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pkg_resources was removed
  /usr/lib/python3.14/site-packages/pkg_resources/api_tests.txt was removed
  /usr/lib/python3.14/site-packages/pkg_resources/__init__.py was removed
  /usr/lib/python3.14/site-packages/pkg_resources/__pycache__ was removed
  /usr/lib/python3.14/site-packages/pkg_resources/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pkg_resources/py.typed was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package-source was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package-source/__pycache__ was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package-source/__pycache__/setup.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package-source/setup.cfg was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package-source/setup.py was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/dependency_links.txt was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/PKG-INFO was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/SOURCES.txt was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/top_level.txt was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/zip-safe was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package-zip was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package-zip/my-test-package.zip was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_zipped-egg was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_zipped-egg/my_test_package-1.0-py3.7.egg was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/__init__.py was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/__pycache__ was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/__pycache__/test_find_distributions.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/__pycache__/test_integration_zope_interface.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/__pycache__/test_markers.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/__pycache__/test_pkg_resources.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/__pycache__/test_resources.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/__pycache__/test_working_set.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/test_find_distributions.py was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/test_integration_zope_interface.py was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/test_markers.py was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/test_pkg_resources.py was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/test_resources.py was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/test_working_set.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/compat was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/compat/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/compat/py38.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/compat/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/compat/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/compat/__pycache__/py38.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/py.typed was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/collections was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/REQUESTED was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/collections/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/collections/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/collections/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/collections/py.typed was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/context.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/__pycache__/context.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/REQUESTED was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info/LICENSE.APACHE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info/LICENSE.BSD was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/__pycache__/typing_extensions.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_checkers.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_config.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_decorators.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_exceptions.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_functions.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_importhook.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_memo.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_checkers.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_config.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_decorators.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_exceptions.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_functions.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_importhook.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_memo.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_pytest_plugin.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_suppression.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_transformer.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_union_transformer.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_utils.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_pytest_plugin.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/py.typed was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_suppression.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_transformer.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_union_transformer.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_utils.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.45.1.dist-info/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/convert.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/pack.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/__pycache__/convert.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/__pycache__/pack.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/__pycache__/tags.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/__pycache__/unpack.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/tags.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/unpack.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/__pycache__/util.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/util.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_elffile.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/LICENSE.APACHE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/LICENSE.BSD was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_manylinux.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/markers.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_musllinux.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_parser.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_elffile.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_manylinux.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/markers.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_musllinux.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_parser.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/requirements.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/specifiers.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_structures.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/tags.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_tokenizer.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/utils.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/version.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/requirements.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/specifiers.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_structures.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/tags.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_tokenizer.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/utils.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/version.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/vendor.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/LICENSE was removed
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.3-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.3-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.3-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.3-gdb.py was removed
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.14/site-packages/setuptools-80.9.0.dist-info moved to /usr/lib/python3.14/site-packages/setuptools-82.0.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.7.1.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.8.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/platformdirs-4.4.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.4.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.45.1.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.46.3.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.23.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info/REQUESTED was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.7.1.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.7.1.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata/_typing.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/context was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/INSTALLER was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/REQUESTED was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/context/__init__.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/context/py.typed was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/INSTALLER was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/REQUESTED was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info/INSTALLER was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info/REQUESTED was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/.lock was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.8.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.8.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/licenses/LICENSE.APACHE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/licenses/LICENSE.BSD was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/pylock.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.4.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.4.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.46.3.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.46.3.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/convert.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/__init__.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/pack.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/tags.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/unpack.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_metadata.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.23.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.23.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/compat/overlay.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/compat/py313.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/_functools.py was added
  /usr/lib/python3.14/site-packages/pkg_resources was removed
  /usr/lib/python3.14/site-packages/pkg_resources/api_tests.txt was removed
  /usr/lib/python3.14/site-packages/pkg_resources/__init__.py was removed
  /usr/lib/python3.14/site-packages/pkg_resources/py.typed was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package-source was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package-source/setup.cfg was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package-source/setup.py was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/dependency_links.txt was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/PKG-INFO was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/SOURCES.txt was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/top_level.txt was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/zip-safe was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package-zip was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package-zip/my-test-package.zip was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_zipped-egg was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_zipped-egg/my_test_package-1.0-py3.7.egg was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/__init__.py was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/test_find_distributions.py was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/test_integration_zope_interface.py was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/test_markers.py was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/test_pkg_resources.py was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/test_resources.py was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/test_working_set.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/compat was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/compat/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/compat/py38.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/py.typed was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/collections was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/REQUESTED was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/collections/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/collections/py.typed was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/context.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/REQUESTED was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info/LICENSE.APACHE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info/LICENSE.BSD was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_checkers.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_config.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_decorators.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_exceptions.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_functions.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_importhook.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_memo.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_pytest_plugin.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/py.typed was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_suppression.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_transformer.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_union_transformer.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_utils.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.45.1.dist-info/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/convert.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/pack.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/tags.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/unpack.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/util.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_elffile.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/LICENSE.APACHE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/LICENSE.BSD was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_manylinux.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/markers.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_musllinux.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_parser.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/requirements.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/specifiers.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_structures.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/tags.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_tokenizer.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/utils.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/version.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/vendor.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/LICENSE was removed

--===============8454187861027943145==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-setuptools: PV changed from "80.9.0" to "82.0.0"
packages/x86-64-v3-poky-linux/python3-setuptools: PKGV changed from 80.9.0 [default] to 82.0.0 [default]
packages/x86-64-v3-poky-linux/python3-setuptools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-80.9.0.tar.gz;downloadfilename=setuptools-80.9.0.tar.gz file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch" to "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-82.0.0.tar.gz;downloadfilename=setuptools-82.0.0.tar.gz file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-pkg-resources: PV changed from "80.9.0" to "82.0.0"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-pkg-resources: PKGSIZE changed from 492729 to 0 (-100%)
packages/x86-64-v3-poky-linux/python3-setuptools/python3-pkg-resources: FILELIST: removed all items "/usr/lib/python3.14/site-packages/pkg_resources/tests/__pycache__/test_working_set.cpython-314.pyc /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package-source/setup.py /usr/lib/python3.14/site-packages/pkg_resources/api_tests.txt /usr/lib/python3.14/site-packages/pkg_resources/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package-zip/my-test-package.zip /usr/lib/python3.14/site-packages/pkg_resources/tests/__pycache__/test_markers.cpython-314.pyc /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/top_level.txt /usr/lib/python3.14/site-packages/pkg_resources/tests/test_pkg_resources.py /usr/lib/python3.14/site-packages/pkg_resources/tests/__init__.py /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package-source/s
 etup.cfg /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_zipped-egg/my_test_package-1.0-py3.7.egg /usr/lib/python3.14/site-packages/pkg_resources/tests/test_markers.py /usr/lib/python3.14/site-packages/pkg_resources/tests/test_integration_zope_interface.py /usr/lib/python3.14/site-packages/pkg_resources/tests/test_find_distributions.py /usr/lib/python3.14/site-packages/pkg_resources/tests/test_resources.py /usr/lib/python3.14/site-packages/pkg_resources/tests/__pycache__/test_resources.cpython-314.pyc /usr/lib/python3.14/site-packages/pkg_resources/py.typed /usr/lib/python3.14/site-packages/pkg_resources/tests/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/pkg_resources/tests/__pycache__/test_integration_zope_interface.cpython-314.pyc /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/SOURCES.txt /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-
 test-package-source/__pycache__/setup.cpython-314.pyc /usr/lib/python3.14/site-packages/pkg_resources/tests/test_working_set.py /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/dependency_links.txt /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/zip-safe /usr/lib/python3.14/site-packages/pkg_resources/__init__.py /usr/lib/python3.14/site-packages/pkg_resources/tests/__pycache__/test_find_distributions.cpython-314.pyc /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/PKG-INFO /usr/lib/python3.14/site-packages/pkg_resources/tests/__pycache__/test_pkg_resources.cpython-314.pyc"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-pkg-resources: PKGV changed from 80.9.0 [default] to 82.0.0 [default]
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-dbg: PV changed from "80.9.0" to "82.0.0"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-dbg: PKGV changed from 80.9.0 [default] to 82.0.0 [default]
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-dev: PV changed from "80.9.0" to "82.0.0"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-dev: PKGV changed from 80.9.0 [default] to 82.0.0 [default]
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-doc: PV changed from "80.9.0" to "82.0.0"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-doc: PKGV changed from 80.9.0 [default] to 82.0.0 [default]
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-locale: PV changed from "80.9.0" to "82.0.0"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-locale: PKGV changed from 80.9.0 [default] to 82.0.0 [default]
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-src: PV changed from "80.9.0" to "82.0.0"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-src: PKGV changed from 80.9.0 [default] to 82.0.0 [default]
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-staticdev: PV changed from "80.9.0" to "82.0.0"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-staticdev: PKGV changed from 80.9.0 [default] to 82.0.0 [default]
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools: PV changed from "80.9.0" to "82.0.0"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools: PKGSIZE changed from 8385954 to 7347833 (-12%)
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools: FILELIST: directory renamed /usr/lib/python3.14/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.7.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info -> /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/setuptools-80.9.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/setuptools/_vendor/platformdirs-4.4.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/__pycache__ -> /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/context/__pycache__, directory renamed /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/collections -> /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/contex
 t, directory renamed /usr/lib/python3.14/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info -> /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/__pycache__ -> /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/__pycache__, directory renamed /usr/lib/python3.14/site-packages/setuptools-80.9.0.dist-info -> /usr/lib/python3.14/site-packages/setuptools-82.0.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli -> /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands, removed "/usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_union_transformer.py /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/entry_points.txt /usr/lib/python3.14/site-packages/setuptools
 /_vendor/inflect-7.3.1.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.45.1.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/collections/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_parser.py /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.45.1.dist-info/entry_points.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/requirements.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info/LICENSE.APACHE /usr/lib/
 python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_tokenizer.py /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_suppression.py /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/specifiers.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__init__.py /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.45.1.dist-info/LICENSE.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/__pycache__/typing_extensions.cpython
 -314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_transformer.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_checkers.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/compat/__pycache__/py38.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/top_level.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/typin
 g_extensions-4.12.2.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/compat/__init__.py /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_elffile.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_memo.py /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/requirements.py /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/top_level.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/
 _vendor/wheel/vendored/packaging/_manylinux.py /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/tags.py /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_exceptions.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/utils.py /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_elffile.py /usr/lib/python3.14/site-packages/setuptools/_
 vendor/typeguard/__pycache__/_importhook.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_checkers.py /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_structures.py /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_structures.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_transformer.py /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/py.typed /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_musllinux.py /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/top_level.txt /usr/lib/python3.14/site-packages/setuptools/_ven
 dor/wheel/vendored/packaging/LICENSE.APACHE /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/specifiers.py /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_functions.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/__init__.py /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions.py /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info
 /WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.45.1.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_utils.py /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_config.py /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_suppression.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/markers.py /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_functions.py /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/util.py /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_tokenizer.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_manylinux.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_union_transformer.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging
 /__pycache__/_musllinux.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/compat/py38.py /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_memo.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/__pycache__/util.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/version.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/py.typed /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.45.1.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_decorators.py /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_pytest_plugin.py /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/WHEE
 L /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/tags.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/__init__.py /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/version.py /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__init__.py /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_exceptions.py /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/vendor.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.45.1.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_pytest_plugin.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/markers.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.
 dist-info/top_level.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_importhook.py /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_parser.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/__pycache__/context.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_utils.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/top_level.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/__init__.cpython-314.pyc /usr/lib/python
 3.14/site-packages/setuptools/_vendor/inflect/compat/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info/LICENSE.BSD /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/top_level.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/context.py /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_decorators.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/utils.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/ve
 ndored/packaging/LICENSE.BSD /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/top_level.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_config.cpython-314.pyc", added "/usr/lib/python3.14/site-packages/setuptools/_vendor/platformdirs-4.4.0.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/.lock /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.23.0.dist-info/top_level.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.23.0.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/__pycache__/_metadata.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/__pycache__/_functools.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.46.3.dist-info/
 INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.23.0.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.46.3.dist-info/entry_points.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.4.0.dist-info/licenses/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.23.0.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/compat/__pycache__/py313.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/licenses/LICENSE.BSD /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.8.0.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/top_level.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_metadata.py /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.8.0.
 dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/platformdirs-4.4.0.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.46.3.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/platformdirs-4.4.0.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/_functools.py /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.7.1.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/pylock.py /usr
 /lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.8.0.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/licenses/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.46.3.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.8.0.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/licenses/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.4.0.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/top_level.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.4.0.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.46.3.dist-info/licenses/LICENSE.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.4.0.di
 st-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.7.1.dist-info/top_level.txt /usr/lib/python3.14/site-packages/setuptools-82.0.0.dist-info/licenses/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/compat/py313.py /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata/_typing.py /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.7.1.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/_typing.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/licenses/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.23.0.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.4.0.dist
 -info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.7.1.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/licenses/LICENSE.APACHE /usr/lib/python3.14/site-packages/setuptools/_vendor/platformdirs-4.4.0.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/__pycache__/pylock.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/compat/overlay.py /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.46.3.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.7.1.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.23.0.dist-info/licenses/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.8.0.dist-info/licenses/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/compat/__pycache__/overlay.cpython-314.pyc"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools: PKGV changed from 80.9.0 [default] to 82.0.0 [default]
Changes to packages/x86-64-v3-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.14/site-packages/setuptools-80.9.0.dist-info moved to /usr/lib/python3.14/site-packages/setuptools-82.0.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.7.1.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.8.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/platformdirs-4.4.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.4.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.45.1.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.46.3.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.23.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info/REQUESTED was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.7.1.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.7.1.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/_typing.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata/_typing.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/context was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/INSTALLER was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/REQUESTED was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/context/__init__.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/context/__pycache__ was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/context/__pycache__/__init__.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/context/py.typed was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/INSTALLER was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/REQUESTED was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info/INSTALLER was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info/REQUESTED was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/.lock was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.8.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.8.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/licenses/LICENSE.APACHE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/licenses/LICENSE.BSD was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/__pycache__/pylock.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/pylock.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.4.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.4.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.46.3.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.46.3.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/convert.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/__init__.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/pack.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/__pycache__ was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/__pycache__/convert.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/__pycache__/__init__.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/__pycache__/pack.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/__pycache__/tags.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/__pycache__/unpack.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/tags.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/unpack.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_metadata.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/__pycache__/_metadata.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.23.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.23.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/compat/overlay.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/compat/py313.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/compat/__pycache__/overlay.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/compat/__pycache__/py313.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/_functools.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/__pycache__/_functools.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pkg_resources was removed
  /usr/lib/python3.14/site-packages/pkg_resources/api_tests.txt was removed
  /usr/lib/python3.14/site-packages/pkg_resources/__init__.py was removed
  /usr/lib/python3.14/site-packages/pkg_resources/__pycache__ was removed
  /usr/lib/python3.14/site-packages/pkg_resources/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pkg_resources/py.typed was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package-source was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package-source/__pycache__ was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package-source/__pycache__/setup.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package-source/setup.cfg was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package-source/setup.py was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/dependency_links.txt was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/PKG-INFO was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/SOURCES.txt was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/top_level.txt was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/zip-safe was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package-zip was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package-zip/my-test-package.zip was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_zipped-egg was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_zipped-egg/my_test_package-1.0-py3.7.egg was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/__init__.py was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/__pycache__ was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/__pycache__/test_find_distributions.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/__pycache__/test_integration_zope_interface.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/__pycache__/test_markers.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/__pycache__/test_pkg_resources.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/__pycache__/test_resources.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/__pycache__/test_working_set.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/test_find_distributions.py was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/test_integration_zope_interface.py was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/test_markers.py was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/test_pkg_resources.py was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/test_resources.py was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/test_working_set.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/compat was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/compat/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/compat/py38.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/compat/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/compat/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/compat/__pycache__/py38.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/py.typed was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/collections was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/REQUESTED was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/collections/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/collections/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/collections/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/collections/py.typed was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/context.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/__pycache__/context.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/REQUESTED was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info/LICENSE.APACHE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info/LICENSE.BSD was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/__pycache__/typing_extensions.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_checkers.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_config.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_decorators.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_exceptions.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_functions.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_importhook.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_memo.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_checkers.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_config.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_decorators.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_exceptions.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_functions.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_importhook.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_memo.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_pytest_plugin.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_suppression.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_transformer.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_union_transformer.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_utils.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_pytest_plugin.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/py.typed was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_suppression.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_transformer.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_union_transformer.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_utils.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.45.1.dist-info/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/convert.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/pack.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/__pycache__/convert.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/__pycache__/pack.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/__pycache__/tags.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/__pycache__/unpack.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/tags.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/unpack.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/__pycache__/util.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/util.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_elffile.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/LICENSE.APACHE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/LICENSE.BSD was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_manylinux.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/markers.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_musllinux.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_parser.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_elffile.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_manylinux.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/markers.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_musllinux.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_parser.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/requirements.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/specifiers.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_structures.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/tags.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_tokenizer.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/utils.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/version.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/requirements.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/specifiers.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_structures.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/tags.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_tokenizer.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/utils.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/version.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/vendor.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/LICENSE was removed
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.3-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.3-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.3-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.3-gdb.py was removed
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.14/site-packages/setuptools-80.9.0.dist-info moved to /usr/lib/python3.14/site-packages/setuptools-82.0.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.7.1.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.8.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/platformdirs-4.4.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.4.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.45.1.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.46.3.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.23.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info/REQUESTED was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.7.1.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.7.1.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata/_typing.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/context was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/INSTALLER was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/REQUESTED was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/context/__init__.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/context/py.typed was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/INSTALLER was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/REQUESTED was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info/INSTALLER was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info/REQUESTED was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/.lock was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.8.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.8.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/licenses/LICENSE.APACHE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/licenses/LICENSE.BSD was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/pylock.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.4.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.4.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.46.3.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.46.3.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/convert.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/__init__.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/pack.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/tags.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/unpack.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_metadata.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.23.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.23.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/compat/overlay.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/compat/py313.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/_functools.py was added
  /usr/lib/python3.14/site-packages/pkg_resources was removed
  /usr/lib/python3.14/site-packages/pkg_resources/api_tests.txt was removed
  /usr/lib/python3.14/site-packages/pkg_resources/__init__.py was removed
  /usr/lib/python3.14/site-packages/pkg_resources/py.typed was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package-source was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package-source/setup.cfg was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package-source/setup.py was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/dependency_links.txt was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/PKG-INFO was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/SOURCES.txt was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/top_level.txt was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/zip-safe was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package-zip was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package-zip/my-test-package.zip was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_zipped-egg was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/data/my-test-package_zipped-egg/my_test_package-1.0-py3.7.egg was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/__init__.py was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/test_find_distributions.py was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/test_integration_zope_interface.py was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/test_markers.py was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/test_pkg_resources.py was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/test_resources.py was removed
  /usr/lib/python3.14/site-packages/pkg_resources/tests/test_working_set.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/compat was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/compat/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/compat/py38.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/py.typed was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/collections was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/REQUESTED was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/collections/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/collections/py.typed was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/context.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/REQUESTED was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info/LICENSE.APACHE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info/LICENSE.BSD was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_checkers.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_config.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_decorators.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_exceptions.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_functions.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_importhook.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_memo.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_pytest_plugin.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/py.typed was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_suppression.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_transformer.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_union_transformer.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_utils.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.45.1.dist-info/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/convert.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/pack.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/tags.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/unpack.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/util.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_elffile.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/LICENSE.APACHE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/LICENSE.BSD was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_manylinux.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/markers.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_musllinux.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_parser.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/requirements.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/specifiers.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_structures.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/tags.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_tokenizer.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/utils.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/version.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/vendor.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/LICENSE was removed

--===============8454187861027943145==--

