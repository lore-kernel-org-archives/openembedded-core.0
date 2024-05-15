Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77D60C3271B
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:25 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.1245.1715794338063009091
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=LmyWns9H;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=VVH7qX9n;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018f7d4fde9e-b4b9b27b-8343-4dae-9724-2179a4e451d5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794337;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7A+eNuMYhF++b69AFWVFT2H1hIoEfcm39MvH5g+UKy4=;
	b=LmyWns9HTBU+dhy/h/93oS/uJKLD4JST8Kn63qxTmsAYRrDHg47iq1Nm3w9PWuAy
	GLY+r2PWlX1SBFriP2Lzu2nQWcfk6eewLehsZrpzVMHzKG693lolNdRYFl1VM9OGPgp
	5tJYW/fHpdjZeX3288tC3C4Qi3DPdzvFK2fgoo/4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794337;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7A+eNuMYhF++b69AFWVFT2H1hIoEfcm39MvH5g+UKy4=;
	b=VVH7qX9nG7syaP9eX5TDvv5q0cVKlxuLnjIN9BmdHTVGdz8B+aRw9PqbrF4ufCn+
	rNdX/ne7+2wxMMV6dBxljmRrpal+Y8JH4N3uEXli5kO2BxL8wSgmB3f1nhjLaznSWn6
	X/iN9XDfFAzwRLEt/XVzZvYl3S73Gigi+hz98F7g=
Content-Type: multipart/mixed; boundary="===============6849115990708064073=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-docutils: upgrading to 0.21.2 FAILED
Message-ID: <0101018f7d4fde9e-b4b9b27b-8343-4dae-9724-2179a4e451d5-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199326

--===============6849115990708064073==
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
From 55ad2625eb6077afcedfed4da3af059fcb1a750b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 May 2024 09:27:07 +0000
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


--===============6849115990708064073==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1882 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (920 cached, 1 parsed). 1879 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-5c661b652a9018b290d5d097ac8db342b1eeeb7e"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:5c661b652a9018b290d5d097ac8db342b1eeeb7e"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 314 Local 302 Mirrors 0 Missed 12 Current 321 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 397 of 635 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.21.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-docutils-0.21.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-docutils-0.21.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1405 of 1805 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.21.2.bb:do_fetch)
NOTE: recipe python3-docutils-0.21.2-r0: task do_fetch: Started
NOTE: recipe python3-docutils-0.21.2-r0: task do_fetch: Succeeded
NOTE: Running task 1786 of 1805 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.21.2.bb:do_unpack)
NOTE: Running task 1787 of 1805 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.21.2.bb:do_prepare_recipe_sysroot)
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
NOTE: recipe python3-docutils-0.21.2-r0: task do_populate_lic: Started
NOTE: recipe python3-docutils-0.21.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-docutils-0.21.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.21.2.bb:do_populate_lic unihash changed to 0c9280c8e40780ce0f957d0eee6eb804ed376f42f80f9ffebe7ff7a30ea34ebc
NOTE: recipe python3-docutils-0.21.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.21.2.bb:do_deploy_source_date_epoch unihash changed to 72216fac93c131a12a409098e045e1a59b0f8379c65c5253982f5dcf47f017d7
NOTE: Setscene tasks completed
NOTE: Running task 1793 of 1805 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.21.2.bb:do_configure)
NOTE: recipe python3-docutils-0.21.2-r0: task do_configure: Started
NOTE: recipe python3-docutils-0.21.2-r0: task do_configure: Succeeded
NOTE: Running task 1794 of 1805 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.21.2.bb:do_compile)
NOTE: recipe python3-docutils-0.21.2-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-docutils/0.21.2/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-docutils/0.21.2/docutils-0.21.2/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-docutils/0.21.2/temp/run.do_compile.727755:180 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-docutils/0.21.2/temp/run.do_compile.727755, line 180
| 	#2: setuptools3_do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-docutils/0.21.2/temp/run.do_compile.727755, line 170
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-docutils/0.21.2/temp/run.do_compile.727755, line 152
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-docutils/0.21.2/temp/run.do_compile.727755, line 184
NOTE: recipe python3-docutils-0.21.2-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1794 tasks of which 1785 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240515092646.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240515092646.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.21.2.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-docutils-0.21.2-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-docutils-0.21.2-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-docutils/0.21.2/temp/run.do_compile.727755', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-docutils/0.21.2/temp/log.do_compile.727755
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.21.2.bb:do_compile) failed with exit code '1'

