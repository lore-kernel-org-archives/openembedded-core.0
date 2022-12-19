Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DF71C4167B
	for <webhook@archiver.kernel.org>; Mon, 19 Dec 2022 17:10:09 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.27763.1671469805579397207
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Dec 2022 09:10:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hbFuSmK3;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id v7so6955440wmn.0
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 09:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zEnUa3FGNTRwCWz62hTFbobPKWl+u+moYUuepA4v5gM=;
        b=hbFuSmK31LDXNX4Zuy+ngxoFHiQuTZ4LvgKcOtB/ueg4UBu7h+vtpLYVj+mya3fOYo
         IrPMFcRjGRZ/YD7kBu7OEl2LIHALsX3RSABehwIVibh0Hbsyn4PGKade5V6ZezC9YP8R
         1OdIzRvR6Rd5Lo71+NIpOMlKwYqIVj8r2B+TLmOmaPbrKq2jLf9sVJ0Br/FxDfGDK5aE
         IU6mUNq5Dq9c+zrgtG/GZdz/m4V6+OCNpeqQ2jKTjsPxr6ASV3BsFcpOtI7GyVsAdL5U
         yCdIq9ej8nzvvdTx4Vi8P+2VRKekgur7nieFTMIHUquSt+Nwyixn/B2AciWPcp9IdkkG
         BX6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zEnUa3FGNTRwCWz62hTFbobPKWl+u+moYUuepA4v5gM=;
        b=ekOsIzziQkzojo9nl7p3wQnpjW8j3IXcC6p4SvR2mdYoM/91xY4mBmLEKZobt6y0uT
         /+jNYsSBWum92sDsBpCndA45MtUKjb91W08OqC8fd3CKpl8Z+HhQXGy0htBohTWCaXkZ
         kNQ2Wa7KTnP/KKb12zXpZCXDnpZLGfyzMwNtPvRO6jbR2ZsARZBXAiQS0tiJVse4kkm1
         iyXnt5vWQQ/0MD6XJfm6zEPnD2lGyFziLBHX0YGgjb4Okd3NzFbICPfAgAwYObk5/9UN
         ASrkH/cLEXhde1qfZTbVXDVV35X+X/eX2q8CXFzuFIT5RVn/Tm+EKM5yGjejy6ce93qZ
         COQw==
X-Gm-Message-State: AFqh2kppO+YIsAgfRbHaj+PTMH/GZsKpc3ZB4kkms4xemKKTdr8nCDnA
	0OPJl2kxQXXzAdxX0A7Y5vFumZ3ckF73Pw==
X-Google-Smtp-Source: AMrXdXuBDbj9y+0MQM3bXwHBsxsR5iPSEK0E/e4AcGte493LPw/miHh4i0d0L374CpK/vBgebXCrww==
X-Received: by 2002:a05:600c:5125:b0:3d3:4012:8da8 with SMTP id o37-20020a05600c512500b003d340128da8mr10438077wms.40.1671469803162;
        Mon, 19 Dec 2022 09:10:03 -0800 (PST)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id x20-20020a1c7c14000000b003c6c3fb3cf6sm12984594wmc.18.2022.12.19.09.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 09:10:02 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH] ovmf: update 2022.08 -> 2022.11
Date: Mon, 19 Dec 2022 17:09:42 +0000
Message-Id: <20221219170942.691213-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 17:10:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174822

Also refresh the patches

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 ...ovmf-update-path-to-native-BaseTools.patch |  6 ++---
 ...ile-adjust-to-build-in-under-bitbake.patch | 10 +++----
 ...-map.patch =3D> 0003-debug-prefix-map.patch} | 26 +++++++++----------
 ...oducible.patch =3D> 0004-reproducible.patch} | 26 +++++++++----------
 meta/recipes-core/ovmf/ovmf_git.bb            |  8 +++---
 5 files changed, 38 insertions(+), 38 deletions(-)
 rename meta/recipes-core/ovmf/ovmf/{0005-debug-prefix-map.patch =3D> 0003-=
debug-prefix-map.patch} (86%)
 rename meta/recipes-core/ovmf/ovmf/{0006-reproducible.patch =3D> 0004-repr=
oducible.patch} (92%)

