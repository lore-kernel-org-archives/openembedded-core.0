Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.6419.1623744772395314786
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jun 2021 01:12:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lQQjVG2e;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id g8so21078176ejx.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jun 2021 01:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4+XI+uj9xsu7RL4hp17sQz4Yd8IXft+AeUR4+li0pC4=;
        b=lQQjVG2eiWhPaaSW5dSUbNAbLaILueSnUsms1yoT+aJCsuvq72D/L48sshSCuOSCzc
         fRLuzkJw5/jyLd+/V7ZmjMuSJ97ON4qKiDVj4BE6CEkeLFJE8AdPbCAOPcx0OBXpxdDK
         rolxmQmI/ql7Ea+PYCpj5VjT9XR44GJgpJCdNPUmxxNMNbIJLFd8ZCjSrelwVIHuiZX1
         FuQuGedaxhIk5oK4l+soHoCnQjhgiY7sYpFuTVAKRIzRAaFpJv03USU1Cx+GsYGKjKWH
         eP8Ml3uyV3aALCuW44sjVhbw8zNgtD6+lHqeLjlIfu2Aa8caEw+Ra86xfqWsGVGuY8Oj
         OmiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4+XI+uj9xsu7RL4hp17sQz4Yd8IXft+AeUR4+li0pC4=;
        b=GX0CCqkf64/Sdiyex9QifchucqMmKuRJQlFYdTu3cy7mY6H883/bmCvHKwbDd11Liv
         FibNr40qSmTgSN6IOefBAGRigdC6nh/0uv1m5LYWZ0RuCxdncqsnjtK/mneMJy3yEmgg
         zg24YXUahs4rhLByv4VgrladPIJthNqP9DjS7NJm7nvcBjRnJ5bT7um3A0nWypP7+/wi
         /xxcCe1oZ1PszCKs2LGr6meK75TH0Hqpm6z7737gPgLytrse7mNduPRUA4rboY5h4pjB
         n0IkwfN+Ntp7JG5B6HLjnD/r2tKek1PTMyqGnSlaocGAuSUKRci3VCgnM+Mg4ZfNnioV
         8C5A==
X-Gm-Message-State: AOAM533VVcYvfbfGkZycno7ov6Dtno8X0F6PD8+ir/jeyePBt1qMXrZH
	eDZz1AF5pt3jAjwmr49e946OVxAQAgCH4A==
X-Google-Smtp-Source: ABdhPJwnZjqwq/uhKZZinXBs8PvTctMP8Oh5QcDEAx4CpaH6GMH/Kwv47/ErXYc5LuDsoXyeS1Zutw==
X-Received: by 2002:a17:906:7c10:: with SMTP id t16mr18779066ejo.204.1623744770568;
        Tue, 15 Jun 2021 01:12:50 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id d2sm9118602ejo.13.2021.06.15.01.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 01:12:50 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 08/31] ovmf: update 2021.02 -> 2021.05
Date: Tue, 15 Jun 2021 10:12:17 +0200
Message-Id: <20210615081240.1734087-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615081240.1734087-1-alex.kanavin@gmail.com>
References: <20210615081240.1734087-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Reformat patches using git, so that rebasing them to newer versions is easi=
er.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ovmf-update-path-to-native-BaseTools.patch |   7 +-
 ...ile-adjust-to-build-in-under-bitbake.patch |  11 +-
 ...patch =3D> 0003-ovmf-Update-to-latest.patch} |  13 +-
 .../ovmf/ovmf/0004-Strip-build-paths.patch    |  32 ++++
 ..._map.patch =3D> 0005-debug-prefix-map.patch} |  43 +++--
 ...oducible.patch =3D> 0006-reproducible.patch} | 153 ++++++++++--------
 meta/recipes-core/ovmf/ovmf/zero.patch        |  84 ----------
 meta/recipes-core/ovmf/ovmf_git.bb            |  12 +-
 8 files changed, 163 insertions(+), 192 deletions(-)
 rename meta/recipes-core/ovmf/ovmf/{0004-ovmf-Update-to-latest.patch =3D> =
0003-ovmf-Update-to-latest.patch} (91%)
 create mode 100644 meta/recipes-core/ovmf/ovmf/0004-Strip-build-paths.patch
 rename meta/recipes-core/ovmf/ovmf/{debug_prefix_map.patch =3D> 0005-debug=
-prefix-map.patch} (78%)
 rename meta/recipes-core/ovmf/ovmf/{reproducible.patch =3D> 0006-reproduci=
ble.patch} (76%)
 delete mode 100644 meta/recipes-core/ovmf/ovmf/zero.patch

diff --git a/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-Ba=
seTools.patch b/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native=
-BaseTools.patch
index c32963a807..89d9ffab5e 100644
--- a/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools=
.patch
+++ b/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools=
.patch
@@ -1,7 +1,7 @@
-From 200ff35c6545b4ab85f5ea7a6096fbaec3d82f6d Mon Sep 17 00:00:00 2001
+From 1125f5a02c2f327aeffe2d6b66a9d816ad2eeec0 Mon Sep 17 00:00:00 2001
 From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
 Date: Thu, 9 Jun 2016 02:23:01 -0700
-Subject: [PATCH 1/4] ovmf: update path to native BaseTools
+Subject: [PATCH 1/6] ovmf: update path to native BaseTools
=20
 BaseTools is a set of utilities to build EDK-based firmware. These utiliti=
es
 are used during the build process. Thus, they need to be built natively.
@@ -11,7 +11,6 @@ with the appropriate location before building.
=20
 Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
 Upstream-Status: Pending
-
 ---
  OvmfPkg/build.sh | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -30,5 +29,5 @@ index 91b1442ade..1858dae31a 100755
    source edksetup.sh BaseTools
  else
 --=20
