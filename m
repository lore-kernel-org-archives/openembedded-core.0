Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D9A8D10DBD
	for <webhook@archiver.kernel.org>; Sun,  1 Dec 2024 10:05:59 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.149803.1733047558288889691
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Dec 2024 02:05:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=JFPWB7CP;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=RdLzZeXe;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019381af1d79-7e6a1a67-779b-4fe4-97c3-5abe34137377-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1733047557;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3dtFekdhWjzI4dFjsTmBeNTftK7rUoEeMGmyz+q080Q=;
	b=JFPWB7CP+kTShyKmG3KamwLbKhdhoffKDArgAvnTFxiiN8tgDxHzRcaBh/5483kA
	dN6uZkRqmtb/5RR3glyIfl5Kuw3BhmaGFlmUiH/F1IEj4QSbyVe1tyyWxkqqsPnRQeO
	JmtlwLC/Nfm0t1e20p2os6ijaObcwlfqDDI49W2o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1733047557;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3dtFekdhWjzI4dFjsTmBeNTftK7rUoEeMGmyz+q080Q=;
	b=RdLzZeXeOzLoGxuyTs+Capnxy3feGx7Mp62B0bZ7NVrSWefGRAbCVJV9s88kuKEu
	Hp5qLpvQant6mGHeLA0MdjPDbK0/rL1W6bpcJiU2n3PaUY8IdTvJcxb7QLx2vbXa9nn
	lbX7w/rlUIKzmHFp/iAUXTIWyyuj424G2M/9tXDI=
Content-Type: multipart/mixed; boundary="===============1517439775181797244=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Marta Rybczynska <mrybczynska@syslinbit.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-beartype: upgrading to 0.19.0 FAILED
Message-ID: <0101019381af1d79-7e6a1a67-779b-4fe4-97c3-5abe34137377-000000@us-west-2.amazonses.com>
Date: Sun, 1 Dec 2024 10:05:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Dec 2024 10:05:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208069

--===============1517439775181797244==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-beartype* to *0.19.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-beartype-upgrade-0.18.5-0.19.0.patch
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
From ab7b20e097dfcc5064ee754d797109df1ef06228 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Dec 2024 07:06:24 +0000
Subject: [PATCH] python3-beartype: upgrade 0.18.5 -> 0.19.0

---
 .../{python3-beartype_0.18.5.bb => python3-beartype_0.19.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-beartype_0.18.5.bb => python3-beartype_0.19.0.bb} (78%)

diff --git a/meta/recipes-devtools/python/python3-beartype_0.18.5.bb b/meta/recipes-devtools/python/python3-beartype_0.19.0.bb
similarity index 78%
rename from meta/recipes-devtools/python/python3-beartype_0.18.5.bb
rename to meta/recipes-devtools/python/python3-beartype_0.19.0.bb
index 95d947c90e..ebdc7abab3 100644
--- a/meta/recipes-devtools/python/python3-beartype_0.18.5.bb
+++ b/meta/recipes-devtools/python/python3-beartype_0.19.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://beartype.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e71f94261c1b39896cacacfeaf60560e"
 
-SRC_URI[sha256sum] = "264ddc2f1da9ec94ff639141fbe33d22e12a9f75aa863b83b7046ffff1381927"
+SRC_URI[sha256sum] = "de42dfc1ba5c3710fde6c3002e3bd2cad236ed4d2aabe876345ab0b4234a6573"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.44.1


