Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83AA8C54748
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:19 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.1309.1721071147139683698
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=PU6Xpnpx;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=VJEnkGBx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010190b7d5964e-0101c080-8b3f-4c9d-8ea0-a89566b3d1e4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071146;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+X383cZJi/gXhYsq8YMjfqRRzW/mgPCDw+XCrC+kQEQ=;
	b=PU6XpnpxK2aoFQ6KxzV1ge70+eazsW16XFt2GlxNssURyQthK2hIYiRKK36JYwx5
	aqfw4K+C+4cJoiT0okID3HtXM62U3hJ3owjDuQqH28yz8+1kEttMKp6+SyMFRKe5pJY
	6eqlat6nT5hSrrAB/xg9j7YDul6TJgXrjp8BczlI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071146;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+X383cZJi/gXhYsq8YMjfqRRzW/mgPCDw+XCrC+kQEQ=;
	b=VJEnkGBxBVvCQJwFG6wmU39LHqioFXmGxcDFF+YAk9RF2hdd/2kE4KhyQAA0nYLQ
	DKw1BrmCyAoAA6bqNP96AfVNo/ELTSKEFIgMwJYAIX6J0K4qOOcbjoKpnPQgbGCKmQD
	AQIWQO8/65L5iM6CayPSTuOYsEGqFcz7tO0N5sJo=
Content-Type: multipart/mixed; boundary="===============8735390461857651843=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools: upgrading to 70.3.0 FAILED
Message-ID: <01010190b7d5964e-0101c080-8b3f-4c9d-8ea0-a89566b3d1e4-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201989

--===============8735390461857651843==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-setuptools* to *70.3.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-setuptools-upgrade-69.5.1-70.3.0.patch
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
From 5a5b493b1840eceb680f2e7b5fac75381ebe7274 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jul 2024 11:22:49 +0000
Subject: [PATCH] python3-setuptools: upgrade 69.5.1 -> 70.3.0

---
 ...istutils-sysconfig.py-make-it-possible-to-substite.patch | 6 +++---
 ...01-conditionally-do-not-fetch-code-by-easy_install.patch | 4 ++--
 ...n3-setuptools_69.5.1.bb => python3-setuptools_70.3.0.bb} | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_69.5.1.bb => python3-setuptools_70.3.0.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
index 0f6c9d250d..738f67cba0 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
@@ -1,4 +1,4 @@
-From d393759315b189a738e4b6a2ce31dc18dbbfae29 Mon Sep 17 00:00:00 2001
+From 3d975431981c894dd882ac5137dd86f0806b431e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Wed, 11 May 2022 21:41:14 +0200
 Subject: [PATCH] _distutils/sysconfig.py: make it possible to substite the
@@ -20,10 +20,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 10 insertions(+), 2 deletions(-)
 
 diff --git a/setuptools/_distutils/sysconfig.py b/setuptools/_distutils/sysconfig.py
-index a40a723..14f35e7 100644
+index 1a38e9f..cc3bd88 100644
 --- a/setuptools/_distutils/sysconfig.py
 +++ b/setuptools/_distutils/sysconfig.py
