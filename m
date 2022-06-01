Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA25BC43334
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 16:18:47 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web12.613.1654100322706388306
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 09:18:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=jx3FVEPP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 01010181200fe54f-6d192483-87ab-4d2b-aed2-c2f5d36d7786-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1654100321;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YSjdu8qmjw24l8a5ZL0B/e1d/o7OTU3Ba3Kscfj1vaA=;
	b=jx3FVEPPxGSBDHRTOz4F/7/c/HoK0bVvHbHMPYA6cZ+wuxajueTCwpfSVfOyyFzA
	XjCJQ79kv052wowY6zeGzMbYCJLH+OwnqaLX6kxjCsFXlpZXu+MTQ9PK5inFW9uo7OD
	brzKdE3xzc5rtIxgkK2oY06xSeh2dzmCGzbjOMBg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1654100321;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YSjdu8qmjw24l8a5ZL0B/e1d/o7OTU3Ba3Kscfj1vaA=;
	b=Etjt9yayCW/NpSguXk68voU9Qt719JT1RsarQpXyJZAQTjRCQwJRPQsaVye2QYSw
	3ZxoQxqWc1EGkwjLJK5wH0cehJh58c0NtZv16KtCfunmD6xUe5ze/5xtmcHyfNoChdi
	7tZ4Fy82dgrLxy5gvWS7j5Ja5Rq4j4X9FKo8x7LE=
Content-Type: multipart/mixed; boundary="===============2327361615768645122=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ovmf: upgrading to edk2-stable202205 FAILED
Message-ID: 
 <01010181200fe54f-6d192483-87ab-4d2b-aed2-c2f5d36d7786-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jun 2022 16:18:41 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 16:18:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166392

--===============2327361615768645122==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ovmf* to *edk2-stable202205* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-ovmf-upgrade-edk2-stable202202-edk2-stable202205.patch
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
--===============2327361615768645122==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-ovmf-upgrade-edk2-stable202202-edk2-stable202205.patch"

From ccc2c185c2f4375b4a4567590ec56275b8dfbb52 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Jun 2022 06:40:54 +0000
Subject: [PATCH] ovmf: upgrade edk2-stable202202 -> edk2-stable202205

---
 .../0001-BaseTools-fix-gcc12-warning-1.patch  | 51 ---------------
 .../0001-BaseTools-fix-gcc12-warning.patch    | 49 --------------
 ...006-Committing-changes-from-do_patch.patch | 64 +++++++++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb            |  7 +-
 4 files changed, 67 insertions(+), 104 deletions(-)
 delete mode 100644 meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-warning-1.patch
 delete mode 100644 meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-warning.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/0006-Committing-changes-from-do_patch.patch

