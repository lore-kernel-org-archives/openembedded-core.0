Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD38AC27C79
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 16:28:52 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.17589.1690907328808840636
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 09:28:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=VCnwtrrV;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=C+8Ms7y9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010189b1ee4a50-cacb43ae-8009-40d2-9810-469a2215552a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1690907331;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ClTtv3p9a0Me7j23JQ+mtInxd08Qo/OnVrjGqaK8kW8=;
	b=VCnwtrrVbU5cNqllYwlXUv1QqIfJpRpsj1zvYcvk/Rpf28iKRC2GNaFI0PAHKyma
	myj1goD45nauLKPSeOk4FuSRm+zj/wlZNg1zVUciS3SAo29a2bKmX0tiNQu976/kwjB
	J0kXMjUJcTjkyIVUfp1nTEDsCKX6x0ewrNfvSKv4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1690907331;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ClTtv3p9a0Me7j23JQ+mtInxd08Qo/OnVrjGqaK8kW8=;
	b=C+8Ms7y9uGKoXDd7uBrNp3LemWrkqaa/jEvpJBiu6cP7PUDlTzwhNtEgHbAFppTv
	s+vhUIK6Eg328waNc/ThBSJ7eZMEbKl95LVEG982cnQ4rdpKTLl10UrRkyP+zFSFeI8
	OzTkh2uJMJc0PyhyOpQEpAFQ8f7v0+c17oBv7oq8=
Content-Type: multipart/mixed; boundary="===============9000355072804969749=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] stress-ng: upgrading to 0.16.02 FAILED
Message-ID: <01010189b1ee4a50-cacb43ae-8009-40d2-9810-469a2215552a-000000@us-west-2.amazonses.com>
Date: Tue, 1 Aug 2023 16:28:51 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 16:28:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185318

--===============9000355072804969749==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *stress-ng* to *0.16.02* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-stress-ng-upgrade-0.15.08-0.16.02.patch
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
From c496155c55a9a356238f1d1b6cb20efa25e4efea Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Aug 2023 12:55:54 +0000
Subject: [PATCH] stress-ng: upgrade 0.15.08 -> 0.16.02

---
 .../stress-ng/{stress-ng_0.15.08.bb => stress-ng_0.16.02.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.15.08.bb => stress-ng_0.16.02.bb} (94%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.15.08.bb b/meta/recipes-extended/stress-ng/stress-ng_0.16.02.bb
similarity index 94%
rename from meta/recipes-extended/stress-ng/stress-ng_0.15.08.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.16.02.bb
index 9952c4ef8a..265e2eee64 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.15.08.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.16.02.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master \
            "
-SRCREV = "4fc205238518cdaf80cf18e8bd411708f7ba3856"
+SRCREV = "945c7f1e80280a0754302ee3cc9d14f3cbb6596c"
 S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native libbsd"
-- 
2.39.2


--===============9000355072804969749==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1805 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1805 targets, 37 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:cdd58910ff549d39538f5351aa02259810906a20"
workspace            = "master:4ddeb8ee8baf964dddf9cf9085d78aa0bf7b28eb"

Initialising tasks...done.
Sstate summary: Wanted 47 Local 37 Mirrors 0 Missed 10 Current 271 (78% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 841 of 947 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.16.02.bb:do_recipe_qa)
NOTE: recipe stress-ng-0.16.02-r0: task do_recipe_qa: Started
NOTE: recipe stress-ng-0.16.02-r0: task do_recipe_qa: Succeeded
NOTE: Running task 930 of 947 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.16.02.bb:do_fetch)
NOTE: recipe stress-ng-0.16.02-r0: task do_fetch: Started
NOTE: recipe stress-ng-0.16.02-r0: task do_fetch: Succeeded
NOTE: Running task 931 of 947 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.16.02.bb:do_unpack)
NOTE: Running task 932 of 947 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.16.02.bb:do_prepare_recipe_sysroot)
NOTE: recipe stress-ng-0.16.02-r0: task do_unpack: Started
NOTE: recipe stress-ng-0.16.02-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe stress-ng-0.16.02-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe stress-ng-0.16.02-r0: task do_unpack: Succeeded
NOTE: Running task 933 of 947 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.16.02.bb:do_patch)
NOTE: Running task 934 of 947 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.16.02.bb:do_collect_spdx_deps)
NOTE: recipe stress-ng-0.16.02-r0: task do_patch: Started
NOTE: recipe stress-ng-0.16.02-r0: task do_collect_spdx_deps: Started
NOTE: recipe stress-ng-0.16.02-r0: task do_patch: Succeeded
NOTE: Running task 935 of 947 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.16.02.bb:do_deploy_source_date_epoch)
NOTE: Running task 936 of 947 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.16.02.bb:do_populate_lic)
NOTE: recipe stress-ng-0.16.02-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe stress-ng-0.16.02-r0: task do_populate_lic: Started
NOTE: recipe stress-ng-0.16.02-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe stress-ng-0.16.02-r0: task do_populate_lic: Succeeded
NOTE: recipe stress-ng-0.16.02-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 937 of 947 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.16.02.bb:do_configure)
NOTE: recipe stress-ng-0.16.02-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libbsd/libbsd_0.11.7.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do
 _populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'gcc-cross-i686', 'gcc-runtime', 'quilt-native', 'bash-completion', 'libbsd', 'coreutils-native', 'patch-native', 'pseudo-native', 'attr-native', 'libtool-native', 'xz-native', 'zlib-native', 'binutils-cross-i686', 'texinfo-dummy-native', 'flex-native', 'gmp-native', 'mpfr-native', 'linux-libc-headers', 'libmpc-native', 'gnu-config-native', 'zstd-native', 'gettext-minimal-native', 'libmd', 'libgcc', 'm4-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: make VERBOSE=1 makeconfig
