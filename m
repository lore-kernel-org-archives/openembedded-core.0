Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A76BCCD3424
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:57 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15606.1777645529533463501
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=nUeL4nqt;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=yuxkHth1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019de3ee57c3-589c9dd5-ea2a-4508-8462-a02599db30fd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645541;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zJl6gpH2hyK9jpHonf25WxxpIoGCoi00l6AsinH5zL4=;
	b=nUeL4nqtRv3XINJGBPccmgwf2fogn6YQlrkKp+Yzxap0SYDnG6407jS0b/e6kFp3
	C1etzJCZ2fJBKbQn5FxHr83seSmytf4f1SX2DVQTWMPiikpJbtP8TZPE2zeh2HAYAMm
	iyA8z2zk2hndZdnxiDGFsGHUYSkd9CJCZ+yoUB5Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645541;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zJl6gpH2hyK9jpHonf25WxxpIoGCoi00l6AsinH5zL4=;
	b=yuxkHth121SNnLVTVBJ3EYUHp8291jRM7YYz9ayxLrxt/jw4htsQSqqcOBjdeCM5
	8T5ltnjBJnsH0SmwL3lPt32M9DmZPQwrctRnGUmjbw0Z/NX12qAwEjVLUz3b3r3gJxV
	VV8sTvu5HFYIapVK3wpkh/JxPkvytMyrqNQ7j/QQ=
Content-Type: multipart/mixed; boundary="===============3766317918942611227=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-packaging: upgrading to 26.2 SUCCEEDED
Message-ID: <0101019de3ee57c3-589c9dd5-ea2a-4508-8462-a02599db30fd-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236240

--===============3766317918942611227==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-packaging* to *26.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-packaging-upgrade-26.0-26.2.patch
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
From 59193a7e4a05b0bca422b8b94d2558ad8d67a039 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 08:53:35 +0000
Subject: [PATCH] python3-packaging: upgrade 26.0 -> 26.2

