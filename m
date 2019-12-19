Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0B93B7FC2F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 13:23:11 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id b6so6001712wrq.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 05:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Q/7VFwiZiqxE/eNpyRF7l/He+ut2YCeJeAwUUCtTZ4k=;
	b=RXgwv4/8wBiO26jS0R0qAWor21GI75oogZKdOa24XzglwVWDHlexTEwvIXpWg5GH6W
	JwMCnYisYUhqWKfhYET7HR7aAXCf30CGLcrAl81wiSh4dRcYmpHDvalqCn46g7SSIM/J
	5TPgr7xADbKvW7Vc+BEUWgD6H9sFq+AsMsXWrUShvinD4uCq1lgm0bqUqozJGhrSZ3LZ
	405a9f5OI1OCOZskMDb4dKTnsivSJ27kYizd+nRMu5HCGVdvXzHn0wrjzResSkFvz3xX
	K8Oo51DdHHeljpQuGR0bOePL/ySytM/K0E3uvgK8njNOO0w8McGVmmnibbXgT72Wrzxi
	C99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Q/7VFwiZiqxE/eNpyRF7l/He+ut2YCeJeAwUUCtTZ4k=;
	b=cAnOor+kU9PB1fiUkOWmJ+asFkEpfT/g9yXtc7vlKO/rkJuriRlwn5VZswbPY4UaKz
	VZWhimVFwVl6GyX0WD4P6L3xcMVAUEx8qKCCY9aEDIZCqJdt9EryETTX+758t5bhb3yQ
	0h7zuuYoeHSFhKmiBI3zf0mCznBt2tstC9OOr2zrZsFZclbU/HlzqY8k+0EzFS9DKFBl
	3QnfeC7PUVw04360GoWKtxTz/mhW0N2BoY0zIxJLlloNcgHCxpJpRuHf6TGhszYf16Qj
	/zMCugTgBP1aW1nv5dLLoc43nofr2VkU9AyDBi4HFGRacMTHdp6bRoam7txSfCIQ11wb
	q3gg==
X-Gm-Message-State: APjAAAVyFIjtVXUdT8ybfFdQpu9hZjpvf3mvGzQWWChYYRGOTOPQQuY+
	NIGP4WB5TYuPhDyBINEebg6TjAJaggI=
X-Google-Smtp-Source: APXvYqxIymnPeOQJLZgFlgnbMfTqQLupuIKU2+itmUa+eRx1wKcb3+V0j34T/xEG2+3XsMGgFU5NzA==
X-Received: by 2002:a5d:630c:: with SMTP id i12mr9338039wru.350.1576761792074; 
	Thu, 19 Dec 2019 05:23:12 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id f17sm6182584wmc.8.2019.12.19.05.23.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Dec 2019 05:23:09 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Dec 2019 14:22:48 +0100
Message-Id: <20191219132301.80034-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191219132301.80034-1-alex.kanavin@gmail.com>
References: <20191219132301.80034-1-alex.kanavin@gmail.com>
Subject: [PATCH 03/16] ovmf: update to 201911
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
X-List-Received-Date: Thu, 19 Dec 2019 13:23:12 -0000

Remove unused patch.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...vmf-update-path-to-native-BaseTools.patch} | 11 ++++---
 ...le-adjust-to-build-in-under-bitbake.patch} | 17 +++++-----
 ... => 0003-ovmf-enable-long-path-file.patch} | 18 +++++++---
 ...patch => 0004-ovmf-Update-to-latest.patch} | 26 +++++++++++----
 ...frCompile-increase-path-length-limit.patch | 33 -------------------
 meta/recipes-core/ovmf/ovmf_git.bb            | 12 +++----
 6 files changed, 54 insertions(+), 63 deletions(-)
 rename meta/recipes-core/ovmf/ovmf/{0002-ovmf-update-path-to-native-BaseTools.patch => 0001-ovmf-update-path-to-native-BaseTools.patch} (84%)
 rename meta/recipes-core/ovmf/ovmf/{0003-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch => 0002-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch} (75%)
 rename meta/recipes-core/ovmf/ovmf/{0004-ovmf-enable-long-path-file.patch => 0003-ovmf-enable-long-path-file.patch} (54%)
 rename meta/recipes-core/ovmf/ovmf/{no-stack-protector-all-archs.patch => 0004-ovmf-Update-to-latest.patch} (82%)
 delete mode 100644 meta/recipes-core/ovmf/ovmf/VfrCompile-increase-path-length-limit.patch