--===============1517439775181797244==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1879 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (920 cached, 1 parsed). 1877 targets, 41 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:a59ffc4db12d61b10d1fa6bb8da510038b8707d5"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 303 Local 294 Mirrors 0 Missed 9 Current 325 (97% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 452 of 628 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.19.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 527 of 628 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-beartype-0.19.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-beartype-0.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-beartype-0.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-beartype-0.19.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 628 of 628 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.19.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-beartype-0.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-beartype-0.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1765 of 1784 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.19.0.bb:do_fetch)
NOTE: recipe python3-beartype-0.19.0-r0: task do_fetch: Started
NOTE: recipe python3-beartype-0.19.0-r0: task do_fetch: Succeeded
NOTE: Running task 1766 of 1784 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.19.0.bb:do_unpack)
NOTE: Running task 1767 of 1784 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.19.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-beartype-0.19.0-r0: task do_unpack: Started
NOTE: recipe python3-beartype-0.19.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-beartype-0.19.0-r0: task do_unpack: Succeeded
NOTE: Running task 1768 of 1784 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.19.0.bb:do_patch)
NOTE: Running task 1769 of 1784 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.19.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-beartype-0.19.0-r0: task do_patch: Started
NOTE: recipe python3-beartype-0.19.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-beartype-0.19.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-beartype-0.19.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-beartype-0.19.0-r0: task do_patch: Succeeded
NOTE: Running task 1771 of 1784 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.19.0.bb:do_configure)
NOTE: recipe python3-beartype-0.19.0-r0: task do_configure: Started
NOTE: recipe python3-beartype-0.19.0-r0: task do_configure: Succeeded
NOTE: Running task 1773 of 1784 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.19.0.bb:do_compile)
NOTE: recipe python3-beartype-0.19.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| 
| Traceback (most recent call last):
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-beartype/0.19.0/recipe-sysroot-native/usr/lib/python3.13/site-packages/pyproject_hooks/_impl.py", line 402, in _call_hook
|     raise BackendUnavailable(
|     ...<4 lines>...
|     )
| pyproject_hooks._impl.BackendUnavailable: Cannot import 'hatchling.build'
| 
| ERROR Backend 'hatchling.build' is not available.
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-beartype/0.19.0/temp/run.do_compile.768658:157 exit 1 from 'nativepython3 -m build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-beartype/0.19.0/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-beartype/0.19.0/beartype-0.19.0'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-beartype/0.19.0/temp/run.do_compile.768658, line 157
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-beartype/0.19.0/temp/run.do_compile.768658, line 152
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-beartype/0.19.0/temp/run.do_compile.768658, line 168
NOTE: recipe python3-beartype-0.19.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1773 tasks of which 1766 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241201070611.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241201070611.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.19.0.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-beartype/0.19.0/temp/log.do_compile.768658
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-beartype-0.19.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-beartype/0.19.0/temp/run.do_compile.768658' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-beartype/0.19.0/temp/log.do_compile.768658
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.19.0.bb:do_compile) failed with exit code '1'

--===============1517439775181797244==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-beartype-upgrade-0.18.5-0.19.0.patch"

RnJvbSBhYjdiMjBlMDk3ZGZjYzUwNjRlZTc1NGQ3OTcxMDlkZjFlZjA2MjI4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBEZWMgMjAyNCAwNzowNjoyNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtYmVhcnR5cGU6IHVwZ3JhZGUgMC4xOC41IC0+IDAuMTkuMAoKLS0tCiAuLi4ve3B5dGhv
bjMtYmVhcnR5cGVfMC4xOC41LmJiID0+IHB5dGhvbjMtYmVhcnR5cGVfMC4xOS4wLmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWJlYXJ0eXBlXzAuMTguNS5i
YiA9PiBweXRob24zLWJlYXJ0eXBlXzAuMTkuMC5iYn0gKDc4JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmVhcnR5cGVfMC4xOC41LmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJlYXJ0eXBlXzAuMTkuMC5iYgpzaW1p
bGFyaXR5IGluZGV4IDc4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtYmVhcnR5cGVfMC4xOC41LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtYmVhcnR5cGVfMC4xOS4wLmJiCmluZGV4IDk1ZDk0N2M5MGUuLmVi
ZGM3YWJhYjMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1iZWFydHlwZV8wLjE4LjUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWJlYXJ0eXBlXzAuMTkuMC5iYgpAQCAtNCw3ICs0LDcgQEAgSE9NRVBBR0UgPSAiaHR0
cHM6Ly9iZWFydHlwZS5yZWFkdGhlZG9jcy5pbyIKIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVT
X0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9ZTcxZjk0MjYxYzFiMzk4OTZjYWNhY2ZlYWY2
MDU2MGUiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyNjRkZGMyZjFkYTllYzk0ZmY2MzkxNDFm
YmUzM2QyMmUxMmE5Zjc1YWE4NjNiODNiNzA0NmZmZmYxMzgxOTI3IgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gImRlNDJkZmMxYmE1YzM3MTBmZGU2YzMwMDJlM2JkMmNhZDIzNmVkNGQyYWFiZTg3NjM0
NWFiMGI0MjM0YTY1NzMiCiAKIGluaGVyaXQgcHlwaSBweXRob25fc2V0dXB0b29sc19idWlsZF9t
ZXRhCiAKLS0gCjIuNDQuMQoK

--===============1517439775181797244==--

