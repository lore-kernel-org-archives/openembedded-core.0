Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB473C54754
	for <webhook@archiver.kernel.org>; Sat, 17 May 2025 01:31:54 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.4689.1747445514364306463
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 May 2025 18:31:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Scg5/DNf;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2317d94c9cdso25236005ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 18:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747445513; x=1748050313; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZWBOAPNVo35z0mFtdWJeQv0VSZgTBkaZvxRmFGBiwIk=;
        b=Scg5/DNfg4qXbFPbdXvGS5iupIl21ZUBINeU4RXxUhCjOYm+wEHIher0c9u6AzDz7E
         qiG6ItDejSbZYYWeTOX5XsXcAeszWqbgzMwqrNbSJ5K5oCzZ9Ut8ygXp2y8yDHzLvHq9
         LBvs3c4hBzNfsyzNGF/wE5mdTSKNnsLExRF3ESnpCqMvgFVcEs7NBeqoF6SjNIT0mQ9W
         iKVnofhS6TBiScmIkrmVnJcZQjaDwNW0vMb1/9U+0+gs8/WWzTfghHgtGItdLL7CQTbf
         Y+TB7YwcXSo7auYshyj7Zm3H0ZdN+2ptWH2zDxiG+RevqfmOtcyIQntoTl3KG+G1bPzq
         MPew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747445513; x=1748050313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZWBOAPNVo35z0mFtdWJeQv0VSZgTBkaZvxRmFGBiwIk=;
        b=ZN9nUk3jvqkUgLvFEGOoBZLeKaXCTiuz5Ywm7uIw5U2PNErvLpGmMmIiqIiGpni6bt
         dg5ZuJyJF5fLQfMlbV/0hjSFseO3ukNXxENSHux3FIO4qHncg9CqKNSSgeSSkRs/zqcS
         fo8U3xvGEfGWKfgTwXGJRJZJS4qa3hfa8k5jF1h7JdwkXJT8kfbiNPDWm9CYZQtA4LjH
         sIqoFIYshULvc5+Zg5OuhlZoDVdDUsLJdF7utwJyfUo9APhIDn5NvRWaqXPe+gGyy7WJ
         4Z4CYm5ClxVPaqMtcb6uQZ6b+ZGc3KTzM8npjA5GWlJpJRSPqAcfoCSn7TmrMtxbVYoI
         JKNw==
X-Gm-Message-State: AOJu0YxoEqoBtWslaHZ+Y2OM2DVPlj1mMne1/wkS4KzFbFTeUIb7M81D
	EtU4GYsD1nZTar8ynwDt2QTJPIaes0krOHEoJV/kuO80Wl8qAb3FO1fSSo0iVOQN
X-Gm-Gg: ASbGnct336MWQbNehbJH1RuBbv/ugXET79wGjcKJksqsJIQlvDzKffOZBNgCd1wq4h3
	MjotzsRBW08cnHmMTNCm59xFv4Q/LxmdKd4x1Tzl1LXqRk6/jtsj4oPIlK6OPwRdnEN4m0tdlMQ
	m4vgLpM/Yxt91xqQDirZxI9n77brHAZSvEP4d9GWvB+8zcP6vpNGFNiSp2BafCPt3sQDdERduB3
	PaC9SEekThnR54KqfkOPPI00ZN8aI3Lnr8AS4YuQfxr4Sj+3or+ll/wRZggdWIC2YTzfuQC7EQ/
	lBNwqOWk3tFpyvzWpTnUQpQpSnrJVaDw9JSaUlhgXvg=
X-Google-Smtp-Source: AGHT+IHNkHN9E2kV8PeWeRG5NRaaoWx5A9I/02oUd9cPXT97OK5XL9Hhwm1/YbcKV3s+VJGmG+BL7A==
X-Received: by 2002:a17:903:2cc:b0:22c:35c5:e30e with SMTP id d9443c01a7336-231d44e3258mr68431175ad.13.1747445513403;
        Fri, 16 May 2025 18:31:53 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e97497sm20440035ad.128.2025.05.16.18.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 18:31:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] ovmf: Upgrade to 202502 release
Date: Fri, 16 May 2025 18:31:48 -0700
Message-ID: <20250517013148.4043563-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250517013148.4043563-1-raj.khem@gmail.com>
References: <20250517013148.4043563-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 May 2025 01:31:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216765

