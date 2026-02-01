Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 856D6D172B8
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 13:12:56 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29194.1769951570514286567
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 05:12:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Bx1XAPNg;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=SQ8DY/p4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019c1955a7d1-455039cd-a3ca-4163-92b6-90d54435692c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769951570;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TfsACgV4ytFe41hAA+ENfZAoBoLbX4IlG0+gmvPFF8k=;
	b=Bx1XAPNgzZt8HkSyRUdPIuuUfr5k9i7qH4fLAYeRhb8go0ZVBM1y+1QooYilnxQl
	zFBNZBCrETx7yZTyUU6Ivt/+onJJk+7rOtnYMlYByN4d5iQRi7lKZH+rCY9GFaf8jpI
	JozfoAjqnb/FJ1nB+bvqREU6hoVWr3JQDdbieTys=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769951570;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TfsACgV4ytFe41hAA+ENfZAoBoLbX4IlG0+gmvPFF8k=;
	b=SQ8DY/p4kKi35+14Q2yqXCdEJYgra6/bRSJeiqCl0rAfjgdLH+nQ0BXF1FPG+aHt
	R3+PW71T2M5FYqQTbQ91UvKLCeLdHTb8tS+rUhwuFNjeI/ADNfSYb6us05mqlofam6V
	Md6sITKY8fquk1Xi7DTsywaQCDrTWoM+8jS3NWjE=
Content-Type: multipart/mixed; boundary="===============7101231771413801088=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-packaging: upgrading to 26.0 SUCCEEDED
Message-ID: <0101019c1955a7d1-455039cd-a3ca-4163-92b6-90d54435692c-000000@us-west-2.amazonses.com>
Date: Sun, 1 Feb 2026 13:12:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 13:12:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230286

--===============7101231771413801088==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-packaging* to *26.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-packaging-upgrade-25.0-26.0.patch
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
From 2d4fd4375090797c46b5c35435aa9457a8da2284 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Feb 2026 08:37:03 +0000
Subject: [PATCH] python3-packaging: upgrade 25.0 -> 26.0