diff --git a/meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-warning-1.patch b/meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-warning-1.patch
deleted file mode 100644
index 23366b4d07..0000000000
--- a/meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-warning-1.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From b0a0b7b605aeb8106e7b50d1efeb746f401498cc Mon Sep 17 00:00:00 2001
-From: Gerd Hoffmann <kraxel@redhat.com>
-Date: Thu, 24 Mar 2022 20:04:35 +0800
-Subject: [PATCH] BaseTools: fix gcc12 warning
-
-Sdk/C/LzmaEnc.c: In function ?LzmaEnc_CodeOneMemBlock?:
-Sdk/C/LzmaEnc.c:2828:19: error: storing the address of local variable ?outStream? in ?*p.rc.outStream? [-Werror=dangling-pointer=]
- 2828 |   p->rc.outStream = &outStream.vt;
-      |   ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
-Sdk/C/LzmaEnc.c:2811:28: note: ?outStream? declared here
- 2811 |   CLzmaEnc_SeqOutStreamBuf outStream;
-      |                            ^~~~~~~~~
-Sdk/C/LzmaEnc.c:2811:28: note: ?pp? declared here
-Sdk/C/LzmaEnc.c:2828:19: error: storing the address of local variable ?outStream? in ?*(CLzmaEnc *)pp.rc.outStream? [-Werror=dangling-pointer=]
- 2828 |   p->rc.outStream = &outStream.vt;
-      |   ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
-Sdk/C/LzmaEnc.c:2811:28: note: ?outStream? declared here
- 2811 |   CLzmaEnc_SeqOutStreamBuf outStream;
-      |                            ^~~~~~~~~
-Sdk/C/LzmaEnc.c:2811:28: note: ?pp? declared here
-cc1: all warnings being treated as errors
-
-Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/85021f8cf22d1bd4114803c6c610dea5ef0059f1]
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
-Reviewed-by: Bob Feng <bob.c.feng@intel.com>
----
- BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c b/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c
-index 4e9b499f8d..4b9f5fa692 100644
---- a/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c
-+++ b/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c
-@@ -2825,12 +2825,13 @@ SRes LzmaEnc_CodeOneMemBlock(CLzmaEncHandle pp, BoolInt reInit,
- 
-   nowPos64 = p->nowPos64;
-   RangeEnc_Init(&p->rc);
--  p->rc.outStream = &outStream.vt;
- 
-   if (desiredPackSize == 0)
-     return SZ_ERROR_OUTPUT_EOF;
- 
-+  p->rc.outStream = &outStream.vt;
-   res = LzmaEnc_CodeOneBlock(p, desiredPackSize, *unpackSize);
-+  p->rc.outStream = NULL;
- 
-   *unpackSize = (UInt32)(p->nowPos64 - nowPos64);
-   *destLen -= outStream.rem;
--- 
-2.36.1
-
diff --git a/meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-warning.patch b/meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-warning.patch
deleted file mode 100644
index 91c01647db..0000000000
--- a/meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-warning.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 2435c17e56652479315853cec5b91fb0ea0911a3 Mon Sep 17 00:00:00 2001
-From: Gerd Hoffmann <kraxel@redhat.com>
-Date: Thu, 24 Mar 2022 20:04:34 +0800
-Subject: [PATCH] BaseTools: fix gcc12 warning
-
-GenFfs.c:545:5: error: pointer ?InFileHandle? used after ?fclose? [-Werror=use-after-free]
-  545 |     Error(NULL, 0, 4001, "Resource", "memory cannot be allocated  of %s", InFileHandle);
-      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-GenFfs.c:544:5: note: call to ?fclose? here
-  544 |     fclose (InFileHandle);
-      |     ^~~~~~~~~~~~~~~~~~~~~
-
-Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/7b005f344e533cd913c3ca05b266f9872df886d1]
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
-Reviewed-by: Bob Feng <bob.c.feng@intel.com>
----
- BaseTools/Source/C/GenFfs/GenFfs.c | 2 +-
- BaseTools/Source/C/GenSec/GenSec.c | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/BaseTools/Source/C/GenFfs/GenFfs.c b/BaseTools/Source/C/GenFfs/GenFfs.c
-index 949025c333..d78d62ab36 100644
---- a/BaseTools/Source/C/GenFfs/GenFfs.c
-+++ b/BaseTools/Source/C/GenFfs/GenFfs.c
-@@ -542,7 +542,7 @@ GetAlignmentFromFile(char *InFile, UINT32 *Alignment)
-   PeFileBuffer = (UINT8 *) malloc (PeFileSize);
-   if (PeFileBuffer == NULL) {
-     fclose (InFileHandle);
--    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated  of %s", InFileHandle);
-+    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated for %s", InFile);
-     return EFI_OUT_OF_RESOURCES;
-   }
-   fread (PeFileBuffer, sizeof (UINT8), PeFileSize, InFileHandle);
-diff --git a/BaseTools/Source/C/GenSec/GenSec.c b/BaseTools/Source/C/GenSec/GenSec.c
-index d54a4f9e0a..b1d05367ec 100644
---- a/BaseTools/Source/C/GenSec/GenSec.c
-+++ b/BaseTools/Source/C/GenSec/GenSec.c
-@@ -1062,7 +1062,7 @@ GetAlignmentFromFile(char *InFile, UINT32 *Alignment)
-   PeFileBuffer = (UINT8 *) malloc (PeFileSize);
-   if (PeFileBuffer == NULL) {
-     fclose (InFileHandle);
--    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated  of %s", InFileHandle);
-+    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated for %s", InFile);
-     return EFI_OUT_OF_RESOURCES;
-   }
-   fread (PeFileBuffer, sizeof (UINT8), PeFileSize, InFileHandle);
--- 
-2.36.1
-
diff --git a/meta/recipes-core/ovmf/ovmf/0006-Committing-changes-from-do_patch.patch b/meta/recipes-core/ovmf/ovmf/0006-Committing-changes-from-do_patch.patch
new file mode 100644
index 0000000000..c33512af21
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/0006-Committing-changes-from-do_patch.patch
@@ -0,0 +1,64 @@
+From 40d154db4ccf5249727823a54530840f8142f2dd Mon Sep 17 00:00:00 2001
+From: OpenEmbedded <oe.patch@oe>
+Date: Wed, 1 Jun 2022 06:40:15 +0000
+Subject: [PATCH] Committing changes from do_patch
+
+---
+ BaseTools/Source/C/Makefiles/app.makefile |  6 ++++++
+ BaseTools/Source/C/VfrCompile/GNUmakefile | 10 ++++++++++
+ OvmfPkg/build.sh                          |  2 +-
+ 3 files changed, 17 insertions(+), 1 deletion(-)
+
+diff --git a/BaseTools/Source/C/Makefiles/app.makefile b/BaseTools/Source/C/Makefiles/app.makefile
+index 6a2a8f5e8a..97f590688d 100644
+--- a/BaseTools/Source/C/Makefiles/app.makefile
++++ b/BaseTools/Source/C/Makefiles/app.makefile
+@@ -10,6 +10,12 @@ MAKEROOT ?= ../..
+ include $(MAKEROOT)/Makefiles/header.makefile
+ 
+ APPLICATION = $(MAKEROOT)/bin/$(APPNAME)
++CC = x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ovmf/edk2-stable202202-r0/devtooltmp-2az6rjtg/workdir/recipe-sysroot
++CXX = x86_64-poky-linux-g++  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ovmf/edk2-stable202202-r0/devtooltmp-2az6rjtg/workdir/recipe-sysroot
++AS = x86_64-poky-linux-as  
++AR = x86_64-poky-linux-gcc-ar
++LD = x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ovmf/edk2-stable202202-r0/devtooltmp-2az6rjtg/workdir/recipe-sysroot  
++LINKER = $(CC)
+ 
+ .PHONY:all
+ all: $(MAKEROOT)/bin $(APPLICATION)
+diff --git a/BaseTools/Source/C/VfrCompile/GNUmakefile b/BaseTools/Source/C/VfrCompile/GNUmakefile
+index fc329944b9..1a244051a7 100644
+--- a/BaseTools/Source/C/VfrCompile/GNUmakefile
++++ b/BaseTools/Source/C/VfrCompile/GNUmakefile
+@@ -18,8 +18,18 @@ OBJECTS = AParser.o DLexerBase.o ATokenBuffer.o EfiVfrParser.o VfrLexer.o VfrSyn
+           VfrFormPkg.o VfrError.o VfrUtilityLib.o VfrCompiler.o
+ ifeq ($(CXX), llvm)
+ VFR_CPPFLAGS = -Wno-deprecated-register -DPCCTS_USE_NAMESPACE_STD $(BUILD_CPPFLAGS)
++CC = x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ovmf/edk2-stable202202-r0/devtooltmp-2az6rjtg/workdir/recipe-sysroot
++CXX = x86_64-poky-linux-g++  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ovmf/edk2-stable202202-r0/devtooltmp-2az6rjtg/workdir/recipe-sysroot
++AS = x86_64-poky-linux-as  
++AR = x86_64-poky-linux-gcc-ar
++LD = x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ovmf/edk2-stable202202-r0/devtooltmp-2az6rjtg/workdir/recipe-sysroot  
+ else
+ VFR_CPPFLAGS = -DPCCTS_USE_NAMESPACE_STD $(BUILD_CPPFLAGS)
++CC = x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ovmf/edk2-stable202202-r0/devtooltmp-2az6rjtg/workdir/recipe-sysroot
++CXX = x86_64-poky-linux-g++  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ovmf/edk2-stable202202-r0/devtooltmp-2az6rjtg/workdir/recipe-sysroot
++AS = x86_64-poky-linux-as  
++AR = x86_64-poky-linux-gcc-ar
++LD = x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ovmf/edk2-stable202202-r0/devtooltmp-2az6rjtg/workdir/recipe-sysroot  
+ endif
+ # keep BUILD_OPTFLAGS last
+ VFR_CXXFLAGS = $(BUILD_OPTFLAGS)
+diff --git a/OvmfPkg/build.sh b/OvmfPkg/build.sh
+index 1858dae31a..0734fc6b75 100755
+--- a/OvmfPkg/build.sh
++++ b/OvmfPkg/build.sh
+@@ -24,7 +24,7 @@ then
+ # this assumes svn pulls have the same root dir
+ #  export EDK_TOOLS_PATH=`pwd`/../BaseTools
+ # This version is for the tools source in edk2
+-  export EDK_TOOLS_PATH=BBAKE_EDK_TOOLS_PATH/BaseTools
++  export EDK_TOOLS_PATH=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ovmf/edk2-stable202202-r0/devtooltmp-2az6rjtg/workdir/recipe-sysroot-native/usr/bin/edk2_basetools/BaseTools
+   echo $EDK_TOOLS_PATH
+   source edksetup.sh BaseTools
+ else
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 84e3360a3a..5d4e69b0ac 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -25,12 +25,11 @@ SRC_URI = "gitsm://github.com/tianocore/edk2.git;branch=master;protocol=https \
            file://0003-ovmf-Update-to-latest.patch \
            file://0005-debug-prefix-map.patch \
            file://0006-reproducible.patch \
-           file://0001-BaseTools-fix-gcc12-warning.patch \
-           file://0001-BaseTools-fix-gcc12-warning-1.patch \
+           file://0006-Committing-changes-from-do_patch.patch \
            "
 