Refresh patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ovmf/ovmf/0003-debug-prefix-map.patch     | 21 +++++++----------
 .../ovmf/ovmf/0004-reproducible.patch         | 23 +++++--------------
 meta/recipes-core/ovmf/ovmf_git.bb            |  4 ++--
 3 files changed, 16 insertions(+), 32 deletions(-)

diff --git a/meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch b/meta=
/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch
index 73910535a71..4a20548c61e 100644
--- a/meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch
+++ b/meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch
@@ -21,11 +21,9 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  BaseTools/Conf/tools_def.template | 18 +++++++++---------
  1 file changed, 9 insertions(+), 9 deletions(-)
=20
-diff --git a/BaseTools/Conf/tools_def.template b/BaseTools/Conf/tools_def.=
template
-index 14f3b643c4..4987488e88 100755
 --- a/BaseTools/Conf/tools_def.template
 +++ b/BaseTools/Conf/tools_def.template
-@@ -896,7 +896,7 @@ NOOPT_*_*_OBJCOPY_ADDDEBUGFLAG     =3D --add-gnu-debug=
link=3D"$(DEBUG_DIR)/$(MODULE_
+@@ -920,7 +920,7 @@ NOOPT_*_*_OBJCOPY_ADDDEBUGFLAG     =3D --a
  *_*_*_DTC_PATH                     =3D DEF(DTC_BIN)=0D
  =0D
  # All supported GCC archs except LOONGARCH64 support -mstack-protector-gu=
ard=3Dglobal, so set that on everything except LOONGARCH64=0D
@@ -34,7 +32,7 @@ index 14f3b643c4..4987488e88 100755
  DEFINE GCC_IA32_X64_CC_FLAGS       =3D -mstack-protector-guard=3Dglobal=0D
  DEFINE GCC_ARM_CC_FLAGS            =3D DEF(GCC_ALL_CC_FLAGS) -mlittle-end=
ian -mabi=3Daapcs -fno-short-enums -funsigned-char -ffunction-sections -fda=
ta-sections -fomit-frame-pointer -Wno-address -mthumb -fno-pic -fno-pie -ms=
tack-protector-guard=3Dglobal=0D
  DEFINE GCC_LOONGARCH64_CC_FLAGS    =3D DEF(GCC_ALL_CC_FLAGS) -mabi=3Dlp64=
d -fno-asynchronous-unwind-tables -Wno-address -fno-short-enums -fsigned-ch=
ar -ffunction-sections -fdata-sections=0D
-@@ -918,8 +918,8 @@ DEFINE GCC_ARM_ASLDLINK_FLAGS      =3D DEF(GCC_ARM_DLI=
NK_FLAGS) -Wl,--entry,Refere
+@@ -941,8 +941,8 @@ DEFINE GCC_ARM_ASLDLINK_FLAGS      =3D DEF
  DEFINE GCC_AARCH64_ASLDLINK_FLAGS  =3D DEF(GCC_AARCH64_DLINK_FLAGS) -Wl,-=
-entry,ReferenceAcpiTable -u $(IMAGE_ENTRY_POINT) DEF(GCC_ARM_AARCH64_ASLDL=
INK_FLAGS)=0D
  DEFINE GCC_LOONGARCH64_ASLDLINK_FLAGS =3D DEF(GCC_LOONGARCH64_DLINK_FLAGS=
) -Wl,--entry,ReferenceAcpiTable -u $(IMAGE_ENTRY_POINT)=0D
  DEFINE GCC_IA32_X64_DLINK_FLAGS    =3D DEF(GCC_IA32_X64_DLINK_COMMON) --e=
ntry _$(IMAGE_ENTRY_POINT) --file-alignment 0x20 --section-alignment 0x20 -=
Map $(DEST_DIR_DEBUG)/$(BASE_NAME).map=0D
@@ -45,7 +43,7 @@ index 14f3b643c4..4987488e88 100755
  DEFINE GCC_VFRPP_FLAGS             =3D -x c -E -P -DVFRCOMPILE --include =
$(MODULE_NAME)StrDefs.h=0D
  DEFINE GCC_ASLPP_FLAGS             =3D -x c -E -include AutoGen.h=0D
  DEFINE GCC_ASLCC_FLAGS             =3D -x c=0D
