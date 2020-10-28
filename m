Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.3758.1603919175019764835
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 14:06:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JqJWQ3Xm;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id v4so999384edi.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 14:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O+eFK+FqgtbmYh7MJlP7ls8F4jQwwViRn2VdoKDRFPE=;
        b=JqJWQ3Xm/nWN2ksL0AdN8yK+zOb2g8K38hYJHHfOhtO2hF7fZixXRqAeftSg7AEw4Q
         U+96KsJsjSs+WQ5mo11UyjMYkAhESzudRalbcA5hQrpaVz121G9EiOmU7RKPvnFQj8Ph
         Hu9Ly96vqyDyjrE1Hp2+/k2TAPJtm3FSk5E37uXtGZT01U2f3nWs22iv9ssRPUKbNc2V
         JQiXrCiH0655bnPZrVac607ytqNnfmrUqVPNQWEPfxTTA9f0oM4hdY6DEMUFWKVtYk9S
         yb+PIK3IH3a+JVdZps9K/De2pjMBfgekiN+wzEPleFVHhPSHhII6X81Gtr0VttvVYNlW
         qCUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O+eFK+FqgtbmYh7MJlP7ls8F4jQwwViRn2VdoKDRFPE=;
        b=T/SLieKUw8slHulXEnEtz8DhV3r7tlzTWUk7mDQ4nsvJeLd5UAcFL2Pyu+Hh3ndIEy
         hOm+SpB6wHxEyHUNUkun8XWkXMFI4cxPA7EgTYguPx5PCgoWpQ6Tay55W8O6jT4bV3Bn
         FZRoyjnWamXhRULioILO9Z6Y1Be6TrTOtwl34yge+FsWCT58dYOV9VY6GgafDQ5xtbY2
         +IvMgeBSp0jBfzMZhGHGoGvxk8OrX/PNMCVEHJoW+Tsxmzub2iPY0/nc7ouLnbMGHf4F
         tFN9rVxCr+rYm7kPWT6/neqj+5KS74F8d/5qzozng8+hx9z8DQduDkgkRck66WVS+LyM
         wvkw==
X-Gm-Message-State: AOAM530GxQp4Y/un1lTCrV+gL2IcVrJme8iwZzr4UaJ3Uqj8z05H83LJ
	AuzYKBwrLgbT3iBJ4HKhZ+AyNTKVws9xGA==
X-Google-Smtp-Source: ABdhPJzqSIaJF8TJ3OULAY0nqxQJn5nN/Pjr7XLVr8bzRu4UwZwPRJbg4FIaRM2vO3952yp9pYizoQ==
X-Received: by 2002:a05:6402:b66:: with SMTP id cb6mr835078edb.110.1603919173074;
        Wed, 28 Oct 2020 14:06:13 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id q25sm352434eja.86.2020.10.28.14.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 14:06:12 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 08/33] ovmf: update edk2-stable202005 -> edk2-stable202008
Date: Wed, 28 Oct 2020 22:05:33 +0100
Message-Id: <20201028210558.21070-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201028210558.21070-1-alex.kanavin@gmail.com>
References: <20201028210558.21070-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ovmf-update-path-to-native-BaseTools.patch |  6 ++--
 ...ile-adjust-to-build-in-under-bitbake.patch | 32 ++++++++++++++-----
 .../0003-ovmf-enable-long-path-file.patch     |  6 ++--
 ...patch =3D> 0004-ovmf-Update-to-latest.patch} | 16 +++++-----
 meta/recipes-core/ovmf/ovmf_git.bb            |  6 ++--
 5 files changed, 41 insertions(+), 25 deletions(-)
 rename meta/recipes-core/ovmf/ovmf/{0001-ovmf-Update-to-latest.patch =3D> =
0004-ovmf-Update-to-latest.patch} (77%)

diff --git a/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-Ba=
seTools.patch b/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native=
-BaseTools.patch
index 6ecb23b29f..c32963a807 100644
--- a/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools=
.patch
+++ b/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools=
.patch
@@ -1,7 +1,7 @@
-From 0a8362cfb9f00870d70687475665b131dd82c947 Mon Sep 17 00:00:00 2001
+From 200ff35c6545b4ab85f5ea7a6096fbaec3d82f6d Mon Sep 17 00:00:00 2001
 From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
 Date: Thu, 9 Jun 2016 02:23:01 -0700
-Subject: [PATCH 1/5] ovmf: update path to native BaseTools
+Subject: [PATCH 1/4] ovmf: update path to native BaseTools
=20
 BaseTools is a set of utilities to build EDK-based firmware. These utiliti=
es
 are used during the build process. Thus, they need to be built natively.
@@ -30,5 +30,5 @@ index 91b1442ade..1858dae31a 100755
    source edksetup.sh BaseTools
  else
 --=20
