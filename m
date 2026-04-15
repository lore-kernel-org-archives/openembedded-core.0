Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D78FF4213B
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:40 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19809.1776261870602113538
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=VfDQ1UI3;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=bpKFEENl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019d9175566c-a3398fbc-f7f1-4cbd-8330-43f366ad0512-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261879;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xl6WYBwS10mp7QgJISURe5+W2bZJ2c3bPQFvTsGMo+Q=;
	b=VfDQ1UI35Aj6ELboxJvhprfphep4S0rnbQfkmy2N38xeBB4iJEVPNnYI3XrxO6L2
	ZWt3Xo2CxVAgsAp8+Rt0582e9VpXtZ64QQ3nCvVnZt/cvoGOr2SJw7s8+/slxMJJsJo
	Cuj36X8hrF9KmF3qijWBQir4MSks3SEDdAaaxI/w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261879;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xl6WYBwS10mp7QgJISURe5+W2bZJ2c3bPQFvTsGMo+Q=;
	b=bpKFEENlFPMF2xvIlhnaL+wvAncYV19zAoac2gxWuchJ2iOFpfcUrV0ejOELYfEY
	2mepTGNkwi8aWvO59Sr4lAUeuPmsNJlgi0cXp/Sl3+hA0dH2lUUCz9Mns3djuwmzBB6
	t3xy5hAb+aLtKqGjkgtId0jmJqDNUBkT20JXL5Fg=
Content-Type: multipart/mixed; boundary="===============8748367889382547532=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-packaging: upgrading to 26.1 SUCCEEDED
Message-ID: <0101019d9175566c-a3398fbc-f7f1-4cbd-8330-43f366ad0512-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235235

--===============8748367889382547532==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-packaging* to *26.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-packaging-upgrade-26.0-26.1.patch
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
From b62cd0c42c9cd7e9820ff50a85bb22c18312beee Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 08:27:13 +0000
Subject: [PATCH] python3-packaging: upgrade 26.0 -> 26.1

