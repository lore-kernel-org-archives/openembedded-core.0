Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CD72C5B54A
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:07 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.131101.1723748334631610325
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=VmwOQvgO;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=n1Aqm80h;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010191576839af-fe69fbad-739a-4281-a705-20353b810cac-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748334;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Jtr1q9Tks5HuWkWMXMTCQv38+J54BxEmN9FOGvX+fXg=;
	b=VmwOQvgOyCBMieVmLkIuFN3RfQqDaJGAi1gXNzrRKH/jHp79lMJJ9HYcH+GeYdzY
	xm7P/MUF53s68wQ5K/bulQbna7VMN0Pz6RMHwVqR3iKaT42Df0+PYEoh4Ue5I4MaXDz
	q5V6MJcm+u2xyMR4e1M7hWRo3+gEzgHYHaNnqiNU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748334;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Jtr1q9Tks5HuWkWMXMTCQv38+J54BxEmN9FOGvX+fXg=;
	b=n1Aqm80hl7mU2LvvXNrEPKNNvDnuMM+KeSQnmvyJY5t5azCb7U5RokIseJqiVX4m
	bUvuwSTr5OieWK5PnHSFdOSIdLuSVah6Y4c1k0ZNeTe1f8ylBE1MyUcC6LODZ7TgzwH
	3arKvsOrVLh6wxhxusvH3zD/HFpl7xaRLycKAFGY=
Content-Type: multipart/mixed; boundary="===============0033129514101162049=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mmc-utils: upgrading to
 123fd8b2ac3933be1319486fb1f32236a4a86a7c FAILED
Message-ID: <01010191576839af-fe69fbad-739a-4281-a705-20353b810cac-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203380

--===============0033129514101162049==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mmc-utils* to *123fd8b2ac3933be1319486fb1f32236a4a86a7c* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-mmc-utils-upgrade-to-latest-revision.patch
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
From e1ea5ec9ed36a26442fcaad86c9851eb51fb1983 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Aug 2024 10:55:47 +0000
Subject: [PATCH] mmc-utils: upgrade to latest revision

---
 meta/recipes-devtools/mmc/mmc-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index 0bfd5c1cc8..aa73ace45e 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1c5a762d16b7d"
 
 SRCBRANCH ?= "master"
-SRCREV = "f757f413dea4a143ad7c3b48b8264176f0499a82"
+SRCREV = "123fd8b2ac3933be1319486fb1f32236a4a86a7c"
 
 PV = "0.1+git"
 
-- 
2.44.0