-2.17.1
+2.28.0
=20
diff --git a/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-=
build-in-under-bitbake.patch b/meta/recipes-core/ovmf/ovmf/0002-BaseTools-m=
akefile-adjust-to-build-in-under-bitbake.patch
index f37ed018ab..c61a08f022 100644
--- a/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-i=
n-under-bitbake.patch
+++ b/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-i=
n-under-bitbake.patch
@@ -1,7 +1,7 @@
-From a8bceaec1b16fffbf6810df05503d8ae9092b735 Mon Sep 17 00:00:00 2001
+From 667c0cf97dadc4f5994d26ec3984f559a05ec406 Mon Sep 17 00:00:00 2001
 From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
 Date: Fri, 26 Jul 2019 17:34:26 -0400
-Subject: [PATCH 2/5] BaseTools: makefile: adjust to build in under bitbake
+Subject: [PATCH 2/4] BaseTools: makefile: adjust to build in under bitbake
=20
 Prepend the build flags with those of bitbake. This is to build
 using the bitbake native sysroot include and library directories.
@@ -10,14 +10,14 @@ Signed-off-by: Ricardo Neri <ricardo.neri@linux.intel.c=
om>
 Upstream-Status: Pending
=20
 ---
- BaseTools/Source/C/Makefiles/header.makefile | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
+ BaseTools/Source/C/Makefiles/header.makefile | 17 +++++++++--------
+ 1 file changed, 9 insertions(+), 8 deletions(-)
=20
 diff --git a/BaseTools/Source/C/Makefiles/header.makefile b/BaseTools/Sour=
ce/C/Makefiles/header.makefile
-index 4e9b36d98b..eb03ee33fa 100644
+index 1c105ee7d4..d5eea3864e 100644
 --- a/BaseTools/Source/C/Makefiles/header.makefile
 +++ b/BaseTools/Source/C/Makefiles/header.makefile
-@@ -62,23 +62,23 @@ $(error Bad HOST_ARCH)
+@@ -69,35 +69,36 @@ $(error Bad HOST_ARCH)
  endif=0D
  =0D
  INCLUDE =3D $(TOOL_INCLUDE) -I $(MAKEROOT) -I $(MAKEROOT)/Include/Common =
-I $(MAKEROOT)/Include/ -I $(MAKEROOT)/Include/IndustryStandard -I $(MAKERO=
OT)/Common/ -I .. -I . $(ARCH_INCLUDE)=0D
@@ -33,19 +33,35 @@ index 4e9b36d98b..eb03ee33fa 100644
 +BUILD_CFLAGS +=3D -MD -fshort-wchar -fno-strict-aliasing -Wall -Werror \=
=0D
  -Wno-deprecated-declarations -Wno-self-assign -Wno-unused-result -nostdli=
b -g=0D
  else=0D
+ ifeq ($(CXX), llvm)=0D
+-BUILD_CFLAGS =3D -MD -fshort-wchar -fno-strict-aliasing -fwrapv \=0D
++BUILD_CFLAGS +=3D -MD -fshort-wchar -fno-strict-aliasing -fwrapv \=0D
+ -fno-delete-null-pointer-checks -Wall -Werror \=0D
+ -Wno-deprecated-declarations -Wno-self-assign \=0D
+ -Wno-unused-result -nostdlib -g=0D
+ else=0D
 -BUILD_CFLAGS =3D -MD -fshort-wchar -fno-strict-aliasing -fwrapv \=0D
 +BUILD_CFLAGS +=3D -MD -fshort-wchar -fno-strict-aliasing -fwrapv \=0D
  -fno-delete-null-pointer-checks -Wall -Werror \=0D
  -Wno-deprecated-declarations -Wno-stringop-truncation -Wno-restrict \=0D
  -Wno-unused-result -nostdlib -g=0D
  endif=0D
+ endif=0D
+ ifeq ($(CXX), llvm)=0D
+-BUILD_LFLAGS =3D=0D
+-BUILD_CXXFLAGS =3D -Wno-deprecated-register -Wno-unused-result=0D
++BUILD_LFLAGS =3D $(LDFLAGS)=0D
++BUILD_CXXFLAGS +=3D -Wno-deprecated-register -Wno-unused-result=0D
+ else=0D
 -BUILD_LFLAGS =3D=0D
 -BUILD_CXXFLAGS =3D -Wno-unused-result=0D
 +BUILD_LFLAGS =3D $(LDFLAGS)=0D
 +BUILD_CXXFLAGS +=3D -Wno-unused-result=0D
- =0D
+ endif=0D
++=0D
  ifeq ($(HOST_ARCH), IA32)=0D
  #=0D
+ # Snow Leopard  is a 32-bit and 64-bit environment. uname -m returns i386=
, but gcc defaults=0D
 --=20
