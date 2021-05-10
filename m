Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web08.32550.1620657098243042403
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 07:31:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=HEnTxYJx;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.44, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f44.google.com with SMTP id n32-20020a9d1ea30000b02902a53d6ad4bdso14577508otn.3
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 07:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qTbW/4ZYaqmJKUjCDcr7/A7/2fpCT143aVEEVJddx4U=;
        b=HEnTxYJxpb+7abFQFWo08GHmZIH0eCgo3NXDKyu0p/KnWx0eHwYZaSEZMzBCo7shMy
         Nftn6nMK2R8Tx82+x2K57w89Fth7r2HDKdt936kY9KrgDAyVUCD8b2efyFgEisTg0W1c
         AlPXVvmB1Xj66bUMvmBu3AHCFeyPwptLNtHkfET+RiaLAM0RDFhG2t5OMnpUrI3CLTh/
         mvB2aaaFS4IPoRjCe6mtXDOU09r/RkMASjIMOFJ6W3THkWVdZKy4cdLBNsNlTXDdfnBA
         NhzuleFjQm2d/ATD3XCsEYZd6bdmYyfaQ+o2vgiCQrAgnS+OJnb/d2yE+OqQccX0UTaU
         tWPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qTbW/4ZYaqmJKUjCDcr7/A7/2fpCT143aVEEVJddx4U=;
        b=MrN+jsVdxRMy8JpSW4r7JIuVu5MBMitf5CAnbevE4TKacA37J79K/wlvTnZ/M0NUz5
         +n0w+NIloy7S01mQ2xIj8g32n8DiHMTnMj+E9Wlgb7VQqorHybCrE26rtkosf6rlAxyi
         il43gL8UYYNinSBtTxoIeyN68sxoaECLkPKLCiizl/D9DOOCwRuj4pif2MqqhZYhMCLT
         LTeVk50m2ZxkaWuhpXSqZ467IEsxd8OHZnFvOY86kuf4YFTZtt0sNeviaObtYXQWxcU0
         x//Iixn2V2vhpkIGZM1/tKc4ZInPX7azPUK82InewRk6fUNMwKBjWcL7Mh+AsK509XFT
         Dtmg==
X-Gm-Message-State: AOAM533F8EkDolUNPNsW3YsU/zCUtCWEt83INDlAUVZcHft7cHXV/sOe
	m+O8mt027j38wic0HJ7QD181zGRT45bYxkqV/Zk=
X-Google-Smtp-Source: ABdhPJzxWGndXgEmwKHWh26/8BMOBeQ1XmRn4a84+Deu0kU5pYZ597UC1OU9e/QkHsSPGIW7IeJ6AA==
X-Received: by 2002:a9d:7003:: with SMTP id k3mr22181975otj.351.1620657097118;
        Mon, 10 May 2021 07:31:37 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id g16sm2661309oof.43.2021.05.10.07.31.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 07:31:36 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 22/25] ovmf: update to 202002
Date: Mon, 10 May 2021 04:29:04 -1000
Message-Id: <26f76576989e55b7269e81f682bd1ef7a61d547c.1620656333.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620656333.git.steve@sakoman.com>
References: <cover.1620656333.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c4301758f5a1560965ca5fb69eb1492adf351ed0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1

