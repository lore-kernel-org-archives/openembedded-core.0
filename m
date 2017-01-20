Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id C1F33731CF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 14:13:11 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id 203so20818968ith.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 06:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eyvhS6oDSPJ+SlvOTIxoooC6owLgQYujPlbH/6Mj7hM=;
	b=DUBOL8hievSGq3R88M/14knlyvJ44JKh69JdgwciRn/6sJu0isVCZ3wIjdzwSAk6+4
	UwaQGkBdUkV+uwXU92cqVuDS8SARrFgLLYB7x7SM+q3hjgLToj3Pe9fsXeTQjKKY+J3P
	tdkfqnKVh71X6h4jSyk7CLIXvb0Wc5XThvb7BiJP0fA76gM8GyjhYQcEa2b2cl3GaBWp
	4sQOAOfiR3n6zTsnF4EUuX5ST8cla1cUvMlJeyc06vcgmr104Io9XDllmE4I8U1vM8Zg
	eQjY4P6TxKhcLdolepmDUsr6HYtKZ+9A/IyhkU0Vf2Fa59aXtjU/BZy5VhfV/qr8eTk+
	Kj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=eyvhS6oDSPJ+SlvOTIxoooC6owLgQYujPlbH/6Mj7hM=;
	b=WUP4sN2pu9StSSIqUuOqsMtlh18mJmuWKs9trbbxOfUNXHAKsaBd/KdxnhCQXE0m3R
	VvQZhH3E/L92KBxR6qXTgYBAqEMQhqdAZG0iTDc2FFLXFj2hTe/vqt6axOM2G1QZqxP+
	swq4QNgzCiWeZ6i8vG4VI/C5Y0SYolIOKipgaybb+9qzeyaRLtxBNY4iQ0JrRlNvNHRM
	tCEEKsb6z2+XPFFAr72c68S21Lj158vNHwHVlKmUL/V1pWAL3VlTMwe4Hj9GRHiZzmaV
	KZLvP/kRKALZJQlxuiGMclt7/5NbEO61N2kTIluoIXe8OMRlH8Olck5b45/M4+HJ6p2G
	96lA==
X-Gm-Message-State: AIkVDXKiTYQSx9gpRZ0dEFqtYDWeeU47xkkKGBG8quY0v+UNGBF3w5Oe6ubXfG16WGQd6ASK
X-Received: by 10.36.25.143 with SMTP id b137mr3771956itb.54.1484921591183;
	Fri, 20 Jan 2017 06:13:11 -0800 (PST)
Received: from pohly-desktop.fritz.box (p57A56DD5.dip0.t-ipconnect.de.
	[87.165.109.213])
	by smtp.gmail.com with ESMTPSA id k6sm4573464ioe.1.2017.01.20.06.13.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 Jan 2017 06:13:09 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 15:12:34 +0100
Message-Id: <cb8f971b4cb03c90f6459374609be3dce53f2ab1.1484921498.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.bbc01c1227afdba3edc41dc7d7356f56e51be400.1484921498.git-series.patrick.ohly@intel.com>
References: <cover.bbc01c1227afdba3edc41dc7d7356f56e51be400.1484921498.git-series.patrick.ohly@intel.com>
Subject: [PATCH v4 03/12] ovmf: move from meta-luv to OE-core
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
X-List-Received-Date: Fri, 20 Jan 2017 14:13:13 -0000

From: meta-luv <luv@lists.01.org>

This is an unmodified copy of
github.com/01org/luv-yocto/meta-luv/recipes-core/ovmf revision
4be4329.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-core/ovmf/ovmf/0001-BaseTools-Force-tools-variables-to-host-toolchain.patch   |  48 +++++++++++++++++++++++++++++-
 meta/recipes-core/ovmf/ovmf/0001-OvmfPkg-Enable-BGRT-in-OVMF.patch                         | 110 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 meta/recipes-core/ovmf/ovmf/0002-ovmf-update-path-to-native-BaseTools.patch                |  32 +++++++++++++++++++-
 meta/recipes-core/ovmf/ovmf/0003-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch |  39 +++++++++++++++++++++++-
 meta/recipes-core/ovmf/ovmf_git.bb                                                         | 121 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 5 files changed, 350 insertions(+)
 create mode 100644 meta/recipes-core/ovmf/ovmf/0001-BaseTools-Force-tools-variables-to-host-toolchain.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/0001-OvmfPkg-Enable-BGRT-in-OVMF.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/0002-ovmf-update-path-to-native-BaseTools.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/0003-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf_git.bb