-2.17.1
+2.28.0
=20
diff --git a/meta/recipes-core/ovmf/ovmf/0003-ovmf-enable-long-path-file.pa=
tch b/meta/recipes-core/ovmf/ovmf/0003-ovmf-enable-long-path-file.patch
index ab1e7db31f..df1d159011 100644
--- a/meta/recipes-core/ovmf/ovmf/0003-ovmf-enable-long-path-file.patch
+++ b/meta/recipes-core/ovmf/ovmf/0003-ovmf-enable-long-path-file.patch
@@ -1,7 +1,7 @@
-From 60a5f953f747e1e9e05a40157b651cba8ea57b91 Mon Sep 17 00:00:00 2001
+From e19481e5a64f8915ac118899b10c40d12c0f9daa Mon Sep 17 00:00:00 2001
 From: Dengke Du <dengke.du@windriver.com>
 Date: Mon, 11 Sep 2017 02:21:55 -0400
-Subject: [PATCH 3/5] ovmf: enable long path file
+Subject: [PATCH 3/4] ovmf: enable long path file
=20
 Upstream-Status: Pending
 Signed-off-by: Dengke Du <dengke.du@windriver.com>
@@ -24,5 +24,5 @@ index e1cce985f7..d67d03c70c 100644
  #define MAX_UINT64 ((UINT64)0xFFFFFFFFFFFFFFFFULL)=0D
  #define MAX_UINT32 ((UINT32)0xFFFFFFFF)=0D
 --=20
-2.17.1
+2.28.0
=20
diff --git a/meta/recipes-core/ovmf/ovmf/0001-ovmf-Update-to-latest.patch b=
/meta/recipes-core/ovmf/ovmf/0004-ovmf-Update-to-latest.patch
similarity index 77%
rename from meta/recipes-core/ovmf/ovmf/0001-ovmf-Update-to-latest.patch
rename to meta/recipes-core/ovmf/ovmf/0004-ovmf-Update-to-latest.patch
index 1d4273cdc1..128438b201 100644
--- a/meta/recipes-core/ovmf/ovmf/0001-ovmf-Update-to-latest.patch
+++ b/meta/recipes-core/ovmf/ovmf/0004-ovmf-Update-to-latest.patch
@@ -1,7 +1,7 @@
-From 640a634936ba8eca4778470fb14c6eb9cfd19953 Mon Sep 17 00:00:00 2001
+From ad06fcf1e08736e79221cd6863ff2e3c9254f261 Mon Sep 17 00:00:00 2001
 From: Steve Langasek <steve.langasek@ubuntu.com>
 Date: Sat, 10 Jun 2017 01:39:36 -0700
-Subject: [PATCH 1/2] ovmf: Update to latest
+Subject: [PATCH 4/4] ovmf: Update to latest
=20
 Description: pass -fno-stack-protector to all GCC toolchains
  The upstream build rules inexplicably pass -fno-stack-protector only
@@ -15,15 +15,15 @@ Upstream-Status: Pending
  1 file changed, 4 insertions(+), 4 deletions(-)
=20
 diff --git a/BaseTools/Conf/tools_def.template b/BaseTools/Conf/tools_def.=
template
-index 2b17d3b297..4cd2567c2a 100755
+index 933b3160fd..c2fbbf0c38 100755
 --- a/BaseTools/Conf/tools_def.template
 +++ b/BaseTools/Conf/tools_def.template
-@@ -1950,10 +1950,10 @@ DEFINE GCC_AARCH64_RC_FLAGS        =3D -I binary -=
O elf64-littleaarch64 -B aarch64
+@@ -1952,10 +1952,10 @@ DEFINE GCC_RISCV64_RC_FLAGS        =3D -I binary -=
O elf64-littleriscv   -B riscv
  # GCC Build Flag for included header file list generation=0D
  DEFINE GCC_DEPS_FLAGS              =3D -MMD -MF $@.deps=0D
  =0D
--DEFINE GCC48_ALL_CC_FLAGS            =3D -g -fshort-wchar -fno-builtin -f=
no-strict-aliasing -Wall -Werror -Wno-array-bounds -ffunction-sections -fda=
ta-sections -include AutoGen.h -fno-common -DSTRING_ARRAY_NAME=3D$(BASE_NAM=
E)Strings=0D
-+DEFINE GCC48_ALL_CC_FLAGS            =3D -g -fshort-wchar -fno-builtin -f=
no-strict-aliasing -Wall -Werror -Wno-array-bounds -ffunction-sections -fda=
ta-sections -fno-stack-protector -include AutoGen.h -fno-common -DSTRING_AR=
RAY_NAME=3D$(BASE_NAME)Strings=0D
+-DEFINE GCC48_ALL_CC_FLAGS            =3D DEF(GCC_ALL_CC_FLAGS) -ffunction=
-sections -fdata-sections -DSTRING_ARRAY_NAME=3D$(BASE_NAME)Strings=0D
++DEFINE GCC48_ALL_CC_FLAGS            =3D DEF(GCC_ALL_CC_FLAGS) -ffunction=
-sections -fdata-sections -fno-stack-protector -DSTRING_ARRAY_NAME=3D$(BASE=
_NAME)Strings=0D
  DEFINE GCC48_IA32_X64_DLINK_COMMON   =3D -nostdlib -Wl,-n,-q,--gc-section=
