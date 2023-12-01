Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CFEFC10F05
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 13:14:57 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.22314.1701436490888601934
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 05:14:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Hk2jLbEL;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=jekEmMF9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018c258481bd-f84082e7-a4d7-45b7-9b75-982dadc7739e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1701436490;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=BZHxMpumkLzsAMymxUehiZ+4uUvh6o30VzQJcsmoCH0=;
	b=Hk2jLbELEmyvyZb4+Tz5N4AEi4s+WEFNioU8YjOhIaoCMZpr1MJqEFH6awzOlk0q
	lG7xmIFbSpt/pT2onL9cYlNHfwtoYWXOd9OnUzLg6nJtPLRaNCcLoeLSHr0RJxSqLZ4
	q9ysdlll7LgaFmNhHCnV7XgZjzk0hkauBMNCnbnc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1701436490;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=BZHxMpumkLzsAMymxUehiZ+4uUvh6o30VzQJcsmoCH0=;
	b=jekEmMF9u31kB08Jx54JDdWOcvVn0MfhxZbVgJjpmqNopS+DLwTinoKFJ3OW6Hdl
	J+HTYuchsSs/6svrYRAadymqbwL98Pc6ND8uGAXtPrcZfve8CRQs3If7RrAbDmjMoT0
	TvjjmkdKHlhbFGeOM6beCVFnq0vv7Xdk00OL1zr4=
Content-Type: multipart/mixed; boundary="===============6007837889948199318=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] ovmf: upgrading to edk2-stable202311 FAILED
Message-ID: <0101018c258481bd-f84082e7-a4d7-45b7-9b75-982dadc7739e-000000@us-west-2.amazonses.com>
Date: Fri, 1 Dec 2023 13:14:50 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 13:14:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191578

--===============6007837889948199318==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ovmf* to *edk2-stable202311* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-ovmf-upgrade-edk2-stable202308-edk2-stable202311.patch
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
From ef806c71fbd99d3c833338ebbdfa3a167f9f1b14 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Dec 2023 06:22:11 +0000
Subject: [PATCH] ovmf: upgrade edk2-stable202308 -> edk2-stable202311

---
 ...005-Committing-changes-from-do_patch.patch | 64 +++++++++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb            |  5 +-
 2 files changed, 67 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/ovmf/ovmf/0005-Committing-changes-from-do_patch.patch