-@@ -1072,7 +1072,7 @@ DEFINE GCC5_LOONGARCH64_PP_FLAGS           =3D -mabi=
=3Dlp64d -march=3Dloongarch64 DEF(
+@@ -1095,7 +1095,7 @@ DEFINE GCC5_LOONGARCH64_PP_FLAGS
  *_GCC48_IA32_DLINK2_FLAGS         =3D DEF(GCC48_IA32_DLINK2_FLAGS)=0D
  *_GCC48_IA32_RC_FLAGS             =3D DEF(GCC_IA32_RC_FLAGS)=0D
  *_GCC48_IA32_OBJCOPY_FLAGS        =3D=0D
@@ -54,7 +52,7 @@ index 14f3b643c4..4987488e88 100755
  =0D
    DEBUG_GCC48_IA32_CC_FLAGS       =3D DEF(GCC48_IA32_CC_FLAGS)=0D
  RELEASE_GCC48_IA32_CC_FLAGS       =3D DEF(GCC48_IA32_CC_FLAGS) -Wno-unuse=
d-but-set-variable=0D
-@@ -1100,7 +1100,7 @@ RELEASE_GCC48_IA32_CC_FLAGS       =3D DEF(GCC48_IA32=
_CC_FLAGS) -Wno-unused-but-set
+@@ -1123,7 +1123,7 @@ RELEASE_GCC48_IA32_CC_FLAGS       =3D DEF(
  *_GCC48_X64_DLINK2_FLAGS         =3D DEF(GCC48_X64_DLINK2_FLAGS)=0D
  *_GCC48_X64_RC_FLAGS             =3D DEF(GCC_X64_RC_FLAGS)=0D
  *_GCC48_X64_OBJCOPY_FLAGS        =3D=0D
@@ -63,7 +61,7 @@ index 14f3b643c4..4987488e88 100755
  =0D
    DEBUG_GCC48_X64_CC_FLAGS       =3D DEF(GCC48_X64_CC_FLAGS)=0D
  RELEASE_GCC48_X64_CC_FLAGS       =3D DEF(GCC48_X64_CC_FLAGS) -Wno-unused-=
but-set-variable=0D
-@@ -1209,7 +1209,7 @@ RELEASE_GCC48_AARCH64_CC_FLAGS   =3D DEF(GCC48_AARCH=
64_CC_FLAGS) -Wno-unused-but-s
+@@ -1232,7 +1232,7 @@ RELEASE_GCC48_AARCH64_CC_FLAGS   =3D DEF(G
  *_GCC49_IA32_DLINK2_FLAGS         =3D DEF(GCC49_IA32_DLINK2_FLAGS)=0D
  *_GCC49_IA32_RC_FLAGS             =3D DEF(GCC_IA32_RC_FLAGS)=0D
  *_GCC49_IA32_OBJCOPY_FLAGS        =3D=0D
@@ -72,7 +70,7 @@ index 14f3b643c4..4987488e88 100755
  =0D
    DEBUG_GCC49_IA32_CC_FLAGS       =3D DEF(GCC49_IA32_CC_FLAGS)=0D
  RELEASE_GCC49_IA32_CC_FLAGS       =3D DEF(GCC49_IA32_CC_FLAGS) -Wno-unuse=
d-but-set-variable -Wno-unused-const-variable=0D
-@@ -1237,7 +1237,7 @@ RELEASE_GCC49_IA32_CC_FLAGS       =3D DEF(GCC49_IA32=
_CC_FLAGS) -Wno-unused-but-set
+@@ -1260,7 +1260,7 @@ RELEASE_GCC49_IA32_CC_FLAGS       =3D DEF(
  *_GCC49_X64_DLINK2_FLAGS         =3D DEF(GCC49_X64_DLINK2_FLAGS)=0D
  *_GCC49_X64_RC_FLAGS             =3D DEF(GCC_X64_RC_FLAGS)=0D
  *_GCC49_X64_OBJCOPY_FLAGS        =3D=0D
@@ -81,7 +79,7 @@ index 14f3b643c4..4987488e88 100755
  =0D
    DEBUG_GCC49_X64_CC_FLAGS       =3D DEF(GCC49_X64_CC_FLAGS)=0D
  RELEASE_GCC49_X64_CC_FLAGS       =3D DEF(GCC49_X64_CC_FLAGS) -Wno-unused-=
but-set-variable -Wno-unused-const-variable=0D
-@@ -1496,7 +1496,7 @@ RELEASE_GCCNOLTO_AARCH64_DLINK_XIPFLAGS =3D -z commo=
n-page-size=3D0x20
+@@ -1519,7 +1519,7 @@ RELEASE_GCCNOLTO_AARCH64_DLINK_XIPFLAGS
  *_GCC5_IA32_DLINK2_FLAGS         =3D DEF(GCC5_IA32_DLINK2_FLAGS) -no-pie=
=0D
  *_GCC5_IA32_RC_FLAGS             =3D DEF(GCC_IA32_RC_FLAGS)=0D
  *_GCC5_IA32_OBJCOPY_FLAGS        =3D=0D
@@ -90,7 +88,7 @@ index 14f3b643c4..4987488e88 100755
  =0D
    DEBUG_GCC5_IA32_CC_FLAGS       =3D DEF(GCC5_IA32_CC_FLAGS) -flto=0D
    DEBUG_GCC5_IA32_DLINK_FLAGS    =3D DEF(GCC5_IA32_X64_DLINK_FLAGS) -flto=
 -Os -Wl,-m,elf_i386,--oformat=3Delf32-i386=0D
-@@ -1528,7 +1528,7 @@ RELEASE_GCC5_IA32_DLINK_FLAGS    =3D DEF(GCC5_IA32_X=
64_DLINK_FLAGS) -flto -Os -Wl,
+@@ -1551,7 +1551,7 @@ RELEASE_GCC5_IA32_DLINK_FLAGS    =3D DEF(G
  *_GCC5_X64_DLINK2_FLAGS          =3D DEF(GCC5_X64_DLINK2_FLAGS)=0D
  *_GCC5_X64_RC_FLAGS              =3D DEF(GCC_X64_RC_FLAGS)=0D
  *_GCC5_X64_OBJCOPY_FLAGS         =3D=0D
@@ -99,6 +97,3 @@ index 14f3b643c4..4987488e88 100755
  =0D
    DEBUG_GCC5_X64_CC_FLAGS        =3D DEF(GCC5_X64_CC_FLAGS) -flto -DUSING=
_LTO=0D
    DEBUG_GCC5_X64_DLINK_FLAGS     =3D DEF(GCC5_X64_DLINK_FLAGS) -flto -Os=
=0D
---=20
-2.39.5
-
diff --git a/meta/recipes-core/ovmf/ovmf/0004-reproducible.patch b/meta/rec=
ipes-core/ovmf/ovmf/0004-reproducible.patch
index ae0ca0c15cf..0ddb86f530d 100644
--- a/meta/recipes-core/ovmf/ovmf/0004-reproducible.patch
+++ b/meta/recipes-core/ovmf/ovmf/0004-reproducible.patch
@@ -34,20 +34,18 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.co=
m>
  .../Source/Python/AutoGen/ModuleAutoGen.py    |  5 +++-
  4 files changed, 24 insertions(+), 16 deletions(-)
=20
-diff --git a/BaseTools/Source/C/GenFw/Elf64Convert.c b/BaseTools/Source/C/=
GenFw/Elf64Convert.c
-index 897045b2be..a66003f44a 100644
 --- a/BaseTools/Source/C/GenFw/Elf64Convert.c
 +++ b/BaseTools/Source/C/GenFw/Elf64Convert.c
-@@ -13,6 +13,8 @@ SPDX-License-Identifier: BSD-2-Clause-Patent
- #ifndef __GNUC__=0D
+@@ -15,6 +15,8 @@ SPDX-License-Identifier: BSD-2-Clause-Pa
  #include <windows.h>=0D
+ #undef RUNTIME_FUNCTION=0D
  #include <io.h>=0D
 +#else=0D
 +#define _GNU_SOURCE=0D
  #endif=0D
  #include <assert.h>=0D
  #include <stdio.h>=0D
-@@ -988,7 +990,7 @@ ScanSections64 (
+@@ -990,7 +992,7 @@ ScanSections64 (
    }=0D
    mCoffOffset =3D mDebugOffset + sizeof(EFI_IMAGE_DEBUG_DIRECTORY_ENTRY) =
+=0D
                  sizeof(EFI_IMAGE_DEBUG_CODEVIEW_NB10_ENTRY) +=0D
@@ -56,7 +54,7 @@ index 897045b2be..a66003f44a 100644
  =0D
    //=0D
    // Add more space in the .debug data region for the DllCharacteristicsE=
x=0D
-@@ -2308,7 +2310,7 @@ WriteDebug64 (
+@@ -2310,7 +2312,7 @@ WriteDebug64 (
    EFI_IMAGE_DEBUG_CODEVIEW_NB10_ENTRY         *Nb10;=0D
    EFI_IMAGE_DEBUG_EX_DLLCHARACTERISTICS_ENTRY *DllEntry;=0D
  =0D
@@ -65,7 +63,7 @@ index 897045b2be..a66003f44a 100644
  =0D
    NtHdr =3D (EFI_IMAGE_OPTIONAL_HEADER_UNION *)(mCoffFile + mNtHdrOffset)=
;=0D
    DataDir =3D &NtHdr->Pe32Plus.OptionalHeader.DataDirectory[EFI_IMAGE_DIR=
ECTORY_ENTRY_DEBUG];=0D
-@@ -2341,7 +2343,7 @@ WriteDebug64 (
+@@ -2343,7 +2345,7 @@ WriteDebug64 (
  =0D
    Nb10 =3D (EFI_IMAGE_DEBUG_CODEVIEW_NB10_ENTRY*)(Dir + 1);=0D
    Nb10->Signature =3D CODEVIEW_SIGNATURE_NB10;=0D
@@ -74,8 +72,6 @@ index 897045b2be..a66003f44a 100644
  }=0D
  =0D
  STATIC=0D
-diff --git a/BaseTools/Source/Python/AutoGen/BuildEngine.py b/BaseTools/So=
urce/Python/AutoGen/BuildEngine.py
-index 45b39d7878..3fed7d1736 100644
 --- a/BaseTools/Source/Python/AutoGen/BuildEngine.py
 +++ b/BaseTools/Source/Python/AutoGen/BuildEngine.py
 @@ -70,6 +70,9 @@ class TargetDescBlock(object):
@@ -88,8 +84,6 @@ index 45b39d7878..3fed7d1736 100644
      def AddInput(self, Input):=0D
          if Input not in self.Inputs:=0D
              self.Inputs.append(Input)=0D
-diff --git a/BaseTools/Source/Python/AutoGen/GenMake.py b/BaseTools/Source=
/Python/AutoGen/GenMake.py
-index 6d9c60b702..83ac267647 100755
 --- a/BaseTools/Source/Python/AutoGen/GenMake.py
 +++ b/BaseTools/Source/Python/AutoGen/GenMake.py
 @@ -576,7 +576,7 @@ cleanlib:
@@ -140,7 +134,7 @@ index 6d9c60b702..83ac267647 100755
                     }=0D
  =0D
          RespDict =3D {}=0D
-@@ -1008,9 +1008,9 @@ cleanlib:
+@@ -1019,9 +1019,9 @@ cleanlib:
                  if not self.ObjTargetDict.get(T.Target.SubDir):=0D
                      self.ObjTargetDict[T.Target.SubDir] =3D set()=0D
                  self.ObjTargetDict[T.Target.SubDir].add(NewFile)=0D
@@ -152,8 +146,6 @@ index 6d9c60b702..83ac267647 100755
                  # Generate related macros if needed=0D
                  if T.GenFileListMacro and T.FileListMacro not in self.Fil=
eListMacros:=0D
                      self.FileListMacros[T.FileListMacro] =3D []=0D
-diff --git a/BaseTools/Source/Python/AutoGen/ModuleAutoGen.py b/BaseTools/=
Source/Python/AutoGen/ModuleAutoGen.py
-index 65a2176ca9..318b9611ce 100755
 --- a/BaseTools/Source/Python/AutoGen/ModuleAutoGen.py
 +++ b/BaseTools/Source/Python/AutoGen/ModuleAutoGen.py
 @@ -1474,6 +1474,9 @@ class ModuleAutoGen(AutoGen):
@@ -175,6 +167,3 @@ index 65a2176ca9..318b9611ce 100755
  =0D
          # Ignore generating makefile when it is a binary module=0D
          if self.IsBinaryModule:=0D
---=20
-2.39.5
-
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index 41ab85b703c..aa7de3af2b0 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -29,8 +29,8 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=
=3Dmaster;protocol=3Dhttps \
            file://CVE-2025-2295.patch \
            "
=20
-PV =3D "edk2-stable202411"
-SRCREV =3D "0f3867fa6ef0553e26c42f7d71ff6bdb98429742"
+PV =3D "edk2-stable202502"
+SRCREV =3D "fbe0805b2091393406952e84724188f8c1941837"
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>edk2-stable.*)"
=20
 CVE_PRODUCT =3D "edk2"