diff --git a/meta/recipes-core/ovmf/ovmf/0001-BaseTools-Force-tools-variables-to-host-toolchain.patch b/meta/recipes-core/ovmf/ovmf/0001-BaseTools-Force-tools-variables-to-host-toolchain.patch
new file mode 100644
index 0000000..644b99d
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/0001-BaseTools-Force-tools-variables-to-host-toolchain.patch
@@ -0,0 +1,48 @@
+From 6e24bde1979c2d7149b37d142fb882dfde0e9770 Mon Sep 17 00:00:00 2001
+From: Matt Fleming <matt.fleming@intel.com>
+Date: Fri, 27 Jun 2014 11:12:18 +0100
+Subject: [PATCH] BaseTools: Force tools variables to host toolchain
+
+Signed-off-by: Matt Fleming <matt.fleming@intel.com>
+---
+ BaseTools/Source/C/Makefiles/app.makefile | 7 +++++++
+ BaseTools/Source/C/VfrCompile/GNUmakefile | 5 +++++
+ 2 files changed, 12 insertions(+)
+
+diff --git a/BaseTools/Source/C/Makefiles/app.makefile b/BaseTools/Source/C/Makefiles/app.makefile
+index 19269a1..62aad0f 100644
+--- a/BaseTools/Source/C/Makefiles/app.makefile
++++ b/BaseTools/Source/C/Makefiles/app.makefile
+@@ -16,6 +16,13 @@ include $(MAKEROOT)/Makefiles/header.makefile
+ 
+ APPLICATION = $(MAKEROOT)/bin/$(APPNAME)
+ 
++CC = gcc
++CXX = g++
++AS = gcc
++AR = ar
++LD = ld
++LINKER = $(CC)
++
+ .PHONY:all
+ all: $(MAKEROOT)/bin $(APPLICATION) 
+ 
+diff --git a/BaseTools/Source/C/VfrCompile/GNUmakefile b/BaseTools/Source/C/VfrCompile/GNUmakefile
+index 82005e1..5ac5f7e 100644
+--- a/BaseTools/Source/C/VfrCompile/GNUmakefile
++++ b/BaseTools/Source/C/VfrCompile/GNUmakefile
+@@ -26,6 +26,11 @@ OBJECTS = AParser.o DLexerBase.o ATokenBuffer.o EfiVfrParser.o VfrLexer.o VfrSyn
+ 
+ VFR_CPPFLAGS = -DPCCTS_USE_NAMESPACE_STD $(CPPFLAGS)
+ 
++CC = gcc
++CXX = g++
++AS = gcc
++AR = ar
++LD = ld
+ LINKER = $(BUILD_CXX)
+ 
+ EXTRA_CLEAN_OBJECTS = EfiVfrParser.cpp EfiVfrParser.h VfrParser.dlg VfrTokens.h VfrLexer.cpp VfrLexer.h VfrSyntax.cpp tokens.h
+-- 
+1.9.0
+
diff --git a/meta/recipes-core/ovmf/ovmf/0001-OvmfPkg-Enable-BGRT-in-OVMF.patch b/meta/recipes-core/ovmf/ovmf/0001-OvmfPkg-Enable-BGRT-in-OVMF.patch
new file mode 100644
index 0000000..4531a6d
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/0001-OvmfPkg-Enable-BGRT-in-OVMF.patch
@@ -0,0 +1,110 @@
+From 66a4020c3c2163aeffc9757851f33c346ecfd870 Mon Sep 17 00:00:00 2001
+From: Sai Praneeth Prakhya <sai.praneeth.prakhya@intel.com>
+Date: Mon, 4 Apr 2016 12:15:12 -0700
+Subject: [PATCH] OvmfPkg: Enable BGRT in OVMF
+
+By default, firmware (OVMF - Open source Virtual Machine Firmware)
+never publishes BGRT (Boot Graphics Resource Table) and in the boot
+process Linux kernel checks for this table and if it fails to find BGRT
+table then corresponding code in Linux kernel is not executed. EDK II
+(EFI Development Kit, thus OVMF) already has BGRT source code packaged
+into it but it is excluded from the build process of OVMF. These changes
+to build system of OVMF enables BGRT in 32-bit and 64-bit OVMF.
+
+There are only two files that need to be modified in order to do this.
+The first one being OvmfPkg*.dsc (this file describes the platform) and
+the second one being OvmfPkg*.fdf (this file describes firmware descriptor
+volume). A *.inf file (here "BootGraphicsResourceTableDxe.inf")
+describes a module (here BGRT). So, include
+"BootGraphicsResourceTableDxe.inf" file in "OvmfPkg*.dsc" so that BGRT
+source code will be compiled and "BootGraphicsResourceTableDxe.efi" file
+is generated and we should also include
+"BootGraphicsResourceTableDxe.inf" file in "OvmfPkg*.fdf" file so that
+"BootGraphicsResourceTableDxe.efi" will be placed in a firmware volume
+and thus gets published.
+
+Signed-off-by: Sai Praneeth Prakhya <sai.praneeth.prakhya@intel.com>
+---
+ OvmfPkg/OvmfPkgIa32.dsc    | 1 +
+ OvmfPkg/OvmfPkgIa32.fdf    | 1 +
+ OvmfPkg/OvmfPkgIa32X64.dsc | 1 +
+ OvmfPkg/OvmfPkgIa32X64.fdf | 1 +
+ OvmfPkg/OvmfPkgX64.dsc     | 1 +
+ OvmfPkg/OvmfPkgX64.fdf     | 1 +
+ 6 files changed, 6 insertions(+)
+
+diff --git a/OvmfPkg/OvmfPkgIa32.dsc b/OvmfPkg/OvmfPkgIa32.dsc
+index 9e5b477..0582219 100644
+--- a/OvmfPkg/OvmfPkgIa32.dsc
++++ b/OvmfPkg/OvmfPkgIa32.dsc
+@@ -647,6 +647,7 @@
+   OvmfPkg/AcpiS3SaveDxe/AcpiS3SaveDxe.inf
+   MdeModulePkg/Universal/Acpi/S3SaveStateDxe/S3SaveStateDxe.inf
+   MdeModulePkg/Universal/Acpi/BootScriptExecutorDxe/BootScriptExecutorDxe.inf
++  MdeModulePkg/Universal/Acpi/BootGraphicsResourceTableDxe/BootGraphicsResourceTableDxe.inf
+ 
+   #
+   # Network Support
+diff --git a/OvmfPkg/OvmfPkgIa32.fdf b/OvmfPkg/OvmfPkgIa32.fdf
+index fc203f2..f968cb7 100644
+--- a/OvmfPkg/OvmfPkgIa32.fdf
++++ b/OvmfPkg/OvmfPkgIa32.fdf
+@@ -274,6 +274,7 @@ INF  RuleOverride=ACPITABLE OvmfPkg/AcpiTables/AcpiTables.inf
+ INF  OvmfPkg/AcpiS3SaveDxe/AcpiS3SaveDxe.inf
+ INF  MdeModulePkg/Universal/Acpi/S3SaveStateDxe/S3SaveStateDxe.inf
+ INF  MdeModulePkg/Universal/Acpi/BootScriptExecutorDxe/BootScriptExecutorDxe.inf
++INF  MdeModulePkg/Universal/Acpi/BootGraphicsResourceTableDxe/BootGraphicsResourceTableDxe.inf
+ 
+ INF  RuleOverride = BINARY FatBinPkg/EnhancedFatDxe/Fat.inf
+ 
+diff --git a/OvmfPkg/OvmfPkgIa32X64.dsc b/OvmfPkg/OvmfPkgIa32X64.dsc
+index 6e4da4f..8289385 100644
+--- a/OvmfPkg/OvmfPkgIa32X64.dsc
++++ b/OvmfPkg/OvmfPkgIa32X64.dsc
+@@ -656,6 +656,7 @@
+   OvmfPkg/AcpiS3SaveDxe/AcpiS3SaveDxe.inf
+   MdeModulePkg/Universal/Acpi/S3SaveStateDxe/S3SaveStateDxe.inf
+   MdeModulePkg/Universal/Acpi/BootScriptExecutorDxe/BootScriptExecutorDxe.inf
++  MdeModulePkg/Universal/Acpi/BootGraphicsResourceTableDxe/BootGraphicsResourceTableDxe.inf
+ 
+   #
+   # Network Support
+diff --git a/OvmfPkg/OvmfPkgIa32X64.fdf b/OvmfPkg/OvmfPkgIa32X64.fdf
+index d3f46f3..282d40b 100644
+--- a/OvmfPkg/OvmfPkgIa32X64.fdf
++++ b/OvmfPkg/OvmfPkgIa32X64.fdf
+@@ -274,6 +274,7 @@ INF  RuleOverride=ACPITABLE OvmfPkg/AcpiTables/AcpiTables.inf
+ INF  OvmfPkg/AcpiS3SaveDxe/AcpiS3SaveDxe.inf
+ INF  MdeModulePkg/Universal/Acpi/S3SaveStateDxe/S3SaveStateDxe.inf
+ INF  MdeModulePkg/Universal/Acpi/BootScriptExecutorDxe/BootScriptExecutorDxe.inf
++INF  MdeModulePkg/Universal/Acpi/BootGraphicsResourceTableDxe/BootGraphicsResourceTableDxe.inf
+ 
+ INF  RuleOverride = BINARY USE = X64 FatBinPkg/EnhancedFatDxe/Fat.inf
+ 
+diff --git a/OvmfPkg/OvmfPkgX64.dsc b/OvmfPkg/OvmfPkgX64.dsc
+index 3d6d43e..0f956a7 100644
+--- a/OvmfPkg/OvmfPkgX64.dsc
++++ b/OvmfPkg/OvmfPkgX64.dsc
+@@ -654,6 +654,7 @@
+   OvmfPkg/AcpiS3SaveDxe/AcpiS3SaveDxe.inf
+   MdeModulePkg/Universal/Acpi/S3SaveStateDxe/S3SaveStateDxe.inf
+   MdeModulePkg/Universal/Acpi/BootScriptExecutorDxe/BootScriptExecutorDxe.inf
++  MdeModulePkg/Universal/Acpi/BootGraphicsResourceTableDxe/BootGraphicsResourceTableDxe.inf
+ 
+   #
+   # Network Support
+diff --git a/OvmfPkg/OvmfPkgX64.fdf b/OvmfPkg/OvmfPkgX64.fdf
+index 15ef13a..9708fd5 100644
+--- a/OvmfPkg/OvmfPkgX64.fdf
++++ b/OvmfPkg/OvmfPkgX64.fdf
+@@ -274,6 +274,7 @@ INF  RuleOverride=ACPITABLE OvmfPkg/AcpiTables/AcpiTables.inf
+ INF  OvmfPkg/AcpiS3SaveDxe/AcpiS3SaveDxe.inf
+ INF  MdeModulePkg/Universal/Acpi/S3SaveStateDxe/S3SaveStateDxe.inf
+ INF  MdeModulePkg/Universal/Acpi/BootScriptExecutorDxe/BootScriptExecutorDxe.inf
++INF  MdeModulePkg/Universal/Acpi/BootGraphicsResourceTableDxe/BootGraphicsResourceTableDxe.inf
+ 
+ INF  RuleOverride = BINARY FatBinPkg/EnhancedFatDxe/Fat.inf
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-core/ovmf/ovmf/0002-ovmf-update-path-to-native-BaseTools.patch b/meta/recipes-core/ovmf/ovmf/0002-ovmf-update-path-to-native-BaseTools.patch
new file mode 100644
index 0000000..94029a5
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/0002-ovmf-update-path-to-native-BaseTools.patch
@@ -0,0 +1,32 @@
+From 9e632e3f9edd09632cc877dff6ea57608f979aab Mon Sep 17 00:00:00 2001
+From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
+Date: Thu, 9 Jun 2016 02:23:01 -0700
+Subject: [PATCH] ovmf: update path to native BaseTools
+
+BaseTools is a set of utilities to build EDK-based firmware. These utilities
+are used during the build process. Thus, they need to be built natively.
+When cross-compiling, we need to provide a path to the location of these
+tools. The BBAKE_EDK_TOOLS_PATH string is used as a pattern to be replaced
+with the appropriate location before building.
+
+Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
+---
+ OvmfPkg/build.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/OvmfPkg/build.sh b/OvmfPkg/build.sh
+index eb5eb73..9058fca 100755
+--- a/OvmfPkg/build.sh
++++ b/OvmfPkg/build.sh
+@@ -30,7 +30,7 @@ then
+ # this assumes svn pulls have the same root dir
+ #  export EDK_TOOLS_PATH=`pwd`/../BaseTools
+ # This version is for the tools source in edk2
+-  export EDK_TOOLS_PATH=`pwd`/BaseTools
++  export EDK_TOOLS_PATH=BBAKE_EDK_TOOLS_PATH/BaseTools
+   echo $EDK_TOOLS_PATH
+   source edksetup.sh BaseTools
+ else
+-- 
+2.8.1
+
diff --git a/meta/recipes-core/ovmf/ovmf/0003-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch b/meta/recipes-core/ovmf/ovmf/0003-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch
new file mode 100644
index 0000000..0fdc278
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/0003-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch
@@ -0,0 +1,39 @@
+From 2320650c6d381b914fe91b2dedaa5870279a8bcf Mon Sep 17 00:00:00 2001
+From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
+Date: Sun, 27 Nov 2016 18:42:55 -0800
+Subject: [PATCH] BaseTools: makefile: adjust to build in under bitbake
+
+Prepend the build flags with those of bitbake. This is to build
+using the bitbake native sysroot include and library directories.
+
+Signed-off-by: Ricardo Neri <ricardo.neri@linux.intel.com>
+---
+ BaseTools/Source/C/Makefiles/header.makefile | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/BaseTools/Source/C/Makefiles/header.makefile b/BaseTools/Source/C/Makefiles/header.makefile
+index 821d114..fe0f08b 100644
+--- a/BaseTools/Source/C/Makefiles/header.makefile
++++ b/BaseTools/Source/C/Makefiles/header.makefile
+@@ -44,14 +44,14 @@ ARCH_INCLUDE = -I $(MAKEROOT)/Include/AArch64/
+ endif
+ 
+ INCLUDE = $(TOOL_INCLUDE) -I $(MAKEROOT) -I $(MAKEROOT)/Include/Common -I $(MAKEROOT)/Include/ -I $(MAKEROOT)/Include/IndustryStandard -I $(MAKEROOT)/Common/ -I .. -I . $(ARCH_INCLUDE) 
+-BUILD_CPPFLAGS = $(INCLUDE) -O2
++BUILD_CPPFLAGS := $(BUILD_CPPFLAGS) $(INCLUDE) -O2
+ ifeq ($(DARWIN),Darwin)
+ # assume clang or clang compatible flags on OS X
+-BUILD_CFLAGS = -MD -fshort-wchar -fno-strict-aliasing -Wall -Werror -Wno-deprecated-declarations -Wno-self-assign -Wno-unused-result -nostdlib -c -g
++BUILD_CFLAGS := $(BUILD_CFLAGS) -MD -fshort-wchar -fno-strict-aliasing -Wall -Werror -Wno-deprecated-declarations -Wno-self-assign -Wno-unused-result -nostdlib -c -g
+ else
+-BUILD_CFLAGS = -MD -fshort-wchar -fno-strict-aliasing -Wall -Werror -Wno-deprecated-declarations -Wno-unused-result -nostdlib -c -g
++BUILD_CFLAGS := $(BUILD_CFLAGS) -MD -fshort-wchar -fno-strict-aliasing -Wall -Werror -Wno-deprecated-declarations -Wno-unused-result -nostdlib -c -g
+ endif
+-BUILD_LFLAGS =
++BUILD_LFLAGS := $(LDFLAGS)
+ BUILD_CXXFLAGS =
+ 
+ ifeq ($(ARCH), IA32)
+-- 
+2.9.3
+
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
new file mode 100644
index 0000000..e722db5
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -0,0 +1,121 @@
+DESCRIPTION = "OVMF - UEFI firmware for Qemu and KVM"
+HOMEPAGE = "http://sourceforge.net/apps/mediawiki/tianocore/index.php?title=OVMF"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://OvmfPkg/License.txt;md5=343dc88e82ff33d042074f62050c3496"
+
+SRC_URI = "git://github.com/tianocore/edk2.git;branch=master \
+	file://0001-BaseTools-Force-tools-variables-to-host-toolchain.patch \
+	file://0001-OvmfPkg-Enable-BGRT-in-OVMF.patch \
+	file://0002-ovmf-update-path-to-native-BaseTools.patch \
+	file://0003-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch \
+        "
+
+SRCREV="4575a602ca6072ee9d04150b38bfb143cbff8588"
+
+PARALLEL_MAKE = ""
+
+S = "${WORKDIR}/git"
+
+DEPENDS_class-native="util-linux-native iasl-native ossp-uuid-native"
+
+DEPENDS_class-target="ovmf-native"
+
+EDK_TOOLS_DIR="edk2_basetools"
+
+# OVMF has trouble building with the default optimization of -O2.
+BUILD_OPTIMIZATION="-pipe"
+
+# OVMF supports IA only, although it could conceivably support ARM someday.
+COMPATIBLE_HOST='(i.86|x86_64).*'
+
+do_patch_append_class-native() {
+    bb.build.exec_func('do_fix_iasl', d)
+    bb.build.exec_func('do_fix_toolchain', d)
+}
+
+do_fix_basetools_location() {
+    sed -i -e 's#BBAKE_EDK_TOOLS_PATH#${STAGING_BINDIR_NATIVE}/${EDK_TOOLS_DIR}#' ${S}/OvmfPkg/build.sh
+}
+
+do_patch_append_class-target() {
+    bb.build.exec_func('do_fix_basetools_location', d)
+}
+
+
+do_fix_iasl() {
+    sed -i -e 's#/usr/bin/iasl#${STAGING_BINDIR_NATIVE}/iasl#' ${S}/BaseTools/Conf/tools_def.template
+}
+
+do_fix_toolchain(){
+    sed -i -e 's#DEF(ELFGCC_BIN)/#${TARGET_PREFIX}#' ${S}/BaseTools/Conf/tools_def.template
+    sed -i -e 's#DEF(GCC.*PREFIX)#${TARGET_PREFIX}#' ${S}/BaseTools/Conf/tools_def.template
+    sed -i -e "s#^LINKER\(.*\)#LINKER\1\nLFLAGS += ${BUILD_LDFLAGS}#" ${S}/BaseTools/Source/C/Makefiles/app.makefile
+    sed -i -e "s#^LINKER\(.*\)#LINKER\1\nCFLAGS += ${BUILD_CFLAGS}#" ${S}/BaseTools/Source/C/Makefiles/app.makefile
+    sed -i -e "s#^LINKER\(.*\)#LINKER\1\nLFLAGS += ${BUILD_LDFLAGS}#" ${S}/BaseTools/Source/C/VfrCompile/GNUmakefile
+    sed -i -e "s#^LINKER\(.*\)#LINKER\1\nCFLAGS += ${BUILD_CFLAGS}#" ${S}/BaseTools/Source/C/VfrCompile/GNUmakefile
+}
+
+GCC_VER="$(${CC} -v 2>&1 | tail -n1 | awk '{print $3}')"
+
+fixup_target_tools() {
+    case ${1} in
+      4.4.*)
+        FIXED_GCCVER=GCC44
+        ;;
+      4.5.*)
+        FIXED_GCCVER=GCC45
+        ;;
+      4.6.*)
+        FIXED_GCCVER=GCC46
+        ;;
+      4.7.*)
+        FIXED_GCCVER=GCC47
+        ;;
+      4.8.*)
+        FIXED_GCCVER=GCC48
+        ;;
+      4.9.*)
+        FIXED_GCCVER=GCC49
+        ;;
+      *)
+        FIXED_GCCVER=GCC5
+        ;;
+    esac
+    echo ${FIXED_GCCVER}
+}
+
+do_compile_class-native() {
+    oe_runmake -C ${S}/BaseTools
+}
+
+do_compile_class-target() {
+    export LFLAGS="${LDFLAGS}"
+    OVMF_ARCH="X64"
+    if [ "${TARGET_ARCH}" != "x86_64" ] ; then
+        OVMF_ARCH="IA32"
+    fi
+
+    FIXED_GCCVER=$(fixup_target_tools ${GCC_VER})
+    echo FIXED_GCCVER is ${FIXED_GCCVER}
+    ${S}/OvmfPkg/build.sh -a $OVMF_ARCH -b RELEASE -t ${FIXED_GCCVER}
+}
+
+do_install_class-native() {
+    install -d ${D}/${bindir}/edk2_basetools
+    cp -r ${S}/BaseTools ${D}/${bindir}/${EDK_TOOLS_DIR}
+}
+
+do_install_class-target() {
+    OVMF_DIR_SUFFIX="X64"
+    if [ "${TARGET_ARCH}" != "x86_64" ] ; then
+        OVMF_DIR_SUFFIX="Ia32" # Note the different capitalization
+    fi
+    install -d ${D}${datadir}/ovmf
+
+    FIXED_GCCVER=$(fixup_target_tools ${GCC_VER})
+    build_dir="${S}/Build/Ovmf$OVMF_DIR_SUFFIX/RELEASE_${FIXED_GCCVER}"
+    install -m 0755 ${build_dir}/FV/OVMF.fd \
+	${D}${datadir}/ovmf/bios.bin
+}
+
+BBCLASSEXTEND = "native"
-- 
git-series 0.9.1

