Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f44.google.com (mail-pg0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 0E115782D1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 14:59:23 +0000 (UTC)
Received: by mail-pg0-f44.google.com with SMTP id a70so46228425pge.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 07:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ixkqXKy9HSTYJF/zv6+ovYm2PZbkCermSdpK2u50ly0=;
	b=tPRUu30jZsA4JjiZJpi1i5Z8hwfgM/JiDGUA+YlrwP2MepSMFNunpiv2XE0PX+AoB3
	FTkaIAUPJQIRQqgfhE0RN8IzDk5Po671hi+fBhcbCJt1EOZNRWH+xSe1XaNqo4n0HB2l
	CdxUkZSaMUUOZklQxuUdRHCPp5ItwCfspmOSLjeN0zZORlQLZPTWPkI2Dintc0Npetbg
	4x2ePSpu35+orInwhxPkoaz46s8aq1lUIQF7T1Ee+hgSAubQYW5SZ5kc8gBCeh6Nsyjy
	N5CZ/5IZrllbvbFPrnEPGcjfELQ21SIL4039+m1ZMu2362mVsJja+RuFOAdWOR198/DA
	RhPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ixkqXKy9HSTYJF/zv6+ovYm2PZbkCermSdpK2u50ly0=;
	b=EfsQfBb/bBmscjr2HtjLSZ03YoO3B21LbhkJdvcdWOfg10bhnXgS9TmOTcgsWRu0lU
	PFAbUaxAha2aoZ2Ok+ooq5zT6L1xry9zTJRUUUZNhbKoVV4tvTmrKuRN/NyFL2wsDBoU
	PCZxnDEuHDoaP608Yye7mgKRTRbkMIBmWQ91BiWoIRsaC+bggEKX7TgVgwP1/bv6qYqR
	/cgVbo6gPBKafbBsiU6q0AOSXTMKxjeNrwNIXdjvx/lJzJymzkld33X8ssfWfWudsXzX
	8V1Gt91GkLpfMmkGtSFJwA6GPAwu12EeRl3S8P3nml4dr34mRiILUAptMBDBvoCC+chc
	auEw==
X-Gm-Message-State: AODbwcBntA0eaqAaALsH+RCHxChSOdbHlSr9KOVpnynfGY8kSHod01BT
	/PtV3J7jmwZFdTqt
X-Received: by 10.84.236.14 with SMTP id q14mr57906520plk.253.1497279564788;
	Mon, 12 Jun 2017 07:59:24 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::264a])
	by smtp.gmail.com with ESMTPSA id
	i17sm20554732pgn.60.2017.06.12.07.59.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Jun 2017 07:59:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Jun 2017 07:59:07 -0700
Message-Id: <a89c0a82e00721ba4063c9197e0951d1d63c7e40.1497279306.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <cover.1497279306.git.raj.khem@gmail.com>
References: <cover.1497279306.git.raj.khem@gmail.com>
Subject: [PATCH 7/7] ovmf: Update to latest
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Jun 2017 14:59:24 -0000

Fix build with gcc7

clang can not compile it therefore mark it gcc only recipe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...g-UefiHiiLib-Fix-incorrect-comparison-exp.patch | 45 ----------------------
 .../ovmf/ovmf/0001-ia32-Dont-use-pie.patch         | 37 ++++++++++++++++++
 ...makefile-adjust-to-build-in-under-bitbake.patch | 25 ++++++------
 .../ovmf/ovmf/no-stack-protector-all-archs.patch   | 19 +++++++++
 meta/recipes-core/ovmf/ovmf_git.bb                 |  6 ++-
 5 files changed, 72 insertions(+), 60 deletions(-)
 delete mode 100644 meta/recipes-core/ovmf/ovmf/0001-MdeModulePkg-UefiHiiLib-Fix-incorrect-comparison-exp.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/0001-ia32-Dont-use-pie.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/no-stack-protector-all-archs.patch