---
 .../{python3-packaging_25.0.bb => python3-packaging_26.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-packaging_25.0.bb => python3-packaging_26.0.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-packaging_25.0.bb b/meta/recipes-devtools/python/python3-packaging_26.0.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-packaging_25.0.bb
rename to meta/recipes-devtools/python/python3-packaging_26.0.bb
index 9cb5c68f58..cadf913db8 100644
--- a/meta/recipes-devtools/python/python3-packaging_25.0.bb
+++ b/meta/recipes-devtools/python/python3-packaging_26.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/packaging"
 LICENSE = "Apache-2.0 | BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=faadaedca9251a90b205c9167578ce91"
 
-SRC_URI[sha256sum] = "d443872c98d677bf60f6a1f2f8c1cb748e8fe762d2bf9d3148b5599295b0fc4f"
+SRC_URI[sha256sum] = "00243ae351a257117b6a241061796684b084ed1c516a08c48a3f7e147a9d80b4"
 
 SRC_URI += "file://run-ptest.in"
 
-- 
2.47.1


--===============7101231771413801088==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-ptest: FILELIST: removed "/usr/lib/python3-packaging/ptest/tests/.pytest_cache/CACHEDIR.TAG /usr/lib/python3-packaging/ptest/tests/.pytest_cache/v/cache/nodeids /usr/lib/python3-packaging/ptest/tests/.pytest_cache/.gitignore /usr/lib/python3-packaging/ptest/tests/.pytest_cache/v/cache/stepwise /usr/lib/python3-packaging/ptest/tests/.pytest_cache/v/cache/lastfailed /usr/lib/python3-packaging/ptest/tests/.pytest_cache/README.md /usr/lib/python3-packaging/ptest/tests/requirements.txt", added "/usr/lib/python3-packaging/ptest/tests/pylock/pylock.spec-example.toml /usr/lib/python3-packaging/ptest/tests/test_pylock.py"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-ptest: PKGSIZE changed from 2180286 to 311685 (-86%)
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging: FILELIST: directory renamed /usr/lib/python3.14/site-packages/packaging-25.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/packaging-26.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/packaging-25.0.dist-info -> /usr/lib/python3.14/site-packages/packaging-26.0.dist-info, added "/usr/lib/python3.14/site-packages/packaging/pylock.py /usr/lib/python3.14/site-packages/packaging/__pycache__/pylock.cpython-314.pyc"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging: PKGSIZE changed from 506679 to 602735 (+19%)
Changes to packages/x86-64-v3-poky-linux/python3-packaging (sysroot):
  /usr/lib/python3.14/site-packages/packaging-25.0.dist-info moved to /usr/lib/python3.14/site-packages/packaging-26.0.dist-info
  /usr/lib/python3.14/site-packages/packaging/__pycache__/pylock.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/packaging/pylock.py was added
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
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work/x86_64-linux/glib-2.0-native/2.86.3 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.3-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.3-gdb.py was removed
Changes to packages/x86_64-linux/python3-packaging-native (sysroot):
  /usr/lib/python3.14/site-packages/packaging-25.0.dist-info moved to /usr/lib/python3.14/site-packages/packaging-26.0.dist-info
  /usr/lib/python3.14/site-packages/packaging/__pycache__/pylock.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/packaging/pylock.py was added

--===============7101231771413801088==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-packaging-upgrade-25.0-26.0.patch"

RnJvbSAyZDRmZDQzNzUwOTA3OTdjNDZiNWMzNTQzNWFhOTQ1N2E4ZGEyMjg0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBGZWIgMjAyNiAwODozNzowMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcGFja2FnaW5nOiB1cGdyYWRlIDI1LjAgLT4gMjYuMAoKLS0tCiAuLi4ve3B5dGhvbjMt
cGFja2FnaW5nXzI1LjAuYmIgPT4gcHl0aG9uMy1wYWNrYWdpbmdfMjYuMC5iYn0gICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXBhY2thZ2luZ18yNS4wLmJiID0+
IHB5dGhvbjMtcGFja2FnaW5nXzI2LjAuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBhY2thZ2luZ18yNS4wLmJiIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBhY2thZ2luZ18yNi4wLmJiCnNpbWlsYXJpdHkg
aW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1wYWNrYWdpbmdfMjUuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXBhY2thZ2luZ18yNi4wLmJiCmluZGV4IDljYjVjNjhmNTguLmNhZGY5MTNkYjgg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wYWNrYWdp
bmdfMjUuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGFj
a2FnaW5nXzI2LjAuYmIKQEAgLTMsNyArMyw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHVi
LmNvbS9weXBhL3BhY2thZ2luZyIKIExJQ0VOU0UgPSAiQXBhY2hlLTIuMCB8IEJTRC0yLUNsYXVz
ZSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWZhYWRhZWRjYTkyNTFh
OTBiMjA1YzkxNjc1NzhjZTkxIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDQ0Mzg3MmM5OGQ2
NzdiZjYwZjZhMWYyZjhjMWNiNzQ4ZThmZTc2MmQyYmY5ZDMxNDhiNTU5OTI5NWIwZmM0ZiIKK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICIwMDI0M2FlMzUxYTI1NzExN2I2YTI0MTA2MTc5NjY4NGIwODRl
ZDFjNTE2YTA4YzQ4YTNmN2UxNDdhOWQ4MGI0IgogCiBTUkNfVVJJICs9ICJmaWxlOi8vcnVuLXB0
ZXN0LmluIgogCi0tIAoyLjQ3LjEKCg==

--===============7101231771413801088==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-packaging: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/packaging/packaging-25.0.tar.gz;downloadfilename=packaging-25.0.tar.gz file://run-ptest.in" to "https://files.pythonhosted.org/packages/source/p/packaging/packaging-26.0.tar.gz;downloadfilename=packaging-26.0.tar.gz file://run-ptest.in"
packages/x86-64-v3-poky-linux/python3-packaging: PKGV changed from 25.0 [default] to 26.0 [default]
packages/x86-64-v3-poky-linux/python3-packaging: PV changed from "25.0" to "26.0"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-dbg: PV changed from "25.0" to "26.0"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-dbg: PKGV changed from 25.0 [default] to 26.0 [default]
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-dev: PV changed from "25.0" to "26.0"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-dev: PKGV changed from 25.0 [default] to 26.0 [default]
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-doc: PV changed from "25.0" to "26.0"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-doc: PKGV changed from 25.0 [default] to 26.0 [default]
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-locale: PV changed from "25.0" to "26.0"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-locale: PKGV changed from 25.0 [default] to 26.0 [default]
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-ptest: PV changed from "25.0" to "26.0"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-ptest: PKGV changed from 25.0 [default] to 26.0 [default]
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-ptest: FILELIST: removed "/usr/lib/python3-packaging/ptest/tests/.pytest_cache/v/cache/nodeids /usr/lib/python3-packaging/ptest/tests/.pytest_cache/v/cache/lastfailed /usr/lib/python3-packaging/ptest/tests/.pytest_cache/v/cache/stepwise /usr/lib/python3-packaging/ptest/tests/.pytest_cache/.gitignore /usr/lib/python3-packaging/ptest/tests/.pytest_cache/README.md /usr/lib/python3-packaging/ptest/tests/requirements.txt /usr/lib/python3-packaging/ptest/tests/.pytest_cache/CACHEDIR.TAG", added "/usr/lib/python3-packaging/ptest/tests/pylock/pylock.spec-example.toml /usr/lib/python3-packaging/ptest/tests/test_pylock.py"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-ptest: PKGSIZE changed from 2180286 to 311685 (-86%)
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-src: PV changed from "25.0" to "26.0"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-src: PKGV changed from 25.0 [default] to 26.0 [default]
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-staticdev: PV changed from "25.0" to "26.0"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-staticdev: PKGV changed from 25.0 [default] to 26.0 [default]
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging: PV changed from "25.0" to "26.0"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging: PKGV changed from 25.0 [default] to 26.0 [default]
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging: FILELIST: directory renamed /usr/lib/python3.14/site-packages/packaging-25.0.dist-info -> /usr/lib/python3.14/site-packages/packaging-26.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/packaging-25.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/packaging-26.0.dist-info/licenses, added "/usr/lib/python3.14/site-packages/packaging/pylock.py /usr/lib/python3.14/site-packages/packaging/__pycache__/pylock.cpython-314.pyc"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging: PKGSIZE changed from 506679 to 602735 (+19%)
Changes to packages/x86-64-v3-poky-linux/python3-packaging (sysroot):
  /usr/lib/python3.14/site-packages/packaging-25.0.dist-info moved to /usr/lib/python3.14/site-packages/packaging-26.0.dist-info
  /usr/lib/python3.14/site-packages/packaging/__pycache__/pylock.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/packaging/pylock.py was added
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
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work/x86_64-linux/glib-2.0-native/2.86.3 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.3-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.3-gdb.py was removed
Changes to packages/x86_64-linux/python3-packaging-native (sysroot):
  /usr/lib/python3.14/site-packages/packaging-25.0.dist-info moved to /usr/lib/python3.14/site-packages/packaging-26.0.dist-info
  /usr/lib/python3.14/site-packages/packaging/__pycache__/pylock.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/packaging/pylock.py was added

--===============7101231771413801088==--