diff --git a/meta/recipes-core/ovmf/ovmf/0002-ovmf-update-path-to-native-BaseTools.patch b/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools.patch
similarity index 84%
rename from meta/recipes-core/ovmf/ovmf/0002-ovmf-update-path-to-native-BaseTools.patch
rename to meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools.patch
index 94ae5d4496e..6ecb23b29f4 100644
--- a/meta/recipes-core/ovmf/ovmf/0002-ovmf-update-path-to-native-BaseTools.patch
+++ b/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools.patch
@@ -1,7 +1,7 @@
-From 9e632e3f9edd09632cc877dff6ea57608f979aab Mon Sep 17 00:00:00 2001
+From 0a8362cfb9f00870d70687475665b131dd82c947 Mon Sep 17 00:00:00 2001
 From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
 Date: Thu, 9 Jun 2016 02:23:01 -0700
-Subject: [PATCH] ovmf: update path to native BaseTools
+Subject: [PATCH 1/5] ovmf: update path to native BaseTools
 
 BaseTools is a set of utilities to build EDK-based firmware. These utilities
 are used during the build process. Thus, they need to be built natively.
@@ -11,15 +11,16 @@ with the appropriate location before building.
 
 Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
 Upstream-Status: Pending
+
 ---
  OvmfPkg/build.sh | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/OvmfPkg/build.sh b/OvmfPkg/build.sh
-index eb5eb73..9058fca 100755
+index 91b1442ade..1858dae31a 100755
 --- a/OvmfPkg/build.sh
 +++ b/OvmfPkg/build.sh
-@@ -30,7 +30,7 @@ then
+@@ -24,7 +24,7 @@ then
  # this assumes svn pulls have the same root dir
  #  export EDK_TOOLS_PATH=`pwd`/../BaseTools
  # This version is for the tools source in edk2
@@ -29,5 +30,5 @@ index eb5eb73..9058fca 100755
    source edksetup.sh BaseTools
  else
 -- 
-2.8.1
+2.17.1
 
diff --git a/meta/recipes-core/ovmf/ovmf/0003-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch b/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch
similarity index 75%
rename from meta/recipes-core/ovmf/ovmf/0003-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch
rename to meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch
index 070b0ac5a61..f37ed018abd 100644
--- a/meta/recipes-core/ovmf/ovmf/0003-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch
+++ b/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch
@@ -1,25 +1,26 @@
-From 2320650c6d381b914fe91b2dedaa5870279a8bcf Mon Sep 17 00:00:00 2001
+From a8bceaec1b16fffbf6810df05503d8ae9092b735 Mon Sep 17 00:00:00 2001
 From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
 Date: Fri, 26 Jul 2019 17:34:26 -0400
-Subject: [PATCH] BaseTools: makefile: adjust to build in under bitbake
+Subject: [PATCH 2/5] BaseTools: makefile: adjust to build in under bitbake
 
 Prepend the build flags with those of bitbake. This is to build
 using the bitbake native sysroot include and library directories.
 
 Signed-off-by: Ricardo Neri <ricardo.neri@linux.intel.com>
 Upstream-Status: Pending
+
 ---
  BaseTools/Source/C/Makefiles/header.makefile | 10 +++++-----
  1 file changed, 5 insertions(+), 5 deletions(-)
 
