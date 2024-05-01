Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38C92C32717
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 16:00:24 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.1099.1714579215688784963
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 May 2024 09:00:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=WNlQ0Tak;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=CcT+yKJR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018f34e29265-3a678a49-4052-49f7-af78-e3ae4b689294-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1714579215;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=A3bzHYjSNEHGq44m9rEAQ35KjbeO5PgOiPJCb4O3f4U=;
	b=WNlQ0TakfkjAmfBzzHFdp5YsIQxRG5tcXvd3IjAT1Y2vsXWoGQqOiMoJuIQrqJAb
	uq1Xpudff9rD8l6jQEQ4/K/mul30kJ9o+qoFajCxb+5C6LpGdGL3A7/RoyDLrJHfy2L
	NSsX5au2NYMccLvQyqYVZ3csEm/zh0UlqhLuM348=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1714579215;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=A3bzHYjSNEHGq44m9rEAQ35KjbeO5PgOiPJCb4O3f4U=;
	b=CcT+yKJRJuQZNsKvhPS+BUhx0v6nH7pBSdWKF4lN1rF2Nhj7PZ7WL8hOGpUDCQjd
	h5Qu1qLNlSpfdIDfOBVS0OS73peKcSrz0y9fSfrlWC53y4rjWyZ/kcQo5MyCQ4sisxX
	gR9N8RtgHCM1ophiF2rvO9/iRyZdrwq8YUqMT8sg=
Content-Type: multipart/mixed; boundary="===============8975506945409764337=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-docutils: upgrading to 0.21.2 FAILED
Message-ID: <0101018f34e29265-3a678a49-4052-49f7-af78-e3ae4b689294-000000@us-west-2.amazonses.com>
Date: Wed, 1 May 2024 16:00:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 16:00:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198809

--===============8975506945409764337==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-docutils* to *0.21.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-docutils-upgrade-0.20.1-0.21.2.patch
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
From 6246b66c05aec055710cbc7cdaa168672df66f1f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 May 2024 06:21:51 +0000
Subject: [PATCH] python3-docutils: upgrade 0.20.1 -> 0.21.2

---
 ...s_0.20.1.bb => python3-docutils_0.21.2.bb} | 50 ++++++++++++++++++-
 1 file changed, 48 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-docutils_0.20.1.bb => python3-docutils_0.21.2.bb} (22%)

diff --git a/meta/recipes-devtools/python/python3-docutils_0.20.1.bb b/meta/recipes-devtools/python/python3-docutils_0.21.2.bb
similarity index 22%
rename from meta/recipes-devtools/python/python3-docutils_0.20.1.bb
rename to meta/recipes-devtools/python/python3-docutils_0.21.2.bb
index 6038732cc4..0d096dd570 100644
--- a/meta/recipes-devtools/python/python3-docutils_0.20.1.bb
+++ b/meta/recipes-devtools/python/python3-docutils_0.21.2.bb
@@ -1,10 +1,56 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYING.txt
+# +++ COPYING.txt
+# @@ -6,7 +6,7 @@
+#  
+#  :Author: David Goodger
+#  :Contact: goodger@python.org
+# -:Date: $Date: 2022-11-29 00:55:25 +0100 (Di, 29. Nov 2022) $
+# +:Date: $Date: 2023-06-22 17:34:37 +0200 (Do, 22. Jun 2023) $
+#  :Web site: https://docutils.sourceforge.io/
+#  :Copyright: This document has been placed in the public domain.
+#  
+# @@ -131,9 +131,9 @@
+#  * docutils/utils/roman.py
+#  
+#    copyright by Mark Pilgrim, released under the
+# -  `Python 2.1.1 license`_ (`local copy`__).
+# +  `Zope Public License Version 2.1`_ (`local copy`__).
+#  
+# -  __ licenses/python-2-1-1.txt
+# +  __ licenses/ZPL-2-1.txt
+#  
+#  * tools/editors/emacs/rst.el
+#  
+# @@ -150,10 +150,10 @@
+#  
+#  .. _sandbox: https://docutils.sourceforge.io/sandbox/README.html
+#  .. _licenses: licenses/
+# -.. _Python 2.1.1 license: https://docs.python.org/3/license.html
+#  .. _GNU General Public License: https://www.gnu.org/copyleft/gpl.html
+#  .. _BSD 2-Clause License: http://opensource.org/licenses/BSD-2-Clause
+#  .. _BSD 3-Clause License: https://opensource.org/licenses/BSD-3-Clause
+# +.. _Zope Public License Version 2.1: https://opensource.org/license/zpl-2-1/
+#  .. _OSI-approved: http://opensource.org/licenses/
+#  .. _license-list:
+#  .. _GPL-compatible: https://www.gnu.org/licenses/license-list.html
+# 
+#
+
 SUMMARY = "Docutils is a modular system for processing documentation into useful formats"
 HOMEPAGE = "http://docutils.sourceforge.net"
 SECTION = "devel/python"
 LICENSE = "PSF-2.0 & BSD-2-Clause & GPL-3.0-only"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=08f5f8aa6a1db2500c08a2bb558e45af"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=382430a09a4453818aa6618f2090491b"
 
