Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1638ECD37BC
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:56 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15626.1777645545993906886
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Rg0uKpqB;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=NxSI2SlN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019de3ee6697-149ea30a-0eda-4a3e-a51b-85dfc2a79376-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645545;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TvviMrsWpd5lTLt4Dcq1P/k7fa83/x0835VrHZ+8Qpw=;
	b=Rg0uKpqBF5cmkX260RT3MtBBMF5aAS+SQ1g1LAsMo3BkvNPgc+7Ibnm6nPudhyE2
	80CM9MhjJeSM4/+FrocWCMGt+yijlaAU5c73CsFyYEzi6ERcnogMnkDGL8LnvJqlugB
	sl0KLnKaaHU12KH3ZrrX1Z6jfnXAwuu9vP4tA+c4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645545;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TvviMrsWpd5lTLt4Dcq1P/k7fa83/x0835VrHZ+8Qpw=;
	b=NxSI2SlN0O2agUV7FJlfwWLfescUWwIbNbx1YNJD7ozu0mZVZyj0fiZe0BLKDQcl
	1nVwuTuprVjRAmNMdA8/m8e1Due3CO2xqm2d1d1f9+L8ALL+ktBcNwpRGrcELKZFxVb
	vb8MSB8m2beUbzo3r1J4VlNPslAV09uO6ZScqkSM=
Content-Type: multipart/mixed; boundary="===============5924586329460494064=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-wheel: upgrading to 0.47.0 SUCCEEDED
Message-ID: <0101019de3ee6697-149ea30a-0eda-4a3e-a51b-85dfc2a79376-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236252

--===============5924586329460494064==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-wheel* to *0.47.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-wheel-upgrade-0.46.3-0.47.0.patch
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
From 560f5ead809d0866c43e707655062daefe63a016 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 09:46:07 +0000
Subject: [PATCH] python3-wheel: upgrade 0.46.3 -> 0.47.0