-2.28.0
+2.32.0
=20
diff --git a/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-=
build-in-under-bitbake.patch b/meta/recipes-core/ovmf/ovmf/0002-BaseTools-m=
akefile-adjust-to-build-in-under-bitbake.patch
index c61a08f022..f6141c8af5 100644
--- a/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-i=
n-under-bitbake.patch
+++ b/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-i=
n-under-bitbake.patch
@@ -1,23 +1,22 @@
-From 667c0cf97dadc4f5994d26ec3984f559a05ec406 Mon Sep 17 00:00:00 2001
+From 19d4c7f9812062a683b3ba60b35aac0461190456 Mon Sep 17 00:00:00 2001
 From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
 Date: Fri, 26 Jul 2019 17:34:26 -0400
-Subject: [PATCH 2/4] BaseTools: makefile: adjust to build in under bitbake
+Subject: [PATCH 2/6] BaseTools: makefile: adjust to build in under bitbake
=20
 Prepend the build flags with those of bitbake. This is to build
 using the bitbake native sysroot include and library directories.
=20
 Signed-off-by: Ricardo Neri <ricardo.neri@linux.intel.com>
 Upstream-Status: Pending
-
 ---
  BaseTools/Source/C/Makefiles/header.makefile | 17 +++++++++--------
  1 file changed, 9 insertions(+), 8 deletions(-)
=20
 diff --git a/BaseTools/Source/C/Makefiles/header.makefile b/BaseTools/Sour=
ce/C/Makefiles/header.makefile
-index 1c105ee7d4..d5eea3864e 100644
+index 0df728f327..1299d47c87 100644
 --- a/BaseTools/Source/C/Makefiles/header.makefile
 +++ b/BaseTools/Source/C/Makefiles/header.makefile
-@@ -69,35 +69,36 @@ $(error Bad HOST_ARCH)
+@@ -75,35 +75,36 @@ $(error Bad HOST_ARCH)
  endif=0D
  =0D
  INCLUDE =3D $(TOOL_INCLUDE) -I $(MAKEROOT) -I $(MAKEROOT)/Include/Common =
-I $(MAKEROOT)/Include/ -I $(MAKEROOT)/Include/IndustryStandard -I $(MAKERO=
OT)/Common/ -I .. -I . $(ARCH_INCLUDE)=0D
@@ -63,5 +62,5 @@ index 1c105ee7d4..d5eea3864e 100644
  #=0D
  # Snow Leopard  is a 32-bit and 64-bit environment. uname -m returns i386=
, but gcc defaults=0D
 --=20
-2.28.0
+2.32.0
=20
diff --git a/meta/recipes-core/ovmf/ovmf/0004-ovmf-Update-to-latest.patch b=
/meta/recipes-core/ovmf/ovmf/0003-ovmf-Update-to-latest.patch
similarity index 91%
rename from meta/recipes-core/ovmf/ovmf/0004-ovmf-Update-to-latest.patch
rename to meta/recipes-core/ovmf/ovmf/0003-ovmf-Update-to-latest.patch
index 128438b201..d710429899 100644
--- a/meta/recipes-core/ovmf/ovmf/0004-ovmf-Update-to-latest.patch
+++ b/meta/recipes-core/ovmf/ovmf/0003-ovmf-Update-to-latest.patch
@@ -1,7 +1,7 @@
-From ad06fcf1e08736e79221cd6863ff2e3c9254f261 Mon Sep 17 00:00:00 2001
+From 67267d8cc31df16a3608cad1a17c5f1470ef8bbd Mon Sep 17 00:00:00 2001
 From: Steve Langasek <steve.langasek@ubuntu.com>
 Date: Sat, 10 Jun 2017 01:39:36 -0700
-Subject: [PATCH 4/4] ovmf: Update to latest
+Subject: [PATCH 3/6] ovmf: Update to latest
=20
 Description: pass -fno-stack-protector to all GCC toolchains
  The upstream build rules inexplicably pass -fno-stack-protector only
@@ -9,16 +9,15 @@ Description: pass -fno-stack-protector to all GCC toolcha=
ins
  generic rules for gcc 4.4 and later.
 Last-Updated: 2016-04-12
 Upstream-Status: Pending
-
 ---
  BaseTools/Conf/tools_def.template | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
=20
 diff --git a/BaseTools/Conf/tools_def.template b/BaseTools/Conf/tools_def.=
template
-index 933b3160fd..c2fbbf0c38 100755
+index 498696e583..36241b6ede 100755
 --- a/BaseTools/Conf/tools_def.template
 +++ b/BaseTools/Conf/tools_def.template
-@@ -1952,10 +1952,10 @@ DEFINE GCC_RISCV64_RC_FLAGS        =3D -I binary -=
O elf64-littleriscv   -B riscv
+@@ -1897,10 +1897,10 @@ DEFINE GCC_RISCV64_RC_FLAGS        =3D -I binary -=
O elf64-littleriscv   -B riscv
  # GCC Build Flag for included header file list generation=0D
  DEFINE GCC_DEPS_FLAGS              =3D -MMD -MF $@.deps=0D
  =0D
@@ -32,7 +31,7 @@ index 933b3160fd..c2fbbf0c38 100755
  DEFINE GCC48_IA32_X64_ASLDLINK_FLAGS =3D DEF(GCC48_IA32_X64_DLINK_COMMON)=
 -Wl,--entry,ReferenceAcpiTable -u ReferenceAcpiTable=0D
  DEFINE GCC48_IA32_X64_DLINK_FLAGS    =3D DEF(GCC48_IA32_X64_DLINK_COMMON)=
 -Wl,--entry,$(IMAGE_ENTRY_POINT) -u $(IMAGE_ENTRY_POINT) -Wl,-Map,$(DEST_D=
IR_DEBUG)/$(BASE_NAME).map,--whole-archive=0D
  DEFINE GCC48_IA32_DLINK2_FLAGS       =3D -Wl,--defsym=3DPECOFF_HEADER_SIZ=