-SRC_URI[sha256sum] = "f08a4e276c3a1583a86dce3e34aba3fe04d02bba2dd51ed16106244e8a923e3b"
+SRC_URI[sha256sum] = "3a6b18732edf182daa3cd12775bbb338cf5691468f91eeeb109deff6ebfa986f"
 
 inherit pypi setuptools3
 
-- 
2.44.0


--===============8975506945409764337==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1879 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (919 cached, 1 parsed). 1876 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-06f41f9ae5af94d8a3a42790cda0b03f2518454d"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:06f41f9ae5af94d8a3a42790cda0b03f2518454d"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 311 Local 298 Mirrors 0 Missed 13 Current 324 (95% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1403 of 1805 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.21.2.bb:do_recipe_qa)
NOTE: recipe python3-docutils-0.21.2-r0: task do_recipe_qa: Started
NOTE: recipe python3-docutils-0.21.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1786 of 1805 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.21.2.bb:do_fetch)
NOTE: recipe python3-docutils-0.21.2-r0: task do_fetch: Started
NOTE: recipe python3-docutils-0.21.2-r0: task do_fetch: Succeeded
NOTE: Running task 1787 of 1805 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.21.2.bb:do_unpack)
NOTE: Running task 1788 of 1805 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.21.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-docutils-0.21.2-r0: task do_unpack: Started
NOTE: recipe python3-docutils-0.21.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-docutils-0.21.2-r0: task do_unpack: Succeeded
NOTE: Running task 1789 of 1805 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.21.2.bb:do_patch)
NOTE: Running task 1790 of 1805 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.21.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-docutils-0.21.2-r0: task do_patch: Started
NOTE: recipe python3-docutils-0.21.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-docutils-0.21.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-docutils-0.21.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-docutils-0.21.2-r0: task do_patch: Succeeded
NOTE: Running task 1791 of 1805 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.21.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1792 of 1805 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.21.2.bb:do_populate_lic)
NOTE: recipe python3-docutils-0.21.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-docutils-0.21.2-r0: task do_populate_lic: Started
NOTE: recipe python3-docutils-0.21.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-docutils-0.21.2-r0: task do_populate_lic: Succeeded
NOTE: Running task 1793 of 1805 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.21.2.bb:do_configure)
NOTE: recipe python3-docutils-0.21.2-r0: task do_configure: Started
NOTE: recipe python3-docutils-0.21.2-r0: task do_configure: Succeeded
NOTE: Running task 1794 of 1805 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.21.2.bb:do_compile)
NOTE: recipe python3-docutils-0.21.2-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-docutils/0.21.2/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-docutils/0.21.2/docutils-0.21.2/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-docutils/0.21.2/temp/run.do_compile.49322:180 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-docutils/0.21.2/temp/run.do_compile.49322, line 180
| 	#2: setuptools3_do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-docutils/0.21.2/temp/run.do_compile.49322, line 170
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-docutils/0.21.2/temp/run.do_compile.49322, line 152
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-docutils/0.21.2/temp/run.do_compile.49322, line 184
NOTE: recipe python3-docutils-0.21.2-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1794 tasks of which 1784 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240501062126.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240501062126.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.21.2.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-docutils-0.21.2-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-docutils-0.21.2-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-docutils/0.21.2/temp/run.do_compile.49322', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-docutils/0.21.2/temp/log.do_compile.49322
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.21.2.bb:do_compile) failed with exit code '1'