diff --git a/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-Ba=
seTools.patch b/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native=
-BaseTools.patch
index 0c3df4fc44..9359f8b1c2 100644
--- a/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools=
.patch
+++ b/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools=
.patch
@@ -1,7 +1,7 @@
-From 1125f5a02c2f327aeffe2d6b66a9d816ad2eeec0 Mon Sep 17 00:00:00 2001
+From 776ab58903b2c3b91e0825578a66108fc2d1d5a8 Mon Sep 17 00:00:00 2001
 From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
 Date: Thu, 9 Jun 2016 02:23:01 -0700
-Subject: [PATCH 1/6] ovmf: update path to native BaseTools
+Subject: [PATCH 1/4] ovmf: update path to native BaseTools
=20
 BaseTools is a set of utilities to build EDK-based firmware. These utiliti=
es
 are used during the build process. Thus, they need to be built natively.
@@ -29,5 +29,5 @@ index 91b1442ade..1858dae31a 100755
    source edksetup.sh BaseTools
  else
 --=20
-2.32.0
+2.34.1
=20
diff --git a/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-=
build-in-under-bitbake.patch b/meta/recipes-core/ovmf/ovmf/0002-BaseTools-m=
akefile-adjust-to-build-in-under-bitbake.patch
index 2293d7e938..8905f16798 100644
--- a/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-i=
n-under-bitbake.patch
+++ b/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-i=
n-under-bitbake.patch
@@ -1,7 +1,7 @@
-From 19d4c7f9812062a683b3ba60b35aac0461190456 Mon Sep 17 00:00:00 2001
+From 057f6a0fd3445241ec3ebea7f864a31ce1fe154c Mon Sep 17 00:00:00 2001
 From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
 Date: Fri, 26 Jul 2019 17:34:26 -0400
-Subject: [PATCH 2/6] BaseTools: makefile: adjust to build in under bitbake
+Subject: [PATCH 2/4] BaseTools: makefile: adjust to build in under bitbake
=20
 Prepend the build flags with those of bitbake. This is to build
 using the bitbake native sysroot include and library directories.
@@ -18,10 +18,10 @@ Upstream-Status: Inappropriate [needs to be converted t=
o in-recipe fixups]
  1 file changed, 9 insertions(+), 8 deletions(-)
=20
 diff --git a/BaseTools/Source/C/Makefiles/header.makefile b/BaseTools/Sour=
ce/C/Makefiles/header.makefile
-index 0df728f327..1299d47c87 100644
+index 4e88a4fbd8..59f45c07c3 100644
 --- a/BaseTools/Source/C/Makefiles/header.makefile
 +++ b/BaseTools/Source/C/Makefiles/header.makefile
-@@ -75,35 +75,36 @@ $(error Bad HOST_ARCH)
+@@ -81,35 +81,36 @@ $(error Bad HOST_ARCH)
  endif=0D
  =0D
  INCLUDE =3D $(TOOL_INCLUDE) -I $(MAKEROOT) -I $(MAKEROOT)/Include/Common =
-I $(MAKEROOT)/Include/ -I $(MAKEROOT)/Include/IndustryStandard -I $(MAKERO=
OT)/Common/ -I .. -I . $(ARCH_INCLUDE)=0D
@@ -67,5 +67,5 @@ index 0df728f327..1299d47c87 100644
  #=0D
  # Snow Leopard  is a 32-bit and 64-bit environment. uname -m returns i386=
, but gcc defaults=0D
 --=20