---
 .../python/{python3-wheel_0.46.3.bb => python3-wheel_0.47.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wheel_0.46.3.bb => python3-wheel_0.47.0.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-wheel_0.46.3.bb b/meta/recipes-devtools/python/python3-wheel_0.47.0.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-wheel_0.46.3.bb
rename to meta/recipes-devtools/python/python3-wheel_0.47.0.bb
index 2545e5496e..88b54c2ee2 100644
--- a/meta/recipes-devtools/python/python3-wheel_0.46.3.bb
+++ b/meta/recipes-devtools/python/python3-wheel_0.47.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7ffb0db04527cfe380e4f2726bd05ebf"
 
-SRC_URI[sha256sum] = "e3e79874b07d776c40bd6033f8ddf76a7dad46a7b8aa1b2787a83083519a1803"
+SRC_URI[sha256sum] = "cc72bd1009ba0cf63922e28f94d9d83b920aa2bb28f798a31d0691b02fa3c9b3"
 
 inherit python_flit_core pypi ptest-python-pytest
 
-- 
2.47.1


--===============5924586329460494064==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/python3-packaging (sysroot):
  /usr/lib/python3.14/site-packages/packaging-26.2.dist-info moved to /usr/lib/python3.14/site-packages/packaging-26.0.dist-info
  /usr/lib/python3.14/site-packages/packaging/dependency_groups.py was removed
  /usr/lib/python3.14/site-packages/packaging/direct_url.py was removed
  /usr/lib/python3.14/site-packages/packaging/errors.py was removed
  /usr/lib/python3.14/site-packages/packaging/__pycache__/dependency_groups.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/packaging/__pycache__/direct_url.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/packaging/__pycache__/errors.cpython-314.pyc was removed
packages/x86-64-v3-poky-linux/python3-wheel/python3-wheel-ptest: FILELIST: removed "/usr/lib/python3-wheel/ptest/tests/test_sdist.py", added "/usr/lib/python3-wheel/ptest/tests/commands/test_info.py"
packages/x86-64-v3-poky-linux/python3-wheel/python3-wheel-ptest: PKGSIZE changed from 44000 to 50280 (+14%)
packages/x86-64-v3-poky-linux/python3-wheel/python3-wheel: FILELIST: directory renamed /usr/lib/python3.14/site-packages/wheel-0.46.3.dist-info -> /usr/lib/python3.14/site-packages/wheel-0.47.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/wheel-0.46.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/wheel-0.47.0.dist-info/licenses, added "/usr/lib/python3.14/site-packages/wheel/_commands/info.py /usr/lib/python3.14/site-packages/wheel/_commands/__pycache__/info.cpython-314.pyc"
Changes to packages/x86-64-v3-poky-linux/python3-wheel (sysroot):
  /usr/lib/python3.14/site-packages/wheel-0.46.3.dist-info moved to /usr/lib/python3.14/site-packages/wheel-0.47.0.dist-info
  /usr/lib/python3.14/site-packages/wheel/_commands/info.py was added
  /usr/lib/python3.14/site-packages/wheel/_commands/__pycache__/info.cpython-314.pyc was added
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
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info moved to /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info
Changes to packages/x86_64-linux/python3-wheel-native (sysroot):
  /usr/lib/python3.14/site-packages/wheel-0.46.3.dist-info moved to /usr/lib/python3.14/site-packages/wheel-0.47.0.dist-info
  /usr/lib/python3.14/site-packages/wheel/_commands/info.py was added

--===============5924586329460494064==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-wheel-upgrade-0.46.3-0.47.0.patch"

RnJvbSA1NjBmNWVhZDgwOWQwODY2YzQzZTcwNzY1NTA2MmRhZWZlNjNhMDE2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAwOTo0NjowNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtd2hlZWw6IHVwZ3JhZGUgMC40Ni4zIC0+IDAuNDcuMAoKLS0tCiAuLi4vcHl0aG9uL3tw
eXRob24zLXdoZWVsXzAuNDYuMy5iYiA9PiBweXRob24zLXdoZWVsXzAuNDcuMC5iYn0gfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXdoZWVsXzAuNDYuMy5iYiA9PiBw
eXRob24zLXdoZWVsXzAuNDcuMC5iYn0gKDg5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2hlZWxfMC40Ni4zLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXdoZWVsXzAuNDcuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDg5
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2hlZWxf
MC40Ni4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
d2hlZWxfMC40Ny4wLmJiCmluZGV4IDI1NDVlNTQ5NmUuLjg4YjU0YzJlZTIgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13aGVlbF8wLjQ2LjMuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdoZWVsXzAuNDcuMC5iYgpA
QCAtNCw3ICs0LDcgQEAgU0VDVElPTiA9ICJkZXZlbC9weXRob24iCiBMSUNFTlNFID0gIk1JVCIK
IExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UudHh0O21kNT03ZmZiMGRiMDQ1Mjdj
ZmUzODBlNGYyNzI2YmQwNWViZiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImUzZTc5ODc0YjA3
ZDc3NmM0MGJkNjAzM2Y4ZGRmNzZhN2RhZDQ2YTdiOGFhMWIyNzg3YTgzMDgzNTE5YTE4MDMiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiY2M3MmJkMTAwOWJhMGNmNjM5MjJlMjhmOTRkOWQ4M2I5MjBh
YTJiYjI4Zjc5OGEzMWQwNjkxYjAyZmEzYzliMyIKIAogaW5oZXJpdCBweXRob25fZmxpdF9jb3Jl
IHB5cGkgcHRlc3QtcHl0aG9uLXB5dGVzdAogCi0tIAoyLjQ3LjEKCg==

--===============5924586329460494064==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/ca-certificates/ca-certificates-dev: FILES: removed "/lib/lib*.so /lib/*.la /lib/*.o"
packages/all-poky-linux/ca-certificates/ca-certificates-staticdev: FILES: removed "/lib/*.a"
packages/all-poky-linux/ca-certificates/ca-certificates: FILES: removed "/sbin/* /bin/* /lib/*.so.*", added "/usr/lib/*.so.*"
packages/all-poky-linux/tzdata/tzdata: FILES: removed "/sbin/* /bin/* /lib/*.so.*", added "/usr/lib/*.so.*"
packages/x86-64-v3-poky-linux/gcc-runtime/gcc-runtime-src: PKGSIZE changed from 9883625 to 9685472 (-2%)
Changes to packages/x86-64-v3-poky-linux/python3-packaging (sysroot):
  /usr/lib/python3.14/site-packages/packaging-26.2.dist-info moved to /usr/lib/python3.14/site-packages/packaging-26.0.dist-info
  /usr/lib/python3.14/site-packages/packaging/dependency_groups.py was removed
  /usr/lib/python3.14/site-packages/packaging/direct_url.py was removed
  /usr/lib/python3.14/site-packages/packaging/errors.py was removed
  /usr/lib/python3.14/site-packages/packaging/__pycache__/dependency_groups.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/packaging/__pycache__/direct_url.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/packaging/__pycache__/errors.cpython-314.pyc was removed
packages/x86-64-v3-poky-linux/python3-wheel: PKGV changed from 0.46.3 [default] to 0.47.0 [default]
packages/x86-64-v3-poky-linux/python3-wheel: SRC_URI changed from "https://files.pythonhosted.org/packages/source/w/wheel/wheel-0.46.3.tar.gz;downloadfilename=wheel-0.46.3.tar.gz" to "https://files.pythonhosted.org/packages/source/w/wheel/wheel-0.47.0.tar.gz;downloadfilename=wheel-0.47.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-wheel: PV changed from "0.46.3" to "0.47.0"
packages/x86-64-v3-poky-linux/python3-wheel/python3-wheel-dbg: PKGV changed from 0.46.3 [default] to 0.47.0 [default]
packages/x86-64-v3-poky-linux/python3-wheel/python3-wheel-dbg: PV changed from "0.46.3" to "0.47.0"
packages/x86-64-v3-poky-linux/python3-wheel/python3-wheel-dev: PKGV changed from 0.46.3 [default] to 0.47.0 [default]
packages/x86-64-v3-poky-linux/python3-wheel/python3-wheel-dev: PV changed from "0.46.3" to "0.47.0"
packages/x86-64-v3-poky-linux/python3-wheel/python3-wheel-doc: PKGV changed from 0.46.3 [default] to 0.47.0 [default]
packages/x86-64-v3-poky-linux/python3-wheel/python3-wheel-doc: PV changed from "0.46.3" to "0.47.0"
packages/x86-64-v3-poky-linux/python3-wheel/python3-wheel-locale: PKGV changed from 0.46.3 [default] to 0.47.0 [default]
packages/x86-64-v3-poky-linux/python3-wheel/python3-wheel-locale: PV changed from "0.46.3" to "0.47.0"
packages/x86-64-v3-poky-linux/python3-wheel/python3-wheel-ptest: PKGV changed from 0.46.3 [default] to 0.47.0 [default]
packages/x86-64-v3-poky-linux/python3-wheel/python3-wheel-ptest: FILELIST: removed "/usr/lib/python3-wheel/ptest/tests/test_sdist.py", added "/usr/lib/python3-wheel/ptest/tests/commands/test_info.py"
packages/x86-64-v3-poky-linux/python3-wheel/python3-wheel-ptest: PV changed from "0.46.3" to "0.47.0"
packages/x86-64-v3-poky-linux/python3-wheel/python3-wheel-ptest: PKGSIZE changed from 44000 to 50280 (+14%)
packages/x86-64-v3-poky-linux/python3-wheel/python3-wheel-src: PKGV changed from 0.46.3 [default] to 0.47.0 [default]
packages/x86-64-v3-poky-linux/python3-wheel/python3-wheel-src: PV changed from "0.46.3" to "0.47.0"
packages/x86-64-v3-poky-linux/python3-wheel/python3-wheel-staticdev: PKGV changed from 0.46.3 [default] to 0.47.0 [default]
packages/x86-64-v3-poky-linux/python3-wheel/python3-wheel-staticdev: PV changed from "0.46.3" to "0.47.0"
packages/x86-64-v3-poky-linux/python3-wheel/python3-wheel: PKGV changed from 0.46.3 [default] to 0.47.0 [default]
packages/x86-64-v3-poky-linux/python3-wheel/python3-wheel: FILELIST: directory renamed /usr/lib/python3.14/site-packages/wheel-0.46.3.dist-info -> /usr/lib/python3.14/site-packages/wheel-0.47.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/wheel-0.46.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/wheel-0.47.0.dist-info/licenses, added "/usr/lib/python3.14/site-packages/wheel/_commands/__pycache__/info.cpython-314.pyc /usr/lib/python3.14/site-packages/wheel/_commands/info.py"
packages/x86-64-v3-poky-linux/python3-wheel/python3-wheel: PV changed from "0.46.3" to "0.47.0"
packages/x86-64-v3-poky-linux/python3-wheel/python3-wheel: PKGSIZE changed from 203070 to 216016 (+6%)
Changes to packages/x86-64-v3-poky-linux/python3-wheel (sysroot):
  /usr/lib/python3.14/site-packages/wheel-0.46.3.dist-info moved to /usr/lib/python3.14/site-packages/wheel-0.47.0.dist-info
  /usr/lib/python3.14/site-packages/wheel/_commands/info.py was added
  /usr/lib/python3.14/site-packages/wheel/_commands/__pycache__/info.cpython-314.pyc was added
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
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info moved to /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info
Changes to packages/x86_64-linux/python3-wheel-native (sysroot):
  /usr/lib/python3.14/site-packages/wheel-0.46.3.dist-info moved to /usr/lib/python3.14/site-packages/wheel-0.47.0.dist-info
  /usr/lib/python3.14/site-packages/wheel/_commands/info.py was added

--===============5924586329460494064==--