s -z common-page-size=3D0x20=0D
 -DEFINE GCC48_IA32_CC_FLAGS           =3D DEF(GCC48_ALL_CC_FLAGS) -m32 -ma=
rch=3Di586 -malign-double -fno-stack-protector -D EFI32 -fno-asynchronous-u=
nwind-tables -Wno-address=0D
 -DEFINE GCC48_X64_CC_FLAGS            =3D DEF(GCC48_ALL_CC_FLAGS) -m64 -fn=
o-stack-protector "-DEFIAPI=3D__attribute__((ms_abi))" -maccumulate-outgoin=
g-args -mno-red-zone -Wno-address -mcmodel=3Dsmall -fpie -fno-asynchronous-=
unwind-tables -Wno-address=0D
@@ -32,7 +32,7 @@ index 2b17d3b297..4cd2567c2a 100755
  DEFINE GCC48_IA32_X64_ASLDLINK_FLAGS =3D DEF(GCC48_IA32_X64_DLINK_COMMON)=
 -Wl,--entry,ReferenceAcpiTable -u ReferenceAcpiTable=0D
  DEFINE GCC48_IA32_X64_DLINK_FLAGS    =3D DEF(GCC48_IA32_X64_DLINK_COMMON)=
 -Wl,--entry,$(IMAGE_ENTRY_POINT) -u $(IMAGE_ENTRY_POINT) -Wl,-Map,$(DEST_D=
IR_DEBUG)/$(BASE_NAME).map,--whole-archive=0D
  DEFINE GCC48_IA32_DLINK2_FLAGS       =3D -Wl,--defsym=3DPECOFF_HEADER_SIZ=
E=3D0x220 DEF(GCC_DLINK2_FLAGS_COMMON)=0D
-@@ -1962,7 +1962,7 @@ DEFINE GCC48_X64_DLINK2_FLAGS        =3D -Wl,--defsy=
m=3DPECOFF_HEADER_SIZE=3D0x228 DEF
+@@ -1964,7 +1964,7 @@ DEFINE GCC48_X64_DLINK2_FLAGS        =3D -Wl,--defsy=
m=3DPECOFF_HEADER_SIZE=3D0x228 DEF
  DEFINE GCC48_ASM_FLAGS               =3D DEF(GCC_ASM_FLAGS)=0D
  DEFINE GCC48_ARM_ASM_FLAGS           =3D $(ARCHASM_FLAGS) $(PLATFORM_FLAG=
S) DEF(GCC_ASM_FLAGS) -mlittle-endian=0D
  DEFINE GCC48_AARCH64_ASM_FLAGS       =3D $(ARCHASM_FLAGS) $(PLATFORM_FLAG=
S) DEF(GCC_ASM_FLAGS) -mlittle-endian=0D
@@ -42,5 +42,5 @@ index 2b17d3b297..4cd2567c2a 100755
  DEFINE GCC48_AARCH64_CC_FLAGS        =3D $(ARCHCC_FLAGS) $(PLATFORM_FLAGS=
) -mcmodel=3Dlarge DEF(GCC_AARCH64_CC_FLAGS)=0D
  DEFINE GCC48_AARCH64_CC_XIPFLAGS     =3D DEF(GCC_AARCH64_CC_XIPFLAGS)=0D
 --=20
-2.24.0
+2.28.0
=20
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index 84547630e8..04c4449ec2 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -16,11 +16,11 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;bran=
ch=3Dmaster;protocol=3Dhttps \
            file://0001-ovmf-update-path-to-native-BaseTools.patch \
            file://0002-BaseTools-makefile-adjust-to-build-in-under-bitbake=
.patch \
            file://0003-ovmf-enable-long-path-file.patch \
-           file://0001-ovmf-Update-to-latest.patch \
+           file://0004-ovmf-Update-to-latest.patch \
         "
=20
-PV =3D "edk2-stable202005"
-SRCREV =3D "ca407c7246bf405da6d9b1b9d93e5e7f17b4b1f9"
+PV =3D "edk2-stable202008"
+SRCREV =3D "06dc822d045c2bb42e497487935485302486e151"
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>edk2-stable.*)"
=20
 inherit deploy
--=20
2.29.0

