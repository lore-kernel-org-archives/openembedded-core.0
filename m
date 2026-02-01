Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35C54D172AE
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 13:12:56 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29192.1769951570363277194
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 05:12:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=p5CDp2o1;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=PqED5VAX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019c1955b126-1d3acb81-996b-4aa1-b0ee-2a7a4fa6587e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769951572;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YukV7gZSfY2KAcgzJJ0mR3TWp+lZQI4JV4ZRBN9KUdU=;
	b=p5CDp2o1nfylZsrIPczi+9eHtwkDBAMFwuqkfxmTToWn/oTGgTx/8FCkmEelK0yh
	O37o5BAdTy7WqsFmd38G+ASTs39o9pkxYBvmLc+Fv7+EPJh9Ex4XIPgZlzcCjVKhB9O
	4+ySVvdQPdFTBcMGxBwg+PRm0GalrVK1SvuXLvKo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769951572;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YukV7gZSfY2KAcgzJJ0mR3TWp+lZQI4JV4ZRBN9KUdU=;
	b=PqED5VAXFOGzqLIXanetqtPfRiORujcMAhGDTfVVQtCTQJVgXl8Azlz5DHtqpvrH
	UQyEKtzJC0PTOHLMyywR9S6DCpf2zFkNlz2zHQ3C4FHZxN9+rdgevDEXI0hvixRvknt
	RKCP7npu8SPE5bPE8iLqd6hu/7ZyFkGQUpY+LRC8=
Content-Type: multipart/mixed; boundary="===============1508351507299308059=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-wcwidth: upgrading to 0.5.3 FAILED
Message-ID: <0101019c1955b126-1d3acb81-996b-4aa1-b0ee-2a7a4fa6587e-000000@us-west-2.amazonses.com>
Date: Sun, 1 Feb 2026 13:12:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 13:12:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230291

--===============1508351507299308059==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-wcwidth* to *0.5.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-wcwidth-upgrade-0.2.14-0.5.3.patch
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
From d898ae0175831a45a5d7c3932255cfa93879c304 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Feb 2026 09:39:23 +0000
Subject: [PATCH] python3-wcwidth: upgrade 0.2.14 -> 0.5.3

---
 .../{python3-wcwidth_0.2.14.bb => python3-wcwidth_0.5.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wcwidth_0.2.14.bb => python3-wcwidth_0.5.3.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-wcwidth_0.2.14.bb b/meta/recipes-devtools/python/python3-wcwidth_0.5.3.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-wcwidth_0.2.14.bb
rename to meta/recipes-devtools/python/python3-wcwidth_0.5.3.bb
index da2dc60263..77cf2362d0 100644
--- a/meta/recipes-devtools/python/python3-wcwidth_0.2.14.bb
+++ b/meta/recipes-devtools/python/python3-wcwidth_0.5.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/jquast/wcwidth"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb"
 
-SRC_URI[sha256sum] = "4d478375d31bc5395a3c55c40ccdf3354688364cd61c4f6adacaa9215d0b3605"
+SRC_URI[sha256sum] = "53123b7af053c74e9fe2e92ac810301f6139e64379031f7124574212fb3b4091"
 
 inherit pypi setuptools3 ptest-python-pytest
 
-- 
2.47.1


--===============1508351507299308059==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1957 targets, 47 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-49dac79a3ac372e4b827c31e9a28f62a6dc7fe13"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:49dac79a3ac372e4b827c31e9a28f62a6dc7fe13"
meta-yocto-bsp       
meta-poky            = "master:de4abc0a175af12eacc761a2e1e60ca7fdfeaa1b"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 172 Local 159 Mirrors 0 Missed 13 Current 560 (92% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1376 of 2069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wcwidth_0.5.3.bb:do_recipe_qa)
NOTE: recipe python3-wcwidth-0.5.3-r0: task do_recipe_qa: Started
NOTE: recipe python3-wcwidth-0.5.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2046 of 2069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wcwidth_0.5.3.bb:do_fetch)
NOTE: recipe python3-wcwidth-0.5.3-r0: task do_fetch: Started
NOTE: recipe python3-wcwidth-0.5.3-r0: task do_fetch: Succeeded
NOTE: Running task 2047 of 2069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wcwidth_0.5.3.bb:do_unpack)
NOTE: Running task 2048 of 2069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wcwidth_0.5.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-wcwidth-0.5.3-r0: task do_unpack: Started
NOTE: recipe python3-wcwidth-0.5.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-wcwidth-0.5.3-r0: task do_unpack: Succeeded
NOTE: Running task 2049 of 2069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wcwidth_0.5.3.bb:do_patch)
NOTE: Running task 2050 of 2069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wcwidth_0.5.3.bb:do_collect_spdx_deps)
NOTE: recipe python3-wcwidth-0.5.3-r0: task do_patch: Started
NOTE: recipe python3-wcwidth-0.5.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-wcwidth-0.5.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-wcwidth-0.5.3-r0: task do_patch: Succeeded
NOTE: recipe python3-wcwidth-0.5.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2051 of 2069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wcwidth_0.5.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2052 of 2069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wcwidth_0.5.3.bb:do_check_backend)
NOTE: Running task 2053 of 2069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wcwidth_0.5.3.bb:do_populate_lic)
NOTE: recipe python3-wcwidth-0.5.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-wcwidth-0.5.3-r0: task do_check_backend: Started
WARNING: python3-wcwidth-0.5.3-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with hatchling.build, use the correct class [pep517-backend]
NOTE: recipe python3-wcwidth-0.5.3-r0: task do_populate_lic: Started
NOTE: recipe python3-wcwidth-0.5.3-r0: task do_check_backend: Succeeded
NOTE: recipe python3-wcwidth-0.5.3-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-wcwidth-0.5.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2054 of 2069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wcwidth_0.5.3.bb:do_configure)
NOTE: recipe python3-wcwidth-0.5.3-r0: task do_configure: Started
NOTE: recipe python3-wcwidth-0.5.3-r0: task do_configure: Succeeded
NOTE: Running task 2055 of 2069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wcwidth_0.5.3.bb:do_configure_ptest_base)
NOTE: recipe python3-wcwidth-0.5.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-wcwidth-0.5.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2056 of 2069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wcwidth_0.5.3.bb:do_compile)
NOTE: recipe python3-wcwidth-0.5.3-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| nativepython3: can't open file '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-wcwidth/0.5.3/sources/wcwidth-0.5.3/setup.py': [Errno 2] No such file or directory
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-wcwidth/0.5.3/temp/run.do_compile.1598978:171 exit 2 from 'nativepython3 setup.py --verbose build -j 16 bdist_wheel --dist-dir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-wcwidth/0.5.3/dist'
| WARNING: Backtrace (BB generated script):
| 	#1: setuptools3_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-wcwidth/0.5.3/temp/run.do_compile.1598978, line 171
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-wcwidth/0.5.3/temp/run.do_compile.1598978, line 153
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-wcwidth/0.5.3/temp/run.do_compile.1598978, line 178
NOTE: recipe python3-wcwidth-0.5.3-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2056 tasks of which 2044 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260201093909.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260201093909.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wcwidth_0.5.3.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-wcwidth/0.5.3/temp/log.do_compile.1598978
Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-wcwidth-0.5.3-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-wcwidth/0.5.3/temp/run.do_compile.1598978' failed with exit code 2
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-wcwidth/0.5.3/temp/log.do_compile.1598978
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wcwidth_0.5.3.bb:do_compile) failed with exit code '1'

