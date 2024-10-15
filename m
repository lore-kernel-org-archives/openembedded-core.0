Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3349CD1D89E
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 12:16:02 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.11790.1728994550204778530
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 05:15:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=MU3eLcRy;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=wrWbNajf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010192901b3821-f194048d-a537-45f2-8985-4467eaae222b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728994556;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=QQ2hTlPXCTMfN1nzqPlzMlJLyd5Ehu+7fx+0TLHp98Q=;
	b=MU3eLcRyoE0nIwZPnNjMy9hib3rzqjzM04PkNhhNeMCOU+vXk9t5x5ebtyfSDRCw
	5jSYpiUbUmRNSoX1/TfMfQ0CbmdVB3ee/+AosBKIETogLh+hOfTpA8gK9uCpH4z86oN
	Ng/hb9vQMd8kBQOFOllZ5AaM0yOt5Z6vK4D8JpMU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728994556;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=QQ2hTlPXCTMfN1nzqPlzMlJLyd5Ehu+7fx+0TLHp98Q=;
	b=wrWbNajfRcYKPtnG2ygUuH8FLdx0DKlctA9/T5bgAoMUGnRuWYH4F4WGmNDXJAf6
	4S75dmw+zxIMjgEXOILIh/sJFOyIpGEMoMUOlaeX657buWK5vT24oqOBSGyf1pr5voR
	Hy4huItYJhJ7q4BB2GlRjfalDJdhhKMOTHx5ilUM=
Content-Type: multipart/mixed; boundary="===============2266372719883335697=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-isodate: upgrading to 0.7.2 FAILED
Message-ID: <01010192901b3821-f194048d-a537-45f2-8985-4467eaae222b-000000@us-west-2.amazonses.com>
Date: Tue, 15 Oct 2024 12:15:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 12:16:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205841

--===============2266372719883335697==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-isodate* to *0.7.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-isodate-upgrade-0.6.1-0.7.2.patch
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
From ecc7d6473c3aeba252ad32d6bba45878e000ad6d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Oct 2024 08:26:54 +0000
Subject: [PATCH] python3-isodate: upgrade 0.6.1 -> 0.7.2

---
 ...date_0.6.1.bb => python3-isodate_0.7.2.bb} | 20 +++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-isodate_0.6.1.bb => python3-isodate_0.7.2.bb} (28%)

diff --git a/meta/recipes-devtools/python/python3-isodate_0.6.1.bb b/meta/recipes-devtools/python/python3-isodate_0.7.2.bb
similarity index 28%
rename from meta/recipes-devtools/python/python3-isodate_0.6.1.bb
rename to meta/recipes-devtools/python/python3-isodate_0.7.2.bb
index 293fb08277..5e6a616abf 100644
--- a/meta/recipes-devtools/python/python3-isodate_0.6.1.bb
+++ b/meta/recipes-devtools/python/python3-isodate_0.7.2.bb
@@ -1,10 +1,26 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- PKG-INFO
+# +++ PKG-INFO
+# @@ -1 +1 @@
+# -License: BSD
+# +        Copyright (c) 2009, Gerhard Weis
+# 
+#
+
 SUMMARY = "ISO 8601 date/time parser"
 HOMEPAGE = "https://github.com/gweis/isodate/"
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=810c800df2e786f77d64c50af3bde298"
 
-SRC_URI[sha256sum] = "48c5881de7e8b0a0d648cb024c8062dc84e7b840ed81e864c7614fd3c127bde9"
+SRC_URI[sha256sum] = "4cd1aa0f43ca76f4a6c6c0292a85f40b35ec2e43e315b59f06e6d32171a953e6"
 
 inherit pypi setuptools3
 
-- 
2.44.1


--===============2266372719883335697==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-isodate-upgrade-0.6.1-0.7.2.patch"