E=3D0x220 DEF(GCC_DLINK2_FLAGS_COMMON)=0D
-@@ -1964,7 +1964,7 @@ DEFINE GCC48_X64_DLINK2_FLAGS        =3D -Wl,--defsy=
m=3DPECOFF_HEADER_SIZE=3D0x228 DEF
+@@ -1909,7 +1909,7 @@ DEFINE GCC48_X64_DLINK2_FLAGS        =3D -Wl,--defsy=
m=3DPECOFF_HEADER_SIZE=3D0x228 DEF
  DEFINE GCC48_ASM_FLAGS               =3D DEF(GCC_ASM_FLAGS)=0D
  DEFINE GCC48_ARM_ASM_FLAGS           =3D $(ARCHASM_FLAGS) $(PLATFORM_FLAG=
S) DEF(GCC_ASM_FLAGS) -mlittle-endian=0D
  DEFINE GCC48_AARCH64_ASM_FLAGS       =3D $(ARCHASM_FLAGS) $(PLATFORM_FLAG=
S) DEF(GCC_ASM_FLAGS) -mlittle-endian=0D
@@ -42,5 +41,5 @@ index 933b3160fd..c2fbbf0c38 100755
  DEFINE GCC48_AARCH64_CC_FLAGS        =3D $(ARCHCC_FLAGS) $(PLATFORM_FLAGS=
) -mcmodel=3Dlarge DEF(GCC_AARCH64_CC_FLAGS)=0D
  DEFINE GCC48_AARCH64_CC_XIPFLAGS     =3D DEF(GCC_AARCH64_CC_XIPFLAGS)=0D
 --=20
-2.28.0
+2.32.0
=20
diff --git a/meta/recipes-core/ovmf/ovmf/0004-Strip-build-paths.patch b/met=
a/recipes-core/ovmf/ovmf/0004-Strip-build-paths.patch
new file mode 100644
index 0000000000..dfb8a73398
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/0004-Strip-build-paths.patch
@@ -0,0 +1,32 @@
+From b7cfe97895e0586d14403ba98e62a0cd9373da96 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 14 Jun 2021 19:55:08 +0200
+Subject: [PATCH 4/6] Strip build paths
+
+Pass --zero to GenFw in release builds so that the sections that link back=
 to
+the intermediate binaries (containing build paths) are removed.
+
+Upstream-Status: Pending (discussion at https://bugzilla.tianocore.org/sho=
w_bug.cgi?id=3D3256)
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ OvmfPkg/OvmfPkgIa32.dsc | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/OvmfPkg/OvmfPkgIa32.dsc b/OvmfPkg/OvmfPkgIa32.dsc
+index 33fbd76790..06c6d5ce60 100644
+--- a/OvmfPkg/OvmfPkgIa32.dsc
++++ b/OvmfPkg/OvmfPkgIa32.dsc
+@@ -91,6 +91,8 @@
+ =0D
+ !include NetworkPkg/NetworkBuildOptions.dsc.inc=0D
+ =0D
++  RELEASE_*_*_GENFW_FLAGS =3D --zero=0D
++=0D
+ [BuildOptions.common.EDKII.DXE_RUNTIME_DRIVER]=0D
+   GCC:*_*_*_DLINK_FLAGS =3D -z common-page-size=3D0x1000=0D
+   XCODE:*_*_*_DLINK_FLAGS =3D -seg1addr 0x1000 -segalign 0x1000=0D
+--=20
+2.32.0
+
diff --git a/meta/recipes-core/ovmf/ovmf/debug_prefix_map.patch b/meta/reci=
pes-core/ovmf/ovmf/0005-debug-prefix-map.patch
similarity index 78%
rename from meta/recipes-core/ovmf/ovmf/debug_prefix_map.patch
rename to meta/recipes-core/ovmf/ovmf/0005-debug-prefix-map.patch
index 0165fae7ce..e467d6f152 100644
--- a/meta/recipes-core/ovmf/ovmf/debug_prefix_map.patch
+++ b/meta/recipes-core/ovmf/ovmf/0005-debug-prefix-map.patch
@@ -1,23 +1,31 @@
+From 860bb1979f3578bb83257076fe0f3bd33f9d68bf Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 14 Jun 2021 19:56:28 +0200
+Subject: [PATCH 5/6] debug prefix map
+
 We want to pass ${DEBUG_PREFIX_MAP} to gcc commands and also pass in
  --debug-prefix-map to nasm (we carry a patch to nasm for this). The
 tools definitions file is built by ovmf-native so we need to pass this in
 at target build time when we know the right values so we use the environme=
nt.
=20
-By using determininistc file paths during the ovmf build, it removes the=20
-opportunitity for gcc/ld to change the output binaries due to path lengths=
=20
-overflowing section sizes and causing small changes in the binary output.=
=20
+By using determininistc file paths during the ovmf build, it removes the
+opportunitity for gcc/ld to change the output binaries due to path lengths
+overflowing section sizes and causing small changes in the binary output.
 Previously we relied on the stripped output being the same which isn't alw=
ays
 the case if the size of the debug symbols varies.