--===============1508351507299308059==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-wcwidth-upgrade-0.2.14-0.5.3.patch"

RnJvbSBkODk4YWUwMTc1ODMxYTQ1YTVkN2MzOTMyMjU1Y2ZhOTM4NzljMzA0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBGZWIgMjAyNiAwOTozOToyMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtd2N3aWR0aDogdXBncmFkZSAwLjIuMTQgLT4gMC41LjMKCi0tLQogLi4uL3tweXRob24z
LXdjd2lkdGhfMC4yLjE0LmJiID0+IHB5dGhvbjMtd2N3aWR0aF8wLjUuMy5iYn0gICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy13Y3dpZHRoXzAuMi4xNC5iYiA9
PiBweXRob24zLXdjd2lkdGhfMC41LjMuYmJ9ICg4NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdjd2lkdGhfMC4yLjE0LmJiIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdjd2lkdGhfMC41LjMuYmIKc2ltaWxhcml0eSBp
bmRleCA4NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXdjd2lkdGhfMC4yLjE0LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtd2N3aWR0aF8wLjUuMy5iYgppbmRleCBkYTJkYzYwMjYzLi43N2NmMjM2MmQwIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2N3aWR0aF8w
LjIuMTQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdjd2lk
dGhfMC41LjMuYmIKQEAgLTQsNyArNCw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNv
bS9qcXVhc3Qvd2N3aWR0aCIKIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vTElDRU5TRTttZDU9YjE1OTc5YzM5YTI1NDM4OTJmY2E4Y2Q4NmI0YjUyY2IiCiAKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICI0ZDQ3ODM3NWQzMWJjNTM5NWEzYzU1YzQwY2NkZjMzNTQ2ODgz
NjRjZDYxYzRmNmFkYWNhYTkyMTVkMGIzNjA1IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjUzMTIz
YjdhZjA1M2M3NGU5ZmUyZTkyYWM4MTAzMDFmNjEzOWU2NDM3OTAzMWY3MTI0NTc0MjEyZmIzYjQw
OTEiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMyBwdGVzdC1weXRob24tcHl0ZXN0CiAKLS0g
CjIuNDcuMQoK

--===============1508351507299308059==--