--===============0033129514101162049==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1867 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (915 cached, 1 parsed). 1867 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-37782ae22e06d2535c73593a8fb2881ba8719726"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:37782ae22e06d2535c73593a8fb2881ba8719726"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 90 Local 79 Mirrors 0 Missed 11 Current 201 (87% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 233 of 291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_recipe_qa_setscene)
NOTE: recipe mmc-utils-0.1+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 866 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_fetch)
NOTE: recipe mmc-utils-0.1+git-r0: task do_fetch: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_fetch: Succeeded
NOTE: Running task 867 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_unpack)
NOTE: Running task 868 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe mmc-utils-0.1+git-r0: task do_unpack: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mmc-utils-0.1+git-r0: task do_unpack: Succeeded
NOTE: Running task 869 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_patch)
NOTE: Running task 870 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_collect_spdx_deps)
NOTE: recipe mmc-utils-0.1+git-r0: task do_patch: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_patch: Succeeded
NOTE: Running task 871 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 872 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_populate_lic)
NOTE: recipe mmc-utils-0.1+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mmc-utils-0.1+git-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_populate_lic: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_populate_lic unihash changed to 48090a693fe1c2a03cd05353eca6050e9be14327d36a6b889718db2414ed3a3f
NOTE: recipe mmc-utils-0.1+git-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 873 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_configure)
NOTE: recipe mmc-utils-0.1+git-r0: task do_configure: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_configure: Succeeded
NOTE: Running task 874 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_compile)
NOTE: recipe mmc-utils-0.1+git-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 16 -l 75
| sparse -Wall -Werror -Wuninitialized -Wundef -D_FILE_OFFSET_BITS=64 -D_FORTIFY_SOURCE=2 -DVERSION=\""123fd8"\" mmc.c
| sparse -Wall -Werror -Wuninitialized -Wundef -D_FILE_OFFSET_BITS=64 -D_FORTIFY_SOURCE=2 -DVERSION=\""123fd8"\" mmc_cmds.c
| sparse -Wall -Werror -Wuninitialized -Wundef -D_FILE_OFFSET_BITS=64 -D_FORTIFY_SOURCE=2 -DVERSION=\""123fd8"\" lsmmc.c
| sparse -Wall -Werror -Wuninitialized -Wundef -D_FILE_OFFSET_BITS=64 -D_FORTIFY_SOURCE=2 -DVERSION=\""123fd8"\" 3rdparty/hmac_sha/hmac_sha2.c
| sparse -Wall -Werror -Wuninitialized -Wundef -D_FILE_OFFSET_BITS=64 -D_FORTIFY_SOURCE=2 -DVERSION=\""123fd8"\" 3rdparty/hmac_sha/sha2.c
| /bin/sh: sparse: command not found
| make: *** [Makefile:38: mmc.o] Error 127
| make: *** Waiting for unfinished jobs....
| /bin/sh: sparse: command not found
| make: *** [Makefile:38: mmc_cmds.o] Error 127
| /bin/sh: sparse: command not found
| make: *** [Makefile:38: lsmmc.o] Error 127
| /bin/sh: sparse: command not found
| make: *** [Makefile:38: 3rdparty/hmac_sha/hmac_sha2.o] Error 127
| /bin/sh: sparse: command not found
| make: *** [Makefile:38: 3rdparty/hmac_sha/sha2.o] Error 127
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/mmc-utils/0.1+git/temp/run.do_compile.4018538:179 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/mmc-utils/0.1+git/temp/run.do_compile.4018538, line 179
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/mmc-utils/0.1+git/temp/run.do_compile.4018538, line 164
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/mmc-utils/0.1+git/temp/run.do_compile.4018538, line 169
| 	#4: base_do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/mmc-utils/0.1+git/temp/run.do_compile.4018538, line 147
| 	#5: do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/mmc-utils/0.1+git/temp/run.do_compile.4018538, line 141
| 	#6: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/mmc-utils/0.1+git/temp/run.do_compile.4018538, line 189
NOTE: recipe mmc-utils-0.1+git-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 874 tasks of which 865 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240815105533.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240815105533.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: mmc-utils-0.1+git-r0 do_compile: oe_runmake failed
ERROR: mmc-utils-0.1+git-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/mmc-utils/0.1+git/temp/run.do_compile.4018538', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/mmc-utils/0.1+git/temp/log.do_compile.4018538
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_compile) failed with exit code '1'

--===============0033129514101162049==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mmc-utils-upgrade-to-latest-revision.patch"

RnJvbSBlMWVhNWVjOWVkMzZhMjY0NDJmY2FhZDg2Yzk4NTFlYjUxZmIxOTgzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgQXVnIDIwMjQgMTA6NTU6NDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
bWMtdXRpbHM6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9tbWMvbW1jLXV0aWxzX2dpdC5iYiB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9tbWMvbW1jLXV0aWxzX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tbWMvbW1j
LXV0aWxzX2dpdC5iYgppbmRleCAwYmZkNWMxY2M4Li5hYTczYWNlNDVlIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvbW1jL21tYy11dGlsc19naXQuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL21tYy9tbWMtdXRpbHNfZ2l0LmJiCkBAIC01LDcgKzUsNyBAQCBMSUNFTlNF
ID0gIkdQTC0yLjAtb25seSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL21tYy5jO2JlZ2lu
bGluZT0xO2VuZGxpbmU9MjA7bWQ1PWZhZTMyNzkyZTIwZjRkMjdhZGUxYzVhNzYyZDE2YjdkIgog
CiBTUkNCUkFOQ0ggPz0gIm1hc3RlciIKLVNSQ1JFViA9ICJmNzU3ZjQxM2RlYTRhMTQzYWQ3YzNi
NDhiODI2NDE3NmYwNDk5YTgyIgorU1JDUkVWID0gIjEyM2ZkOGIyYWMzOTMzYmUxMzE5NDg2ZmIx
ZjMyMjM2YTRhODZhN2MiCiAKIFBWID0gIjAuMStnaXQiCiAKLS0gCjIuNDQuMAoK

--===============0033129514101162049==--

