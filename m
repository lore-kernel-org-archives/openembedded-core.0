Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12A1DC83F36
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:24 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.1417.1751386815398132227
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Ig5VLU4w;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=dpLJnT2Z;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010197c6ca031e-20d15116-dccd-4128-8a4f-b41fe8ec02f7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386817;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WQWqqlnK/vvxJmZ0ciY6NUTP9TPoVHFTcKnzL5Y61vI=;
	b=Ig5VLU4w3L9r56WovDXYMu20hKhfQehEc1Tk0fh+drZCgw8JTfveZdSmV3524qXx
	HtohiCcOwh99vMQByGDZsOb/g/HQSXIx3z92DNlnpr059XXA4A67mz5+2OGDveMwOkd
	RkCsj1IBamnmQi6R8TE3Mt9YCmDmpjUriMRYvOsc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386817;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WQWqqlnK/vvxJmZ0ciY6NUTP9TPoVHFTcKnzL5Y61vI=;
	b=dpLJnT2Z5cH1hhDq5UMg86N1hZ421XHERpeDdsMOJlWs1fUYjf1M1H/ceVpemLWN
	Z698dojNUzuDZFWALecLflO9h4YL8jUxQrcjpSnhbxu2yx6qM/EFoVQbOqeoWZjn7cu
	c+po38QySVr/bNF4ReCDIQLSq37AMtcJIHL2qlwo=
Content-Type: multipart/mixed; boundary="===============4998289717019634243=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-zipp: upgrading to 3.23.0 FAILED
Message-ID: <01010197c6ca031e-20d15116-dccd-4128-8a4f-b41fe8ec02f7-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219650

--===============4998289717019634243==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-zipp* to *3.23.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-zipp-upgrade-3.21.0-3.23.0.patch
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
From b3dff84a97ed30eb640ff4240b4372ee4dd62a45 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Jul 2025 10:11:50 +0000
Subject: [PATCH] python3-zipp: upgrade 3.21.0 -> 3.23.0

---
 ...-zipp_3.21.0.bb => python3-zipp_3.23.0.bb} | 51 ++++++++++++++++++-
 1 file changed, 49 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-zipp_3.21.0.bb => python3-zipp_3.23.0.bb} (10%)

diff --git a/meta/recipes-devtools/python/python3-zipp_3.21.0.bb b/meta/recipes-devtools/python/python3-zipp_3.23.0.bb
similarity index 10%
rename from meta/recipes-devtools/python/python3-zipp_3.21.0.bb
rename to meta/recipes-devtools/python/python3-zipp_3.23.0.bb
index 135a1ae533..10ce36680b 100644
--- a/meta/recipes-devtools/python/python3-zipp_3.21.0.bb
+++ b/meta/recipes-devtools/python/python3-zipp_3.23.0.bb
@@ -1,9 +1,56 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE
+# +++ LICENSE
+# @@ -1,17 +1,18 @@
+# -Permission is hereby granted, free of charge, to any person obtaining a copy
+# -of this software and associated documentation files (the "Software"), to
+# -deal in the Software without restriction, including without limitation the
+# -rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+# -sell copies of the Software, and to permit persons to whom the Software is
+# -furnished to do so, subject to the following conditions:
+# +MIT License
+#  
+# -The above copyright notice and this permission notice shall be included in
+# -all copies or substantial portions of the Software.
+# +Copyright (c) 2025 <copyright holders>
+#  
+# -THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+# -IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+# -FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+# -AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+# -LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+# -FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+# -IN THE SOFTWARE.
+# +Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
+# +associated documentation files (the "Software"), to deal in the Software without restriction, including
+# +without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+# +copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the
+# +following conditions:
+# +
+# +The above copyright notice and this permission notice shall be included in all copies or substantial
+# +portions of the Software.
+# +
+# +THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
+# +LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
+# +EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
+# +IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
+# +USE OR OTHER DEALINGS IN THE SOFTWARE.
+# 
+#
+
 SUMMARY = "Backport of pathlib-compatible object wrapper for zip files"
 HOMEPAGE = "https://github.com/jaraco/zipp"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=141643e11c48898150daa83802dbc65f"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1aeae65f25a15b1e46d4381f2f094e0a"
 
-SRC_URI[sha256sum] = "2c9958f6430a2040341a52eb608ed6dd93ef4392e02ffe219417c1b28b5dd1f4"
+SRC_URI[sha256sum] = "a07157588a12518c9d4034df3fbbee09c814741a33ff63c05fa29d26a2404166"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.47.1