RnJvbSBlY2M3ZDY0NzNjM2FlYmEyNTJhZDMyZDZiYmE0NTg3OGUwMDBhZDZkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgT2N0IDIwMjQgMDg6MjY6NTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWlzb2RhdGU6IHVwZ3JhZGUgMC42LjEgLT4gMC43LjIKCi0tLQogLi4uZGF0ZV8wLjYu
MS5iYiA9PiBweXRob24zLWlzb2RhdGVfMC43LjIuYmJ9IHwgMjAgKysrKysrKysrKysrKysrKyst
LQogMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1pc29kYXRlXzAuNi4xLmJi
ID0+IHB5dGhvbjMtaXNvZGF0ZV8wLjcuMi5iYn0gKDI4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaXNvZGF0ZV8wLjYuMS5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1pc29kYXRlXzAuNy4yLmJiCnNpbWlsYXJpdHkg
aW5kZXggMjglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1pc29kYXRlXzAuNi4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtaXNvZGF0ZV8wLjcuMi5iYgppbmRleCAyOTNmYjA4Mjc3Li41ZTZhNjE2YWJmIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaXNvZGF0ZV8w
LjYuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaXNvZGF0
ZV8wLjcuMi5iYgpAQCAtMSwxMCArMSwyNiBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtT
VU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUg
Zm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBs
aWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVk
LCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEg
J0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5
cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIFBLRy1J
TkZPCisjICsrKyBQS0ctSU5GTworIyBAQCAtMSArMSBAQAorIyAtTGljZW5zZTogQlNECisjICsg
ICAgICAgIENvcHlyaWdodCAoYykgMjAwOSwgR2VyaGFyZCBXZWlzCisjIAorIworCiBTVU1NQVJZ
ID0gIklTTyA4NjAxIGRhdGUvdGltZSBwYXJzZXIiCiBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1
Yi5jb20vZ3dlaXMvaXNvZGF0ZS8iCiBTRUNUSU9OID0gImRldmVsL3B5dGhvbiIKIExJQ0VOU0Ug
PSAiQlNELTMtQ2xhdXNlIgotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vUEtHLUlORk87YmVn
aW5saW5lPTg7ZW5kbGluZT04O21kNT1lOTEwYjM1YjBlZjRlMWY2NjViOWE3NWQ2YWZiNzcwOSIK
K0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL1BLRy1JTkZPO2JlZ2lubGluZT04O2VuZGxpbmU9
ODttZDU9ODEwYzgwMGRmMmU3ODZmNzdkNjRjNTBhZjNiZGUyOTgiCiAKLVNSQ19VUklbc2hhMjU2
c3VtXSA9ICI0OGM1ODgxZGU3ZThiMGEwZDY0OGNiMDI0YzgwNjJkYzg0ZTdiODQwZWQ4MWU4NjRj
NzYxNGZkM2MxMjdiZGU5IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjRjZDFhYTBmNDNjYTc2ZjRh
NmM2YzAyOTJhODVmNDBiMzVlYzJlNDNlMzE1YjU5ZjA2ZTZkMzIxNzFhOTUzZTYiCiAKIGluaGVy
aXQgcHlwaSBzZXR1cHRvb2xzMwogCi0tIAoyLjQ0LjEKCg==

--===============2266372719883335697==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1877 entries from dependency cache.
Parsing recipes...done.
Parsing of 919 .bb files complete (918 cached, 1 parsed). 1875 targets, 41 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:cdc2ebc0530bc43c1be7ea3315e086c7c9f798ec"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 315 Local 306 Mirrors 0 Missed 9 Current 329 (97% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 402 of 644 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-isodate_0.7.2.bb:do_populate_lic_setscene)
NOTE: Running setscene task 404 of 644 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-isodate_0.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-isodate-0.7.2-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-isodate-0.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-isodate-0.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-isodate-0.7.2-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 644 of 644 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-isodate_0.7.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-isodate-0.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-isodate-0.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1804 of 1824 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-isodate_0.7.2.bb:do_fetch)
NOTE: recipe python3-isodate-0.7.2-r0: task do_fetch: Started
NOTE: recipe python3-isodate-0.7.2-r0: task do_fetch: Succeeded
NOTE: Running task 1805 of 1824 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-isodate_0.7.2.bb:do_unpack)
NOTE: Running task 1806 of 1824 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-isodate_0.7.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-isodate-0.7.2-r0: task do_unpack: Started
NOTE: recipe python3-isodate-0.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-isodate-0.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 1807 of 1824 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-isodate_0.7.2.bb:do_patch)
NOTE: Running task 1808 of 1824 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-isodate_0.7.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-isodate-0.7.2-r0: task do_patch: Started
NOTE: recipe python3-isodate-0.7.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-isodate-0.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-isodate-0.7.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-isodate-0.7.2-r0: task do_patch: Succeeded
NOTE: Running task 1810 of 1824 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-isodate_0.7.2.bb:do_check_backend)
NOTE: recipe python3-isodate-0.7.2-r0: task do_check_backend: Started
WARNING: python3-isodate-0.7.2-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]
NOTE: recipe python3-isodate-0.7.2-r0: task do_check_backend: Succeeded
NOTE: Running task 1812 of 1824 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-isodate_0.7.2.bb:do_configure)
NOTE: recipe python3-isodate-0.7.2-r0: task do_configure: Started
NOTE: recipe python3-isodate-0.7.2-r0: task do_configure: Succeeded
NOTE: Running task 1813 of 1824 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-isodate_0.7.2.bb:do_compile)
NOTE: recipe python3-isodate-0.7.2-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-isodate/0.7.2/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-isodate/0.7.2/isodate-0.7.2/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-isodate/0.7.2/temp/run.do_compile.4045135:180 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-isodate/0.7.2/temp/run.do_compile.4045135, line 180
| 	#2: setuptools3_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-isodate/0.7.2/temp/run.do_compile.4045135, line 170
| 	#3: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-isodate/0.7.2/temp/run.do_compile.4045135, line 152
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-isodate/0.7.2/temp/run.do_compile.4045135, line 184
NOTE: recipe python3-isodate-0.7.2-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1813 tasks of which 1805 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241015082641.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241015082641.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-isodate_0.7.2.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-isodate/0.7.2/temp/log.do_compile.4045135
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-isodate-0.7.2-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-isodate-0.7.2-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-isodate/0.7.2/temp/run.do_compile.4045135' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-isodate/0.7.2/temp/log.do_compile.4045135
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-isodate_0.7.2.bb:do_compile) failed with exit code '1'

--===============2266372719883335697==--