---
 .../{python3-packaging_26.0.bb => python3-packaging_26.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-packaging_26.0.bb => python3-packaging_26.2.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-packaging_26.0.bb b/meta/recipes-devtools/python/python3-packaging_26.2.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-packaging_26.0.bb
rename to meta/recipes-devtools/python/python3-packaging_26.2.bb
index ff45cb5133..1e4c0a6bd3 100644
--- a/meta/recipes-devtools/python/python3-packaging_26.0.bb
+++ b/meta/recipes-devtools/python/python3-packaging_26.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/packaging"
 LICENSE = "Apache-2.0 | BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=faadaedca9251a90b205c9167578ce91"
 
-SRC_URI[sha256sum] = "00243ae351a257117b6a241061796684b084ed1c516a08c48a3f7e147a9d80b4"
+SRC_URI[sha256sum] = "ff452ff5a3e828ce110190feff1178bb1f2ea2281fa2075aadb987c2fb221661"
 
 SRC_URI += "file://run-ptest.in"
 
-- 
2.47.1


--===============3766317918942611227==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-ptest: FILELIST: removed "/usr/lib/python3-packaging/ptest/tests/test_structures.py", added "/usr/lib/python3-packaging/ptest/tests/test_dependency_groups.py /usr/lib/python3-packaging/ptest/tests/test_errors.py /usr/lib/python3-packaging/ptest/tests/property/test_version_normalization.py /usr/lib/python3-packaging/ptest/tests/test_direct_url.py /usr/lib/python3-packaging/ptest/tests/property/test_version_ordering.py /usr/lib/python3-packaging/ptest/tests/property/test_version_format.py /usr/lib/python3-packaging/ptest/tests/property/test_specifier_matching.py /usr/lib/python3-packaging/ptest/tests/property/test_specifier_implied.py /usr/lib/python3-packaging/ptest/tests/property/test_version_releases.py /usr/lib/python3-packaging/ptest/tests/conftest.py /usr/lib/python3-packaging/ptest/tests/property/__init__.py /usr/lib/python3-packaging/ptest/tests/property/strategies.py /usr/lib/python3-packaging/ptest/tests/proper
 ty/test_specifier_extended.py /usr/lib/python3-packaging/ptest/tests/test_pylock_select.py /usr/lib/python3-packaging/ptest/tests/property/test_specifier_comparison.py"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-ptest: PKGSIZE changed from 311714 to 651821 (+109%)
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging: FILELIST: directory renamed /usr/lib/python3.14/site-packages/packaging-26.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/packaging-26.2.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/packaging-26.0.dist-info -> /usr/lib/python3.14/site-packages/packaging-26.2.dist-info, added "/usr/lib/python3.14/site-packages/packaging/__pycache__/direct_url.cpython-314.pyc /usr/lib/python3.14/site-packages/packaging/__pycache__/errors.cpython-314.pyc /usr/lib/python3.14/site-packages/packaging/__pycache__/dependency_groups.cpython-314.pyc /usr/lib/python3.14/site-packages/packaging/dependency_groups.py /usr/lib/python3.14/site-packages/packaging/direct_url.py /usr/lib/python3.14/site-packages/packaging/errors.py"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging: PKGSIZE changed from 602735 to 835406 (+39%)
Changes to packages/x86-64-v3-poky-linux/python3-packaging (sysroot):
  /usr/lib/python3.14/site-packages/packaging-26.0.dist-info moved to /usr/lib/python3.14/site-packages/packaging-26.2.dist-info
  /usr/lib/python3.14/site-packages/packaging/dependency_groups.py was added
  /usr/lib/python3.14/site-packages/packaging/direct_url.py was added
  /usr/lib/python3.14/site-packages/packaging/errors.py was added
  /usr/lib/python3.14/site-packages/packaging/__pycache__/dependency_groups.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/packaging/__pycache__/direct_url.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/packaging/__pycache__/errors.cpython-314.pyc was added
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
  /usr/lib/python3.14/site-packages/packaging-26.0.dist-info moved to /usr/lib/python3.14/site-packages/packaging-26.2.dist-info
  /usr/lib/python3.14/site-packages/packaging/dependency_groups.py was added
  /usr/lib/python3.14/site-packages/packaging/direct_url.py was added
  /usr/lib/python3.14/site-packages/packaging/errors.py was added
  /usr/lib/python3.14/site-packages/packaging/__pycache__/dependency_groups.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/packaging/__pycache__/direct_url.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/packaging/__pycache__/errors.cpython-314.pyc was added

--===============3766317918942611227==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-packaging-upgrade-26.0-26.2.patch"

RnJvbSA1OTE5M2E3ZTRhMDViMGJjYTQyMmI4Yjk0ZDI1NThhZDhkNjdhMDM5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAwODo1MzozNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcGFja2FnaW5nOiB1cGdyYWRlIDI2LjAgLT4gMjYuMgoKLS0tCiAuLi4ve3B5dGhvbjMt
cGFja2FnaW5nXzI2LjAuYmIgPT4gcHl0aG9uMy1wYWNrYWdpbmdfMjYuMi5iYn0gICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXBhY2thZ2luZ18yNi4wLmJiID0+
IHB5dGhvbjMtcGFja2FnaW5nXzI2LjIuYmJ9ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBhY2thZ2luZ18yNi4wLmJiIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBhY2thZ2luZ18yNi4yLmJiCnNpbWlsYXJpdHkg
aW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1wYWNrYWdpbmdfMjYuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXBhY2thZ2luZ18yNi4yLmJiCmluZGV4IGZmNDVjYjUxMzMuLjFlNGMwYTZiZDMg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wYWNrYWdp
bmdfMjYuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGFj
a2FnaW5nXzI2LjIuYmIKQEAgLTMsNyArMyw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHVi
LmNvbS9weXBhL3BhY2thZ2luZyIKIExJQ0VOU0UgPSAiQXBhY2hlLTIuMCB8IEJTRC0yLUNsYXVz
ZSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWZhYWRhZWRjYTkyNTFh
OTBiMjA1YzkxNjc1NzhjZTkxIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMDAyNDNhZTM1MWEy
NTcxMTdiNmEyNDEwNjE3OTY2ODRiMDg0ZWQxYzUxNmEwOGM0OGEzZjdlMTQ3YTlkODBiNCIKK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICJmZjQ1MmZmNWEzZTgyOGNlMTEwMTkwZmVmZjExNzhiYjFmMmVh
MjI4MWZhMjA3NWFhZGI5ODdjMmZiMjIxNjYxIgogCiBTUkNfVVJJICs9ICJmaWxlOi8vcnVuLXB0
ZXN0LmluIgogCi0tIAoyLjQ3LjEKCg==

--===============3766317918942611227==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/ca-certificates/ca-certificates-dev: FILES: removed "/lib/*.la /lib/lib*.so /lib/*.o"
packages/all-poky-linux/ca-certificates/ca-certificates-staticdev: FILES: removed "/lib/*.a"
packages/all-poky-linux/ca-certificates/ca-certificates: FILES: removed "/lib/*.so.* /sbin/* /bin/*", added "/usr/lib/*.so.*"
packages/all-poky-linux/tzdata/tzdata: FILES: removed "/lib/*.so.* /sbin/* /bin/*", added "/usr/lib/*.so.*"
packages/x86-64-v3-poky-linux/gcc-runtime/gcc-runtime-src: PKGSIZE changed from 9883625 to 9685472 (-2%)
packages/x86-64-v3-poky-linux/python3-packaging: PKGV changed from 26.0 [default] to 26.2 [default]
packages/x86-64-v3-poky-linux/python3-packaging: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/packaging/packaging-26.0.tar.gz;downloadfilename=packaging-26.0.tar.gz file://run-ptest.in" to "https://files.pythonhosted.org/packages/source/p/packaging/packaging-26.2.tar.gz;downloadfilename=packaging-26.2.tar.gz file://run-ptest.in"
packages/x86-64-v3-poky-linux/python3-packaging: PV changed from "26.0" to "26.2"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-dbg: PKGV changed from 26.0 [default] to 26.2 [default]
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-dbg: PV changed from "26.0" to "26.2"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-dev: PKGV changed from 26.0 [default] to 26.2 [default]
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-dev: PV changed from "26.0" to "26.2"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-doc: PKGV changed from 26.0 [default] to 26.2 [default]
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-doc: PV changed from "26.0" to "26.2"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-locale: PKGV changed from 26.0 [default] to 26.2 [default]
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-locale: PV changed from "26.0" to "26.2"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-ptest: PKGSIZE changed from 311714 to 651821 (+109%)
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-ptest: PKGV changed from 26.0 [default] to 26.2 [default]
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-ptest: FILELIST: removed "/usr/lib/python3-packaging/ptest/tests/test_structures.py", added "/usr/lib/python3-packaging/ptest/tests/property/__init__.py /usr/lib/python3-packaging/ptest/tests/test_direct_url.py /usr/lib/python3-packaging/ptest/tests/property/strategies.py /usr/lib/python3-packaging/ptest/tests/property/test_version_releases.py /usr/lib/python3-packaging/ptest/tests/property/test_version_format.py /usr/lib/python3-packaging/ptest/tests/property/test_specifier_comparison.py /usr/lib/python3-packaging/ptest/tests/property/test_specifier_extended.py /usr/lib/python3-packaging/ptest/tests/test_errors.py /usr/lib/python3-packaging/ptest/tests/property/test_version_ordering.py /usr/lib/python3-packaging/ptest/tests/test_pylock_select.py /usr/lib/python3-packaging/ptest/tests/property/test_specifier_matching.py /usr/lib/python3-packaging/ptest/tests/conftest.py /usr/lib/python3-packaging/ptest/tests/property/t
 est_version_normalization.py /usr/lib/python3-packaging/ptest/tests/property/test_specifier_implied.py /usr/lib/python3-packaging/ptest/tests/test_dependency_groups.py"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-ptest: PV changed from "26.0" to "26.2"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-src: PKGV changed from 26.0 [default] to 26.2 [default]
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-src: PV changed from "26.0" to "26.2"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-staticdev: PKGV changed from 26.0 [default] to 26.2 [default]
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-staticdev: PV changed from "26.0" to "26.2"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging: PKGSIZE changed from 602735 to 835406 (+39%)
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging: PKGV changed from 26.0 [default] to 26.2 [default]
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging: FILELIST: directory renamed /usr/lib/python3.14/site-packages/packaging-26.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/packaging-26.2.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/packaging-26.0.dist-info -> /usr/lib/python3.14/site-packages/packaging-26.2.dist-info, added "/usr/lib/python3.14/site-packages/packaging/direct_url.py /usr/lib/python3.14/site-packages/packaging/__pycache__/dependency_groups.cpython-314.pyc /usr/lib/python3.14/site-packages/packaging/dependency_groups.py /usr/lib/python3.14/site-packages/packaging/__pycache__/errors.cpython-314.pyc /usr/lib/python3.14/site-packages/packaging/__pycache__/direct_url.cpython-314.pyc /usr/lib/python3.14/site-packages/packaging/errors.py"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging: PV changed from "26.0" to "26.2"
Changes to packages/x86-64-v3-poky-linux/python3-packaging (sysroot):
  /usr/lib/python3.14/site-packages/packaging-26.0.dist-info moved to /usr/lib/python3.14/site-packages/packaging-26.2.dist-info
  /usr/lib/python3.14/site-packages/packaging/dependency_groups.py was added
  /usr/lib/python3.14/site-packages/packaging/direct_url.py was added
  /usr/lib/python3.14/site-packages/packaging/errors.py was added
  /usr/lib/python3.14/site-packages/packaging/__pycache__/dependency_groups.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/packaging/__pycache__/direct_url.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/packaging/__pycache__/errors.cpython-314.pyc was added
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
  /usr/lib/python3.14/site-packages/packaging-26.0.dist-info moved to /usr/lib/python3.14/site-packages/packaging-26.2.dist-info
  /usr/lib/python3.14/site-packages/packaging/dependency_groups.py was added
  /usr/lib/python3.14/site-packages/packaging/direct_url.py was added
  /usr/lib/python3.14/site-packages/packaging/errors.py was added
  /usr/lib/python3.14/site-packages/packaging/__pycache__/dependency_groups.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/packaging/__pycache__/direct_url.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/packaging/__pycache__/errors.cpython-314.pyc was added

--===============3766317918942611227==--