-2.32.0
+2.34.1
=20
diff --git a/meta/recipes-core/ovmf/ovmf/0005-debug-prefix-map.patch b/meta=
/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch
similarity index 86%
rename from meta/recipes-core/ovmf/ovmf/0005-debug-prefix-map.patch
rename to meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch
index 9e345f4dda..8a06b402b8 100644
--- a/meta/recipes-core/ovmf/ovmf/0005-debug-prefix-map.patch
+++ b/meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch
@@ -1,7 +1,7 @@
-From 860bb1979f3578bb83257076fe0f3bd33f9d68bf Mon Sep 17 00:00:00 2001
+From 95abc2c82476d4f0aadd010c21d8aa31971173c6 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 14 Jun 2021 19:56:28 +0200
-Subject: [PATCH 5/6] debug prefix map
+Subject: [PATCH 3/4] debug prefix map
=20
 We want to pass ${DEBUG_PREFIX_MAP} to gcc commands and also pass in
  --debug-prefix-map to nasm (we carry a patch to nasm for this). The
@@ -22,10 +22,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.co=
m>
  1 file changed, 9 insertions(+), 9 deletions(-)
=20
 diff --git a/BaseTools/Conf/tools_def.template b/BaseTools/Conf/tools_def.=
template
-index 36241b6ede..947fbf2e8d 100755
+index c4e4c7ded0..058205da72 100755
 --- a/BaseTools/Conf/tools_def.template
 +++ b/BaseTools/Conf/tools_def.template