-@@ -119,6 +119,8 @@ def get_python_inc(plat_specific=0, prefix=None):
+@@ -120,6 +120,8 @@ def get_python_inc(plat_specific=0, prefix=None):
      sys.base_exec_prefix -- i.e., ignore 'plat_specific'.
      """
      default_prefix = BASE_EXEC_PREFIX if plat_specific else BASE_PREFIX
diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index e227c2889c..fbe2235144 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From 80fe63816eb3bfd1f5b6d354e1f2442805cff4e0 Mon Sep 17 00:00:00 2001
+From b6379a050fe5c75801e2e676dcc12ae35280e0f1 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
@@ -14,7 +14,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_install.py
-index 858fb20..62bd853 100644
+index 87a68c2..eed27a7 100644
 --- a/setuptools/command/easy_install.py
 +++ b/setuptools/command/easy_install.py
 @@ -672,6 +672,11 @@ class easy_install(Command):
diff --git a/meta/recipes-devtools/python/python3-setuptools_69.5.1.bb b/meta/recipes-devtools/python/python3-setuptools_70.3.0.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-setuptools_69.5.1.bb
rename to meta/recipes-devtools/python/python3-setuptools_70.3.0.bb
index cc6256db80..291601ca98 100644
--- a/meta/recipes-devtools/python/python3-setuptools_69.5.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_70.3.0.bb
@@ -11,7 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "6c1fccdac05a97e598fb0ae3bbed5904ccb317337a51139dcd51453611bbb987"
+SRC_URI[sha256sum] = "f171bab1dfbc86b132997f26a119f6056a57950d058587841a0082e8830f9dc5"
 
 DEPENDS += "python3"
 
-- 
2.44.0


--===============8735390461857651843==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1882 entries from dependency cache.
Parsing recipes...done.
Parsing of 918 .bb files complete (917 cached, 1 parsed). 1878 targets, 35 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.0+snapshot-47336393f22445ffc42740b25fa24afb4404386c"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:47336393f22445ffc42740b25fa24afb4404386c"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 292 Local 275 Mirrors 0 Missed 17 Current 343 (94% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1403 of 1805 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_70.3.0.bb:do_recipe_qa)
NOTE: Running task 1410 of 1805 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_70.3.0.bb:do_recipe_qa)
NOTE: recipe python3-setuptools-70.3.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-setuptools-native-70.3.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-setuptools-70.3.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-setuptools-native-70.3.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1775 of 1805 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_70.3.0.bb:do_fetch)
NOTE: Running task 1776 of 1805 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_70.3.0.bb:do_fetch)
NOTE: recipe python3-setuptools-70.3.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-70.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 1777 of 1805 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_70.3.0.bb:do_unpack)
NOTE: recipe python3-setuptools-native-70.3.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-native-70.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 1778 of 1805 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_70.3.0.bb:do_unpack)
NOTE: Running task 1779 of 1805 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_70.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-setuptools-70.3.0-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-native-70.3.0-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-native-70.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-70.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 1780 of 1805 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_70.3.0.bb:do_patch)
NOTE: recipe python3-setuptools-native-70.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 1781 of 1805 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_70.3.0.bb:do_patch)
NOTE: Running task 1782 of 1805 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_70.3.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-setuptools-70.3.0-r0: task do_patch: Started
NOTE: recipe python3-setuptools-native-70.3.0-r0: task do_patch: Started
NOTE: recipe python3-setuptools-native-70.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-setuptools-native-70.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-native-70.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1783 of 1805 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_70.3.0.bb:do_create_spdx)
NOTE: recipe python3-setuptools-native-70.3.0-r0: task do_create_spdx: Started
NOTE: recipe python3-setuptools-native-70.3.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1784 of 1805 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_70.3.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-setuptools-70.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-setuptools-70.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-setuptools-70.3.0-r0: task do_patch: Failed
NOTE: recipe python3-setuptools-native-70.3.0-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 1784 tasks of which 1772 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240715112236.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240715112236.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_70.3.0.bb:do_patch
  virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_70.3.0.bb:do_patch
Summary: There were 4 ERROR messages, returning a non-zero exit code.
ERROR: python3-setuptools-70.3.0-r0 do_patch: QA Issue: Fuzz detected:

Applying patch 0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
patching file setuptools/_distutils/sysconfig.py
Hunk #1 succeeded at 121 with fuzz 2 (offset 1 line).
Hunk #2 succeeded at 243 (offset 3 lines).
Hunk #3 succeeded at 264 (offset 3 lines).


The context lines in the patches can be updated with devtool:

    devtool modify python3-setuptools
    devtool finish --force-patch-refresh python3-setuptools <layer_path>

Don't forget to review changes done by devtool!

Patch log indicates that patches do not apply cleanly. [patch-fuzz]
ERROR: python3-setuptools-70.3.0-r0 do_patch: Fatal QA errors were found, failing task.
ERROR: python3-setuptools-native-70.3.0-r0 do_patch: QA Issue: Fuzz detected:

Applying patch 0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
patching file setuptools/_distutils/sysconfig.py
Hunk #1 succeeded at 121 with fuzz 2 (offset 1 line).
Hunk #2 succeeded at 243 (offset 3 lines).
Hunk #3 succeeded at 264 (offset 3 lines).


The context lines in the patches can be updated with devtool:

    devtool modify python3-setuptools-native
    devtool finish --force-patch-refresh python3-setuptools-native <layer_path>

Don't forget to review changes done by devtool!

Patch log indicates that patches do not apply cleanly. [patch-fuzz]
ERROR: python3-setuptools-native-70.3.0-r0 do_patch: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-setuptools/70.3.0/temp/log.do_patch.1501604
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_70.3.0.bb:do_patch) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-native/70.3.0/temp/log.do_patch.1501616
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_70.3.0.bb:do_patch) failed with exit code '1'

--===============8735390461857651843==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-upgrade-69.5.1-70.3.0.patch"

RnJvbSA1YTViNDkzYjE4NDBlY2ViNjgwZjJlN2I1ZmFjNzUzODFlYmU3Mjc0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSnVsIDIwMjQgMTE6MjI6NDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNldHVwdG9vbHM6IHVwZ3JhZGUgNjkuNS4xIC0+IDcwLjMuMAoKLS0tCiAuLi5pc3R1
dGlscy1zeXNjb25maWcucHktbWFrZS1pdC1wb3NzaWJsZS10by1zdWJzdGl0ZS5wYXRjaCB8IDYg
KysrLS0tCiAuLi4wMS1jb25kaXRpb25hbGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWVhc3lfaW5z
dGFsbC5wYXRjaCB8IDQgKystLQogLi4ubjMtc2V0dXB0b29sc182OS41LjEuYmIgPT4gcHl0aG9u
My1zZXR1cHRvb2xzXzcwLjMuMC5iYn0gfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3tweXRob24zLXNldHVwdG9vbHNfNjkuNS4xLmJiID0+IHB5dGhvbjMtc2V0dXB0b29sc183
MC4zLjAuYmJ9ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXNldHVwdG9vbHMvMDAwMS1fZGlzdHV0aWxzLXN5c2NvbmZpZy5weS1tYWtlLWl0
LXBvc3NpYmxlLXRvLXN1YnN0aXRlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXNldHVwdG9vbHMvMDAwMS1fZGlzdHV0aWxzLXN5c2NvbmZpZy5weS1tYWtlLWl0
LXBvc3NpYmxlLXRvLXN1YnN0aXRlLnBhdGNoCmluZGV4IDBmNmM5ZDI1MGQuLjczOGY2N2NiYTAg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRv
b2xzLzAwMDEtX2Rpc3R1dGlscy1zeXNjb25maWcucHktbWFrZS1pdC1wb3NzaWJsZS10by1zdWJz
dGl0ZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0
dXB0b29scy8wMDAxLV9kaXN0dXRpbHMtc3lzY29uZmlnLnB5LW1ha2UtaXQtcG9zc2libGUtdG8t
c3Vic3RpdGUucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGQzOTM3NTkzMTViMTg5YTczOGU0
YjZhMmNlMzFkYzE4ZGJiZmFlMjkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDNkOTc1
NDMxOTgxYzg5NGRkODgyYWM1MTM3ZGQ4NmYwODA2YjQzMWUgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgogRGF0ZTog
V2VkLCAxMSBNYXkgMjAyMiAyMTo0MToxNCArMDIwMAogU3ViamVjdDogW1BBVENIXSBfZGlzdHV0
aWxzL3N5c2NvbmZpZy5weTogbWFrZSBpdCBwb3NzaWJsZSB0byBzdWJzdGl0ZSB0aGUKQEAgLTIw
LDEwICsyMCwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51
dHJvbml4LmRlPgogIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQogCiBkaWZmIC0tZ2l0IGEvc2V0dXB0b29scy9fZGlzdHV0aWxzL3N5c2NvbmZpZy5weSBi
L3NldHVwdG9vbHMvX2Rpc3R1dGlscy9zeXNjb25maWcucHkKLWluZGV4IGE0MGE3MjMuLjE0ZjM1
ZTcgMTAwNjQ0CitpbmRleCAxYTM4ZTlmLi5jYzNiZDg4IDEwMDY0NAogLS0tIGEvc2V0dXB0b29s
cy9fZGlzdHV0aWxzL3N5c2NvbmZpZy5weQogKysrIGIvc2V0dXB0b29scy9fZGlzdHV0aWxzL3N5
c2NvbmZpZy5weQotQEAgLTExOSw2ICsxMTksOCBAQCBkZWYgZ2V0X3B5dGhvbl9pbmMocGxhdF9z
cGVjaWZpYz0wLCBwcmVmaXg9Tm9uZSk6CitAQCAtMTIwLDYgKzEyMCw4IEBAIGRlZiBnZXRfcHl0
aG9uX2luYyhwbGF0X3NwZWNpZmljPTAsIHByZWZpeD1Ob25lKToKICAgICAgc3lzLmJhc2VfZXhl
Y19wcmVmaXggLS0gaS5lLiwgaWdub3JlICdwbGF0X3NwZWNpZmljJy4KICAgICAgIiIiCiAgICAg
IGRlZmF1bHRfcHJlZml4ID0gQkFTRV9FWEVDX1BSRUZJWCBpZiBwbGF0X3NwZWNpZmljIGVsc2Ug
QkFTRV9QUkVGSVgKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1zZXR1cHRvb2xzLzAwMDEtY29uZGl0aW9uYWxseS1kby1ub3QtZmV0Y2gtY29kZS1ieS1l
YXN5X2luc3RhbGwucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
c2V0dXB0b29scy8wMDAxLWNvbmRpdGlvbmFsbHktZG8tbm90LWZldGNoLWNvZGUtYnktZWFzeV9p
bnN0YWxsLnBhdGNoCmluZGV4IGUyMjdjMjg4OWMuLmZiZTIyMzUxNDQgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzLzAwMDEtY29uZGl0
aW9uYWxseS1kby1ub3QtZmV0Y2gtY29kZS1ieS1lYXN5X2luc3RhbGwucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMvMDAwMS1jb25kaXRp
b25hbGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWVhc3lfaW5zdGFsbC5wYXRjaApAQCAtMSw0ICsx
LDQgQEAKLUZyb20gODBmZTYzODE2ZWIzYmZkMWY1YjZkMzU0ZTFmMjQ0MjgwNWNmZjRlMCBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYjYzNzlhMDUwZmU1Yzc1ODAxZTJlNjc2ZGNjMTJh
ZTM1MjgwZTBmMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEhvbmd4dSBKaWEgPGhv
bmd4dS5qaWFAd2luZHJpdmVyLmNvbT4KIERhdGU6IFR1ZSwgMTcgSnVsIDIwMTggMTA6MTM6Mzgg
KzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gY29uZGl0aW9uYWxseSBkbyBub3QgZmV0Y2ggY29kZSBi
eSBlYXN5X2luc3RhbGwKQEAgLTE0LDcgKzE0LDcgQEAgU2lnbmVkLW9mZi1ieTogSG9uZ3h1IEpp
YSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlv
bnMoKykKIAogZGlmZiAtLWdpdCBhL3NldHVwdG9vbHMvY29tbWFuZC9lYXN5X2luc3RhbGwucHkg
Yi9zZXR1cHRvb2xzL2NvbW1hbmQvZWFzeV9pbnN0YWxsLnB5Ci1pbmRleCA4NThmYjIwLi42MmJk
ODUzIDEwMDY0NAoraW5kZXggODdhNjhjMi4uZWVkMjdhNyAxMDA2NDQKIC0tLSBhL3NldHVwdG9v
bHMvY29tbWFuZC9lYXN5X2luc3RhbGwucHkKICsrKyBiL3NldHVwdG9vbHMvY29tbWFuZC9lYXN5
X2luc3RhbGwucHkKIEBAIC02NzIsNiArNjcyLDExIEBAIGNsYXNzIGVhc3lfaW5zdGFsbChDb21t
YW5kKToKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1z
ZXR1cHRvb2xzXzY5LjUuMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1zZXR1cHRvb2xzXzcwLjMuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29sc182OS41LjEuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xz
XzcwLjMuMC5iYgppbmRleCBjYzYyNTZkYjgwLi4yOTE2MDFjYTk4IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29sc182OS41LjEuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHNfNzAuMy4w
LmJiCkBAIC0xMSw3ICsxMSw3IEBAIFNSQ19VUkk6YXBwZW5kOmNsYXNzLW5hdGl2ZSA9ICIgZmls
ZTovLzAwMDEtY29uZGl0aW9uYWxseS1kby1ub3QtZmV0Y2gtY29kZS1ieS1lCiBTUkNfVVJJICs9
ICIgXAogICAgICAgICAgICAgZmlsZTovLzAwMDEtX2Rpc3R1dGlscy1zeXNjb25maWcucHktbWFr
ZS1pdC1wb3NzaWJsZS10by1zdWJzdGl0ZS5wYXRjaCIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjZjMWZjY2RhYzA1YTk3ZTU5OGZiMGFlM2JiZWQ1OTA0Y2NiMzE3MzM3YTUxMTM5ZGNkNTE0NTM2
MTFiYmI5ODciCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZjE3MWJhYjFkZmJjODZiMTMyOTk3ZjI2
YTExOWY2MDU2YTU3OTUwZDA1ODU4Nzg0MWEwMDgyZTg4MzBmOWRjNSIKIAogREVQRU5EUyArPSAi
cHl0aG9uMyIKIAotLSAKMi40NC4wCgo=

--===============8735390461857651843==--