=20
 Upstream-Status: Pending [gcc parts may be upstreamable, nasm patch isn't =
upstream yet]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ BaseTools/Conf/tools_def.template | 18 +++++++++---------
+ 1 file changed, 9 insertions(+), 9 deletions(-)
=20
-
-Index: git/BaseTools/Conf/tools_def.template
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- git.orig/BaseTools/Conf/tools_def.template
-+++ git/BaseTools/Conf/tools_def.template
-@@ -1918,7 +1918,7 @@ NOOPT_*_*_OBJCOPY_ADDDEBUGFLAG     =3D --a
+diff --git a/BaseTools/Conf/tools_def.template b/BaseTools/Conf/tools_def.=
template
+index 36241b6ede..947fbf2e8d 100755
+--- a/BaseTools/Conf/tools_def.template
++++ b/BaseTools/Conf/tools_def.template
+@@ -1863,7 +1863,7 @@ NOOPT_*_*_OBJCOPY_ADDDEBUGFLAG     =3D --add-gnu-deb=
uglink=3D$(DEBUG_DIR)/$(MODULE_N
  *_*_*_DTCPP_PATH                   =3D DEF(DTCPP_BIN)=0D
  *_*_*_DTC_PATH                     =3D DEF(DTC_BIN)=0D
  =0D
@@ -26,7 +34,7 @@ Index: git/BaseTools/Conf/tools_def.template
  DEFINE GCC_IA32_CC_FLAGS           =3D DEF(GCC_ALL_CC_FLAGS) -m32 -malign=
-double -freorder-blocks -freorder-blocks-and-partition -O2 -mno-stack-arg-=
probe=0D
  DEFINE GCC_X64_CC_FLAGS            =3D DEF(GCC_ALL_CC_FLAGS) -mno-red-zon=
e -Wno-address -mno-stack-arg-probe=0D
  DEFINE GCC_ARM_CC_FLAGS            =3D DEF(GCC_ALL_CC_FLAGS) -mlittle-end=
ian -mabi=3Daapcs -fno-short-enums -funsigned-char -ffunction-sections -fda=
ta-sections -fomit-frame-pointer -Wno-address -mthumb -mfloat-abi=3Dsoft -f=
no-pic -fno-pie=0D
-@@ -1936,8 +1936,8 @@ DEFINE GCC_IA32_X64_ASLDLINK_FLAGS =3D -fu
+@@ -1881,8 +1881,8 @@ DEFINE GCC_IA32_X64_ASLDLINK_FLAGS =3D DEF(GCC_IA32_=
X64_DLINK_COMMON) --entry _Ref
  DEFINE GCC_ARM_ASLDLINK_FLAGS      =3D DEF(GCC_ARM_DLINK_FLAGS) -Wl,--ent=
ry,ReferenceAcpiTable -u $(IMAGE_ENTRY_POINT) DEF(GCC_ARM_AARCH64_ASLDLINK_=
FLAGS)=0D
  DEFINE GCC_AARCH64_ASLDLINK_FLAGS  =3D DEF(GCC_AARCH64_DLINK_FLAGS) -Wl,-=
-entry,ReferenceAcpiTable -u $(IMAGE_ENTRY_POINT) DEF(GCC_ARM_AARCH64_ASLDL=
INK_FLAGS)=0D
  DEFINE GCC_IA32_X64_DLINK_FLAGS    =3D DEF(GCC_IA32_X64_DLINK_COMMON) --e=
ntry _$(IMAGE_ENTRY_POINT) --file-alignment 0x20 --section-alignment 0x20 -=
Map $(DEST_DIR_DEBUG)/$(BASE_NAME).map=0D
@@ -37,7 +45,7 @@ Index: git/BaseTools/Conf/tools_def.template
  DEFINE GCC_VFRPP_FLAGS             =3D -x c -E -P -DVFRCOMPILE --include =
$(MODULE_NAME)StrDefs.h=0D
  DEFINE GCC_ASLPP_FLAGS             =3D -x c -E -include AutoGen.h=0D
  DEFINE GCC_ASLCC_FLAGS             =3D -x c=0D
-@@ -2082,7 +2082,7 @@ DEFINE GCC_PP_FLAGS
+@@ -2027,7 +2027,7 @@ DEFINE GCC_PP_FLAGS                        =3D -E -x=
 assembler-with-cpp -include A
  *_GCC48_IA32_DLINK2_FLAGS         =3D DEF(GCC48_IA32_DLINK2_FLAGS)=0D
  *_GCC48_IA32_RC_FLAGS             =3D DEF(GCC_IA32_RC_FLAGS)=0D
  *_GCC48_IA32_OBJCOPY_FLAGS        =3D=0D
@@ -46,7 +54,7 @@ Index: git/BaseTools/Conf/tools_def.template
  =0D
    DEBUG_GCC48_IA32_CC_FLAGS       =3D DEF(GCC48_IA32_CC_FLAGS) -Os=0D
  RELEASE_GCC48_IA32_CC_FLAGS       =3D DEF(GCC48_IA32_CC_FLAGS) -Os -Wno-u=
nused-but-set-variable=0D
-@@ -2110,7 +2110,7 @@ RELEASE_GCC48_IA32_CC_FLAGS       =3D DEF(
+@@ -2055,7 +2055,7 @@ RELEASE_GCC48_IA32_CC_FLAGS       =3D DEF(GCC48_IA32=
_CC_FLAGS) -Os -Wno-unused-but
  *_GCC48_X64_DLINK2_FLAGS         =3D DEF(GCC48_X64_DLINK2_FLAGS)=0D
  *_GCC48_X64_RC_FLAGS             =3D DEF(GCC_X64_RC_FLAGS)=0D
  *_GCC48_X64_OBJCOPY_FLAGS        =3D=0D
@@ -55,7 +63,7 @@ Index: git/BaseTools/Conf/tools_def.template
  =0D
    DEBUG_GCC48_X64_CC_FLAGS       =3D DEF(GCC48_X64_CC_FLAGS) -Os=0D
  RELEASE_GCC48_X64_CC_FLAGS       =3D DEF(GCC48_X64_CC_FLAGS) -Os -Wno-unu=
sed-but-set-variable=0D
-@@ -2222,7 +2222,7 @@ RELEASE_GCC48_AARCH64_CC_FLAGS   =3D DEF(G
+@@ -2167,7 +2167,7 @@ RELEASE_GCC48_AARCH64_CC_FLAGS   =3D DEF(GCC48_AARCH=
64_CC_FLAGS) -Wno-unused-but-s
  *_GCC49_IA32_DLINK2_FLAGS         =3D DEF(GCC49_IA32_DLINK2_FLAGS)=0D
  *_GCC49_IA32_RC_FLAGS             =3D DEF(GCC_IA32_RC_FLAGS)=0D
  *_GCC49_IA32_OBJCOPY_FLAGS        =3D=0D
@@ -64,7 +72,7 @@ Index: git/BaseTools/Conf/tools_def.template
  =0D
    DEBUG_GCC49_IA32_CC_FLAGS       =3D DEF(GCC49_IA32_CC_FLAGS) -Os=0D
  RELEASE_GCC49_IA32_CC_FLAGS       =3D DEF(GCC49_IA32_CC_FLAGS) -Os -Wno-u=
nused-but-set-variable -Wno-unused-const-variable=0D
-@@ -2250,7 +2250,7 @@ RELEASE_GCC49_IA32_CC_FLAGS       =3D DEF(
+@@ -2195,7 +2195,7 @@ RELEASE_GCC49_IA32_CC_FLAGS       =3D DEF(GCC49_IA32=
_CC_FLAGS) -Os -Wno-unused-but
  *_GCC49_X64_DLINK2_FLAGS         =3D DEF(GCC49_X64_DLINK2_FLAGS)=0D
  *_GCC49_X64_RC_FLAGS             =3D DEF(GCC_X64_RC_FLAGS)=0D
  *_GCC49_X64_OBJCOPY_FLAGS        =3D=0D
@@ -73,7 +81,7 @@ Index: git/BaseTools/Conf/tools_def.template
  =0D
    DEBUG_GCC49_X64_CC_FLAGS       =3D DEF(GCC49_X64_CC_FLAGS) -Os=0D
  RELEASE_GCC49_X64_CC_FLAGS       =3D DEF(GCC49_X64_CC_FLAGS) -Os -Wno-unu=
sed-but-set-variable -Wno-unused-const-variable=0D
-@@ -2368,7 +2368,7 @@ RELEASE_GCC49_AARCH64_DLINK_XIPFLAGS =3D -
+@@ -2313,7 +2313,7 @@ RELEASE_GCC49_AARCH64_DLINK_XIPFLAGS =3D -z common-p=
age-size=3D0x20
  *_GCC5_IA32_DLINK2_FLAGS         =3D DEF(GCC5_IA32_DLINK2_FLAGS) -no-pie=
=0D
  *_GCC5_IA32_RC_FLAGS             =3D DEF(GCC_IA32_RC_FLAGS)=0D
  *_GCC5_IA32_OBJCOPY_FLAGS        =3D=0D
@@ -82,7 +90,7 @@ Index: git/BaseTools/Conf/tools_def.template
  =0D
    DEBUG_GCC5_IA32_CC_FLAGS       =3D DEF(GCC5_IA32_CC_FLAGS) -flto -Os=0D
    DEBUG_GCC5_IA32_DLINK_FLAGS    =3D DEF(GCC5_IA32_X64_DLINK_FLAGS) -flto=
 -Os -Wl,-m,elf_i386,--oformat=3Delf32-i386=0D
-@@ -2400,7 +2400,7 @@ RELEASE_GCC5_IA32_DLINK_FLAGS    =3D DEF(G
+@@ -2345,7 +2345,7 @@ RELEASE_GCC5_IA32_DLINK_FLAGS    =3D DEF(GCC5_IA32_X=
64_DLINK_FLAGS) -flto -Os -Wl,
  *_GCC5_X64_DLINK2_FLAGS          =3D DEF(GCC5_X64_DLINK2_FLAGS)=0D
  *_GCC5_X64_RC_FLAGS              =3D DEF(GCC_X64_RC_FLAGS)=0D
  *_GCC5_X64_OBJCOPY_FLAGS         =3D=0D
@@ -91,3 +99,6 @@ Index: git/BaseTools/Conf/tools_def.template
  =0D
    DEBUG_GCC5_X64_CC_FLAGS        =3D DEF(GCC5_X64_CC_FLAGS) -flto -DUSING=
_LTO -Os=0D
    DEBUG_GCC5_X64_DLINK_FLAGS     =3D DEF(GCC5_X64_DLINK_FLAGS) -flto -Os=
=0D
+--=20
+2.32.0
+
diff --git a/meta/recipes-core/ovmf/ovmf/reproducible.patch b/meta/recipes-=
core/ovmf/ovmf/0006-reproducible.patch
similarity index 76%
rename from meta/recipes-core/ovmf/ovmf/reproducible.patch
rename to meta/recipes-core/ovmf/ovmf/0006-reproducible.patch
index 5d2aeaacfe..343c21b541 100644
--- a/meta/recipes-core/ovmf/ovmf/reproducible.patch
+++ b/meta/recipes-core/ovmf/ovmf/0006-reproducible.patch
@@ -1,3 +1,8 @@
+From 27ed9962f5cb3afcc44d6c96c53277132a999712 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 14 Jun 2021 19:57:30 +0200
+Subject: [PATCH 6/6] reproducible
+
 This patch fixes various things which make the build more reproducible. So=
me changes
 here only change intermediate artefacts but that means when you have two b=
uild trees
 giving differing results, the differences can be isolated more easily. The=
 issues here
@@ -11,22 +16,83 @@ TMPDIR =3D "${TOPDIR}/tmp-inital-mylongpath-mylongpath-=
mylongpath-mylongpath-mylon
 The patch specifically:
=20
  * Sorts output in GNUmakefile
- * Always generates indirect flags files used to avoid pathlength issues e=
lse the=20
+ * Always generates indirect flags files used to avoid pathlength issues e=
lse the
    compile commands suddenly change when using longer paths
  * Sorts the AutoGenTimeStamp file contents
  * Makes the TargetDescBlock objects from BuildEngine sortable to allow th=
e makefile fix
- * Fix ElfConvert within GenFw so that only the basename of the binary bei=
ng converted=20
+ * Fix ElfConvert within GenFw so that only the basename of the binary bei=
ng converted
    is used, else the output from "GenFw XXX.bin" differs from "GenFw /long=
/path/XXX.bin"
    with sufficiently long paths
=20
 Upstream-Status: Pending [At least some of this might be interesting to up=
stream]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ BaseTools/Source/C/GenFw/Elf64Convert.c       |  8 ++++---
+ .../Source/Python/AutoGen/BuildEngine.py      |  3 +++
+ BaseTools/Source/Python/AutoGen/GenMake.py    | 24 +++++++++----------
+ .../Source/Python/AutoGen/ModuleAutoGen.py    |  5 +++-
+ 4 files changed, 24 insertions(+), 16 deletions(-)
=20
-Index: git/BaseTools/Source/Python/AutoGen/GenMake.py
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- git.orig/BaseTools/Source/Python/AutoGen/GenMake.py
-+++ git/BaseTools/Source/Python/AutoGen/GenMake.py
-@@ -571,7 +571,7 @@ cleanlib:
+diff --git a/BaseTools/Source/C/GenFw/Elf64Convert.c b/BaseTools/Source/C/=
GenFw/Elf64Convert.c
+index d097db8632..a87ae6f3d0 100644
+--- a/BaseTools/Source/C/GenFw/Elf64Convert.c
++++ b/BaseTools/Source/C/GenFw/Elf64Convert.c
+@@ -14,6 +14,8 @@ SPDX-License-Identifier: BSD-2-Clause-Patent
+ #ifndef __GNUC__=0D
+ #include <windows.h>=0D
+ #include <io.h>=0D
++#else=0D
++#define _GNU_SOURCE=0D
+ #endif=0D
+ #include <assert.h>=0D
+ #include <stdio.h>=0D
+@@ -769,7 +771,7 @@ ScanSections64 (
+   }=0D
+   mCoffOffset =3D mDebugOffset + sizeof(EFI_IMAGE_DEBUG_DIRECTORY_ENTRY) =
+=0D
+                 sizeof(EFI_IMAGE_DEBUG_CODEVIEW_NB10_ENTRY) +=0D
+-                strlen(mInImageName) + 1;=0D
++                strlen(basename(mInImageName)) + 1;=0D
+ =0D
+   mCoffOffset =3D CoffAlign(mCoffOffset);=0D
+   if (SectionCount =3D=3D 0) {=0D
+@@ -1608,7 +1610,7 @@ WriteDebug64 (
+   EFI_IMAGE_DEBUG_DIRECTORY_ENTRY     *Dir;=0D
+   EFI_IMAGE_DEBUG_CODEVIEW_NB10_ENTRY *Nb10;=0D
+ =0D
+-  Len =3D strlen(mInImageName) + 1;=0D
++  Len =3D strlen(basename(mInImageName)) + 1;=0D
+ =0D
+   Dir =3D (EFI_IMAGE_DEBUG_DIRECTORY_ENTRY*)(mCoffFile + mDebugOffset);=0D
+   Dir->Type =3D EFI_IMAGE_DEBUG_TYPE_CODEVIEW;=0D
+@@ -1618,7 +1620,7 @@ WriteDebug64 (
+ =0D
+   Nb10 =3D (EFI_IMAGE_DEBUG_CODEVIEW_NB10_ENTRY*)(Dir + 1);=0D
+   Nb10->Signature =3D CODEVIEW_SIGNATURE_NB10;=0D
+-  strcpy ((char *)(Nb10 + 1), mInImageName);=0D
++  strcpy ((char *)(Nb10 + 1), basename(mInImageName));=0D
+ =0D
+ =0D
+   NtHdr =3D (EFI_IMAGE_OPTIONAL_HEADER_UNION *)(mCoffFile + mNtHdrOffset)=
;=0D
+diff --git a/BaseTools/Source/Python/AutoGen/BuildEngine.py b/BaseTools/So=
urce/Python/AutoGen/BuildEngine.py
+index 722fead75a..8f1c236970 100644
+--- a/BaseTools/Source/Python/AutoGen/BuildEngine.py
++++ b/BaseTools/Source/Python/AutoGen/BuildEngine.py
+@@ -70,6 +70,9 @@ class TargetDescBlock(object):
+         else:=0D
+             return str(Other) =3D=3D self.Target.Path=0D
+ =0D
++    def __lt__(self, other):=0D
++        return str(self) < str(other)=0D
++=0D
+     def AddInput(self, Input):=0D
+         if Input not in self.Inputs:=0D
+             self.Inputs.append(Input)=0D
+diff --git a/BaseTools/Source/Python/AutoGen/GenMake.py b/BaseTools/Source=
/Python/AutoGen/GenMake.py
+index 961b2ab1c3..23c1592025 100755
+--- a/BaseTools/Source/Python/AutoGen/GenMake.py
++++ b/BaseTools/Source/Python/AutoGen/GenMake.py
+@@ -575,7 +575,7 @@ cleanlib:
                  os.remove(RespFileList)=0D
  =0D
          # convert source files and binary files to build targets=0D
@@ -35,7 +101,7 @@ Index: git/BaseTools/Source/Python/AutoGen/GenMake.py
          if len(self.ResultFileList) =3D=3D 0 and len(MyAgo.SourceFileList=
) !=3D 0:=0D
              EdkLogger.error("build", AUTOGEN_ERROR, "Nothing to build",=0D
                              ExtraData=3D"[%s]" % str(MyAgo))=0D
-@@ -722,7 +722,7 @@ cleanlib:
+@@ -726,7 +726,7 @@ cleanlib:
          OutputFile =3D ''=0D
          DepsFileList =3D []=0D
  =0D
@@ -44,7 +110,7 @@ Index: git/BaseTools/Source/Python/AutoGen/GenMake.py
              if Cmd[2]:=0D
                  for CopyCmd in Cmd[2]:=0D
                      Src, Dst =3D CopyCmd=0D
-@@ -755,7 +755,7 @@ cleanlib:
+@@ -759,7 +759,7 @@ cleanlib:
              self.BuildTargetList.append('\t%s' % CmdString)=0D
  =0D
              self.ParseSecCmd(DepsFileList, Cmd[1])=0D
@@ -53,7 +119,7 @@ Index: git/BaseTools/Source/Python/AutoGen/GenMake.py
                  self.BuildTargetList.append('%s : %s' % (self.ReplaceMacr=
o(SecOutputFile), self.ReplaceMacro(SecDepsFile)))=0D
                  self.BuildTargetList.append('\t%s' % self.ReplaceMacro(Se=
cCmd))=0D
              self.FfsOutputFileList =3D []=0D
-@@ -794,13 +794,13 @@ cleanlib:
+@@ -798,13 +798,13 @@ cleanlib:
  =0D
      def CommandExceedLimit(self):=0D
          FlagDict =3D {=0D
@@ -74,7 +140,7 @@ Index: git/BaseTools/Source/Python/AutoGen/GenMake.py
                     }=0D
  =0D
          RespDict =3D {}=0D
-@@ -1003,9 +1003,9 @@ cleanlib:
+@@ -1007,9 +1007,9 @@ cleanlib:
                  if not self.ObjTargetDict.get(T.Target.SubDir):=0D
                      self.ObjTargetDict[T.Target.SubDir] =3D set()=0D
                  self.ObjTargetDict[T.Target.SubDir].add(NewFile)=0D
@@ -86,10 +152,10 @@ Index: git/BaseTools/Source/Python/AutoGen/GenMake.py
                  # Generate related macros if needed=0D
                  if T.GenFileListMacro and T.FileListMacro not in self.Fil=
eListMacros:=0D
                      self.FileListMacros[T.FileListMacro] =3D []=0D
-Index: git/BaseTools/Source/Python/AutoGen/ModuleAutoGen.py
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- git.orig/BaseTools/Source/Python/AutoGen/ModuleAutoGen.py
-+++ git/BaseTools/Source/Python/AutoGen/ModuleAutoGen.py
+diff --git a/BaseTools/Source/Python/AutoGen/ModuleAutoGen.py b/BaseTools/=
Source/Python/AutoGen/ModuleAutoGen.py
+index d70b0d7ae8..25dca9a6df 100755
+--- a/BaseTools/Source/Python/AutoGen/ModuleAutoGen.py
++++ b/BaseTools/Source/Python/AutoGen/ModuleAutoGen.py
 @@ -1484,6 +1484,9 @@ class ModuleAutoGen(AutoGen):
              for File in Files:=0D
                  if File.lower().endswith('.pdb'):=0D
@@ -109,57 +175,6 @@ Index: git/BaseTools/Source/Python/AutoGen/ModuleAutoG=
en.py
  =0D
          # Ignore generating makefile when it is a binary module=0D
          if self.IsBinaryModule:=0D
-Index: git/BaseTools/Source/Python/AutoGen/BuildEngine.py
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- git.orig/BaseTools/Source/Python/AutoGen/BuildEngine.py
-+++ git/BaseTools/Source/Python/AutoGen/BuildEngine.py
-@@ -70,6 +70,9 @@ class TargetDescBlock(object):
-         else:=0D
-             return str(Other) =3D=3D self.Target.Path=0D
- =0D
-+    def __lt__(self, other):=0D
-+        return str(self) < str(other)=0D
-+=0D
-     def AddInput(self, Input):=0D
-         if Input not in self.Inputs:=0D
-             self.Inputs.append(Input)=0D
-Index: git/BaseTools/Source/C/GenFw/Elf64Convert.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- git.orig/BaseTools/Source/C/GenFw/Elf64Convert.c
-+++ git/BaseTools/Source/C/GenFw/Elf64Convert.c
-@@ -14,6 +14,8 @@ SPDX-License-Identifier: BSD-2-Clause-Pa
- #ifndef __GNUC__=0D
- #include <windows.h>=0D
- #include <io.h>=0D
-+#else=0D
-+#define _GNU_SOURCE=0D
- #endif=0D
- #include <assert.h>=0D
- #include <stdio.h>=0D
-@@ -770,7 +772,7 @@ ScanSections64 (
-   }=0D
-   mCoffOffset =3D mDebugOffset + sizeof(EFI_IMAGE_DEBUG_DIRECTORY_ENTRY) =
+=0D
-                 sizeof(EFI_IMAGE_DEBUG_CODEVIEW_NB10_ENTRY) +=0D
--                strlen(mInImageName) + 1;=0D
-+                strlen(basename(mInImageName)) + 1;=0D
- =0D
-   mCoffOffset =3D CoffAlign(mCoffOffset);=0D
-   if (SectionCount =3D=3D 0) {=0D
-@@ -1609,7 +1611,7 @@ WriteDebug64 (
-   EFI_IMAGE_DEBUG_DIRECTORY_ENTRY     *Dir;=0D
-   EFI_IMAGE_DEBUG_CODEVIEW_NB10_ENTRY *Nb10;=0D
- =0D
--  Len =3D strlen(mInImageName) + 1;=0D
-+  Len =3D strlen(basename(mInImageName)) + 1;=0D
- =0D
-   Dir =3D (EFI_IMAGE_DEBUG_DIRECTORY_ENTRY*)(mCoffFile + mDebugOffset);=0D
-   Dir->Type =3D EFI_IMAGE_DEBUG_TYPE_CODEVIEW;=0D
-@@ -1619,7 +1621,7 @@ WriteDebug64 (
- =0D
-   Nb10 =3D (EFI_IMAGE_DEBUG_CODEVIEW_NB10_ENTRY*)(Dir + 1);=0D
-   Nb10->Signature =3D CODEVIEW_SIGNATURE_NB10;=0D
--  strcpy ((char *)(Nb10 + 1), mInImageName);=0D
-+  strcpy ((char *)(Nb10 + 1), basename(mInImageName));=0D
- =0D
- =0D
-   NtHdr =3D (EFI_IMAGE_OPTIONAL_HEADER_UNION *)(mCoffFile + mNtHdrOffset)=
;=0D
+--=20
+2.32.0
+
diff --git a/meta/recipes-core/ovmf/ovmf/zero.patch b/meta/recipes-core/ovm=
f/ovmf/zero.patch
deleted file mode 100644
index af7a9d31f6..0000000000
--- a/meta/recipes-core/ovmf/ovmf/zero.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-Pass --zero to GenFw in release builds so that the sections that link back=
 to
-the intermediate binaries (containing build paths) are removed.
-
-Upstream-Status: Pending (discussion at https://bugzilla.tianocore.org/sho=
w_bug.cgi?id=3D3256)
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 6303b065802c9427c718fda129360189b79316e7 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Tue, 16 Mar 2021 16:49:49 +0000
-Subject: [PATCH] Strip build paths
-
----
- OvmfPkg/AmdSev/AmdSevX64.dsc | 1 +
- OvmfPkg/Bhyve/BhyveX64.dsc   | 1 +
- OvmfPkg/OvmfPkgIa32.dsc      | 2 ++
- OvmfPkg/OvmfPkgIa32X64.dsc   | 1 +
- OvmfPkg/OvmfPkgX64.dsc       | 1 +
- OvmfPkg/OvmfXen.dsc          | 1 +
- 6 files changed, 7 insertions(+)
-
-diff --git a/OvmfPkg/Bhyve/BhyveX64.dsc b/OvmfPkg/Bhyve/BhyveX64.dsc
-index 4a1cdf5aca..132f55cf69 100644
---- a/OvmfPkg/Bhyve/BhyveX64.dsc
-+++ b/OvmfPkg/Bhyve/BhyveX64.dsc
-@@ -76,6 +76,7 @@=0D
-   GCC:*_*_X64_GENFW_FLAGS   =3D --keepexceptiontable=0D
-   INTEL:*_*_X64_GENFW_FLAGS =3D --keepexceptiontable=0D
- !endif=0D
-+  RELEASE_*_*_GENFW_FLAGS =3D --zero=0D
- =0D
-   #=0D
-   # Disable deprecated APIs.=0D
-diff --git a/OvmfPkg/OvmfPkgIa32.dsc b/OvmfPkg/OvmfPkgIa32.dsc
-index 1eaf3e99c6..ce20f09df8 100644
---- a/OvmfPkg/OvmfPkgIa32.dsc
-+++ b/OvmfPkg/OvmfPkgIa32.dsc
-@@ -90,6 +90,8 @@=0D
- =0D
- !include NetworkPkg/NetworkBuildOptions.dsc.inc=0D
- =0D
-+  RELEASE_*_*_GENFW_FLAGS =3D --zero=0D
-+=0D
- [BuildOptions.common.EDKII.DXE_RUNTIME_DRIVER]=0D
-   GCC:*_*_*_DLINK_FLAGS =3D -z common-page-size=3D0x1000=0D
-   XCODE:*_*_*_DLINK_FLAGS =3D -seg1addr 0x1000 -segalign 0x1000=0D
-diff --git a/OvmfPkg/OvmfPkgIa32X64.dsc b/OvmfPkg/OvmfPkgIa32X64.dsc
-index 4a5a430147..97cc438250 100644
---- a/OvmfPkg/OvmfPkgIa32X64.dsc
-+++ b/OvmfPkg/OvmfPkgIa32X64.dsc
-@@ -84,6 +84,7 @@=0D
-   GCC:*_*_X64_GENFW_FLAGS   =3D --keepexceptiontable=0D
-   INTEL:*_*_X64_GENFW_FLAGS =3D --keepexceptiontable=0D
- !endif=0D
-+  RELEASE_*_*_GENFW_FLAGS =3D --zero=0D
- =0D
-   #=0D
-   # Disable deprecated APIs.=0D
-diff --git a/OvmfPkg/OvmfPkgX64.dsc b/OvmfPkg/OvmfPkgX64.dsc
-index d4d601b444..f544fb04bf 100644
---- a/OvmfPkg/OvmfPkgX64.dsc
-+++ b/OvmfPkg/OvmfPkgX64.dsc
-@@ -84,6 +84,7 @@=0D
-   GCC:*_*_X64_GENFW_FLAGS   =3D --keepexceptiontable=0D
-   INTEL:*_*_X64_GENFW_FLAGS =3D --keepexceptiontable=0D
- !endif=0D
-+  RELEASE_*_*_GENFW_FLAGS =3D --zero=0D
- =0D
-   #=0D
-   # Disable deprecated APIs.=0D
-diff --git a/OvmfPkg/OvmfXen.dsc b/OvmfPkg/OvmfXen.dsc
-index 507029404f..fcaa35acf1 100644
---- a/OvmfPkg/OvmfXen.dsc
-+++ b/OvmfPkg/OvmfXen.dsc
-@@ -74,6 +74,7 @@=0D
-   GCC:*_*_X64_GENFW_FLAGS   =3D --keepexceptiontable=0D
-   INTEL:*_*_X64_GENFW_FLAGS =3D --keepexceptiontable=0D
- !endif=0D
-+  RELEASE_*_*_GENFW_FLAGS =3D --zero=0D
- =0D
-   #=0D
-   # Disable deprecated APIs.=0D
---=20
-2.25.1
-
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index 888ea082ec..90dae2aed0 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -15,15 +15,15 @@ PACKAGECONFIG[secureboot] =3D ",,,"
 SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=3Dmaster;protoco=
l=3Dhttps \
            file://0001-ovmf-update-path-to-native-BaseTools.patch \
            file://0002-BaseTools-makefile-adjust-to-build-in-under-bitbake=
.patch \
-           file://0004-ovmf-Update-to-latest.patch \
-           file://zero.patch \
-           file://debug_prefix_map.patch \
-           file://reproducible.patch \
+           file://0003-ovmf-Update-to-latest.patch \
+           file://0004-Strip-build-paths.patch \
+           file://0005-debug-prefix-map.patch \
+           file://0006-reproducible.patch \
            file://0001-Fix-VLA-parameter-warning.patch \
            "
=20
-PV =3D "edk2-stable202102"
-SRCREV =3D "ef91b07388e1c0a50c604e5350eeda98428ccea6"
+PV =3D "edk2-stable202105"
+SRCREV =3D "e1999b264f1f9d7230edf2448f757c73da567832"
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>edk2-stable.*)"
=20
 inherit deploy
--=20
2.31.1