-@@ -1863,7 +1863,7 @@ NOOPT_*_*_OBJCOPY_ADDDEBUGFLAG     =3D --add-gnu-deb=
uglink=3D$(DEBUG_DIR)/$(MODULE_N
+@@ -1849,7 +1849,7 @@ NOOPT_*_*_OBJCOPY_ADDDEBUGFLAG     =3D --add-gnu-deb=
uglink=3D$(DEBUG_DIR)/$(MODULE_N
  *_*_*_DTCPP_PATH                   =3D DEF(DTCPP_BIN)=0D
  *_*_*_DTC_PATH                     =3D DEF(DTC_BIN)=0D
  =0D
@@ -34,9 +34,9 @@ index 36241b6ede..947fbf2e8d 100755
  DEFINE GCC_IA32_CC_FLAGS           =3D DEF(GCC_ALL_CC_FLAGS) -m32 -malign=
-double -freorder-blocks -freorder-blocks-and-partition -O2 -mno-stack-arg-=
probe=0D
  DEFINE GCC_X64_CC_FLAGS            =3D DEF(GCC_ALL_CC_FLAGS) -mno-red-zon=
e -Wno-address -mno-stack-arg-probe=0D
  DEFINE GCC_ARM_CC_FLAGS            =3D DEF(GCC_ALL_CC_FLAGS) -mlittle-end=
ian -mabi=3Daapcs -fno-short-enums -funsigned-char -ffunction-sections -fda=
ta-sections -fomit-frame-pointer -Wno-address -mthumb -mfloat-abi=3Dsoft -f=
no-pic -fno-pie=0D
-@@ -1881,8 +1881,8 @@ DEFINE GCC_IA32_X64_ASLDLINK_FLAGS =3D DEF(GCC_IA32_=
X64_DLINK_COMMON) --entry _Ref
- DEFINE GCC_ARM_ASLDLINK_FLAGS      =3D DEF(GCC_ARM_DLINK_FLAGS) -Wl,--ent=
ry,ReferenceAcpiTable -u $(IMAGE_ENTRY_POINT) DEF(GCC_ARM_AARCH64_ASLDLINK_=
FLAGS)=0D
+@@ -1871,8 +1871,8 @@ DEFINE GCC_ARM_ASLDLINK_FLAGS      =3D DEF(GCC_ARM_D=
LINK_FLAGS) -Wl,--entry,Refere
  DEFINE GCC_AARCH64_ASLDLINK_FLAGS  =3D DEF(GCC_AARCH64_DLINK_FLAGS) -Wl,-=
-entry,ReferenceAcpiTable -u $(IMAGE_ENTRY_POINT) DEF(GCC_ARM_AARCH64_ASLDL=
INK_FLAGS)=0D
+ DEFINE GCC_LOONGARCH64_ASLDLINK_FLAGS =3D DEF(GCC_LOONGARCH64_DLINK_FLAGS=
) -Wl,--entry,ReferenceAcpiTable -u $(IMAGE_ENTRY_POINT)=0D
  DEFINE GCC_IA32_X64_DLINK_FLAGS    =3D DEF(GCC_IA32_X64_DLINK_COMMON) --e=
ntry _$(IMAGE_ENTRY_POINT) --file-alignment 0x20 --section-alignment 0x20 -=
Map $(DEST_DIR_DEBUG)/$(BASE_NAME).map=0D
 -DEFINE GCC_ASM_FLAGS               =3D -c -x assembler -imacros AutoGen.h=
=0D
 -DEFINE GCC_PP_FLAGS                =3D -E -x assembler-with-cpp -include =
AutoGen.h=0D
@@ -45,7 +45,7 @@ index 36241b6ede..947fbf2e8d 100755
  DEFINE GCC_VFRPP_FLAGS             =3D -x c -E -P -DVFRCOMPILE --include =
$(MODULE_NAME)StrDefs.h=0D
  DEFINE GCC_ASLPP_FLAGS             =3D -x c -E -include AutoGen.h=0D
  DEFINE GCC_ASLCC_FLAGS             =3D -x c=0D
-@@ -2027,7 +2027,7 @@ DEFINE GCC_PP_FLAGS                        =3D -E -x=
 assembler-with-cpp -include A
+@@ -2026,7 +2026,7 @@ DEFINE GCC_PP_FLAGS                        =3D -E -x=
 assembler-with-cpp -include A
  *_GCC48_IA32_DLINK2_FLAGS         =3D DEF(GCC48_IA32_DLINK2_FLAGS)=0D
  *_GCC48_IA32_RC_FLAGS             =3D DEF(GCC_IA32_RC_FLAGS)=0D
  *_GCC48_IA32_OBJCOPY_FLAGS        =3D=0D
@@ -54,7 +54,7 @@ index 36241b6ede..947fbf2e8d 100755
  =0D
    DEBUG_GCC48_IA32_CC_FLAGS       =3D DEF(GCC48_IA32_CC_FLAGS) -Os=0D
  RELEASE_GCC48_IA32_CC_FLAGS       =3D DEF(GCC48_IA32_CC_FLAGS) -Os -Wno-u=
nused-but-set-variable=0D
-@@ -2055,7 +2055,7 @@ RELEASE_GCC48_IA32_CC_FLAGS       =3D DEF(GCC48_IA32=
_CC_FLAGS) -Os -Wno-unused-but
+@@ -2054,7 +2054,7 @@ RELEASE_GCC48_IA32_CC_FLAGS       =3D DEF(GCC48_IA32=
_CC_FLAGS) -Os -Wno-unused-but
  *_GCC48_X64_DLINK2_FLAGS         =3D DEF(GCC48_X64_DLINK2_FLAGS)=0D
  *_GCC48_X64_RC_FLAGS             =3D DEF(GCC_X64_RC_FLAGS)=0D
  *_GCC48_X64_OBJCOPY_FLAGS        =3D=0D
@@ -63,7 +63,7 @@ index 36241b6ede..947fbf2e8d 100755
  =0D
    DEBUG_GCC48_X64_CC_FLAGS       =3D DEF(GCC48_X64_CC_FLAGS) -Os=0D
  RELEASE_GCC48_X64_CC_FLAGS       =3D DEF(GCC48_X64_CC_FLAGS) -Os -Wno-unu=
sed-but-set-variable=0D
-@@ -2167,7 +2167,7 @@ RELEASE_GCC48_AARCH64_CC_FLAGS   =3D DEF(GCC48_AARCH=
64_CC_FLAGS) -Wno-unused-but-s
+@@ -2166,7 +2166,7 @@ RELEASE_GCC48_AARCH64_CC_FLAGS   =3D DEF(GCC48_AARCH=
64_CC_FLAGS) -Wno-unused-but-s
  *_GCC49_IA32_DLINK2_FLAGS         =3D DEF(GCC49_IA32_DLINK2_FLAGS)=0D
  *_GCC49_IA32_RC_FLAGS             =3D DEF(GCC_IA32_RC_FLAGS)=0D
  *_GCC49_IA32_OBJCOPY_FLAGS        =3D=0D
@@ -72,7 +72,7 @@ index 36241b6ede..947fbf2e8d 100755
  =0D
    DEBUG_GCC49_IA32_CC_FLAGS       =3D DEF(GCC49_IA32_CC_FLAGS) -Os=0D
  RELEASE_GCC49_IA32_CC_FLAGS       =3D DEF(GCC49_IA32_CC_FLAGS) -Os -Wno-u=
nused-but-set-variable -Wno-unused-const-variable=0D
-@@ -2195,7 +2195,7 @@ RELEASE_GCC49_IA32_CC_FLAGS       =3D DEF(GCC49_IA32=
_CC_FLAGS) -Os -Wno-unused-but
+@@ -2194,7 +2194,7 @@ RELEASE_GCC49_IA32_CC_FLAGS       =3D DEF(GCC49_IA32=
_CC_FLAGS) -Os -Wno-unused-but
  *_GCC49_X64_DLINK2_FLAGS         =3D DEF(GCC49_X64_DLINK2_FLAGS)=0D
  *_GCC49_X64_RC_FLAGS             =3D DEF(GCC_X64_RC_FLAGS)=0D
  *_GCC49_X64_OBJCOPY_FLAGS        =3D=0D
@@ -81,7 +81,7 @@ index 36241b6ede..947fbf2e8d 100755
  =0D
    DEBUG_GCC49_X64_CC_FLAGS       =3D DEF(GCC49_X64_CC_FLAGS) -Os=0D
  RELEASE_GCC49_X64_CC_FLAGS       =3D DEF(GCC49_X64_CC_FLAGS) -Os -Wno-unu=
sed-but-set-variable -Wno-unused-const-variable=0D
-@@ -2313,7 +2313,7 @@ RELEASE_GCC49_AARCH64_DLINK_XIPFLAGS =3D -z common-p=
age-size=3D0x20
+@@ -2312,7 +2312,7 @@ RELEASE_GCC49_AARCH64_DLINK_XIPFLAGS =3D -z common-p=
age-size=3D0x20
  *_GCC5_IA32_DLINK2_FLAGS         =3D DEF(GCC5_IA32_DLINK2_FLAGS) -no-pie=
=0D
  *_GCC5_IA32_RC_FLAGS             =3D DEF(GCC_IA32_RC_FLAGS)=0D
  *_GCC5_IA32_OBJCOPY_FLAGS        =3D=0D
@@ -90,7 +90,7 @@ index 36241b6ede..947fbf2e8d 100755
  =0D
    DEBUG_GCC5_IA32_CC_FLAGS       =3D DEF(GCC5_IA32_CC_FLAGS) -flto -Os=0D
    DEBUG_GCC5_IA32_DLINK_FLAGS    =3D DEF(GCC5_IA32_X64_DLINK_FLAGS) -flto=
 -Os -Wl,-m,elf_i386,--oformat=3Delf32-i386=0D
-@@ -2345,7 +2345,7 @@ RELEASE_GCC5_IA32_DLINK_FLAGS    =3D DEF(GCC5_IA32_X=
64_DLINK_FLAGS) -flto -Os -Wl,
+@@ -2344,7 +2344,7 @@ RELEASE_GCC5_IA32_DLINK_FLAGS    =3D DEF(GCC5_IA32_X=
64_DLINK_FLAGS) -flto -Os -Wl,
  *_GCC5_X64_DLINK2_FLAGS          =3D DEF(GCC5_X64_DLINK2_FLAGS)=0D
  *_GCC5_X64_RC_FLAGS              =3D DEF(GCC_X64_RC_FLAGS)=0D
  *_GCC5_X64_OBJCOPY_FLAGS         =3D=0D
@@ -100,5 +100,5 @@ index 36241b6ede..947fbf2e8d 100755
    DEBUG_GCC5_X64_CC_FLAGS        =3D DEF(GCC5_X64_CC_FLAGS) -flto -DUSING=
_LTO -Os=0D
    DEBUG_GCC5_X64_DLINK_FLAGS     =3D DEF(GCC5_X64_DLINK_FLAGS) -flto -Os=
=0D
 --=20
-2.32.0
+2.34.1
=20
diff --git a/meta/recipes-core/ovmf/ovmf/0006-reproducible.patch b/meta/rec=
ipes-core/ovmf/ovmf/0004-reproducible.patch
similarity index 92%
rename from meta/recipes-core/ovmf/ovmf/0006-reproducible.patch
rename to meta/recipes-core/ovmf/ovmf/0004-reproducible.patch
index 846f408012..8618aec78a 100644
--- a/meta/recipes-core/ovmf/ovmf/0006-reproducible.patch
+++ b/meta/recipes-core/ovmf/ovmf/0004-reproducible.patch
@@ -1,7 +1,7 @@
-From 27ed9962f5cb3afcc44d6c96c53277132a999712 Mon Sep 17 00:00:00 2001
+From c956527bcc5c0102f70994255c88c0ce4dcaa167 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 14 Jun 2021 19:57:30 +0200
-Subject: [PATCH 6/6] reproducible
+Subject: [PATCH 4/4] reproducible
=20
 This patch fixes various things which make the build more reproducible. So=
me changes
 here only change intermediate artefacts but that means when you have two b=
uild trees
@@ -35,10 +35,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.co=
m>
  4 files changed, 24 insertions(+), 16 deletions(-)
=20
 diff --git a/BaseTools/Source/C/GenFw/Elf64Convert.c b/BaseTools/Source/C/=
GenFw/Elf64Convert.c
-index d097db8632..a87ae6f3d0 100644
+index 8b50774beb..933fc138a1 100644
 --- a/BaseTools/Source/C/GenFw/Elf64Convert.c
 +++ b/BaseTools/Source/C/GenFw/Elf64Convert.c
-@@ -14,6 +14,8 @@ SPDX-License-Identifier: BSD-2-Clause-Patent
+@@ -15,6 +15,8 @@ SPDX-License-Identifier: BSD-2-Clause-Patent
  #ifndef __GNUC__=0D
  #include <windows.h>=0D
  #include <io.h>=0D
@@ -47,7 +47,7 @@ index d097db8632..a87ae6f3d0 100644
  #endif=0D
  #include <assert.h>=0D
  #include <stdio.h>=0D
-@@ -769,7 +771,7 @@ ScanSections64 (
+@@ -940,7 +942,7 @@ ScanSections64 (
    }=0D
    mCoffOffset =3D mDebugOffset + sizeof(EFI_IMAGE_DEBUG_DIRECTORY_ENTRY) =
+=0D
                  sizeof(EFI_IMAGE_DEBUG_CODEVIEW_NB10_ENTRY) +=0D
@@ -56,7 +56,7 @@ index d097db8632..a87ae6f3d0 100644
  =0D
    mCoffOffset =3D CoffAlign(mCoffOffset);=0D
    if (SectionCount =3D=3D 0) {=0D
-@@ -1608,7 +1610,7 @@ WriteDebug64 (
+@@ -2200,7 +2202,7 @@ WriteDebug64 (
    EFI_IMAGE_DEBUG_DIRECTORY_ENTRY     *Dir;=0D
    EFI_IMAGE_DEBUG_CODEVIEW_NB10_ENTRY *Nb10;=0D
  =0D
@@ -65,7 +65,7 @@ index d097db8632..a87ae6f3d0 100644
  =0D
    Dir =3D (EFI_IMAGE_DEBUG_DIRECTORY_ENTRY*)(mCoffFile + mDebugOffset);=0D
    Dir->Type =3D EFI_IMAGE_DEBUG_TYPE_CODEVIEW;=0D
-@@ -1618,7 +1620,7 @@ WriteDebug64 (
+@@ -2210,7 +2212,7 @@ WriteDebug64 (
  =0D
    Nb10 =3D (EFI_IMAGE_DEBUG_CODEVIEW_NB10_ENTRY*)(Dir + 1);=0D
    Nb10->Signature =3D CODEVIEW_SIGNATURE_NB10;=0D
@@ -75,7 +75,7 @@ index d097db8632..a87ae6f3d0 100644
  =0D
    NtHdr =3D (EFI_IMAGE_OPTIONAL_HEADER_UNION *)(mCoffFile + mNtHdrOffset)=
;=0D
 diff --git a/BaseTools/Source/Python/AutoGen/BuildEngine.py b/BaseTools/So=
urce/Python/AutoGen/BuildEngine.py
-index 722fead75a..8f1c236970 100644
+index 752a1a1f6a..02054cccf8 100644
 --- a/BaseTools/Source/Python/AutoGen/BuildEngine.py
 +++ b/BaseTools/Source/Python/AutoGen/BuildEngine.py
 @@ -70,6 +70,9 @@ class TargetDescBlock(object):
@@ -89,7 +89,7 @@ index 722fead75a..8f1c236970 100644
          if Input not in self.Inputs:=0D
              self.Inputs.append(Input)=0D
 diff --git a/BaseTools/Source/Python/AutoGen/GenMake.py b/BaseTools/Source=
/Python/AutoGen/GenMake.py
-index 961b2ab1c3..23c1592025 100755
+index daec9c6d54..0e8cc20efe 100755
 --- a/BaseTools/Source/Python/AutoGen/GenMake.py
 +++ b/BaseTools/Source/Python/AutoGen/GenMake.py
 @@ -575,7 +575,7 @@ cleanlib:
@@ -153,10 +153,10 @@ index 961b2ab1c3..23c1592025 100755
                  if T.GenFileListMacro and T.FileListMacro not in self.Fil=
eListMacros:=0D
                      self.FileListMacros[T.FileListMacro] =3D []=0D
 diff --git a/BaseTools/Source/Python/AutoGen/ModuleAutoGen.py b/BaseTools/=
Source/Python/AutoGen/ModuleAutoGen.py
-index d70b0d7ae8..25dca9a6df 100755
+index d05410b329..99b3f64aba 100755
 --- a/BaseTools/Source/Python/AutoGen/ModuleAutoGen.py
 +++ b/BaseTools/Source/Python/AutoGen/ModuleAutoGen.py
-@@ -1484,6 +1484,9 @@ class ModuleAutoGen(AutoGen):
+@@ -1474,6 +1474,9 @@ class ModuleAutoGen(AutoGen):
              for File in Files:=0D
                  if File.lower().endswith('.pdb'):=0D
                      AsBuiltInfDict['binary_item'].append('DISPOSABLE|' + =
File)=0D
@@ -166,7 +166,7 @@ index d70b0d7ae8..25dca9a6df 100755
          HeaderComments =3D self.Module.HeaderComments=0D
          StartPos =3D 0=0D
          for Index in range(len(HeaderComments)):=0D
-@@ -1759,7 +1762,7 @@ class ModuleAutoGen(AutoGen):
+@@ -1749,7 +1752,7 @@ class ModuleAutoGen(AutoGen):
              if os.path.exists (self.TimeStampPath):=0D
                  os.remove (self.TimeStampPath)=0D
  =0D
@@ -176,5 +176,5 @@ index d70b0d7ae8..25dca9a6df 100755
          # Ignore generating makefile when it is a binary module=0D
          if self.IsBinaryModule:=0D
 --=20
-2.32.0
+2.34.1
=20
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index d1bf8b080d..73c6a060d8 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -22,12 +22,12 @@ BUILD_CFLAGS +=3D "-Wno-error=3Dstringop-overflow"
 SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=3Dmaster;protoco=
l=3Dhttps \
            file://0001-ovmf-update-path-to-native-BaseTools.patch \
            file://0002-BaseTools-makefile-adjust-to-build-in-under-bitbake=
.patch \
-           file://0005-debug-prefix-map.patch \
-           file://0006-reproducible.patch \
+           file://0003-debug-prefix-map.patch \
+           file://0004-reproducible.patch \
            "
=20
-PV =3D "edk2-stable202208"
-SRCREV =3D "ba0e0e4c6a174b71b18ccd6e47319cc45878893c"
+PV =3D "edk2-stable202211"
+SRCREV =3D "fff6d81270b57ee786ea18ad74f43149b9f03494"
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>edk2-stable.*)"
=20
 inherit deploy
--=20
2.34.1