---
 .../{python3-packaging_26.0.bb => python3-packaging_26.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-packaging_26.0.bb => python3-packaging_26.1.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-packaging_26.0.bb b/meta/recipes-devtools/python/python3-packaging_26.1.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-packaging_26.0.bb
rename to meta/recipes-devtools/python/python3-packaging_26.1.bb
index ff45cb5133..622b00cc3c 100644
--- a/meta/recipes-devtools/python/python3-packaging_26.0.bb
+++ b/meta/recipes-devtools/python/python3-packaging_26.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/packaging"
 LICENSE = "Apache-2.0 | BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=faadaedca9251a90b205c9167578ce91"
 
-SRC_URI[sha256sum] = "00243ae351a257117b6a241061796684b084ed1c516a08c48a3f7e147a9d80b4"
+SRC_URI[sha256sum] = "f042152b681c4bfac5cae2742a55e103d27ab2ec0f3d88037136b6bfe7c9c5de"
 
 SRC_URI += "file://run-ptest.in"
 
-- 
2.47.1


--===============8748367889382547532==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-ptest: FILELIST: removed "/usr/lib/python3-packaging/ptest/tests/test_structures.py", added "/usr/lib/python3-packaging/ptest/tests/test_dependency_groups.py /usr/lib/python3-packaging/ptest/tests/property/test_version_ordering.py /usr/lib/python3-packaging/ptest/tests/property/test_version_format.py /usr/lib/python3-packaging/ptest/tests/test_errors.py /usr/lib/python3-packaging/ptest/tests/property/test_version_normalization.py /usr/lib/python3-packaging/ptest/tests/test_direct_url.py /usr/lib/python3-packaging/ptest/tests/property/strategies.py /usr/lib/python3-packaging/ptest/tests/property/test_specifier_implied.py /usr/lib/python3-packaging/ptest/tests/property/test_version_releases.py /usr/lib/python3-packaging/ptest/tests/conftest.py /usr/lib/python3-packaging/ptest/tests/test_pylock_select.py /usr/lib/python3-packaging/ptest/tests/property/test_specifier_comparison.py /usr/lib/python3-packaging/ptest/tests/pro
 perty/__init__.py /usr/lib/python3-packaging/ptest/tests/property/test_specifier_matching.py /usr/lib/python3-packaging/ptest/tests/property/test_specifier_extended.py"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-ptest: PKGSIZE changed from 311714 to 613620 (+97%)
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging: FILELIST: directory renamed /usr/lib/python3.14/site-packages/packaging-26.0.dist-info -> /usr/lib/python3.14/site-packages/packaging-26.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/packaging-26.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/packaging-26.1.dist-info/licenses, removed "/usr/lib/python3.14/site-packages/packaging/_structures.py /usr/lib/python3.14/site-packages/packaging/__pycache__/_structures.cpython-314.pyc", added "/usr/lib/python3.14/site-packages/packaging/__pycache__/errors.cpython-314.pyc /usr/lib/python3.14/site-packages/packaging/__pycache__/dependency_groups.cpython-314.pyc /usr/lib/python3.14/site-packages/packaging/__pycache__/direct_url.cpython-314.pyc /usr/lib/python3.14/site-packages/packaging/dependency_groups.py /usr/lib/python3.14/site-packages/packaging/direct_url.py /usr/lib/python3.14/site-packages/packaging/errors.py"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging: PKGSIZE changed from 602735 to 798138 (+32%)
Changes to packages/x86-64-v3-poky-linux/python3-packaging (sysroot):
  /usr/lib/python3.14/site-packages/packaging-26.0.dist-info moved to /usr/lib/python3.14/site-packages/packaging-26.1.dist-info
  /usr/lib/python3.14/site-packages/packaging/dependency_groups.py was added
  /usr/lib/python3.14/site-packages/packaging/direct_url.py was added
  /usr/lib/python3.14/site-packages/packaging/errors.py was added
  /usr/lib/python3.14/site-packages/packaging/__pycache__/dependency_groups.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/packaging/__pycache__/direct_url.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/packaging/__pycache__/errors.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/packaging/__pycache__/_structures.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/packaging/_structures.py was removed
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8800.0-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8800.0-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8800.0-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8800.0-gdb.py was removed
Changes to packages/x86_64-linux/python3-packaging-native (sysroot):
  /usr/lib/python3.14/site-packages/packaging-26.0.dist-info moved to /usr/lib/python3.14/site-packages/packaging-26.1.dist-info
  /usr/lib/python3.14/site-packages/packaging/dependency_groups.py was added
  /usr/lib/python3.14/site-packages/packaging/direct_url.py was added
  /usr/lib/python3.14/site-packages/packaging/errors.py was added
  /usr/lib/python3.14/site-packages/packaging/__pycache__/dependency_groups.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/packaging/__pycache__/direct_url.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/packaging/__pycache__/errors.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/packaging/__pycache__/_structures.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/packaging/_structures.py was removed

--===============8748367889382547532==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-packaging-upgrade-26.0-26.1.patch"

RnJvbSBiNjJjZDBjNDJjOWNkN2U5ODIwZmY1MGE4NWJiMjJjMTgzMTJiZWVlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMDg6Mjc6MTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBhY2thZ2luZzogdXBncmFkZSAyNi4wIC0+IDI2LjEKCi0tLQogLi4uL3tweXRob24z
LXBhY2thZ2luZ18yNi4wLmJiID0+IHB5dGhvbjMtcGFja2FnaW5nXzI2LjEuYmJ9ICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1wYWNrYWdpbmdfMjYuMC5iYiA9
PiBweXRob24zLXBhY2thZ2luZ18yNi4xLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wYWNrYWdpbmdfMjYuMC5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wYWNrYWdpbmdfMjYuMS5iYgpzaW1pbGFyaXR5
IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtcGFja2FnaW5nXzI2LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1wYWNrYWdpbmdfMjYuMS5iYgppbmRleCBmZjQ1Y2I1MTMzLi42MjJiMDBjYzNj
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGFja2Fn
aW5nXzI2LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBh
Y2thZ2luZ18yNi4xLmJiCkBAIC0zLDcgKzMsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1
Yi5jb20vcHlwYS9wYWNrYWdpbmciCiBMSUNFTlNFID0gIkFwYWNoZS0yLjAgfCBCU0QtMi1DbGF1
c2UiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1mYWFkYWVkY2E5MjUx
YTkwYjIwNWM5MTY3NTc4Y2U5MSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjAwMjQzYWUzNTFh
MjU3MTE3YjZhMjQxMDYxNzk2Njg0YjA4NGVkMWM1MTZhMDhjNDhhM2Y3ZTE0N2E5ZDgwYjQiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiZjA0MjE1MmI2ODFjNGJmYWM1Y2FlMjc0MmE1NWUxMDNkMjdh
YjJlYzBmM2Q4ODAzNzEzNmI2YmZlN2M5YzVkZSIKIAogU1JDX1VSSSArPSAiZmlsZTovL3J1bi1w
dGVzdC5pbiIKIAotLSAKMi40Ny4xCgo=

--===============8748367889382547532==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-packaging: PKGV changed from 26.0 [default] to 26.1 [default]
packages/x86-64-v3-poky-linux/python3-packaging: PV changed from "26.0" to "26.1"
packages/x86-64-v3-poky-linux/python3-packaging: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/packaging/packaging-26.0.tar.gz;downloadfilename=packaging-26.0.tar.gz file://run-ptest.in" to "https://files.pythonhosted.org/packages/source/p/packaging/packaging-26.1.tar.gz;downloadfilename=packaging-26.1.tar.gz file://run-ptest.in"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-dbg: PKGV changed from 26.0 [default] to 26.1 [default]
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-dbg: PV changed from "26.0" to "26.1"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-dev: PKGV changed from 26.0 [default] to 26.1 [default]
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-dev: PV changed from "26.0" to "26.1"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-doc: PKGV changed from 26.0 [default] to 26.1 [default]
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-doc: PV changed from "26.0" to "26.1"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-locale: PKGV changed from 26.0 [default] to 26.1 [default]
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-locale: PV changed from "26.0" to "26.1"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-ptest: FILELIST: removed "/usr/lib/python3-packaging/ptest/tests/test_structures.py", added "/usr/lib/python3-packaging/ptest/tests/property/test_specifier_comparison.py /usr/lib/python3-packaging/ptest/tests/property/test_version_ordering.py /usr/lib/python3-packaging/ptest/tests/test_direct_url.py /usr/lib/python3-packaging/ptest/tests/property/__init__.py /usr/lib/python3-packaging/ptest/tests/test_errors.py /usr/lib/python3-packaging/ptest/tests/conftest.py /usr/lib/python3-packaging/ptest/tests/property/test_version_normalization.py /usr/lib/python3-packaging/ptest/tests/property/test_version_format.py /usr/lib/python3-packaging/ptest/tests/test_pylock_select.py /usr/lib/python3-packaging/ptest/tests/property/test_version_releases.py /usr/lib/python3-packaging/ptest/tests/property/strategies.py /usr/lib/python3-packaging/ptest/tests/property/test_specifier_implied.py /usr/lib/python3-packaging/ptest/tests/test_dep
 endency_groups.py /usr/lib/python3-packaging/ptest/tests/property/test_specifier_extended.py /usr/lib/python3-packaging/ptest/tests/property/test_specifier_matching.py"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-ptest: PKGV changed from 26.0 [default] to 26.1 [default]
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-ptest: PV changed from "26.0" to "26.1"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-ptest: PKGSIZE changed from 311714 to 613620 (+97%)
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-src: PKGV changed from 26.0 [default] to 26.1 [default]
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-src: PV changed from "26.0" to "26.1"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-staticdev: PKGV changed from 26.0 [default] to 26.1 [default]
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-staticdev: PV changed from "26.0" to "26.1"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging: FILELIST: directory renamed /usr/lib/python3.14/site-packages/packaging-26.0.dist-info -> /usr/lib/python3.14/site-packages/packaging-26.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/packaging-26.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/packaging-26.1.dist-info/licenses, removed "/usr/lib/python3.14/site-packages/packaging/__pycache__/_structures.cpython-314.pyc /usr/lib/python3.14/site-packages/packaging/_structures.py", added "/usr/lib/python3.14/site-packages/packaging/dependency_groups.py /usr/lib/python3.14/site-packages/packaging/__pycache__/direct_url.cpython-314.pyc /usr/lib/python3.14/site-packages/packaging/__pycache__/errors.cpython-314.pyc /usr/lib/python3.14/site-packages/packaging/__pycache__/dependency_groups.cpython-314.pyc /usr/lib/python3.14/site-packages/packaging/errors.py /usr/lib/python3.14/site-packages/packaging/direct_url.py"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging: PKGV changed from 26.0 [default] to 26.1 [default]
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging: PV changed from "26.0" to "26.1"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging: PKGSIZE changed from 602735 to 798138 (+32%)
Changes to packages/x86-64-v3-poky-linux/python3-packaging (sysroot):
  /usr/lib/python3.14/site-packages/packaging-26.0.dist-info moved to /usr/lib/python3.14/site-packages/packaging-26.1.dist-info
  /usr/lib/python3.14/site-packages/packaging/dependency_groups.py was added
  /usr/lib/python3.14/site-packages/packaging/direct_url.py was added
  /usr/lib/python3.14/site-packages/packaging/errors.py was added
  /usr/lib/python3.14/site-packages/packaging/__pycache__/dependency_groups.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/packaging/__pycache__/direct_url.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/packaging/__pycache__/errors.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/packaging/__pycache__/_structures.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/packaging/_structures.py was removed
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8800.0-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8800.0-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8800.0-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8800.0-gdb.py was removed
Changes to packages/x86_64-linux/python3-packaging-native (sysroot):
  /usr/lib/python3.14/site-packages/packaging-26.0.dist-info moved to /usr/lib/python3.14/site-packages/packaging-26.1.dist-info
  /usr/lib/python3.14/site-packages/packaging/dependency_groups.py was added
  /usr/lib/python3.14/site-packages/packaging/direct_url.py was added
  /usr/lib/python3.14/site-packages/packaging/errors.py was added
  /usr/lib/python3.14/site-packages/packaging/__pycache__/dependency_groups.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/packaging/__pycache__/direct_url.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/packaging/__pycache__/errors.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/packaging/__pycache__/_structures.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/packaging/_structures.py was removed

--===============8748367889382547532==--

