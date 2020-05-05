Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web11.7071.1588683742696353714
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 06:02:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Wa4XOihh;
 spf=pass (domain: gmail.com, ip: 209.85.221.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f65.google.com with SMTP id e16so2644587wra.7
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2020 06:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ezIuM3bDNeQNdNVD1O62Fn2+6Z2PP1keRIDkAhnKkg4=;
        b=Wa4XOihhm7Cdep1uQUhnciwVkqx/hoILGC10UM3JMBdyxOvnHIFbpYT2+qyutoTxp2
         fzS1Spknah//xI4cGI1tInxn8uF6vAe4BW3HsNorHEQtrlyKEhV7rlF6lq1GWAsMwLtj
         xB2PvFxf0aWCefWdQaU1U5swzrIOvlZo4oAcfzaHS0BCD2CI3DfDkm/k3AbdUOAgV8Dt
         GXWVg7xDKHhKt/dvsIL3OjzGFJTACxZ82WnYHFYLiV+Jb5k468BLl5ohV6eTxgWNWzJo
         OTxXqpAIiYVYj5RTJ4vN3uHGM3XNKOCpqj3D/+x1jn9lgyRNxYBrLYxzVLySexEHvf9x
         LOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ezIuM3bDNeQNdNVD1O62Fn2+6Z2PP1keRIDkAhnKkg4=;
        b=qYivvkYkBUc6Er44wD+KHWfi5UbCQnZ7j6qSVWwU++YSvUs3mSw2iqVhEh3uc8eCL5
         cJnilbnTdYpds622MTS78rBpAKKgSvych7kPrKQg/2rn5Z0IalI5eo3goFFdhLcu0F+g
         MNlA7ePh0zP7vMWTl54JzddYoXNbnBv9E5rA45aT5rooI/sK6NSzZXcu+bCZBJh8jcZG
         um7tI87o5EczFBef+vnxxahn/kdDfMDno0WZSoTP9hamRDJ3RWHBlwl2PX+D6H1oozsK
         umE0SKp3RJnuI+hlkQhQ+ELw5666tDQB3Sbp3XYL+X0pd76T9YE75LYRFU8uBZZGWD5V
         PYrw==
X-Gm-Message-State: AGi0PuYQO//J0SmQ9Jgx9UI0exYSPc5jJVp/14ENXXIqnNDk4vKZIfuA
	RHUAeDGeKjlZYR2S+PT0ZtRwDhfL
X-Google-Smtp-Source: APiQypLJXFWG+8+W+tA85pSKdAIocfg/Bm8Ko5dWJlkynWXMJVHDlsgFsMgRWPSrAWput827SNla2w==
X-Received: by 2002:adf:e9d2:: with SMTP id l18mr3614670wrn.34.1588683740994;
        Tue, 05 May 2020 06:02:20 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id h16sm3388113wrw.36.2020.05.05.06.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 06:02:20 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 21/24] ovmf: update to 202002
Date: Tue,  5 May 2020 15:01:30 +0200
Message-Id: <20200505130133.24930-21-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200505130133.24930-1-alex.kanavin@gmail.com>
References: <20200505130133.24930-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...st.patch =3D> 0001-ovmf-Update-to-latest.patch} | 16 ++++++++--------
 meta/recipes-core/ovmf/ovmf_git.bb               |  8 ++++----
 2 files changed, 12 insertions(+), 12 deletions(-)
 rename meta/recipes-core/ovmf/ovmf/{0004-ovmf-Update-to-latest.patch =3D> =
0001-ovmf-Update-to-latest.patch} (85%)

diff --git a/meta/recipes-core/ovmf/ovmf/0004-ovmf-Update-to-latest.patch b=
/meta/recipes-core/ovmf/ovmf/0001-ovmf-Update-to-latest.patch
similarity index 85%
rename from meta/recipes-core/ovmf/ovmf/0004-ovmf-Update-to-latest.patch
rename to meta/recipes-core/ovmf/ovmf/0001-ovmf-Update-to-latest.patch
index c10a39d95d..1d4273cdc1 100644
--- a/meta/recipes-core/ovmf/ovmf/0004-ovmf-Update-to-latest.patch
+++ b/meta/recipes-core/ovmf/ovmf/0001-ovmf-Update-to-latest.patch
@@ -1,7 +1,7 @@
-From 94eff316b31b4d0348af28c77be5c00bc09fe8e7 Mon Sep 17 00:00:00 2001
+From 640a634936ba8eca4778470fb14c6eb9cfd19953 Mon Sep 17 00:00:00 2001
 From: Steve Langasek <steve.langasek@ubuntu.com>
 Date: Sat, 10 Jun 2017 01:39:36 -0700
-Subject: [PATCH 4/5] ovmf: Update to latest
+Subject: [PATCH 1/2] ovmf: Update to latest
=20
 Description: pass -fno-stack-protector to all GCC toolchains
  The upstream build rules inexplicably pass -fno-stack-protector only
@@ -15,12 +15,12 @@ Upstream-Status: Pending
  1 file changed, 4 insertions(+), 4 deletions(-)
=20
 diff --git a/BaseTools/Conf/tools_def.template b/BaseTools/Conf/tools_def.=
template
-index ca0b122dbb..b0066c2ab8 100755
+index 2b17d3b297..4cd2567c2a 100755
 --- a/BaseTools/Conf/tools_def.template
 +++ b/BaseTools/Conf/tools_def.template