diff --git a/meta/recipes-core/ovmf/ovmf/0001-MdeModulePkg-UefiHiiLib-Fix-incorrect-comparison-exp.patch b/meta/recipes-core/ovmf/ovmf/0001-MdeModulePkg-UefiHiiLib-Fix-incorrect-comparison-exp.patch
deleted file mode 100644
index 0529a27b16..0000000000
--- a/meta/recipes-core/ovmf/ovmf/0001-MdeModulePkg-UefiHiiLib-Fix-incorrect-comparison-exp.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 73692710d50da1f421b0e6ddff784ca3135389b3 Mon Sep 17 00:00:00 2001
-From: Dandan Bi <dandan.bi@intel.com>
-Date: Sat, 1 Apr 2017 10:31:14 +0800
-Subject: [PATCH] MdeModulePkg/UefiHiiLib:Fix incorrect comparison expression
-
-Fix the incorrect comparison between pointer and constant zero character.
-
-https://bugzilla.tianocore.org/show_bug.cgi?id=416
-
-V2: The pointer StringPtr points to a string returned
-by ExtractConfig/ExportConfig, if it is NULL, function
-InternalHiiIfrValueAction will return FALSE. So in
-current usage model, the StringPtr can not be NULL before
-using it, so we can add ASSERT here.
-
-Cc: Eric Dong <eric.dong@intel.com>
-Cc: Liming Gao <liming.gao@intel.com>
-Contributed-under: TianoCore Contribution Agreement 1.0
-Signed-off-by: Dandan Bi <dandan.bi@intel.com>
-Reviewed-by: Eric Dong <eric.dong@intel.com>
----
-Upstream-Status: Backport
-
- MdeModulePkg/Library/UefiHiiLib/HiiLib.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/MdeModulePkg/Library/UefiHiiLib/HiiLib.c b/MdeModulePkg/Library/UefiHiiLib/HiiLib.c
-index 8579501..46ca7bc 100644
---- a/MdeModulePkg/Library/UefiHiiLib/HiiLib.c
-+++ b/MdeModulePkg/Library/UefiHiiLib/HiiLib.c
-@@ -2180,8 +2180,9 @@ InternalHiiIfrValueAction (
-   }
-   
-   StringPtr = ConfigAltResp;
--  
--  while (StringPtr != L'\0') {
-+  ASSERT (StringPtr != NULL);
-+
-+  while (*StringPtr != L'\0') {
-     //
-     // 1. Find <ConfigHdr> GUID=...&NAME=...&PATH=...
-     //
--- 
-1.9.1
-
diff --git a/meta/recipes-core/ovmf/ovmf/0001-ia32-Dont-use-pie.patch b/meta/recipes-core/ovmf/ovmf/0001-ia32-Dont-use-pie.patch
new file mode 100644
index 0000000000..7ce20be54c
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/0001-ia32-Dont-use-pie.patch
@@ -0,0 +1,37 @@
+From f65e9cc025278387b494c2383c5d9ff3bed98687 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 11 Jun 2017 00:47:24 -0700
+Subject: [PATCH] ia32: Dont use -pie
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ BaseTools/Conf/tools_def.template | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/BaseTools/Conf/tools_def.template b/BaseTools/Conf/tools_def.template
+index 04a1bcb210..84c5f84f93 100755
+--- a/BaseTools/Conf/tools_def.template
++++ b/BaseTools/Conf/tools_def.template
+@@ -4336,7 +4336,7 @@ RELEASE_*_*_OBJCOPY_ADDDEBUGFLAG   =
+ NOOPT_*_*_OBJCOPY_ADDDEBUGFLAG     = --add-gnu-debuglink=$(DEBUG_DIR)/$(MODULE_NAME).debug
+ 
+ DEFINE GCC_ALL_CC_FLAGS            = -g -Os -fshort-wchar -fno-builtin -fno-strict-aliasing -Wall -Werror -Wno-array-bounds -include AutoGen.h -fno-common
+-DEFINE GCC_IA32_CC_FLAGS           = DEF(GCC_ALL_CC_FLAGS) -m32 -malign-double -freorder-blocks -freorder-blocks-and-partition -O2 -mno-stack-arg-probe
++DEFINE GCC_IA32_CC_FLAGS           = DEF(GCC_ALL_CC_FLAGS) -m32 -malign-double -freorder-blocks -freorder-blocks-and-partition -O2 -mno-stack-arg-probe -fno-PIE -no-pie
+ DEFINE GCC_X64_CC_FLAGS            = DEF(GCC_ALL_CC_FLAGS) -mno-red-zone -Wno-address -mno-stack-arg-probe
+ DEFINE GCC_IPF_CC_FLAGS            = DEF(GCC_ALL_CC_FLAGS) -minline-int-divide-min-latency
+ DEFINE GCC_ARM_CC_FLAGS            = DEF(GCC_ALL_CC_FLAGS) -mlittle-endian -mabi=aapcs -fno-short-enums -funsigned-char -ffunction-sections -fdata-sections -fomit-frame-pointer -Wno-address -mthumb -mfloat-abi=soft -fno-pic -fno-pie
+@@ -4369,7 +4369,7 @@ DEFINE GCC_ARM_RC_FLAGS            = -I binary -O elf32-littlearm     -B arm
+ DEFINE GCC_AARCH64_RC_FLAGS        = -I binary -O elf64-littleaarch64 -B aarch64 --rename-section .data=.hii
+ 
+ DEFINE GCC44_ALL_CC_FLAGS            = -g -fshort-wchar -fno-builtin -fno-strict-aliasing -Wall -Werror -Wno-array-bounds -ffunction-sections -fdata-sections -include AutoGen.h -fno-common -DSTRING_ARRAY_NAME=$(BASE_NAME)Strings
+-DEFINE GCC44_IA32_CC_FLAGS           = DEF(GCC44_ALL_CC_FLAGS) -m32 -march=i586 -malign-double -fno-stack-protector -D EFI32 -fno-asynchronous-unwind-tables
++DEFINE GCC44_IA32_CC_FLAGS           = DEF(GCC44_ALL_CC_FLAGS) -m32 -march=i586 -malign-double -fno-stack-protector -D EFI32 -fno-asynchronous-unwind-tables -fno-PIE -no-pie
+ DEFINE GCC44_X64_CC_FLAGS            = DEF(GCC44_ALL_CC_FLAGS) -m64 -fno-stack-protector "-DEFIAPI=__attribute__((ms_abi))" -maccumulate-outgoing-args -mno-red-zone -Wno-address -mcmodel=small -fpie -fno-asynchronous-unwind-tables
+ DEFINE GCC44_IA32_X64_DLINK_COMMON   = -nostdlib -Wl,-n,-q,--gc-sections -z common-page-size=0x20
+ DEFINE GCC44_IA32_X64_ASLDLINK_FLAGS = DEF(GCC44_IA32_X64_DLINK_COMMON) -Wl,--entry,ReferenceAcpiTable -u ReferenceAcpiTable
+-- 
+2.13.1
+
diff --git a/meta/recipes-core/ovmf/ovmf/0003-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch b/meta/recipes-core/ovmf/ovmf/0003-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch
index 0fdc278ce2..1f8332ef56 100644
--- a/meta/recipes-core/ovmf/ovmf/0003-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch
+++ b/meta/recipes-core/ovmf/ovmf/0003-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch
@@ -11,29 +11,28 @@ Signed-off-by: Ricardo Neri <ricardo.neri@linux.intel.com>
  BaseTools/Source/C/Makefiles/header.makefile | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
 
-diff --git a/BaseTools/Source/C/Makefiles/header.makefile b/BaseTools/Source/C/Makefiles/header.makefile
-index 821d114..fe0f08b 100644
---- a/BaseTools/Source/C/Makefiles/header.makefile
-+++ b/BaseTools/Source/C/Makefiles/header.makefile
-@@ -44,14 +44,14 @@ ARCH_INCLUDE = -I $(MAKEROOT)/Include/AArch64/
+Index: git/BaseTools/Source/C/Makefiles/header.makefile
+===================================================================
+--- git.orig/BaseTools/Source/C/Makefiles/header.makefile
++++ git/BaseTools/Source/C/Makefiles/header.makefile
+@@ -44,15 +44,15 @@ ARCH_INCLUDE = -I $(MAKEROOT)/Include/AA
  endif
  
  INCLUDE = $(TOOL_INCLUDE) -I $(MAKEROOT) -I $(MAKEROOT)/Include/Common -I $(MAKEROOT)/Include/ -I $(MAKEROOT)/Include/IndustryStandard -I $(MAKEROOT)/Common/ -I .. -I . $(ARCH_INCLUDE) 
 -BUILD_CPPFLAGS = $(INCLUDE) -O2
-+BUILD_CPPFLAGS := $(BUILD_CPPFLAGS) $(INCLUDE) -O2
++BUILD_CPPFLAGS += $(INCLUDE) -O2
  ifeq ($(DARWIN),Darwin)
  # assume clang or clang compatible flags on OS X
 -BUILD_CFLAGS = -MD -fshort-wchar -fno-strict-aliasing -Wall -Werror -Wno-deprecated-declarations -Wno-self-assign -Wno-unused-result -nostdlib -c -g
-+BUILD_CFLAGS := $(BUILD_CFLAGS) -MD -fshort-wchar -fno-strict-aliasing -Wall -Werror -Wno-deprecated-declarations -Wno-self-assign -Wno-unused-result -nostdlib -c -g
++BUILD_CFLAGS += -MD -fshort-wchar -fno-strict-aliasing -Wall -Werror -Wno-deprecated-declarations -Wno-self-assign -Wno-unused-result -nostdlib -c -g
  else
 -BUILD_CFLAGS = -MD -fshort-wchar -fno-strict-aliasing -Wall -Werror -Wno-deprecated-declarations -Wno-unused-result -nostdlib -c -g
-+BUILD_CFLAGS := $(BUILD_CFLAGS) -MD -fshort-wchar -fno-strict-aliasing -Wall -Werror -Wno-deprecated-declarations -Wno-unused-result -nostdlib -c -g
++BUILD_CFLAGS += -MD -fshort-wchar -fno-strict-aliasing -Wall -Werror -Wno-deprecated-declarations -Wno-unused-result -nostdlib -c -g
  endif
 -BUILD_LFLAGS =
-+BUILD_LFLAGS := $(LDFLAGS)
- BUILD_CXXFLAGS =
+-BUILD_CXXFLAGS = -Wno-unused-result
++BUILD_LFLAGS = $(LDFLAGS)
++BUILD_CXXFLAGS += -Wno-unused-result
  
  ifeq ($(ARCH), IA32)
--- 
-2.9.3
-
+ #
diff --git a/meta/recipes-core/ovmf/ovmf/no-stack-protector-all-archs.patch b/meta/recipes-core/ovmf/ovmf/no-stack-protector-all-archs.patch
new file mode 100644
index 0000000000..25a09c5ce3
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/no-stack-protector-all-archs.patch
@@ -0,0 +1,19 @@
+Author: Steve Langasek <steve.langasek@ubuntu.com>
+Description: pass -fno-stack-protector to all GCC toolchains
+ The upstream build rules inexplicably pass -fno-stack-protector only
+ when building for i386 and amd64.  Add this essential argument to the
+ generic rules for gcc 4.4 and later.
+Last-Updated: 2016-04-12
+Index: git/BaseTools/Conf/tools_def.template
+===================================================================
+--- git.orig/BaseTools/Conf/tools_def.template
++++ git/BaseTools/Conf/tools_def.template
+@@ -4368,7 +4368,7 @@ DEFINE GCC_IPF_RC_FLAGS            = -I
+ DEFINE GCC_ARM_RC_FLAGS            = -I binary -O elf32-littlearm     -B arm     --rename-section .data=.hii
+ DEFINE GCC_AARCH64_RC_FLAGS        = -I binary -O elf64-littleaarch64 -B aarch64 --rename-section .data=.hii
+ 
+-DEFINE GCC44_ALL_CC_FLAGS            = -g -fshort-wchar -fno-builtin -fno-strict-aliasing -Wall -Werror -Wno-array-bounds -ffunction-sections -fdata-sections -include AutoGen.h -fno-common -DSTRING_ARRAY_NAME=$(BASE_NAME)Strings
++DEFINE GCC44_ALL_CC_FLAGS            = -g -fshort-wchar -fno-builtin -fno-strict-aliasing -Wall -Werror -Wno-array-bounds -ffunction-sections -fdata-sections -fno-stack-protector -include AutoGen.h -fno-common -DSTRING_ARRAY_NAME=$(BASE_NAME)Strings
+ DEFINE GCC44_IA32_CC_FLAGS           = DEF(GCC44_ALL_CC_FLAGS) -m32 -march=i586 -malign-double -fno-stack-protector -D EFI32 -fno-asynchronous-unwind-tables -fno-PIE -no-pie
+ DEFINE GCC44_X64_CC_FLAGS            = DEF(GCC44_ALL_CC_FLAGS) -m64 -fno-stack-protector "-DEFIAPI=__attribute__((ms_abi))" -maccumulate-outgoing-args -mno-red-zone -Wno-address -mcmodel=small -fpie -fno-asynchronous-unwind-tables
+ DEFINE GCC44_IA32_X64_DLINK_COMMON   = -nostdlib -Wl,-n,-q,--gc-sections -z common-page-size=0x20
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 9d988e9d41..5d7216e80e 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -14,7 +14,8 @@ SRC_URI = "git://github.com/tianocore/edk2.git;branch=master \
 	file://0002-ovmf-update-path-to-native-BaseTools.patch \
 	file://0003-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch \
 	file://VfrCompile-increase-path-length-limit.patch \
-        file://0001-MdeModulePkg-UefiHiiLib-Fix-incorrect-comparison-exp.patch \
+	file://0001-ia32-Dont-use-pie.patch \
+	file://no-stack-protector-all-archs.patch \
         "
 
 SRC_URI_append_class-target = " \
@@ -22,7 +23,7 @@ SRC_URI_append_class-target = " \
 	file://0007-OvmfPkg-EnrollDefaultKeys-application-for-enrolling-.patch \
 "
 
-SRCREV="4575a602ca6072ee9d04150b38bfb143cbff8588"
+SRCREV="ec4910cd3336565fdb61dafdd9ec4ae7a6160ba3"
 SRC_URI[openssl.md5sum] = "96322138f0b69e61b7212bc53d5e912b"
 SRC_URI[openssl.sha256sum] = "e7aff292be21c259c6af26469c7a9b3ba26e9abaaffd325e3dccc9785256c431"
 
@@ -241,3 +242,4 @@ do_deploy_class-target() {
 addtask do_deploy after do_compile before do_build
 
 BBCLASSEXTEND = "native"
+TOOLCHAIN = "gcc"
-- 
2.13.1