--===============8975506945409764337==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-docutils-upgrade-0.20.1-0.21.2.patch"

RnJvbSA2MjQ2YjY2YzA1YWVjMDU1NzEwY2JjN2NkYWExNjg2NzJkZjY2ZjFmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXkgMjAyNCAwNjoyMTo1MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtZG9jdXRpbHM6IHVwZ3JhZGUgMC4yMC4xIC0+IDAuMjEuMgoKLS0tCiAuLi5zXzAuMjAu
MS5iYiA9PiBweXRob24zLWRvY3V0aWxzXzAuMjEuMi5iYn0gfCA1MCArKysrKysrKysrKysrKysr
KystCiAxIGZpbGUgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWRvY3V0aWxzXzAuMjAu
MS5iYiA9PiBweXRob24zLWRvY3V0aWxzXzAuMjEuMi5iYn0gKDIyJSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZG9jdXRpbHNfMC4yMC4xLmJiIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWRvY3V0aWxzXzAuMjEuMi5iYgpz
aW1pbGFyaXR5IGluZGV4IDIyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtZG9jdXRpbHNfMC4yMC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtZG9jdXRpbHNfMC4yMS4yLmJiCmluZGV4IDYwMzg3MzJjYzQu
LjBkMDk2ZGQ1NzAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1kb2N1dGlsc18wLjIwLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWRvY3V0aWxzXzAuMjEuMi5iYgpAQCAtMSwxMCArMSw1NiBAQAorIyBGSVhNRTog
dGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29s
IHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhl
IG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VO
U0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBj
b21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xp
Y2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdl
czoKKyMKKyMgLS0tIENPUFlJTkcudHh0CisjICsrKyBDT1BZSU5HLnR4dAorIyBAQCAtNiw3ICs2
LDcgQEAKKyMgIAorIyAgOkF1dGhvcjogRGF2aWQgR29vZGdlcgorIyAgOkNvbnRhY3Q6IGdvb2Rn
ZXJAcHl0aG9uLm9yZworIyAtOkRhdGU6ICREYXRlOiAyMDIyLTExLTI5IDAwOjU1OjI1ICswMTAw
IChEaSwgMjkuIE5vdiAyMDIyKSAkCisjICs6RGF0ZTogJERhdGU6IDIwMjMtMDYtMjIgMTc6MzQ6
MzcgKzAyMDAgKERvLCAyMi4gSnVuIDIwMjMpICQKKyMgIDpXZWIgc2l0ZTogaHR0cHM6Ly9kb2N1
dGlscy5zb3VyY2Vmb3JnZS5pby8KKyMgIDpDb3B5cmlnaHQ6IFRoaXMgZG9jdW1lbnQgaGFzIGJl
ZW4gcGxhY2VkIGluIHRoZSBwdWJsaWMgZG9tYWluLgorIyAgCisjIEBAIC0xMzEsOSArMTMxLDkg
QEAKKyMgICogZG9jdXRpbHMvdXRpbHMvcm9tYW4ucHkKKyMgIAorIyAgICBjb3B5cmlnaHQgYnkg
TWFyayBQaWxncmltLCByZWxlYXNlZCB1bmRlciB0aGUKKyMgLSAgYFB5dGhvbiAyLjEuMSBsaWNl
bnNlYF8gKGBsb2NhbCBjb3B5YF9fKS4KKyMgKyAgYFpvcGUgUHVibGljIExpY2Vuc2UgVmVyc2lv
biAyLjFgXyAoYGxvY2FsIGNvcHlgX18pLgorIyAgCisjIC0gIF9fIGxpY2Vuc2VzL3B5dGhvbi0y
LTEtMS50eHQKKyMgKyAgX18gbGljZW5zZXMvWlBMLTItMS50eHQKKyMgIAorIyAgKiB0b29scy9l
ZGl0b3JzL2VtYWNzL3JzdC5lbAorIyAgCisjIEBAIC0xNTAsMTAgKzE1MCwxMCBAQAorIyAgCisj
ICAuLiBfc2FuZGJveDogaHR0cHM6Ly9kb2N1dGlscy5zb3VyY2Vmb3JnZS5pby9zYW5kYm94L1JF
QURNRS5odG1sCisjICAuLiBfbGljZW5zZXM6IGxpY2Vuc2VzLworIyAtLi4gX1B5dGhvbiAyLjEu
MSBsaWNlbnNlOiBodHRwczovL2RvY3MucHl0aG9uLm9yZy8zL2xpY2Vuc2UuaHRtbAorIyAgLi4g
X0dOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlOiBodHRwczovL3d3dy5nbnUub3JnL2NvcHlsZWZ0
L2dwbC5odG1sCisjICAuLiBfQlNEIDItQ2xhdXNlIExpY2Vuc2U6IGh0dHA6Ly9vcGVuc291cmNl
Lm9yZy9saWNlbnNlcy9CU0QtMi1DbGF1c2UKKyMgIC4uIF9CU0QgMy1DbGF1c2UgTGljZW5zZTog
aHR0cHM6Ly9vcGVuc291cmNlLm9yZy9saWNlbnNlcy9CU0QtMy1DbGF1c2UKKyMgKy4uIF9ab3Bl
IFB1YmxpYyBMaWNlbnNlIFZlcnNpb24gMi4xOiBodHRwczovL29wZW5zb3VyY2Uub3JnL2xpY2Vu
c2UvenBsLTItMS8KKyMgIC4uIF9PU0ktYXBwcm92ZWQ6IGh0dHA6Ly9vcGVuc291cmNlLm9yZy9s
aWNlbnNlcy8KKyMgIC4uIF9saWNlbnNlLWxpc3Q6CisjICAuLiBfR1BMLWNvbXBhdGlibGU6IGh0
dHBzOi8vd3d3LmdudS5vcmcvbGljZW5zZXMvbGljZW5zZS1saXN0Lmh0bWwKKyMgCisjCisKIFNV
TU1BUlkgPSAiRG9jdXRpbHMgaXMgYSBtb2R1bGFyIHN5c3RlbSBmb3IgcHJvY2Vzc2luZyBkb2N1
bWVudGF0aW9uIGludG8gdXNlZnVsIGZvcm1hdHMiCiBIT01FUEFHRSA9ICJodHRwOi8vZG9jdXRp
bHMuc291cmNlZm9yZ2UubmV0IgogU0VDVElPTiA9ICJkZXZlbC9weXRob24iCiBMSUNFTlNFID0g
IlBTRi0yLjAgJiBCU0QtMi1DbGF1c2UgJiBHUEwtMy4wLW9ubHkiCi1MSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HLnR4dDttZDU9MDhmNWY4YWE2YTFkYjI1MDBjMDhhMmJiNTU4ZTQ1
YWYiCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HLnR4dDttZDU9MzgyNDMwYTA5
YTQ0NTM4MThhYTY2MThmMjA5MDQ5MWIiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJmMDhhNGUy
NzZjM2ExNTgzYTg2ZGNlM2UzNGFiYTNmZTA0ZDAyYmJhMmRkNTFlZDE2MTA2MjQ0ZThhOTIzZTNi
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjNhNmIxODczMmVkZjE4MmRhYTNjZDEyNzc1YmJiMzM4
Y2Y1NjkxNDY4ZjkxZWVlYjEwOWRlZmY2ZWJmYTk4NmYiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRv
b2xzMwogCi0tIAoyLjQ0LjAKCg==

--===============8975506945409764337==--