diff --git a/meta/recipes-core/ovmf/ovmf/0005-Committing-changes-from-do_patch.patch b/meta/recipes-core/ovmf/ovmf/0005-Committing-changes-from-do_patch.patch
new file mode 100644
index 0000000000..98ee08f42b
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/0005-Committing-changes-from-do_patch.patch
@@ -0,0 +1,64 @@
+From 44e0c490936cda49a07d529ffb70f3df43fedf13 Mon Sep 17 00:00:00 2001
+From: OpenEmbedded <oe.patch@oe>
+Date: Fri, 1 Dec 2023 06:20:13 +0000
+Subject: [PATCH] Committing changes from do_patch
+
+---
+ BaseTools/Source/C/Makefiles/app.makefile |  6 ++++++
+ BaseTools/Source/C/VfrCompile/GNUmakefile | 10 ++++++++++
+ OvmfPkg/build.sh                          |  2 +-
+ 3 files changed, 17 insertions(+), 1 deletion(-)
+
+diff --git a/BaseTools/Source/C/Makefiles/app.makefile b/BaseTools/Source/C/Makefiles/app.makefile
+index 506343a6e0..a4a2337ea8 100644
+--- a/BaseTools/Source/C/Makefiles/app.makefile
++++ b/BaseTools/Source/C/Makefiles/app.makefile
+@@ -10,6 +10,12 @@ MAKEROOT ?= ../..
+ include $(MAKEROOT)/Makefiles/header.makefile
+ 
+ APPLICATION = $(MAKEROOT)/bin/$(APPNAME)
++CC = x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ovmf/edk2-stable202308/devtooltmp-c0ft75y0/workdir/recipe-sysroot
++CXX = x86_64-poky-linux-g++  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ovmf/edk2-stable202308/devtooltmp-c0ft75y0/workdir/recipe-sysroot
++AS = x86_64-poky-linux-as  
++AR = x86_64-poky-linux-gcc-ar
++LD = x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ovmf/edk2-stable202308/devtooltmp-c0ft75y0/workdir/recipe-sysroot  
++LINKER = $(CC)
+ 
+ .PHONY:all
+ all: $(MAKEROOT)/bin $(APPLICATION)
+diff --git a/BaseTools/Source/C/VfrCompile/GNUmakefile b/BaseTools/Source/C/VfrCompile/GNUmakefile
+index 7d5976649d..16a6fac56b 100644
+--- a/BaseTools/Source/C/VfrCompile/GNUmakefile
++++ b/BaseTools/Source/C/VfrCompile/GNUmakefile
+@@ -19,8 +19,18 @@ OBJECTS = AParser.o DLexerBase.o ATokenBuffer.o EfiVfrParser.o VfrLexer.o VfrSyn
+ CLANG:=$(shell $(CC) --version | grep clang)
+ ifneq ($(CLANG),)
+ VFR_CPPFLAGS = -Wno-deprecated-register -std=c++14 -DPCCTS_USE_NAMESPACE_STD $(CPPFLAGS)
++CC = x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ovmf/edk2-stable202308/devtooltmp-c0ft75y0/workdir/recipe-sysroot
++CXX = x86_64-poky-linux-g++  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ovmf/edk2-stable202308/devtooltmp-c0ft75y0/workdir/recipe-sysroot
++AS = x86_64-poky-linux-as  
++AR = x86_64-poky-linux-gcc-ar
++LD = x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ovmf/edk2-stable202308/devtooltmp-c0ft75y0/workdir/recipe-sysroot  
+ else
+ VFR_CPPFLAGS = -DPCCTS_USE_NAMESPACE_STD $(CPPFLAGS)
++CC = x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ovmf/edk2-stable202308/devtooltmp-c0ft75y0/workdir/recipe-sysroot
++CXX = x86_64-poky-linux-g++  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ovmf/edk2-stable202308/devtooltmp-c0ft75y0/workdir/recipe-sysroot
++AS = x86_64-poky-linux-as  
++AR = x86_64-poky-linux-gcc-ar
++LD = x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ovmf/edk2-stable202308/devtooltmp-c0ft75y0/workdir/recipe-sysroot  
+ endif
+ # keep BUILD_OPTFLAGS last
+ VFR_CXXFLAGS = $(BUILD_OPTFLAGS)
+diff --git a/OvmfPkg/build.sh b/OvmfPkg/build.sh
+index 285f061bf4..0be1c32154 100755
+--- a/OvmfPkg/build.sh
++++ b/OvmfPkg/build.sh
+@@ -24,7 +24,7 @@ then
+ # this assumes svn pulls have the same root dir
+ #  export EDK_TOOLS_PATH=`pwd`/../BaseTools
+ # This version is for the tools source in edk2
+-  export EDK_TOOLS_PATH=BBAKE_EDK_TOOLS_PATH/BaseTools
++  export EDK_TOOLS_PATH=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ovmf/edk2-stable202308/devtooltmp-c0ft75y0/workdir/recipe-sysroot-native/usr/bin/edk2_basetools/BaseTools
+   echo $EDK_TOOLS_PATH
+   source edksetup.sh BaseTools
+ else
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 3dc031d3b6..dcb29c3b14 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -24,10 +24,11 @@ SRC_URI = "gitsm://github.com/tianocore/edk2.git;branch=master;protocol=https \
            file://0002-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch \
            file://0003-debug-prefix-map.patch \
            file://0004-reproducible.patch \
+           file://0005-Committing-changes-from-do_patch.patch \
            "
 
-PV = "edk2-stable202308"
-SRCREV = "819cfc6b42a68790a23509e4fcc58ceb70e1965e"
+PV = "edk2-stable202311"
+SRCREV = "8736b8fdca85e02933cdb0a13309de14c9799ece"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>edk2-stable.*)"
 
 inherit deploy
-- 
2.39.2


