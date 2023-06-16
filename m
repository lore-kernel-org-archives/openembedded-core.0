Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29953C27C4F
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:29 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.824.1686887483280370536
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=dvNkalF7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010188c2544458-8d2b70a2-2618-49ee-8553-6ca57eb388db-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3JiPYXVy1b9CD23WbWcgwPYVZMFK3ZreoeRgrdrFdXI=;
	b=dvNkalF71PZ0PAU1FEWP1p00NOyA0dGE69Fu+4kysNJwOqWkLKcnU1IgtoHUYVQE
	fSEd8mnkJqRttfeHGwt4YREnlimhD0z7oPFeKflphdUrPBrlVRnOEARy51Rs2990v+k
	qqNGjIujhqEE8EidCZfDzyXqI7ts0IUH8A3Pcjz8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3JiPYXVy1b9CD23WbWcgwPYVZMFK3ZreoeRgrdrFdXI=;
	b=OPI8v99O9sYezYmGt+qVkagKMMP22Jn56TKh2rslhaog29GNHsSI5H4tkjkYU7O3
	0Cms2JlVHzdbX7XgUU1LwmEockrfwBLRjOQfFBO6jn5t5QsAVdXymVrdHvWYVVOmLx9
	NMLk3kPgUF9x8ca1KoTA3o0AoIjlhLtKiNZxIR78=
Content-Type: multipart/mixed; boundary="===============0283461432331984417=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cryptography-vectors: upgrading to 41.0.1 FAILED
Message-ID: <01010188c2544458-8d2b70a2-2618-49ee-8553-6ca57eb388db-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182920

--===============0283461432331984417==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-cryptography-vectors* to *41.0.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-cryptography-vectors-upgrade-39.0.2-41.0.1.patch
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
From e2ada126ed5e7e7919d6bc5afeec071bb4e82603 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 12:39:51 +0000
Subject: [PATCH] python3-cryptography-vectors: upgrade 39.0.2 -> 41.0.1

---
 ...vectors_39.0.2.bb => python3-cryptography-vectors_41.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cryptography-vectors_39.0.2.bb => python3-cryptography-vectors_41.0.1.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb b/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.1.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb
rename to meta/recipes-devtools/python/python3-cryptography-vectors_41.0.1.bb
index 795e27f75b..a4d4e2f3bc 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 
-SRC_URI[sha256sum] = "a68f106f7a4322cf1e7ed51e3fc6d5c1e0b11d337ed918ec879e8afe0c2a5220"
+SRC_URI[sha256sum] = "23b08c39777ec7b2774a11f945d1746301b1e88ecff2e5326d7f50ea0f42d580"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
-- 
2.39.2


--===============0283461432331984417==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1801 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1801 targets, 36 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a7e084693fce9618f1224bf66919531f5c8a12b7"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 121 Local 112 Mirrors 0 Missed 9 Current 333 (92% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1301 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.1.bb:do_fetch)
NOTE: recipe python3-cryptography-vectors-41.0.1-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-41.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1574 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.1.bb:do_unpack)
NOTE: Running task 1575 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-vectors-41.0.1-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-vectors-41.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-41.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cryptography-vectors-41.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1576 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.1.bb:do_patch)
NOTE: Running task 1577 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-cryptography-vectors-41.0.1-r0: task do_patch: Started
NOTE: recipe python3-cryptography-vectors-41.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-cryptography-vectors-41.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1578 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1579 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.1.bb:do_populate_lic)
NOTE: recipe python3-cryptography-vectors-41.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-41.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-cryptography-vectors-41.0.1-r0: task do_populate_lic: Started
NOTE: recipe python3-cryptography-vectors-41.0.1-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-cryptography-vectors-41.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1580 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.1.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-41.0.1-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-41.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1581 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.1.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-41.0.1-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-cryptography-vectors/41.0.1-r0/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-cryptography-vectors/41.0.1-r0/cryptography_vectors-41.0.1/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-cryptography-vectors/41.0.1-r0/temp/run.do_compile.3213257:180 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-cryptography-vectors/41.0.1-r0/temp/run.do_compile.3213257, line 180
| 	#2: setuptools3_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-cryptography-vectors/41.0.1-r0/temp/run.do_compile.3213257, line 170
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-cryptography-vectors/41.0.1-r0/temp/run.do_compile.3213257, line 152
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-cryptography-vectors/41.0.1-r0/temp/run.do_compile.3213257, line 184
NOTE: recipe python3-cryptography-vectors-41.0.1-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1581 tasks of which 1572 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.1.bb:do_compile
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-cryptography-vectors-41.0.1-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-cryptography-vectors-41.0.1-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-cryptography-vectors/41.0.1-r0/temp/run.do_compile.3213257', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-cryptography-vectors/41.0.1-r0/temp/log.do_compile.3213257
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.1.bb:do_compile) failed with exit code '1'

--===============0283461432331984417==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cryptography-vectors-upgrade-39.0.2-41.0.1.patch"

RnJvbSBlMmFkYTEyNmVkNWU3ZTc5MTlkNmJjNWFmZWVjMDcxYmI0ZTgyNjAzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMTI6Mzk6NTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzOiB1cGdyYWRlIDM5LjAuMiAtPiA0MS4wLjEKCi0t
LQogLi4udmVjdG9yc18zOS4wLjIuYmIgPT4gcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9yc180
MS4wLjEuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1jcnlw
dG9ncmFwaHktdmVjdG9yc18zOS4wLjIuYmIgPT4gcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9y
c180MS4wLjEuYmJ9ICg5MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzXzM5LjAuMi5iYiBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9yc180MS4wLjEuYmIK
c2ltaWxhcml0eSBpbmRleCA5MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzXzM5LjAuMi5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzXzQx
LjAuMS5iYgppbmRleCA3OTVlMjdmNzViLi5hNGQ0ZTJmM2JjIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnNfMzkuMC4y
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFw
aHktdmVjdG9yc180MS4wLjEuYmIKQEAgLTksNyArOSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0xJQ0VOU0U7bWQ1PThjMzYxN2RiNGZiNmZhZTAxZjFkMjUzYWI5MTUxMWU0IFwKICMg
Tk9URTogTWFrZSBzdXJlIHRvIGtlZXAgdGhpcyByZWNpcGUgYXQgdGhlIHNhbWUgdmVyc2lvbiBh
cyBweXRob24zLWNyeXB0b2dyYXBoeQogIyAgICAgICBVcGdyYWRlIGJvdGggcmVjaXBlcyBhdCB0
aGUgc2FtZSB0aW1lCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJhNjhmMTA2ZjdhNDMyMmNmMWU3
ZWQ1MWUzZmM2ZDVjMWUwYjExZDMzN2VkOTE4ZWM4NzllOGFmZTBjMmE1MjIwIgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjIzYjA4YzM5Nzc3ZWM3YjI3NzRhMTFmOTQ1ZDE3NDYzMDFiMWU4OGVjZmYy
ZTUzMjZkN2Y1MGVhMGY0MmQ1ODAiCiAKIFBZUElfUEFDS0FHRSA9ICJjcnlwdG9ncmFwaHlfdmVj
dG9ycyIKIAotLSAKMi4zOS4yCgo=

--===============0283461432331984417==--