--===============6849115990708064073==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-docutils-upgrade-0.20.1-0.21.2.patch"

RnJvbSA1NWFkMjYyNWViNjA3N2FmY2VkZmVkNGRhM2FmMDU5ZmNiMWE3NTBiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWF5IDIwMjQgMDk6Mjc6MDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWRvY3V0aWxzOiB1cGdyYWRlIDAuMjAuMSAtPiAwLjIxLjIKCi0tLQogLi4uc18wLjIw
LjEuYmIgPT4gcHl0aG9uMy1kb2N1dGlsc18wLjIxLjIuYmJ9IHwgNTAgKysrKysrKysrKysrKysr
KysrLQogMSBmaWxlIGNoYW5nZWQsIDQ4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1kb2N1dGlsc18wLjIw
LjEuYmIgPT4gcHl0aG9uMy1kb2N1dGlsc18wLjIxLjIuYmJ9ICgyMiUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWRvY3V0aWxzXzAuMjAuMS5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1kb2N1dGlsc18wLjIxLjIuYmIK
c2ltaWxhcml0eSBpbmRleCAyMiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWRvY3V0aWxzXzAuMjAuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWRvY3V0aWxzXzAuMjEuMi5iYgppbmRleCA2MDM4NzMyY2M0
Li4wZDA5NmRkNTcwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtZG9jdXRpbHNfMC4yMC4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1kb2N1dGlsc18wLjIxLjIuYmIKQEAgLTEsMTAgKzEsNTYgQEAKKyMgRklYTUU6
IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9v
bCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRo
ZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNF
TlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUg
Y29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdM
aWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5n
ZXM6CisjCisjIC0tLSBDT1BZSU5HLnR4dAorIyArKysgQ09QWUlORy50eHQKKyMgQEAgLTYsNyAr
Niw3IEBACisjICAKKyMgIDpBdXRob3I6IERhdmlkIEdvb2RnZXIKKyMgIDpDb250YWN0OiBnb29k
Z2VyQHB5dGhvbi5vcmcKKyMgLTpEYXRlOiAkRGF0ZTogMjAyMi0xMS0yOSAwMDo1NToyNSArMDEw
MCAoRGksIDI5LiBOb3YgMjAyMikgJAorIyArOkRhdGU6ICREYXRlOiAyMDIzLTA2LTIyIDE3OjM0
OjM3ICswMjAwIChEbywgMjIuIEp1biAyMDIzKSAkCisjICA6V2ViIHNpdGU6IGh0dHBzOi8vZG9j
dXRpbHMuc291cmNlZm9yZ2UuaW8vCisjICA6Q29weXJpZ2h0OiBUaGlzIGRvY3VtZW50IGhhcyBi
ZWVuIHBsYWNlZCBpbiB0aGUgcHVibGljIGRvbWFpbi4KKyMgIAorIyBAQCAtMTMxLDkgKzEzMSw5
IEBACisjICAqIGRvY3V0aWxzL3V0aWxzL3JvbWFuLnB5CisjICAKKyMgICAgY29weXJpZ2h0IGJ5
IE1hcmsgUGlsZ3JpbSwgcmVsZWFzZWQgdW5kZXIgdGhlCisjIC0gIGBQeXRob24gMi4xLjEgbGlj
ZW5zZWBfIChgbG9jYWwgY29weWBfXykuCisjICsgIGBab3BlIFB1YmxpYyBMaWNlbnNlIFZlcnNp
b24gMi4xYF8gKGBsb2NhbCBjb3B5YF9fKS4KKyMgIAorIyAtICBfXyBsaWNlbnNlcy9weXRob24t
Mi0xLTEudHh0CisjICsgIF9fIGxpY2Vuc2VzL1pQTC0yLTEudHh0CisjICAKKyMgICogdG9vbHMv
ZWRpdG9ycy9lbWFjcy9yc3QuZWwKKyMgIAorIyBAQCAtMTUwLDEwICsxNTAsMTAgQEAKKyMgIAor
IyAgLi4gX3NhbmRib3g6IGh0dHBzOi8vZG9jdXRpbHMuc291cmNlZm9yZ2UuaW8vc2FuZGJveC9S
RUFETUUuaHRtbAorIyAgLi4gX2xpY2Vuc2VzOiBsaWNlbnNlcy8KKyMgLS4uIF9QeXRob24gMi4x
LjEgbGljZW5zZTogaHR0cHM6Ly9kb2NzLnB5dGhvbi5vcmcvMy9saWNlbnNlLmh0bWwKKyMgIC4u
IF9HTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZTogaHR0cHM6Ly93d3cuZ251Lm9yZy9jb3B5bGVm
dC9ncGwuaHRtbAorIyAgLi4gX0JTRCAyLUNsYXVzZSBMaWNlbnNlOiBodHRwOi8vb3BlbnNvdXJj
ZS5vcmcvbGljZW5zZXMvQlNELTItQ2xhdXNlCisjICAuLiBfQlNEIDMtQ2xhdXNlIExpY2Vuc2U6
IGh0dHBzOi8vb3BlbnNvdXJjZS5vcmcvbGljZW5zZXMvQlNELTMtQ2xhdXNlCisjICsuLiBfWm9w
ZSBQdWJsaWMgTGljZW5zZSBWZXJzaW9uIDIuMTogaHR0cHM6Ly9vcGVuc291cmNlLm9yZy9saWNl
bnNlL3pwbC0yLTEvCisjICAuLiBfT1NJLWFwcHJvdmVkOiBodHRwOi8vb3BlbnNvdXJjZS5vcmcv
bGljZW5zZXMvCisjICAuLiBfbGljZW5zZS1saXN0OgorIyAgLi4gX0dQTC1jb21wYXRpYmxlOiBo
dHRwczovL3d3dy5nbnUub3JnL2xpY2Vuc2VzL2xpY2Vuc2UtbGlzdC5odG1sCisjIAorIworCiBT
VU1NQVJZID0gIkRvY3V0aWxzIGlzIGEgbW9kdWxhciBzeXN0ZW0gZm9yIHByb2Nlc3NpbmcgZG9j
dW1lbnRhdGlvbiBpbnRvIHVzZWZ1bCBmb3JtYXRzIgogSE9NRVBBR0UgPSAiaHR0cDovL2RvY3V0
aWxzLnNvdXJjZWZvcmdlLm5ldCIKIFNFQ1RJT04gPSAiZGV2ZWwvcHl0aG9uIgogTElDRU5TRSA9
ICJQU0YtMi4wICYgQlNELTItQ2xhdXNlICYgR1BMLTMuMC1vbmx5IgotTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vQ09QWUlORy50eHQ7bWQ1PTA4ZjVmOGFhNmExZGIyNTAwYzA4YTJiYjU1OGU0
NWFmIgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORy50eHQ7bWQ1PTM4MjQzMGEw
OWE0NDUzODE4YWE2NjE4ZjIwOTA0OTFiIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZjA4YTRl
Mjc2YzNhMTU4M2E4NmRjZTNlMzRhYmEzZmUwNGQwMmJiYTJkZDUxZWQxNjEwNjI0NGU4YTkyM2Uz
YiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIzYTZiMTg3MzJlZGYxODJkYWEzY2QxMjc3NWJiYjMz
OGNmNTY5MTQ2OGY5MWVlZWIxMDlkZWZmNmViZmE5ODZmIgogCiBpbmhlcml0IHB5cGkgc2V0dXB0
b29sczMKIAotLSAKMi40NC4wCgo=

--===============6849115990708064073==--