--===============4998289717019634243==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1919 entries from dependency cache.
Parsing recipes...done.
Parsing of 937 .bb files complete (936 cached, 1 parsed). 1917 targets, 42 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-9b5ba4bdba69f0e8eb294bce4582f9005355a0c1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:9b5ba4bdba69f0e8eb294bce4582f9005355a0c1"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 291 Local 278 Mirrors 0 Missed 13 Current 362 (95% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1465 of 1872 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.23.0.bb:do_recipe_qa)
NOTE: recipe python3-zipp-3.23.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-zipp-3.23.0-r0: task do_recipe_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.23.0.bb:do_recipe_qa unihash changed to 8f7125287f2b02cb42335c658341c384ba7828ed06c212e30d018daa7100503e
NOTE: Setscene tasks completed
NOTE: Running task 1853 of 1872 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.23.0.bb:do_fetch)
NOTE: recipe python3-zipp-3.23.0-r0: task do_fetch: Started
NOTE: recipe python3-zipp-3.23.0-r0: task do_fetch: Succeeded
NOTE: Running task 1854 of 1872 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.23.0.bb:do_unpack)
NOTE: Running task 1855 of 1872 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.23.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-zipp-3.23.0-r0: task do_unpack: Started
NOTE: recipe python3-zipp-3.23.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-zipp-3.23.0-r0: task do_unpack: Succeeded
NOTE: Running task 1856 of 1872 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.23.0.bb:do_patch)
NOTE: Running task 1857 of 1872 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.23.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-zipp-3.23.0-r0: task do_patch: Started
NOTE: recipe python3-zipp-3.23.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-zipp-3.23.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-zipp-3.23.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-zipp-3.23.0-r0: task do_patch: Succeeded
NOTE: Running task 1858 of 1872 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.23.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1859 of 1872 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.23.0.bb:do_populate_lic)
NOTE: recipe python3-zipp-3.23.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-zipp-3.23.0-r0: task do_populate_lic: Started
NOTE: recipe python3-zipp-3.23.0-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.23.0.bb:do_populate_lic unihash changed to 2df370c6352ff32e3d15ffc5e51aa3336863ee57965f7bf4ba0fb955ef50335b
NOTE: recipe python3-zipp-3.23.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.23.0.bb:do_deploy_source_date_epoch unihash changed to b4c6e94594f4e205199ed2bd0b8c199cef20b8a7bd3dacd52a412cf3bff9805d
NOTE: Setscene tasks completed
NOTE: Running task 1860 of 1872 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.23.0.bb:do_configure)
NOTE: recipe python3-zipp-3.23.0-r0: task do_configure: Started
NOTE: recipe python3-zipp-3.23.0-r0: task do_configure: Succeeded
NOTE: Running task 1861 of 1872 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.23.0.bb:do_compile)
NOTE: recipe python3-zipp-3.23.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| running egg_info
| writing zipp.egg-info/PKG-INFO
| writing dependency_links to zipp.egg-info/dependency_links.txt
| writing requirements to zipp.egg-info/requires.txt
| writing top-level names to zipp.egg-info/top_level.txt
| ERROR setuptools_scm._file_finders.git listing git files failed - pretending there aren't any
| reading manifest file 'zipp.egg-info/SOURCES.txt'
| adding license file 'LICENSE'
| writing manifest file 'zipp.egg-info/SOURCES.txt'
| 
| ERROR Missing dependencies:
| 	coherent.licensed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-zipp/3.23.0/temp/run.do_compile.3860769:158 exit 1 from 'nativepython3 -m build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-zipp/3.23.0/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-zipp/3.23.0/sources/zipp-3.23.0'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-zipp/3.23.0/temp/run.do_compile.3860769, line 158
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-zipp/3.23.0/temp/run.do_compile.3860769, line 153
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-zipp/3.23.0/temp/run.do_compile.3860769, line 169
NOTE: recipe python3-zipp-3.23.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1861 tasks of which 1851 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250701101132.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250701101132.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.23.0.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-zipp/3.23.0/temp/log.do_compile.3860769
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-zipp-3.23.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-zipp/3.23.0/temp/run.do_compile.3860769' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-zipp/3.23.0/temp/log.do_compile.3860769
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.23.0.bb:do_compile) failed with exit code '1'

--===============4998289717019634243==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-zipp-upgrade-3.21.0-3.23.0.patch"