-@@ -1941,10 +1941,10 @@ DEFINE GCC_X64_RC_FLAGS            =3D -I binary -=
O elf64-x86-64        -B i386
- DEFINE GCC_ARM_RC_FLAGS            =3D -I binary -O elf32-littlearm     -=
B arm     --rename-section .data=3D.hii=0D
- DEFINE GCC_AARCH64_RC_FLAGS        =3D -I binary -O elf64-littleaarch64 -=
B aarch64 --rename-section .data=3D.hii=0D
+@@ -1950,10 +1950,10 @@ DEFINE GCC_AARCH64_RC_FLAGS        =3D -I binary -=
O elf64-littleaarch64 -B aarch64
+ # GCC Build Flag for included header file list generation=0D
+ DEFINE GCC_DEPS_FLAGS              =3D -MMD -MF $@.deps=0D
  =0D
 -DEFINE GCC48_ALL_CC_FLAGS            =3D -g -fshort-wchar -fno-builtin -f=
no-strict-aliasing -Wall -Werror -Wno-array-bounds -ffunction-sections -fda=
ta-sections -include AutoGen.h -fno-common -DSTRING_ARRAY_NAME=3D$(BASE_NAM=
E)Strings=0D
 +DEFINE GCC48_ALL_CC_FLAGS            =3D -g -fshort-wchar -fno-builtin -f=
no-strict-aliasing -Wall -Werror -Wno-array-bounds -ffunction-sections -fda=
ta-sections -fno-stack-protector -include AutoGen.h -fno-common -DSTRING_AR=
RAY_NAME=3D$(BASE_NAME)Strings=0D
@@ -32,7 +32,7 @@ index ca0b122dbb..b0066c2ab8 100755
  DEFINE GCC48_IA32_X64_ASLDLINK_FLAGS =3D DEF(GCC48_IA32_X64_DLINK_COMMON)=
 -Wl,--entry,ReferenceAcpiTable -u ReferenceAcpiTable=0D
  DEFINE GCC48_IA32_X64_DLINK_FLAGS    =3D DEF(GCC48_IA32_X64_DLINK_COMMON)=
 -Wl,--entry,$(IMAGE_ENTRY_POINT) -u $(IMAGE_ENTRY_POINT) -Wl,-Map,$(DEST_D=
IR_DEBUG)/$(BASE_NAME).map,--whole-archive=0D
  DEFINE GCC48_IA32_DLINK2_FLAGS       =3D -Wl,--defsym=3DPECOFF_HEADER_SIZ=
E=3D0x220 DEF(GCC_DLINK2_FLAGS_COMMON)=0D
-@@ -1953,7 +1953,7 @@ DEFINE GCC48_X64_DLINK2_FLAGS        =3D -Wl,--defsy=
m=3DPECOFF_HEADER_SIZE=3D0x228 DEF
+@@ -1962,7 +1962,7 @@ DEFINE GCC48_X64_DLINK2_FLAGS        =3D -Wl,--defsy=
m=3DPECOFF_HEADER_SIZE=3D0x228 DEF
  DEFINE GCC48_ASM_FLAGS               =3D DEF(GCC_ASM_FLAGS)=0D
  DEFINE GCC48_ARM_ASM_FLAGS           =3D $(ARCHASM_FLAGS) $(PLATFORM_FLAG=
S) DEF(GCC_ASM_FLAGS) -mlittle-endian=0D
  DEFINE GCC48_AARCH64_ASM_FLAGS       =3D $(ARCHASM_FLAGS) $(PLATFORM_FLAG=
S) DEF(GCC_ASM_FLAGS) -mlittle-endian=0D
@@ -42,5 +42,5 @@ index ca0b122dbb..b0066c2ab8 100755
  DEFINE GCC48_AARCH64_CC_FLAGS        =3D $(ARCHCC_FLAGS) $(PLATFORM_FLAGS=
) -mcmodel=3Dlarge DEF(GCC_AARCH64_CC_FLAGS)=0D
  DEFINE GCC48_AARCH64_CC_XIPFLAGS     =3D DEF(GCC_AARCH64_CC_XIPFLAGS)=0D
 --=20
-2.17.1
+2.24.0
=20
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index 9667fa0c86..c089627822 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -12,15 +12,15 @@ LIC_FILES_CHKSUM =3D "file://OvmfPkg/License.txt;md5=3D=
06357ddc23f46577c2aeaeaf7b776
 PACKAGECONFIG ??=3D ""
 PACKAGECONFIG[secureboot] =3D ",,,"
=20
-SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=3Dmaster;protoco=
l=3Dgit \
+SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=3Dmaster;protoco=
l=3Dhttps \
            file://0001-ovmf-update-path-to-native-BaseTools.patch \
            file://0002-BaseTools-makefile-adjust-to-build-in-under-bitbake=
.patch \
            file://0003-ovmf-enable-long-path-file.patch \
-           file://0004-ovmf-Update-to-latest.patch \
+           file://0001-ovmf-Update-to-latest.patch \
         "
=20
-PV =3D "edk2-stable201911"
-SRCREV =3D "bd85bf54c268204c7a698a96f3ccd96cd77952cd"
+PV =3D "edk2-stable202002"
+SRCREV =3D "4c0f6e349d32cf27a7104ddd3e729d6ebc88ea70"
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>edk2-stable.*)"
=20
 inherit deploy
--=20
2.26.1