--===============6007837889948199318==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1844 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (911 cached, 1 parsed). 1844 targets, 38 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-b9071eab7e4f24e5082cd94f7aaaf110d3d3dbd6"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:b9071eab7e4f24e5082cd94f7aaaf110d3d3dbd6"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 135 Local 117 Mirrors 0 Missed 18 Current 323 (86% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 340 of 458 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 355 of 458 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 365 of 458 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/nasm/nasm_2.16.01.bb:do_create_spdx_setscene)
NOTE: Running setscene task 373 of 458 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/acpica/acpica_20230628.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe acpica-native-20230628-r0: task do_create_spdx_setscene: Started
NOTE: recipe nasm-native-2.16.01-r0: task do_create_spdx_setscene: Started
NOTE: Running task 368 of 1437 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ovmf/ovmf_git.bb:do_recipe_qa)
NOTE: Running task 369 of 1437 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ovmf/ovmf_git.bb:do_recipe_qa)
NOTE: recipe util-linux-native-2.39.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe acpica-native-20230628-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe nasm-native-2.16.01-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 420 of 458 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-native-2.39.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ovmf-edk2-stable202311-r0: task do_recipe_qa: Started
NOTE: recipe ovmf-native-edk2-stable202311-r0: task do_recipe_qa: Started
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe ovmf-edk2-stable202311-r0: task do_recipe_qa: Succeeded
NOTE: Running task 531 of 1437 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ovmf/ovmf_git.bb:do_fetch)
NOTE: recipe ovmf-native-edk2-stable202311-r0: task do_recipe_qa: Succeeded
NOTE: Running task 532 of 1437 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ovmf/ovmf_git.bb:do_fetch)
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 432 of 458 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe ovmf-edk2-stable202311-r0: task do_fetch: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ovmf-native-edk2-stable202311-r0: task do_fetch: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe ovmf-edk2-stable202311-r0: task do_fetch: Succeeded
NOTE: Running task 1407 of 1437 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ovmf/ovmf_git.bb:do_unpack)
NOTE: recipe ovmf-edk2-stable202311-r0: task do_unpack: Started
NOTE: recipe ovmf-native-edk2-stable202311-r0: task do_fetch: Succeeded
NOTE: Running task 1408 of 1437 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ovmf/ovmf_git.bb:do_unpack)
NOTE: Running task 1409 of 1437 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ovmf/ovmf_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe ovmf-native-edk2-stable202311-r0: task do_unpack: Started
NOTE: recipe ovmf-native-edk2-stable202311-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ovmf-native-edk2-stable202311-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ovmf-edk2-stable202311-r0: task do_unpack: Succeeded
NOTE: Running task 1410 of 1437 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ovmf/ovmf_git.bb:do_patch)
NOTE: recipe ovmf-edk2-stable202311-r0: task do_patch: Started
NOTE: recipe ovmf-edk2-stable202311-r0: task do_patch: Failed
NOTE: recipe ovmf-native-edk2-stable202311-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 1410 tasks of which 1402 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231201062033.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231201062033.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ovmf/ovmf_git.bb:do_patch
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: ovmf-edk2-stable202311-r0 do_patch: Applying patch '0005-Committing-changes-from-do_patch.patch' on target directory '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ovmf/edk2-stable202311/git'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ovmf/edk2-stable202311/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0005-Committing-changes-from-do_patch.patch
patching file BaseTools/Source/C/Makefiles/app.makefile
Hunk #1 FAILED at 10 (different line endings).
1 out of 1 hunk FAILED -- rejects in file BaseTools/Source/C/Makefiles/app.makefile
patching file BaseTools/Source/C/VfrCompile/GNUmakefile
Hunk #1 FAILED at 19 (different line endings).
1 out of 1 hunk FAILED -- rejects in file BaseTools/Source/C/VfrCompile/GNUmakefile
patching file OvmfPkg/build.sh
Patch 0005-Committing-changes-from-do_patch.patch does not apply (enforce with -f)

stderr: ')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ovmf/edk2-stable202311/temp/log.do_patch.3867978
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ovmf/ovmf_git.bb:do_patch) failed with exit code '1'

--===============6007837889948199318==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ovmf-upgrade-edk2-stable202308-edk2-stable202311.patch"