-Index: git/BaseTools/Source/C/Makefiles/header.makefile
-===================================================================
---- git.orig/BaseTools/Source/C/Makefiles/header.makefile
-+++ git/BaseTools/Source/C/Makefiles/header.makefile
+diff --git a/BaseTools/Source/C/Makefiles/header.makefile b/BaseTools/Source/C/Makefiles/header.makefile
+index 4e9b36d98b..eb03ee33fa 100644
+--- a/BaseTools/Source/C/Makefiles/header.makefile
++++ b/BaseTools/Source/C/Makefiles/header.makefile
 @@ -62,23 +62,23 @@ $(error Bad HOST_ARCH)
  endif
  
- INCLUDE = $(TOOL_INCLUDE) -I $(MAKEROOT) -I $(MAKEROOT)/Include/Common -I $(MAKEROOT)/Include/ -I $(MAKEROOT)/Include/IndustryStandard -I $(MAKEROOT)/Common/ -I .. -I . $(ARCH_INCLUDE) 
+ INCLUDE = $(TOOL_INCLUDE) -I $(MAKEROOT) -I $(MAKEROOT)/Include/Common -I $(MAKEROOT)/Include/ -I $(MAKEROOT)/Include/IndustryStandard -I $(MAKEROOT)/Common/ -I .. -I . $(ARCH_INCLUDE)
 -BUILD_CPPFLAGS = $(INCLUDE)
 +BUILD_CPPFLAGS += $(INCLUDE)
  
@@ -46,5 +47,5 @@ Index: git/BaseTools/Source/C/Makefiles/header.makefile
  ifeq ($(HOST_ARCH), IA32)
  #
 -- 
-2.20.1
+2.17.1
 
diff --git a/meta/recipes-core/ovmf/ovmf/0004-ovmf-enable-long-path-file.patch b/meta/recipes-core/ovmf/ovmf/0003-ovmf-enable-long-path-file.patch
similarity index 54%
rename from meta/recipes-core/ovmf/ovmf/0004-ovmf-enable-long-path-file.patch
rename to meta/recipes-core/ovmf/ovmf/0003-ovmf-enable-long-path-file.patch
index d954fbe3140..ab1e7db31f5 100644
--- a/meta/recipes-core/ovmf/ovmf/0004-ovmf-enable-long-path-file.patch
+++ b/meta/recipes-core/ovmf/ovmf/0003-ovmf-enable-long-path-file.patch
@@ -1,18 +1,28 @@
-From 032fc6b1f7691bd537fd2a6bd13821fcf3c45e64 Mon Sep 17 00:00:00 2001
+From 60a5f953f747e1e9e05a40157b651cba8ea57b91 Mon Sep 17 00:00:00 2001
 From: Dengke Du <dengke.du@windriver.com>
 Date: Mon, 11 Sep 2017 02:21:55 -0400
-Subject: [PATCH] ovmf: enable long path file
+Subject: [PATCH 3/5] ovmf: enable long path file
 
 Upstream-Status: Pending
 Signed-off-by: Dengke Du <dengke.du@windriver.com>
+
 ---
  BaseTools/Source/C/Common/CommonLib.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/BaseTools/Source/C/Common/CommonLib.h b/BaseTools/Source/C/Common/CommonLib.h
-index 2041b89e2d..8116aa2e35 100644
+index e1cce985f7..d67d03c70c 100644
 --- a/BaseTools/Source/C/Common/CommonLib.h
 +++ b/BaseTools/Source/C/Common/CommonLib.h
-@@ -22 +22 @@ WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.
+@@ -14,7 +14,7 @@ SPDX-License-Identifier: BSD-2-Clause-Patent
+ #include <assert.h>
+ #define PRINTED_GUID_BUFFER_SIZE  37  // including null-termination
+ 
 -#define MAX_LONG_FILE_PATH 500
 +#define MAX_LONG_FILE_PATH 1023
