Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC8B6D60062
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:17:10 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.4799.1731964615480050437
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:17:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=FmZS6ZZ4;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=w2FQ8b0R;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101934122d8a5-1a97d8c6-c3c0-4891-a9ba-ac024eb057ef-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964623;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5OiPapG+SUBIU/gZvW4ADiPXk/9OB4du6zm3W7EHILo=;
	b=FmZS6ZZ48MhMoNAWZQxLHv+SUBdKtqg1qY1xM9BtjWUKntECT1/0Dr8bIDu9eeLI
	BTAVC5SZnlH2NHD63+DJ+TrZIyVY5vXkO1Oikomn+6dvEGnTc/a4Hwy3xZxcrxgQ1lp
	bn4GHPmVdFIFQnsTN/G9CxRa5ZXJWK8RS7S18RM0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964623;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5OiPapG+SUBIU/gZvW4ADiPXk/9OB4du6zm3W7EHILo=;
	b=w2FQ8b0Rbjlb++IdfWcF5E8rEafGcYXEIFik/3yUP1dSaRKExppfNeogixAXGpSj
	YpY41uwa7RyRl+9bDS+NtjF9TvhWNtNwc1kObQ67CLieLI/MG6r21oF8gUEMH1Qjvnj
	NabW/IEg5uIUT4/z50LlTm6snWQYxlMRcx8HVKO8=
Content-Type: multipart/mixed; boundary="===============5674995945932058470=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Marta Rybczynska <mrybczynska@syslinbit.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-beartype: upgrading to 0.19.0 FAILED
Message-ID: <010101934122d8a5-1a97d8c6-c3c0-4891-a9ba-ac024eb057ef-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:17:03 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207272

--===============5674995945932058470==
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
From 2f8003366617441628914181e600b4efa277e2c4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 16 Nov 2024 19:40:07 +0000
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


--===============5674995945932058470==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-beartype-upgrade-0.18.5-0.19.0.patch"

RnJvbSAyZjgwMDMzNjY2MTc0NDE2Mjg5MTQxODFlNjAwYjRlZmEyNzdlMmM0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTYgTm92IDIwMjQgMTk6NDA6MDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWJlYXJ0eXBlOiB1cGdyYWRlIDAuMTguNSAtPiAwLjE5LjAKCi0tLQogLi4uL3tweXRo
b24zLWJlYXJ0eXBlXzAuMTguNS5iYiA9PiBweXRob24zLWJlYXJ0eXBlXzAuMTkuMC5iYn0gIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1iZWFydHlwZV8wLjE4LjUu
YmIgPT4gcHl0aG9uMy1iZWFydHlwZV8wLjE5LjAuYmJ9ICg3OCUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJlYXJ0eXBlXzAuMTguNS5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iZWFydHlwZV8wLjE5LjAuYmIKc2lt
aWxhcml0eSBpbmRleCA3OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWJlYXJ0eXBlXzAuMTguNS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWJlYXJ0eXBlXzAuMTkuMC5iYgppbmRleCA5NWQ5NDdjOTBlLi5l
YmRjN2FiYWIzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtYmVhcnR5cGVfMC4xOC41LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1iZWFydHlwZV8wLjE5LjAuYmIKQEAgLTQsNyArNCw3IEBAIEhPTUVQQUdFID0gImh0
dHBzOi8vYmVhcnR5cGUucmVhZHRoZWRvY3MuaW8iCiBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWU3MWY5NDI2MWMxYjM5ODk2Y2FjYWNmZWFm
NjA1NjBlIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMjY0ZGRjMmYxZGE5ZWM5NGZmNjM5MTQx
ZmJlMzNkMjJlMTJhOWY3NWFhODYzYjgzYjcwNDZmZmZmMTM4MTkyNyIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICJkZTQyZGZjMWJhNWMzNzEwZmRlNmMzMDAyZTNiZDJjYWQyMzZlZDRkMmFhYmU4NzYz
NDVhYjBiNDIzNGE2NTczIgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRf
bWV0YQogCi0tIAoyLjQ0LjEKCg==

--===============5674995945932058470==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1882 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (920 cached, 1 parsed). 1880 targets, 41 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:0ab5faae3a1ec43f07dd6c67e8a205e71e12e135"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 307 Local 295 Mirrors 0 Missed 12 Current 329 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1405 of 1806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.19.0.bb:do_recipe_qa)
NOTE: recipe python3-beartype-0.19.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-beartype-0.19.0-r0: task do_recipe_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.19.0.bb:do_recipe_qa unihash changed to b2ab8bedcce8175b1512a3bfc6026f61a289121549c8b846d075c52d8e14bcb8
NOTE: Setscene tasks completed
NOTE: Running task 1787 of 1806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.19.0.bb:do_fetch)
NOTE: recipe python3-beartype-0.19.0-r0: task do_fetch: Started
NOTE: recipe python3-beartype-0.19.0-r0: task do_fetch: Succeeded
NOTE: Running task 1788 of 1806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.19.0.bb:do_unpack)
NOTE: Running task 1789 of 1806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.19.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-beartype-0.19.0-r0: task do_unpack: Started
NOTE: recipe python3-beartype-0.19.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-beartype-0.19.0-r0: task do_unpack: Succeeded
NOTE: Running task 1790 of 1806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.19.0.bb:do_patch)
NOTE: Running task 1791 of 1806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.19.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-beartype-0.19.0-r0: task do_patch: Started
NOTE: recipe python3-beartype-0.19.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-beartype-0.19.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-beartype-0.19.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-beartype-0.19.0-r0: task do_patch: Succeeded
NOTE: Running task 1792 of 1806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.19.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1793 of 1806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.19.0.bb:do_populate_lic)
NOTE: recipe python3-beartype-0.19.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-beartype-0.19.0-r0: task do_populate_lic: Started
NOTE: recipe python3-beartype-0.19.0-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.19.0.bb:do_populate_lic unihash changed to ccd0c5abcaee1ea89328307f0181eeabd64d51fdf9eecfa3d3f3fd041d053657
NOTE: recipe python3-beartype-0.19.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.19.0.bb:do_deploy_source_date_epoch unihash changed to da315f1d648952000242f1e056d80fb049263bba7019cf92c8270f3cadd8e641
NOTE: Setscene tasks completed
NOTE: Running task 1794 of 1806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.19.0.bb:do_configure)
NOTE: recipe python3-beartype-0.19.0-r0: task do_configure: Started
NOTE: recipe python3-beartype-0.19.0-r0: task do_configure: Succeeded
NOTE: Running task 1795 of 1806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.19.0.bb:do_compile)
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
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-beartype/0.19.0/temp/run.do_compile.2186025:157 exit 1 from 'nativepython3 -m build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-beartype/0.19.0/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-beartype/0.19.0/beartype-0.19.0'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-beartype/0.19.0/temp/run.do_compile.2186025, line 157
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-beartype/0.19.0/temp/run.do_compile.2186025, line 152
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-beartype/0.19.0/temp/run.do_compile.2186025, line 168
NOTE: recipe python3-beartype-0.19.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1795 tasks of which 1785 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 10 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241116193907.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241116193907.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.19.0.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-beartype/0.19.0/temp/log.do_compile.2186025
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-beartype-0.19.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-beartype/0.19.0/temp/run.do_compile.2186025' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-beartype/0.19.0/temp/log.do_compile.2186025
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.19.0.bb:do_compile) failed with exit code '1'

--===============5674995945932058470==--