RnJvbSBlZjgwNmM3MWZiZDk5ZDNjODMzMzM4ZWJiZGZhM2ExNjdmOWYxYjE0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBEZWMgMjAyMyAwNjoyMjoxMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG92
bWY6IHVwZ3JhZGUgZWRrMi1zdGFibGUyMDIzMDggLT4gZWRrMi1zdGFibGUyMDIzMTEKCi0tLQog
Li4uMDA1LUNvbW1pdHRpbmctY2hhbmdlcy1mcm9tLWRvX3BhdGNoLnBhdGNoIHwgNjQgKysrKysr
KysrKysrKysrKysrKwogbWV0YS9yZWNpcGVzLWNvcmUvb3ZtZi9vdm1mX2dpdC5iYiAgICAgICAg
ICAgIHwgIDUgKy0KIDIgZmlsZXMgY2hhbmdlZCwgNjcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtY29yZS9vdm1mL292bWYvMDAw
NS1Db21taXR0aW5nLWNoYW5nZXMtZnJvbS1kb19wYXRjaC5wYXRjaAoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1jb3JlL292bWYvb3ZtZi8wMDA1LUNvbW1pdHRpbmctY2hhbmdlcy1mcm9tLWRv
X3BhdGNoLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvb3ZtZi9vdm1mLzAwMDUtQ29tbWl0dGlu
Zy1jaGFuZ2VzLWZyb20tZG9fcGF0Y2gucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
MDAwMDAwMDAwMC4uOThlZTA4ZjQyYgotLS0gL2Rldi9udWxsCisrKyBiL21ldGEvcmVjaXBlcy1j
b3JlL292bWYvb3ZtZi8wMDA1LUNvbW1pdHRpbmctY2hhbmdlcy1mcm9tLWRvX3BhdGNoLnBhdGNo
CkBAIC0wLDAgKzEsNjQgQEAKK0Zyb20gNDRlMGM0OTA5MzZjZGE0OWEwN2Q1MjlmZmI3MGYzZGY0
M2ZlZGYxMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IE9wZW5FbWJlZGRlZCA8b2Uu
cGF0Y2hAb2U+CitEYXRlOiBGcmksIDEgRGVjIDIwMjMgMDY6MjA6MTMgKzAwMDAKK1N1YmplY3Q6
IFtQQVRDSF0gQ29tbWl0dGluZyBjaGFuZ2VzIGZyb20gZG9fcGF0Y2gKKworLS0tCisgQmFzZVRv
b2xzL1NvdXJjZS9DL01ha2VmaWxlcy9hcHAubWFrZWZpbGUgfCAgNiArKysrKysKKyBCYXNlVG9v
bHMvU291cmNlL0MvVmZyQ29tcGlsZS9HTlVtYWtlZmlsZSB8IDEwICsrKysrKysrKysKKyBPdm1m
UGtnL2J1aWxkLnNoICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCisgMyBmaWxlcyBj
aGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCisKK2RpZmYgLS1naXQgYS9C
YXNlVG9vbHMvU291cmNlL0MvTWFrZWZpbGVzL2FwcC5tYWtlZmlsZSBiL0Jhc2VUb29scy9Tb3Vy
Y2UvQy9NYWtlZmlsZXMvYXBwLm1ha2VmaWxlCitpbmRleCA1MDYzNDNhNmUwLi5hNGEyMzM3ZWE4
IDEwMDY0NAorLS0tIGEvQmFzZVRvb2xzL1NvdXJjZS9DL01ha2VmaWxlcy9hcHAubWFrZWZpbGUK
KysrKyBiL0Jhc2VUb29scy9Tb3VyY2UvQy9NYWtlZmlsZXMvYXBwLm1ha2VmaWxlCitAQCAtMTAs
NiArMTAsMTIgQEAgTUFLRVJPT1QgPz0gLi4vLi4KKyBpbmNsdWRlICQoTUFLRVJPT1QpL01ha2Vm
aWxlcy9oZWFkZXIubWFrZWZpbGUKKyAKKyBBUFBMSUNBVElPTiA9ICQoTUFLRVJPT1QpL2Jpbi8k
KEFQUE5BTUUpCisrQ0MgPSB4ODZfNjQtcG9reS1saW51eC1nY2MgIC1tNjQgLW1hcmNoPWNvcmUy
IC1tdHVuZT1jb3JlMiAtbXNzZTMgLW1mcG1hdGg9c3NlIC1mc3RhY2stcHJvdGVjdG9yLXN0cm9u
ZyAgLU8yIC1EX0ZPUlRJRllfU09VUkNFPTIgLVdmb3JtYXQgLVdmb3JtYXQtc2VjdXJpdHkgLVdl
cnJvcj1mb3JtYXQtc2VjdXJpdHkgLS1zeXNyb290PS9ob21lL3Bva3lidWlsZC95b2N0by13b3Jr
ZXIvYXVoL2J1aWxkL2J1aWxkL3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgvb3ZtZi9lZGsy
LXN0YWJsZTIwMjMwOC9kZXZ0b29sdG1wLWMwZnQ3NXkwL3dvcmtkaXIvcmVjaXBlLXN5c3Jvb3QK
KytDWFggPSB4ODZfNjQtcG9reS1saW51eC1nKysgIC1tNjQgLW1hcmNoPWNvcmUyIC1tdHVuZT1j
b3JlMiAtbXNzZTMgLW1mcG1hdGg9c3NlIC1mc3RhY2stcHJvdGVjdG9yLXN0cm9uZyAgLU8yIC1E
X0ZPUlRJRllfU09VUkNFPTIgLVdmb3JtYXQgLVdmb3JtYXQtc2VjdXJpdHkgLVdlcnJvcj1mb3Jt
YXQtc2VjdXJpdHkgLS1zeXNyb290PS9ob21lL3Bva3lidWlsZC95b2N0by13b3JrZXIvYXVoL2J1
aWxkL2J1aWxkL3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgvb3ZtZi9lZGsyLXN0YWJsZTIw
MjMwOC9kZXZ0b29sdG1wLWMwZnQ3NXkwL3dvcmtkaXIvcmVjaXBlLXN5c3Jvb3QKKytBUyA9IHg4
Nl82NC1wb2t5LWxpbnV4LWFzICAKKytBUiA9IHg4Nl82NC1wb2t5LWxpbnV4LWdjYy1hcgorK0xE
ID0geDg2XzY0LXBva3ktbGludXgtbGQgLS1zeXNyb290PS9ob21lL3Bva3lidWlsZC95b2N0by13
b3JrZXIvYXVoL2J1aWxkL2J1aWxkL3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgvb3ZtZi9l
ZGsyLXN0YWJsZTIwMjMwOC9kZXZ0b29sdG1wLWMwZnQ3NXkwL3dvcmtkaXIvcmVjaXBlLXN5c3Jv
b3QgIAorK0xJTktFUiA9ICQoQ0MpCisgCisgLlBIT05ZOmFsbAorIGFsbDogJChNQUtFUk9PVCkv
YmluICQoQVBQTElDQVRJT04pCitkaWZmIC0tZ2l0IGEvQmFzZVRvb2xzL1NvdXJjZS9DL1ZmckNv
bXBpbGUvR05VbWFrZWZpbGUgYi9CYXNlVG9vbHMvU291cmNlL0MvVmZyQ29tcGlsZS9HTlVtYWtl
ZmlsZQoraW5kZXggN2Q1OTc2NjQ5ZC4uMTZhNmZhYzU2YiAxMDA2NDQKKy0tLSBhL0Jhc2VUb29s
cy9Tb3VyY2UvQy9WZnJDb21waWxlL0dOVW1ha2VmaWxlCisrKysgYi9CYXNlVG9vbHMvU291cmNl
L0MvVmZyQ29tcGlsZS9HTlVtYWtlZmlsZQorQEAgLTE5LDggKzE5LDE4IEBAIE9CSkVDVFMgPSBB
UGFyc2VyLm8gRExleGVyQmFzZS5vIEFUb2tlbkJ1ZmZlci5vIEVmaVZmclBhcnNlci5vIFZmckxl
eGVyLm8gVmZyU3luCisgQ0xBTkc6PSQoc2hlbGwgJChDQykgLS12ZXJzaW9uIHwgZ3JlcCBjbGFu
ZykKKyBpZm5lcSAoJChDTEFORyksKQorIFZGUl9DUFBGTEFHUyA9IC1Xbm8tZGVwcmVjYXRlZC1y
ZWdpc3RlciAtc3RkPWMrKzE0IC1EUENDVFNfVVNFX05BTUVTUEFDRV9TVEQgJChDUFBGTEFHUykK
KytDQyA9IHg4Nl82NC1wb2t5LWxpbnV4LWdjYyAgLW02NCAtbWFyY2g9Y29yZTIgLW10dW5lPWNv
cmUyIC1tc3NlMyAtbWZwbWF0aD1zc2UgLWZzdGFjay1wcm90ZWN0b3Itc3Ryb25nICAtTzIgLURf
Rk9SVElGWV9TT1VSQ0U9MiAtV2Zvcm1hdCAtV2Zvcm1hdC1zZWN1cml0eSAtV2Vycm9yPWZvcm1h
dC1zZWN1cml0eSAtLXN5c3Jvb3Q9L2hvbWUvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9hdWgvYnVp
bGQvYnVpbGQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC9vdm1mL2VkazItc3RhYmxlMjAy
MzA4L2RldnRvb2x0bXAtYzBmdDc1eTAvd29ya2Rpci9yZWNpcGUtc3lzcm9vdAorK0NYWCA9IHg4
Nl82NC1wb2t5LWxpbnV4LWcrKyAgLW02NCAtbWFyY2g9Y29yZTIgLW10dW5lPWNvcmUyIC1tc3Nl
MyAtbWZwbWF0aD1zc2UgLWZzdGFjay1wcm90ZWN0b3Itc3Ryb25nICAtTzIgLURfRk9SVElGWV9T
T1VSQ0U9MiAtV2Zvcm1hdCAtV2Zvcm1hdC1zZWN1cml0eSAtV2Vycm9yPWZvcm1hdC1zZWN1cml0
eSAtLXN5c3Jvb3Q9L2hvbWUvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9hdWgvYnVpbGQvYnVpbGQv
dG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC9vdm1mL2VkazItc3RhYmxlMjAyMzA4L2RldnRv
b2x0bXAtYzBmdDc1eTAvd29ya2Rpci9yZWNpcGUtc3lzcm9vdAorK0FTID0geDg2XzY0LXBva3kt
bGludXgtYXMgIAorK0FSID0geDg2XzY0LXBva3ktbGludXgtZ2NjLWFyCisrTEQgPSB4ODZfNjQt
cG9reS1saW51eC1sZCAtLXN5c3Jvb3Q9L2hvbWUvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9hdWgv
YnVpbGQvYnVpbGQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC9vdm1mL2VkazItc3RhYmxl
MjAyMzA4L2RldnRvb2x0bXAtYzBmdDc1eTAvd29ya2Rpci9yZWNpcGUtc3lzcm9vdCAgCisgZWxz
ZQorIFZGUl9DUFBGTEFHUyA9IC1EUENDVFNfVVNFX05BTUVTUEFDRV9TVEQgJChDUFBGTEFHUykK
KytDQyA9IHg4Nl82NC1wb2t5LWxpbnV4LWdjYyAgLW02NCAtbWFyY2g9Y29yZTIgLW10dW5lPWNv
cmUyIC1tc3NlMyAtbWZwbWF0aD1zc2UgLWZzdGFjay1wcm90ZWN0b3Itc3Ryb25nICAtTzIgLURf
Rk9SVElGWV9TT1VSQ0U9MiAtV2Zvcm1hdCAtV2Zvcm1hdC1zZWN1cml0eSAtV2Vycm9yPWZvcm1h
dC1zZWN1cml0eSAtLXN5c3Jvb3Q9L2hvbWUvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9hdWgvYnVp
bGQvYnVpbGQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC9vdm1mL2VkazItc3RhYmxlMjAy
MzA4L2RldnRvb2x0bXAtYzBmdDc1eTAvd29ya2Rpci9yZWNpcGUtc3lzcm9vdAorK0NYWCA9IHg4
Nl82NC1wb2t5LWxpbnV4LWcrKyAgLW02NCAtbWFyY2g9Y29yZTIgLW10dW5lPWNvcmUyIC1tc3Nl
MyAtbWZwbWF0aD1zc2UgLWZzdGFjay1wcm90ZWN0b3Itc3Ryb25nICAtTzIgLURfRk9SVElGWV9T
T1VSQ0U9MiAtV2Zvcm1hdCAtV2Zvcm1hdC1zZWN1cml0eSAtV2Vycm9yPWZvcm1hdC1zZWN1cml0
eSAtLXN5c3Jvb3Q9L2hvbWUvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9hdWgvYnVpbGQvYnVpbGQv
dG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC9vdm1mL2VkazItc3RhYmxlMjAyMzA4L2RldnRv
b2x0bXAtYzBmdDc1eTAvd29ya2Rpci9yZWNpcGUtc3lzcm9vdAorK0FTID0geDg2XzY0LXBva3kt
bGludXgtYXMgIAorK0FSID0geDg2XzY0LXBva3ktbGludXgtZ2NjLWFyCisrTEQgPSB4ODZfNjQt
cG9reS1saW51eC1sZCAtLXN5c3Jvb3Q9L2hvbWUvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9hdWgv
YnVpbGQvYnVpbGQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC9vdm1mL2VkazItc3RhYmxl
MjAyMzA4L2RldnRvb2x0bXAtYzBmdDc1eTAvd29ya2Rpci9yZWNpcGUtc3lzcm9vdCAgCisgZW5k
aWYKKyAjIGtlZXAgQlVJTERfT1BURkxBR1MgbGFzdAorIFZGUl9DWFhGTEFHUyA9ICQoQlVJTERf
T1BURkxBR1MpCitkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9idWlsZC5zaCBiL092bWZQa2cvYnVpbGQu
c2gKK2luZGV4IDI4NWYwNjFiZjQuLjBiZTFjMzIxNTQgMTAwNzU1CistLS0gYS9Pdm1mUGtnL2J1
aWxkLnNoCisrKysgYi9Pdm1mUGtnL2J1aWxkLnNoCitAQCAtMjQsNyArMjQsNyBAQCB0aGVuCisg
IyB0aGlzIGFzc3VtZXMgc3ZuIHB1bGxzIGhhdmUgdGhlIHNhbWUgcm9vdCBkaXIKKyAjICBleHBv
cnQgRURLX1RPT0xTX1BBVEg9YHB3ZGAvLi4vQmFzZVRvb2xzCisgIyBUaGlzIHZlcnNpb24gaXMg
Zm9yIHRoZSB0b29scyBzb3VyY2UgaW4gZWRrMgorLSAgZXhwb3J0IEVES19UT09MU19QQVRIPUJC
QUtFX0VES19UT09MU19QQVRIL0Jhc2VUb29scworKyAgZXhwb3J0IEVES19UT09MU19QQVRIPS9o
b21lL3Bva3lidWlsZC95b2N0by13b3JrZXIvYXVoL2J1aWxkL2J1aWxkL3RtcC93b3JrL2NvcmUy
LTY0LXBva3ktbGludXgvb3ZtZi9lZGsyLXN0YWJsZTIwMjMwOC9kZXZ0b29sdG1wLWMwZnQ3NXkw
L3dvcmtkaXIvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4vZWRrMl9iYXNldG9vbHMvQmFz
ZVRvb2xzCisgICBlY2hvICRFREtfVE9PTFNfUEFUSAorICAgc291cmNlIGVka3NldHVwLnNoIEJh
c2VUb29scworIGVsc2UKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL292bWYvb3ZtZl9n
aXQuYmIgYi9tZXRhL3JlY2lwZXMtY29yZS9vdm1mL292bWZfZ2l0LmJiCmluZGV4IDNkYzAzMWQz
YjYuLmRjYjI5YzNiMTQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL292bWYvb3ZtZl9n
aXQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvb3ZtZi9vdm1mX2dpdC5iYgpAQCAtMjQsMTAg
KzI0LDExIEBAIFNSQ19VUkkgPSAiZ2l0c206Ly9naXRodWIuY29tL3RpYW5vY29yZS9lZGsyLmdp
dDticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzIFwKICAgICAgICAgICAgZmlsZTovLzAwMDIt
QmFzZVRvb2xzLW1ha2VmaWxlLWFkanVzdC10by1idWlsZC1pbi11bmRlci1iaXRiYWtlLnBhdGNo
IFwKICAgICAgICAgICAgZmlsZTovLzAwMDMtZGVidWctcHJlZml4LW1hcC5wYXRjaCBcCiAgICAg
ICAgICAgIGZpbGU6Ly8wMDA0LXJlcHJvZHVjaWJsZS5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6
Ly8wMDA1LUNvbW1pdHRpbmctY2hhbmdlcy1mcm9tLWRvX3BhdGNoLnBhdGNoIFwKICAgICAgICAg
ICAgIgogCi1QViA9ICJlZGsyLXN0YWJsZTIwMjMwOCIKLVNSQ1JFViA9ICI4MTljZmM2YjQyYTY4
NzkwYTIzNTA5ZTRmY2M1OGNlYjcwZTE5NjVlIgorUFYgPSAiZWRrMi1zdGFibGUyMDIzMTEiCitT
UkNSRVYgPSAiODczNmI4ZmRjYTg1ZTAyOTMzY2RiMGExMzMwOWRlMTRjOTc5OWVjZSIKIFVQU1RS
RUFNX0NIRUNLX0dJVFRBR1JFR0VYID0gIig/UDxwdmVyPmVkazItc3RhYmxlLiopIgogCiBpbmhl
cml0IGRlcGxveQotLSAKMi4zOS4yCgo=

--===============6007837889948199318==--