+ 
+ #define MAX_UINT64 ((UINT64)0xFFFFFFFFFFFFFFFFULL)
+ #define MAX_UINT32 ((UINT32)0xFFFFFFFF)
+-- 
+2.17.1
+
diff --git a/meta/recipes-core/ovmf/ovmf/no-stack-protector-all-archs.patch b/meta/recipes-core/ovmf/ovmf/0004-ovmf-Update-to-latest.patch
similarity index 82%
rename from meta/recipes-core/ovmf/ovmf/no-stack-protector-all-archs.patch
rename to meta/recipes-core/ovmf/ovmf/0004-ovmf-Update-to-latest.patch
index 1b65348e844..c10a39d95d4 100644
--- a/meta/recipes-core/ovmf/ovmf/no-stack-protector-all-archs.patch
+++ b/meta/recipes-core/ovmf/ovmf/0004-ovmf-Update-to-latest.patch
@@ -1,15 +1,24 @@
-Author: Steve Langasek <steve.langasek@ubuntu.com>
+From 94eff316b31b4d0348af28c77be5c00bc09fe8e7 Mon Sep 17 00:00:00 2001
+From: Steve Langasek <steve.langasek@ubuntu.com>
+Date: Sat, 10 Jun 2017 01:39:36 -0700
+Subject: [PATCH 4/5] ovmf: Update to latest
+
 Description: pass -fno-stack-protector to all GCC toolchains
  The upstream build rules inexplicably pass -fno-stack-protector only
  when building for i386 and amd64.  Add this essential argument to the
  generic rules for gcc 4.4 and later.
 Last-Updated: 2016-04-12
 Upstream-Status: Pending
-Index: git/BaseTools/Conf/tools_def.template
-===================================================================
---- git.orig/BaseTools/Conf/tools_def.template
-+++ git/BaseTools/Conf/tools_def.template
-@@ -1736,10 +1736,10 @@ DEFINE GCC_X64_RC_FLAGS            = -I binary -O elf64-x86-64        -B i386
+
+---
+ BaseTools/Conf/tools_def.template | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/BaseTools/Conf/tools_def.template b/BaseTools/Conf/tools_def.template
+index ca0b122dbb..b0066c2ab8 100755
+--- a/BaseTools/Conf/tools_def.template
++++ b/BaseTools/Conf/tools_def.template
+@@ -1941,10 +1941,10 @@ DEFINE GCC_X64_RC_FLAGS            = -I binary -O elf64-x86-64        -B i386
  DEFINE GCC_ARM_RC_FLAGS            = -I binary -O elf32-littlearm     -B arm     --rename-section .data=.hii
  DEFINE GCC_AARCH64_RC_FLAGS        = -I binary -O elf64-littleaarch64 -B aarch64 --rename-section .data=.hii
  
@@ -23,7 +32,7 @@ Index: git/BaseTools/Conf/tools_def.template
  DEFINE GCC48_IA32_X64_ASLDLINK_FLAGS = DEF(GCC48_IA32_X64_DLINK_COMMON) -Wl,--entry,ReferenceAcpiTable -u ReferenceAcpiTable
  DEFINE GCC48_IA32_X64_DLINK_FLAGS    = DEF(GCC48_IA32_X64_DLINK_COMMON) -Wl,--entry,$(IMAGE_ENTRY_POINT) -u $(IMAGE_ENTRY_POINT) -Wl,-Map,$(DEST_DIR_DEBUG)/$(BASE_NAME).map,--whole-archive
  DEFINE GCC48_IA32_DLINK2_FLAGS       = -Wl,--defsym=PECOFF_HEADER_SIZE=0x220 DEF(GCC_DLINK2_FLAGS_COMMON)