| Generating config..
| make CC="i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/stress-ng/0.16.02-r0/recipe-sysroot" STATIC= -f Makefile.config
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/stress-ng/0.16.02-r0/git'
| checking compiler ...
| /bin/sh: ./test/test-compiler: No such file or directory
| /bin/sh: configs/$(./test/test-compiler): Is a directory
| make[1]: *** [Makefile.config:314: compiler] Error 1
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/stress-ng/0.16.02-r0/git'
| make: *** [Makefile:577: config.h] Error 2
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/stress-ng/0.16.02-r0/temp/run.do_configure.16329:169 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/stress-ng/0.16.02-r0/temp/run.do_configure.16329, line 169
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/stress-ng/0.16.02-r0/temp/run.do_configure.16329, line 153
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/stress-ng/0.16.02-r0/temp/run.do_configure.16329, line 148
| 	#4: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/stress-ng/0.16.02-r0/temp/run.do_configure.16329, line 143
| 	#5: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/stress-ng/0.16.02-r0/temp/run.do_configure.16329, line 182
NOTE: recipe stress-ng-0.16.02-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 937 tasks of which 928 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.16.02.bb:do_configure
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: stress-ng-0.16.02-r0 do_configure: oe_runmake failed
ERROR: stress-ng-0.16.02-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/stress-ng/0.16.02-r0/temp/run.do_configure.16329', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/stress-ng/0.16.02-r0/temp/log.do_configure.16329
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.16.02.bb:do_configure) failed with exit code '1'

--===============9000355072804969749==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-stress-ng-upgrade-0.15.08-0.16.02.patch"

RnJvbSBjNDk2MTU1YzU1YTlhMzU2MjM4ZjFkMWI2Y2IyMGVmYTI1ZTRlZmVhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBdWcgMjAyMyAxMjo1NTo1NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHN0
cmVzcy1uZzogdXBncmFkZSAwLjE1LjA4IC0+IDAuMTYuMDIKCi0tLQogLi4uL3N0cmVzcy1uZy97
c3RyZXNzLW5nXzAuMTUuMDguYmIgPT4gc3RyZXNzLW5nXzAuMTYuMDIuYmJ9ICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL3N0cmVzcy1uZy97c3RyZXNzLW5nXzAuMTUuMDguYmIgPT4gc3Ry
ZXNzLW5nXzAuMTYuMDIuYmJ9ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL3N0cmVzcy1uZy9zdHJlc3MtbmdfMC4xNS4wOC5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRl
ZC9zdHJlc3Mtbmcvc3RyZXNzLW5nXzAuMTYuMDIuYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N0cmVzcy1uZy9zdHJlc3MtbmdfMC4xNS4w
OC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N0cmVzcy1uZy9zdHJlc3Mtbmdf
MC4xNi4wMi5iYgppbmRleCA5OTUyYzRlZjhhLi4yNjVlMmVlZTY0IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvc3RyZXNzLW5nL3N0cmVzcy1uZ18wLjE1LjA4LmJiCisrKyBiL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9zdHJlc3Mtbmcvc3RyZXNzLW5nXzAuMTYuMDIuYmIKQEAgLTcs
NyArNyw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWIyMzRlZTRk
NjlmNWZjZTQ0ODZhODBmZGFmNGE0MjYzIgogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20v
Q29saW5JYW5LaW5nL3N0cmVzcy1uZy5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hc3RlciBc
CiAgICAgICAgICAgICIKLVNSQ1JFViA9ICI0ZmMyMDUyMzg1MThjZGFmODBjZjE4ZThiZDQxMTcw
OGY3YmEzODU2IgorU1JDUkVWID0gIjk0NWM3ZjFlODAyODBhMDc1NDMwMmVlM2NjOWQxNGYzY2Ji
NjU5NmMiCiBTID0gIiR7V09SS0RJUn0vZ2l0IgogCiBERVBFTkRTID0gImNvcmV1dGlscy1uYXRp
dmUgbGliYnNkIgotLSAKMi4zOS4yCgo=

--===============9000355072804969749==--