RnJvbSBiM2RmZjg0YTk3ZWQzMGViNjQwZmY0MjQwYjQzNzJlZTRkZDYyYTQ1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBKdWwgMjAyNSAxMDoxMTo1MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtemlwcDogdXBncmFkZSAzLjIxLjAgLT4gMy4yMy4wCgotLS0KIC4uLi16aXBwXzMuMjEu
MC5iYiA9PiBweXRob24zLXppcHBfMy4yMy4wLmJifSB8IDUxICsrKysrKysrKysrKysrKysrKy0K
IDEgZmlsZSBjaGFuZ2VkLCA0OSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtemlwcF8zLjIxLjAuYmIgPT4g
cHl0aG9uMy16aXBwXzMuMjMuMC5iYn0gKDEwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtemlwcF8zLjIxLjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtemlwcF8zLjIzLjAuYmIKc2ltaWxhcml0eSBpbmRleCAxMCUK
cmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXppcHBfMy4y
MS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtemlw
cF8zLjIzLjAuYmIKaW5kZXggMTM1YTFhZTUzMy4uMTBjZTM2NjgwYiAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXppcHBfMy4yMS4wLmJiCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy16aXBwXzMuMjMuMC5iYgpAQCAtMSw5
ICsxLDU2IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVu
IHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRp
ZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxl
YXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhl
IGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0
YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVk
LicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gTElDRU5TRQorIyArKysgTElDRU5TRQor
IyBAQCAtMSwxNyArMSwxOCBAQAorIyAtUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJl
ZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24gb2J0YWluaW5nIGEgY29weQorIyAtb2YgdGhpcyBz
b2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUgIlNvZnR3YXJl
IiksIHRvCisjIC1kZWFsIGluIHRoZSBTb2Z0d2FyZSB3aXRob3V0IHJlc3RyaWN0aW9uLCBpbmNs
dWRpbmcgd2l0aG91dCBsaW1pdGF0aW9uIHRoZQorIyAtcmlnaHRzIHRvIHVzZSwgY29weSwgbW9k
aWZ5LCBtZXJnZSwgcHVibGlzaCwgZGlzdHJpYnV0ZSwgc3VibGljZW5zZSwgYW5kL29yCisjIC1z
ZWxsIGNvcGllcyBvZiB0aGUgU29mdHdhcmUsIGFuZCB0byBwZXJtaXQgcGVyc29ucyB0byB3aG9t
IHRoZSBTb2Z0d2FyZSBpcworIyAtZnVybmlzaGVkIHRvIGRvIHNvLCBzdWJqZWN0IHRvIHRoZSBm
b2xsb3dpbmcgY29uZGl0aW9uczoKKyMgK01JVCBMaWNlbnNlCisjICAKKyMgLVRoZSBhYm92ZSBj
b3B5cmlnaHQgbm90aWNlIGFuZCB0aGlzIHBlcm1pc3Npb24gbm90aWNlIHNoYWxsIGJlIGluY2x1
ZGVkIGluCisjIC1hbGwgY29waWVzIG9yIHN1YnN0YW50aWFsIHBvcnRpb25zIG9mIHRoZSBTb2Z0
d2FyZS4KKyMgK0NvcHlyaWdodCAoYykgMjAyNSA8Y29weXJpZ2h0IGhvbGRlcnM+CisjICAKKyMg
LVRIRSBTT0ZUV0FSRSBJUyBQUk9WSURFRCAiQVMgSVMiLCBXSVRIT1VUIFdBUlJBTlRZIE9GIEFO
WSBLSU5ELCBFWFBSRVNTIE9SCisjIC1JTVBMSUVELCBJTkNMVURJTkcgQlVUIE5PVCBMSU1JVEVE
IFRPIFRIRSBXQVJSQU5USUVTIE9GIE1FUkNIQU5UQUJJTElUWSwKKyMgLUZJVE5FU1MgRk9SIEEg
UEFSVElDVUxBUiBQVVJQT1NFIEFORCBOT05JTkZSSU5HRU1FTlQuIElOIE5PIEVWRU5UIFNIQUxM
IFRIRQorIyAtQVVUSE9SUyBPUiBDT1BZUklHSFQgSE9MREVSUyBCRSBMSUFCTEUgRk9SIEFOWSBD
TEFJTSwgREFNQUdFUyBPUiBPVEhFUgorIyAtTElBQklMSVRZLCBXSEVUSEVSIElOIEFOIEFDVElP
TiBPRiBDT05UUkFDVCwgVE9SVCBPUiBPVEhFUldJU0UsIEFSSVNJTkcKKyMgLUZST00sIE9VVCBP
RiBPUiBJTiBDT05ORUNUSU9OIFdJVEggVEhFIFNPRlRXQVJFIE9SIFRIRSBVU0UgT1IgT1RIRVIg
REVBTElOR1MKKyMgLUlOIFRIRSBTT0ZUV0FSRS4KKyMgK1Blcm1pc3Npb24gaXMgaGVyZWJ5IGdy
YW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBhbnkgcGVyc29uIG9idGFpbmluZyBhIGNvcHkgb2Yg
dGhpcyBzb2Z0d2FyZSBhbmQKKyMgK2Fzc29jaWF0ZWQgZG9jdW1lbnRhdGlvbiBmaWxlcyAodGhl
ICJTb2Z0d2FyZSIpLCB0byBkZWFsIGluIHRoZSBTb2Z0d2FyZSB3aXRob3V0IHJlc3RyaWN0aW9u
LCBpbmNsdWRpbmcKKyMgK3dpdGhvdXQgbGltaXRhdGlvbiB0aGUgcmlnaHRzIHRvIHVzZSwgY29w
eSwgbW9kaWZ5LCBtZXJnZSwgcHVibGlzaCwgZGlzdHJpYnV0ZSwgc3VibGljZW5zZSwgYW5kL29y
IHNlbGwKKyMgK2NvcGllcyBvZiB0aGUgU29mdHdhcmUsIGFuZCB0byBwZXJtaXQgcGVyc29ucyB0
byB3aG9tIHRoZSBTb2Z0d2FyZSBpcyBmdXJuaXNoZWQgdG8gZG8gc28sIHN1YmplY3QgdG8gdGhl
CisjICtmb2xsb3dpbmcgY29uZGl0aW9uczoKKyMgKworIyArVGhlIGFib3ZlIGNvcHlyaWdodCBu
b3RpY2UgYW5kIHRoaXMgcGVybWlzc2lvbiBub3RpY2Ugc2hhbGwgYmUgaW5jbHVkZWQgaW4gYWxs
IGNvcGllcyBvciBzdWJzdGFudGlhbAorIyArcG9ydGlvbnMgb2YgdGhlIFNvZnR3YXJlLgorIyAr
CisjICtUSEUgU09GVFdBUkUgSVMgUFJPVklERUQgIkFTIElTIiwgV0lUSE9VVCBXQVJSQU5UWSBP
RiBBTlkgS0lORCwgRVhQUkVTUyBPUiBJTVBMSUVELCBJTkNMVURJTkcgQlVUIE5PVAorIyArTElN
SVRFRCBUTyBUSEUgV0FSUkFOVElFUyBPRiBNRVJDSEFOVEFCSUxJVFksIEZJVE5FU1MgRk9SIEEg
UEFSVElDVUxBUiBQVVJQT1NFIEFORCBOT05JTkZSSU5HRU1FTlQuIElOIE5PCisjICtFVkVOVCBT
SEFMTCBUSEUgQVVUSE9SUyBPUiBDT1BZUklHSFQgSE9MREVSUyBCRSBMSUFCTEUgRk9SIEFOWSBD
TEFJTSwgREFNQUdFUyBPUiBPVEhFUiBMSUFCSUxJVFksIFdIRVRIRVIKKyMgK0lOIEFOIEFDVElP
TiBPRiBDT05UUkFDVCwgVE9SVCBPUiBPVEhFUldJU0UsIEFSSVNJTkcgRlJPTSwgT1VUIE9GIE9S
IElOIENPTk5FQ1RJT04gV0lUSCBUSEUgU09GVFdBUkUgT1IgVEhFCisjICtVU0UgT1IgT1RIRVIg
REVBTElOR1MgSU4gVEhFIFNPRlRXQVJFLgorIyAKKyMKKwogU1VNTUFSWSA9ICJCYWNrcG9ydCBv
ZiBwYXRobGliLWNvbXBhdGlibGUgb2JqZWN0IHdyYXBwZXIgZm9yIHppcCBmaWxlcyIKIEhPTUVQ
QUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9qYXJhY28vemlwcCIKIExJQ0VOU0UgPSAiTUlUIgot
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MTQxNjQzZTExYzQ4ODk4MTUw
ZGFhODM4MDJkYmM2NWYiCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0x
YWVhZTY1ZjI1YTE1YjFlNDZkNDM4MWYyZjA5NGUwYSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjJjOTk1OGY2NDMwYTIwNDAzNDFhNTJlYjYwOGVkNmRkOTNlZjQzOTJlMDJmZmUyMTk0MTdjMWIy
OGI1ZGQxZjQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYTA3MTU3NTg4YTEyNTE4YzlkNDAzNGRm
M2ZiYmVlMDljODE0NzQxYTMzZmY2M2MwNWZhMjlkMjZhMjQwNDE2NiIKIAogREVQRU5EUyArPSAi
cHl0aG9uMy1zZXR1cHRvb2xzLXNjbS1uYXRpdmUiCiAKLS0gCjIuNDcuMQoK

--===============4998289717019634243==--