-@@ -1748,7 +1748,7 @@ DEFINE GCC48_X64_DLINK2_FLAGS        = -Wl,--defsym=PECOFF_HEADER_SIZE=0x228 DEF
+@@ -1953,7 +1953,7 @@ DEFINE GCC48_X64_DLINK2_FLAGS        = -Wl,--defsym=PECOFF_HEADER_SIZE=0x228 DEF
  DEFINE GCC48_ASM_FLAGS               = DEF(GCC_ASM_FLAGS)
  DEFINE GCC48_ARM_ASM_FLAGS           = $(ARCHASM_FLAGS) $(PLATFORM_FLAGS) DEF(GCC_ASM_FLAGS) -mlittle-endian
  DEFINE GCC48_AARCH64_ASM_FLAGS       = $(ARCHASM_FLAGS) $(PLATFORM_FLAGS) DEF(GCC_ASM_FLAGS) -mlittle-endian
@@ -32,3 +41,6 @@ Index: git/BaseTools/Conf/tools_def.template
  DEFINE GCC48_ARM_CC_XIPFLAGS         = DEF(GCC_ARM_CC_XIPFLAGS)
  DEFINE GCC48_AARCH64_CC_FLAGS        = $(ARCHCC_FLAGS) $(PLATFORM_FLAGS) -mcmodel=large DEF(GCC_AARCH64_CC_FLAGS)
  DEFINE GCC48_AARCH64_CC_XIPFLAGS     = DEF(GCC_AARCH64_CC_XIPFLAGS)
+-- 
+2.17.1
+
diff --git a/meta/recipes-core/ovmf/ovmf/VfrCompile-increase-path-length-limit.patch b/meta/recipes-core/ovmf/ovmf/VfrCompile-increase-path-length-limit.patch
deleted file mode 100644
index bb12d8beba6..00000000000
--- a/meta/recipes-core/ovmf/ovmf/VfrCompile-increase-path-length-limit.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From c7722d10c7bcf6be0adcf54abb1d406599dd7914 Mon Sep 17 00:00:00 2001
-From: Patrick Ohly <patrick.ohly@intel.com>
-Date: Fri, 24 Feb 2017 01:40:02 +0100
-Subject: [PATCH] VfrCompile: increase path length limit
-
-The VfrCompile tool has a hard-coded maximum length for path names
-which turned out to be too small by around 20 characters in the Yocto
-autobuilder setup. Increasing the maximum by a factor of 4 is
-relatively easy and makes the problem less likely.
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
----
- BaseTools/Source/C/VfrCompile/EfiVfr.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/BaseTools/Source/C/VfrCompile/EfiVfr.h b/BaseTools/Source/C/VfrCompile/EfiVfr.h
-index d187902..9ad4a7b 100644
---- a/BaseTools/Source/C/VfrCompile/EfiVfr.h
-+++ b/BaseTools/Source/C/VfrCompile/EfiVfr.h
-@@ -19,7 +19,7 @@ WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.
- #include "Common/UefiInternalFormRepresentation.h"
- #include "Common/MdeModuleHii.h"
- 
--#define MAX_PATH                 255
-+#define MAX_PATH                 1023
- #define MAX_VFR_LINE_LEN         4096
- 
- #define EFI_IFR_MAX_LENGTH       0xFF
--- 
-2.1.4
-
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index ff2b2a530ad..9667fa0c862 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -13,14 +13,14 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[secureboot] = ",,,"
 
 SRC_URI = "gitsm://github.com/tianocore/edk2.git;branch=master;protocol=git \
-	file://0002-ovmf-update-path-to-native-BaseTools.patch \
-	file://0003-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch \
-	file://0004-ovmf-enable-long-path-file.patch \
-	file://no-stack-protector-all-archs.patch \
+           file://0001-ovmf-update-path-to-native-BaseTools.patch \
+           file://0002-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch \
+           file://0003-ovmf-enable-long-path-file.patch \
+           file://0004-ovmf-Update-to-latest.patch \
         "
 
-PV = "edk2-stable201905"
-SRCREV="20d2e5a125e34fc8501026613a71549b2a1a3e54"
+PV = "edk2-stable201911"
+SRCREV = "bd85bf54c268204c7a698a96f3ccd96cd77952cd"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>edk2-stable.*)"
 
 inherit deploy
-- 
2.17.1