-PV = "edk2-stable202202"
-SRCREV = "b24306f15daa2ff8510b06702114724b33895d3c"
+PV = "edk2-stable202205"
+SRCREV = "16779ede2d366bfc6b702e817356ccf43425bcc8"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>edk2-stable.*)"
 
 inherit deploy
-- 
2.31.1


--===============2327361615768645122==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1642 entries from dependency cache.
Parsing recipes...done.
Parsing of 883 .bb files complete (882 cached, 1 parsed). 1642 targets, 36 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 2 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-e338cba712cfde5d8a175c69eb55e145343966df"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:e338cba712cfde5d8a175c69eb55e145343966df"
workspace            = "master:95066dde6861ee08fdb505ab3e0422156cc24fae"

Initialising tasks...done.
Sstate summary: Wanted 26 Local 15 Mirrors 0 Missed 11 Current 235 (57% match, 95% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 797 of 1128 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ovmf/ovmf_git.bb:do_fetch)
NOTE: Running task 811 of 1128 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ovmf/ovmf_git.bb:do_fetch)
NOTE: recipe ovmf-edk2-stable202205-r0: task do_fetch: Started
NOTE: recipe ovmf-native-edk2-stable202205-r0: task do_fetch: Started
NOTE: recipe ovmf-edk2-stable202205-r0: task do_fetch: Succeeded
NOTE: Running task 1105 of 1128 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ovmf/ovmf_git.bb:do_unpack)
NOTE: recipe ovmf-edk2-stable202205-r0: task do_unpack: Started
NOTE: recipe ovmf-native-edk2-stable202205-r0: task do_fetch: Succeeded
NOTE: Running task 1106 of 1128 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ovmf/ovmf_git.bb:do_unpack)
NOTE: Running task 1107 of 1128 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ovmf/ovmf_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe ovmf-native-edk2-stable202205-r0: task do_unpack: Started
NOTE: recipe ovmf-native-edk2-stable202205-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ovmf-native-edk2-stable202205-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ovmf-edk2-stable202205-r0: task do_unpack: Succeeded
NOTE: Running task 1108 of 1128 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ovmf/ovmf_git.bb:do_patch)
NOTE: recipe ovmf-edk2-stable202205-r0: task do_patch: Started
NOTE: recipe ovmf-edk2-stable202205-r0: task do_patch: Failed
NOTE: recipe ovmf-native-edk2-stable202205-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 1108 tasks of which 1102 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ovmf/ovmf_git.bb:do_patch
Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: ovmf-edk2-stable202205-r0 do_patch: Applying patch '0006-Committing-changes-from-do_patch.patch' on target directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ovmf/edk2-stable202205-r0/git'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ovmf/edk2-stable202205-r0/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0006-Committing-changes-from-do_patch.patch
patching file BaseTools/Source/C/Makefiles/app.makefile
Hunk #1 FAILED at 10 (different line endings).
1 out of 1 hunk FAILED -- rejects in file BaseTools/Source/C/Makefiles/app.makefile
patching file BaseTools/Source/C/VfrCompile/GNUmakefile
Hunk #1 FAILED at 18 (different line endings).
1 out of 1 hunk FAILED -- rejects in file BaseTools/Source/C/VfrCompile/GNUmakefile
patching file OvmfPkg/build.sh
Patch 0006-Committing-changes-from-do_patch.patch does not apply (enforce with -f)

stderr: ')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ovmf/edk2-stable202205-r0/temp/log.do_patch.2001178
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ovmf/ovmf_git.bb:do_patch) failed with exit code '1'

--===============2327361615768645122==--

